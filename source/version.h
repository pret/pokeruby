
#ifndef __VERSION_H__
#define __VERSION_H__

//=========================================================================
//	
//
//	ソースのバージョン指定関連ファイル
//
//
//=========================================================================

#undef GLOBAL
#ifdef __VERSION_H_GLOBAL__
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================

//　●色違いバージョンによって処理を分岐する場合は
//	　PM_VERSION　によって記述をかえる
//
//	例）
//	#if ( PM_VERSION == VERSION_RUBY )
//		ルビーバージョンの場合の処理を記述
//
//	#elif ( PM_VERSION == VERSION_SAPPHIRE )
//		サファイアバージョンの場合の処理を記述
//
//	#endif
//


//	色違いバージョン指定
#define		VERSION_SAPPHIRE	1
#define		VERSION_RUBY		2
#define		VERSION_EMERALD		3


//	国別コード指定
#define		LANG_JAPAN		1
#define		LANG_ENGLISH	2
#define		LANG_FRANCE		3
#define		LANG_ITALY		4
#define		LANG_GERMANY	5
#define		LANG_SPAIN		7



//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;

#ifndef	ASM_CPP

extern const u8 CasetteVersion;

extern const u8 CasetteLanguage;

extern const u8 build_date[];
#endif

//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);


#undef GLOBAL
#endif	/*__VERSION_H__*/

