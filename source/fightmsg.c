//======================================================
//                                                      
//    fightmsg.c                                           
//                                                      
//    Copyright (C) 2002 GAME FREAK inc. by soga
//======================================================

#include "common.h"
#include "bss.h"			//add
#include "calctool.h"		//add
#include "actor.h"
#include "decord.h"
#include "actanm.h"
#include "objdata.h"
#include "poketool.h"
#include "fight.h"
#include "agbmons.h"
#include "print.h"
#include "pm_str.h"
#include "waza_eff.h"
#include "server.h"
#include "waza_seq.h"
#include "item_seq.h"
#include "pokelist.h"
#include "wazatool.h"
#include "field.h"
#include "ev_fight.h"
#include "trainer.h"
#include "waza_tbl.h"
#include "client.h"
#include "client_t.h"
#include "gauge.h"
#include "multisio.h"		//add
#include "pokesio.h"
#include "cable.h"
#include "palanm.h"
#include "namein.h"
#include "task.h"
#include "laster.h"
#include "fight_ef.h"
#include "wazano.def"
#include "letter.h"
#include "item.h"
#include "zukan.h"
#include "tokusyu.def"
#include "gold.h"
#include "record.h"
#include "fld_main.h"
#include "mus_tool.h"
#include "shinka.h"
#include "fightmsg.h"
#include "b_tower.h"
#include "sysflag.h"
#include "ev_flag.h"

#include "fightmsg.dat"
#include "atkmsg.dat"


//-------------------- 関数プロトタイプ宣言 ------------------------

void	FightMsgID(u16);
int		FightMsgCreate(u8 *);
void	FightMsgEvStrBufCreate(u8 *,u8 *);
void	WazaMsgCreate1(u8 *);
void	WazaMsgCreate2(u8 *);

extern	const	u8	PokeNameData[][6];
extern	const	u8	WazaNameData[][8];
extern	const	u8	ItemNameData[][9];
extern	const	u8	ZokuseiMsg[][5];

u8		MsgSpeabiNo[4]={};
FightMsgStruct *G_FMS={};

//==============================================================
//                       メインルーチン
//==============================================================

void	FightMsgID(u16 MsgID)
{
	int	i;
	u8	*MsgAdrs=0;

	G_FMS=(FightMsgStruct *)&ServerBuffer[ClientNo][4];

//	WazaNo=FMS->WazaNo;
//	WazaNoTmp=FMS->WazaNoTmp;
	ItemNo=G_FMS->ItemNo;
	SpeabiNo=G_FMS->SpeabiNo;
	UserWork[CLIENT_NO_WORK]=G_FMS->ClientNoWork;
	UserWork[SEL_MONS_WORK]=G_FMS->SelMonsWork;
	UserWork[MESSAGE_OFFSET]=G_FMS->MessageOffset;
	ItemClient=G_FMS->ItemClient;
	UserWork[FMS_WAZA_TYPE]=G_FMS->WazaType;
	for(i=0;i<4;i++)
		MsgSpeabiNo[i]=G_FMS->Speabi[i];
	for(i=0;i<16;i++){
		EvStrBuf0[i]=G_FMS->EvStrBuf0[i];
		EvStrBuf1[i]=G_FMS->EvStrBuf1[i];
	}

	switch(MsgID){
	//野生のエンカウント、トレーナーエンカウント時のメッセージ
	//EncountMsg,
	//EncountMsg2,
	//TrainerMsg,
	//TuushinTrainerMsg,
		case ENCOUNTMSGNO:
			if(FightType&FIGHT_TYPE_TRAINER){
				if(FightType&FIGHT_TYPE_TUUSHIN){
					if(FightType&FIGHT_TYPE_4_2vs2)
						MsgAdrs=(u8 *)&TuushinTrainerMsg2;
					else
						MsgAdrs=(u8 *)&TuushinTrainerMsg;
				}
				else
					MsgAdrs=(u8 *)&TrainerMsg;
			}
			else{
				if(FightType&FIGHT_TYPE_SPECIAL)
					MsgAdrs=(u8 *)&SpecialEncountMsg;
				else if(FightType&FIGHT_TYPE_2vs2)
					MsgAdrs=(u8 *)&EncountMsg2;
				else if(FightType&FIGHT_TYPE_GET_DEMO)
					MsgAdrs=(u8 *)&DemoEncountMsg;
				else
					MsgAdrs=(u8 *)&EncountMsg;
			}
			break;
	//相手トレーナーの繰り出し、自分のポケモンの出現メッセージ
	//KuridashiMsg,
	//KuridashiMsg2,
	//AppearMsg,
	//AppearMsg2,
		case APPEARMSGNO:
			if(MineEnemyCheck(ClientNo)==SIDE_MINE){
				if(FightType&FIGHT_TYPE_2vs2){
					if(FightType&FIGHT_TYPE_4_2vs2)
						MsgAdrs=(u8 *)&TuushinAppearMsg;
					else
						MsgAdrs=(u8 *)&AppearMsg2;
				}
				else
					MsgAdrs=(u8 *)&AppearMsg;
			}
			else{
				if(FightType&FIGHT_TYPE_2vs2){
					if(FightType&FIGHT_TYPE_4_2vs2)
						MsgAdrs=(u8 *)&TuushinKuridashiMsg3;
					else
						if(FightType&FIGHT_TYPE_TUUSHIN)
							MsgAdrs=(u8 *)&TuushinKuridashiMsg2;
						else
							MsgAdrs=(u8 *)&KuridashiMsg2;
				}
				else{
					if(FightType&FIGHT_TYPE_TUUSHIN)
						MsgAdrs=(u8 *)&TuushinKuridashiMsg;
					else
						MsgAdrs=(u8 *)&KuridashiMsg;
				}
			}
			break;
	//ポケモン入れ替え時のメッセージ
	//IrekaeMsg,
	//IrekaeMsg2,
	//IrekaeMsg3,
		case IREKAEMSGNO:
			if(MineEnemyCheck(ClientNo)==SIDE_MINE)
				if(UserWork[MESSAGE_OFFSET]==0)
					MsgAdrs=(u8 *)&IrekaeMsg_0;
				else if((UserWork[MESSAGE_OFFSET]==1)||(FightType&FIGHT_TYPE_2vs2))
					MsgAdrs=(u8 *)&IrekaeMsg_1;
				else if(UserWork[MESSAGE_OFFSET]==2)
					MsgAdrs=(u8 *)&IrekaeMsg_2;
				else
					MsgAdrs=(u8 *)&IrekaeMsg_3;
			else{
				if(FieldTrainerID==TUUSHIN_TRAINER){
					if(FightType&FIGHT_TYPE_4_2vs2)
						MsgAdrs=(u8 *)&TuushinIrekaeMsg_2;
					else
						MsgAdrs=(u8 *)&TuushinIrekaeMsg_1;
				}
				else
					MsgAdrs=(u8 *)&IrekaeMsg2;
			}
			break;
	//ポケモン入れ替え後のメッセージ
	//KuridashiMsg3,
	//KuridashiMsg4,
	//AppearMsg3,
		case IREKAEAFTERMSGNO:
			if(MineEnemyCheck(UserWork[CLIENT_NO_WORK])==SIDE_MINE){
				if((UserWork[MESSAGE_OFFSET]==0)||(FightType&FIGHT_TYPE_2vs2))
					MsgAdrs=(u8 *)&AppearMsg_0;
				else if(UserWork[MESSAGE_OFFSET]==1)
					MsgAdrs=(u8 *)&AppearMsg_1;
				else if(UserWork[MESSAGE_OFFSET]==2)
					MsgAdrs=(u8 *)&AppearMsg_2;
				else
					MsgAdrs=(u8 *)&AppearMsg_3;
			}
			else{
				if(FightType&FIGHT_TYPE_TUUSHIN){
					if(FightType&FIGHT_TYPE_4_2vs2)
						MsgAdrs=(u8 *)&TuushinKuridashiMsg4_2;
					else
						MsgAdrs=(u8 *)&TuushinKuridashiMsg4_1;
				}
				else
					MsgAdrs=(u8 *)&KuridashiMsg3;
			}
			break;
	//技を出すときのメッセージ
	//WazaMsg,
	//WazaMsg20,
	//WazaMsg21,
	//WazaMsg22,
	//WazaMsg23,
	//WazaMsg24,
		case ATTACKMSGNO:
			WazaMsgCreate1((u8 *)&EvStrBuf0);
			if(G_FMS->WazaNo>WAZANO_MAX)
				PM_strcpy((u8 *)&EvStrBuf1,ZokuseiWazaMsg[UserWork[FMS_WAZA_TYPE]]);
			else
				PM_strcpy((u8 *)&EvStrBuf1,WazaNameData[G_FMS->WazaNo]);
			WazaMsgCreate2((u8 *)&EvStrBuf1);
			MsgAdrs=(u8 *)&WazaMsg;
			break;
	//通信対戦終了時のメッセージ
	//TuushinWinMsg
	//TuushinWinMsg2
	//TuushinLoseMsg
	//TuushinLoseMsg2
	//TuushinDrawMsg
	//TuushinDrawMsg2
	//TuushinEscapeMsg
	//TuushinEscapeMsg2
		case TAISENENDMSGNO:
			if(EvStrBuf0[0]&0x80){
				EvStrBuf0[0]&=0x7f;
				if((MineEnemyCheck(ClientNo)==SIDE_ENEMY)&&(EvStrBuf0[0]!=FIGHT_DRAW))
					EvStrBuf0[0]^=0x03;
				if((EvStrBuf0[0]==FIGHT_DRAW)||(EvStrBuf0[0]==FIGHT_LOSE))
					MsgAdrs=(u8 *)&EscapeMsg;
				else if(FightType&FIGHT_TYPE_4_2vs2)
					MsgAdrs=(u8 *)&TuushinEscapeMsg2;
				else
					MsgAdrs=(u8 *)&TuushinEscapeMsg;
			}
			else{
				if((MineEnemyCheck(ClientNo)==SIDE_ENEMY)&&(EvStrBuf0[0]!=FIGHT_DRAW))
					EvStrBuf0[0]^=0x03;
				if(FightType&FIGHT_TYPE_4_2vs2){
					switch(EvStrBuf0[0]){
						case FIGHT_WIN:
							MsgAdrs=(u8 *)&TuushinWinMsg2;
							break;
						case FIGHT_LOSE:
							MsgAdrs=(u8 *)&TuushinLoseMsg2;
							break;
						case FIGHT_DRAW:
							MsgAdrs=(u8 *)&TuushinDrawMsg2;
							break;
					}
				}
				else{
					switch(EvStrBuf0[0]){
						case FIGHT_WIN:
							MsgAdrs=(u8 *)&TuushinWinMsg;
							break;
						case FIGHT_LOSE:
							MsgAdrs=(u8 *)&TuushinLoseMsg;
							break;
						case FIGHT_DRAW:
							MsgAdrs=(u8 *)&TuushinDrawMsg;
							break;
					}
				}
			}
			break;
		default:
			if(MsgID>MSGNO_DEFINE_END){
				FightMsgBuf[0]=EOM_;
				return;
			}
			MsgAdrs=(u8 *)FightMsgTbl[MsgID-MSG_TBL_START];
			break;
	}
	FightMsgCreate(MsgAdrs);
}

int		FightMsgCreate(u8 *buf)
{
	return FightMsgCreateAct(buf,(u8 *)&FightMsgBuf);
}

int		FightMsgCreateAct(u8 *buf,u8 *destbuf)
{
	int	cnt=0;
	int	i;
	u8	id;
	u8	*adr=0;
	u8	msgdata[MONS_NAME_SIZE+EOM_SIZE];

	id=GetSioConnectId();

	while(*buf!=EOM_){
		if(*buf==I_MSG){
			buf++;
			switch(*buf){
				case	EV_STR_BUF0:
					if(EvStrBuf0[0]==I_MSG){
						FightMsgEvStrBufCreate(EvStrBuf0,StrTempBuffer0);
						adr=(u8 *)&StrTempBuffer0;
					}
					else
						adr=(u8 *)&EvStrBuf0;
					break;
				case	EV_STR_BUF1:
					if(EvStrBuf1[0]==I_MSG){
						FightMsgEvStrBufCreate(EvStrBuf1,StrTempBuffer1);
						adr=(u8 *)&StrTempBuffer1;
					}
					else
						adr=(u8 *)&EvStrBuf1;
					break;
				case	MY_MONS:
					PokeParaGet(
						&PokeParaMine[SelMonsNo[ClientNoGet(BSS_CLIENT_MINE)]],
						ID_nickname,
						msgdata);
					NickNameCutOff(msgdata);
					adr=(u8 *)&msgdata;
					break;
				case	ENEMY_MONS:
					PokeParaGet(
						&PokeParaEnemy[SelMonsNo[ClientNoGet(BSS_CLIENT_ENEMY)]],
						ID_nickname,
						msgdata);
					NickNameCutOff(msgdata);
					adr=(u8 *)&msgdata;
					break;
				case	MY_MONS2:
					PokeParaGet(
						&PokeParaMine[SelMonsNo[ClientNoGet(BSS_CLIENT_MINE2)]],
						ID_nickname,
						msgdata);
					NickNameCutOff(msgdata);
					adr=(u8 *)&msgdata;
					break;
				case	ENEMY_MONS2:
					PokeParaGet(
						&PokeParaEnemy[SelMonsNo[ClientNoGet(BSS_CLIENT_ENEMY2)]],
						ID_nickname,
						msgdata);
					NickNameCutOff(msgdata);
					adr=(u8 *)&msgdata;
					break;
				case	MY_TMONS:
					PokeParaGet(
						&PokeParaMine[SelMonsNo[SioTrainerInfo[id].StandPos]],
						ID_nickname,
						msgdata);
					NickNameCutOff(msgdata);
					adr=(u8 *)&msgdata;
					break;
				case	ENEMY_TMONS:
					PokeParaGet(
						&PokeParaEnemy[SelMonsNo[SioTrainerInfo[id].StandPos^1]],
						ID_nickname,
						msgdata);
					NickNameCutOff(msgdata);
					adr=(u8 *)&msgdata;
					break;
				case	MY_TMONS2:
					PokeParaGet(
						&PokeParaMine[SelMonsNo[SioTrainerInfo[id].StandPos^2]],
						ID_nickname,
						msgdata);
					NickNameCutOff(msgdata);
					adr=(u8 *)&msgdata;
					break;
				case	ENEMY_TMONS2:
					PokeParaGet(
						&PokeParaEnemy[SelMonsNo[SioTrainerInfo[id].StandPos^3]],
						ID_nickname,
						msgdata);
					NickNameCutOff(msgdata);
					adr=(u8 *)&msgdata;
					break;
				case	SIDE_MONS:
					if(MineEnemyCheck(AttackClient)!=SIDE_MINE){
						if(FightType&FIGHT_TYPE_TRAINER)
							adr=(u8 *)&AiteMsg;
						else
							adr=(u8 *)&EnemyMsg;
						while(*adr!=EOM_){
							destbuf[cnt++]=*adr;
							adr++;
						}
						PokeParaGet(
						&PokeParaEnemy[SelMonsNo[ClientNoGet(ClientTypeGet(AttackClient)&1)]],
						ID_nickname,
						msgdata);
					}
					else
						PokeParaGet(
						&PokeParaMine[SelMonsNo[ClientNoGet(ClientTypeGet(AttackClient)&1)]],
						ID_nickname,
						msgdata);
					NickNameCutOff(msgdata);
					adr=(u8 *)&msgdata;
					break;
				case	SIDE_MONS2:
					if(MineEnemyCheck(AttackClient)==SIDE_MINE){
						PokeParaGet(
						&PokeParaMine[SelMonsNo[ClientNoGet(ClientTypeGet(AttackClient)&1)+2]],
						ID_nickname,
						msgdata);
					}
					else{
						PokeParaGet(
						&PokeParaEnemy[SelMonsNo[ClientNoGet(ClientTypeGet(AttackClient)&1)+2]],
						ID_nickname,
						msgdata);
					}
					NickNameCutOff(msgdata);
					adr=(u8 *)&msgdata;
					break;
				case	ATTACK_MONS:
					if(MineEnemyCheck(AttackClient)!=SIDE_MINE){
						if(FightType&FIGHT_TYPE_TRAINER)
							adr=(u8 *)&AiteMsg;
						else
							adr=(u8 *)&EnemyMsg;
						while(*adr!=EOM_){
							destbuf[cnt++]=*adr;
							adr++;
						}
						PokeParaGet(
						&PokeParaEnemy[SelMonsNo[AttackClient]],
						ID_nickname,
						msgdata);
					}
					else
						PokeParaGet(
						&PokeParaMine[SelMonsNo[AttackClient]],
						ID_nickname,
						msgdata);
					NickNameCutOff(msgdata);
					adr=(u8 *)&msgdata;
					break;
				case	DEFENCE_MONS:
					if(MineEnemyCheck(DefenceClient)!=SIDE_MINE){
						if(FightType&FIGHT_TYPE_TRAINER)
							adr=(u8 *)&AiteMsg;
						else
							adr=(u8 *)&EnemyMsg;
						while(*adr!=EOM_){
							destbuf[cnt++]=*adr;
							adr++;
						}
						PokeParaGet(
						&PokeParaEnemy[SelMonsNo[DefenceClient]],
						ID_nickname,
						msgdata);
					}
					else
						PokeParaGet(
						&PokeParaMine[SelMonsNo[DefenceClient]],
						ID_nickname,
						msgdata);
					NickNameCutOff(msgdata);
					adr=(u8 *)&msgdata;
					break;
				case	TSUIKA_MONS:
					if(MineEnemyCheck(TsuikaClient)!=SIDE_MINE){
						if(FightType&FIGHT_TYPE_TRAINER)
							adr=(u8 *)&AiteMsg;
						else
							adr=(u8 *)&EnemyMsg;
						while(*adr!=EOM_){
							destbuf[cnt++]=*adr;
							adr++;
						}
						PokeParaGet(
						&PokeParaEnemy[SelMonsNo[TsuikaClient]],
						ID_nickname,
						msgdata);
					}
					else
						PokeParaGet(
						&PokeParaMine[SelMonsNo[TsuikaClient]],
						ID_nickname,
						msgdata);
					NickNameCutOff(msgdata);
					adr=(u8 *)&msgdata;
					break;
				case	CLIENT_MONS:
					if(MineEnemyCheck(ClientNo)!=SIDE_MINE){
						if(FightType&FIGHT_TYPE_TRAINER)
							adr=(u8 *)&AiteMsg;
						else
							adr=(u8 *)&EnemyMsg;
						while(*adr!=EOM_){
							destbuf[cnt++]=*adr;
							adr++;
						}
						PokeParaGet(
							&PokeParaEnemy[SelMonsNo[ClientNo]],
							ID_nickname,
							msgdata);
					}
					else
						PokeParaGet(
							&PokeParaMine[SelMonsNo[ClientNo]],
							ID_nickname,
							msgdata);
					NickNameCutOff(msgdata);
					adr=(u8 *)&msgdata;
					break;
				case	CLIENTNOWORK:
					if(MineEnemyCheck(UserWork[CLIENT_NO_WORK])!=SIDE_MINE){
						if(FightType&FIGHT_TYPE_TRAINER)
							adr=(u8 *)&AiteMsg;
						else
							adr=(u8 *)&EnemyMsg;
						while(*adr!=EOM_){
							destbuf[cnt++]=*adr;
							adr++;
						}
						PokeParaGet(
						&PokeParaEnemy[SelMonsNo[UserWork[CLIENT_NO_WORK]]],
						ID_nickname,
						msgdata);
					}
					else
						PokeParaGet(
						&PokeParaMine[SelMonsNo[UserWork[CLIENT_NO_WORK]]],
						ID_nickname,
						msgdata);
					NickNameCutOff(msgdata);
					adr=(u8 *)&msgdata;
					break;
				case	WAZA_NAME:
					if(G_FMS->WazaNo>WAZANO_MAX)
						adr=(u8 *)&ZokuseiWazaMsg[UserWork[FMS_WAZA_TYPE]];
					else
						adr=(u8 *)&WazaNameData[G_FMS->WazaNo];
					break;
				case	WAZA_NAME_TMP:
					if(G_FMS->WazaNoTmp>WAZANO_MAX)
						adr=(u8 *)&ZokuseiWazaMsg[UserWork[FMS_WAZA_TYPE]];
					else
						adr=(u8 *)&WazaNameData[G_FMS->WazaNoTmp];
					break;
				case	ITEM_NAME:
					if(FightType&FIGHT_TYPE_TUUSHIN){
						if(ItemNo==ITEM_NAZONOMI){
							if(SioTrainerInfo[UserWork[TUUSHIN_ID]].StandPos==ItemClient){
								PM_strcpy(msgdata,FRS[ItemClient].name);
								PM_strcat(msgdata,SeedMsg);
								adr=(u8 *)&msgdata;
							}
							else
								adr=(u8 *)&NazoSeedMsg;
						}
						else{
							GetItemName(ItemNo,msgdata);
							adr=(u8 *)&msgdata;
						}
					}
					else{
						GetItemName(ItemNo,msgdata);
						adr=(u8 *)&msgdata;
					}
					break;
				case	SPEABI_NAME:
					adr=(u8 *)&SpecialAbirityMsg[SpeabiNo];
					break;
				case	SPEABI_NAMEA:
					adr=(u8 *)&SpecialAbirityMsg[MsgSpeabiNo[AttackClient]];
					break;
				case	SPEABI_NAMED:
					adr=(u8 *)&SpecialAbirityMsg[MsgSpeabiNo[DefenceClient]];
					break;
				case	SPEABI_NAMEC:
					adr=(u8 *)&SpecialAbirityMsg[MsgSpeabiNo[UserWork[CLIENT_NO_WORK]]];
					break;
				case	SPEABI_NAMET:
					adr=(u8 *)&SpecialAbirityMsg[MsgSpeabiNo[TsuikaClient]];
					break;
				case	TRAINER_TYPE:
					if(FieldTrainerID==ORUSUBAN_TRAINER)
						adr=(u8 *)&TrainerTypeName[OrusubanTypeGet()];
					else if(FightType&FIGHT_TYPE_BATTLE_TOWER)
						adr=(u8 *)&TrainerTypeName[BattleTowerTypeGet()];
					else if(FightType&FIGHT_TYPE_CARD_E)
						adr=(u8 *)&TrainerTypeName[BattleCardETypeGet()];
					else
						adr=(u8 *)&TrainerTypeName[TD[FieldTrainerID].type];
					break;
				case	TRAINER_NAME:
					if(FieldTrainerID==ORUSUBAN_TRAINER){
						for(i=0;i<PERSON_NAME_SIZE;i++)
							msgdata[i]=SBD_WORK->name[i];
						msgdata[i]=EOM_;
						adr=(u8 *)&msgdata[0];
					}
					else if(FightType&FIGHT_TYPE_BATTLE_TOWER){
						BattleTowerNameGet(msgdata);
						adr=(u8 *)&msgdata;
					}
					else if(FightType&FIGHT_TYPE_CARD_E){
						BattleCardENameGet(msgdata);
						adr=(u8 *)&msgdata;
					}
					else
						adr=(u8 *)&TD[FieldTrainerID].name;
					break;
				case	TRAINER_MYNAME:
					adr=(u8 *)&SioTrainerInfo[id].name;
					break;
				case	TRAINER_MYNAME2:
					adr=(u8 *)&SioTrainerInfo[GetTeamPosID(SioTrainerInfo[id].StandPos^2)].name;
					break;
				case	TRAINER_ENENAME:
					adr=(u8 *)&SioTrainerInfo[GetTeamPosID(SioTrainerInfo[id].StandPos^1)].name;
					break;
				case	TRAINER_ENENAME2:
					adr=(u8 *)&SioTrainerInfo[GetTeamPosID(SioTrainerInfo[id].StandPos^3)].name;
					break;
				case	TRAINER_CLIENTNO:
					adr=(u8 *)&SioTrainerInfo[GetTeamPosID(UserWork[CLIENT_NO_WORK])].name;
					break;
				case 	MY_NAME:
					adr=(u8 *)&MyData.my_name;
					break;
				case 	TRAINER_LOSE:
					adr=(u8 *)GetTrainerLoseMessage();
					break;
				case CLIENT_SELMONS_WORK:
					if(MineEnemyCheck(UserWork[CLIENT_NO_WORK])!=SIDE_MINE){
						if(FightType&FIGHT_TYPE_TRAINER)
							adr=(u8 *)&AiteMsg;
						else
							adr=(u8 *)&EnemyMsg;
						while(*adr!=EOM_){
							destbuf[cnt++]=*adr;
							adr++;
						}
						PokeParaGet(
						&PokeParaEnemy[UserWork[SEL_MONS_WORK]],
						ID_nickname,
						msgdata);
					}
					else
						PokeParaGet(
						&PokeParaMine[UserWork[SEL_MONS_WORK]],
						ID_nickname,
						msgdata);
					NickNameCutOff(msgdata);
					adr=(u8 *)&msgdata;
					break;
				case PASO_NAME:
					if(EventFlagCheck(SYS_PASO_MAYUMI))
						adr=(u8 *)&MayuminoMsg;
					else
						adr=(u8 *)&DarekanoMsg;
					break;
				case SIDE_ATTACK_NAMEHA:
					if(MineEnemyCheck(AttackClient)==SIDE_MINE)
						adr=(u8 *)&MikatahaMsg;
					else
						adr=(u8 *)&AitehaMsg;
					break;
				case SIDE_DEFENCE_NAMEHA:
					if(MineEnemyCheck(DefenceClient)==SIDE_MINE)
						adr=(u8 *)&MikatahaMsg;
					else
						adr=(u8 *)&AitehaMsg;
					break;
				case SIDE_ATTACK_NAMENO:
					if(MineEnemyCheck(AttackClient)==SIDE_MINE)
						adr=(u8 *)&MikatanoMsg;
					else
						adr=(u8 *)&AitenoMsg;
					break;
				case SIDE_DEFENCE_NAMENO:
					if(MineEnemyCheck(DefenceClient)==SIDE_MINE)
						adr=(u8 *)&MikatanoMsg;
					else
						adr=(u8 *)&AitenoMsg;
					break;
				case SIDE_ATTACK_NAMEWO:
					if(MineEnemyCheck(AttackClient)==SIDE_MINE)
						adr=(u8 *)&MikatawoMsg;
					else
						adr=(u8 *)&AitewoMsg;
					break;
				case SIDE_DEFENCE_NAMEWO:
					if(MineEnemyCheck(DefenceClient)==SIDE_MINE)
						adr=(u8 *)&MikatawoMsg;
					else
						adr=(u8 *)&AitewoMsg;
					break;
			}
			while(*adr!=EOM_){
				destbuf[cnt++]=*adr;
				adr++;
			}
			//トレーナー負けメッセージにトリガーウェイトを追加
			if(*buf==TRAINER_LOSE){
				destbuf[cnt++]=CTRL_;
				destbuf[cnt++]=C_TRGWAIT_;
			}
		}
		else{
			destbuf[cnt++]=*buf;
		}
		buf++;
	}
	destbuf[cnt++]=*buf;
	return	cnt;
}

//==============================================================
//	EvStrBufCreate
//==============================================================

void	FightMsgEvStrBufCreate(u8 *srcbuf,u8 *destbuf)
{
	int	i=1;
	u16	MsgID;
	u32	work=0;
	u8	buf[MONS_NAME_SIZE+EOM_SIZE];

	destbuf[0]=EOM_;

	while(srcbuf[i]!=EOM_){
		switch(srcbuf[i]){
//次の2バイトをメッセージIDと解釈する
			case EV_MSGID:
				MsgID=srcbuf[i+1]|(srcbuf[i+2]<<8);
				PM_strcat(destbuf,FightMsgTbl[MsgID-MSG_TBL_START]);
				i+=3;
				break;
//数値データを文字に変換する
//+0:EV_NUM
//+1:データのバイト数
//+2:数値の桁数
//+3-:データのバイト数分の数値データ
			case EV_NUM:
				switch(srcbuf[i+1]){
					case 1:
						work=srcbuf[i+3];
						work&=0xff;
						break;
					case 2:
						work=srcbuf[i+3]|(srcbuf[i+4]<<8);
						work&=0xffff;
						break;
					case 4:
						work=srcbuf[i+3]|(srcbuf[i+4]<<8)|(srcbuf[i+5]<<16)|(srcbuf[i+6]<<24);
						break;
				}
				PM_NumMsgSet(destbuf,work,NUM_MODE_LEFT,srcbuf[i+2]);
				i+=(3+srcbuf[i+1]);
				break;
//次の2バイトを技ナンバーと解釈する
			case EV_WAZANO:
				MsgID=srcbuf[i+1]|(srcbuf[i+2]<<8);
				PM_strcat(destbuf,WazaNameData[MsgID]);
				i+=3;
				break;
//次の1バイトを属性ナンバーと解釈する
			case EV_ZOKUSEI:
				PM_strcat(destbuf,ZokuseiMsg[srcbuf[i+1]]);
				i+=2;
				break;
//ポケモンのニックネームに変換する
//+0:EV_NICKNAME
//+1:ClientNo
//+2:SelMonsNo
			case EV_NICKNAME:
				if(MineEnemyCheck(srcbuf[i+1])==SIDE_MINE)
					PokeParaGet(&PokeParaMine[srcbuf[i+2]],ID_nickname,buf);
				else{
					if(FightType&FIGHT_TYPE_TRAINER)
						PM_strcat(destbuf,AiteMsg);
					else
						PM_strcat(destbuf,EnemyMsg);
					PokeParaGet(&PokeParaEnemy[srcbuf[i+2]],ID_nickname,buf);
				}
				NickNameCutOff(buf);
				PM_strcat(destbuf,buf);
				i+=3;
				break;
//次の1バイトをステータスナンバーと解釈する
			case EV_STATUS:
				PM_strcat(destbuf,AbirityMsgTbl[srcbuf[i+1]]);
				i+=2;
				break;
//次の2バイトをモンスターナンバーと解釈して
//モンスターの名前に変換する（NICKNAMEではない）
			case EV_MONSNAME:
				MsgID=srcbuf[i+1]|(srcbuf[i+2]<<8);
				PokeNameSet(destbuf,MsgID);
				i+=3;
				break;
//ポケモンのニックネームに変換する(「てきの」をつけない）
//+0:EV_NICKNAMEONLY
//+1:ClientNo
//+2:SelMonsNo
			case EV_NICKNAMEONLY:
				if(MineEnemyCheck(srcbuf[i+1])==SIDE_MINE)
					PokeParaGet(&PokeParaMine[srcbuf[i+2]],ID_nickname,destbuf);
				else
					PokeParaGet(&PokeParaEnemy[srcbuf[i+2]],ID_nickname,destbuf);
				NickNameCutOff(destbuf);
				i+=3;
				break;
//次の1バイトをTasteナンバーと解釈する
			case EV_TASTE:
				PM_strcat(destbuf,TasteMsgTbl[srcbuf[i+1]]);
				i+=2;
				break;
//次の1バイトを特性ナンバーと解釈する
			case EV_SPEABINO:
				PM_strcat(destbuf,SpecialAbirityMsg[srcbuf[i+1]]);
				i+=2;
				break;
//次の2バイトをアイテムナンバーと解釈する
			case EV_ITEMNO:
				MsgID=srcbuf[i+1]|(srcbuf[i+2]<<8);
				if(FightType&FIGHT_TYPE_TUUSHIN){
					if(MsgID==ITEM_NAZONOMI){
						if(SioTrainerInfo[UserWork[TUUSHIN_ID]].StandPos==ItemClient){
							PM_strcpy(destbuf,FRS[ItemClient].name);
							PM_strcat(destbuf,SeedMsg);
						}
						else
							PM_strcat(destbuf,NazoSeedMsg);
					}
					else
						GetItemName(MsgID,destbuf);
				}
				else
					GetItemName(MsgID,destbuf);
				i+=3;
				break;
		}
	}
}

//==============================================================
//                       メインルーチン
//==============================================================

void	WazaMsgCreate1(u8 *buf)
{
	int	i,j;
	i=j=0;

	while(j!=4){
		if(WazaMsgCheckTbl[i]==0) j++;
		if(WazaMsgCheckTbl[i++]==G_FMS->WazaNo) break;
	}
	switch(j){
		case 0:
		case 1:
		case 2:
#if 0
			*buf=ha_;
			buf++;
			*buf=EOM_;
#endif
			PM_strcpy(buf,HaEomMsg);
			break;
		case 3:
		case 4:
#if 0
			*buf=no_;
			buf++;
			*buf=EOM_;
#endif
			PM_strcpy(buf,NoEomMsg);
			break;
	}
}

//==============================================================
//                       メインルーチン
//==============================================================

void	WazaMsgCreate2(u8 *buf)
{
	int	i,j;
	i=j=0;

	while(*buf!=EOM_) buf++;

	while(j!=4){
		if(WazaMsgCheckTbl[i]==0) j++;
		if(WazaMsgCheckTbl[i++]==G_FMS->WazaNo) break;
	}
	switch(j){
		case 0:
			PM_strcpy(buf,WazaMsg20);
			break;
		case 1:
			PM_strcpy(buf,WazaMsg21);
			break;
		case 2:
			PM_strcpy(buf,WazaMsg22);
			break;
		case 3:
			PM_strcpy(buf,WazaMsg23);
			break;
		case 4:
			PM_strcpy(buf,WazaMsg24);
			break;
	}
}

