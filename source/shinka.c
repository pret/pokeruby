
//======================================================
//    shinka.c                                           
//                                                      
//    Copyright (C) 2002 GAME FREAK inc.
//======================================================

#include "common.h"
#include "intr.h"		//add
#include "madefine.h"	//add
#include "decord.h"
#include "bss.h"
#include "server.h"
#include "client.h"
#include "actanm.h"
#include "actanm.def"
#include "print.h"		//add
#include "palanm.h"		//add
#include "task.h"		//add
#include "laster.h"		//add

#include "objdata.h"		//add
#include "multisio.h"		//add
#include "pokesio.h"
#include "cable.h"

#include "poketool.h"
#include "calctool.h"
#include "field.h"
#include "ev_fight.h"
#include "waza_tbl.h"
#include "fld_main.h"
#include "gauge.h"
#include "fight.h"		//add
#include "client_t.h"		//add
#include "cli_def.h"		//add
#include "a_enemy.h"		//add
#include "mus_tool.h"
#include "shinka.h"
#include "pm_str.h"
#include "fightmsg.h"
#include "zukan.h"
#include "record.h"
#include "param.h"
#include "fld_bgm.h"
#include "p_status.h"
#include "evo_demo.h"
#include "poketool.h"
#include "window.h"
#include "menutool.h"
#include "k_demo.h"

pFunc	ShinkaReturnProc;

void	InitShinka(PokemonParam *,u16,u8,u8);
void	InitShinkaAct(PokemonParam *,u16,u8,u8);
void	InitShinkaTuushin(PokemonParam *,u16,u8,u8);
void	MainShinka(void);
void	MainTuushinShinka(void);
void	ShinkaSequence(u8);
void	TuushinShinkaSequence(u8);
void	MorphigDataCalc(u8 *Badrs,u8 *Aadrs);
u8		MorphingAct(void);
void	MovePosSet(int,int,int);
void	WaitPosSet(int,int);

void	DotSet(int,u8);
void	DotReset(int,u8);
u8		DotMoveCheck(int,u8);

void	ShinkaAfterCheck(u16,PokemonParam *);

void	shinka_h_blank_intr(void);
void	shinka_v_blank_intr(void);

static void TuushinYesNoCsrOn();
static void TuushinYesNoCsrOff();
static void tuushinshinka_v_blank_intr(void);


extern	actHeader MineHeader; 
extern	actHeader PokeFTbl[];
extern	actHeader PokeBTbl[];

extern	void	VoicePlay(u16,s8);
extern	u8		VoicePlayWait(void);
extern  KOUKANDEMO_WORK	*kdw;

extern PokeShinkaData 	PSD[][5];
extern void BgSetTuushinShinka();

#define	SHINKA_X	0x78
#define	SHINKA_Y	0x40

enum{
	SS_SEQNO=0,
	SS_ADRSL,
	SS_ADRSH,
	SS_MONS1,
	SS_MONS2,
	SS_FLAG,
	SS_CNT_FLAG,
	SS_WAIT,
	SS_WAZAOBOE_SEQNO,
	SS_A_ACT,
	SS_B_ACT,
	SS_CANCEL,
	SS_SELMONSNO,
};


//モーフィングメインアクトシーケンスナンバー
enum{
	SEQ_DOTMOVESTOP=0,
	SEQ_DOTMOVELEFT_PSET,
	SEQ_DOTMOVELEFT_PRESET,
	SEQ_DOTMOVERIGHT_PSET,
	SEQ_DOTMOVERIGHT_PRESET,
	SEQ_DOTWAITLEFT_PSET,
	SEQ_DOTWAITLEFT_PRESET,
	SEQ_DOTWAITRIGHT_PSET,
	SEQ_DOTWAITRIGHT_PRESET,
	SEQ_DOTGOLEFT_PSET,
	SEQ_DOTGOLEFT_PRESET,
	SEQ_DOTGORIGHT_PSET,
	SEQ_DOTGORIGHT_PRESET,
};

enum{
		MSG_END=0,
		MSG_START,
		MSG_WRITE,
		MSG_WAIT,
		MSG_KEYWAIT,
		MSG_CR,
};

//===============================================================================
//
//		InitShinka		ポケモン進化デモ
//
//	in	:	PP			ポケモンの構造体ポインタ
//			aftermons	進化後ポケモンナンバー
//			flag		進化キャンセルフラグ（0:キャンセル可能1:キャンセル不可）
//			selmonsno	何番目のポケモンか
//			
//===============================================================================

void	InitShinkaTask(void)
{
	PaletteAnime();
	MainTask();
}

void	InitShinkaTaskSequence(u8 no)
{
	PokemonParam *PP=0;
	u16	aftermons;
	u8	flag;
	u8	selmonsno;

	switch(TaskTable[no].work[SS_SEQNO]){
		case 0:
			PaletteFadeReq(0xffffffff, 0,0,16, 0);
			TaskTable[no].work[SS_SEQNO]++;
			break;
		case 1:
			if(FadeData.fade_sw==0){
				PP=(PokemonParam *)(TaskTable[no].work[SS_ADRSL]|(TaskTable[no].work[SS_ADRSH]<<16));
				aftermons=TaskTable[no].work[SS_MONS2];
				flag=TaskTable[no].work[SS_FLAG];
				selmonsno=TaskTable[no].work[SS_SELMONSNO];
				DelTask(no);
				InitShinkaAct(PP,aftermons,flag,selmonsno);
			}
			break;
	}
}

void	InitShinka(PokemonParam *PP,u16 aftermons,u8 flag,u8 selmonsno)
{
	u8	no;

	no=AddTask(InitShinkaTaskSequence,0);
	TaskTable[no].work[SS_SEQNO]=0;
	TaskTable[no].work[SS_ADRSL]=(s16)((u32)PP);
	TaskTable[no].work[SS_ADRSH]=(s16)((u32)PP >> 16);
	TaskTable[no].work[SS_MONS2]=aftermons;
	TaskTable[no].work[SS_FLAG]=flag;
	TaskTable[no].work[SS_SELMONSNO]=selmonsno;
	MainProcChange(InitShinkaTask);
}


void	InitShinkaAct(PokemonParam *PP,u16 aftermons,u8 flag,u8 selmonsno)
{
	u8	no;
	u16	beforemons;
	u32 id_no,personal_rnd;
	PalData *pd;
	u8	buff[20];

	SetHBlankFunc(NULL);
	SetVBlankFunc(NULL);

	CpuClear(0,VRAM,(VRAM_END-VRAM),32);
	*(vu16*)REG_MOSAIC = 0;
	*(vu16*)REG_WIN0H = 0;
	*(vu16*)REG_WIN0V = 0;
	*(vu16*)REG_WIN1H = 0;
	*(vu16*)REG_WIN1V = 0;
	*(vu16*)REG_WININ = 0;
	*(vu16*)REG_WINOUT = 0;

	PrintScreenInit(FIGHT_TYPE);
	PaletteAnimeInit();

	ScrX0=0;
	ScrY0=0;
	ScrX1=0;
	ScrY1=0;
	ScrX2=0;
	ScrY2=0;
	ScrX3=0x100;
	ScrY3=0;

	MsgControlInit(&FightMsg,FIGHT_TYPE);	//change 2001.07.12(木) by matsuda

	GroundNo=GROUND_ALL;
	FightREGSet();
	FightBGSetAll();

	InitActor();
	LasterInit();
	InitTask();
	ObjPalManInit();
	ObjPalManStart=4;	// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬNo開始 ここに移動 by matsuda 2001.09.26(水)

	PokeParaGet(PP,ID_nickname,buff);
	NickNameCopy(StrTempBuffer0,buff);
	PM_strcpy(StrTempBuffer1,PokeNameData[aftermons]);

	beforemons   = PokeParaGet(PP,ID_monsno);
	id_no        = PokeParaGet(PP,ID_id_no);
	personal_rnd = PokeParaGet(PP,ID_personal_rnd);


	DecordPokeCellMake(&PM2FObjDataCell[beforemons], pm2fpara[beforemons].size,
				pm2fpara[beforemons].patcnt, (void*)0x2000000,(void*)DecordAdrs[1],beforemons);
//	DecordPaletteWork((void*)PM2NObjDataPal[beforemons].pal_data,
//		PA_OBJ0 + 0x10 * 1, 0x20);
	pd = (PalData*)PokePalDataGetPara(beforemons,id_no,personal_rnd);
	DecordPaletteWork((void*)pd->pal_data,PA_OBJ0 + 0x10 * 1, 0x20);


	PokeActHeaderMake(beforemons,1);
	PokeActHeader.affData_p = DummyActAffTbl;
	MD->BeforeMonsActor=no=AddActor(&PokeActHeader,SHINKA_X,SHINKA_Y,C_POKE1PRI);
	ActWork[no].move=SeqEnemyPokeWaitMain;
	ActWork[no].oamData.Pltt=1;
	ActWork[no].banish=1;

	DecordPokeCellMake(&PM2FObjDataCell[aftermons], pm2fpara[aftermons].size,
				pm2fpara[aftermons].patcnt, (void*)0x2000000,(void*)DecordAdrs[3],aftermons);
//	DecordPaletteWork((void*)PM2NObjDataPal[aftermons].pal_data,
//		PA_OBJ0 + 0x10 * 2, 0x20);
	pd = (PalData*)PokePalDataGetPara(aftermons,id_no,personal_rnd);
	DecordPaletteWork((void*)pd->pal_data,PA_OBJ0 + 0x10 * 2, 0x20);
	PokeActHeaderMake(aftermons,3);
	PokeActHeader.affData_p = DummyActAffTbl;
	MD->AfterMonsActor=no=AddActor(&PokeActHeader,SHINKA_X,SHINKA_Y,C_POKE1PRI);
	ActWork[no].move=SeqEnemyPokeWaitMain;
	ActWork[no].oamData.Pltt=2;
	ActWork[no].banish=1;

	EvoDemoPartsInit();

	MD->ShinkaTaskNo=no=AddTask(ShinkaSequence,0);
	TaskTable[no].work[SS_SEQNO]=0;
	TaskTable[no].work[SS_MONS1]=beforemons;
	TaskTable[no].work[SS_MONS2]=aftermons;
	TaskTable[no].work[SS_ADRSL]=(s16)((u32)PP);
	TaskTable[no].work[SS_ADRSH]=(s16)((u32)PP >> 16);
	TaskTable[no].work[SS_FLAG]=flag;
	TaskTable[no].work[SS_CNT_FLAG]=1;
	TaskTable[no].work[SS_CANCEL]=0;
	TaskTable[no].work[SS_SELMONSNO]=selmonsno;

//	memcpy((void *)0x2008000,(void*)DecordAdrs[1],0x800);
	memcpy((void *)0x2009000,&PaletteWork[PA_BG2],0x60);

	*(vu16 *)REG_DISPCNT=
		DISP_MODE_0|DISP_BG0_ON|DISP_BG1_ON|DISP_BG2_ON|DISP_BG3_ON|DISP_OBJ_ON|DISP_OBJ_CHAR_1D_MAP;
	SetHBlankFunc(shinka_h_blank_intr);
	SetVBlankFunc(shinka_v_blank_intr);
	m4aMPlayAllStop();

	MainProcChange(MainShinka);
}

void	ShinkaRecover(void)
{
	u16	aftermons;
	u32 id_no,personal_rnd;
	u8	no;
	PokemonParam *PP;
	PalData *pd;

	PP           = &PokeParaMine[TaskTable[MD->ShinkaTaskNo].work[SS_SELMONSNO]];
	aftermons    = TaskTable[MD->ShinkaTaskNo].work[SS_MONS2];
	id_no        = PokeParaGet(PP,ID_id_no);
	personal_rnd = PokeParaGet(PP,ID_personal_rnd);

	SetHBlankFunc(NULL);
	SetVBlankFunc(NULL);

	CpuClear(0,VRAM,(VRAM_END-VRAM),32);
	*(vu16*)REG_MOSAIC = 0;
	*(vu16*)REG_WIN0H = 0;
	*(vu16*)REG_WIN0V = 0;
	*(vu16*)REG_WIN1H = 0;
	*(vu16*)REG_WIN1V = 0;
	*(vu16*)REG_WININ = 0;
	*(vu16*)REG_WINOUT = 0;

	PrintScreenInit(FIGHT_TYPE);
	PaletteAnimeInit();

	ScrX0=0;
	ScrY0=0;
	ScrX1=0;
	ScrY1=0;
	ScrX2=0;
	ScrY2=0;
	ScrX3=0x100;
	ScrY3=0;

	MsgControlInit(&FightMsg,FIGHT_TYPE);	//change 2001.07.12(木) by matsuda

	GroundNo=GROUND_ALL;
	FightREGSet();
	FightBGSetAll();

	InitActor();
	ObjPalManInit();
	ObjPalManStart=4;	// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬNo開始 ここに移動 by matsuda 2001.09.26(水)

	DecordPokeCellMake(&PM2FObjDataCell[aftermons], pm2fpara[aftermons].size,
				pm2fpara[aftermons].patcnt, (void*)0x2000000,(void*)DecordAdrs[3],aftermons);
//	DecordPaletteWork((void*)PM2NObjDataPal[aftermons].pal_data,
//		PA_OBJ0 + 0x10 * 2, 0x20);
	pd = (PalData*)PokePalDataGetPara(aftermons,id_no,personal_rnd);
	DecordPaletteWork((void*)pd->pal_data,PA_OBJ0 + 0x10 * 2, 0x20);
	PokeActHeaderMake(aftermons,3);
	PokeActHeader.affData_p = DummyActAffTbl;
	MD->AfterMonsActor=no=AddActor(&PokeActHeader,SHINKA_X,SHINKA_Y,C_POKE1PRI);
	ActWork[no].move=SeqEnemyPokeWaitMain;
	ActWork[no].oamData.Pltt=2;

	*(vu16 *)REG_DISPCNT=
		DISP_MODE_0|DISP_BG0_ON|DISP_BG1_ON|DISP_BG2_ON|DISP_BG3_ON|DISP_OBJ_ON|DISP_OBJ_CHAR_1D_MAP;
	SetHBlankFunc(shinka_h_blank_intr);
	SetVBlankFunc(shinka_v_blank_intr);

	MainProcChange(MainShinka);
	PaletteFadeReq(0xffffffff,0,16, 0, 0);
}

void	ShinkaTuushinRecover(void)
{
	u8	no;
	u16 aftermons;
	u32 id_no,personal_rnd;
	PokemonParam *PP;
	PalData *pd;

	PP           = &PokeParaMine[TaskTable[MD->ShinkaTaskNo].work[SS_SELMONSNO]];
	aftermons    = TaskTable[MD->ShinkaTaskNo].work[SS_MONS2];

	switch(sys.InitSeqWork){
		case 0:
			*(vu16*)REG_DISPCNT = 0;

			SetHBlankFunc(NULL);
			SetVBlankFunc(NULL);

			InitActor();
			ObjPalManInit();
			ObjPalManStart=4;	// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬNo開始 ここに移動 by matsuda 2001.09.26(水)
			ScrX0=0;
			ScrY0=0;
			ScrX1=0;
			ScrY1=0;
			ScrX2=0;
			ScrY2=0;
			ScrX3=0x100;
			ScrY3=0;
			sys.InitSeqWork++;
			break;
		
		case 1:
			PrintScreenInit(KOUKAN_TYPE);
			MsgControlInit(&(kdw->tw), KOUKAN_TYPE);
			sys.InitSeqWork++;
			break;
		case 2:
			NWinFrameDataSet(&(kdw->tw));
			kdw->windowwork = NWinFrameInit(2);
			NWinFrameDataSet(&(kdw->tw));
			NMenuScreenClear();
			PaletteAnimeInit();
			sys.InitSeqWork++;
			SetHBlankFunc(shinka_h_blank_intr);
			SetVBlankFunc(tuushinshinka_v_blank_intr);
			break;

		case 3:
			BgSetTuushinShinka();
			sys.InitSeqWork++;
			break;


		case 4:
			id_no        = PokeParaGet(PP,ID_id_no);
			personal_rnd = PokeParaGet(PP,ID_personal_rnd);
			DecordPokeCellMake(&PM2FObjDataCell[aftermons], pm2fpara[aftermons].size,
					pm2fpara[aftermons].patcnt, (void*)0x2000000,(void*)DecordAdrs[3],aftermons);
			pd = (PalData*)PokePalDataGetPara(aftermons,id_no,personal_rnd);
			DecordPaletteWork((void*)pd->pal_data,PA_OBJ0 + 0x10 * 2, 0x20);
			sys.InitSeqWork++;
			break;
		case 5:
			PokeActHeaderMake(aftermons,3);
			PokeActHeader.affData_p = DummyActAffTbl;
			MD->AfterMonsActor=no=AddActor(&PokeActHeader,SHINKA_X,SHINKA_Y,C_POKE1PRI);
			ActWork[no].move=SeqEnemyPokeWaitMain;
			ActWork[no].oamData.Pltt=2;
			sys.InitSeqWork++;
			break;
		case 6:
			PaletteFadeReq(0xffffffff,0,16, 0, 0);
			MainProcChange(MainTuushinShinka);
			*(vu16 *)REG_DISPCNT = DISP_MODE_0|DISP_BG0_ON|DISP_BG1_ON|DISP_OBJ_ON|DISP_OBJ_CHAR_1D_MAP;
			break;
	}
}


void	InitShinkaTuushin(PokemonParam *PP,u16 aftermons,u8 actno,u8 selmonsno)
{
	u8	no;
	u16	beforemons;
	u32 personal_rnd,id_no;
	PalData *pd;
	u8	buff[20];

	PokeParaGet(PP,ID_nickname,buff);
	NickNameCopy(StrTempBuffer0,buff);
	PM_strcpy(StrTempBuffer1,PokeNameData[aftermons]);
	AffAnmStopFlag = 1;

	beforemons=PokeParaGet(PP,ID_monsno);
	personal_rnd  = PokeParaGet(PP,ID_personal_rnd);
	id_no         = PokeParaGet(PP,ID_id_no);

	MD->BeforeMonsActor=actno;

	//通信進化用に調整中	2002.09.01
//	DecordPokeCellMake(&PM2FObjDataCell[aftermons], pm2fpara[aftermons].size,
//				pm2fpara[aftermons].patcnt, (void*)0x2000000,(void*)DecordAdrs[3],aftermons);
	DecordPokeCellMake(&PM2FObjDataCell[aftermons], pm2fpara[aftermons].size,
				pm2fpara[aftermons].patcnt, (void*)0x2000000,(void*)DecordAdrs[1],aftermons);
	pd = (PalData*)PokePalDataGetPara(aftermons,id_no,personal_rnd);
	DecordPaletteWork((void*)pd->pal_data,PA_OBJ0 + 0x10 * 2, 0x20);

	PokeActHeaderMake(aftermons,1);
	PokeActHeader.affData_p = DummyActAffTbl;
	MD->AfterMonsActor=no=AddActor(&PokeActHeader,SHINKA_X,SHINKA_Y,C_POKE1PRI);
	ActWork[no].move=SeqEnemyPokeWaitMain;
	ActWork[no].oamData.Pltt=2;						
	ActWork[no].banish=1;

	EvoDemoPartsInit();

	MD->ShinkaTaskNo=no=AddTask(TuushinShinkaSequence,0);
	TaskTable[no].work[SS_SEQNO]=0;
	TaskTable[no].work[SS_MONS1]=beforemons;
	TaskTable[no].work[SS_MONS2]=aftermons;
	TaskTable[no].work[SS_ADRSL]=(s16)((u32)PP);
	TaskTable[no].work[SS_ADRSH]=(s16)((u32)PP >> 16);
	TaskTable[no].work[SS_CNT_FLAG]=1;
	TaskTable[no].work[SS_CANCEL]=0;
	TaskTable[no].work[SS_SELMONSNO]=selmonsno;

//	memcpy((void *)0x2009000,&PaletteWork[PA_BG2],0x60);

//	*(vu16 *)REG_DISPCNT=
//		DISP_MODE_0|DISP_BG0_ON|DISP_BG1_ON|DISP_BG2_ON|DISP_BG3_ON|DISP_OBJ_ON|DISP_OBJ_CHAR_1D_MAP;
	MainProcChange(MainTuushinShinka);
}


void	MainShinka(void)
{
	JumpActor();
	SetActor();
	BattleTalkMsgPut(&FightMsg);
	PaletteAnime();
	MainTask();
}

void MainTuushinShinka(void)
{

	JumpActor();
	SetActor();
	TalkMsgPut(&kdw->tw);
	PaletteAnime();
	MainTask();
}

void	ShinkaAfterCheck(u16 monsno,PokemonParam *PP)
{
	int	i;
	u32	work=0;

	if((PSD[monsno][0].ShinkaCond==SHINKA_SPECIAL_LEVELUP)&&
	   (PokeCountMine<6)){
		AddPokemonAct(&PokeParaMine[PokeCountMine],
					  PP,
					  sizeof(PokemonParam));
		PokeParaPut(&PokeParaMine[PokeCountMine],
					ID_monsno,
					(u8 *)&PSD[monsno][1].ShinkaMons);
		PokeParaPut(&PokeParaMine[PokeCountMine],
					ID_nickname,
					(u8 *)&PokeNameData[PSD[monsno][1].ShinkaMons]);
		PokeParaPut(&PokeParaMine[PokeCountMine],
					ID_item,
					(u8 *)&work);
		PokeParaPut(&PokeParaMine[PokeCountMine],
					ID_mark,
					(u8 *)&work);
		PokeParaPut(&PokeParaMine[PokeCountMine],
					ID_amari,
					(u8 *)&work);
		for(i=ID_stylemedal;i<ID_strongmedal+1;i++)
			PokeParaPut(&PokeParaMine[PokeCountMine],
						i,
						(u8 *)&work);
		for(i=ID_champ_ribbon;i<ID_amari_ribbon+1;i++)
			PokeParaPut(&PokeParaMine[PokeCountMine],
						i,
						(u8 *)&work);
		PokeParaPut(&PokeParaMine[PokeCountMine],
					ID_condition,
					(u8 *)&work);
		work=NON_MAIL;
		PokeParaPut(&PokeParaMine[PokeCountMine],
					ID_mailid,
					(u8 *)&work);
		PokeParaCalc(&PokeParaMine[PokeCountMine]);
		PokeCountMineGet();
		ZukanCheck(PokeMonsNo2ZukanNoGet(PSD[monsno][1].ShinkaMons),
				   Z_SEE_SET);
		ZukanCheck(PokeMonsNo2ZukanNoGet(PSD[monsno][1].ShinkaMons),
				   Z_GET_SET);
	}
}


enum{
	SEQ_FADE=0,
	SEQ_MESSAGE,
	SEQ_NAKIGOE,
	SEQ_SE,
	SEQ_BGM,
	SEQ_FADE_WAIT,
	SEQ_MORPHING_INIT,
	SEQ_MORPHING_WAIT,
	SEQ_MORPHING,
	SEQ_EVO_EFFECT_WAIT,
	SEQ_EVO_EFFECT1,
	SEQ_EVO_EFFECT2,
	SEQ_FADE_WAIT2,
	SEQ_MORPHING_END,
	SEQ_SHINKA_END,
	SEQ_JOB_END,
	SEQ_SHINKA_CANCEL,
	SEQ_SHINKA_CANCEL_WAIT,
	SEQ_SHINKA_CANCEL_MESSAGE,
	SEQ_SHINKA_WAZA_OBOE,
	SEQ_SHINKA_WAZA_OBOE_WAIT,
	SEQ_SHINKA_WAZA_WASURE,
	SEQ_SHINKA_WAZA_AKIRAME,
	SEQ_SHINKA_WAZA_ALERT,
};

enum{
	SSWW_MSG1=0,
	SSWW_MSG2,
	SSWW_MSG3,
	SSWW_SELECT_INIT,
	SSWW_SELECT,
	SSWW_WAZA_SELECT_INIT,
	SSWW_WAZA_SELECT,
	SSWW_WAZA_WASURE_MSG1,
	SSWW_WAZA_WASURE_MSG2,
	SSWW_WAZA_AKIRAME_INIT,
	SSWW_WAZA_AKIRAME,
	SSWW_WAZA_ALERT,
};

//const u32 DecordAdrs[]={0x2008000,0x200c000,0x2010000,0x2014000};

void	ShinkaSequence(u8 no)
{
	int	i=0;
	PokemonParam *PP;
	u16	wazano=0;
	u8	buff[20];

	PP=(PokemonParam *)(TaskTable[no].work[SS_ADRSL]|(TaskTable[no].work[SS_ADRSH]<<16));

	if((sys.Cont==B_BUTTON)&&
	   (TaskTable[no].work[SS_SEQNO]==SEQ_MORPHING)&&
	   (TaskTable[no].work[SS_FLAG]&SHINKA_CANCEL_ON)){
		TaskTable[no].work[SS_SEQNO]=SEQ_SHINKA_CANCEL;
		if(TaskTable[ServerWork[2]].occ)
			TaskTable[ServerWork[2]].work[EVD_CANCEL]=1;
	}

	switch(TaskTable[no].work[SS_SEQNO]){
		case SEQ_FADE:
			PaletteFadeReq(0xffffffff, 0,16, 0, 0);
			ActWork[MD->BeforeMonsActor].banish=0;
			TaskTable[no].work[SS_SEQNO]++;
			break;
		case SEQ_MESSAGE:
			if(FadeData.fade_sw==0){
				PM_MsgExpand(MsgExpandBuffer,ShinkaBeforeMsg);
				TalkMsgSet(&FightMsg,MsgExpandBuffer,CGX_START+0x10,2,15);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ_NAKIGOE:
			if(FightMsg.status==MSG_END){
				VoicePlay(TaskTable[no].work[SS_MONS1],0);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ_SE:
			if(VoicePlayWait()){
				SePlay(MUS_ME_SHINKA);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ_BGM:
			if(SeEndCheck()==0){
				BGM_PlaySet(MUS_SHINKA);
				TaskTable[no].work[SS_SEQNO]++;
				PaletteFadeReq(0x0000001c,4,0,16,0);
			}
			break;
		case SEQ_FADE_WAIT:
			if(FadeData.fade_sw == 0){
				ServerWork[2]=EvoPartsDemoPart1Set(17);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ_MORPHING_INIT:
			if(TaskTable[ServerWork[2]].occ==0){
//				MorphigDataCalc((u8 *)DecordAdrs[1],(u8 *)DecordAdrs[3]);
				TaskTable[no].work[SS_SEQNO]++;
				MD->Wait=1;
				ServerWork[2]=EvoPartsDemoPart2Set();
			}
			break;
		case SEQ_MORPHING_WAIT:
			if(TaskTable[ServerWork[2]].occ==0){
				ServerWork[2]=EvoMainDemoSet(MD->BeforeMonsActor,MD->AfterMonsActor);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ_MORPHING:
			if(--MD->Wait==0){
				MD->Wait=3;
//				ActWork[MD->BeforeMonsActor].anm_no=0;
//				ActWork[MD->BeforeMonsActor].anm_sw=1;
//				ActWork[MD->BeforeMonsActor].anmend_sw=0;
//				if(MorphingAct()){
				if(TaskTable[ServerWork[2]].occ==0){
					TaskTable[no].work[SS_SEQNO]++;
//					ActWork[MD->BeforeMonsActor].banish=1;
//					ActWork[MD->AfterMonsActor].banish=0;
				}
			}
			break;
		case SEQ_EVO_EFFECT_WAIT:
			ServerWork[2]=EvoPartsDemoPart3Set();
			TaskTable[no].work[SS_SEQNO]++;
			break;
		case SEQ_EVO_EFFECT1:
			if(TaskTable[ServerWork[2]].occ==0){
				ServerWork[2]=
				EvoPartsDemoPart4Set(TaskTable[no].work[SS_MONS2]);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ_EVO_EFFECT2:
			if(TaskTable[ServerWork[2]].occ==0){
				SePlay(SE_EXP);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ_FADE_WAIT2:
			if(SeEndCheck()){		//2002.08.19 by 森　SEが終端がなかった時用に
//			if(FadeData.fade_sw == 0){
				m4aMPlayAllStop();
				VoicePlay(TaskTable[no].work[SS_MONS2],0);
				memcpy(&PaletteWork[PA_BG2],(void *)0x2009000,0x60);
				PaletteFadeReq(0x0000001c, 0, 16, 0, 0);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ_MORPHING_END:
			if(VoicePlayWait()&&(FadeData.fade_sw == 0)){
				PM_MsgExpand(MsgExpandBuffer,ShinkaAfterMsg);
				TalkMsgSet(&FightMsg,MsgExpandBuffer,CGX_START+0x10,2,15);
				MusicPlay(MUS_FANFA5);
				TaskTable[no].work[SS_SEQNO]++;
				PokeParaPut(PP,ID_monsno,(u8 *)&TaskTable[no].work[SS_MONS2]);
				PokeParaCalc(PP);
				PokeParaNickNameSet(PP,
									TaskTable[no].work[SS_MONS1],
									TaskTable[no].work[SS_MONS2]);
				ZukanCheck(PokeMonsNo2ZukanNoGet(TaskTable[no].work[SS_MONS2]),Z_SEE_SET);
				ZukanCheck(PokeMonsNo2ZukanNoGet(TaskTable[no].work[SS_MONS2]),Z_GET_SET);
				//進化した回数記録をカウントアップ
				IncRecord(CNT_SHINKA);
			}
			break;
		case SEQ_SHINKA_END:
			if(FightMsg.status==MSG_END){
				if((i=PokeWazaOboeCheck(PP,TaskTable[no].work[SS_CNT_FLAG]))&&
				   (TaskTable[no].work[SS_CANCEL]==0)){
					MapBGM_Start();
					TaskTable[no].work[SS_FLAG]|=SHINKA_BGM_RESTART_OFF;
					TaskTable[no].work[SS_CNT_FLAG]=0;
					TaskTable[no].work[SS_WAZAOBOE_SEQNO]=0;
					PokeParaGet(PP,ID_nickname,buff);
					NickNameCopy(EvStrBuf0,buff);
					if(i==NO_WAZA_SET)
						TaskTable[no].work[SS_SEQNO]=SEQ_SHINKA_WAZA_WASURE;
					else if(i==SAME_WAZA_SET)
						break;
					else
						TaskTable[no].work[SS_SEQNO]=SEQ_SHINKA_WAZA_OBOE;
				}
				else{
					PaletteFadeReq(0xffffffff, 0, 0, 16, 0);
					TaskTable[no].work[SS_SEQNO]++;
				}
			}
			break;
		case SEQ_JOB_END:
			if(FadeData.fade_sw == 0){
				if((TaskTable[no].work[SS_FLAG]&SHINKA_BGM_RESTART_OFF)==0)
					MapBGM_Start();
				if(TaskTable[no].work[SS_CANCEL]==0)
					ShinkaAfterCheck(TaskTable[no].work[SS_MONS1],PP);
				DelTask(no);
				MainProcChange(ShinkaReturnProc);
			}
			break;
		case SEQ_SHINKA_CANCEL:
			if(TaskTable[ServerWork[2]].occ==0){
				m4aMPlayAllStop();
//				memcpy((void *)DecordAdrs[1],(void*)0x2008000,0x800);
//				ActWork[MD->BeforeMonsActor].anm_no=0;
//				ActWork[MD->BeforeMonsActor].anm_sw=1;
//				ActWork[MD->BeforeMonsActor].anmend_sw=0;
				PaletteFadeReq(0x0006001c,0,16,0,0x7fff);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ_SHINKA_CANCEL_WAIT:
			if(FadeData.fade_sw == 0){
				VoicePlay(TaskTable[no].work[SS_MONS1],0);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ_SHINKA_CANCEL_MESSAGE:
			if(VoicePlayWait()){
				PM_MsgExpand(MsgExpandBuffer,ShinkaCancelMsg);
				TalkMsgSet(&FightMsg,MsgExpandBuffer,CGX_START+0x10,2,15);
				TaskTable[no].work[SS_CANCEL]=1;
				TaskTable[no].work[SS_SEQNO]=SEQ_SHINKA_END;
			}
			break;
		case SEQ_SHINKA_WAZA_OBOE:
			if((FightMsg.status==MSG_END)&&(SeEndCheck()==0)){
				OboeWazaNoSet();
				JinglePlay(MUS_FANFA1);
				FightMsgCreate((u8 *)FightMsgTbl[WAZAOBOEMSGNO-MSG_TBL_START]);
				TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
				TaskTable[no].work[SS_CNT_FLAG]=0x40;
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ_SHINKA_WAZA_OBOE_WAIT:
			if((FightMsg.status==MSG_END)&&(SeEndCheck()==0)){
				if(--TaskTable[no].work[SS_CNT_FLAG]==0)
					TaskTable[no].work[SS_SEQNO]=SEQ_SHINKA_END;
			}
			break;
		case SEQ_SHINKA_WAZA_WASURE:
			switch(TaskTable[no].work[SS_WAZAOBOE_SEQNO]){
				case SSWW_MSG1:
					if((FightMsg.status==MSG_END)&&(SeEndCheck()==0)){
						OboeWazaNoSet();
						FightMsgCreate((u8 *)FightMsgTbl[WAZAOBOEMSG2NO-MSG_TBL_START]);
						TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
						TaskTable[no].work[SS_WAZAOBOE_SEQNO]++;
					}
					break;
				case SSWW_MSG2:
					if((FightMsg.status==MSG_END)&&(SeEndCheck()==0)){
						FightMsgCreate((u8 *)FightMsgTbl[WAZAOBOEMSG3NO-MSG_TBL_START]);
						TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
						TaskTable[no].work[SS_WAZAOBOE_SEQNO]++;
					}
					break;
				case SSWW_MSG3:
					if((FightMsg.status==MSG_END)&&(SeEndCheck()==0)){
						FightMsgCreate((u8 *)FightMsgTbl[WAZAWASUREMSGNO-MSG_TBL_START]);
						TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
						TaskTable[no].work[SS_A_ACT]=SSWW_WAZA_SELECT_INIT;
						TaskTable[no].work[SS_B_ACT]=SSWW_WAZA_AKIRAME_INIT;
						TaskTable[no].work[SS_WAZAOBOE_SEQNO]++;
					}
				case SSWW_SELECT_INIT:
					if((FightMsg.status==MSG_END)&&(SeEndCheck()==0)){
						WindowOpen(WIN_X1,WIN_Y1,WIN_X2,WIN_Y2,0);
						MsgPutSet(&FightMsg,YesNoMsg,CGX_START+0x80,WIN_X1+2,WIN_Y1+1);
						MsgPut(&FightMsg);
						TaskTable[no].work[SS_WAZAOBOE_SEQNO]++;
						ServerWork[1]=0;
						YesNoCsrOn();
					}
					break;
				case SSWW_SELECT:
					if((sys.Trg&U_KEY)==U_KEY){
						if(ServerWork[1]){
							SePlay(SE_SELECT);
							YesNoCsrOff();
							ServerWork[1]=0;
							YesNoCsrOn();
						}
					}
					if((sys.Trg&D_KEY)==D_KEY){
						if(ServerWork[1]==0){
							SePlay(SE_SELECT);
							YesNoCsrOff();
							ServerWork[1]=1;
							YesNoCsrOn();
						}
					}
					if((sys.Trg&A_BUTTON)==A_BUTTON){
						WindowOpen(WIN_X1,WIN_Y1,WIN_X2,WIN_Y2,1);
						FightMsgCreate((u8 *)FightMsgTbl[BLANKMSGNO-MSG_TBL_START]);
						TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
						SePlay(SE_SELECT);
						if(ServerWork[1])
							TaskTable[no].work[SS_WAZAOBOE_SEQNO]=TaskTable[no].work[SS_B_ACT];
						else{
							TaskTable[no].work[SS_WAZAOBOE_SEQNO]=TaskTable[no].work[SS_A_ACT];
							if(TaskTable[no].work[SS_WAZAOBOE_SEQNO]==SSWW_WAZA_SELECT_INIT)
								PaletteFadeReq(0xffffffff, 0, 0, 16, 0);
						}
					}
					if((sys.Trg&B_BUTTON)==B_BUTTON){
						WindowOpen(WIN_X1,WIN_Y1,WIN_X2,WIN_Y2,1);
						FightMsgCreate((u8 *)FightMsgTbl[BLANKMSGNO-MSG_TBL_START]);
						TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
						SePlay(SE_SELECT);
						TaskTable[no].work[SS_WAZAOBOE_SEQNO]=TaskTable[no].work[SS_B_ACT];
					}
					break;
				case SSWW_WAZA_SELECT_INIT:
					if(FadeData.fade_sw == 0){
						PokeNewWazaSet(&PokeParaMine,
									   TaskTable[no].work[SS_SELMONSNO],
									   PokeCountMine-1,
									   ShinkaRecover,
									   OboeWazaNo);
						TaskTable[no].work[SS_WAZAOBOE_SEQNO]++;
					}
					break;
				case SSWW_WAZA_SELECT:
					if((FadeData.fade_sw==0)&&(sys.pMainProc==MainShinka)){
						i=GetNewWazaSelectPos();
						if(i==4)
							TaskTable[no].work[SS_WAZAOBOE_SEQNO]=SSWW_WAZA_AKIRAME_INIT;
						else{
							wazano=PokeParaGet(PP,ID_waza1+i);

							if(HidenWazaCheck(wazano)){
								FightMsgCreate((u8 *)FightMsgTbl[NOWAZAWASUREMSGNO-MSG_TBL_START]);
								TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
								TaskTable[no].work[SS_WAZAOBOE_SEQNO]=SSWW_WAZA_ALERT;
								return;
							}

							EvStrBuf1[0]=I_MSG;
							EvStrBuf1[1]=EV_WAZANO;
							EvStrBuf1[2]=wazano&0xff;
							EvStrBuf1[3]=(wazano&0xff00)>>8;
							EvStrBuf1[4]=EOM_;

							PokePPCountClear(PP,i);
							PokeWazaSetPos(PP,OboeWazaNo,i);
							FightMsgCreate((u8 *)FightMsgTbl[WAZAWASUREMSG2NO-MSG_TBL_START]);
							TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
							TaskTable[no].work[SS_WAZAOBOE_SEQNO]++;
						}
					}
					break;
				case SSWW_WAZA_WASURE_MSG1:
					if((FightMsg.status==MSG_END)&&(SeEndCheck()==0)){
						FightMsgCreate((u8 *)FightMsgTbl[WAZAWASUREMSG3NO-MSG_TBL_START]);
						TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
						TaskTable[no].work[SS_WAZAOBOE_SEQNO]++;
					}
					break;
				case SSWW_WAZA_WASURE_MSG2:
					if((FightMsg.status==MSG_END)&&(SeEndCheck()==0)){
						FightMsgCreate((u8 *)FightMsgTbl[WAZAWASUREMSG4NO-MSG_TBL_START]);
						TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
						TaskTable[no].work[SS_SEQNO]=SEQ_SHINKA_WAZA_OBOE;
					}
					break;
				case SSWW_WAZA_AKIRAME_INIT:
					FightMsgCreate((u8 *)FightMsgTbl[WAZAAKIRAMEMSGNO-MSG_TBL_START]);
					TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
					TaskTable[no].work[SS_A_ACT]=SSWW_WAZA_AKIRAME;
					TaskTable[no].work[SS_B_ACT]=SSWW_MSG1;
					TaskTable[no].work[SS_WAZAOBOE_SEQNO]=SSWW_SELECT_INIT;
					break;
				case SSWW_WAZA_AKIRAME:
					FightMsgCreate((u8 *)FightMsgTbl[WAZAAKIRAMEMSG2NO-MSG_TBL_START]);
					TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
					TaskTable[no].work[SS_SEQNO]=SEQ_SHINKA_END;
					break;
				case SSWW_WAZA_ALERT:
					if((FightMsg.status==MSG_END)&&(SeEndCheck()==0))
						TaskTable[no].work[SS_WAZAOBOE_SEQNO]=SSWW_WAZA_SELECT_INIT;
					break;
			}
	}
}

enum{
	SEQ2_MESSAGE,
	SEQ2_NAKIGOE,
	SEQ2_SE,
	SEQ2_BGM,
	SEQ2_FADE_WAIT,
	SEQ2_MORPHING_INIT,
	SEQ2_MORPHING_WAIT,
	SEQ2_MORPHING,
	SEQ2_EVO_EFFECT_WAIT,
	SEQ2_EVO_EFFECT1,
	SEQ2_EVO_EFFECT2,
	SEQ2_FADE_WAIT2,
	SEQ2_MORPHING_END,
	SEQ2_SHINKA_END,
	SEQ2_JOB_END,
	SEQ2_SHINKA_WAZA_OBOE,
	SEQ2_SHINKA_WAZA_OBOE_WAIT,
	SEQ2_SHINKA_WAZA_WASURE,
	SEQ2_SHINKA_WAZA_AKIRAME,
	SEQ2_SHINKA_WAZA_ALERT,
};

const u8 TuushinTaikiMsg[]={tu_,u_,si_,n_,ta_,i_,ki_,ti_,yyu_,u_,de_,su_,EOM_,};
static const u8 TuushinYesNoMsg[]={
	CTRL_,C_FCOL_,COL_BLACK,CTRL_,C_BCOL_,COL_WHITE,CTRL_,C_SCOL_,COL_DGRAY,
	ha_,i_,CR_,i_,i_,e_,EOM_

};
void	TuushinShinkaSequence(u8 no)
{
	int	i=0;
	PokemonParam *PP;
	u16 wazano;
	u8	buff[20];

	wazano = 0;
	PP=(PokemonParam *)(TaskTable[no].work[SS_ADRSL]|(TaskTable[no].work[SS_ADRSH]<<16));

	switch(TaskTable[no].work[SS_SEQNO]){
		case SEQ2_MESSAGE:
			PM_MsgExpand(MsgExpandBuffer,ShinkaBeforeMsg);
			TalkMsgSet(&kdw->tw,MsgExpandBuffer,kdw->windowwork,2,15);
			TaskTable[no].work[SS_SEQNO]++;
			break;
		case SEQ2_NAKIGOE:
			if(kdw->tw.status==MSG_END){
				VoicePlay(TaskTable[no].work[SS_MONS1],0);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ2_SE:
			if(VoicePlayWait()){
//				MusicPlayStop();
				m4aSongNumStop(MUS_SHINKA);
				SePlay(MUS_ME_SHINKA);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ2_BGM:
			if(SeEndCheck()==0){
				MusicPlay(MUS_SHINKA);
//				BGM_PlaySet(MUS_SHINKA);
				TaskTable[no].work[SS_SEQNO]++;
				PaletteFadeReq(0x0000001c,4,0,16,0);
			}
			break;
		case SEQ2_FADE_WAIT:
			if(FadeData.fade_sw == 0){
			*(vu16 *)REG_DISPCNT = DISP_MODE_0|DISP_BG0_ON|DISP_BG1_ON|DISP_OBJ_ON|DISP_OBJ_CHAR_1D_MAP;
				ServerWork[2]=EvoPartsDemoPart1Set(17);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ2_MORPHING_INIT:
			if(TaskTable[ServerWork[2]].occ==0){
				TaskTable[no].work[SS_SEQNO]++;
				MD->Wait=1;
				ServerWork[2]=EvoPartsDemoPart2Set();
			}
			break;
		case SEQ2_MORPHING_WAIT:
			if(TaskTable[ServerWork[2]].occ==0){
				ServerWork[2]=EvoMainDemoSet(MD->BeforeMonsActor,MD->AfterMonsActor);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ2_MORPHING:
			if(--MD->Wait==0){
				MD->Wait=3;
				if(TaskTable[ServerWork[2]].occ==0)
					TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ2_EVO_EFFECT_WAIT:
			ServerWork[2]=EvoPartsDemoPart3Set();
			TaskTable[no].work[SS_SEQNO]++;
			break;
		case SEQ2_EVO_EFFECT1:
			if(TaskTable[ServerWork[2]].occ==0){
				ServerWork[2]=
				EvoPartsDemoPart4SetSio(TaskTable[no].work[SS_MONS2]);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ2_EVO_EFFECT2:
			if(TaskTable[ServerWork[2]].occ==0){
				SePlay(SE_EXP);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ2_FADE_WAIT2:
			if(SeEndCheck()){		//2002.08.19 by 森　SEが終端がなかった時用に
//				m4aMPlayAllStop();
				VoicePlay(TaskTable[no].work[SS_MONS2],0);
				memcpy(&PaletteWork[PA_BG2],(void *)0x2009000,0x60);
//				PaletteFadeReq(0x0000001c, 0, 16, 0, 0);
				PaletteFadeReq(0x00000001, 0, 16, 0, 0);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ2_MORPHING_END:
			if(VoicePlayWait()&&(FadeData.fade_sw == 0)){
				PM_MsgExpand(MsgExpandBuffer,ShinkaAfterMsg);
				TalkMsgSet(&kdw->tw,MsgExpandBuffer,kdw->windowwork,2,15);
//				MusicPlay(MUS_FANFA5);
				JinglePlay(MUS_FANFA5);
				TaskTable[no].work[SS_SEQNO]++;
				PokeParaPut(PP,ID_monsno,(u8 *)&TaskTable[no].work[SS_MONS2]);
				PokeParaCalc(PP);
				PokeParaNickNameSet(PP,
									TaskTable[no].work[SS_MONS1],
									TaskTable[no].work[SS_MONS2]);
				ZukanCheck(PokeMonsNo2ZukanNoGet(TaskTable[no].work[SS_MONS2]),Z_SEE_SET);
				ZukanCheck(PokeMonsNo2ZukanNoGet(TaskTable[no].work[SS_MONS2]),Z_GET_SET);
				//進化した回数記録をカウントアップ
				IncRecord(CNT_SHINKA);
			}
			break;
		case SEQ2_SHINKA_END:
			if(kdw->tw.status==MSG_END && (JingleWait()==1)){
				if((i=PokeWazaOboeCheck(PP,TaskTable[no].work[SS_CNT_FLAG]))&&
				   (TaskTable[no].work[SS_CANCEL]==0)){
//					PM_MsgExpand(MsgExpandBuffer,TuushinTaikiMsg);
//					TalkMsgSet(&kdw->tw,MsgExpandBuffer,kdw->windowwork,2,15);

					TaskTable[no].work[SS_FLAG]|=SHINKA_BGM_RESTART_OFF;
					TaskTable[no].work[SS_CNT_FLAG]=0;
					TaskTable[no].work[SS_WAZAOBOE_SEQNO]=0;
					PokeParaGet(PP,ID_nickname,buff);
					NickNameCopy(EvStrBuf0,buff);
					if(i==NO_WAZA_SET)
						TaskTable[no].work[SS_SEQNO]=SEQ2_SHINKA_WAZA_WASURE;
					else if(i==SAME_WAZA_SET)
						break;
					else
						TaskTable[no].work[SS_SEQNO]=SEQ2_SHINKA_WAZA_OBOE;
				}
				else{
					MusicPlay(MUS_SHINKA);
					TalkMsgSet(&kdw->tw,TuushinTaikiMsg,kdw->windowwork,2,15);
					TaskTable[no].work[SS_SEQNO]++;
				}
			}
			break;
		case SEQ2_JOB_END:
			if(kdw->tw.status==MSG_END){
				DelTask(no);
				MainProcChange(ShinkaReturnProc);
			}
			break;
		case SEQ2_SHINKA_WAZA_OBOE:
			if((kdw->tw.status==MSG_END)&&(SeEndCheck()==0)){
				OboeWazaNoSet();
				JinglePlay(MUS_FANFA1);
				FightMsgCreate((u8 *)FightMsgTbl[WAZAOBOEMSGNO-MSG_TBL_START]);
//				TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
				TalkMsgSet(&kdw->tw,FightMsgBuf,kdw->windowwork,2,15);
				TaskTable[no].work[SS_CNT_FLAG]=0x40;
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ2_SHINKA_WAZA_OBOE_WAIT:
			if((kdw->tw.status==MSG_END)&&(JingleWait()==1)){
				if(--TaskTable[no].work[SS_CNT_FLAG]==0)
					TaskTable[no].work[SS_SEQNO]=SEQ2_SHINKA_END;
			}
			break;
		case SEQ2_SHINKA_WAZA_WASURE:
			switch(TaskTable[no].work[SS_WAZAOBOE_SEQNO]){
				case SSWW_MSG1:
					if((kdw->tw.status==MSG_END)&&(SeEndCheck()==0)){
						OboeWazaNoSet();
						FightMsgCreate((u8 *)FightMsgTbl[WAZAOBOEMSG2NO-MSG_TBL_START]);
//						TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
						TalkMsgSet(&kdw->tw,FightMsgBuf,kdw->windowwork,2,15);
						TaskTable[no].work[SS_WAZAOBOE_SEQNO]++;
					}
					break;
				case SSWW_MSG2:
					if((kdw->tw.status==MSG_END)&&(SeEndCheck()==0)){
						FightMsgCreate((u8 *)FightMsgTbl[WAZAOBOEMSG3NO-MSG_TBL_START]);
//						TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
						TalkMsgSet(&kdw->tw,FightMsgBuf,kdw->windowwork,2,15);
						TaskTable[no].work[SS_WAZAOBOE_SEQNO]++;
					}
					break;
				case SSWW_MSG3:
					if((kdw->tw.status==MSG_END)&&(SeEndCheck()==0)){
						FightMsgCreate((u8 *)FightMsgTbl[WAZAWASUREMSGNO-MSG_TBL_START]);
//						TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
						TalkMsgSet(&kdw->tw,FightMsgBuf,kdw->windowwork,2,15);
						TaskTable[no].work[SS_A_ACT]=SSWW_WAZA_SELECT_INIT;
						TaskTable[no].work[SS_B_ACT]=SSWW_WAZA_AKIRAME_INIT;
						TaskTable[no].work[SS_WAZAOBOE_SEQNO]++;
					}
				case SSWW_SELECT_INIT:
					if((kdw->tw.status==MSG_END)&&(SeEndCheck()==0)){
//						NMenuWinBoxWrite(WIN_X1,WIN_Y1,WIN_X2,WIN_Y2);	
						NWinFrameWrite(&kdw->tw,WIN_X1,WIN_Y1,WIN_X2,WIN_Y2);
//						TalkMsgSet(&kdw->tw,FightMsgBuf,kdw->windowwork,WIN_X1+2,WIN_Y1+1);
						ServerWork[1]=0;
						MsgPutSet(&kdw->tw,TuushinYesNoMsg,kdw->windowwork+0x80,WIN_X1+2,WIN_Y1+1);
						MsgPut(&kdw->tw);
						TuushinYesNoCsrOn();
//						WindowOpen(WIN_X1,WIN_Y1,WIN_X2,WIN_Y2,0);
//						MsgPutSet(&FightMsg,YesNoMsg,CGX_START+0x80,WIN_X1+2,WIN_Y1+1);
//						MsgPut(&FightMsg);
						TaskTable[no].work[SS_WAZAOBOE_SEQNO]++;
						ServerWork[1]=0;
//						TuushinYesNoCsrOn();
					}
					break;
				case SSWW_SELECT:
					if((sys.Trg&U_KEY)==U_KEY){
						if(ServerWork[1]){
							SePlay(SE_SELECT);
							TuushinYesNoCsrOff();
							ServerWork[1]=0;
							TuushinYesNoCsrOn();
						}
					}
					if((sys.Trg&D_KEY)==D_KEY){
						if(ServerWork[1]==0){
							SePlay(SE_SELECT);
							TuushinYesNoCsrOff();
							ServerWork[1]=1;
							TuushinYesNoCsrOn();
						}
					}
					if((sys.Trg&A_BUTTON)==A_BUTTON){
						FontScrnAreaClear( &kdw->tw, WIN_X1,WIN_Y1,WIN_X2,WIN_Y2);
//						NMenuBoxWrite(WIN_X1,WIN_Y1,WIN_X2,WIN_Y2);	
//						WindowOpen(WIN_X1,WIN_Y1,WIN_X2,WIN_Y2,1);
						FightMsgCreate((u8 *)FightMsgTbl[BLANKMSGNO-MSG_TBL_START]);
//						TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
						TalkMsgSet(&kdw->tw,FightMsgBuf,kdw->windowwork,2,15);
						SePlay(SE_SELECT);
						if(ServerWork[1])
							TaskTable[no].work[SS_WAZAOBOE_SEQNO]=TaskTable[no].work[SS_B_ACT];
						else{
							TaskTable[no].work[SS_WAZAOBOE_SEQNO]=TaskTable[no].work[SS_A_ACT];
							if(TaskTable[no].work[SS_WAZAOBOE_SEQNO]==SSWW_WAZA_SELECT_INIT)
								PaletteFadeReq(0xffffffff, 0, 0, 16, 0);
						}
					}
					if((sys.Trg&B_BUTTON)==B_BUTTON){
						FontScrnAreaClear( &kdw->tw, WIN_X1,WIN_Y1,WIN_X2,WIN_Y2);
//						NMenuBoxWrite(WIN_X1,WIN_Y1,WIN_X2,WIN_Y2);	
//						WindowOpen(WIN_X1,WIN_Y1,WIN_X2,WIN_Y2,1);
						FightMsgCreate((u8 *)FightMsgTbl[BLANKMSGNO-MSG_TBL_START]);
//						TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
						TalkMsgSet(&kdw->tw,FightMsgBuf,kdw->windowwork,2,15);
						SePlay(SE_SELECT);
						TaskTable[no].work[SS_WAZAOBOE_SEQNO]=TaskTable[no].work[SS_B_ACT];
					}
					break;
				case SSWW_WAZA_SELECT_INIT:
					if(FadeData.fade_sw == 0){
						PokeNewWazaSet(&PokeParaMine,
									   TaskTable[no].work[SS_SELMONSNO],
									   PokeCountMine-1,
									   ShinkaTuushinRecover,
									   OboeWazaNo);
						TaskTable[no].work[SS_WAZAOBOE_SEQNO]++;
					}
					break;
				case SSWW_WAZA_SELECT:
					if((FadeData.fade_sw==0)&&(sys.pMainProc==MainTuushinShinka)){
						i=GetNewWazaSelectPos();
						if(i==4)
							TaskTable[no].work[SS_WAZAOBOE_SEQNO]=SSWW_WAZA_AKIRAME_INIT;
						else{
							wazano=PokeParaGet(PP,ID_waza1+i);

							if(HidenWazaCheck(wazano)){
								FightMsgCreate((u8 *)FightMsgTbl[NOWAZAWASUREMSGNO-MSG_TBL_START]);
//								TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
								TalkMsgSet(&kdw->tw,FightMsgBuf,kdw->windowwork,2,15);
								TaskTable[no].work[SS_WAZAOBOE_SEQNO]=SSWW_WAZA_ALERT;
								return;
							}

							EvStrBuf1[0]=I_MSG;
							EvStrBuf1[1]=EV_WAZANO;
							EvStrBuf1[2]=wazano&0xff;
							EvStrBuf1[3]=(wazano&0xff00)>>8;
							EvStrBuf1[4]=EOM_;

							PokePPCountClear(PP,i);
							PokeWazaSetPos(PP,OboeWazaNo,i);
							FightMsgCreate((u8 *)FightMsgTbl[WAZAWASUREMSG2NO-MSG_TBL_START]);
							TalkMsgSet(&kdw->tw,FightMsgBuf,kdw->windowwork,2,15);
//							TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
							TaskTable[no].work[SS_WAZAOBOE_SEQNO]++;
						}
					}
					break;
				case SSWW_WAZA_WASURE_MSG1:
					if((kdw->tw.status==MSG_END)&&(SeEndCheck()==0)){
						FightMsgCreate((u8 *)FightMsgTbl[WAZAWASUREMSG3NO-MSG_TBL_START]);
//						TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
						TalkMsgSet(&kdw->tw,FightMsgBuf,kdw->windowwork,2,15);
						TaskTable[no].work[SS_WAZAOBOE_SEQNO]++;
					}
					break;
				case SSWW_WAZA_WASURE_MSG2:
					if((kdw->tw.status==MSG_END)&&(SeEndCheck()==0)){
						FightMsgCreate((u8 *)FightMsgTbl[WAZAWASUREMSG4NO-MSG_TBL_START]);
//						TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
						TalkMsgSet(&kdw->tw,FightMsgBuf,kdw->windowwork,2,15);
						TaskTable[no].work[SS_SEQNO]=SEQ2_SHINKA_WAZA_OBOE;
					}
					break;
				case SSWW_WAZA_AKIRAME_INIT:
					FightMsgCreate((u8 *)FightMsgTbl[WAZAAKIRAMEMSGNO-MSG_TBL_START]);
//					TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
					TalkMsgSet(&kdw->tw,FightMsgBuf,kdw->windowwork,2,15);
					TaskTable[no].work[SS_A_ACT]=SSWW_WAZA_AKIRAME;
					TaskTable[no].work[SS_B_ACT]=SSWW_MSG1;
					TaskTable[no].work[SS_WAZAOBOE_SEQNO]=SSWW_SELECT_INIT;
					break;
				case SSWW_WAZA_AKIRAME:
					FightMsgCreate((u8 *)FightMsgTbl[WAZAAKIRAMEMSG2NO-MSG_TBL_START]);
//					TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
					TalkMsgSet(&kdw->tw,FightMsgBuf,kdw->windowwork,2,15);
					TaskTable[no].work[SS_SEQNO]=SEQ2_SHINKA_END;
					break;
				case SSWW_WAZA_ALERT:
					if((kdw->tw.status==MSG_END)&&(SeEndCheck()==0))
						TaskTable[no].work[SS_WAZAOBOE_SEQNO]=SSWW_WAZA_SELECT_INIT;
					break;
			}
			break;
	}
}

void	MorphigDataCalc(u8 *Badrs,u8 *Aadrs)
{
	int	x,y,seq,ofs;
	int	x1=0,x2=0;
	int	length,lentmp;
	u8	*pos;

	for(y=0;y<64;y++){
		MD->MoveLineCnt[y]=0;
		MD->BeforeLineCnt[y]=0;
		MD->AfterLineCnt[y]=0;
		for(x=0;x<32;x++){
			MD->BeforeLeftPos[y][x]=0;
			MD->BeforeRightPos[y][x]=0;
			MD->AfterLeftPos[y][x]=0;
			MD->AfterRightPos[y][x]=0;
			MD->SeqNoLeft[y][x]=0;
			MD->SeqNoRight[y][x]=0;
			MD->NowLeftPos[y][x]=0;
			MD->NowRightPos[y][x]=0;
			MD->NowLeftV[y][x]=0;
			MD->NowRightV[y][x]=0;
			MD->NowLeftVTmp[y][x]=0;
			MD->NowRightVTmp[y][x]=0;
		}
	}
	MD->TotalWait=64;

	ofs=0;
	for(y=0;y<64;y++){
		seq=0;
		pos=Badrs+ofs;
		for(x=0;x<64;x++){
			MD->MorphAdrs[y][(x>>1)]=(u32)pos;
			switch(seq){
				case 0:			//ドットがあるか判断
					switch(x&1){
						case 0:
							if(*pos&0x0f){
								MD->BeforeLeftPos[y][MD->BeforeLineCnt[y]]=x;
								seq=1;
							}
							break;
						case 1:
							if(*pos&0xf0){
								MD->BeforeLeftPos[y][MD->BeforeLineCnt[y]]=x;
								seq=1;
							}
							break;
					}
					break;
				case 1:			//ドットがないか判断
					switch(x&1){
						case 0:
							if((*pos&0x0f)==0){
								MD->BeforeRightPos[y][MD->BeforeLineCnt[y]]=x-1;
								MD->BeforeLineCnt[y]++;
								seq=0;
							}
							break;
						case 1:
							if((*pos&0xf0)==0){
								MD->BeforeRightPos[y][MD->BeforeLineCnt[y]]=x-1;
								MD->BeforeLineCnt[y]++;
								seq=0;
							}
							break;
					}
					break;
			}
			if(((x+1)&0x07)==0)
				pos+=0x1d;
			else if(x&1)
				pos++;
		}
		if(seq){
			MD->BeforeRightPos[y][MD->BeforeLineCnt[y]]=x;
			MD->BeforeLineCnt[y]++;
		}
		if(((y+1)&0x07)==0)
			ofs+=0xe4;
		else
			ofs+=4;
	}
	ofs=0;
	for(y=0;y<64;y++){
		seq=0;
		pos=Aadrs+ofs;
		for(x=0;x<64;x++){
			switch(seq){
				case 0:			//ドットがあるか判断
					switch(x&1){
						case 0:
							if(*pos&0x0f){
								MD->AfterLeftPos[y][MD->AfterLineCnt[y]]=x;
								seq=1;
							}
							break;
						case 1:
							if(*pos&0xf0){
								MD->AfterLeftPos[y][MD->AfterLineCnt[y]]=x;
								seq=1;
							}
							break;
					}
					break;
				case 1:			//ドットがないか判断
					switch(x&1){
						case 0:
							if((*pos&0x0f)==0){
								MD->AfterRightPos[y][MD->AfterLineCnt[y]]=x-1;
								MD->AfterLineCnt[y]++;
								seq=0;
							}
							break;
						case 1:
							if((*pos&0xf0)==0){
								MD->AfterRightPos[y][MD->AfterLineCnt[y]]=x-1;
								MD->AfterLineCnt[y]++;
								seq=0;
							}
							break;
					}
					break;
			}
			if(((x+1)&0x07)==0)
				pos+=0x1d;
			else if(x&1)
				pos++;
		}
		if(seq){
			MD->AfterRightPos[y][MD->AfterLineCnt[y]]=x;
			MD->AfterLineCnt[y]++;
		}
		if(((y+1)&0x07)==0)
			ofs+=0xe4;
		else
			ofs+=4;
	}

	for(y=0;y<64;y++){
		if(MD->BeforeLineCnt[y] < MD->AfterLineCnt[y]){
			for(x1=0;x1<MD->BeforeLineCnt[y];x1++){
				length=256;
				for(x=0;x<MD->AfterLineCnt[y];x++){
					if(MD->BeforeLeftPos[y][x1]>MD->AfterLeftPos[y][x])
						lentmp=MD->BeforeLeftPos[y][x1]-MD->AfterLeftPos[y][x];
					else
						lentmp=MD->AfterLeftPos[y][x]-MD->BeforeLeftPos[y][x1];
					if(MD->BeforeRightPos[y][x1]>MD->AfterRightPos[y][x])
						lentmp+=(MD->BeforeRightPos[y][x1]-MD->AfterRightPos[y][x]);
					else
						lentmp+=(MD->AfterRightPos[y][x]-MD->BeforeRightPos[y][x1]);
					if((length>lentmp)&&(MD->SeqNoLeft[y][x]==0)&&(MD->SeqNoRight[y][x]==0)){
						x2=x;
						length=lentmp;
					}
				}
				MovePosSet(x1,x2,y);
			}
			for(x=0;x<MD->AfterLineCnt[y];x++){
				if((MD->SeqNoLeft[y][x]==0)&&(MD->SeqNoRight[y][x]==0))
					WaitPosSet(x,y);
			}
		}
		if(MD->BeforeLineCnt[y] == MD->AfterLineCnt[y]){
			for(x=0;x<MD->BeforeLineCnt[y];x++)
				MovePosSet(x,x,y);
		}
		if(MD->BeforeLineCnt[y] >  MD->AfterLineCnt[y]){
			for(x2=0;x2<MD->AfterLineCnt[y];x2++){
				length=256;
				for(x=0;x<MD->BeforeLineCnt[y];x++){
					if(MD->BeforeLeftPos[y][x]>MD->AfterLeftPos[y][x2])
						lentmp=MD->BeforeLeftPos[y][x]-MD->AfterLeftPos[y][x2];
					else
						lentmp=MD->AfterLeftPos[y][x2]-MD->BeforeLeftPos[y][x];
					if(MD->BeforeRightPos[y][x]>MD->AfterRightPos[y][x2])
						lentmp+=(MD->BeforeRightPos[y][x]-MD->AfterRightPos[y][x2]);
					else
						lentmp+=(MD->AfterRightPos[y][x2]-MD->BeforeRightPos[y][x]);
					if((length>lentmp)&&(MD->SeqNoLeft[y][x]==0)){
						x1=x;
						length=lentmp;
					}
				}
				MD->NowLeftPos[y][x1]=MD->AfterLeftPos[y][x2];
				MD->NowRightPos[y][x1]=MD->AfterRightPos[y][x2];
				MD->SeqNoLeft[y][x1]=1;
			}
			for(x=0;x<MD->BeforeLineCnt[y];x++){
				MD->AfterLeftPos[y][x]=MD->NowLeftPos[y][x];
				MD->AfterRightPos[y][x]=MD->NowRightPos[y][x];
				if(MD->SeqNoLeft[y][x]){
					MD->SeqNoLeft[y][x]=0;
					MovePosSet(x,x,y);
				}
				else{
					MD->AfterLeftPos[y][x]=
					MD->AfterRightPos[y][x]=
						 MD->BeforeLeftPos[y][x]+
						((MD->BeforeRightPos[y][x]-
						 MD->BeforeLeftPos[y][x])/2);
					MD->AfterRightPos[y][x]--;
					MovePosSet(x,x,y);
				}
			}
		}
	}
}

void	MovePosSet(int x1,int x2,int y)
{
	int	length;

	MD->NowLeftPos[y][x2]=MD->BeforeLeftPos[y][x1];
	MD->NowRightPos[y][x2]=MD->BeforeRightPos[y][x1];

	length=0;
	if(MD->BeforeLeftPos[y][x1] < MD->AfterLeftPos[y][x2]){
		MD->SeqNoLeft[y][x2]=SEQ_DOTMOVERIGHT_PRESET;
		length=MD->AfterLeftPos[y][x2]-MD->BeforeLeftPos[y][x1];
	}
	else if(MD->BeforeLeftPos[y][x1] > MD->AfterLeftPos[y][x2]){
		MD->SeqNoLeft[y][x2]=SEQ_DOTMOVELEFT_PSET;
		length=MD->BeforeLeftPos[y][x1]-MD->AfterLeftPos[y][x2];
	}
	MD->NowLeftVTmp[y][x2]=length<<4;

	length=0;
	if(MD->BeforeRightPos[y][x1] < MD->AfterRightPos[y][x2]){
		MD->SeqNoRight[y][x2]=SEQ_DOTMOVERIGHT_PSET;
		length=MD->AfterRightPos[y][x2]-MD->BeforeRightPos[y][x1];
	}
	else if(MD->BeforeRightPos[y][x1] > MD->AfterRightPos[y][x2]){
		MD->SeqNoRight[y][x2]=SEQ_DOTMOVELEFT_PRESET;
		length=MD->BeforeRightPos[y][x1]-MD->AfterRightPos[y][x2];
	}
	MD->NowRightVTmp[y][x2]=length<<4;

	MD->MoveLineCnt[y]++;
}

void	WaitPosSet(int x,int y)
{
	int	length;

	length=MD->AfterRightPos[y][x]-MD->AfterLeftPos[y][x];
	MD->NowLeftPos[y][x]=MD->NowRightPos[y][x]=MD->AfterLeftPos[y][x]+(length/2);
	MD->SeqNoLeft[y][x]=SEQ_DOTWAITLEFT_PSET;
	MD->SeqNoRight[y][x]=SEQ_DOTWAITRIGHT_PSET;
	MD->MoveLineCnt[y]++;
	length=MD->NowLeftPos[y][x]-MD->AfterLeftPos[y][x];
	MD->NowLeftVTmp[y][x]=length<<4;
	length=MD->AfterRightPos[y][x]-MD->NowRightPos[y][x];
	MD->NowRightVTmp[y][x]=length<<4;
}

//==============================================================
//		モーフィングメインルーチン
//==============================================================

u8	MorphingAct(void)
{
	int	x,y;
	u8	ret=1;
	int	i,time;

	if(MD->TotalWait)
		MD->TotalWait--;

	for(y=0;y<64;y++){
		for(x=0;x<MD->MoveLineCnt[y];x++){
			switch(MD->SeqNoLeft[y][x]){
				case SEQ_DOTMOVESTOP:
					break;
				case SEQ_DOTMOVELEFT_PSET:
					ret=0;
					MD->NowLeftV[y][x]+=MD->NowLeftVTmp[y][x];
					time=(MD->NowLeftV[y][x]&0xff00)>>8;
					MD->NowLeftV[y][x]&=0xff;
					for(i=0;i<time;i++){
						MD->NowLeftPos[y][x]--;
						DotSet(y,MD->NowLeftPos[y][x]);
						if(MD->NowLeftPos[y][x]==MD->AfterLeftPos[y][x]){
							MD->SeqNoLeft[y][x]=SEQ_DOTMOVESTOP;
							break;
						}
					}
					break;
				case SEQ_DOTMOVELEFT_PRESET:
					ret=0;
					MD->NowLeftV[y][x]+=MD->NowLeftVTmp[y][x];
					time=(MD->NowLeftV[y][x]&0xff00)>>8;
					MD->NowLeftV[y][x]&=0xff;
					for(i=0;i<time;i++){
						if(MD->NowLeftPos[y][x]==MD->AfterLeftPos[y][x]){
							MD->SeqNoLeft[y][x]=SEQ_DOTMOVESTOP;
							break;
						}
						else{
							DotReset(y,MD->NowLeftPos[y][x]);
							MD->NowLeftPos[y][x]--;
						}
					}
					break;
				case SEQ_DOTMOVERIGHT_PSET:
					ret=0;
					MD->NowLeftV[y][x]+=MD->NowLeftVTmp[y][x];
					time=(MD->NowLeftV[y][x]&0xff00)>>8;
					MD->NowLeftV[y][x]&=0xff;
					for(i=0;i<time;i++){
						MD->NowLeftPos[y][x]++;
						DotSet(y,MD->NowLeftPos[y][x]);
						if(MD->NowLeftPos[y][x]==MD->AfterLeftPos[y][x]){
							MD->SeqNoLeft[y][x]=SEQ_DOTMOVESTOP;
							break;
						}
					}
					break;
				case SEQ_DOTMOVERIGHT_PRESET:
					ret=0;
					MD->NowLeftV[y][x]+=MD->NowLeftVTmp[y][x];
					time=(MD->NowLeftV[y][x]&0xff00)>>8;
					MD->NowLeftV[y][x]&=0xff;
					for(i=0;i<time;i++){
						if(MD->NowLeftPos[y][x]==MD->AfterLeftPos[y][x]){
							MD->SeqNoLeft[y][x]=SEQ_DOTMOVESTOP;
							break;
						}
						else{
							DotReset(y,MD->NowLeftPos[y][x]);
							MD->NowLeftPos[y][x]++;
						}
					}
					break;
				case SEQ_DOTWAITLEFT_PSET:
					ret=0;
					if(DotMoveCheck(y,MD->NowLeftPos[y][x]))
						MD->SeqNoLeft[y][x]=SEQ_DOTGOLEFT_PSET;
					break;
				case SEQ_DOTWAITLEFT_PRESET:
					ret=0;
					if(DotMoveCheck(y,MD->NowLeftPos[y][x]))
						MD->SeqNoLeft[y][x]=SEQ_DOTGOLEFT_PRESET;
					break;
				case SEQ_DOTWAITRIGHT_PSET:
					ret=0;
					if(DotMoveCheck(y,MD->NowLeftPos[y][x]))
						MD->SeqNoLeft[y][x]=SEQ_DOTGORIGHT_PSET;
					break;
				case SEQ_DOTWAITRIGHT_PRESET:
					ret=0;
					if(DotMoveCheck(y,MD->NowLeftPos[y][x]))
						MD->SeqNoLeft[y][x]=SEQ_DOTGORIGHT_PRESET;
					break;
				case SEQ_DOTGOLEFT_PSET:
					ret=0;
					DotSet(y,MD->NowLeftPos[y][x]);
					if(MD->NowLeftPos[y][x]==MD->AfterLeftPos[y][x])
						MD->SeqNoLeft[y][x]=SEQ_DOTMOVESTOP;
					else
						MD->SeqNoLeft[y][x]=SEQ_DOTMOVELEFT_PSET;
					break;
				case SEQ_DOTGOLEFT_PRESET:
					ret=0;
					DotReset(y,MD->NowLeftPos[y][x]);
					if(MD->NowLeftPos[y][x]==MD->AfterLeftPos[y][x])
						MD->SeqNoLeft[y][x]=SEQ_DOTMOVESTOP;
					else
						MD->SeqNoLeft[y][x]=SEQ_DOTMOVELEFT_PRESET;
					break;
				case SEQ_DOTGORIGHT_PSET:
					ret=0;
					DotSet(y,MD->NowLeftPos[y][x]);
					if(MD->NowLeftPos[y][x]==MD->AfterLeftPos[y][x])
						MD->SeqNoLeft[y][x]=SEQ_DOTMOVESTOP;
					else
						MD->SeqNoLeft[y][x]=SEQ_DOTMOVERIGHT_PSET;
					break;
				case SEQ_DOTGORIGHT_PRESET:
					ret=0;
					DotReset(y,MD->NowLeftPos[y][x]);
					if(MD->NowLeftPos[y][x]==MD->AfterLeftPos[y][x])
						MD->SeqNoLeft[y][x]=SEQ_DOTMOVESTOP;
					else
						MD->SeqNoLeft[y][x]=SEQ_DOTMOVERIGHT_PRESET;
					break;
			}

			switch(MD->SeqNoRight[y][x]){
				case SEQ_DOTMOVESTOP:
					break;
				case SEQ_DOTMOVELEFT_PSET:
					ret=0;
					MD->NowRightV[y][x]+=MD->NowRightVTmp[y][x];
					time=(MD->NowRightV[y][x]&0xff00)>>8;
					MD->NowRightV[y][x]&=0xff;
					for(i=0;i<time;i++){
						MD->NowRightPos[y][x]--;
						DotSet(y,MD->NowRightPos[y][x]);
						if(MD->NowRightPos[y][x]==MD->AfterRightPos[y][x]){
							MD->SeqNoRight[y][x]=SEQ_DOTMOVESTOP;
							break;
						}
					}
					break;
				case SEQ_DOTMOVELEFT_PRESET:
					ret=0;
					MD->NowRightV[y][x]+=MD->NowRightVTmp[y][x];
					time=(MD->NowRightV[y][x]&0xff00)>>8;
					MD->NowRightV[y][x]&=0xff;
					for(i=0;i<time;i++){
						if(MD->NowRightPos[y][x]==MD->AfterRightPos[y][x]){
							MD->SeqNoRight[y][x]=SEQ_DOTMOVESTOP;
							break;
						}
						else{
							DotReset(y,MD->NowRightPos[y][x]);
							MD->NowRightPos[y][x]--;
						}
					}
					break;
				case SEQ_DOTMOVERIGHT_PSET:
					ret=0;
					MD->NowRightV[y][x]+=MD->NowRightVTmp[y][x];
					time=(MD->NowRightV[y][x]&0xff00)>>8;
					MD->NowRightV[y][x]&=0xff;
					for(i=0;i<time;i++){
						MD->NowRightPos[y][x]++;
						DotSet(y,MD->NowRightPos[y][x]);
						if(MD->NowRightPos[y][x]==MD->AfterRightPos[y][x]){
							MD->SeqNoRight[y][x]=SEQ_DOTMOVESTOP;
							break;
						}
					}
					break;
				case SEQ_DOTMOVERIGHT_PRESET:
					ret=0;
					MD->NowRightV[y][x]+=MD->NowRightVTmp[y][x];
					time=(MD->NowRightV[y][x]&0xff00)>>8;
					MD->NowRightV[y][x]&=0xff;
					for(i=0;i<time;i++){
						if(MD->NowRightPos[y][x]==MD->AfterRightPos[y][x]){
							MD->SeqNoRight[y][x]=SEQ_DOTMOVESTOP;
							break;
						}
						else{
							DotReset(y,MD->NowRightPos[y][x]);
							MD->NowRightPos[y][x]++;
						}
					}
					break;
				case SEQ_DOTWAITLEFT_PSET:
					ret=0;
					if(DotMoveCheck(y,MD->NowRightPos[y][x]))
						MD->SeqNoRight[y][x]=SEQ_DOTGOLEFT_PSET;
					break;
				case SEQ_DOTWAITLEFT_PRESET:
					ret=0;
					if(DotMoveCheck(y,MD->NowRightPos[y][x]))
						MD->SeqNoRight[y][x]=SEQ_DOTGOLEFT_PRESET;
					break;
				case SEQ_DOTWAITRIGHT_PSET:
					ret=0;
					if(DotMoveCheck(y,MD->NowRightPos[y][x]))
						MD->SeqNoRight[y][x]=SEQ_DOTGORIGHT_PSET;
					break;
				case SEQ_DOTWAITRIGHT_PRESET:
					ret=0;
					if(DotMoveCheck(y,MD->NowRightPos[y][x]))
						MD->SeqNoRight[y][x]=SEQ_DOTGORIGHT_PRESET;
					break;
				case SEQ_DOTGOLEFT_PSET:
					ret=0;
					DotSet(y,MD->NowRightPos[y][x]);
					if(MD->NowRightPos[y][x]==MD->AfterRightPos[y][x])
						MD->SeqNoRight[y][x]=SEQ_DOTMOVESTOP;
					else
						MD->SeqNoRight[y][x]=SEQ_DOTMOVELEFT_PSET;
					break;
				case SEQ_DOTGOLEFT_PRESET:
					ret=0;
					DotReset(y,MD->NowRightPos[y][x]);
					if(MD->NowRightPos[y][x]==MD->AfterRightPos[y][x])
						MD->SeqNoRight[y][x]=SEQ_DOTMOVESTOP;
					else
						MD->SeqNoRight[y][x]=SEQ_DOTMOVELEFT_PRESET;
					break;
				case SEQ_DOTGORIGHT_PSET:
					ret=0;
					DotSet(y,MD->NowRightPos[y][x]);
					if(MD->NowRightPos[y][x]==MD->AfterRightPos[y][x])
						MD->SeqNoRight[y][x]=SEQ_DOTMOVESTOP;
					else
						MD->SeqNoRight[y][x]=SEQ_DOTMOVERIGHT_PSET;
					break;
				case SEQ_DOTGORIGHT_PRESET:
					ret=0;
					DotReset(y,MD->NowRightPos[y][x]);
					if(MD->NowRightPos[y][x]==MD->AfterRightPos[y][x])
						MD->SeqNoRight[y][x]=SEQ_DOTMOVESTOP;
					else
						MD->SeqNoRight[y][x]=SEQ_DOTMOVERIGHT_PRESET;
					break;
			}
		}
	}
	return ret;
}

void	DotSet(int y,u8 x)
{
	u8	*adrs;

	adrs=(u8 *)MD->MorphAdrs[y][x>>1];

	if(x&1)
		adrs[0]|=0xf0;
	else
		adrs[0]|=0x0f;
}

void	DotReset(int y,u8 x)
{
	u8	*adrs,*adrs2;

	adrs=(u8 *)MD->MorphAdrs[y][x>>1];
	adrs2=(u8 *)MD->MorphAdrs[y][x>>1]+0x6000;

	if(x&1){
		if((adrs2[0]&0xf0)==0)
			adrs[0]&=0x0f;
	}
	else{
		if((adrs2[0]&0x0f)==0)
			adrs[0]&=0xf0;
	}
}

u8	DotMoveCheck(int y,u8 x)
{
	int	i;
	s8	x1,x2;
	u8	*adrs;

	if(MD->TotalWait==0)
		return 1;

	x1=0;
	for(i=0;i<32;i++){
		if(y==0){
			x1++;
			break;
		}
		if((MD->SeqNoLeft[y-1][i])||(MD->SeqNoRight[y-1][i]))
			break;
	}
	if(i==32)
		x1++;
	for(i=0;i<32;i++){
		if(y==63){
			x1++;
			break;
		}
		if((MD->SeqNoLeft[y+1][i])||(MD->SeqNoRight[y+1][i]))
			break;
	}
	if(i==32)
		x1++;
	if(x1==2)
		return 1;

	x1=x-2;
	if(x1<0)
		x1=0;

	x2=x+2;
	if(x2>63)
		x2=63;

	for(i=x1;i<x2;i++){
		if(y==0) break;
		adrs=(u8 *)MD->MorphAdrs[y-1][i>>1];
		if(i&1){
			if(adrs[0]&0xf0)
				return 1;
		}
		else{
			if(adrs[0]&0x0f)
				return 1;
		}
	}
	for(i=x1;i<x2;i++){
		if(y==63) break;
		adrs=(u8 *)MD->MorphAdrs[y+1][i>>1];
		if(i&1){
			if(adrs[0]&0xf0)
				return 1;
		}
		else{
			if(adrs[0]&0x0f)
				return 1;
		}
	}
	return 0;
}

//==============================================================
//                    割り込みルーチン
//==============================================================

//--------------------------------------------------------------
//                    Ｈブランク関数
//--------------------------------------------------------------

void	shinka_h_blank_intr(void)
{
}

//--------------------------------------------------------------
//                    Ｖブランク関数
//--------------------------------------------------------------

void shinka_v_blank_intr(void)
{
		*(vu16 *)REG_BG0CNT = BG_SCREEN_SIZE_2 | BG_PRIORITY_3
		| 24 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 | BG_MOS_OFF;

		*(vu16 *)REG_BG0HOFS = ScrX0;
		*(vu16 *)REG_BG0VOFS = ScrY0;
		*(vu16 *)REG_BG1HOFS = ScrX1;
		*(vu16 *)REG_BG1VOFS = ScrY1;
		*(vu16 *)REG_BG2HOFS = ScrX2;
		*(vu16 *)REG_BG2VOFS = ScrY2;
		*(vu16 *)REG_BG3HOFS = ScrX3;
		*(vu16 *)REG_BG3VOFS = ScrY3;

		actOAMtrans();
		actDMAtrans();
		PaletteFadeTrans();
		LasterVblank();
}

static void tuushinshinka_v_blank_intr(void)
{

		*(vu16 *)REG_BG0HOFS = ScrX0;
		*(vu16 *)REG_BG0VOFS = ScrY0;
		*(vu16 *)REG_BG1HOFS = ScrX1;
		*(vu16 *)REG_BG1VOFS = ScrY1;
		*(vu16 *)REG_BG2HOFS = ScrX2;
		*(vu16 *)REG_BG2VOFS = ScrY2;
		*(vu16 *)REG_BG3HOFS = ScrX3;
		*(vu16 *)REG_BG3VOFS = ScrY3;

		actOAMtrans();
		actDMAtrans();
		PaletteFadeTrans();
		LasterVblank();
}



static const u8 arrow_col[]={
	CTRL_,C_FCOL_,COL_BLACK,CTRL_,C_BCOL_,COL_WHITE,CTRL_,C_SCOL_,COL_DGRAY,EOM_,
};
static const u8 arrow_str[][10]={
	{cursor_,CR_,spc_,EOM_},
	{spc_,CR_,cursor_,EOM_},
	{spc_,CR_,spc_,EOM_},
};

static void TuushinYesNoCsrOn()
{
	u8 strbuf[30];
	PM_strcpy(strbuf,arrow_col);
	PM_strcat(strbuf,arrow_str[ServerWork[1]]);
	MsgPutSet(&kdw->tw,strbuf,kdw->windowwork+0x90,WIN_X1+1,WIN_Y1+1);
	MsgPut(&kdw->tw);
}

static void TuushinYesNoCsrOff()
{
	u8 strbuf[30];
	PM_strcpy(strbuf,arrow_col);
	PM_strcat(strbuf,arrow_str[2]);
	MsgPutSet(&kdw->tw,strbuf,kdw->windowwork+0x90,WIN_X1+1,WIN_Y1+1);
	MsgPut(&kdw->tw);
}
