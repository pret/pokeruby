//=========================================================================
//
//			タスク
//											01/05/09 by matsuda
//=========================================================================

#include "common.h"
#include "task.h"

#include "print.h"
#include "intr.h"

#include "d_matsu.h"

extern	TALK_WIN	FightMsg;

//----------------------------------------------------------
//	グローバル変数
//----------------------------------------------------------
TASK_TABLE	TaskTable[TASK_MAX];

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
#define DEFAULT_PRI		0xff;	//初期化時のﾌﾟﾗｲｵﾘﾃｨ

//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
void DummyTaskSeq(u8 taskno);
static u8 GetFastTask(void);
static void pri_insertion(u8 taskno);

//----------------------------------------------------------
//	タスクがｵｰﾊﾞｰした時のエラーメッセージ
//----------------------------------------------------------
static const u8 task_over_msg[] = {T__,A__,S__,K__,spc_,O__,V__,E__,R__,CR_,
	TA_,SU_,KU_,ga_,O_,bou_,BA_,bou_,si_,ma_,si_,ta_,EOM_};



//=========================================================================
//	
//=========================================================================

//----------------------------------------------------------
//	タスクテーブル全初期化
//----------------------------------------------------------
void InitTask(void)
{
	u8 i;
	
	for(i = 0; i < TASK_MAX;i++)
	{
		TaskTable[i].occ = 0;
		TaskTable[i].TaskAdrs = DummyTaskSeq;
		TaskTable[i].prev = i;
		TaskTable[i].next = i+1;
		TaskTable[i].pri = DEFAULT_PRI;
		memset(TaskTable[i].work, 0, TASKWORK_MAX_SIZEOF);
	}
	TaskTable[0].prev = FAST_TASK;
	TaskTable[TASK_MAX-1].next = END_TASK;
}

//----------------------------------------------------------
//	タスク関数登録
// 引数:TaskAdrs=登録する関数のﾎﾟｲﾝﾀ   pri=関数実行の優先順位(0(高) ～ 0xff(低))
// 戻り値:登録されたTaskTableの配列番号
//----------------------------------------------------------
u8 AddTask(pTaskFunc TaskAdrs, u8 pri)
{
	u8 i;
	
	for(i = 0; i < TASK_MAX; i++)
	{
		if(TaskTable[i].occ == 0)
		{
			TaskTable[i].TaskAdrs = TaskAdrs;
			TaskTable[i].pri = pri;
			pri_insertion(i);
			memset(TaskTable[i].work, 0, TASKWORK_MAX_SIZEOF);
			TaskTable[i].occ = 1;	//これは最後に
			return i;
		}
	}
	
#ifdef PM_DEBUG
	//exit();	//error
	ErrorMsgPut(task_over_msg);	//error
#endif
	return 0;	//0xff;	errorだけど一応進めるように0を返す
}

//----------------------------------------------------------
//	ﾌﾟﾗｲｵﾘﾃｨにしたがってprev,nextを適切な位置に挿入
//----------------------------------------------------------
static void pri_insertion(u8 taskno)
{
	u8 i;
	
	i = GetFastTask();
	if(i == TASK_MAX)	//ﾀｽｸが1つも登録されていなかったとき
	{
		TaskTable[taskno].prev = FAST_TASK;
		TaskTable[taskno].next = END_TASK;
		return;
	}
	
	while(1)
	{
		if(TaskTable[taskno].pri < TaskTable[i].pri)
		{
			TaskTable[taskno].prev = TaskTable[i].prev;
			TaskTable[taskno].next = i;
			if(TaskTable[i].prev != FAST_TASK)	//←↓2行Add 2001.07.16(月)
				TaskTable[TaskTable[i].prev].next = taskno;
			TaskTable[i].prev = taskno;
			break;
		}
		else
		{
			if(TaskTable[i].next == END_TASK)
			{
				TaskTable[taskno].prev = i;
				TaskTable[taskno].next = TaskTable[i].next;
				TaskTable[i].next = taskno;
				break;
			}
			else
				i = TaskTable[i].next;
		}
	}
}

//----------------------------------------------------------
//	登録関数削除
//----------------------------------------------------------
void DelTask(u8 taskno)
{
	if(TaskTable[taskno].occ == 0)
		return;
	
	TaskTable[taskno].occ = 0;
	if(TaskTable[taskno].prev == FAST_TASK)
	{
		if(TaskTable[taskno].next == END_TASK)
			return;
		else
			TaskTable[TaskTable[taskno].next].prev = FAST_TASK;
	}
	else if(TaskTable[taskno].next == END_TASK)
	{	//prevがFASTなら上で引っかかるのでprevのﾁｪｯｸはここではいらない
		TaskTable[TaskTable[taskno].prev].next = END_TASK;
	}
	else
	{
		TaskTable[TaskTable[taskno].prev].next = TaskTable[taskno].next;
		TaskTable[TaskTable[taskno].next].prev = TaskTable[taskno].prev;
	}
}

//----------------------------------------------------------
//	メイン
//----------------------------------------------------------
void MainTask(void)
{
	u8 taskno;
	
	taskno = GetFastTask();
	if(taskno == TASK_MAX)	//ﾀｽｸが全て非稼動の場合
		return;
	
	do
	{
		TaskTable[taskno].TaskAdrs(taskno);
		taskno = TaskTable[taskno].next;
	}while(taskno != END_TASK);
}

//----------------------------------------------------------
//	
//----------------------------------------------------------
static u8 GetFastTask(void)
{
	u8 taskno;

	for(taskno = 0; taskno < TASK_MAX; taskno++)
	{
		if(TaskTable[taskno].occ == 1 && TaskTable[taskno].prev == FAST_TASK)
			break;
	}
	return taskno;
}

//----------------------------------------------------------
//	Dummy関数
//----------------------------------------------------------
void DummyTaskSeq(u8 taskno)
{
	;
}














//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================

//=========================================================================
//	ツール類
//=========================================================================

//----------------------------------------------------------
//	ﾀｽｸのTaskAdrsを変更して、戻り先のｱﾄﾞﾚｽを最後尾のwork2つにｾｯﾄする
// NextAdrs = TaskAdrsにｾｯﾄする関数のｱﾄﾞﾚｽ
// ReturnAdrs = workの最後尾にｾｯﾄするｱﾄﾞﾚｽ
//----------------------------------------------------------
void ChangeTask(u8 taskno, pTaskFunc NextAdrs, pTaskFunc ReturnAdrs)
{
	u8 workno = TASK_WORK_MAX - 2;
	
	TaskTable[taskno].work[workno] = (s16)((u32)ReturnAdrs);
	TaskTable[taskno].work[workno+1] = (s16)((u32)ReturnAdrs >> 16);
	TaskTable[taskno].TaskAdrs = NextAdrs;
}

//----------------------------------------------------------
//	ChangeTaskを使用してﾜｰｸにｾｯﾄしておいたｱﾄﾞﾚｽを取り出して、TaskAdrsにｾｯﾄする
//----------------------------------------------------------
void ChangeBackTask(u8 taskno)
{
	u8 workno = TASK_WORK_MAX - 2;
	
	TaskTable[taskno].TaskAdrs = 
		(pTaskFunc)((0xffff & TaskTable[taskno].work[workno])
		 | (TaskTable[taskno].work[workno+1] << 16));
}

//-------------------------------------------------------------------------
//	登録済みのタスクかどうかのチェック
//
// TRUE		登録されている
// FALSE	登録されていない
//-------------------------------------------------------------------------
u8 CheckTask(pTaskFunc func)
{
		u8 i;
		for( i=0;i<TASK_MAX;i++)
		{
				if(TaskTable[i].occ == 1 && TaskTable[i].TaskAdrs == func)return TRUE;
		};
		return FALSE;
};

//-------------------------------------------------------------------------
//	タスクプログラムアドレスからタスクナンバーを返す
//
// NOT_EXIST_TASK_ID	登録されていない
// それ以外				登録されている
//-------------------------------------------------------------------------
u8 CheckTaskNo( pTaskFunc func )
{
	int i;
	for( i=0 ; i<TASK_MAX ; i++ )
	{
		if( TaskTable[i].occ == 1 && TaskTable[i].TaskAdrs == func )return i;
	};
	return NOT_EXIST_TASK_ID;
};

//----------------------------------------------------------
//	今いくつのﾀｽｸが使用中か調べる　ﾃﾞﾊﾞｯｸ用かな？
// 戻り値: 使用中のﾀｽｸの数
//----------------------------------------------------------
u8 CheckMoveTask(void)
{
	u8 i;
	u8 count = 0;
	
	for(i = 0; i < TASK_MAX; i++)
	{
		if(TaskTable[i].occ == 1)
			count++;
	}
	return count;
}

