
#ifndef	__CALCTOOL_H__
#define	__CALCTOOL_H__


//----------------------------------------------------------
//	外部関数宣言
//----------------------------------------------------------
extern s16 SinMove(s16 byou, s16 hurihaba);
extern s16 CosMove(s16 byou, s16 hurihaba);
extern u16 pp_rand(void);
extern void pp_srand(u16 seed);
extern u8 AddBanishActor(void (*move_p)(actWork *));
extern void SetAdrs_to_Work(s16 *pwork, void *Adrs);
extern void SetWork_to_Seq(s16 *pwork, void *Adrs);
extern void BgAffineSrcSet(BgAffineSrcData *, s32, s32,	s16, s16, s16, s16, u16);
extern void BgAffineCalcSet(BgAffineDestData*,s32,s32,s16,s16,s16,s16,u16);
extern void BG_to_OBJ(u8 shape, u8 size, u8 *src, u16 *scrn, u8 *dest);

u16 calc_fast_crc(const u8 * adrs, int size);
u16 calc_crc(const u8 * adrs, int size);

extern	const	s16 sincos_360_table[];
extern	s16		Sin_360_Get(u16 theta);
extern	s16		Cos_360_Get(u16 theta);

//ビットをナンバーに変換

extern	u8	Bit2No(u32 bitdata);

#define	THETA_360_DEF	(360)
#define RAND_MAX		(65535)

//----------------------------------------------------------
//	ﾃﾞｰﾀ
//----------------------------------------------------------
extern	const u32 no2bittbl[32];
extern const s16 sin_cos_table[256+64];

//----------------------------------------------------------
//	ｸﾞﾛｰﾊﾞﾙ変数
//----------------------------------------------------------
extern unsigned long r_next;


//----------------------------------------------------------
//	マクロ
//----------------------------------------------------------
#define	_Sin( a ) (sin_cos_table[(a)])
#define	_Cos( a ) (sin_cos_table[(a)+64])



#endif	//__CALCTOOL_H__

