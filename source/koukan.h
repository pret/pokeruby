//-----------------------------------------------------------
//    アクターデータ
//-----------------------------------------------------------
static const ActOamData NameOamData = {
		0,		//u32 VPos:8;             // Ｙ座標
		0,		//u32 AffineMode:2;       // アフィンモード
		0,		//u32 ObjMode:2;          // ＯＢＪモード
		OFF,	//u32 Mosaic:1;           // モザイク
		0,		//u32 ColorMode:1;        // １６色/２５６色 選択
		1,		//u32 Shape:1;            // ＯＢＪ形状(横長方形)

		0,		//u32 HPos:9;             // Ｘ座標
		0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
		2,		//u32 Size:2;             // ＯＢＪサイズ(2だと32x16  3だと64x32)

		0,		//u32 CharNo:10;          // キャラクタＮｏ
		1,      //u32 Priority:2;         // 表示優先
		0,		//u32 Pltt:4;             // パレットＮｏ
		0,
};

static const actAnm NameAnm0[]={
		{OBJ16_32x16*0,5,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm NameAnm1[]={
		{OBJ16_32x16*1,5,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm NameAnm2[]={
		{OBJ16_32x16*2,5,0,0},
		{ACT_ANMEND,0,0,0}
};

static const actAnm NameAnm3[]={
		{OBJ16_32x16*3,5,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm NameAnm4[]={
		{OBJ16_32x16*4,5,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm NameAnm5[]={
		{OBJ16_32x16*5,5,0,0},
		{ACT_ANMEND,0,0,0}
};

static const actAnm *const NameAnmTbl[]={
		NameAnm0,
		NameAnm1,
		NameAnm2,
		NameAnm3,
		NameAnm4,
		NameAnm5,
};


//アニメーションデータフォーマット
/*
	s16 pat;	        //ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ
	u8 	wait:6;		//ｳｪｲﾄ
	u8 	hrev:1;		//H反転
	u8 	vrev:1;		//V反転
*/

static const u16 PM_Print_Palette[16] = {
0x0000,		//透明色
0x2529,		//黒
0x001F,		//赤
0x03E0,		//緑
0x7C00,		//青
0x03FF,		//黄色
0x7FE0,		//水色
0x7C1F,		//紫
//0x675a,0x0000,0x0000,0x0000,0x6e93,0x0000,0x76d5,
0x675a,0x0000,0x0000,0x0000,0x7fff,0x0000,0x39ce,		// 0    111 01    10 110    1 0101,
0x7FFF,		//白
};


static const u16 Test_Palette[16] = {
0x0000,		//透明色
0x2529,		//黒
0x001F,		//赤
0x03E0,		//緑
0x7C00,		//青
0x03FF,		//黄色
0x7FE0,		//水色
0x7C1F,		//紫
//0x675a,0x0000,0x0000,0x0000,0x6e93,0x0000,0x76d5,
0x39ce,0x0000,0x0000,0x0000,0x7fff,0x0000,0x39ce,		// 0    111 01    10 110    1 0101,
0x7FFF,		//白
};


#define EXPLAIN_CELL	(6*4)			//6セル使っていて、1セルには4文字入るから

static u8 *NameCellBuf[13]={};


static const CellData NameActCell[]={
	{&UserWork[0x1d000+0x20*4*2* 0],0x20*4*2,200},		//自分の名前セル１
	{&UserWork[0x1d000+0x20*4*2* 1],0x20*4*2,201},		//			セル２
	{&UserWork[0x1d000+0x20*4*2* 2],0x20*4*2,202},		//			セル３
	{&UserWork[0x1d000+0x20*4*2* 3],0x20*4*2,203},		//相手の名前セル１
	{&UserWork[0x1d000+0x20*4*2* 4],0x20*4*2,204},		//			セル２
	{&UserWork[0x1d000+0x20*4*2* 5],0x20*4*2,205},		//			セル３
	{&UserWork[0x1d000+0x20*4*2* 6],0x20*4*2,206},		//「やめる」
	{&UserWork[0x1d000+0x20*4*2* 7],0x20*4*2,207},		//説明文セル１
	{&UserWork[0x1d000+0x20*4*2* 8],0x20*4*2,208},		//説明文セル２
	{&UserWork[0x1d000+0x20*4*2* 9],0x20*4*2,209},		//説明文セル３
	{&UserWork[0x1d000+0x20*4*2*10],0x20*4*2,210},		//説明文セル４
	{&UserWork[0x1d000+0x20*4*2*11],0x20*4*2,211},		//説明文セル５
	{&UserWork[0x1d000+0x20*4*2*12],0x20*4*2,212},		//説明文セル６

#if 0
	{NameCellBuf[0],0x20*4*2,200},		//自分の名前セル１
	{NameCellBuf[1],0x20*4*2,201},		//			セル２
	{NameCellBuf[2],0x20*4*2,202},		//			セル３
	{NameCellBuf[3],0x20*4*2,203},		//相手の名前セル１
	{NameCellBuf[4],0x20*4*2,204},		//			セル２
	{NameCellBuf[5],0x20*4*2,205},		//			セル３
	{NameCellBuf[6],0x20*4*2,206},		//「やめる」
	{NameCellBuf[7],0x20*4*2,207},		//説明文セル１
	{NameCellBuf[8],0x20*4*2,208},		//説明文セル２
	{NameCellBuf[9],0x20*4*2,209},		//説明文セル３
	{NameCellBuf[10],0x20*4*2,210},		//説明文セル４
	{NameCellBuf[11],0x20*4*2,211},		//説明文セル５
	{NameCellBuf[12],0x20*4*2,212},		//説明文セル６
#endif
};

static const PalData NameActPal = 
{
	PM_Print_Palette,
	4925,
};
//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------

const	actHeader ActNameHeader={
		200,
		4925,
		&NameOamData,
		NameAnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		DummyActMove,
};



//-----------------------------------------------------------
//    アクターデータ
//-----------------------------------------------------------
static const ActOamData CursorOamData = {
		0,		//u32 VPos:8;             // Ｙ座標
		0,		//u32 AffineMode:2;       // アフィンモード
		0,		//u32 ObjMode:2;          // ＯＢＪモード
		OFF,	//u32 Mosaic:1;           // モザイク
		0,		//u32 ColorMode:1;        // １６色/２５６色 選択
		1,		//u32 Shape:1;            // ＯＢＪ形状(横長方形)

		0,		//u32 HPos:9;             // Ｘ座標
		0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
		3,		//u32 Size:2;             // ＯＢＪサイズ(2だと32x16  3だと64x32)

		0,		//u32 CharNo:10;          // キャラクタＮｏ
		1,      //u32 Priority:2;         // 表示優先
		0,		//u32 Pltt:4;             // パレットＮｏ
		0,
};

static const actAnm cursorAnm0[]={
		{OBJ16_64x32*0,5,0,0},
		{ACT_ANMEND,0,0,0}
};

static const actAnm cursorAnm1[]={
		{OBJ16_64x32*1,5,0,0},
		{ACT_ANMEND,0,0,0}
};

static const actAnm *const CursorAnmTbl[]={
		cursorAnm0,
		cursorAnm1,
};


//アニメーションデータフォーマット
/*
	s16 pat;	        //ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ
	u8 	wait:6;		//ｳｪｲﾄ
	u8 	hrev:1;		//H反転
	u8 	vrev:1;		//V反転
*/

static const CellData CursorActCell[]={
	{kk_cusor_Character,0x20*(8*4*2),300},
};

static const PalData CursorActPal = 
{
	&kk_bg_Palette[0x30],		//kk_bg.aclの４列目はアクター用のパレット
	2345,
};

//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------

const	actHeader CursorHeader={
		300,
		2345,
		&CursorOamData,
		CursorAnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		DummyActMove,
};



//-------------------------------------------------------------
//  こうかん時通信用コマンド定義	
//-------------------------------------------------------------

#define KOUKAN_SAVE_TIMING		(0xAAAA)		//セーブする場所を通知する				（親）
#define KOUKAN_WAIT_IN			(0xAABB)        //通信待機状態にはいりました。			（子）
#define KOUKAN_NEXT_TERM		(0xDDDD)		//こうかんの最終確認状況にうつります	（親）
#define KOUKAN_SEND_YES			(0xBBBB)        //交換に対して「はい」をおくります		（子）
#define KOUKAN_SEND_NO			(0xBBCC)        //交換に対して「いいえ」を送ります		（子・親）
#define KOUKAN_EXCHANGE			(0xCCDD)        //自分の何番と相手の何番を交換します。	（親）
#define KOUKAN_STOP				(0xDDEE)        //交換はストップ						（親）
#define KOUKAN_END_SELECT		(0xEEAA)		//交換終了を選択した
#define KOUKAN_END_OK			(0xEEBB)		//交換終了が確認された
#define KOUKAN_END_STOP			(0xEECC)		//交換終了がキャンセルされた


//-------------------------------------------------------------
//  kw->wait_flag[]に格納する値
//-------------------------------------------------------------
#define SELECT_KOUKAN			(1)
#define SELECT_END				(2)

//-------------------------------------------------------------
//  kw->ok_flag[]に格納する値
//-------------------------------------------------------------
#define KOUKAN_YES				(1)
#define KOUKAN_NO				(2)
