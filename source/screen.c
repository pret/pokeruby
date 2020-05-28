//=========================================================================
//	
//	画面関連変数など
//
//=========================================================================

#include "common.h"

#define	SCREEN_H_GLOBAL
#include "screen.h"

//=========================================================================
//
//	BG制御レジスタアドレスの配列定数
//
//=========================================================================

//	ＢＧコントロールレジスタ
vu16 * const RegBGctrl[] = {
		(vu16 *)REG_BG0CNT,
		(vu16 *)REG_BG1CNT,
		(vu16 *)REG_BG2CNT,
		(vu16 *)REG_BG3CNT,
};

//	Ｘ方向ＢＧ表示開始位置指定レジスタ
vu16 * const RegBGHofs[] =
{
		(vu16 *)REG_BG0HOFS,
		(vu16 *)REG_BG1HOFS,
		(vu16 *)REG_BG2HOFS,
		(vu16 *)REG_BG3HOFS,
};

//	Ｙ方向ＢＧ表示開始位置指定レジスタ
vu16 * const RegBGVofs[] =
{
		(vu16 *)REG_BG0VOFS,
		(vu16 *)REG_BG1VOFS,
		(vu16 *)REG_BG2VOFS,
		(vu16 *)REG_BG3VOFS,
};

//	表示コントロール（DISPCNT）書き込み用定数
const u16 BGvisibleSwitch[] =
{
		DISP_BG0_ON,
		DISP_BG1_ON,
		DISP_BG2_ON,
		DISP_BG3_ON,
};

//	ブレンドレジスタ（BLDCNT）用定数（第二対象面）
const u16 BGblend2ndValue[] =
{
		BLD_BG0_2ND,
		BLD_BG1_2ND,
		BLD_BG2_2ND,
		BLD_BG3_2ND,
};

//	ブレンドレジスタ（BLDCNT）用定数（第一対象面）
const u16 BGblend1stValue[] =
{
		BLD_BG0_1ST,
		BLD_BG1_1ST,
		BLD_BG2_1ST,
		BLD_BG3_1ST,
};

//=========================================================================
//
//=========================================================================

//	画面転送用ダミーＢＧ領域
u16 dmy_BG[4][ TEXT_BG_SIZE ] ={};

