#ifndef __INTR_H__
#define __INTR_H__

//******************************************************************
//
//			intr.h
//
//			割込み関連プログラム
//			Copyright (C) 2001 GAME FREAK inc.
//******************************************************************

#include "common.h"


typedef void (*IntrFuncp)(void);	//割込み関数ポインタ型

extern IntrFuncp IntrTable[14];		//割込みテーブル格納用配列
extern const void * FlashTimerIntrAdrs;

extern void InterruptInit(void);		//割込み初期化
extern void SetVBlankFunc(pFunc);		//Vsync割込みルーチンセット
extern void SetHBlankFunc(pFunc);		//Hsync割込みルーチンセット
extern void SetVCountFunc(pFunc);		//Vcount割込みルーチンセット
extern void V_Wait(void);				//Vsync割込み待ち
extern void FlashIntrInit(void);

extern void PM_SoftReset( void );		//ゲーム中のソフトリセット

#ifdef GCDOWNLOAD
extern void SetSioFunc(pFunc);			//Sio割り込みルーチンセット
#endif GCDOWNLOAD

//=========================================================================
//	IEレジスタ操作マクロ
//=========================================================================
//	IEレジスタに指定したフラグをセット
#define	REG_IE_SET( v )							\
	{											\
	u16 Reg_IME_Backup;							\
	Reg_IME_Backup = *(vu16 *)REG_IME;			\
	*(vu16 *)REG_IME = 0;						\
	*(vu16 *)REG_IE |= (v);						\
	*(vu16 *)REG_IME = Reg_IME_Backup;			\
	}

//	IEレジスタに指定したフラグをリセット
#define	REG_IE_RESET( v )						\
	{											\
	u16 Reg_IME_Backup;							\
	Reg_IME_Backup = *(vu16 *)REG_IME;			\
	*(vu16 *)REG_IME = 0;						\
	*(vu16 *)REG_IE &= ~(v);					\
	*(vu16 *)REG_IME = Reg_IME_Backup;			\
	}

//	IEレジスタに指定したフラグをセット＆リセット
#define REG_IE_CHG(set,reset)					\
	{											\
	u16 Reg_IME_Backup;							\
	Reg_IME_Backup = *(vu16 *)REG_IME;			\
	*(vu16 *)REG_IME = 0;						\
	*(vu16 *)REG_IE &= ~(reset);				\
	*(vu16 *)REG_IE |= (set);					\
	*(vu16 *)REG_IME = Reg_IME_Backup;			\
	}

#endif __INTR_H__

