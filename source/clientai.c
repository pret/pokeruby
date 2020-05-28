
//======================================================
//    clientai.c                                           
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
#include "field.h"
#include "ev_fight.h"
#include "waza_tbl.h"
#include "trainer.h"
#include "pm_aff.h"
#include "cli_num.h"

#include "multisio.h"		//add
#include "pokesio.h"
#include "cable.h"

#include "fight_ef.h"

#include "waza_ai.h"
#include "waza_ai.def"
#include "mus_tool.h"
#include "fld_main.h"
#include "task.h"
#include "fightmsg.h"
#include "trfenum.h"
#include "wazano.def"
#include "b_tower.h"
#include "waza_dat.h"
#include "a_fight.h"
#include "monsno.def"
#include "tokusyu.def"

#include "item.h"

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

void	ClientAIBitReset(void);	//範囲外の値の時の処理
void	ClientAIDummy(void);
void	ClientAIInit(void);
void	ClientAICommandWait(void);
void	ClientAIPokeEncountWait(void);
void	ClientAIPokeAppearWait(void);

void	ClientAICommandSelect(void);
void	ClientAIWazaSelect(void);
void	ClientAIHpGaugeWait(void);
void	ClientAIPokeKizetsuWait(void);
void	ClientAIMessageWait(void);

void	ClientAICommandSelectAI(void);
u8		ClientAIPokeReshuffleAI(void);
u8		ClientAIPokeSelectAI(void);
u8		ClientAIItemUseAI(void);

u8		ClientAIHorobinoutaCheck(void);
u8		ClientAIHusiginamamoriCheck(void);
u8		ClientAIHPRecoverTokusyuCheck(void);
u8		ClientAIShizenkaifukuCheck(void);
u8		ClientAIBatsugunCheck(u8);
u8		ClientAIStatusUpCheck(void);
u8		ClientAIWazaKoukaCheck(u8,u8);
u8		ClientAIWazaKoukaCheck(u8,u8);

void ClientAIBSSPokeparaGet(void);
void ClientAIBSSPokeparaGet2(void);
void ClientAIBSSPokeparaPut(void);
void ClientAIBSSPokeparaPut2(void);
void ClientAIBSSPokeEncount(void);
void ClientAIBSSPokeAppear(void);
void ClientAIBSSPokeReturn(void);
void ClientAIBSSTrainerEncount(void);
void ClientAIBSSTrainerAppear(void);
void ClientAIBSSTrainerReturn(void);
void ClientAIBSSPokeKizetu(void);
void ClientAIBSSZenmetsu(void);
void ClientAIBSSGetSuccess(void);
void ClientAIBSSGetFail(void);
void ClientAIBSSPokeLevelUp(void);
void ClientAIBSSWazaEffect(void);
void ClientAIBSSMessage(void);
void ClientAIBSSAlertMessage(void);
void ClientAIBSSCommandSelect(void);
void ClientAIBSSCommandSelectCopy(void);
void ClientAIBSSWazaSelect(void);
void ClientAIBSSItemSelect(void);
void ClientAIBSSPokeSelect(void);
void ClientAIBSSEscape(void);
void ClientAIBSSHpGauge(void);
void ClientAIBSSExpGauge(void);
void ClientAIBSSStatusSet(void);
void ClientAIBSSStatusEffect(void);
void ClientAIBSSStatusClear(void);
void ClientAIBSSDataTrans(void);
void ClientAIBSSDataRamTrans(void);
void ClientAIBSSBgmTrans(void);
void ClientAIBSSVoiceTrans(void);
void ClientAIBSSSelectReturn(void);
void ClientAIBSSReshuffle(void);
void ClientAIBSSUseItem(void);
void ClientAIBSSUseBall(void);
void ClientAIBSSLoopCountClear(void);
void ClientAIBSSLoopCountSet(void);
void ClientAIBSSSwitchFlagClear(void);
void ClientAIBSSSwitchFlagSet(void);
void ClientAIBSSPokeDamageBlink(void);
void ClientAIBSSGaugeOff(void);
void ClientAIBSSSEPlay(void);
void ClientAIBSSMEPlay(void);
void ClientAIBSSVoicePlay(void);
void ClientAIBSSEncountEffect(void);
void ClientAIBSSPokeSendOut(void);
void ClientAIBSSBallGaugeSet(void);
void ClientAIBSSBallGaugeOff(void);
void ClientAIBSSGaugeYureStop(void);
void ClientAIBSSVanishOnOff(void);
void ClientAIBSSFightEffect(void);
void ClientAIBSSFightEnd(void);
void ClientAIBSSTuushinWait(void);
void ClientAIBSSCsrPosClear(void);
void ClientAIBSSEndID(void);

int	ClientAIBSSPokeparaGetAct(u8,u8 *);
void ClientAIBSSPokeparaPutAct(u8);
static void AIPokeAppearCommon(u8 client_no, u8);
static void AISendOutTask(u8 id);
static void AITrainerDelEnd(actWork *xreg);
static void ClientAIWazaEffectSet(void);
static void ClientAIAppearMigawariEffWait(void);
static void ClientAIBallGaugeWait(void);
static void ClientAIPokeReturnMigawariChk(void);

extern	actHeader PokeFTbl[];
extern	TALK_WIN	FightMsg;
extern	const	u8	TypeCheckTable[];
//extern	u8	FightMsgBuf[64];


//----------------------------------------------------------
//	バトルサーバー命令群テーブル
//----------------------------------------------------------
const pFunc ClientAIBSSTbl[] =
{
	ClientAIBSSPokeparaGet,		// BSS_POKEPARA_GET=0,	
	ClientAIBSSPokeparaGet2,	   	// BSS_POKEPARA_GET2,	
	ClientAIBSSPokeparaPut,		// BSS_POKEPARA_PUT,	
	ClientAIBSSPokeparaPut2,		// BSS_POKEPARA_PUT2,	
	ClientAIBSSPokeEncount,		// BSS_POKEPARA_ENCOUNT,	add
	ClientAIBSSPokeAppear,		// BSS_POKE_APPEAR,	
	ClientAIBSSPokeReturn,		// BSS_POKE_RETURN,	
	ClientAIBSSTrainerEncount,	// BSS_TRAINER_ENCOUNT,	add
	ClientAIBSSTrainerAppear,		// BSS_TRAINER_APPEAR,	
	ClientAIBSSTrainerReturn,		// BSS_TRAINER_RETURN,	
	ClientAIBSSPokeKizetu,		// BSS_POKE_KIZETSU,	
	ClientAIBSSZenmetsu,			// BSS_POKE_ZENMETSU,	
	ClientAIBSSGetSuccess,		// BSS_GET_SUCCESS,	
	ClientAIBSSGetFail,			// BSS_GET_FAIL,		
	ClientAIBSSPokeLevelUp,		// BSS_POKE_LEVELUP,	
	ClientAIBSSWazaEffect,		// BSS_WAZA_EFFECT,	
	ClientAIBSSMessage,			// BSS_MESSAGE,		
	ClientAIBSSAlertMessage,	// BSS_ALERT_MESSAGE,		
								
	ClientAIBSSCommandSelect,		// BSS_COMMAND_SELECT, 

	ClientAIBSSCommandSelectCopy,		// BSS_COMMAND_SELECT_COPY, 

	ClientAIBSSWazaSelect,		// BSS_WAZA_SELECT,	
													
	ClientAIBSSItemSelect,		// BSS_ITEM_SELECT,	
													
	ClientAIBSSPokeSelect,		// BSS_POKE_SELECT,	
													
	ClientAIBSSEscape,			// BSS_ESCAPE,			
	ClientAIBSSHpGauge,			// BSS_HP_GAUGE,		
	ClientAIBSSExpGauge,			// BSS_EXP_GAUGE,		
	ClientAIBSSStatusSet,			// BSS_STATUS_SET,		
	ClientAIBSSStatusEffect,		// BSS_STATUS_EFFECT,		
	ClientAIBSSStatusClear,		// BSS_STATUS_CLEAR,	
	ClientAIBSSDataTrans,			// BSS_DATA_TRANS,		
	ClientAIBSSDataRamTrans,		// BSS_DATA_RAM_TRANS,	
													
	ClientAIBSSBgmTrans,			// BSS_BGM_TRANS,		
	ClientAIBSSVoiceTrans,		// BSS_VOICE_TRANS,	
	ClientAIBSSSelectReturn,		// BSS_SELECT_RETURN,	
	ClientAIBSSReshuffle,			// BSS_POKE_RESHUFFLE,	
	ClientAIBSSUseItem,			// BSS_USE_ITEM,		
	ClientAIBSSUseBall,			// BSS_USE_BALL,		
	ClientAIBSSLoopCountClear,	//	BSS_LOOPCOUNT_CLEAR
	ClientAIBSSLoopCountSet,	//	BSS_LOOPCOUNT_SET
	ClientAIBSSSwitchFlagClear,	//	BSS_SWITCHFLAG_CLEAR
	ClientAIBSSSwitchFlagSet,	//	BSS_SWITCHFLAG_SET
	ClientAIBSSPokeDamageBlink,	// BSS_POKEDAMAGE_BLINK,
	ClientAIBSSGaugeOff,		// BSS_GAUGE_OFF,
	ClientAIBSSSEPlay,			// BSS_SE_PLAY,
	ClientAIBSSMEPlay,			// BSS_SE_PLAY,
	ClientAIBSSVoicePlay,			// BSS_VOICE_PLAY,
	ClientAIBSSEncountEffect,	// BSS_ENCOUNT_EFFECT,
	ClientAIBSSPokeSendOut,		// BSS_POKE_SENDOUT,
	ClientAIBSSBallGaugeSet,	// BSS_BALL_GAUGE_SET,
	ClientAIBSSBallGaugeOff,	// BSS_BALL_GAUGE_OFF,
	ClientAIBSSGaugeYureStop,	// BSS_BALL_GAUGE_OFF,
	ClientAIBSSVanishOnOff,		// BSS_VANISH_OFF,
	ClientAIBSSFightEffect,		// BSS_FIGHT_EFFECT,
	ClientAIBSSTuushinWait,		// BSS_TUUSHIN_WAIT,
	ClientAIBSSCsrPosClear,		// BSS_CSRPOS_CLEAR,
	ClientAIBSSFightEnd,		// BSS_FIGHT_END,

	ClientAIBSSEndID,				// BSS_END_ID,		いらないけど一応
};

//----------------------------------------------------------
//	プロトタイプ宣言	関数＆ﾃﾞｰﾀ
//----------------------------------------------------------

#define	CAI_LVNUM_X			84
#define	CAI_LVNUM_Y			28

//==============================================================
//                       メインルーチン
//==============================================================

void	ClientAIDummy(void)
{
}

void	ClientAIInit(void)
{
	ClientSequence[ClientNo]=ClientAICommandWait;
	#if 0
	//ｹﾞｰｼﾞｷｬﾗ ﾃｽﾄなのでとりあえず、実際は常駐なのでここではやんない　※
	
	ClientGaugeSt[ClientNo] = GaugeActorSet(ClientNo);	//ｹﾞｰｼﾞｱｸﾀｰ登録 これもとりあえずここで
	GaugeDefaultPosSet(ClientNo);
	GaugeTransChrSet(ClientGaugeSt[ClientNo],
				&PokeParaEnemy[SelMonsNo[ClientNo]], G_ALL);
	GaugeOFF(ClientGaugeSt[ClientNo]);
	if(ClientNo == BSS_CLIENT_ENEMY)
		GaugePriSet(ClientGaugeSt[ClientNo], 0);
	else
		GaugePriSet(ClientGaugeSt[ClientNo], 1);
	#endif
}

void	ClientAICommandWait(void)
{
	if((ClientBit&no2bittbl[ClientNo]) != 0)
	{
		if(ServerBuffer[ClientNo][0] <= BSS_END_ID)// && ServerBuffer[ClientNo][0] > -1)
		{
			ClientAIBSSTbl[ServerBuffer[ClientNo][0]]();
		}
		else
		{
			ClientAIBitReset();	//範囲外の値の時の処理
		}
	}
}

//=========================================================================
//	ウェイトルーチン
//=========================================================================
//
void ClientAITrainerEncountWait(void)
{
	if(ActWork[PokemonStruct[ClientNo]].move == DummyActMove)
	{
		//DelActor(&ActWork[PokemonStruct[ClientNo]]);
		ClientAIBitReset();
	}
}

void ClientAITrainerAppearWait(void)
{
	if(ActWork[PokemonStruct[ClientNo]].move == DummyActMove)
	{
		//DelActor(&ActWork[PokemonStruct[ClientNo]]);
		ClientAIBitReset();
	}
}

void ClientAITrainerReturnWait(void)
{
#if 0	//chaged by matsuda 2002.01.15(火)
	if(ActWork[PokemonStruct[ClientNo]].dx > 64)
#else
	if(ActWork[PokemonStruct[ClientNo]].move == DummyActMove)
#endif
	{
		TrainerFObjCellPalDel(ActWork[PokemonStruct[ClientNo]].oamData.AffineParam);
		ActWork[PokemonStruct[ClientNo]].oamData.CharNo //DelActorする時に転送で
			= ActWork[PokemonStruct[ClientNo]].work[5];//取っていた領域が開放されるようにCharNoを元に戻す
		AffineDelActor(&ActWork[PokemonStruct[ClientNo]]);	//一応(呼んでも問題はないし)
		DelActor(&ActWork[PokemonStruct[ClientNo]]);
		
		ClientAIBitReset();
	}
}

void ClientAISendOutWaitBitReset(void)
{
	if(CliSys[ClientNo].send_out_wait-- == 0){
		CliSys[ClientNo].send_out_wait = 0;
		ClientAIBitReset();
	}
}

void ClientAISendOutGaugeWait(void)
{
#if 0	//2002.05.02(木)
	if(ActWork[ClientGaugeSt[ClientNo]].move == DummyActMove
		&& ActWork[ClientGaugeSt[ClientNo^2]].move == DummyActMove)
	{
		ClientAIBitReset();
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
	
	if(end && CliSys[ClientNo].rare_eff_end && CliSys[ClientNo^2].rare_eff_end){
		CliSys[ClientNo].rare_eff = 0;
		CliSys[ClientNo].rare_eff_end = 0;
		CliSys[ClientNo^2].rare_eff = 0;
		CliSys[ClientNo^2].rare_eff_end = 0;
		CellDel(WAZACHR_ID_SHOOTINGSTAR);
		ObjPalRegNumDel(WAZACHR_ID_SHOOTINGSTAR);
		
//		AddTask(VoiceCheckTask, 10);
		if(FightType&FIGHT_TYPE_4_2vs2)
			m4aMPlayContinue(&m4a_mplay000);
		else
			m4aMPlayVolumeControl(&m4a_mplay000,0xffff,256);
//		ClientAIBitReset();
		CliSys[ClientNo].send_out_wait = 3;
		ClientSequence[ClientNo] = ClientAISendOutWaitBitReset;
	}
#endif
}

void ClientAIPokeSendOutWait(void)
{
//	if(ActWork[ClientStruct[ClientNo]].move == DummyActMove)	//2個同時に投げてるので1個だけﾁｪｯｸしておけば問題ないかと
//	if(CliSys[ClientNo].ball_eff_wait == 0 && VoiceEndCheck() == 0)

	if(CliSys[ClientNo].ball_eff_wait == 0 && CliSys[ClientNo].rare_eff == 0)
		RareEffectCheckSet(ClientNo, &PokeParaEnemy[SelMonsNo[ClientNo]]);
	if(CliSys[ClientNo^2].ball_eff_wait == 0 && CliSys[ClientNo^2].rare_eff == 0)
		RareEffectCheckSet(ClientNo^2, &PokeParaEnemy[SelMonsNo[ClientNo^2]]);

	if(CliSys[ClientNo].ball_eff_wait == 0 && CliSys[ClientNo^2].ball_eff_wait == 0)
	{
		if(FightCheck() && 	(FightType & FIGHT_TYPE_4_2vs2) == 0)
		{
			DelActor(&ActWork[ClientStruct[ClientNo^2]]);		//ｴﾌｪｸﾄ監視ｱｸﾀｰDEL
			GaugeTransChrSet(ClientGaugeSt[ClientNo^2],
				&PokeParaEnemy[SelMonsNo[ClientNo^2]], G_ALL);
			GaugeAppearEffect(ClientNo^2);
			GaugeON(ClientGaugeSt[ClientNo^2]);
			
			//ﾄﾚｰﾅｰは自動でDelされるので
//			AffineDelActor(&ActWork[PokemonStruct[ClientNo^2]]);//一応(呼んでも問題はないし)
//			DelActor(&ActWork[PokemonStruct[ClientNo^2]]);

			//影をｾｯﾄ
			PokeShadowSeqSet(ClientNo^2, 
				PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo^2]], ID_monsno));
		}
		
		DelActor(&ActWork[ClientStruct[ClientNo]]);			//ｴﾌｪｸﾄ監視ｱｸﾀｰDEL
		GaugeTransChrSet(ClientGaugeSt[ClientNo],
				&PokeParaEnemy[SelMonsNo[ClientNo]], G_ALL);
		GaugeAppearEffect(ClientNo);
		GaugeON(ClientGaugeSt[ClientNo]);

		//ﾄﾚｰﾅｰは自動でDelされるので
//		AffineDelActor(&ActWork[PokemonStruct[ClientNo^2]]);//一応(呼んでも問題はないし)
//		DelActor(&ActWork[PokemonStruct[ClientNo^2]]);

		//影をｾｯﾄ
		PokeShadowSeqSet(ClientNo, 
			PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]], ID_monsno));
		
//		ClientAIBitReset();
		BtlWork->sendout_eff = 0;
		ClientSequence[ClientNo] = ClientAISendOutGaugeWait;
	}
}

void	ClientAIPokeEncountWait(void)
{
#if 0	// 2002.07.25(木)
	if((ActWork[PokemonStruct[ClientNo]].anmend_sw==1)&&
	(ActWork[PokemonStruct[ClientNo]].dx==0)){
//		ClientBit&=(no2bittbl[ClientNo]^0xffffffff);
//		ClientSequence[ClientNo]=ClientAICommandWait;
		ClientAIBitReset();
	}
#else
	if((ActWork[PokemonStruct[ClientNo]].anmend_sw==1)&&
	(ActWork[PokemonStruct[ClientNo]].dx==0)){
		if(CliSys[ClientNo].rare_eff == 0)
			RareEffectCheckSet(ClientNo, &PokeParaEnemy[SelMonsNo[ClientNo]]);
		else if(CliSys[ClientNo].rare_eff_end){
			CliSys[ClientNo].rare_eff = 0;
			CliSys[ClientNo].rare_eff_end = 0;
			CellDel(WAZACHR_ID_SHOOTINGSTAR);
			ObjPalRegNumDel(WAZACHR_ID_SHOOTINGSTAR);
			
			//DelActor(&ActWork[PokemonStruct[ClientNo]]);
			ClientAIBitReset();
		}
	}
#endif
}


void	ClientAIHpGaugeWait(void)
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
		ClientAIBitReset();
	}
}


void	ClientAIPokeKizetsuWait(void)
{
	if(ActWork[PokemonStruct[ClientNo]].act_sw==0){
//		ClientBit&=(no2bittbl[ClientNo]^0xffffffff);
//		ClientSequence[ClientNo]=ClientAICommandWait;
		GaugeOFF(ClientGaugeSt[ClientNo]);
		ClientAIBitReset();
	}
}

void ClientAIPokeReturnWait(void)
{
	if(CliSys[ClientNo].etc_eff == 0)
	{
		AffineDelActor(&ActWork[PokemonStruct[ClientNo]]);
		DelActor(&ActWork[PokemonStruct[ClientNo]]);
		
		PokeShadowBanishSeqSet(ClientNo);
		
		GaugeOFF(ClientGaugeSt[ClientNo]);
		ClientAIBitReset();
	}
}

void	ClientAIMessageWait(void)
{
	if(FightMsg.status==MSG_END){
//		ClientBit&=(no2bittbl[ClientNo]^0xffffffff);
//		ClientSequence[ClientNo]=ClientAICommandWait;
		ClientAIBitReset();
	}
}

#if 0	// 2002.07.22(月)	by matsuda
void	ClientAIWazaEffectWait(void)
{
	WazaEffectSequence();
	if(WazaEffectFlag==0){
		ClientAIBitReset();
	}
}
#endif

void ClientAIPokeDamageBlinkWait(void)
{
	u8 pokeact;
	
	pokeact = PokemonStruct[ClientNo];
	if(ActWork[pokeact].work[1] == DAMAGE_BLINK_WAIT)
	{
		ActWork[pokeact].work[1] = 0;
		ActWork[pokeact].banish = 0;
		ClientEffectWait = 0;	//Blinkｴﾌｪｸﾄ、フラグをﾘｾｯﾄ
		ClientAIBitReset();
	}
	else
	{
		if(ActWork[pokeact].work[1] % BLINK_INTERVAL == 0)
			ActWork[pokeact].banish ^= 1;
		ActWork[pokeact].work[1]++;
	}
}

void ClientAIGaugeAppearWait(void)
{
	if(ActWork[ClientGaugeSt[ClientNo]].move == DummyActMove){
		//身代わりチェック
		if(Climem[ClientNo].migawari)
			SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_MIGAWARI_IN);
		ClientSequence[ClientNo] = ClientAIAppearMigawariEffWait;
	}
}

static void ClientAIAppearMigawariEffWait(void)
{
	if(CliSys[ClientNo].etc_eff == 0){
		AddTask(VoiceCheckTask, 10);
		ClientAIBitReset();
	}
}

void ClientAIPokeAppearWaitSub(void)
{
//	if(ActWork[PokemonStruct[ClientNo]].anmend_sw == 1)		ｱﾆﾒ止める 2002.02.28(木)
	if(CliSys[ClientNo].rare_eff_end)
	{
		CliSys[ClientNo].rare_eff = 0;
		CliSys[ClientNo].rare_eff_end = 0;
		CellDel(WAZACHR_ID_SHOOTINGSTAR);
		ObjPalRegNumDel(WAZACHR_ID_SHOOTINGSTAR);

		ActAnmChg(&ActWork[PokemonStruct[ClientNo]], 0);
		GaugeTransChrSet(ClientGaugeSt[ClientNo],
				&PokeParaEnemy[SelMonsNo[ClientNo]], G_ALL);
		GaugeAppearEffect(ClientNo);
		GaugeON(ClientGaugeSt[ClientNo]);
		PokeClientBanishMemory(ClientNo);
		//ClientAIBitReset();
		ClientSequence[ClientNo] = ClientAIGaugeAppearWait;
	}
}
void ClientAIPokeAppearWait(void)
{
	if(CliSys[ClientNo].ball_eff_wait == 0 && CliSys[ClientNo].rare_eff == 0)
		RareEffectCheckSet(ClientNo, &PokeParaEnemy[SelMonsNo[ClientNo]]);

	if(ActWork[ClientStruct[ClientNo]].move == DummyActMove && CliSys[ClientNo].ball_eff_wait == 0)
	{
		DelActor(&ActWork[ClientStruct[ClientNo]]);					//ｴﾌｪｸﾄ監視ｱｸﾀｰDEL
//		ActAnmChg(&ActWork[PokemonStruct[ClientNo]], 1);	ｱﾆﾒ止める 2002.02.28(木)
//		VoicePlay(PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]],ID_monsno),25);
		
		//影をｾｯﾄ
		PokeShadowSeqSet(ClientNo, PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]], ID_monsno));
		
		ClientSequence[ClientNo] = ClientAIPokeAppearWaitSub;
	}
}

//----------------------------------------------------------
//	ｽﾃｰﾀｽ異常ｴﾌｪｸﾄ終了待ち
//----------------------------------------------------------
void ClientAIStatusEffWait(void)
{
	if(CliSys[ClientNo].status_eff == 0)
		ClientAIBitReset();
}

//----------------------------------------------------------
//	戦闘ｴﾌｪｸﾄ終了待ち
//----------------------------------------------------------
void ClientAIFightEffWait(void)
{
	if(CliSys[ClientNo].fight_eff == 0)
		ClientAIBitReset();
}


//==============================================================
//                       サブルーチン
//==============================================================

void ClientAIBitReset(void)
{
	ClientSequence[ClientNo] = ClientAICommandWait;
	ClientBit &= (no2bittbl[ClientNo] ^ 0xffffffff);
}

//==============================================================
//	クライアント命令関数
//==============================================================

//----------------------------------------------------------
//	指定したﾎﾟｹﾓﾝﾃﾞｰﾀを取得する
//----------------------------------------------------------

void	ClientAIBSSPokeparaGet(void)
{
	u8 temp[256];
	int	length=0;
	int	i;
	u8	flag;

	if(ServerBuffer[ClientNo][2] == 0){
		length+=ClientAIBSSPokeparaGetAct(SelMonsNo[ClientNo],&temp[length]);
	}
	else{
		flag = ServerBuffer[ClientNo][2];
		for(i=0;i<6;i++){
			if((flag&1)!=0){
				length+=ClientAIBSSPokeparaGetAct(i,&temp[length]);
			}
			flag=flag>>1;
		}
	}
	BSS_DATA_TRANS_SET(BSS_CLIENT,length,(u8 *)&temp);
	ClientAIBitReset();
}

int	ClientAIBSSPokeparaGetAct(u8 SelectNo,u8 *temp)
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
			PCP.monsno		=PokeParaGet(&PokeParaEnemy[SelectNo],ID_monsno);
			PCP.item		=PokeParaGet(&PokeParaEnemy[SelectNo],ID_item);
			for(i=0;i<4;i++){
				PCP.waza[i]	=PokeParaGet(&PokeParaEnemy[SelectNo],ID_waza1+i);
				PCP.pp[i]	=PokeParaGet(&PokeParaEnemy[SelectNo],ID_pp1+i);
			}
			PCP.pp_count	=PokeParaGet(&PokeParaEnemy[SelectNo],ID_pp_count);
			PCP.friend		=PokeParaGet(&PokeParaEnemy[SelectNo],ID_friend);
			PCP.exp			=PokeParaGet(&PokeParaEnemy[SelectNo],ID_exp);
			PCP.hp_rnd		=PokeParaGet(&PokeParaEnemy[SelectNo],ID_hp_rnd);
			PCP.pow_rnd		=PokeParaGet(&PokeParaEnemy[SelectNo],ID_pow_rnd);
			PCP.def_rnd		=PokeParaGet(&PokeParaEnemy[SelectNo],ID_def_rnd);
			PCP.agi_rnd		=PokeParaGet(&PokeParaEnemy[SelectNo],ID_agi_rnd);
			PCP.spepow_rnd	=PokeParaGet(&PokeParaEnemy[SelectNo],ID_spepow_rnd);
			PCP.spedef_rnd	=PokeParaGet(&PokeParaEnemy[SelectNo],ID_spedef_rnd);
			PCP.personal_rnd=PokeParaGet(&PokeParaEnemy[SelectNo],ID_personal_rnd);
			PCP.condition	=PokeParaGet(&PokeParaEnemy[SelectNo],ID_condition);
			PCP.level		=PokeParaGet(&PokeParaEnemy[SelectNo],ID_level);
			PCP.hp			=PokeParaGet(&PokeParaEnemy[SelectNo],ID_hp);
			PCP.hpmax		=PokeParaGet(&PokeParaEnemy[SelectNo],ID_hpmax);
			PCP.pow			=PokeParaGet(&PokeParaEnemy[SelectNo],ID_pow);
			PCP.def			=PokeParaGet(&PokeParaEnemy[SelectNo],ID_def);
			PCP.agi			=PokeParaGet(&PokeParaEnemy[SelectNo],ID_agi);
			PCP.spepow		=PokeParaGet(&PokeParaEnemy[SelectNo],ID_spepow);
			PCP.spedef		=PokeParaGet(&PokeParaEnemy[SelectNo],ID_spedef);
			PCP.tamago_flag	=PokeParaGet(&PokeParaEnemy[SelectNo],ID_tamago_flag);
			PCP.speabi		=PokeParaGet(&PokeParaEnemy[SelectNo],ID_speabi);
			PCP.id_no		=PokeParaGet(&PokeParaEnemy[SelectNo],ID_id_no);
		#if 0	//ローカライズ対応のため変更　2002.08.09(金)
			PokeParaGet(&PokeParaEnemy[SelectNo],ID_nickname,PCP.nickname);
		#else
			PokeParaGet(&PokeParaEnemy[SelectNo],ID_nickname,buff);
			NickNameCopy(PCP.nickname, buff);
		#endif
			PokeParaGet(&PokeParaEnemy[SelectNo],ID_oyaname,PCP.oyaname);
			//BSS_DATA_TRANS_SET(BSS_CLIENT,sizeof(PCP),(u8 *)&PCP);
			adr=(u8 *)&PCP;
//			for(i=0;i<XtOffset(PokemonServerParam *, work);i++){
			for(i=0;i<sizeof(PokemonServerParam);i++){
				temp[i]=adr[i];
			}
			break;
		case BSS_PARA_MONSNO:			//モンスター番号
			buf16=PokeParaGet(&PokeParaEnemy[SelectNo],ID_monsno);
			temp[0]=(buf16&0x00ff)>> 0;
			temp[1]=(buf16&0xff00)>> 8;
			i=2;
			break;
		case BSS_PARA_ITEM:				//装備アイテム
			buf16=PokeParaGet(&PokeParaEnemy[SelectNo],ID_item);
			temp[0]=(buf16&0x00ff)>> 0;
			temp[1]=(buf16&0xff00)>> 8;
			i=2;
			break;
		case BSS_PARA_WAZA:
			for(i=0;i<4;i++){
				PWP.waza[i]	=PokeParaGet(&PokeParaEnemy[SelectNo],ID_waza1+i);
				PWP.pp[i]	=PokeParaGet(&PokeParaEnemy[SelectNo],ID_pp1+i);
			}
			PWP.pp_count	=PokeParaGet(&PokeParaEnemy[SelectNo],ID_pp_count);
			adr=(u8 *)&PWP;
			for(i=0;i<sizeof(PokemonWazaParam);i++){
				temp[i]=adr[i];
			}
			break;
		case BSS_PARA_WAZA1:				//技
		case BSS_PARA_WAZA2:
		case BSS_PARA_WAZA3:
		case BSS_PARA_WAZA4:
			buf16=
			PokeParaGet(&PokeParaEnemy[SelectNo],ID_waza1+ServerBuffer[ClientNo][1]-BSS_PARA_WAZA1);
			temp[0]=(buf16&0x00ff)>> 0;
			temp[1]=(buf16&0xff00)>> 8;
			i=2;
			break;
		case BSS_PARA_PP:
			for(i=0;i<4;i++){
				temp[i] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_pp1+i);
			}
			temp[i] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_pp_count);
			i++;
			break;
		case BSS_PARA_PP1:				//技ポイント
		case BSS_PARA_PP2:
		case BSS_PARA_PP3:
		case BSS_PARA_PP4:
			temp[0]=
			PokeParaGet(&PokeParaEnemy[SelectNo],ID_pp1+ServerBuffer[ClientNo][1]-BSS_PARA_PP1);
			i=1;
			break;
		case BSS_PARA_PPCOUNT1:
		case BSS_PARA_PPCOUNT2:
		case BSS_PARA_PPCOUNT3:
		case BSS_PARA_PPCOUNT4:
#if 0
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo].PPP.pp_count1;
			BSS_DATA_TRANS_SET(BSS_CLIENT,sizeof(temp[0]),&temp[0]);
			break;
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo].PPP.pp_count2;
			BSS_DATA_TRANS_SET(BSS_CLIENT,sizeof(temp[0]),&temp[0]);
			break;
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo].PPP.pp_count3;
			BSS_DATA_TRANS_SET(BSS_CLIENT,sizeof(temp[0]),&temp[0]);
			break;
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo].PPP.pp_count4;
			BSS_DATA_TRANS_SET(BSS_CLIENT,sizeof(temp[0]),&temp[0]);
#endif
			break;
		case BSS_PARA_ID:				//ＩＤナンバー
			buf32=PokeParaGet(&PokeParaEnemy[SelectNo],ID_id_no);
			temp[0]=(buf32&0x000000ff)>> 0;
			temp[1]=(buf32&0x0000ff00)>> 8;
			temp[2]=(buf32&0x00ff0000)>>16;
			i=3;
			break;
		case BSS_PARA_EXP:				//基本経験値
			buf32=PokeParaGet(&PokeParaEnemy[SelectNo],ID_exp);
			temp[0]=(buf32&0x000000ff)>> 0;
			temp[1]=(buf32&0x0000ff00)>> 8;
			temp[2]=(buf32&0x00ff0000)>>16;
			i=3;
			break;
		case BSS_PARA_HPEXP:			//ＨＰ努力値
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_hp_exp);
			i=1;
			break;
		case BSS_PARA_POWEXP:			//攻撃力努力値
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_pow_exp);
			i=1;
			break;
		case BSS_PARA_DEFEXP:			//防御力努力値
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_def_exp);
			i=1;
			break;
		case BSS_PARA_AGIEXP:			//素早さ努力値
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_agi_exp);
			i=1;
			break;
		case BSS_PARA_SPEPOWEXP:		//特殊攻撃努力値
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_spepow_exp);
			i=1;
			break;
		case BSS_PARA_SPEDEFEXP:		//特殊防御努力値
			temp[0]=PokeParaGet(&PokeParaEnemy[SelectNo],ID_spedef_exp);
			i=1;
			break;
		case BSS_PARA_FRIEND:			//友好値
			temp[0]=PokeParaGet(&PokeParaEnemy[SelectNo],ID_friend);
			i=1;
			break;
		case BSS_PARA_POKERUS:			//ポケルス
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_pokerus);
			i=1;
			break;
		case BSS_PARA_GET_PLACE:		//捕獲場所
			temp[0]=PokeParaGet(&PokeParaEnemy[SelectNo],ID_get_place);
			i=1;
			break;
		case BSS_PARA_GET_LEVEL:		//捕獲レベル
			temp[0]=PokeParaGet(&PokeParaEnemy[SelectNo],ID_get_level);
			i=1;
			break;
		case BSS_PARA_GET_CASSETTE:		//捕獲カセット
			temp[0]=PokeParaGet(&PokeParaEnemy[SelectNo],ID_get_cassette);
			i=1;
			break;
		case BSS_PARA_GET_BALL:			//捕獲ボール
			temp[0]=PokeParaGet(&PokeParaEnemy[SelectNo],ID_get_ball);
			i=1;
			break;
		case BSS_PARA_POWERRND:
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_hp_rnd);
			temp[1] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_pow_rnd);
			temp[2] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_def_rnd);
			temp[3] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_agi_rnd);
			temp[4] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_spepow_rnd);
			temp[5] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_spedef_rnd);
			i=6;
			break;
		case BSS_PARA_HPRND:			//HPパワー乱数
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_hp_rnd);
			i=1;
			break;
		case BSS_PARA_POWRND:			//攻撃力パワー乱数
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_pow_rnd);
			i=1;
			break;
		case BSS_PARA_DEFRND:			//防御力パワー乱数
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_def_rnd);
			i=1;
			break;
		case BSS_PARA_AGIRND:			//素早さパワー乱数
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_agi_rnd);
			i=1;
			break;
		case BSS_PARA_SPEPOWRND:		//特殊攻撃力パワー乱数
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_spepow_rnd);
			i=1;
			break;
		case BSS_PARA_SPEDEFRND:		//特殊防御力パワー乱数
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_spedef_rnd);
			i=1;
			break;
		case BSS_PARA_CHRRND:			//個性乱数
			buf32 = PokeParaGet(&PokeParaEnemy[SelectNo],ID_personal_rnd);
			temp[0]=(buf32&0x000000ff)>> 0;
			temp[1]=(buf32&0x0000ff00)>> 8;
			temp[2]=(buf32&0x00ff0000)>>16;
			temp[3]=(buf32&0xff000000)>>24;
			i=4;
			break;
		case BSS_PARA_SUM:				//チェックサム
			buf16 = PokeParaGet(&PokeParaEnemy[SelectNo],ID_checksum);
			temp[0]=(buf16&0x000000ff)>> 0;
			temp[1]=(buf16&0x0000ff00)>> 8;
			i=2;
			break;
		case BSS_PARA_CONDITION:		//コンディション
			buf32=PokeParaGet(&PokeParaEnemy[SelectNo],ID_condition);
			temp[0]=(buf32&0x000000ff)>> 0;
			temp[1]=(buf32&0x0000ff00)>> 8;
			temp[2]=(buf32&0x00ff0000)>>16;
			temp[3]=(buf32&0xff000000)>>24;
			i=4;
			break;
		case BSS_PARA_LEVEL:			//レベル
			temp[0]=PokeParaGet(&PokeParaEnemy[SelectNo],ID_level);
			i=1;
			break;
		case BSS_PARA_HP:				//ＨＰ残量
			buf16=PokeParaGet(&PokeParaEnemy[SelectNo],ID_hp);
			temp[0]=(buf16&0x000000ff)>> 0;
			temp[1]=(buf16&0x0000ff00)>> 8;
			i=2;
			break;
		case BSS_PARA_HPMAX:			//ＨＰＭＡＸ
			buf16=PokeParaGet(&PokeParaEnemy[SelectNo],ID_hpmax);
			temp[0]=(buf16&0x000000ff)>> 0;
			temp[1]=(buf16&0x0000ff00)>> 8;
			i=2;
			break;
		case BSS_PARA_POW:				//攻撃力
			buf16=PokeParaGet(&PokeParaEnemy[SelectNo],ID_pow);
			temp[0]=(buf16&0x000000ff)>> 0;
			temp[1]=(buf16&0x0000ff00)>> 8;
			i=2;
			break;
		case BSS_PARA_DEF:				//防御力
			buf16=PokeParaGet(&PokeParaEnemy[SelectNo],ID_def);
			temp[0]=(buf16&0x000000ff)>> 0;
			temp[1]=(buf16&0x0000ff00)>> 8;
			i=2;
			break;
		case BSS_PARA_AGI:				//素早さ
			buf16=PokeParaGet(&PokeParaEnemy[SelectNo],ID_agi);
			temp[0]=(buf16&0x000000ff)>> 0;
			temp[1]=(buf16&0x0000ff00)>> 8;
			i=2;
			break;
		case BSS_PARA_SPEPOW:			//特殊攻撃力
			buf16=PokeParaGet(&PokeParaEnemy[SelectNo],ID_spepow);
			temp[0]=(buf16&0x000000ff)>> 0;
			temp[1]=(buf16&0x0000ff00)>> 8;
			i=2;
			break;
		case BSS_PARA_SPEDEF:			//特殊防御力
			buf16=PokeParaGet(&PokeParaEnemy[SelectNo],ID_spedef);
			temp[0]=(buf16&0x000000ff)>> 0;
			temp[1]=(buf16&0x0000ff00)>> 8;
			i=2;
			break;
		case BSS_PARA_STYLE:			//かっこよさ
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_style);
			i=1;
			break;
		case BSS_PARA_BEAUTIFUL:		//美しさ
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_beautiful);
			i=1;
			break;
		case BSS_PARA_CUTE:				//かわいさ
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_cute);
			i=1;
			break;
		case BSS_PARA_CLEVER:			//賢さ
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_clever);
			i=1;
			break;
		case BSS_PARA_STRONG:			//たくましさ
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_strong);
			i=1;
			break;
		case BSS_PARA_FUR:				//毛艶
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_fur);
			i=1;
			break;
		case BSS_PARA_STYLEMEDAL:		//かっこよさ勲章
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_stylemedal);
			i=1;
			break;
		case BSS_PARA_BEAUTIFULMEDAL:	//美しさ勲章
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_beautifulmedal);
			i=1;
			break;
		case BSS_PARA_CUTEMEDAL:		//かわいさ勲章
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_cutemedal);
			i=1;
			break;
		case BSS_PARA_CLEVERMEDAL:		//賢さ勲章
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_clevermedal);
			i=1;
			break;
		case BSS_PARA_STRONGMEDAL:		//たくましさ勲章
			temp[0] = PokeParaGet(&PokeParaEnemy[SelectNo],ID_strongmedal);
			i=1;
			break;
	}
	return	i;
}


//----------------------------------------------------------
//	指定したｱﾄﾞﾚｽのﾎﾟｹﾓﾝﾃﾞｰﾀを取得する
//----------------------------------------------------------
void ClientAIBSSPokeparaGet2(void)
{
	PokemonServerParam	PCP;
	u8 *pPP, *pPCP;
	u8 i;
	
	pPP = ((u8 *)(&PokeParaEnemy[SelMonsNo[ClientNo]])) + ServerBuffer[ClientNo][1];
	pPCP = ((u8 *)(&PCP)) + ServerBuffer[ClientNo][1];
	
	for(i = 0; i < ServerBuffer[ClientNo][2]; i++)
	{
		pPCP[i] = pPP[i];
	}
	BSS_DATA_TRANS_SET(BSS_CLIENT, ServerBuffer[ClientNo][2], &pPCP[0]);

	ClientAIBitReset();
}

//----------------------------------------------------------
//	指定したﾎﾟｹﾓﾝﾃﾞｰﾀを変更する
//----------------------------------------------------------

void ClientAIBSSPokeparaPut(void)
{
	u8	i,flag;
	
	if(ServerBuffer[ClientNo][2] == 0){
		ClientAIBSSPokeparaPutAct(SelMonsNo[ClientNo]);
	}
	else{
		flag = ServerBuffer[ClientNo][2];
		for(i=0;i<6;i++){
			if((flag&1)!=0){
				ClientAIBSSPokeparaPutAct(i);
			}
			flag=flag>>1;
		}
	}
	ClientAIBitReset();
}

void ClientAIBSSPokeparaPutAct(u8 SelectNo)
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
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_monsno, 
						(u8 *)&PCP->monsno);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_item,
						(u8 *)&PCP->item);
			for(i=0;i<4;i++){
				PokeParaPut(&PokeParaEnemy[SelectNo],ID_waza1+i,
							(u8 *)&PCP->waza[i]);
				PokeParaPut(&PokeParaEnemy[SelectNo],ID_pp1+i,
							(u8 *)&PCP->pp[i]);
			}
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_pp_count,
						(u8 *)&PCP->pp_count);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_friend,
						(u8 *)&PCP->friend);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_exp,
						(u8 *)&PCP->exp);
			buf=PCP->hp_rnd;
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_hp_rnd,
						(u8 *)&buf);
			buf=PCP->pow_rnd;
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_pow_rnd,
						(u8 *)&buf);
			buf=PCP->def_rnd;
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_def_rnd,
						(u8 *)&buf);
			buf=PCP->agi_rnd;
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_agi_rnd,
						(u8 *)&buf);
			buf=PCP->spepow_rnd;
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_spepow_rnd,
						(u8 *)&buf);
			buf=PCP->spedef_rnd;
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_spedef_rnd,
						(u8 *)&buf);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_personal_rnd,
						(u8 *)&PCP->personal_rnd);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_condition,
						(u8 *)&PCP->condition);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_level,
						(u8 *)&PCP->level);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_hp,
						(u8 *)&PCP->hp);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_hpmax,
						(u8 *)&PCP->hpmax);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_pow,
						(u8 *)&PCP->pow);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_def,
						(u8 *)&PCP->def);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_agi,
						(u8 *)&PCP->agi);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_spepow,
						(u8 *)&PCP->spepow);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_spedef,
						(u8 *)&PCP->spedef);
			break;
		case BSS_PARA_MONSNO:			//モンスター番号
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_monsno, 
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_ITEM:				//装備アイテム
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_item,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_WAZA:
			for(i=0;i<4;i++){
				PokeParaPut(&PokeParaEnemy[SelectNo],ID_waza1+i,
							(u8 *)&PWP->waza[i]);
				PokeParaPut(&PokeParaEnemy[SelectNo],ID_pp1+i,
							(u8 *)&PWP->pp[i]);
			}
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_pp_count,
						(u8 *)&PWP->pp_count);
			break;
		case BSS_PARA_WAZA1:				//技
		case BSS_PARA_WAZA2:
		case BSS_PARA_WAZA3:
		case BSS_PARA_WAZA4:
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_waza1+ServerBuffer[ClientNo][1]-BSS_PARA_WAZA1,&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_PP:
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_pp1,
						&ServerBuffer[ClientNo][BSS_DATASTART]);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_pp2,
						&ServerBuffer[ClientNo][BSS_DATASTART+1]);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_pp3,
						&ServerBuffer[ClientNo][BSS_DATASTART+2]);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_pp4,
						&ServerBuffer[ClientNo][BSS_DATASTART+3]);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_pp_count,
						&ServerBuffer[ClientNo][BSS_DATASTART+4]);
			break;
		case BSS_PARA_PP1:				//技ポイント
		case BSS_PARA_PP2:
		case BSS_PARA_PP3:
		case BSS_PARA_PP4:
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_pp1+ServerBuffer[ClientNo][1]-BSS_PARA_PP1,&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_PPCOUNT1:
		case BSS_PARA_PPCOUNT2:
		case BSS_PARA_PPCOUNT3:
		case BSS_PARA_PPCOUNT4:
#if 0
			PokeParaEnemy[SelectNo].PPP.pp_count1 =
			ServerBuffer[ClientNo][BSS_DATASTART];
			break;
			PokeParaEnemy[SelectNo].PPP.pp_count2 =
			ServerBuffer[ClientNo][BSS_DATASTART];
			break;
			PokeParaEnemy[SelectNo].PPP.pp_count3 =
			ServerBuffer[ClientNo][BSS_DATASTART];
			break;
			PokeParaEnemy[SelectNo].PPP.pp_count4 =
			ServerBuffer[ClientNo][BSS_DATASTART];
#endif
			break;
		case BSS_PARA_ID:				//ＩＤナンバー
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_id_no,
						&ServerBuffer[ClientNo][BSS_DATASTART]);
			break;
		case BSS_PARA_EXP:				//基本経験値
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_exp,
						&ServerBuffer[ClientNo][BSS_DATASTART]);
			break;
		case BSS_PARA_HPEXP:			//ＨＰ努力値
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_hp_exp,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_POWEXP:			//攻撃力努力値
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_pow_exp,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_DEFEXP:			//防御力努力値
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_def_exp,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_AGIEXP:			//素早さ努力値
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_agi_exp,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_SPEPOWEXP:		//特殊攻撃努力値
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_spepow_exp,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_SPEDEFEXP:		//特殊防御努力値
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_spedef_exp,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_FRIEND:			//友好値
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_friend,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_POKERUS:			//ポケルス
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_pokerus,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_GET_PLACE:		//捕獲場所
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_get_place,
						&ServerBuffer[ClientNo][BSS_DATASTART]); 
			break;
		case BSS_PARA_GET_LEVEL:		//捕獲レベル
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_get_level,
						&ServerBuffer[ClientNo][BSS_DATASTART]); 
			break;
		case BSS_PARA_GET_CASSETTE:		//捕獲カセット
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_get_cassette,
						&ServerBuffer[ClientNo][BSS_DATASTART]); 
			break;
		case BSS_PARA_GET_BALL:			//捕獲ボール
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_get_ball,
						&ServerBuffer[ClientNo][BSS_DATASTART]); 
			break;
		case BSS_PARA_POWERRND:
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_hp_rnd,
						&ServerBuffer[ClientNo][BSS_DATASTART]);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_pow_rnd,
						&ServerBuffer[ClientNo][BSS_DATASTART+1]);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_def_rnd,
						&ServerBuffer[ClientNo][BSS_DATASTART+2]);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_agi_rnd,
						&ServerBuffer[ClientNo][BSS_DATASTART+3]);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_spepow_rnd,
						&ServerBuffer[ClientNo][BSS_DATASTART+4]);
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_spedef_rnd,
						&ServerBuffer[ClientNo][BSS_DATASTART+5]);
			break;
		case BSS_PARA_HPRND:			//HPパワー乱数
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_hp_rnd,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_POWRND:			//攻撃力パワー乱数
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_pow_rnd,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_DEFRND:			//防御力パワー乱数
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_def_rnd,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_AGIRND:			//素早さパワー乱数
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_agi_rnd,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_SPEPOWRND:		//特殊攻撃力パワー乱数
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_spepow_rnd,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_SPEDEFRND:		//特殊防御力パワー乱数
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_spedef_rnd,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_CHRRND:			//個性乱数
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_personal_rnd,
						&ServerBuffer[ClientNo][BSS_DATASTART]);
			break;
		case BSS_PARA_SUM:				//チェックサム
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_checksum,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_CONDITION:		//コンディション
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_condition,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_LEVEL:			//レベル
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_level,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_HP:				//ＨＰ残量
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_hp,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_HPMAX:			//ＨＰＭＡＸ
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_hpmax,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_POW:				//攻撃力
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_pow,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_DEF:				//防御力
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_def,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_AGI:				//素早さ
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_agi,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_SPEPOW:			//特殊攻撃力
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_spepow,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_SPEDEF:			//特殊防御力
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_spedef,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_STYLE:			//かっこよさ
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_style,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_BEAUTIFUL:		//美しさ
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_beautiful,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_CUTE:				//かわいさ
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_cute,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_CLEVER:			//賢さ
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_clever,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_STRONG:			//たくましさ
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_strong,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_FUR:				//毛艶
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_fur,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_STYLEMEDAL:		//かっこよさ勲章
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_stylemedal,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_BEAUTIFULMEDAL:	//美しさ勲章
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_beautifulmedal,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_CUTEMEDAL:		//かわいさ勲章
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_cutemedal,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_CLEVERMEDAL:		//賢さ勲章
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_clevermedal,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
		case BSS_PARA_STRONGMEDAL:		//たくましさ勲章
			PokeParaPut(&PokeParaEnemy[SelectNo],ID_strongmedal,
						&ServerBuffer[ClientNo][BSS_DATALOW]);
			break;
	}
}

//----------------------------------------------------------
//	指定したｱﾄﾞﾚｽのﾎﾟｹﾓﾝﾃﾞｰﾀを変更する
//----------------------------------------------------------
void ClientAIBSSPokeparaPut2(void)
{
	u8 *pPP;
	u8 i;
	
	pPP = ((u8 *)(&PokeParaEnemy[SelMonsNo[ClientNo]])) + ServerBuffer[ClientNo][1];
	for(i = 0; i < ServerBuffer[ClientNo][2]; i++)
	{
		pPP[i] = ServerBuffer[ClientNo][3+i];
	}

	ClientAIBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ登場ｴﾌｪｸﾄを起動する(ｴﾝｶｳﾝﾄ時)
//----------------------------------------------------------

const u8 PokeEnemyPosX[2][2]={
		{CAI_POKE_X,CAI_POKE_X},
		{CAI_POKE1X,CAI_POKE2X},
};
const u8 PokeEnemyPosY[2][2]={
		{CAI_POKE_Y,CAI_POKE_Y},
		{CAI_POKE1Y,CAI_POKE2Y},
};

void ClientAIBSSPokeEncount(void)
{
	u16	monsno;

	monsno=PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]],ID_monsno);

	PokemonFObjCellPalSet(&PokeParaEnemy[SelMonsNo[ClientNo]], ClientNo);
	//PokeActHeaderMake(PokeParaEnemy[SelMonsNo[ClientNo]].PPP.monsno,ClientNo);
	PokeActHeaderMake(monsno,
		ClientTypeGet(ClientNo));	//変更 by matsuda 2001.09.26(水)
#if 0
	PokemonStruct[ClientNo]=AddActor(&PokeActHeader,
		PokeEnemyPosX[FightType&FIGHT_TYPE_2vs2][ClientTypeGet(ClientNo)>>1],
//		PokeEnemyPosY[FightType&FIGHT_TYPE_2vs2][ClientTypeGet(ClientNo)>>1]+4*(8-pm2fpara[monsno].size),
		PokeEnemyPosY[FightType&FIGHT_TYPE_2vs2][ClientTypeGet(ClientNo)>>1]+pm2fpara[monsno].patcnt,
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
	ActWork[PokemonStruct[ClientNo]].work[2]=monsno;
	ActWork[PokemonStruct[ClientNo]].oamData.Pltt=ClientNo;
	ActAnmChg(&ActWork[PokemonStruct[ClientNo]],BattlePokeAnmNo[ClientNo]);

	//影をｾｯﾄ
	PokeShadowSeqSet(ClientNo, 
		PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]], ID_monsno));

	ClientSequence[ClientNo]=ClientAIPokeEncountWait;
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ登場ｴﾌｪｸﾄを起動する(ﾎﾞｰﾙから飛び出す)
//----------------------------------------------------------
void ClientAIBSSPokeAppear(void)
{
	SelMonsNo[ClientNo] = ServerBuffer[ClientNo][1];
	AIPokeAppearCommon(ClientNo, ServerBuffer[ClientNo][2]);

//	ClientAIBitReset();
	ClientSequence[ClientNo] = ClientAIPokeAppearWait;
}

//-- PokeAppear、SendOut共通処理 --//
static void AIPokeAppearCommon(u8 client_no, u8 baton_flg)
{
	u16	monsno;

	ClientPokeSysFlagClear(client_no, baton_flg);

	SelMonsNo[client_no]=ServerBuffer[client_no][1];
	monsno=PokeParaGet(&PokeParaEnemy[SelMonsNo[client_no]],ID_monsno);
	ClientStruct[client_no] = AddBanishActor(CA_PokeAppearWait);
	PokemonFObjCellPalSet(&PokeParaEnemy[SelMonsNo[client_no]], client_no);

	PokeActHeaderMake(monsno,ClientTypeGet(client_no));

#if 0
	PokemonStruct[client_no] = AddActor(&PokeActHeader,
							PokeEnemyPosX[FightCheck()][ClientTypeGet(client_no)>>1],
							PokeEnemyPosY[FightCheck()][ClientTypeGet(client_no)>>1]+
//							4*(8-pm2fpara[monsno].size),
							pm2fpara[monsno].patcnt,
							C_POKE1PRI);	//ﾎﾟｹﾓﾝ
#else
	PokemonStruct[client_no]=
		AddActor(&PokeActHeader,
				 GetWazaEffPos(client_no,PM_X),
				 GetPokemonYPos(client_no),
				 GetPokeSoftPri(client_no));
#endif
	ActWork[PokemonStruct[client_no]].work[0] = client_no;
	ActWork[PokemonStruct[client_no]].work[2] = monsno;
	ActWork[ClientStruct[client_no]].work[1] = PokemonStruct[client_no];
	ActWork[PokemonStruct[client_no]].oamData.Pltt = client_no;
	ActAnmChg(&ActWork[PokemonStruct[client_no]],BattlePokeAnmNo[client_no]);

#if 0	//changed by matsuda 2002.01.11(金)
	ActWork[ClientStruct[client_no]].work[0] = 
		MBSmokeSet(PokeEnemyPosX[FightCheck()][ClientTypeGet(client_no)>>1], PokeEnemyPosY[FightCheck()][ClientTypeGet(client_no)>>1]+20, 1);
	CAC_PokeAppearDifferentInit(&ActWork[PokemonStruct[client_no]], 1);
#else
	ActWork[PokemonStruct[client_no]].banish = 1;
	ActWork[PokemonStruct[client_no]].move = DummyActMove;
	ActWork[ClientStruct[client_no]].work[0] = MonsterBallSet(0,0xfe);
#endif
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝを戻すｴﾌｪｸﾄを起動する
//----------------------------------------------------------
void ClientAIBSSPokeReturn(void)
{
	if(ServerBuffer[ClientNo][1] == 0)
	{
		CliSys[ClientNo].WazaEffSeqNo = 0;
		ClientSequence[ClientNo] = ClientAIPokeReturnMigawariChk;
//		SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_POKERETURN_ENEMY);
//		ClientSequence[ClientNo] = ClientAIPokeReturnWait;
	}
	else
	{
		AffineDelActor(&ActWork[PokemonStruct[ClientNo]]);
		DelActor(&ActWork[PokemonStruct[ClientNo]]);
		PokeShadowBanishSeqSet(ClientNo);
		GaugeOFF(ClientGaugeSt[ClientNo]);
		ClientAIBitReset();
	}
}

enum{
	CAI_RET_MIGAWARICHK,
	CAI_RET_POKERETURN,
};
static void ClientAIPokeReturnMigawariChk(void)
{
	switch(CliSys[ClientNo].WazaEffSeqNo){
		case CAI_RET_MIGAWARICHK:
			if(Climem[ClientNo].migawari == 1)	//「みがわり」チェック
				SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_MIGAWARI_OUT);
			CliSys[ClientNo].WazaEffSeqNo = CAI_RET_POKERETURN;
			break;
		case CAI_RET_POKERETURN:					//技エフェクトセット
			if(CliSys[ClientNo].etc_eff)
				break;
			CliSys[ClientNo].WazaEffSeqNo = 0;
			SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_POKERETURN_ENEMY);
			ClientSequence[ClientNo] = ClientAIPokeReturnWait;
			break;
	}
}

//----------------------------------------------------------
//	ﾄﾚｰﾅｰ登場ｴﾌｪｸﾄを起動する(ｴﾝｶｳﾝﾄ時)
//----------------------------------------------------------
#define TRAINER_IN_DX	(-200)		//ｲﾝしてくるときの初期DX ※必ずTRAINER_IN_SPの倍数であること
#define TRAINER_IN_SP	4	//ｲﾝしてくるときのｽﾋﾟｰﾄﾞ
void ClientAIBSSTrainerEncount(void)
{
	int	type;

#ifdef PM_DEBUG
	if(DebugFightFlag&DEBUG_FIGHT_TRAINER)
		type=UserWork[DEBUG_TRAINER];
	else if(FieldTrainerID==ORUSUBAN_TRAINER)
		type=OrusubanChrGet();				//お留守番対戦用
#else
	if(FieldTrainerID==ORUSUBAN_TRAINER)
		type=OrusubanChrGet();				//お留守番対戦用
#endif
	else if(FightType&FIGHT_TYPE_BATTLE_TOWER)
		type=BattleTowerChrGet();				//バトルタワー用
	else if(FightType&FIGHT_TYPE_CARD_E)
		type=BattleCardEChrGet();				//カードｅ用
	else
		type=TD[FieldTrainerID].chrnum;

	TrainerFObjCellPalSet(type, ClientNo);

//	PokeActHeaderMake(type+500,ClientTypeGet(ClientNo));
	TrainerActHeaderMake(type,ClientTypeGet(ClientNo));
	PokemonStruct[ClientNo] = AddActor(&PokeActHeader,
							CAI_POKE_X,
							CAI_POKE_Y+4*(8-trfpara[type].size),
							//C_TRN_PRI);	//ﾄﾚｰﾅｰ
							GetPokeSoftPri(ClientNo));

//	ActWork[PokemonStruct[ClientNo]].oamData.Pltt = ClientNo;
	ActWork[PokemonStruct[ClientNo]].dx = -ENCOUNT_DX;
	ActWork[PokemonStruct[ClientNo]].work[0] = ENCOUNT_SPEED;
	ActWork[PokemonStruct[ClientNo]].oamData.Pltt 
		= ObjPalNumGet(TRFObjDataPal[type].reg_num);
	ActWork[PokemonStruct[ClientNo]].work[5]	//転送型なのでDelする時にCharNoを
		= ActWork[PokemonStruct[ClientNo]].oamData.CharNo;	//戻す必要がある
	ActWork[PokemonStruct[ClientNo]].oamData.CharNo
		= CellCharNumGet(TRFObjDataCell[type].act_num);
	ActWork[PokemonStruct[ClientNo]].oamData.AffineParam = type;
	ActWork[PokemonStruct[ClientNo]].move = CAS_TrainerSlideIn;

	ClientSequence[ClientNo] = ClientAITrainerEncountWait;
}

//----------------------------------------------------------
//	ﾄﾚｰﾅｰ登場ｴﾌｪｸﾄを起動する(対戦終了後)
//----------------------------------------------------------
#define TRAINER_AP_IN_DX (96)//ｲﾝしてくるときの初期DX ※必ずTRAINER_IN_SPの倍数であること
#define TRAINER_AP_IN_SP	(-2)	//ｲﾝしてくるときのｽﾋﾟｰﾄﾞ
#define TRAINER_OFFSET_X	32	//完全に登場位置までｽﾗｲﾄﾞさせないようにｵﾌｾｯﾄで差分をつける
void ClientAIBSSTrainerAppear(void)
{
	int	type;

	if(FieldTrainerID==ORUSUBAN_TRAINER)
		type=OrusubanChrGet();				//お留守番対戦用
	else if(FightType&FIGHT_TYPE_BATTLE_TOWER)
		type=BattleTowerChrGet();				//バトルタワー用
	else if(FightType&FIGHT_TYPE_CARD_E)
		type=BattleCardEChrGet();				//カードｅ用
	else
		type=TD[FieldTrainerID].chrnum;

	TrainerFObjCellPalSet(type, ClientNo);

//	PokeActHeaderMake(type+500,ClientTypeGet(ClientNo));
	TrainerActHeaderMake(type,ClientTypeGet(ClientNo));
	PokemonStruct[ClientNo] = AddActor(&PokeActHeader,
							CAI_POKE_X,
							CAI_POKE_Y+4*(8-trfpara[type].size),
							C_TRN_PRI);	//ﾄﾚｰﾅｰ

//	ActWork[PokemonStruct[ClientNo]].oamData.Pltt = ClientNo;
	ActWork[PokemonStruct[ClientNo]].dx = TRAINER_AP_IN_DX;
	ActWork[PokemonStruct[ClientNo]].x += TRAINER_OFFSET_X;
	ActWork[PokemonStruct[ClientNo]].work[0] = TRAINER_AP_IN_SP;
	ActWork[PokemonStruct[ClientNo]].oamData.Pltt 
		= ObjPalNumGet(TRFObjDataPal[type].reg_num);
	ActWork[PokemonStruct[ClientNo]].work[5]	//転送型なのでDelする時にCharNoを
		= ActWork[PokemonStruct[ClientNo]].oamData.CharNo;	//戻す必要がある
	ActWork[PokemonStruct[ClientNo]].oamData.CharNo
		= CellCharNumGet(TRFObjDataCell[type].act_num);
	ActWork[PokemonStruct[ClientNo]].oamData.AffineParam = type;
	ActWork[PokemonStruct[ClientNo]].move = CAS_TrainerSlideIn;

	ClientSequence[ClientNo] = ClientAITrainerAppearWait;
}

//----------------------------------------------------------
//	ﾄﾚｰﾅｰを戻すｴﾌｪｸﾄを起動する
//----------------------------------------------------------

#define	TRAINER_OUT_SP2	4

void ClientAIBSSTrainerReturn(void)
{
#if 0	//changed by matsuda 2002.01.15(火)
	ActWork[PokemonStruct[ClientNo]].work[0] = TRAINER_OUT_SP2;
	ActWork[PokemonStruct[ClientNo]].move = CAS_TrainerSlideOut;
#else
	DxDyAddClear(&ActWork[PokemonStruct[ClientNo]]);
	ActWork[PokemonStruct[ClientNo]].work[0] = ENEMYTRAINER_RETURN_SYNCNUM;	//VsyncNum
	ActWork[PokemonStruct[ClientNo]].work[2] = 240+40;
	ActWork[PokemonStruct[ClientNo]].work[4] = ActWork[PokemonStruct[ClientNo]].y;
	ActWork[PokemonStruct[ClientNo]].move = W_StraightSyncMove;
	SetWorkSeq(&ActWork[PokemonStruct[ClientNo]], DummyActMove);
#endif
	ClientSequence[ClientNo] = ClientAITrainerReturnWait;
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝが気絶するｴﾌｪｸﾄを起動する
//----------------------------------------------------------
void ClientAIBSSPokeKizetu(void)
{
#if 0	//2002.09.03(火)
	SePlayPan(SE_POKE_DEAD, WAZA_SE_R);
	ActWork[PokemonStruct[ClientNo]].move=SeqEnemyPokeKizetsuInit;
	ClientSequence[ClientNo]=ClientAIPokeKizetsuWait;
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

			SePlayPan(SE_POKE_DEAD, WAZA_SE_R);
			ActWork[PokemonStruct[ClientNo]].move=SeqEnemyPokeKizetsuInit;
			ClientSequence[ClientNo]=ClientAIPokeKizetsuWait;
			break;
	}
#endif
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝが全滅したときのｴﾌｪｸﾄを起動する
//----------------------------------------------------------
void ClientAIBSSZenmetsu(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ捕獲成功のｴﾌｪｸﾄを出す
//----------------------------------------------------------
void ClientAIBSSGetSuccess(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ捕獲失敗のｴﾌｪｸﾄを出す
//----------------------------------------------------------
void ClientAIBSSGetFail(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝﾚﾍﾞﾙｱｯﾌﾟのｴﾌｪｸﾄを出す
//----------------------------------------------------------
void ClientAIBSSPokeLevelUp(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//	指定した技ﾅﾝﾊﾞｰのｴﾌｪｸﾄを出す
//----------------------------------------------------------
#if 0	// 2002.07.22(月)
void ClientAIBSSWazaEffect(void)
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
		ClientAIBitReset();
		return;
	}

	if(FightCheck() && (AttackClient^2) == DefenceClient && WazaDamage > 0)
		wazano = WAZANO_MAX+1;	//味方への攻撃ならば、簡易的なｴﾌｪｸﾄを出す

	WazaEffectSet(wazano);
	ClientSequence[ClientNo] = ClientAIWazaEffectWait;
}
#else
enum{
	AI_MIGAWARI_CHK,
	AI_EFF_PUTCHK,
	AI_EFF_WAIT,
	AI_EFF_END,
};
void ClientAIBSSWazaEffect(void)
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
		ClientAIBitReset();
		return;
	}
	
	CliSys[ClientNo].WazaEffSeqNo = AI_MIGAWARI_CHK;
	ClientSequence[ClientNo] = ClientAIWazaEffectSet;
}

static void ClientAIWazaEffectSet(void)
{
	u16 wazano;
	u8 renzoku_cnt;
	
	wazano = ServerBuffer[ClientNo][1] | (ServerBuffer[ClientNo][2] << 8);
	renzoku_cnt = ServerBuffer[ClientNo][11];	//0:ﾉｰﾏﾙ 1:連続技終了 2:連続技中

	switch(CliSys[ClientNo].WazaEffSeqNo){
		case AI_MIGAWARI_CHK:	//「みがわり」チェック
			if(Climem[ClientNo].migawari == 1 && Climem[ClientNo].migawari_out == 0){
				Climem[ClientNo].migawari_out = 1;
				SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_MIGAWARI_OUT);
			}
			CliSys[ClientNo].WazaEffSeqNo = AI_EFF_PUTCHK;
			break;
		case AI_EFF_PUTCHK:					//技エフェクトセット
			if(CliSys[ClientNo].etc_eff)
				break;
			
//			if(FightCheck() && (AttackClient^2) == DefenceClient && WazaDamage > 0)
//				wazano = WAZANO_MAX+1;	//味方への攻撃ならば、簡易的なｴﾌｪｸﾄを出す
			
			PokeAffineON_OFF(0);
			WazaEffectSet(wazano);
			CliSys[ClientNo].WazaEffSeqNo = AI_EFF_WAIT;
			break;
		case AI_EFF_WAIT:					//技エフェクト終了待ち
			WazaEffectSequence();
			if(WazaEffectFlag==0){
				PokeAffineON_OFF(1);
				if(Climem[ClientNo].migawari && renzoku_cnt <= 1){	//身代わりチェック
					SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_MIGAWARI_IN);
					Climem[ClientNo].migawari_out = 0;
				}
				CliSys[ClientNo].WazaEffSeqNo = AI_EFF_END;
			}
			break;
		case AI_EFF_END:
			if(CliSys[ClientNo].etc_eff)
				break;

			//ｴﾌｪｸﾄで操作されたﾊﾞﾆｯｼｭﾌﾗｸﾞを画面切り替え時の為、記憶する
			PokeBanishMemory();
			wazano = ServerBuffer[ClientNo][1] | (ServerBuffer[ClientNo][2] << 8);
			MigawariFlgCheckSet(ClientNo, wazano);
			CliSys[ClientNo].WazaEffSeqNo = 0;
			ClientAIBitReset();
			break;
	}
}
#endif

//----------------------------------------------------------
//	送ったﾃﾞｰﾀを文字ﾃﾞｰﾀと解釈してﾒｯｾｰｼﾞ表示する
//----------------------------------------------------------

#if 0
void ClientAIBSSMessage(void)
{
#if 1
	ScrX0=0;
	ScrY0=0;
//	MsgPutSet(&FightMsg,&ServerBuffer[ClientNo][2],0x10,1,15);
//	TalkMsgSet(&FightMsg,&ServerBuffer[ClientNo][2],CGX_START+0x10,2,15);
	FightMsgCreate((u8 *)&ServerBuffer[ClientNo][2]);
	TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
	ClientSequence[ClientNo] = ClientAIMessageWait;
#else
//かなしばりとか、いちゃもんとかのアラートメッセージを出さないようにする
	ClientAIBitReset();
#endif
}
#else
void ClientAIBSSMessage(void)
{
	u16	*MsgID;

	ScrX0=0;
	ScrY0=0;

	MsgID=(u16 *)&ServerBuffer[ClientNo][2];
	FightMsgID(MsgID[0]);
	TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
	ClientSequence[ClientNo] = ClientAIMessageWait;
}
#endif

//----------------------------------------------------------
//	送ったﾃﾞｰﾀを文字ﾃﾞｰﾀと解釈してﾒｯｾｰｼﾞ表示する
//----------------------------------------------------------

void ClientAIBSSAlertMessage(void)
{
//	if(MineEnemyCheck(ClientNo)==SIDE_MINE)
//		ClientAIBSSMessage();
//	else
		ClientAIBitReset();
}

//----------------------------------------------------------
//	ｺﾏﾝﾄﾞ選択ｳｨﾝﾄﾞｳを表示して、選択ｼｰｹﾝｽを作動させる
//----------------------------------------------------------
void ClientAIBSSCommandSelect(void)
{
	ClientAICommandSelectAI();
	ClientAIBitReset();
}

//----------------------------------------------------------
//	指定されたClientNoのシーケンスナンバーと同期をとる
//----------------------------------------------------------
void ClientAIBSSCommandSelectCopy(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//	技選択ｳｨﾝﾄﾞｳを表示して、選択ｼｰｹﾝｽを作動させる
//----------------------------------------------------------
void ClientAIBSSWazaSelect(void)
{
	u8	i;
	u16	wazano;
	u16	dir;
	WazaList	*WL;

	WL=(WazaList *)&ServerBuffer[ClientNo][4];

#ifdef PM_DEBUG
	if(DebugFightFlag&DEBUG_FIGHT_WAZA_DEBUG){
		wazano=0;
		while(wazano==0){
//			wazano=PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]],
//							   ID_waza1+UserWork[WAZA_DEBUG_WORK+((ClientNo&2)>>1)]);
			wazano=WL->wazano[UserWork[WAZA_DEBUG_WORK+((ClientNo&2)>>1)]];
			i=UserWork[WAZA_DEBUG_WORK+((ClientNo&2)>>1)];
			if(wazano)
				UserWork[WAZA_DEBUG_WORK+((ClientNo&2)>>1)]++;
			else
				UserWork[WAZA_DEBUG_WORK+((ClientNo&2)>>1)]=0;

			if(UserWork[WAZA_DEBUG_WORK+((ClientNo&2)>>1)]>3)
				UserWork[WAZA_DEBUG_WORK+((ClientNo&2)>>1)]=0;
		}
		if(WTD[wazano].attackrange&(RANGE_ALWAYS|RANGE_MINE))
			dir=ClientNo;
		else{
			if((FightType&FIGHT_TYPE_2vs2)&&
			   (DebugFightFlag&DEBUG_FIGHT_PARTY_ATTACK)){
				if(WTD[wazano].attackrange)
					dir=ClientNoGet(BSS_CLIENT_MINE);
				else
					dir=ClientNoGet(ClientTypeGet(ClientNo)^2);
			}
			else if(FightType&FIGHT_TYPE_2vs2)
				dir=pp_rand()&2;
			else
				dir=ClientNoGet(BSS_CLIENT_MINE);
		}

		BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_WAZA,i|(dir<<8));
		ClientAIBitReset();
	}
	else if(FightType&FIGHT_TYPE_AI){
#else
	if(FightType&FIGHT_TYPE_AI){
#endif
		WazaAIInit2();
		i=WazaAIMain();
		switch(i){
			case AI_ENEMY_SAFARI:
				BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_SAFARI,0);
				break;
			case AI_ENEMY_ESCAPE:
				BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_ESCAPE,0);
				break;
			default:
//				if(WTD[PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]],ID_waza1+i)].attackrange&(RANGE_ALWAYS|RANGE_MINE))
				if(WTD[WL->wazano[i]].attackrange&(RANGE_ALWAYS|RANGE_MINE))
					DefenceClient=ClientNo;
				if(WTD[WL->wazano[i]].attackrange&RANGE_DOUBLE){
					DefenceClient=ClientNoGet(BSS_CLIENT_MINE);
					if(NoReshuffleClient&no2bittbl[DefenceClient])
						DefenceClient=ClientNoGet(BSS_CLIENT_MINE2);
				}
				BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_WAZA,i|(DefenceClient<<8));
				break;
		}
		ClientAIBitReset();
	}
	else{
		while(1){
			i=pp_rand()&0x03;
//			wazano=PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]],ID_waza1+i);
			wazano=WL->wazano[i];
			if(wazano!=0) break;
		}
		if(WTD[wazano].attackrange&(RANGE_ALWAYS|RANGE_MINE))
			BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_WAZA,i|ClientNo<<8);
		else{
			if(FightType&FIGHT_TYPE_2vs2){
				BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_WAZA,i|ClientNoGet(BSS_CLIENT_MINE+(pp_rand()&2))<<8);
			}
			else
				BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_WAZA,i|ClientNoGet(BSS_CLIENT_MINE)<<8);
		}
		ClientAIBitReset();
	}
}

//----------------------------------------------------------
//	ｱｲﾃﾑ選択ｳｨﾝﾄﾞｳを表示して、選択ｼｰｹﾝｽを作動させる
//----------------------------------------------------------
void ClientAIBSSItemSelect(void)
{
	BSS_USE_ITEM_SET(BSS_CLIENT,UserWork[AI_ITEM_NO+(ClientNo>>1)*2]);
	ClientAIBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ選択ｳｨﾝﾄﾞｳを表示して、選択ｼｰｹﾝｽを作動させる
//----------------------------------------------------------
void ClientAIBSSPokeSelect(void)
{
	int i;
	u8	no1,no2;

	if(UserWork[AI_RESHUFFLE_SELNO+(ClientTypeGet(ClientNo)>>1)]==6){
		if((i=ClientAIPokeSelectAI())==6){
			if((FightType&FIGHT_TYPE_2vs2)==0)
				no2=no1=ClientNoGet(BSS_CLIENT_ENEMY);
			else{
				no1=ClientNoGet(BSS_CLIENT_ENEMY);
				no2=ClientNoGet(BSS_CLIENT_ENEMY2);
				}
			for(i=0;i<6;i++){
				if((PokeParaGet(&PokeParaEnemy[i],ID_hp)!=0)&&
				(i!=SelMonsNo[no1])&&(i!=SelMonsNo[no2])) break;
			}
		}
	}
	else{
		i=UserWork[AI_RESHUFFLE_SELNO+(ClientTypeGet(ClientNo)>>1)];
		UserWork[AI_RESHUFFLE_SELNO+(ClientTypeGet(ClientNo)>>1)]=6;
	}
	UserWork[AFTER_RESHUFFLE_SELMONSNO+ClientNo]=i;
	BSS_POKE_RESHUFFLE_SET(BSS_CLIENT,i,0);
	ClientAIBitReset();
}

//----------------------------------------------------------
//	逃げるｴﾌｪｸﾄを起動する
//----------------------------------------------------------
void ClientAIBSSEscape(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//	HPｹﾞｰｼﾞを増減する
//----------------------------------------------------------
void	ClientAIBSSHpGauge(void)
{
	s16 beHP;	//増減する値
	
	BattleGaugeTransWram(0);
	beHP = (ServerBuffer[ClientNo][3] << 8) | ServerBuffer[ClientNo][2];

	if(beHP!=JIBAKU_HP)
		GaugeDataSet(ClientNo, ClientGaugeSt[ClientNo],
				 PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]],ID_hpmax),
				 PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]],ID_hp),
				 beHP);
	else
		GaugeDataSet(ClientNo, ClientGaugeSt[ClientNo],
				 PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]],ID_hpmax),
				 0, beHP);

	ClientSequence[ClientNo] = ClientAIHpGaugeWait;
}

//----------------------------------------------------------
//	EXPｹﾞｰｼﾞを増減する
//----------------------------------------------------------
void ClientAIBSSExpGauge(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//	指定されたｽﾃｰﾀｽ異常ｴﾌｪｸﾄを起動する
//----------------------------------------------------------
void ClientAIBSSStatusSet(void)
{
	u32 condition;
	u8 condition_flg;

	if(ClientSEWait(ClientNo))
		return;

	GaugeTransChrSet(ClientGaugeSt[ClientNo], &PokeParaEnemy[SelMonsNo[ClientNo]], G_STATUS);
	condition_flg = ServerBuffer[ClientNo][1];
	condition = ServerBuffer[ClientNo][2] | (ServerBuffer[ClientNo][3]<<8) | 
				(ServerBuffer[ClientNo][4]<<16) | (ServerBuffer[ClientNo][5]<<24);

//	ClientStatusEffSet(condition_flg, condition);	2002.09.07(土)
	CliSys[ClientNo].status_eff = 0;
	
	ClientSequence[ClientNo] = ClientAIStatusEffWait;
}

void ClientAIBSSStatusEffect(void)
{
	u32 condition;
	u8 condition_flg;

	if(ClientSEWait(ClientNo))
		return;

	condition_flg = ServerBuffer[ClientNo][1];
	condition = ServerBuffer[ClientNo][2] | (ServerBuffer[ClientNo][3]<<8) | 
				(ServerBuffer[ClientNo][4]<<16) | (ServerBuffer[ClientNo][5]<<24);
	ClientStatusEffSet(condition_flg, condition);
	ClientSequence[ClientNo] = ClientAIStatusEffWait;
}

//----------------------------------------------------------
//	指定されたｽﾃｰﾀｽ異常をｸﾘｱする
//----------------------------------------------------------
void ClientAIBSSStatusClear(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//	あらかじめ用意されたﾊﾞｯﾌｧにﾃﾞｰﾀを格納する
//----------------------------------------------------------
void ClientAIBSSDataTrans(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//	指定ｱﾄﾞﾚｽ(RAM,VRAM,CGRAM)にﾃﾞｰﾀを転送する
//----------------------------------------------------------
void ClientAIBSSDataRamTrans(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//	曲ﾃﾞｰﾀを転送する
//----------------------------------------------------------
void ClientAIBSSBgmTrans(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//	鳴き声ﾃﾞｰﾀを転送する
//----------------------------------------------------------
void ClientAIBSSVoiceTrans(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//	ﾒﾆｭｰで選択した項目IDを返す
//----------------------------------------------------------
void ClientAIBSSSelectReturn(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ入れ替えを行ったことを知らせる
//----------------------------------------------------------
void ClientAIBSSReshuffle(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//	ｱｲﾃﾑ使用を知らせる
//----------------------------------------------------------
void ClientAIBSSUseItem(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//	ﾎﾞｰﾙ使用を知らせる
//----------------------------------------------------------
void ClientAIBSSUseBall(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//技エフェクト用のカウンタのクリア
//----------------------------------------------------------
void	ClientAIBSSLoopCountClear(void)
{
	WEW.loopcnt = 0;
	ClientAIBitReset();
}

//----------------------------------------------------------
//技エフェクト用のカウンタのセット
//----------------------------------------------------------
void	ClientAIBSSLoopCountSet(void)
{
	WEW.loopcnt = ServerBuffer[ClientNo][1];
	ClientAIBitReset();
}

//----------------------------------------------------------
//技エフェクト用のフラグのクリア
//----------------------------------------------------------
void	ClientAIBSSSwitchFlagClear(void)
{
	WEW.flag = 0;
	ClientAIBitReset();
}

//----------------------------------------------------------
//技エフェクト用のフラグのセット
//----------------------------------------------------------
void	ClientAIBSSSwitchFlagSet(void)
{
	WEW.flag ^= 1;
	ClientAIBitReset();
}

//----------------------------------------------------------
//	ﾀﾞﾒｰｼﾞを受けたときのﾎﾟｹﾓﾝ点滅
//----------------------------------------------------------
void ClientAIBSSPokeDamageBlink(void)
{
	//ﾎﾟｹﾓﾝがﾊﾞﾆｯｼｭ状態ならをBlinkしない
	if(ActWork[PokemonStruct[ClientNo]].banish == 1){
		ClientAIBitReset();
		return;
	}

	ClientEffectWait = 1;	//Blinkｴﾌｪｸﾄ開始フラグセット
	ActWork[PokemonStruct[ClientNo]].work[1] = 0;

	//-- ｹﾞｰｼﾞのカラー変更 & 揺らしエフェクトセット --//
	GaugeSwayEffect(ClientNo);

	ClientSequence[ClientNo] = ClientAIPokeDamageBlinkWait;
}

//----------------------------------------------------------
//	ゲージを消す
//----------------------------------------------------------
void ClientAIBSSGaugeOff(void)
{
//	GaugeOFF(ClientGaugeSt[ClientNo]);
	ClientAIBitReset();
}

//----------------------------------------------------------
//	SEを鳴らす
//----------------------------------------------------------
void ClientAIBSSSEPlay(void)
{
	s8 pan;

//	SePlay(ServerBuffer[ClientNo][1]|(ServerBuffer[ClientNo][2]<<8));
	if(MineEnemyCheck(ClientNo) == SIDE_MINE)
		pan = WAZA_SE_L;
	else
		pan = WAZA_SE_R;
	SePlayPan(ServerBuffer[ClientNo][1]|(ServerBuffer[ClientNo][2]<<8), pan);
	ClientAIBitReset();

}

//----------------------------------------------------------
//	MEを鳴らす
//----------------------------------------------------------
void ClientAIBSSMEPlay(void)
{
	JinglePlay(ServerBuffer[ClientNo][1]|(ServerBuffer[ClientNo][2]<<8));
	ClientAIBitReset();
}

//----------------------------------------------------------
//	鳴き声を鳴らす
//----------------------------------------------------------

void ClientAIBSSVoicePlay(void)
{
//	VoicePlay(PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]],ID_monsno),25);
	//気絶時の声で鳴くように変更 2002.08.27(火) by matsuda
	VoicePlay3(PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]],ID_monsno),25,5);
	ClientAIBitReset();
}

//----------------------------------------------------------
//	エンカウントエフェクトをセット
//----------------------------------------------------------
void ClientAIBSSEncountEffect(void)
{
	EncountEffectSet(ServerBuffer[ClientNo][1]);
	//OBJ横移動のストッパー
	EncountEffectFlag|=ENCOUNT_EFFECT_FLAG_OBJSTOP;	
	ClientAIBitReset();
}

//----------------------------------------------------------
//	最初のポケモン登場(ﾄﾚｰﾅｰ引っ込む、ﾎﾟｹﾓﾝ出す、ﾒｯｾｰｼﾞ出す。までの一連の動作
//----------------------------------------------------------
void ClientAIBSSPokeSendOut(void)
{
	u8 id;
	
	//-- ﾄﾚｰﾅｰ --//
	DxDyAddClear(&ActWork[PokemonStruct[ClientNo]]);
	ActWork[PokemonStruct[ClientNo]].work[0] = ENEMYTRAINER_RETURN_SYNCNUM;
	ActWork[PokemonStruct[ClientNo]].work[2] = 240+40;
	ActWork[PokemonStruct[ClientNo]].work[4] = ActWork[PokemonStruct[ClientNo]].y;
	ActWork[PokemonStruct[ClientNo]].move = W_StraightSyncMove;
	SetWorkSeq(&ActWork[PokemonStruct[ClientNo]], AITrainerDelEnd);
//	ActAnmChg(&ActWork[PokemonStruct[ClientNo]],1);

	//-- ﾎﾟｹﾓﾝ --//
	id = AddTask(AISendOutTask, 5);
	TaskTable[id].work[0] = ClientNo;

	//-- 手持ちｹﾞｰｼﾞを消す --//
	if(CliSys[ClientNo].temoti_gauge_flg)
		TaskTable[TemotiGauge[ClientNo]].TaskAdrs = TemotiBallOff;

	BtlWork->sendout_eff = 1;
	ClientSequence[ClientNo] = ClientAIDummy;
}

static void AITrainerDelEnd(actWork *xreg)
{
	TrainerFObjCellPalDel(xreg->oamData.AffineParam);
	xreg->oamData.CharNo = xreg->work[5];	//DelActorする時に転送で
						//取っていた領域が開放されるようにCharNoを元に戻す
	AffineDelActor(xreg);
	DelActor(xreg);
}

static void AISendOutTask(u8 id)
{
	u8 clientno_temp;
	
/*	if(TaskTable[id].work[1] < 24){		//ﾎﾟｹﾓﾝ登場までのwait
		TaskTable[id].work[1]++;
		return;
	}
*/

	clientno_temp = ClientNo;
	ClientNo = TaskTable[id].work[0];
	//-- ﾎﾟｹﾓﾝ --//
	if(FightCheck() == 0)
	{	//1vs1
		ServerBuffer[ClientNo][1] = SelMonsNo[ClientNo];
		AIPokeAppearCommon(ClientNo, 0);	//ClientAIBSSPokeAppear();
	}
	else if(FightType&FIGHT_TYPE_4_2vs2)
	{	//2vs2 4人通信
		ServerBuffer[ClientNo][1] = SelMonsNo[ClientNo];
		AIPokeAppearCommon(ClientNo, 0);
	}
	else
	{	//2vs2
		ServerBuffer[ClientNo][1] = SelMonsNo[ClientNo];
		AIPokeAppearCommon(ClientNo, 0);	//ClientAIBSSPokeAppear();
		ClientNo ^= 2;
		ServerBuffer[ClientNo][1] = SelMonsNo[ClientNo];
		AIPokeAppearCommon(ClientNo, 0);	//ClientAIBSSPokeAppear();
		ClientNo ^= 2;	//変更したClientNoを元に戻す
	}

	ClientSequence[ClientNo] = ClientAIPokeSendOutWait;
	ClientNo = clientno_temp;
	DelTask(id);
}

//----------------------------------------------------------
//	トレーナー戦時のボールゲージを表示する
//----------------------------------------------------------

void	ClientAIBSSBallGaugeSet(void)
{
	BallGaugePara *bgp;
	
//フラグワークがtrueの時は、どっちサイドなのかチェックして、自分側のときは表示をしないようにする
	if(ServerBuffer[ClientNo][1]){
		if(MineEnemyCheck(ClientNo)==SIDE_MINE){
			ClientAIBitReset();
			return;
		}
	}
	CliSys[ClientNo].temoti_gauge_flg = 1;

	//-- ENEMY限定の処理 --//
	if(ServerBuffer[ClientNo][2]){	//初回の時は少し遅らせて出す
		if(CliSys[ClientNo].temoti_wait < ENEMY_TEMOTI_INIT_WAIT){
			CliSys[ClientNo].temoti_wait++;
			return;
		}
		CliSys[ClientNo].temoti_wait = 0;
	}

	bgp = (BallGaugePara*)&ServerBuffer[ClientNo][4];
	TemotiGauge[ClientNo] = TemotiBallPut(ClientNo, bgp, ServerBuffer[ClientNo][1], ServerBuffer[ClientNo][2]);
	CliSys[ClientNo].wait_work = 0;
	if(ServerBuffer[ClientNo][2]){	//ﾌﾗｸﾞが立っていたらｳｪｲﾄなし
		CliSys[ClientNo].wait_work = TEMOTI_BALL_WAIT+1;
	}
	ClientSequence[ClientNo] = ClientAIBallGaugeWait;
//	ClientAIBitReset();
}

static void ClientAIBallGaugeWait(void)
{
	if(CliSys[ClientNo].wait_work++ > TEMOTI_BALL_WAIT){
		CliSys[ClientNo].wait_work = 0;
		ClientAIBitReset();
	}
}

//----------------------------------------------------------
//	トレーナー戦時のボールゲージを非表示にする
//----------------------------------------------------------

void	ClientAIBSSBallGaugeOff(void)
{
	//-- 手持ちｹﾞｰｼﾞを消す --//
	if(CliSys[ClientNo].temoti_gauge_flg)
		TaskTable[TemotiGauge[ClientNo]].TaskAdrs = TemotiBallOff;
	ClientAIBitReset();
}

//----------------------------------------------------------
//	ゲージのゆれを止める
//----------------------------------------------------------

void ClientAIBSSGaugeYureStop(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//	ポケモンのVANISHをON/OFFする
//----------------------------------------------------------

void	ClientAIBSSVanishOnOff(void)
{
	if(ClientPokeExistCheck(ClientNo)){
		ActWork[PokemonStruct[ClientNo]].banish = ServerBuffer[ClientNo][1];
		PokeClientBanishMemory(ClientNo);
	}
	ClientAIBitReset();
}

//----------------------------------------------------------
//	戦闘エフェクトを出す
//----------------------------------------------------------

void	ClientAIBSSFightEffect(void)
{
	u8 eff_no;
	u16 monsno;

	if(ClientSEWait(ClientNo))
		return;
	
	eff_no = ServerBuffer[ClientNo][1];
	monsno = ServerBuffer[ClientNo][2] | (ServerBuffer[ClientNo][3]<<8);
	
	if(SetFightEffect(ClientNo, ClientNo, ClientNo, eff_no, monsno))
		ClientAIBitReset();
	else
		ClientSequence[ClientNo] = ClientAIFightEffWait;
}

//----------------------------------------------------------
//	通信待機画面を出す
//----------------------------------------------------------

void	ClientAIBSSTuushinWait(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//	記憶しているカーソル位置のクリア
//----------------------------------------------------------

void	ClientAIBSSCsrPosClear(void)
{
	ClientAIBitReset();
}

//----------------------------------------------------------
//	対戦終了を知らせる
//----------------------------------------------------------
void ClientAIBSSFightEnd(void)
{
	if((FightType&FIGHT_TYPE_TUUSHIN)&&((FightType&FIGHT_TYPE_OYA)==0)){
		sys.FieldBattleFlag=0;			//戦闘中Flagをおとす
		sys.pFirstProc=PushFirstProc;
		MainProcChange(sys.pReturnProc);
	}
	ClientAIBitReset();
}

//----------------------------------------------------------
//	ﾀﾞﾐｰ
//----------------------------------------------------------
void ClientAIBSSEndID(void)
{
//	ClientAIBitReset();
}

//----------------------------------------------------------
//			AIルーチン
//----------------------------------------------------------

//ほろびのうたカウンタチェック
u8	ClientAIHorobinoutaCheck(void)
{
	if((WazaKouka[ClientNo]&WAZAKOUKA_HOROBINOUTA)&&
	   (WKC[ClientNo].horobinoutacnt==0)){
		UserWork[AI_RESHUFFLE_SELNO+(ClientTypeGet(ClientNo)>>1)]=6;
		BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_POKE,0);
		return 1;
	}
	return 0;
}

//ふしぎなまもりチェック
u8	ClientAIHusiginamamoriCheck(void)
{
	int	i,j;
	u16	monsno;
	u16	wazano;
	u8	speabino;
	u8	clientno;
	u8	flag;

	if(FightType&FIGHT_TYPE_2vs2)
		return 0;

	if(PSP[ClientNoGet(BSS_CLIENT_MINE)].speabino==TOKUSYU_HUSIGINAMAMORI){
		clientno=ClientNoGet(BSS_CLIENT_MINE);
		for(i=0;i<4;i++){
			wazano=PSP[ClientNo].waza[i];
			if(wazano){
				flag=TypeCheckAct2(wazano,
								   PSP[clientno].monsno,
								   PSP[clientno].speabino);
				if(flag&WAZASTATUSFLAG_BATSUGUN)
					return 0;
			}
		}
		for(i=0;i<6;i++){
			if((PokeParaGet(&PokeParaEnemy[i],ID_hp)!=0)&&
			   (PokeParaGet(&PokeParaEnemy[i],ID_monsno_egg)!=0)&&
			   (PokeParaGet(&PokeParaEnemy[i],ID_monsno_egg)!=MONSNO_TAMAGO)&&
			   (i!=SelMonsNo[ClientNo])){
				monsno=PokeParaGet(&PokeParaEnemy[i],ID_monsno);
				if(PokeParaGet(&PokeParaEnemy[i],ID_speabi))
					speabino=PPD[monsno].speabi2;
				else
					speabino=PPD[monsno].speabi1;
				clientno=ClientNoGet(BSS_CLIENT_MINE);
				for(j=0;j<4;j++){
					wazano=PokeParaGet(&PokeParaEnemy[i],ID_waza1+j);
					if(wazano){
						flag=TypeCheckAct2(wazano,
										   PSP[clientno].monsno,
										   PSP[clientno].speabino);
						if(flag&WAZASTATUSFLAG_BATSUGUN){
							if((pp_rand()%3)<2){
								UserWork[AI_RESHUFFLE_SELNO+(ClientTypeGet(ClientNo)>>1)]=i;
								BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_POKE,0);
								return 1;
							}
						}
					}
				}
			}
		}
	}
	return 0;
}

//ダメージ技に対してHP回復する特性をもっているポケモンのチェック
u8	ClientAIHPRecoverTokusyuCheck(void)
{
	int	i;
	u8	no1,no2;
	u16	monsno;
	u8	speabino;
	u8	chkspeabino;

	if((ClientAIBatsugunCheck(1))&&(pp_rand()%3!=0))
		return 0;

	if((WazaNoHit[ClientNo]==0)||(WazaNoHit[ClientNo]==0xffff))
		return 0;
	if(WTD[WazaNoHit[ClientNo]].damage==0)
		return 0;

	if(FightType&FIGHT_TYPE_2vs2){
		no1=ClientNo;
		if(NoReshuffleClient&no2bittbl[ClientNoGet(ClientTypeGet(ClientNo)^2)])
			no2=ClientNo;
		else
			no2=ClientNoGet(ClientTypeGet(ClientNo)^2);
	}
	else{
		no1=ClientNo;
		no2=ClientNo;
	}

	if(WTD[WazaNoHit[ClientNo]].wazatype==FIRE_TYPE)
		chkspeabino=TOKUSYU_MORAIBI;
	else if(WTD[WazaNoHit[ClientNo]].wazatype==WATER_TYPE)
		chkspeabino=TOKUSYU_TYOSUI;
	else if(WTD[WazaNoHit[ClientNo]].wazatype==ELECTRIC_TYPE)
		chkspeabino=TOKUSYU_TIKUDEN;
	else
		return 0;

	if(PSP[ClientNo].speabino==chkspeabino)
		return 0;

	for(i=0;i<6;i++){
		if((PokeParaGet(&PokeParaEnemy[i],ID_hp)!=0)&&
		   (PokeParaGet(&PokeParaEnemy[i],ID_monsno_egg)!=0)&&
		   (PokeParaGet(&PokeParaEnemy[i],ID_monsno_egg)!=MONSNO_TAMAGO)&&
		   (i!=SelMonsNo[no1])&&(i!=SelMonsNo[no2])&&
		   (i!=UserWork[AFTER_RESHUFFLE_SELMONSNO+no1])&&
		   (i!=UserWork[AFTER_RESHUFFLE_SELMONSNO+no2])){
			monsno=PokeParaGet(&PokeParaEnemy[i],ID_monsno);
			if(PokeParaGet(&PokeParaEnemy[i],ID_speabi)){
				speabino=PPD[monsno].speabi2;
			}
			else
				speabino=PPD[monsno].speabi1;
			if((chkspeabino==speabino)&&(pp_rand()&1)){
				UserWork[AI_RESHUFFLE_SELNO+(ClientTypeGet(ClientNo)>>1)]=i;
				BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_POKE,0);
				return 1;
			}
		}
	}
	return 0;
}

//今出ているポケモンが眠っていてしぜんかいふくを持っている場合のチェック
u8		ClientAIShizenkaifukuCheck(void)
{
	if(((PSP[ClientNo].condition&CONDITION_NEMURI)==0)||
		(PSP[ClientNo].speabino!=TOKUSYU_SIZENKAIHUKU)||
		(PSP[ClientNo].hp<(PSP[ClientNo].hpmax/2)))
		return 0;

	if((WazaNoHit[ClientNo]==0)||(WazaNoHit[ClientNo]==0xffff)){
		if(pp_rand()&1){
			UserWork[AI_RESHUFFLE_SELNO+(ClientTypeGet(ClientNo)>>1)]=6;
			BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_POKE,0);
			return 1;
		}
	}
	if(WTD[WazaNoHit[ClientNo]].damage==0){
		if(pp_rand()&1){
			UserWork[AI_RESHUFFLE_SELNO+(ClientTypeGet(ClientNo)>>1)]=6;
			BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_POKE,0);
			return 1;
		}
	}

	if(ClientAIWazaKoukaCheck(WAZASTATUSFLAG_KOUKANAI,1))
		return 1;
	if(ClientAIWazaKoukaCheck(WAZASTATUSFLAG_IMAHITOTSU,1))
		return 1;

	if(pp_rand()&1){
		UserWork[AI_RESHUFFLE_SELNO+(ClientTypeGet(ClientNo)>>1)]=6;
		BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_POKE,0);
		return 1;
	}
	return 0;
}

//今出ているポケモンが効果抜群の技を持っている場合は交代しないチェック
//chkflagが1のとき持っているかしかチェックしない
u8	ClientAIBatsugunCheck(u8 chkflag)
{
	int	i;
	u8	flag;
	u8	clientno;
	u16	wazano;

	clientno=ClientNoGet(BSS_CLIENT_MINE);
	if((NoReshuffleClient&no2bittbl[clientno])==0){
		for(i=0;i<4;i++){
			wazano=PSP[ClientNo].waza[i];
			if(wazano){
				flag=TypeCheckAct2(wazano,
								   PSP[clientno].monsno,
								   PSP[clientno].speabino);
				if(flag&WAZASTATUSFLAG_BATSUGUN){
					if(chkflag)
						return 1;
					else{
						if(pp_rand()%10!=0)
							return 1;
					}
				}
			}
		}
	}
	if((FightType&FIGHT_TYPE_2vs2)==0)
		return 0;
	clientno=ClientNoGet(BSS_CLIENT_MINE2);
	if((NoReshuffleClient&no2bittbl[clientno])==0){
		for(i=0;i<4;i++){
			wazano=PSP[ClientNo].waza[i];
			if(wazano){
				flag=TypeCheckAct2(wazano,
								   PSP[clientno].monsno,
								   PSP[clientno].speabino);
				if(flag&WAZASTATUSFLAG_BATSUGUN){
					if(chkflag)
						return 1;
					else{
						if(pp_rand()%10!=0)
							return 1;
					}
				}
			}
		}
	}
	return 0;
}

//今出ているポケモンのステータスアップトータルが4以上は交代しないチェック
u8	ClientAIStatusUpCheck(void)
{
	int	i;
	u8	cnt;

	cnt=0;
	for(i=COND_HP;i<COND_MAX;i++){
		if(PSP[ClientNo].abiritycnt[i]>6)
			cnt+=PSP[ClientNo].abiritycnt[i]-6;
	}
	return (cnt>=4);
}


u8	ClientAIWazaKoukaCheck(u8 wazakouka,u8 kakuritu)
{
	int	i,j;
	u8	no1,no2;
	u16	monsno;
	u16	wazano;
	u8	speabino;
	u8	flag;

	if((WazaNoHit[ClientNo]==0)||
	   (WazaNoHit[ClientNo]==0xffff)||
	   (WazaNoAttackClient[ClientNo]==0xff))
		return 0;
	if(WTD[WazaNoHit[ClientNo]].damage==0)
		return 0;

	if(FightType&FIGHT_TYPE_2vs2){
		no1=ClientNo;
		if(NoReshuffleClient&no2bittbl[ClientNoGet(ClientTypeGet(ClientNo)^2)])
			no2=ClientNo;
		else
			no2=ClientNoGet(ClientTypeGet(ClientNo)^2);
	}
	else{
		no1=ClientNo;
		no2=ClientNo;
	}

	for(i=0;i<6;i++){
		if((PokeParaGet(&PokeParaEnemy[i],ID_hp)!=0)&&
		   (PokeParaGet(&PokeParaEnemy[i],ID_monsno_egg)!=0)&&
		   (PokeParaGet(&PokeParaEnemy[i],ID_monsno_egg)!=MONSNO_TAMAGO)&&
		   (i!=SelMonsNo[no1])&&(i!=SelMonsNo[no2])&&
		   (i!=UserWork[AFTER_RESHUFFLE_SELMONSNO+no1])&&
		   (i!=UserWork[AFTER_RESHUFFLE_SELMONSNO+no2])){
			monsno=PokeParaGet(&PokeParaEnemy[i],ID_monsno);
			if(PokeParaGet(&PokeParaEnemy[i],ID_speabi))
				speabino=PPD[monsno].speabi2;
			else
				speabino=PPD[monsno].speabi1;
			flag=TypeCheckAct2(WazaNoHit[ClientNo],monsno,speabino);
			if(flag&wazakouka){
				no1=WazaNoAttackClient[ClientNo];
				for(j=0;j<4;j++){
					wazano=PokeParaGet(&PokeParaEnemy[i],ID_waza1+j);
					if(wazano){
						flag=TypeCheckAct2(wazano,
										   PSP[no1].monsno,
										   PSP[no1].speabino);
						if(flag&WAZASTATUSFLAG_BATSUGUN){
							if((pp_rand()%kakuritu)==0){
								UserWork[AI_RESHUFFLE_SELNO+(ClientTypeGet(ClientNo)>>1)]=i;
								BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_POKE,0);
								return 1;
							}

						}
					}
				}
			}
		}
	}
	return 0;
}

//ポケモン入れ替えAI
u8	ClientAIPokeReshuffleAI(void)
{
	int	i;
	int	cnt;
	u8	no1,no2,selected;

	if((PSP[ClientNo].condition2&(CONDITION2_SHIME|CONDITION2_KUROIMANAZASHI))||
	   (WazaKouka[ClientNo]&WAZAKOUKA_NEWOHARU)||
	   (SpecialAbirityCheck(SPEABI_ENEMYHAVE_SPEABI,ClientNo,TOKUSYU_KAGEHUMI,0,0)||
	   (SpecialAbirityCheck(SPEABI_ENEMYHAVE_SPEABI,ClientNo,TOKUSYU_ARIZIGOKU,0,0))||
	  ((SpecialAbirityCheck(SPEABI_HAVE_SPEABI,0,TOKUSYU_ZIRYOKU,0,0))&&
	  ((PSP[ClientNo].type1==METAL_TYPE)||(PSP[ClientNo].type2==METAL_TYPE)))))
		return 0;

	cnt=0;
	if(FightType&FIGHT_TYPE_2vs2){
		no1=ClientNo;
		selected=6;
		if(NoReshuffleClient&no2bittbl[ClientNoGet(ClientTypeGet(ClientNo)^2)])
			no2=ClientNo;
		else
			no2=ClientNoGet(ClientTypeGet(ClientNo)^2);
	}
	else{
		no1=ClientNo;
		no2=ClientNo;
	}

	for(i=0;i<6;i++){
		if((PokeParaGet(&PokeParaEnemy[i],ID_hp)!=0)&&
		   (PokeParaGet(&PokeParaEnemy[i],ID_monsno_egg)!=0)&&
		   (PokeParaGet(&PokeParaEnemy[i],ID_monsno_egg)!=MONSNO_TAMAGO)&&
		   (i!=SelMonsNo[no1])&&(i!=SelMonsNo[no2])&&
		   (i!=UserWork[AFTER_RESHUFFLE_SELMONSNO+no1])&&
		   (i!=UserWork[AFTER_RESHUFFLE_SELMONSNO+no2]))
			cnt++;
	}
	if(cnt){
		if(ClientAIHorobinoutaCheck())
			return 1;
		if(ClientAIHusiginamamoriCheck())
			return 1;
		if(ClientAIHPRecoverTokusyuCheck())
			return 1;
		if(ClientAIShizenkaifukuCheck())
			return 1;
		if(ClientAIBatsugunCheck(0))
			return 0;
		if(ClientAIStatusUpCheck())
			return 0;
		if(ClientAIWazaKoukaCheck(WAZASTATUSFLAG_KOUKANAI,2))
			return 1;
		if(ClientAIWazaKoukaCheck(WAZASTATUSFLAG_IMAHITOTSU,3))
			return 1;
	}

	return 0;
}

//コマンド選択AI
void	ClientAICommandSelectAI(void)
{
	int	i;
	u8	no1,no2;

	if(FightType&FIGHT_TYPE_TRAINER){
		if(ClientAIPokeReshuffleAI()){
			if(UserWork[AI_RESHUFFLE_SELNO+(ClientTypeGet(ClientNo)>>1)]==6){
				if((i=ClientAIPokeSelectAI())==6){
					if((FightType&FIGHT_TYPE_2vs2)==0)
						no2=no1=ClientNoGet(BSS_CLIENT_ENEMY);
					else{
						no1=ClientNoGet(BSS_CLIENT_ENEMY);
						no2=ClientNoGet(BSS_CLIENT_ENEMY2);
						}
					for(i=0;i<6;i++){
						if((PokeParaGet(&PokeParaEnemy[i],ID_hp)!=0)&&
						   (i!=SelMonsNo[no1])&&(i!=SelMonsNo[no2])&&
						   (i!=UserWork[AFTER_RESHUFFLE_SELMONSNO+no1])&&
						   (i!=UserWork[AFTER_RESHUFFLE_SELMONSNO+no2]))
							break;
					}
				}
				UserWork[AI_RESHUFFLE_SELNO+(ClientTypeGet(ClientNo)>>1)]=i;
			}
			UserWork[AFTER_RESHUFFLE_SELMONSNO+ClientNo]=
				UserWork[AI_RESHUFFLE_SELNO+(ClientTypeGet(ClientNo)>>1)];
			return;
		}
#ifdef PM_DEBUG
		if((DebugFightFlag&DEBUG_FIGHT_NO_ITEM_AI)==0){
			if(ClientAIItemUseAI())
				return;
		}
#else
		if(ClientAIItemUseAI())
			return;
#endif
	}
	BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_FIGHT,0|((ClientNo^1)<<8));
}

static	void	ClientAIPokeAisyouCheck(u8 type,u8 type1,u8 type2,u8 *damage)
{
	int	i=0;

	while(TypeCheckTable[i]!=0xff){
		if(TypeCheckTable[i]==0xfe){		//みやぶるチェック
			i+=3;
			continue;
		}
		if(TypeCheckTable[i]==type){
			if(TypeCheckTable[i+1]==type1)
				damage[0]=damage[0]*TypeCheckTable[i+2]/10;
			if((TypeCheckTable[i+1]==type2)&&(type1!=type2))
				damage[0]=damage[0]*TypeCheckTable[i+2]/10;
		}
		i+=3;
	}
}

//ポケモン選択AI
u8		ClientAIPokeSelectAI(void)
{
	int	i,j;
	u8	clientno;
	u8	type1;
	u8	type2;
	u16	monsno;
	u16	wazano;
	u8	checkbit;
	u8	damage;
	u8	damagetmp;
	u8	topselmons=6;
	u8	no1,no2;

	if(FightType&FIGHT_TYPE_2vs2){
		no1=ClientNo;
		if(NoReshuffleClient&no2bittbl[ClientNoGet(ClientTypeGet(ClientNo)^2)])
			no2=ClientNo;
		else
			no2=ClientNoGet(ClientTypeGet(ClientNo)^2);
		clientno=pp_rand()&2;
		if(NoReshuffleClient&no2bittbl[clientno])
			clientno^=2;
	}
	else{
		clientno=ClientNoGet(BSS_CLIENT_MINE);
		no1=ClientNo;
		no2=ClientNo;
	}

	checkbit=0;
	while(checkbit!=0x3f){
		damagetmp=0;
		topselmons=6;
		for(i=0;i<6;i++){
			monsno=PokeParaGet(&PokeParaEnemy[i],ID_monsno);
			if((monsno!=0)&&
			   (PokeParaGet(&PokeParaEnemy[i],ID_hp)!=0)&&
			  ((checkbit&no2bittbl[i])==0)&&
			   (SelMonsNo[no1]!=i)&&
			   (SelMonsNo[no2]!=i)&&
			   (i!=UserWork[AFTER_RESHUFFLE_SELMONSNO+no1])&&
			   (i!=UserWork[AFTER_RESHUFFLE_SELMONSNO+no2])){
				type1=PPD[monsno].type1;
				type2=PPD[monsno].type2;
				damage=10;
				ClientAIPokeAisyouCheck(PSP[clientno].type1,
										type1,
										type2,
										&damage);
				ClientAIPokeAisyouCheck(PSP[clientno].type2,
										type1,
										type2,
										&damage);
				if(damagetmp<damage){
					damagetmp=damage;
					topselmons=i;
				}
			}
			else
				checkbit|=no2bittbl[i];
		}
		if(topselmons!=6){
			for(i=0;i<4;i++){
				wazano=PokeParaGet(&PokeParaEnemy[topselmons],ID_waza1+i);
				if(wazano){
					if(TypeCheckAct(wazano,ClientNo,clientno)&WAZASTATUSFLAG_BATSUGUN)
						break;
				}
			}
			if(i==4)
				checkbit|=no2bittbl[topselmons];
			else
				return topselmons;
		}
		else
			checkbit=0x3f;
	}

	DamagePowWork=0;
	UserWork[DAMAGE_TYPE_WORK]=0;
	UserWork[DAMAGE_VALUE]=1;
	WazaStatusFlag=0;
	CriticalValue=1;

	damagetmp=0;
	topselmons=6;

	for(i=0;i<6;i++){
		monsno=PokeParaGet(&PokeParaEnemy[i],ID_monsno);
		if((monsno!=0)&&
		   (PokeParaGet(&PokeParaEnemy[i],ID_hp)!=0)&&
		   (SelMonsNo[no1]!=i)&&(SelMonsNo[no2]!=i)&&
		   (i!=UserWork[AFTER_RESHUFFLE_SELMONSNO+no1])&&
		   (i!=UserWork[AFTER_RESHUFFLE_SELMONSNO+no2])){
			for(j=0;j<4;j++){
				wazano=PokeParaGet(&PokeParaEnemy[i],ID_waza1+j);
				WazaDamage=0;
				if((wazano)&&(WTD[wazano].damage!=1)){
					DamageCalcAct(ClientNo,clientno);
					TypeCheckAct(wazano,ClientNo,clientno);
				}
				if(damagetmp<WazaDamage){
					damagetmp=WazaDamage;
					topselmons=i;
				}
			}
		}
	}
	return topselmons;
}

extern	const u8 * const ItemPokeParmTbl[];

static	u8	ItemTypeGet(u8 itemno,u8 *adr)
{
	if(itemno==ITEM_KAIHUKUNOKUSURI)
		return	ITEMTYPE_KAIHUKUNOKUSURI;
	if(adr[4]&0x04)
		return	ITEMTYPE_HP_KAIHUKU;
	if(adr[3]&0x3f)
		return	ITEMTYPE_CONDITION_KAIHUKU;
	if((adr[0]&0x3f)||(adr[1])||(adr[2]))
		return	ITEMTYPE_ABIRITY_UP;
	if(adr[3]&0x80)
		return	ITEMTYPE_EFFECT_GUARD;

	return	ITEMTYPE_UNKOWN;
}

//アイテム使用AI
u8		ClientAIItemUseAI(void)
{
	int	i;
	u8	monscnt=0;
	u16	itemno;
	u8	para;
	u8	ret=0;
	u8	*adr;
	u8	dir;


	for(i=0;i<6;i++){
		if((PokeParaGet(&PokeParaEnemy[i],ID_hp)!=0)&&
		   (PokeParaGet(&PokeParaEnemy[i],ID_monsno_egg)!=0)&&
		   (PokeParaGet(&PokeParaEnemy[i],ID_monsno_egg)!=MONSNO_TAMAGO))
			monscnt++;
	}

	for(i=0;i<4;i++){
		if((i==0)||(monscnt<=AIWT2->AI_ITEMCNT-i+1)){
			itemno=AIWT2->AI_HAVEITEM[i];
			if(itemno==0)
				continue;
			if(ItemPokeParmTbl[itemno-ITEM_NORMAL_START]==NULL)
				continue;
			if(itemno==ITEM_NAZONOMI)
				adr=(u8 *)&Fld.RamSeed.item_param;
			else
				adr=(u8 *)ItemPokeParmTbl[itemno-ITEM_NORMAL_START];

			UserWork[AI_ITEM_TYPE+(ClientNo>>1)]=ItemTypeGet(itemno,adr);
			switch(UserWork[AI_ITEM_TYPE+(ClientNo>>1)]){
				case ITEMTYPE_KAIHUKUNOKUSURI:
					if((PSP[ClientNo].hp<(PSP[ClientNo].hpmax/4))&&
					   (PSP[ClientNo].hp))
						ret=1;
					break;
				case ITEMTYPE_HP_KAIHUKU:
					para=ItemParamPosGet(itemno,4,0x04);
					if(para==0)
						break;
					if((PSP[ClientNo].hp)&&
					  ((PSP[ClientNo].hp<(PSP[ClientNo].hpmax/4))||
					  ((PSP[ClientNo].hpmax-PSP[ClientNo].hp)>adr[para])))
						ret=1;
					break;
				case ITEMTYPE_CONDITION_KAIHUKU:
					UserWork[AI_ITEM_CONDITION+(ClientNo>>1)]=0;
					//眠り
					if(adr[3]&0x20){
						if(PSP[ClientNo].condition&CONDITION_NEMURI){
							UserWork[AI_ITEM_CONDITION+(ClientNo>>1)]|=0x20;
							ret=1;
						}
					}
					//毒
					if(adr[3]&0x10){
						if((PSP[ClientNo].condition&CONDITION_DOKU)||
						   (PSP[ClientNo].condition&CONDITION_DOKUDOKU)){
							UserWork[AI_ITEM_CONDITION+(ClientNo>>1)]|=0x10;
							ret=1;
						}
					}
					//火傷
					if(adr[3]&0x08){
						if(PSP[ClientNo].condition&CONDITION_YAKEDO){
							UserWork[AI_ITEM_CONDITION+(ClientNo>>1)]|=0x08;
							ret=1;
						}
					}
					//氷
					if(adr[3]&0x04){
						if(PSP[ClientNo].condition&CONDITION_KOORI){
							UserWork[AI_ITEM_CONDITION+(ClientNo>>1)]|=0x04;
							ret=1;
						}
					}
					//マヒ
					if(adr[3]&0x02){
						if(PSP[ClientNo].condition&CONDITION_MAHI){
							UserWork[AI_ITEM_CONDITION+(ClientNo>>1)]|=0x02;
							ret=1;
						}
					}
					//混乱
					if(adr[3]&0x01){
						if(PSP[ClientNo].condition2&CONDITION2_KONRAN){
							UserWork[AI_ITEM_CONDITION+(ClientNo>>1)]|=0x01;
							ret=1;
						}
					}
					break;
				case ITEMTYPE_ABIRITY_UP:
					UserWork[AI_ITEM_CONDITION+(ClientNo>>1)]=0;
					if(WKC[ClientNo].nekodamashicnt){
						if(adr[0]&0x0f)
							UserWork[AI_ITEM_CONDITION+(ClientNo>>1)]|=0x01;
						if(adr[1]&0xf0)
							UserWork[AI_ITEM_CONDITION+(ClientNo>>1)]|=0x02;
						if(adr[1]&0x0f)
							UserWork[AI_ITEM_CONDITION+(ClientNo>>1)]|=0x04;
						if(adr[2]&0x0f)
							UserWork[AI_ITEM_CONDITION+(ClientNo>>1)]|=0x08;
						if(adr[2]&0xf0)
							UserWork[AI_ITEM_CONDITION+(ClientNo>>1)]|=0x20;
						if(adr[0]&0x30)
							UserWork[AI_ITEM_CONDITION+(ClientNo>>1)]|=0x80;
						ret=1;
					}
					break;
				case ITEMTYPE_EFFECT_GUARD:
					dir=MineEnemyCheck(ClientNo);
					if((WKC[ClientNo].nekodamashicnt)&&
					   (SCC[dir].shiroikiricnt==0))
						ret=1;
					break;
				case ITEMTYPE_UNKOWN:
					return 0;
					break;
			}
			if(ret){
				BSS_SELECT_RETURN_SET(BSS_CLIENT,BSS_SELECT_RETURN_ITEM,0);
				UserWork[AI_ITEM_NO+(ClientNo>>1)*2]=itemno;
				AIWT2->AI_HAVEITEM[i]=0;
				return ret;
			}
		}
	}
	return 0;
}

