//======================================================
//    fight_d.c                                           
//                                                      
//    Copyright (C) 2000 GAME FREAK inc.
//======================================================

#ifdef	PM_DEBUG

#if 0
#include "common.h"

#include "intr.h"
#include "map.h"
#include "actor.h"		//add matsuda
#include "madefine.h"	//add
#include "actanm.h"		//add
#include "decord.h"		//add
#include "objdata.h"		//add
#include "calctool.h"		//add
#include "poketool.h"		//add
#include "print.h"		//add
#include "fight.h"		//add
#include "multisio.h"		//add
#include "pokesio.h"
#include "cable.h"		//add
#include "task.h"		//add
#include "ev_fight.h"		//add
#include "waza_tbl.h"		//add
#include "gamedata.h"		//add
#include "mus_tool.h"		//add
#include "pm_str.h"		//add
#include "chr.def"		//add
#include "item.h"		//add
#include "cli_def.h"		//add
#endif

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
#include "wazano.def"		//add
#include "fld_main.h"
#include "gauge.h"
#include "fight.h"		//add
#include "client_t.h"		//add
#include "cli_def.h"		//add
#include "a_enemy.h"		//add
#include "mus_tool.h"
#include "shinka.h"
#include "shinka2.h"		//add
#include "shinka3.h"		//add
#include "pm_str.h"
#include "fightmsg.h"
#include "zukan.h"
#include "record.h"
#include "param.h"
#include "fld_bgm.h"
#include "p_status.h"
#include "item.h"		//add
#include "monsno.def"		//add
#include "safari.h"		//add
#include "cubecase.h"		//add

#include "../library/AgbFlash1M.h"

#define	LEVEL_MAX	100
#define	TOKUSEI_MAX	5
#define	BG_MAX		9
#define	PARA_MAX	31
#define	SOUND_FLAG_MAX	8

#define SAVE_SECTOR_SIZE	0x1000	/* 1セクタの大きさ */

//------------------------- データ -----------------------------

extern void	InitEncount(void);
extern void	InitPocketItem(void);

extern	const	u8	SpecialAbirityMsg[][8];

const	BASE_BATTLE_DATA	BBD_DATA={
};

//---------------------- ローカル変数 --------------------------

#if 0
typedef struct{
	int	ofs;
	int	cnt;
	u8	col1;
	u8	col2;
	u8	mask;
}BuchiData;

BuchiData	BuchiTbl[]={
	{2,4,0x44,0x55,0x88},
	{1,6,0x44,0x55,0x88},
	{0,8,0x44,0x55,0x88},
	{0,8,0x44,0x55,0x88},
	{0,8,0x44,0x55,0x88},
	{0,8,0x44,0x55,0x88},
	{1,6,0x44,0x55,0x88},
	{2,4,0x44,0x55,0x88},
};
#endif

TALK_WIN	PokeLabel;
extern	TALK_WIN	FightMsg;

u32	AIBitWork=0;

u8	DebugFightFlag=0;

const	u16	TALK_WIN_DATA[PARA_MAX+1][5]={
	{  2, 1, 2,KAIHATSU_NUM_MAX,1},		//ポケモン名
	{ 18,10, 2,LEVEL_MAX,		1},		//レベル
	{ 24,14, 2,ITEM_DATA_MAX,	0},		//アイテム名
	{ 46,26, 2,TOKUSEI_MAX,		0},		//特殊能力
	{ 48,28, 2,2,				0},		//性別
	{ 52, 1, 4,KAIHATSU_NUM_MAX,0},
	{ 68,10, 4,LEVEL_MAX,		1},
	{ 74,14, 4,ITEM_DATA_MAX,	0},		//アイテム名
	{ 96,26, 4,TOKUSEI_MAX,		0},		//特殊能力
	{ 98,28, 4,2,				0},		//性別
	{102, 1, 6,KAIHATSU_NUM_MAX,0},
	{118,10, 6,LEVEL_MAX,		1},
	{124,14, 6,ITEM_DATA_MAX,	0},		//アイテム名
	{146,26, 6,TOKUSEI_MAX,		0},		//特殊能力
	{148,28, 6,2,				0},		//性別
	{152, 1, 8,KAIHATSU_NUM_MAX,0},
	{168,10, 8,LEVEL_MAX,		1},
	{174,14, 8,ITEM_DATA_MAX,	0},		//アイテム名
	{196,26, 8,TOKUSEI_MAX,		0},		//特殊能力
	{198,28, 8,2,				0},		//性別
	{202, 1,10,KAIHATSU_NUM_MAX,0},
	{218,10,10,LEVEL_MAX,		1},
	{224,14,10,ITEM_DATA_MAX,	0},		//アイテム名
	{246,26,10,TOKUSEI_MAX,		0},		//特殊能力
	{248,28,10,2,				0},		//性別
	{252, 1,12,KAIHATSU_NUM_MAX,0},
	{268,10,12,LEVEL_MAX,		1},
	{274,14,12,ITEM_DATA_MAX,	0},		//アイテム名
	{296,26,12,TOKUSEI_MAX,		0},		//特殊能力
	{298,28,12,2,				0},		//性別
	{302, 6,18,BG_MAX,			1},
	{308,26,18,BG_MAX,			1},
};

const	u16	WAZA_WIN_DATA[4][5]={
	{310, 1,14,WAZANO_MAX,	 1},
	{330,12,14,WAZANO_MAX,	 0},
	{350, 1,16,WAZANO_MAX,	 0},
	{370,12,16,WAZANO_MAX,	 0},
};

const	u16	TOKUSEI_WIN_DATA[2][3]={
	{390,23,14},
	{404,23,16},
};

//418

const u16 FightTypeTbl[BG_MAX]={
	FIGHT_TYPE_1vs1,
	FIGHT_TYPE_2vs2|FIGHT_TYPE_TRAINER,
	FIGHT_TYPE_1vs1|FIGHT_TYPE_TRAINER,
	FIGHT_TYPE_2vs2|FIGHT_TYPE_TRAINER,
	FIGHT_TYPE_1vs1|FIGHT_TYPE_TRAINER|FIGHT_TYPE_TUUSHIN,
	FIGHT_TYPE_2vs2|FIGHT_TYPE_TRAINER|FIGHT_TYPE_TUUSHIN,
	FIGHT_TYPE_2vs2|FIGHT_TYPE_TRAINER|FIGHT_TYPE_TUUSHIN|FIGHT_TYPE_4_2vs2,
	FIGHT_TYPE_1vs1|FIGHT_TYPE_GET_DEMO,
	FIGHT_TYPE_1vs1|FIGHT_TYPE_SAFARI,
};

static const CUBE	dumy_data[] = {
	{  1,20, 0, 0, 0, 0,20 },
	{  2, 0,20, 0, 0, 0,20 },
	{  3, 0, 0,20, 0, 0,20 },
	{  4, 0, 0, 0,20, 0,20 },
	{  5, 0, 0, 0, 0,20,20 },
	{  6,20, 0,20, 0, 0,20 },
	{  7, 0,20, 0,20, 0,20 },
	{  8, 0, 0,20, 0,20,20 },
	{  9,20, 0, 0,20, 0,20 },
	{ 10, 0,20, 0, 0,20,20 },
	{ 11, 0, 2, 0, 2, 2, 0 },
	{ 12, 3, 3, 3, 3, 3, 0 },
	{ 13, 1, 1, 1, 1, 1, 1 },
	{ 14,20, 0, 0, 0, 0,20 },
	{  0, 0, 0, 0, 0, 0, 0 },
};

s16	pokedata[2][35]={{0}};
s16	wazadata[2][6][4]={{{0}}};
u8	pokeheight[KAIHATSU_NUM_MAX]={};

const	u8	BouMsg[9]={bou_,bou_,bou_,bou_,bou_,bou_,bou_,bou_,EOM_};
//const	u8	DebugName[4]={te_,tu_,zi_,EOM_};
const	u8	DebugName[5][6]={
	{ZI_,YYU_,N_,I_,TI_,EOM_},
	{DA_,I_,GO_,RO_,U_,EOM_},
	{BA_,RE_,N_,SI_,A_,EOM_},
	{HA_,RU_,KO_,MA_,TI_,EOM_},
	{te_,tu_,zi_,EOM_},
};

const	u8	OnMsg[]={
	O_,N_,EOM_,
};
const	u8	OffMsg[]={
	O_,HU_,EOM_,
};

const	u8	MonoMsg[]={
	MO_,NO_,RA_,RU_,EOM_,
};
const	u8	StereoMsg[]={
	SU_,TE_,RE_,O_,EOM_,
};

u8	pageno;
u8	posx;
u8	posy;
u8	wazapos;

int	SaveFlag=0;

//-------------------- サブルーチン宣言 ------------------------

void	DebugFightInit(void);
void	DebugFightInit2(void);
void	DebugFightMain(void);
void	DebugFightWaza(void);
void	FightStartAct(void);
void	ParaPut(u8);
void	ParaPutAll(void);
void	WazaPut(void);
void	WazaPutAll(void);
void	TokuseiPut(u8);
void	SoundFlagPut(void);
void	OptPut(void);
void	CsrOn(void);
void	CsrOff(void);
static void	WazaCsrOn(void);
static void	WazaCsrOff(void);
void	DataClear(void);
void	InitPokeHeight(void);
void	MainPokeHeight(void);
void	PokeHeightSequence(u8);

void	MultiSioTestMain(void);

static void debug_fight_v_blank_intr(void);

static int write_flash_main( u16 sec, u8 * src ,u32 size );
static int write_flash( u8 sec, void * src, u32 size );
static void read_flash( u8 sec, void * src ,u32 size );

static void PokeDecord(u8);

#define	SAVE_SEC	0x1f		//デバッグファイト用データのセーブセクタ

//----------------------------------------------------------
//	プロトタイプ宣言	関数＆ﾃﾞｰﾀ
//----------------------------------------------------------

//==============================================================
//                       メインルーチン
//==============================================================
//
void	DebugFightInit(void)
{

	DataClear();
	DebugFightInit2();
	DebugWork=0;
}

void	DataClear()
{
	int	i;

	pokedata[0][0]=MONSNO_KIMORI;
	pokedata[1][0]=MONSNO_KIMORI;

	for(i=1;i<PARA_MAX;i++){
		pokedata[0][i]=TALK_WIN_DATA[i][4];
		pokedata[1][i]=TALK_WIN_DATA[i][4];
	}
	for(i=0;i<6;i++){
		for(wazapos=0;wazapos<4;wazapos++){
			wazadata[0][i][wazapos]=WAZA_WIN_DATA[wazapos][4];
			wazadata[1][i][wazapos]=WAZA_WIN_DATA[wazapos][4];
		}
	}
}

void	DebugFightInit2(void)
{
	int	i;
	m4aSoundVSyncOff();
	SetHBlankFunc(NULL);
	SetVBlankFunc(NULL);

	// Vブランク割込許可フラグのセット

	DmaClear(3, 0, VRAM,(VRAM_END - VRAM), 32);		// 全VRAM初期化

    *(vu16 *)REG_IE = V_BLANK_INTR_FLAG;
    *(vu16 *)REG_DISPCNT = DISP_MODE_0 | DISP_OBJ_ON | DISP_BG0_ON | DISP_BG1_ON | DISP_OBJ_CHAR_1D_MAP;

	ScrX0 = 0;
	ScrY0 = 0;
	ScrX1 = 0;
	ScrY1 = 0;
	ScrX2 = 0;
	ScrY2 = 0;
	ScrX3 = 0;
	ScrY3 = 0;

	*(vu16 *)REG_BG0CNT =
				BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_1
				| 31 << BG_SCREEN_BASE_SHIFT | 2 << BG_CHAR_BASE_SHIFT;
	*(vu16 *)REG_BG1CNT =
				BG_COLOR_16 | BG_SCREEN_SIZE_1 | BG_PRIORITY_1
				| 8 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT;

	*(vu16 *)REG_BLDCNT = 0;
	*(vu16 *)REG_BLDY = 0;

	DecordVram((void *)fight_d_pch_ADRS,(void *)BG_VRAM);
	DecordWram((void *)fight_d_psc_ADRS,&UserWork);
	DecordVram((void *)fight_d_pcl_ADRS,(void *)BG_PLTT);
	DecordVram((void *)fight_d_pcl_ADRS,(void *)BG_PLTT+0x1e0);

	m4aSoundVSyncOn();
    SetVBlankFunc( debug_fight_v_blank_intr );

//	sys.pMainProc=DebugFightMain;
	MainProcChange(DebugFightMain);
	
	InitTask();
	InitActor();
	LasterInit();
	
	PrintScreenInit(DEFAULT_TYPE);
	MsgControlInit(&PokeLabel,DEFAULT_TYPE);	//change 2001.07.12(木) by matsuda

	pageno=0;
	posx=0;
	posy=0;

	for(i=0;i<PARA_MAX;i++){
		ParaPut(i);
	}

	for(wazapos=0;wazapos<4;wazapos++){
		WazaPut();
	}

	TokuseiPut(posy*5);

	SoundFlagPut();
	OptPut();

	wazapos=0;
	CsrOn();

	if(pokedata[0][34]==8)
		FightStartAct();
	else{
		for(i=0;i<8;i++)
			UserWork[YUBIWOHURU_DEBUG+i]=0;	//技デバッグ用のワーク
	}

}

static void EvStrBufSet(u8 chr,u8 len)
{
	int	i;

	for(i=0;i<len;i++)
		EvStrBuf0[i]=chr;
	EvStrBuf0[i]=EOM_;
}

static void PokeSexSet(u8 flg)
{
	switch(PPD[pokedata[pageno][posy*5]].sex){
		case MONS_MALE:
			pokedata[pageno][4+posy*5]=2;
			break;
		case MONS_FEMALE:
			pokedata[pageno][4+posy*5]=3;
			break;
		case MONS_UNKNOWN:
			pokedata[pageno][4+posy*5]=4;
			break;
		default:
			pokedata[pageno][4+posy*5]&=1;
			if(flg)
				pokedata[pageno][4+posy*5]^=1;
			else
				pokedata[pageno][4+posy*5]=0;
			break;
	}
}

void	SentouCalc(u8 flg)
{
	s8	sentou10=0;
	s8	sentou1=0;

	sentou1=pokedata[pageno][posx+posy*5];
	while(sentou1>=10){
		sentou1-=10;
		sentou10++;
	}

	if(flg&0x2){
		if(flg&0x01)
			sentou10++;
		else
			sentou10--;
		if(sentou10<0)
			sentou10=9;
		if(sentou10>9)
			sentou10=0;
	}
	else{
		if(flg&0x01)
			sentou1++;
		else
			sentou1--;
		if(sentou1<1)
			sentou1=9;
		if(sentou1>9)
			sentou1=1;
	}
	pokedata[pageno^1][posx+posy*5]=pokedata[pageno][posx+posy*5]=sentou10*10+sentou1;
}

void	DebugFightMain(void)
{
	int	i;
	if(sys.RealCont == (SELECT_BUTTON|L_BUTTON))
	{
		PM_SoftReset();
	}

	if(sys.RealTrg == SELECT_BUTTON){
		if(posy<6){
			wazapos=0;
			WazaCsrOn();
//			sys.pMainProc=DebugFightWaza;
			MainProcChange(DebugFightWaza);
		}
		if((posx==0)&&(posy==6)){
			sys.pReturnProc=DebugFightInit2;			// 戦闘終了後の復帰先
			PokeParaSet(&PokeParaMine[0],pokedata[0][0],pokedata[0][1],POW_RND,
						RND_NO_SET,0,ID_NO_SET,0);
			for(i=0;i<4;i++){
				PokeParaPut(&PokeParaMine[0],ID_waza1+i,(u8 *)&wazadata[0][0][i]);
				PokeParaPut(&PokeParaMine[0],ID_pp1+i,(u8 *)&WTD[wazadata[0][0][i]].pp);
			}
			switch(pokedata[0][30]){
				case 1:
					ShinkaReturnProc=DebugFightInit2;			// 戦闘終了後の復帰先
					InitShinkaAct(&PokeParaMine[0],pokedata[0][5],SHINKA_CANCEL_ON,0);
					break;
				case 2:
					InitPokeHeight();							//進化デモ　デバッグ
					break;
			}
		}
		if((posx==1)&&(posy==6)){
			i=MyData.btl_eff_sw;
			i|=(MyData.sound_mode<<1);
			i++;
			if(i==4)
				i=0;
			MyData.btl_eff_sw=i&1;
			MyData.sound_mode=(i&2)>>1;
			pokStereoMono(MyData.sound_mode);
			OptPut();
		}
	}

	if(sys.RealTrg == START_BUTTON)
	{
		FightStartAct();
	}

	if(sys.RealTrg == U_KEY){
		CsrOff();
		if(posy)
			posy--;
		else
			posy=6;
		WazaPutAll();
		TokuseiPut(posy*5);
		CsrOn();
	}
	if(sys.RealTrg == D_KEY){
		CsrOff();
		if(posy==6)
			posy=0;
		else
			posy++;
		WazaPutAll();
		TokuseiPut(posy*5);
		CsrOn();
	}

	if(sys.RealTrg == L_KEY){
		CsrOff();
		if(posx)
			posx--;
		else{
			if(pageno!=0){
				pageno=0;
				posx=4;
				ScrX1=0x000;
				ParaPutAll();
				WazaPutAll();
				TokuseiPut(posy*5);
			}
		}
		CsrOn();
	}
	if(sys.RealTrg == R_KEY){
		CsrOff();
		if(posx!=4)
			posx++;
		else{
			if(pageno==0){
				pageno=1;
				posx=0;
				ScrX1=0x100;
				ParaPutAll();
				WazaPutAll();
				TokuseiPut(posy*5);
			}
		}
		CsrOn();
	}

	if((sys.Repeat & B_BUTTON)!=0){
		switch(posx+posy*5){
			case 31:
				DataClear();
				ParaPutAll();
				WazaPutAll();
				SoundFlagPut();
				OptPut();
				TokuseiPut(posy*5);
				break;
			case 32:
				read_flash(SAVE_SEC,&pokedata,sizeof(pokedata)+sizeof(wazadata));
				ParaPutAll();
				WazaPutAll();
				SoundFlagPut();
				OptPut();
				TokuseiPut(posy*5);
				break;
			case 33:
				write_flash(SAVE_SEC,&pokedata,sizeof(pokedata)+sizeof(wazadata));
				break;
			case 34:
				if(pokedata[0][34]){
					pokedata[0][34]--;
					pokedata[1][34]--;
				}
				else{
					pokedata[0][34]=SOUND_FLAG_MAX;
					pokedata[1][34]=SOUND_FLAG_MAX;
				}
				SoundFlagPut();
				break;
			case 30:
				SentouCalc(0);
				ParaPut(posx+posy*5);
				break;
			default:
				if((posx==4)&&(posy<6))
					PokeSexSet(1);
				else{
					pokedata[pageno][posx+posy*5]--;
					if(pokedata[pageno][posx+posy*5]<TALK_WIN_DATA[posx+posy*5][4])
						pokedata[pageno][posx+posy*5]=TALK_WIN_DATA[posx+posy*5][3];
				}
				if(posx==0){
					PokeSexSet(0);
					ParaPut(4+posy*5);
				}
				ParaPut(posx+posy*5);
				TokuseiPut(posy*5);
				break;
		}
	}
	if((sys.Repeat & A_BUTTON)!=0){
		switch(posx+posy*5){
			case 31:
				DataClear();
				ParaPutAll();
				WazaPutAll();
				SoundFlagPut();
				OptPut();
				TokuseiPut(posy*5);
				break;
			case 32:
				read_flash(SAVE_SEC,&pokedata,sizeof(pokedata)+sizeof(wazadata));
				ParaPutAll();
				WazaPutAll();
				SoundFlagPut();
				OptPut();
				TokuseiPut(posy*5);
				break;
			case 33:
				write_flash(SAVE_SEC,&pokedata,sizeof(pokedata)+sizeof(wazadata));
				break;
			case 34:
				if(pokedata[0][34]<SOUND_FLAG_MAX){
					pokedata[0][34]++;
					pokedata[1][34]++;
				}
				else{
					pokedata[0][34]=0;
					pokedata[1][34]=0;
				}
				SoundFlagPut();
				break;
			case 30:
				SentouCalc(1);
				ParaPut(posx+posy*5);
				break;
			default:
				if((posx==4)&&(posy<6))
					PokeSexSet(1);
				else{
					pokedata[pageno][posx+posy*5]++;
					if(pokedata[pageno][posx+posy*5]>TALK_WIN_DATA[posx+posy*5][3])
						pokedata[pageno][posx+posy*5]=TALK_WIN_DATA[posx+posy*5][4];
				}
				if(posx==0){
					PokeSexSet(0);
					ParaPut(4+posy*5);
				}
				ParaPut(posx+posy*5);
				TokuseiPut(posy*5);
				break;
		}
	}

	if((sys.Repeat & L_BUTTON)!=0){
		if((posx==4)&&(posy<6))
			PokeSexSet(1);
		else{
			if(posx+posy*5==30){
				SentouCalc(2);
			}
			else{
				pokedata[pageno][posx+posy*5]-=10;
				while(pokedata[pageno][posx+posy*5]<TALK_WIN_DATA[posx+posy*5][4])
					pokedata[pageno][posx+posy*5]+=TALK_WIN_DATA[posx+posy*5][3];
			}
		}
		if(posx==0){
			PokeSexSet(0);
			ParaPut(4+posy*5);
		}
		ParaPut(posx+posy*5);
		TokuseiPut(posy*5);
	}
	if((sys.Repeat & R_BUTTON)!=0){
		if((posx==4)&&(posy<6))
			PokeSexSet(1);
		else{
			if(posx+posy*5==30)
				SentouCalc(3);
			else{
				pokedata[pageno][posx+posy*5]+=10;
				while(pokedata[pageno][posx+posy*5]>TALK_WIN_DATA[posx+posy*5][3])
					pokedata[pageno][posx+posy*5]-=TALK_WIN_DATA[posx+posy*5][3];
			}
		}
		if(posx==0){
			PokeSexSet(0);
			ParaPut(4+posy*5);
		}
		ParaPut(posx+posy*5);
		TokuseiPut(posy*5);
	}
	JumpActor();
	SetActor();
}

void	DebugFightWaza(void)
{
	u8	csrpos;

	csrpos=posx+posy*5;

	if(sys.RealCont == (SELECT_BUTTON|L_BUTTON))
	{
		PM_SoftReset();
	}

	if(sys.RealTrg == SELECT_BUTTON){
		WazaCsrOff();
//		sys.pMainProc=DebugFightMain;
		MainProcChange(DebugFightMain);
	}

	if(sys.RealTrg == START_BUTTON)
	{
		FightStartAct();
	}

	if((sys.RealTrg == U_KEY)||(sys.RealTrg == D_KEY)){
		WazaCsrOff();
		wazapos^=2;
		WazaCsrOn();
	}

	if((sys.RealTrg == L_KEY)||(sys.RealTrg == R_KEY)){
		WazaCsrOff();
		wazapos^=1;
		WazaCsrOn();
	}

	if((sys.Repeat & B_BUTTON)!=0){
		wazadata[pageno][csrpos/5][wazapos]--;
		if(wazadata[pageno][csrpos/5][wazapos]<WAZA_WIN_DATA[wazapos][4])
			wazadata[pageno][csrpos/5][wazapos]=WAZA_WIN_DATA[wazapos][3];
		WazaPut();
	}

	if((sys.Repeat & A_BUTTON)!=0){
		wazadata[pageno][csrpos/5][wazapos]++;
		if(wazadata[pageno][csrpos/5][wazapos]>WAZA_WIN_DATA[wazapos][3])
			wazadata[pageno][csrpos/5][wazapos]=WAZA_WIN_DATA[wazapos][4];
		WazaPut();
	}

	if((sys.Repeat & L_BUTTON)!=0){
		wazadata[pageno][csrpos/5][wazapos]-=10;
		while(wazadata[pageno][csrpos/5][wazapos]<WAZA_WIN_DATA[wazapos][4])
			wazadata[pageno][csrpos/5][wazapos]+=WAZA_WIN_DATA[wazapos][3];
		WazaPut();
	}

	if((sys.Repeat & R_BUTTON)!=0){
		wazadata[pageno][csrpos/5][wazapos]+=10;
		while(wazadata[pageno][csrpos/5][wazapos]>WAZA_WIN_DATA[wazapos][3])
			wazadata[pageno][csrpos/5][wazapos]-=WAZA_WIN_DATA[wazapos][3];
		WazaPut();
	}

	JumpActor();
	SetActor();
}

void	FightStartAct()
{
	int i,j;
	u8	sex;
	u8	annon=0;

	DebugMainFlag=1;

	sex=pp_rand()%4;
	PM_strcpy(MyData.my_name,DebugName[sex]);
	MyData.my_sex=sex>>1;

	PokeParaMineInit();
	PokeParaEnemyInit();

	i=pokedata[0][30];
	j=0;

	while(i>=10){
		i-=10;
		j++;
	}
	FightType=FightTypeTbl[i-1];
	DebugFightFlag=DEBUG_FIGHT_DEBUG;
	GroundNo=j;

	if(FightType&FIGHT_TYPE_SAFARI)
		SafariModeStart();			//サファリボールを30個持つ
	if((pokedata[0][30]>=2)&&
	   (pokedata[0][30]<=4))
		FieldTrainerID=(pp_rand()&7)+1;
	PokeCountMine=0;

	for(i=0;i<30;i+=5){
		if(pokedata[0][i]!=0){
			switch(pokedata[0][i+4]){
				case 0:
				case 2:
					sex=MONS_MALE;
					break;
				case 1:
				case 3:
					sex=MONS_FEMALE;
					break;
				default:
					sex=MONS_UNKNOWN;
					break;
			}
			if((pokedata[0][i]==MONSNO_ANNOON)&&
			   (i+5<30))
				annon=pokedata[0][i+2+5];
			else
				annon=0;
			PokeParaSetSexChr(&PokeParaEnemy[i/5],pokedata[0][i],pokedata[0][i+1],0,sex,CHR_GANBARIYA,annon);
		}
		PokeParaPut(&PokeParaEnemy[i/5],ID_item,(u8 *)&pokedata[0][i+2]);
		if((pokedata[0][i+2]<=ITEM_BALL_END)&&
		   (pokedata[0][i+2]>0))
			PokeParaPut(&PokeParaEnemy[i/5],ID_get_ball,(u8 *)&pokedata[0][i+2]);
		if((pokedata[0][i+3]!=0)&&(pokedata[0][i+3]!=3)){
			if(pokedata[0][i+3]<3)
				j=pokedata[0][i+3]-1;
			else
				j=pokedata[0][i+3]-4;
			PokeParaPut(&PokeParaEnemy[i/5],ID_speabi,(u8 *)&j);
		}
		if(pokedata[1][i]!=0){
			switch(pokedata[1][i+4]){
				case 0:
				case 2:
					sex=MONS_MALE;
					break;
				case 1:
				case 3:
					sex=MONS_FEMALE;
					break;
				default:
					sex=MONS_UNKNOWN;
					break;
			}
			if((pokedata[1][i]==MONSNO_ANNOON)&&
			   (i+5<30))
				annon=pokedata[1][i+2+5];
			else
				annon=0;
			PokeParaSetSexChr(&PokeParaMine[i/5],pokedata[1][i],pokedata[1][i+1],0,sex,CHR_GANBARIYA,annon);
			PokeCountMine++;
		}
		PokeParaPut(&PokeParaMine[i/5],ID_item,(u8 *)&pokedata[1][i+2]);
		if((pokedata[0][i+2]<=ITEM_BALL_END)&&
		   (pokedata[0][i+2]>0))
			PokeParaPut(&PokeParaMine[i/5],ID_get_ball,(u8 *)&pokedata[1][i+2]);
		if((pokedata[1][i+3]!=0)&&(pokedata[1][i+3]!=3)){
			if(pokedata[1][i+3]<3)
				j=pokedata[1][i+3]-1;
			else
				j=pokedata[1][i+3]-4;
			PokeParaPut(&PokeParaMine[i/5],ID_speabi,(u8 *)&j);
		}
		if(pokedata[1][i+3]>2){
			PokeParaPut(&PokeParaMine[i/5],ID_oyaname,(u8 *)&DebugName[4]);
			DebugFightFlag|=DEBUG_FIGHT_NO_BADGE;
		}
	}
	for(j=0;j<6;j++){
		for(i=0;i<4;i++){
			PokeParaPut(&PokeParaEnemy[j],ID_waza1+i,(u8 *)&wazadata[0][j][i]);
			PokeParaPut(&PokeParaEnemy[j],ID_pp1+i,(u8 *)&WTD[wazadata[0][j][i]].pp);
			PokeParaPut(&PokeParaMine[j],ID_waza1+i,(u8 *)&wazadata[1][j][i]);
			PokeParaPut(&PokeParaMine[j],ID_pp1+i,(u8 *)&WTD[wazadata[1][j][i]].pp);
		}
	}

//	OrusubanTaisenSet((SECRET_BASE_DATA *)&SBD_DATA);

	if(pokedata[0][34]==8){
		DebugFightFlag|=DEBUG_FIGHT_AUTO;
		FightBGMSet();
	}
	else if(pokedata[0][34]==7){
		DebugFightFlag|=DEBUG_FIGHT_NO_ITEM_AI;
		FightBGMSet();
	}
	else if(pokedata[0][34]==6){
		DebugFightFlag|=DEBUG_FIGHT_TRAINER;
		if(pokedata[0][2]>=6)
			UserWork[DEBUG_TRAINER]=pokedata[0][2]-2;
		else
			UserWork[DEBUG_TRAINER]=pokedata[0][2];
		FightBGMSet();
	}
	else if(pokedata[0][34]==5){
		DebugFightFlag|=DEBUG_FIGHT_AI_DEBUG|DEBUG_FIGHT_NO_ITEM_AI;
		FightBGMSet();
	}
	else{
		if((pokedata[0][34]&1)==0)
			FightBGMSet();
		if(pokedata[0][34]&2)
			DebugFightFlag|=DEBUG_FIGHT_WAZA_DEBUG;
		if(pokedata[0][34]&4)
			DebugFightFlag|=(DEBUG_FIGHT_WAZA_DEBUG|DEBUG_FIGHT_PARTY_ATTACK);
	}

	sys.pReturnProc=DebugFightInit2;			// 戦闘終了後の復帰先
//	sys.pMainProc=InitEncount;
	MainProcChange(InitEncount);

	InitPocketItem();
	AddItem(1,10);			//モンスターボール
	AddItem(2,10);			//モンスターボール
	AddItem(3,10);			//モンスターボール
	AddItem(4,10);			//モンスターボール
	AddItem(5,10);			//モンスターボール
	AddItem(6,10);			//モンスターボール
	AddItem(7,10);			//モンスターボール
	AddItem(8,10);			//モンスターボール
	AddItem(9,10);			//モンスターボール
	AddItem(10,10);			//モンスターボール
	AddItem(11,10);			//モンスターボール
	AddItem(12,10);			//モンスターボール
	AddItem(ITEM_KAIHUKUNOKUSURI,99);	
	AddItem(ITEM_MANTANNOKUSURI,99);
	AddItem(ITEM_GENKINOKATAMARI,99);
	AddItem(ITEM_PIIPIIEIDO,99);
	AddItem(ITEM_PIIPIIRIKABAA,99);
	AddItem(ITEM_PIIPIIMAKKUSU,99);
	AddItem(ITEM_EFEKUTOGAADO,99);
	AddItem(ITEM_KURITHIKATTAA,99);
	AddItem(ITEM_PURASUPAWAA,99);
	AddItem(ITEM_DHIFENDAA,99);
	AddItem(ITEM_SUPIIDAA,99);
	AddItem(ITEM_YOKUATAARU,99);
	AddItem(ITEM_PIPPININGYOU,99);

	for(i=0;i<15;i++)
		AddCube((CUBE *)&dumy_data[i]);
	
}

//==============================================================
//        通信テストルーチン　森君勝手に書き換えていいよん
//==============================================================


const u8 TestCode[]={
	TE_,SU_,TO_,de_,su_,EOM_,
};
const u8 TestCode2[]={
	u_,ke_,to_,ttu_,ta_,ttu_,te_,EOM_,
};

const u8 ErrorMsg[]={
	se_,tu_,zo_,ku_,E_,RA_,bou_,EOM_,
};

#if 0
void	MultiSioTestMain()
{
//送信されたデータは、RecvPoolBuf[id][]に代入されてます
	if(pokemon_sio_flag==0){
				MsgPutSet(&PokeLabel,
				(u8 *)&ErrorMsg,
				WAZA_WIN_DATA[0][0],
				WAZA_WIN_DATA[0][1],
				WAZA_WIN_DATA[0][2]);
				MsgPut(&PokeLabel);
	}
	if(pokemon_sio_flag!=0){
		switch(DebugWork){
			case 0:				//自分が親かチェック
				if(GetSioConnectId()==0){
					SplitDataSendStart(GetAnotherSendTo(),(u8 *)&TestCode,6);
					DebugWork++;
				}
				else	DebugWork=2;
				break;
			case 1:				//通信終了待ち(親）
				if(SplitDataResult()==0) break;
				SplitDataResultReset();
				MsgPutSet(&PokeLabel,
				(u8 *)&RecvPoolBuf2[GetSioConnectId()^1],
				WAZA_WIN_DATA[0][0],
				WAZA_WIN_DATA[0][1],
				WAZA_WIN_DATA[0][2]);
				MsgPut(&PokeLabel);
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&TestCode2,8);
				DebugWork=4;
				break;
			case 2:				//通信終了待ち(子）
				if(SplitDataResult()==0) break;
				SplitDataResultReset();
				MsgPutSet(&PokeLabel,
				(u8 *)&RecvPoolBuf2[GetSioConnectId()^1],
				WAZA_WIN_DATA[0][0],
				WAZA_WIN_DATA[0][1],
				WAZA_WIN_DATA[0][2]);
				MsgPut(&PokeLabel);
				SplitDataSendStart(GetAnotherSendTo(),(u8 *)&TestCode2,8);
				DebugWork=3;
				break;
			case 3:				//通信終了待ち(子）
				if(SplitDataResult()==0) break;
				SplitDataResultReset();
				MsgPutSet(&PokeLabel,
				(u8 *)&RecvPoolBuf2[GetSioConnectId()^1],
				WAZA_WIN_DATA[0][0],
				WAZA_WIN_DATA[0][1],
				WAZA_WIN_DATA[0][2]);
				MsgPut(&PokeLabel);
				DebugWork=4;
				break;
			case 4:				//通信終了待ち(子）
				DebugWork=4;
				break;
		}
	}
}
#endif

//==============================================================
//                    割り込みルーチン
//==============================================================

//--------------------------------------------------------------
//                    Ｖブランク関数
//--------------------------------------------------------------
static void debug_fight_v_blank_intr(void)
{
	DmaCopy(3 , UserWork , BG_VRAM+8*0x800,0x1000,16);
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
}

//==============================================================
//                    割り込みルーチン
//==============================================================

//--------------------------------------------------------------
//                    Ｈブランク関数
//--------------------------------------------------------------

void	poke_height_h_blank_intr(void)
{
}

//--------------------------------------------------------------
//                    Ｖブランク関数
//--------------------------------------------------------------

void	poke_height_v_blank_intr(void)
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

//==============================================================
//                      サブルーチン
//==============================================================
//
void	ParaPutAll()
{
	int	i;
	for(i=0;i<PARA_MAX;i++){
		ParaPut(i);
	}
}

void	WazaPutAll()
{
	int	i;
	i=wazapos;
	for(wazapos=0;wazapos<4;wazapos++){
		WazaPut();
	}
	wazapos=i;
}

void	ParaPut(u8 pos)
{
	int	i;
	switch(pos){
		case 0:
		case 5:
		case 10:
		case 15:
		case 20:
		case 25:
			EvStrBufSet(spc_,8);
			MsgPutSet(&PokeLabel,
					  EvStrBuf0,
					  TALK_WIN_DATA[pos][0],
					  TALK_WIN_DATA[pos][1],
					  TALK_WIN_DATA[pos][2]);
			MsgPut(&PokeLabel);
			PM_NumMsgSet(EvStrBuf0,pokedata[pageno][pos],NUM_MODE_ZERO,3);
			PM_strcat(EvStrBuf0,PokeNameData[pokedata[pageno][pos]]);
			MsgPutSet(&PokeLabel,
			EvStrBuf0,
			TALK_WIN_DATA[pos][0],
			TALK_WIN_DATA[pos][1],
			TALK_WIN_DATA[pos][2]);
			MsgPut(&PokeLabel);
			break;
		case 1:
		case 6:
		case 11:
		case 16:
		case 21:
		case 26:
		case 30:
			PM_NumMsgSet(EvStrBuf0,pokedata[pageno][pos],NUM_MODE_ZERO,3);
			MsgPutSet(&PokeLabel,
			EvStrBuf0,
			TALK_WIN_DATA[pos][0],
			TALK_WIN_DATA[pos][1],
			TALK_WIN_DATA[pos][2]);
			MsgPut(&PokeLabel);
			break;
		case 2:
		case 7:
		case 12:
		case 17:
		case 22:
		case 27:
			EvStrBufSet(spc_,11);
			MsgPutSet(&PokeLabel,
					  EvStrBuf0,
					  TALK_WIN_DATA[pos][0],
					  TALK_WIN_DATA[pos][1],
					  TALK_WIN_DATA[pos][2]);
			MsgPut(&PokeLabel);
			PM_NumMsgSet(EvStrBuf0,pokedata[pageno][pos],NUM_MODE_ZERO,3);
			if(pokedata[pageno][pos])
				PM_strcat(EvStrBuf0,ItemNameGet(pokedata[pageno][pos]));
			else
				PM_strcat(EvStrBuf0,BouMsg);
			MsgPutSet(&PokeLabel,
			EvStrBuf0,
			TALK_WIN_DATA[pos][0],
			TALK_WIN_DATA[pos][1],
			TALK_WIN_DATA[pos][2]);
			MsgPut(&PokeLabel);
			break;
		case 4:
		case 9:
		case 14:
		case 19:
		case 24:
		case 29:
			EvStrBufSet(spc_,2);
			MsgPutSet(&PokeLabel,
			EvStrBuf0,
			TALK_WIN_DATA[pos][0],
			TALK_WIN_DATA[pos][1],
			TALK_WIN_DATA[pos][2]);
			MsgPut(&PokeLabel);
			i=0;
			switch(pokedata[pageno][pos]){
				case 0:
					EvStrBuf0[i++]=osu_;
					break;
				case 1:
					EvStrBuf0[i++]=mesu_;
					break;
				case 2:
					EvStrBuf0[i++]=osu_;
					EvStrBuf0[i++]=osu_;
					break;
				case 3:
					EvStrBuf0[i++]=mesu_;
					EvStrBuf0[i++]=mesu_;
					break;
				default:
					EvStrBuf0[i++]=hate_;
					break;
			}
			EvStrBuf0[i]=EOM_;
			MsgPutSet(&PokeLabel,
			EvStrBuf0,
			TALK_WIN_DATA[pos][0],
			TALK_WIN_DATA[pos][1],
			TALK_WIN_DATA[pos][2]);
			MsgPut(&PokeLabel);
			break;
		case 31:
		case 32:
		case 33:
		case 34:
			break;
		default:
			PM_NumMsgSet(EvStrBuf0,pokedata[pageno][pos],NUM_MODE_ZERO,1);
			MsgPutSet(&PokeLabel,
			EvStrBuf0,
			TALK_WIN_DATA[pos][0],
			TALK_WIN_DATA[pos][1],
			TALK_WIN_DATA[pos][2]);
			MsgPut(&PokeLabel);
			break;
	}
}

void	WazaPut()
{
	u8	csrpos;

	csrpos=posx+posy*5;

	if(csrpos>=30) return;
	EvStrBufSet(spc_,10);
	MsgPutSet(&PokeLabel,
	EvStrBuf0,
	WAZA_WIN_DATA[wazapos][0],
	WAZA_WIN_DATA[wazapos][1],
	WAZA_WIN_DATA[wazapos][2]);
	MsgPut(&PokeLabel);
	PM_NumMsgSet(EvStrBuf0,wazadata[pageno][csrpos/5][wazapos],NUM_MODE_ZERO,3);
	PM_strcat(EvStrBuf0,WazaNameData[wazadata[pageno][csrpos/5][wazapos]]);
	MsgPutSet(&PokeLabel,
	EvStrBuf0,
	WAZA_WIN_DATA[wazapos][0],
	WAZA_WIN_DATA[wazapos][1],
	WAZA_WIN_DATA[wazapos][2]);
	MsgPut(&PokeLabel);
}

void	TokuseiPut(u8 pos)
{
	if(pos<30){
		EvStrBufSet(spc_,7);
		MsgPutSet(&PokeLabel,
		EvStrBuf0,
		TOKUSEI_WIN_DATA[0][0],
		TOKUSEI_WIN_DATA[0][1],
		TOKUSEI_WIN_DATA[0][2]);
		MsgPut(&PokeLabel);
		PM_strcpy(EvStrBuf0,SpecialAbirityMsg[PPD[pokedata[pageno][pos]].speabi1]);
		MsgPutSet(&PokeLabel,
		EvStrBuf0,
		TOKUSEI_WIN_DATA[0][0],
		TOKUSEI_WIN_DATA[0][1],
		TOKUSEI_WIN_DATA[0][2]);
		MsgPut(&PokeLabel);
		EvStrBufSet(spc_,7);
		MsgPutSet(&PokeLabel,
		EvStrBuf0,
		TOKUSEI_WIN_DATA[1][0],
		TOKUSEI_WIN_DATA[1][1],
		TOKUSEI_WIN_DATA[1][2]);
		MsgPut(&PokeLabel);
		PM_strcpy(EvStrBuf0,SpecialAbirityMsg[PPD[pokedata[pageno][pos]].speabi2]);
		MsgPutSet(&PokeLabel,
		EvStrBuf0,
		TOKUSEI_WIN_DATA[1][0],
		TOKUSEI_WIN_DATA[1][1],
		TOKUSEI_WIN_DATA[1][2]);
		MsgPut(&PokeLabel);
	}
	else{
		PM_strcpy(EvStrBuf0,SpecialAbirityMsg[0]);
		MsgPutSet(&PokeLabel,
		EvStrBuf0,
		TOKUSEI_WIN_DATA[0][0],
		TOKUSEI_WIN_DATA[0][1],
		TOKUSEI_WIN_DATA[0][2]);
		MsgPut(&PokeLabel);
		MsgPutSet(&PokeLabel,
		EvStrBuf0,
		TOKUSEI_WIN_DATA[1][0],
		TOKUSEI_WIN_DATA[1][1],
		TOKUSEI_WIN_DATA[1][2]);
		MsgPut(&PokeLabel);
	}
}

void	SoundFlagPut()
{
	PM_NumMsgSet(EvStrBuf0,pokedata[0][34],NUM_MODE_LEFT,1);
	MsgPutSet(&PokeLabel,
		  	  EvStrBuf0,
			  TALK_WIN_DATA[PARA_MAX][0],
			  TALK_WIN_DATA[PARA_MAX][1],
			  TALK_WIN_DATA[PARA_MAX][2]);
	MsgPut(&PokeLabel);
}

void	OptPut(void)
{
	if(MyData.btl_eff_sw)
		MsgPutSet(&PokeLabel,OffMsg,418,21+32*pageno,0);
	else
		MsgPutSet(&PokeLabel,OnMsg,418,21+32*pageno,0);
	MsgPut(&PokeLabel);
	if(MyData.sound_mode)
		MsgPutSet(&PokeLabel,StereoMsg,422,24+32*pageno,0);
	else
		MsgPutSet(&PokeLabel,MonoMsg,422,24+32*pageno,0);
	MsgPut(&PokeLabel);
}

//---------add matsuda------------------------
const ActOamData JOamData = {
		0,		//u32 VPos:8;             // Ｙ座標
		3,		//u32 AffineMode:2;       // アフィンモード
		0,		//u32 ObjMode:2;          // ＯＢＪモード
		OFF,	//u32 Mosaic:1;           // モザイク
		0,		//u32 ColorMode:1;        // １６色/２５６色 選択
		0,		//u32 Shape:2;            // ＯＢＪ形状
	
		0,		//u32 HPos:9;             // Ｘ座標
		0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
		3,		//u32 Size:2;             // ＯＢＪサイズ
	
		0,		//u32 CharNo:10;          // キャラクタＮｏ
		0,		//u32 Priority:2;         // 表示優先
		0,		//u32 Pltt:4;             // パレットＮｏ
};

#if 0
static void TestWait(void)
{
	;
}
#endif

extern const u8 a_mine_Character[14208];

/*
const actAnm TestAnm0[] = 
#if 0
{
	{OBJ16_64x64 * 0, 16,0,0},				//ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ  ｳｪｲﾄ  Hflip  Vflip
	{ACT_ANMLOOP, 0,0,0},
};
#else
{
		{1,10,0,0},
		{2,10,0,0},
		{1,8,0,0},
		{2,6,0,0},
		{4,20,0,0},
		{3,6,0,0},
		{0,5,0,0},
		{5,5,0,0},
		{ACT_ANMLOOP, 0,0,0},
};
#endif

const actAnm TestAnm1[] = 		//ｱﾆﾒﾃﾞｰﾀが入っている構造体ﾃｰﾌﾞﾙ
{
	{8, 9,0,0,},
	{ACT_ANMEND, 0,0,0},
};

const actAnm *TestAnmTbl[] = 	//actAnmのﾃｰﾌﾞﾙのｱﾄﾞﾚｽを持つﾃｰﾌﾞﾙ
{
	TestAnm0,
	TestAnm1,
};
*/

/*
const actHeader JikiActHeader = 
{
	-1,
	&JOamData,
	TestAnmTbl,
	0,
	TestWait
};
*/

const	int	CsrPosTbl[2][35]={
	{
	 0*2+ 3*0x40, 9*2+ 3*0x40,13*2+ 3*0x40,25*2+ 3*0x40,27*2+ 3*0x40,
	 0*2+ 5*0x40, 9*2+ 5*0x40,13*2+ 5*0x40,25*2+ 5*0x40,27*2+ 5*0x40,
	 0*2+ 7*0x40, 9*2+ 7*0x40,13*2+ 7*0x40,25*2+ 7*0x40,27*2+ 7*0x40,
	 0*2+ 9*0x40, 9*2+ 9*0x40,13*2+ 9*0x40,25*2+ 9*0x40,27*2+ 9*0x40,
	 0*2+11*0x40, 9*2+11*0x40,13*2+11*0x40,25*2+11*0x40,27*2+11*0x40,
	 0*2+13*0x40, 9*2+13*0x40,13*2+13*0x40,25*2+13*0x40,27*2+13*0x40,
	 0*2+19*0x40,10*2+19*0x40,15*2+19*0x40,20*2+19*0x40,25*2+19*0x40,
	},
	{
	 0*2+ 3*0x40+0x800, 9*2+ 3*0x40+0x800,13*2+ 3*0x40+0x800,25*2+ 3*0x40+0x800,27*2+ 3*0x40+0x800,
	 0*2+ 5*0x40+0x800, 9*2+ 5*0x40+0x800,13*2+ 5*0x40+0x800,25*2+ 5*0x40+0x800,27*2+ 5*0x40+0x800,
	 0*2+ 7*0x40+0x800, 9*2+ 7*0x40+0x800,13*2+ 7*0x40+0x800,25*2+ 7*0x40+0x800,27*2+ 7*0x40+0x800,
	 0*2+ 9*0x40+0x800, 9*2+ 9*0x40+0x800,13*2+ 9*0x40+0x800,25*2+ 9*0x40+0x800,27*2+ 9*0x40+0x800,
	 0*2+11*0x40+0x800, 9*2+11*0x40+0x800,13*2+11*0x40+0x800,25*2+11*0x40+0x800,27*2+11*0x40+0x800,
	 0*2+13*0x40+0x800, 9*2+13*0x40+0x800,13*2+13*0x40+0x800,25*2+13*0x40+0x800,27*2+13*0x40+0x800,
	 0*2+19*0x40+0x800,10*2+19*0x40+0x800,15*2+19*0x40+0x800,20*2+19*0x40+0x800,25*2+19*0x40+0x800
	},
};

void	CsrOn(void)
{
		UserWork[CsrPosTbl[pageno][posx+posy*5]]=0x6d;
}

void	CsrOff(void)
{
		UserWork[CsrPosTbl[pageno][posx+posy*5]]=0x81;
}

const	int	WazaCsrPosTbl[2][4]={
	{
	 0*2+15*0x40,11*2+15*0x40,
	 0*2+17*0x40,11*2+17*0x40,
	},
	{
	 0*2+15*0x40+0x800,11*2+15*0x40+0x800,
	 0*2+17*0x40+0x800,11*2+17*0x40+0x800,
	},
};

static void	WazaCsrOn(void)
{
		UserWork[WazaCsrPosTbl[pageno][wazapos]]=0x6d;
}

static void	WazaCsrOff(void)
{
		UserWork[WazaCsrPosTbl[pageno][wazapos]]=0x81;
}

//----------------------------------------------------------
//		ポケモン高さ調整
//----------------------------------------------------------

enum{
	PHS_SEQNO=0,
	PHS_ACTNO,
	PHS_CSRPOS,
	PHS_CSRPOS2,
};

void	InitPokeHeight(void)
{
	int	i;
	u8	no;
	u8	id;

	for(i=0;i<KAIHATSU_NUM_MAX;i++)
		pokeheight[i]=0;

	SetHBlankFunc(NULL);
	SetVBlankFunc(NULL);

	DmaClear(3,0,VRAM,(VRAM_END-VRAM),32);
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
	ScrY0=0xa0;
	ScrX1=0;
	ScrY1=0;
	ScrX2=0;
	ScrY2=0;
	ScrX3=0;
	ScrY3=0;

	GroundNo=GROUND_ALL;
	FightREGSet();
	FightBGSetAll();

	InitActor();
	InitTask();
	ObjPalManInit();
	ObjPalManStart=4;	// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬNo開始 ここに移動 by matsuda 2001.09.26(水)

	WazaNo=1;

	MsgControlInit(&FightMsg,FIGHT_TYPE);	//change 2001.07.12(木) by matsuda

	DecordPokeCellMake(&PM2FObjDataCell[WazaNo], pm2fpara[WazaNo].size,
				pm2fpara[WazaNo].patcnt, (void*)0x2000000,(void*)DecordAdrs[1],WazaNo);
	DecordPaletteWork((void*)PM2NObjDataPal[WazaNo].pal_data,
		PA_OBJ0 + 0x10 * 1, 0x20);
	PokeActHeaderMake(WazaNo,1);
	no=AddActor(&PokeActHeader,CAI_POKE_X,CAI_POKE_Y+pm2fpara[WazaNo].patcnt,CAI_POKE1PRI);
	ActWork[no].move=SeqEnemyPokeWaitMain;
	ActWork[no].oamData.Pltt=1;

	*(vu16 *)REG_DISPCNT=
		DISP_MODE_0|DISP_BG0_ON|DISP_BG1_ON|DISP_BG2_ON|DISP_BG3_ON|DISP_OBJ_ON|DISP_OBJ_CHAR_1D_MAP;
	SetHBlankFunc(poke_height_h_blank_intr);
	SetVBlankFunc(poke_height_v_blank_intr);
	m4aMPlayAllStop();

	id=AddTask(PokeHeightSequence,0);
	TaskTable[id].work[PHS_SEQNO]=0;
	TaskTable[id].work[PHS_ACTNO]=no;

	MainProcChange(MainPokeHeight);
}

void	MainPokeHeight(void)
{
	JumpActor();
	SetActor();
	BattleTalkMsgPut(&FightMsg);
	PaletteAnime();
	MainTask();
	if(sys.Cont==(SELECT_BUTTON|R_BUTTON))
		MainProcChange(DebugFightInit2);
}

static void MonsNamePut()
{
	EvStrBufSet(spc_,9);
	MsgPutSet(&FightMsg,
			  EvStrBuf0,
			  CGX_START+0x10,2,35);
	MsgPut(&FightMsg);
	PM_NumMsgSet(EvStrBuf0,WazaNo,NUM_MODE_ZERO,3);
	EvStrBuf0[3]=spc_;
	EvStrBuf0[4]=EOM_;
	PM_strcat(EvStrBuf0,PokeNameData[WazaNo]);
	MsgPutSet(&FightMsg,
	EvStrBuf0,
	CGX_START+0x10,2,35);
	MsgPut(&FightMsg);
}

const u8 HeightMsg[]={
	ta_,ka_,sa_,spc_,EOM_
};

const u8 HeightCommandMsg[]={
	CTRL_,C_PAL_,0x01,CTRL_,C_ACOL_,0x04,0x05,0x07,
	ta_,ka_,sa_,spc_,spc_,spc_,hi_,ko_,u_,CR_,
	PO_,KE_,MO_,N_,spc_,spc_,HU_,AA_,I_,RU_,EOM_
};

const u8 FileMsg[]={
	CTRL_,C_PAL_,0x01,CTRL_,C_ACOL_,0x04,0x05,0x07,
	RO_,bou_,DO_,CR_,SE_,bou_,BU_,EOM_
};

const u8 LoadMsg[]={
	RO_,bou_,DO_,si_,ma_,su_,ka_,hate_,EOM_,
};

const u8 SaveMsg[]={
	SE_,bou_,BU_,si_,ma_,su_,ka_,hate_,EOM_,
};

enum{
	PHS_SEQ_INIT=0,
	PHS_SEQ_COMMAND_SELECT,
	PHS_SEQ_FILE,
	PHS_SEQ_LOAD_CONFIRM,
	PHS_SEQ_SAVE_CONFIRM,
};

static void HeightPut(u8 id)
{
	EvStrBufSet(spc_,7);
	MsgPutSet(&FightMsg,
			  EvStrBuf0,
			  CGX_START+0x10+18,2,37);
	MsgPut(&FightMsg);
	PM_strcpy(EvStrBuf0,HeightMsg);
	PM_NumMsgSet(&EvStrBuf0[4],pokeheight[WazaNo-1],NUM_MODE_ZERO,3);
	MsgPutSet(&FightMsg,
	EvStrBuf0,
	CGX_START+0x10+18,2,37);
	MsgPut(&FightMsg);
	ActWork[TaskTable[id].work[PHS_ACTNO]].dy=pokeheight[WazaNo-1]*-1;
}

static void PokeDecord(u8 id)
{
	DecordPokeCellMake(&PM2FObjDataCell[WazaNo], pm2fpara[WazaNo].size,
				pm2fpara[WazaNo].patcnt, (void*)0x2000000,(void*)DecordAdrs[1],WazaNo);
	DecordPaletteWork((void*)PM2NObjDataPal[WazaNo].pal_data,
		PA_OBJ0 + 0x10 * 1, 0x20);
	ActWork[TaskTable[id].work[PHS_ACTNO]].y=CAI_POKE_Y+pm2fpara[WazaNo].patcnt;
	ActWork[TaskTable[id].work[PHS_ACTNO]].dy=pokeheight[WazaNo-1]*-1;
	ActAnmChg(&ActWork[TaskTable[id].work[PHS_ACTNO]],0);
}

static void	HikouFind(s8 ofs,u8 id)
{
	do{
		WazaNo+=ofs;
		if(WazaNo==0)
			WazaNo=KAIHATSU_NUM_MAX;
		if(WazaNo==411)
			WazaNo=1;
	}while((PPD[WazaNo].type1!=HIKOU_TYPE)&&(PPD[WazaNo].type2!=HIKOU_TYPE));
	MonsNamePut();
	HeightPut(id);
	PokeDecord(id);
}

#define	X1	0x18
#define	Y1	0x08+20
#define	X2	0x1d
#define	Y2	0x0d+20
#define	WIN_SCR			24

static void	SelCsrOn(u8 pos)
{
	*(vu16 *)(BG_VRAM+WIN_SCR*0x800+(X1+1)*2+((Y1+1)+pos*2)*0x40)=CSR_CHR_U;
	*(vu16 *)(BG_VRAM+WIN_SCR*0x800+(X1+1)*2+((Y1+2)+pos*2)*0x40)=CSR_CHR_D;
}

static void	SelCsrOff(u8 pos)
{
	*(vu16 *)(BG_VRAM+WIN_SCR*0x800+(X1+1)*2+((Y1+1)+pos*2)*0x40)=SPACE_CHR_B;
	*(vu16 *)(BG_VRAM+WIN_SCR*0x800+(X1+1)*2+((Y1+2)+pos*2)*0x40)=SPACE_CHR_B;
}

static void	FileActInit(u8 id,u8 act)
{
	if(act){
		WindowOpen(X1,Y1,X2,Y2,1);
		MonsNamePut();
		HeightPut(id);
		PokeDecord(id);
		TaskTable[id].work[PHS_SEQNO]=PHS_SEQ_COMMAND_SELECT;
	}
	else{
		WindowOpen(X1,Y1,X2,Y2,0);
		TaskTable[id].work[PHS_SEQNO]=PHS_SEQ_FILE;
		MsgPutSet(&FightMsg,FileMsg,CGX_START3+0x10,X1+2,Y1+1);
		MsgPut(&FightMsg);
		TaskTable[id].work[PHS_CSRPOS2]=0;
		SelCsrOn(0);
	}
}

static void	FileActConfirm(u8 id,u8 pos)
{
	EvStrBufSet(spc_,9);
	MsgPutSet(&FightMsg,
			  EvStrBuf0,
			  CGX_START+0x10,2,35);
	MsgPut(&FightMsg);
	EvStrBufSet(spc_,7);
	MsgPutSet(&FightMsg,
			  EvStrBuf0,
			  CGX_START+0x10+18,2,37);
	MsgPut(&FightMsg);
	WindowOpen(X1,Y1,X2,Y2,0);
	if(pos){
		TaskTable[id].work[PHS_SEQNO]=PHS_SEQ_SAVE_CONFIRM;
		MsgPutSet(&FightMsg,SaveMsg,CGX_START+0x10,2,35);
	}
	else{
		TaskTable[id].work[PHS_SEQNO]=PHS_SEQ_LOAD_CONFIRM;
		MsgPutSet(&FightMsg,LoadMsg,CGX_START+0x10,2,35);
	}
	MsgPut(&FightMsg);

	MsgPutSet(&FightMsg,YesNoMsg,CGX_START3+0x10,X1+2,Y1+1);
	MsgPut(&FightMsg);
	TaskTable[id].work[PHS_CSRPOS2]=1;

	SelCsrOn(1);
}

void	PokeHeightSequence(u8 id)
{
	switch(TaskTable[id].work[PHS_SEQNO]){
		case PHS_SEQ_INIT:
			MonsNamePut();
			HeightPut(id);
			MsgPutSet(&FightMsg,HeightCommandMsg,CGX_START2+0x10,19,35);
			MsgPut(&FightMsg);
			TaskTable[id].work[PHS_SEQNO]++;
//			CommandCsrOff(CommandCsrPos[ClientNo]);
			CommandCsrOn(TaskTable[id].work[PHS_CSRPOS],0);
			break;
		case PHS_SEQ_COMMAND_SELECT:
			if((sys.Trg&U_KEY)==U_KEY){
				SePlay(SE_SELECT);
				CommandCsrOff(TaskTable[id].work[PHS_CSRPOS]);
				TaskTable[id].work[PHS_CSRPOS]&=0xfffd;
				CommandCsrOn(TaskTable[id].work[PHS_CSRPOS],0);
				break;
			}
			if((sys.Trg&D_KEY)==D_KEY){
				SePlay(SE_SELECT);
				CommandCsrOff(TaskTable[id].work[PHS_CSRPOS]);
				TaskTable[id].work[PHS_CSRPOS]|=2;
				CommandCsrOn(TaskTable[id].work[PHS_CSRPOS],0);
				break;
			}
			if((sys.Trg&L_KEY)==L_KEY){
				SePlay(SE_SELECT);
				CommandCsrOff(TaskTable[id].work[PHS_CSRPOS]);
				TaskTable[id].work[PHS_CSRPOS]&=0xfffe;
				CommandCsrOn(TaskTable[id].work[PHS_CSRPOS],0);
				break;
			}
			if((sys.Trg&R_KEY)==R_KEY){
				SePlay(SE_SELECT);
				CommandCsrOff(TaskTable[id].work[PHS_CSRPOS]);
				TaskTable[id].work[PHS_CSRPOS]|=1;
				CommandCsrOn(TaskTable[id].work[PHS_CSRPOS],0);
				break;
			}
			if((sys.Repeat&A_BUTTON)==A_BUTTON){
				SePlay(SE_SELECT);
				switch(TaskTable[id].work[PHS_CSRPOS]){
					case 0:		//たかさ
						if(pokeheight[WazaNo-1]<64){
							pokeheight[WazaNo-1]++;
							HeightPut(id);
						}
						break;
					case 1:		//ひこう
						HikouFind(1,id);
						break;
					case 2:		//ポケモン
						if(WazaNo<KAIHATSU_NUM_MAX)
							WazaNo++;
						else
							WazaNo=1;
						MonsNamePut();
						HeightPut(id);
						PokeDecord(id);
						break;
					case 3:		//ファイル
						FileActInit(id,0);
						break;
				}
				break;
			}
			if((sys.Repeat&B_BUTTON)==B_BUTTON){
				SePlay(SE_SELECT);
				switch(TaskTable[id].work[PHS_CSRPOS]){
					case 0:		//たかさ
						if(pokeheight[WazaNo-1]>0){
							pokeheight[WazaNo-1]--;
							HeightPut(id);
						}
						break;
					case 1:		//ひこう
						HikouFind(-1,id);
						break;
					case 2:		//ポケモン
						if(WazaNo>1)
							WazaNo--;
						else
							WazaNo=KAIHATSU_NUM_MAX;
						MonsNamePut();
						HeightPut(id);
						PokeDecord(id);
						break;
					case 3:		//ファイル
						FileActInit(id,0);
						break;
				}
				break;
			}
			if((sys.Repeat&R_BUTTON)==R_BUTTON){
				SePlay(SE_SELECT);
				switch(TaskTable[id].work[PHS_CSRPOS]){
					case 0:		//たかさ
						if(pokeheight[WazaNo-1]<64){
							pokeheight[WazaNo-1]+=8;
							if(pokeheight[WazaNo-1]>64)
								pokeheight[WazaNo-1]=64;
							HeightPut(id);
						}
						break;
					case 1:		//ひこう
						HikouFind(1,id);
						break;
					case 2:		//ポケモン
						if(WazaNo+10<KAIHATSU_NUM_MAX+1)
							WazaNo+=10;
						else
							WazaNo-=400;
						MonsNamePut();
						HeightPut(id);
						PokeDecord(id);
						break;
					case 3:		//ファイル
						FileActInit(id,0);
						break;
				}
				break;
			}
			if((sys.Repeat&L_BUTTON)==L_BUTTON){
				SePlay(SE_SELECT);
				switch(TaskTable[id].work[PHS_CSRPOS]){
					case 0:		//たかさ
						if(pokeheight[WazaNo-1]>0){
							if(pokeheight[WazaNo-1]>8)
								pokeheight[WazaNo-1]-=8;
							else
								pokeheight[WazaNo-1]=0;
							HeightPut(id);
						}
						break;
					case 1:		//ひこう
						HikouFind(-1,id);
						break;
					case 2:		//ポケモン
						if(WazaNo-10>1)
							WazaNo-=10;
						else
							WazaNo+=400;
						MonsNamePut();
						HeightPut(id);
						PokeDecord(id);
						break;
					case 3:		//ファイル
						FileActInit(id,0);
						break;
				}
				break;
			}
			break;
		case PHS_SEQ_FILE:
			if((sys.Trg&U_KEY)==U_KEY){
				SePlay(SE_SELECT);
				SelCsrOff(TaskTable[id].work[PHS_CSRPOS2]);
				TaskTable[id].work[PHS_CSRPOS2]=0;
				SelCsrOn(TaskTable[id].work[PHS_CSRPOS2]);
				break;
			}
			if((sys.Trg&D_KEY)==D_KEY){
				SePlay(SE_SELECT);
				SelCsrOff(TaskTable[id].work[PHS_CSRPOS2]);
				TaskTable[id].work[PHS_CSRPOS2]=1;
				SelCsrOn(TaskTable[id].work[PHS_CSRPOS2]);
				break;
			}
			if((sys.Trg&A_BUTTON)==A_BUTTON){
				SePlay(SE_SELECT);
				FileActConfirm(id,TaskTable[id].work[PHS_CSRPOS2]);
				break;
			}
			if((sys.Trg&B_BUTTON)==B_BUTTON){
				SePlay(SE_SELECT);
				FileActInit(id,1);
			}
			break;
		case PHS_SEQ_LOAD_CONFIRM:
			if((sys.Trg&U_KEY)==U_KEY){
				SePlay(SE_SELECT);
				SelCsrOff(TaskTable[id].work[PHS_CSRPOS2]);
				TaskTable[id].work[PHS_CSRPOS2]=0;
				SelCsrOn(TaskTable[id].work[PHS_CSRPOS2]);
				break;
			}
			if((sys.Trg&D_KEY)==D_KEY){
				SePlay(SE_SELECT);
				SelCsrOff(TaskTable[id].work[PHS_CSRPOS2]);
				TaskTable[id].work[PHS_CSRPOS2]=1;
				SelCsrOn(TaskTable[id].work[PHS_CSRPOS2]);
				break;
			}
			if((sys.Trg&A_BUTTON)==A_BUTTON){
				SePlay(SE_SELECT);
				if(TaskTable[id].work[PHS_CSRPOS2])
					FileActInit(id,1);
				else{
					read_flash(SAVE_SEC,&pokeheight,sizeof(pokeheight));
					FileActInit(id,1);
				}
				break;
			}
			if((sys.Trg&B_BUTTON)==B_BUTTON){
				SePlay(SE_SELECT);
				FileActInit(id,1);
			}
			break;
		case PHS_SEQ_SAVE_CONFIRM:
			if((sys.Trg&U_KEY)==U_KEY){
				SePlay(SE_SELECT);
				SelCsrOff(TaskTable[id].work[PHS_CSRPOS2]);
				TaskTable[id].work[PHS_CSRPOS2]=0;
				SelCsrOn(TaskTable[id].work[PHS_CSRPOS2]);
				break;
			}
			if((sys.Trg&D_KEY)==D_KEY){
				SePlay(SE_SELECT);
				SelCsrOff(TaskTable[id].work[PHS_CSRPOS2]);
				TaskTable[id].work[PHS_CSRPOS2]=1;
				SelCsrOn(TaskTable[id].work[PHS_CSRPOS2]);
				break;
			}
			if((sys.Trg&A_BUTTON)==A_BUTTON){
				SePlay(SE_SELECT);
				if(TaskTable[id].work[PHS_CSRPOS2])
					FileActInit(id,1);
				else{
					write_flash(SAVE_SEC,&pokeheight,sizeof(pokeheight));
					FileActInit(id,1);
				}
				break;
			}
			if((sys.Trg&B_BUTTON)==B_BUTTON){
				SePlay(SE_SELECT);
				FileActInit(id,1);
			}
			break;
	}
}

//=========================================================================
//	外部記憶領域とのやり取り
//=========================================================================

static u8	SaveRamCheck()
{
	if ( IdentifyFlash_1M() == 0 ) 
		return 0;
	else
		return 1;
}

//-------------------------------------------------------------------------
//	セーブワーク→フラッシュロム
//-------------------------------------------------------------------------

static int write_flash_main( u16 sec, u8 * src ,u32 size )
{
	while( TRUE ) {
		if ( ProgramFlashSectorEx( sec, src ) != 0 ) return FALSE;
		if ( size <= SAVE_SECTOR_SIZE ) break;

		size -= SAVE_SECTOR_SIZE;
		src += SAVE_SECTOR_SIZE;
		sec ++;
	};
	return TRUE;
}

static int write_flash( u8 sec, void * src, u32 size )
{
	int res;

	if(SaveRamCheck()) return 0;
	////////////////////////////////////////////
	m4aSoundVSyncOff();
	////////////////////////////////////////////

	res = write_flash_main( sec, src, size );

	////////////////////////////////////////////
	m4aSoundVSyncOn();
	////////////////////////////////////////////

	return res;
}

//-------------------------------------------------------------------------
//	フラッシュ→セーブワーク
//-------------------------------------------------------------------------
static void read_flash( u8 sec, void * src, u32 size)
{
	if(SaveRamCheck()) return;
	ReadFlash( sec, 0, (u8 *)src, size );
}

#endif
