
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
#include "clientai.h"
#include "a_mine.h"
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
#include "wazano.def"
#include "waza_dat.h"
#include "a_fight.h"

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

void	ClientCLMBitReset(void);	//範囲外の値の時の処理
void	ClientCLMDummy(void);
void	ClientCLMInit(void);
void	ClientCLMCommandWait(void);
void	ClientCLMPokeEncountWait(void);

void	ClientCLMCommandSelect(void);
void	ClientCLMWazaSelect(void);
void	ClientCLMHpGaugeWait(void);
void	ClientCLMPokeKizetsuWait(void);
void	ClientCLMMessageWait(void);

void	ClientCLMBSSPokeparaGet(void);
void	ClientCLMBSSPokeparaGet2(void);
void	ClientCLMBSSPokeparaPut(void);
void	ClientCLMBSSPokeparaPut2(void);
void	ClientCLMBSSPokeEncount(void);
void	ClientCLMBSSPokeAppear(void);
void	ClientCLMBSSPokeReturn(void);
void	ClientCLMBSSTrainerEncount(void);
void	ClientCLMBSSTrainerAppear(void);
void	ClientCLMBSSTrainerReturn(void);
void	ClientCLMBSSPokeKizetu(void);
void	ClientCLMBSSZenmetsu(void);
void	ClientCLMBSSGetSuccess(void);
void	ClientCLMBSSGetFail(void);
void	ClientCLMBSSPokeLevelUp(void);
void	ClientCLMBSSWazaEffect(void);
void	ClientCLMBSSMessage(void);
void	ClientCLMBSSAlertMessage(void);
void	ClientCLMBSSCommandSelect(void);
void	ClientCLMBSSCommandSelectCopy(void);
void	ClientCLMBSSWazaSelect(void);
void	ClientCLMBSSItemSelect(void);
void	ClientCLMBSSPokeSelect(void);
void	ClientCLMBSSEscape(void);
void	ClientCLMBSSHpGauge(void);
void	ClientCLMBSSExpGauge(void);
void	ClientCLMBSSStatusSet(void);
void	ClientCLMBSSStatusEffect(void);
void	ClientCLMBSSStatusClear(void);
void	ClientCLMBSSDataTrans(void);
void	ClientCLMBSSDataRamTrans(void);
void	ClientCLMBSSBgmTrans(void);
void	ClientCLMBSSVoiceTrans(void);
void	ClientCLMBSSSelectReturn(void);
void	ClientCLMBSSReshuffle(void);
void	ClientCLMBSSUseItem(void);
void	ClientCLMBSSUseBall(void);
void	ClientCLMBSSLoopCountClear(void);
void	ClientCLMBSSLoopCountSet(void);
void	ClientCLMBSSSwitchFlagClear(void);
void	ClientCLMBSSSwitchFlagSet(void);
void	ClientCLMBSSPokeDamageBlink(void);
void	ClientCLMBSSGaugeOff(void);
void	ClientCLMBSSSEPlay(void);
void	ClientCLMBSSMEPlay(void);
void	ClientCLMBSSVoicePlay(void);
void	ClientCLMBSSEncountEffect(void);
void	ClientCLMBSSPokeSendOut(void);
void	ClientCLMBSSBallGaugeSet(void);
void	ClientCLMBSSBallGaugeOff(void);
void	ClientCLMBSSGaugeYureStop(void);
void	ClientCLMBSSVanishOnOff(void);
void	ClientCLMBSSFightEffect(void);
void	ClientCLMBSSTuushinWait(void);
void	ClientCLMBSSCsrPosClear(void);
void	ClientCLMBSSFightEnd(void);
void	ClientCLMBSSEndID(void);

int		ClientCLMBSSPokeparaGetAct(u8,u8 *);
void	ClientCLMBSSPokeparaPutAct(u8);
static void SendOutTask(u8 id);
static void CLMAppearCommon(u8 client_no, u8);
static void ClientCLMWazaEffectSet(void);
static void ClientCLMAppearMigawariEffWait(void);
static void ClientCLMBallGaugeWait(void);
static void ClientCLMPokeReturnMigawariChk(void);

extern	actHeader PokeFTbl[];
extern	TALK_WIN	FightMsg;
//extern	u8	FightMsgBuf[64];

//----------------------------------------------------------
//	バトルサーバー命令群テーブル
//----------------------------------------------------------
const pFunc ClientCLMBSSTbl[] =
{
	ClientCLMBSSPokeparaGet,		// BSS_POKEPARA_GET=0,	
	ClientCLMBSSPokeparaGet2,	   	// BSS_POKEPARA_GET2,	
	ClientCLMBSSPokeparaPut,		// BSS_POKEPARA_PUT,	
	ClientCLMBSSPokeparaPut2,		// BSS_POKEPARA_PUT2,	
	ClientCLMBSSPokeEncount,		// BSS_POKEPARA_ENCOUNT,	add
	ClientCLMBSSPokeAppear,		// BSS_POKE_APPEAR,	
	ClientCLMBSSPokeReturn,		// BSS_POKE_RETURN,	
	ClientCLMBSSTrainerEncount,	// BSS_TRAINER_ENCOUNT,	add
	ClientCLMBSSTrainerAppear,		// BSS_TRAINER_APPEAR,	
	ClientCLMBSSTrainerReturn,		// BSS_TRAINER_RETURN,	
	ClientCLMBSSPokeKizetu,		// BSS_POKE_KIZETSU,	
	ClientCLMBSSZenmetsu,			// BSS_POKE_ZENMETSU,	
	ClientCLMBSSGetSuccess,		// BSS_GET_SUCCESS,	
	ClientCLMBSSGetFail,			// BSS_GET_FAIL,		
	ClientCLMBSSPokeLevelUp,		// BSS_POKE_LEVELUP,	
	ClientCLMBSSWazaEffect,		// BSS_WAZA_EFFECT,	
	ClientCLMBSSMessage,			// BSS_MESSAGE,		
	ClientCLMBSSAlertMessage,		// BSS_ALERT_MESSAGE,		
								
	ClientCLMBSSCommandSelect,		// BSS_COMMAND_SELECT, 

	ClientCLMBSSCommandSelectCopy,		// BSS_COMMAND_SELECT_COPY, 

	ClientCLMBSSWazaSelect,		// BSS_WAZA_SELECT,	
													
	ClientCLMBSSItemSelect,		// BSS_ITEM_SELECT,	
													
	ClientCLMBSSPokeSelect,		// BSS_POKE_SELECT,	
													
	ClientCLMBSSEscape,			// BSS_ESCAPE,			
	ClientCLMBSSHpGauge,			// BSS_HP_GAUGE,		
	ClientCLMBSSExpGauge,			// BSS_EXP_GAUGE,		
	ClientCLMBSSStatusSet,			// BSS_STATUS_SET,		
	ClientCLMBSSStatusEffect,		// BSS_STATUS_EFFECT,		
	ClientCLMBSSStatusClear,		// BSS_STATUS_CLEAR,	
	ClientCLMBSSDataTrans,			// BSS_DATA_TRANS,		
	ClientCLMBSSDataRamTrans,		// BSS_DATA_RAM_TRANS,	
													
	ClientCLMBSSBgmTrans,			// BSS_BGM_TRANS,		
	ClientCLMBSSVoiceTrans,		// BSS_VOICE_TRANS,	
	ClientCLMBSSSelectReturn,		// BSS_SELECT_RETURN,	
	ClientCLMBSSReshuffle,			// BSS_POKE_RESHUFFLE,	
	ClientCLMBSSUseItem,			// BSS_USE_ITEM,		
	ClientCLMBSSUseBall,			// BSS_USE_BALL,		
	ClientCLMBSSLoopCountClear,	//	BSS_LOOPCOUNT_CLEAR
	ClientCLMBSSLoopCountSet,	//	BSS_LOOPCOUNT_SET
	ClientCLMBSSSwitchFlagClear,	//	BSS_SWITCHFLAG_CLEAR
	ClientCLMBSSSwitchFlagSet,	//	BSS_SWITCHFLAG_SET
	ClientCLMBSSPokeDamageBlink,	// BSS_POKEDAMAGE_BLINK,
	ClientCLMBSSGaugeOff,		// BSS_GAUGE_OFF,
	ClientCLMBSSSEPlay,			// BSS_SE_PLAY,
	ClientCLMBSSMEPlay,			// BSS_SE_PLAY,
	ClientCLMBSSVoicePlay,			// BSS_VOICE_PLAY,
	ClientCLMBSSEncountEffect,	// BSS_ENCOUNT_EFFECT,
	ClientCLMBSSPokeSendOut,		// BSS_POKE_SENDOUT,
	ClientCLMBSSBallGaugeSet,	// BSS_BALL_GAUGE_SET,
	ClientCLMBSSBallGaugeOff,	// BSS_BALL_GAUGE_OFF,
	ClientCLMBSSGaugeYureStop,	// BSS_BALL_GAUGE_OFF,
	ClientCLMBSSVanishOnOff,		// BSS_VANISH_OFF,
	ClientCLMBSSFightEffect,	// BSS_FIGHT_EFFECT
	ClientCLMBSSTuushinWait,	// BSS_TUUSHIN_WAIT
	ClientCLMBSSCsrPosClear,		// BSS_CSRPOS_CLEAR,
	ClientCLMBSSFightEnd,		// BSS_FIGHT_END,

	ClientCLMBSSEndID,				// BSS_END_ID,		いらないけど一応
};

//----------------------------------------------------------
//	プロトタイプ宣言	関数＆ﾃﾞｰﾀ
//----------------------------------------------------------

#define	CAI_LVNUM_X			84
#define	CAI_LVNUM_Y			28

//==============================================================
//                       メインルーチン
//==============================================================

void	ClientCLMDummy(void)
{
}

void	ClientCLMInit(void)
{
	ClientSequence[ClientNo]=ClientCLMCommandWait;

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

void	ClientCLMCommandWait(void)
{
	if((ClientBit&no2bittbl[ClientNo]) != 0)
	{
		if(ServerBuffer[ClientNo][0] <= BSS_END_ID)// && ServerBuffer[ClientNo][0] > -1)
		{
			ClientCLMBSSTbl[ServerBuffer[ClientNo][0]]();
		}
		else
		{
			ClientCLMBitReset();	//範囲外の値の時の処理
		}
	}
}

//=========================================================================
//	ウェイトルーチン
//=========================================================================
//
void ClientCLMTrainerEncountWait(void)
{
	if(ActWork[PokemonStruct[ClientNo]].move == DummyActMove)
	{
		//DelActor(&ActWork[PokemonStruct[ClientNo]]);
		ClientCLMBitReset();
	}
}

void ClientCLMTrainerReturnWait(void)
{
#if 0
	if(ActWork[PokemonStruct[ClientNo]].dx > 64)
#else
	if(ActWork[PokemonStruct[ClientNo]].move == DummyActMove)
#endif
	{
		TrainerBObjCellPalDel(0);
		AffineDelActor(&ActWork[PokemonStruct[ClientNo]]);	//一応(呼んでも問題はないし)
		DelActor(&ActWork[PokemonStruct[ClientNo]]);
		
		ClientCLMBitReset();
	}
}

void ClientCLMSendOutWaitBitReset(void)
{
	if(CliSys[ClientNo].send_out_wait-- == 0){
		CliSys[ClientNo].send_out_wait = 0;
		ClientCLMBitReset();
	}
}

void ClientCLMSendOutGaugeWait(void)
{
#if 0	//2002.05.02(木)
	if(ActWork[ClientGaugeSt[ClientNo]].move == DummyActMove
		&& ActWork[ClientGaugeSt[ClientNo^2]].move == DummyActMove)
	{
		ClientCLMBitReset();
	}
#else
	u8 end = 0;
	
	if(FightCheck() == 0 || (FightCheck() && (FightType & FIGHT_TYPE_4_2vs2)))
	{	//1vs1対戦 又は 4人通信
		if(ActWork[ClientGaugeSt[ClientNo]].move == DummyActMove)
			end = 1;
	}
	else
	{	//2vs2対戦
		if(ActWork[ClientGaugeSt[ClientNo]].move == DummyActMove
				&& ActWork[ClientGaugeSt[ClientNo^2]].move == DummyActMove)
			end = 1;
	}

	if(VoiceEndCheck())	//add 2002.09.30(月)
		end = 0;
	
	if(end){
		//ClientCLMBitReset();
//		if(FightType&FIGHT_TYPE_4_2vs2)
//			m4aMPlayContinue(&m4a_mplay000);
//		else
//			m4aMPlayVolumeControl(&m4a_mplay000,0xffff,256);
		CliSys[ClientNo].send_out_wait = 3;
		ClientSequence[ClientNo] = ClientCLMSendOutWaitBitReset;
	}
#endif
}

void ClientCLMPokeSendOutWait(void)
{
//	if(ActWork[ClientStruct[ClientNo]].move == DummyActMove)	//2個同時に投げてるので1個だけﾁｪｯｸしておけば問題ないかと
	if(CliSys[ClientNo].ball_eff_wait == 0 && CliSys[ClientNo^2].ball_eff_wait == 0)
	{
		if(CliSys[ClientNo].send_out_wait++ == 0)
			return;
		CliSys[ClientNo].send_out_wait = 0;
		
		if(FightCheck() && 	(FightType & FIGHT_TYPE_4_2vs2) == 0)
		{
			DelActor(&ActWork[ClientStruct[ClientNo^2]]);		//ｴﾌｪｸﾄ監視ｱｸﾀｰDEL
			GaugeTransChrSet(ClientGaugeSt[ClientNo^2],
				&PokeParaMine[SelMonsNo[ClientNo^2]], G_ALL);
			GaugeAppearEffect(ClientNo^2);
			GaugeON(ClientGaugeSt[ClientNo^2]);
			
			//ﾄﾚｰﾅｰは自動でDelされるので
//			AffineDelActor(&ActWork[PokemonStruct[ClientNo^2]]);//一応(呼んでも問題はないし)
//			DelActor(&ActWork[PokemonStruct[ClientNo^2]]);
		}
		
		DelActor(&ActWork[ClientStruct[ClientNo]]);			//ｴﾌｪｸﾄ監視ｱｸﾀｰDEL
		GaugeTransChrSet(ClientGaugeSt[ClientNo],
				&PokeParaMine[SelMonsNo[ClientNo]], G_ALL);
		GaugeAppearEffect(ClientNo);
		GaugeON(ClientGaugeSt[ClientNo]);

		//ﾄﾚｰﾅｰは自動でDelされるので
//		AffineDelActor(&ActWork[PokemonStruct[ClientNo^2]]);//一応(呼んでも問題はないし)
//		DelActor(&ActWork[PokemonStruct[ClientNo^2]]);
		
//		ClientCLMBitReset();
		BtlWork->sendout_eff = 0;
		ClientSequence[ClientNo] = ClientCLMSendOutGaugeWait;
	}
}


void	ClientCLMPokeEncountWait(void)
{
	if((ActWork[PokemonStruct[ClientNo]].anmend_sw==1)&&
	(ActWork[PokemonStruct[ClientNo]].dx==0)){
//		ClientBit&=(no2bittbl[ClientNo]^0xffffffff);
//		ClientSequence[ClientNo]=ClientCLMCommandWait;
		ClientCLMBitReset();
	}
}

void	ClientCLMHpGaugeWait(void)
{
	s16 work;
//	u8 parts;
	
	work = GaugeOBJ(ClientNo, ClientGaugeSt[ClientNo], 0, 0);
	GaugeON(ClientGaugeSt[ClientNo]);
	if(work != -1)
	{
		GaugeHPTrans(ClientGaugeSt[ClientNo], work, 0);
	}
	else
	{
	#if 0
		//-- ｹﾞｰｼﾞ揺らしの時に変更したｶﾗｰを元に戻す --//
		ObjPalRegNumDel(CELLID_BattleGaugeColor);
		parts = ActWork[ClientGaugeSt[ClientNo]].work[5];
		ActWork[ClientGaugeSt[ClientNo]].oamData.Pltt = ActWork[parts].work[0];
		ActWork[parts].work[0] = 0;
	#endif
		PinchSeCheckPlay(&PokeParaMine[SelMonsNo[ClientNo]], ClientNo);
		ClientCLMBitReset();
	}
}


void	ClientCLMPokeKizetsuWait(void)
{
#if 0	//2002.08.24(土) by matsuda
	if(ActWork[PokemonStruct[ClientNo]].act_sw==0){
//		ClientBit&=(no2bittbl[ClientNo]^0xffffffff);
//		ClientSequence[ClientNo]=ClientCLMCommandWait;
		GaugeOFF(ClientGaugeSt[ClientNo]);
		ClientCLMBitReset();
	}
#else
	if(ActWork[PokemonStruct[ClientNo]].y + ActWork[PokemonStruct[ClientNo]].dy > 160)
	{
//		PokemonBObjCellPalDel(PokeParaMine[SelMonsNo[ClientNo]].PPP.monsno);
//		changed by soga 2001.08.29
		PokemonBObjCellPalDel(
			PokeParaGet(&PokeParaMine[SelMonsNo[ClientNo]],ID_monsno));
		AffineWorkNumDel(ActWork[PokemonStruct[ClientNo]].oamData.AffineParamNo);
		DelActor(&ActWork[PokemonStruct[ClientNo]]);
		
		GaugeOFF(ClientGaugeSt[ClientNo]);
		ClientCLMBitReset();
	}
#endif
}

void ClientCLMPokeReturnWait(void)
{
	if(CliSys[ClientNo].etc_eff == 0)
	{
		AffineDelActor(&ActWork[PokemonStruct[ClientNo]]);
		DelActor(&ActWork[PokemonStruct[ClientNo]]);
		
		GaugeOFF(ClientGaugeSt[ClientNo]);
		ClientCLMBitReset();
	}
}

void	ClientCLMMessageWait(void)
{
	if(FightMsg.status==MSG_END){
//		ClientBit&=(no2bittbl[ClientNo]^0xffffffff);
//		ClientSequence[ClientNo]=ClientCLMCommandWait;
		ClientCLMBitReset();
	}
}

#if 0	// 2002.07.22(月)
void	ClientCLMWazaEffectWait(void)
{
	WazaEffectSequence();
	if(WazaEffectFlag==0){
		ClientCLMBitReset();
	}
}
#endif

void ClientCLMPokeDamageBlinkWait(void)
{
	u8 pokeact;
	
	pokeact = PokemonStruct[ClientNo];
	if(ActWork[pokeact].work[1] == DAMAGE_BLINK_WAIT)
	{
		ActWork[pokeact].work[1] = 0;
		ActWork[pokeact].banish = 0;
		ClientEffectWait = 0;	//Blinkｴﾌｪｸﾄ、フラグをﾘｾｯﾄ
		ClientCLMBitReset();
	}
	else
	{
		if(ActWork[pokeact].work[1] % BLINK_INTERVAL == 0)
			ActWork[pokeact].banish ^= 1;
		ActWork[pokeact].work[1]++;
	}
}

void ClientCLMGaugeAppearWait(void)
{
	if(ActWork[ClientGaugeSt[ClientNo]].move == DummyActMove){
		//身代わりチェック
		if(Climem[ClientNo].migawari)
			SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_MIGAWARI_IN);
		ClientSequence[ClientNo] = ClientCLMAppearMigawariEffWait;
	}
}

static void ClientCLMAppearMigawariEffWait(void)
{
	if(CliSys[ClientNo].etc_eff == 0)
		ClientCLMBitReset();
}

void ClientCLMPokeAppearWaitSub(void)
{
//	if(ActWork[PokemonStruct[ClientNo]].anmend_sw == 1)		ｱﾆﾒ止める 2002.02.28(木)
	if(CliSys[ClientNo].rare_eff_end)
	{
		CliSys[ClientNo].rare_eff = 0;
		CliSys[ClientNo].rare_eff_end = 0;
		CellDel(WAZACHR_ID_SHOOTINGSTAR);
		ObjPalRegNumDel(WAZACHR_ID_SHOOTINGSTAR);

		AddTask(VoiceCheckTask, 10);
		PinchSeCheckPlay(&PokeParaMine[SelMonsNo[ClientNo]], ClientNo);

		ActAnmChg(&ActWork[PokemonStruct[ClientNo]], 0);
		GaugeTransChrSet(ClientGaugeSt[ClientNo],
				&PokeParaMine[SelMonsNo[ClientNo]], G_ALL);
		GaugeAppearEffect(ClientNo);
		GaugeON(ClientGaugeSt[ClientNo]);
		PokeClientBanishMemory(ClientNo);
//		ClientCLMBitReset();
		ClientSequence[ClientNo] = ClientCLMGaugeAppearWait;
	}
}
void ClientCLMPokeAppearWait(void)
{
	if(CliSys[ClientNo].ball_eff_wait == 0 && CliSys[ClientNo].rare_eff == 0)
		RareEffectCheckSet(ClientNo, &PokeParaMine[SelMonsNo[ClientNo]]);

	if(ActWork[ClientStruct[ClientNo]].move == DummyActMove && CliSys[ClientNo].ball_eff_wait == 0)
	{
		DelActor(&ActWork[ClientStruct[ClientNo]]);					//ｴﾌｪｸﾄ監視ｱｸﾀｰDEL
//		ActAnmChg(&ActWork[PokemonStruct[ClientNo]], 1);	ｱﾆﾒ止める 2002.02.28(木)
//		VoicePlay(PokeParaGet(&PokeParaMine[SelMonsNo[ClientNo]],ID_monsno),25);
		ClientSequence[ClientNo] = ClientCLMPokeAppearWaitSub;
	}
}

static void ClientFightEndWaitTuushin(void)
{
	if(pokemon_sio_flag==0){
		m4aSongNumStop(SE_HINSI);		//HP少ないアラームをとめる
		sys.FieldBattleFlag=0;			//戦闘中Flagをおとす
		sys.pFirstProc=PushFirstProc;
//		MainProcChange(sys.pReturnProc);
		MainProcChange(FightEndWindowInit);
	}
}

static void ClientFightEndWait(void)
{
	if(FadeData.fade_sw == 0){
		if(FightType&FIGHT_TYPE_TUUSHIN){
			SetSioEndDataStart();
			ClientSequence[ClientNo]=ClientFightEndWaitTuushin;
			return;
		}
		m4aSongNumStop(SE_HINSI);		//HP少ないアラームをとめる
		sys.FieldBattleFlag=0;			//戦闘中Flagをおとす
		sys.pFirstProc=PushFirstProc;
		MainProcChange(sys.pReturnProc);
	}
}

//==============================================================
//                       サブルーチン
//==============================================================

void ClientCLMBitReset(void)
{
	u8	id;

	ClientSequence[ClientNo] = ClientCLMCommandWait;
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
void ClientCLMStatusEffWait(void)
{
	if(CliSys[ClientNo].status_eff == 0)
		ClientCLMBitReset();
}

//----------------------------------------------------------
//	戦闘ｴﾌｪｸﾄ終了待ち
//----------------------------------------------------------
void ClientCLMFightEffWait(void)
{
	if(CliSys[ClientNo].fight_eff == 0)
		ClientCLMBitReset();
}



//==============================================================
//	クライアント命令関数
//==============================================================

//----------------------------------------------------------
//	指定したﾎﾟｹﾓﾝﾃﾞｰﾀを取得する
//----------------------------------------------------------

void	ClientCLMBSSPokeparaGet(void)
{
	u8 temp[256];
	int	length=0;
	int	i;
	u8	flag;

	if(ServerBuffer[ClientNo][2] == 0){
		length+=ClientCLMBSSPokeparaGetAct(SelMonsNo[ClientNo],&temp[length]);
	}
	else{
		flag = ServerBuffer[ClientNo][2];
		for(i=0;i<6;i++){
			if((flag&1)!=0){
				length+=ClientCLMBSSPokeparaGetAct(i,&temp[length]);
			}
			flag=flag>>1;
		}
	}
	BSS_DATA_TRANS_SET(BSS_CLIENT,length,(u8 *)&temp);
	ClientCLMBitReset();
}

int	ClientCLMBSSPokeparaGetAct(u8 SelectNo,u8 *temp)
{
	PokemonServerParam	PCP;
	PokemonWazaParam	PWP;
	int	i=0;
	u8	*adr;
	u16	buf16;
	u32	buf32;
	u8 buff[20];
	
	switch(ServerBuffer[ClientNo][1])
	{
		case BSS_PARA_FIGHT:			//戦闘時に必要なパラメータ全て
			PCP.monsno		=PokeParaGet(&PokeParaMine[SelectNo],ID_monsno);
			PCP.item		=PokeParaGet(&PokeParaMine[SelectNo],ID_item);
			for(i=0;i<4;i++){
				PCP.waza[i]	=PokeParaGet(&PokeParaMine[SelectNo],ID_waza1+i);
				PCP.pp[i]	=PokeParaGet(&PokeParaMine[SelectNo],ID_pp1+i);
			}
			PCP.pp_count	=PokeParaGet(&PokeParaMine[SelectNo],ID_pp_count);
			PCP.friend		=PokeParaGet(&PokeParaMine[SelectNo],ID_friend);
			PCP.exp			=PokeParaGet(&PokeParaMine[SelectNo],ID_exp);
			PCP.hp_rnd		=PokeParaGet(&PokeParaMine[SelectNo],ID_hp_rnd);
			PCP.pow_rnd		=PokeParaGet(&PokeParaMine[SelectNo],ID_pow_rnd);
			PCP.def_rnd		=PokeParaGet(&PokeParaMine[SelectNo],ID_def_rnd);
			PCP.agi_rnd		=PokeParaGet(&PokeParaMine[SelectNo],ID_agi_rnd);
			PCP.spepow_rnd	=PokeParaGet(&PokeParaMine[SelectNo],ID_spepow_rnd);
			PCP.spedef_rnd	=PokeParaGet(&PokeParaMine[SelectNo],ID_spedef_rnd);
			PCP.personal_rnd=PokeParaGet(&PokeParaMine[SelectNo],ID_personal_rnd);
			PCP.condition	=PokeParaGet(&PokeParaMine[SelectNo],ID_condition);
			PCP.level		=PokeParaGet(&PokeParaMine[SelectNo],ID_level);
			PCP.hp			=PokeParaGet(&PokeParaMine[SelectNo],ID_hp);
			PCP.hpmax		=PokeParaGet(&PokeParaMine[SelectNo],ID_hpmax);
			PCP.pow			=PokeParaGet(&PokeParaMine[SelectNo],ID_pow);
			PCP.def			=PokeParaGet(&PokeParaMine[SelectNo],ID_def);
			PCP.agi			=PokeParaGet(&PokeParaMine[SelectNo],ID_agi);
			PCP.spepow		=PokeParaGet(&PokeParaMine[SelectNo],ID_spepow);
			PCP.spedef		=PokeParaGet(&PokeParaMine[SelectNo],ID_spedef);
			PCP.tamago_flag	=PokeParaGet(&PokeParaMine[SelectNo],ID_tamago_flag);
			PCP.speabi		=PokeParaGet(&PokeParaMine[SelectNo],ID_speabi);
			PCP.id_no		=PokeParaGet(&PokeParaMine[SelectNo],ID_id_no);
		#if 0	//ローカライズ対応のため変更 2002.08.09(金)
			PokeParaGet(&PokeParaMine[SelectNo],ID_nickname,PCP.nickname);
		#else
			PokeParaGet(&PokeParaMine[SelectNo],ID_nickname,buff);
			NickNameCopy(PCP.nickname, buff);
		#endif
			PokeParaGet(&PokeParaMine[SelectNo],ID_oyaname,PCP.oyaname);
			//BSS_DATA_TRANS_SET(BSS_CLIENT,sizeof(PCP),(u8 *)&PCP);
			adr=(u8 *)&PCP;
//			for(i=0;i<XtOffset(PokemonServerParam *, work);i++){
			for(i=0;i<sizeof(PokemonServerParam);i++){
				temp[i]=adr[i];
			}
			break;
		case BSS_PARA_MONSNO:			//モンスター番号
			buf16=PokeParaGet(&PokeParaMine[SelectNo],ID_monsno);
			temp[0]=(buf16&0x00ff)>> 0;
			temp[1]=(buf16&0xff00)>> 8;
			i=2;
			break;
		case BSS_PARA_ITEM:				//装備アイテム
			buf16=PokeParaGet(&PokeParaMine[SelectNo],ID_item);
			temp[0]=(buf16&0x00ff)>> 0;
			temp[1]=(buf16&0xff00)>> 8;
			i=2;
			break;
		case BSS_PARA_WAZA:
			for(i=0;i<4;i++){
				PWP.waza[i] = PokeParaGet(&PokeParaMine[SelectNo],ID_waza1+i);
				PWP.pp[i]   = PokeParaGet(&PokeParaMine[SelectNo],ID_pp1+i);
			}
			PWP.pp_count=PokeParaGet(&PokeParaMine[SelectNo],ID_pp_count);
			adr=(u8 *)&PWP.waza[0];
			for(i=0;i<sizeof(PokemonWazaParam);i++){
				temp[i]=adr[i];
			}
			break;
		case BSS_PARA_WAZA1:				//技
		case BSS_PARA_WAZA2:
		case BSS_PARA_WAZA3:
		case BSS_PARA_WAZA4:
			buf16=
			PokeParaGet(&PokeParaMine[SelectNo],ID_waza1+ServerBuffer[ClientNo][1]-BSS_PARA_WAZA1);
			temp[0]=(buf16&0x00ff)>> 0;
			temp[1]=(buf16&0xff00)>> 8;
			i=2;
			break;
		case BSS_PARA_PP:
			for(i=0;i<4;i++){
				temp[i] = PokeParaGet(&PokeParaMine[SelectNo],ID_pp1+i);
			}
			temp[i] = PokeParaGet(&PokeParaMine[SelectNo],ID_pp_count);
			i++;
			break;
		case BSS_PARA_PP1:				//技ポイント
		case BSS_PARA_PP2:
		case BSS_PARA_PP3:
		case BSS_PARA_PP4:
			temp[0]=
			PokeParaGet(&PokeParaMine[SelectNo],ID_pp1+ServerBuffer[ClientNo][1]-BSS_PARA_PP1);
			i=1;
			break;
		case BSS_PARA_PPCOUNT1:
		case BSS_PARA_PPCOUNT2:
		case BSS_PARA_PPCOUNT3:
		case BSS_PARA_PPCOUNT4:
#if 0
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo].PPP.pp_count1;
			BSS_DATA_TRANS_SET(BSS_CLIENT,sizeof(temp[0]),&temp[0]);
			break;
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo].PPP.pp_count2;
			BSS_DATA_TRANS_SET(BSS_CLIENT,sizeof(temp[0]),&temp[0]);
			break;
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo].PPP.pp_count3;
			BSS_DATA_TRANS_SET(BSS_CLIENT,sizeof(temp[0]),&temp[0]);
			break;
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo].PPP.pp_count4;
			BSS_DATA_TRANS_SET(BSS_CLIENT,sizeof(temp[0]),&temp[0]);
#endif
			break;
		case BSS_PARA_ID:				//ＩＤナンバー
			buf32=PokeParaGet(&PokeParaMine[SelectNo],ID_id_no);
			temp[0]=(buf32&0x000000ff)>> 0;
			temp[1]=(buf32&0x0000ff00)>> 8;
			temp[2]=(buf32&0x00ff0000)>>16;
			i=3;
			break;
		case BSS_PARA_EXP:				//基本経験値
			buf32=PokeParaGet(&PokeParaMine[SelectNo],ID_exp);
			temp[0]=(buf32&0x000000ff)>> 0;
			temp[1]=(buf32&0x0000ff00)>> 8;
			temp[2]=(buf32&0x00ff0000)>>16;
			i=3;
			break;
		case BSS_PARA_HPEXP:			//ＨＰ努力値
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_hp_exp);
			i=1;
			break;
		case BSS_PARA_POWEXP:			//攻撃力努力値
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_pow_exp);
			i=1;
			break;
		case BSS_PARA_DEFEXP:			//防御力努力値
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_def_exp);
			i=1;
			break;
		case BSS_PARA_AGIEXP:			//素早さ努力値
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_agi_exp);
			i=1;
			break;
		case BSS_PARA_SPEPOWEXP:		//特殊攻撃努力値
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_spepow_exp);
			i=1;
			break;
		case BSS_PARA_SPEDEFEXP:		//特殊防御努力値
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_spedef_exp);
			i=1;
			break;
		case BSS_PARA_FRIEND:			//友好値
			temp[0]=PokeParaGet(&PokeParaMine[SelectNo],ID_friend);
			i=1;
			break;
		case BSS_PARA_POKERUS:			//ポケルス
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_pokerus);
			i=1;
			break;
		case BSS_PARA_GET_PLACE:		//捕獲場所
			temp[0]=PokeParaGet(&PokeParaMine[SelectNo],ID_get_place);
			i=1;
			break;
		case BSS_PARA_GET_LEVEL:		//捕獲レベル
			temp[0]=PokeParaGet(&PokeParaMine[SelectNo],ID_get_level);
			i=1;
			break;
		case BSS_PARA_GET_CASSETTE:		//捕獲カセット
			temp[0]=PokeParaGet(&PokeParaMine[SelectNo],ID_get_cassette);
			i=1;
			break;
		case BSS_PARA_GET_BALL:			//捕獲ボール
			temp[0]=PokeParaGet(&PokeParaMine[SelectNo],ID_get_ball);
			i=1;
			break;
		case BSS_PARA_POWERRND:
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_hp_rnd);
			temp[1] = PokeParaGet(&PokeParaMine[SelectNo],ID_pow_rnd);
			temp[2] = PokeParaGet(&PokeParaMine[SelectNo],ID_def_rnd);
			temp[3] = PokeParaGet(&PokeParaMine[SelectNo],ID_agi_rnd);
			temp[4] = PokeParaGet(&PokeParaMine[SelectNo],ID_spepow_rnd);
			temp[5] = PokeParaGet(&PokeParaMine[SelectNo],ID_spedef_rnd);
			i=6;
			break;
		case BSS_PARA_HPRND:			//HPパワー乱数
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_hp_rnd);
			i=1;
			break;
		case BSS_PARA_POWRND:			//攻撃力パワー乱数
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_pow_rnd);
			i=1;
			break;
		case BSS_PARA_DEFRND:			//防御力パワー乱数
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_def_rnd);
			i=1;
			break;
		case BSS_PARA_AGIRND:			//素早さパワー乱数
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_agi_rnd);
			i=1;
			break;
		case BSS_PARA_SPEPOWRND:		//特殊攻撃力パワー乱数
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_spepow_rnd);
			i=1;
			break;
		case BSS_PARA_SPEDEFRND:		//特殊防御力パワー乱数
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_spedef_rnd);
			i=1;
			break;
		case BSS_PARA_CHRRND:			//個性乱数
			buf32 = PokeParaGet(&PokeParaMine[SelectNo],ID_personal_rnd);
			temp[0]=(buf32&0x000000ff)>> 0;
			temp[1]=(buf32&0x0000ff00)>> 8;
			temp[2]=(buf32&0x00ff0000)>>16;
			temp[3]=(buf32&0xff000000)>>24;
			i=4;
			break;
		case BSS_PARA_SUM:				//チェックサム
			buf16 = PokeParaGet(&PokeParaMine[SelectNo],ID_checksum);
			temp[0]=(buf16&0x000000ff)>> 0;
			temp[1]=(buf16&0x0000ff00)>> 8;
			i=2;
			break;
		case BSS_PARA_CONDITION:		//コンディション
			buf32=PokeParaGet(&PokeParaMine[SelectNo],ID_condition);
			temp[0]=(buf32&0x000000ff)>> 0;
			temp[1]=(buf32&0x0000ff00)>> 8;
			temp[2]=(buf32&0x00ff0000)>>16;
			temp[3]=(buf32&0xff000000)>>24;
			i=4;
			break;
		case BSS_PARA_LEVEL:			//レベル
			temp[0]=PokeParaGet(&PokeParaMine[SelectNo],ID_level);
			i=1;
			break;
		case BSS_PARA_HP:				//ＨＰ残量
			buf16=PokeParaGet(&PokeParaMine[SelectNo],ID_hp);
			temp[0]=(buf16&0x000000ff)>> 0;
			temp[1]=(buf16&0x0000ff00)>> 8;
			i=2;
			break;
		case BSS_PARA_HPMAX:			//ＨＰＭＡＸ
			buf16=PokeParaGet(&PokeParaMine[SelectNo],ID_hpmax);
			temp[0]=(buf16&0x000000ff)>> 0;
			temp[1]=(buf16&0x0000ff00)>> 8;
			i=2;
			break;
		case BSS_PARA_POW:				//攻撃力
			buf16=PokeParaGet(&PokeParaMine[SelectNo],ID_pow);
			temp[0]=(buf16&0x000000ff)>> 0;
			temp[1]=(buf16&0x0000ff00)>> 8;
			i=2;
			break;
		case BSS_PARA_DEF:				//防御力
			buf16=PokeParaGet(&PokeParaMine[SelectNo],ID_def);
			temp[0]=(buf16&0x000000ff)>> 0;
			temp[1]=(buf16&0x0000ff00)>> 8;
			i=2;
			break;
		case BSS_PARA_AGI:				//素早さ
			buf16=PokeParaGet(&PokeParaMine[SelectNo],ID_agi);
			temp[0]=(buf16&0x000000ff)>> 0;
			temp[1]=(buf16&0x0000ff00)>> 8;
			i=2;
			break;
		case BSS_PARA_SPEPOW:			//特殊攻撃力
			buf16=PokeParaGet(&PokeParaMine[SelectNo],ID_spepow);
			temp[0]=(buf16&0x000000ff)>> 0;
			temp[1]=(buf16&0x0000ff00)>> 8;
			i=2;
			break;
		case BSS_PARA_SPEDEF:			//特殊防御力
			buf16=PokeParaGet(&PokeParaMine[SelectNo],ID_spedef);
			temp[0]=(buf16&0x000000ff)>> 0;
			temp[1]=(buf16&0x0000ff00)>> 8;
			i=2;
			break;
		case BSS_PARA_STYLE:			//かっこよさ
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_style);
			i=1;
			break;
		case BSS_PARA_BEAUTIFUL:		//美しさ
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_beautiful);
			i=1;
			break;
		case BSS_PARA_CUTE:				//かわいさ
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_cute);
			i=1;
			break;
		case BSS_PARA_CLEVER:			//賢さ
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_clever);
			i=1;
			break;
		case BSS_PARA_STRONG:			//たくましさ
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_strong);
			i=1;
			break;
		case BSS_PARA_FUR:				//毛艶
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_fur);
			i=1;
			break;
		case BSS_PARA_STYLEMEDAL:		//かっこよさ勲章
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_stylemedal);
			i=1;
			break;
		case BSS_PARA_BEAUTIFULMEDAL:	//美しさ勲章
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_beautifulmedal);
			i=1;
			break;
		case BSS_PARA_CUTEMEDAL:		//かわいさ勲章
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_cutemedal);
			i=1;
			break;
		case BSS_PARA_CLEVERMEDAL:		//賢さ勲章
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_clevermedal);
			i=1;
			break;
		case BSS_PARA_STRONGMEDAL:		//たくましさ勲章
			temp[0] = PokeParaGet(&PokeParaMine[SelectNo],ID_strongmedal);
			i=1;
			break;
	}
	return	i;
}

//----------------------------------------------------------
//	指定したｱﾄﾞﾚｽのﾎﾟｹﾓﾝﾃﾞｰﾀを取得する
//----------------------------------------------------------
void ClientCLMBSSPokeparaGet2(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	指定したﾎﾟｹﾓﾝﾃﾞｰﾀを変更する
//----------------------------------------------------------

void ClientCLMBSSPokeparaPut(void)
{
	u8	i,flag;

	if(ServerBuffer[ClientNo][2] == 0){
		ClientCLMBSSPokeparaPutAct(SelMonsNo[ClientNo]);
	}
	else{
		flag = ServerBuffer[ClientNo][2];
		for(i=0;i<6;i++){
			if((flag&1)!=0){
				ClientCLMBSSPokeparaPutAct(i);
			}
			flag=flag>>1;
		}
	}
	ClientCLMBitReset();
}

void ClientCLMBSSPokeparaPutAct(u8 SelectNo)
{
	PokemonServerParam *PCP;
	PokemonWazaParam *PWP;
	int	i;
	u8	buf;

	PCP=(PokemonServerParam *)&ServerBuffer[ClientNo][BSS_DATALOW];
	PWP=(PokemonWazaParam *)&ServerBuffer[ClientNo][BSS_DATALOW];

	switch(ServerBuffer[ClientNo][1])
	{
		case BSS_PARA_FIGHT:			//戦闘時に必要なパラメータ全て
			PokeParaPut(&PokeParaMine[SelectNo],ID_monsno, 
						(u8 *)&PCP->monsno);
			PokeParaPut(&PokeParaMine[SelectNo],ID_item,
						(u8 *)&PCP->item);
			for(i=0;i<4;i++){
				PokeParaPut(&PokeParaMine[SelectNo],ID_waza1+i,
							(u8 *)&PCP->waza[i]);
				PokeParaPut(&PokeParaMine[SelectNo],ID_pp1+i,
							(u8 *)&PCP->pp[i]);
			}
			PokeParaPut(&PokeParaMine[SelectNo],ID_pp_count,
						(u8 *)&PCP->pp_count);
			PokeParaPut(&PokeParaMine[SelectNo],ID_friend,
						(u8 *)&PCP->friend);
			PokeParaPut(&PokeParaMine[SelectNo],ID_exp,
						(u8 *)&PCP->exp);
			buf=PCP->hp_rnd;
			PokeParaPut(&PokeParaMine[SelectNo],ID_hp_rnd,
						(u8 *)&buf);
			buf=PCP->pow_rnd;
			PokeParaPut(&PokeParaMine[SelectNo],ID_pow_rnd,
						(u8 *)&buf);
			buf=PCP->def_rnd;
			PokeParaPut(&PokeParaMine[SelectNo],ID_def_rnd,
						(u8 *)&buf);
			buf=PCP->agi_rnd;
			PokeParaPut(&PokeParaMine[SelectNo],ID_agi_rnd,
						(u8 *)&buf);
			buf=PCP->spepow_rnd;
			PokeParaPut(&PokeParaMine[SelectNo],ID_spepow_rnd,
						(u8 *)&buf);
			buf=PCP->spedef_rnd;
			PokeParaPut(&PokeParaMine[SelectNo],ID_spedef_rnd,
						(u8 *)&buf);
			PokeParaPut(&PokeParaMine[SelectNo],ID_personal_rnd,
						(u8 *)&PCP->personal_rnd);
			PokeParaPut(&PokeParaMine[SelectNo],ID_condition,
						(u8 *)&PCP->condition);
			PokeParaPut(&PokeParaMine[SelectNo],ID_level,
						(u8 *)&PCP->level);
			PokeParaPut(&PokeParaMine[SelectNo],ID_hp,
						(u8 *)&PCP->hp);
			PokeParaPut(&PokeParaMine[SelectNo],ID_hpmax,
						(u8 *)&PCP->hpmax);
			PokeParaPut(&PokeParaMine[SelectNo],ID_pow,
						(u8 *)&PCP->pow);
			PokeParaPut(&PokeParaMine[SelectNo],ID_def,
						(u8 *)&PCP->def);
			PokeParaPut(&PokeParaMine[SelectNo],ID_agi,
						(u8 *)&PCP->agi);
			PokeParaPut(&PokeParaMine[SelectNo],ID_spepow,
						(u8 *)&PCP->spepow);
			PokeParaPut(&PokeParaMine[SelectNo],ID_spedef,
						(u8 *)&PCP->spedef);
			break;
		case BSS_PARA_MONSNO:			//モンスター番号
			PokeParaPut(&PokeParaMine[SelectNo],ID_monsno, 
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_ITEM:				//装備アイテム
			PokeParaPut(&PokeParaMine[SelectNo],ID_item,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_WAZA:
			for(i=0;i<4;i++){
				PokeParaPut(&PokeParaMine[SelectNo],ID_waza1+i,
							(u8 *)&PWP->waza[i]);
				PokeParaPut(&PokeParaMine[SelectNo],ID_pp1+i,
							(u8 *)&PWP->pp[i]);
			}
			PokeParaPut(&PokeParaMine[SelectNo],ID_pp_count,
						(u8 *)&PWP->pp_count);
			break;
		case BSS_PARA_WAZA1:				//技
		case BSS_PARA_WAZA2:
		case BSS_PARA_WAZA3:
		case BSS_PARA_WAZA4:
			PokeParaPut(&PokeParaMine[SelectNo],ID_waza1+ServerBuffer[ClientNo][1]-BSS_PARA_WAZA1,&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_PP:
			PokeParaPut(&PokeParaMine[SelectNo],ID_pp1,
						&ServerBuffer[ClientNo][BSS_DATASTART]);
			PokeParaPut(&PokeParaMine[SelectNo],ID_pp2,
						&ServerBuffer[ClientNo][BSS_DATASTART+1]);
			PokeParaPut(&PokeParaMine[SelectNo],ID_pp3,
						&ServerBuffer[ClientNo][BSS_DATASTART+2]);
			PokeParaPut(&PokeParaMine[SelectNo],ID_pp4,
						&ServerBuffer[ClientNo][BSS_DATASTART+3]);
			PokeParaPut(&PokeParaMine[SelectNo],ID_pp_count,
						&ServerBuffer[ClientNo][BSS_DATASTART+4]);
			break;
		case BSS_PARA_PP1:				//技ポイント
		case BSS_PARA_PP2:
		case BSS_PARA_PP3:
		case BSS_PARA_PP4:
			PokeParaPut(&PokeParaMine[SelectNo],ID_pp1+ServerBuffer[ClientNo][1]-BSS_PARA_PP1,&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_PPCOUNT1:
		case BSS_PARA_PPCOUNT2:
		case BSS_PARA_PPCOUNT3:
		case BSS_PARA_PPCOUNT4:
#if 0
			PokeParaMine[SelectNo].PPP.pp_count1 =
			ServerBuffer[ClientNo][BSS_DATASTART];
			break;
			PokeParaMine[SelectNo].PPP.pp_count2 =
			ServerBuffer[ClientNo][BSS_DATASTART];
			break;
			PokeParaMine[SelectNo].PPP.pp_count3 =
			ServerBuffer[ClientNo][BSS_DATASTART];
			break;
			PokeParaMine[SelectNo].PPP.pp_count4 =
			ServerBuffer[ClientNo][BSS_DATASTART];
#endif
			break;
		case BSS_PARA_ID:				//ＩＤナンバー
			PokeParaPut(&PokeParaMine[SelectNo],ID_id_no,
						&ServerBuffer[ClientNo][BSS_DATASTART]);
			break;
		case BSS_PARA_EXP:				//基本経験値
			PokeParaPut(&PokeParaMine[SelectNo],ID_exp,
						&ServerBuffer[ClientNo][BSS_DATASTART]);
			break;
		case BSS_PARA_HPEXP:			//ＨＰ努力値
			PokeParaPut(&PokeParaMine[SelectNo],ID_hp_exp,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_POWEXP:			//攻撃力努力値
			PokeParaPut(&PokeParaMine[SelectNo],ID_pow_exp,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_DEFEXP:			//防御力努力値
			PokeParaPut(&PokeParaMine[SelectNo],ID_def_exp,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_AGIEXP:			//素早さ努力値
			PokeParaPut(&PokeParaMine[SelectNo],ID_agi_exp,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_SPEPOWEXP:		//特殊攻撃努力値
			PokeParaPut(&PokeParaMine[SelectNo],ID_spepow_exp,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_SPEDEFEXP:		//特殊防御努力値
			PokeParaPut(&PokeParaMine[SelectNo],ID_spedef_exp,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_FRIEND:			//友好値
			PokeParaPut(&PokeParaMine[SelectNo],ID_friend,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_POKERUS:			//ポケルス
			PokeParaPut(&PokeParaMine[SelectNo],ID_pokerus,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_GET_PLACE:		//捕獲場所
			PokeParaPut(&PokeParaMine[SelectNo],ID_get_place,
						&ServerBuffer[ClientNo][BSS_DATASTART]); 
			break;
		case BSS_PARA_GET_LEVEL:		//捕獲レベル
			PokeParaPut(&PokeParaMine[SelectNo],ID_get_level,
						&ServerBuffer[ClientNo][BSS_DATASTART]); 
			break;
		case BSS_PARA_GET_CASSETTE:		//捕獲カセット
			PokeParaPut(&PokeParaMine[SelectNo],ID_get_cassette,
						&ServerBuffer[ClientNo][BSS_DATASTART]); 
			break;
		case BSS_PARA_GET_BALL:			//捕獲ボール
			PokeParaPut(&PokeParaMine[SelectNo],ID_get_ball,
						&ServerBuffer[ClientNo][BSS_DATASTART]); 
			break;
		case BSS_PARA_POWERRND:
			PokeParaPut(&PokeParaMine[SelectNo],ID_hp_rnd,
						&ServerBuffer[ClientNo][BSS_DATASTART]);
			PokeParaPut(&PokeParaMine[SelectNo],ID_pow_rnd,
						&ServerBuffer[ClientNo][BSS_DATASTART+1]);
			PokeParaPut(&PokeParaMine[SelectNo],ID_def_rnd,
						&ServerBuffer[ClientNo][BSS_DATASTART+2]);
			PokeParaPut(&PokeParaMine[SelectNo],ID_agi_rnd,
						&ServerBuffer[ClientNo][BSS_DATASTART+3]);
			PokeParaPut(&PokeParaMine[SelectNo],ID_spepow_rnd,
						&ServerBuffer[ClientNo][BSS_DATASTART+4]);
			PokeParaPut(&PokeParaMine[SelectNo],ID_spedef_rnd,
						&ServerBuffer[ClientNo][BSS_DATASTART+5]);
			break;
		case BSS_PARA_HPRND:			//HPパワー乱数
			PokeParaPut(&PokeParaMine[SelectNo],ID_hp_rnd,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_POWRND:			//攻撃力パワー乱数
			PokeParaPut(&PokeParaMine[SelectNo],ID_pow_rnd,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_DEFRND:			//防御力パワー乱数
			PokeParaPut(&PokeParaMine[SelectNo],ID_def_rnd,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_AGIRND:			//素早さパワー乱数
			PokeParaPut(&PokeParaMine[SelectNo],ID_agi_rnd,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_SPEPOWRND:		//特殊攻撃力パワー乱数
			PokeParaPut(&PokeParaMine[SelectNo],ID_spepow_rnd,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_SPEDEFRND:		//特殊防御力パワー乱数
			PokeParaPut(&PokeParaMine[SelectNo],ID_spedef_rnd,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_CHRRND:			//個性乱数
			PokeParaPut(&PokeParaMine[SelectNo],ID_personal_rnd,
						&ServerBuffer[ClientNo][BSS_DATASTART]);
			break;
		case BSS_PARA_SUM:				//チェックサム
			PokeParaPut(&PokeParaMine[SelectNo],ID_checksum,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_CONDITION:		//コンディション
			PokeParaPut(&PokeParaMine[SelectNo],ID_condition,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_LEVEL:			//レベル
			PokeParaPut(&PokeParaMine[SelectNo],ID_level,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_HP:				//ＨＰ残量
			PokeParaPut(&PokeParaMine[SelectNo],ID_hp,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_HPMAX:			//ＨＰＭＡＸ
			PokeParaPut(&PokeParaMine[SelectNo],ID_hpmax,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_POW:				//攻撃力
			PokeParaPut(&PokeParaMine[SelectNo],ID_pow,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_DEF:				//防御力
			PokeParaPut(&PokeParaMine[SelectNo],ID_def,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_AGI:				//素早さ
			PokeParaPut(&PokeParaMine[SelectNo],ID_agi,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_SPEPOW:			//特殊攻撃力
			PokeParaPut(&PokeParaMine[SelectNo],ID_spepow,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_SPEDEF:			//特殊防御力
			PokeParaPut(&PokeParaMine[SelectNo],ID_spedef,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_STYLE:			//かっこよさ
			PokeParaPut(&PokeParaMine[SelectNo],ID_style,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_BEAUTIFUL:		//美しさ
			PokeParaPut(&PokeParaMine[SelectNo],ID_beautiful,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_CUTE:				//かわいさ
			PokeParaPut(&PokeParaMine[SelectNo],ID_cute,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_CLEVER:			//賢さ
			PokeParaPut(&PokeParaMine[SelectNo],ID_clever,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_STRONG:			//たくましさ
			PokeParaPut(&PokeParaMine[SelectNo],ID_strong,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_FUR:				//毛艶
			PokeParaPut(&PokeParaMine[SelectNo],ID_fur,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_STYLEMEDAL:		//かっこよさ勲章
			PokeParaPut(&PokeParaMine[SelectNo],ID_stylemedal,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_BEAUTIFULMEDAL:	//美しさ勲章
			PokeParaPut(&PokeParaMine[SelectNo],ID_beautifulmedal,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_CUTEMEDAL:		//かわいさ勲章
			PokeParaPut(&PokeParaMine[SelectNo],ID_cutemedal,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_CLEVERMEDAL:		//賢さ勲章
			PokeParaPut(&PokeParaMine[SelectNo],ID_clevermedal,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_STRONGMEDAL:		//たくましさ勲章
			PokeParaPut(&PokeParaMine[SelectNo],ID_strongmedal,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
	}
	PinchSeCheckPlay(&PokeParaMine[SelMonsNo[ClientNo]], ClientNo);
}

//----------------------------------------------------------
//	指定したｱﾄﾞﾚｽのﾎﾟｹﾓﾝﾃﾞｰﾀを変更する
//----------------------------------------------------------
void ClientCLMBSSPokeparaPut2(void)
{
	u8 *pPP;
	u8 i;
	
	pPP = ((u8 *)(&PokeParaMine[SelMonsNo[ClientNo]])) + ServerBuffer[ClientNo][1];
	for(i = 0; i < ServerBuffer[ClientNo][2]; i++)
	{
		pPP[i] = ServerBuffer[ClientNo][3+i];
	}

	ClientCLMBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ登場ｴﾌｪｸﾄを起動する(ｴﾝｶｳﾝﾄ時)
//----------------------------------------------------------

extern const u8 PokeMinePosX[2][2];
extern const u8 PokeMinePosY[2][2];

void ClientCLMBSSPokeEncount(void)
{

	PokemonBObjCellPalSet(&PokeParaMine[SelMonsNo[ClientNo]], ClientNo);
	//PokeActHeaderMake(PokeParaMine[SelMonsNo[ClientNo]].PPP.monsno,ClientNo);
	PokeActHeaderMake(PokeParaGet(&PokeParaMine[SelMonsNo[ClientNo]],
								  ID_monsno),
								  ClientTypeGet(ClientNo));	//変更 by matsuda 2001.09.26(水)
#if 0
	PokemonStruct[ClientNo]=AddActor(&PokeActHeader,
		PokeMinePosX[FightType&FIGHT_TYPE_2vs2][ClientTypeGet(ClientNo)>>1],
//		PokeMinePosY[FightType&FIGHT_TYPE_2vs2][ClientTypeGet(ClientNo)>>1]+4*(8-pm2bpara[PokeParaMine[SelMonsNo[ClientNo]].PPP.monsno].size),
		PokeMinePosY[FightType&FIGHT_TYPE_2vs2][ClientTypeGet(ClientNo)>>1]+pm2bpara[PokeParaMine[SelMonsNo[ClientNo]].PPP.monsno].patcnt,
		CAI_POKE1PRI);
#else
	PokemonStruct[ClientNo]=
		AddActor(&PokeActHeader,
				 GetWazaEffPos(ClientNo,PM_X),
				 GetPokemonYPos(ClientNo),
				 GetPokeSoftPri(ClientNo));
#endif

	ActWork[PokemonStruct[ClientNo]].dx=-ENCOUNT_DX;
	ActWork[PokemonStruct[ClientNo]].work[0]=ClientNo;
	ActWork[PokemonStruct[ClientNo]].oamData.Pltt=ClientNo;
	ActAnmChg(&ActWork[PokemonStruct[ClientNo]],BattlePokeAnmNo[ClientNo]);

	ClientSequence[ClientNo]=ClientCLMPokeEncountWait;
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ登場ｴﾌｪｸﾄを起動する(ﾎﾞｰﾙから飛び出す)
//----------------------------------------------------------
void ClientCLMBSSPokeAppear(void)
{
	// add 2002.07.04(木)
	ClientPokeSysFlagClear(ClientNo, ServerBuffer[ClientNo][2]);
	SelMonsNo[ClientNo] = ServerBuffer[ClientNo][1];
	PokemonBObjCellPalSet(&PokeParaMine[SelMonsNo[ClientNo]], ClientNo);

	CLMAppearCommon(ClientNo, ServerBuffer[ClientNo][2]);

	ClientSequence[ClientNo] = ClientCLMPokeAppearWait;

//	ClientCLMBitReset();
}

//-- PokeAppear、SendOut 共通処理 --//
static void CLMAppearCommon(u8 client_no, u8 baton_flg)
{
	u16 monsno;
	
	ClientPokeSysFlagClear(client_no, baton_flg);

	SelMonsNo[client_no]=ServerBuffer[client_no][1];
	monsno=PokeParaGet(&PokeParaMine[SelMonsNo[client_no]],ID_monsno);
	ClientStruct[client_no] = AddBanishActor(CA_PokeAppearWait);
#if 0	// 2002.07.04(木) SendOutではﾄﾚｰﾅｰがDelする時に、PokeAppearの時はCommonの前にやってしまうように変更した。
	PokemonBObjCellPalSet(&PokeParaMine[SelMonsNo[client_no]], client_no);
#endif
	PokeActHeaderMake(monsno,ClientTypeGet(client_no));

#if 0
	PokemonStruct[client_no] = AddActor(&PokeActHeader,
							PokeMinePosX[FightCheck()][ClientTypeGet(client_no)>>1],
							PokeMinePosY[FightCheck()][ClientTypeGet(client_no)>>1]+
//							4*(8-pm2bpara[PokeParaGet(&PokeParaMine[SelMonsNo[client_no]],ID_monsno)].size),
							pm2bpara[PokeParaGet(&PokeParaMine[SelMonsNo[client_no]],ID_monsno)].patcnt,
							C_POKE1PRI);	//ﾎﾟｹﾓﾝ
#else
	PokemonStruct[client_no]=
		AddActor(&PokeActHeader,
				 GetWazaEffPos(client_no,PM_X),
				 GetPokemonYPos(client_no),
				 GetPokeSoftPri(client_no));
#endif
	ActWork[ClientStruct[client_no]].work[1] = PokemonStruct[client_no];
	ActWork[PokemonStruct[client_no]].work[0] = client_no;
	ActWork[PokemonStruct[client_no]].work[2] = monsno;
	ActWork[PokemonStruct[client_no]].oamData.Pltt = client_no;
	ActAnmChg(&ActWork[PokemonStruct[client_no]],BattlePokeAnmNo[client_no]);
	
#if 0	//changed by matsuda 2002.01.11(金)
	ActWork[ClientStruct[client_no]].work[0] = 
		MBSmokeSet(PokeEnemyPosX[FightCheck()][ClientTypeGet(client_no)>>1], PokeEnemyPosY[FightCheck()][ClientTypeGet(client_no)>>1]+20, 1);
	CAC_PokeAppearDifferentInit(&ActWork[PokemonStruct[client_no]], 1);
#else
	ActWork[PokemonStruct[client_no]].banish = 1;
	ActWork[PokemonStruct[client_no]].move = DummyActMove;
	ActWork[ClientStruct[client_no]].work[0] = MonsterBallSet(0,0xff);
#endif
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝを戻すｴﾌｪｸﾄを起動する
//----------------------------------------------------------
void ClientCLMBSSPokeReturn(void)
{
	if(ServerBuffer[ClientNo][1] == 0)
	{
		CliSys[ClientNo].WazaEffSeqNo = 0;
		ClientSequence[ClientNo] = ClientCLMPokeReturnMigawariChk;
//		SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_POKERETURN_MINE);
//		ClientSequence[ClientNo] = ClientCLMPokeReturnWait;
	}
	else
	{
		AffineDelActor(&ActWork[PokemonStruct[ClientNo]]);
		DelActor(&ActWork[PokemonStruct[ClientNo]]);
		GaugeOFF(ClientGaugeSt[ClientNo]);
		ClientCLMBitReset();
	}
}

enum{
	CLM_RET_MIGAWARICHK,
	CLM_RET_POKERETURN,
};
static void ClientCLMPokeReturnMigawariChk(void)
{
	switch(CliSys[ClientNo].WazaEffSeqNo){
		case CLM_RET_MIGAWARICHK:
			if(Climem[ClientNo].migawari == 1)	//「みがわり」チェック
				SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_MIGAWARI_OUT);
			CliSys[ClientNo].WazaEffSeqNo = CLM_RET_POKERETURN;
			break;
		case CLM_RET_POKERETURN:					//技エフェクトセット
			if(CliSys[ClientNo].etc_eff)
				break;
			CliSys[ClientNo].WazaEffSeqNo = 0;
			SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_POKERETURN_MINE);
			ClientSequence[ClientNo] = ClientCLMPokeReturnWait;
			break;
	}
}

//----------------------------------------------------------
//	ﾄﾚｰﾅｰ登場ｴﾌｪｸﾄを起動する(ｴﾝｶｳﾝﾄ時)
//----------------------------------------------------------
#define TRAINER_IN_DX	(200)		//ｲﾝしてくるときの初期DX ※必ずTRAINER_IN_SPの倍数であること
#define TRAINER_IN_SP	(-4)	//ｲﾝしてくるときのｽﾋﾟｰﾄﾞ

void ClientCLMBSSTrainerEncount(void)
{
	int	no;
	s16	ofsx;
//	if(ServerStatusFlag&SERVER_STATUS_FLAG_WAIT)
//		ServerStatusFlag&=SERVER_STATUS_FLAG_WAIT_OFF;
//	else{
//	TrainerFObjCellPalSet(UserWork[TRAINER_DATA], ClientNo);
	if(FightType&FIGHT_TYPE_4_2vs2){
		if(ClientTypeGet(ClientNo)&2)
			ofsx=16;
		else
			ofsx=-16;
		no=SioTrainerInfo[GetTeamPosID(ClientNo)].sex;
	}
	else{
		ofsx=0;
		no=SioTrainerInfo[GetSioConnectId()^1].sex;
	}

	TrainerBObjCellPalSet(no, ClientNo);

//	PokeActHeaderMake(no+500,ClientTypeGet(ClientNo));
	TrainerActHeaderMake(no,ClientTypeGet(ClientNo));
	PokemonStruct[ClientNo] = AddActor(&PokeActHeader,
							C_TRN_X+ofsx,
							C_TRN_Y+4*(8-trbpara[no].size),
							//C_TRN_PRI);	//ﾄﾚｰﾅｰ
							GetPokeSoftPri(ClientNo));

	ActWork[PokemonStruct[ClientNo]].oamData.Pltt = ClientNo;
	ActWork[PokemonStruct[ClientNo]].dx = ENCOUNT_DX;
	ActWork[PokemonStruct[ClientNo]].work[0] = -ENCOUNT_SPEED;
	ActWork[PokemonStruct[ClientNo]].move = CAS_TrainerSlideIn;

	ClientSequence[ClientNo] = ClientCLMTrainerEncountWait;
//	}
}

//----------------------------------------------------------
//	ﾄﾚｰﾅｰ登場ｴﾌｪｸﾄを起動する(対戦終了後)
//----------------------------------------------------------
void ClientCLMBSSTrainerAppear(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	ﾄﾚｰﾅｰを戻すｴﾌｪｸﾄを起動する
//----------------------------------------------------------

#define	TRAINER_OUT_SP2	4

void ClientCLMBSSTrainerReturn(void)
{
#if 0	//changed by matsuda 2002.01.15(火)
	ActWork[PokemonStruct[ClientNo]].work[0] = TRAINER_OUT_SP2;
	ActWork[PokemonStruct[ClientNo]].move = CAS_TrainerSlideOut;
#else
	DxDyAddClear(&ActWork[PokemonStruct[ClientNo]]);
	ActWork[PokemonStruct[ClientNo]].work[0] = ENEMYTRAINER_RETURN_SYNCNUM;	//VsyncNum
	ActWork[PokemonStruct[ClientNo]].work[2] = -40;
	ActWork[PokemonStruct[ClientNo]].work[4] = ActWork[PokemonStruct[ClientNo]].y;
	ActWork[PokemonStruct[ClientNo]].move = W_StraightSyncMove;
	SetWorkSeq(&ActWork[PokemonStruct[ClientNo]], DummyActMove);
#endif
	ClientSequence[ClientNo] = ClientCLMTrainerReturnWait;
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝが気絶するｴﾌｪｸﾄを起動する
//----------------------------------------------------------
void ClientCLMBSSPokeKizetu(void)
{
#if 0	//2002.09.03(火)
	PinchSeCheckPlay(&PokeParaMine[SelMonsNo[ClientNo]], ClientNo);
	SePlayPan(SE_POKE_DEAD, WAZA_SE_L);
	ActWork[PokemonStruct[ClientNo]].work[1] = 0;
	ActWork[PokemonStruct[ClientNo]].work[2] = C_POKE_KIZETU_SP;
	ActWork[PokemonStruct[ClientNo]].move = SeqMinePokeMove;
	
	ClientSequence[ClientNo]=ClientCLMPokeKizetsuWait;
#else
	switch(CliSys[ClientNo].WazaEffSeqNo){
		case 0:
			if(Climem[ClientNo].migawari == 1)	//「みがわり」チェック
				SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_MIGAWARI_OUT);
			CliSys[ClientNo].WazaEffSeqNo++;
			break;
		case 1:
		default:
			if(CliSys[ClientNo].etc_eff)
				break;
			CliSys[ClientNo].WazaEffSeqNo = 0;

			PinchSeCheckPlay(&PokeParaMine[SelMonsNo[ClientNo]], ClientNo);
			SePlayPan(SE_POKE_DEAD, WAZA_SE_L);
			ActWork[PokemonStruct[ClientNo]].work[1] = 0;
			ActWork[PokemonStruct[ClientNo]].work[2] = C_POKE_KIZETU_SP;
			ActWork[PokemonStruct[ClientNo]].move = SeqMinePokeMove;
			
			ClientSequence[ClientNo]=ClientCLMPokeKizetsuWait;
			break;
	}
#endif
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝが全滅したときのｴﾌｪｸﾄを起動する
//----------------------------------------------------------
void ClientCLMBSSZenmetsu(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ捕獲成功のｴﾌｪｸﾄを出す
//----------------------------------------------------------
void ClientCLMBSSGetSuccess(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ捕獲失敗のｴﾌｪｸﾄを出す
//----------------------------------------------------------
void ClientCLMBSSGetFail(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝﾚﾍﾞﾙｱｯﾌﾟのｴﾌｪｸﾄを出す
//----------------------------------------------------------
void ClientCLMBSSPokeLevelUp(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	指定した技ﾅﾝﾊﾞｰのｴﾌｪｸﾄを出す
//----------------------------------------------------------
#if 0	// 2002.07.22(月)
void ClientCLMBSSWazaEffect(void)
{
	u16	wazano;

	wazano=ServerBuffer[ClientNo][1]|(ServerBuffer[ClientNo][2]<<8);
	WazaCounter = ServerBuffer[ClientNo][3];
	WazaEffPower = ServerBuffer[ClientNo][4] | (ServerBuffer[ClientNo][5]<<8);
	WazaEffDamage = ServerBuffer[ClientNo][6] | (ServerBuffer[ClientNo][7]<<8)
		| (ServerBuffer[ClientNo][8]<<16) | (ServerBuffer[ClientNo][9]<<24);
	WazaEffNatukido = ServerBuffer[ClientNo][10] | (ServerBuffer[ClientNo][11]<<8);
	pwkc = (WazaKoukaCount*)&ServerBuffer[ClientNo][12];

	if(PutWazaEffectCheck(wazano, WazaCounter)){
		ClientCLMBitReset();
		return;
	}

	if(FightCheck() && (AttackClient^2) == DefenceClient && WazaDamage > 0)
		wazano = WAZANO_MAX+1;	//味方への攻撃ならば、簡易的なｴﾌｪｸﾄを出す
	
	WazaEffectSet(wazano);
	ClientSequence[ClientNo] = ClientCLMWazaEffectWait;
}
#else
enum{
	CLM_MIGAWARI_CHK,
	CLM_EFF_PUTCHK,
	CLM_EFF_WAIT,
	CLM_EFF_END,
};
void ClientCLMBSSWazaEffect(void)
{
	u16 wazano;

	if(ClientSEWait(ClientNo))
		return;

	wazano = ServerBuffer[ClientNo][1] | (ServerBuffer[ClientNo][2] << 8);
	WazaCounter = ServerBuffer[ClientNo][3];
	WazaEffPower = ServerBuffer[ClientNo][4] | (ServerBuffer[ClientNo][5]<<8);
	WazaEffDamage = ServerBuffer[ClientNo][6] | (ServerBuffer[ClientNo][7]<<8)
		| (ServerBuffer[ClientNo][8]<<16) | (ServerBuffer[ClientNo][9]<<24);
	WazaEffNatukido = ServerBuffer[ClientNo][10];
	WazaEffWeather = ServerBuffer[ClientNo][12] | (ServerBuffer[ClientNo][13]<<8);
	pwkc = (WazaKoukaCount*)&ServerBuffer[ClientNo][16];
	
	HenshinRnd[ClientNo]=pwkc->henshin_rnd;	//へんしん用の個性乱数

	if(PutWazaEffectCheck(wazano, WazaCounter)){
		ClientCLMBitReset();
		return;
	}
	
	CliSys[ClientNo].WazaEffSeqNo = CLM_MIGAWARI_CHK;
	ClientSequence[ClientNo] = ClientCLMWazaEffectSet;
}

static void ClientCLMWazaEffectSet(void)
{
	u16 wazano;
	u8 renzoku_cnt;
	
	wazano = ServerBuffer[ClientNo][1] | (ServerBuffer[ClientNo][2] << 8);
	renzoku_cnt = ServerBuffer[ClientNo][11];	//0:ﾉｰﾏﾙ 1:連続技終了 2:連続技中
	
	switch(CliSys[ClientNo].WazaEffSeqNo){
		case CLM_MIGAWARI_CHK:	//「みがわり」チェック
			if(Climem[ClientNo].migawari == 1 && Climem[ClientNo].migawari_out == 0){
				Climem[ClientNo].migawari_out = 1;
				SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_MIGAWARI_OUT);
			}
			CliSys[ClientNo].WazaEffSeqNo = CLM_EFF_PUTCHK;
			break;
		case CLM_EFF_PUTCHK:					//技エフェクトセット
			if(CliSys[ClientNo].etc_eff)
				break;
			
//			if(FightCheck() && (AttackClient^2) == DefenceClient && WazaDamage > 0)
//				wazano = WAZANO_MAX+1;	//味方への攻撃ならば、簡易的なｴﾌｪｸﾄを出す

			PokeAffineON_OFF(0);
			WazaEffectSet(wazano);
			CliSys[ClientNo].WazaEffSeqNo = CLM_EFF_WAIT;
			break;
		case CLM_EFF_WAIT:					//技エフェクト終了待ち
			WazaEffectSequence();
			if(WazaEffectFlag==0){
				PokeAffineON_OFF(1);
				if(Climem[ClientNo].migawari && renzoku_cnt <= 1){	//身代わりチェック
					SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_MIGAWARI_IN);
					Climem[ClientNo].migawari_out = 0;
				}
				CliSys[ClientNo].WazaEffSeqNo = CLM_EFF_END;
			}
			break;
		case CLM_EFF_END:
			if(CliSys[ClientNo].etc_eff)
				break;

			//ｴﾌｪｸﾄで操作されたﾊﾞﾆｯｼｭﾌﾗｸﾞを画面切り替え時の為、記憶する
			PokeBanishMemory();
			wazano = ServerBuffer[ClientNo][1] | (ServerBuffer[ClientNo][2] << 8);
			MigawariFlgCheckSet(ClientNo, wazano);
			CliSys[ClientNo].WazaEffSeqNo = 0;
			ClientCLMBitReset();
			break;
	}
}
#endif

//----------------------------------------------------------
//	送ったﾃﾞｰﾀを文字ﾃﾞｰﾀと解釈してﾒｯｾｰｼﾞ表示する
//----------------------------------------------------------
#if 0
void ClientCLMBSSMessage(void)
{
#if 1
	ScrX0=0;
	ScrY0=0;
//	MsgPutSet(&FightMsg,&ServerBuffer[ClientNo][2],0x10,1,15);
//	TalkMsgSet(&FightMsg,&ServerBuffer[ClientNo][2],CGX_START+0x10,2,15);
	FightMsgCreate((u8 *)&ServerBuffer[ClientNo][2]);
	TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
	ClientSequence[ClientNo] = ClientCLMMessageWait;
#else
//かなしばりとか、いちゃもんとかのアラートメッセージを出さないようにする
	ClientCLMBitReset();
#endif
}
#else
void ClientCLMBSSMessage(void)
{
	u16	*MsgID;

	ScrX0=0;
	ScrY0=0;

	MsgID=(u16 *)&ServerBuffer[ClientNo][2];
	FightMsgID(MsgID[0]);
	TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
	ClientSequence[ClientNo] = ClientCLMMessageWait;
}
#endif

//----------------------------------------------------------
//	送ったﾃﾞｰﾀを文字ﾃﾞｰﾀと解釈してﾒｯｾｰｼﾞ表示する
//----------------------------------------------------------

void ClientCLMBSSAlertMessage(void)
{
//	if(MineEnemyCheck(ClientNo)==SIDE_MINE)
//		ClientCLMBSSMessage();
//	else
		ClientCLMBitReset();
}

//----------------------------------------------------------
//	ｺﾏﾝﾄﾞ選択ｳｨﾝﾄﾞｳを表示して、選択ｼｰｹﾝｽを作動させる
//----------------------------------------------------------
void ClientCLMBSSCommandSelect(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	指定されたClientNoのシーケンスナンバーと同期をとる
//----------------------------------------------------------
void ClientCLMBSSCommandSelectCopy(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	技選択ｳｨﾝﾄﾞｳを表示して、選択ｼｰｹﾝｽを作動させる
//----------------------------------------------------------
void ClientCLMBSSWazaSelect(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	ｱｲﾃﾑ選択ｳｨﾝﾄﾞｳを表示して、選択ｼｰｹﾝｽを作動させる
//----------------------------------------------------------
void ClientCLMBSSItemSelect(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ選択ｳｨﾝﾄﾞｳを表示して、選択ｼｰｹﾝｽを作動させる
//----------------------------------------------------------
void ClientCLMBSSPokeSelect(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	逃げるｴﾌｪｸﾄを起動する
//----------------------------------------------------------
void ClientCLMBSSEscape(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	HPｹﾞｰｼﾞを増減する
//----------------------------------------------------------
void	ClientCLMBSSHpGauge(void)
{
	s16 beHP;	//増減する値

	BattleGaugeTransWram(0);
	beHP = ServerBuffer[ClientNo][2] | (ServerBuffer[ClientNo][3] << 8);
	if(beHP!=JIBAKU_HP)
		GaugeDataSet(ClientNo, ClientGaugeSt[ClientNo],
		PokeParaGet(&PokeParaMine[SelMonsNo[ClientNo]],ID_hpmax),
		PokeParaGet(&PokeParaMine[SelMonsNo[ClientNo]],ID_hp), beHP);
	else
		GaugeDataSet(ClientNo, ClientGaugeSt[ClientNo],
		PokeParaGet(&PokeParaMine[SelMonsNo[ClientNo]],ID_hpmax),
		0,beHP);
	ClientSequence[ClientNo] = ClientCLMHpGaugeWait;
}

//----------------------------------------------------------
//	EXPｹﾞｰｼﾞを増減する
//----------------------------------------------------------
void ClientCLMBSSExpGauge(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	指定されたｽﾃｰﾀｽ異常ｴﾌｪｸﾄを起動する
//----------------------------------------------------------
void ClientCLMBSSStatusSet(void)
{
	u32 condition;
	u8 condition_flg;

	if(ClientSEWait(ClientNo))
		return;
	
	GaugeTransChrSet(ClientGaugeSt[ClientNo], &PokeParaMine[SelMonsNo[ClientNo]], G_STATUS);
	condition_flg = ServerBuffer[ClientNo][1];
	condition = ServerBuffer[ClientNo][2] | (ServerBuffer[ClientNo][3]<<8) | 
				(ServerBuffer[ClientNo][4]<<16) | (ServerBuffer[ClientNo][5]<<24);
	
//	ClientStatusEffSet(condition_flg, condition);	2002.09.07(土)
	CliSys[ClientNo].status_eff = 0;

	ClientSequence[ClientNo] = ClientCLMStatusEffWait;
}

void ClientCLMBSSStatusEffect(void)
{
	u32 condition;
	u8 condition_flg;

	if(ClientSEWait(ClientNo))
		return;
	
	condition_flg = ServerBuffer[ClientNo][1];
	condition = ServerBuffer[ClientNo][2] | (ServerBuffer[ClientNo][3]<<8) | 
				(ServerBuffer[ClientNo][4]<<16) | (ServerBuffer[ClientNo][5]<<24);
	ClientStatusEffSet(condition_flg, condition);
	ClientSequence[ClientNo] = ClientCLMStatusEffWait;
}

//----------------------------------------------------------
//	指定されたｽﾃｰﾀｽ異常をｸﾘｱする
//----------------------------------------------------------
void ClientCLMBSSStatusClear(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	あらかじめ用意されたﾊﾞｯﾌｧにﾃﾞｰﾀを格納する
//----------------------------------------------------------
void ClientCLMBSSDataTrans(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	指定ｱﾄﾞﾚｽ(RAM,VRAM,CGRAM)にﾃﾞｰﾀを転送する
//----------------------------------------------------------
void ClientCLMBSSDataRamTrans(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	曲ﾃﾞｰﾀを転送する
//----------------------------------------------------------
void ClientCLMBSSBgmTrans(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	鳴き声ﾃﾞｰﾀを転送する
//----------------------------------------------------------
void ClientCLMBSSVoiceTrans(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	ﾒﾆｭｰで選択した項目IDを返す
//----------------------------------------------------------
void ClientCLMBSSSelectReturn(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ入れ替えを行ったことを知らせる
//----------------------------------------------------------
void ClientCLMBSSReshuffle(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	ｱｲﾃﾑ使用を知らせる
//----------------------------------------------------------
void ClientCLMBSSUseItem(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	ﾎﾞｰﾙ使用を知らせる
//----------------------------------------------------------
void ClientCLMBSSUseBall(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//技エフェクト用のカウンタのクリア
//----------------------------------------------------------
void	ClientCLMBSSLoopCountClear(void)
{
	WEW.loopcnt = 0;
	ClientCLMBitReset();
}

//----------------------------------------------------------
//技エフェクト用のカウンタのセット
//----------------------------------------------------------
void	ClientCLMBSSLoopCountSet(void)
{
	WEW.loopcnt = ServerBuffer[ClientNo][1];
	ClientCLMBitReset();
}

//----------------------------------------------------------
//技エフェクト用のフラグのクリア
//----------------------------------------------------------
void	ClientCLMBSSSwitchFlagClear(void)
{
	WEW.flag = 0;
	ClientCLMBitReset();
}

//----------------------------------------------------------
//技エフェクト用のフラグのセット
//----------------------------------------------------------
void	ClientCLMBSSSwitchFlagSet(void)
{
	WEW.flag ^= 1;
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	ﾀﾞﾒｰｼﾞを受けたときのﾎﾟｹﾓﾝ点滅
//----------------------------------------------------------
void ClientCLMBSSPokeDamageBlink(void)
{
	//ﾎﾟｹﾓﾝがﾊﾞﾆｯｼｭ状態ならをBlinkしない
	if(ActWork[PokemonStruct[ClientNo]].banish == 1){
		ClientCLMBitReset();
		return;
	}

	ClientEffectWait = 1;	//Blinkｴﾌｪｸﾄ開始フラグセット
	ActWork[PokemonStruct[ClientNo]].work[1] = 0;

	//-- ｹﾞｰｼﾞのカラー変更 & 揺らしエフェクトセット --//
	GaugeSwayEffect(ClientNo);

	ClientSequence[ClientNo] = ClientCLMPokeDamageBlinkWait;
}

//----------------------------------------------------------
//	ゲージを消す
//----------------------------------------------------------
void ClientCLMBSSGaugeOff(void)
{
//	GaugeOFF(ClientGaugeSt[ClientNo]);
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	SEを鳴らす
//----------------------------------------------------------
void ClientCLMBSSSEPlay(void)
{
	s8 pan;
	
//	SePlay(ServerBuffer[ClientNo][1]|(ServerBuffer[ClientNo][2]<<8));
	if(MineEnemyCheck(ClientNo) == SIDE_MINE)
		pan = WAZA_SE_L;
	else
		pan = WAZA_SE_R;
	SePlayPan(ServerBuffer[ClientNo][1]|(ServerBuffer[ClientNo][2]<<8), pan);
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	MEを鳴らす
//----------------------------------------------------------
void ClientCLMBSSMEPlay(void)
{
	JinglePlay(ServerBuffer[ClientNo][1]|(ServerBuffer[ClientNo][2]<<8));
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	なきごえを鳴らす
//----------------------------------------------------------
void ClientCLMBSSVoicePlay(void)
{
//	VoicePlay(PokeParaGet(&PokeParaMine[SelMonsNo[ClientNo]],ID_monsno),25);
	//気絶時の声で鳴くように変更 2002.08.27(火) by matsuda
	VoicePlay3(PokeParaGet(&PokeParaMine[SelMonsNo[ClientNo]],ID_monsno),-25,5);
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	エンカウントエフェクトをセット
//----------------------------------------------------------
void ClientCLMBSSEncountEffect(void)
{
	EncountEffectSet(ServerBuffer[ClientNo][1]);
	//OBJ横移動のストッパー
	EncountEffectFlag|=ENCOUNT_EFFECT_FLAG_OBJSTOP;	
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	最初のポケモン登場(ﾄﾚｰﾅｰ引っ込む、ﾎﾟｹﾓﾝ出す、ﾒｯｾｰｼﾞ出す。までの一連の動作
//----------------------------------------------------------
void ClientCLMBSSPokeSendOut(void)
{
	u8 palno, id;
	
	DxDyAddClear(&ActWork[PokemonStruct[ClientNo]]);
	ActWork[PokemonStruct[ClientNo]].work[0] = TRAINER_RETURN_SYNCNUM;	//VsyncNum
	ActWork[PokemonStruct[ClientNo]].work[2] = -40;
	ActWork[PokemonStruct[ClientNo]].work[4] = ActWork[PokemonStruct[ClientNo]].y;
	ActWork[PokemonStruct[ClientNo]].move = W_StraightSyncMove;
	ActWork[PokemonStruct[ClientNo]].work[5] = ClientNo;
	SetWorkSeq(&ActWork[PokemonStruct[ClientNo]], TrainerDelEnd);

	ActAnmChg(&ActWork[PokemonStruct[ClientNo]],1);

	//SendOutの時だけﾎﾟｹﾓﾝのﾊﾟﾚｯﾄとかぶらないようにPalSetを使用する
	palno = ObjPalNumSet(MINE_TRAINER_PALID2);
	DecordPaletteWork(
		(void*)TRBObjDataPal[SioTrainerInfo[GetTeamPosID(ClientNo)].sex].pal_data,
		PA_OBJ0 + 0x10 * palno, 0x20);
	ActWork[PokemonStruct[ClientNo]].oamData.Pltt = palno;

	//-- ﾎﾟｹﾓﾝ --//
	id = AddTask(SendOutTask, 5);
	TaskTable[id].work[0] = ClientNo;

	//-- 手持ちｹﾞｰｼﾞを消す --//
	if(CliSys[ClientNo].temoti_gauge_flg)
		TaskTable[TemotiGauge[ClientNo]].TaskAdrs = TemotiBallOff;

	BtlWork->sendout_eff = 1;
	ClientSequence[ClientNo] = ClientCLMDummy;
}

static void SendOutTask(u8 id)
{
	u8 clientno_temp;
	
	if(TaskTable[id].work[1] < 24){
		TaskTable[id].work[1]++;
		return;
	}
	
	clientno_temp = ClientNo;
	ClientNo = TaskTable[id].work[0];
	if(FightCheck() == 0)
	{	//1vs1
		ServerBuffer[ClientNo][1] = SelMonsNo[ClientNo];
		CLMAppearCommon(ClientNo,0);	//ClientCLMBSSPokeAppear();
	}
	else if(FightType&FIGHT_TYPE_4_2vs2)
	{	//2vs2 4人通信
		ServerBuffer[ClientNo][1] = SelMonsNo[ClientNo];
		CLMAppearCommon(ClientNo, 0);
	}
	else
	{	//2vs2
		ServerBuffer[ClientNo][1] = SelMonsNo[ClientNo];
		CLMAppearCommon(ClientNo,0);	//ClientCLMBSSPokeAppear();
		
		ClientNo ^= 2;
		ServerBuffer[ClientNo][1] = SelMonsNo[ClientNo];
		
		// add 2002.07.04(木)
		PokemonBObjCellPalSet(&PokeParaMine[SelMonsNo[ClientNo]], ClientNo);

		CLMAppearCommon(ClientNo,0);	//ClientCLMBSSPokeAppear();
		/*
		if(FightType & FIGHT_TYPE_TUUSHIN)
			ClientSequence[ClientNo] = ClientCommandWait;
		else
			ClientSequence[ClientNo] = ClientCLMCommandWait;
		*/
		ClientNo ^= 2;	//変更したClientNoを元に戻す
	}
	ClientSequence[ClientNo] = ClientCLMPokeSendOutWait;
	ClientNo = clientno_temp;
	DelTask(id);
}

//----------------------------------------------------------
//	トレーナー戦時のボールゲージを表示する
//----------------------------------------------------------

void	ClientCLMBSSBallGaugeSet(void)
{
	BallGaugePara *bgp;
	
//フラグワークがtrueの時は、どっちサイドなのかチェックして、自分側のときは表示をしないようにする
	if(ServerBuffer[ClientNo][1]){
		if(MineEnemyCheck(ClientNo)==SIDE_MINE){
			ClientCLMBitReset();
			return;
		}
	}
	CliSys[ClientNo].temoti_gauge_flg = 1;
	bgp = (BallGaugePara*)&ServerBuffer[ClientNo][4];
	TemotiGauge[ClientNo] = TemotiBallPut(ClientNo, bgp, ServerBuffer[ClientNo][1], ServerBuffer[ClientNo][2]);
	CliSys[ClientNo].wait_work = 0;
	if(ServerBuffer[ClientNo][2]){	//ﾌﾗｸﾞが立っていたらｳｪｲﾄなし
		CliSys[ClientNo].wait_work = TEMOTI_BALL_WAIT+1;
	}
	ClientSequence[ClientNo] = ClientCLMBallGaugeWait;
//	ClientCLMBitReset();
}

static void ClientCLMBallGaugeWait(void)
{
	if(CliSys[ClientNo].wait_work++ > TEMOTI_BALL_WAIT){
		CliSys[ClientNo].wait_work = 0;
		ClientCLMBitReset();
	}
}

//----------------------------------------------------------
//	トレーナー戦時のボールゲージを非表示にする
//----------------------------------------------------------

void	ClientCLMBSSBallGaugeOff(void)
{
	//-- 手持ちｹﾞｰｼﾞを消す --//
	if(CliSys[ClientNo].temoti_gauge_flg)
		TaskTable[TemotiGauge[ClientNo]].TaskAdrs = TemotiBallOff;
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	ゲージのゆれを止める
//----------------------------------------------------------

void ClientCLMBSSGaugeYureStop(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	ポケモンのVANISHをON/OFFする
//----------------------------------------------------------

void	ClientCLMBSSVanishOnOff(void)
{
	if(ClientPokeExistCheck(ClientNo)){
		ActWork[PokemonStruct[ClientNo]].banish = ServerBuffer[ClientNo][1];
		PokeClientBanishMemory(ClientNo);
	}
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	戦闘エフェクトを出す
//----------------------------------------------------------

void	ClientCLMBSSFightEffect(void)
{
	u8 eff_no;
	u16 monsno;
	
	if(ClientSEWait(ClientNo))
		return;
	
	eff_no = ServerBuffer[ClientNo][1];
	monsno = ServerBuffer[ClientNo][2] | (ServerBuffer[ClientNo][3]<<8);
	
	if(SetFightEffect(ClientNo, ClientNo, ClientNo, eff_no, monsno))
		ClientCLMBitReset();
	else
		ClientSequence[ClientNo] = ClientCLMFightEffWait;
}

//----------------------------------------------------------
//	通信待機画面を出す
//----------------------------------------------------------

void	ClientCLMBSSTuushinWait(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	記憶しているカーソル位置のクリア
//----------------------------------------------------------

void	ClientCLMBSSCsrPosClear(void)
{
	ClientCLMBitReset();
}

//----------------------------------------------------------
//	対戦終了を知らせる
//----------------------------------------------------------
void ClientCLMBSSFightEnd(void)
{
#if 0
	WinLoseFlag=ServerBuffer[ClientNo][1];
	BGM_FadeOutSet(5);
	LightFadeReq(N_to_B);
	ClientCLMBitReset();
	if((FightType&FIGHT_TYPE_TUUSHIN)&&((FightType&FIGHT_TYPE_OYA)==0))
		ClientSequence[ClientNo] = ClientFightEndWait;
#else
	WinLoseFlag=ServerBuffer[ClientNo][1];
	BGM_FadeOutSet(5);
	LightFadeReq(N_to_B);
	ClientCLMBitReset();
	ClientSequence[ClientNo] = ClientFightEndWait;
#endif
}

//----------------------------------------------------------
//	ﾀﾞﾐｰ
//----------------------------------------------------------
void ClientCLMBSSEndID(void)
{
//	ClientCLMBitReset();
}

