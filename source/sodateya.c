//======================================================
//
//    sodateya.c
//
//    そだて屋・タマゴ                                  
//                                                      
//    Copyright (C) 2001 GAME FREAK inc.
//======================================================

//#define  SODATEYA_DEBUG
#define SODATEYA_MAIN

#include "common.h"
#include "intr.h"
#include "agbmons.h"
#include "calctool.h"
#include "actor.h"
#include "actanm.h"
#include "task.h"
#include "mus_tool.h"
#include "a_mine.h"
#include "a_enemy.h"
#include "print.h"
#include "window.h"
#include "script.h"
#include "wazatool.h"
#include "gamedata.h"
#include "ev_fight.h"
#include "..\script\saveflag.h"	
#include "item.h"
#include "pasocom.h"
#include "shinka.h"
#include "mail.h"
#include "ev_flag.h"
#include "fld_main.h"
#include "palanm.h"
#include "fld_task.h"
#include "pm_str.h"

#include "MaDefine.h"
#include "objdata.h"
#include "decord.h"
#include "bss.h"
#include "client.h"
//#include "cli_eff.h"
#include "menutool.h"

#include "server.h"
#include "pokelist.h"
#include "f_pmlist.h"
#include "agbmons.h"
#include "poketool.h"
#include "zukan.h"
#include "mapparam.h"

#include "monsno.def"
#include "wazano.def"
#include "kowaza.h"
#include "sodateya.h"

#include "namein.h"
// =================================================================
// 定義
// =================================================================
#define WAZA_MACHINE_MAX 	(58)		//技マシンの数
#define	BIRTH_LEVEL			(5)
#define METAMON_NO			(MONSNO_METAMON)
#define HUKA_FIRST_NATUKIDO (120)

// =================================================================
// extern
// =================================================================
extern PokeShinkaData 	PSD[][5];
extern PokePersonalData	PPD[];
extern const u8 sex_msg[][2];

extern s16 BoxTumeMineData();						//手持ちを詰める


extern const u32 DecordAdrs[];
extern const u8  PokeNameData[][6];



// =================================================================
// 育て屋用ワーク定義
// =================================================================

#ifdef SODATEYA_DEBUG
static SODATEYA_WORK Sodateya;						//仮のワーク
#endif



// =================================================================
// プロトタイプ宣言
// =================================================================
void PokemonTamagoSet(PokemonParam *poke, u16 monsno, u8 eventflag);
void PokemonTamagoSet2(PokemonParam *poke, u16 monsno, SODATEYA_WORK *sodateya);
void SioMailDataInit(SIO_MAIL_DATA	*smd);
static  u8 SodateyaPokeAffinitySub(SODATEYA_WORK	*sodateya);
static void TamagoDemoMsgTalkSet(const u8 * msg_adrs);
static void TamagoDemoMsgSet(const u8 *msg_adrs);
static u8 TamagoDemoTalkMsgPut();



// =================================================================
// 文字定数定義
// =================================================================

static const u8 AffinityMsg1[]={		//２ひきのなかはとってもよいようじゃ
	n2_,hi_,ki_,no_,spc_,na_,ka_,ha_,spc_,to_,ttu_,te_,mo_,spc_,yo_,i_,spc_,yo_,u_,zi_,yya_,
	EOM_,
};
static const u8 AffinityMsg2[]={		//２ひきのなかはまずまずのようじゃ
	n2_,hi_,ki_,no_,spc_,na_,ka_,ha_,spc_,ma_,zu_,ma_,zu_,no_,spc_,yo_,u_,zi_,yya_,
	EOM_,
};
static const u8 AffinityMsg3[]={		//２ひきのなかはそれほどよくないがなあ
	n2_,hi_,ki_,no_,spc_,na_,ka_,ha_,spc_,so_,re_,ho_,do_,spc_,yo_,ku_,na_,i_,ga_,na_,aa_,
	EOM_,
};
static const u8 AffinityMsg4[]={		//２ひきはおたがいにちがうポケモンたちとあそんでおるがなあ
	n2_,hi_,ki_,ha_,spc_,o_,ta_,ga_,i_,ni_,spc_,ti_,ga_,u_,CR_,
	PO_,KE_,MO_,N_,ta_,ti_,to_,spc_,a_,so_,n_,de_,o_,ru_,ga_,na_,a_,
	EOM_,
};

static const u8 *const AffinityMsg[]={		//相性文字列テーブル
	(u8*)AffinityMsg1,
	(u8*)AffinityMsg2,
	(u8*)AffinityMsg3,
	(u8*)AffinityMsg4,
};

static const u8 cr_msg[]		= {CR_,EOM_,};					//改行
static const u8 yameru_msg[]	= {ya_,me_,ru_,EOM_};		//「やめる」
static const u8 level_msg[]		= {L__,V__,EOM_};				//「ＬＶ」
static const u8 tamago_name[]	= {TA_,MA_,GO_,EOM_,};		//「たまご」


// =================================================================
// PokemonParamNickNameCopy
// 概要  : ポケモンの構造体に長い名前が入っていても５文字だけコピーする(海外対応用)
// 引数  : pp	PokemonParam
//       : name
// 戻り値: u8 *
// =================================================================
u8 *PokeParaNickNameCopy(PokemonParam *pp,u8 *name)
{
	u8 strwork[20];

	PokeParaGet(pp,ID_nickname,strwork);		//ポケモンの名前ゲット
	return NickNameCopy(name,strwork);
}


// =================================================================
// PokePasoParamNickNameCopy
// 概要  : ポケモンの構造体に長い名前が入っていても５文字だけコピーする(海外対応用)
// 引数  : ppp	PokemonPasoParam
//       : name
// 戻り値: u8 *
// =================================================================
u8 *PokePasoParaNickNameCopy(PokemonPasoParam *ppp,u8 *name)
{
	u8 strwork[20];

	PokePasoParaGet(ppp,ID_nickname,strwork);		//ポケモンの名前ゲット
	return NickNameCopy(name,strwork);
	
}
// =================================================================
// PokeAzukeruCheck
// 概要  : 預けているポケモンの数を返す
// 引数  : none
// 戻り値: u8
// =================================================================
u8 PokeAzukeruCheck(SODATEYA_WORK *sodateya)
{
	u8 result,i;
	
	result=0;
	for(i=0;i<2;i++){					//預けられているポケモンの数をカウント
		if(PokePasoParaGet(&sodateya->Pokemon[i],ID_monsno)!=0){
			result++;
		}
	}
	return result;
}

// =================================================================
// PokeAzukeInfoCheck
// 概要  : 育て屋に預けているポケモンのアイテム状況を調べる
// 引数  : sodateya
//       : mailinfo
// 戻り値: none
// =================================================================
void PokeAzukeInfoCheck(SODATEYA_WORK *sodateya, SODATEYA_MAIL *mailinfo)
{
	u8 result,i;
	
	result=0;
	for(i=0;i<2;i++){					//預けられているポケモンの数をカウント
		if(PokePasoParaGet(&sodateya->Pokemon[i],ID_monsno)!=0){	//ポケモンを預けていたらカウント
			result++;
			if(PokePasoParaGet(&sodateya->Pokemon[i],ID_item)!=0){	//アイテムを持っている
				mailinfo->PokeFlag[i] = 1;
			}else{
				mailinfo->PokeFlag[i] = 0;							//アイテムを持っていない（またはメールを持ってる）
			}
		}else{
			mailinfo->PokeFlag[i] = 1;								//ポケモンがいない
		}
	}
	mailinfo->PokeNum = result;
}

// =================================================================
// PokeAzukeruCheckGet
// 概要  : 預けられるなら空いてる番号を返す
// 引数  : none
// 戻り値: s8	0,1=空いてる番号	-1=無し
// =================================================================
s8 PokeAzukeruCheckGet(SODATEYA_WORK *sodateya)
{	
	u8 i;
	for(i=0;i<2;i++){					//預けてない領域があった
		if(PokePasoParaGet(&(sodateya->Pokemon[i]),ID_monsno)==0){
			return i;
		}
	}
	return -1;							//両方預けられてた
}



// =================================================================
// PokeSodateSet
// 概要  : ポケモンを預けるサブ
// 引数  : p
// 戻り値: none
// =================================================================
void PokeSodateSetSub(PokemonParam *p,SODATEYA_WORK *sodateya)
{
	s8 work;
	u8 mail;

	work = PokeAzukeruCheckGet(sodateya);	//空いてる場所を探す
	if(PokeMailCheck(p)){					//メールを持っているか
		PM_strcpy(sodateya->SioMail[work].oyaname,MyData.my_name);			//預けた親の名前セット
		PokeParaNickNameCopy(p,sodateya->SioMail[work].pokename);			//ポケモンの名前セット
		mail = PokeParaGet(p,ID_mailid);									//MailID取得
		sodateya->SioMail[work].Mail = Fld.MailData[mail];				//メールコピー
		PokeDelMail(p);														//手持ちのメール削除
	}
	sodateya->Pokemon[work] = p->PPP;		//ポケモンデータを育て屋ワークにセット
	PokePasoPPMaxSet(&sodateya->Pokemon[work]);	//ＰＰを回復
	sodateya->WalkCount[work] = 0;			//歩数初期化
	PokeParaInit(p);						//手持ちのポケモンを消す
	BoxTumeMineData();						//手持ちを詰める
	PokeCountMineGet();						//ポケモンの数再確認
}



// =================================================================
// PokeSodataSet
// 概要  : ポケモンを預ける
// 引数  : none
// 戻り値: none
// =================================================================
void PokeSodateSet()
{
	PokeSodateSetSub(&PokeParaMine[FPokeNo],&Fld.SodateyaWork);
}

// =================================================================
// SodateBoxTume
// 概要  : 育て屋ワークのポケモンを詰める
// 引数  : sodateya
// 戻り値: none
// =================================================================
static void SodateBoxTume(SODATEYA_WORK *sodateya)
{
	if(PokePasoParaGet(&sodateya->Pokemon[1],ID_monsno)!=0){			//Pokemon[1]にﾎﾟｹﾓﾝがいて
		if(PokePasoParaGet(&sodateya->Pokemon[0],ID_monsno)==0){		//Pokemon[0]にいない
			sodateya->Pokemon[0] = sodateya->Pokemon[1];
			PokePasoParaInit(&sodateya->Pokemon[1]);						//[0]に[1]の内容を移す
			sodateya->SioMail[0]   = sodateya->SioMail[1];				//メールも移す
			sodateya->WalkCount[0] = sodateya->WalkCount[1];			//歩数も移す
			sodateya->WalkCount[1] = 0;
			SioMailDataInit(&sodateya->SioMail[1]);						//[1]を初期化
		}
	}
}


// =================================================================
// PokeAutoLevelUp
// 概要  : 技覚えも自動的に行うレベルアップ処理
// 引数  : pp
// 戻り値: none
// =================================================================
static void PokeAutoLevelUp(PokemonParam *pp)
{
	int i;
	u8 flg;
	u16 waza;
	
	for(i=0;i<100;i++){							//どうせ１００までしかレベルはないし
		if(PokeLevelUpCheck(pp)){				//レベルアップしたか？
//			if(PokeWazaOboeCheck(pp)==NO_WAZA_SET){				//技を覚えるか
			flg = 1;
			while((waza=PokeWazaOboeCheck(pp,flg))){	//技を覚えるか
				flg=0;
				if(waza==NO_WAZA_SET){
					PokeWazaOboeOshidashi(pp,OboeWazaNo);	//技がいっぱいでも無理やり押しこむ
				}
			}
		}else{									//レベルアップしなかった→終了
			break;
		}
	}
	PokeParaCalc(pp);
}

// =================================================================
// PokeHikitoriSub
// 概要  : ポケモンを引き取るサブ
// 引数  : sodateya
//       : no
// 戻り値: u8 預けてるポケモンの残り
// =================================================================
u16 PokeHikitoriSub(SODATEYA_WORK *sodateya,u8 no)
{
	PokemonParam	pp;
	u32 exp;
	u16 monsno;

	PokePasoParaNickNameCopy(&(sodateya->Pokemon[no]),StrTempBuffer0);		//名前セット
	monsno = PokePasoParaGet(&(sodateya->Pokemon[no]),ID_monsno);

	PokeReplace(&sodateya->Pokemon[no],&pp);				//元のポケモンパラメータを取得
	if(PokeParaGet(&pp,ID_level)!=100){
		exp =  PokeParaGet(&pp,ID_exp);							//経験値を足す
		exp += sodateya->WalkCount[no];
		PokeParaPut(&pp,ID_exp,(u8*)&exp);
		PokeAutoLevelUp(&pp);									//ﾚﾍﾞﾙｱｯﾌﾟ処理
	}
	
	PokeParaMine[5] = pp;									//てもちにポケモンを格納
	if(sodateya->SioMail[no].Mail.design_no!=NON_ITEM){		//メールがあったら
		PokeAddWrittenMail(&PokeParaMine[5], &sodateya->SioMail[no].Mail);	//手持ちにメールをセット
		SioMailDataInit(&sodateya->SioMail[no]);							//育て屋のメールを初期化
	}
	BoxTumeMineData();										//手持ちを詰める
	PokePasoParaInit(&sodateya->Pokemon[no]);				//育て屋ワークから消去
	sodateya->WalkCount[no] = 0;							//歩数カウントも消去
	SodateBoxTume(sodateya);								//
	PokeCountMineGet();										//ポケモンの数再確認

	return monsno;											//ひきとったポケモンの番号
}

// =================================================================
// PokeHikitori
// 概要  : ポケモンを引き取る
// 引数  : none
// 戻り値: ひきとったポケモンの番号・TempBuffer0に引き取ったポケモンの名前
// =================================================================
u16 PokeHikitori()
{
	return PokeHikitoriSub(&Fld.SodateyaWork,ScriptParameter0);
}

// =================================================================
// GetSinkaPokeLevel
// 概要  : 歩数カウント足した時のポケモンのレベルを返す
// 引数  : p
//       : walk
// 戻り値: u8
// =================================================================
u8 GetSinkaPokeLevel(PokemonPasoParam *p, u32 walk)
{
	PokemonPasoParam	poke;
	u32	exp;

	poke = *p;
	exp   = PokePasoParaGet(p,ID_exp);				//最初の経験値を算出
	exp   += walk;					//歩数をたす
	PokePasoParaPut(&poke,ID_exp,(u8*)&exp);					//新しい経験値としてセット
	return PokePasoLevelCalc(&poke);			//新しいレベルを算出
	
}

// =================================================================
// SodatePokeLevelSetSub
// 概要  : レベル差を文字列で格納する
// 引数  : sodateya
//       : no
// 戻り値: none
// =================================================================
u8 GetSodatePokeLevel(SODATEYA_WORK *sodateya,u8 no)
{
	u8 level1,level2;

	level1 = PokePasoLevelCalc(&sodateya->Pokemon[no]);	//最初のレベルを算出
	level2 = GetSinkaPokeLevel(&sodateya->Pokemon[no], 
			 sodateya->WalkCount[no]);					//新しいレベルを算出
	
	return level2-level1;								//レベル差を返す
}

// =================================================================
// SodatePokeLevelSetSub
// 概要  : 育ててるポケモンの名前とレベル差の文字列をセット
// 引数  : sodateya
//       : no
// 戻り値: none
// =================================================================
u8 SodatePokeLevelSetSub(SODATEYA_WORK *sodateya, u8 no)
{
	u8 sa;
	
	sa = GetSodatePokeLevel(sodateya,no);				//育てたレベル差をセット
	PokePasoParaNickNameCopy(&sodateya->Pokemon[no],StrTempBuffer0);
	PM_NumMsgSet(StrTempBuffer1, sa, NUM_MODE_LEFT, 2);

	return sa;
}

// =================================================================
// PokeHikitoriRyoukinSub
// 概要  : PokeHikitoriRyoukinのサブルーチン
// 引数  : none
// 戻り値: u16 育てた料金
// =================================================================
u16 PokeHikitoriRyoukinSub(SODATEYA_WORK *sodateya, u8 no)
{
	u16 sa;
	sa = GetSodatePokeLevel(sodateya,no);				//育てたレベル差をセット
	PokePasoParaNickNameCopy(&sodateya->Pokemon[no],StrTempBuffer0);
	sa = sa*100+100;
	PM_NumMsgSet(StrTempBuffer1, sa, NUM_MODE_LEFT, 5);

	return sa;
	
}

// =================================================================
// PokeHikitoriRyoukin
// 概要  : 育ててるポケモンと料金を文字列でセットする
// 引数  : none(ただしPARAM0を見る)
// 戻り値: 料金
// =================================================================
void PokeHikitoriRyoukin()
{
	ScriptParameter1 = PokeHikitoriRyoukinSub(&Fld.SodateyaWork,ScriptParameter0);
}

// =================================================================
// void	SodateyaPlusWalk
// 概要  : 指定歩数歩いたことにする
// 引数  : count
// 戻り値: none
// =================================================================
void	SodateyaPlusWalk(u16 count)
{
	Fld.SodateyaWork.WalkCount[0]+=count;
	Fld.SodateyaWork.WalkCount[1]+=count;
}

// =================================================================
// SodatePokeLevelSet
// 概要  : ポケモンの名前とレベルの文字列をセットする
// 引数  : none(ただしPARAM0を見る)
// 戻り値: none
// =================================================================
u8 SodatePokeLevelSet()
{
	if(PokePasoParaGet(&Fld.SodateyaWork.Pokemon[ScriptParameter0],ID_monsno)){
		return SodatePokeLevelSetSub(&Fld.SodateyaWork,ScriptParameter0);
	}
	return 0;
}



// =================================================================
// SioMailDataInit
// 概要  : 通信メール構造体初期化
// 引数  : smd
// 戻り値: none
// =================================================================
void SioMailDataInit(SIO_MAIL_DATA	*smd)
{
	int i;
	
	for(i=0;i<PERSON_NAME_SIZE+EOM_SIZE;i++) 	
		smd->oyaname[i] = 0;						//親の名前初期化
	for(i=0;i<MONS_NAME_SIZE+EOM_SIZE;i++) 		
		smd->pokename[i] = 0;						//ポケモンの名前初期化

	MailDataInit(&smd->Mail);						//メールデータ


}




// =================================================================
// PokeSodateyaInit
// 概要  : 育て屋ワーク初期化
// 引数  : none
// 戻り値: none
// =================================================================
void PokeSodateyaInit(SODATEYA_WORK *sodateya)
{
	u8 i;

	for(i=0;i<2;i++){			
		PokePasoParaInit(&sodateya->Pokemon[i]);
		sodateya->WalkCount[i] = 0;
		SioMailDataInit(&sodateya->SioMail[i]);
	}
	sodateya->Egg = 0;
	sodateya->EggCount = 0;
}



// =================================================================
// PokeSearchChild
// 概要  : 渡したポケモンＩＤの大元の子供を返します
// 引数  : pokeid	ポケモンのＩＤ
// 戻り値: u16		子供のＩＤ（子供が無い場合はそのまま引数を返します）
// =================================================================
u16 PokeSearchChild(u16 pokeid)
{
	int i,r,w,flg;

	for(i=0;i<5;i++){					//最高5回サーチ(ﾊﾝｸﾞ対策)
		flg=0;
		for(r=1;r<KAIHATSU_NUM_MAX+1;r++){		//ポケモン全サーチ
			for(w=0;w<5;w++){			//進化方法5種類をサーチ
				if(PSD[r][w].ShinkaMons==pokeid){
					pokeid = r;
					flg=1;
					break;
				}
			}
			if(flg) break;
		}
		if(r==(KAIHATSU_NUM_MAX+1)) break;		//全部探しても引数に進化するポケモンはいなかった。
	}
	
	return pokeid;
}


// =================================================================
// PokeMakeTamago
// 概要  : タマゴを作る
// 引数  : sodateya
// 戻り値: none
// =================================================================
void PokeMakeTamago(SODATEYA_WORK *sodateya)
{

	sodateya->Egg = (pp_rand()%(RAND_MAX-1))+1;		//タマゴ乱数セット
	EventFlagSet(FE_SODATE_TAMAGO);					//おじいちゃん移動フラグset
	

	//母親と同じポケモン
	//レベルはパーソナルの生まれてくるレベル
	//パワー乱数は6項目中、ランダムで3項目を父親か母親と同じ数値にします
	//特殊能力は母親と同じ
	//技は通常にデータを作り、それから継承技をたしていきます
	//タマゴビットを立てます。
	//タマゴが孵るまでの歩数をなつき度の場所にいれます
}

void PokeMakeNidoranOsuTamago(SODATEYA_WORK *sodateya)
{
	sodateya->Egg = pp_rand() | 0x8000;
	EventFlagSet(FE_SODATE_TAMAGO);					//おじいちゃん移動フラグset
}


// =================================================================
// PokeTamagoSet
// 概要  : タマゴをセットする
// 引数  : none
// 戻り値: none
// =================================================================
void PokeTamagoSet()
{
	PokeMakeTamago(&Fld.SodateyaWork);
}

void PokeNidoranOsuSet()
{
	PokeMakeNidoranOsuTamago(&Fld.SodateyaWork);
}


#define BOX_MAX	6

// =================================================================
// SelectBoxTumeru
// 概要  : 箱を詰める（抽選用）
// 引数  : box
//       : num
// 戻り値: static u8
// =================================================================
static void SelectBoxTumeru(u8 *box, u8 num)
{
	int i,w;
	u8  work[6];
	
	box[num] = 0xff;				//指定されたＢＯＸをＦＦで埋める
	
	for(i=0;i<BOX_MAX;i++){			//そのままコピー
		work[i] = box[i];
	}
	w = 0;
	for(i=0;i<BOX_MAX;i++){			//0xffが入っていない箱だけ詰めて入れなおす
		if(work[i]!=0xff){
			box[w++] = work[i];
		}
	}
}

// =================================================================
// PokeChildRandSet
// 概要  : 子作り専用の乱数をセット
// 引数  : p
//       : sodateya
// 戻り値: none
// =================================================================
static void PokeChildRandSet(PokemonParam *p,SODATEYA_WORK *sodateya)
{
	u8 select[3],i,box[6],oya[3],work;

	for(i=0;i<6;i++) box[i] = i;			//０～５の箱を用意

	for(i=0;i<3;i++){						
		select[i] = box[pp_rand()%(6-i)];			//０～５のうち３つ選ぶ（どのパワー乱数を変更するか）
		SelectBoxTumeru(box,select[i]);
	}
	
	for(i=0;i<3;i++) oya[i] = pp_rand()%2;	//3つ０か１の乱数を選ぶ（父・母どちらから乱数を取り出すか）

	for(i=0;i<3;i++){						//抽選の結果から３つパワー乱数を親からコピーする
		switch(select[i]){
			case 0:
				work = PokePasoParaGet(&sodateya->Pokemon[oya[i]],ID_hp_rnd);
				PokeParaPut(p,ID_hp_rnd,(u8*)&work);
				break;
			case 1:
				work = PokePasoParaGet(&sodateya->Pokemon[oya[i]],ID_pow_rnd);
				PokeParaPut(p,ID_pow_rnd,(u8*)&work);
				break;
			case 2:
				work = PokePasoParaGet(&sodateya->Pokemon[oya[i]],ID_def_rnd);
				PokeParaPut(p,ID_def_rnd,(u8*)&work);
				break;
			case 3:
				work = PokePasoParaGet(&sodateya->Pokemon[oya[i]],ID_agi_rnd);
				PokeParaPut(p,ID_agi_rnd,(u8*)&work);
				break;
			case 4:
				work = PokePasoParaGet(&sodateya->Pokemon[oya[i]],ID_spepow_rnd);
				PokeParaPut(p,ID_spepow_rnd,(u8*)&work);
				break;
			case 5:
				work = PokePasoParaGet(&sodateya->Pokemon[oya[i]],ID_spedef_rnd);
				PokeParaPut(p,ID_spedef_rnd,(u8*)&work);
				break;
		}
	}
}

// =================================================================
// KowazaListGet
// 概要  : 継承技テーブルを取得する
// 引数  : p
//       : list
// 戻り値: none
// =================================================================
static u8 KowazaListGet(PokemonParam *p, u16 *list)
{
	u16 monsno,startno,num,i;

	num = 0;
	startno = 0;
		
	monsno = PokeParaGet(p,ID_monsno);		//自分のmonsnoを取得
	for(i=0;i<KOWAZA_TABLE_MAX;i++){			//子技テーブルの自分の場所をサーチ
		if(KowazaTable[i]==(20000+monsno)){
			startno = i+1;
			break;
		}
	}
	
	for(i=0;i<10;i++){							//最高８個しかないので、一応検索も１０個まで
		if(KowazaTable[startno+i]>20000){		//次のポケモンの先頭がきたら終了
			break;
		}else{
			list[i] = KowazaTable[startno+i];	//技リストを登録
			num++;
		}
	}

	return num;
}

static	u16 wazalist[50];
static	u16 dadlist[4];
static	u16 commonlist[4];
static	u16 kowazalist[10];
static	u16 mamlist[4];
// =================================================================
// KowazaSet
// 概要  : 継承技をセット
// 引数  : p		:タマゴのポインタ
//       : dad		:父ポケモン
//       : mam		:母ポケモン
// 戻り値: none
// =================================================================
static void KowazaSet(PokemonParam *p, PokemonPasoParam *dad,PokemonPasoParam *mam)
{
	u16 i,w,n,monsno,levelwazanum,kowazanum;
//	PokemonParam wp;

	n=0;
	for(i=0;i<4;i++){
		mamlist[i]    = 0;
		dadlist[i]    = 0;
		commonlist[i] = 0;
	}
	for(i=0;i<10;i++) kowazalist[i] = 0;
	for(i=0;i<50;i++) wazalist[i]   = 0;

	
	monsno = PokeParaGet(p,ID_monsno);
//	PokeParaSet(&wp,monsno,100,POW_RND,RND_NO_SET,0,ID_NO_SET,0);
	levelwazanum = PokeOboeruWazaAllGet(monsno,wazalist);		//レベルアップで覚える技をすべてリストアップ

	for(i=0;i<4;i++){							//親の持っている技を取得
		dadlist[i] = PokePasoParaGet(dad,ID_waza1+i);
		mamlist[i] = PokePasoParaGet(mam,ID_waza1+i);
	}

	kowazanum = KowazaListGet(p,kowazalist);				//継承技リストを取得
	
	//継承技計算
	for(i=0;i<4;i++){										//父親の持っている技と子の継承技を比較
		if(dadlist[i]!=0){							
			for(w=0;w<kowazanum;w++){								//子技の数分比較
				if(dadlist[i]==kowazalist[w]){
					if(PokeWazaSet(p,dadlist[i])==NO_WAZA_SET){		//技を覚えるか
						PokeWazaOboeOshidashi(p,dadlist[i]);	//技がいっぱいでも無理やり押しこむ
					}
					break;
				}
			}
		}else{
			break;
		}
	}
	
	//父親の覚えている技が子供が技マシンで覚えられる技の場合
	for(i=0;i<4;i++){
		if(dadlist[i]!=0){											//父親の持っている技が
			for(w=0;w<WAZA_MACHINE_MAX;w++){							//技マシンにあり、
				if(dadlist[i]==GetWazaNoItem(ITEM_WAZAMASIN01+w)){		//子供は技マシンでつけることができるなら
					if(PokeWazaMachineCheck(p,w)){		//技を覚えるか
						if(PokeWazaSet(p,dadlist[i])==NO_WAZA_SET){		//技を覚える
							PokeWazaOboeOshidashi(p,dadlist[i]);		//技がいっぱいでも無理やり押しこむ
						}
					}
				}
			}
		}
	}


	//父・母の共通してる技で子供がレベルアップ覚えられる技を取得
	for(i=0;i<4;i++){												//父・母の共通の技を取得
		if(dadlist[i]==0) break;
		for(w=0;w<4;w++){
			if(dadlist[i]==mamlist[w] && dadlist[i]!=0){
				commonlist[n++] = dadlist[i];
			}
		}
	}
	
	for(i=0;i<4;i++){												//共通技の継承
		if(commonlist[i]==0) break;										//父母の共通技が
		for(w=0;w<levelwazanum;w++){
			if(wazalist[w]!=0){											//子供のレベルアップで覚える技と
				if(commonlist[i] == wazalist[w]){						//同じなら
					if(PokeWazaSet(p,commonlist[i])==NO_WAZA_SET){		//技を覚えるか
						PokeWazaOboeOshidashi(p,commonlist[i]);			//技がいっぱいでも無理やり押しこむ
					}
					break;
				}
			}
		}
	
	}
}


// =================================================================
// DelSodateyaTamago
// 概要  : タマゴを消す
// 引数  : none
// 戻り値: none
// =================================================================
void DelSodateyaTamagoSub(SODATEYA_WORK *sodateya)
{
	//タマゴ処理の後始末
	sodateya->Egg = 0;												//タマゴ乱数ワーク初期化
	sodateya->EggCount=0;
}

void DelSodateyaTamago(void)
{
	DelSodateyaTamagoSub(&Fld.SodateyaWork);
}


// =================================================================
// RuririSoonanoCheck
// 概要  : ルリリとソーナノの特別処理
// 引数  : no      :生まれるタマゴのポケモンナンバー
//       : sodateya:育て屋ワーク
// 戻り値: static
// =================================================================
static void RuririSoonanoCheck(u16 *no,SODATEYA_WORK *sodateya)
{
	u16 flag,item1,item2;
	flag = 0;
	if(*no != MONSNO_SOONANO && *no != MONSNO_RURIRI){		//生まれるポケモンがソーナノかルリリ
		return;												//違ったら終了
	}
		
	item1 = PokePasoParaGet(&sodateya->Pokemon[0],ID_item);		//預けているポケモンのアイテムを確認
	item2 = PokePasoParaGet(&sodateya->Pokemon[1],ID_item);

	if(*no == MONSNO_SOONANO){								//ソーナノにのんきのおこうがなかったら
		if(item1 != ITEM_NONKINOOKOU && item2 != ITEM_NONKINOOKOU){
			*no = MONSNO_SOONANSU;							//ソーナンスに
		}
	}
	if(*no == MONSNO_RURIRI){								//ルリリにうしおのおこうがなかったら
		if(item1 != ITEM_USIONOOKOU && item2 != ITEM_USIONOOKOU){
			*no = MONSNO_MARIRU;							//マリルに
		}
	}
}






// =================================================================
// PokemonBotaiCheck
// 概要  : タマゴには何をいれるか
// 引数  : sodateya
//       : oya[]		oya[0]に母親,oya[1]に父親を格納
// 戻り値: static u16
// =================================================================
static u16 PokemonBotaiCheck(SODATEYA_WORK *sodateya, u8 oya[])
{
	u16 oyamonsno[2],i,flag,monsno,tamagono,temp;

	flag = 0;
	for(i=0;i<2;i++){
		if((oyamonsno[i]=PokePasoParaGet(&sodateya->Pokemon[i],ID_monsno))==METAMON_NO){	//メタモンチェック
			oya[0] = i^1;
			oya[1] = i;
		}else if(PokePasoSexGet(&sodateya->Pokemon[i])==MONS_FEMALE){		//母親のポケモンを探す
			oya[0] = i;
			oya[1] = i^1;
		}
	}

	monsno   = oyamonsno[oya[0]];				//母親が元になる
	tamagono = PokeSearchChild(monsno);			//子供を捜す

	if(tamagono==MONSNO_NIDORAN_F){								//ニドラン計算
		if(sodateya->Egg & 0x8000){				//タマゴ乱数の最上位ビットが立ってたら　ニドラン♂
			tamagono = MONSNO_NIDORAN_M;
		}else{									//逆はニドラン♀
			tamagono = MONSNO_NIDORAN_F;
		}
	}
	if(tamagono == MONSNO_IRUMIIZE){			//バルビート・イルミーゼ計算
		if(sodateya->Egg & 0x8000){
			tamagono = MONSNO_BARUBIITO;
		}else{
			tamagono = MONSNO_IRUMIIZE;
		}
	}
	
	//メタモンの反対側を母親として子供を作ったが、実際は♂や性別なしの時はこの後
	//父親として扱わないといけない時に父母を反転させる
	if(oyamonsno[oya[1]]==METAMON_NO && PokePasoSexGet(&sodateya->Pokemon[oya[0]])!=MONS_FEMALE){
		temp   = oya[1];
		oya[1] = oya[0];
		oya[0] = temp;
	}
	
	return tamagono;
//	PokePasoParaGet(&sodateya->Pokemon[oya[0]],ID_monsno);	//母親を元にする

}


// =================================================================
// PokeTamagoDelSub
// 概要  :	タマゴを貰う=生まれるポケモンを作る
// 引数  : sodateya
// 戻り値: none
// =================================================================
static void PokeTamagoDelSub(SODATEYA_WORK *sodateya)
{
	u16 tamagono;
	PokemonParam poke;
	u8 oya[2],flag;

	tamagono   = PokemonBotaiCheck(sodateya,oya);					//母体とするポケモンを探す
//	tamagono =  PokeSearchChild(monsno);							//子供ポケモンを捜す

	RuririSoonanoCheck(&tamagono,sodateya);									//マリルとソーナンスの特別処理

	PokemonTamagoSet2(&poke,tamagono, sodateya);							//タマゴを作成
	PokeChildRandSet(&poke,sodateya);										//子作り専用の乱数セット
	KowazaSet(&poke,&sodateya->Pokemon[oya[1]],&sodateya->Pokemon[oya[0]]);	//継承技をセット

	flag = 1;
	PokeParaPut(&poke,ID_tamago_flag,(u8*)&flag);					//タマゴフラグセット

	PokeParaMine[5] = poke;											//タマゴセット
	BoxTumeMineData();												//手持ちを詰める
	PokeCountMineGet();												//ポケモンの数再確認


	DelSodateyaTamagoSub(sodateya);
}


	
// =================================================================
// TamagoFlagsSet
// 概要  : タマゴを作る(イベント用。育て屋では使いません)
// 引数  : poke			:格納する場所のポインタ
//       : monsno		:ポケモンの番号（開発ナンバー）
//		 : flag			:ゲーム内イベントでもらったか？（はい＝１）
// 戻り値: none
// =================================================================
void PokemonTamagoSet(PokemonParam *poke, u16 monsno, u8 eventflag)
{
	u8  level,event,flag;
	u16 ball;
	
	PokeParaSet(poke,monsno,BIRTH_LEVEL,POW_RND,RND_NO_SET,0,ID_NO_SET,0);	//レベル５のポケモン

	level = 0;
	ball  = ITEM_MONSUTAABOORU;
	PokeParaPut(poke,ID_get_ball,(u8*)&ball);						//取得ボールをモンスターボールに
	PokeParaPut(poke,ID_nickname,(u8*)tamago_name);				//名前に「タマゴ」セット
	PokeParaPut(poke,ID_friend,(u8*)&PPD[monsno].egg_birth);		//孵化までカウンタをセット
	PokeParaPut(poke,ID_get_level,(u8*)&level);					//タマゴは取得時レベルを0に

	
	if(eventflag){													//タマゴくれるイベントの時は
		event = POS_EVENT_EGG;
		PokeParaPut(poke,ID_get_place,(u8*)&event);				//捕獲場所を格納
	}
	flag = 1;
	PokeParaPut(poke,ID_tamago_flag,(u8*)&flag);					//タマゴフラグセット
	
}

// =================================================================
// TamagoFlagsSet
// 概要  : タマゴを作る
// 引数  : poke			:格納する場所のポインタ
//       : monsno		:ポケモンの番号（開発ナンバー）
//		 : sodateya		:育て屋ワーク
// 戻り値: none
// =================================================================
void PokemonTamagoSet2(PokemonParam *poke, u16 monsno, SODATEYA_WORK *sodateya)
{
	u8  level;
	u16 ball;
	u32 personal_rnd;
	
	personal_rnd = (sodateya->Egg) | (pp_rand()<<16);
	PokeParaSet(poke,monsno,BIRTH_LEVEL,POW_RND,RND_SET,personal_rnd,ID_NO_SET,0);	//レベル５のポケモン

	level = 0;
	ball  = ITEM_MONSUTAABOORU;
	PokeParaPut(poke,ID_get_ball,(u8*)&ball);						//取得ボールをモンスターボールに
	PokeParaPut(poke,ID_nickname,(u8*)tamago_name);				//名前に「タマゴ」セット
	PokeParaPut(poke,ID_friend,(u8*)&PPD[monsno].egg_birth);		//孵化までカウンタをセット
	PokeParaPut(poke,ID_get_level,(u8*)&level);					//タマゴは取得時レベルを0に
	
}

// =================================================================
// PokeTamagoDel
// 概要  : タマゴを消す&タマゴを貰う
// 引数  : none
// 戻り値: none
// =================================================================
void PokeTamagoDel()
{
	PokeTamagoDelSub(&Fld.SodateyaWork);
}


// =================================================================
// PokeSodateya
// 概要  : 育て屋処理	（一歩歩く毎に処理されます）
// 多分u8 EventMoveCheck( EV_POS * p, u16 attr, u8 site)に入れる
//
// 引数  : none
// 戻り値: none
// =================================================================
u8 PokeSodateyaSub(SODATEYA_WORK *sodateya)
{
	u32 i,work,flag,affinity,lottery;

	flag = 0;
	for(i=0;i<2;i++){			
		if(PokePasoParaGet(&sodateya->Pokemon[i],ID_poke_exist_flag)!=0){	//ポケモンが預けられていたら
			sodateya->WalkCount[i]++;								//歩数カウント++
			flag++;
		}
	}
	if(sodateya->Egg==0&&flag==2){									//たまごが無かったら
		if((sodateya->WalkCount[1]&0xff)==0xff){				
//		if((sodateya->WalkCount[1]&0x1)==0x1){				
			affinity = SodateyaPokeAffinitySub(sodateya);				//相性取得
			lottery  = pp_rand();
			lottery  = (lottery*100)/RAND_MAX;
			if(affinity>lottery){
				PokeTamagoSet();									//タマゴ乱数セット
			}
		}
	}


	
	if(++sodateya->EggCount==255){								//たまごカウントいつもまわしとく
//	if(++sodateya->EggCount==10){								//たまごカウントいつもまわしとく
		for(i=0;i<PokeCountMine;i++){
			if(PokeParaGet(&PokeParaMine[i],ID_tamago_flag)){	//たまごを持っているか
//				if(pp_rand()>=RAND_MAX/2){							//抽選なくなりました（2002/08/21）
					work=PokeParaGet(&PokeParaMine[i],ID_friend);
					if(work!=0){								//孵化ウェイトを減らす
						work--;
						//デクリメントしたなつき度をセットしなおす
						PokeParaPut(&PokeParaMine[i],ID_friend,(u8*)&work);
					}else{										//タマゴが孵る
						ScriptParameter0 = i;
						return TRUE;
					}
//				}
			}
		}
//		sodateya->EggCount =0;
	}
	return FALSE;
}

// =================================================================
// u8	PokeSodateya
// 概要  : 一歩歩くごとに経験値が加算（ev_check.cに呼ばれます）
// 引数  : none
// 戻り値: none
// =================================================================
u8	PokeSodateya()
{
	return PokeSodateyaSub(&Fld.SodateyaWork);
}


// =================================================================
// PokemonTamagoCheck
// 概要  : タマゴがいるかどうか
// 引数  : none
// 戻り値: u8		いたら１	いなかったら０
// =================================================================
u8 PokeTamagoCheck(SODATEYA_WORK *sodateya)
{
	return ((sodateya->Egg)!=0);
}


// =================================================================
// SodateyaNameSet
// 概要  : じいさんの言葉用に文字列を埋めこむ
// 引数  : sodateya
// 戻り値: none
// =================================================================
static void SodateyaNameSet(SODATEYA_WORK *sodateya)
{
	u8 strbuf[MONS_NAME_SIZE+EOM_SIZE];
	if(PokePasoParaGet(&sodateya->Pokemon[0],ID_monsno)!=0){			//一番目のポケモンの名前
		PokePasoParaNickNameCopy(&sodateya->Pokemon[0],StrTempBuffer0);
//		NickNameCopy( StrTempBuffer0, strbuf );
//		PM_strcpy( StrTempBuffer0, strbuf );

		PokePasoParaGet(&sodateya->Pokemon[0],ID_oyaname,strbuf);		//親の名前
		PM_strcpy( StrTempBuffer2, strbuf );

	}
	if(PokePasoParaGet(&sodateya->Pokemon[1],ID_monsno)!=0){			//二番目のポケモンの名前
		PokePasoParaNickNameCopy(&sodateya->Pokemon[1],StrTempBuffer1);
//		NickNameCopy( StrTempBuffer1, strbuf );
//		PM_strcpy( StrTempBuffer1, strbuf );
	}

}

// =================================================================
// void	SodateyaAzukeName
// 概要  : ポケモンリストで選択したポケモンの名前をセットする
// 引数  : none
// 戻り値: monsnoを返す
// =================================================================
u16	SodateyaAzukeName()
{
	PokePasoParaNickNameCopy(&(PokeParaMine[FPokeNo].PPP),StrTempBuffer0);
	return PokePasoParaGet(&(PokeParaMine[FPokeNo].PPP),ID_monsno);
}

// =================================================================
// SodateyaPokeNameSet
// 概要  : ２体預けてるときのじいさんの言葉用の準備
// 引数  : none
// 戻り値: none
// =================================================================
void SodateyaPokeNameSet(void)
{
	SodateyaNameSet(&Fld.SodateyaWork);
}



// =================================================================
// SodateyaZiisannCheck
// 概要  : じいさんに話しかけたときにチェック
// 引数  : none
// 戻り値: u8	0:なし	1:タマゴあり	2:1匹預けてる	3:2匹預けてる
// =================================================================
u8 SodateyaZiisannCheck()
{
	u8 num;
 	if(PokeTamagoCheck(&Fld.SodateyaWork)){								//タマゴチェック
		return 1;
	}
	if((num=PokeAzukeruCheck(&Fld.SodateyaWork))){						//預けてるかチェック
		return num+1;
	}
	return 0;													//無し
}


// =================================================================
// TamagoGroupCheck
// 概要  : タマゴグループが同じものがあるか比較する
// 引数  : p1
//       : p2
// 戻り値: static u8
// =================================================================
static u8 TamagoGroupCheck(u16 *p1, u16 *p2)
{
	int i,w;
	
	for(i=0;i<2;i++){
		for(w=0;w<2;w++){
			if(p1[i]==p2[w]) return 1;
		}
	}
	return 0;
}

#define NO_TAMAGO_GROUP		(15)
#define METAMON_GROUP		(13)

// =================================================================
// SodateyaPokeAffinitySub
// 概要  : ポケモンが２体いるときに相性を返す
// 引数  : sodateya
// 戻り値: u8
// =================================================================
static  u8 SodateyaPokeAffinitySub(SODATEYA_WORK	*sodateya)
{
	u16 group[2][2],monsno[2];
	u32	id[2],sex[2],rnd,i;

	for(i=0;i<2;i++){
		monsno[i] = PokePasoParaGet(&sodateya->Pokemon[i],ID_monsno);	//モンスターＮＯ
		id[i]     = PokePasoParaGet(&sodateya->Pokemon[i],ID_id_no);	//ＩＤ　ＮＯ

		rnd    = PokePasoParaGet(&sodateya->Pokemon[i],ID_personal_rnd);	//個性乱数
		sex[i] = PokeSexGetMonsNo(monsno[i],rnd);							//性別取得
		group[i][0] = PPD[monsno[i]].egg_group1;						//タマゴグループ１
		group[i][1] = PPD[monsno[i]].egg_group2;						//タマゴグループ２
	}

	
	if(group[0][0]==NO_TAMAGO_GROUP||group[1][0]==NO_TAMAGO_GROUP){	//無生殖グループとは生まれない
		return 0;													
	}
	if(group[0][0]==METAMON_GROUP && group[1][0]==METAMON_GROUP)	//メタモンとメタモンからは生まれない
		return 0;
	
	if(group[0][0]==METAMON_GROUP||group[1][0]==METAMON_GROUP){		//メタモンが片方にいる
		if(id[0]==id[1]) 	return 20;								//ＩＤが同じなら２０％
		else				return 50;								//違うなら５０％
	}
	if(sex[0]==sex[1])	return 0;						//同じ性別は相性ゼロ
	if(sex[0]==MONS_UNKNOWN || sex[1]==MONS_UNKNOWN)	//メタモンチェック後は性別無しは相性ゼロ
		return 0;

	if(TamagoGroupCheck(group[0],group[1])==0) return 0;//グループが違ったら相性ゼロ

	
	if(monsno[0]==monsno[1]){							//ポケモンの種類が同じ
		if(id[0]!=id[1])	return 70;					//ＩＤが違う
		else				return 50;
	}else{												//ポケモンの種類が違う
		if(id[0]!=id[1])	return 50;					//ＩＤが違う
		else				return 20;
		
	}
	return 0;
}


// =================================================================
// SodateyaPokeAffinity
// 概要  : ２体の相性を返す
// 引数  : none
// 戻り値: u8	相性度 = 0-70(%)
// =================================================================
u8 SodateyaPokeAffinity()
{
	return SodateyaPokeAffinitySub(&Fld.SodateyaWork);
}

// =================================================================
// SodateyaPokeAffinityMsgSet
// 概要  : ２たいの相性によってじいさんの返す言葉をセットする
// 引数  : none
// 戻り値: u8
// =================================================================
void SodateyaPokeAffinityMsgSet()
{
	u8 work,result;
	work = SodateyaPokeAffinity();				//二体の相性を取得
	result = 0;
	if(work==0)		result=3;	//べつべつにあそんどるがなあ			
	if(work==20) 	result=2;	//それほどよくないがなあ
	if(work==50)	result=1;	//まずまずのようじゃ
	if(work==70)  	result=0;	//とってもよいようじゃ
	
	PM_strcpy(MsgExpandBuffer,AffinityMsg[result]);	//相性ごとの文章をセット

}


// =================================================================
// SexSymbolCheck
// 概要  : 文字列のなかに要求する性別記号はあったか
// 引数  : buf
//       : sex
// 戻り値: static u8	1:あった	0:なかった・もしくは両方あった
// =================================================================
static u8 SexSymbolCheck(u8 *buf, u8 sex)
{
	u8 i,check[2];
	check[0] = check[1] = 0;
	i = 0;
	
	while(buf[i]!=EOM_){
		if(buf[i]==osu_ ) check[0]++;	//♂記号を検索
		if(buf[i]==mesu_) check[1]++;	//♀記号を検索
		i++;
	}
	
	if(sex==MONS_MALE){
		if(check[0]!=0 && check[1]==0) return 1;
	}
	if(sex==MONS_FEMALE){
		if(check[1]!=0 && check[0]==0) return 1;
	}
	
	return 0;
}

// =================================================================
// PM_SexStrcat
// 概要  : 文字列の最後に性別記号を追加する
//         ただし文字列の中に性別記号が既にないかをチェックする
// 引数  : buf
//       : sex
// 戻り値: u8 *
// =================================================================
u8 *PM_SexStrcat(u8 *buf,u8 sex)
{
	if(sex==MONS_MALE){								//♂
		if(SexSymbolCheck(buf,MONS_MALE)==0){		//既に使われていないか
			return PM_strcat(buf,sex_msg[0]);
		}
	}else if(sex==MONS_FEMALE){						//♀
		if(SexSymbolCheck(buf,MONS_FEMALE)==0){		//既に使われていないか
			return PM_strcat(buf,sex_msg[1]);		
		}
	}
	return PM_strcat(buf,sex_msg[2]);				//性別無し・もしくは既に性別あり
	
}
// =================================================================
// PPP_SexStrcat
// 概要  : 性別の記号をあてる、ニドラン対策つき
// 引数  : buf		:文字列バッファ
//       : pokemon	:ポケモンデータ構造体
// 戻り値: u8 *		:文字列の最後のポインタ
// =================================================================
u8 *PPP_SexStrcat(u8 *buf, PokemonPasoParam *pokemon)
{
	u8 sex;
	//性別
	sex=PokePasoSexGet(pokemon);						
	return PM_SexStrcat(buf, sex);
}


#define HIKITORI_X1	15								//ひきとりリストのX座標
#define HIKITORI_Y1	6								//ひきとりリストのY座標
#define HIKITORI_W	14								//ひきとりリストの幅
#define HIKITORI_H	7								//ひきとりリストの高さ
#define HIKITORI_X2	(HIKITORI_X1+HIKITORI_W)
#define HIKITORI_Y2	(HIKITORI_Y1+HIKITORI_H)
#define HIKITORI_NAME_LEN		(5+1+1)				//名前５文字＋性別＋空白
#define HIKITORI_LEVEL_START	(HIKITORI_X1+HIKITORI_NAME_LEN+2)	//レベル表示の場所の定義


// =================================================================
// MakeSelectSodateList
// 概要  : 育て屋にあずけてあるポケモン２体の名前を表示
// 引数  : sodateya
//       : buf
// 戻り値: none
// =================================================================
void MakeSelectSodateList(SODATEYA_WORK *sodateya,u8 *buf)
{
	u8 strbuf[2][20],i;
	
	buf[0] = EOM_;
	for(i=0;i<2;i++){
		//預けてるポケモンの名前
		PokePasoParaNickNameCopy(&(sodateya->Pokemon[i]),strbuf[i]);
		
//		PM_strcat(buf,strbuf);			

		PPP_SexStrcat(strbuf[i],&sodateya->Pokemon[i]);

		//改行
//		PM_strcat(buf,cr_msg);
	}
	PM_strcpy(buf,strbuf[0]);
	PM_strcat(buf,cr_msg);
	PM_strcat(buf,strbuf[1]);
	PM_strcat(buf,cr_msg);
	PM_strcat(buf,yameru_msg);											//「やめる」

}

// =================================================================
// MakeSodateLevelList
// 概要  : レベル表示用の文字列を作成
// 引数  : sodateya
//       : buf
// 戻り値: none
// =================================================================
void MakeSodateLevelList(SODATEYA_WORK *sodateya,u8 *buf)
{
	u8 strbuf[20],i;
	u32 level;

	buf[0] = EOM_;
	for(i=0;i<2;i++){
		//レベル表示
		PM_strcat(buf,level_msg);
		level = GetSinkaPokeLevel(&sodateya->Pokemon[i], sodateya->WalkCount[i]);	
		PM_NumMsgSet(strbuf, level, NUM_MODE_LEFT, 3);
		PM_strcat(buf,strbuf);
		PM_strcat(buf,cr_msg);
	}
}
// =================================================================
// HikitoriCursor
// 概要  : 選択メニュータスク
// 引数  : no
// 戻り値: none
// =================================================================
static void HikitoriCursor(u8 no)
{
	if(sys.Trg&U_KEY){											//上移動
		if(TaskTable[no].work[0]){
			TaskTable[no].work[0]--;
			NMenuVCursorSet(-1);
			SePlay(SE_SELECT);
		}
	}else if(sys.Trg&D_KEY){									//下移動
		if(TaskTable[no].work[0]!=2){
			TaskTable[no].work[0]++;
			NMenuVCursorSet(1);
			SePlay(SE_SELECT);
		}
	}else if(sys.Trg&A_BUTTON){									//決定
		SePlay(SE_SELECT);
		FPokeNo = AnswerWork = TaskTable[no].work[0];
		
		DelTask(no);					//選択タスク終了
		NMenuBoxClear(HIKITORI_X1, HIKITORI_Y1, HIKITORI_X2, HIKITORI_Y2);	//リストクリア
		ContinueFieldScript();			//スクリプト再開
	}else if(sys.Trg&B_BUTTON){									//キャンセル
		FPokeNo = AnswerWork = 2;
		DelTask(no);					//選択タスク終了
		NMenuBoxClear(HIKITORI_X1, HIKITORI_Y1, HIKITORI_X2, HIKITORI_Y2);	//リストクリア
		ContinueFieldScript();			//スクリプト再開
	}
}



// =================================================================
// SodateyaSelectPoke
// 概要  : ひきとるポケモンが二体いるときに選択するメニュー
// 引数  : none
// 戻り値: none
// =================================================================
void SodateyaSelectPoke()
{
	u8 strbuf[100];
	NMenuWinBoxWrite(HIKITORI_X1, HIKITORI_Y1, HIKITORI_X2, HIKITORI_Y2);//枠描画

	MakeSelectSodateList(&Fld.SodateyaWork,strbuf);								//名前リスト作成
	NMenuMsgWrite(strbuf, HIKITORI_X1+2, HIKITORI_Y1+1);				//表示

	MakeSodateLevelList(&Fld.SodateyaWork,strbuf);								//レベルリスト作成
	NMenuMsgWrite(strbuf, HIKITORI_LEVEL_START, HIKITORI_Y1+1);			//表示

	NMenuVCursorInit(HIKITORI_X1+1, HIKITORI_Y1+1, 3, 0);				//カーソル表示
	AddTask(HikitoriCursor,3);											//タスク登録
};

// =================================================================
// SodatePokeListCall
// 概要  : ポケモンリストの呼び出し
// 引数  : none
// 戻り値: none
// =================================================================
void SodatePokeListCall()
{
	PokeListCall(GROW_POKELIST_ID,SINGLE_LIST);
	sys.pReturnProc = FieldMainRecover;
//	ContinueFieldScript();			//スクリプト再開

}

// =================================================================
// Tamago2Pokemon
// 概要  : タマゴをポケモンに戻す
//         他人から貰ったタマゴはＩＤと個性乱数のせいで
//         タマゴフラグを落とすだけでは処理できないので
//         必要なパラメータを格納したポケモンを構築しなおすことにする
// 引数  : p
//       : temp
// 戻り値: none
// =================================================================
static void Tamago2Pokemon(PokemonParam *p, PokemonParam *temp)
{
	//他人からタマゴを貰った時、タマゴから孵化したポケモンは前の人のものではなく
	//孵化させた人のＩＤになる。これに対応するために一旦暗号化されている
	//データをすべて展開して格納しなおすことにする
	
	//monsno,level,waza1,waza2,waza3,waza4,personal_rnd,pow_rnd,hp_rnd,agi_rnd,def_rnd,spepow_rnd,
	//spedef_rnd,oyaname
	u16 monsno,waza[4];
	u32 personal_rnd,rnds[6],pokerus;
	u8  i,country_code,get_cassette,mark,friend;

	monsno = PokeParaGet(p,ID_monsno);						//ポケモンナンバー
	for(i=0;i<4;i++)
		waza[i] = PokeParaGet(p,ID_waza1+i);				//技取得
	personal_rnd = PokeParaGet(p,ID_personal_rnd);			//個性乱数取得
	for(i=0;i<6;i++)
		rnds[i] = PokeParaGet(p,ID_hp_rnd+i);				//６つの乱数取得
	country_code = PokeParaGet(p,ID_country_code);			//国コード
	get_cassette = PokeParaGet(p,ID_get_cassette);			//捕獲カセット
	mark         = PokeParaGet(p,ID_mark);					//マーク
	pokerus      = PokeParaGet(p,ID_pokerus);				//ポケルス状態

	//ここからポケモン作成

	PokeParaSet(temp,monsno,BIRTH_LEVEL,POW_RND,RND_SET,personal_rnd,ID_NO_SET,0);	//レベル５のポケモン

	for(i=0;i<4;i++)
		PokeParaPut(temp,ID_waza1+i,(u8*)&(waza[i]));		//技格納
	for(i=0;i<6;i++)
		PokeParaPut(temp,ID_hp_rnd+i,(u8*)&(rnds[i]));		//６つの乱数格納
	PokeParaPut(temp,ID_country_code,(u8*)&country_code);	//国コード
    PokeParaPut(temp,ID_get_cassette,(u8*)&get_cassette);	//捕獲カセット
	PokeParaPut(temp,ID_mark,(u8*)&mark);					//マーク
	friend = HUKA_FIRST_NATUKIDO;			
	PokeParaPut(temp,ID_friend,(u8*)&friend);				//なつき度を120に
	PokeParaPut(temp,ID_pokerus,(u8*)&pokerus);				//ポケルス状態をセット

	*p = *temp;												//データをコピー
}

// =================================================================
// SodateTamagoHuka
// 概要  : タマゴをポケモンにかえす
// 引数  : no = 手持ちＮＯ
// 戻り値: none
// =================================================================
static void SodateTamagoHukaSub(u8 no)
{
	u8 	work1,work2,mappos;
	u16	monsno,zukanno,ball,level;
	u8	namebuf[11];

	work1 = 0;
	work2 = 70;



	Tamago2Pokemon(&PokeParaMine[no],&PokeParaEnemy[0]);				//タマゴをポケモンに戻す



//	PokeParaPut(&PokeParaMine[no],ID_tamago_flag,(u8*)&work1);			//タマゴフラグOFF
	PokeParaPut(&PokeParaMine[no],ID_tamago_flag,(u8*)&work2);			//なつき度を初期値に

	monsno  = PokeParaGet(&PokeParaMine[no],ID_monsno);					//ポケモンＮＯを取得

	PokeNameSet(namebuf,monsno);					//名前セット
	PokeParaPut(&PokeParaMine[no],ID_nickname,namebuf);
	
	zukanno = PokeMonsNo2ZukanNoGet(monsno);							//図鑑ＮＯへ変換
	ZukanCheck(zukanno,Z_SEE_SET);										//図鑑見たフラグセット
	ZukanCheck(zukanno,Z_GET_SET);										//図鑑ゲットフラグセット

	PokeParaNickNameCopy(&PokeParaMine[no],StrTempBuffer0);

	ball  = ITEM_MONSUTAABOORU;
	PokeParaPut(&PokeParaMine[no],ID_get_ball,(u8*)&ball);				//取得ボールをモンスターボールに
	level = 0;
	PokeParaPut(&PokeParaMine[no],ID_get_level,(u8*)&level);			//タマゴは取得時レベルを0に


	mappos = GetNowWorldPos();											//孵化した場所を設定
	PokeParaPut(&PokeParaMine[no],ID_get_place,&mappos);
	PokePPMaxSet(&PokeParaMine[no]);									//PPを回復


	PokeParaCalc(&PokeParaMine[no]);
}

// =================================================================
// SodateTamagoHuka
// 概要  : タマゴからポケモンが孵化する
// 引数  : none
// 戻り値: none
// =================================================================
void SodateTamagoHuka()
{
	SodateTamagoHukaSub(ScriptParameter0);
}


static u8 SodateyaMailCheckSub(SODATEYA_WORK *sodateya, u8 no)
{
	u8 pokename[30];

	PokePasoParaNickNameCopy(&sodateya->Pokemon[no],pokename);	//ポケモンの名前取得
	if(sodateya->SioMail[no].Mail.design_no==NON_ITEM) return 0;		//メールが無いなら終了
	
	if((PM_strcmp(pokename,sodateya->SioMail[no].pokename)!=0)||	//ポケモンの名前がメールと違うか
	(PM_strcmp(MyData.my_name,sodateya->SioMail[no].oyaname)!=0)){	//メールをつけた親の名前と自分が違うなら
		PM_strcpy(StrTempBuffer0,pokename);								
		PM_strcpy(StrTempBuffer1,sodateya->SioMail[no].oyaname);		
		PM_strcpy(StrTempBuffer2,sodateya->SioMail[no].pokename);		
		return 1;
	}
	return 0;
}
// =================================================================
// SodateyaMailCheck
// 概要  : レコードコーナーでメールが交換されていないかチェック
// 引数  : none（ただしScriptParameter0に0か1が入っている）
// 戻り値: u8 0=メールは無い・他人のメールは無い  1=他人からのメールがある
// =================================================================
u8 SodateyaMailCheck()
{
	return SodateyaMailCheckSub(&Fld.SodateyaWork,ScriptParameter0);
}


#include "..\scaddata\tamago.acl"
#include "..\scaddata\tamagoan.ach"
#include "..\scaddata\tamago_o.ach"

//-----------------------------------------------------------
//    タマゴ孵化デモ用アクター定義
//-----------------------------------------------------------

// --------------タマゴ-----------------------------------
static void ActTamagoHukaMove(actWork *act);
static void ActTamagoHukaMove2(actWork *act);
static void ActTamagoHukaMove3(actWork *act);
static void ActTamagoHukaMove4(actWork *act);
static void ActTamagoHukaMove5(actWork *act);
static void ActTamagoHukaMove6(actWork *act);
static void TamagoPartsSet(u8 x, u8 y, s16 dx ,s16 dy, s16 gg,u8 n);
static void TamagoPartsActMove(actWork *act);
static void TamagoPartsPut();

//------------矢印---------------------

static const ActOamData TamagoOamData = {
		0,		//u32 VPos:8;             // Ｙ座標
		0,		//u32 AffineMode:2;       // アフィンモード
		0,		//u32 ObjMode:2;          // ＯＢＪモード
		OFF,	//u32 Mosaic:1;           // モザイク
		0,		//u32 ColorMode:1;        // １６色/２５６色 選択
		0,		//u32 Shape:1;            // ＯＢＪ形状(横長方形)

		0,		//u32 HPos:9;             // Ｘ座標
		0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
		2,		//u32 Size:2;             // ＯＢＪサイズ(2だと32x32  3だと64x64)

		0,		//u32 CharNo:10;          // キャラクタＮｏ
		1,      //u32 Priority:2;         // 表示優先
		0,		//u32 Pltt:4;             // パレットＮｏ
		0,
};

static const actAnm TamagoAnm0[]={		{OBJ16_32x32*0,5,0,0},
										{ACT_ANMEND,0,0,0}
};
static const actAnm TamagoAnm1[]={		{OBJ16_32x32*1,5,0,0},
										{ACT_ANMEND,0,0,0}
};
static const actAnm TamagoAnm2[]={		{OBJ16_32x32*2,5,0,0},
										{ACT_ANMEND,0,0,0}
};
static const actAnm TamagoAnm3[]={		{OBJ16_32x32*3,5,0,0},
										{ACT_ANMEND,0,0,0}
};



static const actAnm *const TamagoAnmTbl[]={
		TamagoAnm0,
		TamagoAnm1,
		TamagoAnm2,
		TamagoAnm3,
};


//アニメーションデータフォーマット
/*
	s16 pat;	        //ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ
	u8 	wait:6;		//ｳｪｲﾄ
	u8 	hrev:1;		//H反転
	u8 	vrev:1;		//V反転
*/

static const CellData TamagoActCell={
	tamagoan_Character,0x20*16*4,12345
};
static const CellData TamagoPartsActCell={
	tamago_o_Character,0x20*4,23456
};

static const PalData TamagoActPal = 
{
	tamago_Palette,
	54321,
};


//-------------------------------------------------------------
//		アクターヘッダー
//-------------------------------------------------------------
static const	actHeader ActTamagoHeader={
		12345,
		54321,
		&TamagoOamData,
		TamagoAnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		DummyActMove,
};

// --------------タマゴの破片------------------------------
static void TamagoPartsActMove(actWork *act);

static const ActOamData TamagoPartsOamData = {
		0,		//u32 VPos:8;             // Ｙ座標
		0,		//u32 AffineMode:2;       // アフィンモード
		0,		//u32 ObjMode:2;          // ＯＢＪモード
		OFF,	//u32 Mosaic:1;           // モザイク
		0,		//u32 ColorMode:1;        // １６色/２５６色 選択
		0,		//u32 Shape:1;            // ＯＢＪ形状(横長方形)

		0,		//u32 HPos:9;             // Ｘ座標
		0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
		0,		//u32 Size:2;             // ＯＢＪサイズ(2だと32x32  3だと64x64)

		0,		//u32 CharNo:10;          // キャラクタＮｏ
		2,      //u32 Priority:2;         // 表示優先
		0,		//u32 Pltt:4;             // パレットＮｏ
		0,
};

static const actAnm TamagoPartsAnm0[]={		{OBJ16_8x8*0,5,0,0},
											{ACT_ANMEND,0,0,0}
};
static const actAnm TamagoPartsAnm1[]={		{OBJ16_8x8*1,5,0,0},
											{ACT_ANMEND,0,0,0}
};
static const actAnm TamagoPartsAnm2[]={		{OBJ16_8x8*2,5,0,0},
											{ACT_ANMEND,0,0,0}
};
static const actAnm TamagoPartsAnm3[]={		{OBJ16_8x8*3,5,0,0},
											{ACT_ANMEND,0,0,0}
};



static const actAnm *const TamagoPartsAnmTbl[]={
		TamagoPartsAnm0,
		TamagoPartsAnm1,
		TamagoPartsAnm2,
		TamagoPartsAnm3,
};


//アニメーションデータフォーマット
/*
	s16 pat;	        //ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ
	u8 	wait:6;		//ｳｪｲﾄ
	u8 	hrev:1;		//H反転
	u8 	vrev:1;		//V反転
*/

//-------------------------------------------------------------
//		アクターヘッダー
//-------------------------------------------------------------
static const	actHeader ActTamagoPartsHeader={
		23456,
		54321,
		&TamagoPartsOamData,
		TamagoPartsAnmTbl,
		ACT_NTRANS,
		DummyActAffTbl,
		TamagoPartsActMove,
};



#define TYPE_BEFORE 0
#define TYPE_AFTER 1
#define PROCESS1	0
#define PROCESS2	1

#define BG2_SCR_NUM (8+4)

extern u16 koukan0_Palette[];
extern u8  koukanb1_Character[4864];
extern u16 koukan0_Map[2048];

typedef struct{
	u8	actno[2];
	u8  seqno;
	u8  wait;
	u8  tamagono;
	TALK_WIN 	tw;					//ﾃｷｽﾄｺﾝﾃｷｽﾄ
	u8  windowwork;
	u8  selectpos;
	u8	tamagoparts;
	u16 musicno;
}TAMAGODEMO_WORK;

TAMAGODEMO_WORK *tdw;
// =================================================================
// PokemonActorSetProcess
// 概要  : ポケモンのアクターを登録する（自分・相手）
//         Decordの重さを考えて2回呼ぶ事でアクター登録を終了する
//
// 引数  : type		TYPE_MINE(自分)かTYPE_ENEMY(相手)
//       : process	PROCESS1,PROCESS2(その順に呼ぶ)
// 戻り値: none
// =================================================================
static u8 PokemonActorSetProcess( u8 type , u8 process, u8 no)
{
	u16          monsno,clienttype;
	PokemonParam *pmp;
	PalData      *pd;
	u32          personal_rnd;
	u8           ret;
	
	clienttype   = 0;
	ret          = 0;
	personal_rnd = 0;
	pmp          = NULL;
	
	if(type == TYPE_BEFORE){					//自分側
		pmp        = &PokeParaMine[no];
		clienttype = BSS_CLIENT_ENEMY;
	}
	if (type == TYPE_AFTER){					//孵化した自分
		pmp        = &PokeParaMine[no];
		clienttype = BSS_CLIENT_ENEMY2;
	}

	switch(process){
		case PROCESS1:				//１パス目
			monsno       = PokeParaGet(pmp,ID_monsno);			//ﾎﾟｹﾓﾝ画像番号取得
			personal_rnd = PokeParaGet(pmp,ID_personal_rnd);	//個性乱数取得
			DecordPokeCellMakeBuchi(&PM2FObjDataCell[monsno],
				pm2fpara[monsno].size,pm2fpara[monsno].patcnt,&UserWork[0],(void*)DecordAdrs[type*2+1],monsno,personal_rnd);
			DecordPalSet((PalData*)PokePalDataGet(pmp));
			break;
		case PROCESS2:				//2パス目
			pd                  = (PalData*)PokePalDataGet(pmp);
			PokeActHeaderMake(pd->reg_num,clienttype);				//ポケモンアクター定義生成
			ret                 = AddActor(&PokeActHeader,120,70,6);//ポケモンをアクター登録
			ActWork[ret].banish = 1;								//隠す
			ActWork[ret].move   = DummyActMove;						//動きを止める
			
			break;
	}
	return ret;
}


/********************************************************************/
/*                                                                  */
/*				VSync割り込み										*/
/*                                                                  */
/********************************************************************/
static void VInterFunc( void )
{
	actOAMtrans();						//ｱｸﾀｰ転送処理1
	actDMAtrans();						//ｱｸﾀｰ転送処理2
	PaletteFadeTrans();
}


// =================================================================
// TamagoDemoCall
// 概要  : タマゴ孵化デモ開始呼び出し
// 引数  : none
// 戻り値: none
// =================================================================
void TamagoHukaDemoMain();
void TamagoHukaDemoInit();
static void InitFadeWait( u8 id );
void TamagoDemoCall(void)
{
	u8	id;

	SetForceEvent();
	id = AddTask( InitFadeWait, 10 );
	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
}



static void InitFadeWait( u8 id )
{
	if( !(FadeData.fade_sw) ){
		MainProcChange(TamagoHukaDemoInit);
		pFieldRecoverFunc = AddScriptFieldInTask;
//		FadeData.trans_stop = 1;
		DelTask(id);
	}
}

// =================================================================
// TamagoHukaDemoInit
// 概要  : 初期化
// 引数  : none
// 戻り値: none
// =================================================================
void TamagoHukaDemoInit()
{
	switch(sys.InitSeqWork){
		case 0:
			*(vu16*)REG_DISPCNT = 0;
			tdw = (TAMAGODEMO_WORK*)&UserWork[0x18000];
			tdw->tamagono = ScriptParameter0;
			tdw->tamagoparts = 0;
			InitTask();
			InitActor();				//アクター初期化
			ObjPalManInit();			//OBJパレットマネージャー初期化
			SetVBlankFunc(VInterFunc);
			sys.InitSeqWork++;
			ScriptParameter1 =  BGM_GetNowNo();
			break;
		case 1:
			PrintScreenInit(KOUKAN_TYPE);
			MsgControlInit(&(tdw->tw), KOUKAN_TYPE);
			tdw->windowwork = NWinFrameInit(20);
			NWinFrameDataSet(&(tdw->tw));

//			NMenuScreenClear();
//			PrintScreenInit(DEFAULT_TYPE);
//			NMenuScreenInit(DEFAULT_TYPE);
//			NMenuScreenClear();
			sys.InitSeqWork++;
			break;

		case 2:
			//ウインドウ画像転送
			DecordVram((void *)batt_bg1_pch_ADRS,(void *)BG_VRAM);
			DecordWram((void *)batt_bg1_psc_ADRS,(void *)UserWork);
			DmaCopy(3,UserWork,BG_VRAM+5*0x800,0x500,16);
			DecordPaletteWork((void *)batt_bg1_pcl_ADRS,PA_BG0,0x20);
			sys.InitSeqWork++;
			break;
		case 3:
			CellSet((CellData *)&TamagoActCell);
			CellSet((CellData *)&TamagoPartsActCell);
			ObjPalSet((PalData *)&TamagoActPal);
			sys.InitSeqWork++;
			break;
		case 4:
			tdw->actno[0] = AddActor(&ActTamagoHeader,120,75,5);
			SodateTamagoHukaSub(tdw->tamagono);
			sys.InitSeqWork++;
			break;
		case 5:
			PokemonActorSetProcess( TYPE_BEFORE , PROCESS1, tdw->tamagono);
			sys.InitSeqWork++;
			break;
		case 6:
			tdw->actno[1] = PokemonActorSetProcess( TYPE_BEFORE , PROCESS2, tdw->tamagono);
			sys.InitSeqWork++;
			break;
		case 7:
			*(vu16 *)REG_BG2CNT = BG_COLOR_16					//16色選択
						| BG_SCREEN_SIZE_1				// スクリーンサイズ
						| BG_PRIORITY_2					//BG優先順位
						| BG2_SCR_NUM << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
						| 1 << BG_CHAR_BASE_SHIFT ;		//キャラクタベースブロック
			PaletteWorkSet(koukan0_Palette,16,5*32);
			DIV_DMAARRAYCOPY(3, koukanb1_Character, BG_VRAM+0x4000, 16);
			DIV_DMAARRAYCOPY(3, koukan0_Map, BG_VRAM+0x800*BG2_SCR_NUM, 16);
			sys.InitSeqWork++;
			break;
		
		case 8:
			*(vu16 *)REG_BG1CNT = BG_COLOR_16					//16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_1					//BG優先順位
						| 5 << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
						| 0 << BG_CHAR_BASE_SHIFT ;		//キャラクタベースブロック
			*(vu16*)REG_BG0HOFS = 0;
			*(vu16*)REG_BG0VOFS = 0;
			*(vu16*)REG_BG1HOFS = 0;
			*(vu16*)REG_BG1VOFS = 0;
			*(vu16*)REG_BG2HOFS = 0;
			*(vu16*)REG_BG2VOFS = 0;
			MainProcChange(TamagoHukaDemoMain);
			tdw->seqno = 0;
			break;
	}
}

enum{
	TAMAGODEMO_FADEIN,
	TAMAGODEMO_FADEINWAIT,
	TAMAGODEMO_START,
	TAMAGODEMO_ANIME_WAIT,
	TAMAGODEMO_MES_SET,
	TAMAGODEMO_MES_WAIT,
	TAMAGODEMO_JINGLE_WAIT,
	TAMAGODEMO_MES_YESNO,
	TAMAGODEMO_MES_YESNO_WAIT,
	TAMAGODEMO_YESNO_WAIT,
	TAMAGODEMO_FADEOUT,
	TAMAGODEMO_FADEOUTWAIT,
};

static const u8 birth_mes[]={	//タマゴから？？？が生まれた！
	CTRL_,C_FCOL_,0xf,CTRL_,C_BCOL_,0x0,CTRL_,C_SCOL_,1,
	TA_,MA_,GO_,ga_,spc_,ka_,e_,ttu_,te_,CR_,
	I_MSG_,STR_TEMP_BUF0,ga_,spc_,u_,ma_,re_,ta_,gyoe_,EOM_,
};

static const u8 rename_mes[]={	//うまれた？？？に名前をつけますか？
	CTRL_,C_FCOL_,0xf,CTRL_,C_BCOL_,0x0,CTRL_,C_SCOL_,1,
	u_,ma_,re_,ta_,spc_,I_MSG_,STR_TEMP_BUF0,ni_,CR_,
	NI_,TTU_,KU_,NE_,bou_,MU_,wo_,spc_,tu_,ke_,ma_,su_,ka_,hate_,EOM_,
};
// =================================================================
// ReturnFieldTask
// 概要  : 
// 引数  : none
// 戻り値: none
// =================================================================
void ReturnFieldTask()
{
//	MusicPlay(ScriptParameter1);
	PokeParaPut(&PokeParaMine[ScriptParameter0],ID_nickname,StrTempBuffer2);
	MainProcChange(FieldMainRecover);
}

// =================================================================
// PlayShinkaMusic
// 概要  : 
// 引数  : no
// 戻り値: none
// =================================================================
void PlayShinkaMusic(u8 no)
{
	if(TaskTable[no].work[0]==0){
		BGM_PlayStop();
	}
	if(TaskTable[no].work[0]==1){
		MusicPlay(MUS_ME_SHINKA);
	}
	
	if(TaskTable[no].work[0] > 60){
//		if(SeEndCheck()==0){
			MusicPlay(MUS_SHINKA);
			DelTask(no);
//		}
	}
	++TaskTable[no].work[0];
}
// =================================================================
// TamagoHukaDemoMain
// 概要  : タマゴ生まれデモメイン
// 引数  : none
// 戻り値: none
// =================================================================
void TamagoHukaDemoMain()
{
	s8  select;
	u16 monsno,sex;

	switch(tdw->seqno){
		case TAMAGODEMO_FADEIN:
			PaletteFadeReq( 0xffffffff, 0, 16, 0, 0 );
			*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
    	              |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
					  | DISP_OBJ_ON
					  | DISP_BG0_ON					// BG0有効
					  | DISP_BG1_ON					// BG1有効
					  | DISP_BG2_ON					// BG1有効
						;
			tdw->seqno++;
			AddTask(PlayShinkaMusic,5);
			break;
		case TAMAGODEMO_FADEINWAIT:
			if( !(FadeData.fade_sw) ){
				tdw->wait = 0;
				tdw->seqno++;
			}
			break;
		case TAMAGODEMO_START:
			if(++tdw->wait>30){
				tdw->seqno++;
				ActWork[tdw->actno[0]].move = ActTamagoHukaMove;
			}
			break;
		case TAMAGODEMO_ANIME_WAIT:
			if(ActWork[tdw->actno[0]].move == DummyActMove){
				tdw->seqno++;	
			}
			break;
		case TAMAGODEMO_MES_SET:
//			if(sys.Trg&B_BUTTON)
//				ActAffAnmChg(&ActWork[tdw->actno[1]],1);
//			if(sys.Trg&A_BUTTON)
//				tdw->seqno++;
			PokeParaNickNameCopy(&PokeParaMine[tdw->tamagono],StrTempBuffer0);
			PM_MsgExpand(MsgExpandBuffer,birth_mes);
//			TamagoDemoMsgTalkSet(MsgExpandBuffer);
			TamagoDemoMsgSet(MsgExpandBuffer);
//			NMenuTalkMsgSetEasy( MsgExpandBuffer );
			JinglePlay(MUS_FANFA5);
			tdw->seqno++;
			break;
	
		case TAMAGODEMO_MES_WAIT:
//			if(TamagoDemoTalkMsgPut()){
			if(JingleWait()){
//				JinglePlay(MUS_FANFA5);
				tdw->seqno++;
			}
			break;
		case TAMAGODEMO_JINGLE_WAIT:
			if(JingleWait()) tdw->seqno++;
			break;
		case TAMAGODEMO_MES_YESNO:
			PokeParaNickNameCopy(&PokeParaMine[tdw->tamagono],StrTempBuffer0);
			PM_MsgExpand(MsgExpandBuffer,rename_mes);
			TamagoDemoMsgTalkSet( MsgExpandBuffer );
//			NMenuTalkMsgSetEasy( MsgExpandBuffer );
			tdw->seqno++;
			break;
		case TAMAGODEMO_MES_YESNO_WAIT:
			if(TamagoDemoTalkMsgPut()){
				NMenuWinBoxWrite(22,8,22+5,8+5);
				YesNoSelectStrInit(22,8);
				tdw->seqno++;
			}
			break;
		case TAMAGODEMO_YESNO_WAIT:
				if( (select=YesNoSelectMain()) != CURSOR_DEFAULT_VALUE){
					if(select==CURSOR_CANCEL_VALUE || select==CURSOR_NO_VALUE){
						tdw->seqno++;
					}else{
						PokeParaNickNameCopy(&PokeParaMine[tdw->tamagono],StrTempBuffer2);
						monsno = PokeParaGet(&PokeParaMine[tdw->tamagono],ID_monsno);
						sex    = PokeSexGet(&PokeParaMine[tdw->tamagono]);
						NameIn(NAMEIN_POKE_NICK,StrTempBuffer2,monsno,sex,
							PokeParaGet(&PokeParaMine[tdw->tamagono],ID_personal_rnd,0),
							ReturnFieldTask);
					}
				}
			break;
		case TAMAGODEMO_FADEOUT:
			PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
			tdw->seqno++;
			break;
		case TAMAGODEMO_FADEOUTWAIT:
			if( !(FadeData.fade_sw) ){
				MainProcChange(FieldMainRecover);
//				MusicPlay(ScriptParameter1);
			}
			break;
			
	}
	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
	
}

// =================================================================
// ActTamagoHukaMove
// 概要  : タマゴぶるぶる
// 引数  : act
// 戻り値: none
// =================================================================
static void ActTamagoHukaMove(actWork *act)
{
	act->work[0]++;
	if(act->work[0]>20){
		act->move = ActTamagoHukaMove2;
		act->work[0] = 0;
	}else{
		act->work[1]+=20;
		act->work[1]&=0xff;
		act->dx = SinMove(act->work[1],1);
		if(act->work[0]==15){
			SePlay(SE_BOWA);
			ActAnmChg(act,1);
			TamagoPartsPut();
		}
	}
}

// =================================================================
// ActTamagoHukaMove
// 概要  : 2回目のタマゴぶるぶる
// 引数  : act
// 戻り値: none
// =================================================================
static void ActTamagoHukaMove2(actWork *act)
{
	act->work[2]++;
	if(act->work[2]>30){
		act->work[0]++;
		if(act->work[0]>20){
			act->move = ActTamagoHukaMove3;
			act->work[0] = 0;
			act->work[2] = 0;
		}else{
			act->work[1]+=20;
			act->work[1]&=0xff;
			act->dx = SinMove(act->work[1],2);
			if(act->work[0]==15){
				SePlay(SE_BOWA);
				ActAnmChg(act,2);
			}
		}
	}
}

// =================================================================
// ActTamagoHukaMove
// 概要  : ３回目のタマゴぶるぶる
// 引数  : act
// 戻り値: none
// =================================================================
static void ActTamagoHukaMove3(actWork *act)
{
	u16 monsno;
	act->work[2]++;
	if(act->work[2]>30){
		act->work[0]++;
		if(act->work[0]>38){
			act->move = ActTamagoHukaMove4;
			act->work[0] = 0;

				monsno = PokeParaGet(&PokeParaMine[tdw->tamagono],ID_monsno);
				ActWork[tdw->actno[1]].dx = 0;
				ActWork[tdw->actno[1]].dy = pm2fpara[monsno].patcnt;

		}else{
			act->work[1]+=20;
			act->work[1]&=0xff;
			act->dx = SinMove(act->work[1],2);
			if(act->work[0]==15){
				SePlay(SE_BOWA);
				ActAnmChg(act,2);
				TamagoPartsPut();
				TamagoPartsPut();
			}
			if(act->work[0]==30){
				SePlay(SE_BOWA);
			}
		}
	}
}

// =================================================================
// ActTamagoHukaMove4
// 概要  : タマゴちょっと待ち
// 引数  : act
// 戻り値: none
// =================================================================
static void ActTamagoHukaMove4(actWork *act)
{
	if(++act->work[0]>50){
		act->move = ActTamagoHukaMove5;
		act->work[0] = 0;
	}
}

// =================================================================
// ActTamagoHukaMove5
// 概要  : タマゴ割れてホワイトアウト
// 引数  : act
// 戻り値: none
// =================================================================
static void ActTamagoHukaMove5(actWork *act)
{
	s16 i;
	if(act->work[0]==0){
		PaletteFadeReq(0xffffffff, -1, 0, 16, 0xffff);
	}
	
	if(act->work[0]>=0 && act->work[0]<=3){
		for(i=0;i<4;i++){
			TamagoPartsPut();
		}
	}

	
	act->work[0]++;
	if( !(FadeData.fade_sw) ){
		SePlay(SE_TAMAGO);
		act->banish = 1;
		act->move = ActTamagoHukaMove6;
		act->work[0] = 0;
	}
}

static void ActTamagoHukaMove6(actWork *act)
{
	if(act->work[0]==0){
		ActWork[tdw->actno[1]].banish = 0;
		ActAffAnmChg(&ActWork[tdw->actno[1]],1);
	}
	
	if(act->work[0]==8)
		PaletteFadeReq(0xffffffff, -1, 16, 0, 0xffff);

	if(act->work[0]<10){
		ActWork[tdw->actno[1]].y--;
	}
	if(act->work[0] > 40){
		act->move = DummyActMove;
	}
	act->work[0]++;
}

// =================================================================
// TamagoPartsActMove
// 概要  : 
// 引数  : act
// 戻り値: none
// =================================================================
static void TamagoPartsActMove(actWork *act)
{
	act->work[4] += act->work[1];
	act->work[5] += act->work[2];
	act->dx = act->work[4]/256;
	act->dy = act->work[5]/256;
	act->work[2] += act->work[3];
	
	if((act->y+act->dy) > (act->y+20) && act->work[2] > 0){
		DelActor(act);
	}
}

static const s16 tamagotbl[][2]={
	{-3*128,  -5*192},
	{-10*128, -4*192}, {7*128, -4*192},
	{-8*128,  -5*192}, {4*128, -2*192}, {-1*128, -9*192}, {10*128, -3*192},
	{-3*128,  -5*192}, {9*128, -2*192}, {-2*128, -9*192}, {8*128,  -3*192},
	{-7*128,  -5*192}, {2*128, -2*192}, {-75*12, -9*192}, {9*128,  -3*192},
	{-1*128, -10*192}, {2*128, -6*192}, {-5*128, -3*192}, {5*128, -10*192},
};

// =================================================================
// TamagoPartsPut
// 概要  : 
// 引数  : none
// 戻り値: none
// =================================================================
static void TamagoPartsPut()
{
	s16 wx,wy,parts;
//	wx = (pp_rand()%1700)-(1700-2);
//	wy = -(pp_rand()%2024)-512;
	wx = tamagotbl[tdw->tamagoparts][0];
	wy = tamagotbl[tdw->tamagoparts][1];
	tdw->tamagoparts++;
	parts = pp_rand()%4;
	TamagoPartsSet(120, 60,  wx,wy, 100,parts);
}

// =================================================================
// TamagoPartsSet
// 概要  : タマゴ飛び散りパーツセット
// 引数  : x	
//       : y
//       : dx	小数点以下8bit
//       : dy	小数点以下8bit
//       : gg	小数点以下8bit
// 戻り値: none
// =================================================================
static void TamagoPartsSet(u8 x, u8 y, s16 dx ,s16 dy, s16 gg, u8 n)
{
	u8 no;
	no = AddActor(&ActTamagoPartsHeader,x,y,4);
	ActWork[no].work[1] = dx;
	ActWork[no].work[2] = dy;
	ActWork[no].work[3] = gg;
	ActAnmChg(&ActWork[no],n);
}

// =================================================================
// TamagoDemoMsgTalkSet
// 概要  : 
// 引数  : 
//       : msg_adrs
// 戻り値: none
// =================================================================
static void TamagoDemoMsgTalkSet(const u8 *msg_adrs)
{
	TalkMsgSet(&tdw->tw, msg_adrs, tdw->windowwork, 3, 15);
}


// =================================================================
// TmagoDemoMsgSet
// 概要  : 
// 引数  : msg_adrs
// 戻り値: none
// =================================================================
static void TamagoDemoMsgSet(const u8 *msg_adrs)
{
	MsgPrint( &tdw->tw, msg_adrs, tdw->windowwork, 3, 15);
}
// =================================================================
// TamagoDemoTalkMsgPut
// 概要  : 
// 引数  : none
// 戻り値: static u8
// =================================================================
static u8 TamagoDemoTalkMsgPut()
{
	return TalkMsgPut(&tdw->tw);
}

#if 0
// =================================================================
// TamagoDemoYesNoMove
// 概要  : 
// 引数  : none
// 戻り値: static u8
// =================================================================
static u8 TamagoDemoYesNoMove()
{
	u8 ret = 0;
	if(sys.Trg&U_KEY){
		if(tdw->selectpos!=0){
			tdw->selectpos = 0;
			SePlay(SE_SELECT);
		}
	}else if(sys.Trg&D_KEY){
		if(tdw->selectpos!=1){
			tdw->selectpos = 1;
			SePlay(SE_SELECT);
		}
	
	}else if(sys.Trg&A_BUTTON){
		SePlay(SE_SELECT);
		ret = tdw->selectpos+1;
	
	}else if(sys.Trg&B_BUTTON){
		SePlay(SE_SELECT);
		ret = 2;
	}
	return 0;
}

あれ……………？
//タマゴのようすが……？

タマゴが　かえって
？？？が　うまれた！

うまれた　？？？に
ニックネームを　つけますか？

#endif
