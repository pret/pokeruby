/**********************************************************************/
/*  パソコンボックス統合版  -メニュー-                                */
/**********************************************************************/
#include "common.h"
#include "intr.h"
#include "decord.h"
#include "actanm.h"
#include "actor.h"
#include "palanm.h"
#include "mus_tool.h"

#include "message.h"
#include "box2.h"


/*==============================================
==	初期化
==============================================*/
void BoxMenuInit(void)
{
	Work->menu_cnt = 0;
	Work->menu_maxlen = 0;
}
/*==============================================
==	追加
==	menu_type  追加メニューコード
==============================================*/
void BoxMenuAdd(u8 menu_type)
{
#ifdef PM_DEBUG
	static const u8 menustr_pokeset[] = { SE_, TTU_, TO_, su_, ru_, EOM_, };
#endif


	static const u8 * const menu_msg[] = {
		BoxMenuMsg_yameru,
		BoxMenuMsg_azukeru,
		BoxMenuMsg_tureteiku,
		BoxMenuMsg_tukamu,
		BoxMenuMsg_irekaeru,
		BoxMenuMsg_oku,
		BoxMenuMsg_yousu,
		BoxMenuMsg_nigasu,
		BoxMenuMsg_marking,
		BoxMenuMsg_kirikaeru,
		BoxMenuMsg_kabegami,
		BoxMenuMsg_namae,
		BoxMenuMsg_wptheme0,
		BoxMenuMsg_wptheme1,
		BoxMenuMsg_wptheme2,
		BoxMenuMsg_wptheme3,
		BoxMenuMsg_wptype00,
		BoxMenuMsg_wptype01,
		BoxMenuMsg_wptype02,
		BoxMenuMsg_wptype03,
		BoxMenuMsg_wptype10,
		BoxMenuMsg_wptype11,
		BoxMenuMsg_wptype12,
		BoxMenuMsg_wptype13,
		BoxMenuMsg_wptype20,
		BoxMenuMsg_wptype21,
		BoxMenuMsg_wptype22,
		BoxMenuMsg_wptype23,
		BoxMenuMsg_wptype30,
		BoxMenuMsg_wptype31,
		BoxMenuMsg_wptype32,
		BoxMenuMsg_wptype33,

#ifdef PM_DEBUG
		menustr_pokeset, // デバッグ用
#endif
	};

	if(Work->menu_cnt < BOX_MENU_MAX){
		MENU_ITEM *menu = &Work->menu[Work->menu_cnt];
		u8 len;

		menu->msg = menu_msg[menu_type];
		(int)(menu->ptr) = menu_type;

		len = PM_strlen(menu->msg);
		if(len > Work->menu_maxlen){
			Work->menu_maxlen = len;
		}
		Work->menu_cnt++;
	}
}
/*==============================================
==	メニュー状態を調べる
==	pos  何番目のメニューを調べるか
==	return:  メニューコード（無効な位置を調べたら -1）
==============================================*/
s8 BoxMenuCheck(u8 pos)
{
	if(pos >= Work->menu_cnt)
	{
		return -1;
	}

	return (s8)((s32)(Work->menu[pos].ptr));
}
/*==============================================
==	表示
==============================================*/
#define  MENU_X1      (20)   // ウィンドウ作製時の x1 値
#define  MENU_WIDTH   (6)    // メニューの最大文字数
#define  MENU_X2      (29) // ウィンドウ作製時の x2 値
#define  MENU_Y2      (15)   // メニューウィンドウ作製時の y2 値
#define  MENU_Y1_MIN  (MENU_Y2-(BOX_MENU_MAX*2+1))
void BoxMenuDisp(void)
{
	Work->menu_y1 = MENU_Y2 - ((Work->menu_cnt * 2) + 1);
	Work->menu_x1 = MENU_X2 - (Work->menu_maxlen + 3);

	NMenuWinBoxWrite(Work->menu_x1, Work->menu_y1, MENU_X2, MENU_Y2);
	NMenuFixListWrite(Work->menu_x1+2, Work->menu_y1+1, Work->menu_cnt, Work->menu);
	NMenuVCursorInit(Work->menu_x1+1, Work->menu_y1+1, Work->menu_cnt, 0 );
}
/*==============================================
==	操作
==	return:  選択された時  メニューＩＤ（０～）
==	         未選択        CURSOR_DEFAULT_VALUE = -2,
==	         キャンセル    CURSOR_CANCEL_VALUE  = -1,
==============================================*/
s16 BoxMenuSelect(void)
{
	int ret;

	do {
		ret = CURSOR_DEFAULT_VALUE;

		if( sys.Trg & A_BUTTON ){
			ret = NMenuVCursorPosGet();
			break;
		}
		if( sys.Trg & B_BUTTON ){
			SePlay(SE_SELECT);
			ret = CURSOR_CANCEL_VALUE;
		}
		if( sys.Trg & U_KEY ){
			SePlay(SE_SELECT);
			NMenuVCursorSet(-1);
			break;
		}
		if( sys.Trg & D_KEY ){
			SePlay(SE_SELECT);
			NMenuVCursorSet(1);
			break;
		}

	}while(0);

	if(ret != CURSOR_DEFAULT_VALUE){
		NMenuBoxClear(Work->menu_x1, Work->menu_y1, MENU_X2, MENU_Y2);
	}

	if(ret >= 0){
		ret = (int)(Work->menu[ret].ptr);
	}

	return ret;
}
