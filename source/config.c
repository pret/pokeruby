//=========================================================================
//	
//	設定画面
//
//=========================================================================
#include "common.h"
#include "intr.h"
#include "actor.h"
#include "actanm.h"
#include "palanm.h"
#include "task.h"
#include "print.h"
#include "task.h"
#include "poketool.h"
#include "decord.h"
#include "objdata.h"
#include "menu.h"
#include "window.h"
#include "laster.h"

/********************************************************************/
/*				ﾃﾞｰﾀ												*/
/********************************************************************/
const u16 config_Palette[32] = {
0x0000,0x423F,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
0x0CDF,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x7FFF,
0x0000,0x2ADF,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
0x01F8,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x7FFF,
};
const u8 equ_Character[64] = {
0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x1F,0x11,0x11,0xF8,0x8F,0x88,0x88,0xF8,
0xFF,0xFF,0xFF,0xFF,0x1F,0x11,0x11,0xF8,0x8F,0x88,0x88,0xF8,0xFF,0xFF,0xFF,0xFF,
0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
};
static	const u8	indexstr[]		= {CTRL_,C_PAL_,9,se_,ttu_,te_,i_,wo_,spc_,ka_,e_,ru_,EOM_};
static	const u8	menustr1[]		= {CTRL_,C_PAL_,9,ha_,na_,si_,no_,spc_,ha_,ya_,sa_,EOM_};
static	const u8	menustr2[]		= {CTRL_,C_PAL_,9,se_,n_,to_,u_,E_,HU_,EE_,KU_,TO_,EOM_};
static	const u8	menustr3[]		= {CTRL_,C_PAL_,9,si_,a_,i_,no_,spc_,RU_,bou_,RU_,EOM_};
static	const u8	menustr4[]		= {CTRL_,C_PAL_,9,SA_,U_,N_,DO_,EOM_};
static	const u8	menustr5[]		= {CTRL_,C_PAL_,9,U_,I_,N_,DO_,U_,EOM_};
static	const u8	exitstr[]		= {CTRL_,C_PAL_,9,o_,wa_,ru_,EOM_};
static	const u8	menustr6[]		= {CTRL_,C_PAL_,9,BO_,TA_,N_,no_,spc_,MO_,bou_,DO_,EOM_};
static	const u8	str_slow[] 		= {CTRL_,C_PAL_,15,o_,so_,i_,EOM_};
static	const u8	str_hutuu[]		= {CTRL_,C_PAL_,15,hu_,tu_,u_,EOM_};
static	const u8	str_high[] 		= {CTRL_,C_PAL_,15,ha_,ya_,i_,EOM_};
static	const u8	str_ef_on[]		= {CTRL_,C_PAL_,15,mi_,ru_,EOM_};
static	const u8	str_ef_off[]	= {CTRL_,C_PAL_,15,mi_,na_,i_,EOM_};
static	const u8	str_change[]	= {CTRL_,C_PAL_,15,i_,re_,ka_,e_,EOM_};
static	const u8	str_nochange[]	= {CTRL_,C_PAL_,15,ka_,ti_,nu_,ki_,EOM_};
static	const u8	str_mono[]		= {CTRL_,C_PAL_,15,MO_,NO_,RA_,RU_,EOM_};
static	const u8	str_stereo[]	= {CTRL_,C_PAL_,15,SU_,TE_,RE_,O_,EOM_};
static	const u8	str_type[]		= {CTRL_,C_PAL_,15,TA_,I_,PU_,EOM_};
static	const u8	str_num[]		= {CTRL_,C_PAL_,8,EOM_};
static	const u8	str_kihon[]		= {CTRL_,C_PAL_,15,NO_,bou_,MA_,RU_,EOM_};
static	const u8	str_lr[] 		= {CTRL_,C_PAL_,15,L__,R__,EOM_};
static	const u8	str_katate[] 	= {CTRL_,C_PAL_,15,L__,CTRL_,C_EXFONT_,Plus__,A__,EOM_};


extern	void	FieldMenuRecover(void);
extern	const u16 StaffRoll_Palette[];

void	ConfigInit(void);
void	ConfigMain(void);

static	void	ConfigInitTask(u8 id);
static	void	ConfigKeyTask(u8 id);
static	void	ConfigExitInitTask(u8 id);
static	void	ConfigExitTask(u8 id);

static	void	ConfigCursorSet(u8 mode);

static	u8		MesSpCursorCheck(u8 num);
static	void	MesSpCursorSet(u8 pat);
static	u8		BattleEfCursorCheck(u8 num);
static	void	BattleEfCursorSet(u8 pat);
static	u8		BattleTypeCursorCheck(u8 num);
static	void	BattleTypeCursorSet(u8 pat);
static	u8		SoundModeCursorCheck(u8 num);
static	void	SoundModeCursorSet(u8 pat);
static	u8		WindowTypeCursorCheck(u8 num);
static	void	WindowTypeCursorSet(u8 pat);
static	u8		CondMdCursorCheck(u8 num);
static	void	CondMdCursorSet(u8 pat);

static	const	u8	indexstr[];
static	const	u8	menustr1[];
static	const	u8	menustr2[];
static	const	u8	menustr3[];
static	const	u8	menustr4[];
static	const	u8	menustr5[];
static	const	u8	menustr6[];
static	const	u8	exitstr[];

#define	LIST_POS	0
#define	MSG_SP		1
#define	BTL_EF		2
#define	BTL_TP		3
#define	SND_MD		4
#define	CNT_MD		5
#define	WIN_TP		6

#define	LIST_NUM	6
#define	EXIT_POS	6

/********************************************************************/
/*                                                                  */
/*				ﾒｲﾝ													*/
/*                                                                  */
/********************************************************************/
void	ConfigMain(void)
{
		MainTask();
		JumpActor();
		SetActor();
		PaletteAnime();
}

/********************************************************************/
/*                                                                  */
/*				割り込み											*/
/*                                                                  */
/********************************************************************/
static void VInterFunc( void )
{
	actOAMtrans();						//ｱｸﾀｰ転送処理1
	actDMAtrans();						//ｱｸﾀｰ転送処理2
	PaletteFadeTrans();
}

/********************************************************************/
/*				初期化												*/
/********************************************************************/
void	ConfigInit(void)
{
	u8	taskID;

	switch(sys.InitSeqWork){	//初期化シーケンス用ワーク

	default:
	case 0:
		SetVBlankFunc(NULL);			//割込み関数設定(VBLANK)

		*(vu16 *)REG_DISPCNT	= 0;
		*(vu16 *)REG_BG2CNT		= 0;
		*(vu16 *)REG_BG1CNT		= 0;
		*(vu16 *)REG_BG0CNT		= 0;

		*(vu16 *)REG_BG2HOFS	= 0;
		*(vu16 *)REG_BG2VOFS	= 0;
		*(vu16 *)REG_BG1HOFS	= 0;
		*(vu16 *)REG_BG1VOFS	= 0; 
		*(vu16 *)REG_BG0HOFS	= 0;
		*(vu16 *)REG_BG0VOFS	= 0; 

		DIV_DMACLEAR(3, 0, VRAM, VRAM_SIZE,           16);	// VRAM   初期化
		DIV_DMACLEAR(3, 0, OAM,  OAM_SIZE,            32);	// OAM    初期化
		DIV_DMACLEAR(3, 0, PLTT, PLTT_SIZE,           16);	// ﾊﾟﾚｯﾄ  初期化
		sys.InitSeqWork++;
		break;
	case 1:
		PaletteAnimeInit();
		LasterInit();									// HDMA初期化
		InitTask();										// ﾀｽｸ  初期化
		InitActor();									// ｱｸﾀｰ 初期化

		sys.InitSeqWork++;
		break;
	case 2:
		PrintScreenInit(DENDOU2_TYPE);					// CGX_B = 2,SCR_B = 15
		sys.InitSeqWork++;
		break;
	case 3:
		NMenuScreenInitStart(DENDOU2_TYPE);
		sys.InitSeqWork++;
		break;
	case 4:
		if(!(NMenuScreenInitMain()))	break;
		sys.InitSeqWork++;
		break;
	case 5:
		PaletteWorkSet(config_Palette,PA_BG8,0x40);
		CpuCopy(&equ_Character[0x00],BG_VRAM+0x8000+0x3EE0,0x40,16);//決めうち注意！(=)
		sys.InitSeqWork++;
		break;
	case 6:
		PaletteFadeReq(0xffffffff,0,16,0,0);
		sys.InitSeqWork++;
		break;
	case 7:
		*(vu16 *)REG_WIN0H	= 0;
		*(vu16 *)REG_WIN0V	= 0;
		*(vu16 *)REG_WIN1H	= 0;
		*(vu16 *)REG_WIN1V	= 0;

		*(vu16 *)REG_WININ	= 0x1111;
		*(vu16 *)REG_WINOUT	= 0x0031;

		*(vu16 *)REG_BLDCNT   = 0x00e1;	//半透明設定
		*(vu16 *)REG_BLDALPHA = 0;
		*(vu16 *)REG_BLDY	  = 7;

		REG_IE_SET( V_BLANK_INTR_FLAG );// VBLANK割込許可
		*(vu16 *)REG_STAT |= STAT_V_BLANK_IF_ENABLE;

		SetVBlankFunc(VInterFunc);			//割込み関数設定(VBLANK)

		*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
			                  |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
							  | DISP_BG0_ON					// BG0有効
							  | DISP_WIN01_ON				// WIN0&1 ON
							  | DISP_OBJ_ON;
		sys.InitSeqWork++;
		break;
	case 8:
		taskID = AddTask(ConfigInitTask, 0);
		TaskTable[taskID].work[LIST_POS]= 0;

		TaskTable[taskID].work[MSG_SP]= MyData.msg_speed;
		TaskTable[taskID].work[BTL_EF]= MyData.btl_eff_sw;
		TaskTable[taskID].work[BTL_TP]= MyData.btl_type;
		TaskTable[taskID].work[SND_MD]= MyData.sound_mode;
		TaskTable[taskID].work[CNT_MD]= MyData.key_config;
		TaskTable[taskID].work[WIN_TP]= MyData.window_type;

		// SCREEN WRITE
		NMenuWinBoxWrite( 2, 0,27, 3);
		NMenuWinBoxWrite( 2, 4,27,19);

		NMenuMsgWrite(indexstr	,4,1);
		NMenuMsgWrite(menustr1	,4,5);
		NMenuMsgWrite(menustr2	,4,7);
		NMenuMsgWrite(menustr3	,4,9);
		NMenuMsgWrite(menustr4	,4,11);
		NMenuMsgWrite(menustr6	,4,13);
		NMenuMsgWrite(menustr5	,4,15);
		NMenuMsgWrite(exitstr	,4,17);

		MesSpCursorSet(TaskTable[taskID].work[MSG_SP]);
		BattleEfCursorSet(TaskTable[taskID].work[BTL_EF]);
		BattleTypeCursorSet(TaskTable[taskID].work[BTL_TP]); 
		SoundModeCursorSet(TaskTable[taskID].work[SND_MD]);
		CondMdCursorSet(TaskTable[taskID].work[CNT_MD]);
		WindowTypeCursorSet(TaskTable[taskID].work[WIN_TP]);

		*(vu16 *)REG_WIN0H	= (17*0x100)+223;
		*(vu16 *)REG_WIN0V	= 1*0x100+31;
		ConfigCursorSet(TaskTable[taskID].work[LIST_POS]);

		sys.InitSeqWork++;
		break;
	case 9:
		MainProcChange(ConfigMain);
		break;
	}
}





/********************************************************************/
/*				導入												*/
/********************************************************************/
static	void	ConfigInitTask(u8 id)
{
	if(FadeData.fade_sw == 0){
		TaskTable[id].TaskAdrs = ConfigKeyTask;
	}
}

/********************************************************************/
/*				ﾒｲﾝ制御												*/
/********************************************************************/
/*				ｷｰﾁｪｯｸ												*/
static	void	ConfigKeyTask(u8 id)
{
	if(sys.Trg & A_BUTTON){
		if(TaskTable[id].work[LIST_POS] == EXIT_POS){
			TaskTable[id].TaskAdrs = ConfigExitInitTask;
		}
		return;
	}
		//終了
	if(sys.Trg & B_BUTTON){
		TaskTable[id].TaskAdrs = ConfigExitInitTask;
		return;
	}
	if(sys.Trg & U_KEY){
		if(TaskTable[id].work[LIST_POS] > 0){
			TaskTable[id].work[LIST_POS]--;
		}else{
			TaskTable[id].work[LIST_POS] = LIST_NUM;
		}
		ConfigCursorSet(TaskTable[id].work[LIST_POS]);
		return;
	}
	if(sys.Trg & D_KEY){
		if(TaskTable[id].work[LIST_POS] < LIST_NUM){
			TaskTable[id].work[LIST_POS]++;
		}else{
			TaskTable[id].work[LIST_POS] = 0;
		}
		ConfigCursorSet(TaskTable[id].work[LIST_POS]);
		return;
	}
	switch(TaskTable[id].work[LIST_POS]){
		
	case 0:
		TaskTable[id].work[MSG_SP]= MesSpCursorCheck(TaskTable[id].work[MSG_SP]);
		MesSpCursorSet(TaskTable[id].work[MSG_SP]);
		break;
	case 1:
		TaskTable[id].work[BTL_EF]= BattleEfCursorCheck(TaskTable[id].work[BTL_EF]);
		BattleEfCursorSet(TaskTable[id].work[BTL_EF]);
		break;
	case 2:
		TaskTable[id].work[BTL_TP]= BattleTypeCursorCheck(TaskTable[id].work[BTL_TP]); 
		BattleTypeCursorSet(TaskTable[id].work[BTL_TP]); 
		break;
	case 3:
		TaskTable[id].work[SND_MD]= SoundModeCursorCheck(TaskTable[id].work[SND_MD]);
		SoundModeCursorSet(TaskTable[id].work[SND_MD]);
		break;
	case 4:
		TaskTable[id].work[CNT_MD]= CondMdCursorCheck(TaskTable[id].work[CNT_MD]);
		CondMdCursorSet(TaskTable[id].work[CNT_MD]);
		break;
	case 5:
		TaskTable[id].work[WIN_TP]= WindowTypeCursorCheck(TaskTable[id].work[WIN_TP]);
		WindowTypeCursorSet(TaskTable[id].work[WIN_TP]);
		break;
	}
}

/********************************************************************/
/*				終了												*/
/********************************************************************/
static	void	ConfigExitInitTask(u8 id)
{
	MyData.msg_speed	= TaskTable[id].work[MSG_SP];
	MyData.btl_eff_sw	= TaskTable[id].work[BTL_EF];
	MyData.btl_type		= TaskTable[id].work[BTL_TP];
	MyData.sound_mode	= TaskTable[id].work[SND_MD];
	MyData.key_config	= TaskTable[id].work[CNT_MD]; 
	MyData.window_type	= TaskTable[id].work[WIN_TP];

	PaletteFadeReq(0xffffffff,0,0,16,0);
	TaskTable[id].TaskAdrs = ConfigExitTask;
}

static	void	ConfigExitTask(u8 id)
{
	if(FadeData.fade_sw == 0){
		DelTask(id);
		MainProcChange(sys.pReturnProc);
	}
}


/********************************************************************/
/*				その他												*/
/********************************************************************/
static	void	ConfigCursorSet(u8 mode)
{
	switch(mode){

	default:
		*(vu16 *)REG_WIN1H	= 24*0x100+215;
		*(vu16 *)REG_WIN1V	= (40+ mode*16 )*0x100+(56+ mode*16 );
		break;
	}
}

static	void	ConfigListPut(const u8* str,u8 x,u8 y,u8 color)
{
	u16	i;
	u8	msg[16];

	i = 0;
	while((*str != EOM_)&&(i < (16-1))){
		msg[i] = *str;
		str++;
		i++;
	}
	msg[2] = color;
	msg[i] = EOM_;
	NMenuMsgWrite(msg,x,y);
}

/********************************************************************/
/*				各項目												*/
/********************************************************************/
/* MESSAGE SPEED */
static	u8	MesSpCursorCheck(u8 num)
{
	if(sys.Trg & R_KEY){
		if(num < 2) num++;
		else		num = 0;
	}
	if(sys.Trg & L_KEY){
		if(num > 0) num--;
		else		num = 2;
	}
	return num;
}

static	void	MesSpCursorSet(u8 pat)
{
	u8 color[3];

	color[0] = 15;
	color[1] = 15;
	color[2] = 15;

	color[pat] = 8;
	ConfigListPut(str_slow	,15, 5,color[0]);
	ConfigListPut(str_hutuu	,19, 5,color[1]);
	ConfigListPut(str_high	,23, 5,color[2]);
}

/* BATTLE EFFECT */
static	u8	BattleEfCursorCheck(u8 num)
{
	if((sys.Trg & L_KEY)||(sys.Trg & R_KEY))	num^= 1;
	return num;
}

static	void	BattleEfCursorSet(u8 pat)
{
	u8 color[2];

	color[0] = 15;
	color[1] = 15;

	color[pat] = 8;
	ConfigListPut(str_ef_on	,15, 7,color[0]);
	ConfigListPut(str_ef_off,23, 7,color[1]);
}

/* BATTLE TYPE */
static	u8	BattleTypeCursorCheck(u8 num)
{
	if((sys.Trg & L_KEY)||(sys.Trg & R_KEY))	num^= 1;
	return num;
}

static	void	BattleTypeCursorSet(u8 pat)
{
	u8 color[2];

	color[0] = 15;
	color[1] = 15;

	color[pat] = 8;
	ConfigListPut(str_change	,15, 9,color[0]);
	ConfigListPut(str_nochange	,22, 9,color[1]);
}

/* SOUND */
static	u8	SoundModeCursorCheck(u8 num)
{
	if((sys.Trg & L_KEY)||(sys.Trg & R_KEY)){
		num^= 1;
		pokStereoMono(num);
	}
	return num;
}

static	void	SoundModeCursorSet(u8 pat)
{
	u8 color[2];

	color[0] = 15;
	color[1] = 15;

	color[pat] = 8;
	ConfigListPut(str_mono	,15,11,color[0]);
	ConfigListPut(str_stereo,22,11,color[1]);
}

/* WINDOW */
static	u8	WindowTypeCursorCheck(u8 num)
{
	if(sys.Trg & R_KEY){
		if(num < (20-1))	num++;
		else				num = 0;
		NMenuWindowCharSet(num);
	}
	if(sys.Trg & L_KEY){
		if(num > 0)	num--;
		else		num = (20-1);
		NMenuWindowCharSet(num);
	}
	return num;
}

static	void	WindowTypeCursorSet(u8 pat)
{
	u16	i;
	u8	msg[8];

	pat++;		//< 1origin

	i = 0;
	while((str_num[i] != EOM_)&&(i < (7-1))){
		msg[i] = str_num[i];
		i++;
	}
	if(pat/10){
		msg[i] = n0_ + pat/10;
		i++;
		msg[i] = n0_ + pat%10;
		i++;
	}else{
		msg[i] = n0_ + pat%10;
		i++;
		msg[i] = spc_;
		i++;
	}
	msg[i] = EOM_;
	NMenuMsgWrite(str_type	,15,15);
	NMenuMsgWrite(msg		,18,15);
}

/* CONT MODE */
static	u8	CondMdCursorCheck(u8 num)
{
	if(sys.Trg & R_KEY){
		if(num < 2)	num++;
		else		num = 0;
	}
	if(sys.Trg & L_KEY){
		if(num > 0)	num--;
		else		num = 2;
	}
	return num;
}

static	void	CondMdCursorSet(u8 pat)
{
	u8 color[3];

	color[0] = 15;
	color[1] = 15;
	color[2] = 15;

	color[pat] = 8;
	ConfigListPut(str_kihon	,15,13,color[0]);
	ConfigListPut(str_lr	,20,13,color[1]);
	ConfigListPut(str_katate,23,13,color[2]);
}



