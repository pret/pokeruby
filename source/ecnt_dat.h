#ifndef	ECNT_DAT_H
#define ECNT_DAT_H

#include "common.h"
#include "poketool.h"
#include "map_attr.h"
#include "fieldmap.h"
#include "map.h"

#include "monsno.def"				// ポケモン番号
#include "../evdata/maparray.h"

#define	ENCOUNT_DATA_MAX	0xff

typedef struct {
	u8	MinLv;		// 最低Lv
	u8	MaxLv;		// 最高Lv
	u16	pokeNo;		// ポケモンNo
}ENCOUNTPOKE;

typedef struct {
	u8	percent;				// 出現率
	const ENCOUNTPOKE * data;	// ポケモンデータ
}ENCOUNTDATA;

typedef struct {
	u8	div_id;		// divID
	u8	map_id;		// mapID
	const ENCOUNTDATA * ground;		// 陸地データ
	const ENCOUNTDATA * water;		// 水上データ
	const ENCOUNTDATA * rock;		// 岩砕きデータ
	const ENCOUNTDATA * fish;		// 釣りデータ
}MAPENCOUNT;

// r119 Special Encount
extern u16	SP_ENCOUNT_R119ProgramSym( u8 flg );
extern u16 SpFishingRand(void);
extern void SpFishingSrand( u16 seed );

//================================================================
//	エンカウント操作
//================================================================
enum {
	ENCOUNT_ON = 0,
	ENCOUNT_OFF,
};

extern u8 encount_flag;		// エンカウントフラグ	0 = ENCOUNT, 1 = NOT ENCOUNT

extern void EncountFlagSet( u8 flg );


//-------------------------------------------------------------
// 野性ポケモンエンカウントチェック
//	<引数>		attr	現在のアトリビュート
//				old		直前のアトリビュート
//	<戻り値>	TRUE	エンカウントイベント発生
//				FALSE	発生せず
//-------------------------------------------------------------
extern u8 FieldEncount( u16 attr, u16 old );

//-------------------------------------------------------------
// スプレー期限チェック
//	<戻り値>	TRUE	スプレー効果切れイベント発生
//-------------------------------------------------------------
extern u8 SprayCheck(void);

//-------------------------------------------------------------
//	ポケモンナンバー取得（鳴き声用）
//	<引数>	水上エンカウントかどうかを返すためのフラグアドレス
//	<戻り値>	ポケモンナンバー（０の時はデータなし）
//-------------------------------------------------------------
extern u16 GetEncountVoice(u8 * water_flag);

//-------------------------------------------------------------
//	ポケモンナンバー取得（鳴き声用）
//	※水エンカウント専用
//	<戻り値>	ポケモンナンバー（０の時はデータなし）
//-------------------------------------------------------------
extern u16 GetWaterEncountVoice(void);


#endif	// ECNT_DAT_H
