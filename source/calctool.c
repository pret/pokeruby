
#include "common.h"
#include "actor.h"
#include "calctool.h"

//----------------------------------------------------------
//	プロトタイプ宣言	関数＆ﾃﾞｰﾀ
//----------------------------------------------------------
s16 SinMove(s16 byou, s16 hurihaba);
s16 CosMove(s16 byou, s16 hurihaba);
u16 pp_rand(void);
void pp_srand(u16 seed);

u8	Bit2No(u32 bitdata);

const u32 no2bittbl[32];
const s16 sin_cos_table[256+64];
static const u8 obj_h_v[3][4][2];

//----------------------------------------------------------
//	ｸﾞﾛｰﾊﾞﾙ変数
//----------------------------------------------------------
unsigned long r_next;




//----------------------------------------------------------
//----------------------------------------------------------
s16 SinMove(s16 byou, s16 hurihaba)
{
	//return (hurihaba * _Sin(byou) / 0x100);
	return (hurihaba * _Sin(byou) >> 8);
}

s16 CosMove(s16 byou, s16 hurihaba)
{
	//return (hurihaba * _Cos(byou) / 0x100);
	return (hurihaba * _Cos(byou) >> 8);
}

/*------------------------------------------------------------------*/
/*                      SIN COS ﾃｰﾌﾞﾙ                               */
/*------------------------------------------------------------------*/
const s16 sin_cos_table[256+64]={
	0x0000,0x0006,0x000c,0x0012,0x0019,0x001f,0x0025,0x002b,
	0x0031,0x0038,0x003e,0x0044,0x004a,0x0050,0x0056,0x005c,
	0x0061,0x0067,0x006d,0x0073,0x0078,0x007e,0x0083,0x0088,
	0x008e,0x0093,0x0098,0x009d,0x00a2,0x00a7,0x00ab,0x00b0,
	0x00b5,0x00b9,0x00bd,0x00c1,0x00c5,0x00c9,0x00cd,0x00d1,
	0x00d4,0x00d8,0x00db,0x00de,0x00e1,0x00e4,0x00e7,0x00ea,
	0x00ec,0x00ee,0x00f1,0x00f3,0x00f4,0x00f6,0x00f8,0x00f9,
	0x00fb,0x00fc,0x00fd,0x00fe,0x00fe,0x00ff,0x00ff,0x00ff,
	0x0100,0x00ff,0x00ff,0x00ff,0x00fe,0x00fe,0x00fd,0x00fc,
	0x00fb,0x00f9,0x00f8,0x00f6,0x00f4,0x00f3,0x00f1,0x00ee,
	0x00ec,0x00ea,0x00e7,0x00e4,0x00e1,0x00de,0x00db,0x00d8,
	0x00d4,0x00d1,0x00cd,0x00c9,0x00c5,0x00c1,0x00bd,0x00b9,
	0x00b5,0x00b0,0x00ab,0x00a7,0x00a2,0x009d,0x0098,0x0093,
	0x008e,0x0088,0x0083,0x007e,0x0078,0x0073,0x006d,0x0067,
	0x0061,0x005c,0x0056,0x0050,0x004a,0x0044,0x003e,0x0038,
	0x0031,0x002b,0x0025,0x001f,0x0019,0x0012,0x000c,0x0006,
	0x0000,0xfffa,0xfff4,0xffee,0xffe7,0xffe1,0xffdb,0xffd5,
	0xffcf,0xffc8,0xffc2,0xffbc,0xffb6,0xffb0,0xffaa,0xffa4,
	0xff9f,0xff99,0xff93,0xff8d,0xff88,0xff82,0xff7d,0xff78,
	0xff72,0xff6d,0xff68,0xff63,0xff5e,0xff59,0xff55,0xff50,
	0xff4b,0xff47,0xff43,0xff3f,0xff3b,0xff37,0xff33,0xff2f,
	0xff2c,0xff28,0xff25,0xff22,0xff1f,0xff1c,0xff19,0xff16,
	0xff14,0xff12,0xff0f,0xff0d,0xff0c,0xff0a,0xff08,0xff07,
	0xff05,0xff04,0xff03,0xff02,0xff02,0xff01,0xff01,0xff01,
	0xff00,0xff01,0xff01,0xff01,0xff02,0xff02,0xff03,0xff04,
	0xff05,0xff07,0xff08,0xff0a,0xff0c,0xff0d,0xff0f,0xff12,
	0xff14,0xff16,0xff19,0xff1c,0xff1f,0xff22,0xff25,0xff28,
	0xff2c,0xff2f,0xff33,0xff37,0xff3b,0xff3f,0xff43,0xff47,
	0xff4b,0xff50,0xff55,0xff59,0xff5e,0xff63,0xff68,0xff6d,
	0xff72,0xff78,0xff7d,0xff82,0xff88,0xff8d,0xff93,0xff99,
	0xff9f,0xffa4,0xffaa,0xffb0,0xffb6,0xffbc,0xffc2,0xffc8,
	0xffcf,0xffd5,0xffdb,0xffe1,0xffe7,0xffee,0xfff4,0xfffa,
	0x0000,0x0006,0x000c,0x0012,0x0019,0x001f,0x0025,0x002b,
	0x0031,0x0038,0x003e,0x0044,0x004a,0x0050,0x0056,0x005c,
	0x0061,0x0067,0x006d,0x0073,0x0078,0x007e,0x0083,0x0088,
	0x008e,0x0093,0x0098,0x009d,0x00a2,0x00a7,0x00ab,0x00b0,
	0x00b5,0x00b9,0x00bd,0x00c1,0x00c5,0x00c9,0x00cd,0x00d1,
	0x00d4,0x00d8,0x00db,0x00de,0x00e1,0x00e4,0x00e7,0x00ea,
	0x00ec,0x00ee,0x00f1,0x00f3,0x00f4,0x00f6,0x00f8,0x00f9,
	0x00fb,0x00fc,0x00fd,0x00fe,0x00fe,0x00ff,0x00ff,0x00ff,
};

/********************************************************************/
/*                                                                  */
/*				回転用SINCOSデータ取得(data:*0x1000)				*/
/*                                                                  */
/********************************************************************/
#define	THETA_360_DEF	(360)

const s16 sincos_360_table[] = {
   0,  71, 143, 214, 286, 357, 428, 499, 570, 641, 711, 782,
 852, 921, 991,1060,1129,1198,1266,1334,1401,1468,1534,1600,
1666,1731,1796,1860,1923,1986,2048,2110,2171,2231,2290,2349,
2408,2465,2522,2578,2633,2687,2741,2793,2845,2896,2946,2996,
3044,3091,3138,3183,3228,3271,3314,3355,3396,3435,3474,3511,
3547,3582,3617,3650,3681,3712,3742,3770,3798,3824,3849,3873,
3896,3917,3937,3956,3974,3991,4006,4021,4034,4046,4056,4065,
4073,4080,4086,4090,4093,4095,4096,4095,4093,4090,4086,4080,
4073,4065,4056,4046,4034,4021,4006,3991,3974,3956,3937,3917,
3896,3873,3849,3824,3798,3770,3742,3712,3681,3650,3617,3582,
3547,3511,3474,3435,3396,3355,3314,3271,3228,3183,3138,3091,
3044,2996,2946,2896,2845,2793,2741,2687,2633,2578,2522,2465,
2408,2349,2290,2231,2171,2110,2048,1986,1923,1860,1796,1731,
1666,1600,1534,1468,1401,1334,1266,1198,1129,1060, 991, 921,
 852, 782, 711, 641, 570, 499, 428, 357, 286, 214, 143,  71,
};

s16 Sin_360_Get(u16 theta)
{
	s16	sin_value;
	u16	table_p,plusminus;

	table_p		= (theta%(THETA_360_DEF/2));
	plusminus	= ((theta/(THETA_360_DEF/2))&1);	//0:plus,1:minus

	sin_value	= sincos_360_table[table_p];

	if(plusminus){
		return -sin_value;
	}else{
		return sin_value;
	}
}

s16 Cos_360_Get(u16 theta)
{
	return	Sin_360_Get(theta+(THETA_360_DEF/4));
}





/*------------------------------------------------------------------*/
/*                      ランダム生成                                */
/*------------------------------------------------------------------*/
//#define RAND_MAX 32767
//    return (u16)(r_next / 65536L) % 32768;

u16 pp_rand(void)
{
//    r_next = r_next *1103515245L + 12345;
    r_next = r_next *1103515245L + 24691;	// 12345*2+1 (RAND_MAX=32727の時に12345なら65535の時は倍必要なのではないか？テスト)
    return (u16)(r_next / 65536L) ;
}

void pp_srand(u16 seed)
{
    r_next = seed;
}


/*------------------------------------------------------------------*/
/* 昔のrand															*/
/*------------------------------------------------------------------*/
#if 0
#define RAND_MAX 32767			

u16 pp_rand(void)
{
    r_next = r_next *1103515245L + 12345;
    return (u16)(r_next / 65536L) % 32768;
}
#endif


/*------------------------------------------------------------------*/
/*                      ナンバーからビットを算出                    */
/*------------------------------------------------------------------*/

const u32 no2bittbl[32]={
	0x00000001,
	0x00000002,
	0x00000004,
	0x00000008,
	0x00000010,
	0x00000020,
	0x00000040,
	0x00000080,
	0x00000100,
	0x00000200,
	0x00000400,
	0x00000800,
	0x00001000,
	0x00002000,
	0x00004000,
	0x00008000,
	0x00010000,
	0x00020000,
	0x00040000,
	0x00080000,
	0x00100000,
	0x00200000,
	0x00400000,
	0x00800000,
	0x01000000,
	0x02000000,
	0x04000000,
	0x08000000,
	0x10000000,
	0x20000000,
	0x40000000,
	0x80000000,
};


//=========================================================================
//	透明アクター登録
// 引数:move関数
// 戻り値:ｾｯﾄしたｱｸﾀｰﾜｰｸの配列番号
//=========================================================================
const actHeader BanishActHeader = 
{
	0,
	0,
	&DummyActOam,
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	DummyActMove,
};
u8 AddBanishActor(void (*move_p)(actWork *))
{
	u8 no;
	
	no = AddActor(&BanishActHeader, 240+8, 160+8, 14);
	ActWork[no].banish = 1;
	ActWork[no].move = move_p;
	
	return no;
}


//=========================================================================
//	ｱｸﾀｰやﾀｽｸのように16bitのﾜｰｸが連続して配置されているところに
//  ｱﾄﾞﾚｽをｾｯﾄする
//=========================================================================
void SetAdrs_to_Work(s16 *pwork, void *Adrs)
{
	pwork[0] = (s16)((u32)Adrs);
	pwork[1] = (s16)((u32)Adrs >> 16);
}
//=========================================================================
//	↑のやつでｾｯﾄしたｱﾄﾞﾚｽを取り出す
//=========================================================================
void SetWork_to_Seq(s16 *pwork, void *Adrs)
{
	u32 *temp;
	temp = Adrs;
	*temp = (0xffff & pwork[0]) | (pwork[1] << 16);
}



//=========================================================================
//	BG回転拡縮用のSrcﾃﾞｰﾀｾｯﾄ
//=========================================================================
void BgAffineSrcSet(BgAffineSrcData *Src, s32 CenterX, s32 CenterY, 
			s16 DispCenterX, s16 DispCenterY, s16 RatioX, s16 RatioY, u16 Theta)
{
	Src->SrcCenterX = CenterX;		//元ﾃﾞｰﾀ中心座標(少数点以下8ﾋﾞｯﾄ)
	Src->SrcCenterY = CenterY;
	Src->DispCenterX = DispCenterX;	//表示中心座標
	Src->DispCenterY = DispCenterY;
	Src->RatioX = RatioX;			//拡大縮小率(小数点以下8ﾋﾞｯﾄ)
	Src->RatioY = RatioY;
	Src->Theta = Theta;				//回転角(小数点以下8ﾋﾞｯﾄ)
}

//----------------------------------------------------------
//	Srcﾃﾞｰﾀ計算→Destﾊﾞｯﾌｧｰに結果を代入
//----------------------------------------------------------
void BgAffineCalcSet(BgAffineDestData *Dest, s32 CenterX, s32 CenterY,
			s16 DispCenterX, s16 DispCenterY, s16 RatioX, s16 RatioY, u16 Theta)
{
	BgAffineSrcData Src;
	
	BgAffineSrcSet(&Src, CenterX, CenterY, DispCenterX, DispCenterY, RatioX, RatioY, Theta);
	BgAffineSet(&Src, Dest, 1);
}


//=========================================================================
//	BG(text,16色ﾌｫｰﾏｯﾄ)をOBJに落としこむ
// shape,size : 落としこむOBJの形状   *src : 対象BGのｷｬﾗｸﾀﾍﾞｰｽ先頭ｱﾄﾞﾚｽ
// *scrn : 落としこむｷｬﾗが配置されているｽｸﾘｰﾝのｱﾄﾞﾚｽ
// *dest : 落とし先のｱﾄﾞﾚｽ(OBJのVRAMｱﾄﾞﾚｽ)
//=========================================================================
void BG_to_OBJ(u8 shape, u8 size, u8 *src, u16 *scrn, u8 *dest)
{
	u8 v_max, h_max;
	u8 v, h;
	s8 i, t;
	u8 temp[32];	//ｷｬﾗﾃﾞｰﾀ一時形成ワーク
	u8 base;
	u16 CharPos;
	
	v_max = obj_h_v[shape][size][1];
	h_max = obj_h_v[shape][size][0];
	for(v = 0; v < v_max; v++)
	{
		for(h = 0; h < h_max; h++)
		{
			CharPos = ((*scrn) & 0x03ff) * 0x20;
			
			if(((*scrn) & 0x0c00) == 0)	//ﾌﾘｯﾌﾟOFF
			{
				DIV_DMACOPY(3, &src[CharPos], dest, 0x20, 32);
			}
			else if(((*scrn) & 0x0800) && (((*scrn) & 0x0400) == 0))	// VﾌﾘｯﾌﾟのみON
			{
				for(i = 0; i < 8; i++)
					DIV_DMACOPY(3, &src[CharPos + (7-i)*4], &dest[i*4], 32/8, 32);
			}
			else// if((*scrn) & 0x0400)	// HﾌﾘｯﾌﾟON
			{
				for(i = 0; i < 8; i++)
				{
					for(t = 0; t < 4; t++)
					{
						base = i*4;		//↓1バイト中のﾄﾞｯﾄﾃﾞｰﾀをｽﾜｯﾌﾟさせる
						temp[base+(3-t)] = ((src[CharPos + base+t] & 0x0f) << 4)
							 | (src[CharPos + base+t] >> 4);
					}
				}
				if((*scrn) & 0x0800)	// Vﾌﾘｯﾌﾟも立っているかﾁｪｯｸ
				{
					for(i = 0; i < 8; i++)
						DIV_DMACOPY(3, &temp[(7-i)*4], &dest[i*4], 32/8, 32);
				}
				else
					DIV_DMACOPY(3, temp, dest, 0x20, 32);
			}
			scrn++;
			dest += 0x20;
		}
		scrn += 32 - h_max;
	}
}

//					shape,size, x&y
static const u8 obj_h_v[3][4][2] = {
	{
		{1,1},	//横 縦
		{2,2},
		{4,4},
		{8,8},
	},
	{
		{2,1},
		{4,1},
		{4,2},
		{8,4},
	},
	{
		{1,2},
		{1,4},
		{2,4},
		{4,8},
	}
};

//ビットをナンバーに変換

u8	Bit2No(u32 bitdata)
{
	u8	i;

	for(i=0;i<32;i++){
		if(bitdata&1)
			return i;
		bitdata=bitdata>>1;
	}
	return 0;
}

//=========================================================================
//	CRC(巡回冗長検査アルゴリズム）による誤り検出コードの算出
//	※『Ｃ言語によるアルゴリズム事典』のものとほぼ同じアルゴリズムで実装
//		少なくとも２００１年６月時点で訂正はないので大丈夫なはず…
//=========================================================================
#define CRCINIT_VALUE	0x1121
#define	CRCPOLY_VALUE	0x8408
static const u16 crc_table[256];

//----------------------------------------------------------
//----------------------------------------------------------
u16 calc_crc(const u8 * adrs, int size)
{
	u16 i, j, r;

	r = CRCINIT_VALUE;
	for (i = 0; i< size; i++) {
		r ^= adrs[i];
		for (j = 0; j < 8; j++) {
			if (r & 1)
				r = (r >> 1) ^ CRCPOLY_VALUE;
			else
				r = r >> 1;
		}
	}
	return r ^ 0xffff;
}

//----------------------------------------------------------
//----------------------------------------------------------
u16 calc_fast_crc(const u8 * adrs, int size)
{
	u16 r;
	u16 i;

	r = CRCINIT_VALUE;
	for (i = 0; i < size; i++) {
		r = (r >> 8) ^ crc_table[(u8)r ^ adrs[i]];
	}
	return r ^ 0xffff;
}

static const u16 crc_table[] = {
0x0000,0x1189,0x2312,0x329b,0x4624,0x57ad,0x6536,0x74bf,	// 0- 7
0x8c48,0x9dc1,0xaf5a,0xbed3,0xca6c,0xdbe5,0xe97e,0xf8f7,	// 8- f
0x1081,0x0108,0x3393,0x221a,0x56a5,0x472c,0x75b7,0x643e,	//10-17
0x9cc9,0x8d40,0xbfdb,0xae52,0xdaed,0xcb64,0xf9ff,0xe876,	//18-1f
0x2102,0x308b,0x0210,0x1399,0x6726,0x76af,0x4434,0x55bd,	//20-27
0xad4a,0xbcc3,0x8e58,0x9fd1,0xeb6e,0xfae7,0xc87c,0xd9f5,	//28-2f
0x3183,0x200a,0x1291,0x0318,0x77a7,0x662e,0x54b5,0x453c,	//30-37
0xbdcb,0xac42,0x9ed9,0x8f50,0xfbef,0xea66,0xd8fd,0xc974,	//38-3f
0x4204,0x538d,0x6116,0x709f,0x0420,0x15a9,0x2732,0x36bb,	//40-47
0xce4c,0xdfc5,0xed5e,0xfcd7,0x8868,0x99e1,0xab7a,0xbaf3,	//48-4f
0x5285,0x430c,0x7197,0x601e,0x14a1,0x0528,0x37b3,0x263a,	//50-57
0xdecd,0xcf44,0xfddf,0xec56,0x98e9,0x8960,0xbbfb,0xaa72,	//58-5f
0x6306,0x728f,0x4014,0x519d,0x2522,0x34ab,0x0630,0x17b9,	//60-67
0xef4e,0xfec7,0xcc5c,0xddd5,0xa96a,0xb8e3,0x8a78,0x9bf1,	//68-6f
0x7387,0x620e,0x5095,0x411c,0x35a3,0x242a,0x16b1,0x0738,	//70-77
0xffcf,0xee46,0xdcdd,0xcd54,0xb9eb,0xa862,0x9af9,0x8b70,	//78-7f
0x8408,0x9581,0xa71a,0xb693,0xc22c,0xd3a5,0xe13e,0xf0b7,	//80-87
0x0840,0x19c9,0x2b52,0x3adb,0x4e64,0x5fed,0x6d76,0x7cff,	//88-8f
0x9489,0x8500,0xb79b,0xa612,0xd2ad,0xc324,0xf1bf,0xe036,	//90-97
0x18c1,0x0948,0x3bd3,0x2a5a,0x5ee5,0x4f6c,0x7df7,0x6c7e,	//98-9f
0xa50a,0xb483,0x8618,0x9791,0xe32e,0xf2a7,0xc03c,0xd1b5,	//a0-a7
0x2942,0x38cb,0x0a50,0x1bd9,0x6f66,0x7eef,0x4c74,0x5dfd,	//a8-af
0xb58b,0xa402,0x9699,0x8710,0xf3af,0xe226,0xd0bd,0xc134,	//b0-b7
0x39c3,0x284a,0x1ad1,0x0b58,0x7fe7,0x6e6e,0x5cf5,0x4d7c,	//b8-bf
0xc60c,0xd785,0xe51e,0xf497,0x8028,0x91a1,0xa33a,0xb2b3,	//c0-c7
0x4a44,0x5bcd,0x6956,0x78df,0x0c60,0x1de9,0x2f72,0x3efb,	//c8-cf
0xd68d,0xc704,0xf59f,0xe416,0x90a9,0x8120,0xb3bb,0xa232,	//d0-d7
0x5ac5,0x4b4c,0x79d7,0x685e,0x1ce1,0x0d68,0x3ff3,0x2e7a,	//d8-df
0xe70e,0xf687,0xc41c,0xd595,0xa12a,0xb0a3,0x8238,0x93b1,	//e0-e7
0x6b46,0x7acf,0x4854,0x59dd,0x2d62,0x3ceb,0x0e70,0x1ff9,	//e8-ef
0xf78f,0xe606,0xd49d,0xc514,0xb1ab,0xa022,0x92b9,0x8330,	//f0-f7
0x7bc7,0x6a4e,0x58d5,0x495c,0x3de3,0x2c6a,0x1ef1,0x0f78,	//f8-ff
};

