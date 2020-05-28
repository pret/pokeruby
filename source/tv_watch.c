//====================================================================
//
//						ＴＶ企画	02/03/28 nohara							
//
//						放送部分
//
//
//
/*
						＜データタイプを追加したとき＞
						・TVBroadCastSelect()に追加


*/
//====================================================================
#include "common.h"
#include "intr.h"
#include "menu.h"					//menutool.h
#include "calctool.h"				//pp_rand
#include "script.h"					//ScriptParameter
#include "fld_talk.h"				//FieldMsgSet
#include "poketool.h"				//PokeNameData
#include "server.h"					//FIGHT_WIN
#include "item.h"					//ITEM_MASTERBALL
#include "kaiwa.h"					//KaiwaCopyWord
#include "tv_def.h"					//TVのdefine群
#include "tv_tool.h"				//関数群
#include "tv.h"						//TVCameraWatchFlagReset
#include "letter.h"					//GeneratingEventSet
#include "record.h"					//CNT_TOWER_RENSHOU
#include "b_tower.def"				//BATTLE_TOWER_WIN


//====================================================================
//						  メッセージデータ
//====================================================================
#include "tv_msg.dat"


//====================================================================
//							  外部変数
//====================================================================
static u8	tv_msgno = 0;


//====================================================================
//							 extern宣言 
//====================================================================
extern u8* CopyMapName(u8 *buf, u16 div, u16 size);			//wmap.c


//====================================================================
//							プロトタイプ宣言
//====================================================================
void TVBroadCastSelect();					//TV放送
static void TVBroadCastEnd();				//放送終了共通処理
void TVBroadCastInit();						//放送前の初期化処理

//手紙型
static void LetterPokeBroadCastSet();		//ポケモンアンケート(カイナ)
static void LetterRecentlyBroadCastSet();	//最近おきた出来事(カイナ)
static void LetterClubBroadCastSet();		//大好きクラブ(カイナ)
static void LetterGymBroadCastSet();		//保留
static void LetterNameBroadCastSet();		//姓名判断師(カイナ)
void LetterGeneratingBroadCastSet();		//大量発生
static void LetterConBroadCastSet();		//コンテスト
static void LetterTowerBroadCastSet();		//バトルタワー

//秘密型
static void SecBtlBroadCastSet();			//捕まえたポケモンの紹介
static void SecShopBroadCastSet();			//買い物上手
static void SecGetFailedBroadCastSet();		//捕獲失敗
static void SecFishingBroadCastSet();		//釣りしまくり
static void SecOneDayBroadCastSet();		//一日に捕まえた数

//インタビュアー＆カメラマン
void TVCameraBroadCastSet();


//====================================================================
//							プログラム
//====================================================================

//--------------------------------------------------------------------
//							ＴＶ放送
//
//			ScriptParameter0の場所のdatatypeを見て処理を分ける
//--------------------------------------------------------------------
void TVBroadCastSelect()
{
	if( Fld.tv_event[ScriptParameter0].watch_flag == TV_WATCH_FLAG_OFF ) return;

	switch( Fld.tv_event[ScriptParameter0].datatype )
	{
		case TV_POKEMON_TYPE1:
			LetterPokeBroadCastSet();
			break;
		case TV_RECENTLY_TYPE1:
			LetterRecentlyBroadCastSet();
			break;
		case TV_CLUB_TYPE1:
			LetterClubBroadCastSet();
			break;
		case TV_GYMLEADER_TYPE1:
			LetterGymBroadCastSet();
			break;
		case TV_GENERATING_TYPE1:
			LetterGeneratingBroadCastSet();
			break;
		case TV_CONTEST_TYPE1:
			LetterConBroadCastSet();
			break;
		case TV_TOWER_TYPE1:
			LetterTowerBroadCastSet();
			break;
		case TV_GETPOKE_TYPE1:
			SecBtlBroadCastSet();
			break;
		case TV_SHOP_TYPE1:
			SecShopBroadCastSet();
			break;
		case TV_NAME_TYPE1:
			LetterNameBroadCastSet();
			break;
		case TV_FAILED_TYPE1:
			SecGetFailedBroadCastSet();
			break;
		case TV_FISHING_TYPE1:
			SecFishingBroadCastSet();
			break;
		case TV_ONEDAY_TYPE1:
			SecOneDayBroadCastSet();
			break;
	};
}

//--------------------------------------------------------------------
//						手紙型コンテスト放送
//
//
//	AnswerWorkに放送終了かを代入している		0 = まだ続く
//												1 = 放送終了
//--------------------------------------------------------------------
static void LetterConBroadCastSet()
{
	u8 no;
	TV_Con_Work *p;

	p = (TV_Con_Work *)&Fld.tv_event[ScriptParameter0];
	AnswerWork = 0;
	no = tv_msgno;

	switch( tv_msgno )
	{
		case 0:
			//buf=0 主人公の名前
			//buf=1 type
			//buf=2	rank
			PM_strcpy( StrTempBuffer0, p->player_name );
			TVContestTypeGet(1,p->type);
			TVContestRankGet(2,p->rank);

			//ニックネームをつけているか
			if( PM_strcmp( (u8 *)PokeNameData[p->pokeno], (u8 *)p->nickname ) == 0 )	
			{
				tv_msgno = 8;		//つけてない
			}else
			{
				tv_msgno = 1;		//つけてる
			}

			break;
		case 1:
			//buf=0	ポケモンの種類
			//buf=1	ニックネーム
			//buf=2 type
			PM_strcpy( StrTempBuffer0, PokeNameData[p->pokeno] );
			NickNameCopy( StrTempBuffer1, p->nickname );
			TVContestTypeGet(2,p->type);
			tv_msgno = 2;
			break;
		case 2:
			//buf=0 主人公の名前
			PM_strcpy( StrTempBuffer0, p->player_name );

			if( p->zyuni == 0 )	tv_msgno = 3;	//１位
			else	tv_msgno = 4;				//２位以下
			break;
		case 3:
			//buf=0 主人公の名前
			//buf=1	一言その１
			//buf=2	コンテストの順位
			PM_strcpy( StrTempBuffer0, p->player_name );
			KaiwaCopyWord( StrTempBuffer1, p->easytalk_no[0] );
			SetNumSelectBuf( 2, (int)(p->zyuni+1) );
			tv_msgno = 5;
			break;
		case 4:
			//buf=0 主人公の名前
			//buf=1	一言その１
			//buf=2	コンテストの順位
			PM_strcpy( StrTempBuffer0, p->player_name );
			KaiwaCopyWord( StrTempBuffer1, p->easytalk_no[0] );
			SetNumSelectBuf( 2, (int)(p->zyuni+1) );
			tv_msgno = 5;
			break;
		case 5:
			//buf=0 主人公の名前
			//buf=1	type
			//buf=2	一言その２
			PM_strcpy( StrTempBuffer0, p->player_name );
			TVContestTypeGet(1,p->type);
			KaiwaCopyWord( StrTempBuffer2, p->easytalk_no[1] );

			if( p->waza != 0 )	tv_msgno = 6;
			else	tv_msgno = 7;	//無効な技
			break;
		case 6:
			//buf=0 ポケモンの種類
			//buf=1 最後に使った技
			//buf=2	一言その２
			PM_strcpy( StrTempBuffer0, PokeNameData[p->pokeno] );
			PM_strcpy( StrTempBuffer1, WazaNameData[p->waza] );
			KaiwaCopyWord( StrTempBuffer2, p->easytalk_no[1] );
			tv_msgno = 7;
			break;
		case 7:
			//buf=0	主人公の名前
			//buf=1 ポケモンの種類
			PM_strcpy( StrTempBuffer0, p->player_name );
			PM_strcpy( StrTempBuffer1, PokeNameData[p->pokeno] );
			TVBroadCastEnd();
			break;
		case 8:
			//buf=0 ポケモンの種類
			PM_strcpy( StrTempBuffer0, PokeNameData[p->pokeno] );
			tv_msgno = 2;
			break;
	};

	FieldMsgSet(msg_letter_contest_buf[no]);
	return;
}

//--------------------------------------------------------------------
//						手紙型バトルタワー放送
//
//
//	AnswerWorkに放送終了かを代入している		0 = まだ続く
//												1 = 放送終了
//--------------------------------------------------------------------
static void LetterTowerBroadCastSet()
{
	u8 no;
	TV_Tower_Work *p;

	p = (TV_Tower_Work *)&Fld.tv_event[ScriptParameter0];
	AnswerWork = 0;
	no = tv_msgno;

	switch( tv_msgno )
	{
		case 0:
			//buf=0 主人公の名前
			//buf=1	手持ちポケモン
			PM_strcpy( StrTempBuffer0, p->player_name );
			PM_strcpy( StrTempBuffer1, PokeNameData[p->pokeno] );

			if(  p->win >= 7 ) tv_msgno = 1;
			else	tv_msgno = 2;
			break;
		case 1:
			//buf=0	レベル
			//buf=1	連勝数
			SetNumSelectBuf( 0, (int)p->level );
			SetNumSelectBuf( 1, (int)p->win );

			if( p->win_flag == FIGHT_WIN ) tv_msgno = 3;
			else	tv_msgno = 4;
			break;
		case 2:
			//buf=0 最後のトレーナーの名前
			//buf=1	連勝数
			PM_strcpy( StrTempBuffer0, p->enemy_name );
			SetNumSelectBuf( 1, (int)(p->win + 1) );

			//まんぞく・ふまん選択
			if( p->ans == 0 )	tv_msgno = 5;		//まんぞく
			else	tv_msgno = 6;					//ふまん
			break;
		case 3:
			//buf=0 最後のトレーナーの名前
			//buf=1	最後のポケモン
			PM_strcpy( StrTempBuffer0, p->enemy_name );
			PM_strcpy( StrTempBuffer1, PokeNameData[p->enemy_pokeno] );

			//まんぞく・ふまん選択
			if( p->ans == 0 )	tv_msgno = 5;		//まんぞく
			else	tv_msgno = 6;					//ふまん
			break;
		case 4:
			//buf=0 最後のトレーナーの名前
			//buf=1	最後のポケモン
			PM_strcpy( StrTempBuffer0, p->enemy_name );
			PM_strcpy( StrTempBuffer1, PokeNameData[p->enemy_pokeno] );

			//まんぞく・ふまん選択
			if( p->ans == 0 )	tv_msgno = 5;		//まんぞく
			else	tv_msgno = 6;					//ふまん
			break;
		case 5:
			//buf=0 最後のトレーナーの名前
			PM_strcpy( StrTempBuffer0, p->enemy_name );

			tv_msgno = 11;
			break;
		case 6:
			//buf=0 最後のトレーナーの名前
			PM_strcpy( StrTempBuffer0, p->enemy_name );

			tv_msgno = 11;
			break;
		case 7:
			tv_msgno = 11;
			break;
		case 8:
			//buf=0 主人公の名前
			PM_strcpy( StrTempBuffer0, p->player_name );

			tv_msgno = 11;
			break;
		case 9:
			//buf=0 主人公の名前
			PM_strcpy( StrTempBuffer0, p->player_name );

			tv_msgno = 11;
			break;
		case 10:
			//buf=0 主人公の名前
			PM_strcpy( StrTempBuffer0, p->player_name );

			tv_msgno = 11;
			break;
		case 11:
			//buf=0 簡易文の１ワード
			KaiwaCopyWord( StrTempBuffer0, p->easytalk_no );

			//まんぞく・ふまん選択
			if( p->ans == 0 )	tv_msgno = 12;		//まんぞく
			else	tv_msgno = 13;					//ふまん

			break;
		case 12:
			//buf=0 簡易文の１ワード
			//buf=1 主人公の名前
			//buf=2 最後のトレーナーの名前
			KaiwaCopyWord( StrTempBuffer0, p->easytalk_no );
			PM_strcpy( StrTempBuffer1, p->player_name );
			PM_strcpy( StrTempBuffer2, p->enemy_name );

			tv_msgno = 14;
			break;
		case 13:
			//buf=0 簡易文の１ワード
			//buf=1 主人公の名前
			//buf=2 最後のトレーナーの名前
			KaiwaCopyWord( StrTempBuffer0, p->easytalk_no );
			PM_strcpy( StrTempBuffer1, p->player_name );
			PM_strcpy( StrTempBuffer2, p->enemy_name );

			tv_msgno = 14;
			break;
		case 14:
			//buf=0 主人公の名前
			//buf=1	手持ちポケモン
			PM_strcpy( StrTempBuffer0, p->player_name );
			PM_strcpy( StrTempBuffer1, PokeNameData[p->pokeno] );

			TVBroadCastEnd();
			break;
	};

	FieldMsgSet(msg_letter_tower_buf[no]);
	return;
}

//--------------------------------------------------------------------
//						秘密型買い物上手放送
//
//
//	AnswerWorkに放送終了かを代入している		0 = まだ続く
//												1 = 放送終了
//--------------------------------------------------------------------
static void SecShopBroadCastSet()
{
	u8 no;
	TV_Sec_Shop_Work *p;

	p = (TV_Sec_Shop_Work *)&Fld.tv_event[ScriptParameter0];
	AnswerWork = 0;
	no = tv_msgno;


	switch( tv_msgno )
	{
		case 0:
			//buf=0	主人公の名前
			//buf=1 町の名前
			PM_strcpy( StrTempBuffer0, p->player_name );
			CopyMapName( StrTempBuffer1, p->worldpos, 0);

			if( p->num[0] >= 255 )	tv_msgno = 11;
			else	tv_msgno = 1;
			break;
		case 1:
			//buf=0	主人公の名前
			//buf=1 商品名１
			//buf=2 商品名１の数
			PM_strcpy( StrTempBuffer0, p->player_name );
			PM_strcpy( StrTempBuffer1, ItemNameGet( p->itemno[0] ) );
			SetNumSelectBuf( 2, (int)p->num[0] );

			tv_msgno += (pp_rand() % 4)+1;
			break;
		case 2:
		case 4:
		case 5:
			if( p->itemno[1] != 0 )	tv_msgno = 6;
			else	tv_msgno = 10;
			break;
		case 3:
			//buf=2 商品名１の数(乱数1の時のみ+1して表示する)
			SetNumSelectBuf( 2, (int)(p->num[0]+1) );

			if( p->itemno[1] != 0 )	tv_msgno = 6;
			else	tv_msgno = 10;
			break;
		case 6:
			//buf=1 商品名２
			//buf=2 商品名２の数
			PM_strcpy( StrTempBuffer1, ItemNameGet( p->itemno[1] ) );
			SetNumSelectBuf( 2, (int)p->num[1] );

			if( p->itemno[2] != 0 )	tv_msgno = 7;
			else if( p->bargain_flag == 1 )	tv_msgno = 8;
			else	tv_msgno = 9;
			break;
		case 7:
			//buf=1 商品名３
			//buf=2 商品名３の数
			PM_strcpy( StrTempBuffer1, ItemNameGet( p->itemno[2] ) );
			SetNumSelectBuf( 2, (int)p->num[2] );

			if( p->bargain_flag == 1 )	tv_msgno = 8;
			else	tv_msgno = 9;
			break;
		case 8:
			if( p->num[0] >= 255 )	tv_msgno = 12;
			else	tv_msgno = 9;
			break;
		case 9:
			//buf=1 合計金額
			SetTotalMoneySelectBuf( 1, p );

			TVBroadCastEnd();
			break;
		case 10:
			if( p->bargain_flag == 1 )	tv_msgno = 8;
			else	tv_msgno = 9;
			break;
		case 11:
			//buf=0	主人公の名前
			//buf=1 商品名１
			PM_strcpy( StrTempBuffer0, p->player_name );
			PM_strcpy( StrTempBuffer1, ItemNameGet( p->itemno[0] ) );

			if( p->bargain_flag == 1 )	tv_msgno = 8;
			else	tv_msgno = 12;
			break;
		case 12:
			//buf=0	主人公の名前
			PM_strcpy( StrTempBuffer0, p->player_name );

			TVBroadCastEnd();
			break;
	};

	FieldMsgSet(msg_sec_shop_buf[no]);
	return;
}

//--------------------------------------------------------------------
//						秘密型姓名判断氏放送
//
//
//	AnswerWorkに放送終了かを代入している		0 = まだ続く
//												1 = 放送終了
//--------------------------------------------------------------------
static void LetterNameBroadCastSet()
{
	u8 no;
	TV_Name_Work *p;

	p = (TV_Name_Work *)&Fld.tv_event[ScriptParameter0];
	AnswerWork = 0;
	no = tv_msgno;


	switch( tv_msgno )
	{
		case 0:
			//buf=0	主人公の名前
			//buf=1	ポケモンの種類
			//buf=2 ニックネーム
			PM_strcpy( StrTempBuffer0, p->player_name );
			PM_strcpy( StrTempBuffer1, PokeNameData[p->pokeno] );
			NickNameCopy( StrTempBuffer2, p->nickname );

			tv_msgno = ( GetPokeNickNameBit(p) + 1 );
			break;
		case 1:
		case 3:
		case 4:
		case 5:
		case 6:
		case 7:
		case 8:
			//tv_msgno = (pp_rand() % 3)+9;
			if( p->r_q_no[0] == 0 )			tv_msgno = 9;
			else if( p->r_q_no[0] == 1 )	tv_msgno = 10;
			else if( p->r_q_no[0] == 2 )	tv_msgno = 11;
			break;
		case 2:
			//buf=0	主人公の名前
			PM_strcpy( StrTempBuffer0, p->player_name );

			if( p->r_q_no[0] == 0 )			tv_msgno = 9;
			else if( p->r_q_no[0] == 1 )	tv_msgno = 10;
			else if( p->r_q_no[0] == 2 )	tv_msgno = 11;
			break;
		case 9:
		case 10:
		case 11:
			//buf=0 ニックネーム
			//buf=1	ニックネーム１文字目
			//buf=2	ニックネーム２文字目
			NickNameCopy( StrTempBuffer0, p->nickname );
			SetMojiNoSelectBuf( 1, 0, TV_NAME_NTOP, TV_NAME_NICK, 0, p );
			SetMojiNoSelectBuf( 2, 1, TV_NAME_NTOP, TV_NAME_NICK, 0, p);

			tv_msgno = 12;
			break;
		case 12:
			if( p->r_q_no[1] == 0 )	tv_msgno = 13;
			else	tv_msgno = 15;
			break;
		case 13:
			//buf=0	主人公の名前
			//buf=1	主人公２文字分
			//buf=2	ニックネーム後ろから２文字分
			PM_strcpy( StrTempBuffer0, p->player_name );
			SetMojiNoSelectBuf( 1, 0, TV_NAME_TOP, TV_NAME_MY, 0, p );
			SetMojiNoSelectBuf( 2, 0, TV_NAME_LAST, TV_NAME_NICK, 0, p );

			tv_msgno = 14;
			break;
		case 14:
			//buf=1	ニックネーム２文字分
			//buf=2	主人公後ろから２文字分
			SetMojiNoSelectBuf( 1, 0, TV_NAME_TOP, TV_NAME_NICK, 0, p );
			SetMojiNoSelectBuf( 2, 0, TV_NAME_LAST, TV_NAME_MY, 0, p );

			tv_msgno = 18;
			break;
		case 15:
			//buf=0	ニックネーム２文字分
			//buf=1	ポケモンの種類
			//buf=2	ポケモンの種類後ろから２文字分
			SetMojiNoSelectBuf( 0, 0, TV_NAME_TOP, TV_NAME_NICK, 0, p );
			PM_strcpy( StrTempBuffer1, PokeNameData[p->pokeno] );
			SetMojiNoSelectBuf( 2, 0, TV_NAME_LAST, TV_NAME_POKE, p->pokeno, p );

			tv_msgno = 16;
			break;
		case 16:
			//buf=0	ポケモンの種類から２文字分
			//buf=2	ニックネーム後ろから２文字分
			SetMojiNoSelectBuf( 0, 0, TV_NAME_TOP, TV_NAME_POKE, p->pokeno, p );
			SetMojiNoSelectBuf( 2, 0, TV_NAME_LAST, TV_NAME_NICK, 0, p );

			tv_msgno = 17;
			break;
		case 17:
			//buf=0	ニックネーム２文字分
			//buf=1	ランダムのポケモンの種類
			//buf=2	↑の後ろから２文字分
			SetMojiNoSelectBuf( 0, 0, TV_NAME_TOP, TV_NAME_NICK, 0, p );
			PM_strcpy( StrTempBuffer1, PokeNameData[p->r_pokeno] );
			SetMojiNoSelectBuf( 2, 0, TV_NAME_LAST, TV_NAME_POKE, p->r_pokeno, p );

			tv_msgno = 18;
			break;
		case 18:
			//buf=0 ニックネーム
			NickNameCopy( StrTempBuffer0, p->nickname );

			TVBroadCastEnd();
			break;
	};

	FieldMsgSet(msg_name_buf[no]);
	return;
}

//--------------------------------------------------------------------
//					秘密型捕まえたポケモン放送
//
//
//	AnswerWorkに放送終了かを代入している		0 = まだ続く
//												1 = 放送終了
//--------------------------------------------------------------------
static void SecBtlBroadCastSet()
{
	u8 no;
	TV_Sec_Btl_Work *p;

	p = (TV_Sec_Btl_Work *)&Fld.tv_event[ScriptParameter0];
	AnswerWork = 0;
	no = tv_msgno;


	switch( tv_msgno )
	{
		case 0:
			//buf=0	主人公の名前
			//buf=1 捕まえたポケモンの種類
			//buf=2 捕まえたポケモンのニックネーム
			PM_strcpy( StrTempBuffer0, p->player_name );
			PM_strcpy( StrTempBuffer1, PokeNameData[p->get_pokeno] );
			NickNameCopy( StrTempBuffer2, p->nickname );

			if( p->ball_type == ITEM_MASUTAABOORU )	tv_msgno = 5;
			else	tv_msgno = 1;
			break;
		case 1:
			tv_msgno = 2;
			break;
		case 2:
			//buf=1	ボールの種類
			//buf=2 ボールを投げた数
			PM_strcpy( StrTempBuffer1, ItemNameGet( p->ball_type ) );
			SetNumSelectBuf( 2, (int)p->ball_count );

			if( p->ball_count <= 3 )	tv_msgno = 3;
			else	tv_msgno = 4;
			break;
		case 3:
			//buf=0	主人公の名前
			//buf=1 捕まえたポケモンの種類
			//buf=2 捕まえたポケモンのニックネーム
			PM_strcpy( StrTempBuffer0, p->player_name );
			PM_strcpy( StrTempBuffer1, PokeNameData[p->get_pokeno] );
			NickNameCopy( StrTempBuffer2, p->nickname );

			tv_msgno = 6;
			break;
		case 4:
			tv_msgno = 6;
			break;
		case 5:
			//buf=0	主人公の名前
			//buf=1 捕まえたポケモンの種類
			PM_strcpy( StrTempBuffer0, p->player_name );
			PM_strcpy( StrTempBuffer1, PokeNameData[p->get_pokeno] );

			tv_msgno = 6;
			break;
		case 6:
			//buf=0	主人公の名前
			//buf=1 捕まえたポケモンの種類
			//buf=2 捕まえたポケモンのニックネーム
			PM_strcpy( StrTempBuffer0, p->player_name );
			PM_strcpy( StrTempBuffer1, PokeNameData[p->get_pokeno] );
			NickNameCopy( StrTempBuffer2, p->nickname );
			
			tv_msgno += (pp_rand() % 4)+1;
			break;
		case 7:
		case 8:
			//buf=0 捕まえたポケモンの種類
			//buf=1 捕まえたポケモンのニックネーム
			//buf=2	ランダムのポケモンの種類(0とかぶらないように)
			PM_strcpy( StrTempBuffer0, PokeNameData[p->get_pokeno] );
			NickNameCopy( StrTempBuffer1, p->nickname );
			SetRndChoicePokeSelectBuf( 2, p->get_pokeno );

			tv_msgno = 11;
			break;
		case 9:
		case 10:
			//buf=0 捕まえたポケモンの種類
			//buf=1 捕まえたポケモンのニックネーム
			PM_strcpy( StrTempBuffer0, PokeNameData[p->get_pokeno] );
			NickNameCopy( StrTempBuffer1, p->nickname );
			
			tv_msgno = 11;
			break;
		case 11:
			TVBroadCastEnd();
			break;
	};

	FieldMsgSet(msg_sec_btl_buf[no]);
	return;
}

//--------------------------------------------------------------------
//						秘密型捕獲失敗放送
//
//
//	AnswerWorkに放送終了かを代入している		0 = まだ続く
//												1 = 放送終了
//--------------------------------------------------------------------
static void SecGetFailedBroadCastSet()
{
	u8 no;
	TV_Sec_Get_Failed_Work *p;

	p = (TV_Sec_Get_Failed_Work *)&Fld.tv_event[ScriptParameter0];
	AnswerWork = 0;
	no = tv_msgno;


	switch( tv_msgno )
	{
		case 0:
			//buf=0	主人公の名前
			//buf=1 ポケモンの種類
			PM_strcpy( StrTempBuffer0, p->player_name );
			PM_strcpy( StrTempBuffer1, PokeNameData[p->pokeno] );

			tv_msgno = 1;
			break;
		case 1:
			//buf=0	主人公の名前
			//buf=1 主人公がいた地名
			//buf=2 捕獲失敗したポケモン
			PM_strcpy( StrTempBuffer0, p->player_name );
			CopyMapName( StrTempBuffer1, p->worldpos, 0);
			PM_strcpy( StrTempBuffer2, PokeNameData[p->failed_pokeno] );

			if( p->failed_flag == FIGHT_WIN )	tv_msgno = 3;	//倒した
			else	tv_msgno = 2;						//逃げられた
			break;
		case 2:
		case 3:
			//buf=0	主人公の名前
			//buf=1 ボールを投げた数
			PM_strcpy( StrTempBuffer0, p->player_name );
			SetNumSelectBuf( 1, (int)p->ball_count );

			if( (pp_rand() % 3) == 0 )	tv_msgno = 5;		//1 : 3
			else	tv_msgno = 4;
			break;
		case 4:
		case 5:
			//buf=0	主人公の名前
			PM_strcpy( StrTempBuffer0, p->player_name );
			tv_msgno = 6;
			break;
		case 6:
			TVBroadCastEnd();
			break;
	};

	FieldMsgSet(msg_sec_get_failed_buf[no]);
	return;
}

#define KAIWA_NO	50			//簡易会話を表示するtv_msgno
#define KAIWA_NO2	51			//簡易会話を表示するtv_msgno
//--------------------------------------------------------------------
//					手紙型ポケモンアンケート放送
//
//	AnswerWorkに放送終了かを代入している		0 = まだ続く
//												1 = 放送終了
//--------------------------------------------------------------------
static void LetterPokeBroadCastSet()
{
	u8 no;
	u16 rnd;
	TV_Letter_Work *p;

	p = (TV_Letter_Work *)&Fld.tv_event[ScriptParameter0];
	AnswerWork = 0;
	no = tv_msgno;


	switch( tv_msgno )
	{
		case 0:
			//buf=0	主人公の名前
			//buf=1 何のポケモンについての手紙か
			PM_strcpy( StrTempBuffer0, p->player_name );
			PM_strcpy( StrTempBuffer1, PokeNameData[p->inside_data] );
	
			tv_msgno = KAIWA_NO;
			break;
		case 1:

			rnd = (pp_rand() % 4)+1;
			if( rnd == 1 )	tv_msgno = 2;
			else	tv_msgno = rnd+2;		//4,5,6
			break;
		case 2:
			tv_msgno = KAIWA_NO2;
			break;
		case 3:
			tv_msgno += (pp_rand() % 3)+1;
			break;
		case 4:
		case 5:
		case 6:
			//buf=2 簡易文の中の適当な１ワード
			GetLetterRndKaiwaWord(p);
			
			tv_msgno = 7;
			break;
		case 7:
			//buf=2 ランダムの点数 70-100の間
			rnd = (pp_rand() % 31)+70;
			SetNumSelectBuf( 2, (int)rnd );

			TVBroadCastEnd();
			break;
		case KAIWA_NO:
			KaiwaCopySentence(MsgExpandBuffer, p->easytalk, 2, 2);
			FieldMsgSet(MsgExpandBuffer);
			tv_msgno = 1;
			return;
		case KAIWA_NO2:
			KaiwaCopySentence(MsgExpandBuffer, p->easytalk, 2, 2);
			FieldMsgSet(MsgExpandBuffer);
			tv_msgno = 3;
			return;
	};

	//簡易会話表示があるため
	FieldMsgSet(msg_letter_poke_buf[no]);
	return;
}

//--------------------------------------------------------------------
//					手紙型さいきんのできごと放送
//
//	AnswerWorkに放送終了かを代入している		0 = まだ続く
//												1 = 放送終了
//--------------------------------------------------------------------
static void LetterRecentlyBroadCastSet()
{
	u8 no;
	TV_Letter_Work *p;

	p = (TV_Letter_Work *)&Fld.tv_event[ScriptParameter0];
	AnswerWork = 0;
	no = tv_msgno;


	switch( tv_msgno )
	{
		case 0:
			//buf=0	主人公の名前
			//buf=2 簡易文の中の適当な１ワード
			PM_strcpy( StrTempBuffer0, p->player_name );
			GetLetterRndKaiwaWord(p);
			
			tv_msgno = KAIWA_NO;
			break;
		case 1:
			tv_msgno += (pp_rand() % 3)+1;
			break;
		case 2:
		case 3:
		case 4:
			tv_msgno = 5;
			break;
		case 5:
			TVBroadCastEnd();
			break;
		case KAIWA_NO:
			KaiwaCopySentence(MsgExpandBuffer, p->easytalk, 2, 2);
			FieldMsgSet(MsgExpandBuffer);
			tv_msgno = 1;
			return;
	};

	//簡易会話表示があるため
	FieldMsgSet(msg_letter_recently_buf[no]);
	return;
}

//--------------------------------------------------------------------
//				手紙型大好きクラブのインタビュー放送
//
//	AnswerWorkに放送終了かを代入している		0 = まだ続く
//												1 = 放送終了
//--------------------------------------------------------------------
static void LetterClubBroadCastSet()
{
	u8 no;
	TV_Club_Work *p;

	p = (TV_Club_Work *)&Fld.tv_event[ScriptParameter0];
	AnswerWork = 0;
	no = tv_msgno;


	switch( tv_msgno )
	{
		case 0:
			//buf=0	主人公の名前
			//buf=1 捕まえたポケモンの種類
			//buf=2 捕まえたポケモンのニックネーム
			PM_strcpy( StrTempBuffer0, p->player_name );
			PM_strcpy( StrTempBuffer1, PokeNameData[p->pokeno] );
			NickNameCopy( StrTempBuffer2, p->nickname );

			tv_msgno = (p->ans+1);
			break;
		case 1:
		case 2:
		case 3:
			//buf=0	主人公の名前
			//buf=1 捕まえたポケモンの種類
			//buf=2 簡易会話の1ワード[0]
			PM_strcpy( StrTempBuffer0, p->player_name );
			PM_strcpy( StrTempBuffer1, PokeNameData[p->pokeno] );
			KaiwaCopyWord( StrTempBuffer2, p->easytalk_no[0] );
			
			tv_msgno = 4;
			break;
		case 4:
			//buf=0	主人公の名前
			//buf=2 簡易会話の1ワード[1]
			PM_strcpy( StrTempBuffer0, p->player_name );
			KaiwaCopyWord( StrTempBuffer2, p->easytalk_no[1] );
			
			TVBroadCastEnd();
			break;
	};

	FieldMsgSet(msg_letter_club_buf[no]);
	return;
}

//--------------------------------------------------------------------
//				手紙型ジムリーダー戦後のインタビュー放送
//
//	AnswerWorkに放送終了かを代入している		0 = まだ続く
//												1 = 放送終了
//--------------------------------------------------------------------
static void LetterGymBroadCastSet()
{
	return;
}

//--------------------------------------------------------------------
//						手紙型大量発生放送
//
//	AnswerWorkに放送終了かを代入している		0 = まだ続く
//												1 = 放送終了
//--------------------------------------------------------------------
void LetterGeneratingBroadCastSet()
{
	TV_Generating_Work *p;
	p = (TV_Generating_Work *)&Fld.tv_event[ScriptParameter0];

	//buf=0 道路番号
	//buf=1	ポケモンの種類
	CopyMapName( StrTempBuffer0, p->map_id, 0);
	PM_strcpy( StrTempBuffer1, PokeNameData[p->pokeno] );

	TVBroadCastEnd();

	//データは消さずに取っておく(通信で相手に渡すため)

	//大量発生イベントをセットする
	GeneratingEventSet();	

	FieldMsgSet(msg_letter_generating_buf[tv_msgno]);
	return;
}

//--------------------------------------------------------------------
//					インタビュアー＆カメラマン放送
//
//	AnswerWorkに放送終了かを代入している		0 = まだ続く
//												1 = 放送終了
//--------------------------------------------------------------------
void TVCameraBroadCastSet()
{
	u8 no;
	AnswerWork = 0;
	no = tv_msgno;

	switch( tv_msgno )
	{
		case 0:
			//buf=0	戦った場所
			CopyMapName( StrTempBuffer0, Fld.tv_camera.worldpos, 0);

			if( Fld.tv_camera.battle >= 2 ) tv_msgno = 1;
			else tv_msgno = 2;
			break;
		case 1:
			tv_msgno = 2;
			break;
		case 2:
			if( Fld.tv_camera.damage_flag == 0 ) tv_msgno = 4;
			else if( Fld.tv_camera.throw_flag ) tv_msgno = 5;
			else if( Fld.tv_camera.kaihuku_flag ) tv_msgno = 6;
			else if( Fld.tv_camera.kizetsu_flag ) tv_msgno = 7;
			else tv_msgno = 3;
			break;
		case 3:
			//buf=0	使ったポケモンの種類
			//buf=1 最後に使った技
			//buf=2	使ったポケモンの種類２
			PM_strcpy( StrTempBuffer0, PokeNameData[Fld.tv_camera.pokeno[0]] );
			PM_strcpy( StrTempBuffer1, WazaNameData[Fld.tv_camera.waza] );
			PM_strcpy( StrTempBuffer2, PokeNameData[Fld.tv_camera.pokeno[1]] );
			tv_msgno = 8;
			break;
		case 4:
		case 5:
		case 6:
		case 7:
			tv_msgno = 8;
			break;
		case 8:
			//buf=0 簡易文の1ワード
			//buf=1	使ったポケモンの種類
			//buf=2	使ったポケモンの種類２
			KaiwaCopyWord( StrTempBuffer0, Fld.tv_camera.easytalk_no );
			PM_strcpy( StrTempBuffer1, PokeNameData[Fld.tv_camera.pokeno[0]] );
			PM_strcpy( StrTempBuffer2, PokeNameData[Fld.tv_camera.pokeno[1]] );
			AnswerWork = 1;
			tv_msgno = 0;
			TVCameraWatchFlagReset();
			break;
	};

	FieldMsgSet(camera_msg_buf[no]);
	return;
}

//--------------------------------------------------------------------
//						秘密型釣りしまくり放送
//
//
//	AnswerWorkに放送終了かを代入している		0 = まだ続く
//												1 = 放送終了
//--------------------------------------------------------------------
static void SecFishingBroadCastSet()
{
	u8 no;
	TV_Sec_Fishing_Work *p;

	p = (TV_Sec_Fishing_Work *)&Fld.tv_event[ScriptParameter0];
	AnswerWork = 0;

	if( p->true_count < p->false_count )	tv_msgno = 0;	//失敗
	else	tv_msgno = 1;	//成功

	no = tv_msgno;


	switch( tv_msgno )
	{
		case 0:
			//buf=0	主人公の名前
			//buf=1 ポケモンの種類
			//buf=2 釣りをした回数
			PM_strcpy( StrTempBuffer0, p->player_name );
			PM_strcpy( StrTempBuffer1, PokeNameData[p->pokeno] );
			SetNumSelectBuf( 2, (int)p->false_count );

			TVBroadCastEnd();
			break;
		case 1:
			//buf=0	主人公の名前
			//buf=1 ポケモンの種類
			//buf=2 釣りをした回数
			PM_strcpy( StrTempBuffer0, p->player_name );
			PM_strcpy( StrTempBuffer1, PokeNameData[p->pokeno] );
			SetNumSelectBuf( 2, (int)p->true_count );

			TVBroadCastEnd();
			break;
	};

	FieldMsgSet(msg_sec_fish_buf[no]);
	return;
}

//--------------------------------------------------------------------
//					秘密型一日に捕まえた数放送
//
//
//	AnswerWorkに放送終了かを代入している		0 = まだ続く
//												1 = 放送終了
//--------------------------------------------------------------------
static void SecOneDayBroadCastSet()
{
	u8 no;
	TV_Sec_OneDay_Work *p;

	p = (TV_Sec_OneDay_Work *)&Fld.tv_event[ScriptParameter0];
	AnswerWork = 0;

	no = tv_msgno;

	switch( tv_msgno )
	{
		case 0:
			//buf=0	主人公の名前
			//buf=1 歩数
			//buf=2 捕まえた数
			PM_strcpy( StrTempBuffer0, p->player_name );
			SetNumSelectBuf( 1, (int)p->walk_count );
			SetNumSelectBuf( 2, (int)p->count );
			tv_msgno = 1;
			break;
		case 1:
			//buf=0 ポケモンの種類
			PM_strcpy( StrTempBuffer0, PokeNameData[p->pokeno] );
			tv_msgno = 2;
			break;
		case 2:
			//buf=0	主人公の名前
			//buf=1 町の名前
			//buf=2 捕まえたポケモンの種類
			PM_strcpy( StrTempBuffer0, p->player_name );
			CopyMapName( StrTempBuffer1, p->worldpos, 0);
			PM_strcpy( StrTempBuffer2, PokeNameData[p->get_pokeno] );
			TVBroadCastEnd();
			break;
	};

	FieldMsgSet(msg_sec_oneday_buf[no]);
	return;
}

//--------------------------------------------------------------------
//						放送終了共通処理
//--------------------------------------------------------------------
static void TVBroadCastEnd()
{
	AnswerWork = 1;
	tv_msgno = 0;
	Fld.tv_event[ScriptParameter0].watch_flag = TV_WATCH_FLAG_OFF;
	return;
}

//--------------------------------------------------------------------
//						放送前の初期化処理
//--------------------------------------------------------------------
void TVBroadCastInit()
{
	tv_msgno = 0;
	return;
}


