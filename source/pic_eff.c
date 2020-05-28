/*==================================================================*/
/*                  pic_eff.c                                       */
/*             　　 画像エフェクト計算部分                          */
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

#include "e_rand.h"

#include "pic_eff.h"

/*==================================================================*/
/*                      関数宣言                                    */
/*==================================================================*/
void poke_bit_effect(BE_ST *est);

/*==================================================================*/
/*                      内部関数宣言                                */
/*==================================================================*/
//static void effect_tenten(void);
//static void effect_pasuteru(void);
static void effect_pasuteru_poke(void);
//static void effect_focus_h(void);
//static void effect_focus_v(void);
static void effect_gray_scale(void);
//static void effect_gray_scale2(void);
//static void effect_fuchidori_h(void);
static void effect_fuchidori_v(void);
//static void effect_fuchidori_v_v2(void);
static void effect_rinkaku(void);
static void effect_rinkaku_color(u8 pat);
static void effect_rinkaku_plus(void);
static void effect_hanten(void);
static void effect_awai_poke(void);
//static void effect_awai(void);
static void effect_fuchidori2_h(void);
static void effect_fuchidori2_v(void);
static void effect_gray_color_up(u8 uv);
static void effect_gray_white_down(u8 uv);

//static void aburae_noise(u16 no);
static void aburae_noise_poke(u16 no);
u16 black_white(u16 *rgb);
static u16 color_white(u16 *rgb,u8 pat) ;
static u16 black_fuchi(u16 *rgb,u16 *rgb2);
static u16 black2color(u8 pat);
//static u16 rgb_comp3(u16 *rgb1,u16 *rgb2,u16 *rgb3);
static u16 rgb_gray_scale(u16 *rgb);
//static u16 rgb_gray_scale2(u16 *rgb);
static u16 rgb_meian_change(u16 *rgb);
static u16 rgb_fuchi2_x(u16 *rgb1,u16 *rgb2);
static u16 rgb_fuchi3(u16 *rgb1,u16 *rgb2,u16 *rgb3);
static u16 rgb_fuchi3_v2(u16 *rgb1,u16 *rgb2,u16 *rgb3);

/*==================================================================*/
/*                define,typedef等                                  */
/*==================================================================*/
typedef struct{
	u8 x;
	u8 y;
	u16 sub_col;		//元絵から引く値
}CN;		//油絵風ノイズ格納用ワーク

/*==================================================================*/
/*                変数                                              */
/*==================================================================*/
u8 eax,eay;				//エフェクトエリアの始点(X,Y)
u8 eah,eav;				//エフェクトエリアの大きさ(h,v)
u8 sah,sav;				//スクリーンエリアの大きさ(h,v)

u16 *sa_adrs;			//スクリーンエリアアドレス

u8 eff_pat;				//エフェクトパターン(0:通常、1-4:パターン1-4)
/*==================================================================*/
/*==================================================================*/
//bitmap画像をエフェクトさせる
//※15bit(32768色)、bit15が１のときはヌケ。
//u8 eff_no:エフェクト番号(1-34。欠番あり)
//u8 ex,ey:エフェクトする部分の始点
//u8 eh,ev:エフェクトする部分のX,Yの大きさ
//u8 sh,sv:格納しているエリア全体のX,Yの大きさ

void poke_bit_effect(BE_ST *est)
{
	sa_adrs = est->bg_adrs;
	eff_pat = est->pat;
	eax = est->eax, eay = est->eay, eah = est->eah, eav = est->eav;
	sah = est->sah, sav = est->sav;

	switch(est->eff_no){
//	case EFF_KOUSHI:			//格子
//		effect_tenten();
//		break;
	case EFF_PASUTERU_POKE:			//パステル調(ポケモン画像専用版）
		effect_pasuteru_poke();
		break;
//	case EFF_FOCUS_H:			//フォーカス（横ライン）
//		effect_focus_h();
//		break;
//	case EFF_FOCUS_V:			//フォーカス（縦ライン）
//		effect_focus_v();
//		break;
//	case EFF_FOCUS:				//フォーカス（縦横）
//		effect_focus_h();
//		effect_focus_v();
//		break;
//	case EFF_GRAY15:			//グレースケール１５色
//		effect_gray_scale2();
//		break;
//	case EFF_FUCHI_H:			//ふちどり強化（横ライン）
//		effect_fuchidori_h();
//		break;
	case EFF_FUCHI_V:			//ふちどり強化（縦ライン）
		effect_fuchidori_v();
		break;
	case EFF_RINKAKU:			//輪郭取りだし
		effect_rinkaku_plus();
		effect_rinkaku_color(eff_pat);
		break;
	case EFF_SHIRUETTO:			//シルエット(合成)
		effect_rinkaku_plus();
		effect_hanten();
		effect_rinkaku();
		effect_hanten();
		break;
	case EFF_KYOUCYOU_BW:		//強調白黒画像(合成)
		effect_rinkaku_plus();
		effect_fuchidori2_h();
		effect_fuchidori2_h();
		effect_fuchidori2_v();
		effect_rinkaku();
		break;
	case EFF_AWAI_POKE:				//淡色調（合成）
		effect_awai_poke();
		break;
	case EFF_RINKAKU_KYOUCYO:	//輪郭のみ強調
		effect_rinkaku_plus();
		break;
	case EFF_HANTEN:			//明暗反転
		effect_hanten();
		break;
	case EFF_FUCHI2_H:			//縁取り特殊版（横）
		effect_fuchidori2_h();
		break;
	case EFF_FUCHI2_V:			//縁取り特殊版（縦）
		effect_fuchidori2_v();
		break;
	case EFF_GRAY32:			//グレースケール（32色）
		effect_gray_scale();
		effect_gray_color_up(GRAY_COLOR_UP);
		break;
//	case EFF_PASUTERU:			//パステル調
//		effect_pasuteru();
//		break;
	case EFF_SUMIE:				//墨絵調（合成）
		effect_rinkaku_plus();
		effect_fuchidori2_h();
		effect_fuchidori2_v();
		effect_rinkaku();
		effect_fuchidori_v();
		effect_fuchidori_v();
		effect_gray_color_up(SUMIE_COLOR_UP);
		effect_gray_white_down(SUMIE_WHITE_DOWN);
		break;
//	case EFF_AWAI:				//淡色調（合成）
//		effect_awai();
//		break;
	default:
		break;
	}
}

/*==================================================================*/
/*                 各エフェクト計算部分                             */
/*==================================================================*/
//グレー時のカラーの度合いを上げる
//※グレー以外のデータでの動作は保証しません。
static void effect_gray_color_up(u8 uv)
{
	u8 r,s,rgb;
	u16 *adrs;

	for(s=0;s<eav;s++){	//縦のセル
		adrs = sa_adrs + (eay+s) * sah + eax;
		for(r=0;r<eah;r++,adrs++){	//横のセル
			if((*adrs)&0x8000) continue;

			rgb = *adrs & 0x001f;
			rgb+=uv;
			if(rgb > 0x1f) rgb=0x1f;

			*adrs = ((rgb<<10) | (rgb<<5) | rgb);
		}
	}
}

/*==================================================================*/
/*==================================================================*/
//グレー時の白近辺の色を灰色へ
//※グレー以外のデータでの動作は保証しません。
static void effect_gray_white_down(u8 uv)
{
	u8 r,s,rgb;
	u16 *adrs;

	for(s=0;s<eav;s++){	//縦のセル
		adrs = sa_adrs + (eay+s) * sah + eax;
		for(r=0;r<eah;r++,adrs++){	//横のセル
			if((*adrs)&0x8000) continue;

			rgb = *adrs & 0x001f;

			if(rgb > (0x1f-uv)) rgb = 0x1f - (uv/2);

			*adrs = ((rgb<<10) | (rgb<<5) | rgb);
		}
	}
}
#if 0			//今回は使用しないので 0
/*==================================================================*/
/*==================================================================*/
//エフェクト	//点々？エフェクト
static void effect_tenten(void)
{
	u8 r,s;
	u16 *adrs;

	for(s=0;s<eav;s++){	//縦のセル
		adrs = sa_adrs + (eay+s) * sah + eax;
		for(r=0;r<eah;r++,adrs++){	//横のセル
			if((*adrs)&0x8000) continue;
			if(!(((s%2)==0)&&((r%2)==0))){
				*(adrs) = RGB_WHITE;
			}
		}
	}
}
#endif

#if 0			//今回は使用しないので 0
/*==================================================================*/
/*==================================================================*/
//油絵（パステル）調
static void effect_pasuteru(void)
{
	u32 i;

	for(i=0;i<(eah*50);i++) aburae_noise(i);
}
#endif

/*==================================================================*/
/*==================================================================*/
//油絵（パステル）調(ポケモン64*64ドット専用高速版）
static void effect_pasuteru_poke(void)
{
	u32 i;

	for(i=0;i<(PA_H*50);i++) aburae_noise_poke(i);
}

#if 0			//今回は使用しないので 0
/*==================================================================*/
/*==================================================================*/
//フォーカス横1回分
static void effect_focus_h(void)
{
	u8 r,s;
	u16 rgb_tmp1;
	u16 *adrs;

	for(s=0;s<eav;s++){
		adrs = sa_adrs + (eay+s) * sah + eax;
		//左端
		rgb_tmp1 = *adrs;
		//中央
		for(r=1,adrs++;r<(eah-1);r++,adrs++){
			if((*adrs)&0x8000) continue;
			*adrs = rgb_comp3(&rgb_tmp1,adrs,(adrs+1));
			rgb_tmp1 = *adrs;
		}
		//右端
		//現在特に処理なし
	}
}

/*==================================================================*/
/*==================================================================*/
//フォーカス縦1回分
static void effect_focus_v(void)
{
	u8 r,s;
	u16 rgb_tmp1;
	u16 *adrs;

	for(r=0;r<eah;r++){
		adrs = sa_adrs + eay * sah + (eax+r);
		//上端
		rgb_tmp1 = *adrs;	
		//中央
		for(s=1,adrs+=sah;s<(eav-1);s++,adrs+=sah){
			if((*adrs)&0x8000) continue;
			*adrs = rgb_comp3(&rgb_tmp1,adrs,(adrs+sah));
			rgb_tmp1 = *adrs;
		}
		//下端
		//現在特に処理なし
	}
}
#endif

/*==================================================================*/
/*==================================================================*/
//画面全体をグレイスケールへ(32色使用）
static void effect_gray_scale(void)
{
	u8 r,s;
	u16 *adrs;

	for(s=0;s<eav;s++){	//縦のセル
		adrs = sa_adrs + (eay+s) * sah + eax;
		for(r=0;r<eah;r++,adrs++){	//横のセル
			if((*adrs)&0x8000) continue;

			*adrs = rgb_gray_scale(adrs);
		}
	}
}

#if 0			//今回は使用しないので 0
/*==================================================================*/
/*==================================================================*/
//画面全体をグレイスケールへ(15色使用）
static void effect_gray_scale2(void)
{
	u8 r,s;
	u16 *adrs;

	for(s=0;s<eav;s++){	//縦のセル
		adrs = sa_adrs + (eay+s) * sah + eax;
		for(r=0;r<eah;r++,adrs++){	//横のセル
			if((*adrs)&0x8000) continue;
			*adrs = rgb_gray_scale2(adrs);
		}
	}
}
#endif

#if 0			//今回は使用しないので 0
/*==================================================================*/
/*==================================================================*/
//縁取り横のみ
static void effect_fuchidori_h(void)
{
	u8 r,s;
	u16 rgb_tmp1;
	u16 *adrs;

	for(s=0;s<eav;s++){		//横処理
		adrs = sa_adrs + (eay+s) * sah + eax;
		//左端
		rgb_tmp1 = *adrs;	
		//中央
		for(r=1,adrs++;r<(eah-1);r++,adrs++){
			if((*adrs)&0x8000) continue;
			*adrs = rgb_fuchi3(&rgb_tmp1,adrs,(adrs+1));
			rgb_tmp1 = *adrs;
		}
		//右端
		//現在特に処理なし
	}
}
#endif


/*==================================================================*/
/*==================================================================*/
//縁取り縦のみ
static void effect_fuchidori_v(void)
{
	u8 r,s;
	u16 rgb_tmp1;
	u16 *adrs;
	
	for(r=0;r<eah;r++){
		adrs = sa_adrs + eay * sah + (eax+r);
		//上端
		rgb_tmp1 = *adrs;	
		//中央
		for(s=1,adrs+=sah;s<(eav-1);s++,adrs+=sah){
			if((*adrs)&0x8000) continue;
			*adrs = rgb_fuchi3(&rgb_tmp1,adrs,(adrs+sah));
			rgb_tmp1 = *adrs;
		}
		//下端
	}
}

/*==================================================================*/
/*==================================================================*/
#if 0			//今回は使用しないので 0
//縁取り縦のみ(特殊版）
static void effect_fuchidori_v_v2(void)
{
	u8 r,s;
	u16 rgb_tmp1;
	u16 *adrs;
	
	for(r=0;r<eah;r++){
		adrs = sa_adrs + eay * sah + (eax+r);
		//上端
		rgb_tmp1 = *adrs;	
		//中央
		for(s=1,adrs+=sah;s<(eav-1);s++,adrs+=sah){
			if((*adrs)&0x8000) continue;
			*adrs = rgb_fuchi3_v2(&rgb_tmp1,adrs,(adrs+sah));
			rgb_tmp1 = *adrs;
		}
		//下端
	}
}
#endif
/*==================================================================*/
/*==================================================================*/
//輪郭のみ取り出す(カラー版)
static void effect_rinkaku_color(u8 pat)
{
	u8 r,s;
	u16 *adrs;

	for(s=0;s<eav;s++){	//縦のセル
		adrs = sa_adrs + (eay+s) * sah + eax;
		for(r=0;r<eah;r++,adrs++){	//横のセル
			if((*adrs)&0x8000) continue;
			*adrs = color_white(adrs,pat);
		}
	}
}

/*==================================================================*/
/*==================================================================*/
//輪郭のみ取り出す
static void effect_rinkaku(void)
{
	u8 r,s;
	u16 *adrs;

	for(s=0;s<eav;s++){	//縦のセル
		adrs = sa_adrs + (eay+s) * sah + eax;
		for(r=0;r<eah;r++,adrs++){	//横のセル
			if((*adrs)&0x8000) continue;
			*adrs = black_white(adrs);
		}
	}
}

/*==================================================================*/
/*==================================================================*/
//外輪郭補強(単体では使用せず）
static void effect_rinkaku_plus(void)
{
	u8 r,s;
	u16 *adrs;

//横処理
	for(s=0;s<eav;s++){
		adrs = sa_adrs + (eay+s) * sah + eax;
		//左端
		*adrs = black_fuchi(adrs,(adrs+1));
		//中央
		for(r=1,adrs++;r<(eah-1);r++,adrs++){
			*adrs = black_fuchi(adrs,(adrs+1));
			*adrs = black_fuchi(adrs,(adrs-1));
		}
		//右端
		*adrs = black_fuchi(adrs,(adrs-1));
	}

//縦処理
	for(r=0;r<eah;r++){
		adrs = sa_adrs + eay * sah + (eax+r);

		*adrs = black_fuchi(adrs,(adrs+sah));
		for(s=1,adrs+=sah;s<(eav-1);s++,adrs+=sah){
			*adrs = black_fuchi(adrs,(adrs+sah));
			*adrs = black_fuchi(adrs,(adrs-sah));
		}
		*adrs = black_fuchi(adrs,(adrs-sah));
	}
}

/*==================================================================*/
/*==================================================================*/
//RGBの各明暗を反転
static void effect_hanten(void)
{
	u8 r,s;
	u16 *adrs;

	for(s=0;s<eav;s++){	//縦のセル
		adrs = sa_adrs + (eay+s) * sah + eax;
		for(r=0;r<eah;r++,adrs++){	//横のセル
			if((*adrs)&0x8000) continue;
			*adrs = rgb_meian_change(adrs);
		}
	}
}

/*==================================================================*/
/*==================================================================*/
//淡い(ポケモン画像64*64dot専用)
static void effect_awai_poke(void)
{
	u8 r,s;
	u16 *adrs;
	u16 rgb_tmp1;

//反転
	adrs = sa_adrs;
	for(s=0;s<64;s++){
		for(r=0;r<64;r++,adrs++){
			if((*adrs)&0x8000) continue;
			*adrs = rgb_meian_change(adrs);
		}
	}

//縁取り縦のみ
	for(r=0;r<64;r++){
		adrs = sa_adrs + r;
		//上端
		rgb_tmp1 = *adrs;	
		*adrs = 0x8000;
		//中央
		for(s=1,adrs+=64;s<(64-1);s++,adrs+=64){
			if((*adrs)&0x8000) continue;
			*adrs = rgb_fuchi3_v2(&rgb_tmp1,adrs,(adrs+64));
			rgb_tmp1 = *adrs;
		}
		//下端
		*adrs = 0x8000;

		adrs = sa_adrs + r;
		//上端
		rgb_tmp1 = *adrs;	
		*adrs = 0x8000;
		//中央
		for(s=1,adrs+=64;s<(64-1);s++,adrs+=64){
			if((*adrs)&0x8000) continue;
			*adrs = rgb_fuchi3_v2(&rgb_tmp1,adrs,(adrs+64));
			rgb_tmp1 = *adrs;
		}
		//下端
		*adrs = 0x8000;
	}

//反転
	adrs = sa_adrs;
	for(s=0;s<64;s++){	//縦のセル
		for(r=0;r<64;r++,adrs++){	//横のセル
			if((*adrs)&0x8000) continue;
			*adrs = rgb_meian_change(adrs);
		}
	}
}

/*==================================================================*/
/*==================================================================*/

#if 0			//今回は使用しないので 0

//淡い
static void effect_awai(void)
{
	effect_hanten();
	effect_fuchidori_v_v2();
	effect_fuchidori_v_v2();
	effect_hanten();
}

#endif

/*==================================================================*/
/*==================================================================*/
//特殊縁取り横のみ
static void effect_fuchidori2_h(void)
{
	u8 r,s;
	u16 rgb_tmp1;
	u16 *adrs;

	for(s=0;s<eav;s++){		//横処理
		adrs = sa_adrs + (eay+s) * sah + eax;
		//左端
		rgb_tmp1 = *adrs;	
		//中央
		for(r=1,adrs++;r<(eah-1);r++,adrs++){
			if((*adrs)&0x8000) continue;
			*adrs = rgb_fuchi2_x(&rgb_tmp1,adrs);
			rgb_tmp1 = *adrs;
		}
		//右端
	}
}

/*==================================================================*/
/*==================================================================*/
//特殊縁取り縦のみ
static void effect_fuchidori2_v(void)
{
	u8 r,s;
	u16 rgb_tmp1;
	u16 *adrs;

	for(r=0;r<eah;r++){
		adrs = sa_adrs + eay * sah + (eax+r);

		//上端
		rgb_tmp1 = *adrs;	
		//中央
		for(s=1,adrs+=sah;s<(eav-1);s++,adrs+=sah){
			if((*adrs)&0x8000) continue;
			*adrs = rgb_fuchi2_x(&rgb_tmp1,adrs);
			rgb_tmp1 = *adrs;
		}
		//下端
	}
}

/*==================================================================*/
/*            エフェクト関数内の計算関数                            */
/*==================================================================*/
#if 0			//今回は使用しないので 0
//油絵風ノイズ
static void aburae_noise(u16 no)
{
	u16 *adrs;
	u16 rr,gg,bb;
	u8 p,v;
	u8 i;
	CN d[6];

	d[0].x = rand_tbl_poke[no][0]%eah;	//位置X
	d[0].y = rand_tbl_poke[no][1]%eav;	//位置Y

	d[0].sub_col = ((rand_tbl_poke[no][2])>>3)&0x07;	//長さ
	p = ((rand_tbl_poke[no][2])>>1)&0x03;			//ノイズパターン
	v = ((rand_tbl_poke[no][2]))&0x01;			//"+"(0),"-"(1)の方向性

	for(i=1;i<d[0].sub_col;i++){
		if(v==0){	//"+"
			d[i].x = d[0].x - i;
			d[i].y = d[0].y + i;
		}else{		//"-"
			d[i].x = d[0].x + 1;		//※"1"は、"i"の間違い。
			d[i].y = d[0].y - 1;		//でもこの方が綺麗なので採用
		}
		//画面外オーバーチェック
		if((d[i].x >= eah)||(d[i].y >= eav)) {	//オーバー時、
			d[0].sub_col = i - 1;
			break;
		}

		d[i].sub_col = d[0].sub_col - i;
	}

	for(i=0;i<d[0].sub_col;i++){
		adrs = sa_adrs + (d[i].y+eay)*sah + (d[i].x+eax);
		if((*adrs)&0x8000) continue;

		rr = *adrs & 0x001f;
		gg = ((*adrs)>>5) & 0x001f;
		bb = ((*adrs)>>10) & 0x001f;

		switch(p){
		case 0:
		case 1:
			switch((((rand_tbl_poke[no][2])>>3)&0x07)%3){
			case 0:
				if(rr >= d[i].sub_col){
					rr -= d[i].sub_col;
				}else{
					rr = 0;
				}
				break;
			case 1:
				if(gg >= d[i].sub_col){
					gg -= d[i].sub_col;
				}else{
					gg = 0;
				}
				break;
			case 2:
				if(bb >= d[i].sub_col){
					bb -= d[i].sub_col;
				}else{
					bb = 0;
				}
				break;
			}
			break;
		case 2:
		case 3:
			rr += d[i].sub_col;
			gg += d[i].sub_col;
			bb += d[i].sub_col;
			if(rr > 0x001f) rr = 0x001f;
			if(gg > 0x001f) gg = 0x001f;
			if(bb > 0x001f) bb = 0x001f;
			break;
		}

		*adrs = ((bb)<<10) | ((gg)<<5) | rr;
	}
}
#endif

/*==================================================================*/
/*==================================================================*/
//油絵風ノイズ(ポケモン画像(64*64dot)専用高速版)
static void aburae_noise_poke(u16 no)
{
	u16 *adrs;
	u16 rr,gg,bb;
	u8 p,v;
	u8 i;
	CN d[6];

	d[0].x = rand_tbl_poke[no][0];	//位置X
	d[0].y = rand_tbl_poke[no][1];	//位置Y
	d[0].sub_col = ((rand_tbl_poke[no][2])>>3)&0x07;	//長さ
	p = ((rand_tbl_poke[no][2])>>1)&0x03;			//ノイズパターン
	v = ((rand_tbl_poke[no][2]))&0x01;			//"+"(0),"-"(1)の方向性

	for(i=1;i<d[0].sub_col;i++){
		if(v==0){	//"+"
			d[i].x = d[0].x - i;
			d[i].y = d[0].y + i;
		}else{		//"-"
			d[i].x = d[0].x + 1;		//※"1"は、"i"の間違い。
			d[i].y = d[0].y - 1;		//でもこの方が綺麗なので採用
		}
		//画面外オーバーチェック
		if((d[i].x >= 64)||(d[i].y >= 64)) {	//オーバー時、
			d[0].sub_col = i - 1;
			break;
		}

		d[i].sub_col = d[0].sub_col - i;
	}


	for(i=0;i<d[0].sub_col;i++){
		adrs = sa_adrs + (d[i].y)*PA_H + (d[i].x);
		if((*adrs)&0x8000) continue;

		rr = *adrs & 0x001f;
		gg = ((*adrs)>>5) & 0x001f;
		bb = ((*adrs)>>10) & 0x001f;

		switch(p){
		case 0:
		case 1:
			switch((((rand_tbl_poke[no][2])>>3)&0x07)%3){
			case 0:
				if(rr >= d[i].sub_col){
					rr -= d[i].sub_col;
				}else{
					rr = 0;
				}
				break;
			case 1:
				if(gg >= d[i].sub_col){
					gg -= d[i].sub_col;
				}else{
					gg = 0;
				}
				break;
			case 2:
				if(bb >= d[i].sub_col){
					bb -= d[i].sub_col;
				}else{
					bb = 0;
				}
				break;
			}
			break;
		case 2:
		case 3:
			rr += d[i].sub_col;
			gg += d[i].sub_col;
			bb += d[i].sub_col;
			if(rr > 0x001f) rr = 0x001f;
			if(gg > 0x001f) gg = 0x001f;
			if(bb > 0x001f) bb = 0x001f;
			break;
		}

		*adrs = ((bb)<<10) | ((gg)<<5) | rr;
	}
}

#if 0			//今回は使用しないので 0
/*==================================================================*/
/*==================================================================*/
//カラーを合成（1/3,1/3,1/3)
static u16 rgb_comp3(u16 *rgb1,u16 *rgb2,u16 *rgb3)
{
	u16 r,g,b,r2,g2,b2,r3,g3,b3;

	r = *rgb1 & 0x001f;
	g = ((*rgb1)>>5) & 0x001f;
	b = ((*rgb1)>>10) & 0x001f;

	r2 = *rgb2 & 0x001f;
	g2 = ((*rgb2)>>5) & 0x001f;
	b2 = ((*rgb2)>>10) & 0x001f;

	r3 = *rgb3 & 0x001f;
	g3 = ((*rgb3)>>5) & 0x001f;
	b3 = ((*rgb3)>>10) & 0x001f;

	r = (r3 + r2 + r) / 3;
	g = (g3 + g2 + g) / 3;
	b = (b3 + b2 + b) / 3;

	return ((b<<10) | (g<<5) | r);
}
#endif

/*==================================================================*/
/*==================================================================*/
//RGBをグレイスケールに変換（32色版）
static u16 rgb_gray_scale(u16 *rgb)
{
	u16 r,g,b;

	r = *rgb & 0x001f;
	g = ((*rgb)>>5) & 0x001f;
	b = ((*rgb)>>10) & 0x001f;

	r = (r + g + b)/3;

	return ((r<<10) | (r<<5) | r);
}

#if 0			//今回は使用しないので 0
/*==================================================================*/
/*==================================================================*/
//RGBをグレイスケールに変換（１５色版）
u16 rgb_gray_scale2(u16 *rgb)
{
	u16 r,g,b;

	r = *rgb & 0x001f;
	g = ((*rgb)>>5) & 0x001f;
	b = ((*rgb)>>10) & 0x001f;

	r = ((r + g + b)/3)&0x001e;

	if(r == 0x0002) r = 0x0000;		//ほぼ黒なので黒でまとめる

	return ((r<<10) | (r<<5) | r);
}
#endif

/*==================================================================*/
/*==================================================================*/
//白黒変換(のカラー版。黒をカラーへ）
static u16 color_white(u16 *rgb,u8 pat)
{
	u16 r,g,b;

	r = *rgb & 0x001f;
	g = ((*rgb)>>5) & 0x001f;
	b = ((*rgb)>>10) & 0x001f;

	if((r < 0x0011)&&(g < 0x0011)&&(b < 0x0011)) {	//黒
		return (black2color(pat));
	}

	return RGB_WHITE;
}
/*==================================================================*/
/*==================================================================*/
#define TANCOL	23
#define FUKUCOL	21
//ランダムな色を返す。
//※patに対して常に同期
//※最初に６パターンに大まかに分け
//  次に細かい色替えを行っている。
static u16 black2color(u8 pat)
{
	u8 pp;
	u16 r,g,b;

	r = g = b = 0;
	pp = pat/6%3;

	switch(pat%6){
	case 0:
		r = FUKUCOL - pp; g = FUKUCOL - pp; b = 0x0000;
		break;
	case 1:
		r = 0x0000; g = FUKUCOL - pp; b = FUKUCOL - pp;
		break;
	case 2:
		r = FUKUCOL - pp; g = 0x0000; b = FUKUCOL - pp;
		break;
	case 3:
 		r = 0x0000; g = 0x0000; b = TANCOL - pp;
		break;
	case 4:
		r = TANCOL - pp; g = 0x0000; b = 0x0000;
		break;
	case 5:
		r = 0x0000; g = TANCOL - pp; b = 0x0000;
		break;
	}

	return ((r<<10) | (g<<5) | b);
}

/*==================================================================*/
/*==================================================================*/
//白黒変換
u16 black_white(u16 *rgb)
{
	u16 r,g,b;

	r = *rgb & 0x001f;
	g = ((*rgb)>>5) & 0x001f;
	b = ((*rgb)>>10) & 0x001f;

	if((r < 0x0011)&&(g < 0x0011)&&(b < 0x0011)) {	//黒
		return RGB_BLACK;
	}

	return RGB_WHITE;
}

/*==================================================================*/
/*==================================================================*/
//白黒変換2
static u16 black_fuchi(u16 *rgb,u16 *rgb2)
{
	if(*rgb == 0x0000) return 0x0000;	//黒なので強調の必要がないので

	if((*rgb)&0x8000) return 0x8000;	//抜け色なので無視

	if((*rgb2)&0x8000) return 0x0000;	//自分が色つきで隣が抜けのとき黒強調

	return (*rgb);
}

/*==================================================================*/
/*==================================================================*/
//明暗を反転
static u16 rgb_meian_change(u16 *rgb)
{
	u16 r,g,b;

	r = *rgb & 0x001f;
	g = ((*rgb)>>5) & 0x001f;
	b = ((*rgb)>>10) & 0x001f;

	r = 0x001f - r;
	g = 0x001f - g;
	b = 0x001f - b;

	return ((b<<10) | (g<<5) | r);
}

/*==================================================================*/
/*==================================================================*/
//境目の強調(特殊版）
static u16 rgb_fuchi2_x(u16 *rgb1,u16 *rgb2)
{
	u8 c;
	u16 r,g,b,ss;
	u16 d[2][3],s[1][3];

	if(*rgb1 == *rgb2) return *rgb2;  //境目が無いときは無視

	//RGBへ分割して格納
	d[0][0] = *rgb1 & 0x001f;
	d[0][1] = ((*rgb1)>>5) & 0x001f;
	d[0][2] = ((*rgb1)>>10) & 0x001f;

	d[1][0] = *rgb2 & 0x001f;
	d[1][1] = ((*rgb2)>>5) & 0x001f;
	d[1][2] = ((*rgb2)>>10) & 0x001f;

	//白に近いときはキャンセル
	if((d[0][0]>0x19)&&(d[0][1]>0x19)&&(d[0][2]>0x19)) return *rgb2;
	if((d[1][0]>0x19)&&(d[1][1]>0x19)&&(d[1][2]>0x19)) return *rgb2;

	//RGB毎の、左右ドットとの差分(大きい方)を計算
	for(c=0;c<3;c++){
		if(d[0][c] > d[1][c]){
			s[0][c] = d[0][c] - d[1][c];
		}else{
			s[0][c] = d[1][c] - d[0][c];		
		}
	}

	//RGBの中で一番大きい値を取得
	if(s[0][0] >= s[0][1]){
		if(s[0][0] >= s[0][2]){
			ss = s[0][0];
		}else{
			if(s[0][1] >= s[0][2]){
				ss = s[0][1];
			}else{
				ss = s[0][2];
			}
		}
	}else{
		if(s[0][1] >= s[0][2]){
			ss = s[0][1];
		}else{
			if(s[0][2] >= s[0][0]){
				ss = s[0][2];
			}else{
				ss = s[0][0];
			}
		}
	}

	r = d[1][0] * (31 - (ss)/2) / 31;
	g = d[1][1] * (31 - (ss)/2) / 31;
	b = d[1][2] * (31 - (ss)/2) / 31;

	return ((b<<10) | (g<<5) | r);
}

/*==================================================================*/
/*==================================================================*/
//境目の強調(特殊版）
static u16 rgb_fuchi3(u16 *rgb1,u16 *rgb2,u16 *rgb3)
{
	u16 l,m,rr, ls,rs,ss, r,g,b, n;

	if(((*rgb1)==(*rgb2))&&((*rgb3)==(*rgb2))) return *rgb2;
										//両端と違いがない(まったく同じ)

	r = *rgb2 & 0x001f;
	g = ((*rgb2)>>5) & 0x001f;
	b = ((*rgb2)>>10) & 0x001f;

	l = ((*rgb1 & 0x001f) + (((*rgb1)>>5) & 0x001f) + (((*rgb1)>>10) & 0x001f))/3;
	m = (r + g + b)/3;
	rr =((*rgb3 & 0x001f) + (((*rgb3)>>5) & 0x001f) + (((*rgb3)>>10) & 0x001f))/3;

	if((l==m)&&(rr==m)) return *rgb2;		//両端と違いがない(明るさ的に)

	if(l > m){			//左ドットとの差分
		ls = l - m;
	}else{
		ls = m - l;
	}

	if(rr > m){			//右ドットとの差分
		rs = rr - m;
	}else{
		rs = m - rr;
	}

	if(ls >= rs){	//左が大きい(or同じ)
		ss = ls;
	}else{
		ss = rs;
	}

	n = 31 - ((ss)>>1);
	r = r * n / 31;
	g = g * n / 31;
	b = b * n / 31;

	return ((b<<10) | (g<<5) | r);
}

/*==================================================================*/
/*==================================================================*/
//境目の強調(特殊版） 淡いカラー用に効果２倍
static u16 rgb_fuchi3_v2(u16 *rgb1,u16 *rgb2,u16 *rgb3)
{
	u16 l,m,rr, ls,rs,ss, r,g,b, n;

	if(((*rgb1)==(*rgb2))&&((*rgb3)==(*rgb2))) return *rgb2;
										//両端と違いがない(まったく同じ)

	r = *rgb2 & 0x001f;
	g = ((*rgb2)>>5) & 0x001f;
	b = ((*rgb2)>>10) & 0x001f;

	l = ((*rgb1 & 0x001f) + (((*rgb1)>>5) & 0x001f) + (((*rgb1)>>10) & 0x001f))/3;
	m = (r + g + b)/3;
	rr =((*rgb3 & 0x001f) + (((*rgb3)>>5) & 0x001f) + (((*rgb3)>>10) & 0x001f))/3;

	if((l==m)&&(rr==m)) return *rgb2;		//両端と違いがない(明るさ的に)

	if(l > m){			//左ドットとの差分
		ls = l - m;
	}else{
		ls = m - l;
	}

	if(rr > m){			//右ドットとの差分
		rs = rr - m;
	}else{
		rs = m - rr;
	}

	if(ls >= rs){	//左が大きい(or同じ)
		ss = ls;
	}else{
		ss = rs;
	}

	n = 31 - ss;
	r = r * n / 31;
	g = g * n / 31;
	b = b * n / 31;

	return ((b<<10) | (g<<5) | r);
}

/*==================================================================*/
/*==================================================================*/
