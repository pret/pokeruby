
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

void	ClientCLBitReset(void);	//範囲外の値の時の処理
void	ClientCLDummy(void);
void	ClientCLInit(void);
void	ClientCLCommandWait(void);
void	ClientCLPokeEncountWait(void);

void	ClientCLCommandSelect(void);
void	ClientCLWazaSelect(void);
void	ClientCLHpGaugeWait(void);
void	ClientCLPokeKizetsuWait(void);
void	ClientCLMessageWait(void);

void	ClientCLBSSPokeparaGet(void);
void	ClientCLBSSPokeparaGet2(void);
void	ClientCLBSSPokeparaPut(void);
void	ClientCLBSSPokeparaPut2(void);
void	ClientCLBSSPokeEncount(void);
void	ClientCLBSSPokeAppear(void);
void	ClientCLBSSPokeReturn(void);
void	ClientCLBSSTrainerEncount(void);
void	ClientCLBSSTrainerAppear(void);
void	ClientCLBSSTrainerReturn(void);
void	ClientCLBSSPokeKizetu(void);
void	ClientCLBSSZenmetsu(void);
void	ClientCLBSSGetSuccess(void);
void	ClientCLBSSGetFail(void);
void	ClientCLBSSPokeLevelUp(void);
void	ClientCLBSSWazaEffect(void);
void	ClientCLBSSMessage(void);
void	ClientCLBSSAlertMessage(void);
void	ClientCLBSSCommandSelect(void);
void	ClientCLBSSCommandSelectCopy(void);
void	ClientCLBSSWazaSelect(void);
void	ClientCLBSSItemSelect(void);
void	ClientCLBSSPokeSelect(void);
void	ClientCLBSSEscape(void);
void	ClientCLBSSHpGauge(void);
void	ClientCLBSSExpGauge(void);
void	ClientCLBSSStatusSet(void);
void	ClientCLBSSStatusEffect(void);
void	ClientCLBSSStatusClear(void);
void	ClientCLBSSDataTrans(void);
void	ClientCLBSSDataRamTrans(void);
void	ClientCLBSSBgmTrans(void);
void	ClientCLBSSVoiceTrans(void);
void	ClientCLBSSSelectReturn(void);
void	ClientCLBSSReshuffle(void);
void	ClientCLBSSUseItem(void);
void	ClientCLBSSUseBall(void);
void	ClientCLBSSLoopCountClear(void);
void	ClientCLBSSLoopCountSet(void);
void	ClientCLBSSSwitchFlagClear(void);
void	ClientCLBSSSwitchFlagSet(void);
void	ClientCLBSSPokeDamageBlink(void);
void	ClientCLBSSGaugeOff(void);
void	ClientCLBSSSEPlay(void);
void	ClientCLBSSMEPlay(void);
void	ClientCLBSSVoicePlay(void);
void	ClientCLBSSEncountEffect(void);
void	ClientCLBSSPokeSendOut(void);
void	ClientCLBSSBallGaugeSet(void);
void	ClientCLBSSBallGaugeOff(void);
void	ClientCLBSSGaugeYureStop(void);
void	ClientCLBSSVanishOnOff(void);
void	ClientCLBSSFightEffect(void);
void	ClientCLBSSTuushinWait(void);
void	ClientCLBSSCsrPosClear(void);
void	ClientCLBSSFightEnd(void);
void	ClientCLBSSEndID(void);

int		ClientCLBSSPokeparaGetAct(u8,u8 *);
void	ClientCLBSSPokeparaPutAct(u8);
static void CLPokeAppearCommon(u8 client_no, u8);
static void CLTrainerDelEnd(actWork *xreg);
static void CLSendOutTask(u8 id);
static void ClientCLWazaEffectSet(void);
static void ClientCLAppearMigawariEffWait(void);
static void ClientCLBallGaugeWait(void);
static void ClientCLPokeReturnMigawariChk(void);

extern	actHeader PokeFTbl[];
extern	TALK_WIN	FightMsg;
//extern	u8	FightMsgBuf[64];
extern SIOTRAINER_INFO SioTrainerInfo[4];


//----------------------------------------------------------
//	バトルサーバー命令群テーブル
//----------------------------------------------------------
const pFunc ClientCLBSSTbl[] =
{
	ClientCLBSSPokeparaGet,		// BSS_POKEPARA_GET=0,	
	ClientCLBSSPokeparaGet2,	   	// BSS_POKEPARA_GET2,	
	ClientCLBSSPokeparaPut,		// BSS_POKEPARA_PUT,	
	ClientCLBSSPokeparaPut2,		// BSS_POKEPARA_PUT2,	
	ClientCLBSSPokeEncount,		// BSS_POKEPARA_ENCOUNT,	add
	ClientCLBSSPokeAppear,		// BSS_POKE_APPEAR,	
	ClientCLBSSPokeReturn,		// BSS_POKE_RETURN,	
	ClientCLBSSTrainerEncount,	// BSS_TRAINER_ENCOUNT,	add
	ClientCLBSSTrainerAppear,		// BSS_TRAINER_APPEAR,	
	ClientCLBSSTrainerReturn,		// BSS_TRAINER_RETURN,	
	ClientCLBSSPokeKizetu,		// BSS_POKE_KIZETSU,	
	ClientCLBSSZenmetsu,			// BSS_POKE_ZENMETSU,	
	ClientCLBSSGetSuccess,		// BSS_GET_SUCCESS,	
	ClientCLBSSGetFail,			// BSS_GET_FAIL,		
	ClientCLBSSPokeLevelUp,		// BSS_POKE_LEVELUP,	
	ClientCLBSSWazaEffect,		// BSS_WAZA_EFFECT,	
	ClientCLBSSMessage,			// BSS_MESSAGE,		
	ClientCLBSSAlertMessage,	// BSS_ALERT_MESSAGE,		
								
	ClientCLBSSCommandSelect,		// BSS_COMMAND_SELECT, 

	ClientCLBSSCommandSelectCopy,		// BSS_COMMAND_SELECT_COPY, 

	ClientCLBSSWazaSelect,		// BSS_WAZA_SELECT,	
													
	ClientCLBSSItemSelect,		// BSS_ITEM_SELECT,	
													
	ClientCLBSSPokeSelect,		// BSS_POKE_SELECT,	
													
	ClientCLBSSEscape,			// BSS_ESCAPE,			
	ClientCLBSSHpGauge,			// BSS_HP_GAUGE,		
	ClientCLBSSExpGauge,			// BSS_EXP_GAUGE,		
	ClientCLBSSStatusSet,			// BSS_STATUS_SET,		
	ClientCLBSSStatusEffect,			// BSS_STATUS_EFFECT,		
	ClientCLBSSStatusClear,		// BSS_STATUS_CLEAR,	
	ClientCLBSSDataTrans,			// BSS_DATA_TRANS,		
	ClientCLBSSDataRamTrans,		// BSS_DATA_RAM_TRANS,	
													
	ClientCLBSSBgmTrans,			// BSS_BGM_TRANS,		
	ClientCLBSSVoiceTrans,		// BSS_VOICE_TRANS,	
	ClientCLBSSSelectReturn,		// BSS_SELECT_RETURN,	
	ClientCLBSSReshuffle,			// BSS_POKE_RESHUFFLE,	
	ClientCLBSSUseItem,			// BSS_USE_ITEM,		
	ClientCLBSSUseBall,			// BSS_USE_BALL,		
	ClientCLBSSLoopCountClear,	//	BSS_LOOPCOUNT_CLEAR
	ClientCLBSSLoopCountSet,	//	BSS_LOOPCOUNT_SET
	ClientCLBSSSwitchFlagClear,	//	BSS_SWITCHFLAG_CLEAR
	ClientCLBSSSwitchFlagSet,	//	BSS_SWITCHFLAG_SET
	ClientCLBSSPokeDamageBlink,	// BSS_POKEDAMAGE_BLINK,
	ClientCLBSSGaugeOff,		// BSS_GAUGE_OFF,
	ClientCLBSSSEPlay,			// BSS_SE_PLAY,
	ClientCLBSSMEPlay,			// BSS_SE_PLAY,
	ClientCLBSSVoicePlay,			// BSS_VOICE_PLAY,
	ClientCLBSSEncountEffect,	// BSS_ENCOUNT_EFFECT,
	ClientCLBSSPokeSendOut,		// BSS_POKE_SENDOUT,
	ClientCLBSSBallGaugeSet,	// BSS_BALL_GAUGE_SET,
	ClientCLBSSBallGaugeOff,	// BSS_BALL_GAUGE_OFF,
	ClientCLBSSGaugeYureStop,	// BSS_BALL_GAUGE_OFF,
	ClientCLBSSVanishOnOff,		// BSS_VANISH_OFF,
	ClientCLBSSFightEffect,		// BSS_FIGHT_EFFECT,
	ClientCLBSSTuushinWait,		// BSS_TUUSHIN_WAIT,
	ClientCLBSSCsrPosClear,		// BSS_CSRPOS_CLEAR,
	ClientCLBSSFightEnd,		// BSS_FIGHT_END,

	ClientCLBSSEndID,				// BSS_END_ID,		いらないけど一応
};

//----------------------------------------------------------
//	プロトタイプ宣言	関数＆ﾃﾞｰﾀ
//----------------------------------------------------------

#define	CAI_LVNUM_X			84
#define	CAI_LVNUM_Y			28

//==============================================================
//                       メインルーチン
//==============================================================

void	ClientCLDummy(void)
{
}

void	ClientCLInit(void)
{
	ClientSequence[ClientNo]=ClientCLCommandWait;

#if 0	//分割転送用に一つにまとめた
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

void	ClientCLCommandWait(void)
{
	if((ClientBit&no2bittbl[ClientNo]) != 0)
	{
		if(ServerBuffer[ClientNo][0] <= BSS_END_ID)// && ServerBuffer[ClientNo][0] > -1)
		{
			ClientCLBSSTbl[ServerBuffer[ClientNo][0]]();
		}
		else
		{
			ClientCLBitReset();	//範囲外の値の時の処理
		}
	}
}

//=========================================================================
//	ウェイトルーチン
//=========================================================================
//
void ClientCLTrainerEncountWait(void)
{
	if(ActWork[PokemonStruct[ClientNo]].move == DummyActMove)
	{
		//DelActor(&ActWork[PokemonStruct[ClientNo]]);
		ClientCLBitReset();
	}
}

void ClientCLTrainerReturnWait(void)
{
#if 0
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
		
		ClientCLBitReset();
	}
}

void ClientCLSendOutWaitBitReset(void)
{
	if(CliSys[ClientNo].send_out_wait-- == 0){
		CliSys[ClientNo].send_out_wait = 0;
		ClientCLBitReset();
	}
}

void ClientCLSendOutGaugeWait(void)
{
#if 0	//2002.05.02(木)
	if(ActWork[ClientGaugeSt[ClientNo]].move == DummyActMove
		&& ActWork[ClientGaugeSt[ClientNo^2]].move == DummyActMove)
	{
		ClientCLBitReset();
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
		if(ClientTypeGet(ClientNo) == BSS_CLIENT_ENEMY){
			if(CliSys[ClientNo].rare_eff_end && CliSys[ClientNo^2].rare_eff_end){
				CliSys[ClientNo].rare_eff = 0;
				CliSys[ClientNo].rare_eff_end = 0;
				CliSys[ClientNo^2].rare_eff = 0;
				CliSys[ClientNo^2].rare_eff_end = 0;
				CellDel(WAZACHR_ID_SHOOTINGSTAR);
				ObjPalRegNumDel(WAZACHR_ID_SHOOTINGSTAR);
			}
			else
				return;
		}
		
		if(FightType&FIGHT_TYPE_4_2vs2){
			if(ClientTypeGet(ClientNo) == BSS_CLIENT_ENEMY){
				m4aMPlayContinue(&m4a_mplay000);
			}
		}
		else
			m4aMPlayVolumeControl(&m4a_mplay000,0xffff,256);
//		ClientCLBitReset();
		CliSys[ClientNo].send_out_wait = 3;
		ClientSequence[ClientNo] = ClientCLSendOutWaitBitReset;
	}
#endif
}

void ClientCLPokeSendOutWait(void)
{
//	if(ActWork[ClientStruct[ClientNo]].move == DummyActMove)	//2個同時に投げてるので1個だけﾁｪｯｸしておけば問題ないかと

	if(CliSys[ClientNo].ball_eff_wait == 0 && CliSys[ClientNo].rare_eff == 0)
		RareEffectCheckSet(ClientNo, &PokeParaEnemy[SelMonsNo[ClientNo]]);
	if(CliSys[ClientNo^2].ball_eff_wait == 0 && CliSys[ClientNo^2].rare_eff == 0)
		RareEffectCheckSet(ClientNo^2, &PokeParaEnemy[SelMonsNo[ClientNo^2]]);

	if(CliSys[ClientNo].ball_eff_wait == 0 && CliSys[ClientNo^2].ball_eff_wait == 0)
	{
		if((FightType & FIGHT_TYPE_4_2vs2) && ClientTypeGet(ClientNo) == BSS_CLIENT_ENEMY2){
			if(CliSys[ClientNo].send_out_wait++ == 0)
				return;
			CliSys[ClientNo].send_out_wait = 0;
		}

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
		
		DelActor(&ActWork[ClientStruct[ClientNo]]);		//ｴﾌｪｸﾄ監視ｱｸﾀｰDEL
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
		
//		ClientCLBitReset();
		BtlWork->sendout_eff = 0;
		ClientSequence[ClientNo] = ClientCLSendOutGaugeWait;
	}
}

void	ClientCLPokeEncountWait(void)
{
#if 0
	if((ActWork[PokemonStruct[ClientNo]].anmend_sw==1)&&
	(ActWork[PokemonStruct[ClientNo]].dx==0)){
//		ClientBit&=(no2bittbl[ClientNo]^0xffffffff);
//		ClientSequence[ClientNo]=ClientCLCommandWait;
		ClientCLBitReset();
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
			ClientCLBitReset();
		}
	}
#endif
}

void	ClientCLHpGaugeWait(void)
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
		ClientCLBitReset();
	}
}


void	ClientCLPokeKizetsuWait(void)
{
	if(ActWork[PokemonStruct[ClientNo]].act_sw==0){
//		ClientBit&=(no2bittbl[ClientNo]^0xffffffff);
//		ClientSequence[ClientNo]=ClientCLCommandWait;
		GaugeOFF(ClientGaugeSt[ClientNo]);
		ClientCLBitReset();
	}
}

void ClientCLPokeReturnWait(void)
{
	if(CliSys[ClientNo].etc_eff == 0)
	{
		AffineDelActor(&ActWork[PokemonStruct[ClientNo]]);
		DelActor(&ActWork[PokemonStruct[ClientNo]]);
		
		PokeShadowBanishSeqSet(ClientNo);

		GaugeOFF(ClientGaugeSt[ClientNo]);
		ClientCLBitReset();
	}
}

void	ClientCLMessageWait(void)
{
	if(FightMsg.status==MSG_END){
//		ClientBit&=(no2bittbl[ClientNo]^0xffffffff);
//		ClientSequence[ClientNo]=ClientCLCommandWait;
		ClientCLBitReset();
	}
}

#if 0	//del by matsuda 2002.07.22(月)
void	ClientCLWazaEffectWait(void)
{
	WazaEffectSequence();
	if(WazaEffectFlag==0){
		ClientCLBitReset();
	}
}
#endif

void ClientCLPokeDamageBlinkWait(void)
{
	u8 pokeact;
	
	pokeact = PokemonStruct[ClientNo];
	if(ActWork[pokeact].work[1] == DAMAGE_BLINK_WAIT)
	{
		ActWork[pokeact].work[1] = 0;
		ActWork[pokeact].banish = 0;
		ClientEffectWait = 0;	//Blinkｴﾌｪｸﾄ、フラグをﾘｾｯﾄ
		ClientCLBitReset();
	}
	else
	{
		if(ActWork[pokeact].work[1] % BLINK_INTERVAL == 0)
			ActWork[pokeact].banish ^= 1;
		ActWork[pokeact].work[1]++;
	}
}

void ClientCLGaugeAppearWait(void)
{
	if(ActWork[ClientGaugeSt[ClientNo]].move == DummyActMove){
		//身代わりチェック
		if(Climem[ClientNo].migawari)
			SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_MIGAWARI_IN);
		ClientSequence[ClientNo] = ClientCLAppearMigawariEffWait;
	}
}

static void ClientCLAppearMigawariEffWait(void)
{
	if(CliSys[ClientNo].etc_eff == 0){
		AddTask(VoiceCheckTask, 10);
		ClientCLBitReset();
	}
}

void ClientCLPokeAppearWaitSub(void)
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
//		ClientCLBitReset();
		ClientSequence[ClientNo] = ClientCLGaugeAppearWait;
	}
}
void ClientCLPokeAppearWait(void)
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

		ClientSequence[ClientNo] = ClientCLPokeAppearWaitSub;
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

//----------------------------------------------------------
//	ｽﾃｰﾀｽ異常ｴﾌｪｸﾄ終了待ち
//----------------------------------------------------------
void ClientCLStatusEffWait(void)
{
	if(CliSys[ClientNo].status_eff == 0)
		ClientCLBitReset();
}

//----------------------------------------------------------
//	戦闘ｴﾌｪｸﾄ終了待ち
//----------------------------------------------------------
void ClientCLFightEffWait(void)
{
	if(CliSys[ClientNo].fight_eff == 0)
		ClientCLBitReset();
}


//==============================================================
//                       サブルーチン
//==============================================================

void ClientCLBitReset(void)
{
	u8	id;

	ClientSequence[ClientNo] = ClientCLCommandWait;
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

//==============================================================
//	クライアント命令関数
//==============================================================

//----------------------------------------------------------
//	指定したﾎﾟｹﾓﾝﾃﾞｰﾀを取得する
//----------------------------------------------------------

void	ClientCLBSSPokeparaGet(void)
{
	u8 temp[256];
	int	length=0;
	int	i;
	u8	flag;

	if(ServerBuffer[ClientNo][2] == 0){
		length+=ClientCLBSSPokeparaGetAct(SelMonsNo[ClientNo],&temp[length]);
	}
	else{
		flag = ServerBuffer[ClientNo][2];
		for(i=0;i<6;i++){
			if((flag&1)!=0){
				length+=ClientCLBSSPokeparaGetAct(i,&temp[length]);
			}
			flag=flag>>1;
		}
	}
	BSS_DATA_TRANS_SET(BSS_CLIENT,length,(u8 *)&temp);
	ClientCLBitReset();
}

int	ClientCLBSSPokeparaGetAct(u8 SelectNo,u8 *temp)
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
void ClientCLBSSPokeparaGet2(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	指定したﾎﾟｹﾓﾝﾃﾞｰﾀを変更する
//----------------------------------------------------------

void ClientCLBSSPokeparaPut(void)
{
	u8	i,flag;

	if(ServerBuffer[ClientNo][2] == 0){
		ClientCLBSSPokeparaPutAct(SelMonsNo[ClientNo]);
	}
	else{
		flag = ServerBuffer[ClientNo][2];
		for(i=0;i<6;i++){
			if((flag&1)!=0){
				ClientCLBSSPokeparaPutAct(i);
			}
			flag=flag>>1;
		}
	}
	ClientCLBitReset();
}

void ClientCLBSSPokeparaPutAct(u8 SelectNo)
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
void ClientCLBSSPokeparaPut2(void)
{
	u8 *pPP;
	u8 i;
	
	pPP = ((u8 *)(&PokeParaEnemy[SelMonsNo[ClientNo]])) + ServerBuffer[ClientNo][1];
	for(i = 0; i < ServerBuffer[ClientNo][2]; i++)
	{
		pPP[i] = ServerBuffer[ClientNo][3+i];
	}

	ClientCLBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ登場ｴﾌｪｸﾄを起動する(ｴﾝｶｳﾝﾄ時)
//----------------------------------------------------------

extern const u8 PokeEnemyPosX[2][2];
extern const u8 PokeEnemyPosY[2][2];

void ClientCLBSSPokeEncount(void)
{
	u16	monsno;

	monsno=PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]],ID_monsno);

	PokemonFObjCellPalSet(&PokeParaEnemy[SelMonsNo[ClientNo]], ClientNo);
	//PokeActHeaderMake(PokeParaEnemy[SelMonsNo[ClientNo]].PPP.monsno,ClientNo);
	PokeActHeaderMake(monsno,ClientTypeGet(ClientNo));	//変更 by matsuda 2001.09.26(水)
#if 0
	PokemonStruct[ClientNo]=AddActor(&PokeActHeader,
//		PokeEnemyPosX[FightType][ClientNo>>1],
//		PokeEnemyPosY[FightType][ClientNo>>1]+4*(8-pm2fpara[PokeParaEnemy[SelMonsNo[ClientNo]].PPP.monsno].size),
//		changed by soga 2001.09.26
		PokeEnemyPosX[FightType&FIGHT_TYPE_2vs2][ClientTypeGet(ClientNo)>>1],
//		PokeEnemyPosY[FightType&FIGHT_TYPE_2vs2][ClientTypeGet(ClientNo)>>1]+4*(8-pm2fpara[PokeParaEnemy[SelMonsNo[ClientNo]].PPP.monsno].size),
		PokeEnemyPosY[FightType&FIGHT_TYPE_2vs2][ClientTypeGet(ClientNo)>>1]+pm2fpara[PokeParaEnemy[SelMonsNo[ClientNo]].PPP.monsno].patcnt,
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

	//影をｾｯﾄ
	PokeShadowSeqSet(ClientNo, 
		PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]], ID_monsno));

	ClientSequence[ClientNo]=ClientCLPokeEncountWait;
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ登場ｴﾌｪｸﾄを起動する(ﾎﾞｰﾙから飛び出す)
//----------------------------------------------------------
void ClientCLBSSPokeAppear(void)
{
	SelMonsNo[ClientNo] = ServerBuffer[ClientNo][1];
	CLPokeAppearCommon(ClientNo, ServerBuffer[ClientNo][2]);

//	ClientCLBitReset();
	ClientSequence[ClientNo] = ClientCLPokeAppearWait;
}

//-- PokeAppear、SendOut共通処理 --//
static void CLPokeAppearCommon(u8 client_no, u8 baton_flg)
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
//							4*(8-pm2fpara[PokeParaGet(&PokeParaEnemy[SelMonsNo[client_no]],ID_monsno)].size),
							pm2fpara[PokeParaGet(&PokeParaEnemy[SelMonsNo[client_no]],ID_monsno)].patcnt,
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
		MBSmokeSet(PokeEnemyPosX[FightCheck()][client_no>>1], PokeEnemyPosY[FightCheck()][ClientTypeGet(client_no)>>1]+20, 1);
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
void ClientCLBSSPokeReturn(void)
{
	if(ServerBuffer[ClientNo][1] == 0)
	{
		CliSys[ClientNo].WazaEffSeqNo = 0;
		ClientSequence[ClientNo] = ClientCLPokeReturnMigawariChk;
//		SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_POKERETURN_ENEMY);
//		ClientSequence[ClientNo] = ClientCLPokeReturnWait;
	}
	else
	{
		AffineDelActor(&ActWork[PokemonStruct[ClientNo]]);
		DelActor(&ActWork[PokemonStruct[ClientNo]]);
		PokeShadowBanishSeqSet(ClientNo);
		GaugeOFF(ClientGaugeSt[ClientNo]);
		ClientCLBitReset();
	}
}

enum{
	CL_RET_MIGAWARICHK,
	CL_RET_POKERETURN,
};
static void ClientCLPokeReturnMigawariChk(void)
{
	switch(CliSys[ClientNo].WazaEffSeqNo){
		case CL_RET_MIGAWARICHK:
			if(Climem[ClientNo].migawari == 1)	//「みがわり」チェック
				SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_MIGAWARI_OUT);
			CliSys[ClientNo].WazaEffSeqNo = CL_RET_POKERETURN;
			break;
		case CL_RET_POKERETURN:					//技エフェクトセット
			if(CliSys[ClientNo].etc_eff)
				break;
			CliSys[ClientNo].WazaEffSeqNo = 0;
			SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_POKERETURN_ENEMY);
			ClientSequence[ClientNo] = ClientCLPokeReturnWait;
			break;
	}
}

//----------------------------------------------------------
//	ﾄﾚｰﾅｰ登場ｴﾌｪｸﾄを起動する(ｴﾝｶｳﾝﾄ時)
//----------------------------------------------------------
#define TRAINER_IN_DX	(-200)		//ｲﾝしてくるときの初期DX ※必ずTRAINER_IN_SPの倍数であること
#define TRAINER_IN_SP	4	//ｲﾝしてくるときのｽﾋﾟｰﾄﾞ

void ClientCLBSSTrainerEncount(void)
{
	int	no;
	s16	ofsx;
//	if(ServerStatusFlag&SERVER_STATUS_FLAG_WAIT)
//		ServerStatusFlag&=SERVER_STATUS_FLAG_WAIT_OFF;
//	else{
//
	if(FightType&FIGHT_TYPE_4_2vs2){
		if(ClientTypeGet(ClientNo)&2)
			ofsx=-16;
		else
			ofsx=16;
		no=SioTrainerInfo[GetTeamPosID(ClientNo)].sex;
	}
	else{
		ofsx=0;
		no=SioTrainerInfo[GetSioConnectId()^1].sex;
	}

	TrainerFObjCellPalSet(no, ClientNo);

//	PokeActHeaderMake(no+500,ClientTypeGet(ClientNo));
	TrainerActHeaderMake(no,ClientTypeGet(ClientNo));
	PokemonStruct[ClientNo] = AddActor(&PokeActHeader,
							CAI_POKE_X+ofsx,
							CAI_POKE_Y+4*(8-trfpara[no].size),
							//C_TRN_PRI);	//ﾄﾚｰﾅｰ
							GetPokeSoftPri(ClientNo));

//	ActWork[PokemonStruct[ClientNo]].oamData.Pltt = ClientNo;
	ActWork[PokemonStruct[ClientNo]].dx = -ENCOUNT_DX;
	ActWork[PokemonStruct[ClientNo]].work[0] = ENCOUNT_SPEED;
	ActWork[PokemonStruct[ClientNo]].oamData.Pltt 
		= ObjPalNumGet(TRFObjDataPal[no].reg_num);
	ActWork[PokemonStruct[ClientNo]].work[5]	//転送型なのでDelする時にCharNoを
		= ActWork[PokemonStruct[ClientNo]].oamData.CharNo;	//戻す必要がある
	ActWork[PokemonStruct[ClientNo]].oamData.CharNo
		= CellCharNumGet(TRFObjDataCell[no].act_num);
	ActWork[PokemonStruct[ClientNo]].oamData.AffineParam = no;
	ActWork[PokemonStruct[ClientNo]].move = CAS_TrainerSlideIn;
	
	ClientSequence[ClientNo] = ClientCLTrainerEncountWait;
//	}
}

//----------------------------------------------------------
//	ﾄﾚｰﾅｰ登場ｴﾌｪｸﾄを起動する(対戦終了後)
//----------------------------------------------------------
void ClientCLBSSTrainerAppear(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	ﾄﾚｰﾅｰを戻すｴﾌｪｸﾄを起動する
//----------------------------------------------------------

#define	TRAINER_OUT_SP2	4

void ClientCLBSSTrainerReturn(void)
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
	ClientSequence[ClientNo] = ClientCLTrainerReturnWait;
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝが気絶するｴﾌｪｸﾄを起動する
//----------------------------------------------------------
void ClientCLBSSPokeKizetu(void)
{
#if 0	//2002.09.03(火)
	SePlayPan(SE_POKE_DEAD, WAZA_SE_R);
	ActWork[PokemonStruct[ClientNo]].move=SeqEnemyPokeKizetsuInit;
	ClientSequence[ClientNo]=ClientCLPokeKizetsuWait;
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
			ClientSequence[ClientNo]=ClientCLPokeKizetsuWait;
			break;
	}
#endif
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝが全滅したときのｴﾌｪｸﾄを起動する
//----------------------------------------------------------
void ClientCLBSSZenmetsu(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ捕獲成功のｴﾌｪｸﾄを出す
//----------------------------------------------------------
void ClientCLBSSGetSuccess(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ捕獲失敗のｴﾌｪｸﾄを出す
//----------------------------------------------------------
void ClientCLBSSGetFail(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝﾚﾍﾞﾙｱｯﾌﾟのｴﾌｪｸﾄを出す
//----------------------------------------------------------
void ClientCLBSSPokeLevelUp(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	指定した技ﾅﾝﾊﾞｰのｴﾌｪｸﾄを出す
//----------------------------------------------------------
#if 0	// 2002.07.22(月)
void ClientCLBSSWazaEffect(void)
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
		ClientCLBitReset();
		return;
	}

	if(FightCheck() && (AttackClient^2) == DefenceClient && WazaDamage > 0)
		wazano = WAZANO_MAX+1;	//味方への攻撃ならば、簡易的なｴﾌｪｸﾄを出す
	
	WazaEffectSet(wazano);
	ClientSequence[ClientNo] = ClientCLWazaEffectWait;
}
#else
enum{
	CL_MIGAWARI_CHK,
	CL_EFF_PUTCHK,
	CL_EFF_WAIT,
	CL_EFF_END,
};
void ClientCLBSSWazaEffect(void)
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
		ClientCLBitReset();
		return;
	}
	
	CliSys[ClientNo].WazaEffSeqNo = CL_MIGAWARI_CHK;
	ClientSequence[ClientNo] = ClientCLWazaEffectSet;
}

static void ClientCLWazaEffectSet(void)
{
	u16 wazano;
	u8 renzoku_cnt;
	
	wazano = ServerBuffer[ClientNo][1] | (ServerBuffer[ClientNo][2] << 8);
	renzoku_cnt = ServerBuffer[ClientNo][11];	//0:ﾉｰﾏﾙ 1:連続技終了 2:連続技中
	
	switch(CliSys[ClientNo].WazaEffSeqNo){
		case CL_MIGAWARI_CHK:	//「みがわり」チェック
			if(Climem[ClientNo].migawari == 1 && Climem[ClientNo].migawari_out == 0){
				Climem[ClientNo].migawari_out = 1;
				SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_MIGAWARI_OUT);
			}
			CliSys[ClientNo].WazaEffSeqNo = CL_EFF_PUTCHK;
			break;
		case CL_EFF_PUTCHK:					//技エフェクトセット
			if(CliSys[ClientNo].etc_eff)
				break;
			
//			if(FightCheck() && (AttackClient^2) == DefenceClient && WazaDamage > 0)
//				wazano = WAZANO_MAX+1;	//味方への攻撃ならば、簡易的なｴﾌｪｸﾄを出す

			PokeAffineON_OFF(0);
			WazaEffectSet(wazano);
			CliSys[ClientNo].WazaEffSeqNo = CL_EFF_WAIT;
			break;
		case CL_EFF_WAIT:					//技エフェクト終了待ち
			WazaEffectSequence();
			if(WazaEffectFlag==0){
				PokeAffineON_OFF(1);
				if(Climem[ClientNo].migawari && renzoku_cnt <= 1){	//身代わりチェック
					SetEtcEffect(ClientNo, ClientNo, ClientNo, FE_ID_MIGAWARI_IN);
					Climem[ClientNo].migawari_out = 0;
				}
				CliSys[ClientNo].WazaEffSeqNo = CL_EFF_END;
			}
			break;
		case CL_EFF_END:
			if(CliSys[ClientNo].etc_eff)
				break;

			//ｴﾌｪｸﾄで操作されたﾊﾞﾆｯｼｭﾌﾗｸﾞを画面切り替え時の為、記憶する
			PokeBanishMemory();
			wazano = ServerBuffer[ClientNo][1] | (ServerBuffer[ClientNo][2] << 8);
			MigawariFlgCheckSet(ClientNo, wazano);
			CliSys[ClientNo].WazaEffSeqNo = 0;
			ClientCLBitReset();
			break;
	}
}
#endif

//----------------------------------------------------------
//	送ったﾃﾞｰﾀを文字ﾃﾞｰﾀと解釈してﾒｯｾｰｼﾞ表示する
//----------------------------------------------------------
#if 0
void ClientCLBSSMessage(void)
{
#if 1
	ScrX0=0;
	ScrY0=0;
//	MsgPutSet(&FightMsg,&ServerBuffer[ClientNo][2],0x10,1,15);
//	TalkMsgSet(&FightMsg,&ServerBuffer[ClientNo][2],CGX_START+0x10,2,15);
	FightMsgCreate((u8 *)&ServerBuffer[ClientNo][2]);
	TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
	ClientSequence[ClientNo] = ClientCLMessageWait;
#else
//かなしばりとか、いちゃもんとかのアラートメッセージを出さないようにする
	ClientCLBitReset();
#endif
}
#else
void ClientCLBSSMessage(void)
{
	u16	*MsgID;

	ScrX0=0;
	ScrY0=0;

	MsgID=(u16 *)&ServerBuffer[ClientNo][2];
	FightMsgID(MsgID[0]);
	TalkMsgSet(&FightMsg,FightMsgBuf,CGX_START+0x10,2,15);
	ClientSequence[ClientNo] = ClientCLMessageWait;
}
#endif

//----------------------------------------------------------
//	送ったﾃﾞｰﾀを文字ﾃﾞｰﾀと解釈してﾒｯｾｰｼﾞ表示する
//----------------------------------------------------------

void ClientCLBSSAlertMessage(void)
{
//	if(MineEnemyCheck(ClientNo)==SIDE_MINE)
//		ClientCLBSSMessage();
//	else
		ClientCLBitReset();
}

//----------------------------------------------------------
//	ｺﾏﾝﾄﾞ選択ｳｨﾝﾄﾞｳを表示して、選択ｼｰｹﾝｽを作動させる
//----------------------------------------------------------
void ClientCLBSSCommandSelect(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	指定されたClientNoのシーケンスナンバーと同期をとる
//----------------------------------------------------------
void ClientCLBSSCommandSelectCopy(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	技選択ｳｨﾝﾄﾞｳを表示して、選択ｼｰｹﾝｽを作動させる
//----------------------------------------------------------
void ClientCLBSSWazaSelect(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	ｱｲﾃﾑ選択ｳｨﾝﾄﾞｳを表示して、選択ｼｰｹﾝｽを作動させる
//----------------------------------------------------------
void ClientCLBSSItemSelect(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ選択ｳｨﾝﾄﾞｳを表示して、選択ｼｰｹﾝｽを作動させる
//----------------------------------------------------------
void ClientCLBSSPokeSelect(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	逃げるｴﾌｪｸﾄを起動する
//----------------------------------------------------------
void ClientCLBSSEscape(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	HPｹﾞｰｼﾞを増減する
//----------------------------------------------------------
void	ClientCLBSSHpGauge(void)
{
	s16 beHP;	//増減する値

	BattleGaugeTransWram(0);
	beHP = ServerBuffer[ClientNo][2] | (ServerBuffer[ClientNo][3] << 8);
	if(beHP!=JIBAKU_HP)
		GaugeDataSet(ClientNo, ClientGaugeSt[ClientNo],
		PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]],ID_hpmax),
		PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]],ID_hp), beHP);
	else
		GaugeDataSet(ClientNo, ClientGaugeSt[ClientNo],
		PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]],ID_hpmax),
		0,beHP);
	ClientSequence[ClientNo] = ClientCLHpGaugeWait;
}

//----------------------------------------------------------
//	EXPｹﾞｰｼﾞを増減する
//----------------------------------------------------------
void ClientCLBSSExpGauge(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	指定されたｽﾃｰﾀｽ異常ｴﾌｪｸﾄを起動する
//----------------------------------------------------------
void ClientCLBSSStatusSet(void)
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

	ClientSequence[ClientNo] = ClientCLStatusEffWait;
}

void ClientCLBSSStatusEffect(void)
{
	u32 condition;
	u8 condition_flg;

	if(ClientSEWait(ClientNo))
		return;
	
	condition_flg = ServerBuffer[ClientNo][1];
	condition = ServerBuffer[ClientNo][2] | (ServerBuffer[ClientNo][3]<<8) | 
				(ServerBuffer[ClientNo][4]<<16) | (ServerBuffer[ClientNo][5]<<24);
	ClientStatusEffSet(condition_flg, condition);
	ClientSequence[ClientNo] = ClientCLStatusEffWait;
}

//----------------------------------------------------------
//	指定されたｽﾃｰﾀｽ異常をｸﾘｱする
//----------------------------------------------------------
void ClientCLBSSStatusClear(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	あらかじめ用意されたﾊﾞｯﾌｧにﾃﾞｰﾀを格納する
//----------------------------------------------------------
void ClientCLBSSDataTrans(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	指定ｱﾄﾞﾚｽ(RAM,VRAM,CGRAM)にﾃﾞｰﾀを転送する
//----------------------------------------------------------
void ClientCLBSSDataRamTrans(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	曲ﾃﾞｰﾀを転送する
//----------------------------------------------------------
void ClientCLBSSBgmTrans(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	鳴き声ﾃﾞｰﾀを転送する
//----------------------------------------------------------
void ClientCLBSSVoiceTrans(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	ﾒﾆｭｰで選択した項目IDを返す
//----------------------------------------------------------
void ClientCLBSSSelectReturn(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ入れ替えを行ったことを知らせる
//----------------------------------------------------------
void ClientCLBSSReshuffle(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	ｱｲﾃﾑ使用を知らせる
//----------------------------------------------------------
void ClientCLBSSUseItem(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	ﾎﾞｰﾙ使用を知らせる
//----------------------------------------------------------
void ClientCLBSSUseBall(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//技エフェクト用のカウンタのクリア
//----------------------------------------------------------
void	ClientCLBSSLoopCountClear(void)
{
	WEW.loopcnt = 0;
	ClientCLBitReset();
}

//----------------------------------------------------------
//技エフェクト用のカウンタのセット
//----------------------------------------------------------
void	ClientCLBSSLoopCountSet(void)
{
	WEW.loopcnt = ServerBuffer[ClientNo][1];
	ClientCLBitReset();
}

//----------------------------------------------------------
//技エフェクト用のフラグのクリア
//----------------------------------------------------------
void	ClientCLBSSSwitchFlagClear(void)
{
	WEW.flag = 0;
	ClientCLBitReset();
}

//----------------------------------------------------------
//技エフェクト用のフラグのセット
//----------------------------------------------------------
void	ClientCLBSSSwitchFlagSet(void)
{
	WEW.flag ^= 1;
	ClientCLBitReset();
}

//----------------------------------------------------------
//	ﾀﾞﾒｰｼﾞを受けたときのﾎﾟｹﾓﾝ点滅
//----------------------------------------------------------
void ClientCLBSSPokeDamageBlink(void)
{
	//ﾎﾟｹﾓﾝがﾊﾞﾆｯｼｭ状態ならをBlinkしない
	if(ActWork[PokemonStruct[ClientNo]].banish == 1){
		ClientCLBitReset();
		return;
	}

	ClientEffectWait = 1;	//Blinkｴﾌｪｸﾄ開始フラグセット
	ActWork[PokemonStruct[ClientNo]].work[1] = 0;

	//-- ｹﾞｰｼﾞのカラー変更 & 揺らしエフェクトセット --//
	GaugeSwayEffect(ClientNo);

	ClientSequence[ClientNo] = ClientCLPokeDamageBlinkWait;
}

//----------------------------------------------------------
//	ゲージを消す
//----------------------------------------------------------
void ClientCLBSSGaugeOff(void)
{
//	GaugeOFF(ClientGaugeSt[ClientNo]);
	ClientCLBitReset();
}

//----------------------------------------------------------
//	SEを鳴らす
//----------------------------------------------------------
void ClientCLBSSSEPlay(void)
{
	s8 pan;
	
//	SePlay(ServerBuffer[ClientNo][1]|(ServerBuffer[ClientNo][2]<<8));
	if(MineEnemyCheck(ClientNo) == SIDE_MINE)
		pan = WAZA_SE_L;
	else
		pan = WAZA_SE_R;
	SePlayPan(ServerBuffer[ClientNo][1]|(ServerBuffer[ClientNo][2]<<8), pan);
	ClientCLBitReset();
}

//----------------------------------------------------------
//	MEを鳴らす
//----------------------------------------------------------
void ClientCLBSSMEPlay(void)
{
	JinglePlay(ServerBuffer[ClientNo][1]|(ServerBuffer[ClientNo][2]<<8));
	ClientCLBitReset();
}

//----------------------------------------------------------
//	なきごえを鳴らす
//----------------------------------------------------------
void ClientCLBSSVoicePlay(void)
{
//	VoicePlay(PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]],ID_monsno),25);
	//気絶時の声で鳴くように変更 2002.08.27(火) by matsuda
	VoicePlay3(PokeParaGet(&PokeParaEnemy[SelMonsNo[ClientNo]],ID_monsno),25,5);
	ClientCLBitReset();
}

//----------------------------------------------------------
//	エンカウントエフェクトをセット
//----------------------------------------------------------
void ClientCLBSSEncountEffect(void)
{
	EncountEffectSet(ServerBuffer[ClientNo][1]);
	//OBJ横移動のストッパー
	EncountEffectFlag|=ENCOUNT_EFFECT_FLAG_OBJSTOP;	
	ClientCLBitReset();
}

//----------------------------------------------------------
//	最初のポケモン登場(ﾄﾚｰﾅｰ引っ込む、ﾎﾟｹﾓﾝ出す、ﾒｯｾｰｼﾞ出す。までの一連の動作
//----------------------------------------------------------
void ClientCLBSSPokeSendOut(void)
{
	u8 id;
	
	DxDyAddClear(&ActWork[PokemonStruct[ClientNo]]);
	ActWork[PokemonStruct[ClientNo]].work[0] = ENEMYTRAINER_RETURN_SYNCNUM;
	ActWork[PokemonStruct[ClientNo]].work[2] = 240+40;
	ActWork[PokemonStruct[ClientNo]].work[4] = ActWork[PokemonStruct[ClientNo]].y;
	ActWork[PokemonStruct[ClientNo]].move = W_StraightSyncMove;
	SetWorkSeq(&ActWork[PokemonStruct[ClientNo]], CLTrainerDelEnd);
//	ActAnmChg(&ActWork[PokemonStruct[ClientNo]],1);

	//-- ﾎﾟｹﾓﾝ --//
	id = AddTask(CLSendOutTask, 5);
	TaskTable[id].work[0] = ClientNo;

	//-- 手持ちｹﾞｰｼﾞを消す --//
	if(CliSys[ClientNo].temoti_gauge_flg)
		TaskTable[TemotiGauge[ClientNo]].TaskAdrs = TemotiBallOff;

	BtlWork->sendout_eff = 1;
	ClientSequence[ClientNo] = ClientCLDummy;
}

static void CLSendOutTask(u8 id)
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
		CLPokeAppearCommon(ClientNo, 0);	//ClientCLBSSPokeAppear();
	}
	else if(FightType&FIGHT_TYPE_4_2vs2)
	{	//2vs2 4人通信
		ServerBuffer[ClientNo][1] = SelMonsNo[ClientNo];
		CLPokeAppearCommon(ClientNo, 0);
	}
	else
	{	//2vs2
		ServerBuffer[ClientNo][1] = SelMonsNo[ClientNo];
		CLPokeAppearCommon(ClientNo, 0);	//ClientCLBSSPokeAppear();
		ClientNo ^= 2;
		ServerBuffer[ClientNo][1] = SelMonsNo[ClientNo];
		CLPokeAppearCommon(ClientNo, 0);	//ClientCLBSSPokeAppear();
		ClientNo ^= 2;	//変更したClientNoを元に戻す
	}

	ClientSequence[ClientNo] = ClientCLPokeSendOutWait;
	ClientNo = clientno_temp;
	DelTask(id);
}

static void CLTrainerDelEnd(actWork *xreg)
{
	TrainerFObjCellPalDel(xreg->oamData.AffineParam);
	xreg->oamData.CharNo = xreg->work[5];//DelActorする時に転送で
							//取っていた領域が開放されるようにCharNoを元に戻す
	AffineDelActor(xreg);
	DelActor(xreg);
}

//----------------------------------------------------------
//	トレーナー戦時のボールゲージを表示する
//----------------------------------------------------------

void	ClientCLBSSBallGaugeSet(void)
{
	BallGaugePara *bgp;
	
//フラグワークがtrueの時は、どっちサイドなのかチェックして、自分側のときは表示をしないようにする
	if(ServerBuffer[ClientNo][1]){
		if(MineEnemyCheck(ClientNo)==SIDE_MINE){
			ClientCLBitReset();
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
	ClientSequence[ClientNo] = ClientCLBallGaugeWait;
///	ClientCLBitReset();
}

static void ClientCLBallGaugeWait(void)
{
	if(CliSys[ClientNo].wait_work++ > TEMOTI_BALL_WAIT){
		CliSys[ClientNo].wait_work = 0;
		ClientCLBitReset();
	}
}

//----------------------------------------------------------
//	トレーナー戦時のボールゲージを非表示にする
//----------------------------------------------------------

void	ClientCLBSSBallGaugeOff(void)
{
	//-- 手持ちｹﾞｰｼﾞを消す --//
	if(CliSys[ClientNo].temoti_gauge_flg)
		TaskTable[TemotiGauge[ClientNo]].TaskAdrs = TemotiBallOff;
	ClientCLBitReset();
}

//----------------------------------------------------------
//	ゲージのゆれを止める
//----------------------------------------------------------

void ClientCLBSSGaugeYureStop(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	ポケモンのVANISHをON/OFFする
//----------------------------------------------------------

void	ClientCLBSSVanishOnOff(void)
{
	if(ClientPokeExistCheck(ClientNo)){
		ActWork[PokemonStruct[ClientNo]].banish = ServerBuffer[ClientNo][1];
		PokeClientBanishMemory(ClientNo);
	}
	ClientCLBitReset();
}

//----------------------------------------------------------
//	戦闘エフェクトを出す
//----------------------------------------------------------

void	ClientCLBSSFightEffect(void)
{
	u8 eff_no;
	u16 monsno;
	
	if(ClientSEWait(ClientNo))
		return;
	
	eff_no = ServerBuffer[ClientNo][1];
	monsno = ServerBuffer[ClientNo][2] | (ServerBuffer[ClientNo][3]<<8);
	
	if(SetFightEffect(ClientNo, ClientNo, ClientNo, eff_no, monsno))
		ClientCLBitReset();
	else
		ClientSequence[ClientNo] = ClientCLFightEffWait;
}

//----------------------------------------------------------
//	通信待機画面を出す
//----------------------------------------------------------

void	ClientCLBSSTuushinWait(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	記憶しているカーソル位置のクリア
//----------------------------------------------------------

void	ClientCLBSSCsrPosClear(void)
{
	ClientCLBitReset();
}

//----------------------------------------------------------
//	対戦終了を知らせる
//----------------------------------------------------------
void ClientCLBSSFightEnd(void)
{
#if 0
	WinLoseFlag=ServerBuffer[ClientNo][1]^0x3;
	BGM_FadeOutSet(5);
	LightFadeReq(N_to_B);
	ClientCLBitReset();
	if((FightType&FIGHT_TYPE_TUUSHIN)&&((FightType&FIGHT_TYPE_OYA)==0))
		ClientSequence[ClientNo] = ClientFightEndWait;
#else
	if(ServerBuffer[ClientNo][1]==FIGHT_DRAW)
		WinLoseFlag=ServerBuffer[ClientNo][1];
	else
		WinLoseFlag=ServerBuffer[ClientNo][1]^0x3;
	BGM_FadeOutSet(5);
	LightFadeReq(N_to_B);
	ClientCLBitReset();
	ClientSequence[ClientNo] = ClientFightEndWait;
#endif
}

//----------------------------------------------------------
//	ﾀﾞﾐｰ
//----------------------------------------------------------
void ClientCLBSSEndID(void)
{
//	ClientCLBitReset();
}

