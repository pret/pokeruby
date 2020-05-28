@ PK-JOYブート用 ダウンローダ (カートリッジROMに格納)
@

    .INCLUDE    "AgbDefine.s"
    .INCLUDE    "AgbMemoryMap.s"
    .INCLUDE    "AgbSyscallDefine.s"
    .INCLUDE    "AgbMacro.s"

@ このファイルで、ゲームに応じて必ず確認(と変更)していただく場所
@ 1. "PKJB_GBA_INITIAL_CODE_p:" の定義
@ 2. "PKJB_PROGRAM_SIZE =" の定義
@ 3. "text_section_addr_p:" の定義
@ 上記の定義(1. 2.)は、GC側 pkjb_uploader.h でも行われています。
@ 同様に変更してください。

@ GBAイニシャルコードについて、シリーズ物で通信プロトコルの
@ 互換性を持たせる場合は、どれか一つのイニシャルコードを共通で
@ 使ってください。
@ 例: ポケモン赤、青どちらも同じPK-JOYブートイメージを使用可能なら
@     「ポケモン赤」のイニシャルコードをポケモン青でも使います。


@ ダウンロードバッファサイズ (8の倍数)
@ ゲームに応じたダウンロードバッファのサイズ(最大値)に変更してください。
@ 最大値は 0x3fff0 (Bytes) です。

PKJB_PROGRAM_SIZE = 0x20000


@ PKJBDownParam の構造体オフセット定義
	.struct	0
timeout_counter: .struct . + 1; 
@ 一定時間通信割り込みが発生しない場合タイムアウト処理を行うためのカウンタ
frame_counter: .struct . + 1; @ 乱数生成用
decode_mode: .struct . + 1; @ 復号化モード 0=ダウンロードしていない 1=復号化中 2=復号化完了
vcount_bak: .struct . + 1; @ 暗号化鍵生成用
keya: .struct . + 4; @ KeyA, byte access たぶんあり
keyb: .struct . + 4; @ KeyB, byte access あり
keyc: .struct . + 4; @ KeyC, byte access たぶんあり
boot_key: .struct . + 2; @ GCからの「PK-JOYブート要求」(復号化前)
dl_count: .struct . + 2; @ ダウンロード残りワードカウント

	.struct . + 0; @ dummy_aligner
decode_key: .struct . + 4; @ ダウンロードデータの復号化鍵
decode_work_crc: .struct . + 4; @ 復号化途中の CRC
decode_result_crc: .struct . + 4; @ 復号化完了後GCへ返すCRC
@ 以下のメンバーは、初期化時にゼロクリア対象外。
decode_bufp: .struct . + 4; @ 復号化用バッファポインタ
dl_bufp: .struct . + 4; @ ダウンロードバッファポインタ
joyint_vector: .struct . + 4; @ JoyIntr で使うジャンプベクタ - ゼロクリアしないように、最後のメンバにする。
SIZEOF_PKJB_DOWN_PARAM:

@ レジスタアクセス用オフセット
MY_OFFSET_REG_JOYCNT	=	REG_JOYCNT    - REG_SIOMULTI0
MY_OFFSET_REG_RCNT	=	REG_RCNT      - REG_SIOMULTI0
MY_OFFSET_REG_JOYSTAT	=	REG_JOYSTAT   - REG_SIOMULTI0
MY_OFFSET_REG_JOY_TRANS	=	REG_JOY_TRANS - REG_SIOMULTI0
MY_OFFSET_REG_JOY_RECV	=	REG_JOY_RECV  - REG_SIOMULTI0

MY_OFFSET_REG_IE	=	0
MY_OFFSET_REG_IME	=	REG_IME       - REG_IE
MY_OFFSET_REG_IF	=	REG_IF        - REG_IE

PKJB_FROMGC_REQUEST_DL   = 0xdd @ d31-d24, ダウンロード開始要求
PKJB_FROMGC_REQUEST_BOOT = 0xbb @ d31-d24, PK-JOYブート要求
PKJB_FROMGBA_DL_READY    = 0xee @ d7-d0,   ダウンロード開始許可応答
PKJB_FROMGBA_CALC_CRC    = 0xcc @ d7-d0,   チェックサム計算中応答
PKJB_FROMGBA_CRC_READY   = 0xff @ d7-d0,   チェックサム計算完了応答

PKJB_JOYINT_TIMEOUT      = 10   @ タイムアウトカウンタ値
PKJB_GBA_ROM_HEADER_SIZE = 0xa0 @ Nintendoヘッダサイズ(非暗号化)

PKJB_CRC_POLY            = 0xa1c1     @ 原始多項式
PKJB_RNG_MUL             = 0x6177614b @ 乱数生成用
PKJB_RNG_ADD             = 1          @ 乱数生成用


	.text
	.align

@ 引数の順序にも注意。
@ static u32 PKJBDownCalcCrc(r0=keep, r1=u32 src, r2=broken, r3=u32 crc);
	.code	16
	.thumb_func
PKJBDownCalcCrc:
@ r4: CRC poly
	push	{r4, lr};
	ldr	r4, crc_poly_p;
	eor	r3, r1;
	mov	r2, #32;
1:
	lsr	r3, #1; @ crc >>= 1 は条件にかかわらず共通
	bcc	2f;
	eor	r3, r4;
2:
	sub	r2, #1;
	bne	1b;
	pop	{r4, pc};


@ extern void PKJBDownMainFrame(PKJBDownParam *paramp);

	.global	PKJBDownMainFrame
	.code	16
	.thumb_func
PKJBDownMainFrame:
@ joyint_vector が 0 になっていたら初期化要求。
	ldr	r1, [r0, #joyint_vector];
	cmp	r1, #0;
	beq	main_frame_bcs_init; @ Branch out of range. beq なら bcs も成り立つ

@ 乱数生成用フレームカウンタ更新
	ldrb	r1, [r0, #frame_counter];
	add	r1, #1;
	strb	r1, [r0, #frame_counter];

@ 復号化が完了していなければ、タイムアウトカウンタ更新。
@ 割り込みルーチンでも書き換えるので、REG_IME = 0 にする。
	ldrb	r1, [r0, #decode_mode];
	cmp	r1, #2; @ 復号化完了？
	beq	main_frame_bx_lr;

	ldr	r3, my_reg_200p;
	ldrh	r2, [r3, #MY_OFFSET_REG_IME];
@ r2 = imebak
	mov	r1, #0;
@ REG_IME = 0
	strh	r1, [r3, #MY_OFFSET_REG_IME];
	ldrb	r1, [r0, #timeout_counter];
	cmp	r1, #PKJB_JOYINT_TIMEOUT;
	bgt	1f; @ すでにタイムアウトになっている
	add	r1, #1;
	strb	r1, [r0, #timeout_counter];
1:
@ REG_IME = imebak
	strh	r2, [r3, #MY_OFFSET_REG_IME];

	.thumb_func
main_frame_bcs_init:
	bcs	PKJBDownInit; @ タイムアウトエラーなので初期化を行う

@ ダウンロード中か？
	ldrb	r1, [r0, #decode_mode];
	cmp	r1, #0; @ ダウンロードしていない？
	bne	10f;    @ あとは r1 == 1 しかない。
@ ダウンロードしていないと思われるタイミングで、dl_bufp と decode_bufp を比較。
@ 異なれば、ダウンロードが始まっている。
	ldr	r1, [r0, #dl_bufp];
	ldr	r2, [r0, #decode_bufp];
	sub	r1, r2;
	beq	99f; @ 本当に始まっていなかった。
@ 始まっている。
@ しかし、Nintendoヘッダをダウンロードし終わるまでは反応しない。
	cmp	r1, #PKJB_GBA_ROM_HEADER_SIZE;
	bcc	99f;
@ NintendoヘッダをROMカートリッジ内蔵のものと照合。
	push	{r4, r5, r6};
	mov	r1, #PKJB_GBA_ROM_HEADER_SIZE - 8; @ 先頭 4 Bytes は無視。
	add	r2, #4;                            @ 先頭 4 Bytes は無視。
	ldr	r4, rom_header_p;                  @ 先頭 4 Bytes は無視。
1:
	ldmia	r2!, {r5};
	ldmia	r4!, {r6};
	cmp	r5, r6;
	bne	2f;
	sub	r1, #4;
	bne	1b;
@ 最後のワードの d7-d0 は無視。
	ldmia	r2!, {r5};
	ldmia	r4!, {r6};
	eor	r5, r6;
	lsr	r5, #8;
	str	r2, [r0, #decode_bufp];
2:
@ bne なら不一致。通信初期化。
	pop	{r4, r5, r6};
	bne	PKJBDownInit;
@ 一致。復号化鍵を確定する。
	mov	r1, #1;
	strb	r1, [r0, #decode_mode];
	ldr	r1, [r0, #keya];
	ldr	r2, [r0, #keyb];
	eor	r1, r2;
	str	r1, [r0, #decode_work_crc];
	ldr	r2, rng_mul_p;
	mul	r1, r2;
	add	r1, #PKJB_RNG_ADD;
	str	r1, [r0, #decode_key];

	.thumb_func
main_frame_bx_lr:
	bx	lr;

10:
@ decode_bufp < dl_bufp である領域は復号化可能。
@ ip: decode end ptr
@ r1: decode data
@ r2: i
@ r3: CRC
@ r4: decode current ptr
@ r5: RNG mul constant
@ r6: decode key
@ r7: CRC poly

	ldr	r1, [r0, #dl_bufp];
	mov	ip, r1;
	ldr	r3, [r0, #decode_work_crc];

	push	{r4, r5, r6, r7};
	ldr	r4, [r0, #decode_bufp];
	ldr	r5, rng_mul_p;
	ldr	r6, [r0, #decode_key];
	ldr	r7, crc_poly_p;

	.thumb_func
decode_loop:
	cmp	r4, ip;
	bcs	decode_done;

	ldr	r1, [r4];
	eor	r1, r6;
	add	r1, r3;
	stmia	r4!, {r1};

@ update crc
@ {
@  u32 i;
@  crc ^= src;
@  for (i = 32; i > 0; i--) {
@    if (crc & 1) {
@      crc >>= 1;
@      crc ^= CRC_POLY;
@    } else {
@      crc >>= 1;
@    }
@  }
@  return crc;
@ }

	eor	r3, r1;
	mov	r2, #32;
1:
	lsr	r3, #1; @ crc >>= 1 は条件にかかわらず共通
	bcc	2f;
	eor	r3, r7;
2:
	sub	r2, #1;
	bne	1b;

@ update decode key
	mul	r6, r5;
	add	r6, #PKJB_RNG_ADD;
	b	decode_loop;

	.thumb_func
decode_done:
	str	r4, [r0, #decode_bufp];
	str	r6, [r0, #decode_key];
	pop	{r4, r5, r6, r7};
	str	r3, [r0, #decode_work_crc];

	ldrh	r1, [r0, #dl_count];
	cmp	r1, #0;
	bne	99f;
@ 全部ダウンロード完了。
@ しかし、復号化は終わったとは限らないので、
@ dl_bufp == decode_bufp であることを確認する。
	ldr	r1, [r0, #dl_bufp];
	ldr	r2, [r0, #decode_bufp];
	cmp	r1, r2;
	bne	99f;

@ 「チェックサム計算完了応答」は準備済み or 応答済みか？
	ldr	r1, [r0, #keyc];
	cmp	r1, #0;
	beq	11f; @ 準備ができていない。

@ 「PK-JOYブート要求」は受信しているか？
	ldrh	r1, [r0, #boot_key];
	cmp	r1, #0;
	beq	main_frame_bx_lr; @ 受信していない。

@ 「PK-JOYブート要求」の正当性を検証。
	mov	ip, lr;
	mov	r1, #PKJB_FROMGC_REQUEST_BOOT;
	ldr	r3, [r0, #keyc];
	bl	PKJBDownCalcCrc;
	ldrh	r1, [r0, #boot_key];
	mov	lr, ip; @ PKJBDownInit へ飛ぶかもしれないので。
	sub	r1, r3;
	bne	PKJBDownInit; @ 不正な値。復号化失敗

@ 復号化成功。ブート可能状態。decode_mode を 2 にする。
	mov	r1, #2;
	strb	r1, [r0, #decode_mode];
	bx	lr;

11:
	mov	ip, lr;
@ 「チェックサム計算完了応答」を準備する。
@ KeyC は (d31-d24 を vcount_bak) にしたものから -1 する。
	ldrb	r1, [r0, #vcount_bak];
	lsl	r1, #24;
	sub	r1, #1;
	str	r1, [r0, #keyc];
@ r3 が decode_work_crc で d15-d0 の範囲にある。
	bl	PKJBDownCalcCrc;

	lsl	r3, #8;
	add	r3, #PKJB_FROMGBA_CRC_READY;
	str	r3, [r0, #decode_result_crc];
	bx	ip;


99:
	bx	lr;


	.align
crc_poly_p:
	.word	PKJB_CRC_POLY
rng_mul_p:
	.word	PKJB_RNG_MUL
rom_header_p:
	.word	ROM_BANK0 + 4


@ extern void PKJBDownTryBoot(PKJBDownParam *paramp);

	.global	PKJBDownTryBoot
	.code	16
	.thumb_func
PKJBDownTryBoot:
@ 復号化完了であればPK-JOYブートする。
	ldrb	r1, [r0, #decode_mode];
	cmp	r1, #2;
	bne	1f;     @ 復号化が完了していない。

@ REG_IME だけ 0 にする。
	ldr	r3, my_reg_200p;
	mov	r1, #0;
	strh	r1, [r3, #MY_OFFSET_REG_IME];

	ldr	r1, text_section_addr_p;
	add	r1, #0xc0;
	bx	r1;
1:
	bx	lr;

@ extern void PKJBDownInit(PKJBDownParam *paramp);

	.global	PKJBDownInit
	.code	16
	.thumb_func
PKJBDownInit:
@ JOYバス通信割り込み許可。
@ ただし REG_IME の設定は変更しない。
	ldr	r3, my_reg_200p;
	ldrh	r2, [r3, #MY_OFFSET_REG_IME];
@ r2 = imebak
	mov	r1, #0;
@ REG_IME = 0
	strh	r1, [r3, #MY_OFFSET_REG_IME];

@ 必要ならワークをクリア
@ 以後、r0は破壊。
	adr	r3, joyint_err;
	str	r3, [r0, #joyint_vector];
	ldrb	r3, [r0, #vcount_bak];
	push	{r3};
	ldrb	r3, [r0, #frame_counter];
	push	{r0, r3};

	mov	r3, r0;
	add	r3, #SIZEOF_PKJB_DOWN_PARAM - 12; @ ゼロクリア対象外のメンバを除く。
1:
	stmia	r0!, {r1};
	cmp	r0, r3;
	bcc	1b;
	pop	{r0, r3};
@ vcount_bak は 0-227 (0xe3) であることを前提にしているので d7 は 0 にする。
	lsr	r3, #1;
	strb	r3, [r0, #vcount_bak]; @ あえて push/pop の順を逆にしてみる
	pop	{r3};
	strb	r3, [r0, #frame_counter];

@ REG_RCNT = R_DIRECT_MODE
@ R_DIRECT_MODE は 0x8000 である。
@ REG_SIOMULTI0 は 0x04000120 なので << (15-5) すれば下位が 0x8000 になる。
	ldr	r3, my_reg_120p;
	lsl	r0, r3, #15 - 5;
	strh	r0, [r3, #MY_OFFSET_REG_RCNT];

@ REG_RCNT = R_JOY_MODE
@ R_JOY_MODE = 0xc000
	mov	r0, #R_JOY_MODE >> 8;
	lsl	r0, #8;
	strh	r0, [r3, #MY_OFFSET_REG_RCNT];

@ REG_JOYCNT = JOY_IF_ENABLE | JOY_IF_SEND | JOY_IF_RECV | JOY_IF_RESET
	mov	r0, #JOY_IF_ENABLE | JOY_IF_SEND | JOY_IF_RECV | JOY_IF_RESET;
	strh	r0, [r3, #MY_OFFSET_REG_JOYCNT];

@ REG_JOYSTAT = 0
	strh	r1, [r3, #MY_OFFSET_REG_JOYSTAT];

@ 残っている IF の SIO_INTR_FLAG はクリア。
@ REG_IF = SIO_INTR_FLAG
	ldr	r3, my_reg_200p;
	mov	r0, #SIO_INTR_FLAG;
	strh	r0, [r3, #MY_OFFSET_REG_IF];
	ldrh	r1, [r3, #MY_OFFSET_REG_IE];
	orr	r1, r0;
	strh	r1, [r3, #MY_OFFSET_REG_IE];

@ REG_IME = imebak
	strh	r2, [r3, #MY_OFFSET_REG_IME];

	bx	lr;


@ extern void PKJBDownJoyIntr(PKJBDownParam *paramp);

	.global	PKJBDownJoyIntr
	.code	16
	.thumb_func
PKJBDownJoyIntr:
	ldr	r3, my_reg_120p;
@ 今回処理(or 無視)する SEND, RECV, RESET フラグをクリア。
	ldrh	r1, [r3, #MY_OFFSET_REG_JOYCNT];
	strh	r1, [r3, #MY_OFFSET_REG_JOYCNT];

@ タイムアウトカウンタをクリア。
	mov	r2, #0;
	strb	r2, [r0, #timeout_counter];

@ シーケンスに応じたアドレスへジャンプ。
	ldr	r2, [r0, #joyint_vector];
	cmp	r2, #0;
	beq	joyint_bx_lr; @ メインルーチンで初期化を行う必要がある

@ JOY_IF_RESET ?
	lsr	r1, #1;
	bcs	resp_initial_code;

@ JOY_IF_SEND は r1 の d1 にある。
	mov	pc, r2;

	.align
	.thumb_func
joyint_err:
@ エラーの回復は、REG_JOYSTAT = 0 にして、JOYバスデバイスリセット。
@ イニシャルコード交換から。
	mov	r2, #0;
	strh	r2, [r3, #MY_OFFSET_REG_JOYSTAT];
@ r2 = 0 (keep!)
	.thumb_func
joyint_done:
@ 次回のアドレスをセットし、割り込みルーチン終了。
	str	r2, [r0, #joyint_vector];
	.thumb_func
joyint_done_samestate:
@ 暗号化のために、REG_VCOUNT の値を保存。
	ldr	r3, my_reg_dispstat_p;
	ldrh	r1, [r3, #REG_VCOUNT - REG_STAT];
	strb	r1, [r0, #vcount_bak];
	.thumb_func
joyint_bx_lr:
	bx	lr;


	.thumb_func
resp_initial_code:
@ イニシャルコード応答
@ REG_JOY_RECV を空読み。
	ldr	r1, [r3, #MY_OFFSET_REG_JOY_RECV];
@ REG_JOY_TRANS へイニシャルコードをセット。
	ldr	r1, PKJB_GBA_INITIAL_CODE_p;
	str	r1, [r3, #MY_OFFSET_REG_JOY_TRANS];
@ REG_JOYSTAT = JSTAT_PSF0
	mov	r1, #JSTAT_PSF0;
	strh	r1, [r3, #MY_OFFSET_REG_JOYSTAT];
@ vcount_bak から KeyB d15-d8 をセット。
	ldrb	r1, [r0, #vcount_bak];
	strb	r1, [r0, #keyb + 1]; @ byte access
@ 復号化モードが 0 でなければエラー。
	ldrb	r1, [r0, #decode_mode];
	cmp	r1, #0;
	bne	joyint_err;
@ バッファポインタをリセット
	ldr	r1, text_section_addr_p;
	str	r1, [r0, #decode_bufp];
	str	r1, [r0, #dl_bufp];
@ JOY_IF_SEND, JOY_IF_RECV ともに無視する。
@ 次は joyint_000 から。
	adr	r2, joyint_000;
	b	joyint_done;

	.align
	.thumb_func
joyint_000:
@ イニシャルコードを送信していなければエラー。
@ JOY_IF_SEND は r1 の d1 にある。
	lsl	r1, #31;
	bcc	joyint_err;
@ 次は joyint_100 から。すでに RECV している可能性もある。
	bmi	joyint_110;  @ すでに RECV していた
	adr	r2, joyint_100;
	b	joyint_done;

	.align
	.thumb_func
joyint_100:
@ イニシャルコードを受信していなければエラー。
@ JOY_IF_RECV は r1 の d0 にある。
	lsr	r1, #1;
	bcc	joyint_err;

	.thumb_func
joyint_110:
	ldr	r1, [r3, #MY_OFFSET_REG_JOY_RECV];
@ イニシャルコードは、期待したものか？
	ldr	r2, PKJB_GBA_INITIAL_CODE_p;
	cmp	r1, r2;
	bne	joyint_err;
@ vcount_bak から KeyB d31-d24 をセット。
	ldrb	r1, [r0, #vcount_bak];
	strb	r1, [r0, #keyb + 3]; @ byte access
@ 次は joyint_200 から。
	adr	r2, joyint_200;
	b	joyint_done;

	.align
	.thumb_func
joyint_200:
@ 「ダウンロード開始要求＋暗号化鍵A」を受信していなければエラー。
	lsr	r1, #1;
	bcc	joyint_err;
	ldr	r1, [r3, #MY_OFFSET_REG_JOY_RECV];
	lsr	r2, r1, #24;
	cmp	r2, #PKJB_FROMGC_REQUEST_DL;
	bne	joyint_err;
@ KeyA を保存。
	str	r1, [r0, #keya];
@ REG_JOY_TRANS へ「ダウンロード開始許可応答＋暗号化鍵B」をセット。
	ldrb	r1, [r0, #frame_counter];
	strb	r1, [r0, #keyb + 2]; @ byte access
@ KeyB において、d31-d8 の中で 1 が 7個以上、14個以内にしなければならない。
@ もしなっていない場合、d23-d16 を all 0 or all 1 にすることで調整する。
@ d31-d24, d15-d8 は REG_VCOUNT の値なので、0-227 (0xe3) だから 1 が 8 個にはならない。
	mov	r2, #0; @ bitcount
	mov	r3, #0; @ adc するため
	ldr	r1, [r0, #keyb]; @ word access
	lsr	r1, #8; @ skip d7-d0
1:
	lsr	r1, #1;
	adc	r2, r3;
	cmp	r1, #0;
	bne	1b;
@ r1 = 0 になっている。
	cmp	r2, #14;
	bgt	2f;      @ 1 が 14 個よりも多いので d23-d16 を all 0 にする。
	cmp	r2, #7;
	bge	3f;      @ 1 が 7 個以上 14 個以内なので、正当な鍵。
@ 1 が 7 個未満。
	mov	r1, #0xff
2:
	strb	r1, [r0, #keyb + 2]; @ byte access
3:
	ldr	r1, [r0, #keyb]; @ word access
	add	r1, r1, #PKJB_FROMGBA_DL_READY;
	ldr	r3, my_reg_120p;
	str	r1, [r3, #MY_OFFSET_REG_JOY_TRANS];
@ ステータスを JSTAT_PSF1 | JSTAT_PSF0 に。
	mov	r1, #JSTAT_PSF1 | JSTAT_PSF0;
	strh	r1, [r3, #MY_OFFSET_REG_JOYSTAT];
@ 次は joyint_300 から。
	adr	r2, joyint_300;
	b	joyint_done;

	.align
	.thumb_func
joyint_300:
@ 「ダウンロード開始許可応答＋暗号化鍵B」を送信していなければエラー。
@ JOY_IF_SEND は r1 の d1 にある。
	lsl	r1, #31;
	bcc	joyint_err;
@ 次は joyint_400 から。すでに RECV している可能性もある。
	bmi	joyint_410; @ すでに RECV していた
	adr	r2, joyint_400;
	b	joyint_done;

	.align
	.thumb_func
joyint_400:
@ 「PK-JOYブートイメージサイズ」を受信していなければエラー。
@ JOY_IF_RECV は r1 の d0 にある。
	lsr	r1, #1;
	bcc	joyint_err;

	.thumb_func
joyint_410:
	ldr	r1, [r3, #MY_OFFSET_REG_JOY_RECV];
@ もともと 8 の倍数を、8 で割って受信した。
	ldr	r2, =PKJB_PROGRAM_SIZE >> 3;
	cmp	r1, r2;
	bcs	joyint_err;
@ バッファオーバフローはセキュリティホールになり得る。
@ データサイズとして 0 を渡されても問題ないようにする。
	add	r1, #1;
	add	r1, r1;
	strh	r1, [r0, #dl_count];
@ 復号化モードが 0 でなければエラー。
	ldrb	r1, [r0, #decode_mode];
	cmp	r1, #0;
	.thumb_func
joyint_410_bne_joyint_err:
	bne	joyint_err;
@ バッファポインタをリセット
	ldr	r1, text_section_addr_p;
	str	r1, [r0, #decode_bufp];
	str	r1, [r0, #dl_bufp];

@ 次は joyint_500 から。
	adr	r2, joyint_500;
	b	joyint_done;

	.align
	.thumb_func
joyint_500:
@ 「PK-JOYブートイメージ」の受信を繰り返す。
@ JOY_IF_RECV は r1 の d0 にある。
	lsr	r1, #1;
	bcc	joyint_err;

@ ダウンロードバッファポインタの 0x04 の位が 0 or 1 で、REG_JOYSTAT の
@ JSTAT_PSF0 を 0 or 1 にする。JSTAT_PSF1 は常に 1
	ldr	r2, [r0, #dl_bufp];
	mov	r1, #0x04;
	and	r1, r2;
	add	r1, #0x08; @ JSTAT_PSF1 = 1
	lsl	r1, #2;    @ 0x0c -> 0x30
	strh	r1, [r3, #MY_OFFSET_REG_JOYSTAT];

	ldr	r1, [r3, #MY_OFFSET_REG_JOY_RECV];
	stmia	r2!, {r1};
	str	r2, [r0, #dl_bufp];
@ ダウンロード残りワードカウントを減らす。
	ldrh	r1, [r0, #dl_count];
	sub	r1, #1;
	strh	r1, [r0, #dl_count];
	bne	joyint_done_samestate;
@ 全データのダウンロードが終わった。
@ 復号化とチェックサム照合が完了するまでは「チェックサム計算中応答」
@ を行う。
@ 下からも来る。
	.thumb_func
joyint_550:
	ldrb	r1, [r0, #frame_counter];
	lsl	r1, #8;
	add	r1, #PKJB_FROMGBA_CALC_CRC;
	str	r1, [r3, #MY_OFFSET_REG_JOY_TRANS];
@ 次は joyint_600 から。
	adr	r2, joyint_600;
	b	joyint_done;

	.align
	.thumb_func
joyint_600:
@ 「チェックサム計算中応答」を送信していなければエラー。
@ JOY_IF_SEND は r1 の d1 にある。
	lsl	r1, #31;
	.thumb_func
joyint_600_bcc_joyint_err:
	bcc	joyint_err;

@ チェックサム計算が終わっていればそれを返す。
	ldr	r1, [r0, #decode_result_crc];
	cmp	r1, #0;
	beq	joyint_550; @ 終わっていない

@ 終わった。
	str	r1, [r3, #MY_OFFSET_REG_JOY_TRANS];
@ 次は joyint_800 から。
	adr	r2, joyint_800;
	b	joyint_done;

	.align
	.thumb_func
joyint_800:
@ CRCを送信していなければエラー。
@ JOY_IF_SEND は r1 の d1 にある。
	lsl	r1, #31;
	bcc	joyint_600_bcc_joyint_err;
@ 次は joyint_900 から。すでに RECV している可能性もある。
	bmi	joyint_910; @ すでに RECV していた
	adr	r2, joyint_900;
	b	joyint_done;

	.align
	.thumb_func
joyint_900:
@ KeyCで復号化できる「PK-JOYブート要求」を受信していなければエラー。
@ JOY_IF_RECV は r1 の d0 にある。
	lsr	r1, #1;
	bcc	joyint_600_bcc_joyint_err;

	.thumb_func
joyint_910:
	ldr	r1, [r3, #MY_OFFSET_REG_JOY_RECV];
	lsr	r2, r1, #24;
	cmp	r2, #PKJB_FROMGC_REQUEST_BOOT;
	bne	joyint_410_bne_joyint_err;
@ メインルーチンで正当性を検証する。
	strh	r1, [r0, #boot_key];
@ 後の RECV, SEND はエラー。
	adr	r2, joyint_999;
	b	joyint_done;

	.align
	.thumb_func
joyint_999:
	b	joyint_err;


@ extern void PKJBDownStop(void);

	.global	PKJBDownStop
	.code	16
	.thumb_func
PKJBDownStop:
@ JOYバス通信, SIO割り込み禁止。
@ ただし REG_IME の設定は変更しない。
	ldr	r3, my_reg_200p;
	ldrh	r2, [r3, #MY_OFFSET_REG_IME];
@ r2 = imebak
	mov	r1, #0;
@ REG_IME = 0
	strh	r1, [r3, #MY_OFFSET_REG_IME];

@ REG_JOYCNT = JOY_IF_SEND | JOY_IF_RECV | JOY_IF_RESET
@ すなわち JOY_IF_ENABLE をクリアする。
	ldr	r3, my_reg_120p;
	mov	r0, #JOY_IF_SEND | JOY_IF_RECV | JOY_IF_RESET;
	strh	r0, [r3, #MY_OFFSET_REG_JOYCNT];

@ REG_RCNT = R_DIRECT_MODE
@ R_DIRECT_MODE は 0x8000 である。
@ REG_SIOMULTI0 は 0x04000120 なので << (15-5) すれば下位が 0x8000 になる。
	lsl	r0, r3, #15 - 5;
	strh	r0, [r3, #MY_OFFSET_REG_RCNT];

@ IE, IF の SIO_INTR_FLAG はクリア。
@ REG_IF = SIO_INTR_FLAG
	ldr	r3, my_reg_200p;
	mov	r0, #SIO_INTR_FLAG;
	strh	r0, [r3, #MY_OFFSET_REG_IF];
	ldrh	r1, [r3, #MY_OFFSET_REG_IE];
	bic	r1, r0;
	strh	r1, [r3, #MY_OFFSET_REG_IE];

@ REG_IME = imebak
	strh	r2, [r3, #MY_OFFSET_REG_IME];

	bx	lr;

	.align
	.ltorg
	.align

my_reg_200p:
	.word	REG_IE
my_reg_120p:
	.word	REG_SIOMULTI0
my_reg_dispstat_p:
	.word	REG_STAT

@ ゲームに応じたGBAイニシャルコードの小文字に変えてください。
PKJB_GBA_INITIAL_CODE_p:
	@ .byte	'a', 'g', 'b', 'j'
	.byte	'A', 'X', 'V', 'J'

@ ゲームに応じたダウンロードバッファアドレスを指定してください。(4の倍数)
@ PK-JOYブートイメージ (../jb/jb.bin) の .text セクション開始アドレス
@ と同じになるよう、../jb/Makefile の -Ttext も変更してください。
text_section_addr_p:
	.word	0x02000000

	.end
