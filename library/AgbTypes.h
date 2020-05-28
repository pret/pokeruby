/********************************************************************/
/*          AgbTypes.h                                              */
/*            AGB標準型宣言                                         */
/*                                                                  */
/*          Copyright (C) 1999-2001 NINTENDO Co.,Ltd.               */
/********************************************************************/
#ifndef _AGB_TYPES_H
#define _AGB_TYPES_H

#ifdef __cplusplus
extern "C" {
#endif


/*------------------------------------------------------------------*/
/*                      データサイズ再定義                          */
/*------------------------------------------------------------------*/

typedef     unsigned char           u8;
typedef     unsigned short int      u16;
typedef     unsigned int            u32;
typedef     unsigned long long int  u64;

typedef     signed char             s8;
typedef     signed short int        s16;
typedef     signed int              s32;
typedef     signed long long int    s64;

typedef     float                   f32;
typedef     double                  f64;


#define     vl                      volatile

typedef     vl u8                   vu8;
typedef     vl u16                  vu16;
typedef     vl u32                  vu32;
typedef     vl u64                  vu64;

typedef     vl s8                   vs8;
typedef     vl s16                  vs16;
typedef     vl s32                  vs32;
typedef     vl s64                  vs64;

typedef     vl f32                  vf32;
typedef     vl f64                  vf64;


/*------------------------------------------------------------------*/
/*                          構造体                                  */
/*------------------------------------------------------------------*/

// プログラムステータスレジスタ構造体
typedef struct {
    u32 CpuMode:5;          // ＣＰＵモード
    u32 Thumb_State:1;      // ＴＨＵＭＢステート
    u32 Fiq_Disable:1;      // ＦＩＱ不許可
    u32 Irq_Disable:1;      // ＩＲＱ不許可
    u32 Dummy_27_8:20;
    u32 V_Flag:1;           // オーバーフロー
    u32 C_Flag:1;           // キャリー／ボロー／拡張
    u32 Z_Flag:1;           // ゼロ
    u32 N_Flag:1;           // 負／未満
} PsrData;
typedef  vl PsrData    vPsrData;

#define ST_PSR_USER_MODE            0x10    // ユーザ
#define ST_PSR_FIQ_MODE             0x11    // ＦＩＱ
#define ST_PSR_IRQ_MODE             0x12    // ＩＲＱ
#define ST_PSR_SVC_MODE             0x13    // スーパバイザ
#define ST_PSR_ABORT_MODE           0x17    // アボート（プリフェッチ／データ）
#define ST_PSR_UNDEF_MODE           0x1b    // 未定義命令
#define ST_PSR_SYS_MODE             0x1f    // システム


// 割り込み要求／許可フラグ構造体
typedef struct {
    u16 V_Blank:1;          // Ｖブランク
    u16 H_Blank:1;          // Ｈブランク
    u16 V_Count:1;          // Ｖカウンタ一致
    u16 Timer0:1;           // タイマー０
    u16 Timer1:1;           // タイマー１
    u16 Timer2:1;           // タイマー２
    u16 Timer3:1;           // タイマー３
    u16 Sio:1;              // シリアル通信
    u16 Dma0:1;             // ＤＭＡ０
    u16 Dma1:1;             // ＤＭＡ１
    u16 Dma2:1;             // ＤＭＡ２
    u16 Dma3:1;             // ＤＭＡ３
    u16 Key:1;              // キー
    u16 Cassette:1;         // カセット
    u16 Dummy_15_14:2;
} IntrFlags;
typedef  vl IntrFlags    vIntrFlags;


// 表示コントロール構造体
typedef struct {
    u16 BgMode:3;           //   ＢＧモード選択
    u16 CgbMode:1;          // ＣＧＢモード選択
    u16 Bmp_FrameNo:1;      // ビットマップモード 表示フレーム 選択
    u16 Obj_H_Off:1;        // Ｈブランク中ＯＢＪ処理 ＯＦＦ
    u16 ObjCharMapType:1;   // ＯＢＪキャラクタデータ マッピングタイプ
    u16 Lcdc_Off:1;         // ＬＣＤＣ ＯＦＦ
    u16 Bg0_On:1;           // ＢＧ０ ＯＮ
    u16 Bg1_On:1;           // ＢＧ１ ＯＮ
    u16 Bg2_On:1;           // ＢＧ２ ＯＮ
    u16 Bg3_On:1;           // ＢＧ３ ＯＮ
    u16 Obj_On:1;           // ＯＢＪ ＯＮ
    u16 Win0_On:1;          // ウインドウ０ ＯＮ
    u16 Win1_On:1;          // ウインドウ１ ＯＮ
    u16 ObjWin_On:1;        // ＯＢＪウインドウ ＯＮ
} DispCnt;
typedef  vl DispCnt   vDispCnt;

#define ST_DISP_OBJ_CHAR_2D_MAP     0       // ＯＢＪキャラクタデータ ２Ｄマッピング
#define ST_DISP_OBJ_CHAR_1D_MAP     1       // ＯＢＪキャラクタデータ １Ｄマッピング


// ステータスコントロール構造体
typedef struct {
    u16 V_Blank_Flag:1;     // Ｖブランク期間中
    u16 H_Blank_Flag:1;     // Ｈブランク期間中
    u16 V_Count_Flag:1;     // Ｖカウンタ一致中
    u16 V_Blank_IF_Enable:1;// Ｖブランク割り込み要求 許可
    u16 H_Blank_IF_Enable:1;// Ｈブランク割り込み要求 許可
    u16 V_Count_IF_Enable:1;// Ｖカウンタ一致割り込み要求 許可
    u16 Dummy_7_6:2;
    u8  V_Count_Cmp;        // Ｖカウンタ比較値
    u8  V_Count;            // Ｖカウンタ値
    u8  Dummy_31_24;
} StatCnt;
typedef  vl StatCnt   vStatCnt;


// モザイクコントロール構造体
typedef struct {
    u16 Bg_HSize:4;         //   ＢＧモザイク Ｈサイズ
    u16 Bg_VSize:4;         //   ＢＧモザイク Ｖサイズ
    u16 Obj_HSize:4;        // ＯＢＪモザイク Ｈサイズ
    u16 Obj_VSize:4;        // ＯＢＪモザイク Ｖサイズ
} MosCnt;
typedef  vl MosCnt    vMosCnt;


// ブレンドコントロール構造体
typedef struct {
    u16 Pixel_1st_Bg0_On:1; // １ｓｔピクセル
    u16 Pixel_1st_Bg1_On:1;
    u16 Pixel_1st_Bg2_On:1;
    u16 Pixel_1st_Bg3_On:1;
    u16 Pixel_1st_Obj_On:1;
    u16 Pixel_1st_Bd_On:1;
    u16 BlendMode:2;        // ブレンドモード
    u16 Pixel_2nd_Bg0_On:1; // ２ｎｄピクセル
    u16 Pixel_2nd_Bg1_On:1;
    u16 Pixel_2nd_Bg2_On:1;
    u16 Pixel_2nd_Bg3_On:1;
    u16 Pixel_2nd_Obj_On:1;
    u16 Pixel_2nd_Bd_On:1;
    u16 Dummy_15_14:2;
    u16 Value_A:5;          // パラメータ Ａ
    u16 Dummy_23_21:3;
    u16 Value_B:5;          // パラメータ Ｂ
    u16 Dummy_31_29:3;
    u16 Value_Y:5;          // パラメータ Ｙ
    u16 Dummy_39_37:3;
} BlendCnt;
typedef  vl BlendCnt    vBlendCnt;

#define ST_BLD_NORMAL_MODE          0       // ノーマルモード
#define ST_BLD_A_BLEND_MODE         1       // 半透明モード
#define ST_BLD_UP_MODE              2       // 輝度ＵＰモード
#define ST_BLD_DOWN_MODE            3       // 輝度ＤＯＷＮモード


// ＢＧコントロール構造体
typedef struct {
    u16 Priority:2;         // 表示優先
    u16 CharBasep:2;        // キャラクタ ベースアドレス
    u16 Dummy_5_4:2;
    u16 Mosaic:1;           // モザイク
    u16 ColorMode:1;        // １６色／２５６色 選択
    u16 ScBasep:5;          // スクリーン ベースアドレス
    u16 Loop:1;             // ループ
    u16 Size:2;             // スクリーンサイズ
} BgCnt;
typedef  vl BgCnt    vBgCnt;

#define ST_BG_COLOR_16              0       // １６色   選択
#define ST_BG_COLOR_256             1       // ２５６色 選択


// ＢＧオフセットコントロール構造体
typedef struct {
    u16 H;
    u16 V;
} BgOffsetCnt;
typedef  vl BgOffsetCnt    vBgOffsetCnt;


// ＢＧスクリーン構造体
typedef struct {
    u16 CharNo:10;          // キャラクタＮｏ
    u16 HFlip:1;            // Ｈフリップ
    u16 VFlip:1;            // Ｖフリップ
    u16 Pltt:4;             // パレットＮｏ
} BgScData;
typedef  vl BgScData       vBgScData;


// ＢＧアフィン変換ソースデータ構造体
typedef struct {
    s32 SrcCenterX;         // 元データ中心座標 << 8
    s32 SrcCenterY;
    s16 DispCenterX;        // 表示中心座標
    s16 DispCenterY;
    s16 RatioX;             // 拡大縮小率 << 8
    s16 RatioY;
    u16 Theta;              // 回転角（0 - 255）<< 8
} BgAffineSrcData;
typedef  vl BgAffineSrcData    vBgAffineSrcData;

// ＢＧアフィン変換デスティネーションデータ構造体
typedef struct {
    s16 H_DiffX;            // ライン方向Ｘ座標差分
    s16 V_DiffX;            //   垂直方向Ｘ座標差分
    s16 H_DiffY;            // ライン方向Ｙ座標差分
    s16 V_DiffY;            //   垂直方向Ｙ座標差分
    s32 StartX;             // スタートＸ座標
    s32 StartY;             // スタートＹ座標
} BgAffineDestData;
typedef  vl BgAffineDestData   vBgAffineDestData;


// ＯＡＭ構造体
typedef struct {
    u32 VPos:8;             // Ｙ座標
    u32 AffineMode:2;       // アフィンモード
    u32 ObjMode:2;          // ＯＢＪモード
    u32 Mosaic:1;           // モザイク
    u32 ColorMode:1;        // １６色/２５６色 選択
    u32 Shape:2;            // ＯＢＪ形状

    u32 HPos:9;             // Ｘ座標
    u32 AffineParamNo_L:3;  // アフィン変換パラメータＮｏ 下位３ビット
    u32 HFlip:1;            // Ｈフリップ
    u32 VFlip:1;            // Ｖフリップ
    u32 Size:2;             // ＯＢＪサイズ

    u16 CharNo:10;          // キャラクタＮｏ
    u16 Priority:2;         // 表示優先
    u16 Pltt:4;             // パレットＮｏ
    u16 AffineParam;        // アフィン変換パラメータ
} OamData;
typedef  vl OamData    vOamData;

#define ST_OAM_OBJ_NORMAL           0       // ＯＢＪノーマルモード
#define ST_OAM_OBJ_BLEND            1       // ＯＢＪ半透明モード
#define ST_OAM_OBJ_WINDOW           2       // ＯＢＪウインドウモード
#define ST_OAM_AFFINE_NONE          0       // アフィン無効モード
#define ST_OAM_AFFINE_NORMAL        1       // アフィンノーマルモード
#define ST_OAM_AFFINE_TWICE         3       // アフィン２倍角モード
#define ST_OAM_AFFINE_ERASE         2       // アフィン非表示モード
#define ST_OAM_COLOR_16             0       // １６     選択
#define ST_OAM_COLOR_256            1       // ２５６色 選択
#define ST_OAM_SQUARE               0       // 正方形ＯＢＪ
#define ST_OAM_H_RECTANGLE          1       // 横長方形ＯＢＪ
#define ST_OAM_V_RECTANGLE          2       // 縦長方形ＯＢＪ


// ＯＢＪアフィン変換ソースデータ構造体
typedef struct {
    s16 RatioX;             // 拡大縮小率
    s16 RatioY;
    u16 Theta;              // 回転角（0 - 255）<< 8
} ObjAffineSrcData;
typedef  vl ObjAffineSrcData   vObjAffineSrcData;

// ＯＢＪアフィン変換デスティネーションデータ構造体
typedef struct {
    s16 H_DiffX;            // ライン方向Ｘ座標差分
    s16 V_DiffX;            //   垂直方向Ｘ座標差分
    s16 H_DiffY;            // ライン方向Ｙ座標差分
    s16 V_DiffY;            //   垂直方向Ｙ座標差分
} ObjAffineDestData;
typedef  vl ObjAffineDestData  vObjAffineDestData;


// カラーパレット構造体
typedef struct {
    u16 Red:5;              // 赤
    u16 Green:5;            // 緑
    u16 Blue:5;             // 青
    u16 Dummy_15:1;
} PlttData;
typedef  vl PlttData    vPlttData;


// ウインドウコントロール構造体
typedef struct {
    u8  Bg0_On:1;           // ＢＧ０ ＯＮ
    u8  Bg1_On:1;           // ＢＧ１ ＯＮ
    u8  Bg2_On:1;           // ＢＧ２ ＯＮ
    u8  Bg3_On:1;           // ＢＧ３ ＯＮ
    u8  Obj_On:1;           // ＯＢＪ ＯＮ
    u8  Blend_On:1;         // カラー特殊効果 ＯＮ
    u8  Dummy_7_6:2;
} WindCnt;
typedef  vl WindCnt     vWindCnt;


// サウンドコントロール構造体
typedef struct {
    u8  So1_Level:3;        // ＳＯ１出力レベル
    u8  So1_Vin_On:1;       // Ｖｉｎ→ＳＯ１ ＯＮ
    u8  So2_Level:3;        // ＳＯ２出力レベル
    u8  So2_Vin_On:1;       // Ｖｉｎ→ＳＯ２ ＯＮ
    u8  So1_Sound1_On:1;    // サウンド１→ＳＯ１ ＯＮ
    u8  So1_Sound2_On:1;    // サウンド２→ＳＯ１ ＯＮ
    u8  So1_Sound3_On:1;    // サウンド３→ＳＯ１ ＯＮ
    u8  So1_Sound4_On:1;    // サウンド４→ＳＯ１ ＯＮ
    u8  So2_Sound1_On:1;    // サウンド１→ＳＯ２ ＯＮ
    u8  So2_Sound2_On:1;    // サウンド２→ＳＯ２ ＯＮ
    u8  So2_Sound3_On:1;    // サウンド３→ＳＯ２ ＯＮ
    u8  So2_Sound4_On:1;    // サウンド４→ＳＯ２ ＯＮ
    u8  Sound_1_4_Mix:2;    // ＤＭＧ互換サウンド 合成比
    u8  DirectA_Mix:1;      // ダイレクトサウンドＡ 合成比
    u8  DirectB_Mix:1;      // ダイレクトサウンドＢ 合成比
    u8  Dummy_23_20:4;
    u8  So1_DirectA_On:1;   // ダイレクトサウンドＡ→ＳＯ１ ＯＮ
    u8  So2_DirectA_On:1;   // ダイレクトサウンドＡ→ＳＯ２ ＯＮ
    u8  DirectA_Timer:1;    // ダイレクトサウンドＡ用タイマー選択
    u8  FifoA_Reset:1;      // ダイレクトサウンドＡ用ＦＩＦＯ リセット
    u8  So1_DirectB_On:1;   // ダイレクトサウンドＢ→ＳＯ１ ＯＮ
    u8  So2_DirectB_On:1;   // ダイレクトサウンドＢ→ＳＯ２ ＯＮ
    u8  DirectB_Timer:1;    // ダイレクトサウンドＢ用タイマー選択
    u8  FifoB_Reset:1;      // ダイレクトサウンドＢ用ＦＩＦＯ リセット
    u8  Sound1_On:1;        // サウンド１ ＯＮ
    u8  Sound2_On:1;        // サウンド２ ＯＮ
    u8  Sound3_On:1;        // サウンド３ ＯＮ
    u8  Sound4_On:1;        // サウンド４ ＯＮ
    u8  Dummy_38_36:3;
    u8  Sound_1_4_On:1;     // ＤＭＧ互換サウンド ＯＮ
    u8  Dummy_47_40;
    u16 Dummy_63_48;
    u16 BiasLevel:10;       // ＢＩＡＳレベル
    u16 Dummy_77_74:4;
    u16 OutFrequency:2;     // 再生周波数
} SoundCnt;
typedef  vl SoundCnt     vSoundCnt;

#define ST_SOUND_DMG_MIX_1_4        0       // ＤＭＧ互換サウンド合成比 １／４
#define ST_SOUND_DMG_MIX_2_4        1       //                          ２／４
#define ST_SOUND_DMG_MIX_FULL       2       //                          フルレンジ
#define ST_SOUND_DIRECT_MIX_1_2     0       // ダイレクトサウンド合成比 １／２
#define ST_SOUND_DIRECT_MIX_FULL    1       //                          フルレンジ


// サウンド１コントロール構造体
typedef struct {
    u8  SweepShift:3;       // スイープ シフト数
    u8  SweepUpDownt:1;     // スイープ 増減
    u8  SweepTime:3;        // スイープ 時間
    u8  Dummy_7:1;
    u8  Dummy_15_8;
    u8  Counts:6;           // 音の長さ(カウント数)
    u8  Duty:2;             // 波形のデューティ
    u8  EnvSteps:3;         // エンベロープ ステップ数
    u8  EnvUp_Down:1;       // エンベロープ ＵＰ／ＤＯＷＮ
    u8  EnvInitData:4;      // エンベロープ 初期値
    u16 Frequency:11;       // 周波数
    u16 Dummy_45_43:3;
    u16 Counter_On:1;       // カウンター ＯＮ
    u16 Start:1;            // スタート
} Sound1Cnt;
typedef  vl Sound1Cnt    vSound1Cnt;

// サウンド２コントロール構造体
typedef struct {
    u8  Counts:6;           // 音の長さ(カウント数)
    u8  Duty:2;             // 波形のデューティ
    u8  EnvSteps:3;         // エンベロープ ステップ数
    u8  EnvUp_Down:1;       // エンベロープ ＵＰ／ＤＯＷＮ
    u8  EnvInitData:4;      // エンベロープ 初期値
    u16 Dummy_31_16;
    u16 Frequency:11;       // 周波数
    u16 Dummy_45_43:3;
    u16 Counter_On:1;       // カウンター ＯＮ
    u16 Start:1;            // スタート
} Sound2Cnt;
typedef  vl Sound2Cnt    vSound2Cnt;

#define ST_SOUND_SWEEP_UP           0       // スイープ 加算
#define ST_SOUND_SWEEP_DOWN         1       //          減算
#define ST_SOUND_DUTY_1_8           0       // 波形のデューティ １／８
#define ST_SOUND_DUTY_2_8           1       //                  ２／８
#define ST_SOUND_DUTY_4_8           2       //                  ４／８
#define ST_SOUND_DUTY_6_8           3       //                  ６／８
#define ST_SOUND_ENV_UP             1       // エンベロープ ＵＰ
#define ST_SOUND_ENV_DOWN           0       //              ＤＯＷＮ


// サウンド３コントロール構造体
typedef struct {
    u8  Dummy_6_0:5;
    u8  Connect:1;          // 波形ＲＡＭ結合
    u8  Bank:1;             // 波形ＲＡＭバンク
    u8  On:1;               // サウンド３ ＯＮ
    u8  Dummy_15_8;
    u8  Counts;             // 音の長さ(カウント数)
    u8  Dummy_28_24:5;
    u8  OutputLevel:3;      // 出力レベル
    u16 Frequency:11;       // 周波数
    u16 Dummy_45_43:3;
    u16 Counter_On:1;       // カウンター ＯＮ
    u16 Start:1;            // スタート
} Sound3Cnt;
typedef  vl Sound3Cnt    vSound3Cnt;

#define ST_SOUND_3_LEVEL_0_4        0       // サウンド３ 出力 なし
#define ST_SOUND_3_LEVEL_FULL       1       //                 ４／４
#define ST_SOUND_3_LEVEL_2_4        2       //                 ２／４
#define ST_SOUND_3_LEVEL_1_4        3       //                 １／４
#define ST_SOUND_3_LEVEL_3_4        4       //                 ３／４


// サウンド４コントロール構造体
typedef struct {
    u8  Counts:6;           // 音の長さ(カウント数)
    u8  Dummy_15_14:2;
    u8  EnvSteps:3;         // エンベロープ ステップ数
    u8  EnvUp_Down:1;       // エンベロープ ＵＰ／ＤＯＷＮ
    u8  EnvInitData:4;      // エンベロープ 初期値
    u16 Dummy_31_16;
    u8  PreScaler:3;        // プリスケーラ選択
    u8  PolySteps:1;        // ポリノミカル・カウンタの段数選択
    u8  PolyShift:4;        // ポリノミカル・カウンタ シフト数
    u8  Dummy45_40:6;
    u8  Counter_On:1;       // カウンター ＯＮ
    u8  Start:1;            // スタート
} Sound4Cnt;
typedef  vl Sound4Cnt    vSound4Cnt;

#define ST_SOUND_4_POLYSTEP_15      0       // サウンド４ ポリノミカル・カウンタ １５段
#define ST_SOUND_4_POLYSTEP_7       1       //                                     ７段


// ノーマルＳＩＯコントロール構造体
typedef struct {
    u16 Sck_I_O:1;          // クロックＩ/Ｏ選択
    u16 Sck:1;              // 内部クロック選択
    u16 AckRecv:1;          // 転送許可フラグ受信
    u16 AckSend:1;          // 転送許可フラグ送信
    u16 Dummy_6_4:3;
    u16 Enable:1;           // ＳＩＯ許可
    u16 Dummy_11_8:4;
    u16 Mode:2;             // 通信モード選択
    u16 IF_Enable:1;        // 割り込み要求 許可
    u16 Dammy_15:1;
    u8  Data;               // データ
    u8  Dummy_31_24;
} SioNormalCnt;
typedef  vl SioNormalCnt    vSioNormalCnt;

#define ST_SIO_8BIT_MODE            0       // ノーマル８ビット通信モード
#define ST_SIO_32BIT_MODE           1       // ノーマル３２ビット通信モード

#define ST_SIO_SCK_OUT              0       // 外部クロック選択
#define ST_SIO_SCK_IN               1       // 内部クロック選択
#define ST_SIO_IN_SCK_256K          0       // 内部クロック ２５６ＫＨｚ選択
#define ST_SIO_IN_SCK_2M            1       //                  ２ＭＨｚ選択


// マルチプレイＳＩＯコントロール構造体
typedef struct {
    u16 BaudRate:2;         // ボーレート
    u16 SI:1;               // ＳＩ端子
    u16 SD:1;               // ＳＤ端子
    u16 ID:2;               // ＩＤ
    u16 Error:1;            // エラー検出
    u16 Enable:1;           // ＳＩＯ許可
    u16 Dummy_11_8:4;
    u16 Mode:2;             // 通信モード選択
    u16 IF_Enable:1;        // 割り込み要求 許可
    u16 Dammy_15:1;
    u16 Data;               // データ
} SioMultiCnt;
typedef  vl SioMultiCnt     vSioMultiCnt;

#define ST_SIO_MULTI_MODE           2       // マルチプレイ通信モード

#define ST_SIO_9600_BPS             0       // ボーレート ９６００ＢＰＳ
#define ST_SIO_38400_BPS            1       //          ３８４００ＢＰＳ
#define ST_SIO_57600_BPS            2       //          ５７６００ＢＰＳ
#define ST_SIO_115200_BPS           3       //        １１５２００ＢＰＳ
#define ST_SIO_MULTI_PARENT         1       // マルチプレイ通信 親接続
#define ST_SIO_MULTI_CHILD          0       //                  子接続


// ＵＡＲＴ－ＳＩＯコントロール構造体
typedef struct {
    u16 BaudRate:2;         // ボーレート
    u16 Cts_Enable:1;       // 送信可能信号 イネーブル
    u16 ParitySelect:1;     // パリティ 偶数／奇数
    u16 TransDataFull:1;    // トランスミットデータ フル
    u16 RecvDataEmpty:1;    // レシーブデータ エンプティ
    u16 Error:1;            // エラー検出
    u16 Length:1;           // データ長
    u16 Fifo_Enable:1;      // ＦＩＦＯ イネーブル
    u16 Parity_Enable:1;    // パリティ イネーブル
    u16 Trans_Enable:1;     // トランスミッタ イネーブル
    u16 Recv_Enable:1;      // レシーバ イネーブル
    u16 Mode:2;             // 通信モード選択
    u16 IF_Enable:1;        // 割り込み要求 許可
    u16 Dammy_15:1;
    u8  Data;               // データ
    u8  Dummy_31_24;
} SioUartCnt;
typedef  vl SioUartCnt		vSioUartCnt;

#define ST_SIO_UART_MODE            3       // ＵＡＲＴ通信モード

#define ST_SIO_UART_7BIT            0       // ＵＡＲＴ通信 データ長 ７ｂｉｔ
#define ST_SIO_UART_8BIT            1       //                       ８ｂｉｔ
#define ST_SIO_PARITY_EVEN          0       // 偶数パリティ
#define ST_SIO_PARITY_ODD           1       // 奇数パリティ


// ＪＯＹバス通信コントロール構造体
typedef struct {
    u8  IF_Reset:1;         // ＪＯＹバス・リセット 割り込み要求
    u8  IF_Recv:1;          // ＪＯＹバス受信完了   割り込み要求
    u8  IF_Send:1;          // ＪＯＹバス送信完了   割り込み要求
    u8  Dummy_5_3:3;
    u8  IF_Enable:1;        // 割り込み要求 許可
    u8  Dummy_7:1;
} JoyCnt;
typedef  vl JoyCnt     vJoyCnt;

// ＪＯＹバス通信ステータス構造体
typedef struct {
    u8  Dummy_0:1;
    u8  Recv:1;             // 受信ステータス
    u8  Dummy_2:1;
    u8  Send:1;             // 送信ステータス
    u8  Flags:2;            // 汎用フラグ
    u8  Dummy_7_6:2;
} JoyStat;
typedef  vl JoyStat    vJoyStat;


// 汎用入出力コントロール構造体
typedef struct {
    u8  SC:1;               // データ
    u8  SD:1;
    u8  SI:1;
    u8  SO:1;
    u8  SC_I_O:1;           // Ｉ/Ｏ選択
    u8  SD_I_O:1;
    u8  SI_I_O:1;
    u8  SO_I_O:1;
    u8  IF_Enable:1;        // 割り込み要求 許可
    u8  Dummy_13_9:5;
    u8  SioModeMaster:2;   	// ＳＩＯモード・マスタ
} RCnt;
typedef  vl RCnt      vRCnt;

#define ST_R_SIO_MASTER_MODE        0       // ＳＩＯマスタ・モード
#define ST_R_DIRECT_MODE            2       // 汎用入出力通信モード
#define ST_R_JOY_MODE               3       // ＪＯＹ通信モード

#define ST_R_IN                     0       // 入力選択
#define ST_R_OUT                    1       // 出力選択


// ＤＭＡコントロール構造体
typedef struct {
    u16 Count;              // 転送数
    u16 Dummy_21_16:5;
    u16 DestpCnt:2;         // 転送先アドレス コントロール
    u16 SrcpCnt:2;          // 転送元アドレス コントロール
    u16 ContinuousON:1;     // コンティニュアスモード
    u16 BusSize:1;          // バスサイズ １６/３２Ｂｉｔ選択
    u16 DataRequest:1;      // データ要求同期モード
    u16 Timming:2;          // タイミング選択
    u16 IF_Enable:1;        // 割り込み要求 許可
    u16 Enable:1;           // ＤＭＡ許可
} DmaCnt;
typedef  vl DmaCnt    vDmaCnt;

#define ST_DMA_TIMMING_IMM          0       // 直ちに起動
#define ST_DMA_TIMMING_V_BLANK      1       // Ｖブランク起動
#define ST_DMA_TIMMING_H_BLANK      2       // Ｈブランク起動
#define ST_DMA_TIMMING_DISP         3       // 表示起動
#define ST_DMA_TIMMING_SOUND        3       // サウンドＦＩＦＯリクエスト起動
#define ST_DMA_16BIT_BUS            0       // バスサイズ１６Ｂｉｔ選択
#define ST_DMA_32BIT_BUS            1       // バスサイズ３２Ｂｉｔ選択
#define ST_DMA_INC                  0       // アドレス・インクリメント 選択
#define ST_DMA_DEC                  1       // アドレス・デクリメント   選択
#define ST_DMA_FIX                  2       // アドレス固定 選択
#define ST_DMA_RELOAD               3       // アドレス・インクリメント/リロード 選択


// タイマーコントロール構造体
typedef struct {
    u16 Count;              // カウント数
    u16 PreScaler:2;        // プリスケーラ選択
    u16 Connect:1;          // 下位タイマー接続
    u16 Dummy_5_3:3;
    u16 IF_Enable:1;        // 割り込み要求 許可
    u16 Enable:1;           // タイマー許可
    u16 Dummy_15_8:8;
} TimerCnt;
typedef  vl TimerCnt    vTimerCnt;

#define ST_TMR_PRESCALER_1CK        0        // プリスケーラ １分周
#define ST_TMR_PRESCALER_64CK       1        //            ６４分周
#define ST_TMR_PRESCALER_256CK      2        //          ２５６分周
#define ST_TMR_PRESCALER_1024CK     3        //        １０２４分周


// キーデータ構造体
typedef struct {
    u16 A:1;                // Ａ
    u16 B:1;                // Ｂ
    u16 Select:1;           // セレクト
    u16 Start:1;            // スタート
    u16 Plus_R:1;           // 右
    u16 Plus_L:1;           // 左
    u16 Plus_U:1;           // 上
    u16 Plus_D:1;           // 下
    u16 R:1;                // Ｒ
    u16 L:1;                // Ｌ
    u16 Dummy_15_10:6;
} KeyData;
typedef  vl KeyData    vKeyData;

// キーコントロール構造体
typedef struct {
    u16 Sel_A:1;            //       Ａボタン 選択
    u16 Sel_B:1;            //       Ｂボタン 選択
    u16 Sel_Select:1;       // セレクトボタン 選択
    u16 Sel_Start:1;        // スタートボタン 選択
    u16 Sel_Plus_R:1;       //         右キー 選択
    u16 Sel_Plus_L:1;       //         左キー 選択
    u16 Sel_Plus_U:1;       //         上キー 選択
    u16 Sel_Plus_D:1;       //         下キー 選択
    u16 Sel_R:1;            //       Ｒボタン 選択
    u16 Sel_L:1;            //       Ｌボタン 選択
    u16 Dummy_13_10:4;
    u16 IF_Enable:1;        // 割り込み要求 許可
    u16 IntrType:1;         // 割り込みタイプ 選択
} KeyCnt;
typedef  vl KeyCnt    vKeyCnt;

#define ST_KEY_OR_INTR              0        //   通常キー割り込み
#define ST_KEY_AND_INTR             1        // ＡＮＤキー割り込み


// カセットウェイトコントロール構造体
typedef struct {
    u16 Sram:2;             // ＳＲＡＭウェイト
    u16 Rom0_1st:2;         // ＲＯＭ０ １ｓｔウェイト
    u16 Rom0_2nd:1;         //          ２ｎｄウェイト
    u16 Rom1_1st:2;         // ＲＯＭ１ １ｓｔウェイト
    u16 Rom1_2nd:1;         //          ２ｎｄウェイト
    u16 Rom2_1st:2;         // ＲＯＭ２ １ｓｔウェイト
    u16 Rom2_2nd:1;         //          ２ｎｄウェイト
    u16 OutClock:2;         // 出力クロック 選択
    u16 Dummy_13:1;
    u16 PrefetchEnale:1;    // プリフェッチバッファ 許可
    u16 CassetteType:1;     // カセットタイプ
} CstWaitCnt;
typedef  vl CstWaitCnt    vCstWaitCnt;

#define ST_CST_SRAM_4WAIT           0        // ＳＲＡＭ        ４ウェイト
#define ST_CST_SRAM_3WAIT           1        //                 ３ウェイト
#define ST_CST_SRAM_2WAIT           2        //                 ２ウェイト
#define ST_CST_SRAM_8WAIT           3        //                 ８ウェイト
#define ST_CST_ROM_1ST_4WAIT        0        // ＲＯＭ   １ｓｔ ４ウェイト
#define ST_CST_ROM_1ST_3WAIT        1        //                 ３ウェイト
#define ST_CST_ROM_1ST_2WAIT        2        //                 ２ウェイト
#define ST_CST_ROM_1ST_8WAIT        3        //                 ８ウェイト
#define ST_CST_ROM0_2ND_2WAIT       0        // ＲＯＭ０ ２ｎｄ ２ウェイト
#define ST_CST_ROM0_2ND_1WAIT       1        //                 １ウェイト
#define ST_CST_ROM1_2ND_4WAIT       0        // ＲＯＭ１ ２ｎｄ ４ウェイト
#define ST_CST_ROM1_2ND_1WAIT       1        //                 １ウェイト
#define ST_CST_ROM2_2ND_8WAIT       0        // ＲＯＭ２ ２ｎｄ ８ウェイト
#define ST_CST_ROM2_2ND_1WAIT       1        //                 １ウェイト

#define ST_CST_PHI_OUT_NONE         0        // φ端子出力クロック Ｌｏ固定
#define ST_CST_PHI_OUT_4MCK         1        //                    ４ＭＨｚ
#define ST_CST_PHI_OUT_8MCK         2        //                    ８ＭＨｚ
#define ST_CST_PHI_OUT_16MCK        3        //                  １６ＭＨｚ
#define ST_CST_AGB                  0        // ＡＧＢカセット
#define ST_CST_CGB                  1        // ＣＧＢカセット


// Bit圧縮データ展開用パラメータ
typedef struct {
    u16 SrcNum;             // ソースデータ・バイト数
    u8  SrcBitNum;          // １ソースデータ・ビット数
    u8  DestBitNum;         // １デスティネーションデータ・ビット数
    u32 DestOffset:31;      // ソースデータに加算する数
    u32 DestOffset0_On:1;   // ０のデータにオフセットを加算するか否かのフラグ
} BitUnPackParam;
typedef  vl BitUnPackParam    vBitUnPackParam;


#ifdef __cplusplus
}      /* extern "C" */
#endif

#endif /* _AGB_TYPES_H */
