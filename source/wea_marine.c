/***********************************************************************
**
**	天候エフェクトタスク制御（海底）
**
***********************************************************************/
#include "wea_com.h"

//---------------------------------------
// ﾌﾟﾛﾄﾀｲﾌﾟ
//---------------------------------------
static void del_awa_actor(void);

static const u8 awa_Character[8*4*2];

#define AWA_INTERVAL_MAX  (8)
#define AWA_POS_MAX       (13)

static const u8 awa_add_interval[AWA_INTERVAL_MAX] = {
	40, 90, 60, 90, 2, 60, 40, 30,
};

/*=============================================
==	初期化
=============================================*/
void InitMarine(void)
{
	static const CellData cell = { weather_bubble_Character, sizeof(weather_bubble_Character), WEATHER_CELLID_AWA };

	InitMist();

	if(wp->awa_actor_flg == 0){
		CellSet(&cell);

		wp->awa_interval_cnt = 0;
		wp->awa_add_cnt = awa_add_interval[0];
		wp->awa_pos_cnt = 0;
		wp->awa_act_cnt = 0;
	}
}
/*=============================================
==	ダイレクト初期化
=============================================*/
void DirectMarine(void)
{
	InitMarine();

	while(wp->direct_end == 0){	
		MarineProc();
	}
}
/*=============================================
==	進行
=============================================*/
static void add_awa_actor(u16 pos);

void MarineProc(void)
{
	MistProc();

	if(++(wp->awa_add_cnt) > awa_add_interval[wp->awa_interval_cnt]){
		wp->awa_add_cnt = 0;
		if(++(wp->awa_interval_cnt) >= AWA_INTERVAL_MAX){
			wp->awa_interval_cnt = 0;
		}
		add_awa_actor(wp->awa_pos_cnt);
		if(++(wp->awa_pos_cnt) >= AWA_POS_MAX){
			wp->awa_pos_cnt = 0;
		}
	}
}
/*=============================================
==	終了
=============================================*/
u8 QuitMarine(void)
{
	if(!QuitMist()){
		del_awa_actor();
		return 0;
	}

	return 1;
}

/*=============================================
==	泡アクター１つ追加
=============================================*/
static const u16 awa_pos_tbl[AWA_POS_MAX][2] = {
	{     120, 160 }, //
	{ 256+120, 160 },
	{      40, 140 }, //
	{ 256+ 40, 140 },
	{     180, 130 }, //
	{ 256+180, 130 },
	{      60, 160 }, //
	{ 256+180, 160 },
	{     220, 180 }, //
	{ 256+220, 180 },
	{      10,  90 }, //
	{ 256+ 10,  90 },
	{     256, 160 }, //
};
static const actHeader AwaHeader;
static void add_awa_actor(u16 pos)
{
	s16 no, x, y;

	x = awa_pos_tbl[pos][0];
	y = awa_pos_tbl[pos][1] - ActOY;

	no = AddActorBottom(&AwaHeader, x, y, 0);
	if(no != ACT_MAX){
		ActWork[no].oamData.Priority = 1;
		ActWork[no].scr = 1;
		ActWork[no].work[0] = 0;
		ActWork[no].work[1] = 0;
		ActWork[no].work[2] = 0;

		wp->awa_act_cnt++;
	}
}
static void del_awa_actor(void)
{
	u16 i;
	for(i = 0; i < ACT_MAX; i++){
		if(ActWork[i].actHead == &AwaHeader){
			DelActor(&ActWork[i]);
		}
	}
	CellDel(WEATHER_CELLID_AWA);
}


#define AWA_UP_SPEED     (3)
#define AWA_UP_SYNC      (120)
#define AWA_MOVE_WIDTH  (5)

static void awa_actmove(actWork *act)
{
	act->work[0]++;
	if(++(act->work[0]) > 8){
		act->work[0] = 0;
		switch(act->work[1]){
		case 0:
			if(++(act->dx) >= AWA_MOVE_WIDTH){
				act->work[1] = 1;
			}
			break;

		default:
		case 1:
			if(--(act->dx) <= 0){
				act->work[1] = 0;
			}
			break;

		}
	}

	act->y -= AWA_UP_SPEED;
	if(++(act->work[2]) >= AWA_UP_SYNC){
		DelActor(act);
//		wp->awa_act_cnt--;
	}
}

extern const ActOamData WazaOamDataNormal[];

static const actAnm awa_anm[]={
	{OBJ16_8x8 * 0, 16,0,0},
	{OBJ16_8x8 * 1, 16,0,0},
	{ACT_ANMEND,0,0,0}
};

static const actAnm *const awa_anmtbl[]={
	awa_anm,
};

static const actHeader AwaHeader = {
	WEATHER_CELLID_AWA,
	WEATHER_PALID_COMMON,
//	&WazaOamDataBldNormal[6],
	&WazaOamDataNormal[0],
	awa_anmtbl,
	0,
	DummyActAffTbl,
	awa_actmove,
};

