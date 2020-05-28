/********************************************************************/
/* File Name : hyougen.h											*/
/* Outline   : ポケモン仕草表現データ								*/
/* Author    : Original (Nori)										*/
/* Date      : 2002.08.14                                           */
/********************************************************************/


static	void	CalcPcount(void) ;
static	void	HyoGenMain(void) ;
static	u8		ArcMoveInit(void) ;
static	u8		ArcMoveMain(void) ;
static	u8		ArcMoveEnd(void) ;
static	void	MoveTblGet(void) ;
static	void	PosOffset(void) ;


#define		LOOP_MAX				512			// 最大ループ（カウント）数
#define		HGTBL_PARAM_MAX			10						//HGtblの要素数
#define		HGWK_PARAM_MAX			HGTBL_PARAM_MAX + 5		//計算用ワークの要素数
#define		PAT_TEST				-1

#define		P_ANGLE_INIT		0			// 初期角度
#define		P_ANGLE_ADD			1			// 角度増加量
#define		P_SWING_X			2			// 振り幅X
#define		P_SWING_Y			3			// 振り幅Y
#define		P_LOOP_CNT			4			// ループ回数(0:何もしない,1～:計算する回数)
#define		P_ACCELERATION		5			// 加速度
#define		P_END_X				6			// 終点X(始点からの相対値)
#define		P_END_Y				7			// 終点Y(始点からの相対値)
#define		P_BACK_START_CNT	8			// 何ループ目から戻すか
#define		P_CONTINUE			9			//

#define		P_SIN_MOVE_INIT		10			// はじめのSIN値(ｵﾌｾｯﾄ)保存用
#define		P_COS_MOVE_INIT		11			// はじめのCOS値(ｵﾌｾｯﾄ)保存用
#define		P_ALL_CNT			12			// 最大カウント数記録用(LOOP_CNTの保持用)
#define		P_START_X			13			// 始点X(絶対値)※dx
#define		P_START_Y			14			// 始点Y(絶対値)※dy


actWork		*HGActReg ;					// アクターアドレス保管用
actWork		HGActTmp ;					// アクターデータ保管用

pFunc		HGret ;						// 戻りアドレス(tnavi.cでセット)用 
pFunc		*HGsubProc ;				// コプロセス保管用

u8			SeqHyoGen ;					// 動作監視用
u8			HGtp ;						// 読み出すテーブルのポイント
u8			HGAtp ;						// 読み出すテーブルのポイント

u8			Ka_FF ;
u16			Ka_PMn ;
u8			Ka_Seikaku ;
u8			Ka_act ;
u8			Ka_Mode ;
u16			Ka_Pcount ;					// パターン実行時のトータル処理カウント
u16			pat_c ;

#define		MoveTbl_X	( (s16 *)&UserWork[0x1d000] )				// 全移動データ格納用 X
#define		MoveTbl_Y	( (s16 *)&UserWork[0x1d000+LOOP_MAX*2] )	// 全移動データ格納用 Y
s16			HGwork[HGWK_PARAM_MAX] ;	// 動作パラメータ格納用


// Renewal


static	const	u8	HGindex[25][2] = {
	{0, 0}, {3, 0}, {4, 1}, {5, 0}, {10, 0},
	{13, 0}, {15, 0}, {16, 2}, {18, 0}, {19, 0},
	{20, 0}, {25, 0}, {27, 3}, {28, 0}, {29, 0},
	{33, 4}, {36, 0}, {37, 0}, {39, 0}, {42, 0},
	{45, 0}, {46, 5}, {47, 6}, {48, 0}, {53, 0}
} ;


static	const	s16		HGtbl[][HGTBL_PARAM_MAX] = {
// No.00(00) がんばりや
	{0, 4, 0, 8, 24, 0, 0, 0, 12, 0},
	{0, 4, 0, 16, 24, 0, 0, 0, 12, 0},
	{0, 4, 0, 32, 32, 0, 0, 0, 16, 1},

// No.01(03) さみしがりや
	{0, 3, 6, 0, 48, 0, 0, 0, 24, 1},

// No.02(04) ゆうかん
	{64, 16, -24, 0, 32, 0, 0, 0, 0, 1},

// No.03(05) いじっぱり
	{0, 4, 8, 0, 16, 0, -8, 0, 0, 0},
	{0, 0, 0, 0, 16, 0, 0, 0, 0, 0},
	{0, 4, 8, 0, 16, 0, -8, 0, 0, 0},
	{0, 0, 0, 0, 16, 0, 0, 0, 0, 0},
	{0, 4, -16, 0, 4, 0, 16, 0, 0, 1},

// No.04(10) やんちゃ
	{0, 3, 6, 0, 12, 0, 0, 0, 6, 0},
	{0, 3, -6, 0, 12, 0, 0, 0, 6, 0},
	{0, 16, 16, 0, 45, 1, 0, 0, 0, 1},

// No.05(13) ずぶとい
	{0, 16, 0, 24, 32, 0, 0, 0, 16, 0},
	{0, 16, 0, 23, 32, 0, 0, 0, 16, 1},

// No.06(15) すなお
	{0, 0, 0, 0, 80, 0, 0, 0, 0, 1},

// No.07(16) のんき
	{0, 2, 8, 0, 32, 0, 0, 0, 0, 0},
	{0, 2, -8, 0, 32, 0, 0, 0, 0, 1},

// No.08(18) わんぱく
	{0, 32, 2, 1, 48, 1, 0, 0, 24, 1},

// No.09(19) のうてんき
	{0, 2, 16, 16, 128, 0, 0, 0, 0, 1},

// No.10(20) おくびょう
	{0, 2, -8, 0, 48, 0, -24, 0, 0, 0},
	{0, 0, 0, 0, 8, 0, 0, 0, 0, 0},
	{64, 32, 2, 0, 36, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 8, 0, 0, 0, 0, 0},
	{0, 2, 8, 0, 48, 0, 24, 0, 0, 1},

// No.11(25) せっかち
	{64, 24, 16, 0, 32, 0, 0, 0, 0, 0},
	{0, 28, 2, 1, 32, 1, 0, 0, 16, 1},

// No.12(27) まじめ
	{0, 0, 0, 0, 32, 0, 0, 0, 0, 1},

// No.13(28) ようき
	{64, 16, -16, 2, 48, 0, 0, 0, 32, 1},

// No.14(29) むじゃき
	{0, 12, -8, 4, 24, 0, 8, 0, 12, 0},
	{0, 12, 8, 8, 24, 0, -16, 0, 12, 0},
	{0, 12, -8, 16, 24, 0, 16, 0, 12, 0},
	{0, 12, 8, 28, 24, 0, -8, 0, 12, 1},

// No.15(33) ひかえめ
	{0, 0, 0, 0, 8, 0, 0, 0, 0, 0},
	{64, 16, -4, 0, 32, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 8, 0, 0, 0, 0, 1},

// No.16(36) おっとり
	{128, 4, 0, 8, 64, 0, 0, 0, 0, 1},

// No.17(37) れいせい
	{0, 2, 16, 0, 48, 0, 0, 0, 0, 0},
	{128, 2, 16, 0, 48, 0, 0, 0, 0, 1},

// No.18(39) てれや
	{0, 2, -4, 0, 48, 0, -48, 0, 0, 0},
	{0, 0, 0, 0, 80, 0, 0, 0, 0, 0},
	{0, 2, 8, 0, 24, 0, 48, 0, 0, 1},

// No.19(42) うっかりや
	{64, 4, 64, 58, 52, 0, -88, 0, 0, 0},
	{0, 0, 0, 0, 80, 0, 0, 0, 0, 0},
	{0, 24, 80, 0, 32, 0, 88, 0, 0, 1},

// No.20(45) おだやか
	{0, 2, 16, 4, 64, 0, 0, 0, 0, 1},

// No.21(46) おとなしい
	{0, 0, 0, 0, 32, 0, 0, 0, 0, 1},

// No.22(47) なまいき
	{0, 0, 0, 0, 42, 0, 0, 0, 0, 1},

// No.23(48) しんちょう
	{0, 4, 0, 8, 24, 0, 0, 0, 12, 0},
	{0, 0, 0, 0, 12, 0, 0, 0, 0, 0},
	{0, 4, 0, 12, 24, 0, 0, 0, 12, 0},
	{0, 0, 0, 0, 12, 0, 0, 0, 0, 0},
	{0, 4, 0, 4, 24, 0, 0, 0, 12, 1},

// No.24(53) きまぐれ
	{0, 4, 16, 12, 64, 0, 0, 0, 0, 0},
	{0, -4, 16, 12, 64, 0, 0, 0, 0, 1},
} ;


// 反転
static	const	actAffAnm	Ka_Reverse[] = {
	{-0x0100, 0x0100, 0, ACT_AFSET},
	{ACT_AFEND, 0, 0, 0 }
} ;

// ゆうかん
static	const	actAffAnm	Ka_Yuukan[] = {
	{0, 0, 12, 1},
	{0, 0, 0, 30},
	{0, 0, -12, 1},
	{ACT_AFEND, 0, 0, 0}
} ;

static	const	actAffAnm	Ka_YuukanR[] = {
	{-0x0100, 0x0100, 0, ACT_AFSET},
	{0, 0, 12, 1},
	{0, 0, 0, 28},
	{0, 0, -4, 3},
	{ACT_AFEND, 0, 0, 0}
} ;

// のんき
static	const	actAffAnm	Ka_Nonki[] = {
	{0, 0, 1, 16},
	{0, 0, -1, 32},
	{0, 0, 1, 16},
	{ACT_AFEND, 0, 0, 0}
} ;

static	const	actAffAnm	Ka_NonkiR[] = {
	{-0x0100, 0x0100, 0, ACT_AFSET},
	{0, 0, 1, 16},
	{0, 0, -1, 32},
	{0, 0, 1, 16},
	{ACT_AFEND, 0, 0, 0}
} ;

// まじめ
static	const	actAffAnm	Ka_Majime[] = {
	{0, 0, -1, 8},
	{0, 0, 0, 16},
	{0, 0, 1, 8},
	{ACT_AFEND, 0, 0, 0}
} ;

static	const	actAffAnm	Ka_MajimeR[] = {
	{-0x0100, 0x0100, 0, ACT_AFSET},
	{0, 0, -1, 8},
	{0, 0, 0, 16},
	{0, 0, 1, 8},
	{ACT_AFEND, 0, 0, 0}
} ;

// ひかえめ
static	const	actAffAnm	Ka_Hikaeme[] = {
	{0, 0, -1, 8},
	{0, 0, 0, 32},
	{0, 0, 1, 8},
	{ACT_AFEND, 0, 0, 0}
} ;

static	const	actAffAnm	Ka_HikaemeR[] = {
	{-0x0100, 0x0100, 0, ACT_AFSET},
	{0, 0, -1, 8},
	{0, 0, 0, 32},
	{0, 0, 1, 8},
	{ACT_AFEND, 0, 0, 0}
} ;

// おとなしい
static	const	actAffAnm	Ka_Otonashii[] = {
	{0, 0, -1, 4},
	{0, 0, 0, 24},
	{0, 0, 1, 4},
	{ACT_AFEND, 0, 0, 0}
} ;

static	const	actAffAnm	Ka_OtonashiiR[] = {
	{-0x0100, 0x0100, 0, ACT_AFSET},
	{0, 0, -1, 4},
	{0, 0, 0, 24},
	{0, 0, 1, 4},
	{ACT_AFEND, 0, 0, 0}
} ;

// なまいき
static	const	actAffAnm	Ka_Namaiki[] = {
	{0, 0, 1, 24},
	{0, 0, 0, 16},
	{0, 0, -12, 2},
	{ACT_AFEND, 0, 0, 0}
} ;

static	const	actAffAnm	Ka_NamaikiR[] = {
	{-0x0100, 0x0100, 0, ACT_AFSET},
	{0, 0, 1, 24},
	{0, 0, 0, 16},
	{0, 0, -12, 2},
	{ACT_AFEND, 0, 0, 0}
} ;


static	const	actAffAnm	*const	HGAnmTbl[] = {
	Ka_Reverse,					// 0 -- 反転
//-------------------------------------- 非反転＋動作
	Ka_Yuukan,					// 1 -- ゆうかん
	Ka_Nonki,					// 2 -- のんき
	Ka_Majime,					// 3 -- まじめ
	Ka_Hikaeme,					// 4 -- ひかえめ
	Ka_Otonashii,				// 5 -- おとなしい
	Ka_Namaiki,					// 6 -- なまいき
	Ka_Reverse,					// 7
	Ka_Reverse,					// 8
	Ka_Reverse,					// 9
	Ka_Reverse,					// 10
//-------------------------------------- 反転＋動作
	Ka_YuukanR,					// 11 -- ゆうかん
	Ka_NonkiR,					// 12 -- のんき
	Ka_MajimeR,					// 13 -- まじめ
	Ka_HikaemeR,				// 14 -- ひかえめ
	Ka_OtonashiiR,				// 15 -- おとなしい
	Ka_NamaikiR,				// 16 -- なまいき
	Ka_Reverse,					// 17
	Ka_Reverse,					// 18
	Ka_Reverse,					// 19
	Ka_Reverse,					// 20
} ;






