#include "menu.h"
#include "mapbg.h"
#include "window.h"
#include "field.h"
#include "script.h"
#include "mus_tool.h"
#include "fld_talk.h"



//==================================================================================
//
//==================================================================================
//-------------
//メニュー終了
//-------------
void MenuEnd(void)
{
	SePlay(SE_SELECT);
	NMenuScreenClear();
	TalkEnd();
	ResetForceEvent();
}

//----------------------
//		リスト追加
//----------------------
void MenuComSet( u8 *list, u8 *max, u8 no )
{
	list[ *max ] = no;
	*max+=1;
}

