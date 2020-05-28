#ifndef __SXY_H__
#define __SXY_H__

//=========================================================================
//	
//	ＳＸＹデータ用構造体定義
//
//=========================================================================

#include "evobjsv.def"

typedef evObjData SXY_OBJ;	/* evobj.defで定義している */

#undef GLOBAL
#ifdef SXY_H_GLOBAL
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================

//出入り口データ構造
typedef struct {
		u16 posX;					//Ｘ位置
		u16 posY;					//Ｙ位置
		u8	height;					//高さ
		u8 doorID;					//出入り口ＩＤ（マップ内で特定)
		u8 mapID;					//マップＩＤ
		u8 divisionID;				//識別ＩＤ
}SXY_CONNECT;

//位置発動イベントデータ構造
typedef struct {
		u16 posX;					//Ｘ位置
		u16 posY;					//Ｙ位置
		u8	height;					//高さ
		u16	work;					//参照ワークコード
		u8	number;					//発動する場合のナンバー
		const VM_CODE * script;		//発動するスクリプトへのポインタ
}SXY_POS;

//BG話しかけ発動イベント
typedef struct {
		u16 posX;					//Ｘ位置
		u16 posY;					//Ｙ位置
		u8	height;					//高さ
		u8	type;					//イベントタイプ
		const VM_CODE * script;		//発動するスクリプトへのポインタ
}SXY_BG;

//ＳＸＹデータ構造
typedef struct {
		u8	ObjMax;
		u8	ConnectMax;
		u8	evPosMax;
		u8	evBgMax;
		const SXY_OBJ * ObjData;
		const SXY_CONNECT * ConnectData;
		const SXY_POS * PosData;
		const SXY_BG * BgData;
}SXY_DATA;


#undef GLOBAL
#endif	/*__SXY_H__*/
