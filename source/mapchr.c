//==================================================================================
//
//	マップデータ設定関連
//	キャラデータ・パレットデータ
//
//==================================================================================


#include "common.h"
#include "field.h"
#include "mapscrn.h"

#define __MAPCHR_H_GLOBAL__
#include "mapchr.h"

#include "fieldmap.h"
#include "palanm.h"			/* PaletteWorkSet */




//-----------------------------------------------------------------------------
//	キャラデータセットルーチン
//-----------------------------------------------------------------------------
static void SetMapCharData( const MapCharData * chr, void * dst )
{
	if ( chr == NULL ) return;
	if ( chr->char_type == MAP_CGX_NORMAL ) {
		CpuFastCopy( chr->CharData, dst, 0x4000 );
	} else {
		LZ77UnCompVram( chr->CharData, dst );
	}
}

//-----------------------------------------------------------------------------
//	パレットデータセットルーチン
//-----------------------------------------------------------------------------
static void SetMapPlttData( const MapCharData *chr, int pos, int size )
{
	if ( chr == NULL ) return;

	if ( chr->pltt_type == MAP_PLTT_NORMAL ) {
		u16 black = 0;
		PaletteWorkSet( &black, pos, 2 );		//0番の0に真っ黒をセット
		PaletteWorkSet( chr->ColorData+1, pos+1, size-2 );

	} else if ( chr->pltt_type == MAP_PLTT_NORMALSUB ) {
		PaletteWorkSet( &(chr->ColorData[MAP_PLTT_2ND_NO*16]), pos, size );

	} else {
		LZ77UnCompVram( chr->ColorData, (void*)0x02000000 );
		PaletteWorkSet( (void*)0x02000000, pos, size );
	}
}

//-----------------------------------------------------------------------------
// 常駐部キャラデータセット
//-----------------------------------------------------------------------------
void TransMapChar1stData(const MapScreenData * scrn)
{
	u32 dst = BASE_CHR_ADRS(MAP_LOW_CHR_BASE)+ MAP_CHR_1ST_NO * 0x20;
	SetMapCharData( scrn->MainCharData, (void*)dst );
}

//-----------------------------------------------------------------------------
// 非常駐部キャラデータセット
//-----------------------------------------------------------------------------
void TransMapChar2ndData(const MapScreenData * scrn)
{
	u32 dst = BASE_CHR_ADRS(MAP_LOW_CHR_BASE)+ MAP_CHR_2ND_NO * 0x20;
	SetMapCharData( scrn->SubCharData, (void*)dst );
}

//-----------------------------------------------------------------------------
// 常駐部カラーデータセット
//-----------------------------------------------------------------------------
void TransMapPalette1stData(const MapScreenData * scrn)
{
	SetMapPlttData(
			scrn->MainCharData,
			MAP_PLTT_1ST_NO * 16,
			MAP_PLTT_1ST_SIZE*16*2 );
}

//-----------------------------------------------------------------------------
// 非常駐部カラーデータセット
//-----------------------------------------------------------------------------
void TransMapPalette2ndData(const MapScreenData * scrn)
{
	SetMapPlttData(
			scrn->SubCharData,
			MAP_PLTT_2ND_NO * 16,
			MAP_PLTT_2ND_SIZE*16*2 );
}

//-----------------------------------------------------------------------------
// 全キャラデータセット
//-----------------------------------------------------------------------------
void TransMapCharData(const MapScreenData * scrn)
{
	if ( scrn == NULL ) return;
	TransMapChar1stData(scrn);
	TransMapChar2ndData(scrn);
}

//-----------------------------------------------------------------------------
//	全パレットデータセット
//-----------------------------------------------------------------------------
void TransMapPaletteData(const MapScreenData * scrn)
{
	if ( scrn == NULL ) return;
	TransMapPalette1stData(scrn);
	TransMapPalette2ndData(scrn);
}

