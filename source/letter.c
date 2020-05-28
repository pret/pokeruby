//====================================================================
//
//						ＴＶ企画	01/11/15 nohara							
//
//						手紙型・秘密型
//
//
//
//
/*
						＜手紙型を追加したとき＞
						・TVDataSetSelectに追加

						＜姓名判断氏を変更したとき＞
						・ランダムな値を保存しているので、
						　その幅が変更になったら
						　LetterNameDataSetも変更する


*/
//====================================================================
#include "common.h"
#include "intr.h"
#include "menu.h"					//menutool.h
#include "calctool.h"				//pp_rand
#include "script.h"					//ScriptParameter
#include "fieldmap.h"				//NowMap
#include "poketool.h"				//PokeNameData
#include "contest.h"				//ConTemotiNo
#include "conscr.h"					//SUPER_RANK
#include "server.h"					//FTW
#include "item.h"					//ITEM_MASTERBALL
#include "tv_def.h"					//TVのdefine群
#include "tv_tool.h"				//関数群
#include "cm.h"						//cm_event_flag
#include "record.h"					//GetRecord
#include "b_tower.h"				//BattleTowerWinGet
#include "monsno.def"				//MONSNO_AMETAMA
#include "wazano.def"				//WAZANO_AMETAMA
#include "sysflag.h"
#include "../evdata/maparray.h"		//FIELD_R102
#include "scr_tool.h"				//GetTemotiBtlPokeNum


//====================================================================
//						  extern
//====================================================================
//fd_shop.c
extern MINEITEM TVItemData[];			//買い物したものが入る


//====================================================================
//						プロトタイプ宣言
//====================================================================
void TVData_Update(u16);			//日にち処理
void Generating_Update(u16);		//大量発生の日にち処理
void GeneratingIncubation_Update(u16);	//大量発生潜伏の日にち処理
void TVOneDay_Update(u16);			//一日に捕まえた数の日にち処理

//手紙型
void LetterPokemonDataSet();		//ポケモンアンケート
void LetterRecentlyDataSet();		//最近の出来事
void LetterClubDataSet();			//大好きクラブのインタビュー
void LetterGymDataSet();			//ジムリーダー戦後のインタビュー
void LetterNameDataSet();			//姓名判断氏
void LetterGeneratingDataSet();		//大量発生データのランダム発生
void GeneratingEventSet();
void GeneratingEventClear();		//大量発生イベントを終了する
void TVLetterIDSet(TV_Letter_Work *p);//手紙型に必要なIDをセット
void TVConDataSet();				//コンテスト優勝
void TVConWazaSet(u16);				//最後に使用した技をセット
void TVConZyuniSet(u8);				//コンテストの順位とタイプをセット
void TVTowerDataSet();				//バトルタワー
u8 TVTowerWinLoseFlagGet();			//バトルタワー勝敗取得
u8 TVTowerSeqNoGet();				//バトルタワー状況取得

//秘密型
void TVDataSetSelect();				//データセット
void TVBtlDataSet();				//捕まえたポケモンの紹介
void TVShopDataSet();				//今日の買い物上手
void TVGetFailedDataSet();			//捕獲失敗
void TVSecretIDSet(TV_Sec_Shop_Work *p);//秘密型に必要なIDをセット
void TVFishingDataSet();			//釣りしまくり
void TVFishingCount(u8);			//釣りの回数をカウント
void TVFishingPokeNoSet(u16);		//釣ったポケモンナンバーセット
void TVOneDayDataCount();			//一日で捕まえた数をカウントする
void TVOneDayDataSet();				//一日で捕まえた数セット

#define GENERATING_POKE_DATA_MAX	5		//大量発生データ最大数
typedef struct{
	u16 monsno;				//ポケモンナンバー
	u16 waza1;				//覚えている技
	u16 waza2;				//覚えている技
	u16 waza3;				//覚えている技
	u16 waza4;				//覚えている技
	u8 level;				//レベル
	u8 map_id;				//mapID
} GeneratingPokeData;

static const GeneratingPokeData GPD[GENERATING_POKE_DATA_MAX] = {
	{ MONSNO_AMETAMA, WAZANO_AWA,	  WAZANO_DENKOUSEKKA, 0, 0, 3, FIELD_R102 },
	{ MONSNO_AMETAMA, WAZANO_AWA,	  WAZANO_DENKOUSEKKA, 0, 0, 15, FIELD_R114 },	
	{ MONSNO_AMETAMA, WAZANO_AWA,	  WAZANO_DENKOUSEKKA, 0, 0, 15, FIELD_R117 },
	{ MONSNO_AMETAMA, WAZANO_AWA,	  WAZANO_DENKOUSEKKA, 0, 0, 28, FIELD_R120 },
	{ MONSNO_ENEKO,   WAZANO_NAKIGOE, WAZANO_TAIATARI,	  0, 0, 15, FIELD_R116 }
};


//====================================================================
//							プログラム
//====================================================================

//--------------------------------------------------------------------
//
//							データセット
//
//			ScriptParameter1 = datatypeを見て処理を分ける
//--------------------------------------------------------------------
void TVDataSetSelect()
{
	switch( ScriptParameter1 )
	{
		case TV_POKEMON_TYPE1:
			LetterPokemonDataSet();
			break;
		case TV_RECENTLY_TYPE1:
			LetterRecentlyDataSet();
			break;
		case TV_CLUB_TYPE1:
			LetterClubDataSet();
			break;
		case TV_GYMLEADER_TYPE1:
			LetterGymDataSet();
			break;
		case TV_CONTEST_TYPE1:
			TVConDataSet();
			break;
		case TV_TOWER_TYPE1:
			TVTowerDataSet();
			break;
	}
}

//--------------------------------------------------------------------
//					捕まえたポケモンの紹介データ作成
//--------------------------------------------------------------------
void TVBtlDataSet()
{
	u8  i;
	u16 type,ball;
	TV_Sec_Btl_Work * p;
	ball = 0;

	//データ作成のチェックを戦闘後に行う	add 02/08/26
	CMDataSet();						// CMデータのランダム発生
	LetterGeneratingDataSet();			// 大量発生データのランダム発生

	//捕獲失敗・一日で捕まえた数の作成チェック
	if( FTW.GetPokeNo == 0 )
	{
		//捕獲失敗
		TVGetFailedDataSet();
		return;
	}else
	{
		//一日で捕まえた数をカウントする
		TVOneDayDataCount();
	}

	//発生チェック
	if( TVRndChk(TV_GETPOKE_START_ON) ) return;

	//ニックネームをつけたか
	if( PM_strcmp( (u8 *)PokeNameData[FTW.GetPokeNo],
				(u8 *)FTW.GetPokeNickname ) == 0 )
		return;
	
	tv_akino = TVDataPartnerAkiChk(Fld.tv_event);
	if( tv_akino == -1 )	return;		//空きがない

	if( TVSecDataTypeChk(TV_GETPOKE_TYPE1) == 1 ) return;

	//ボールを投げた回数をカウントする(サファリゾーン)
	for( i=0; i < FTW_BALL_MAX ;i++ )
	{
		ball += FTW.ThrowBall[i];
	}

	//ボールを投げていない(サファリゾーン)
	if( ball == 0 && FTW.ThrowMasterBallFlag == 0 ) return;

	ball = 0;		//クリア
	p = (TV_Sec_Btl_Work *)&Fld.tv_event[tv_akino];

	p->datatype = TV_GETPOKE_TYPE1;
	p->watch_flag = TV_WATCH_FLAG_OFF;

	if( FTW.ThrowMasterBallFlag == 1 )
	{
		ball = 1;
		type = ITEM_MASUTAABOORU;
	}else
	{
		for( i=0; i < FTW_BALL_MAX ;i++ )
		{
			ball += FTW.ThrowBall[i];
		}

		//１バイト分しか容量確保していないので
		if( ball > 0xff ) ball = 0xff;

		type = ItemNo;			//server.hにある
	}

    p->ball_count =	(u8)ball;
    p->ball_type =	(u8)type;
	
	PM_strcpy(p->player_name, MyData.my_name);// 名前
	PM_strcpy(p->nickname, FTW.GetPokeNickname);//ニックネーム

    p->get_pokeno = FTW.GetPokeNo;		// 捕まえたポケモンの種類
	TVSecretIDSet((TV_Sec_Shop_Work *)p);
}

//--------------------------------------------------------------------
//						捕まえた数をカウント
//--------------------------------------------------------------------
void TVOneDayDataCount()
{
	TV_Sec_OneDay_Work * p;
	p = (TV_Sec_OneDay_Work*)&TV_TEMP_WORK;

	if( p->datatype != TV_ONEDAY_TYPE1 )
	{
		TVDataClear(Fld.tv_event,TVDATA_MAX);		// クリアする
		p->walk_count	= GetRecord(CNT_WALK);		//現在の歩数保存
		p->datatype		= TV_ONEDAY_TYPE1;
	}

    p->count++;										//捕まえた数
    p->get_pokeno	= FTW.GetPokeNo;				//捕まえたポケモンの種類
	
	//使用していたポケモンの種類
    p->pokeno		= FTW.MineLastPokeNo;	

	p->worldpos		= NowMap.WorldPos;

	return;
}

//--------------------------------------------------------------------
//						ゲット失敗ＴＶデータ作成
//--------------------------------------------------------------------
void TVGetFailedDataSet()
{
	u8  i;
	u16 count;
	TV_Sec_Get_Failed_Work * p;

	//発生チェック
	if( TVRndChk(TV_FAILED_START_ON) ) return;

	//３回以上ボールを投げているか
	for( i=0, count=0; i < FTW_BALL_MAX ;i++ )
	{
		count += FTW.ThrowBall[i];
	}

	//１バイト分しか容量確保していないので
	if( count > 0xff ) count = 0xff;

	if( count < TV_FAILED_CREATE_NUM ) return;

	//敵ポケモンが逃げたか、戦闘に勝利した
	if( WinLoseFlag == FIGHT_ENEMY_ESCAPE || WinLoseFlag == FIGHT_WIN )
	{
		tv_akino = TVDataPartnerAkiChk(Fld.tv_event);
		if( tv_akino == -1 )	return;		//空きがない

		if( TVSecDataTypeChk(TV_FAILED_TYPE1) == 1 ) return;

		p = (TV_Sec_Get_Failed_Work *)&Fld.tv_event[tv_akino];

		p->datatype		= TV_FAILED_TYPE1;
		p->watch_flag	= TV_WATCH_FLAG_OFF;

		p->pokeno		= FTW.MineLastPokeNo;	

		p->failed_pokeno= FTW.EnemyLastPokeNo;
		p->ball_count	= (u8)count;

		p->failed_flag	= WinLoseFlag;
		p->worldpos		= NowMap.WorldPos;

		PM_strcpy(p->player_name, MyData.my_name);// 名前

		TVSecretIDSet((TV_Sec_Shop_Work *)p);
	}
}

//--------------------------------------------------------------------
//						秘密型に必要なIDをセット
//--------------------------------------------------------------------
void TVSecretIDSet(TV_Sec_Shop_Work *p)
{
	u32 id;

	id = GetMyDataID();

    p->data_id[0] = (u8)(id & 0xff);				//ＴＶデータ識別ID
    p->data_id[1] = (u8)( (id >> 8)& 0xff );		//ＴＶデータ識別ID

    p->before_id[0] = (u8)(id & 0xff);				//前のトレーナーID
    p->before_id[1] = (u8)( (id >> 8 )& 0xff );		//前のトレーナーID

    p->trainer_id[0] = (u8)(id & 0xff);				// ＴＶデータ製作者ID
    p->trainer_id[1] = (u8)( (id >> 8 )& 0xff );	// ＴＶデータ製作者ID
}

//-------------------------------------------------------------------
//						手紙型に必要なIDをセット
//--------------------------------------------------------------------
void TVLetterIDSet(TV_Letter_Work *p)
{
	u32 id;

	id = GetMyDataID();

    p->data_id[0] = (u8)(id & 0xff);				//ＴＶデータ識別ID
    p->data_id[1] = (u8)( (id >> 8)& 0xff );		//ＴＶデータ識別ID

    p->before_id[0] = (u8)(id & 0xff);				//前のトレーナーID
    p->before_id[1] = (u8)( (id >> 8)& 0xff );		//前のトレーナーID
}

//====================================================================
//						コンテスト後ＴＶデータ作成
//====================================================================
void TVConDataSet()
{
	TV_Con_Work * p;
	TV_Con_Work * from_p;

	from_p = (TV_Con_Work *)&TV_TEMP_WORK;

	//保存用ワークのデータタイプが同じか
	if( from_p->datatype != TV_CONTEST_TYPE1 ) return;

	p = (TV_Con_Work *)&Fld.tv_event[tv_akino];

    p->datatype		=	TV_CONTEST_TYPE1;
    p->watch_flag	=	TV_WATCH_FLAG_ON;

	//change 02/09/17
	p->pokeno		=	from_p->pokeno;	

	PM_strcpy(p->player_name, MyData.my_name);// 名前

	//change 02/09/17
	PM_strcpy(p->nickname, from_p->nickname);

	p->type		=		 from_p->type;
    p->rank		=		 from_p->rank;

    p->waza		=		 from_p->waza;			// 最後に使った技
    p->zyuni	=		 from_p->zyuni;			// 順位
    p->type		=		 from_p->type;			// タイプ

	TVLetterIDSet((TV_Letter_Work *)p);
}

//====================================================================
//				コンテストで最後に使用した技をセットする
//====================================================================
void TVConWazaSet(u16 waza)
{
	TV_Con_Work * p;
	p = (TV_Con_Work *)&TV_TEMP_WORK;

	//このタイミングで手紙チェックをかける	add 02/09/09
	//コンテスト後のインタビュアーを出すチェック時に
	//ScrLetterConTypeChkを行うので、
	//下に書いてあるTVDataHimeselfAkiChkで
	//この関数では、はじかれるのに、
	//インタビュアー出すチェックで通ってしまうので！
	//(見ている同じデータが合ったら削除するようにして空きを作る)
	ScrLetterConTypeChk();

	//同じデータタイプで見ていない状態があったときに
	//tv_akinoに値を入れていないのでTVDatahimselfAkiChkをする add 02/09/09
	tv_akino = TVDataHimselfAkiChk((TV_EVENT *)Fld.tv_event);
	if( tv_akino == -1 )	return;	//空きがない

	TVDataClear(Fld.tv_event,TVDATA_MAX);	// クリアする
    p->waza = waza;					// 最後に使った技
    p->datatype = TV_CONTEST_TYPE1;
	return;
}

//====================================================================
//					コンテストの順位をセットする
//					コンテストのタイプをセットする
//====================================================================
void TVConZyuniSet(u8 zyuni)
{
	TV_Con_Work * p;
	p = (TV_Con_Work *)&TV_TEMP_WORK;

	tv_akino = TVDataHimselfAkiChk((TV_EVENT *)Fld.tv_event);
	if( tv_akino == -1 )	return;	//空きがない

    p->zyuni = zyuni;				// 順位
    p->type = (u8)ContestKind;		// コンテストのタイプ
    p->rank = (u8)ContestRank;		// コンテストのランク
	p->pokeno =	PokeParaGet( &PokeParaMine[ConTemotiNo], ID_monsno, 0 );//ポケモンナンバー	
	PokeParaGet( &PokeParaMine[ConTemotiNo], ID_nickname, p->nickname );//ニックネーム	

	return;
}

//====================================================================
//						バトルタワーＴＶデータ作成
//
//				受け答えデータをScriptParameter0に入れておく
//====================================================================
void TVTowerDataSet()
{
	TV_Tower_Work * p;

	p = (TV_Tower_Work *)&Fld.tv_event[tv_akino];

    p->datatype =	TV_TOWER_TYPE1;
    p->watch_flag =	TV_WATCH_FLAG_ON;

	PM_strcpy(p->player_name, MyData.my_name);	// 名前
	PM_strcpy(p->enemy_name, MyData.BattleTowerWork.SBTTVD.TrainerName);// 最後に対戦した相手の名前

    p->pokeno = MyData.BattleTowerWork.SBTTVD.MineLastPokeNo;		//自分が最後に出していたpokeno
    p->enemy_pokeno = MyData.BattleTowerWork.SBTTVD.EnemyLastPokeNo;//相手が				pokeno

	//change 02/09/18
	//p->win		= BattleTowerWinGet( MyData.BattleTowerWork.BattleTowerLevel );	//連勝数
	p->win		= BattleTowerWinGet( MyData.BattleTowerWork.BattleTowerInterviewLevel );//連勝数

	p->win_flag	= 
		MyData.BattleTowerWork.BattleTowerWinLoseFlag;		//勝敗

	//change 02/09/18
	//if( MyData.BattleTowerWork.BattleTowerLevel == 0 ) p->level = 50;	//レベル50
	if( MyData.BattleTowerWork.BattleTowerInterviewLevel == 0 ) p->level = 50;	//レベル50
	else p->level = 100;												//レベル100

	p->ans		= ScriptParameter0;												//受け答えデータ

	TVLetterIDSet((TV_Letter_Work *)p);
}

//====================================================================
//						買い物上手ＴＶデータ作成
//====================================================================
void TVShopDataSet()
{
	u8 i;
	TV_Sec_Shop_Work * p;

	//発生チェック
	if( TVRndChk(TV_SHOP_START_ON) ) return;

	tv_akino = TVDataPartnerAkiChk(Fld.tv_event);
	if( tv_akino == -1 )	return;	//空きがない

	if( TVSecDataTypeChk(TV_SHOP_TYPE1) == 1 ) return;

	//数の多い順に並び替えて、20以上のものがあるか
	TVShopDataSort();
	if( TVItemData[0].no < TV_SHOP_CREATE_NUM ) return;

	p = (TV_Sec_Shop_Work *)&Fld.tv_event[tv_akino];

    p->datatype = TV_SHOP_TYPE1;
	p->watch_flag = TV_WATCH_FLAG_OFF;

    p->worldpos = NowMap.WorldPos;
	
	for( i=0; i < 3; i++ )
	{
		p->itemno[i] = TVItemData[i].item;
		p->num[i] = TVItemData[i].no;
	}

	p->bargain_flag = SALE_FLG;		//大安売りか

	PM_strcpy(p->player_name, MyData.my_name);// 名前

	TVSecretIDSet((TV_Sec_Shop_Work *)p);
}


//====================================================================
//						姓名判断氏ＴＶデータ作成
//====================================================================
void LetterNameDataSet()
{
	TV_Name_Work * p;

	ScrLetterNameTypeChk();
	if( AnswerWork == 1 )	return;

	//StrTempBuffer0に代入して、２文字以上かチェック
	//ScriptParameter0にリストの何番目を選んだかが入っている
	PokeParaGet( &PokeParaMine[ScriptParameter0], ID_nickname, StrTempBuffer0 );	
	if( PM_strlen( (const u8 *)MyData.my_name ) < 2 ) return;
	if( PM_strlen( (const u8 *)StrTempBuffer0 ) < 2 ) return;

	p = (TV_Name_Work *)&Fld.tv_event[tv_akino];

    p->datatype = TV_NAME_TYPE1;
	p->watch_flag = TV_WATCH_FLAG_ON;

	p->pokeno	= PokeParaGet( &PokeParaMine[ScriptParameter0], ID_monsno, 0 );	

	//ランダムで選択される放送を保存する
	//ランダムで選択されるポケモンナンバーを保存する
	p->r_q_no[0]= (pp_rand() % 3);
	p->r_q_no[1]= (pp_rand() % 2);
	p->r_pokeno = RndChoicePoke(p->pokeno);

	PM_strcpy(p->player_name, MyData.my_name);// 名前
	PokeParaGet( &PokeParaMine[ScriptParameter0], ID_nickname, p->nickname );	

	TVLetterIDSet((TV_Letter_Work *)p);
}

//--------------------------------------------------------------------
//					Generating_Event_Workにセットする
//
//	ScriptParameter0 = 放送している要素数(tv.evで代入される)
//--------------------------------------------------------------------
void GeneratingEventSet()
{
	TV_Generating_Work *p;
	p = (TV_Generating_Work *)&Fld.tv_event[ScriptParameter0];

	Fld.tv_encount.pokeno		= p->pokeno;	// ポケモンの種類
    Fld.tv_encount.map_id		= p->map_id;	// どこで出現したか
    Fld.tv_encount.div_id		= p->div_id;	// どこで出現したか

    Fld.tv_encount.level		= p->level;		// どのレベルで出てくるか
    Fld.tv_encount.special		= p->special;	// 特殊能力
    Fld.tv_encount.itemno		= p->itemno;	// 持っているアイテム

    Fld.tv_encount.waza[0]		= p->waza[0];	// 持っている技
    Fld.tv_encount.waza[1]		= p->waza[1];	// 持っている技
    Fld.tv_encount.waza[2]		= p->waza[2];	// 持っている技
    Fld.tv_encount.waza[3]		= p->waza[3];	// 持っている技

    Fld.tv_encount.character	= p->character;	// 性格
    Fld.tv_encount.appearance	= p->appearance;// 出現(%)
    Fld.tv_encount.time_count	= GENERATING_TIME;	// 大量発生している日数
}

//====================================================================
//					手紙(ポケモンアンケート)作成
//====================================================================
void LetterPokemonDataSet()
{
	TV_Letter_Work * p;

	p = (TV_Letter_Work *)&Fld.tv_event[tv_akino];

    p->datatype =	TV_POKEMON_TYPE1;
    p->watch_flag =	TV_WATCH_FLAG_ON;

	PM_strcpy(p->player_name, MyData.my_name);	// 名前

	p->inside_data = PokeParaGet( &PokeParaMine[GetTemotiBtlPokeNum()], ID_monsno, 0 );	//手持ちの先頭ポケモン
	TVLetterIDSet((TV_Letter_Work *)p);
}

//====================================================================
//						手紙(最近の出来事)作成
//====================================================================
void LetterRecentlyDataSet()
{
	TV_Letter_Work * p;

	p = (TV_Letter_Work *)&Fld.tv_event[tv_akino];

    p->datatype =	TV_RECENTLY_TYPE1;
    p->watch_flag =	TV_WATCH_FLAG_ON;

	PM_strcpy(p->player_name, MyData.my_name);// 名前

    p->inside_data = 0;
	TVLetterIDSet((TV_Letter_Work *)p);
}

//====================================================================
//				手紙(大好きクラブインタビュー)作成
//====================================================================
void LetterClubDataSet()
{
	TV_Club_Work * p;

	p = (TV_Club_Work *)&Fld.tv_event[tv_akino];

    p->datatype =	TV_CLUB_TYPE1;
    p->watch_flag =	TV_WATCH_FLAG_ON;

	//なつき度未使用！！
	p->friend = (u8)( PokeParaGet( &PokeParaMine[GetTemotiBtlPokeNum()], ID_friend, 0 ) >> 4 );
    p->ans =		(u8)ScriptParameter3;

	PM_strcpy(p->player_name, MyData.my_name);// 名前
	PokeParaGet( &PokeParaMine[GetTemotiBtlPokeNum()], ID_nickname, p->nickname );	

	p->pokeno = PokeParaGet( &PokeParaMine[GetTemotiBtlPokeNum()], ID_monsno, 0 );
	TVLetterIDSet((TV_Letter_Work *)p);
}

//====================================================================
//				手紙(ジムリーダー戦後のインタビュー)作成
//====================================================================
void LetterGymDataSet()
{
	return;
}

//====================================================================
//					手紙(大量発生イベント)作成
//====================================================================
void LetterGeneratingDataSet()
{
	u8 i;
	u16 rnd;
	TV_Generating_Work * p;

	//ゲームクリアしていなかったら
	if( EventFlagCheck( SYS_GAME_CLEAR ) == FALSE ) return;

	//同じdatatypeが存在する場合は作らない
	for( i=0; i < TVDATA_MAX ;i++ )
	{
		if( Fld.tv_event[i].datatype == TV_GENERATING_TYPE1 )
			return;
	}
	
	//大量発生を作成するかの、ランダムを取得
	if( TVRndChk(TV_GENERATING_START_ON) ) return;
	
	tv_akino = TVDataHimselfAkiChk((TV_EVENT *)Fld.tv_event);
	if( tv_akino == -1 )	return;	//空きがない

	rnd = (pp_rand() % GENERATING_POKE_DATA_MAX);

	p = (TV_Generating_Work *)&Fld.tv_event[tv_akino];

    p->datatype =	TV_GENERATING_TYPE1;
    p->watch_flag =	TV_WATCH_FLAG_ON;

    p->level =		GPD[rnd].level;
    p->special =	0;
    p->character =	0;
	p->pokeno =		GPD[rnd].monsno;
    p->itemno =		0;

    p->waza[0] =	GPD[rnd].waza1;
    p->waza[1] =	GPD[rnd].waza2;
    p->waza[2] =	GPD[rnd].waza3;
    p->waza[3] =	GPD[rnd].waza4;

    p->map_id =		GPD[rnd].map_id;
    p->div_id =		FIELD;
    p->rare =		0;
    p->appearance = 50;								//出現率50%
    p->batch =		0;
    p->time_count =	GENERATING_INCUBATION_TIME;		//潜伏日数

	TVLetterIDSet((TV_Letter_Work *)p);
}

//--------------------------------------------------------------------
//						大量発生イベントクリア
//--------------------------------------------------------------------
void GeneratingEventClear()
{
	Fld.tv_encount.pokeno		= 0;	// ポケモンの種類
    Fld.tv_encount.map_id		= 0;	// どこで出現したか
    Fld.tv_encount.div_id		= 0;	// どこで出現したか

    Fld.tv_encount.level		= 0;	// どのレベルで出てくるか
    Fld.tv_encount.special		= 0;	// 特殊能力
    Fld.tv_encount.itemno		= 0;	// 持っているアイテム

    Fld.tv_encount.waza[0]		= 0;	// 持っている技
    Fld.tv_encount.waza[1]		= 0;	// 持っている技
    Fld.tv_encount.waza[2]		= 0;	// 持っている技
    Fld.tv_encount.waza[3]		= 0;	// 持っている技

    Fld.tv_encount.character	= 0;	// 性格
    Fld.tv_encount.appearance	= 0;	// 出現(%)
    Fld.tv_encount.time_count	= 0;	// イベント終了までの残り時間
}

//--------------------------------------------------------------------
//							日にち処理
//--------------------------------------------------------------------
void TVData_Update(u16 days)
{
	GeneratingIncubation_Update(days);	//大量発生(潜伏)
	Generating_Update(days);			//大量発生
	CMData_Update(days);				//CM
	TVOneDay_Update(days);				//一日に捕まえた数
	return;
}

//--------------------------------------------------------------------
//					大量発生潜伏の日にち処理
//--------------------------------------------------------------------
void GeneratingIncubation_Update(u16 days)
{
	u8 i;
	TV_Generating_Work *p;

	//大量発生してなかったら
	if( Fld.tv_encount.pokeno == 0 )
	{
		//要素数の一番若い方から見ていく
		//大量発生データの潜伏日数を減らす
		for( i=0; i < TVDATA_MAX ;i++ )
		{
			if( Fld.tv_event[i].datatype == TV_GENERATING_TYPE1
					&& Fld.tv_event[i].watch_flag == TV_WATCH_FLAG_ON )
			{
				p = (TV_Generating_Work *)&Fld.tv_event[i];
				if( p->time_count < days )	p->time_count = 0;
				else	p->time_count -= days;
				return;
			}
		}
	}

	return;
}

//--------------------------------------------------------------------
//						大量発生の日にち処理
//--------------------------------------------------------------------
void Generating_Update(u16 days)
{
	if( Fld.tv_encount.time_count <= days )	GeneratingEventClear();
	else	Fld.tv_encount.time_count -= days;
	return;
}

static u16 tv_fish_pokeno = 0;
static u16 tv_fish_count = 0;
#define FISHING_TRUE_BIT		(0)
#define FISHING_FALSE_BIT		(8)
#define TV_FISHING_CREATE_COUNT	(5)		//以上連続の時に逆になると作成する
#define TV_FISHING_COUNT_MAX	(0xff)	//以上連続だったら作成する
//--------------------------------------------------------------------
//					釣りの連続成功、失敗の数を保存
//--------------------------------------------------------------------
void TVFishingCount(u8 ans)
{
	if( ans )	//成功
	{
		//失敗しつづけて成功したか
		if( ((tv_fish_count) >> FISHING_FALSE_BIT) >= TV_FISHING_CREATE_COUNT )	TVFishingDataSet();

		tv_fish_count&=0x00ff;

		//連続成功がTV_FISHING_COUNT_MAXになっていたら
		if( tv_fish_count != TV_FISHING_COUNT_MAX )
		{
			tv_fish_count+=(1 << FISHING_TRUE_BIT);
		}

			
	}else	//失敗
	{
		//成功しつづけて失敗したか
		if( ((tv_fish_count)&0x00ff) >= TV_FISHING_CREATE_COUNT )	TVFishingDataSet();

		tv_fish_count&=0xff00;

		//連続成功がTV_FISHING_COUNT_MAXになっていたら
		if( ((tv_fish_count) >> FISHING_FALSE_BIT) != TV_FISHING_COUNT_MAX )
		{
			tv_fish_count+=(1 << FISHING_FALSE_BIT);
		}
	}

	return;
}

//--------------------------------------------------------------------
//						釣りしまくりデータセット
//--------------------------------------------------------------------
void TVFishingDataSet()
{
	//u16 * res;
	TV_Sec_Fishing_Work * p;

	tv_akino = TVDataPartnerAkiChk(Fld.tv_event);
	if( tv_akino == -1 )	return;	//空きがない

	if( TVSecDataTypeChk(TV_FISHING_TYPE1) == 1 ) return;

	p = (TV_Sec_Fishing_Work *)&Fld.tv_event[tv_akino];

    p->datatype		= TV_FISHING_TYPE1;
	p->watch_flag	= TV_WATCH_FLAG_OFF;

	p->true_count	= (u8)tv_fish_count;
	p->false_count	= (u8)((tv_fish_count) >> FISHING_FALSE_BIT);
	p->pokeno		= tv_fish_pokeno;

	PM_strcpy(p->player_name, MyData.my_name);// 名前

	TVSecretIDSet((TV_Sec_Shop_Work *)p);

	return;
}

//--------------------------------------------------------------------
//						釣ったポケモンナンバーセット
//--------------------------------------------------------------------
void TVFishingPokeNoSet(u16 no)
{
	tv_fish_pokeno = no;				//保存
	return;
}

//--------------------------------------------------------------------
//					一日に捕まえた数の日にち処理
//--------------------------------------------------------------------
void TVOneDay_Update(u16 days)
{
	TV_Sec_OneDay_Work *p;

	p = (TV_Sec_OneDay_Work*)&TV_TEMP_WORK;

	//データタイプが同じか
	if( p->datatype != TV_ONEDAY_TYPE1 ) return;

	if( p->count < TV_ONEDAY_CREATE_NUM )
	{
		TVDataClear(Fld.tv_event,TVDATA_MAX);		// クリアする
	}else
	{
		TVOneDayDataSet();
	}

	return;
}

//--------------------------------------------------------------------
//					一日に捕まえた数のセット
//--------------------------------------------------------------------
void TVOneDayDataSet()
{
	TV_Sec_OneDay_Work * p;
	TV_Sec_OneDay_Work * from_p;

	from_p = (TV_Sec_OneDay_Work*)&TV_TEMP_WORK;

	//発生チェック
	if( TVRndChk(TV_ONEDAY_START_ON) ) return;

	tv_akino = TVDataPartnerAkiChk(Fld.tv_event);
	if( tv_akino == -1 )	return;		//空きがない

	if( TVSecDataTypeChk(TV_ONEDAY_TYPE1) == 1 ) return;

	p = (TV_Sec_OneDay_Work *)&Fld.tv_event[tv_akino];

	p->datatype = TV_ONEDAY_TYPE1;
	p->watch_flag = TV_WATCH_FLAG_OFF;

    p->count		= from_p->count;
	p->walk_count	= GetRecord(CNT_WALK) - from_p->walk_count;
    p->get_pokeno	= from_p->get_pokeno;
    p->pokeno		= from_p->pokeno;
	p->worldpos		= from_p->worldpos;

	PM_strcpy(p->player_name, MyData.my_name);// 名前

	TVSecretIDSet((TV_Sec_Shop_Work *)p);

	return;
}


