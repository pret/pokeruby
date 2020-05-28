/********************************************************************/
/*                ｱｸﾀｰ関連ﾒｲﾝ                                       */
/********************************************************************/
/*==================================================================*/
#ifndef ACTOR_H
#define ACTOR_H

#include "actanm.def"	//add

//----------------------------------------------------------
//	ＯＡＭ構造体
//	agbtypes.hにあったものからAffineParamNo_L3とHFlip,VFlipを一緒にしただけ
//	システム用
//----------------------------------------------------------
typedef struct {
    u32 VPos:8;     	    // Ｙ座標
    u32 AffineMode:2;       // アフィンモード
    u32 ObjMode:2;          // ＯＢＪモード
    u32 Mosaic:1;           // モザイク
    u32 ColorMode:1;        // １６色/２５６色 選択
    u32 Shape:2;            // ＯＢＪ形状

    u32 HPos:9;             // Ｘ座標
    u32 AffineParamNo:5;	// アフィン変換パラメータＮｏ&Hﾌﾘｯﾌﾟ,Vﾌﾘｯﾌﾟ
    u32 Size:2;             // ＯＢＪサイズ

#if 0
    u32 CharNo:10;          // キャラクタＮｏ
    u32 Priority:2;         // 表示優先
    u32 Pltt:4;             // パレットＮｏ
#else
    u16 CharNo:10;          // キャラクタＮｏ
    u16 Priority:2;         // 表示優先
    u16 Pltt:4;             // パレットＮｏ
#endif

    u16 AffineParam;        // アフィン変換パラメータ
} SysOamData;

typedef SysOamData ActOamData;	//ActOamDataだけAffineParamをなくすことは可能(今はしてない)

/*------------------------------------------------------------------*/
/*	DMA転送用ﾃｰﾌﾞﾙ構造体											*/
/*------------------------------------------------------------------*/
typedef struct{
	const u8 *dat;	        //ｷｬﾗｸﾀｰﾃﾞｰﾀｱﾄﾞﾚｽ
	u32 	dest;	        //転送先ｱﾄﾞﾚｽ(ｵﾌｾｯﾄ)
	u16 	size;			//ｻｲｽﾞ
}dmaTransTbl;

/*------------------------------------------------------------------*/
/*	ｱｸﾀｰｱﾆﾒﾃﾞｰﾀ構造体												*/
/*------------------------------------------------------------------*/
typedef struct {
	const u8 *dat;	        //ｷｬﾗｸﾀｰﾃﾞｰﾀｱﾄﾞﾚｽ
	u16 	size;			//ｻｲｽﾞ
}actAnmData;

/*------------------------------------------------------------------*/
/*	ｱｸﾀｰｱﾆﾒﾊﾟﾀｰﾝ構造体												*/
/*------------------------------------------------------------------*/
typedef struct {
	s16 pat;	        //ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ
	u8 	wait:6;		//ｳｪｲﾄ
	u8 	hrev:1;		//H反転
	u8 	vrev:1;		//V反転
}actAnm;

/*------------------------------------------------------------------*/
/*	ｱｸﾀｰﾜｰｸ構造体													*/
/*------------------------------------------------------------------*/
#define ACTOR_WORK_MAX		8				//ｱｸﾀｰが所持しているﾜｰｸの数

typedef struct actWork_tag
{
	ActOamData oamData;						// OAM 基本ﾃﾞｰﾀ
	const actAnm * const *anm_tbl;			// ｱﾆﾒﾃｰﾌﾞﾙ
	const actAnmData *anm_trans; 			// ｱﾆﾒﾄﾗﾝｽﾃﾞｰﾀ
	const actAffAnm * const *aff_tbl;		// ｱﾌｨﾝｱﾆﾒﾃｰﾌﾞﾙ
	const struct actHeader_tag *actHead;	// 構成ｱｸﾀｰﾍｯﾀﾞ
	const OAMPatSt *oamPat;					// OAMﾊﾟｯﾄ

	void (*move)(struct actWork_tag *);		// 動作関数
	
	s16 	x;								// X座標
	s16 	y;								// Y座標
	s16 	dx;								// X座標+α
	s16 	dy;								// Y座標+α
	s8 		cx;								// X座標+中心座標取得用補正
	s8 		cy;								// Y座標+中心座標取得用補正
	u8 		anm_no;							// ｱﾆﾒﾅﾝﾊﾞ
	u8 		anm_offs;						// ｱﾆﾒﾅﾝﾊﾞｵﾌｾｯﾄ

	u8 		anm_wait:6;						// ｱﾆﾒｳｪｲﾄ
	u8		anm_pause:1;					// ｱﾆﾒﾎﾟｰｽﾞ
	u8		aff_pause:1;					// ｱﾌｨﾝｱﾆﾒﾎﾟｰｽﾞ
	u8		anm_count;						// ｱﾆﾒﾙｰﾌﾟ

	s16		work[ACTOR_WORK_MAX];						// ｱｸﾀｰﾜｰｸ

	u16		act_sw	:1;						// ｱｸﾀｰ稼動ﾌﾗｸﾞ(1:ON)
	u16		scr		:1;						// BGｽｸﾛｰﾙ依存ﾌﾗｸﾞ 1:依存 0:OFF
	u16		banish	:1;						// ｽﾌﾟﾗｲﾄ表示ﾌﾗｸﾞ(1:OFF(表示しない))
	u16		:5;								// ﾀﾞﾐｰ
	
	u16		Hflip	:1;						// 横反転ﾌﾗｸﾞ(1:反転)
	u16		Vflip	:1;						// 縦反転ﾌﾗｸﾞ(1:反転)
	u16 	anm_sw	:1;						// ｱﾆﾒ変更ﾌﾗｸﾞ(1:開始)
	u16		affine_sw:1;					// ｱﾌｨﾝｱﾆﾒ変更ﾌﾗｸﾞ
	u16 	anmend_sw:1;					// ｱﾆﾒ終了ﾌﾗｸﾞ(1:終了)
	u16		affend_sw:1;					// ｱﾌｨﾝｱﾆﾒ終了ﾌﾗｸﾞ
	u16		t_mode:1;						// CGX転送ﾌﾗｸﾞ(0:転送 1:ﾊﾟﾀｰﾝ)
	
	u16		feature_flg:1;					// ｱｸﾀｰ操作ﾌﾗｸﾞ
	u16		char_num;						// ｵﾌｾｯﾄｷｬﾗﾅﾝﾊﾞ
	
	u8		oampat_no:6;					// ﾊﾟｯﾄﾅﾝﾊﾞ
	u8		oampat_sw:2;					// ﾊﾟｯﾄｽｲｯﾁ

	u8		pri;							// ｱｸﾀｰ表示ﾌﾟﾗｲｵﾘﾃｨ(高 0 ~ 255 低)
}actWork, *actWork2;

/*------------------------------------------------------------------*/
/*	ｱｸﾀｰﾍｯﾀﾞ構造体													*/
/*------------------------------------------------------------------*/
typedef struct actHeader_tag{
#if 0										//change 2001.08.02(木) by matsuda
	const u16 cellNo;						//ｾﾙﾅﾝﾊﾞｰ(0xffffの場合はｷｬﾗ転送型)
	const u16 palNo;						//ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ登録ﾅﾝﾊﾞ
#else
	u16 cellNo;								//ｾﾙﾅﾝﾊﾞｰ(0xffffの場合はｷｬﾗ転送型)
	u16 palNo;								//ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ登録ﾅﾝﾊﾞ
#endif
	const ActOamData *oamData_p;			//OAM基本ﾃﾞｰﾀｱﾄﾞﾚｽ
	const actAnm * const *anmData_p;		//ACTOR構成ﾊﾟﾀｰﾝﾃｰﾌﾞﾙｱﾄﾞﾚｽ
	const actAnmData *anmTrans_p;			//ｱﾆﾒ-ﾄﾗﾝｽﾃﾞｰﾀｱﾄﾞﾚｽ
	const actAffAnm * const *affData_p;		// 拡縮ﾊﾟｯﾄ
	void (*moveData_p)(actWork *);			//ACTOR動作ﾊﾟﾀｰﾝ関数ｱﾄﾞﾚｽ
}actHeader;

//----------------------------------------------------------
//	型宣言
//----------------------------------------------------------
typedef void (*pActFunc)(actWork *);		//ｱｸﾀｰの動作関数部分

//----------------------------------------------------------
//	定数定義
//----------------------------------------------------------
#define ACT_MAX				(64)			// ｱｸﾀｰMAX
#define ACT_BUF_MAX			(ACT_MAX+1)		// ｱｸﾀｰﾜｰｸMAX
#define ACTWORK_SIZEOF		(sizeof(actWork))				// ﾜｰｸｻｲｽﾞ
#define ACTWORK_SIZEOF_ALL	(ACTWORK_SIZEOF*ACT_BUF_MAX)	// ﾜｰｸｻｲｽﾞ全体
#define ACTWORK_SIZEOF_OPERA (ACTWORK_SIZEOF*ACT_MAX)		// ﾜｰｸｻｲｽﾞ稼動分

//-- ｱｸﾀｰﾙｰﾁﾝ内で使用しているDMA転送をCPU転送に変更するための定義 --//
#define DMA_CPU_SELECT		0				// 0だとCpuCopyを使用	1だとDmaCopyを使用

//----------------------------------------------------------
//	グローバル変数
//----------------------------------------------------------
extern actWork ActWork[ACT_BUF_MAX];		// ｱｸﾀｰﾜｰｸ
extern u8 ActSortTbl[ACT_MAX];				//ｱｸﾀｰｿｰﾄ用ﾜｰｸ
extern u8 DMAtransCount;					//DMA転送用ｶｳﾝﾀ
extern dmaTransTbl DMAtransTbl[];			//DMA転送用ﾃｰﾌﾞﾙ
extern u8 OamWriteEd;						//使用OAM範囲限定(0～OamWriteEd(MAX:128))
extern u16 ObjDataTransSt;					//OBJｷｬﾗｸﾀﾃﾞｰﾀVRAM転送開始位置指定(ｷｬﾗｸﾀNo)
extern u8 TransAreaFlag[128];				//転送空き領域ﾁｪｯｸﾌﾗｸﾞ(1024bit)

extern s16 ActOX;							//ｸﾞﾛｰﾊﾞﾙｱｸﾀｰ補正X
extern s16 ActOY;							//ｸﾞﾛｰﾊﾞﾙｱｸﾀｰ補正Y
extern ObjAffineDestData OBJ_AffineWork[32];
extern u8 AffAnmStopFlag;

//----------------------------------------------------------
//	ﾀﾞﾐｰﾃﾞｰﾀ 外部宣言
//----------------------------------------------------------
extern const actWork DummyActWork;					//ﾀﾞﾐｰｱｸﾀｰﾜｰｸ
extern const ActOamData DummyActOam;				//ﾀﾞﾐｰOAMﾃﾞｰﾀ
extern const actAnm* const DummyActAnmTbl[];		//ﾀﾞﾐｰｱﾆﾒｰｼｮﾝﾃｰﾌﾞﾙ
extern const actAffAnm * const DummyActAffTbl[];	//ﾀﾞﾐｰ拡縮ｱﾆﾒﾃｰﾌﾞﾙ
extern const actHeader DummyActHeader;

//----------------------------------------------------------
//	外部ﾃﾞｰﾀ
//----------------------------------------------------------
extern const u8 ActSizeTbl[2][3][4];

//----------------------------------------------------------
//	外部関数宣言
//----------------------------------------------------------
extern void affineWorkinit(void);
extern void actOAMinit(u8 start, u8 end);
extern void SetActor(void);
extern void actOAMtrans(void);
extern void actDMAtrans(void);
extern void InitActor(void);
extern void JumpActor(void);
extern void SetActor(void);
extern u8 AddActor(const actHeader* headAdrs, s16 posX, s16 posY, u8 pri);
extern void DelActor(actWork *);
extern void actCenterCalc( actWork *, u8, u8, u8 );
extern void DummyActMove(actWork *);

extern void DmaTransReq(u8 *datAdr, u32 destAdr, u16 size);

extern void PushActor(void *destAdr);
extern void PopActor(void *destAdr);
extern void InitActWork(void);
extern void actWorkInit(actWork *actStruct);
extern u8 AddActorBottom(const actHeader* headAdrs, s16 posX, s16 posY, u8 pri);

extern void CellDelActor(actWork *actst);
extern void PalDelActor(actWork *actst);
extern void AffineDelActor(actWork *actst);
extern void AllDelActor(actWork *actst);
extern u8 AddActorJump(const actHeader* headAdrs, s16 posX, s16 posY, u8 pri);

extern u8 AddDummyActor( void (*move)(actWork*) );

//----------------------------------------------------------
//	ﾏｸﾛ
//----------------------------------------------------------
#define	actNoCenterCalc(no,shape,size,aff)	actCenterCalc(&ActWork[no],shape,size,aff)

#endif	//ACTOR_H
