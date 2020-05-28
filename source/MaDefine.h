
#ifndef	__MADEFINE_H__
#define	__MADEFINE_H__


//----------------------------------------------------------
//		OAM最大数
//----------------------------------------------------------
#define OAM_MAX			128
#define AFFINE_MAX		32		//ｱﾌｨﾝﾊﾟﾗﾒｰﾀｰ最大登録数

//----------------------------------------------------------
// 		BGパレットRAM
//----------------------------------------------------------
#define BG_PL_SIZE		0x20			//  16色ﾊﾟﾚｯﾄ時の1つのﾊﾟﾚｯﾄのｻｲｽﾞ

#define BG_PLTT_0		(BG_PLTT + 0x0)		//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ0のｱﾄﾞﾚｽ
#define BG_PLTT_1		(BG_PLTT + 0x20)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ1のｱﾄﾞﾚｽ
#define BG_PLTT_2		(BG_PLTT + 0x40)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ2のｱﾄﾞﾚｽ
#define BG_PLTT_3		(BG_PLTT + 0x60)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ3のｱﾄﾞﾚｽ
#define BG_PLTT_4		(BG_PLTT + 0x80)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ4のｱﾄﾞﾚｽ
#define BG_PLTT_5		(BG_PLTT + 0xa0)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ5のｱﾄﾞﾚｽ
#define BG_PLTT_6		(BG_PLTT + 0xc0)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ6のｱﾄﾞﾚｽ
#define BG_PLTT_7		(BG_PLTT + 0xe0)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ7のｱﾄﾞﾚｽ
#define BG_PLTT_8		(BG_PLTT + 0x100)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ8のｱﾄﾞﾚｽ
#define BG_PLTT_9		(BG_PLTT + 0x120)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ9のｱﾄﾞﾚｽ
#define BG_PLTT_10		(BG_PLTT + 0x140)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ10のｱﾄﾞﾚｽ
#define BG_PLTT_11		(BG_PLTT + 0x160)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ11のｱﾄﾞﾚｽ
#define BG_PLTT_12		(BG_PLTT + 0x180)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ12のｱﾄﾞﾚｽ
#define BG_PLTT_13		(BG_PLTT + 0x1a0)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ13のｱﾄﾞﾚｽ
#define BG_PLTT_14		(BG_PLTT + 0x1c0)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ14のｱﾄﾞﾚｽ
#define BG_PLTT_15		(BG_PLTT + 0x1e0)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ15のｱﾄﾞﾚｽ

//----------------------------------------------------------
// 		ＯＢＪパレットＲＡＭ
//----------------------------------------------------------
#define OBJ_PL_SIZE		0x20			//  16色ﾊﾟﾚｯﾄ時の1つのﾊﾟﾚｯﾄのｻｲｽﾞ

#define OBJ_PLTT_0		(OBJ_PLTT + 0x0)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ0のｱﾄﾞﾚｽ
#define OBJ_PLTT_1		(OBJ_PLTT + 0x20)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ1のｱﾄﾞﾚｽ
#define OBJ_PLTT_2		(OBJ_PLTT + 0x40)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ2のｱﾄﾞﾚｽ
#define OBJ_PLTT_3		(OBJ_PLTT + 0x60)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ3のｱﾄﾞﾚｽ
#define OBJ_PLTT_4		(OBJ_PLTT + 0x80)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ4のｱﾄﾞﾚｽ
#define OBJ_PLTT_5		(OBJ_PLTT + 0xa0)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ5のｱﾄﾞﾚｽ
#define OBJ_PLTT_6		(OBJ_PLTT + 0xc0)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ6のｱﾄﾞﾚｽ
#define OBJ_PLTT_7		(OBJ_PLTT + 0xe0)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ7のｱﾄﾞﾚｽ
#define OBJ_PLTT_8		(OBJ_PLTT + 0x100)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ8のｱﾄﾞﾚｽ
#define OBJ_PLTT_9		(OBJ_PLTT + 0x120)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ9のｱﾄﾞﾚｽ
#define OBJ_PLTT_10		(OBJ_PLTT + 0x140)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ10のｱﾄﾞﾚｽ
#define OBJ_PLTT_11		(OBJ_PLTT + 0x160)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ11のｱﾄﾞﾚｽ
#define OBJ_PLTT_12		(OBJ_PLTT + 0x180)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ12のｱﾄﾞﾚｽ
#define OBJ_PLTT_13		(OBJ_PLTT + 0x1a0)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ13のｱﾄﾞﾚｽ
#define OBJ_PLTT_14		(OBJ_PLTT + 0x1c0)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ14のｱﾄﾞﾚｽ
#define OBJ_PLTT_15		(OBJ_PLTT + 0x1e0)	//  16色ﾊﾟﾚｯﾄ時のﾊﾟﾚｯﾄ15のｱﾄﾞﾚｽ


//----------------------------------------------------------
// 		BGｷｬﾗｸﾀﾃﾞｰﾀﾍﾞｰｽﾌﾞﾛｯｸｱﾄﾞﾚｽ & BGｽｸﾘｰﾝﾃﾞｰﾀﾍﾞｰｽﾌﾞﾛｯｸｱﾄﾞﾚｽ
//----------------------------------------------------------
#define CHAR_BASE0_ADDR		(BG_VRAM+0x0000)		//  BGｷｬﾗｸﾀﾃﾞｰﾀﾍﾞｰｽﾌﾞﾛｯｸのｱﾄﾞﾚｽ
#define CHAR_BASE1_ADDR		(BG_VRAM+0x4000)		//  
#define CHAR_BASE2_ADDR  	(BG_VRAM+0x8000)		// 
#define CHAR_BASE3_ADDR  	(BG_VRAM+0xc000)		// 

#define SCREEN_BASE0_ADDR	(BG_VRAM + 0x800 * 0)	//  BGｽｸﾘｰﾝﾃﾞｰﾀﾍﾞｰｽﾌﾞﾛｯｸのｱﾄﾞﾚｽ
#define SCREEN_BASE1_ADDR	(BG_VRAM + 0x800 * 1)
#define SCREEN_BASE2_ADDR	(BG_VRAM + 0x800 * 2)
#define SCREEN_BASE3_ADDR	(BG_VRAM + 0x800 * 3)
#define SCREEN_BASE4_ADDR	(BG_VRAM + 0x800 * 4)
#define SCREEN_BASE5_ADDR	(BG_VRAM + 0x800 * 5)
#define SCREEN_BASE6_ADDR	(BG_VRAM + 0x800 * 6)
#define SCREEN_BASE7_ADDR	(BG_VRAM + 0x800 * 7)
#define SCREEN_BASE8_ADDR	(BG_VRAM + 0x800 * 8)
#define SCREEN_BASE9_ADDR	(BG_VRAM + 0x800 * 9)
#define SCREEN_BASE10_ADDR	(BG_VRAM + 0x800 * 10)
#define SCREEN_BASE11_ADDR	(BG_VRAM + 0x800 * 11)
#define SCREEN_BASE12_ADDR	(BG_VRAM + 0x800 * 12)
#define SCREEN_BASE13_ADDR	(BG_VRAM + 0x800 * 13)
#define SCREEN_BASE14_ADDR	(BG_VRAM + 0x800 * 14)
#define SCREEN_BASE15_ADDR	(BG_VRAM + 0x800 * 15)
#define SCREEN_BASE16_ADDR	(BG_VRAM + 0x800 * 16)
#define SCREEN_BASE17_ADDR	(BG_VRAM + 0x800 * 17)
#define SCREEN_BASE18_ADDR	(BG_VRAM + 0x800 * 18)
#define SCREEN_BASE19_ADDR	(BG_VRAM + 0x800 * 19)
#define SCREEN_BASE20_ADDR	(BG_VRAM + 0x800 * 20)
#define SCREEN_BASE21_ADDR	(BG_VRAM + 0x800 * 21)
#define SCREEN_BASE22_ADDR	(BG_VRAM + 0x800 * 22)
#define SCREEN_BASE23_ADDR	(BG_VRAM + 0x800 * 23)
#define SCREEN_BASE24_ADDR	(BG_VRAM + 0x800 * 24)
#define SCREEN_BASE25_ADDR	(BG_VRAM + 0x800 * 25)
#define SCREEN_BASE26_ADDR	(BG_VRAM + 0x800 * 26)
#define SCREEN_BASE27_ADDR	(BG_VRAM + 0x800 * 27)
#define SCREEN_BASE28_ADDR	(BG_VRAM + 0x800 * 28)
#define SCREEN_BASE29_ADDR	(BG_VRAM + 0x800 * 29)
#define SCREEN_BASE30_ADDR	(BG_VRAM + 0x800 * 30)
#define SCREEN_BASE31_ADDR	(BG_VRAM + 0x800 * 31)


//----------------------------------------------------------
//		OBJキャラクターネームサイズ
//----------------------------------------------------------
	//         幅 高さ
#define OBJ16_8x8		1
#define OBJ16_16x16		(4)
#define OBJ16_32x32		(16)
#define OBJ16_64x64		(64)

#define OBJ16_16x8		(2)
#define OBJ16_32x8		(4)
#define OBJ16_32x16		(8)
#define OBJ16_64x32		(32)

#define OBJ16_8x16		(2)
#define OBJ16_8x32		(4)
#define OBJ16_16x32		(8)
#define OBJ16_32x64		32

#define OBJ256_8x8		(OBJ16_8x8 * 2)
#define OBJ256_16x16	(OBJ16_16x16 * 2)
#define OBJ256_32x32	(OBJ16_32x32 * 2)
#define OBJ256_64x64	(OBJ16_64x64 * 2)

#define OBJ256_16x8		(OBJ16_16x8 * 2)
#define OBJ256_32x8		(OBJ16_32x8 * 2)
#define OBJ256_32x16	(OBJ16_32x16 * 2)
#define OBJ256_64x32	(OBJ16_64x32 * 2)

#define OBJ256_8x16		(OBJ16_8x16 * 2)
#define OBJ256_8x32		(OBJ16_8x32 * 2)
#define OBJ256_16x32	(OBJ16_16x32 * 2)
#define OBJ256_32x64	(OBJ16_32x64 * 2)


//----------------------------------------------------------
//		OBJキャラクターバイトサイズ
//----------------------------------------------------------
#define OBJ_SIZE16_8x8		(32*((8/8)*(8/8)))
#define OBJ_SIZE16_16x16	(32*((16/8)*(16/8)))
#define OBJ_SIZE16_32x32	(32*((32/8)*(32/8)))
#define OBJ_SIZE16_64x64	(32*((64/8)*(64/8)))

#define OBJ_SIZE16_16x8		(32*((16/8)*(8/8)))
#define OBJ_SIZE16_32x8		(32*((32/8)*(8/8)))
#define OBJ_SIZE16_32x16	(32*((32/8)*(16/8)))
#define OBJ_SIZE16_64x32	(32*((64/8)*(32/8)))

#define OBJ_SIZE16_8x16		(32*((8/8)*(16/8)))
#define OBJ_SIZE16_8x32		(32*((8/8)*(32/8)))
#define OBJ_SIZE16_16x32	(32*((16/8)*(32/8)))
#define OBJ_SIZE16_32x64	(32*((32/8)*(64/8)))

#define OBJ_SIZE256_8x8		(64*((8/8)*(8/8)))
#define OBJ_SIZE256_16x16	(64*((16/8)*(16/8)))
#define OBJ_SIZE256_32x32	(64*((32/8)*(32/8)))
#define OBJ_SIZE256_64x64	(64*((64/8)*(64/8)))

#define OBJ_SIZE256_16x8	(64*((16/8)*(8/8)))
#define OBJ_SIZE256_32x8	(64*((32/8)*(8/8)))
#define OBJ_SIZE256_32x16	(64*((32/8)*(16/8)))
#define OBJ_SIZE256_64x32	(64*((64/8)*(32/8)))

#define OBJ_SIZE256_8x16	(64*((8/8)*(16/8)))
#define OBJ_SIZE256_8x32	(64*((8/8)*(32/8)))
#define OBJ_SIZE256_16x32	(64*((16/8)*(32/8)))
#define OBJ_SIZE256_32x64	(64*((32/8)*(64/8)))



//----------------------------------------------------------
//	OBJ形状(SHAPE)
//----------------------------------------------------------
#define SHAPE8x8		0
#define SHAPE16x16		0
#define SHAPE32x32		0
#define SHAPE64x64		0

#define SHAPE16x8		1
#define SHAPE32x8		1
#define SHAPE32x16		1
#define SHAPE64x32		1

#define SHAPE8x16		2
#define SHAPE8x32		2
#define SHAPE16x32		2
#define SHAPE32x64		2



#endif	//  __MADEFINE_H__


