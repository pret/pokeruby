
#ifndef _Z_NAKI_H_
#define _Z_NAKI_H_

// 波形用
typedef struct {
	u16		ChrAddr;		// キャラ(BG_VRAM)アドレス
	u8		ScrBlock;		// スクリーン・ブロック番号
	u8		PalNo;			// 使用するパレット番号
	u8		YOffs;			// Ｙポジション(キャラ単位で指定)
	u8		XSize;			// 表示する長さ(キャラ単位で指定)
}NakigoeHakei;

// メーター用
typedef struct {
	u16		ChrAddr;		// キャラ(BG_VRAM)アドレス
	u8		ScrBlock;		// スクリーン・ブロック番号
	u8		PalNo;			// 使用するパレット番号
	u8		XPos;			// 表示位置Ｘ(キャラ単位で指定)
	u8		YPos;			// 表示位置Ｙ(キャラ単位で指定)
}NakigoeMeter;

typedef NakigoeHakei	HakeiSet;
typedef	NakigoeMeter	MeterSet;

extern	u8		HakeiInit( HakeiSet* hs,u8 bg_num );
extern	void	HakeiMain( u8 bg_num );
extern	void	HakeiStart( u16 pokemon_no );
extern	u8		VuMeterInit( MeterSet* ms,u8 bg_num );
extern	void	VuMeterEnd( void );

extern	u8 ZNakiInitSeq;

#endif

