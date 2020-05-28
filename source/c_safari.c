
//======================================================
//    clientcl.c                                           
//                                                      
//    Copyright (C) 2000 GAME FREAK inc.
//======================================================

#include "common.h"
#include "bss.h"		//add
#include "calctool.h"		//add
#include "poketool.h"		//add
#include "decord.h"		//add
#include "objdata.h"		//add

#include "gauge.h"
#include "actor.h"
#include "actanm.h"
#include "client.h"
#include "a_enemy.h"
#include "fight.h"
#include "print.h"
#include "client_t.h"
#include "waza_eff.h"
#include "server.h"
#include "cli_def.h"	//add 2001.07.13(金) by matsuda
#include "wazatool.h"
#include "client2.h"
#include "cli_ef.h"
#include "pm_aff.h"
#include "cli_num.h"

#include "multisio.h"		//add
#include "pokesio.h"
#include "cable.h"

#include "fight_ef.h"
#include "mus_tool.h"
#include "fld_main.h"
#include "task.h"
#include "fightmsg.h"
#include "cubecase.h"

enum{
		MSG_END,
		MSG_START,
		MSG_WRITE,
		MSG_WAIT,
		MSG_KEYWAIT,
		MSG_CR,
};

//------------------------- データ -----------------------------

//---------------------- ローカル変数 --------------------------

//-------------------- サブルーチン宣言 ------------------------

void	ClientSBitReset(void);	//範囲外の値の時の処理
void	ClientSDummy(void);
void	ClientSInit(void);
void	ClientSCommandWait(void);

void	ClientSCommandSelect(void);
void	ClientSWazaSelect(void);
void	ClientSMessageWait(void);

void	ClientCubeCaseWait(void);
void	ClientCubeCaseReturnWait(void);

void	ClientSBSSPokeparaGet(void);
void	ClientSBSSPokeparaGet2(void);
void	ClientSBSSPokeparaPut(void);
void	ClientSBSSPokeparaPut2(void);
void	ClientSBSSPokeEncount(void);
void	ClientSBSSPokeAppear(void);
void	ClientSBSSPokeReturn(void);
void	ClientSBSSTrainerEncount(void);
void	ClientSBSSTrainerAppear(void);
void	ClientSBSSTrainerReturn(void);
void	ClientSBSSPokeKizetu(void);
void	ClientSBSSZenmetsu(void);
void	ClientSBSSGetSuccess(void);
void	ClientSBSSGetFail(void);
void	ClientSBSSPokeLevelUp(void);
void	ClientSBSSWazaEffect(void);
void	ClientSBSSMessage(void);
void	ClientSBSSAlertMessage(void);
void	ClientSBSSCommandSelect(void);
void	ClientSBSSCommandSelectCopy(void);
void	ClientSBSSWazaSelect(void);
void	ClientSBSSItemSelect(void);
void	ClientSBSSPokeSelect(void);
void	ClientSBSSEscape(void);
void	ClientSBSSHpGauge(void);
void	ClientSBSSExpGauge(void);
void	ClientSBSSStatusSet(void);
void	ClientSBSSStatusEffect(void);
void	ClientSBSSStatusClear(void);
void	ClientSBSSDataTrans(void);
void	ClientSBSSDataRamTrans(void);
void	ClientSBSSBgmTrans(void);
void	ClientSBSSVoiceTrans(void);
void	ClientSBSSSelectReturn(void);
void	ClientSBSSReshuffle(void);
void	ClientSBSSUseItem(void);
void	ClientSBSSUseBall(void);
void	ClientSBSSLoopCountClear(void);
void	ClientSBSSLoopCountSet(void);
void	ClientSBSSSwitchFlagClear(void);
void	ClientSBSSSwitchFlagSet(void);
void	ClientSBSSPokeDamageBlink(void);
void	ClientSBSSGaugeOff(void);
void	ClientSBSSSEPlay(void);
void	ClientSBSSMEPlay(void);
void	ClientSBSSVoicePlay(void);
void	ClientSBSSEncountEffect(void);
void	ClientSBSSPokeSendOut(void);
void	ClientSBSSBallGaugeSet(void);
void	ClientSBSSBallGaugeOff(void);
void	ClientSBSSGaugeYureStop(void);
void	ClientSBSSVanishOff(void);
void	ClientSBSSFightEffect(void);
void	ClientSBSSTuushinWait(void);
void	ClientSBSSCsrPosClear(void);
void	ClientSBSSFightEnd(void);
void	ClientSBSSEndID(void);

int		ClientSBSSPokeparaGetAct(u8,u8 *);
void	ClientSBSSPokeparaPutAct(u8);

extern	actHeader PokeFTbl[];
extern	TALK_WIN	FightMsg;
extern u16	ReturnItemNo;
//extern	u8	FightMsgBuf[64];

//----------------------------------------------------------
//	バトルサーバー命令群テーブル
//----------------------------------------------------------
const pFunc ClientSBSSTbl[] =
{
	ClientSBSSPokeparaGet,		// BSS_POKEPARA_GET=0,	
	ClientSBSSPokeparaGet2,	   	// BSS_POKEPARA_GET2,	
	ClientSBSSPokeparaPut,		// BSS_POKEPARA_PUT,	
	ClientSBSSPokeparaPut2,		// BSS_POKEPARA_PUT2,	
	ClientSBSSPokeEncount,		// BSS_POKEPARA_ENCOUNT,	add
	ClientSBSSPokeAppear,		// BSS_POKE_APPEAR,	
	ClientSBSSPokeReturn,		// BSS_POKE_RETURN,	
	ClientSBSSTrainerEncount,	// BSS_TRAINER_ENCOUNT,	add
	ClientSBSSTrainerAppear,		// BSS_TRAINER_APPEAR,	
	ClientSBSSTrainerReturn,		// BSS_TRAINER_RETURN,	
	ClientSBSSPokeKizetu,		// BSS_POKE_KIZETSU,	
	ClientSBSSZenmetsu,			// BSS_POKE_ZENMETSU,	
	ClientSBSSGetSuccess,		// BSS_GET_SUCCESS,	
	ClientSBSSGetFail,			// BSS_GET_FAIL,		
	ClientSBSSPokeLevelUp,		// BSS_POKE_LEVELUP,	
	ClientSBSSWazaEffect,		// BSS_WAZA_EFFECT,	
	ClientSBSSMessage,			// BSS_MESSAGE,		
	ClientSBSSAlertMessage,		// BSS_ALERT_MESSAGE,		
								
	ClientSBSSCommandSelect,		// BSS_COMMAND_SELECT, 

	ClientSBSSCommandSelectCopy,		// BSS_COMMAND_SELECT_COPY, 

	ClientSBSSWazaSelect,		// BSS_WAZA_SELECT,	
													
	ClientSBSSItemSelect,		// BSS_ITEM_SELECT,	
													
	ClientSBSSPokeSelect,		// BSS_POKE_SELECT,	
													
	ClientSBSSEscape,			// BSS_ESCAPE,			
	ClientSBSSHpGauge,			// BSS_HP_GAUGE,		
	ClientSBSSExpGauge,			// BSS_EXP_GAUGE,		
	ClientSBSSStatusSet,			// BSS_STATUS_SET,		
	ClientSBSSStatusEffect,		// BSS_STATUS_EFFECT,		
	ClientSBSSStatusClear,		// BSS_STATUS_CLEAR,	
	ClientSBSSDataTrans,			// BSS_DATA_TRANS,		
	ClientSBSSDataRamTrans,		// BSS_DATA_RAM_TRANS,	
													
	ClientSBSSBgmTrans,			// BSS_BGM_TRANS,		
	ClientSBSSVoiceTrans,		// BSS_VOICE_TRANS,	
	ClientSBSSSelectReturn,		// BSS_SELECT_RETURN,	
	ClientSBSSReshuffle,			// BSS_POKE_RESHUFFLE,	
	ClientSBSSUseItem,			// BSS_USE_ITEM,		
	ClientSBSSUseBall,			// BSS_USE_BALL,		
	ClientSBSSLoopCountClear,	//	BSS_LOOPCOUNT_CLEAR
	ClientSBSSLoopCountSet,	//	BSS_LOOPCOUNT_SET
	ClientSBSSSwitchFlagClear,	//	BSS_SWITCHFLAG_CLEAR
	ClientSBSSSwitchFlagSet,	//	BSS_SWITCHFLAG_SET
	ClientSBSSPokeDamageBlink,	// BSS_POKEDAMAGE_BLINK,
	ClientSBSSGaugeOff,		// BSS_GAUGE_OFF,
	ClientSBSSSEPlay,			// BSS_SE_PLAY,
	ClientSBSSMEPlay,			// BSS_SE_PLAY,
	ClientSBSSVoicePlay,			// BSS_VOICE_PLAY,
	ClientSBSSEncountEffect,	// BSS_ENCOUNT_EFFECT,
	ClientSBSSPokeSendOut,		// BSS_POKE_SENDOUT,
	ClientSBSSBallGaugeSet,	// BSS_BALL_GAUGE_SET,
	ClientSBSSBallGaugeOff,	// BSS_BALL_GAUGE_OFF,
	ClientSBSSGaugeYureStop,	// BSS_BALL_GAUGE_OFF,
	ClientSBSSVanishOff,	// BSS_VANISH_OFF,
	ClientSBSSFightEffect,	// BSS_FIGHT_EFFECT,
	ClientSBSSTuushinWait,	// BSS_TUUSHIN_WAIT,
	ClientSBSSCsrPosClear,		// BSS_CSRPOS_CLEAR,
	ClientSBSSFightEnd,		// BSS_FIGHT_END,

	ClientSBSSEndID,				// BSS_END_ID,		いらないけど一応
};

//----------------------------------------------------------
//	プロトタイプ宣言	関数＆ﾃﾞｰﾀ
//----------------------------------------------------------

#define	CAI_LVNUM_X			84
#define	CAI_LVNUM_Y			28

//==============================================================
//                       メインルーチン
//==============================================================

void	ClientSDummy(void)
{
}

void	ClientSInit(void)
{
	ClientSequence[ClientNo]=ClientSCommandWait;

#if 0	//分割転送用に一つにまとめた
	//ｹﾞｰｼﾞｷｬﾗ ﾃｽﾄなのでとりあえず、実際は常駐なのでここではやんない　※
	
	ClientGaugeSt[ClientNo] = GaugeActorSet(ClientNo);	//ｹﾞｰｼﾞｱｸﾀｰ登録 これもとりあえずここで
	GaugeDefaultPosSet(ClientNo);
	GaugeTransChrSet(ClientGaugeSt[ClientNo],
				&PokeParaMine[SelMonsNo[ClientNo]], G_ALL);
	GaugeOFF(ClientGaugeSt[ClientNo]);
	if(ClientNo == BSS_CLIENT_ENEMY)
		GaugePriSet(ClientGaugeSt[ClientNo], 0);
	else
		GaugePriSet(ClientGaugeSt[ClientNo], 1);
#endif
}

void	ClientSCommandWait(void)
{
	if((ClientBit&no2bittbl[ClientNo]) != 0)
	{
		if(ServerBuffer[ClientNo][0] <= BSS_END_ID)// && ServerBuffer[ClientNo][0] > -1)
		{
			ClientSBSSTbl[ServerBuffer[ClientNo][0]]();
		}
		else
		{
			ClientSBitReset();	//範囲外の値の時の処理
		}
	}
}

//=========================================================================
//	ウェイトルーチン
//=========================================================================

void	ClientSCommandSelect(void)
{
//	SelectMotionSet(ClientNo, MOTION_GAUGE, GAUGE_MOTION_ADDSEC, GAUGE_MOTION_FURIHABA);
//	SelectMotionSet(ClientNo, MOTION_POKE, POKE_MOTION_ADDSEC, POKE_MOTION_FURIHABA);

	if((sys.Trg&A_BUTTON)==A_BUTTON){
		SePlay(SE_SELECT);
		switch(CommandCsrPos[ClientNo]){
			case BALL_CSRPOS:	//サファリボール
				BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_BALL,0);
				break;
			case CUBE_CSRPOS:	//キューブ
				BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_CUBE,0);
				break;
			case APPROACH_CSRPOS:	//ちかづく
				BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_APPROACH,0);
				break;
			case ESCAPE_CSRPOS:	//にげる
				BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_SAFARI_ESCAPE,0);
				break;
		}
		ClientSBitReset();
		return;
	}
	if((sys.Trg&L_KEY)==L_KEY){
		if(CommandCsrPos[ClientNo]&1){
			SePlay(SE_SELECT);
			CommandCsrOff(CommandCsrPos[ClientNo]);
			CommandCsrPos[ClientNo]^=1;
			CommandCsrOn(CommandCsrPos[ClientNo],0);
		}
		return;
	}
	if((sys.Trg&R_KEY)==R_KEY){
		if((CommandCsrPos[ClientNo]&1)==0){
			SePlay(SE_SELECT);
			CommandCsrOff(CommandCsrPos[ClientNo]);
			CommandCsrPos[ClientNo]^=1;
			CommandCsrOn(CommandCsrPos[ClientNo],0);
		}
		return;
	}
	if((sys.Trg&U_KEY)==U_KEY){
		if(CommandCsrPos[ClientNo]&2){
			SePlay(SE_SELECT);
			CommandCsrOff(CommandCsrPos[ClientNo]);
			CommandCsrPos[ClientNo]^=2;
			CommandCsrOn(CommandCsrPos[ClientNo],0);
		}
		return;
	}
	if((sys.Trg&D_KEY)==D_KEY){
		if((CommandCsrPos[ClientNo]&2)==0){
			SePlay(SE_SELECT);
			CommandCsrOff(CommandCsrPos[ClientNo]);
			CommandCsrPos[ClientNo]^=2;
			CommandCsrOn(CommandCsrPos[ClientNo],0);
		}
		return;
	}
#ifdef PM_DEBUG
	if((sys.Trg&R_BUTTON)==R_BUTTON){
		if((CliSys[ClientNo].fight_eff)==0)
			SetFightEffect(ClientNo, ClientNo, ClientNo, FE_ID_POROC, 0);
		return;
	}

	if(sys.Trg&START_BUTTON){
		HPNumGaugeChangePut();
		return;
	}
#endif
}

void ClientSTrainerEncountWait(void)
{
	if(ActWork[PokemonStruct[ClientNo]].move == DummyActMove)
	{
		//DelActor(&ActWork[PokemonStruct[ClientNo]]);
		ClientSBitReset();
	}
}

void	ClientSMessageWait(void)
{
	if(FightMsg.status==MSG_END){
//		ClientBit&=(no2bittbl[ClientNo]^0xffffffff);
//		ClientSequence[ClientNo]=ClientSCommandWait;
		ClientSBitReset();
	}
}

static void ClientFightEndWait(void)
{
	if(FadeData.fade_sw == 0){
		sys.FieldBattleFlag=0;			//戦闘中Flagをおとす
		sys.pFirstProc=PushFirstProc;
		MainProcChange(sys.pReturnProc);
	}
}

static	void ClientBallEffectWait(void)
{
#if 0
//	if(ActWork[ClientStruct[ClientNo]].act_sw == 0)
	if(ClientEffectWait == 0)
//	if(CliSys[ClientNo].ball_eff_wait == 0)
	{
//		AllDelActor(&ActWork[ClientStruct[ClientNo]]);
		ClientSBitReset();
	}
#else
	if(ClientEffectWait == 0 || CliSys[ClientNo].etc_eff == 0)
		ClientSBitReset();
#endif
}

void ClientCubeCaseWait(void)
{
	if(FadeData.fade_sw == 0)
	{
		ClientSequence[ClientNo] = ClientCubeCaseReturnWait;
		BtlCubeCaseCall();
	}
}

void ClientCubeCaseReturnWait(void)
{
	if((sys.pMainProc==MainFight)&&
	   (FadeData.fade_sw == 0))
	{
		BSS_USE_ITEM_SET(BSS_CLIENT, ReturnItemNo);
		ClientSBitReset();
	}
}

void ClientSFightEffWait(void)
{
	if(CliSys[ClientNo].fight_eff == 0)
		ClientSBitReset();
}


//==============================================================
//                       サブルーチン
//==============================================================

void ClientSBitReset(void)
{
	u8	id;

	ClientSequence[ClientNo] = ClientSCommandWait;
#if 1
	if(FightType&FIGHT_TYPE_TUUSHIN){
		id=GetSioConnectId();
		TuushinReqSet(BSS_CLIENT_BIT,4,&id);
		ServerBuffer[ClientNo][0]=BSS_END_ID;
	}
	else
#endif
		ClientBit &= (no2bittbl[ClientNo] ^ 0xffffffff);
}

//----------------------------------------------------------
//	ｽﾃｰﾀｽ異常ｴﾌｪｸﾄ終了待ち
//----------------------------------------------------------
void ClientSStatusEffWait(void)
{
	if(CliSys[ClientNo].status_eff == 0)
		ClientSBitReset();
}



//==============================================================
//	クライアント命令関数
//==============================================================

//----------------------------------------------------------
//	指定したﾎﾟｹﾓﾝﾃﾞｰﾀを取得する
//----------------------------------------------------------

void	ClientSBSSPokeparaGet(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	指定したｱﾄﾞﾚｽのﾎﾟｹﾓﾝﾃﾞｰﾀを取得する
//----------------------------------------------------------

void ClientSBSSPokeparaGet2(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	指定したﾎﾟｹﾓﾝﾃﾞｰﾀを変更する
//----------------------------------------------------------

void ClientSBSSPokeparaPut(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	指定したｱﾄﾞﾚｽのﾎﾟｹﾓﾝﾃﾞｰﾀを変更する
//----------------------------------------------------------

void ClientSBSSPokeparaPut2(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ登場ｴﾌｪｸﾄを起動する(ｴﾝｶｳﾝﾄ時)
//----------------------------------------------------------

void ClientSBSSPokeEncount(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ登場ｴﾌｪｸﾄを起動する(ﾎﾞｰﾙから飛び出す)
//----------------------------------------------------------

void ClientSBSSPokeAppear(void)
{
	ClientSBitReset();
}


//----------------------------------------------------------
//	ﾎﾟｹﾓﾝを戻すｴﾌｪｸﾄを起動する
//----------------------------------------------------------
void ClientSBSSPokeReturn(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	ﾄﾚｰﾅｰ登場ｴﾌｪｸﾄを起動する(ｴﾝｶｳﾝﾄ時)
//----------------------------------------------------------
#define TRAINER_IN_DX	(200)		//ｲﾝしてくるときの初期DX ※必ずTRAINER_IN_SPの倍数であること
#define TRAINER_IN_SP	(-4)	//ｲﾝしてくるときのｽﾋﾟｰﾄﾞ

void ClientSBSSTrainerEncount(void)
{
	TrainerBObjCellPalSet(MyData.my_sex, ClientNo);

//	PokeActHeaderMake(MyData.my_sex+500,ClientTypeGet(ClientNo));
	TrainerActHeaderMake(MyData.my_sex,ClientTypeGet(ClientNo));
	PokemonStruct[ClientNo] = AddActor(&PokeActHeader,
							C_TRN_X,
							C_TRN_Y+4*(8-trbpara[MyData.my_sex].size),
							C_TRN_PRI);	//ﾄﾚｰﾅｰ

	ActWork[PokemonStruct[ClientNo]].oamData.Pltt = ClientNo;
	ActWork[PokemonStruct[ClientNo]].dx = ENCOUNT_DX;
	ActWork[PokemonStruct[ClientNo]].work[0] = -ENCOUNT_SPEED;
	ActWork[PokemonStruct[ClientNo]].move = CAS_TrainerSlideIn;

	ClientSequence[ClientNo] = ClientSTrainerEncountWait;
}

//----------------------------------------------------------
//	ﾄﾚｰﾅｰ登場ｴﾌｪｸﾄを起動する(対戦終了後)
//----------------------------------------------------------

void ClientSBSSTrainerAppear(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	ﾄﾚｰﾅｰを戻すｴﾌｪｸﾄを起動する
//----------------------------------------------------------


void ClientSBSSTrainerReturn(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝが気絶するｴﾌｪｸﾄを起動する
//----------------------------------------------------------

void ClientSBSSPokeKizetu(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝが全滅したときのｴﾌｪｸﾄを起動する
//----------------------------------------------------------

void ClientSBSSZenmetsu(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ捕獲成功のｴﾌｪｸﾄを出す
//----------------------------------------------------------

void ClientSBSSGetSuccess(void)
{
//	ClientStruct[ClientNo] = MonsterBallSet(0,4);
	BtlWork->get_rate = 4;
	ClientEffectWait = 1;	//ﾎﾞｰﾙｹﾞｯﾄｴﾌｪｸﾄは終了をこれで見てる
	SetEtcEffect(ClientNo,ClientNo,ClientNoGet(BSS_CLIENT_ENEMY),FE_ID_POKEGET_SAFARI);

	ClientSequence[ClientNo] = ClientBallEffectWait;
//	ClientSBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ捕獲失敗のｴﾌｪｸﾄを出す
//----------------------------------------------------------

void ClientSBSSGetFail(void)
{
	u8 rate;
	
	rate = ServerBuffer[ClientNo][1];
//	ClientStruct[ClientNo] = MonsterBallSet(0, rate);
	BtlWork->get_rate = rate;
	ClientEffectWait = 1;	//ﾎﾞｰﾙｹﾞｯﾄｴﾌｪｸﾄは終了をこれで見てる
	SetEtcEffect(ClientNo, ClientNo,ClientNoGet(BSS_CLIENT_ENEMY),FE_ID_POKEGET_SAFARI);

	ClientSequence[ClientNo] = ClientBallEffectWait;
//	ClientSBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝﾚﾍﾞﾙｱｯﾌﾟのｴﾌｪｸﾄを出す
//----------------------------------------------------------

void ClientSBSSPokeLevelUp(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	指定した技ﾅﾝﾊﾞｰのｴﾌｪｸﾄを出す
//----------------------------------------------------------

void ClientSBSSWazaEffect(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	送ったﾃﾞｰﾀを文字ﾃﾞｰﾀと解釈してﾒｯｾｰｼﾞ表示する
//----------------------------------------------------------

void ClientSBSSMessage(void)
{
	u16	*MsgID;

	ScrX0=0;
	ScrY0=0;

	MsgID=(u16 *)&ServerBuffer[ClientNo][2];
	FightMsgID(MsgID[0]);
	TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
	ClientSequence[ClientNo] = ClientSMessageWait;
}

//----------------------------------------------------------
//	送ったﾃﾞｰﾀを文字ﾃﾞｰﾀと解釈してﾒｯｾｰｼﾞ表示する
//----------------------------------------------------------

void ClientSBSSAlertMessage(void)
{
	if(MineEnemyCheck(ClientNo)==SIDE_MINE)
		ClientSBSSMessage();
	else
		ClientSBitReset();
}

//----------------------------------------------------------
//	ｺﾏﾝﾄﾞ選択ｳｨﾝﾄﾞｳを表示して、選択ｼｰｹﾝｽを作動させる
//----------------------------------------------------------

void ClientSBSSCommandSelect(void)
{
	int	i;

	ScrX0=0;
	ScrY0=0x0a0;

	FightMsg.palette=0;
	FontScrnBoxFill(&FightMsg,SPACE_CHR_D,2,15,2+25,15+3);	//add 2001.08.07(火)
	FontScrnBoxFill(&FightMsg,SPACE_CHR_D,2,35,2+14,35+1);	//add 2001.08.07(火)
	ClientSequence[ClientNo]=ClientSCommandSelect;
	MsgPutSet(&FightMsg, SafariCommandMsg, CGX_START2+0x10,  19, 35);
	MsgPut(&FightMsg);
	for(i=0;i<4;i++) CommandCsrOff(i);
	CommandCsrOn(CommandCsrPos[ClientNo],0);
	FightMsgCreate((u8 *)&SafariDousuruMsg);
	MsgPutSet(&FightMsg, FightMsgBuf, CGX_START2+0x38,  2, 35);
	MsgPut(&FightMsg);
}

//----------------------------------------------------------
//	指定されたClientNoのシーケンスナンバーと同期をとる
//----------------------------------------------------------

void ClientSBSSCommandSelectCopy(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	技選択ｳｨﾝﾄﾞｳを表示して、選択ｼｰｹﾝｽを作動させる
//----------------------------------------------------------

void ClientSBSSWazaSelect(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	ｱｲﾃﾑ選択ｳｨﾝﾄﾞｳを表示して、選択ｼｰｹﾝｽを作動させる
//----------------------------------------------------------

void ClientSBSSItemSelect(void)
{
	PaletteFadeReq(0xffffffff, 0, 0, 16, 0);
	ClientSequence[ClientNo] = ClientCubeCaseWait;
	TempClientNo = ClientNo;
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ選択ｳｨﾝﾄﾞｳを表示して、選択ｼｰｹﾝｽを作動させる
//----------------------------------------------------------

void ClientSBSSPokeSelect(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	逃げるｴﾌｪｸﾄを起動する
//----------------------------------------------------------

void ClientSBSSEscape(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	HPｹﾞｰｼﾞを増減する
//----------------------------------------------------------

void	ClientSBSSHpGauge(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	EXPｹﾞｰｼﾞを増減する
//----------------------------------------------------------
void ClientSBSSExpGauge(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	指定されたｽﾃｰﾀｽ異常ｴﾌｪｸﾄを起動する
//----------------------------------------------------------

void ClientSBSSStatusSet(void)
{
	GaugeTransChrSet(ClientGaugeSt[ClientNo],&PokeParaMine[SelMonsNo[ClientNo]],G_SAFARIBALL);
	ClientSBitReset();
}

void ClientSBSSStatusEffect(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	指定されたｽﾃｰﾀｽ異常をｸﾘｱする
//----------------------------------------------------------

void ClientSBSSStatusClear(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	あらかじめ用意されたﾊﾞｯﾌｧにﾃﾞｰﾀを格納する
//----------------------------------------------------------

void ClientSBSSDataTrans(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	指定ｱﾄﾞﾚｽ(RAM,VRAM,CGRAM)にﾃﾞｰﾀを転送する
//----------------------------------------------------------

void ClientSBSSDataRamTrans(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	曲ﾃﾞｰﾀを転送する
//----------------------------------------------------------

void ClientSBSSBgmTrans(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	鳴き声ﾃﾞｰﾀを転送する
//----------------------------------------------------------

void ClientSBSSVoiceTrans(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	ﾒﾆｭｰで選択した項目IDを返す
//----------------------------------------------------------

void ClientSBSSSelectReturn(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ入れ替えを行ったことを知らせる
//----------------------------------------------------------

void ClientSBSSReshuffle(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	ｱｲﾃﾑ使用を知らせる
//----------------------------------------------------------

void ClientSBSSUseItem(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	ﾎﾞｰﾙ使用を知らせる
//----------------------------------------------------------

void ClientSBSSUseBall(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//技エフェクト用のカウンタのクリア
//----------------------------------------------------------

void	ClientSBSSLoopCountClear(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//技エフェクト用のカウンタのセット
//----------------------------------------------------------

void	ClientSBSSLoopCountSet(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//技エフェクト用のフラグのクリア
//----------------------------------------------------------

void	ClientSBSSSwitchFlagClear(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//技エフェクト用のフラグのセット
//----------------------------------------------------------

void	ClientSBSSSwitchFlagSet(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	ﾀﾞﾒｰｼﾞを受けたときのﾎﾟｹﾓﾝ点滅
//----------------------------------------------------------

void ClientSBSSPokeDamageBlink(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	ゲージを消す
//----------------------------------------------------------

void ClientSBSSGaugeOff(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	SEを鳴らす
//----------------------------------------------------------

void ClientSBSSSEPlay(void)
{
	s8 pan;
	
//	SePlay(ServerBuffer[ClientNo][1]|(ServerBuffer[ClientNo][2]<<8));
	if(MineEnemyCheck(ClientNo) == SIDE_MINE)
		pan = WAZA_SE_L;
	else
		pan = WAZA_SE_R;
	SePlayPan(ServerBuffer[ClientNo][1]|(ServerBuffer[ClientNo][2]<<8), pan);
	ClientSBitReset();
}

//----------------------------------------------------------
//	MEを鳴らす
//----------------------------------------------------------

void ClientSBSSMEPlay(void)
{
	JinglePlay(ServerBuffer[ClientNo][1]|(ServerBuffer[ClientNo][2]<<8));
	ClientSBitReset();
}

//----------------------------------------------------------
//	なきごえを鳴らす
//----------------------------------------------------------

void ClientSBSSVoicePlay(void)
{
	VoicePlay(PokeParaGet(&PokeParaMine[SelMonsNo[ClientNo]],ID_monsno),25);
	ClientSBitReset();
}

//----------------------------------------------------------
//	エンカウントエフェクトをセット
//----------------------------------------------------------

void ClientSBSSEncountEffect(void)
{
	EncountEffectSet(ServerBuffer[ClientNo][1]);
	//OBJ横移動のストッパー
	EncountEffectFlag|=ENCOUNT_EFFECT_FLAG_OBJSTOP;	
	ClientSBitReset();
}

//----------------------------------------------------------
//	最初のポケモン登場(ﾄﾚｰﾅｰ引っ込む、ﾎﾟｹﾓﾝ出す、ﾒｯｾｰｼﾞ出す。までの一連の動作
//----------------------------------------------------------

void ClientSBSSPokeSendOut(void)
{
	GaugeTransChrSet(ClientGaugeSt[ClientNo],&PokeParaMine[SelMonsNo[ClientNo]],G_SAFARI);
	GaugeAppearEffect(ClientNo);
	GaugeON(ClientGaugeSt[ClientNo]);
	ClientSBitReset();
}

//----------------------------------------------------------
//	トレーナー戦時のボールゲージを表示する
//----------------------------------------------------------

void	ClientSBSSBallGaugeSet(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	トレーナー戦時のボールゲージを非表示にする
//----------------------------------------------------------

void	ClientSBSSBallGaugeOff(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	ゲージのゆれを止める
//----------------------------------------------------------

void ClientSBSSGaugeYureStop(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	ポケモンのVANISHをOFFする
//----------------------------------------------------------

void	ClientSBSSVanishOff(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	戦闘エフェクトを出す
//----------------------------------------------------------

void	ClientSBSSFightEffect(void)
{
	u8 eff_no;
	u16 monsno;
	
	eff_no = ServerBuffer[ClientNo][1];
	monsno = ServerBuffer[ClientNo][2] | (ServerBuffer[ClientNo][3]<<8);
	
	if(SetFightEffect(ClientNo, ClientNo, ClientNo, eff_no, monsno))
		ClientSBitReset();
	else
		ClientSequence[ClientNo] = ClientSFightEffWait;
}

//----------------------------------------------------------
//	通信待機画面を出す
//----------------------------------------------------------

void	ClientSBSSTuushinWait(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	記憶しているカーソル位置のクリア
//----------------------------------------------------------

void	ClientSBSSCsrPosClear(void)
{
	ClientSBitReset();
}

//----------------------------------------------------------
//	対戦終了を知らせる
//----------------------------------------------------------

void ClientSBSSFightEnd(void)
{
	WinLoseFlag=ServerBuffer[ClientNo][1];
	BGM_FadeOutSet(5);
	LightFadeReq(N_to_B);
	ClientSBitReset();
	if((FightType&FIGHT_TYPE_TUUSHIN)&&((FightType&FIGHT_TYPE_OYA)==0))
		ClientSequence[ClientNo] = ClientFightEndWait;
}

//----------------------------------------------------------
//	ﾀﾞﾐｰ
//----------------------------------------------------------
void ClientSBSSEndID(void)
{
//	ClientSBitReset();
}

