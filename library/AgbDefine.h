/********************************************************************/
/*          AgbDefine.h                                             */
/*            AGB標準定数                                           */
/*                                                                  */
/*          Copyright (C) 1999-2001 NINTENDO Co.,Ltd.               */
/********************************************************************/
#ifndef _AGB_DEFINE_H
#define _AGB_DEFINE_H

#ifdef __cplusplus
extern "C" {
#endif


/*------------------------------------------------------------------*/
/*                            定数                                  */
/*------------------------------------------------------------------*/

#define ON                      1
#define OFF                     0
#define ENABLE                  1
#define DISABLE                 0
#define TRUE                    1
#define FALSE                   0

#define LCD_WIDTH               240                 // 画面幅
#define LCD_HEIGHT              160                 // 画面高さ

#define SYSTEM_CLOCK           (16 * 1024 * 1024)   // システムクロック


/*------------------------------------------------------------------*/
/*                レジスタ＆ＲＡＭ リセット システムコール          */
/*------------------------------------------------------------------*/

#define RESET_ALL_FLAG          0xff        // 全リセット

#define RESET_ALL_REG_FLAG      0xe0        // 全レジスタ リセット

#define RESET_REG_FLAG          0x80        // レジスタ（下記以外）リセット
#define RESET_REG_SOUND_FLAG    0x40        // サウンドレジスタ    リセット
#define RESET_REG_SIO_FLAG      0x20        // ＳＩＯレジスタ      リセット

#define RESET_ALL_RAM_FLAG      0x1f        // 全ＲＡＭ クリア

#define RESET_EX_WRAM_FLAG      0x01        // ＣＰＵ外部ＲＡＭ  クリア
#define RESET_CPU_WRAM_FLAG     0x02        // ＣＰＵ内部ＲＡＭ  クリア
#define RESET_PLTT_FLAG         0x04        // パレット          クリア
#define RESET_VRAM_FLAG         0x08        // ＶＲＡＭ          クリア
#define RESET_OAM_FLAG          0x10        // ＯＡＭ            クリア


/*------------------------------------------------------------------*/
/*                    ＢＧスクリーンデータ                          */
/*------------------------------------------------------------------*/

#define BG_SC_CHAR_NO_MASK      0x03ff      // キャラクタＮｏ
#define BG_SC_FLIP_MASK         0x0c00      // フリップ
#define BG_SC_PLTT_MASK         0xf000      // カラーパレットＮｏ

#define BG_SC_CHAR_NO_SHIFT     0
#define BG_SC_FLIP_SHIFT        10
#define BG_SC_PLTT_SHIFT        12

#define BG_SC_H_FLIP            0x0400      // Ｈフリップ
#define BG_SC_V_FLIP            0x0800      // Ｖフリップ

/*------------------------------------------------------------------*/
/*                        アフィン変換                              */
/*------------------------------------------------------------------*/

#define SIN_SHIFT               14
#define AFFINE_DIV_SHIFT        8
#define AFFINE_REG_SHIFT        8
#define AFFINE_CAL_SHIFT        (SIN_SHIFT + AFFINE_DIV_SHIFT - AFFINE_REG_SHIFT)

/*------------------------------------------------------------------*/
/*                        ＯＡＭデータ                              */
/*------------------------------------------------------------------*/

#define OAM_V_POS_MASK          0x000000ff  // ＯＢＪ Ｘ座標
#define OAM_H_POS_MASK          0x01ff0000  // ＯＢＪ Ｙ座標
#define OAM_SHAPE_MASK          0x0000c000  // ＯＢＪ形状
#define OAM_SIZE_MASK           0xc0000000  // ＯＢＪサイズ
#define OAM_OBJ_MODE_MASK       0x00000c00  // ＯＢＪモード
#define OAM_AFFINE_MODE_MASK    0x00000300  // アフィンモード
#define OAM_AFFINE_NO_MASK      0x3e000000  // アフィン パラメータＮｏ
#define OAM_FLIP_MASK           0x30000000  // フリップ
#define OAM_CHAR_NO_MASK        0x000003ff  // キャラクタＮｏ
#define OAM_PRIORITY_MASK       0x00000c00  // ＢＧ相対優先順位
#define OAM_PLTT_MASK           0x0000f000  // カラーパレットＮｏ
#define OAM_AFFINE_PARAM_MASK   0xffff0000  // アフィン パラメータ

#define OAM_V_POS_SHIFT         0
#define OAM_H_POS_SHIFT         16
#define OAM_SHAPE_SHIFT         14
#define OAM_SIZE_SHIFT          30
#define OAM_AFFINE_MODE_SHIFT   8
#define OAM_OBJ_MODE_SHIFT      10
#define OAM_AFFINE_NO_SHIFT     25
#define OAM_FLIP_SHIFT          28
#define OAM_CHAR_NO_SHIFT       0
#define OAM_PRIORITY_SHIFT      10
#define OAM_PLTT_SHIFT          12
#define OAM_AFFINE_PARAM_SHIFT  16

#define OAM_OBJ_ON              0x00000000  // ＯＢＪ ＯＮ
#define OAM_OBJ_OFF             0x00000200  // ＯＢＪ ＯＦＦ
#define OAM_OBJ_NORMAL          0x00000000  // ＯＢＪノーマルモード
#define OAM_OBJ_BLEND           0x00000400  // ＯＢＪ半透明モード
#define OAM_OBJ_WINDOW          0x00000800  // ＯＢＪウインドウモード
#define OAM_AFFINE_NONE         0x00000000  // アフィン無効モード
#define OAM_AFFINE_NORMAL       0x00000100  // アフィンノーマルモード
#define OAM_AFFINE_TWICE        0x00000300  // アフィン２倍角モード
#define OAM_AFFINE_ERASE        0x00000200  // アフィン非表示モード
#define OAM_MOS_ON              0x00001000  // モザイク ＯＮ
#define OAM_MOS_OFF             0x00000000  // モザイク ＯＦＦ
#define OAM_COLOR_16            0x00000000  // １６     選択
#define OAM_COLOR_256           0x00002000  // ２５６色 選択
#define OAM_H_FLIP              0x10000000  // Ｈフリップ
#define OAM_V_FLIP              0x20000000  // Ｖフリップ
#define OAM_SQUARE              0x00000000  // 正方形ＯＢＪ
#define OAM_H_RECTANGLE         0x00004000  // 横長方形ＯＢＪ
#define OAM_V_RECTANGLE         0x00008000  // 縦長方形ＯＢＪ
#define OAM_SIZE_NO_0           0x00000000  // ＯＢＪ サイズＮｏ ０
#define OAM_SIZE_NO_1           0x40000000  // ＯＢＪ サイズＮｏ １
#define OAM_SIZE_NO_2           0x80000000  // ＯＢＪ サイズＮｏ ２
#define OAM_SIZE_NO_3           0xc0000000  // ＯＢＪ サイズＮｏ ３
#define OAM_SIZE_8x8            0x00000000  // ＯＢＪ   ８ｘ  ８ドット
#define OAM_SIZE_16x16          0x40000000  // ＯＢＪ １６ｘ１６ドット
#define OAM_SIZE_32x32          0x80000000  // ＯＢＪ ３２ｘ３２ドット
#define OAM_SIZE_64x64          0xc0000000  // ＯＢＪ ６４ｘ６４ドット
#define OAM_SIZE_16x8           0x00004000  // ＯＢＪ １６ｘ  ８ドット
#define OAM_SIZE_32x8           0x40004000  // ＯＢＪ ３２ｘ  ８ドット
#define OAM_SIZE_32x16          0x80004000  // ＯＢＪ ３２ｘ１６ドット
#define OAM_SIZE_64x32          0xc0004000  // ＯＢＪ ６４ｘ３２ドット
#define OAM_SIZE_8x16           0x00008000  // ＯＢＪ   ８ｘ１６ドット
#define OAM_SIZE_8x32           0x40008000  // ＯＢＪ   ８ｘ３２ドット
#define OAM_SIZE_16x32          0x80008000  // ＯＢＪ １６ｘ３２ドット
#define OAM_SIZE_32x64          0xc0008000  // ＯＢＪ ３２ｘ６４ドット


/*------------------------------------------------------------------*/
/*                      カラーパレットデータ                        */
/*------------------------------------------------------------------*/

#define PLTT_RED_MASK           0x001f      // 赤
#define PLTT_GREEN_MASK         0x03e0      // 緑
#define PLTT_BLUE_MASK          0x7c00      // 青

#define PLTT_RED_SHIFT          0
#define PLTT_GREEN_SHIFT        5
#define PLTT_BLUE_SHIFT         10


/********************************************************************/
/*              ＡＧＢレジスタ・コントロールビット                  */
/********************************************************************/

/*------------------------------------------------------------------*/
/*                  プログラムステータスレジスタ                    */
/*------------------------------------------------------------------*/

#define PSR_CPU_MODE_MASK       0x1f        // ＣＰＵモード

#define PSR_USER_MODE           0x10        // ユーザ
#define PSR_FIQ_MODE            0x11        // ＦＩＱ
#define PSR_IRQ_MODE            0x12        // ＩＲＱ
#define PSR_SVC_MODE            0x13        // スーパバイザ
#define PSR_ABORT_MODE          0x17        // アボート（プリフェッチ／データ）
#define PSR_UNDEF_MODE          0x1b        // 未定義命令
#define PSR_SYS_MODE            0x1f        // システム

#define PSR_THUMB_STATE         0x20        // ＴＨＵＭＢステート
#define PSR_FIQ_DISABLE         0x40        // ＦＩＱ不許可
#define PSR_IRQ_DISABLE         0x80        // ＩＲＱ不許可
#define PSR_IRQ_FIQ_DISABLE     0xc0        // ＩＲＱ＆ＦＩＱ不許可

#define PSR_V_FLAG              0x10000000  // オーバーフロー
#define PSR_C_FLAG              0x20000000  // キャリー／ボロー／拡張
#define PSR_Z_FLAG              0x40000000  // ゼロ
#define PSR_N_FLAG              0x80000000  // 負／未満


/*------------------------------------------------------------------*/
/*                  割り込み要求／許可フラグ                        */
/*------------------------------------------------------------------*/

#define V_BLANK_INTR_FLAG       0x0001      // Ｖブランク割り込み
#define H_BLANK_INTR_FLAG       0x0002      // Ｈブランク割り込み
#define V_COUNT_INTR_FLAG       0x0004      // Ｖカウンタ一致割り込み
#define TIMER0_INTR_FLAG        0x0008      // タイマー０割り込み
#define TIMER1_INTR_FLAG        0x0010      // タイマー１割り込み
#define TIMER2_INTR_FLAG        0x0020      // タイマー２割り込み
#define TIMER3_INTR_FLAG        0x0040      // タイマー３割り込み
#define SIO_INTR_FLAG           0x0080      // シリアル通信割り込み
#define DMA0_INTR_FLAG          0x0100      // ＤＭＡ０割り込み
#define DMA1_INTR_FLAG          0x0200      // ＤＭＡ１割り込み
#define DMA2_INTR_FLAG          0x0400      // ＤＭＡ２割り込み
#define DMA3_INTR_FLAG          0x0800      // ＤＭＡ３割り込み
#define KEY_INTR_FLAG           0x1000      // キー割り込み
#define CASSETTE_INTR_FLAG      0x2000      // カセット割り込み


/*------------------------------------------------------------------*/
/*                      表示コントロール                            */
/*------------------------------------------------------------------*/

#define DISP_BG_MODE_MASK       0x0007      // ＢＧモード
#define DISP_ON_MASK            0x1f00      // ＯＢＪ・ＢＧ ＯＮ
#define DISP_WIN_MASK           0x6000      // ウインドウ ＯＮ

#define DISP_BG_MODE_SHIFT      0
#define DISP_ON_SHIFT           8
#define DISP_WIN_SHIFT          13

#define DISP_MODE_0             0x0000      // ＢＧモード０
#define DISP_MODE_1             0x0001      // ＢＧモード１
#define DISP_MODE_2             0x0002      // ＢＧモード２
#define DISP_MODE_3             0x0003      // ＢＧモード３
#define DISP_MODE_4             0x0004      // ＢＧモード４
#define DISP_MODE_5             0x0005      // ＢＧモード５
#define DISP_BMP_FRAME_NO       0x0010      // ビットマップモード 表示フレーム
#define DISP_OBJ_HOFF           0x0020      // Ｈブランク中ＯＢＪ処理 ＯＦＦ
#define DISP_OBJ_CHAR_2D_MAP    0x0000      // ＯＢＪキャラクタデータ ２Ｄマッピング
#define DISP_OBJ_CHAR_1D_MAP    0x0040      // ＯＢＪキャラクタデータ １Ｄマッピング
#define DISP_LCDC_OFF           0x0080      // ＬＣＤＣ ＯＦＦ
#define DISP_BG0_ON             0x0100      // ＢＧ０ ＯＮ
#define DISP_BG1_ON             0x0200      // ＢＧ１ ＯＮ
#define DISP_BG2_ON             0x0400      // ＢＧ２ ＯＮ
#define DISP_BG3_ON             0x0800      // ＢＧ３ ＯＮ
#define DISP_BG_ALL_ON          0x0f00      // ＢＧ全部 ＯＮ
#define DISP_OBJ_ON             0x1000      // ＯＢＪ ＯＮ
#define DISP_OBJ_BG_ALL_ON      0x1f00      // ＯＢＪ・ＢＧ全部 ＯＮ
#define DISP_WIN0_ON            0x2000      // ウインドウ０ ＯＮ
#define DISP_WIN1_ON            0x4000      // ウインドウ１ ＯＮ
#define DISP_WIN01_ON           0x6000      // ウインドウ０・１ ＯＮ
#define DISP_OBJWIN_ON          0x8000      // ＯＢＪウインドウ ＯＮ
#define DISP_WIN_ALL_ON         0xe000      // ウインドウ全部 ＯＮ
#define DISP_ALL_ON             0x7f00      // 全部 ＯＮ

/*------------------------------------------------------------------*/
/*                      ステータスコントロール                      */
/*------------------------------------------------------------------*/

#define STAT_VCOUNT_CMP_MASK    0xff00      // Ｖカウンタ比較値

#define STAT_VCOUNT_CMP_SHIFT   8

#define STAT_V_BLANK            0x0001      // Ｖブランク期間中
#define STAT_H_BLANK            0x0002      // Ｈブランク期間中
#define STAT_V_COUNT            0x0004      // Ｖカウンタ一致中
#define STAT_V_BLANK_IF_ENABLE  0x0008      // Ｖブランク割り込み要求 許可
#define STAT_H_BLANK_IF_ENABLE  0x0010      // Ｈブランク割り込み要求 許可
#define STAT_V_COUNT_IF_ENABLE  0x0020      // Ｖカウンタ一致割り込み要求 許可

/*------------------------------------------------------------------*/
/*                      ＢＧコントロール                            */
/*------------------------------------------------------------------*/

#define BG_PRIORITY_MASK        0x0003      // ＢＧ間優先順位
#define BG_CHAR_BASE_MASK       0x000c      // キャラクタ ベースアドレス
#define BG_SCREEN_BASE_MASK     0x1f00      // スクリーン ベースアドレス
#define BG_SCREEN_SIZE_MASK     0xc000      // スクリーンサイズ(256/512)

#define BG_PRIORITY_SHIFT       0
#define BG_CHAR_BASE_SHIFT      2
#define BG_SCREEN_BASE_SHIFT    8
#define BG_SCREEN_SIZE_SHIFT    14

#define BG_PRIORITY_0           0x0000      // ＢＧ第０優先
#define BG_PRIORITY_1           0x0001      // ＢＧ第１優先
#define BG_PRIORITY_2           0x0002      // ＢＧ第２優先
#define BG_PRIORITY_3           0x0003      // ＢＧ第３優先
#define BG_MOS_ON               0x0040      // モザイク ＯＮ
#define BG_MOS_OFF              0x0000      // モザイク ＯＦＦ
#define BG_COLOR_16             0x0000      // １６色   選択
#define BG_COLOR_256            0x0080      // ２５６色 選択
#define BG_LOOP_ON              0x2000      // ループ ＯＮ
#define BG_LOOP_OFF             0x0000      // ループ ＯＦＦ
#define BG_SCREEN_SIZE_0        0x0000      // スクリーンサイズ(256x256)
#define BG_SCREEN_SIZE_1        0x4000      // スクリーンサイズ(512x256)
#define BG_SCREEN_SIZE_2        0x8000      // スクリーンサイズ(256x512)
#define BG_SCREEN_SIZE_3        0xc000      // スクリーンサイズ(512x512)

/*------------------------------------------------------------------*/
/*                      ウインドウ コントロール                     */
/*------------------------------------------------------------------*/

#define WIN_END_POS_MASK        0x00ff      // ウインドウ終了点
#define WIN_START_POS_MASK      0xff00      // ウインドウ開始点

#define WIN_END_POS_SHIFT       0
#define WIN_START_POS_SHIFT     8

#define WIN_BG0_ON              0x0001      // ＢＧ０ ＯＮ
#define WIN_BG1_ON              0x0002      // ＢＧ１ ＯＮ
#define WIN_BG2_ON              0x0004      // ＢＧ２ ＯＮ
#define WIN_BG3_ON              0x0008      // ＢＧ３ ＯＮ
#define WIN_OBJ_ON              0x0010      // ＯＢＪ ＯＮ
#define WIN_BLEND_ON            0x0020      // ブレンド ＯＮ
#define WIN_ALL_ON              0x003f      // 全部 ＯＮ

/*------------------------------------------------------------------*/
/*                      モザイク コントロール                       */
/*------------------------------------------------------------------*/

#define MOS_H_SIZE_MASK         0x000f      //       モザイク高さ
#define MOS_V_SIZE_MASK         0x00f0      //       モザイク幅
#define MOS_BG_H_SIZE_MASK      0x000f      //   ＢＧモザイク高さ
#define MOS_BG_V_SIZE_MASK      0x00f0      //   ＢＧモザイク幅
#define MOS_OBJ_H_SIZE_MASK     0x000f      // ＯＢＪモザイク高さ
#define MOS_OBJ_V_SIZE_MASK     0x00f0      // ＯＢＪモザイク幅

#define MOS_H_SIZE_SHIFT        0
#define MOS_V_SIZE_SHIFT        4
#define MOS_BG_H_SIZE_SHIFT     0
#define MOS_BG_V_SIZE_SHIFT     4
#define MOS_OBJ_H_SIZE_SHIFT    8
#define MOS_OBJ_V_SIZE_SHIFT    12

/*------------------------------------------------------------------*/
/*                      ブレンド コントロール                       */
/*------------------------------------------------------------------*/

#define BLD_PIXEL_MASK          0x003f      // ピクセル選択
#define BLD_1ST_PIXEL_MASK      0x003f      // １ｓｔピクセル選択
#define BLD_MODE_MASK           0x00c0      // ブレンドモード
#define BLD_2ND_PIXEL_MASK      0x3f00      // ２ｎｄピクセル選択

#define BLD_1ST_PIXEL_SHIFT     0
#define BLD_MODE_SHIFT          6
#define BLD_2ND_PIXEL_SHIFT     8

#define BLD_BG0                 0x0001      // ＢＧ０ ピクセル選択
#define BLD_BG1                 0x0002      // ＢＧ１ ピクセル選択
#define BLD_BG2                 0x0004      // ＢＧ２ ピクセル選択
#define BLD_BG3                 0x0008      // ＢＧ３ ピクセル選択
#define BLD_OBJ                 0x0010      // ＯＢＪ ピクセル選択
#define BLD_BD                  0x0020      // 背景色 ピクセル選択
#define BLD_ALL                 0x003f      //        ピクセル全選択
#define BLD_BG0_1ST             0x0001      // ＢＧ０ １ｓｔピクセル選択
#define BLD_BG1_1ST             0x0002      // ＢＧ１ １ｓｔピクセル選択
#define BLD_BG2_1ST             0x0004      // ＢＧ２ １ｓｔピクセル選択
#define BLD_BG3_1ST             0x0008      // ＢＧ３ １ｓｔピクセル選択
#define BLD_OBJ_1ST             0x0010      // ＯＢＪ １ｓｔピクセル選択
#define BLD_BD_1ST              0x0020      // 背景色 １ｓｔピクセル選択
#define BLD_1ST_ALL             0x003f      //        １ｓｔピクセル全選択
#define BLD_NORMAL_MODE         0x0000      // ノーマルモード
#define BLD_A_BLEND_MODE        0x0040      // 半透明モード
#define BLD_UP_MODE             0x0080      // 輝度ＵＰモード
#define BLD_DOWN_MODE           0x00c0      // 輝度ＤＯＷＮモード
#define BLD_BG0_2ND             0x0100      // ＢＧ０ ２ｎｄピクセル選択
#define BLD_BG1_2ND             0x0200      // ＢＧ１ ２ｎｄピクセル選択
#define BLD_BG2_2ND             0x0400      // ＢＧ２ ２ｎｄピクセル選択
#define BLD_BG3_2ND             0x0800      // ＢＧ３ ２ｎｄピクセル選択
#define BLD_OBJ_2ND             0x1000      // ＯＢＪ ２ｎｄピクセル選択
#define BLD_BD_2ND              0x2000      // 背景色 ２ｎｄピクセル選択
#define BLD_2ND_ALL             0x3f00      //        ２ｎｄピクセル全選択


#define BLD_A_MASK              0x001f      // ブレンド変数 Ａ
#define BLD_B_MASK              0x1f00      // ブレンド変数 Ｂ
#define BLD_Y_MASK              0x001f      // ブレンド変数 Ｙ

#define BLD_A_SHIFT             16
#define BLD_B_SHIFT             24
#define BLD_Y_SHIFT             0


/*------------------------------------------------------------------*/
/*                      サウンド コントロール                       */
/*------------------------------------------------------------------*/

#define SOUND_SO1_LEVEL_MASK    0x03        // ＳＯ１出力レベル
#define SOUND_SO2_LEVEL_MASK    0x30        // ＳＯ２出力レベル
#define SOUND_DMG_SO1_ON_MASK   0x0f        // ＤＭＧ互換サウンド→ＳＯ１ ＯＮ
#define SOUND_DMG_SO2_ON_MASK   0xf0        // ＤＭＧ互換サウンド→ＳＯ２ ＯＮ

#define SOUND_SWEEP_SHIFT_MASK  0x03        // スイープ シフト数
#define SOUND_SWEEP_TIME_MASK   0x30        // スイープ 時間
#define SOUND_COUNTS_MASK       0x3f        // 音の長さ(カウント数)
#define SOUND_DUTY_MASK         0xc0        // 波形のデューティ
#define SOUND_ENV_STEPS_MASK    0x03        // エンベロープ ステップ数
#define SOUND_ENV_INIT_MASK     0xf0        // エンベロープ 初期値
#define SOUND_FREQUENCY_MASK    0x03ff      // 周波数
#define SOUND_FREQUENCY_L_MASK  0xff
#define SOUND_FREQUENCY_H_MASK  0x03

#define SOUND_3_COUNTS_MASK     0xff        // サウンド３ 音の長さ(カウント数)
#define SOUND_3_LEVEL_MASK      0xe0        //            出力レベル

#define SOUND_4_PRESCALER_MASK  0x03        // サウンド４ プリスケーラ選択
#define SOUND_4_POLYSHIFT_MASK  0xf0        //            ポリノミカル・カウンタ シフト数


#define SOUND_SO1_LEVEL_SHIFT   0
#define SOUND_SO2_LEVEL_SHIFT   4
#define SOUND_DMG_SO1_ON_SHIFT  0
#define SOUND_DMG_SO2_ON_SHIFT  4

#define SOUND_SWEEP_SHIFT_SHIFT 0
#define SOUND_SWEEP_TIME_SHIFT  4
#define SOUND_COUNTS_SHIFT      0
#define SOUND_DUTY_SHIFT        6
#define SOUND_ENV_STEPS_SHIFT   0
#define SOUND_ENV_INIT_SHIFT    4
#define SOUND_FREQUENCY_SHIFT   0
#define SOUND_FREQUENCY_L_SHIFT 0
#define SOUND_FREQUENCY_H_SHIFT 8

#define SOUND_3_COUNTS_SHIFT    0
#define SOUND_3_LEVEL_SHIFT     5

#define SOUND_4_PRESCALER_SHIFT 0
#define SOUND_4_POLYSHIFT_SHIFT 4


#define SOUND_1_ON              0x01        // サウンド１ ＯＮ
#define SOUND_2_ON              0x02        // サウンド２ ＯＮ
#define SOUND_3_ON              0x04        // サウンド３ ＯＮ
#define SOUND_4_ON              0x08        // サウンド４ ＯＮ
#define SOUND_DMG_ON            0x80        // ＤＭＧ互換サウンド ＯＮ

#define SOUND_1_SO1_ON          0x01        // サウンド１→ＳＯ１ ＯＮ
#define SOUND_2_SO1_ON          0x02        // サウンド２→ＳＯ１ ＯＮ
#define SOUND_3_SO1_ON          0x04        // サウンド３→ＳＯ１ ＯＮ
#define SOUND_4_SO1_ON          0x08        // サウンド４→ＳＯ１ ＯＮ
#define SOUND_1_SO2_ON          0x10        // サウンド１→ＳＯ２ ＯＮ
#define SOUND_2_SO2_ON          0x20        // サウンド２→ＳＯ２ ＯＮ
#define SOUND_3_SO2_ON          0x40        // サウンド３→ＳＯ２ ＯＮ
#define SOUND_4_SO2_ON          0x80        // サウンド４→ＳＯ２ ＯＮ
#define SOUND_DMG_ALL_SO1_ON    0x0f        // ＤＭＧ互換サウンド→ＳＯ１ ＯＮ
#define SOUND_DMG_ALL_SO2_ON    0xf0        // ＤＭＧ互換サウンド→ＳＯ２ ＯＮ
#define SOUND_DMG_ALL_SO_ON     0xff        // ＤＭＧ互換サウンド→ＳＯ１／２ ＯＮ
#define SOUND_VIN_SO1_ON        0x80        // Ｖｉｎ→ＳＯ１ ＯＮ
#define SOUND_VIN_SO2_ON        0x08        // Ｖｉｎ→ＳＯ２ ＯＮ
#define SOUND_VIN_SO_ON         0x08        // Ｖｉｎ→ＳＯ１／２ ＯＮ

#define SOUND_A_SO1_ON          0x01        // ダイレクトサウンドＡ→ＳＯ１ ＯＮ
#define SOUND_A_SO2_ON          0x02        // ダイレクトサウンドＡ→ＳＯ２ ＯＮ
#define SOUND_B_SO1_ON          0x10        // ダイレクトサウンドＢ→ＳＯ１ ＯＮ
#define SOUND_B_SO2_ON          0x20        // ダイレクトサウンドＢ→ＳＯ２ ＯＮ
#define SOUND_A_ALL_SO_ON       0x03        // ダイレクトサウンドＡ→ＳＯ１／２ ＯＮ
#define SOUND_B_ALL_SO_ON       0x30        // ダイレクトサウンドＢ→ＳＯ１／２ ＯＮ
#define SOUND_DIRECT_ALL_SO1_ON 0x11        // ダイレクトサウンドＡ／Ｂ→ＳＯ１ ＯＮ
#define SOUND_DIRECT_ALL_SO2_ON 0x22        // ダイレクトサウンドＡ／Ｂ→ＳＯ２ ＯＮ
#define SOUND_DIRECT_ALL_SO_ON  0x33        // ダイレクトサウンドＡ／Ｂ→ＳＯ１／２ ＯＮ
#define SOUND_A_TIMER_0         0x00        // タイマー０→ダイレクトサウンドＡ
#define SOUND_A_TIMER_1         0x04        // タイマー１→ダイレクトサウンドＡ
#define SOUND_B_TIMER_0         0x00        // タイマー０→ダイレクトサウンドＢ
#define SOUND_B_TIMER_1         0x40        // タイマー１→ダイレクトサウンドＢ
#define SOUND_A_FIFO_RESET      0x08        // ダイレクトサウンドＡ用ＦＩＦＯ リセット
#define SOUND_B_FIFO_RESET      0x80        // ダイレクトサウンドＢ用ＦＩＦＯ リセット

#define SOUND_DMG_MIX_1_4       0x00        //   ＤＭＧ互換サウンド合成比 １／４
#define SOUND_DMG_MIX_2_4       0x01        //                            ２／４
#define SOUND_DMG_MIX_FULL      0x02        //                            フルレンジ
#define SOUND_A_MIX_1_2         0x00        // ダイレクトサウンドＡ合成比 １／２
#define SOUND_A_MIX_FULL        0x04        //                            フルレンジ
#define SOUND_B_MIX_1_2         0x00        // ダイレクトサウンドＢ合成比 １／２
#define SOUND_B_MIX_FULL        0x08        //                            フルレンジ
#define SOUND_ALL_MIX_FULL      0x0e        //           全サウンド合成比 フルレンジ


#define SOUND_INIT_ON           0x80        // イニシャル ＯＮ
#define SOUND_INIT_OFF          0x00        // イニシャル ＯＮ
#define SOUND_COUNTER_ON        0x40        //   カウンタ ＯＮ
#define SOUND_COUNTER_OFF       0x00        //   カウンタ ＯＦＦ

#define SOUND_SWEEP_UP          0x00        // スイープ 加算
#define SOUND_SWEEP_DOWN        0x08        //          減算
#define SOUND_DUTY_1_8          0x00        // 波形のデューティ １／８
#define SOUND_DUTY_2_8          0x40        //                  ２／８
#define SOUND_DUTY_4_8          0x80        //                  ４／８
#define SOUND_DUTY_6_8          0xc0        //                  ６／８
#define SOUND_ENV_UP            0x08        // エンベロープ ＵＰ
#define SOUND_ENV_DOWN          0x00        //              ＤＯＷＮ

#define SOUND_3_LOCAL_ON        0x80        // サウンド３ ＯＮ
#define SOUND_3_WAVE_BANK_0     0x00        // サウンド３ 波形ＲＡＭ バンク０
#define SOUND_3_WAVE_BANK_1     0x40        //                       バンク１
#define SOUND_3_WAVE_CONNECT    0x20        // サウンド３ 波形ＲＡＭ 接続
#define SOUND_3_WAVE_DISCONNECT 0x00        //                       非接続
#define SOUND_3_LEVEL_0_4       0x00        // サウンド３ 出力 なし
#define SOUND_3_LEVEL_FULL      0x20        //                 ４／４
#define SOUND_3_LEVEL_2_4       0x40        //                 ２／４
#define SOUND_3_LEVEL_1_4       0x60        //                 １／４
#define SOUND_3_LEVEL_3_4       0x80        //                 ３／４

#define SOUND_4_POLYSTEP_15     0x00        // サウンド４ ポリノミカル・カウンタ １５段
#define SOUND_4_POLYSTEP_7      0x08        //                                     ７段


/*------------------------------------------------------------------*/
/*                      ＳＩＯコントロール                          */
/*------------------------------------------------------------------*/

#define SIO_MODE_MASK           0x3000      // 通信モード
#define SIO_BAUD_RATE_MASK      0x0003      // ボーレート
#define SIO_ID_NO_MASK          0x0030      // 通信ＩＤ

#define SIO_MODE_SHIFT          12
#define SIO_BAUD_RATE_SHIFT     0
#define SIO_ID_NO_SHIFT         4

#define SIO_8BIT_MODE           0x0000      // ノーマル８ビット通信モード
#define SIO_32BIT_MODE          0x1000      // ノーマル３２ビット通信モード
#define SIO_MULTI_MODE          0x2000      // マルチプレイ通信モード
#define SIO_UART_MODE           0x3000      // ＵＡＲＴ通信モード

#define SIO_SCK_OUT             0x0000      // 外部クロック選択
#define SIO_SCK_IN              0x0001      // 内部クロック選択
#define SIO_IN_SCK_256K         0x0000      // 内部クロック ２５６ＫＨｚ選択
#define SIO_IN_SCK_2M           0x0002      //                  ２ＭＨｚ選択
#define SIO_ACK_RECV            0x0004      // 転送要求
#define SIO_ACK_SEND            0x0008      // 転送許可
#define SIO_9600_BPS            0x0000      // ボーレート ９６００ＢＰＳ
#define SIO_38400_BPS           0x0001      //          ３８４００ＢＰＳ
#define SIO_57600_BPS           0x0002      //          ５７６００ＢＰＳ
#define SIO_115200_BPS          0x0003      //        １１５２００ＢＰＳ
#define SIO_MULTI_CONNECT       0x0004      // マルチプレイ通信 接続中
#define SIO_MULTI_DISCONNECT    0x0000      //                  非接続
#define SIO_MULTI_PARENT        0x0008      // マルチプレイ通信 親接続
#define SIO_MULTI_CHILD         0x0000      //                  子接続
#define SIO_MULTI_SI            0x0004      // マルチプレイ通信 ＳＩ端子
#define SIO_MULTI_SD            0x0008      //                  ＳＤ端子
#define SIO_MULTI_BUSY          0x0080      // マルチプレイ通信中
#define SIO_CTS_ENABLE          0x0004      // ＵＡＲＴ送信可能信号  イネーブル
#define SIO_UART_7BIT           0x0000      // ＵＡＲＴ通信 データ長 ７ｂｉｔ
#define SIO_UART_8BIT           0x0080      //                       ８ｂｉｔ
#define SIO_ERROR               0x0040      // エラー検出
#define SIO_START               0x0080      // 転送スタート
#define SIO_ENABLE              0x0080      // ＳＩＯ許可
#define SIO_FIFO_ENABLE         0x0100      // ＦＩＦＯ イネーブル
#define SIO_PARITY_ENABLE       0x0200      // パリティ イネーブル
#define SIO_PARITY_EVEN         0x0000      // 偶数パリティ
#define SIO_PARITY_ODD          0x0008      // 奇数パリティ
#define SIO_TRANS_ENABLE        0x0400      // トランスミッタ イネーブル
#define SIO_TRANS_DATA_FULL     0x0010      // トランスミットデータ 満杯
#define SIO_RECV_ENABLE         0x0800      // レシーバ イネーブル
#define SIO_RECV_DATA_EMPTY     0x0020      // レシーブデータ 無し
#define SIO_IF_ENABLE           0x4000      // 割り込み要求 許可

/*------------------------------------------------------------------*/
/*                      ＪＯＹバス コントロール                     */
/*------------------------------------------------------------------*/

#define JOY_IF_RESET            0x01        // ＪＯＹバス・リセット 割り込み要求
#define JOY_IF_RECV             0x02        // ＪＯＹバス受信完了   割り込み要求
#define JOY_IF_SEND             0x04        // ＪＯＹバス送信完了   割り込み要求
#define JOY_IF_ENABLE           0x40        // 割り込み要求 許可

/*------------------------------------------------------------------*/
/*                      ＪＯＹバス ステータス                       */
/*------------------------------------------------------------------*/

#define JSTAT_FLAGS_MASK        0x30        // 汎用フラグ

#define JSTAT_FLAGS_SHIFT       4

#define JSTAT_PSF0              0x10        // 汎用フラグ０
#define JSTAT_PSF1              0x20        //           １

#define JSTAT_RECV              0x02        // 受信ステータス
#define JSTAT_SEND              0x08        // 送信ステータス

/*------------------------------------------------------------------*/
/*                      汎用入出力コントロール                      */
/*------------------------------------------------------------------*/

#define R_SIO_MODE_MASTER_MASK  0xc000      // ＳＩＯモード・マスタ

#define R_SIO_MODE_MASTER_SHIFT 14

#define R_SIO_MASTER_MODE       0x0000      // ＳＩＯマスタ・モード
#define R_DIRECT_MODE           0x8000      // 汎用入出力通信モード
#define R_JOY_MODE              0xc000      // ＪＯＹ通信モード

#define R_SC                    0x0001      // データ
#define R_SD                    0x0002
#define R_SI                    0x0004
#define R_SO                    0x0008
#define R_SC_I_O                0x0010      // Ｉ/Ｏ選択
#define R_SD_I_O                0x0020
#define R_SI_I_O                0x0040
#define R_SO_I_O                0x0080
#define R_SC_IN                 0x0000      // 入力設定
#define R_SD_IN                 0x0000
#define R_SI_IN                 0x0000
#define R_SO_IN                 0x0000
#define R_SC_OUT                0x0010      // 出力設定
#define R_SD_OUT                0x0020
#define R_SI_OUT                0x0040
#define R_SO_OUT                0x0080
#define R_IF_ENABLE             0x0100      // 割り込み要求 許可


/*------------------------------------------------------------------*/
/*                      ＤＭＡコントロール                          */
/*------------------------------------------------------------------*/

#define DMA_TIMMING_MASK        0x30000000  // 開始タイミング
#define DMA_COUNT_MASK          0x0000ffff  // 転送数

#define DMA_TIMMING_SHIFT       30
#define DMA_COUNT_SHIFT         0

#define DMA_ENABLE              0x80000000  // ＤＭＡ許可
#define DMA_IF_ENABLE           0x40000000  // 割り込み要求 許可
#define DMA_TIMMING_IMM         0x00000000  // 直ちに起動
#define DMA_TIMMING_V_BLANK     0x10000000  // Ｖブランク起動
#define DMA_TIMMING_H_BLANK     0x20000000  // Ｈブランク起動
#define DMA_TIMMING_DISP        0x30000000  // 表示起動
#define DMA_TIMMING_SOUND       0x30000000  // サウンドＦＩＦＯリクエスト起動
#define DMA_DREQ_ON             0x08000000  // データ要求同期モード ＯＮ
#define DMA_16BIT_BUS           0x00000000  // バスサイズ１６Ｂｉｔ選択
#define DMA_32BIT_BUS           0x04000000  // バスサイズ３２Ｂｉｔ選択
#define DMA_CONTINUOUS_ON       0x02000000  // コンティニュアスモード ＯＮ
#define DMA_SRC_INC             0x00000000  // 転送元 インクリメント 選択
#define DMA_SRC_DEC             0x00800000  // 転送元 デクリメント   選択
#define DMA_SRC_FIX             0x01000000  // 転送元 固定 選択
#define DMA_DEST_INC            0x00000000  // 転送先 インクリメント 選択
#define DMA_DEST_DEC            0x00200000  // 転送先 デクリメント   選択
#define DMA_DEST_FIX            0x00400000  // 転送先 固定 選択
#define DMA_DEST_RELOAD         0x00600000  // 転送先 インクリメント/リロード 選択

/*------------------------------------------------------------------*/
/*                      タイマー コントロール                       */
/*------------------------------------------------------------------*/

#define TMR_PRESCALER_MASK      0x00030000  // プリスケーラ クロック

#define TMR_PRESCALER_SHIFT     16

#define TMR_PRESCALER_1CK       0x00000000  // プリスケーラ １分周
#define TMR_PRESCALER_64CK      0x00010000  //            ６４分周
#define TMR_PRESCALER_256CK     0x00020000  //          ２５６分周
#define TMR_PRESCALER_1024CK    0x00030000  //        １０２４分周
#define TMR_IF_ENABLE           0x00400000  // 割り込み要求 許可
#define TMR_ENABLE              0x00800000  // タイマー起動


/*------------------------------------------------------------------*/
/*                          キー                                    */
/*------------------------------------------------------------------*/

#define BUTTON_MASK             0x030f      // ボタン
#define PLUS_KEY_MASK           0x00f0      // 十字キー
#define ALL_KEY_MASK            0x03ff      // 全てのキー

#define A_BUTTON                0x0001      // Ａボタン
#define B_BUTTON                0x0002      // Ｂボタン
#define SELECT_BUTTON           0x0004      // セレクトボタン
#define START_BUTTON            0x0008      // スタートボタン
#define R_KEY                   0x0010      // 右ボタン
#define L_KEY                   0x0020      // 左ボタン
#define U_KEY                   0x0040      // 上ボタン
#define D_KEY                   0x0080      // 下ボタン
#define R_BUTTON                0x0100      // Ｒボタン
#define L_BUTTON                0x0200      // Ｌボタン
#define KEY_IF_ENABLE           0x4000      // 割り込み要求 許可
#define KEY_OR_INTR             0x0000      //   通常キー割り込み
#define KEY_AND_INTR            0x8000      // ＡＮＤキー割り込み


/*------------------------------------------------------------------*/
/*                  カセットウェイト コントロール                   */
/*------------------------------------------------------------------*/

#define CST_SRAM_4WAIT          0x0000      // ＳＲＡＭ ４ウェイト
#define CST_SRAM_3WAIT          0x0001      //          ３ウェイト
#define CST_SRAM_2WAIT          0x0002      //          ２ウェイト
#define CST_SRAM_8WAIT          0x0003      //          ８ウェイト
#define CST_ROM0_1ST_4WAIT      0x0000      // ＲＯＭ０ １ｓｔ ４ウェイト
#define CST_ROM0_1ST_3WAIT      0x0004      //                 ３ウェイト
#define CST_ROM0_1ST_2WAIT      0x0008      //                 ２ウェイト
#define CST_ROM0_1ST_8WAIT      0x000c      //                 ８ウェイト
#define CST_ROM0_2ND_2WAIT      0x0000      //          ２ｎｄ ２ウェイト
#define CST_ROM0_2ND_1WAIT      0x0010      //                 １ウェイト
#define CST_ROM1_1ST_4WAIT      0x0000      // ＲＯＭ１ １ｓｔ ４ウェイト
#define CST_ROM1_1ST_3WAIT      0x0020      //                 ３ウェイト
#define CST_ROM1_1ST_2WAIT      0x0040      //                 ２ウェイト
#define CST_ROM1_1ST_8WAIT      0x0060      //                 ８ウェイト
#define CST_ROM1_2ND_4WAIT      0x0000      //          ２ｎｄ ４ウェイト
#define CST_ROM1_2ND_1WAIT      0x0080      //                 １ウェイト
#define CST_ROM2_1ST_4WAIT      0x0000      // ＲＯＭ２ １ｓｔ ４ウェイト
#define CST_ROM2_1ST_3WAIT      0x0100      //                 ３ウェイト
#define CST_ROM2_1ST_2WAIT      0x0200      //                 ２ウェイト
#define CST_ROM2_1ST_8WAIT      0x0300      //                 ８ウェイト
#define CST_ROM2_2ND_8WAIT      0x0000      //          ２ｎｄ ８ウェイト
#define CST_ROM2_2ND_1WAIT      0x0400      //                 １ウェイト

#define CST_PHI_OUT_NONE        0x0000      // φ端子出力クロック Ｌｏ固定
#define CST_PHI_OUT_4MCK        0x0800      //                ４ＭＨｚ
#define CST_PHI_OUT_8MCK        0x1000      //                ８ＭＨｚ
#define CST_PHI_OUT_16MCK       0x1800      //              １６ＭＨｚ
#define CST_PREFETCH_ENABLE     0x4000      // プリフェッチバッファ 許可
#define CST_AGB                 0x0000      // ＡＧＢカセット
#define CST_CGB                 0x8000      // ＣＧＢカセット



#ifdef __cplusplus
}      /* extern "C" */
#endif

#endif /* _AGB_DEFINE_H */
