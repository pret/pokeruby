//-----------------------------------------------------------
//    ブレンドマシーン用アクター定義
//-----------------------------------------------------------
#define LIGHT1_CELL_ID			5550
#define LIGHT1_PAL_ID			5551
#define LIGHT2_CELL_ID			5552
#define GBA_CONNECT_CELL_ID		5554
#define GBA_PARTS_PAL_ID		5555
#define GBA_MONITOR_CELL_ID		5556
#define MONSTERBALL_CELL_ID		5557
#define MONSTERBALL_PAL_ID		5558


//-------------------------------------------------------------
//  モンスターボール
//-------------------------------------------------------------
static void BallActMove(actWork *act);
static void BallActMove2(actWork *act);
static void BallActMove3(actWork *act);
static void BallActMove4(actWork *act);


static const ActOamData BallOamData = {
		0,		//u32 VPos:8;             // Ｙ座標
		1,		//u32 AffineMode:2;       // アフィンモード
		0,		//u32 ObjMode:2;          // ＯＢＪモード
		OFF,	//u32 Mosaic:1;           // モザイク
		0,		//u32 ColorMode:1;        // １６色/２５６色 選択
		0,		//u32 Shape:1;            // ＯＢＪ形状(横長方形)

		0,		//u32 HPos:9;             // Ｘ座標
		0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
		1,		//u32 Size:2;             // ＯＢＪサイズ(2だと32x16  3だと64x32)

		0,		//u32 CharNo:10;          // キャラクタＮｏ
		0,      //u32 Priority:2;         // 表示優先
		0,		//u32 Pltt:4;             // パレットＮｏ
		0,
};
static const actAnm BallAnm0[]={
		{OBJ16_16x16*0, 3,0,0},
		{OBJ16_16x16*1, 3,0,0},
		{OBJ16_16x16*2, 3,0,0},
		{OBJ16_16x16*3, 3,0,0},
		{OBJ16_16x16*4, 3,0,0},
		{OBJ16_16x16*5, 3,0,0},
		{OBJ16_16x16*6, 3,0,0},
		{OBJ16_16x16*7, 3,0,0},
		{OBJ16_16x16*8, 3,0,0},
		{OBJ16_16x16*9, 3,0,0},
		{OBJ16_16x16*10,3,0,0},
		{OBJ16_16x16*11,3,0,0},
		{ACT_ANMcLOOP, 1,0,0},
		{OBJ16_16x16*0, 3,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm BallAnm1[]={
		{OBJ16_16x16*0, 3,0,0},
		{OBJ16_16x16*1, 3,0,0},
		{OBJ16_16x16*2, 3,0,0},
		{OBJ16_16x16*3, 3,0,0},
		{OBJ16_16x16*4, 3,0,0},
		{OBJ16_16x16*5, 3,0,0},
		{OBJ16_16x16*6, 3,0,0},
		{OBJ16_16x16*7, 3,0,0},
		{OBJ16_16x16*8, 3,0,0},
		{OBJ16_16x16*9, 3,0,0},
		{OBJ16_16x16*10,3,0,0},
		{OBJ16_16x16*11,3,0,0},
		{ACT_ANMcLOOP, 2,0,0},
		{OBJ16_16x16*0, 3,0,0},
		{ACT_ANMEND,0,0,0}
};


static const actAnm *const BallAnmTbl[]={
		BallAnm0,
		BallAnm1,
};


//アニメーションデータフォーマット
/*
	s16 pat;	        //ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ
	u8 	wait:6;		//ｳｪｲﾄ
	u8 	hrev:1;		//H反転
	u8 	vrev:1;		//V反転
*/

static const actAffAnm BallAff0[] = {	//右上
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0,0,0,1},
	{ACT_AFEND, 0, 0, 0 },
};

static const actAffAnm BallAff1[] = {	//右上
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{-8,0,0,20},
	{ACT_AFEND, 0, 0, 0 },
};

static const actAffAnm BallAff2[] = {	//右上
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0x100-8*20,0x100,0,ACT_AFSET},
	{0,0,0,5},
	{8,0,0,20},
	{ACT_AFEND, 0, 0, 0 },
};

const actAffAnm * const BallAffTbl[] = {
	BallAff0,
	BallAff1,
	BallAff2,
};


static const CellData BallActCell={
	ballani_Character,0x20*4*12,MONSTERBALL_CELL_ID
};

static const PalData BallActPal={
	(u16*)&ballani_Palette,	MONSTERBALL_PAL_ID,
};


//-------------------------------------------------------------
//		アクターヘッダー(判定アイコン)
//-------------------------------------------------------------

static const	actHeader BallHeader={
		MONSTERBALL_CELL_ID,
		MONSTERBALL_PAL_ID,
		&BallOamData,
		BallAnmTbl,
		ACT_NTRANS,
		BallAffTbl,
		BallActMove,
};

// ----------------------------------------------------------
//	32x32の光
// ----------------------------------------------------------

static void Light1ActMove(actWork *act);

static const ActOamData Light1OamData = {
		0,		//u32 VPos:8;             // Ｙ座標
		1,		//u32 AffineMode:2;       // アフィンモード
		1,		//u32 ObjMode:2;          // ＯＢＪモード
		OFF,	//u32 Mosaic:1;           // モザイク
		0,		//u32 ColorMode:1;        // １６色/２５６色 選択
		0,		//u32 Shape:1;            // ＯＢＪ形状(横長方形)

		0,		//u32 HPos:9;             // Ｘ座標
		0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
		2,		//u32 Size:2;             // ＯＢＪサイズ(2だと32x16  3だと64x32)

		0,		//u32 CharNo:10;          // キャラクタＮｏ
		1,      //u32 Priority:2;         // 表示優先
		0,		//u32 Pltt:4;             // パレットＮｏ
		0,
};

static const actAnm Light1Anm0[]={		
	{OBJ16_32x32*0,5,1,1},
	{ACT_ANMEND,0,0,0}
};


static const actAnm *const Light1AnmTbl[]={
		Light1Anm0,
};

static const actAffAnm Light1Aff0[] = {	//右上
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{-10,-10,0,5},
	{10,10,0,5},
	{ACT_AFLOOP, 0, 0, 0 },
};

const actAffAnm * const Light1AffTbl[] = {
	Light1Aff0,
};

//アニメーションデータフォーマット
/*
	s16 pat;	        //ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ
	u8 	wait:6;		//ｳｪｲﾄ
	u8 	hrev:1;		//H反転
	u8 	vrev:1;		//V反転
*/

static const CellData Light1ActCell={
	koukan_o_Character,0x20*16,LIGHT1_CELL_ID,
};

static const PalData Light1ActPal = 
{
	(u16*)&koukan_o_Palette[16*4],	LIGHT1_PAL_ID,
};

static const PalData GBAPartsActPal = 
{
	(u16*)&koukan_o_Palette[16*1],	GBA_PARTS_PAL_ID,
};

//-------------------------------------------------------------
//		アクターヘッダー
//-------------------------------------------------------------

static const	actHeader Light1Header={
		LIGHT1_CELL_ID,
		LIGHT1_PAL_ID,
		&Light1OamData,
		Light1AnmTbl,
		ACT_NTRANS,
		Light1AffTbl,
		Light1ActMove,
};


// ----------------------------------------------------------
//	16x32の光
// ----------------------------------------------------------

static void Light2ActMove(actWork *act);

static const ActOamData Light2OamData = {
		0,		//u32 VPos:8;             // Ｙ座標
		0,		//u32 AffineMode:2;       // アフィンモード
		0,		//u32 ObjMode:2;          // ＯＢＪモード
		OFF,	//u32 Mosaic:1;           // モザイク
		0,		//u32 ColorMode:1;        // １６色/２５６色 選択
		2,		//u32 Shape:1;            // ＯＢＪ形状(横長方形)

		0,		//u32 HPos:9;             // Ｘ座標
		0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
		2,		//u32 Size:2;             // ＯＢＪサイズ(2だと32x16  3だと64x32)

		0,		//u32 CharNo:10;          // キャラクタＮｏ
		1,      //u32 Priority:2;         // 表示優先
		0,		//u32 Pltt:4;             // パレットＮｏ
		0,
};

static const actAnm Light2Anm0[]={			//ライト２
	{OBJ16_32x16*0,5,1,1},
	{ACT_ANMEND,0,0,0}
};

static const actAnm Light2Anm1[]={			//ライト２
	{OBJ16_32x16*1,5,1,1},
	{ACT_ANMEND,0,0,0}
};

static const actAnm *const Light2AnmTbl[]={
		Light2Anm0,
		Light2Anm1,
};


//アニメーションデータフォーマット
/*
	s16 pat;	        //ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ
	u8 	wait:6;		//ｳｪｲﾄ
	u8 	hrev:1;		//H反転
	u8 	vrev:1;		//V反転
*/

static const CellData Light2ActCell={
	(u8*)&koukan_o_Character[0x20*16],0x20*(16+8),LIGHT2_CELL_ID,
};

static const	actHeader Light2Header={
		LIGHT2_CELL_ID,
		LIGHT1_PAL_ID,
		&Light2OamData,
		Light2AnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		Light2ActMove,
};



// ----------------------------------------------------------
//	16x32の光とコネクタ部分
// ----------------------------------------------------------

static void ConnectActMove(actWork *act);
static void ConnectActMove2(actWork *act);

static const ActOamData ConnectOamData = {
		0,		//u32 VPos:8;             // Ｙ座標
		0,		//u32 AffineMode:2;       // アフィンモード
		0,		//u32 ObjMode:2;          // ＯＢＪモード
		OFF,	//u32 Mosaic:1;           // モザイク
		0,		//u32 ColorMode:1;        // １６色/２５６色 選択
		2,		//u32 Shape:1;            // ＯＢＪ形状(横長方形)

		0,		//u32 HPos:9;             // Ｘ座標
		0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
		2,		//u32 Size:2;             // ＯＢＪサイズ(2だと32x16  3だと64x32)

		0,		//u32 CharNo:10;          // キャラクタＮｏ
		1,      //u32 Priority:2;         // 表示優先
		0,		//u32 Pltt:4;             // パレットＮｏ
		0,
};

static const actAnm ConnectAnm0[]={			//ライト２
	{OBJ16_16x32*0,10,0,0},
	{ACT_ANMEND,0,0,0}
};


static const actAnm *const ConnectAnmTbl[]={
		ConnectAnm0,
};


//アニメーションデータフォーマット
/*
	s16 pat;	        //ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ
	u8 	wait:6;		//ｳｪｲﾄ
	u8 	hrev:1;		//H反転
	u8 	vrev:1;		//V反転
*/

static const CellData ConnectActCell={
	(u8*)&koukan_o_Character[0x20*16*2],0x20*8,GBA_CONNECT_CELL_ID,
};

//-------------------------------------------------------------
//		アクターヘッダー
//-------------------------------------------------------------

static const	actHeader ConnectHeader={
		GBA_CONNECT_CELL_ID,
		GBA_PARTS_PAL_ID,
		&ConnectOamData,
		ConnectAnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		ConnectActMove,
};

// ----------------------------------------------------------
//	64x32のモニターの光
// ----------------------------------------------------------

static void MonitorActMove(actWork *act);

static const ActOamData MonitorOamData = {
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

static const actAnm MonitorAnm0[]={			//モニター
	{OBJ16_64x32*0,2,1,1},
	{OBJ16_64x32*1,2,1,1},
	{OBJ16_64x32*2,2,1,1},
	{OBJ16_64x32*3,2,1,1},
	{OBJ16_64x32*2,2,1,1},
	{OBJ16_64x32*1,2,1,1},
	{OBJ16_64x32*0,2,1,1},

	{ACT_ANMcLOOP, 8,0,0},

	{ACT_ANMEND,0,0,0}
};



static const actAnm *const MonitorAnmTbl[]={
		MonitorAnm0,
};


//アニメーションデータフォーマット
/*
	s16 pat;	        //ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ
	u8 	wait:6;		//ｳｪｲﾄ
	u8 	hrev:1;		//H反転
	u8 	vrev:1;		//V反転
*/

static const CellData MonitorActCell={
	(u8*)&koukan_o_Character[0x20*16*3],0x20*16*2*4,GBA_MONITOR_CELL_ID,
};

//-------------------------------------------------------------
//		アクターヘッダー
//-------------------------------------------------------------

static const	actHeader MonitorHeader={
		GBA_MONITOR_CELL_ID,
		GBA_PARTS_PAL_ID,
		&MonitorOamData,
		MonitorAnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		MonitorActMove,
};

static void Light1ActMove(actWork *act)
{
	act->work[0]++;
	if(act->work[0]==10){
		SePlay(SE_BOWA);
		act->work[0] = 0;
	}
}

//static const u16 Light2PalData[]={
//	0x7e20,0x7ea9,0x7f12,0x7f77,0x7fbb,
//	0x7fbb,0x7f77,0x7f12,0x7ea9,0x7e20,
//};

static const u16 Light2PalData[]={
	0x7f12,0x7f12,0x7f12,0x7fff,0x7fff,0x7fff,
	0x7f12,0x7f12,0x7f12,0x7fff,0x7fff,0x7fff,
};

static void Light2ActMove(actWork *act)
{
	if(act->work[1]==0){
		act->work[0]++;
		if(act->work[0]==12) act->work[0] = 0;
		PaletteWorkSet(&Light2PalData[act->work[0]], (act->oamData.Pltt+16)*16+4, 2);	
	}
}

static void ConnectActMove(actWork *act)
{
	act->work[0]++;

	act->dy++;
	
	if(act->work[0]==10){
		DelActor(act);
	}
}

static void ConnectActMove2(actWork *act)
{
	act->work[0]++;

	act->dy--;
	
	if(act->work[0]==10){
		DelActor(act);
	}
}

static void MonitorActMove(actWork *act)
{
	act->work[0]++;
	if(act->work[0]==15){
		SePlay(SE_W107);
		act->work[0]=0;
	}
}



static const actAffAnm PokePutAff0[] = {	//右上
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{-0x100,0x100,0,ACT_AFSET},
	{ACT_AFLOOP, 0, 0, 0 },
};

const actAffAnm * const PokePutAffTbl[] = {
	PokePutAff0,
};
