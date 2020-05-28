#ifndef __COMMON_H__
#define __COMMON_H__

//******************************************************************
//
//			common.h
//
//			共通定義ファイル
//
//			Copyright (C) 2001 GAME FREAK inc.
//******************************************************************

#include <Agb.h>

#include "version.h"

//	文字列関連の長さ定義
#define PERSON_NAME_SIZE	7		// 人物の名前の長さ（自分も含む）
#define MONS_NAME_SIZE		10		// ポケモン名の長さ
#define	WAZA_NAME_SIZE		7		// わざ名の長さ
#define	ITEM_NAME_SIZE		8		// どうぐ名の長さ
#define SEED_NAME_SIZE		6		// タネの名前の長さ
#define	EOM_SIZE			1		// 終了コードの長さ

//-- ポケモン手持ち最大数 --//
#define TEMOTI_POKEMAX		6

//-- ポケモン数 --//
#define	NEW_POKE_NUM_MAX	(202)	//ホウエン図鑑数
#define	POKE_NUM_MAX		(386)	//全国図鑑数
#define	KAIHATSU_NUM_MAX	(411)	//開発ナンバーＭＡＸ数


#define NULL ((void *)0)			// NULLポインタ（何で自分で定義しないとだめなのだ?）
#define   XtOffset(p_type,field)     ((unsigned int)&(((p_type )NULL)->field))
#define	NELEMS(array)	( sizeof(array) / sizeof(array[0]) )

#define	KEYREPEATSPEED		5		//キーリピートウェイト
#define	KEYREPEARSTARTWAIT	40		//キーリピートが始まるまでのウェイト

typedef void (*pFunc)(void);		// 関数ポインタ型

typedef	u8	VM_CODE;				// スクリプト、イベントデータの型宣言

#include "../snd_file/m4aLib.h"		// サウンドライブラリ
#include "../snd_file/mus_def.h"

#include "system.h"					//グローバル変数定義
#include "gamedata.h"				//ゲーム進行データ定義
#include "memtool.h"				//DMA転送量制限マクロ定義

extern void	MainProcChange(pFunc func);

//==================================================================
//==================================================================


//==================================================================
//	グローバル変数
//==================================================================

extern u8 DebugMainFlag;		//デバッグモード操作用フラグ

extern SystemArea sys;			// システムリソース
extern u8 UserWork[];			// 汎用ワークエリア

extern	u16	KeyRepeatSpeed;
extern	u16	KeyRepeatStartWait;

extern SYS_SAVE_DATA MyData;		// セーブデータ：自分情報など
extern FIELD_SAVE_DATA Fld;			// セーブデータ：ゲーム進行など

#define GCDOWNLOAD			// 定義するとGCからのダウンロード機能を有効

#endif //__COMMON_H__
