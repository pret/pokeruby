#ifndef	MENU_H
#define	MENU_H

#include "common.h"
#include "print.h"

#include "menutool.h"

typedef struct{
	u8	com[13];
	u8	(*func)();
}MENUCOM;


//----------------------
//		メニュー終了
//----------------------
extern void MenuEnd(void);

//----------------------
//		リスト追加
//----------------------
extern void MenuComSet( u8 *list, u8 *max, u8 no );

#endif	/* MENU_H */
