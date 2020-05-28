//=========================================================================
//	
//	電気系 技エフェクト
//
//=========================================================================
#include "common.h"
#include "actor.h"
#include "actanm.h"
#include "madefine.h"
#include "wazatool.h"
#include "waza_dat.h"
#include "waza_eff.h"
#include "server.h"
#include "calctool.h"

#include "task.h"
#include "bss.h"
#include "palanm.h"

#include "mus_tool.h"



//=========================================================================
//
//		「かみなり」
//														by mori
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void SeqWazaKaminariInit( actWork * Xreg );
static void SeqWazaKaminari( actWork * Xreg );

static void SeqWazaPunchInit( actWork * Xreg );
static void SeqWazaPunch( actWork * Xreg );


//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------

static const s8 yure[] = {
		-1,-1, 0, 1,
		 1, 0, 0,-1,
		-1, 1, 1, 0,
		 0,-1, 0, 1,
};
static const s8 yure2[] = {
		-1, 0, 1, 0, 
		-1, 1, 0,-1,
		 0, 1, 0,-1,
		 0, 1, 0, 1,
};

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
static const actAnm KaminariAnm[]={		//かみなり２
		{OBJ16_32x32*0,5,0,0},			
		{OBJ16_32x32*1,5,0,0},
		{OBJ16_32x32*2,8,0,0},
		{OBJ16_32x32*3,5,0,0},
		{OBJ16_32x32*4,5,0,0},
//		{OBJ16_32x32*5,5,0,0},
		{ACT_ANMEND,0,0,0}
};

static const actAnm *const KaminariAnmTbl[]={
		KaminariAnm,
};

const	actHeader ActKaminariHeader={
	WAZACHR_ID_THUNDER2,
	WAZACHR_ID_THUNDER2,
	&WazaOamDataNormal[2],
	KaminariAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaKaminariInit,

};



static const actAffAnm PunchAffanm[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x100, 0x100, 0, ACT_AFSET },		// 0
	{ 0, 0, 0,  20},
	{ 0, 0, -16, 60 },		// 回転
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};

static const	actAffAnm * const PunchAfftbl[] = {
	PunchAffanm,
};
const	actHeader ActPunchHeader={
	WAZACHR_ID_KAKUTOU,
	WAZACHR_ID_KAKUTOU,
	&WazaOamDataAffine[2],
	DummyActAnmTbl,
	0,
	PunchAfftbl,
	SeqWazaPunchInit,
};



//-------------------------------------------------------------
//		タスクシーケンス
//-------------------------------------------------------------
//----------------------------------------------------------
//	ﾎﾟｹﾓﾝの揺れー
//----------------------------------------------------------
void TaskPokeYure(u8 taskno)
{
	u8 Attack;
	s8 w;

	if(TaskTable[taskno].work[0]==0){
		TaskTable[taskno].work[1] = WazaEffWork[0];	//何ｺﾏ実行するか
		TaskTable[taskno].work[2] = WazaEffWork[1]; //どれだけ揺れるか
		TaskTable[taskno].work[3] = WazaEffWork[2];	//縦揺れか横揺れか
		TaskTable[taskno].work[4] = WazaEffWork[3];	//どっちのテーブル参照か
	}
	
	TaskTable[taskno].work[0]++;
	
	Attack = PokemonStruct[DefenceNo];

	if(TaskTable[taskno].work[4]==0)	w = yure[TaskTable[taskno].work[0]%10];
	else								w = yure2[TaskTable[taskno].work[0]%10];

	if(TaskTable[taskno].work[3]==1){	//縦揺れ
		ActWork[Attack].dy = abs(WazaEffWork[1]*w);
	}else{
		ActWork[Attack].dx = WazaEffWork[1]*w;
	}
	
	if(TaskTable[taskno].work[0]==TaskTable[taskno].work[1]){
		ActWork[Attack].dx = 0;
		ActWork[Attack].dy = 0;
		DelTaskEffect(taskno);
	}
}


//---------------------------------------------------------------
//	アクターシーケンス
//---------------------------------------------------------------
//----------------------------------------------------------
//	かみなり	初期化
//	WazaEffWork[0]:	X
//	WazaEffWork[1]:	Y
//----------------------------------------------------------
static void SeqWazaKaminariInit( actWork * Xreg )
{
	if(MineEnemyCheck(AttackNo))
		Xreg->x -= WazaEffWork[0];
	else
		Xreg->x += WazaEffWork[0];
	Xreg->y += WazaEffWork[1];
	Xreg->move = SeqWazaKaminari;
}

//----------------------------------------------------------
//	かみなり
// offset:なし
//----------------------------------------------------------
static void SeqWazaKaminari( actWork * Xreg )
{
	
	if(Xreg->anmend_sw == 1)
		DelWazaEffect(Xreg);
}


//----------------------------------------------------------
//	パンチした後、グリグリ		初期化
//	WazaEffWork[0]:	X
//	WazaEffWork[1]:	Y
//----------------------------------------------------------
static void SeqWazaPunchInit( actWork * Xreg )
{
	if(MineEnemyCheck(AttackNo))
		Xreg->x -= WazaEffWork[0];
	else
		Xreg->x += WazaEffWork[0];
	
	Xreg->move = SeqWazaPunch;
}

//----------------------------------------------------------
//	パンチした後、グリグリ		初期化
//----------------------------------------------------------
static void SeqWazaPunch(actWork * Xreg)
{
	if(Xreg->affend_sw == 1){
		W_AffCheckEndSeq(Xreg);
	}
}











//=========================================================================
//
//		「でんきショック」、「じゅうまんボルト｣
//														by nohara
//=========================================================================
//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
#define JYUUMAN_WAIT	5
#define DENKI_WAIT		5

//----------------------------------------------------------
//	じゅうまんボルト
//	パレットアニメデータ
//----------------------------------------------------------
/*const u16 TamaColor[] = 
{
	0x7fff,0x7666,0x1ac7,0x0000,0x7fff,0x7666,0x1ac7,0x0000,0x7fff,0x7666,
	0x0000,0x7fff,0x7666,0x1ac7,0x0000,0x7fff,0x7666,0x1ac7,0x0000,0x7fff,
	0x7666,0x1ac7,0x0000,0x7fff,0x7666,0x1ac7,0x0000,0x3333,0x2222,0x1111,
};

const PalAnmData TamaPalAnm = 
{
	100,				//id_no
	(u16*)TamaColor,  //PalData		転送するｶﾗｰﾊﾟﾚｯﾄｱﾄﾞﾚｽ
	PA_NORMAL,      //type	NORMAL:ｶﾗｰ加減算対象　　NON_FADE:ｶﾗｰ加減算非対象
	PA_OBJ2+PA_COL4,              //pal_no		0～511
	10,              //TransValue	col_noから いくつまでのﾊﾟﾚｯﾄを対象とするか
	10,             //TransWaitDef	次のﾊﾟﾚｯﾄｱﾆﾒに移るまでのｳｪｲﾄ
	3,              //TransValueLoopDef	何回転送を繰り返すか
	PA_LOOP,         //PalAnmSeq		ｱﾆﾒ終了後の処理
	0,             //LoopWaitDef 全てのｱﾆﾒが終了してPalAnmSeqが実行されるまでのｳｪｲﾄ
};
*/
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void TamaInit(actWork *ActSt);

//----------------------------------------------------------
//	じゅうまんボルト
//----------------------------------------------------------
const actAnm jiyumantama_anm0[] =
{
	{OBJ16_32x32 * 0, JYUUMAN_WAIT, 0, 0},
	{OBJ16_32x32 * 1, JYUUMAN_WAIT, 0, 0},
	{OBJ16_32x32 * 2, JYUUMAN_WAIT, 0, 0},
	{OBJ16_32x32 * 3, JYUUMAN_WAIT, 0, 0},
	{OBJ16_32x32 * 4, JYUUMAN_WAIT, 0, 0},
	{OBJ16_32x32 * 5, JYUUMAN_WAIT, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
const actAnm * const JiyumanTamaAnmTbl[] = 
{
	jiyumantama_anm0,
};
const actHeader ActJiyumanTamaHeader = 
{
	WAZACHR_ID_DENKI_L,
	WAZACHR_ID_DENKI_L,
	&WazaOamDataNormal[2],
	JiyumanTamaAnmTbl,
	ACT_NTRANS,		//非転送アニメ
	DummyActAffTbl,
	TamaInit,
};

//----------------------------------------------------------
//	アクターシーケンス
//----------------------------------------------------------
static void TamaInit(actWork *ActSt)
{
	ActSt->x = GetWazaEffPos(DefenceNo, PM_X);
	ActSt->y = GetWazaEffPos(DefenceNo, PM_Y);
	if(MineEnemyCheck(AttackNo))
	{
		ActSt->x-=WazaEffWork[0];	//XOFF
		ActSt->y-=WazaEffWork[1];	//YOFF
	}
	else
	{
		ActSt->x+=WazaEffWork[0];	//XOFF
		ActSt->y+=WazaEffWork[1];	//YOFF
	}

	ActSt->work[0]=0;				//角度
	ActSt->work[1]=WazaEffWork[2];	//振り幅
	ActSt->work[2]=WazaEffWork[3];	//角度増加量
	ActSt->work[3]=WazaEffWork[4];	//LOOP
//	ActSt->work[5]=TAMA_ID;			//DelPalAnm用

//	SetWorkSeq(ActSt, W_DelPalEndSeq);
	SetWorkSeq(ActSt, W_AffCheckEndSeq);
	ActSt->move = PMObjKaiten;

	//パレット
//	pal_no = ObjPalNumGet(WAZACHR_ID_TAMA);
//	pal_no = OBJPALNO_TO_PANO(pal_no);
//	AddPalAnm(&TamaPalAnm, pal_no + PA_COL0);
}














//=========================================================================
//
//		209:「スパーク」
//											renewal 02.08.01	iwasawa
//=========================================================================
//-------------------------------------------------------------------------
//	0:表示する位置(theta),1:オフセット(dot),2:表示する角度,
//	3:表示時間,4:ClientNo(0:Attack,1:defence,2,attack2,3:defence2),
//	5:(EFF_MODE;0,PM_MODE;0),6:プライオリティ(0:上,1:下)
//-------------------------------------------------------------------------
extern void SeqWazaEffectEnd(actWork *xreg);
static void SeqSparkInit(actWork *xreg)
{
	s16	sin = 0;
	u8	affNo = 0;
	u8	client = 0;

	switch(WazaEffWork[4])
	{
	case 0:
		client = AttackNo;
		break;
	case 1:
		client = DefenceNo;
		break;
	case 2:
		if(PokeBG2taimeCheck(AttackNo^2) == 0)	client = AttackNo;
		else									client  =AttackNo^2;
		break;
	case 3:
		if(PokeBG2taimeCheck(AttackNo^2) == 0)	client = DefenceNo;
		else									client = DefenceNo^2;
		break;
	default:
		client = DefenceNo;
		break;
	}
	//表示位置を設定
	if(WazaEffWork[5] == 0){
		xreg->x = GetWazaEffPos(client,EFF_X);
		xreg->y = GetWazaEffPos(client,EFF_Y);
	}else{
		xreg->x = GetWazaEffPos(client,PM_X);
		xreg->y = GetWazaEffPos(client,PM_Y);
	}
	xreg->dx = (_Sin(WazaEffWork[0])*WazaEffWork[1]) >> 8;
	xreg->dy = (_Cos(WazaEffWork[0])*WazaEffWork[1]) >> 8;
	
	//表示プライオリティを設定
	if(WazaEffWork[6] & 0x0001){
		xreg->oamData.Priority = GetPokeBGPri(client)+1;
	}

	//表示角度を設定
	affNo = xreg->oamData.AffineParamNo;
	sin = _Sin(WazaEffWork[2]);
	OBJ_AffineWork[ affNo ].H_DiffX = 
	OBJ_AffineWork[ affNo ].V_DiffY =  _Cos(WazaEffWork[2]);
	OBJ_AffineWork[ affNo ].V_DiffX =  sin;
	OBJ_AffineWork[ affNo ].H_DiffY = -sin;
	
	xreg->work[0] = WazaEffWork[3];
	xreg->move = SeqWazaEffectEnd;
}
//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
const actHeader ActSparkHeader = 
{
	WAZACHR_ID_MAHI,
	WAZACHR_ID_MAHI,
	&WazaOamDataAffine[1],
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	SeqSparkInit,	
};

//=========================================================================
//
//		でんじほう
//												by matsuda 2002.02.22(金)
//=========================================================================
static void DenjihouSubInit(actWork *xreg);
static void DenjihouSubMain(actWork *xreg);

const actHeader ActDenjihouHeader = 
{
	WAZACHR_ID_DENJIHOU2,
	WAZACHR_ID_DENJIHOU2,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	W_StraightMoveInit,
};

//-- でんじほうの回りを回るやつ --//
static const actAffAnm DenjiSubAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0, 0, 20, 1},
	{ACT_AFLOOP,0,0,0},
};

static const	actAffAnm * const DenjiSubAffTbl[] = {
	DenjiSubAff0,
};
const actHeader ActDenjihouSubHeader =
{
	WAZACHR_ID_MAHI,
	WAZACHR_ID_MAHI,
	&WazaOamDataAffine[1],
	DummyActAnmTbl,
	ACT_NTRANS,
	DenjiSubAffTbl,
	DenjihouSubInit,
};

//----------------------------------------------------------
//		※回りをまわる電気
//	0:Xoffset	1:Yoffset	2:振り幅(X,Y共通)	3:Sync回数
//	4:初期角度	5:秒速度	6:アニメNo
//----------------------------------------------------------
static void DenjihouSubInit(actWork *xreg)
{
	WazaDefaultPosSet2(xreg, PM_MODE);
	xreg->work[0] = WazaEffWork[3];
	xreg->work[1] = xreg->x;
	xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X);
	xreg->work[3] = xreg->y;
	xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y);
	W_GetStraightSyncParam(xreg);
	
	xreg->work[5] = WazaEffWork[2];
	xreg->work[6] = WazaEffWork[5];
	xreg->work[7] = WazaEffWork[4];
	
	xreg->oamData.CharNo += 4 * WazaEffWork[6];	//ﾃｰﾌﾞﾙ作るのがもったいないので
	
	xreg->move = DenjihouSubMain;
	xreg->move(xreg);
}

static void DenjihouSubMain(actWork *xreg)
{
	if(W_ParallelSync(xreg) == 0)
	{
		xreg->dx += SinMove(xreg->work[7], xreg->work[5]);
		xreg->dy += CosMove(xreg->work[7], xreg->work[5]);
		xreg->work[7] = 0xff & (xreg->work[7] + xreg->work[6]);
		
		if(xreg->work[7] % 3 == 0)	//一定間隔で表示のON,OFFを行う
			xreg->banish ^= 1;
	}
	else
		DelWazaEffect(xreg);
}

//=========================================================================
//
//		じゅうまんボルト
//												by iwasawa 2002.08.28
//=========================================================================
static void JumanMainInit(actWork *xreg);
static void JumanSubInit(actWork *xreg);
static void JumanSubMain(actWork *xreg);
static const actAnm JumanAnm0[]={
	{OBJ16_32x32*0,6,0,0},
	{OBJ16_32x32*1,6,0,0},
	{OBJ16_32x32*2,6,0,0},
	{ACT_ANMLOOP,0,0,0}
};
static const actAnm *const JumanAnmTbl[]={
	JumanAnm0,
};
static const actAffAnm JumanMainAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0x0E8, 0x0E8, 0, ACT_AFSET},
	{-0x08,-0x08,0,10},
	{0x08,0x08,0,10},
	{ACT_AFLOOP,1,0,0},
};
static const	actAffAnm * const JumanMainAffTbl[] = {
	JumanMainAff0,
};
const actHeader ActJumanHeader = 
{
	WAZACHR_ID_ELBALL,
	WAZACHR_ID_ELBALL,
	&WazaOamDataAffine[2],
	JumanAnmTbl,
	ACT_NTRANS,
	JumanMainAffTbl,
	JumanMainInit,
};
const actHeader ActJumanSubHeader =
{
	WAZACHR_ID_MAHI,
	WAZACHR_ID_MAHI,
	&WazaOamDataAffine[1],
	DummyActAnmTbl,
	ACT_NTRANS,
	DenjiSubAffTbl,
	JumanSubInit,
};
//----------------------------------------------------------
//	帯電ボール本体ーBlinkかけながら、指定Sync表示
//	0:表示Sync	1:xOffset, 2:yOffset,	3:Blink間隔
//----------------------------------------------------------
static void JumanMain(actWork *xreg)
{
	if(xreg->work[5]-- == 0){
		xreg->banish ^= 1;
		xreg->work[5] = xreg->work[4];
	}
	if(xreg->work[3]-- > 0) return;
	DelWazaEffect(xreg);
}
static void JumanMainInit(actWork *xreg)
{
	if(!sys.FieldBattleFlag || !MineEnemyCheck(DefenceNo)){
		WazaEffWork[1] = -WazaEffWork[1];
	}
	xreg->x = GetWazaEffPos(DefenceNo, PM_X)+WazaEffWork[1];
	xreg->y = GetWazaEffPos(DefenceNo, PM_Y)+WazaEffWork[2];

	xreg->work[3] = WazaEffWork[0];
	xreg->work[5] = xreg->work[4] = WazaEffWork[3];

	xreg->move = JumanMain;
}
//----------------------------------------------------------
//		※回りをまわる電気
//	0:Xoffset	1:Yoffset	2:振り幅(X,Y共通)	3:Sync回数
//	4:初期角度	5:秒速度	6:アニメNo,		7:Attack:0,Defence:1
//----------------------------------------------------------
static void JumanSubInit(actWork *xreg)
{
	u8	client = 0;
	
	xreg->work[0] = WazaEffWork[3];

	if(WazaEffWork[7]&0x8000)	client = DefenceNo;
	else						client = AttackNo;
	
	if(!sys.FieldBattleFlag || !MineEnemyCheck(client)){
		WazaEffWork[0] = -WazaEffWork[0];
	}
	xreg->x = GetWazaEffPos(client, PM_X)+WazaEffWork[0];
	xreg->y = GetWazaEffPos(client, PM_Y)+WazaEffWork[1];
	
	xreg->work[4] = WazaEffWork[7] & 0x7FFF;
	xreg->work[5] = WazaEffWork[2];
	xreg->work[6] = WazaEffWork[5];
	xreg->work[7] = WazaEffWork[4];
	
	xreg->oamData.CharNo += 4 * WazaEffWork[6];	//ﾃｰﾌﾞﾙ作るのがもったいないので
	
	xreg->move = JumanSubMain;
	xreg->move(xreg);
}

static void JumanSubMain(actWork *xreg)
{
	xreg->dx = SinMove(xreg->work[7], xreg->work[5]);
	xreg->dy = CosMove(xreg->work[7], xreg->work[5]);
	xreg->work[7] = 0xff & (xreg->work[7] + xreg->work[6]);
		
	if(xreg->work[7] % xreg->work[4] == 0)	//一定間隔で表示のON,OFFを行う
		xreg->banish ^= 1;
	
	if(xreg->work[0]-- > 0) return;
	DelWazaEffect(xreg);
}





//=========================================================================
//
//		マヒの追加効果があるｴﾌｪｸﾄの共用ﾊﾟﾀｰﾝ
//												by matsuda 2002.02.22(金)
//=========================================================================
static void MahiKoukaInit(actWork *xreg);

const actHeader ActMahiKoukaHeader =
{
	WAZACHR_ID_MAHI,
	WAZACHR_ID_MAHI,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	MahiKoukaInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:Delまでのwait		3:AnmNo
//----------------------------------------------------------
static void MahiKoukaInit(actWork *xreg)
{
	WazaDefaultPosSet1(xreg, EFF_MODE);
	xreg->oamData.CharNo += 4*WazaEffWork[3];
	if(WazaEffWork[3] == 1)	//見栄えをバラけさせるため1番をH反転してみる
		xreg->oamData.AffineParamNo = 0x8;
	else if(WazaEffWork[3] == 2)	//見栄えをバラけさせるため2番をV反転してみる
		xreg->oamData.AffineParamNo = 0x10;
	xreg->work[0] = WazaEffWork[2];
	xreg->move = W_WaitSeq;
	SetWorkSeq(xreg, DelWazaEffect);
}









//=========================================================================
//
//		かみなりアクターを出すタスク
//												by matsuda 2002.03.14(木)
//=========================================================================
static const actHeader ActKaminariWazaHeader;
static void KaminariTaskMain(u8 id);
#define KAMINARI_WAIT	2	//雷が落とす感覚(落ちる速度)
#define KAMINARI_ENDWAIT	14
//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:雷の大きさ(0=小  1=中)
//----------------------------------------------------------
void KaminariTask(u8 id)
{
	TaskTable[id].work[0] = GetWazaEffPos(DefenceNo, EFF_X) + WazaEffWork[0];
	TaskTable[id].work[1] = GetWazaEffPos(DefenceNo, EFF_Y) + WazaEffWork[1];
	TaskTable[id].work[2] = WazaEffWork[2];
	TaskTable[id].TaskAdrs = KaminariTaskMain;
}

static void KaminariTaskMain(u8 id)
{
	s16 yoffs, xpos, ypos;
	u8 actno = 0;
	u8 add_flg = 0;
	u8 size;
	u16 charNo, charNoOffs;
	
	size = TaskTable[id].work[2];
	xpos = TaskTable[id].work[0];
	ypos = TaskTable[id].work[1];
	if(TaskTable[id].work[2] == 0){
		charNo = 0;
		charNoOffs = 1;
		yoffs = 16;
	}else{	// if(TaskTable[id].work[2] == 1)
		yoffs = 16;
		charNo = 8;
		charNoOffs = 4;
	}
	
	switch(TaskTable[id].work[10]){
		case 0:
			yoffs *= 1;
			charNo += charNoOffs * 0;
			actno = AddActor(&ActKaminariWazaHeader, xpos, ypos+yoffs, 2);
			add_flg++;
			break;
		case KAMINARI_WAIT*1:
			yoffs *= 2;
			charNo += charNoOffs * 1;
			actno = AddActor(&ActKaminariWazaHeader, xpos, ypos+yoffs, 2);
			add_flg++;
			break;
		case KAMINARI_WAIT*2:
			yoffs *= 3;
			charNo += charNoOffs * 2;
			actno = AddActor(&ActKaminariWazaHeader, xpos, ypos+yoffs, 2);
			add_flg++;
			break;
		case KAMINARI_WAIT*3:
			yoffs *= 4;
			charNo += charNoOffs * 3;
			actno = AddActor(&ActKaminariWazaHeader, xpos, ypos+yoffs, 2);
			add_flg++;
			break;
		case KAMINARI_WAIT*4:
			yoffs *= 5;
			charNo += charNoOffs * 0;
			actno = AddActor(&ActKaminariWazaHeader, xpos, ypos+yoffs, 2);
			add_flg++;
			break;
		case KAMINARI_WAIT*5:
			DelTaskEffect(id);
			return;
	}
	if(add_flg){
		ActWork[actno].oamData.CharNo += charNo;
		ActWork[actno].work[0] = size;
		ActWork[actno].move(&ActWork[actno]);
	}
	TaskTable[id].work[10]++;
}

static void KaminariSeq(actWork *xreg)
{
	if(xreg->work[0] == 0){
		xreg->oamData.Shape = 2;
		xreg->oamData.Size = 0;
	}else{
		xreg->oamData.Shape = 0;
		xreg->oamData.Size = 1;
	}
	
	if(xreg->work[1]++ == KAMINARI_ENDWAIT)
		DelActor(xreg);
}

static const actHeader ActKaminariWazaHeader =
{
	WAZACHR_ID_KAMINARI,
	WAZACHR_ID_KAMINARI,
	&WazaOamDataNormal[0],
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	KaminariSeq,
};


















//=========================================================================
//
//		でんじは
//												by matsuda 2002.03.14(木)
//=========================================================================
static void DenjihaSeq(actWork *xreg);
static void DenjihaMainSeq(actWork *xreg);
#define DENJIHA_BANISH	2	//電磁波を点滅させる感覚
#define DENJIHA_ENDWAIT	50

const actHeader DenjihaHeader =
{
	WAZACHR_ID_DENJIHA,
	WAZACHR_ID_DENJIHA,
	&WazaOamDataNormal[6],
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	DenjihaSeq,
};

//----------------------------------------------------------
//	0:Xoffset(左側の座標位置。右側のはここで自動でAddActorされる)
//	1:Yoffset
//----------------------------------------------------------
static void DenjihaSeq(actWork *xreg)
{
	u8 actno;
	
	xreg->x += WazaEffWork[0];	//左右反転しないようにDefaultPosSetは使わない
	xreg->y += WazaEffWork[1];
	actno = AddActor(&DenjihaHeader, xreg->x + 32, xreg->y, xreg->pri);
	ActWork[actno].oamData.CharNo += 8;
	WazaEffectCount++;
	ActWork[actno].move = DenjihaMainSeq;
	xreg->move = DenjihaMainSeq;
}

static void DenjihaMainSeq(actWork *xreg)
{
	if(xreg->work[0]++ == DENJIHA_BANISH){
		xreg->work[0] = 0;
		xreg->banish ^= 1;
	}
	if(xreg->work[1]++ == DENJIHA_ENDWAIT)
		DelWazaEffect(xreg);
}









//=========================================================================
//
//		じゅうでん
//																	TAYA
//=========================================================================

//======================================================
//	光の粒が集まりだす
//	0:(0:攻撃側  1:防御側）  1:粒の総数
//	2:追加間隔wait  3:速度アップwait
//======================================================
#define JUDEN_TUBU_MAX       (16)
#define JUDEN_TUBU_SYNC_MAX  (40)  // 最低速時の移動SYNC数
#define JUDEN_TUBU_SYNC_UNIT (5)   // 速度１段階アップで何SYNC減少するか？
#define JUDEN_TUBU_SPD_MAX   (6)   // 速度最高段階

static const s8 Juden1Ofs[JUDEN_TUBU_MAX][2] = 
{
	{ 58, -60},
	{-56, -36},
	{  8, -56},
	{-16,  56},
	{ 58, -10},
	{-58,  10},
	{ 48, -18},
	{ -8,  56},
	{ 16, -56},
	{-58, -42},
	{ 58,  30},
	{-48,  40},
	{ 12, -48},
	{ 48, -12},
	{-56,  18},
	{ 48,  48},
};

static const actHeader Juden1Header;
static void TaskJuden1Main(u8 id);
static void Juden1ActMove(actWork *act);

void TaskJuden1(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	if(WazaEffWork[0] == 0){
		my->work[14] = GetWazaEffPos(AttackNo, PM_X);
		my->work[15] = GetWazaEffPos(AttackNo, PM_Y);
	}else{
		my->work[14] = GetWazaEffPos(DefenceNo, PM_X);
		my->work[15] = GetWazaEffPos(DefenceNo, PM_Y);
	}

	my->work[6] = WazaEffWork[1];   // 6:登録総数
	my->work[7] = 0;   // 7:ｱｸﾀｰ数ｶｳﾝﾀ
	my->work[8] = 0;   // 8:移動速度
	my->work[9] = 0;   // 9:位置番号

	my->work[10] = 0;
	my->work[11] = WazaEffWork[3];;

	my->work[12] = 0;
	my->work[13] = WazaEffWork[2];


	my->TaskAdrs = TaskJuden1Main;
}
static void TaskJuden1Main(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	if(my->work[6]){
		if(++(my->work[12]) > my->work[13]){
			actWork *act;
			u16 no;

			my->work[12] = 0;
			no = AddActor(&Juden1Header, my->work[14], my->work[15], 2);
			if(no != ACT_MAX){
				act = &ActWork[no];
				act->x += Juden1Ofs[my->work[9]][0];
				act->y += Juden1Ofs[my->work[9]][1];

				act->work[0] = JUDEN_TUBU_SYNC_MAX - (JUDEN_TUBU_SYNC_UNIT * my->work[8]);
				act->work[1] = act->x;
				act->work[2] = my->work[14];
				act->work[3] = act->y;
				act->work[4] = my->work[15];
				act->work[5] = id;
				W_GetStraightSyncParam(&ActWork[no]);

				SetWorkSeq(&ActWork[no], Juden1ActMove);
				act->move = W_AnmEndWait;

				if(++(my->work[9]) >= JUDEN_TUBU_MAX)
				{
					my->work[9] = 0;
				}

				if(++(my->work[10]) >= my->work[11])
				{
					my->work[10] = 0;
					if(my->work[8] < JUDEN_TUBU_SPD_MAX){
						my->work[8]++;
					}
				}

				my->work[7]++;
				my->work[6]--;
			}
		}
	}else{
		if(my->work[7] == 0){
			DelTaskEffect(id);
		}
	}
}
static void Juden1ActMove2(actWork *act)
{
	if(W_ParallelSync(act)){
		TaskTable[act->work[5]].work[7]--;
		DelActor(act);
	}
}

static void Juden1ActMove(actWork *act)
{
	ActAnmChg(act, 1);
	act->move = Juden1ActMove2;
}


static const actAnm Juden1Anm0[]={
	{OBJ16_8x8*3,1,0,0},
	{OBJ16_8x8*2,1,0,0},
	{OBJ16_8x8*1,1,0,0},
	{OBJ16_8x8*0,1,0,0},
	{ACT_ANMEND,0,0,0}
};
static const actAnm Juden1Anm1[]={
	{OBJ16_8x8*0,5,0,0},
	{OBJ16_8x8*1,5,0,0},
	{OBJ16_8x8*2,5,0,0},
	{OBJ16_8x8*3,5,0,0},
	{ACT_ANMEND,0,0,0}
};

static const actAnm *const Juden1AnmTbl[]={
	Juden1Anm0,
	Juden1Anm1,
};

static const actHeader Juden1Header =
{
	WAZACHR_ID_JUUDEN1,
	WAZACHR_ID_JUUDEN1,
	&WazaOamDataNormal[0],
	Juden1AnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	DummyActMove,
};

//======================================================
//	光の円が登場
//	0:(0:攻撃側  1:防御側）
//======================================================
static const actAffAnm Juden2AffAnm[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x10, 0x10, 0, ACT_AFSET },		// 0
	{ 0x04, 0x04, 0, 60},
	{ 0x100, 0x100, 0, ACT_AFSET },		// 0
	{ ACT_AFcLOOP, 0, 0, 0 },
	{-0x04,-0x04, 0, 5},
	{ 0x04, 0x04, 0, 5},
	{ ACT_AFcLOOP, 10, 0, 0 },
//	{ 0, 0, 0, 10 },
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};

static const actAffAnm VolteckerAffAnm[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x10, 0x10, 0, ACT_AFSET },		// 0
	{ 0x08, 0x08, 0, 30},
	{ 0x100, 0x100, 0, ACT_AFSET },
	{-0x04,-0x04, 0, 5},
	{ 0x04, 0x04, 0, 5},
	{ ACT_AFLOOP, 3, 0, 0 },
};

static const actAffAnm DengekihaAffAnm[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x10, 0x10, 0, ACT_AFSET },		// 0
	{ 0x08, 0x08, 0, 30},
	{-0x08,-0x08, 0, 30},
	{ ACT_AFEND, 0, 0, 0},
};

static const actAffAnm * const Juden2AffAnmTbl[] = {
	Juden2AffAnm,
	VolteckerAffAnm,
	DengekihaAffAnm,
};
static void Juden2ActInit(actWork *act);

const actHeader ActJuden2 =
{
	WAZACHR_ID_JUUDEN2,
	WAZACHR_ID_JUUDEN2,
	&WazaOamDataBldAffine[3],
	DummyActAnmTbl,
	ACT_NTRANS,
	Juden2AffAnmTbl,
	Juden2ActInit,
};

static void Juden2ActInit(actWork *act)
{
	if(WazaEffWork[0] == 0){
		act->x = GetWazaEffPos(AttackNo, PM_X);
		act->y = GetWazaEffPos(AttackNo, PM_Y);
	}else{
		act->x = GetWazaEffPos(DefenceNo, PM_X);
		act->y = GetWazaEffPos(DefenceNo, PM_Y);
	}
	SetWorkSeq(act, W_AffCheckEndSeq);
	act->move = W_AffEndWait;
}

//======================================================
//	スパーク
//	0:(0:攻撃側  1:防御側） 1:XOFS  2:YOFS
//======================================================
#define JUDEN3_ANMWAIT  (3)

static const actAnm Juden3Anm[]={
	{OBJ16_32x32*0,JUDEN3_ANMWAIT,0,0},
	{OBJ16_32x32*1,JUDEN3_ANMWAIT,0,0},
	{OBJ16_32x32*2,JUDEN3_ANMWAIT,0,0},
	{OBJ16_32x32*3,JUDEN3_ANMWAIT,0,0},
	{ACT_ANMEND,0,0,0}
};

static const actAnm *const Juden3AnmTbl[]={
	Juden3Anm,
};

static void Juden3ActInit(actWork *act);

const actHeader ActJuden3 =
{
	WAZACHR_ID_JUUDEN3,
	WAZACHR_ID_JUUDEN3,
	&WazaOamDataNormal[2],
	Juden3AnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	Juden3ActInit,
};

static void Juden3ActInit(actWork *act)
{
	if(WazaEffWork[0] == 0){
		act->x = GetWazaEffPos(AttackNo, PM_X);
		act->y = GetWazaEffPos(AttackNo, PM_Y);
	}else{
		act->x = GetWazaEffPos(DefenceNo, PM_X);
		act->y = GetWazaEffPos(DefenceNo, PM_Y);
	}
	act->dx = WazaEffWork[1];
	act->dy = WazaEffWork[2];
	SetWorkSeq(act, DelWazaEffect);
	act->move = W_AnmEndWait;

}














//=========================================================================
//	ボルテッカー
//
//																	TAYA
//=========================================================================

//================================================
// 自分を包む光り
//================================================
#define VOLT_HIKARI_SPEED  (16)
static void VoltHikariActMove(actWork *act);

static void VoltHikariActInit(actWork *act)
{
	ActAffAnmChg(act, 1);
	act->x = GetWazaEffPos(AttackNo, PM_X);
	act->y = GetWazaEffPos(AttackNo, PM_Y);
	act->work[6] = W_GetPokeActNo(0);
	act->work[7] = VOLT_HIKARI_SPEED;
	if(MineEnemyCheck(AttackNo)==SIDE_ENEMY){
		act->work[7] *= -1;
	}
	act->move = VoltHikariActMove;
}
static void VoltHikariActMove(actWork *act)
{
	switch(act->work[0]){
	case 0:
		if(++(act->work[1])>40){
			act->work[0]++;
		}
		break;

	case 1:
		act->x += act->work[7];
		ActWork[act->work[6]].dx += act->work[7];  // ﾎﾟｹﾓﾝも同時に動かす
		if(act->x < -80 || act->x > 320){
			W_AffCheckEndSeq(act);
		}
		break;
	}
}
const actHeader VoltHikariHeader = {
	WAZACHR_ID_JUUDEN2,
	WAZACHR_ID_JUUDEN2,
	&WazaOamDataBldAffine[3],
	DummyActAnmTbl,
	ACT_NTRANS,
	Juden2AffAnmTbl,
	VoltHikariActInit,
};
//================================================
// 自分が出てくる
//================================================
void TaskVolteckerAppear(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	case 0:
		my->work[15] = W_GetPokeActNo(0);  // 15:ﾎﾟｹﾓﾝｱｸﾀｰﾅﾝﾊﾞｰ
		my->work[14] = GetWazaEffPos(AttackNo, PM_X); 
		if(MineEnemyCheck(AttackNo)==SIDE_MINE){
			my->work[14] = -32;
			my->work[13] = 2;
		}else{
			my->work[14] = 32;
			my->work[13] = -2;
		}
		ActWork[my->work[15]].dx = my->work[14];
		my->work[0]++;
		break;

	case 1:
		if(++(my->work[1]) > 1){
			my->work[1] = 0;
			ActWork[my->work[15]].banish ^= 1;
			if(my->work[14] == 0){
				my->work[0]++;
			}else{
				my->work[14] += my->work[13];
				ActWork[my->work[15]].dx = my->work[14];
			}
		}
		break;

	case 2:
		if(++(my->work[1]) > 1){
			my->work[1] = 0;
			ActWork[my->work[15]].banish ^= 1;
			if(++(my->work[2]) == 8){
				my->work[0]++;
			}
		}
		break;

	case 3:
		ActWork[my->work[15]].banish = 0;
		DelTaskEffect(id);
		break;
	}
}

//================================================
//  ビリビリライン  0:何番目のラインか(0～4）
//================================================
#define VL_ADDACT_WAIT   (0)
#define VL_ACTDISP_WAIT  (12)
#define VL_ACTANM_MAX    (3)

enum VL_WORK {
	VL_SEQ,
	VL_VEC,
	VL_TIMER,
	VL_ACT_SX,
	VL_ACT_EX,
	VL_ACT_Y,
	VL_ACT_ANM,
	VL_ACT_CNT,
};
static u8 add_volt_line(TASK_TABLE *my, u8 id);

void TaskVoltLine(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[VL_SEQ]){
	case 0:
		my->work[VL_VEC] = (MineEnemyCheck(AttackNo)==SIDE_MINE)? 1 : -1;
		switch(WazaEffWork[0]){
		case 0:
			my->work[VL_ACT_SX] = GetWazaEffPos(AttackNo,PM_X);
			my->work[VL_ACT_Y] = GetWazaEffPos(AttackNo,PM_Y);	
			my->work[VL_ACT_EX] = 120 + (128 * my->work[VL_VEC]);
			break;

		case 4:
			my->work[VL_ACT_SX] = 120 - (128 * my->work[VL_VEC]);
			my->work[VL_ACT_Y] = GetWazaEffPos(DefenceNo,PM_Y);	
			my->work[VL_ACT_EX] = GetWazaEffPos(DefenceNo,PM_X) - (32 * my->work[VL_VEC]);
			break;

		default:
			if(WazaEffWork[0] & 1){
				my->work[VL_ACT_SX] = 256;
				my->work[VL_ACT_EX] = -16;
			}else{
				my->work[VL_ACT_SX] = -16;
				my->work[VL_ACT_EX] = 256;
			}
			if(my->work[VL_VEC] == 1){
				my->work[VL_ACT_Y] = 80 - (WazaEffWork[0] * 10);
			}else{
				s16 tmp;
				my->work[VL_ACT_Y] = 40 + (WazaEffWork[0] * 10);
				tmp = my->work[VL_ACT_SX];
				my->work[VL_ACT_SX] = my->work[VL_ACT_EX];
				my->work[VL_ACT_EX] = tmp;
			}
			break;
		}
		if(my->work[VL_ACT_SX] < my->work[VL_ACT_EX]){
			my->work[VL_VEC] = 1;
			my->work[VL_ACT_ANM] = 0;
		}else{
			my->work[VL_VEC] = -1;
			my->work[VL_ACT_ANM] = VL_ACTANM_MAX;
		}
		my->work[VL_SEQ]++;
		break;

	case 1:
		if(++(my->work[VL_TIMER]) > VL_ADDACT_WAIT){
			my->work[VL_TIMER] = 0;
			// 速度アップのため、２個いっぺんに追加してみる。
			if(add_volt_line(my, id))
			{
				my->work[VL_SEQ]++;
				break;
			}
			if(add_volt_line(my, id))
			{
				my->work[VL_SEQ]++;
				break;
			}
		}
		break;

	case 2:
		if(my->work[VL_ACT_CNT] == 0){
			DelTaskEffect(id);
		}
		break;
	}
}
//----------------------------------------------
// ﾗｲﾝｱｸﾀｰ追加
//----------------------------------------------
static const actHeader VoltLineHeader;
static u8 add_volt_line(TASK_TABLE *my, u8 id)
{
	u8 no;

	no = AddActor(&VoltLineHeader, my->work[VL_ACT_SX], my->work[VL_ACT_Y], 35);
	if(no != ACT_MAX)
	{
		ActWork[no].work[6] = id;
		ActWork[no].work[7] = VL_ACT_CNT;
		my->work[VL_ACT_CNT]++;
	}

	my->work[VL_ACT_ANM] += my->work[VL_VEC];
	if(my->work[VL_ACT_ANM] < 0){
		my->work[VL_ACT_ANM] = VL_ACTANM_MAX;
	}
	if(my->work[VL_ACT_ANM] > VL_ACTANM_MAX){
		my->work[VL_ACT_ANM] = 0;
	}

	my->work[VL_ACT_SX] += (16 * my->work[VL_VEC]);
	if((my->work[VL_VEC] ==  1 && my->work[VL_ACT_SX] >= my->work[VL_ACT_EX])
	|| (my->work[VL_VEC] == -1 && my->work[VL_ACT_SX] <= my->work[VL_ACT_EX])
	){
		return 1;
	}

	return 0;
}
static void VoltLineActMove(actWork *act)
{
	if(++(act->work[0]) > VL_ACTDISP_WAIT)
	{
		TaskTable[act->work[6]].work[act->work[7]]--;
		AffineWorkNumDel(act->oamData.AffineParamNo);
		DelActor(act);
	}
}

static const actAnm VoltLineAnm[]={
	{OBJ16_8x16*0,3,0,0}, { ACT_ANMEND,0,0,0 },
	{OBJ16_8x16*1,3,0,0}, { ACT_ANMEND,0,0,0 },
	{OBJ16_8x16*2,3,0,0}, { ACT_ANMEND,0,0,0 },
	{OBJ16_8x16*3,3,0,0}, { ACT_ANMEND,0,0,0 },
};
static const actAnm *const VoltLineAnmTbl[]={
	VoltLineAnm + 0,
	VoltLineAnm + 2,
	VoltLineAnm + 4,
	VoltLineAnm + 6,
};
static const actAffAnm VoltLineAffAnm[] = {
	{ 0x100, 0x100, 64, ACT_AFSET },
	{ACT_AFEND,0,0,0},
};

static const actAffAnm * const VoltLineAffAnmTbl[] = {
	VoltLineAffAnm
};


static const actHeader VoltLineHeader = {
	WAZACHR_ID_KAMINARI,
	WAZACHR_ID_KAMINARI,
	&WazaOamDataAffine2[8],
	VoltLineAnmTbl,
	ACT_NTRANS,
	VoltLineAffAnmTbl,
	VoltLineActMove,
};














//=========================================================================
//	でんげきは
//
//																	TAYA
//=========================================================================

//================================================
// 光が自分の周りに溜まる
//================================================
static void DengekihaBallActInit(actWork *act)
{
	switch(act->work[0]){
	case 0:
		act->x = GetWazaEffPos(AttackNo, PM_X);
		act->y = GetWazaEffPos(AttackNo, PM_Y);
		ActAffAnmChg(act, 2);
		act->work[0]++;
		break;
	case 1:
		if(act->affend_sw==1){
			W_AffCheckEndSeq(act);
		}
		break;
	}
}

const actHeader DengekihaBallHeader =
{
	WAZACHR_ID_JUUDEN2,
	WAZACHR_ID_JUUDEN2,
	&WazaOamDataBldAffine[3],
	DummyActAnmTbl,
	ACT_NTRANS,
	Juden2AffAnmTbl,
	DengekihaBallActInit,
};
//================================================
// 攻撃→敵へのライン
//================================================
#define DL_TOP_Y     (4)
#define DL_BOTTOM_Y  (68)
#define DL_ANMCHAR_UNIT  (1)
#define DL_ANM_MAX       (7)
#define DL_ACTDISP_WAIT  (12)

enum DL_WORK {
	DL_SEQ,
	DL_TIMER,
	DL_LINE_CNT,
	DL_ACT_CNT,
	DL_ACT_ANM,
	DL_ANM_VEC,
	DL_ACT_X,
	DL_ACT_SY,
	DL_ACT_EY,
	DL_XSTEP,
	DL_DEFX,
	DL_WAIT_TIMER,
	DL_PAN_S,
	DL_PAN_E,
	DL_PAN,
	DL_PAN_ADD
};
static u8 add_dengekiha_line(TASK_TABLE *my, u8 id);

void TaskDengekihaLine(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[DL_SEQ]){
	case 0:
		my->work[DL_ACT_X] = GetWazaEffPos(AttackNo, PM_X);
		my->work[DL_ACT_SY] = GetWazaEffPos(AttackNo, PM_Y);
		my->work[DL_ACT_EY] = DL_TOP_Y;
		my->work[DL_DEFX] = GetWazaEffPos(DefenceNo, PM_X);
		my->work[DL_XSTEP] = (my->work[DL_DEFX] - my->work[DL_ACT_X]) / 5; //(GetWazaEffPos(DefenceNo, PM_X) - my->work[DL_ACT_X]) / 7;
		my->work[DL_ACT_ANM] = DL_ANM_MAX;
		my->work[DL_ANM_VEC] = -1;
		my->work[DL_WAIT_TIMER] = 12;
		my->work[DL_PAN_S] = GetWazaEffSePan(WAZA_SE_L);
		my->work[DL_PAN_E] = GetWazaEffSePan(WAZA_SE_R);
		my->work[DL_PAN] = my->work[DL_PAN_S];
		my->work[DL_PAN_ADD] = (my->work[DL_PAN_E]-my->work[DL_PAN_S])/3;
		my->work[DL_SEQ]++;
		break;

	case 1:
		if(++(my->work[DL_TIMER]) > 0){
			my->work[DL_TIMER] = 0;
			if(add_dengekiha_line(my, id)){
				if(my->work[DL_LINE_CNT] == 5){
					my->work[DL_SEQ] = 3;
				}else{
					my->work[DL_SEQ]++;
				}
			}
		}
		if(my->work[DL_WAIT_TIMER]){
			my->work[DL_WAIT_TIMER]--;
		}
		break;

	case 2:
		if(my->work[DL_WAIT_TIMER]){
			my->work[DL_WAIT_TIMER]--;
		}
		if(++(my->work[DL_TIMER]) > 4){
			my->work[DL_TIMER] = 0;
			if(my->work[DL_LINE_CNT] & 1){
				my->work[DL_ACT_SY] = DL_TOP_Y;
				my->work[DL_ACT_EY] = DL_BOTTOM_Y;
				my->work[DL_ACT_ANM] = 0;
				my->work[DL_ANM_VEC] = 1;
			}else{
				my->work[DL_ACT_SY] = DL_BOTTOM_Y;
				my->work[DL_ACT_EY] = DL_TOP_Y;
				my->work[DL_ACT_ANM] = DL_ANM_MAX;
				my->work[DL_ANM_VEC] = -1;
			}
			if(my->work[DL_WAIT_TIMER]){
				my->work[DL_SEQ] = 4;
				break;
			}
			my->work[DL_SEQ] = 1;
		}
		break;

	case 3:
		if(my->work[DL_ACT_CNT]==0){
			DelTaskEffect(id);
		}
		break;

	case 4:
		if(my->work[DL_WAIT_TIMER]){
			my->work[DL_WAIT_TIMER]--;
		}else{
			my->work[DL_SEQ] = 1;
		}
		break;
		
	}
}
static const actHeader DengekihaLineHeader;
static u8 add_dengekiha_line(TASK_TABLE *my, u8 id)
{
	u8 no;

	no = AddActor(&DengekihaLineHeader, my->work[DL_ACT_X], my->work[DL_ACT_SY], 35);
	if(no != ACT_MAX)
	{
		ActWork[no].oamData.CharNo += (my->work[DL_ACT_ANM] * DL_ANMCHAR_UNIT);
//		ActAnmChg(&ActWork[no], my->work[DL_ACT_ANM]);
		my->work[DL_ACT_ANM] += my->work[DL_ANM_VEC];
		if(my->work[DL_ACT_ANM] < 0){ my->work[DL_ACT_ANM] = DL_ANM_MAX; }
		if(my->work[DL_ACT_ANM] > DL_ANM_MAX){ my->work[DL_ACT_ANM] = 0; }
		ActWork[no].work[6] = id;
		ActWork[no].work[7] = DL_ACT_CNT;
		my->work[DL_ACT_CNT]++;
	}

	if(my->work[DL_ACT_ANM]==0 && my->work[DL_ANM_VEC]>0)
	{
		my->work[DL_PAN] += my->work[DL_PAN_ADD];
		SePlayPan(SE_W085, my->work[DL_PAN]);
	}
	

	if((my->work[DL_ANM_VEC] < 0 && my->work[DL_ACT_SY] <= my->work[DL_ACT_EY])
	|| (my->work[DL_ANM_VEC] > 0 && my->work[DL_ACT_SY] >= my->work[DL_ACT_EY])
	){
		my->work[DL_LINE_CNT]++;
		my->work[DL_ACT_X] += my->work[DL_XSTEP];
		return 1;
	}

	my->work[DL_ACT_SY] += (8 * my->work[DL_ANM_VEC]);
	return 0;
}
static void DengekihaLineActMove(actWork *act)
{
	if(++(act->work[0]) > DL_ACTDISP_WAIT)
	{
		TaskTable[act->work[6]].work[act->work[7]]--;
		DelActor(act);
	}
}
static const actHeader DengekihaLineHeader = {
	WAZACHR_ID_KAMINARI,
	WAZACHR_ID_KAMINARI,
	&WazaOamDataNormal[0],
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	DengekihaLineActMove,
};
//================================================
// 最後にカミナリが落ちる
//================================================
static u8 add_dengekiha_thunder(TASK_TABLE *my, u8 id);
static void dengekiha_thunder_move(actWork *act);

void TaskDengekihaThunder(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	case 0:
		my->work[15] = GetWazaEffPos(DefenceNo,EFF_Y) + 32;
		my->work[14] = my->work[15];
		while(my->work[14] > 16){
			my->work[14] -= 32;
		}
		my->work[13] = GetWazaEffPos(DefenceNo, PM_X);
		my->work[12] = GetPokeSoftPri(DefenceNo) - 2;
		my->work[0]++;
		break;

	case 1:
		if(++(my->work[1]) > 1){
			my->work[1] = 0;
			if(add_dengekiha_thunder(my,id)){
				my->work[0]++;
			}
		}
		break;

	case 2:
		if(my->work[10]==0){
			DelTaskEffect(id);
		}
		break;

	}

}
static u8 add_dengekiha_thunder(TASK_TABLE *my, u8 id)
{
	u8 no;

	no = AddActor(&ActKaminariHeader, my->work[13], my->work[14], my->work[12]);
	if(no != ACT_MAX)
	{
		ActWork[no].move = dengekiha_thunder_move;
		ActWork[no].work[6] = id;
		ActWork[no].work[7] = 10;
		my->work[10]++;
	}

	if(my->work[14] >= my->work[15]){
		return 1;
	}
	my->work[14] += 32;
	return 0;
}
static void dengekiha_thunder_move(actWork *act)
{
	if(act->anmend_sw == 1){
		TaskTable[act->work[6]].work[act->work[7]]--;
		DelActor(act);
	}
}
