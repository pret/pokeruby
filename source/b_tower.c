
//======================================================
//    b_tower.c                                           
//                                                      
//    Copyright (C) 2002 GAME FREAK inc.
//======================================================

#include "common.h"
#include "intr.h"
#include "param.h"
#include "calctool.h"
#include "actor.h"
#include "actanm.h"
#include "gamedata.h"
#include "poketool.h"
#include "pokescr.h"
#include "param.h"
#include "fntequ.h"
#include "tr_enum.h"
#include "zukan.h"
#include "pm_str.h"
#include "ev_flag.h"
#include "syswork.h"
#include "monsno.def"
#include "wazano.def"
#include "b_tower.def"

#include "fight.h"
#include "fld_main.h"
#include "fightmsg.h"
#include "kaiwa.h"
#include "mus_tool.h"
#include "bss.h"
#include "svld_ini.h"
#include "tr_tbl.h"
#include "server.h"
#include "item.h"
#include "..\data\itemsym.h"
#include "task.h"
#include "ec_eff.h"
#include "record.h"
#include "initgame.h"
#include "encount.h"

#include "evobjdef.h"

#include "btd_tr.dat"
#include "btd_item.dat"
#include "btd_pm50.dat"
#include "btdpm100.dat"

#include "btd_tr.h"
#include "ev_fight.h"

extern void TVBattleTowerInterViewClear();		//02/09/27 nohara

void	BattleTowerWorkInit(void);
void	BattleTowerWorkInitAct(u8);
u8		BattleTowerStockDataCheck(void);
void	BattleTowerRenshouSet(void);
void	BattleTowerStockData(void *);
void	BattleTowerTrainerSet(void);
u8		BattleTowerChrGet(void);
u8		BattleTowerTypeGet(void);
void	BattleTowerNameGet(u8 *);
u8		BattleTowerPokeGetCheck(u16,u8);
void	BattleTowerPokeCheck(void);
void	BattleTowerPokeCheckAct(u16,u16,u16,u8,u8,u16 *,u16 *,u8 *);
void	BattleTowerWorkSet(void);
void	BattleTowerWorkGet(void);
void	BattleTowerSave(void);
void	BattleTowerReset(void);
void	BattleTowerCheckSumCheck(void);
void	BattleTowerCheckSumMake(StockBattleTowerTrainer *);
void	BattleTowerStockDataClear(StockBattleTowerTrainer *);
void	BattleTowerTVDataStock(void);
u16		BattleTowerWinGet(u8);
void	BattleTowerItemGet(void);
void	BattleTowerRibbonGet(void);
void	BattleTowerFObjSet(u8);
void	BattleCardEFObjSet(void);

void	BattleTowerKaiwaGetAct(u16 *);
void	BattleTowerKaiwaGet(void);

void	BattleCardEDataStock(void);
u8		BattleCardEChrGet(void);
u8		BattleCardETypeGet(void);
void	BattleCardENameGet(u8 *);
void	BattleCardECheckSumCheck(void);
void	BattleCardECheckSumMake(StockBattleCardETrainer *);
void	BattleCardEStockDataClear(StockBattleCardETrainer *);
void	BattleCardEKaiwaGet(void);
void	BattleCardEWinLoseKaiwaGet(void);

//===============================================================
//
//		バトルタワーのワークを初期化
//
//===============================================================

void	BattleTowerWorkInit(void)
{
	int	i;
	u8	ret=0;

	for(i=0;i<2;i++){
		switch(MyData.BattleTowerWork.BattleTowerSeqNo[i]){
			default:
			case BATTLE_TOWER_NO_CHALLENGE:		//まだ未挑戦
				BattleTowerWorkInitAct(i);
				if(ret==0)
					SetEventWorkValue(LOCALWORK0,5);
				break;
			case BATTLE_TOWER_CONTINUE:			//連勝中
				break;
			case BATTLE_TOWER_CHALLENGE:		//挑戦して、正しくセーブしなかった
				BattleTowerWorkInitAct(i);
				SetEventWorkValue(LOCALWORK0,1);
				ret++;
				break;
			case BATTLE_TOWER_WIN:				//勝ち
				SetEventWorkValue(LOCALWORK0,2);
				ret++;
				break;
			case BATTLE_TOWER_LOSE:				//負け
//				BattleTowerWorkInitAct(i);
				SetEventWorkValue(LOCALWORK0,3);
				ret++;
				break;
			case BATTLE_TOWER_PAUSE:			//一時休止
				SetEventWorkValue(LOCALWORK0,4);
				ret++;
				break;
			case BATTLE_TOWER_NO_ITEM_GET:		//勝ったけど商品もらえず
				break;
		}
	}
	//Lv50、Lv100共に連勝中であれば、このチェックを行わないようにするために
	//LOCALWORK0に5を入れる
	if((MyData.BattleTowerWork.BattleTowerSeqNo[0]==BATTLE_TOWER_CONTINUE)&&
	   (MyData.BattleTowerWork.BattleTowerSeqNo[1]==BATTLE_TOWER_CONTINUE))
		SetEventWorkValue(LOCALWORK0,5);
	BattleTowerCheckSumCheck();
}

void	BattleTowerWorkInitAct(u8 level)
{
	MyData.BattleTowerWork.BattleTowerSeqNo[level]=0;
	MyData.BattleTowerWork.BattleTowerRound[level]=1;
	MyData.BattleTowerWork.BattleTowerStage[level]=1;
}

//===============================================================
//
//		バトルタワーのトレーナーを決める
//
//===============================================================

u8		BattleTowerCardETrainerCheck(u8 room,u16 win)
{
	int	i;
	u8	pokecnt=0;
	u16	monsnobuf[6];
	u16	itemnobuf[6];
	u16	monsno;
	u16	itemno;
	u8	level;
	u8	leveltmp;

	BattleCardECheckSumCheck();
	if(AnswerWork)
		return 0;

	if(MyData.BattleTowerWork.SBTT_CardE.win!=win)
		return 0;

	if(room)
		leveltmp=100;
	else
		leveltmp=50;

	for(i=0;i<3;i++){
		if((level=MyData.BattleTowerWork.SBTT_CardE.SBTP[i].level)!=leveltmp)
			return 0;
		monsno=MyData.BattleTowerWork.SBTT_CardE.SBTP[i].monsno;
		itemno=MyData.BattleTowerWork.SBTT_CardE.SBTP[i].item;
		BattleTowerPokeCheckAct(monsno,itemno,1,room,level,&monsnobuf[0],&itemnobuf[0],&pokecnt);
	}
	return (pokecnt==3);
}

u8		BattleTowerStockDataCheck(void)
{
	int	no[5];
	int	cnt=0;
	int	i,j;
	u16	win;
	u8	level;
	u32	sum1;
	u32	sum2;
	u32	*buf;

	level=MyData.BattleTowerWork.BattleTowerLevel;
	win=BattleTowerWinGet(level);

	if(BattleTowerCardETrainerCheck(level,win)){
		MyData.BattleTowerWork.BattleTowerTrainerNo=200;
		return 1;
	}

	for(i=0;i<5;i++){
		buf=(u32 *)&MyData.BattleTowerWork.SBTT[i];
		sum1=0;
		sum2=0;
		for(j=0;j<(sizeof(StockBattleTowerTrainer)/4)-1;j++){
			sum1|=buf[j];
			sum2+=buf[j];
		}
		if((MyData.BattleTowerWork.SBTT[i].win==win)&&
		   (MyData.BattleTowerWork.SBTT[i].level==level)&&
		   (sum1)&&
		   (MyData.BattleTowerWork.SBTT[i].checksum==sum2))
			no[cnt++]=i;
	}
	if(cnt){
		MyData.BattleTowerWork.BattleTowerTrainerNo=no[pp_rand()%cnt]+100;
		return 1;
	}

	return 0;
}

void	BattleTowerTrainerSet(void)
{
	u16	no;
	u8	level;
	int	i;

	level=MyData.BattleTowerWork.BattleTowerLevel;

	if(BattleTowerStockDataCheck()){
		BattleTowerFObjSet(MyData.BattleTowerWork.BattleTowerTrainerNo);
		MyData.BattleTowerWork.TrainerNoStock[MyData.BattleTowerWork.BattleTowerRound[level]-1]=
			MyData.BattleTowerWork.BattleTowerTrainerNo;
		return;
	}

	if(MyData.BattleTowerWork.BattleTowerStage[level]<8){
		if(MyData.BattleTowerWork.BattleTowerRound[level]==7){
			do{
				no=((pp_rand()&0xff)*10)>>8;
				no+=20+(10*(MyData.BattleTowerWork.BattleTowerStage[level]-1));
				for(i=0;i<MyData.BattleTowerWork.BattleTowerRound[level]-1;i++){
					if(MyData.BattleTowerWork.TrainerNoStock[i]==no)
						break;
				}
			}while(i!=MyData.BattleTowerWork.BattleTowerRound[level]-1);
			MyData.BattleTowerWork.BattleTowerTrainerNo=no;
		}
		else{
			do{
				no=((pp_rand()&0xff)*20)>>8;
				no+=(10*(MyData.BattleTowerWork.BattleTowerStage[level]-1));
				for(i=0;i<MyData.BattleTowerWork.BattleTowerRound[level]-1;i++){
					if(MyData.BattleTowerWork.TrainerNoStock[i]==no)
						break;
				}
			}while(i!=MyData.BattleTowerWork.BattleTowerRound[level]-1);
			MyData.BattleTowerWork.BattleTowerTrainerNo=no;
		}
	}
	else{
		do{
			no=(((pp_rand()&0xff)*30)>>8)+70;
			for(i=0;i<MyData.BattleTowerWork.BattleTowerRound[level]-1;i++){
				if(MyData.BattleTowerWork.TrainerNoStock[i]==no)
					break;
			}
		}while(i!=MyData.BattleTowerWork.BattleTowerRound[level]-1);
		MyData.BattleTowerWork.BattleTowerTrainerNo=no;
	}

	BattleTowerFObjSet(MyData.BattleTowerWork.BattleTowerTrainerNo);

	//7人目を覚えてしまうバグの回避。オレって馬鹿ですね。
	if(MyData.BattleTowerWork.BattleTowerRound[level]<7)
		MyData.BattleTowerWork.TrainerNoStock[MyData.BattleTowerWork.BattleTowerRound[level]-1]=
			MyData.BattleTowerWork.BattleTowerTrainerNo;
}

//===============================================================
//
//		フィールドOBJを決める
//
//===============================================================

void	BattleTowerFObjSet(u8 trainerno)
{
	int	i;

	u8	trtype;
	u16	objtype;

	if(trainerno<100)
		trtype=BTTD[trainerno].type;
	else if(trainerno<200)
		trtype=MyData.BattleTowerWork.SBTT[trainerno-100].trainerno;
	else
		trtype=MyData.BattleTowerWork.SBTT_CardE.trainerno;

	for(i=0;i<sizeof(BattleTowerTrainerMan);i++){
		if(BattleTowerTrainerMan[i]==trtype)
			break;
	}
	if(i!=sizeof(BattleTowerTrainerMan)){
		objtype=BattleTowerFObjMan[i];
		SetEventWorkValue(OBJCHRWORK1,objtype);
		return;
	}
	for(i=0;i<sizeof(BattleTowerTrainerWoman);i++){
		if(BattleTowerTrainerWoman[i]==trtype)
			break;
	}
	if(i!=sizeof(BattleTowerTrainerWoman)){
		objtype=BattleTowerFObjWoman[i];
		SetEventWorkValue(OBJCHRWORK1,objtype);
		return;
	}
	SetEventWorkValue(OBJCHRWORK1,BOY1);
}

void	BattleCardEFObjSet(void)
{
	BattleTowerFObjSet(200);
}

//===============================================================
//
//		レコードコーナーで交換したデータをストックする
//
//===============================================================

void	BattleTowerStockData(void *adr)
{
	StockBattleTowerTrainer	*SBTT;
	int	i,j,k;
	int	cnt=0;
	u16	win[5];
	u16	no[5];

	SBTT=adr;

	for(i=0;i<5;i++){
		k=0;
		for(j=0;j<4;j++){
			if(MyData.BattleTowerWork.SBTT[i].id[j]!=SBTT->id[j])
				break;
		}
		if(j==4){
			for(k=0;k<PERSON_NAME_SIZE;k++){
				if(MyData.BattleTowerWork.SBTT[i].name[j]!=SBTT->name[j])
					break;
				if(SBTT->name[j]==EOM_){
					k=PERSON_NAME_SIZE;
					break;
				}
			}
		}
		if(k==PERSON_NAME_SIZE)
			break;
	}
	if(i<5){
		MyData.BattleTowerWork.SBTT[i]=*SBTT;
		return;
	}

	for(i=0;i<5;i++){
		if(MyData.BattleTowerWork.SBTT[i].win==0)
			break;
	}

	if(i<5)
		MyData.BattleTowerWork.SBTT[i]=*SBTT;
	else{
		win[0]=MyData.BattleTowerWork.SBTT[0].win;
		no[0]=0;
		cnt++;
		for(i=1;i<5;i++){
			for(j=0;j<cnt;j++){
				if(MyData.BattleTowerWork.SBTT[i].win<win[j]){
					j=0;
					cnt=1;
					win[0]=MyData.BattleTowerWork.SBTT[i].win;
					no[0]=i;
					break;
				}
				if(MyData.BattleTowerWork.SBTT[i].win>win[j]){
					break;
				}
			}
			if(j==cnt){
				win[cnt]=MyData.BattleTowerWork.SBTT[i].win;
				no[cnt]=i;
				cnt++;
			}
		}
		i=pp_rand()%cnt;
		MyData.BattleTowerWork.SBTT[no[i]]=*SBTT;
	}
}

//===============================================================
//
//		バトルタワーのトレーナーキャラナンバーをゲット
//
//===============================================================

u8		BattleTowerChrGet(void)
{
	if(MyData.BattleTowerWork.BattleTowerTrainerNo==200)
		return(TRCellTbl[MyData.BattleTowerWork.SBTT_CardE.trainerno]);
	else if(MyData.BattleTowerWork.BattleTowerTrainerNo<100)
		return(TRCellTbl[BTTD[MyData.BattleTowerWork.BattleTowerTrainerNo].type]);
	else
		return(TRCellTbl[
			MyData.BattleTowerWork.SBTT[MyData.BattleTowerWork.BattleTowerTrainerNo-100].trainerno]);
}

//===============================================================
//
//		バトルタワーのトレーナータイプナンバーをゲット
//
//===============================================================

u8		BattleTowerTypeGet(void)
{
	u8	ret=0;

	if(MyData.BattleTowerWork.BattleTowerTrainerNo==200)
		ret=TRTypeTbl[MyData.BattleTowerWork.SBTT_CardE.trainerno];
	else if(MyData.BattleTowerWork.BattleTowerTrainerNo<100)
		ret=TRTypeTbl[BTTD[MyData.BattleTowerWork.BattleTowerTrainerNo].type];
	else
		ret=TRTypeTbl[
			MyData.BattleTowerWork.SBTT[MyData.BattleTowerWork.BattleTowerTrainerNo-100].trainerno];

	return ret;
}

//===============================================================
//
//		バトルタワーのトレーナーネームをゲット
//
//===============================================================

void	BattleTowerNameGet(u8 *buf)
{
	int	i;

	if(MyData.BattleTowerWork.BattleTowerTrainerNo==200){
		for(i=0;i<PERSON_NAME_SIZE;i++)
			buf[i]=MyData.BattleTowerWork.SBTT_CardE.name[i];
	}
	else if(MyData.BattleTowerWork.BattleTowerTrainerNo<100){
		for(i=0;i<3;i++)
			buf[i]=BTTD[MyData.BattleTowerWork.BattleTowerTrainerNo].name[i];
	}
	else{
		for(i=0;i<PERSON_NAME_SIZE;i++)
			buf[i]=
			MyData.BattleTowerWork.SBTT[MyData.BattleTowerWork.BattleTowerTrainerNo-100].name[i];
	}
	buf[i]=EOM_;
}

//===============================================================
//
//		バトルタワーのポケモンを決める
//
//===============================================================

void	BattleTowerPokemonSet(void)
{
	int	i,j;
	u8	level;
	u8	pow_rnd=0;
	u8	rnd_start=0;
	u8	rnd_max=60;
	u8	friend=255;
	u16	SetMonsNo;
	u16	set[3];
	u8	TrainerFlag;
	BattleTowerPokemonData	*BTPD;

	PokeParaEnemyInit();

	if(MyData.BattleTowerWork.BattleTowerTrainerNo<20){
		pow_rnd=(0x1f/8)*2;
		rnd_start=0;
	}
	else if(MyData.BattleTowerWork.BattleTowerTrainerNo<30){
		pow_rnd=(0x1f/8)*3;
		rnd_start=30;
	}
	else if(MyData.BattleTowerWork.BattleTowerTrainerNo<40){
		pow_rnd=(0x1f/8)*4;
		rnd_start=60;
	}
	else if(MyData.BattleTowerWork.BattleTowerTrainerNo<50){
		pow_rnd=(0x1f/8)*5;
		rnd_start=90;
	}
	else if(MyData.BattleTowerWork.BattleTowerTrainerNo<60){
		pow_rnd=(0x1f/8)*6;
		rnd_start=120;
	}
	else if(MyData.BattleTowerWork.BattleTowerTrainerNo<70){
		pow_rnd=(0x1f/8)*7;
		rnd_start=150;
	}
	else if(MyData.BattleTowerWork.BattleTowerTrainerNo<80){
		pow_rnd=0x1f;
		rnd_start=180;
	}
	else if(MyData.BattleTowerWork.BattleTowerTrainerNo<100){
		pow_rnd=0x1f;
		rnd_start=200;
		rnd_max=100;
	}
	else if(MyData.BattleTowerWork.BattleTowerTrainerNo==200){
		for(i=0;i<3;i++)
			PokeParaSetStock(&PokeParaEnemy[i],
							 &MyData.BattleTowerWork.SBTT_CardE.SBTP[i]);
		return;
	}
	else{
		for(i=0;i<3;i++)
			PokeParaSetStock(&PokeParaEnemy[i],
			&MyData.BattleTowerWork.SBTT[MyData.BattleTowerWork.BattleTowerTrainerNo-100].SBTP[i]);
		return;
	}

	if(MyData.BattleTowerWork.BattleTowerLevel){		//LV100
		BTPD=(BattleTowerPokemonData *)&BTPD100[0];
		level=100;
	}
	else{
		BTPD=(BattleTowerPokemonData *)&BTPD50[0];
		level=50;
	}

	TrainerFlag=BTTD[MyData.BattleTowerWork.BattleTowerTrainerNo].flag;

	i=0;
	while(i!=3){
		SetMonsNo=(((pp_rand()&0xff)*rnd_max)>>8)+rnd_start;
		if((TrainerFlag)&&((TrainerFlag&BTPD[SetMonsNo].flag)!=TrainerFlag))
			continue;
		for(j=0;j<i;j++){
			if(PokeParaGet(&PokeParaEnemy[j],ID_monsno,0)==BTPD[SetMonsNo].monsno)
				break;
		}
		if(j!=i)
			continue;

		for(j=0;j<i;j++){
			if((PokeParaGet(&PokeParaEnemy[j],ID_item,0)!=0)&&
			   (PokeParaGet(&PokeParaEnemy[j],ID_item,0)==BTItemTbl[BTPD[SetMonsNo].item]))
				break;
		}
		if(j!=i)
			continue;

		for(j=0;j<i;j++){
			if(set[j]==SetMonsNo)
				break;
		}
		if(j!=i)
			continue;

		set[i]=SetMonsNo;
		PokeParaSetParaExp(&PokeParaEnemy[i],
						   BTPD[SetMonsNo].monsno,
						   level,pow_rnd,
						   BTPD[SetMonsNo].expbit);
		for(j=0;j<4;j++){
			PokeWazaSetPos(&PokeParaEnemy[i],BTPD[SetMonsNo].waza[j],j);
			if(BTPD[SetMonsNo].waza[j]==WAZANO_YATUATARI)
				friend=0;
		}
		PokeParaPut(&PokeParaEnemy[i],ID_friend,(u8 *)&friend);

		PokeParaPut(&PokeParaEnemy[i],ID_item,(u8 *)&BTItemTbl[BTPD[SetMonsNo].item]);
		i++;
	}
}

//===============================================================
//
//		バトルタワーに参加できるポケモンをチェックする
//
//===============================================================

u8	BattleTowerPokeGetCheck(u16 monsno,u8 cnt)
{
	if(ZukanCheck(PokeMonsNo2ZukanNoGet(monsno),Z_GET_CHK)){
		if(cnt==0)
			PM_strcat(StrTempBuffer0,SpaceMsg);
		cnt++;
		PM_strcat(StrTempBuffer0,PokeNameData[monsno]);
		switch(cnt){
			case 2:
				PM_strcat(StrTempBuffer0,CRMsg);
				break;
			case 5:
			case 8:
			case 11:
				PM_strcat(StrTempBuffer0,ScrollWaitMsg);
				break;
			default:
				PM_strcat(StrTempBuffer0,SpaceMsg);
				break;
		}
	}
	return cnt;
}

//===============================================================
//
//		バトルタワーに参加できるポケモンをチェックする
//
//===============================================================

const u16 BattleTowerNoChallenge[]={
	MONSNO_MYUU,
	MONSNO_MYUUTUU,
	MONSNO_HOUOU,
	MONSNO_RUGIA,
	MONSNO_SEREBHI,
	MONSNO_KAIOOGA,
	MONSNO_GURAADON,
	MONSNO_REKKUUZA,
	MONSNO_ZIRAATI,
	MONSNO_DEOKISISU,
	0xffff,
};

void	BattleTowerPokeCheckAct(u16 mons,u16 item,u16 hp,u8 room,u8 level,u16 *monsbuf,u16 *itembuf,u8 *cnt)
{
	int	i=0;

	if((mons==MONSNO_TAMAGO)||(mons==0))
		return;

	while(BattleTowerNoChallenge[i]!=0xffff){
		if(BattleTowerNoChallenge[i]==mons)
			break;
		i++;
	}

	if(BattleTowerNoChallenge[i]==0xffff){
		//瀕死でも参加は可能に変更
//		if(hp==0)
//			return;
		if((room==0)&&(level>50))
			return;
		for(i=0;i<*cnt;i++){
			if(monsbuf[i]==mons)
				break;
		}
		if(i!=*cnt)
			return;
		if(item){
			for(i=0;i<*cnt;i++){
				if(itembuf[i]==item)
					break;
			}
			if(i!=*cnt)
				return;
		}
		monsbuf[*cnt]=mons;
		itembuf[*cnt]=item;
		cnt[0]++;
	}
}

void	BattleTowerPokeCheck(void)
{
	int	i;
	u8	pokecnt=0;
	u16	monsnobuf[6];
	u16	itemnobuf[6];
	u16	monsno;
	u16	itemno;
	u16	hp;
	u8	level;

	for(i=0;i<6;i++){
		monsno=PokeParaGet(&PokeParaMine[i],ID_monsno_egg);
		itemno=PokeParaGet(&PokeParaMine[i],ID_item);
		level=PokeParaGet(&PokeParaMine[i],ID_level);
		hp=PokeParaGet(&PokeParaMine[i],ID_hp);
		BattleTowerPokeCheckAct(monsno,itemno,hp,AnswerWork,level,&monsnobuf[0],&itemnobuf[0],&pokecnt);
	}
	if(pokecnt<3){
		StrTempBuffer0[0]=EOM_;
		ScriptParameter0=1;
		pokecnt=0;
		i=0;
		while(BattleTowerNoChallenge[i]!=0xffff){
			pokecnt=BattleTowerPokeGetCheck(BattleTowerNoChallenge[i],pokecnt);
			i++;
		}
		i=PM_strlen(StrTempBuffer0);
		StrTempBuffer0[i-1]=EOM_;
		if(pokecnt<3)
			PM_strcat(StrTempBuffer0,HaMsg);
		else
			PM_strcat(StrTempBuffer0,HaScrollWaitMsg);
	}
	else{
		ScriptParameter0=0;
		MyData.BattleTowerWork.BattleTowerLevel=AnswerWork;
	}
}

//===============================================================
//
//		バトルタワーの簡易会話を取得する
//
//===============================================================

void	BattleTowerKaiwaGetAct(u16 *msg)
{
#if 0
	int	i;
	u8	*buf;

	buf=&MsgExpandBuffer[0];

	for(i=0;i<6;i++){
		buf=KaiwaCopyWord(buf,msg[i]);
		switch(i){
			case 0:
			case 1:
			case 3:
			case 4:
				buf[0]=spc_;
				buf++;
				break;
			case 2:
				buf[0]=CR_;
				buf++;
				break;
			case 5:
				buf[0]=NORMAL_WAIT_;
				buf[1]=EOM_;
				break;
		}
	}
#endif
	int	i=0;

	if(KaiwaLineOverCheck(msg,3,2,20)){
		KaiwaCopySentence(MsgExpandBuffer,msg,2,3);
		while(MsgExpandBuffer[i++]!=CR_);
		while(MsgExpandBuffer[i]!=CR_){
			i++;
		}
		MsgExpandBuffer[i]=SCROLL_WAIT_;
	}
	else
		KaiwaCopySentence(MsgExpandBuffer,msg,3,2);
}


void	BattleTowerKaiwaGet(void)
{
	if(MyData.BattleTowerWork.BattleTowerTrainerNo==200)
		BattleTowerKaiwaGetAct((u16 *)&MyData.BattleTowerWork.SBTT_CardE.aisatukaiwa);
	else if(MyData.BattleTowerWork.BattleTowerTrainerNo<100)
		BattleTowerKaiwaGetAct((u16 *)&BTTD[MyData.BattleTowerWork.BattleTowerTrainerNo].kaiwa);
	else
		BattleTowerKaiwaGetAct((u16 *)&MyData.BattleTowerWork.SBTT[MyData.BattleTowerWork.BattleTowerTrainerNo-100].kaiwa);
}

//===============================================================
//
//		バトルタワーから戦闘を呼び出す
//
//===============================================================

void	BattleEventFightEnd(void)
{
	int	i;
	u16	item;

	switch(ScriptParameter0){
		case BEF_BATTLE_TOWER:
			break;
		case BEF_ORUSUBAN:
			for(i=0;i<6;i++){
				item=PokeParaGet(&Fld.PokeParaTemoti[i],ID_item);
				PokeParaPut(&PokeParaMine[i],
							ID_item,
							(u8 *)&item);
			}
			break;
		case BEF_CARD_E:
			BattleCardEWinLoseKaiwaGet();
			break;
	}
	MainProcChange( FieldScriptRecover );
}

static	void	BattleEventFightStart(u8 no)
{
	if ( CheckEcEffect() == TRUE ) {
		sys.pReturnProc = BattleEventFightEnd;
		MainProcChange( InitFight );
		DelTask(no);
	}
}

void	BattleEventFight(void)
{
	int	i;
	u16	item;

	switch(ScriptParameter0){
		case BEF_BATTLE_TOWER:
			FightType = FIGHT_TYPE_TRAINER|FIGHT_TYPE_BATTLE_TOWER;
			FieldTrainerID=0;
			BattleTowerPokemonSet();
			AddTask(BattleEventFightStart,1);
			FightBGMSet2(0);
			SetEcEffect(GetSpTrainerEncountEffect());
			break;
		case BEF_ORUSUBAN:
			for(i=0;i<6;i++){
				item=PokeParaGet(&PokeParaMine[i],ID_item);
				PokeParaPut(&Fld.PokeParaTemoti[i],
							ID_item,
							(u8 *)&item);
			}
			AddTask(BattleEventFightStart,1);
			FightBGMSet2(0);
			SetEcEffect(GetSpTrainerEncountEffect());
			break;
		case BEF_CARD_E:
			PokeParaEnemyInit();
			for(i=0;i<3;i++)
				PokeParaSetStock(&PokeParaEnemy[i],&MyData.BattleTowerWork.SBTT_CardE.SBTP[i]);
			FightType = FIGHT_TYPE_TRAINER|FIGHT_TYPE_CARD_E;
			FieldTrainerID=0;
			AddTask(BattleEventFightStart,1);
			FightBGMSet2(0);
			SetEcEffect(GetSpTrainerEncountEffect());
			break;
	}
}

//===============================================================
//
//		バトルタワー用のワークに値をセット
//
//===============================================================

extern	u8	SelectPoke[3];

void	BattleTowerWorkSet(void)
{
	int	i;
	u8	level;

	level=MyData.BattleTowerWork.BattleTowerLevel;

	switch(ScriptParameter0){
		case BATTLE_TOWER_SEQ_NO:
			UserWork[BATTLE_TOWER_SEQPUSH]=MyData.BattleTowerWork.BattleTowerSeqNo[level];
			MyData.BattleTowerWork.BattleTowerSeqNo[level]=ScriptParameter1;
			//挑戦するときにステージ、ラウンドを初期化
			break;
		case BATTLE_TOWER_LEVEL:		//バトルタワーのレベル
			MyData.BattleTowerWork.BattleTowerLevel=ScriptParameter1;
			break;
		case BATTLE_TOWER_ROUND:		//今何人目？
			MyData.BattleTowerWork.BattleTowerRound[level]=ScriptParameter1;
			break;
		case BATTLE_TOWER_STAGE:		//今何周目？
			MyData.BattleTowerWork.BattleTowerStage[level]=ScriptParameter1;
			break;
		case BATTLE_TOWER_TRAINERNO:	//バトルタワートレーナーナンバー
			MyData.BattleTowerWork.BattleTowerTrainerNo=ScriptParameter1;
			break;
		case BATTLE_TOWER_SELECTPOKE:	//選択したポケモンの位置
			for(i=0;i<3;i++)
				MyData.BattleTowerWork.BattleTowerSelectPoke[i]=SelectPoke[i];
			break;
		case BATTLE_TOWER_ADD_ROUND:	//戦ったトレーナーのカウントアップ
			//カードｅトレーナーに勝利したときは、カードｅトレーナーを消去
			if(MyData.BattleTowerWork.BattleTowerTrainerNo==200)
				BattleCardEStockDataClear(&MyData.BattleTowerWork.SBTT_CardE);
			if(MyData.BattleTowerWork.BattleTowerKachi<9999)
				MyData.BattleTowerWork.BattleTowerKachi++;
			MyData.BattleTowerWork.BattleTowerRound[level]++;
			BattleTowerRenshouSet();
			AnswerWork=MyData.BattleTowerWork.BattleTowerRound[level];
			StrTempBuffer0[0]=n0_+AnswerWork;
			StrTempBuffer0[1]=EOM_;
			break;
		case BATTLE_TOWER_ADD_STAGE:	//周回数をカウントアップ
			if(MyData.BattleTowerWork.BattleTowerStage[level]<1430)
				MyData.BattleTowerWork.BattleTowerStage[level]++;
			BattleTowerRenshouSet();
			AnswerWork=MyData.BattleTowerWork.BattleTowerStage[level];
			break;
		case BATTLE_TOWER_SAVED:		//セーブ済み?
			MyData.BattleTowerWork.BattleTowerSaved=ScriptParameter1;
			break;
		case BATTLE_TOWER_TOTAL_ROUND:
			break;
		case BATTLE_TOWER_RENSHOU_SET:
			SetRecord(CNT_TOWER_RENSHOU,MyData.BattleTowerWork.BattleTowerKachinuki);
			break;
		case BATTLE_TOWER_CHALLENGE_INIT:
			if(MyData.BattleTowerWork.BattleTowerSeqNo[level]!=BATTLE_TOWER_CONTINUE)
				BattleTowerWorkInitAct(level);
			break;
		case BATTLE_TOWER_SEQNO_POP:
			MyData.BattleTowerWork.BattleTowerSeqNo[level]=UserWork[BATTLE_TOWER_SEQPUSH];
			break;
		case BATTLE_TOWER_RENSHOU_NOW_SET:
			MyData.BattleTowerWork.BattleTowerRensyouNow[level]=BattleTowerWinGet(level);
			break;
		case BATTLE_TOWER_LEVEL_COPY:
			MyData.BattleTowerWork.BattleTowerInterviewLevel=MyData.BattleTowerWork.BattleTowerLevel;
			break;
	}
}

//===============================================================
//
//		バトルタワー用のワークから値をゲット
//
//===============================================================

void	BattleTowerWorkGet(void)
{
	u8	level;

	level=MyData.BattleTowerWork.BattleTowerLevel;

	switch(ScriptParameter0){
		case BATTLE_TOWER_SEQ_NO:
			AnswerWork=MyData.BattleTowerWork.BattleTowerSeqNo[level];
			break;
		case BATTLE_TOWER_LEVEL:		//バトルタワーのレベル
			AnswerWork=MyData.BattleTowerWork.BattleTowerLevel;
			break;
		case BATTLE_TOWER_ROUND:		//今何人目？
			AnswerWork=MyData.BattleTowerWork.BattleTowerRound[level];
			break;
		case BATTLE_TOWER_STAGE:		//今何周目？
			AnswerWork=MyData.BattleTowerWork.BattleTowerStage[level];
			break;
		case BATTLE_TOWER_TRAINERNO:	//バトルタワートレーナーナンバー
			AnswerWork=MyData.BattleTowerWork.BattleTowerTrainerNo;
			break;
		case BATTLE_TOWER_SAVED:		//セーブ済み?
			AnswerWork=MyData.BattleTowerWork.BattleTowerSaved;
			break;
		case BATTLE_TOWER_TOTAL_ROUND:		//通算何人目？
			AnswerWork=BattleTowerWinGet(level);
			break;
		case BATTLE_TOWER_RENSHOU_SET:
			SetRecord(CNT_TOWER_RENSHOU,MyData.BattleTowerWork.BattleTowerKachinuki);
			break;
		case BATTLE_TOWER_CHALLENGE_INIT:
			BattleTowerWorkInitAct(level);
			break;
		case BATTLE_TOWER_SEQNO_POP:
			MyData.BattleTowerWork.BattleTowerSeqNo[level]=UserWork[BATTLE_TOWER_SEQPUSH];
			break;
		case BATTLE_TOWER_RENSHOU_NOW_SET:
			MyData.BattleTowerWork.BattleTowerRensyouNow[level]=BattleTowerWinGet(level);
			break;
		case BATTLE_TOWER_LEVEL_COPY:
			MyData.BattleTowerWork.BattleTowerInterviewLevel=MyData.BattleTowerWork.BattleTowerLevel;
			break;
	}
}

//===============================================================
//
//		バトルタワーの選択ポケモンをセット
//
//===============================================================

void	BattleTowerMonsSel(void)
{
	int	i;

	for(i=0;i<3;i++)
		SelectPoke[i]=MyData.BattleTowerWork.BattleTowerSelectPoke[i];

	SortSelectPokemon();
}

//===============================================================
//
//		バトルタワーの保存
//
//===============================================================

void	BattleTowerRenshouSet(void)
{
	u8	level;
	u16	win;

	level=MyData.BattleTowerWork.BattleTowerLevel;
	win=BattleTowerWinGet(level);

	if(MyData.BattleTowerWork.BattleTowerWinRecord[level]<win)
		MyData.BattleTowerWork.BattleTowerWinRecord[level]=win;

	if(MyData.BattleTowerWork.BattleTowerWinRecord[0]>
	   MyData.BattleTowerWork.BattleTowerWinRecord[1]){
		win=MyData.BattleTowerWork.BattleTowerWinRecord[0];
		SetRecord(CNT_TOWER_RENSHOU,win);
		if(win>9999)
			MyData.BattleTowerWork.BattleTowerKachinuki=9999;
		else
			MyData.BattleTowerWork.BattleTowerKachinuki=win;
	}
	else{
		win=MyData.BattleTowerWork.BattleTowerWinRecord[1];
		SetRecord(CNT_TOWER_RENSHOU,win);
		if(win>9999)
			MyData.BattleTowerWork.BattleTowerKachinuki=9999;
		else
			MyData.BattleTowerWork.BattleTowerKachinuki=win;
	}
}

void	BattleTowerDataStock(void)
{
	StockBattleTowerTrainer * SBTT_Mine;
	int	i;
	u8	level;
	u8	trainerno;

	SBTT_Mine = &MyData.BattleTowerWork.SBTT_Mine;

	level=MyData.BattleTowerWork.BattleTowerLevel;

	if(MyData.my_sex)
		trainerno=BattleTowerTrainerWoman[(MyData.ID[0]+
										   MyData.ID[1]+
										   MyData.ID[2]+
										   MyData.ID[3])%
										   sizeof(BattleTowerTrainerWoman)];
	else
		trainerno=BattleTowerTrainerMan[(MyData.ID[0]+
										 MyData.ID[1]+
										 MyData.ID[2]+
										 MyData.ID[3])%
										 sizeof(BattleTowerTrainerMan)];

	SBTT_Mine->level = level;
	SBTT_Mine->trainerno = trainerno;
	ID_Copy(SBTT_Mine->id, MyData.ID);
	OyaNameCopy(SBTT_Mine->name, MyData.my_name);

	SBTT_Mine->win=BattleTowerWinGet(level);

	for(i=0;i<6;i++)
		SBTT_Mine->kaiwa[i]=Fld.kaiwa_battle[i];

	for(i=0;i<3;i++)
		PokeParaGetStock(&PokeParaMine[MyData.BattleTowerWork.BattleTowerSelectPoke[i]-1],
						 &SBTT_Mine->SBTP[i]);

	BattleTowerCheckSumMake(&MyData.BattleTowerWork.SBTT_Mine);

	BattleTowerRenshouSet();

}

void	BattleTowerSave(void)
{
	u8	level;

	level=MyData.BattleTowerWork.BattleTowerLevel;

	if((ScriptParameter0==BATTLE_TOWER_CONTINUE)||
	   (ScriptParameter0==BATTLE_TOWER_NO_CHALLENGE)){
		if((MyData.BattleTowerWork.BattleTowerStage[level]>1)||
		   (MyData.BattleTowerWork.BattleTowerRound[level]>1))
			BattleTowerDataStock();
	}

	BattleTowerTVDataStock();

	MyData.BattleTowerWork.BattleTowerWinLoseFlag=WinLoseFlag;

	if(ScriptParameter0!=BATTLE_TOWER_CONTINUE)
		MyData.BattleTowerWork.BattleTowerSeqNo[level]=ScriptParameter0;
	SetEventWorkValue(LOCALWORK0,0);
	MyData.BattleTowerWork.BattleTowerSaved=1;
	PokeAGBSave(POKEAGB_SVMYD);
}

//===============================================================
//
//		ソフトリセット
//
//===============================================================

void	BattleTowerReset(void)
{
	PM_SoftReset();
}

//===============================================================
//
//		ストックデータのチェックサムチェック
//
//===============================================================

void	BattleTowerCheckSumCheck(void)
{
	int	i,j;
	u32	*buf;
	u32	sum;

	buf=(u32 *)&MyData.BattleTowerWork.SBTT_Mine;
	sum=0;

	for(i=0;i<(sizeof(StockBattleTowerTrainer)/4)-1;i++)
		sum+=buf[i];

	if(MyData.BattleTowerWork.SBTT_Mine.checksum!=sum)
		BattleTowerStockDataClear(&MyData.BattleTowerWork.SBTT_Mine);

	for(j=0;j<5;j++){
		buf=(u32 *)&MyData.BattleTowerWork.SBTT[j];
		sum=0;
		for(i=0;i<(sizeof(StockBattleTowerTrainer)/4)-1;i++)
			sum+=buf[i];

		if(MyData.BattleTowerWork.SBTT[j].checksum!=sum)
			BattleTowerStockDataClear(&MyData.BattleTowerWork.SBTT[j]);
	}
}

//===============================================================
//
//		ストックデータのチェックサムメイク
//
//===============================================================

void	BattleTowerCheckSumMake(StockBattleTowerTrainer *SBTT)
{
	int	i;
	u32	*buf;

	buf=(u32 *)SBTT;
	SBTT->checksum=0;

	for(i=0;i<(sizeof(StockBattleTowerTrainer)/4)-1;i++)
		SBTT->checksum+=buf[i];
}

//===============================================================
//
//		ストックデータのクリア
//
//===============================================================

void	BattleTowerStockDataClear(StockBattleTowerTrainer *SBTT)
{
	int	i;
	u32	*buf;

	buf=(u32 *)SBTT;

	for(i=0;i<sizeof(StockBattleTowerTrainer)/4;i++)
		buf[i]=0;
}

//===============================================================
//
//		バトルタワーのTV企画データのストック
//
//===============================================================

void	BattleTowerTVDataStock(void)
{
	int	i;

	BattleTowerNameGet(MyData.BattleTowerWork.SBTTVD.TrainerName);

	MyData.BattleTowerWork.SBTTVD.EnemyLastPokeNo=PSP[1].monsno;	//相手の最後のポケモンナンバー
	MyData.BattleTowerWork.SBTTVD.MineLastPokeNo=PSP[0].monsno;		//自分の最後のポケモンナンバー

	for(i=0;i<MONS_NAME_SIZE;i++)
		MyData.BattleTowerWork.SBTTVD.MineLastPokeNickname[i]=PSP[0].nickname[i];
}

//===============================================================
//
//		バトルタワーの連勝記録を取得
//
//	in	:	level	取得するレベル（0:LV50　1:LV100）
//
//===============================================================

u16		BattleTowerWinGet(u8 level)
{
	u16	win;

	win=(MyData.BattleTowerWork.BattleTowerStage[level]-1)*7+
		(MyData.BattleTowerWork.BattleTowerRound[level]-1);

	if(win>9999)
		win=9999;

	return win;
}

//===============================================================
//
//		バトルタワーの連勝時の商品ゲット
//
//===============================================================

const u16 BattleTowerItemTbl1[]={
	ITEM_MAKKUSUAPPU,
	ITEM_TAURIN,
	ITEM_BUROMUHEKISIN,
	ITEM_RIZOTIUMU,
	ITEM_INDOMETASIN,
	ITEM_KITOSAN,
};

const u16 BattleTowerItemTbl2[]={
	ITEM_HIKARINOKONA,
	ITEM_SIROIHAABU,
	ITEM_SENSEINOTUME,
	ITEM_TABENOKOSI,
	ITEM_MENTARUHAABU,
	ITEM_OUZYANOSIRUSI,
	ITEM_KIAINOHATIMAKI,
	ITEM_PINTORENZU,
	ITEM_KODAWARIHATIMAKI,
};

void	BattleTowerItemSet(void)
{
	int	no;
	u8	level;

	level=MyData.BattleTowerWork.BattleTowerLevel;
	no=MyData.BattleTowerWork.BattleTowerStage[level]-1;

	if(no>5)
		MyData.BattleTowerWork.BattleTowerItemNo=
			BattleTowerItemTbl2[pp_rand()%NELEMS(BattleTowerItemTbl2)];
	else
		MyData.BattleTowerWork.BattleTowerItemNo=
			BattleTowerItemTbl1[pp_rand()%NELEMS(BattleTowerItemTbl1)];
}


void	BattleTowerItemGet(void)
{
	u8	level;
	level=MyData.BattleTowerWork.BattleTowerLevel;

	if(AddItem(MyData.BattleTowerWork.BattleTowerItemNo,1)==TRUE){
		GetItemName(MyData.BattleTowerWork.BattleTowerItemNo,StrTempBuffer0);
		AnswerWork=1;
	}
	else{
		AnswerWork=0;
		MyData.BattleTowerWork.BattleTowerSeqNo[level]=BATTLE_TOWER_NO_ITEM_GET;
	}
}

//===============================================================
//
//		８周目以降にもらえるリボン処理
//
//===============================================================

void	BattleTowerRibbonGet(void)
{
	int	i,j=1;
	u8	level;
	u8	id;

	level=MyData.BattleTowerWork.BattleTowerLevel;

	if(level)
		id=ID_victory_ribbon;			//ビクトリーリボン（バトルタワーLV100勝ち抜き）
	else
		id=ID_winning_ribbon;			//ウィニングリボン（バトルタワーLV50勝ち抜き）

	AnswerWork=0;
	if(BattleTowerWinGet(level)>=56){
		for(i=0;i<3;i++){
			j=MyData.BattleTowerWork.BattleTowerSelectPoke[i]-1;
			if(PokeParaGet(&PokeParaMine[j],id)==0){
				AnswerWork=1;
				PokeParaPut(&PokeParaMine[j],id,(u8 *)&AnswerWork);
			}
		}
	}
	if(AnswerWork)
		IncRecord(CNT_RIBBON);
}

//===============================================================
//
//		カードｅデータの保存（暫定）
//
//===============================================================

void	BattleCardEDataStock(void)
{
	StockBattleCardETrainer * SBTT_CardE;
	int	i,j;
	u8	trainerno;

	SBTT_CardE = &MyData.BattleTowerWork.SBTT_CardE;

	if(MyData.my_sex)
		trainerno=BattleTowerTrainerWoman[(MyData.ID[0]+
										   MyData.ID[1]+
										   MyData.ID[2]+
										   MyData.ID[3])%
										   sizeof(BattleTowerTrainerWoman)];
	else
		trainerno=BattleTowerTrainerMan[(MyData.ID[0]+
										 MyData.ID[1]+
										 MyData.ID[2]+
										 MyData.ID[3])%
										 sizeof(BattleTowerTrainerMan)];

	SBTT_CardE->trainerno = trainerno;
	ID_Copy(SBTT_CardE->id, MyData.ID);
	OyaNameCopy(SBTT_CardE->name, MyData.my_name);

	SBTT_CardE->win=1;

	j=7;
	for(i=0;i<6;i++){
		SBTT_CardE->aisatukaiwa[i]=Fld.kaiwa_battle[i];
		SBTT_CardE->winkaiwa[i]=j;
		SBTT_CardE->losekaiwa[i]=j+6;
		j++;
	}

	for(i=0;i<3;i++)
		PokeParaGetStock(&PokeParaMine[i], &SBTT_CardE->SBTP[i]);

	BattleCardECheckSumMake(SBTT_CardE);
}

//===============================================================
//
//		カードｅデータのトレーナーキャラナンバーをゲット
//
//===============================================================

u8		BattleCardEChrGet(void)
{
	return(TRCellTbl[MyData.BattleTowerWork.SBTT_CardE.trainerno]);
}

//===============================================================
//
//		カードｅデータのトレーナータイプナンバーをゲット
//
//===============================================================

u8		BattleCardETypeGet(void)
{
	return TRTypeTbl[MyData.BattleTowerWork.SBTT_CardE.trainerno];
}

//===============================================================
//
//		カードｅデータのトレーナーネームをゲット
//
//===============================================================

void	BattleCardENameGet(u8 *buf)
{
	int	i;

	for(i=0;i<5;i++)
		buf[i]=MyData.BattleTowerWork.SBTT_CardE.name[i];

	buf[i]=EOM_;
}

//===============================================================
//
//		カードｅデータのチェックサムチェック
//
//===============================================================

void	BattleCardECheckSumCheck(void)
{
	int	i;
	u32	*buf;
	u32	sum;

	AnswerWork=0;

	buf=(u32 *)&MyData.BattleTowerWork.SBTT_CardE;

	sum=0;
	for(i=0;i<(sizeof(StockBattleCardETrainer)/4)-1;i++)
		sum|=buf[i];

	if(sum==0){
		AnswerWork=1;
		return;
	}

	sum=0;
	for(i=0;i<(sizeof(StockBattleCardETrainer)/4)-1;i++)
		sum+=buf[i];

	if(MyData.BattleTowerWork.SBTT_CardE.checksum!=sum){
		BattleCardEStockDataClear(&MyData.BattleTowerWork.SBTT_CardE);
		AnswerWork=1;
	}
}

//===============================================================
//
//		ストックデータのチェックサムメイク
//
//===============================================================

void	BattleCardECheckSumMake(StockBattleCardETrainer *SBTT)
{
	int	i;
	u32	*buf;

	buf=(u32 *)SBTT;
	SBTT->checksum=0;

	for(i=0;i<(sizeof(StockBattleCardETrainer)/4)-1;i++)
		SBTT->checksum+=buf[i];
}

//===============================================================
//
//		ストックデータのクリア
//
//===============================================================

void	BattleCardEStockDataClear(StockBattleCardETrainer *SBTT)
{
	int	i;
	u32	*buf;

	buf=(u32 *)SBTT;

	for(i=0;i<sizeof(StockBattleCardETrainer)/4;i++)
		buf[i]=0;
}

//===============================================================
//
//		カードｅの簡易会話を取得する
//
//===============================================================

void	BattleCardEKaiwaGet(void)
{
	BattleTowerKaiwaGetAct((u16 *)&MyData.BattleTowerWork.SBTT_CardE.aisatukaiwa);
}


//===============================================================
//
//		カードｅの簡易会話を取得する
//
//===============================================================

void	BattleCardEWinLoseKaiwaGet(void)
{
	if(WinLoseFlag==FIGHT_DRAW){
		MsgExpandBuffer[0]=EOM_;
		return;
	}

	if(WinLoseFlag==FIGHT_WIN)
		BattleTowerKaiwaGetAct((u16 *)&MyData.BattleTowerWork.SBTT_CardE.losekaiwa);
	else
		BattleTowerKaiwaGetAct((u16 *)&MyData.BattleTowerWork.SBTT_CardE.winkaiwa);
}

//===============================================================
//
//		不正な終了したかチェック
//		(ＴＶ用		INIT_CTRL_LABELで呼ばれる) 02/09/27 nohara
//
//===============================================================
void	TVBattleTowerHuseiChk(void);
void	TVBattleTowerHuseiChk(void)
{
	int	i;

	for(i=0;i<2;i++){
		switch(MyData.BattleTowerWork.BattleTowerSeqNo[i]){
			case BATTLE_TOWER_CHALLENGE:		//挑戦して、正しくセーブしなかった
				TVBattleTowerInterViewClear();	//インタビュアー削除、シーンクリア
				break;
		}
	}
}

