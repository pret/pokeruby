/***********************************************************************
**
**	天候エフェクトタスク制御（かざんばい）
**
***********************************************************************/
#include "wea_com.h"

/*==============================================
==	定数
==============================================*/
/* ワーク定義 */
enum ASH_WORK {
	ASHWK_YPOS,
	ASHWK_COUNT,
	ASHWK_XID,
	ASHWK_YID,
};
/*==============================================
==	グローバル変数
==============================================*/
static const actHeader AshObj;

/*==============================================
==	関数プロトタイプ
==============================================*/
static void set_ash_cell(void);
static void add_ash_obj(void);
static void del_ash_obj(void);

//==============================================
//	初期化
//==============================================
void InitAsh(void)
{
	wp->prog = 0;
	wp->direct_end = 0;

	wp->next_evy = 0;
	wp->evy_wait = CLOUD_CHANGE_WAIT;

	wp->ash_obj_cnt = ASH_OBJ_MAX; // ﾛｰﾌﾟｳｪｲで使っているので残しておく

	if(wp->ash_obj_flg == 0){
		WeatherBlendInit(0x00,0x10);
		*(vu16*)REG_BLDALPHA = BLD_A_BLEND_MODE | BLD_2ND_ALL;
	}
}
//==============================================
//	ダイレクト初期化
//==============================================
void DirectAsh(void)
{
	InitAsh();
	while(wp->direct_end == 0){
		AshProc();
	}
}
//==============================================
//	進行
//==============================================
void AshProc(void)
{
	wp->ash_xline = ActOX & 511;
	while(wp->ash_xline > 239){
		wp->ash_xline -= 240;
	}

	switch(wp->prog){
	case 0:
		set_ash_cell();
		wp->prog++;
		break;

	case 1:
		if(wp->ash_obj_flg == 0){
			add_ash_obj();
		}
		WeatherBlendReq(0x10, 0x00, 1);
		wp->prog++;
		break;

	case 2:
		if(WeatherBlendProg()){
			wp->direct_end = 1;
			wp->prog++;
		}
		break;

	default:
		WeatherBlendProg();
		return;
	}
}
//==============================================
//	終了
//==============================================
u8 QuitAsh(void)
{
	switch(wp->quit_prog){
	case 0:
		WeatherBlendReq(0x00,0x10,1);
		wp->quit_prog++;
		break;

	case 1:
		if(WeatherBlendProg()){
			del_ash_obj();
			wp->quit_prog++;
		}
		break;

	case 2:
		*(vu16*)REG_BLDALPHA = 0;
		wp->quit_prog++;
		return 0;

	default:
		return 0;
	}
	return 1;
}
/***********************************************
** 火山灰ｾﾙｾｯﾄ
***********************************************/
static void set_ash_cell(void)
{
	static const CellData cell = { weather_ash_Character, sizeof(weather_ash_Character), WEATHER_CELLID_ASH };
	CellSet(&cell);
}
/***********************************************************************
** 火山灰アクター登録＆フェードイン
***********************************************************************/
static void add_ash_obj(void)
{
	actWork *act;
	u8   act_no, i;

	if(wp->ash_obj_flg == 0){
		for(i = 0; i < ASH_OBJ_MAX; i++){
			act_no = AddActorBottom(&AshObj, 0, 0 ,WEATHER_ACT_PRI0 );
			if(act_no != ACT_MAX){
				act = &ActWork[act_no];
				act->work[ASHWK_COUNT] = 0;
				act->work[ASHWK_XID] = (i % 5);
				act->work[ASHWK_YID] = (i / 5);
				act->work[ASHWK_YPOS] = 32 + (act->work[ASHWK_YID] * 64);
				wp->ash_actor[i] = act;
			}else{
				wp->ash_actor[i] = NULL;
			}
		}
		wp->ash_obj_flg = 1;
	}
}
/***********************************************************************
** 火山灰アクター削除
***********************************************************************/
static void del_ash_obj(void)
{
	if(wp->ash_obj_flg){
		u16 i;
		for(i = 0; i < ASH_OBJ_MAX; i++){
			if(wp->ash_actor[i] != NULL){
				DelActor(wp->ash_actor[i]);
			}
		}
		CellDel(WEATHER_CELLID_ASH);
		wp->ash_obj_flg = 0;
	}
}
/***********************************************************************
** 火山灰アクター動作関数
***********************************************************************/
static void AshActMove(actWork *act)
{
	if(++(act->work[ASHWK_COUNT]) > 5){
		act->work[ASHWK_COUNT] = 0;
		act->work[ASHWK_YPOS]++;
	}
	act->y = ActOY + act->work[ASHWK_YPOS];

	act->x = (wp->ash_xline+32) + (act->work[ASHWK_XID] * 64);
	if(act->x > 271){
		act->x = (wp->ash_xline+480)-((4-act->work[ASHWK_XID])*64);
		act->x &= 511;
	}

#if 0
	act->work[1] = (act->x + act->cx + act->dx + ActOX) & 0x01ff;
	if(act->work[1] > 256 && act->work[1] < 289){
		act->x += 224;
	}else if(act->work[1] > 447 && act->work[1] < 480){
		act->x -= 224;
	}
#endif
}
/*======================================================================
==	火山灰アクターデータ
======================================================================*/
static const ActOamData AshObjOam =
{
	0,										// u32 VPos:8
	0,										// u32 AffineMode:2
	1,										// u32 ObjMode:2
	0,										// u32 Mosaic:1
	0,										// u32 ColorMode:1
	0,										// u32 Shape:2

	0,										// u32 HPos:9
	0,										// u32 AffineParamNo:5
	3,										// u32 Size:2

	0,										// u32 CharNo:10
	1,										// u32 Priority:2
	15,										// u32 Pltt:3
	0,										// AffineWork
};
/* アニメテーブル */
static const actAnm AshObjAnm[]=
{
	{0,60,0,0},
	{64,60,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm * const AshObjAnmTbl[] =
{
	AshObjAnm,
};
/* --- アクトヘッダ --- */
static const actHeader AshObj =
{
	WEATHER_CELLID_ASH,		// cell id
	WEATHER_PALID_COMMON,		// pal id
	&AshObjOam,			// oam
	AshObjAnmTbl,		// anm table
	ACT_NTRANS,			// trans table
	DummyActAffTbl,		// affine table
	AshActMove,			// move
};














