//====================================================================
//
//							ファン企画		02/03/12 nohara							
//
//====================================================================
#include "common.h"
#include "intr.h"
#include "script.h"					//ScriptParameter
#include "calctool.h"				//pp_rand
#include "poketool.h"				//PokeNameData
#include "print.h"					//PM_strcpy
#include "syswork.h"				//EV_FAN_WORK
#include "server.h"					//WinLoseFlag
#include "score.h"					//SCORE_TABLE
#include "fan.h"					//FAN_YOUNGM1
#include "message.h"				//メッセージデータ
#include "..\script\saveflag.h"		//FV_FAN_01_C106_R0401
#include "..\script\savework.h"		//WK_SCENE_C106_R0401


/*
typedef struct{
	u8	point:7;
	u8  sw:1;
	u8	char_bit;
	u16 time;
} FAN_DATA;			//4byte
*/


//====================================================================
//							変数
//====================================================================
//ファンポイント値
static const u8 fan_point_data[FAN_POINT_DATA_MAX] = {2,1,2,1};

//勝ったときのファンになりやすさ順(上が高い)
const u8 fan_obj_add[FAN_MAX] = {
	FAN_SCHOOLW1,
	FAN_MIDDLEM2,
	FAN_OJYOU2,
	FAN_BOYA1,
	FAN_BOY2,
	FAN_YOUNGM1,
	FAN_WORKERW1,
	FAN_OLDWOMAN1,
};

//負けたときのあきやすさ順(上が高い)
const u8 fan_obj_sub[FAN_MAX] = {
	FAN_SCHOOLW1,
	FAN_YOUNGM1,
	FAN_WORKERW1,
	FAN_BOYA1,
	FAN_OJYOU2,
	FAN_BOY2,
	FAN_OLDWOMAN1,
	FAN_MIDDLEM2,
};


//====================================================================
//						プロトタイプ宣言
//====================================================================
void FanAllInit();
void FanCommBattleTimeSet();
void FanStart();
u8 FanPointCalc(u8);
u8 FanBitOn();
u8 FanBitOff();
void FanBitOnFirst();
u16 FanNoGet();
void FanTimeChk();
u16 ScrFanBitChk();
void ScrFanNameSet();
static void FanScoreNameSet(SCORE_TABLE *,u8,u8);
void FanCommBattleWinLoseChk();
u8 FanStartFlagChk();
void FanStartFlagOn();
u8 ScrFanPointAdd();


//--------------------------------------------------------------------
//							すべて初期化
//--------------------------------------------------------------------
void FanAllInit()
{
	FLD(FAN_WK) = 0;
	FLD(FAN_TM) = 0;
	return;
}

//--------------------------------------------------------------------
//				時間処理をして、通信対戦した時間を保存する
//--------------------------------------------------------------------
void FanCommBattleTimeSet()
{
	//add 02/08/24
	//ファン企画がスタートしてなかったら何もしない
	if( FanStartFlagChk() == FALSE )	return;

	//add 02/08/24
	//通信対戦をした後に呼ばれる
	//始めに経過時間を見てファンを減らす
	//次に今のプレイ時間をセットする
	FanTimeChk();
	FLD(FAN_TM) = MyData.playtime_h;
	return;
}

//--------------------------------------------------------------------
//				四天王を倒したので、フラグをオンにする
//				最初３人がファンにつく
//--------------------------------------------------------------------
void FanStart()
{
	if(  ((FLD(FAN_WK) >> FAN_START_FLAG_BIT) & 0x01) == 0 )
	{
		FanStartFlagOn();						//add 02/08/24
		FanBitOnFirst();
		FLD(FAN_TM) = MyData.playtime_h;		//add 02/08/24

		EventFlagReset( FV_FAN_01_C106_R0401 );
		EventFlagReset( FV_FAN_02_C106_R0401 );
		EventFlagReset( FV_FAN_03_C106_R0401 );
		EventFlagReset( FV_FAN_04_C106_R0401 );

		SetEventWorkValue( WK_SCENE_C106_R0401, 1 );
	}

	return;
}

//--------------------------------------------------------------------
//					ファンポイントを計算する
//
//	引数	コンテスト、四天王戦など
//	戻り値	ファンポイント
//--------------------------------------------------------------------
u8 FanPointCalc(u8 type)
{
	//ファン企画がスタートしているか
	//if( FanStartFlagChk() == FALSE )	return FAN_POINT;
	
	//add 02/09/16
	//ファンが出迎えてくれるアニメを見るまでは何もしない
	if( GetEventWorkValue( WK_SCENE_C106_R0401 ) != 2 ) return FAN_POINT;

	if(  ( FAN_POINT + fan_point_data[type] ) >= FAN_POINT_MAX )
	{
		if( FanNoGet() < FAN_POINT_OBJ_ADD_MAX )
		{
			FanBitOn();	//ファンビットを立てる
			FLD(FAN_WK) &= (0xff80);		//ファンポイントクリア
		}else
		{
			FLD(FAN_WK) &= (0xff80);		//ファンポイントクリア
			FLD(FAN_WK) |= FAN_POINT_MAX;	//ファンポイントMAXにする
		}
	}else
	{
		FLD(FAN_WK) += (fan_point_data[type] << FAN_POINT_BIT);
	}

	return FAN_POINT;
}

//--------------------------------------------------------------------
//					ファンの人数を増やす
//--------------------------------------------------------------------
u8 FanBitOn()
{
	u8 i,fan_no=0;
	u16 rnd;

	for( i=0; i < FAN_MAX ; i++ )
	{
		if( ((FLD(FAN_WK) >> fan_obj_add[i]) & 0x01) == 0 )
		{
			fan_no = i;				//保存
			rnd=pp_rand();
			if( (rnd % 2) )
			{
				FLD(FAN_WK) |= (1 << fan_obj_add[i]);
				return i;
			}
		}
	}

	//fan_noに入っているビットをオンにする
	FLD(FAN_WK) |= (1 << fan_obj_add[fan_no]);

	return fan_no;
}

//--------------------------------------------------------------------
//					ファンの人数を減らす
//					(０人にはならない)
//--------------------------------------------------------------------
u8 FanBitOff()
{
	u8 i,fan_no=0;
	u16 rnd;

	if( FanNoGet() == 1 ) return fan_no;					//ファンが一人の時は終了

	for( i=0; i < FAN_MAX ; i++ )
	{
		if( ((FLD(FAN_WK) >> fan_obj_sub[i]) & 0x01) == 1 )
		{
			fan_no = i;				//保存
			rnd=pp_rand();
			if( (rnd % 2) )
			{
				FLD(FAN_WK) ^= (1 << fan_obj_sub[i]);		//ファンの人数を減らす
				return i;
			}
		}
	}

	//fan_noに入っているビットをオフにする
	if( ((FLD(FAN_WK) >> fan_obj_sub[fan_no]) & 0x01) == 1 )
		FLD(FAN_WK) ^= (1 << fan_obj_sub[fan_no]);

	return fan_no;
}

//--------------------------------------------------------------------
//					ファンの人数を取得する
//--------------------------------------------------------------------
u16 FanNoGet()
{
	u8 i,count=0;

	for( i=0; i < FAN_MAX ; i++ )
	{
		if( ((FLD(FAN_WK) >> (FAN_BIT+i)) & 0x01) == 1 )	count++;
	}

	return count;
}

//--------------------------------------------------------------------
//前回通信対戦した時間からの、経過時間(プレイ時間)を見てファンを減らす
//--------------------------------------------------------------------
void FanTimeChk()
{
	u8 count=0;

	//最大999時間
	if( MyData.playtime_h >= 999 ) return;	//減らさない

	while(1)
	{
		//add 02/08/24
		//時間での減らす処理に４人以下には無効を追加
		if( FanNoGet() <= FAN_TIME_OBJ_SUB_MAX ) 
		{
			FLD(FAN_TM) = MyData.playtime_h;
			break;
		}

		if( count == FAN_MAX ) break;//時間がすごい経っていたらの対処

		if( (MyData.playtime_h - FLD(FAN_TM)) >= FAN_TIME_OVER )
		{
			FanBitOff();
			FLD(FAN_TM) += FAN_TIME_OVER;
			count++;
		}else
		{
			break;
		}
	}

	return;
}

//--------------------------------------------------------------------
//					自分のファンかチェック
//--------------------------------------------------------------------
u16 ScrFanBitChk()
{
	return ((FLD(FAN_WK) >> ScriptParameter0) & 0x01);
}

//--------------------------------------------------------------------
//					デフォルトのファンをセットする
//--------------------------------------------------------------------
void FanBitOnFirst()
{
	FLD(FAN_WK) |= (1 << FAN_YOUNGM1);		//ファンの人数を増やす
	FLD(FAN_WK) |= (1 << FAN_SCHOOLW1);		//ファンの人数を増やす
	FLD(FAN_WK) |= (1 << FAN_OJYOU2);		//ファンの人数を増やす
	return;
}

//対戦成績表にデータがないときのリーダーの名前
enum{
	FAN_MSG_MIKURI = 0,
	FAN_MSG_DAIGO,
	FAN_MSG_TOUKI,
	FAN_MSG_NAGI,
	FAN_MSG_HUYOU,
	FAN_MSG_PURIMU,
};

//--------------------------------------------------------------------
//					対戦表の何番目のファンかを取得
//--------------------------------------------------------------------
void ScrFanNameSet()
{
	u8 no = 0;
	u8 leader = FAN_MSG_MIKURI;

	switch( ScriptParameter0 )
	{
		case FAN_SCHOOLW1:
			break;
		case FAN_MIDDLEM2:
			break;
		case FAN_OJYOU2:
			no = 0;
			leader = FAN_MSG_NAGI;
			break;
		case FAN_BOYA1:
			no = 0;
			leader = FAN_MSG_DAIGO;
			break;
		case FAN_BOY2:
			no = 1;
			leader = FAN_MSG_MIKURI;
			break;
		case FAN_YOUNGM1:
			no = 0;
			leader = FAN_MSG_HUYOU;
			break;
		case FAN_WORKERW1:
			no = 1;
			leader = FAN_MSG_PURIMU;
			break;
		case FAN_OLDWOMAN1:
			break;
	}

	FanScoreNameSet( &Fld.TaisenScoreTable, no, leader );
	return;
}

//--------------------------------------------------------------------
//					対戦成績表から名前をセットする
//
//	対戦成績表に何もデータが入っていなかったら「ミクリ」を表示する
//--------------------------------------------------------------------
static void FanScoreNameSet( SCORE_TABLE *tbl, u8 no, u8 leader )
{
	if( tbl->score[no].name[0] == EOM_ )
	{
		switch( leader )
		{
			case FAN_MSG_MIKURI:
				PM_strcpy( StrTempBuffer0, fan_leader_name01 );
				break;
			case FAN_MSG_DAIGO:
				PM_strcpy( StrTempBuffer0, fan_leader_name02 );
				break;
			case FAN_MSG_TOUKI:
				PM_strcpy( StrTempBuffer0, fan_leader_name03 );
				break;
			case FAN_MSG_NAGI:
				PM_strcpy( StrTempBuffer0, fan_leader_name04 );
				break;
			case FAN_MSG_HUYOU:
				PM_strcpy( StrTempBuffer0, fan_leader_name05 );
				break;
			case FAN_MSG_PURIMU:
				PM_strcpy( StrTempBuffer0, fan_leader_name06 );
				break;
			default:
				PM_strcpy( StrTempBuffer0, fan_leader_name01 );
				break;
		}
	}else
	{
		PM_strncpy( StrTempBuffer0, tbl->score[no].name, PERSON_NAME_SIZE );
		StrTempBuffer0[PERSON_NAME_SIZE] = EOM_;
	}

	return;
}

//--------------------------------------------------------------------
//				通信対戦後、勝敗を見てファンの増減をする
//--------------------------------------------------------------------
void FanCommBattleWinLoseChk()
{
	//ファンが出迎えてくれるアニメを見るまでは何もしない
	if( GetEventWorkValue( WK_SCENE_C106_R0401 ) != 2 ) return;

	//add 02/08/24
	//時間処理をして、通信対戦した時間を保存する
	FanCommBattleTimeSet();

	if( WinLoseFlag == FIGHT_WIN )	FanBitOn();
	else	FanBitOff();

	return;
}

//--------------------------------------------------------------------
//					ファン企画がスタートしているか
//
//	戻り値	0	まだスタートしてない
//			1	スタートしている
//--------------------------------------------------------------------
u8 FanStartFlagChk()
{
	return ((FLD(FAN_WK) >> FAN_START_FLAG_BIT) & 0x01);
}

//--------------------------------------------------------------------
//					ファン企画をスタートさせる
//--------------------------------------------------------------------
void FanStartFlagOn()
{
	FLD(FAN_WK) |= FAN_START_FLAG_ON;
}

//--------------------------------------------------------------------
//					ファンポイント処理呼び出し
//
//					ScriptParameter0にタイプを入れる
//--------------------------------------------------------------------
u8 ScrFanPointAdd()
{
	return FanPointCalc((u8)ScriptParameter0);
}


