/***********************************************************************
**	マップ切り替え時の地名表示
**	Masao Taya
***********************************************************************/
#include "common.h"
#include "fntequ.h"
#include "print.h"
#include "fieldmap.h"
#include "fld_main.h"
#include "fld_task.h"
#include "menu.h"
#include "menutool.h"
#include "task.h"
#include "mapname.h"
#include "ev_flag.h"
#include "sysflag.h"
#include "mappos.h"

/*==============================================
==	定数
==============================================*/
#define  MAPNAME_WIN_X  (11)       // 地名ウィンドウ横キャラ数
#define  MAPNAME_WIN_Y  (3)        // 地名ウィンドウ縦キャラ数
#define  MAPNAME_VOFS_BEGIN  ((MAPNAME_WIN_Y+1) * 8)  // V OffSet 初期値
#define  MAPNAME_VOFS_END    (0)   // V OffSet 終了値
#define  MAPNAME_DISP_WAIT   (120) // 地名表示ウェイト
#define  MAPNAME_SPEED   (2)       // 地名表示ウィンドウ移動速度
#define  MAPNAME_MAX     (18)      // 地名文字列の最大長
#define  MAPNAME_WIDTH   (10)      // 地名文字列の表示幅（キャラ数）

// タスクワークの用途
enum MAPNAME_TASK_WORK {
	MNWK_STATE,    // 状態
	MNWK_CNT,      // 呼び出し回数カウンタ
	MNWK_VOFS,     // BG0 の V OffSet
	MNWK_REQ,      // 再出現リクエスト
};

// 状態（MNWK_STATEの値）
enum MAPNAME_TASK_STATE {
	MNSTATE_MOVEDOWN,  // 下移動中
	MNSTATE_STOP,      // 停止中
	MNSTATE_MOVEUP,    // 上移動中
	MNSTATE_ERASE,     // マップ名消去
	MNSTATE_QUIT,      // ﾀｽｸ終了処理
};
/*==============================================
==	グローバル変数
==============================================*/
static u8 task_no = 0;

/*==============================================
==	関数プロトタイプ
==============================================*/
static void MapNameTask(u8 task_no);
static void update_mapname(void);
extern u8* CopyMapName(u8 *buf, u16 div, u16 size);

/***********************************************************************
**	デバッグメニューからの呼び出し
***********************************************************************/
u8 DebugMapNameTest(void)
{
	MenuEnd();
	DispMapName();
	return 1;
}
/***********************************************************************
**	タスク初期化
***********************************************************************/
void DispMapName(void)
{
	if(EventFlagCheck(CTRL_MAPNAME_HIDE) == TRUE)return;

	if(CheckTask(MapNameTask) == FALSE){
		task_no = AddTask(MapNameTask, 90);
		*(vu16 *)REG_BG0VOFS = MAPNAME_VOFS_BEGIN;

//		NMenuScreenClear();
		update_mapname();

		TaskTable[task_no].work[MNWK_STATE] = MNSTATE_MOVEDOWN;
		TaskTable[task_no].work[MNWK_VOFS] = MAPNAME_VOFS_BEGIN;

	}else{
		if(TaskTable[task_no].work[MNWK_STATE] != MNSTATE_MOVEUP){
			TaskTable[task_no].work[MNWK_STATE] = MNSTATE_MOVEUP;
		}
		TaskTable[task_no].work[MNWK_REQ] = 1;
	}
}
/***********************************************************************
**	タスク関数
***********************************************************************/
static void MapNameTask(u8 n)
{
	TASK_TABLE *task = &TaskTable[n];

	switch(task->work[MNWK_STATE]){
	case MNSTATE_MOVEDOWN:
		task->work[MNWK_VOFS] -= MAPNAME_SPEED;
		if(task->work[MNWK_VOFS] <= MAPNAME_VOFS_END){
			task->work[MNWK_STATE] = MNSTATE_STOP;
			TaskTable[task_no].work[MNWK_CNT] = 0;
		}
		break;

	case MNSTATE_STOP:
		if(++(task->work[MNWK_CNT]) > MAPNAME_DISP_WAIT){
			task->work[MNWK_CNT] = 0;
			task->work[MNWK_STATE] = MNSTATE_MOVEUP;
		}
		break;

	case MNSTATE_MOVEUP:
		task->work[MNWK_VOFS] += MAPNAME_SPEED;
		if(task->work[MNWK_VOFS] >= MAPNAME_VOFS_BEGIN){
			if(task->work[MNWK_REQ]){
				update_mapname();
				task->work[MNWK_STATE] = MNSTATE_MOVEDOWN;
				task->work[MNWK_REQ] = 0;
			}else{
				task->work[MNWK_STATE] = MNSTATE_QUIT;
				return;
			}
		}
		break;

	case MNSTATE_QUIT:
//		*(vu16 *)REG_BG0VOFS = 0;
//		DelTask(task_no);
		EraseMapName();
		return;

	}

	*(vu16*)REG_BG0VOFS = task->work[MNWK_VOFS];
}
/***********************************************************************
**	タスク強制終了
***********************************************************************/
void EraseMapName(void)
{
	if(CheckTask(MapNameTask)){
		NMenuWindowReset();
		NMenuBoxClear(0, 0, MAPNAME_WIN_X, MAPNAME_WIN_Y);
		*(vu16 *)REG_BG0VOFS = 0;
		DelTask(task_no);
	}
}
/***********************************************************************
**	地名ウィンドウの内容を現在の地名に更新
***********************************************************************/
static void update_mapname(void)
{
	u8  buf[MAPNAME_MAX + 1];
	CopyMapName(buf, NowMap.WorldPos, 0);

	NMenuWindowCharSet(0);
	NMenuWinBoxWrite(0, 0, MAPNAME_WIN_X, MAPNAME_WIN_Y);

	if(NowMap.WorldPos != MAPPOS_D_AGITO){
		u16 ofs;
		ofs = (MAPNAME_WIDTH - PM_strlen(buf)) / 2;	
		CopyMapName(buf + ofs, NowMap.WorldPos, MAPNAME_WIDTH - ofs);
		while(ofs){
			buf[--ofs] = spc_;
		}
	}else{
		CopyMapName(buf, NowMap.WorldPos, 0);
	}

	NMenuMsgWrite(buf,1,1);
}

