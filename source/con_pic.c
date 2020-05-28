/********************************************************************/
/*                      con_pic.c                                   */
/*                    コンテストの絵表示                            */
/*                       by tomo                                    */
/********************************************************************/

/********************************************************************/
/*                      INCLUDE FILE                                */
/********************************************************************/
#include "common.h"
#include "intr.h"
#include "calctool.h"
#include "menu.h"
#include "palanm.h"
#include "actanm.h"
#include "objdata.h"
#include "decord.h"
#include "poketool.h"
#include "message.h"
#include "bss.h"
#include "client_t.h"
#include "pic_eff.h"
#include "con_pic.h"
#include "con_tool.h"
#include "laster.h"

#include "../mapdata/frame.acl"

#include "../mapdata/frame0_sch_RL.c"
#include "../mapdata/frame1_sch_RL.c"
#include "../mapdata/frame2_sch_RL.c"
#include "../mapdata/frame3_sch_RL.c"
#include "../mapdata/frame4_sch_RL.c"
#include "../mapdata/frame_c_sch_RL.c"

#include "../mapdata/frame0_asc_RL.c"
#include "../mapdata/frame1_asc_RL.c"
#include "../mapdata/frame2_asc_RL.c"
#include "../mapdata/frame3_asc_RL.c"
#include "../mapdata/frame4_asc_RL.c"
#include "../mapdata/frame_c_asc_RL.c"

/*==================================================================*/
/*　　　　　　　　　　　コンテスト用                                */
/*==================================================================*/
const u8 * const con_name_tbl[CON_MES_NO_MAX]={
	con_mes_kakkoyosa,
	con_mes_utsukushisa,
	con_mes_kawaisa,
	con_mes_kashikosa,
	con_mes_takumashisa
};

/*==================================================================*/
/*　　　　　　　　　　　美術館用  　　                              */
/*==================================================================*/
//美術館用メッセージ
//[x][]=１５種類のメッセージなので15(MUS_MES_NO_MAX)
//[][x]="ポケモン名"の前後で文章を２つに分割管理しているので2

const u8 * const mus_mes_str[MUS_MES_NO_MAX][2]={
	{mus_mes_str_01_01,mus_mes_str_01_02},
	{mus_mes_str_02_01,mus_mes_str_02_02},
	{mus_mes_str_03_01,mus_mes_str_03_02},
	{mus_mes_str_04_01,mus_mes_str_04_02},
	{mus_mes_str_05_01,mus_mes_str_05_02},
	{mus_mes_str_06_01,mus_mes_str_06_02},
	{mus_mes_str_07_01,mus_mes_str_07_02},
	{mus_mes_str_08_01,mus_mes_str_08_02},
	{mus_mes_str_09_01,mus_mes_str_09_02},
	{mus_mes_str_10_01,mus_mes_str_11_02},
	{mus_mes_str_11_01,mus_mes_str_11_02},
	{mus_mes_str_12_01,mus_mes_str_12_02},
	{mus_mes_str_13_01,mus_mes_str_13_02},
	{mus_mes_str_14_01,mus_mes_str_14_02},
	{mus_mes_str_15_01,mus_mes_str_15_02},
};

/********************************************************************/
/*                      DEFINE                                      */
/********************************************************************/
enum{
	CPM_FADE_IN,
	CPM_KEY_CHECK,
	CPM_FADE_OUT
};

/********************************************************************/
/*                      EXTREN                                      */
/********************************************************************/
extern void InitKeyRead(void);
extern void KeyRead(void);

extern void poke_bit_color_down(BE_ST *est);
extern void poke_bit_effect(BE_ST *est);
extern void poke_bit_to_obj(BE_ST *est);

/********************************************************************/
/*                      GLOBAL                                      */
/********************************************************************/
void contest_picture_init(void);
void contest_picture_main(void);

/********************************************************************/
/*                      STATIC                                      */
/********************************************************************/
static void cp_main_sub(void);
static void register_init(void);
static void contest_picture_v_intr(void);
static void pic_set(u8 port,u8 type);
static void poke_bit_decord(u16 p_no,u8 ou);
static void bit_get_obj16(u8 *bin,u16 *pa,u16 *bout);

static void bg_set(u8 port_no,u8 cp_type);
static void obj_set(u8 port_no);
static u8 port_num_to_eff_num(u8 port);
static void work_area_set(void);
static void eff_obj(u8 eff_no);
static void mes_win_clear(u8 cp_type);
static void mes_print(u8 po,u8 type);
static void cp_init_proc(void);
static void mosaic_v_intr(void);
static void mosaic_v_intr_init(u8 no);
/********************************************************************/
/*                      WORK                                        */
/********************************************************************/
u16 *bg_p;		//データの格納してあるアドレス
u16 *pal_p;		//パレット格納場所アドレス

BE_ST eff_st;		//エフェクト関連情報受け渡し用ワーク
PORTRAIT_DATA *pd;	//ポートレイトデータ参照用

u8 con_mes_buf[CON_MES_MAX];	//メッセージ表示用バッファー
u8 con_mes_buf2[MONS_NAME_SIZE+EOM_SIZE];	//メッセージ表示用バッファー

static u8 cp_main_flag;			//メインルーチン動作フラグ

static u16 mos_value;			//モザイク値保存用
static u16 mos_count;			//モザイク値表示カウント用
static u8 mos_flag;				//モザイク値表示制御用0:使用せず,1:使用

/********************************************************************/
/*                      OAM&etc                                     */
/********************************************************************/
static const ActOamData Effect256Oam =
{
	0,		//Vﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾓｰﾄﾞ設定(OFF)
	0,		//OBJﾓｰﾄﾞ設定(NORMAL)
	1,		//ﾓｻﾞｲｸ設定(ON)
	1,		//ｶﾗｰﾓｰﾄﾞ設定(256色)
	0,		//OBJ形状設定(正方形)

	0,		//Hﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾊﾟﾗﾒｰﾀﾅﾝﾊﾞｰ設定 & H,Vﾌﾘｯﾌﾟ
	3,		//OBJサイズ設定(64x64)

	0,		//ｷｬﾗｸﾀｰﾅﾝﾊﾞｰ
	0,		//表示ﾌﾟﾗｲｵﾘﾃｨｰ設定
	0,		//ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ
	0,		//AffineParam
};


void PortraitPictureSet( int number )
{
	PORTRAIT_DATA * pic_data = (PORTRAIT_DATA *)&(UserWork[TEMP_PORTRAIT_ADRS]);
	u8 * pic_number = (u8 *)&(UserWork[TEMP_PORTRAIT_PLACE]);
	u8 * pic_flag = (u8 *)&(UserWork[TEMP_PORTRAIT_MSGFLG]);

	*pic_data = Fld.PortraitData[number - 1];
	*pic_number = number -1;					//1originから0riginへ補正
	*pic_flag = 0;								//0:通常表示
}

/********************************************************************/
/*                      ROUTIN                                      */
/********************************************************************/
//コンテスト用肖像画表示（初期化部分）
//引数：
//UserWork[TEMP_PORTRAIT_ADRS] :該当する"PORTRAIT_DATA"をコピーしたエリア
//UserWork[TEMP_PORTRAIT_MSGFLG] :0で通常表示,1で説明なし表示(プレビュー版)
//UserWork[TEMP_PORTRAIT_PLACE] :0-12の”絵の場所”番号
//※プレビュー版のときは、美術館へセットするデータと
//まったく同じものをセットする必要があります。(絵の場所,タイトル種類等)
void contest_picture_init(void)
{
	cp_init_proc();
}

static const u16 black_color[] = {0x0000};

static void cp_init_proc(void)
{
	switch(sys.InitSeqWork){
	case 0:
		LasterInit();									// HDMA初期化
		SetVBlankFunc(NULL);

		pd = (PORTRAIT_DATA *)(&(UserWork[TEMP_PORTRAIT_ADRS]));

		mosaic_v_intr_init(1);
		register_init();
		sys.InitSeqWork++;
		break;
	case 1:
		PaletteAnimeInit();
		DIV_DMACLEAR(3, 0, VRAM,(VRAM_END - VRAM), 32);		/* 全VRAM初期化*/

		InitActor();
		sys.InitSeqWork++;
		break;
	case 2:
		pp_srand( sys.main_timer );

		InitKeyRead();

		mes_win_clear(UserWork[TEMP_PORTRAIT_MSGFLG]);
		sys.InitSeqWork++;
		break;
	case 3:
		pic_set(UserWork[TEMP_PORTRAIT_PLACE],UserWork[TEMP_PORTRAIT_MSGFLG]);
		sys.InitSeqWork++;
		break;
	case 4:
		mes_print(UserWork[TEMP_PORTRAIT_PLACE],UserWork[TEMP_PORTRAIT_MSGFLG]);
		PaletteWorkSet(black_color, 0, 2);
		DIV_DMACLEAR(3, 0, PLTT,(PLTT_END - PLTT), 32);		/* 全PALETTE初期化*/
													/* 計算にpalを使用したので */

		LightFadeReq(B_to_N);

		SetVBlankFunc(contest_picture_v_intr);

		cp_main_flag = CPM_FADE_IN;

		*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード0
							  | DISP_OBJ_ON					// OBJ有効
							  | DISP_BG0_ON					// BG0有効
							  | DISP_BG1_ON					// BG1有効
							  | DISP_OBJ_CHAR_1D_MAP;		//1D OBJ map

		MainProcChange(contest_picture_main);
		break;
	}
}

/*==================================================================*/
/*==================================================================*/
//コンテスト用肖像画表示（本体部分）
void contest_picture_main(void)
{
	cp_main_sub();

	PaletteAnime();
}

/*==================================================================*/
/*==================================================================*/
//コンテスト用肖像画表示（終了部分）
void contest_picture_end(void)
{
	MainProcChange(sys.pReturnProc);
}

/********************************************************************/
/*                      SUB ROUTIN                                  */
/********************************************************************/
//メインルーチン内部動作
static void cp_main_sub(void)
{
	switch(cp_main_flag){
	case CPM_FADE_IN:
		if( FadeData.fade_sw == 0 ){
			cp_main_flag++;
		}

		if(mos_flag){
			if(mos_count>0) {
				mos_count--;
			}
		}
		break;
	case CPM_KEY_CHECK:
		if (( sys.Trg & A_BUTTON )||( sys.Trg & B_BUTTON)){
			cp_main_flag++;
			PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
		}

		if(mos_flag){
			mos_count=0;
		}
		break;
	case CPM_FADE_OUT:
		if( FadeData.fade_sw == 0 ){
			MainProcChange(contest_picture_end);
		}

		if(mos_flag){
			if(mos_count<(MOS_MAX*MOS_BAI)) {
				mos_count++;
			}
		}
		break;
	}
}


/*==================================================================*/
/*==================================================================*/
//文字表示系初期化
static void mes_win_clear(u8 cp_type)
{
	NMenuScreenInit(CON_PIC_TYPE);
	PrintScreenInit(CON_PIC_TYPE);			// メッセージウィンドウ制御初期化
}

/*==================================================================*/
/*==================================================================*/
//文字表示
static void mes_print(u8 port_no,u8 cp_type)
{
	u8 i;
	u8 con_type;

	if(cp_type==1) { //文字表示なしモードの時は無視
		return;		
	}

	for(i=0;i<CON_MES_MAX;i++) con_mes_buf[i]=EOM_;	//メッセージワーククリア
	for(i=0;i<(MONS_NAME_SIZE+EOM_SIZE);i++) con_mes_buf2[i]=EOM_;	//メッセージワーククリア

	con_type = pd->pict_type;
	if(port_no < 8){		//コンテスト
		PM_strcpy(con_mes_buf,con_name_tbl[con_type]);	//"コンテスト名"

		PM_strcat(con_mes_buf,con_reg_mes1);			//コンテスト　ゆうしょう
		PM_strcat(con_mes_buf,pd->oyaname);				//"ブリーダー名"
		PM_strcat(con_mes_buf,con_reg_mes2);			//の

		NickNameCopy(con_mes_buf2,pd->nickname);				//"ポケモン名"
		PM_strcat(con_mes_buf,con_mes_buf2);				//

		NMenuMsgWrite(con_mes_buf,CON_MES_X,CON_MES_Y);
	}else{					//美術館
		PM_strcpy(con_mes_buf,mus_mes_str[con_type][0]);	//前半文

		NickNameCopy(con_mes_buf2,pd->nickname);				//"ポケモン名"
		PM_strcat(con_mes_buf,con_mes_buf2);				//

		PM_strcat(con_mes_buf,mus_mes_str[con_type][1]);	//後半文

		NMenuMsgWrite(con_mes_buf,MUS_MES_X,MUS_MES_Y);
	}
}

/*==================================================================*/
/*==================================================================*/
//レジスター初期化
static void register_init(void)
{
	*(vu16 *)REG_DISPCNT = 	0;

    *(vu16 *)REG_IE |= V_BLANK_INTR_FLAG;

	*(vu16 *)REG_BG0CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_2
	| BG_SB_NO << BG_SCREEN_BASE_SHIFT | BG_CB_NO << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 | BG_MOS_ON;

	*(vu16 *)REG_BG1CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_1
	| MES_SB_NO << BG_SCREEN_BASE_SHIFT | MES_CB_NO << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 | BG_MOS_ON;

   	*(vu16 *)REG_BLDCNT   = 0;	//半透明設定
   	*(vu16 *)REG_BLDALPHA = 0;
   	*(vu16 *)REG_BLDY	  = 0;
}

/*==================================================================*/
/*==================================================================*/
//Vブランクに置いとくモザイク用設定のイニシャル
static void mosaic_v_intr_init(u8 no)
{
	if(no==0){		//使用しない
		mos_flag=0;
		mos_value=0;
		mos_count=0;
	}else{			//使用する
		mos_flag=1;
		mos_value = MOS_MAX;
		mos_count = mos_value*MOS_BAI;
	}
}

/*==================================================================*/
/*==================================================================*/
//Vブランクに置いとくモザイク用設定
static void mosaic_v_intr(void)
{
	if(mos_flag==0) {
		*(vu16 *)REG_MOSAIC = 0;
		return;
	}

//モザイク用設定(TextBGは毎回セットしないと効果無いので
	*(vu16 *)REG_BG1CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_1
	| MES_SB_NO << BG_SCREEN_BASE_SHIFT | MES_CB_NO << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 | BG_MOS_ON;

	mos_value = mos_count / MOS_BAI;
	*(vu16 *)REG_MOSAIC = (mos_value<<12) | (mos_value<<8) | (mos_value<<4) | mos_value;
}

/*==================================================================*/
/*==================================================================*/
//Vブランク用ルーチン
static void contest_picture_v_intr(void)
{
	mosaic_v_intr();

	actOAMtrans();
	actDMAtrans();

	PaletteFadeTrans();
}

/*==================================================================*/
/*			圧縮キャラを解凍しドットへ                              */
/*==================================================================*/
//ポケモンOBJキャラデータをデコード
//pal_p&bg_pが指し示すエリアへセット
//p_no:ポケモン番号
//ou:0:表、1:裏
static void poke_bit_decord(u16 p_no,u8 ou)				//キャラのデコード
{
	//カラーパレット取得
	DecordVram((void *)(PokePalGetPara(p_no,pd->idno,pd->personal_rnd)), (void *)pal_p);

	//※0x2000000はデコード用のテンポラリですが、現在のルーチンでは実際には使われません(dummy)。
	//昔のルーチンとの互換(デコード部が元に戻ったときのこと)を考えて念のため置いています。
	if(ou==0){		//表
		DecordPokeCellMakeBuchi(&PM2FObjDataCell[p_no],pm2fpara[p_no].size,
			pm2fpara[p_no].patcnt,(void *)0x2000000,
			(void *)DecordAdrs[BSS_CLIENT_ENEMY],p_no,pd->personal_rnd);

		bit_get_obj16((void *)DecordAdrs[BSS_CLIENT_ENEMY],pal_p,bg_p);
	}else{			//裏
		DecordPokeCellMakeBuchi(&PM2BObjDataCell[p_no],pm2bpara[p_no].size,
			pm2bpara[p_no].patcnt,(void *)0x2000000,
			(void *)DecordAdrs[BSS_CLIENT_MINE],p_no,pd->personal_rnd);

		bit_get_obj16((void *)DecordAdrs[BSS_CLIENT_MINE],pal_p,bg_p);
	}
}

/*==================================================================*/
/*	フルカラーdotへキャラからの変換                                 */
/*==================================================================*/
//16色ポケモン版(8*8char(64*64dot))
//bin:データ元アドレス
//pa:パレットアドレス
//bout:出力先
static void bit_get_obj16(u8 *bin,u16 *pa,u16 *bout)
{
	u16 p,q,r,s;
	u8 z;

	//元キャラとなるものを展開（OBJ->Bitmap)
	for(s=0;s<8;s++){					//Yblock
		for(r=0;r<8;r++){				//Xblock
			for(q=0;q<8;q++){				//Ychar
				for(p=0;p<8;p++){			//Xchar
					z = *(u8 *)(bin + ((((s<<3)+r)<<5)+(q<<2) + (p>>1)));

					if(p%2){	//奇数
						z = (z & 0xf0)>>4;
					}else{		//偶数
						z = z & 0x0f;
					}

					if(z==0){		//抜け色のとき
						*(u16 *)(bout + (((s<<3)+q)<<6) +((r<<3)+p)) = NUKE_BLACK;	//抜け色へ
					}else{
						*(u16 *)(bout + (((s<<3)+q)<<6) +((r<<3)+p)) = *(pa+z);
					}
				}
			}
		}
	}
}

/*==================================================================*/
/*	BG set                                                          */
/*==================================================================*/

static void bg_set(u8 port_no,u8 cp_type)
{
	u8 x,y;

	PaletteWorkSet(frame_Palette,PA_BG0,16*8*2);
	if(cp_type==1) {		//文字表示なしモードの時は別背景
		switch((pd->pict_type/3)){
		case 0:
			RLUnCompVram((void*)frame0_sch_RL,(void*)PIC_EFF_CHAR_BASE_ADDR);
			RLUnCompWram((void*)frame0_asc_RL,bg_p);
			break;
		case 1:
			RLUnCompVram((void*)frame1_sch_RL,(void*)PIC_EFF_CHAR_BASE_ADDR);
			RLUnCompWram((void*)frame1_asc_RL,bg_p);
			break;
		case 2:
			RLUnCompVram((void*)frame2_sch_RL,(void*)PIC_EFF_CHAR_BASE_ADDR);
			RLUnCompWram((void*)frame2_asc_RL,bg_p);
			break;
		case 3:
			RLUnCompVram((void*)frame3_sch_RL,(void*)PIC_EFF_CHAR_BASE_ADDR);
			RLUnCompWram((void*)frame3_asc_RL,bg_p);
			break;
		case 4:
			RLUnCompVram((void*)frame4_sch_RL,(void*)PIC_EFF_CHAR_BASE_ADDR);
			RLUnCompWram((void*)frame4_asc_RL,bg_p);
			break;
		}

		//背景を白へ
		for(y=0;y<20;y++){
			for(x=0;x<32;x++){
				*(u16 *)(PIC_EFF_SCREEN_BASE_ADDR + (y*32+x)*2 ) = DUMMY_WHITE_CHAR;		//白
			}
		}

		//枠付きで転送(起点のｰ1の位置からdummy_pic_x or y分＋2(枠分))
		for(y=0;y<DUMMY_PIC_H+2;y++){
			for(x=0;x<DUMMY_PIC_W+2;x++){
				*(u16 *)(PIC_EFF_SCREEN_BASE_ADDR + ((DUMMY_PIC_Y-1+y)*32+(DUMMY_PIC_X-1+x))*2 )
					= *(bg_p + (DUMMY_PIC_Y-1+y)*32+(DUMMY_PIC_X-1+x));
			}
		}

		//一番上の枠を強制的に同じものに(通常表示される紋章を消すため)
		for(x=0;x<DUMMY_PIC_W;x++){
			*(u16 *)(PIC_EFF_SCREEN_BASE_ADDR + ((DUMMY_PIC_Y-1)*32+(DUMMY_PIC_X+x))*2 )
					= *(bg_p + (DUMMY_PIC_Y-1)*32+(DUMMY_PIC_X));
		}

		return;
	}

	if(port_no < 8){		//コンテスト背景表示
		RLUnCompVram((void*)frame_c_sch_RL,(void*)PIC_EFF_CHAR_BASE_ADDR);
		RLUnCompVram((void*)frame_c_asc_RL,(void*)PIC_EFF_SCREEN_BASE_ADDR);
	}else{
		switch((pd->pict_type/3)){
		case 0:		//カッコよさ
			RLUnCompVram((void*)frame0_sch_RL,(void*)PIC_EFF_CHAR_BASE_ADDR);
			RLUnCompVram((void*)frame0_asc_RL,(void*)PIC_EFF_SCREEN_BASE_ADDR);
			break;
		case 1:		//うつくしさ
			RLUnCompVram((void*)frame1_sch_RL,(void*)PIC_EFF_CHAR_BASE_ADDR);
			RLUnCompVram((void*)frame1_asc_RL,(void*)PIC_EFF_SCREEN_BASE_ADDR);
			break;
		case 2:		//かわいさ
			RLUnCompVram((void*)frame2_sch_RL,(void*)PIC_EFF_CHAR_BASE_ADDR);
			RLUnCompVram((void*)frame2_asc_RL,(void*)PIC_EFF_SCREEN_BASE_ADDR);
			break;
		case 3:		//かしこさ
			RLUnCompVram((void*)frame3_sch_RL,(void*)PIC_EFF_CHAR_BASE_ADDR);
			RLUnCompVram((void*)frame3_asc_RL,(void*)PIC_EFF_SCREEN_BASE_ADDR);
			break;
		case 4:		//たくましさ
			RLUnCompVram((void*)frame4_sch_RL,(void*)PIC_EFF_CHAR_BASE_ADDR);
			RLUnCompVram((void*)frame4_asc_RL,(void*)PIC_EFF_SCREEN_BASE_ADDR);
			break;
		}
	}
}

/*==================================================================*/
/*	OBJ set                                                         */
/*==================================================================*/
static void obj_set(u8 port_no)
{
	sys.OAMbuf[0] = Effect256Oam;
	sys.OAMbuf[0].CharNo = 0;
	if(port_no < 8){		//コンテスト
		sys.OAMbuf[0].HPos = POKE_X1;
		sys.OAMbuf[0].VPos = POKE_Y1;
	}else{
		sys.OAMbuf[0].HPos = POKE_X2;
		sys.OAMbuf[0].VPos = POKE_Y2;
	}
}

/*==================================================================*/
/*	 配置場所番号からエフェクト番号に変換                           */
/*==================================================================*/
static u8 port_num_to_eff_num(u8 port_no)
{
	u8 eff_no;

	if(port_no < 8){
		eff_no = pd->pict_type;
	}else{
		eff_no = (pd->pict_type) / 3;
	}
	switch(eff_no){			//内部番号へ変換
	case 0:			//かっこよさ->輪郭
		eff_no = EFF_RINKAKU;
		break;
	case 1:			//うつくしさ->淡いカラー
		eff_no = EFF_AWAI_POKE;
		break;
	case 2:			//かわいさ->パステル
		eff_no = EFF_PASUTERU_POKE;
		break;
	case 3:			//かしこさ->墨絵
		eff_no = EFF_SUMIE;
		break;
	case 4:			//たくましさ->グレースケール
		eff_no = EFF_GRAY32;
		break;
	}

	return eff_no;
}

/*==================================================================*/
/*	 計算用共通ワークエリアセット                                   */
/*==================================================================*/
static void work_area_set(void)
{
	pal_p	= (u16 *)(&(UserWork[TEMP_PAL_AREA]));
	bg_p	= (u16 *)(&(UserWork[TEMP_BG_AREA]));
}

/*==================================================================*/
/*	 ビットデータ->エフェクト->キャラ&パレット変換                  */
/*==================================================================*/
static void eff_obj(u8 eff_no)
{
	eff_st.bg_adrs = bg_p;
	eff_st.pal_adrs= pal_p;
	eff_st.pal_p=0;
	eff_st.pat= pd->personal_rnd % 256;		//ｴﾌｪｸﾄ側は256ﾊﾟﾀｰﾝまでの対応なので

	//ポケモン画像解凍専用設定(計算エリアと画像が同じ大きさ)
	eff_st.eax = 0;				
	eff_st.eay = 0;
	eff_st.eah = PA_H;
	eff_st.eav = PA_V;
	eff_st.sah = PA_H;
	eff_st.sav = PA_V;

	switch(eff_no){
	case EFF_SUMIE:
	case EFF_GRAY32:
		eff_st.mode = COL_MODE_32G;		//３２色グレーモードOBJ
		break;
	case EFF_RINKAKU:
	case EFF_AWAI_POKE:
	case EFF_PASUTERU_POKE:
	default:
		eff_st.mode = COL_MODE_223;		//カラーパレット２２３色使用
		break;
	}
	eff_st.out_mode = OUT_COL_256OBJ;		//256色モードOBJ
	eff_st.eff_no = eff_no;
	eff_st.chr_adrs = (u8 *)(OBJ_MODE0_VRAM+0x20*0);	//16色0キャラ目;

	poke_bit_effect(&eff_st);				//エフェクトし、
	poke_bit_color_down(&eff_st);			//256色へ落として
	poke_bit_to_obj(&eff_st);				//OBJとして表示

	PaletteWorkSet(pal_p,PA_OBJ0,256*2);	//ワークからパレットRAMへ転送(256色)
}

/*==================================================================*/
/*==================================================================*/
//肖像画セット
static void pic_set(u8 port_no,u8 cp_type)
{
	u8 eff_no;

	//pal_p&bg_pのエリア設定
	work_area_set();

	//ポケキャラのデコード pal_p&bg_pへビットデータ展開
	poke_bit_decord(pd->monsno,0);

	eff_no = port_num_to_eff_num(port_no);

	//pal_p&bg_pのビットデータをエフェクトしてＯＢＪキャラ＆パレットへ変換
	eff_obj(eff_no);

	obj_set(port_no);
	bg_set(port_no,cp_type);
}

/*==================================================================*/
/*==================================================================*/

/********************************************************************/
