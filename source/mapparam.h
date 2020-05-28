//=========================================================================
//	
//	マップパラメータ関連
//
//=========================================================================

#ifndef MAPPARAM_H
#define MAPPARAM_H

#undef GLOBAL
#ifdef MAPPARAM_H_GLOBAL
#define GLOBAL	/* */
#else
#define	GLOBAL	extern
#endif


//=========================================================================
//	定義
//=========================================================================
/* マップ分類の定義 */
#define MAPTYPE_TOWN	1			/* 町 */
#define MAPTYPE_CITY	2			/* 街 */
#define MAPTYPE_ROAD	3			/* 道路 */
#define MAPTYPE_CAVE	4			/* 洞窟 */
#define MAPTYPE_WATER	5			/* 水(？) */
#define MAPTYPE_SEA		6			/* 海 */
#define MAPTYPE_ICE		7			/* 氷 */
#define MAPTYPE_ROOM	8			/* 部屋 */
#define MAPTYPE_BASE	9			/* 秘密基地 */

/* マップ分類の定義 GetBattleBGType用 */
#define	BATTLEBGTYPE_NONE			0		/*　指定無し　*/
#define	BATTLEBGTYPE_GYM			1		/*　ジム　*/
#define	BATTLEBGTYPE_RUBY_AZITO		2		/*　アジト（ルビー）　*/
#define	BATTLEBGTYPE_SAPPHIRE_AZITO	3		/*　アジト（サファイア）　*/
#define	BATTLEBGTYPE_BIG4_KAGETSU	4		/*　四天王（カゲツ）　*/
#define	BATTLEBGTYPE_BIG4_FUYOU		5		/*　四天王（フヨウ）　*/
#define	BATTLEBGTYPE_BIG4_PURIMU	6		/*　四天王（プリム）　*/
#define	BATTLEBGTYPE_BIG4_GENZI		7		/*　四天王（ゲンジ）　*/
#define	BATTLEBGTYPE_WHITE_ROOM		8		/*　白部屋　*/

//=========================================================================
//	関数プロトタイプ
//=========================================================================

GLOBAL u8 GetMapTypeByID( s8 div_id, s8 map_id );	//マップＩＤからマップタイプを取得
GLOBAL u8 GetNowMapType( void );		//現在のマップのタイプを取得
GLOBAL u8 GetBeforeMapType( void );		//直前のマップのタイプを取得


GLOBAL u8 GetNowWorldPos( void );		//現在のマップでのワールドマップ位置を返す
GLOBAL u8 GetSpecialWorldPos( void );	//特殊接続のワールドマップ位置を取得

GLOBAL u8 MTYPE_IsFieldCheck( u8 type );	//	フィールドマップかどうかのチェック
GLOBAL u8 MTYPE_IsEnableFlyCheck( u8 type );	// そらをとぶができるかどうかのチェック
GLOBAL u8 MTYPE_IsIndoorCheck( u8 type );	//	屋内かどうかのチェック

GLOBAL u8 GetBattleBGType(void);		//現在のマップの戦闘背景指定を返す

#undef GLOBAL
#endif	/* MAPPARAM_H */

