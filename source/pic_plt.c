/*==================================================================*/
/*                  pic_plt.c                                       */
/*             　　 画像パレット計算部分                            */
/*                  by tomo                                         */
/*==================================================================*/

/*==================================================================*/
/*                      INCLUDE FILE                                */
/*==================================================================*/
#include "common.h"
#include "intr.h"
#include "print.h"
#include "calctool.h"
#include "menu.h"
#include "palanm.h"
#include "actanm.h"
#include "objdata.h"
#include "decord.h"
#include "pic_eff.h"

/*==================================================================*/
/*==================================================================*/
extern u16 black_white(u16 *rgb);
/*==================================================================*/
/*                      関数宣言                                    */
/*==================================================================*/
void poke_bit_color_down(BE_ST *est);
//void effect_pal_trans(BE_ST *est);

//void bit16_to_vram(BE_ST *est,u8 x,u8 y);
/*==================================================================*/
/*                      内部関数宣言                                */
/*==================================================================*/
static void pal_set_c16(void);
static void pal_set_bw(void);
static void pal_set_gr1(void);
static void pal_set_gr2(void);

static void bit_set_c256(u8 mode);
static void bit_set_c16(void);
static void bit_set_gr1(void);
static void bit_set_gr2(void);
static void bit_set_bw(void);

static u16 rgb_sub_color2(u16 *rgb);
static u16 rgb_sub_color3(u16 *rgb);
static u16 rgb_sub_gr1(u16 *rgb);
static u16 rgb_sub_gr2(u16 *rgb);

/*==================================================================*/
/*                      define,typedef等                            */
/*==================================================================*/

/*==================================================================*/
/*                       変数                                       */
/*==================================================================*/
u8 eax,eay;				//エフェクトエリアの始点(X,Y)
u8 eah,eav;				//エフェクトエリアの大きさ(h,v)
u8 sah,sav;				//スクリーンエリアの大きさ(h,v)

u16 *sa_adrs;				//スクリーンエリアアドレス
u16 *pal_adrs;				//パレットアドレス
u16 pal_ofs;				//先頭からのオフセット

/*==================================================================*/
/*==================================================================*/
//減色とそれ専用のパレットを生成します。
//u8 mode:　0:255色,1:223色,2:15色,3:32色グレー,4:15色グレー,5:2色白黒
//////////u8 p_flag: 0:減色＋パレット生成,1:減色のみ,2:パレット生成のみ
//
void poke_bit_color_down(BE_ST *est)
{
	pal_ofs = est->pal_p*16;
	pal_adrs = est->pal_adrs + pal_ofs;
	sa_adrs = est->bg_adrs;
	eax = est->eax, eay = est->eay, eah = est->eah, eav = est->eav;
	sah = est->sah, sav = est->sav;

	switch(est->mode){
	case COL_MODE_255:			//255
		bit_set_c256(0);
		break;
	case COL_MODE_223:			//223(16*2分を他で使うので)
		bit_set_c256(1);
		break;
	case COL_MODE_15:			//15
		pal_set_c16();
		bit_set_c16();
		break;
	case COL_MODE_32G:			//32g
		pal_set_gr2();
		bit_set_gr2();
		break;
	case COL_MODE_15G:			//15g
		pal_set_gr1();
		bit_set_gr1();
		break;
	case COL_MODE_BW:			//b/w
		pal_set_bw();
		bit_set_bw();
		break;
	default:
		break;
	}
}

/*==================================================================*/
/*	これ以降はパレット計算部分                                      */
/*==================================================================*/
//15(ヌケ色込みで16色)版カラーパレット作成
static void pal_set_c16(void)
{
	*(pal_adrs+0) = RGB_BLACK;		//抜け色クリア
	*(pal_adrs+1) = ((B_MIN<<10) | (G_MIN<<5) | (R_MIN));		//黒
	*(pal_adrs+2) = ((B_MAX<<10) | (G_MAX<<5) | (R_MAX));		//白
	*(pal_adrs+3) = ((B_MID<<10) | (G_MID<<5) | (R_MID));		//灰色

	*(pal_adrs+4) = ((B_MIN<<10) | (G_MIN<<5) | (R_MAX));		//赤
	*(pal_adrs+5) = ((B_MIN<<10) | (G_MAX<<5) | (R_MIN));		//緑
	*(pal_adrs+6) = ((B_MAX<<10) | (G_MIN<<5) | (R_MIN));		//青

	*(pal_adrs+7) = ((B_MIN<<10) | (G_MAX<<5) | (R_MAX));		//イエロー
	*(pal_adrs+8) = ((B_MAX<<10) | (G_MIN<<5) | (R_MAX));		//ピンク
	*(pal_adrs+9) = ((B_MAX<<10) | (G_MAX<<5) | (R_MIN));		//水色

	*(pal_adrs+10)= ((B_MIN<<10) | (G_MID<<5) | (R_MAX));		//
	*(pal_adrs+11)= ((B_MIN<<10) | (G_MAX<<5) | (R_MID));		//
	*(pal_adrs+12)= ((B_MAX<<10) | (G_MID<<5) | (R_MIN));		//

	*(pal_adrs+13)= ((B_MID<<10) | (G_MIN<<5) | (R_MAX));		//
	*(pal_adrs+14)= ((B_MID<<10) | (G_MAX<<5) | (R_MIN));		//
	*(pal_adrs+15)= ((B_MAX<<10) | (G_MIN<<5) | (R_MID));		//
}

/*==================================================================*/
/*==================================================================*/
//白黒専用パレット作成
static void pal_set_bw(void)
{
	*(pal_adrs+0) = RGB_BLACK;			//ヌケ色

	*(pal_adrs+1) = RGB_BLACK;			//最初の色を黒へ
	*(pal_adrs+2) = RGB_WHITE;			//次の色を白へ
}

/*==================================================================*/
/*==================================================================*/
//１５色(ヌケ色込みで１６色)版グレースケールパレット作成
static void pal_set_gr1(void)
{
	u8 i;

	*(pal_adrs+0) = RGB_BLACK;			//ヌケ色

	*(pal_adrs+1) = RGB_BLACK;			//最初の色を黒へ

	for(i=0;i<14;i++){					//１５(ﾇｹ色込みで16)色にするため、"R:G:B=2"は無視
		*(pal_adrs+2+i) = ((((i+2)*2)<<10) | (((i+2)*2)<<5) | (i+2)*2);
	}
}

/*==================================================================*/
/*==================================================================*/
//32色(ヌケ色込みで33色)版グレースケールパレット作成
static void pal_set_gr2(void)
{
	u8 i;

	*(pal_adrs+0) = RGB_BLACK;			//ヌケ色

	for(i=0;i<32;i++){
		*(pal_adrs+1+i) = ((i<<10) | (i<<5) | i);
	}
}

/*==================================================================*/
/*	これ以降は減色セット部分                                        */
/*==================================================================*/
//フルカラー->256色減色
//mode 0:255色(フルで使用)、1:223(255-32)色
static void bit_set_c256(u8 mode)
{
	u8 r,s,t,c_max;
	u16 *adrs;
	u16 pd;

	if(mode==0){
		c_max=255;
	}else{
		c_max=223;
	}
	for(r=0;r<c_max;r++){								//パレット初期化
		*(pal_adrs + r) = RGB_BLACK;
	}
	*(pal_adrs + c_max) = RGB_GRAY;					//灰色(オーバー時)

	for(s=0;s<eav;s++){	//縦のセル
		adrs = sa_adrs + (eay+s) * sah + eax;
		for(r=0;r<eah;r++,adrs++){	//横のセル
			if((*adrs)&0x8000) {	//ヌケ色のとき
				*adrs=pal_ofs;
				continue;
			}

			pd = rgb_sub_color2(adrs);		//減色
			//該当するパレットチェック（ないときは新規にパレットセット）
			for(t=1;t<c_max;t++){
				if(*(pal_adrs+t) == RGB_BLACK){	//空きのとき
					*(pal_adrs+t) = pd;
					*adrs=t+pal_ofs;
					break;
				}

				if(*(pal_adrs+t) == pd){		//同じ時
					*adrs=t+pal_ofs;
					break;
				}
			}
			if(t==c_max){			//当てはまらないとき
				*adrs=c_max;
			}
		}
	}
}

/*==================================================================*/
/*==================================================================*/
//フルカラー->白黒２色減色
static void bit_set_bw(void)
{
	u8 r,s;
	u16 *adrs;
	u16 pd;

	for(s=0;s<eav;s++){	//縦のセル
		adrs = sa_adrs + (eay+s) * sah + eax;
		for(r=0;r<eah;r++,adrs++){	//横のセル
			if((*adrs)&0x8000) {	//ヌケ色のとき
				*adrs=pal_ofs;
				continue;
			}

			pd = black_white(adrs);		//減色
			if(pd == RGB_BLACK) {	//黒
				*adrs=1+pal_ofs;
			}else{				//白
				*adrs=2+pal_ofs;
			}
		}
	}
}

/*==================================================================*/
/*==================================================================*/
//フルカラー->15色グレー減色
static void bit_set_gr1(void)
{
	u8 r,s;
	u16 *adrs;

	for(s=0;s<eav;s++){	//縦のセル
		adrs = sa_adrs + (eay+s) * sah + eax;
		for(r=0;r<eah;r++,adrs++){	//横のセル
			if((*adrs)&0x8000) {	//ヌケ色のとき
				*adrs=pal_ofs;
				continue;
			}

			*adrs = rgb_sub_gr1(adrs) + pal_ofs;
		}
	}

}

/*==================================================================*/
/*==================================================================*/
//フルカラー->32色グレー減色(256パレット用）
static void bit_set_gr2(void)
{
	u8 r,s;
	u16 *adrs;

	for(s=0;s<eav;s++){	//縦のセル
		adrs = sa_adrs + (eay+s) * sah + eax;
		for(r=0;r<eah;r++,adrs++){	//横のセル
			if((*adrs)&0x8000) {	//ヌケ色のとき
				*adrs=pal_ofs;
				continue;
			}

			*adrs = rgb_sub_gr2(adrs) + pal_ofs;
		}
	}
}

/*==================================================================*/
/*==================================================================*/
//フルカラー->16色減色
static void bit_set_c16(void)
{
	u8 r,s;
	u16 *adrs;

	for(s=0;s<eav;s++){	//縦のセル
		adrs = sa_adrs + (eay+s) * sah + eax;
		for(r=0;r<eah;r++,adrs++){	//横のセル
			if((*adrs)&0x8000) {	//ヌケ色のとき
				*adrs=pal_ofs;
				continue;
			}

			*adrs = rgb_sub_color3(adrs) + pal_ofs;
		}
	}
}

/*==================================================================*/
/*            関数内の計算関数                                      */
/*==================================================================*/
//減色処理(256内に99%の確率で収まる？）
static u16 rgb_sub_color2(u16 *rgb)
{
	u16 r,g,b;

	r = *rgb & 0x001f;
	g = ((*rgb)>>5) & 0x001f;
	b = ((*rgb)>>10) & 0x001f;

	if(r & 0x0003) r = (r & 0x001c) + 4;
	if(g & 0x0003) g = (g & 0x001c) + 4;
	if(b & 0x0003) b = (b & 0x001c) + 4;

	if(r <  6) r = 6;
	if(r > 30) r = 30;
	if(g <  6) g = 6;
	if(g > 30) g = 30;
	if(b <  6) b = 6;
	if(b > 30) b = 30;

	return ((b<<10) | (g<<5) | r);
}

/*==================================================================*/
/*==================================================================*/
#define BL_MAX 11		//黒としての限界の明るさ
#define WH_MIN 20		//白としての限界の暗さ

//減色処理(15色以内に必ず納める)
static u16 rgb_sub_color3(u16 *rgb)
{
	u16 r,g,b;

	r = *rgb & 0x001f;
	g = ((*rgb)>>5) & 0x001f;
	b = ((*rgb)>>10) & 0x001f;

//--------
	if((r <= BL_MAX)&&(g < BL_MAX)&&(b < BL_MAX)) {			//黒
		return 1;
	}
	if((r >= WH_MIN)&&(g >= WH_MIN)&&(b >= WH_MIN)) {		//白
		return 2;
	}

//--------
	if((r >= WH_MIN)&&(g >= WH_MIN)) {			//イエロー
		if(b >= ((BL_MAX+WH_MIN)/2)){ //残りの１色も明るいときは白へ
			return 2;
		}
		return 7;
	}
	if((r >= WH_MIN)&&(b >= WH_MIN)) {			//マゼンダ
		if(g >= ((BL_MAX+WH_MIN)/2)){ //残りの１色も明るいときは白へ
			return 2;
		}
		return 8;
	}
	if((g >= WH_MIN)&&(b >= WH_MIN)) {			//シアン
		if(r >= ((BL_MAX+WH_MIN)/2)){ //残りの１色も明るいときは白へ
			return 2;
		}
		return 9;
	}

//--------
	if(r >= WH_MIN) {			//赤が強いとき
		if((g > BL_MAX)&&(b > BL_MAX)){		//残り２色が少し明るいとき
			if(g < b){		//マゼンダへ
				return 8;
			}else{			//イエロー
				return 7;
			}
		}

		if(g > BL_MAX) return 10;
		if(b > BL_MAX) return 13;
		return 4;
	}
	if(g >= WH_MIN) {			//緑が強いとき
		if((r > BL_MAX)&&(b > BL_MAX)){		//残り２色が少し明るいとき
			if(r < b){		//シアンへ
				return 9;
			}else{			//イエローへ
				return 7;
			}
		}

		if(r > BL_MAX) return 11;
		if(b > BL_MAX) return 14;
		return 5;
	}
	if(b >= WH_MIN) {			//青が強いとき
		if((r > BL_MAX)&&(g > BL_MAX)){		//残り２色が少し明るいとき
			if(r < g){		//シアンへ
				return 9;
			}else{			//マゼンダへ
				return 8;
			}
		}

		if(g > BL_MAX) return 12;
		if(b > BL_MAX) return 15;
		return 6;
	}

	return 3;									//残りは全て灰色(念のため)
}

/*==================================================================*/
/*==================================================================*/
//減色処理(グレー15色以内に必ず納める)
static u16 rgb_sub_gr1(u16 *rgb)
{
	u16 r,g,b;

	r = *rgb & 0x001f;
	g = ((*rgb)>>5) & 0x001f;
	b = ((*rgb)>>10) & 0x001f;

	r = ((r + g + b)/3)&0x001e;		//中間値生成

	if(r==0) return 1;				//0と２を同一へ(1パレット足らないので)

	return (r/2);
}

/*==================================================================*/
/*==================================================================*/
//減色処理(グレー32色以内に必ず納める)
static u16 rgb_sub_gr2(u16 *rgb)
{
	u16 r,g,b;

	r = *rgb & 0x001f;
	g = ((*rgb)>>5) & 0x001f;
	b = ((*rgb)>>10) & 0x001f;

	r = (r + g + b)/3;		//中間値生成

	return (1+r);
}

/*==================================================================*/
/*==================================================================*/
#if 0
//bit方式からパレット方式(16bit)に変換した物を、
//モード４形式でＶＲＡＭへ展開(※あくまでエフェクトが正常かの実験用）
//VRAMへのアクセスは、モード４でも１６ビットアクセスなので注意
//そのため、テスト版ではＸ座標は偶数限定です。
void bit16_to_vram(BE_ST *est,u8 x,u8 y)
{
	u8 r,s;
	u16 *in_adrs;
	u16 *out_adrs;
	u16 d;

	effect_pal_trans(est);

	for(s=0;s<eav;s++){	//縦のセル
		in_adrs = sa_adrs + (eay+s) * sah + eax;
		out_adrs = (u16 *)((u8 *)(BG_BITMAP0_VRAM + (y+s) * 240 + x));
		for(r=0;r<(eah/2);r++){	//横のセル
			d = (*in_adrs) + ((*(in_adrs+1))<<8);
			*out_adrs = d;

			in_adrs+=2;			//4byte増((u16 *) * 2)
			out_adrs++;			//2byte増((u16 *) * 1)
		}
	}
}
#endif

/*==================================================================*/
/*==================================================================*/
#if 0
//エフェクト後のパレットをパレットRAMへ転送(BGorOBJ)
void effect_pal_trans(BE_ST *est)
{
	u16 i,len;

	pal_ofs = est->pal_p*16;
	pal_adrs = est->pal_adrs + pal_ofs;

	len = 0;
	switch(est->mode){
	//256色タイプ
	case COL_MODE_255:			//255
		len = 256*2;
		break;
	case COL_MODE_223:			//223
		len = 224*2;
		break;
	case COL_MODE_15:			//32g
		len = 33*2;
		break;
	//16色タイプ
	case COL_MODE_32G:			//15
		len = 16*2;
		break;
	case COL_MODE_15G:			//15g
		len = 16*2;
		break;
	case COL_MODE_BW:			//b/w
		len = 3*2;
		break;
	}

	if((est->out_mode==0)||(est->out_mode==1)){	//BG mode
		for(i=0;i<len;i++){
			*((u16 *)BG_PLTT+pal_ofs+i) = *(pal_adrs+i);
		}
	}else{								//OBJ mode
		for(i=0;i<len;i++){
			*((u16 *)OBJ_PLTT+pal_ofs+i) = *(pal_adrs+i);
		}
	}
}
#endif
/*==================================================================*/
/*==================================================================*/
