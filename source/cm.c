//====================================================================
//
//						ＴＶ企画	01/11/21 nohara							
//
//						ＣＭ
//
//====================================================================
#include "common.h"
#include "intr.h"
#include "menu.h"					//print.h
#include "calctool.h"				//pp_rand
#include "script.h"					//ScriptParameter
#include "fld_talk.h"				//FieldMsgSet
#include "tv_def.h"					//TVのdefine群
#include "tv_tool.h"				//TVの関数群
#include "cm.h"						//CMのdefine群
#include "rtctool.h"				//GameTime
#include "sysflag.h"				//SYS_GAME_CLEAR
#include "..\sxydata\field_c102.sym"//GANBARIYA_01_FIELD_C102
#include "fieldmap.h"				//↓のインクルードのため
#include "../evdata/maparray.h"		//C104_FS01


//====================================================================
//						メッセージデータ
//====================================================================
#include "cm_msg.dat"


//====================================================================
//						プロトタイプ宣言	
//====================================================================
void CMDataSet();				//データセット
s8 CMDataAkiChk(TV_CM *);		//CMデータの空いている場所をかえす
void CMDataAllInit();			//CMデータ初期化
u8 CMTimeCountChk();			//time_count <= CM_BROADCAST_TIME があるか
void CMDataClear(u8);			//指定した場所のCMデータを削除
void CMDataSort();				//空きがあればCMデータを前につめる(ソート)
static u8 CMDataTypeChk(u8);	//同じdatatypeが存在するか
u8 CMEventStartChk(u8 type);	//イベント開催しているか
void CMData_Update(u16);		//時間カウント更新
u8 CMDataHoldingTypeChk(u8);	//タイプ別開催チェック


//====================================================================
//							変数
//====================================================================
//開催前の放送メッセージ
const u8 * const cm_msg_buf[]=
{
	NULL,
	msg_cm_01_p01_bargain,
	msg_cm_01_p01_casino,
	msg_cm_01_p01_find,
};

//開催当日の放送メッセージ(午前)
const u8 * const cm_morning_msg_buf[]=
{
	NULL,
	msg_cm_01_p02_bargain,
	msg_cm_01_p02_casino,
	msg_cm_01_p02_find,
};

//開催当日の放送メッセージ(午後)
const u8 * const cm_night_msg_buf[]=
{
	NULL,
	msg_cm_01_p03_bargain,
	msg_cm_01_p03_casino,
	msg_cm_01_p03_find,
};


//====================================================================
//							データセット
//
//						CMはこれを呼べばよい
//====================================================================
void CMDataSet()
{
	u16 rnd;
	u16 ans;

	//ゲームクリアしているか
	if( EventFlagCheck( SYS_GAME_CLEAR ) == FALSE ) return;

	//空きがあるか
	tv_akino = CMDataAkiChk(Fld.tv_cm);
	if( tv_akino == -1 )	return;

	//CMデータを作成するかの、ランダムを取得
	if( TVRndChk(CM_START_ON) == 1 ) return;

	rnd = pp_rand();

	//datatype取得
	ans = (rnd % (CM_DATATYPE_MAX-1)+1 );

	//同じdatatypeが存在するか
	if( CMDataTypeChk( (u8)ans ) == 1 ) return;

	//datatypeを代入する
    Fld.tv_cm[tv_akino].datatype = (u8)(ans);

	//時間カウント初期値を取得
	Fld.tv_cm[tv_akino].time_count	= (CM_TIME_COUNT * TODAY_TIME);

    Fld.tv_cm[tv_akino].watch_flag = TV_WATCH_FLAG_ON;	//見れる状態にする
}


//====================================================================
//						通信時に必要な関数
//						データのコピーなど
//====================================================================

//--------------------------------------------------------------------
//				CMデータの空いている場所をかえす
//
//	戻り値		空きがあった	0～CMDATA_MAXの数字
//				空きがなかった  -1
//--------------------------------------------------------------------
s8 CMDataAkiChk(TV_CM *p)
{
	s8 i;

	for(i=0; i < CMDATA_MAX ;i++)
	{
		if( p[i].datatype == CM_NODATA_TYPE )	
			return i;
	}

	return -1;	//空きがない
}

//--------------------------------------------------------------------
//					   	 CMデータ初期化
//			 ゲーム開始時に呼ばれる(TVDataAllInitから呼ばれる)
//--------------------------------------------------------------------
void CMDataAllInit()
{
	u8 i;

	for(i=0; i < CMDATA_MAX ;i++)
	{
		CMDataClear(i);
	}

	return;
}

//--------------------------------------------------------------------
//			   	 指定した場所のCMデータを削除
//--------------------------------------------------------------------
void CMDataClear(u8 no)
{
	Fld.tv_cm[no].datatype=CM_NODATA_TYPE;			// データなし
	Fld.tv_cm[no].watch_flag=TV_WATCH_FLAG_OFF;		//見れない状態にする
	Fld.tv_cm[no].time_count=0;
}

//--------------------------------------------------------------------
//				空きがあればCMデータを前につめる(ソート)
//--------------------------------------------------------------------
void CMDataSort()
{
	u8 i,j;

	for(i=0; i < CMDATA_MAX-1 ;i++)
	{
		if( Fld.tv_cm[i].datatype == CM_NODATA_TYPE )	
		{
			for(j=i+1; j < CMDATA_MAX ;j++)
			{
				if( Fld.tv_cm[j].datatype != CM_NODATA_TYPE )	
				{
					Fld.tv_cm[i]=Fld.tv_cm[j];
					CMDataClear(j);
					break;
				}
			}
		}
	}

	return;
}

//--------------------------------------------------------------------
//							CMデータ
//
//				time_count <= CM_BROADCAST_TIME があるかチェック
//
//	戻り値		0があった		0～CMDATA_MAXの値
//				0がなかった     TV_NOTHING
//--------------------------------------------------------------------
u8 CMTimeCountChk()
{
	u8 i;
	
	for(i=0; i < CMDATA_MAX ;i++)
	{
		if( Fld.tv_cm[i].datatype != CM_NODATA_TYPE )
		{
			//見れる状態で
			if( Fld.tv_cm[i].watch_flag == TV_WATCH_FLAG_ON )
			{
				//放送開始日数より少ないか
				if( Fld.tv_cm[i].time_count <= CM_BROADCAST_TIME )
					return i;	
			}
		}
	}

	return TV_NOTHING;			
}

//--------------------------------------------------------------------
//							ＣＭ放送
//
//	AnswerWorkに放送したかを代入している		0 = 放送しなかった
//												1 = 放送した
//--------------------------------------------------------------------
void CMBroadCastSet()
{
	u8 ans;
	u16 ret;

	ans = CMTimeCountChk();
	if( ans == TV_NOTHING )
	{
		AnswerWork = 0;
		return;
	}

	//当日だったら
	if( Fld.tv_cm[ans].time_count < TODAY_TIME )
	{
		Fld.tv_cm[ans].watch_flag=TV_WATCH_FLAG_HOLDING;	//開催当日

		//表示するメッセージをdatatypeによって分けるようにする
		if( GameTime.hour < CM_BROADCAST_CHANGE_TIME )	
			FieldMsgSet(cm_morning_msg_buf[Fld.tv_cm[ans].datatype]);	//朝
		else							
			FieldMsgSet(cm_night_msg_buf[Fld.tv_cm[ans].datatype]);		//夜

	}else
	{
		//あと何日
		ret = Fld.tv_cm[ans].time_count / TODAY_TIME;
		PM_NumMsgSet( StrTempBuffer0, (int)ret, NUM_MODE_LEFT, 1);

		//見れない状態にする(一日一回だけ)
		Fld.tv_cm[ans].watch_flag = TV_WATCH_FLAG_OFF;

		//表示するメッセージをdatatypeによって分けるようにする
		FieldMsgSet(cm_msg_buf[Fld.tv_cm[ans].datatype]);
	};

	AnswerWork = 1;					//放送した
}

//--------------------------------------------------------------------
//					イベント開催しているか
//
//	戻り値	1 = 開催中
//			0 = まだ
//--------------------------------------------------------------------
u8 CMEventStartChk(u8 type)
{
	u8 i;

	if( CM_NODATA_TYPE == type )
	{
		return 0;
	}

	//datatypeを渡すようにする
	for( i=0; i < CMDATA_MAX ;i++ )
	{
		if( Fld.tv_cm[i].datatype == type )
		{
			//開催当日だったら
			if( Fld.tv_cm[i].watch_flag == TV_WATCH_FLAG_HOLDING )
			{
				if( CMDataHoldingTypeChk(type) ) return 1;
				else	return 0;
			}else
			{
				return 0;			//まだ
			}
		}
	}

	return 0;
}

u8 CMDataHoldingTypeChk(u8 type)
{
	switch( type )
	{
		case CM_BARGAIN_TYPE:
			//カイナでがんばり屋のOBJに話し掛けているか
			if( Fld.MapID.div_id == FIELD && Fld.MapID.map_id == FIELD_C102 &&
					TargetObjID == GANBARIYA_02_FIELD_C102 ) 
			{
				return TRUE;
			}else
			{
				return FALSE;
			}

			break;
		case CM_FIND_ITEM_TYPE:
			//デパートの屋上か
			if( Fld.MapID.div_id == C106 && Fld.MapID.map_id == C106_R1106 ) 
			{
				return TRUE;
			}else
			{
				return FALSE;
			}

			break;
	}

	//それ以外のタイプの時は開催している
	return TRUE;
}


//--------------------------------------------------------------------
//				同じdatatypeが存在するか(ＣＭ)
//
//	戻り値		0=存在しない
//				1=存在する
//--------------------------------------------------------------------
static u8 CMDataTypeChk(u8 type)
{
	u8 i;

	if( type == CM_NODATA_TYPE )	return 1;

	for(i=0; i < CMDATA_MAX ;i++)
	{
		if( Fld.tv_cm[i].datatype == type )
				return 1;	//存在する
	}

	return 0;	//存在しない
}

//--------------------------------------------------------------------
//				ＣＭデータの時間カウントを進める
//
//  引数 days   何日分すすめるか？
//--------------------------------------------------------------------
void CMData_Update(u16 days)
{
	u8 i;

	for(i=0; i < CMDATA_MAX ;i++)
	{
		if( Fld.tv_cm[i].datatype != CM_NODATA_TYPE )
		{
			if( Fld.tv_cm[i].time_count < days )
			{
				CMDataClear(i);
			}else
			{
				//見れない状態だったら、見れる状態にする
				if( Fld.tv_cm[i].watch_flag == TV_WATCH_FLAG_OFF && 
						EventFlagCheck( SYS_GAME_CLEAR ) == TRUE )
					Fld.tv_cm[i].watch_flag = TV_WATCH_FLAG_ON;

				Fld.tv_cm[i].time_count-=days;
			}
		}
	}

	CMDataSort();
	return;
}


