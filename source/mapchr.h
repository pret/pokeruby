
#ifndef __MAPCHR_H__
#define __MAPCHR_H__

//=========================================================================
//	
//	マップキャラ・パレットデータ関連
//
//=========================================================================

#include	"mapscrn.h"


#undef GLOBAL
#ifdef __MAPCHR_H_GLOBAL__
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================
//#define name value

//typedef ...


//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;


//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);

GLOBAL void TransMapCharData(const MapScreenData * scrn);
GLOBAL void TransMapPaletteData(const MapScreenData * scrn);

GLOBAL void TransMapChar2ndData(const MapScreenData * scrn);
GLOBAL void TransMapChar1stData(const MapScreenData * scrn);
GLOBAL void TransMapPalette1stData(const MapScreenData * scrn);
GLOBAL void TransMapPalette2ndData(const MapScreenData * scrn);


#undef GLOBAL
#endif	/*__MAPCHR_H__*/

