@********************************************************************
@*          AgbDefine.s                                             *
@*            AGB標準定数（GAS用）                                  *
@*                                                                  *
@*          Copyright (C) 1999-2001 NINTENDO Co.,Ltd.               *
@********************************************************************


@--------------------------------------------------------------------
@-                            定数                                  -
@--------------------------------------------------------------------

ON                      =   1
OFF                     =   0
ENABLE                  =   1
DISABLE                 =   0
TRUE                    =   1
FALSE                   =   0

LCD_WIDTH               =   240                 @ 画面幅
LCD_HEIGHT              =   160                 @ 画面高さ

SYSTEM_CLOCK            =  (16 * 1024 * 1024)   @ システムクロック


@--------------------------------------------------------------------
@-                レジスタ＆ＲＡＭ リセット システムコール          -
@--------------------------------------------------------------------

RESET_ALL_FLAG          =   0xff        @ 全リセット

RESET_ALL_REG_FLAG      =   0xe0        @ 全レジスタ リセット

RESET_REG_FLAG          =   0x80        @ レジスタ（下記以外）リセット
RESET_REG_SOUND_FLAG    =   0x40        @ サウンドレジスタ    リセット
RESET_REG_SIO_FLAG      =   0x20        @ ＳＩＯレジスタ      リセット

RESET_ALL_RAM_FLAG      =   0x1f        @ 全ＲＡＭ クリア

RESET_EX_WRAM_FLAG      =   0x01        @ ＣＰＵ外部ＲＡＭ  クリア
RESET_CPU_WRAM_FLAG     =   0x02        @ ＣＰＵ内部ＲＡＭ  クリア
RESET_PLTT_FLAG         =   0x04        @ パレット          クリア
RESET_VRAM_FLAG         =   0x08        @ ＶＲＡＭ          クリア
RESET_OAM_FLAG          =   0x10        @ ＯＡＭ            クリア


@--------------------------------------------------------------------
@-                    ＢＧスクリーンデータ                          -
@--------------------------------------------------------------------

BG_SC_CHAR_NO_MASK      =   0x03ff      @ キャラクタＮｏ
BG_SC_FLIP_MASK         =   0x0c00      @ フリップ
BG_SC_PLTT_MASK         =   0xf000      @ カラーパレットＮｏ

BG_SC_CHAR_NO_SHIFT     =   0
BG_SC_FLIP_SHIFT        =   10
BG_SC_PLTT_SHIFT        =   12

BG_SC_H_FLIP            =   0x0400      @ Ｈフリップ
BG_SC_V_FLIP            =   0x0800      @ Ｖフリップ

@--------------------------------------------------------------------
@-                        アフィン変換                              -
@--------------------------------------------------------------------

SIN_SHIFT               =   14
AFFINE_DIV_SHIFT        =   8
AFFINE_REG_SHIFT        =   8
AFFINE_CAL_SHIFT        =   SIN_SHIFT + AFFINE_DIV_SHIFT - AFFINE_REG_SHIFT

@--------------------------------------------------------------------
@-                        ＯＡＭデータ                              -
@--------------------------------------------------------------------

OAM_V_POS_MASK          =   0x000000ff  @ ＯＢＪ Ｘ座標
OAM_H_POS_MASK          =   0x01ff0000  @ ＯＢＪ Ｙ座標
OAM_SHAPE_MASK          =   0x0000c000  @ ＯＢＪ形状
OAM_SIZE_MASK           =   0xc0000000  @ ＯＢＪサイズ
OAM_OBJ_MODE_MASK       =   0x00000c00  @ ＯＢＪモード
OAM_AFFINE_MODE_MASK    =   0x00000300  @ アフィンモード
OAM_AFFINE_NO_MASK      =   0x3e000000  @ アフィン パラメータＮｏ
OAM_FLIP_MASK           =   0x30000000  @ フリップ
OAM_CHAR_NO_MASK        =   0x000003ff  @ キャラクタＮｏ
OAM_PRIORITY_MASK       =   0x00000c00  @ ＢＧ相対優先順位
OAM_PLTT_MASK           =   0x0000f000  @ カラーパレットＮｏ
OAM_AFFINE_PARAM_MASK   =   0xffff0000  @ アフィン パラメータ

OAM_V_POS_SHIFT         =   0
OAM_H_POS_SHIFT         =   16
OAM_SHAPE_SHIFT         =   14
OAM_SIZE_SHIFT          =   30
OAM_AFFINE_MODE_SHIFT   =   8
OAM_OBJ_MODE_SHIFT      =   10
OAM_AFFINE_NO_SHIFT     =   25
OAM_FLIP_SHIFT          =   28
OAM_CHAR_NO_SHIFT       =   0
OAM_PRIORITY_SHIFT      =   10
OAM_PLTT_SHIFT          =   12
OAM_AFFINE_PARAM_SHIFT  =   16

OAM_OBJ_ON              =   0x00000000  @ ＯＢＪ ＯＮ
OAM_OBJ_OFF             =   0x00000200  @ ＯＢＪ ＯＦＦ
OAM_OBJ_NORMAL          =   0x00000000  @ ＯＢＪノーマルモード
OAM_OBJ_BLEND           =   0x00000400  @ ＯＢＪ半透明モード
OAM_OBJ_WINDOW          =   0x00000800  @ ＯＢＪウインドウモード
OAM_AFFINE_NONE         =   0x00000000  @ アフィン無効モード
OAM_AFFINE_NORMAL       =   0x00000100  @ アフィンノーマルモード
OAM_AFFINE_TWICE        =   0x00000300  @ アフィン２倍角モード
OAM_AFFINE_ERASE        =   0x00000200  @ アフィン非表示モード
OAM_MOS_ON              =   0x00001000  @ モザイク ＯＮ
OAM_MOS_OFF             =   0x00000000  @ モザイク ＯＦＦ
OAM_COLOR_16            =   0x00000000  @ １６     選択
OAM_COLOR_256           =   0x00002000  @ ２５６色 選択
OAM_H_FLIP              =   0x10000000  @ Ｈフリップ
OAM_V_FLIP              =   0x20000000  @ Ｖフリップ
OAM_SQUARE              =   0x00000000  @ 正方形ＯＢＪ
OAM_H_RECTANGLE         =   0x00004000  @ 横長方形ＯＢＪ
OAM_V_RECTANGLE         =   0x00008000  @ 縦長方形ＯＢＪ
OAM_SIZE_NO_0           =   0x00000000  @ ＯＢＪ サイズＮｏ ０
OAM_SIZE_NO_1           =   0x40000000  @ ＯＢＪ サイズＮｏ １
OAM_SIZE_NO_2           =   0x80000000  @ ＯＢＪ サイズＮｏ ２
OAM_SIZE_NO_3           =   0xc0000000  @ ＯＢＪ サイズＮｏ ３
OAM_SIZE_8x8            =   0x00000000  @ ＯＢＪ   ８ｘ  ８ドット
OAM_SIZE_16x16          =   0x40000000  @ ＯＢＪ １６ｘ１６ドット
OAM_SIZE_32x32          =   0x80000000  @ ＯＢＪ ３２ｘ３２ドット
OAM_SIZE_64x64          =   0xc0000000  @ ＯＢＪ ６４ｘ６４ドット
OAM_SIZE_16x8           =   0x00004000  @ ＯＢＪ １６ｘ  ８ドット
OAM_SIZE_32x8           =   0x40004000  @ ＯＢＪ ３２ｘ  ８ドット
OAM_SIZE_32x16          =   0x80004000  @ ＯＢＪ ３２ｘ１６ドット
OAM_SIZE_64x32          =   0xc0004000  @ ＯＢＪ ６４ｘ３２ドット
OAM_SIZE_8x16           =   0x00008000  @ ＯＢＪ   ８ｘ１６ドット
OAM_SIZE_8x32           =   0x40008000  @ ＯＢＪ   ８ｘ３２ドット
OAM_SIZE_16x32          =   0x80008000  @ ＯＢＪ １６ｘ３２ドット
OAM_SIZE_32x64          =   0xc0008000  @ ＯＢＪ ３２ｘ６４ドット


@--------------------------------------------------------------------
@-                      カラーパレットデータ                        -
@--------------------------------------------------------------------

PLTT_RED_MASK           =   0x001f      @ 赤
PLTT_GREEN_MASK         =   0x03e0      @ 緑
PLTT_BLUE_MASK          =   0x7c00      @ 青

PLTT_RED_SHIFT          =   0
PLTT_GREEN_SHIFT        =   5
PLTT_BLUE_SHIFT         =   10


@********************************************************************
@*              ＡＧＢレジスタ・コントロールビット                  *
@********************************************************************

@--------------------------------------------------------------------
@-                  プログラムステータスレジスタ                    -
@--------------------------------------------------------------------

PSR_CPU_MODE_MASK       =   0x1f        @ ＣＰＵモード

PSR_USER_MODE           =   0x10        @ ユーザ
PSR_FIQ_MODE            =   0x11        @ ＦＩＱ
PSR_IRQ_MODE            =   0x12        @ ＩＲＱ
PSR_SVC_MODE            =   0x13        @ スーパバイザ
PSR_ABORT_MODE          =   0x17        @ アボート（プリフェッチ／データ）
PSR_UNDEF_MODE          =   0x1b        @ 未定義命令
PSR_SYS_MODE            =   0x1f        @ システム

PSR_THUMB_STATE         =   0x20        @ ＴＨＵＭＢステート
PSR_FIQ_DISABLE         =   0x40        @ ＦＩＱ不許可
PSR_IRQ_DISABLE         =   0x80        @ ＩＲＱ不許可
PSR_IRQ_FIQ_DISABLE     =   0xc0        @ ＩＲＱ＆ＦＩＱ不許可

PSR_V_FLAG              =   0x10000000  @ オーバーフロー
PSR_C_FLAG              =   0x20000000  @ キャリー／ボロー／拡張
PSR_Z_FLAG              =   0x40000000  @ ゼロ
PSR_N_FLAG              =   0x80000000  @ 負／未満


@--------------------------------------------------------------------
@-                  割り込み要求／許可フラグ                        -
@--------------------------------------------------------------------

V_BLANK_INTR_FLAG       =   0x0001      @ Ｖブランク割り込み
H_BLANK_INTR_FLAG       =   0x0002      @ Ｈブランク割り込み
V_COUNT_INTR_FLAG       =   0x0004      @ Ｖカウンタ一致割り込み
TIMER0_INTR_FLAG        =   0x0008      @ タイマー０割り込み
TIMER1_INTR_FLAG        =   0x0010      @ タイマー１割り込み
TIMER2_INTR_FLAG        =   0x0020      @ タイマー２割り込み
TIMER3_INTR_FLAG        =   0x0040      @ タイマー３割り込み
SIO_INTR_FLAG           =   0x0080      @ シリアル通信割り込み
DMA0_INTR_FLAG          =   0x0100      @ ＤＭＡ０割り込み
DMA1_INTR_FLAG          =   0x0200      @ ＤＭＡ１割り込み
DMA2_INTR_FLAG          =   0x0400      @ ＤＭＡ２割り込み
DMA3_INTR_FLAG          =   0x0800      @ ＤＭＡ３割り込み
KEY_INTR_FLAG           =   0x1000      @ キー割り込み
CASSETTE_INTR_FLAG      =   0x2000      @ カセット割り込み


@--------------------------------------------------------------------
@-                      表示コントロール                            -
@--------------------------------------------------------------------

DISP_BG_MODE_MASK       =   0x0007      @ ＢＧモード
DISP_ON_MASK            =   0x1f00      @ ＯＢＪ・ＢＧ ＯＮ
DISP_WIN_MASK           =   0x6000      @ ウインドウ ＯＮ

DISP_BG_MODE_SHIFT      =   0
DISP_ON_SHIFT           =   8
DISP_WIN_SHIFT          =   13

DISP_MODE_0             =   0x0000      @ ＢＧモード０
DISP_MODE_1             =   0x0001      @ ＢＧモード１
DISP_MODE_2             =   0x0002      @ ＢＧモード２
DISP_MODE_3             =   0x0003      @ ＢＧモード３
DISP_MODE_4             =   0x0004      @ ＢＧモード４
DISP_MODE_5             =   0x0005      @ ＢＧモード５
DISP_BMP_FRAME_NO       =   0x0010      @ ビットマップモード 表示フレーム
DISP_OBJ_HOFF           =   0x0020      @ Ｈブランク中ＯＢＪ処理 ＯＦＦ
DISP_OBJ_CHAR_2D_MAP    =   0x0000      @ ＯＢＪキャラクタデータ ２Ｄマッピング
DISP_OBJ_CHAR_1D_MAP    =   0x0040      @ ＯＢＪキャラクタデータ １Ｄマッピング
DISP_LCDC_OFF           =   0x0080      @ ＬＣＤＣ ＯＦＦ
DISP_BG0_ON             =   0x0100      @ ＢＧ０ ＯＮ
DISP_BG1_ON             =   0x0200      @ ＢＧ１ ＯＮ
DISP_BG2_ON             =   0x0400      @ ＢＧ２ ＯＮ
DISP_BG3_ON             =   0x0800      @ ＢＧ３ ＯＮ
DISP_BG_ALL_ON          =   0x0f00      @ ＢＧ全部 ＯＮ
DISP_OBJ_ON             =   0x1000      @ ＯＢＪ ＯＮ
DISP_OBJ_BG_ALL_ON      =   0x1f00      @ ＯＢＪ・ＢＧ全部 ＯＮ
DISP_WIN0_ON            =   0x2000      @ ウインドウ０ ＯＮ
DISP_WIN1_ON            =   0x4000      @ ウインドウ１ ＯＮ
DISP_WIN01_ON           =   0x6000      @ ウインドウ０・１ ＯＮ
DISP_OBJWIN_ON          =   0x8000      @ ＯＢＪウインドウ ＯＮ
DISP_WIN_ALL_ON         =   0xe000      @ ウインドウ全部 ＯＮ
DISP_ALL_ON             =   0x7f00      @ 全部 ＯＮ

@--------------------------------------------------------------------
@-                      ステータスコントロール                      -
@--------------------------------------------------------------------

STAT_VCOUNT_CMP_MASK    =   0xff00      @ Ｖカウンタ比較値

STAT_VCOUNT_CMP_SHIFT   =   8

STAT_V_BLANK            =   0x0001      @ Ｖブランク期間中
STAT_H_BLANK            =   0x0002      @ Ｈブランク期間中
STAT_V_COUNT            =   0x0004      @ Ｖカウンタ一致中
STAT_V_BLANK_IF_ENABLE  =   0x0008      @ Ｖブランク割り込み要求 許可
STAT_H_BLANK_IF_ENABLE  =   0x0010      @ Ｈブランク割り込み要求 許可
STAT_V_COUNT_IF_ENABLE  =   0x0020      @ Ｖカウンタ一致割り込み要求 許可

@--------------------------------------------------------------------
@-                      ＢＧコントロール                            -
@--------------------------------------------------------------------

BG_PRIORITY_MASK        =   0x0003      @ ＢＧ間優先順位
BG_CHAR_BASE_MASK       =   0x000c      @ キャラクタ ベースアドレス
BG_SCREEN_BASE_MASK     =   0x1f00      @ スクリーン ベースアドレス
BG_SCREEN_SIZE_MASK     =   0xc000      @ スクリーンサイズ(256/512)

BG_PRIORITY_SHIFT       =   0
BG_CHAR_BASE_SHIFT      =   2
BG_SCREEN_BASE_SHIFT    =   8
BG_SCREEN_SIZE_SHIFT    =   14

BG_PRIORITY_0           =   0x0000      @ ＢＧ第０優先
BG_PRIORITY_1           =   0x0001      @ ＢＧ第１優先
BG_PRIORITY_2           =   0x0002      @ ＢＧ第２優先
BG_PRIORITY_3           =   0x0003      @ ＢＧ第３優先
BG_MOS_ON               =   0x0040      @ モザイク ＯＮ
BG_MOS_OFF              =   0x0000      @ モザイク ＯＦＦ
BG_COLOR_16             =   0x0000      @ １６色   選択
BG_COLOR_256            =   0x0080      @ ２５６色 選択
BG_LOOP_ON              =   0x2000      @ ループ ＯＮ
BG_LOOP_OFF             =   0x0000      @ ループ ＯＦＦ
BG_SCREEN_SIZE_0        =   0x0000      @ スクリーンサイズ(256x256)
BG_SCREEN_SIZE_1        =   0x4000      @ スクリーンサイズ(512x256)
BG_SCREEN_SIZE_2        =   0x8000      @ スクリーンサイズ(256x512)
BG_SCREEN_SIZE_3        =   0xc000      @ スクリーンサイズ(512x512)

@--------------------------------------------------------------------
@-                      ウインドウ コントロール                     -
@--------------------------------------------------------------------

WIN_END_POS_MASK        =   0x00ff      @ ウインドウ終了点
WIN_START_POS_MASK      =   0xff00      @ ウインドウ開始点

WIN_END_POS_SHIFT       =   0
WIN_START_POS_SHIFT     =   8

WIN_BG0_ON              =   0x0001      @ ＢＧ０ ＯＮ
WIN_BG1_ON              =   0x0002      @ ＢＧ１ ＯＮ
WIN_BG2_ON              =   0x0004      @ ＢＧ２ ＯＮ
WIN_BG3_ON              =   0x0008      @ ＢＧ３ ＯＮ
WIN_OBJ_ON              =   0x0010      @ ＯＢＪ ＯＮ
WIN_BLEND_ON            =   0x0020      @ ブレンド ＯＮ
WIN_ALL_ON              =   0x003f      @ 全部 ＯＮ

@--------------------------------------------------------------------
@-                      モザイク コントロール                       -
@--------------------------------------------------------------------

MOS_H_SIZE_MASK         =   0x000f      @       モザイク高さ
MOS_V_SIZE_MASK         =   0x00f0      @       モザイク幅
MOS_BG_H_SIZE_MASK      =   0x000f      @   ＢＧモザイク高さ
MOS_BG_V_SIZE_MASK      =   0x00f0      @   ＢＧモザイク幅
MOS_OBJ_H_SIZE_MASK     =   0x000f      @ ＯＢＪモザイク高さ
MOS_OBJ_V_SIZE_MASK     =   0x00f0      @ ＯＢＪモザイク幅

MOS_H_SIZE_SHIFT        =   0
MOS_V_SIZE_SHIFT        =   4
MOS_BG_H_SIZE_SHIFT     =   0
MOS_BG_V_SIZE_SHIFT     =   4
MOS_OBJ_H_SIZE_SHIFT    =   8
MOS_OBJ_V_SIZE_SHIFT    =   12

@--------------------------------------------------------------------
@-                      ブレンド コントロール                       -
@--------------------------------------------------------------------

BLD_PIXEL_MASK          =   0x003f      @ ピクセル選択
BLD_1ST_PIXEL_MASK      =   0x003f      @ １ｓｔピクセル選択
BLD_MODE_MASK           =   0x00c0      @ ブレンドモード
BLD_2ND_PIXEL_MASK      =   0x3f00      @ ２ｎｄピクセル選択

BLD_1ST_PIXEL_SHIFT     =   0
BLD_MODE_SHIFT          =   6
BLD_2ND_PIXEL_SHIFT     =   8

BLD_BG0                 =   0x0001      @ ＢＧ０ ピクセル選択
BLD_BG1                 =   0x0002      @ ＢＧ１ ピクセル選択
BLD_BG2                 =   0x0004      @ ＢＧ２ ピクセル選択
BLD_BG3                 =   0x0008      @ ＢＧ３ ピクセル選択
BLD_OBJ                 =   0x0010      @ ＯＢＪ ピクセル選択
BLD_BD                  =   0x0020      @ 背景色 ピクセル選択
BLD_ALL                 =   0x003f      @        ピクセル全選択
BLD_BG0_1ST             =   0x0001      @ ＢＧ０ １ｓｔピクセル選択
BLD_BG1_1ST             =   0x0002      @ ＢＧ１ １ｓｔピクセル選択
BLD_BG2_1ST             =   0x0004      @ ＢＧ２ １ｓｔピクセル選択
BLD_BG3_1ST             =   0x0008      @ ＢＧ３ １ｓｔピクセル選択
BLD_OBJ_1ST             =   0x0010      @ ＯＢＪ １ｓｔピクセル選択
BLD_BD_1ST              =   0x0020      @ 背景色 １ｓｔピクセル選択
BLD_1ST_ALL             =   0x003f      @        １ｓｔピクセル全選択
BLD_NORMAL_MODE         =   0x0000      @ ノーマルモード
BLD_A_BLEND_MODE        =   0x0040      @ 半透明モード
BLD_UP_MODE             =   0x0080      @ 輝度ＵＰモード
BLD_DOWN_MODE           =   0x00c0      @ 輝度ＤＯＷＮモード
BLD_BG0_2ND             =   0x0100      @ ＢＧ０ ２ｎｄピクセル選択
BLD_BG1_2ND             =   0x0200      @ ＢＧ１ ２ｎｄピクセル選択
BLD_BG2_2ND             =   0x0400      @ ＢＧ２ ２ｎｄピクセル選択
BLD_BG3_2ND             =   0x0800      @ ＢＧ３ ２ｎｄピクセル選択
BLD_OBJ_2ND             =   0x1000      @ ＯＢＪ ２ｎｄピクセル選択
BLD_BD_2ND              =   0x2000      @ 背景色 ２ｎｄピクセル選択
BLD_2ND_ALL             =   0x3f00      @        ２ｎｄピクセル全選択


BLD_A_MASK              =   0x001f      @ ブレンド変数 Ａ
BLD_B_MASK              =   0x1f00      @ ブレンド変数 Ｂ
BLD_Y_MASK              =   0x001f      @ ブレンド変数 Ｙ

BLD_A_SHIFT             =   16
BLD_B_SHIFT             =   24
BLD_Y_SHIFT             =   0


@--------------------------------------------------------------------
@-                      サウンド コントロール                       -
@--------------------------------------------------------------------

SOUND_SO1_LEVEL_MASK    =   0x03        @ ＳＯ１出力レベル
SOUND_SO2_LEVEL_MASK    =   0x30        @ ＳＯ２出力レベル
SOUND_DMG_SO1_ON_MASK   =   0x0f        @ ＤＭＧ互換サウンド→ＳＯ１ ＯＮ
SOUND_DMG_SO2_ON_MASK   =   0xf0        @ ＤＭＧ互換サウンド→ＳＯ２ ＯＮ

SOUND_SWEEP_SHIFT_MASK  =   0x03        @ スイープ シフト数
SOUND_SWEEP_TIME_MASK   =   0x30        @ スイープ 時間
SOUND_COUNTS_MASK       =   0x3f        @ 音の長さ(カウント数)
SOUND_DUTY_MASK         =   0xc0        @ 波形のデューティ
SOUND_ENV_STEPS_MASK    =   0x03        @ エンベロープ ステップ数
SOUND_ENV_INIT_MASK     =   0xf0        @ エンベロープ 初期値
SOUND_FREQUENCY_MASK    =   0x03ff      @ 周波数
SOUND_FREQUENCY_L_MASK  =   0xff
SOUND_FREQUENCY_H_MASK  =   0x03

SOUND_3_COUNTS_MASK     =   0xff        @ サウンド３ 音の長さ(カウント数)
SOUND_3_LEVEL_MASK      =   0xe0        @            出力レベル

SOUND_4_PRESCALER_MASK  =   0x03        @ サウンド４ プリスケーラ選択
SOUND_4_POLYSHIFT_MASK  =   0xf0        @            ポリノミカル・カウンタ シフト数


SOUND_SO1_LEVEL_SHIFT   =   0
SOUND_SO2_LEVEL_SHIFT   =   4
SOUND_DMG_SO1_ON_SHIFT  =   0
SOUND_DMG_SO2_ON_SHIFT  =   4

SOUND_SWEEP_SHIFT_SHIFT =   0
SOUND_SWEEP_TIME_SHIFT  =   4
SOUND_COUNTS_SHIFT      =   0
SOUND_DUTY_SHIFT        =   6
SOUND_ENV_STEPS_SHIFT   =   0
SOUND_ENV_INIT_SHIFT    =   4
SOUND_FREQUENCY_SHIFT   =   0
SOUND_FREQUENCY_L_SHIFT =   0
SOUND_FREQUENCY_H_SHIFT =   8

SOUND_3_COUNTS_SHIFT    =   0
SOUND_3_LEVEL_SHIFT     =   5

SOUND_4_PRESCALER_SHIFT =   0
SOUND_4_POLYSHIFT_SHIFT =   4


SOUND_1_ON              =   0x01        @ サウンド１ ＯＮ
SOUND_2_ON              =   0x02        @ サウンド２ ＯＮ
SOUND_3_ON              =   0x04        @ サウンド３ ＯＮ
SOUND_4_ON              =   0x08        @ サウンド４ ＯＮ
SOUND_DMG_ON            =   0x80        @ ＤＭＧ互換サウンド ＯＮ

SOUND_1_SO1_ON          =   0x01        @ サウンド１→ＳＯ１ ＯＮ
SOUND_2_SO1_ON          =   0x02        @ サウンド２→ＳＯ１ ＯＮ
SOUND_3_SO1_ON          =   0x04        @ サウンド３→ＳＯ１ ＯＮ
SOUND_4_SO1_ON          =   0x08        @ サウンド４→ＳＯ１ ＯＮ
SOUND_1_SO2_ON          =   0x10        @ サウンド１→ＳＯ２ ＯＮ
SOUND_2_SO2_ON          =   0x20        @ サウンド２→ＳＯ２ ＯＮ
SOUND_3_SO2_ON          =   0x40        @ サウンド３→ＳＯ２ ＯＮ
SOUND_4_SO2_ON          =   0x80        @ サウンド４→ＳＯ２ ＯＮ
SOUND_DMG_ALL_SO1_ON    =   0x0f        @ ＤＭＧ互換サウンド→ＳＯ１ ＯＮ
SOUND_DMG_ALL_SO2_ON    =   0xf0        @ ＤＭＧ互換サウンド→ＳＯ２ ＯＮ
SOUND_DMG_ALL_SO_ON     =   0xff        @ ＤＭＧ互換サウンド→ＳＯ１／２ ＯＮ
SOUND_VIN_SO1_ON        =   0x80        @ Ｖｉｎ→ＳＯ１ ＯＮ
SOUND_VIN_SO2_ON        =   0x08        @ Ｖｉｎ→ＳＯ２ ＯＮ
SOUND_VIN_SO_ON         =   0x08        @ Ｖｉｎ→ＳＯ１／２ ＯＮ

SOUND_A_SO1_ON          =   0x01        @ ダイレクトサウンドＡ→ＳＯ１ ＯＮ
SOUND_A_SO2_ON          =   0x02        @ ダイレクトサウンドＡ→ＳＯ２ ＯＮ
SOUND_B_SO1_ON          =   0x10        @ ダイレクトサウンドＢ→ＳＯ１ ＯＮ
SOUND_B_SO2_ON          =   0x20        @ ダイレクトサウンドＢ→ＳＯ２ ＯＮ
SOUND_A_ALL_SO_ON       =   0x03        @ ダイレクトサウンドＡ→ＳＯ１／２ ＯＮ
SOUND_B_ALL_SO_ON       =   0x30        @ ダイレクトサウンドＢ→ＳＯ１／２ ＯＮ
SOUND_DIRECT_ALL_SO1_ON =   0x11        @ ダイレクトサウンドＡ／Ｂ→ＳＯ１ ＯＮ
SOUND_DIRECT_ALL_SO2_ON =   0x22        @ ダイレクトサウンドＡ／Ｂ→ＳＯ２ ＯＮ
SOUND_DIRECT_ALL_SO_ON  =   0x33        @ ダイレクトサウンドＡ／Ｂ→ＳＯ１／２ ＯＮ
SOUND_A_TIMER_0         =   0x00        @ タイマー０→ダイレクトサウンドＡ
SOUND_A_TIMER_1         =   0x04        @ タイマー１→ダイレクトサウンドＡ
SOUND_B_TIMER_0         =   0x00        @ タイマー０→ダイレクトサウンドＢ
SOUND_B_TIMER_1         =   0x40        @ タイマー１→ダイレクトサウンドＢ
SOUND_A_FIFO_RESET      =   0x08        @ ダイレクトサウンドＡ用ＦＩＦＯ リセット
SOUND_B_FIFO_RESET      =   0x80        @ ダイレクトサウンドＢ用ＦＩＦＯ リセット

SOUND_DMG_MIX_1_4       =   0x00        @   ＤＭＧ互換サウンド合成比 １／４
SOUND_DMG_MIX_2_4       =   0x01        @                            ２／４
SOUND_DMG_MIX_FULL      =   0x02        @                            フルレンジ
SOUND_A_MIX_1_2         =   0x00        @ ダイレクトサウンドＡ合成比 １／２
SOUND_A_MIX_FULL        =   0x04        @                            フルレンジ
SOUND_B_MIX_1_2         =   0x00        @ ダイレクトサウンドＢ合成比 １／２
SOUND_B_MIX_FULL        =   0x08        @                            フルレンジ
SOUND_ALL_MIX_FULL      =   0x0e        @           全サウンド合成比 フルレンジ


SOUND_INIT_ON           =   0x80        @ イニシャル ＯＮ
SOUND_INIT_OFF          =   0x00        @ イニシャル ＯＮ
SOUND_COUNTER_ON        =   0x40        @   カウンタ ＯＮ
SOUND_COUNTER_OFF       =   0x00        @   カウンタ ＯＦＦ

SOUND_SWEEP_UP          =   0x00        @ スイープ 加算
SOUND_SWEEP_DOWN        =   0x08        @          減算
SOUND_DUTY_1_8          =   0x00        @ 波形のデューティ １／８
SOUND_DUTY_2_8          =   0x40        @                  ２／８
SOUND_DUTY_4_8          =   0x80        @                  ４／８
SOUND_DUTY_6_8          =   0xc0        @                  ６／８
SOUND_ENV_UP            =   0x08        @ エンベロープ ＵＰ
SOUND_ENV_DOWN          =   0x00        @              ＤＯＷＮ

SOUND_3_LOCAL_ON        =   0x80        @ サウンド３ ＯＮ
SOUND_3_WAVE_BANK_0     =   0x00        @ サウンド３ 波形ＲＡＭ バンク０
SOUND_3_WAVE_BANK_1     =   0x40        @                       バンク１
SOUND_3_WAVE_CONNECT    =   0x20        @ サウンド３ 波形ＲＡＭ 接続
SOUND_3_WAVE_DISCONNECT =   0x00        @                       非接続
SOUND_3_LEVEL_0_4       =   0x00        @ サウンド３ 出力 なし
SOUND_3_LEVEL_FULL      =   0x20        @                 ４／４
SOUND_3_LEVEL_2_4       =   0x40        @                 ２／４
SOUND_3_LEVEL_1_4       =   0x60        @                 １／４
SOUND_3_LEVEL_3_4       =   0x80        @                 ３／４

SOUND_4_POLYSTEP_15     =   0x00        @ サウンド４ ポリノミカル・カウンタ １５段
SOUND_4_POLYSTEP_7      =   0x08        @                                     ７段


@--------------------------------------------------------------------
@-                      ＳＩＯコントロール                          -
@--------------------------------------------------------------------

SIO_MODE_MASK           =   0x3000      @ 通信モード
SIO_BAUD_RATE_MASK      =   0x0003      @ ボーレート
SIO_ID_NO_MASK          =   0x0030      @ 通信ＩＤ

SIO_MODE_SHIFT          =   12
SIO_BAUD_RATE_SHIFT     =   0
SIO_ID_NO_SHIFT         =   4

SIO_8BIT_MODE           =   0x0000      @ ノーマル８ビット通信モード
SIO_32BIT_MODE          =   0x1000      @ ノーマル３２ビット通信モード
SIO_MULTI_MODE          =   0x2000      @ マルチプレイ通信モード
SIO_UART_MODE           =   0x3000      @ ＵＡＲＴ通信モード

SIO_SCK_OUT             =   0x0000      @ 外部クロック選択
SIO_SCK_IN              =   0x0001      @ 内部クロック選択
SIO_IN_SCK_256K         =   0x0000      @ 内部クロック ２５６ＫＨｚ選択
SIO_IN_SCK_2M           =   0x0002      @                  ２ＭＨｚ選択
SIO_ACK_RECV            =   0x0004      @ 転送要求
SIO_ACK_SEND            =   0x0008      @ 転送許可
SIO_9600_BPS            =   0x0000      @ ボーレート ９６００ＢＰＳ
SIO_38400_BPS           =   0x0001      @          ３８４００ＢＰＳ
SIO_57600_BPS           =   0x0002      @          ５７６００ＢＰＳ
SIO_115200_BPS          =   0x0003      @        １１５２００ＢＰＳ
SIO_MULTI_CONNECT       =   0x0004      @ マルチプレイ通信 接続中
SIO_MULTI_DISCONNECT    =   0x0000      @                  非接続
SIO_MULTI_PARENT        =   0x0008      @ マルチプレイ通信 親接続
SIO_MULTI_CHILD         =   0x0000      @                  子接続
SIO_MULTI_SI            =   0x0004      @ マルチプレイ通信 ＳＩ端子
SIO_MULTI_SD            =   0x0008      @                  ＳＤ端子
SIO_MULTI_BUSY          =   0x0080      @ マルチプレイ通信中
SIO_CTS_ENABLE          =   0x0004      @ ＵＡＲＴ送信可能信号  イネーブル
SIO_UART_7BIT           =   0x0000      @ ＵＡＲＴ通信 データ長 ７ｂｉｔ
SIO_UART_8BIT           =   0x0080      @                       ８ｂｉｔ
SIO_ERROR               =   0x0040      @ エラー検出
SIO_START               =   0x0080      @ 転送スタート
SIO_ENABLE              =   0x0080      @ ＳＩＯ許可
SIO_FIFO_ENABLE         =   0x0100      @ ＦＩＦＯ イネーブル
SIO_PARITY_ENABLE       =   0x0200      @ パリティ イネーブル
SIO_PARITY_EVEN         =   0x0000      @ 偶数パリティ
SIO_PARITY_ODD          =   0x0008      @ 奇数パリティ
SIO_TRANS_ENABLE        =   0x0400      @ トランスミッタ イネーブル
SIO_TRANS_DATA_FULL     =   0x0010      @ トランスミットデータ 満杯
SIO_RECV_ENABLE         =   0x0800      @ レシーバ イネーブル
SIO_RECV_DATA_EMPTY     =   0x0020      @ レシーブデータ 無し
SIO_IF_ENABLE           =   0x4000      @ 割り込み要求 許可

@--------------------------------------------------------------------
@-                      ＪＯＹバス コントロール                     -
@--------------------------------------------------------------------

JOY_IF_RESET            =   0x01        @ ＪＯＹバス・リセット 割り込み要求
JOY_IF_RECV             =   0x02        @ ＪＯＹバス受信完了   割り込み要求
JOY_IF_SEND             =   0x04        @ ＪＯＹバス送信完了   割り込み要求
JOY_IF_ENABLE           =   0x40        @ 割り込み要求 許可

@--------------------------------------------------------------------
@-                      ＪＯＹバス ステータス                       -
@--------------------------------------------------------------------

JSTAT_FLAGS_MASK        =   0x30        @ 汎用フラグ

JSTAT_FLAGS_SHIFT       =   4

JSTAT_PSF0              =   0x10        @ 汎用フラグ０
JSTAT_PSF1              =   0x20        @           １

JSTAT_RECV              =   0x02        @ 受信ステータス
JSTAT_SEND              =   0x08        @ 送信ステータス

@--------------------------------------------------------------------
@-                      汎用入出力コントロール                      -
@--------------------------------------------------------------------

R_SIO_MODE_MASTER_MASK  =   0xc000      @ ＳＩＯモード・マスタ

R_SIO_MODE_MASTER_SHIFT =   14

R_SIO_MASTER_MODE       =   0x0000      @ ＳＩＯマスタ・モード
R_DIRECT_MODE           =   0x8000      @ 汎用入出力通信モード
R_JOY_MODE              =   0xc000      @ ＪＯＹ通信モード

R_SC                    =   0x0001      @ データ
R_SD                    =   0x0002
R_SI                    =   0x0004
R_SO                    =   0x0008
R_SC_I_O                =   0x0010      @ Ｉ/Ｏ選択
R_SD_I_O                =   0x0020
R_SI_I_O                =   0x0040
R_SO_I_O                =   0x0080
R_SC_IN                 =   0x0000      @ 入力設定
R_SD_IN                 =   0x0000
R_SI_IN                 =   0x0000
R_SO_IN                 =   0x0000
R_SC_OUT                =   0x0010      @ 出力設定
R_SD_OUT                =   0x0020
R_SI_OUT                =   0x0040
R_SO_OUT                =   0x0080
R_IF_ENABLE             =   0x0100      @ 割り込み要求 許可


@--------------------------------------------------------------------
@-                      ＤＭＡコントロール                          -
@--------------------------------------------------------------------

DMA_TIMMING_MASK        =   0x30000000  @ 開始タイミング
DMA_COUNT_MASK          =   0x0000ffff  @ 転送数

DMA_TIMMING_SHIFT       =   30
DMA_COUNT_SHIFT         =   0

DMA_ENABLE              =   0x80000000  @ ＤＭＡ許可
DMA_IF_ENABLE           =   0x40000000  @ 割り込み要求 許可
DMA_TIMMING_IMM         =   0x00000000  @ 直ちに起動
DMA_TIMMING_V_BLANK     =   0x10000000  @ Ｖブランク起動
DMA_TIMMING_H_BLANK     =   0x20000000  @ Ｈブランク起動
DMA_TIMMING_DISP        =   0x30000000  @ 表示起動
DMA_TIMMING_SOUND       =   0x30000000  @ サウンドＦＩＦＯリクエスト起動
DMA_DREQ_ON             =   0x08000000  @ データ要求同期モード ＯＮ
DMA_16BIT_BUS           =   0x00000000  @ バスサイズ１６Ｂｉｔ選択
DMA_32BIT_BUS           =   0x04000000  @ バスサイズ３２Ｂｉｔ選択
DMA_CONTINUOUS_ON       =   0x02000000  @ コンティニュアスモード ＯＮ
DMA_SRC_INC             =   0x00000000  @ 転送元 インクリメント 選択
DMA_SRC_DEC             =   0x00800000  @ 転送元 デクリメント   選択
DMA_SRC_FIX             =   0x01000000  @ 転送元 固定 選択
DMA_DEST_INC            =   0x00000000  @ 転送先 インクリメント 選択
DMA_DEST_DEC            =   0x00200000  @ 転送先 デクリメント   選択
DMA_DEST_FIX            =   0x00400000  @ 転送先 固定 選択
DMA_DEST_RELOAD         =   0x00600000  @ 転送先 インクリメント/リロード 選択

@--------------------------------------------------------------------
@-                      タイマー コントロール                       -
@--------------------------------------------------------------------

TMR_PRESCALER_MASK      =   0x00030000  @ プリスケーラ クロック

TMR_PRESCALER_SHIFT     =   16

TMR_PRESCALER_1CK       =   0x00000000  @ プリスケーラ １分周
TMR_PRESCALER_64CK      =   0x00010000  @           ６４分周
TMR_PRESCALER_256CK     =   0x00020000  @         ２５６分周
TMR_PRESCALER_1024CK    =   0x00030000  @       １０２４分周
TMR_IF_ENABLE           =   0x00400000  @ 割り込み要求 許可
TMR_ENABLE              =   0x00800000  @ タイマー起動


@--------------------------------------------------------------------
@-                          キー                                    -
@--------------------------------------------------------------------

BUTTON_MASK             =   0x030f      @ ボタン
PLUS_KEY_MASK           =   0x00f0      @ 十字キー
ALL_KEY_MASK            =   0x03ff      @ 全てのキー

A_BUTTON                =   0x0001      @ Ａボタン
B_BUTTON                =   0x0002      @ Ｂボタン
SELECT_BUTTON           =   0x0004      @ セレクトボタン
START_BUTTON            =   0x0008      @ スタートボタン
R_KEY                   =   0x0010      @ 右ボタン
L_KEY                   =   0x0020      @ 左ボタン
U_KEY                   =   0x0040      @ 上ボタン
D_KEY                   =   0x0080      @ 下ボタン
R_BUTTON                =   0x0100      @ Ｒボタン
L_BUTTON                =   0x0200      @ Ｌボタン
KEY_IF_ENABLE           =   0x4000      @ 割り込み要求 許可
KEY_OR_INTR             =   0x0000      @   通常キー割り込み
KEY_AND_INTR            =   0x8000      @ ＡＮＤキー割り込み


@--------------------------------------------------------------------
@-                  カセットウェイト コントロール                   -
@--------------------------------------------------------------------

CST_SRAM_4WAIT          =   0x0000      @ ＳＲＡＭ ４ウェイト
CST_SRAM_3WAIT          =   0x0001      @          ３ウェイト
CST_SRAM_2WAIT          =   0x0002      @          ２ウェイト
CST_SRAM_8WAIT          =   0x0003      @          ８ウェイト
CST_ROM0_1ST_4WAIT      =   0x0000      @ ＲＯＭ０ １ｓｔ ４ウェイト
CST_ROM0_1ST_3WAIT      =   0x0004      @                    ３ウェイト
CST_ROM0_1ST_2WAIT      =   0x0008      @                    ２ウェイト
CST_ROM0_1ST_8WAIT      =   0x000c      @                    ８ウェイト
CST_ROM0_2ND_2WAIT      =   0x0000      @             ２ｎｄ ２ウェイト
CST_ROM0_2ND_1WAIT      =   0x0010      @                    １ウェイト
CST_ROM1_1ST_4WAIT      =   0x0000      @ ＲＯＭ１ １ｓｔ ４ウェイト
CST_ROM1_1ST_3WAIT      =   0x0020      @                    ３ウェイト
CST_ROM1_1ST_2WAIT      =   0x0040      @                    ２ウェイト
CST_ROM1_1ST_8WAIT      =   0x0060      @                    ８ウェイト
CST_ROM1_2ND_4WAIT      =   0x0000      @             ２ｎｄ ４ウェイト
CST_ROM1_2ND_1WAIT      =   0x0080      @                    １ウェイト
CST_ROM2_1ST_4WAIT      =   0x0000      @ ＲＯＭ２ １ｓｔ ４ウェイト
CST_ROM2_1ST_3WAIT      =   0x0100      @                    ３ウェイト
CST_ROM2_1ST_2WAIT      =   0x0200      @                    ２ウェイト
CST_ROM2_1ST_8WAIT      =   0x0300      @                    ８ウェイト
CST_ROM2_2ND_8WAIT      =   0x0000      @             ２ｎｄ ８ウェイト
CST_ROM2_2ND_1WAIT      =   0x0400      @                 １ウェイト

CST_PHI_OUT_NONE        =   0x0000      @ φ端子出力クロック Ｌｏ固定
CST_PHI_OUT_4MCK        =   0x0800      @                ４ＭＨｚ
CST_PHI_OUT_8MCK        =   0x1000      @                ８ＭＨｚ
CST_PHI_OUT_16MCK       =   0x1800      @              １６ＭＨｚ
CST_PREFETCH_ENABLE     =   0x4000      @ プリフェッチバッファ 許可
CST_AGB                 =   0x0000      @ ＡＧＢカセット
CST_CGB                 =   0x8000      @ ＣＧＢカセット


