@********************************************************************
@*          AgbMemoryMap.s                                          *
@*            AGBメモリマップ定数（GAS用）                          *
@*                                                                  *
@*          Copyright (C) 1999-2001 NINTENDO Co.,Ltd.               *
@********************************************************************


@--------------------------------------------------------------------
@-                      メモリ・マップ                              -
@--------------------------------------------------------------------

BOOT_ROM                =   0x00000000          @ ブートＲＯＭ
BOOT_ROM_END            =   (BOOT_ROM + 0x4000)
EX_WRAM                 =   0x02000000          @ ＣＰＵ外部ワークＲＡＭ
EX_WRAM_END             =   (EX_WRAM + 0x40000)
CPU_WRAM                =   0x03000000          @ ＣＰＵ内部ワークＲＡＭ
CPU_WRAM_END            =   (CPU_WRAM + 0x8000)
WRAM                    =    EX_WRAM            @ ワークＲＡＭ全体
WRAM_END                =    CPU_WRAM_END
SOUND_AREA_ADDR_BUF     =   (CPU_WRAM_END - 0x10)@サウンドドライバ ワークアドレス
INTR_CHECK_BUF          =   (CPU_WRAM_END - 0x8)@ 割り込みチェック
SOFT_RESET_DIRECT_BUF   =   (CPU_WRAM_END - 0x6)@ SoftReset() 復帰先指定
INTR_VECTOR_BUF         =   (CPU_WRAM_END - 0x4)@ 割り込み分岐アドレス
REG_BASE                =   0x04000000          @ レジスタ群
REG_END                 =   (REG_BASE +  0x300)
PLTT                    =   0x05000000          @ パレットＲＡＭ
PLTT_END                =   (PLTT +      0x400)
BG_PLTT                 =   (PLTT +        0x0) @   ＢＧパレットＲＡＭ
BG_PLTT_END             =   (PLTT +      0x200)
OBJ_PLTT                =   (PLTT +      0x200) @ ＯＢＪパレットＲＡＭ
OBJ_PLTT_END            =   (PLTT +      0x400)
VRAM                    =   0x06000000          @ ＶＲＡＭ
VRAM_END                =   (VRAM +    0x18000)
BG_VRAM                 =   (VRAM +        0x0) @ ＢＧキャラクタ/スクリーンＲＡＭ
BG_BITMAP0_VRAM         =   (VRAM +        0x0) @ ＢＧビットマップ０ＲＡＭ
BG_BITMAP1_VRAM         =   (VRAM +     0xa000) @ ＢＧビットマップ１ＲＡＭ
OBJ_MODE0_VRAM          =   (VRAM +    0x10000) @ ＯＢＪキャラクタＲＡＭ
OBJ_MODE1_VRAM          =   (VRAM +    0x10000)
OBJ_MODE2_VRAM          =   (VRAM +    0x10000)
OBJ_MODE3_VRAM          =   (VRAM +    0x14000)
OBJ_MODE4_VRAM          =   (VRAM +    0x14000)
OBJ_MODE5_VRAM          =   (VRAM +    0x14000)
OBJ_VRAM_END            =   (VRAM +    0x18000)
OAM                     =   0x07000000          @ ＯＡＭ
OAM_END                 =   (OAM +       0x400)

ROM_BANK0               =   0x08000000          @ ＲＯＭ バンク０
ROM_BANK0_END           =   0x0a000000
ROM_BANK1               =   0x0a000000          @ ＲＯＭ バンク１
ROM_BANK1_END           =   0x0c000000
ROM_BANK2               =   0x0c000000          @ ＲＯＭ バンク２
ROM_BANK2_END           =   0x0e000000
RAM_BANK                =   0x0c000000          @ ＲＡＭ バンク
RAM_BANK_END            =   0x10000000

FLASH_1M                =   0x09fe0000          @ １Ｍフラッシュメモリ
FLASH_1M_END            =   0x0a000000

@--------------------------------------------------------------------
@-                      メモリ・サイズ                              -
@--------------------------------------------------------------------

BOOT_ROM_SIZE           =   0x4000              @ ブートＲＯＭ
EX_WRAM_SIZE            =   0x40000             @ ＣＰＵ外部ワークＲＡＭ
CPU_WRAM_SIZE           =   0x8000              @ ＣＰＵ内部ワークＲＡＭ
WRAM_SIZE               =   0x48000             @ ワークＲＡＭ全体
USR_BUF_SIZE            =   0x47fa0             @ ユーザ領域
SYS_BUF_SIZE            =   0x80                @ システム領域
PLTT_SIZE               =   (2*256*2)           @ パレットＲＡＭ
BG_PLTT_SIZE            =   (2*256)             @   ＢＧパレットＲＡＭ
OBJ_PLTT_SIZE           =   (2*256)             @ ＯＢＪパレットＲＡＭ
VRAM_SIZE               =   0x18000             @ ＶＲＡＭ
BG_MODE0_VRAM_SIZE      =   0x10000             @ ＢＧキャラクタ/スクリーン
BG_MODE1_VRAM_SIZE      =   0x10000
BG_MODE2_VRAM_SIZE      =   0x10000
BG_MODE3_VRAM_SIZE      =   0x14000             @ ＢＧビットマップ
BG_MODE4_VRAM_SIZE      =   0x0a000
BG_MODE5_VRAM_SIZE      =   0x0a000
OBJ_MODE0_VRAM_SIZE     =   0x08000             @ ＯＢＪキャラクタ
OBJ_MODE1_VRAM_SIZE     =   0x08000
OBJ_MODE2_VRAM_SIZE     =   0x08000
OBJ_MODE3_VRAM_SIZE     =   0x04000
OBJ_MODE4_VRAM_SIZE     =   0x04000
OBJ_MODE5_VRAM_SIZE     =   0x04000
OAM_SIZE                =   (8*128)             @ ＯＡＭ

ROM_BANK_SIZE           =   0x02000000          @ ＲＯＭ バンク
ROM_BANK0_SIZE          =   0x02000000          @ ＲＯＭ バンク０
ROM_BANK1_SIZE          =   0x02000000          @ ＲＯＭ バンク１
ROM_BANK2_SIZE          =   0x02000000          @ ＲＯＭ バンク２
RAM_BANK_SIZE           =   0x02000000          @ ＲＡＭ バンク

FLASH_1M_SIZE           =   0x20000             @ １Ｍフラッシュメモリ

@--------------------------------------------------------------------
@-                      レジスタ・アドレス                          -
@--------------------------------------------------------------------

REG_IME         =   (REG_BASE + 0x208)  @ 割り込みマスタイネーブル
REG_IE          =   (REG_BASE + 0x200)  @ 割り込み許可
REG_IF          =   (REG_BASE + 0x202)  @ 割り込み要求

REG_WAITCNT     =   (REG_BASE + 0x204)  @ カセットウェイトコントロール

REG_DISPCNT     =   (REG_BASE + 0x0)    @ 表示コントロール

REG_STAT        =   (REG_BASE + 0x4)    @ ステータス
REG_VCOUNT      =   (REG_BASE + 0x6)    @ Ｖカウンタ

REG_MOSAIC      =   (REG_BASE + 0x4c)   @ モザイク サイズ

REG_BLDCNT      =   (REG_BASE + 0x50)   @ ブレンドモード コントロール
REG_BLDALPHA    =   (REG_BASE + 0x52)   @   半透明 パラメータ
REG_BLDY        =   (REG_BASE + 0x54)   @ 輝度変更 パラメータ

REG_WINCNT      =   (REG_BASE + 0x40)   @ ウインドウ  コントロール
REG_WIN0H       =   (REG_BASE + 0x40)   @ ウインドウ０水平領域
REG_WIN1H       =   (REG_BASE + 0x42)   @ ウインドウ１水平領域
REG_WIN0V       =   (REG_BASE + 0x44)   @ ウインドウ０垂直領域
REG_WIN1V       =   (REG_BASE + 0x46)   @ ウインドウ１垂直領域
REG_WININ       =   (REG_BASE + 0x48)   @ ウインドウ内コントロール
REG_WIN0        =   (REG_BASE + 0x48)   @ ウインドウ０コントロール
REG_WIN1        =   (REG_BASE + 0x49)   @ ウインドウ１コントロール
REG_WINOUT      =   (REG_BASE + 0x4a)   @ ウインドウ外コントロール
REG_OBJWIN      =   (REG_BASE + 0x4b)   @ ＯＢＪウインドウコントロール


REG_BGCNT       =   (REG_BASE + 0x8)    @ ＢＧコントロール
REG_BG0CNT      =   (REG_BASE + 0x8)    @ ＢＧ０コントロール
REG_BG1CNT      =   (REG_BASE + 0xa)    @ ＢＧ１コントロール
REG_BG2CNT      =   (REG_BASE + 0xc)    @ ＢＧ２コントロール
REG_BG3CNT      =   (REG_BASE + 0xe)    @ ＢＧ３コントロール
REG_BGOFS       =   (REG_BASE + 0x10)   @ ＢＧオフセット
REG_BG0HOFS     =   (REG_BASE + 0x10)   @ ＢＧ０Ｈオフセット
REG_BG0VOFS     =   (REG_BASE + 0x12)   @ ＢＧ０Ｖオフセット
REG_BG1HOFS     =   (REG_BASE + 0x14)   @ ＢＧ１Ｈオフセット
REG_BG1VOFS     =   (REG_BASE + 0x16)   @ ＢＧ１Ｖオフセット
REG_BG2HOFS     =   (REG_BASE + 0x18)   @ ＢＧ２Ｈオフセット
REG_BG2VOFS     =   (REG_BASE + 0x1a)   @ ＢＧ２Ｖオフセット
REG_BG3HOFS     =   (REG_BASE + 0x1c)   @ ＢＧ３Ｈオフセット
REG_BG3VOFS     =   (REG_BASE + 0x1e)   @ ＢＧ３Ｖオフセット
REG_BG2AFFINE   =   (REG_BASE + 0x20)   @ ＢＧ２アフィン変換パラメータ群
REG_BG2PA       =   (REG_BASE + 0x20)   @ ＢＧ２ライン方向Ｘ座標差分
REG_BG2PB       =   (REG_BASE + 0x22)   @ ＢＧ２  垂直方向Ｘ座標差分
REG_BG2PC       =   (REG_BASE + 0x24)   @ ＢＧ２ライン方向Ｙ座標差分
REG_BG2PD       =   (REG_BASE + 0x26)   @ ＢＧ２  垂直方向Ｙ座標差分
REG_BG2X        =   (REG_BASE + 0x28)   @ ＢＧ２スタートＸ座標
REG_BG2X_L      =   (REG_BASE + 0x28)
REG_BG2X_H      =   (REG_BASE + 0x2a)
REG_BG2Y        =   (REG_BASE + 0x2c)   @ ＢＧ２スタートＹ座標
REG_BG2Y_L      =   (REG_BASE + 0x2c)
REG_BG2Y_H      =   (REG_BASE + 0x2e)
REG_BG3AFFINE   =   (REG_BASE + 0x30)   @ ＢＧ３アフィン変換パラメータ群
REG_BG3PA       =   (REG_BASE + 0x30)   @ ＢＧ３ライン方向Ｘ座標差分
REG_BG3PB       =   (REG_BASE + 0x32)   @ ＢＧ３  垂直方向Ｘ座標差分
REG_BG3PC       =   (REG_BASE + 0x34)   @ ＢＧ３ライン方向Ｙ座標差分
REG_BG3PD       =   (REG_BASE + 0x36)   @ ＢＧ３  垂直方向Ｙ座標差分
REG_BG3X        =   (REG_BASE + 0x38)   @ ＢＧ３スタートＸ座標
REG_BG3X_L      =   (REG_BASE + 0x38)
REG_BG3X_H      =   (REG_BASE + 0x3a)
REG_BG3Y        =   (REG_BASE + 0x3c)   @ ＢＧ３スタートＹ座標
REG_BG3Y_L      =   (REG_BASE + 0x3c)
REG_BG3Y_H      =   (REG_BASE + 0x3e)


REG_SOUNDCNT    =   (REG_BASE + 0x80)   @ サウンドコントロール
REG_SOUNDCNT_L  =   (REG_BASE + 0x80)
REG_SOUNDCNT_H  =   (REG_BASE + 0x82)
REG_SOUNDCNT_X  =   (REG_BASE + 0x84)

REG_SOUNDBIAS   =   (REG_BASE + 0x88)   @ サウンドＢＩＡＳ

REG_SOUND1CNT   =   (REG_BASE + 0x60)   @ サウンド１コントロール
REG_SOUND1CNT_L =   (REG_BASE + 0x60)
REG_SOUND1CNT_H =   (REG_BASE + 0x62)
REG_SOUND1CNT_X =   (REG_BASE + 0x64)
REG_SOUND2CNT   =   (REG_BASE + 0x68)   @ サウンド２コントロール
REG_SOUND2CNT_L =   (REG_BASE + 0x68)
REG_SOUND2CNT_H =   (REG_BASE + 0x6c)
REG_SOUND3CNT   =   (REG_BASE + 0x70)   @ サウンド３コントロール
REG_SOUND3CNT_L =   (REG_BASE + 0x70)
REG_SOUND3CNT_H =   (REG_BASE + 0x72)
REG_SOUND3CNT_X =   (REG_BASE + 0x74)
REG_SOUND4CNT   =   (REG_BASE + 0x78)   @ サウンド４コントロール
REG_SOUND4CNT_L =   (REG_BASE + 0x78)
REG_SOUND4CNT_H =   (REG_BASE + 0x7c)

REG_WAVE_RAM    =   (REG_BASE + 0x90)   @ サウンド３ 波形ＲＡＭ
REG_WAVE_RAM0   =   (REG_BASE + 0x90)
REG_WAVE_RAM0_L =   (REG_BASE + 0x90)
REG_WAVE_RAM0_H =   (REG_BASE + 0x92)
REG_WAVE_RAM1   =   (REG_BASE + 0x94)
REG_WAVE_RAM1_L =   (REG_BASE + 0x94)
REG_WAVE_RAM1_H =   (REG_BASE + 0x96)
REG_WAVE_RAM2   =   (REG_BASE + 0x98)
REG_WAVE_RAM2_L =   (REG_BASE + 0x98)
REG_WAVE_RAM2_H =   (REG_BASE + 0x9a)
REG_WAVE_RAM3   =   (REG_BASE + 0x9c)
REG_WAVE_RAM3_L =   (REG_BASE + 0x9c)
REG_WAVE_RAM3_H =   (REG_BASE + 0x9e)

REG_FIFO        =   (REG_BASE + 0xa0)   @ サウンド ＦＩＦＯ
REG_FIFO_A      =   (REG_BASE + 0xa0)
REG_FIFO_A_L    =   (REG_BASE + 0xa0)
REG_FIFO_A_H    =   (REG_BASE + 0xa2)
REG_FIFO_B      =   (REG_BASE + 0xa4)
REG_FIFO_B_L    =   (REG_BASE + 0xa4)
REG_FIFO_B_H    =   (REG_BASE + 0xa6)


REG_DMA0        =   (REG_BASE + 0xb0)   @ ＤＭＡ０
REG_DMA0SAD     =   (REG_BASE + 0xb0)   @ （内部メモリ→内部メモリ）
REG_DMA0SAD_L   =   (REG_BASE + 0xb0)
REG_DMA0SAD_H   =   (REG_BASE + 0xb2)
REG_DMA0DAD     =   (REG_BASE + 0xb4)
REG_DMA0DAD_L   =   (REG_BASE + 0xb4)
REG_DMA0DAD_H   =   (REG_BASE + 0xb6)
REG_DMA0CNT     =   (REG_BASE + 0xb8)
REG_DMA0CNT_L   =   (REG_BASE + 0xb8)
REG_DMA0CNT_H   =   (REG_BASE + 0xba)
REG_DMA1        =   (REG_BASE + 0xbc)   @ ＤＭＡ１
REG_DMA1SAD     =   (REG_BASE + 0xbc)   @ （内部メモリ→サウンドFIFO／内部メモリ）
REG_DMA1SAD_L   =   (REG_BASE + 0xbc)
REG_DMA1SAD_H   =   (REG_BASE + 0xbe)
REG_DMA1DAD     =   (REG_BASE + 0xc0)
REG_DMA1DAD_L   =   (REG_BASE + 0xc0)
REG_DMA1DAD_H   =   (REG_BASE + 0xc2)
REG_DMA1CNT     =   (REG_BASE + 0xc4)
REG_DMA1CNT_L   =   (REG_BASE + 0xc4)
REG_DMA1CNT_H   =   (REG_BASE + 0xc6)
REG_DMA2        =   (REG_BASE + 0xc8)   @ ＤＭＡ２
REG_DMA2SAD     =   (REG_BASE + 0xc8)   @ （内部メモリ→サウンドFIFO／内部メモリ）
REG_DMA2SAD_L   =   (REG_BASE + 0xc8)
REG_DMA2SAD_H   =   (REG_BASE + 0xca)
REG_DMA2DAD     =   (REG_BASE + 0xcc)
REG_DMA2DAD_L   =   (REG_BASE + 0xcc)
REG_DMA2DAD_H   =   (REG_BASE + 0xce)
REG_DMA2CNT     =   (REG_BASE + 0xd0)
REG_DMA2CNT_L   =   (REG_BASE + 0xd0)
REG_DMA2CNT_H   =   (REG_BASE + 0xd2)
REG_DMA3        =   (REG_BASE + 0xd4)   @ ＤＭＡ３
REG_DMA3SAD     =   (REG_BASE + 0xd4)   @ （カセット／内部メモリ←→内部メモリ）
REG_DMA3SAD_L   =   (REG_BASE + 0xd4)
REG_DMA3SAD_H   =   (REG_BASE + 0xd6)
REG_DMA3DAD     =   (REG_BASE + 0xd8)
REG_DMA3DAD_L   =   (REG_BASE + 0xd8)
REG_DMA3DAD_H   =   (REG_BASE + 0xda)
REG_DMA3CNT     =   (REG_BASE + 0xdc)
REG_DMA3CNT_L   =   (REG_BASE + 0xdc)
REG_DMA3CNT_H   =   (REG_BASE + 0xde)


REG_TM0CNT      =   (REG_BASE + 0x100)  @ タイマー０
REG_TM0CNT_L    =   (REG_BASE + 0x100)
REG_TM0CNT_H    =   (REG_BASE + 0x102)
REG_TM1CNT      =   (REG_BASE + 0x104)  @ タイマー１
REG_TM1CNT_L    =   (REG_BASE + 0x104)
REG_TM1CNT_H    =   (REG_BASE + 0x106)
REG_TM2CNT      =   (REG_BASE + 0x108)  @ タイマー２
REG_TM2CNT_L    =   (REG_BASE + 0x108)
REG_TM2CNT_H    =   (REG_BASE + 0x10a)
REG_TM3CNT      =   (REG_BASE + 0x10c)  @ タイマー３
REG_TM3CNT_L    =   (REG_BASE + 0x10c)
REG_TM3CNT_H    =   (REG_BASE + 0x10e)


REG_RCNT		=	(REG_BASE + 0x134)	@ 汎用入出力コントロール

REG_SIOCNT      =   (REG_BASE + 0x128)  @ シリアル通信コントロール
REG_SIODATA8    =	(REG_BASE + 0x12a)  @  8bitシリアル通信データ
REG_SIODATA32   =	(REG_BASE + 0x120)  @ 32bitシリアル通信データ
REG_SIOMLT_SEND =   (REG_BASE + 0x12a)  @ マルチプレイＳＩＯ 送信データ
REG_SIOMLT_RECV =	(REG_BASE + 0x120)  @ マルチプレイＳＩＯ 受信データ
REG_SIOMULTI0   =   (REG_BASE + 0x120)
REG_SIOMULTI1   =   (REG_BASE + 0x122)
REG_SIOMULTI2   =   (REG_BASE + 0x124)
REG_SIOMULTI3   =   (REG_BASE + 0x126)

REG_JOYCNT      =   (REG_BASE + 0x140)  @ ＪＯＹバス通信コントロール
REG_JOYSTAT     =   (REG_BASE + 0x158)  @ ＪＯＹバス　ステータス
REG_JOY_RECV    =   (REG_BASE + 0x150)  @ ＪＯＹバス　受信データ
REG_JOY_RECV_L  =   (REG_BASE + 0x150)
REG_JOY_RECV_H  =   (REG_BASE + 0x152)
REG_JOY_TRANS   =   (REG_BASE + 0x154)  @ ＪＯＹバス　送信データ
REG_JOY_TRANS_L =   (REG_BASE + 0x154)
REG_JOY_TRANS_H =   (REG_BASE + 0x156)


REG_KEYINPUT    =   (REG_BASE + 0x130)  @ キー入力
REG_KEYCNT      =   (REG_BASE + 0x132)  @ キーコントロール


@--------------------------------------------------------------------
@-                      レジスタ・オフセット                        -
@--------------------------------------------------------------------

OFFSET_REG_IME          =   0x208       @ 割り込みマスタイネーブル
OFFSET_REG_IE           =   0x200       @ 割り込み許可
OFFSET_REG_IF           =   0x202       @ 割り込み要求

OFFSET_REG_WAITCNT      =   0x204       @ カセットウェイトコントロール

OFFSET_REG_DISPCNT      =   0x0         @ 表示コントロール

OFFSET_REG_STAT         =   0x4         @ ステータス
OFFSET_REG_VCOUNT       =   0x6         @ Ｖカウンタ

OFFSET_REG_MOSAIC       =   0x4c        @ モザイク サイズ

OFFSET_REG_BLDCNT       =   0x50        @ ブレンドモード コントロール
OFFSET_REG_BLDALPHA     =   0x52        @   半透明 パラメータ
OFFSET_REG_BLDY         =   0x54        @ 輝度変更 パラメータ

OFFSET_REG_WINCNT       =   0x40        @ ウインドウ  コントロール
OFFSET_REG_WIN0H        =   0x40        @ ウインドウ０水平領域
OFFSET_REG_WIN1H        =   0x42        @ ウインドウ１水平領域
OFFSET_REG_WIN0V        =   0x44        @ ウインドウ０垂直領域
OFFSET_REG_WIN1V        =   0x46        @ ウインドウ１垂直領域
OFFSET_REG_WININ        =   0x48        @ ウインドウ内コントロール
OFFSET_REG_WIN0         =   0x48        @ ウインドウ０コントロール
OFFSET_REG_WIN1         =   0x49        @ ウインドウ１コントロール
OFFSET_REG_WINOUT       =   0x4a        @ ウインドウ外コントロール
OFFSET_REG_OBJWIN       =   0x4b        @ ＯＢＪウインドウコントロール


OFFSET_REG_BGCNT        =   0x8         @ ＢＧコントロール
OFFSET_REG_BG0CNT       =   0x8         @ ＢＧ０コントロール
OFFSET_REG_BG1CNT       =   0xa         @ ＢＧ１コントロール
OFFSET_REG_BG2CNT       =   0xc         @ ＢＧ２コントロール
OFFSET_REG_BG3CNT       =   0xe         @ ＢＧ３コントロール
OFFSET_REG_BGOFS        =   0x10        @ ＢＧオフセット
OFFSET_REG_BG0HOFS      =   0x10        @ ＢＧ０Ｈオフセット
OFFSET_REG_BG0VOFS      =   0x12        @ ＢＧ０Ｖオフセット
OFFSET_REG_BG1HOFS      =   0x14        @ ＢＧ１Ｈオフセット
OFFSET_REG_BG1VOFS      =   0x16        @ ＢＧ１Ｖオフセット
OFFSET_REG_BG2HOFS      =   0x18        @ ＢＧ２Ｈオフセット
OFFSET_REG_BG2VOFS      =   0x1a        @ ＢＧ２Ｖオフセット
OFFSET_REG_BG3HOFS      =   0x1c        @ ＢＧ３Ｈオフセット
OFFSET_REG_BG3VOFS      =   0x1e        @ ＢＧ３Ｖオフセット
OFFSET_REG_BG2AFFINE    =   0x20        @ ＢＧ２アフィン変換パラメータ群
OFFSET_REG_BG2PA        =   0x20        @ ＢＧ２ライン方向Ｘ座標差分
OFFSET_REG_BG2PB        =   0x22        @ ＢＧ２  垂直方向Ｘ座標差分
OFFSET_REG_BG2PC        =   0x24        @ ＢＧ２ライン方向Ｙ座標差分
OFFSET_REG_BG2PD        =   0x26        @ ＢＧ２  垂直方向Ｙ座標差分
OFFSET_REG_BG2X         =   0x28        @ ＢＧ２スタートＸ座標
OFFSET_REG_BG2X_L       =   0x28
OFFSET_REG_BG2X_H       =   0x2a
OFFSET_REG_BG2Y         =   0x2c        @ ＢＧ２スタートＹ座標
OFFSET_REG_BG2Y_L       =   0x2c
OFFSET_REG_BG2Y_H       =   0x2e
OFFSET_REG_BG3AFFINE    =   0x30        @ ＢＧ３アフィン変換パラメータ群
OFFSET_REG_BG3PA        =   0x30        @ ＢＧ３ライン方向Ｘ座標差分
OFFSET_REG_BG3PB        =   0x32        @ ＢＧ３  垂直方向Ｘ座標差分
OFFSET_REG_BG3PC        =   0x34        @ ＢＧ３ライン方向Ｙ座標差分
OFFSET_REG_BG3PD        =   0x36        @ ＢＧ３  垂直方向Ｙ座標差分
OFFSET_REG_BG3X         =   0x38        @ ＢＧ３スタートＸ座標
OFFSET_REG_BG3X_L       =   0x38
OFFSET_REG_BG3X_H       =   0x3a
OFFSET_REG_BG3Y         =   0x3c        @ ＢＧ３スタートＹ座標
OFFSET_REG_BG3Y_L       =   0x3c
OFFSET_REG_BG3Y_H       =   0x3e


OFFSET_REG_SOUNDCNT     =   0x80        @ サウンドコントロール
OFFSET_REG_SOUNDCNT_L   =   0x80
OFFSET_REG_SOUNDCNT_H   =   0x82
OFFSET_REG_SOUNDCNT_X   =   0x84

OFFSET_REG_SOUNDBIAS    =   0x88        @ サウンドＢＩＡＳ

OFFSET_REG_SOUND1CNT    =   0x60        @ サウンド１コントロール
OFFSET_REG_SOUND1CNT_L  =   0x60
OFFSET_REG_SOUND1CNT_H  =   0x62
OFFSET_REG_SOUND1CNT_X  =   0x64
OFFSET_REG_SOUND2CNT    =   0x68        @ サウンド２コントロール
OFFSET_REG_SOUND2CNT_L  =   0x68
OFFSET_REG_SOUND2CNT_H  =   0x6c
OFFSET_REG_SOUND3CNT    =   0x70        @ サウンド３コントロール
OFFSET_REG_SOUND3CNT_L  =   0x70
OFFSET_REG_SOUND3CNT_H  =   0x72
OFFSET_REG_SOUND3CNT_X  =   0x74
OFFSET_REG_SOUND4CNT    =   0x78        @ サウンド４コントロール
OFFSET_REG_SOUND4CNT_L  =   0x78
OFFSET_REG_SOUND4CNT_H  =   0x7c

OFFSET_REG_WAVE_RAM     =   0x90        @ サウンド３ 波形ＲＡＭ
OFFSET_REG_WAVE_RAM0    =   0x90
OFFSET_REG_WAVE_RAM0_L  =   0x90
OFFSET_REG_WAVE_RAM0_H  =   0x92
OFFSET_REG_WAVE_RAM1    =   0x94
OFFSET_REG_WAVE_RAM1_L  =   0x94
OFFSET_REG_WAVE_RAM1_H  =   0x96
OFFSET_REG_WAVE_RAM2    =   0x98
OFFSET_REG_WAVE_RAM2_L  =   0x98
OFFSET_REG_WAVE_RAM2_H  =   0x9a
OFFSET_REG_WAVE_RAM3    =   0x9c
OFFSET_REG_WAVE_RAM3_L  =   0x9c
OFFSET_REG_WAVE_RAM3_H  =   0x9e

OFFSET_REG_FIFO         =   0xa0        @ サウンド ＦＩＦＯ
OFFSET_REG_FIFO_A       =   0xa0
OFFSET_REG_FIFO_A_L     =   0xa0
OFFSET_REG_FIFO_A_H     =   0xa2
OFFSET_REG_FIFO_B       =   0xa4
OFFSET_REG_FIFO_B_L     =   0xa4
OFFSET_REG_FIFO_B_H     =   0xa6


OFFSET_REG_DMA0         =   0xb0        @ ＤＭＡ０
OFFSET_REG_DMA0SAD      =   0xb0        @ （内部メモリ→内部メモリ）
OFFSET_REG_DMA0SAD_L    =   0xb0
OFFSET_REG_DMA0SAD_H    =   0xb2
OFFSET_REG_DMA0DAD      =   0xb4
OFFSET_REG_DMA0DAD_L    =   0xb4
OFFSET_REG_DMA0DAD_H    =   0xb6
OFFSET_REG_DMA0CNT      =   0xb8
OFFSET_REG_DMA0CNT_L    =   0xb8
OFFSET_REG_DMA0CNT_H    =   0xba
OFFSET_REG_DMA1         =   0xbc        @ ＤＭＡ１
OFFSET_REG_DMA1SAD      =   0xbc        @ （内部メモリ→サウンドFIFO／内部メモリ）
OFFSET_REG_DMA1SAD_L    =   0xbc
OFFSET_REG_DMA1SAD_H    =   0xbe
OFFSET_REG_DMA1DAD      =   0xc0
OFFSET_REG_DMA1DAD_L    =   0xc0
OFFSET_REG_DMA1DAD_H    =   0xc2
OFFSET_REG_DMA1CNT      =   0xc4
OFFSET_REG_DMA1CNT_L    =   0xc4
OFFSET_REG_DMA1CNT_H    =   0xc6
OFFSET_REG_DMA2         =   0xc8        @ ＤＭＡ２
OFFSET_REG_DMA2SAD      =   0xc8        @ （内部メモリ→サウンドFIFO／内部メモリ）
OFFSET_REG_DMA2SAD_L    =   0xc8
OFFSET_REG_DMA2SAD_H    =   0xca
OFFSET_REG_DMA2DAD      =   0xcc
OFFSET_REG_DMA2DAD_L    =   0xcc
OFFSET_REG_DMA2DAD_H    =   0xce
OFFSET_REG_DMA2CNT      =   0xd0
OFFSET_REG_DMA2CNT_L    =   0xd0
OFFSET_REG_DMA2CNT_H    =   0xd2
OFFSET_REG_DMA3         =   0xd4        @ ＤＭＡ３
OFFSET_REG_DMA3SAD      =   0xd4        @ （カセット／内部メモリ←→内部メモリ）
OFFSET_REG_DMA3SAD_L    =   0xd4
OFFSET_REG_DMA3SAD_H    =   0xd6
OFFSET_REG_DMA3DAD      =   0xd8
OFFSET_REG_DMA3DAD_L    =   0xd8
OFFSET_REG_DMA3DAD_H    =   0xda
OFFSET_REG_DMA3CNT      =   0xdc
OFFSET_REG_DMA3CNT_L    =   0xdc
OFFSET_REG_DMA3CNT_H    =   0xde


OFFSET_REG_TM0CNT       =   0x100       @ タイマー０
OFFSET_REG_TM0CNT_L     =   0x100
OFFSET_REG_TM0CNT_H     =   0x102
OFFSET_REG_TM1CNT       =   0x104       @ タイマー１
OFFSET_REG_TM1CNT_L     =   0x104
OFFSET_REG_TM1CNT_H     =   0x106
OFFSET_REG_TM2CNT       =   0x108       @ タイマー２
OFFSET_REG_TM2CNT_L     =   0x108
OFFSET_REG_TM2CNT_H     =   0x10a
OFFSET_REG_TM3CNT       =   0x10c       @ タイマー３
OFFSET_REG_TM3CNT_L     =   0x10c
OFFSET_REG_TM3CNT_H     =   0x10e


OFFSET_REG_RCNT         =	0x134       @ 汎用入出力コントロール

OFFSET_REG_SIOCNT       =   0x128       @ シリアル通信コントロール
OFFSET_REG_SIODATA8     =	0x12a       @  8bitシリアル通信データ
OFFSET_REG_SIODATA32    =	0x120       @ 32bitシリアル通信データ
OFFSET_REG_SIOMLT_SEND  =   0x12a       @ マルチプレイＳＩＯ 送信データ
OFFSET_REG_SIOMLT_RECV  =	0x120       @ マルチプレイＳＩＯ 受信データ
OFFSET_REG_SIOMULTI0    =   0x120
OFFSET_REG_SIOMULTI1    =   0x122
OFFSET_REG_SIOMULTI2    =   0x124
OFFSET_REG_SIOMULTI3    =   0x126

OFFSET_REG_JOYCNT       =   0x140       @ ＪＯＹバス通信コントロール
OFFSET_REG_JOYSTAT      =   0x158       @ ＪＯＹバス　ステータス
OFFSET_REG_JOY_RECV     =   0x150       @ ＪＯＹバス　受信データ
OFFSET_REG_JOY_RECV_L   =   0x150
OFFSET_REG_JOY_RECV_H   =   0x152
OFFSET_REG_JOY_TRANS    =   0x154       @ ＪＯＹバス　送信データ
OFFSET_REG_JOY_TRANS_L  =   0x154
OFFSET_REG_JOY_TRANS_H  =   0x156


OFFSET_REG_KEYINPUT     =   0x130       @ キー入力
OFFSET_REG_KEYCNT       =   0x132       @ キーコントロール


