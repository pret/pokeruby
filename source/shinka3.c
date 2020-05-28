
//======================================================
//    shinka3.c                                           
//                                                      
//    Copyright (C) 2002 GAME FREAK inc.
//======================================================

#include "common.h"
#include "intr.h"		//add
#include "madefine.h"	//add
#include "decord.h"
#include "bss.h"
#include "server.h"
#include "client.h"
#include "actanm.h"
#include "actanm.def"
#include "print.h"		//add
#include "palanm.h"		//add
#include "task.h"		//add
#include "laster.h"		//add

#include "objdata.h"		//add
#include "multisio.h"		//add
#include "pokesio.h"
#include "cable.h"

#include "poketool.h"
#include "calctool.h"
#include "field.h"
#include "ev_fight.h"
#include "waza_tbl.h"
#include "fld_main.h"
#include "gauge.h"
#include "fight.h"		//add
#include "client_t.h"		//add
#include "cli_def.h"		//add
#include "a_enemy.h"		//add
#include "mus_tool.h"
#include "shinka.h"
#include "pm_str.h"
#include "fightmsg.h"
#include "zukan.h"
#include "fight_ef.h"

void	InitShinka3(PokemonParam *,u16,u8);
void	MainShinka3(void);
void	ShinkaSequence3(u8);

void	shinka3_h_blank_intr(void);
void	shinka3_v_blank_intr(void);

extern	actHeader MineHeader; 
extern	actHeader PokeFTbl[];
extern	actHeader PokeBTbl[];

#define	SHINKA_X	0x78
#define	SHINKA_Y	0x40

enum{
		MSG_END=0,
		MSG_START,
		MSG_WRITE,
		MSG_WAIT,
		MSG_KEYWAIT,
		MSG_CR,
};

//===============================================================================
//
//		InitShinka		ポケモン進化デモ
//
//	in	:	PP			ポケモンの構造体ポインタ
//			aftermons	進化後ポケモンナンバー
//			flag		進化キャンセルフラグ（0:キャンセル可能1:キャンセル不可）
//			
//===============================================================================

void	InitShinka3(PokemonParam *PP,u16 aftermons,u8 flag)
{
	u16	beforemons;
	
	SetHBlankFunc(NULL);
	SetVBlankFunc(NULL);

	DmaClear(3,0,VRAM,(VRAM_END-VRAM),32);
	*(vu16*)REG_MOSAIC = 0;
	*(vu16*)REG_WIN0H = 0;
	*(vu16*)REG_WIN0V = 0;
	*(vu16*)REG_WIN1H = 0;
	*(vu16*)REG_WIN1V = 0;
	*(vu16*)REG_WININ = 0;
	*(vu16*)REG_WINOUT = 0;

	PrintScreenInit(FIGHT_TYPE);
	PaletteAnimeInit();

	ScrX0=0;
	ScrY0=0;
	ScrX1=0;
	ScrY1=0;
	ScrX2=0;
	ScrY2=0;
	ScrX3=0x100;
	ScrY3=0;

	GroundNo=GROUND_ALL;
	FightREGSet();
	FightBGSetAll();

	InitActor();
	InitTask();
	ObjPalManInit();
	ObjPalManStart=4;	// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬNo開始 ここに移動 by matsuda 2001.09.26(水)

	PokeParaGet(PP,ID_nickname,StrTempBuffer0);
	PM_strcpy(StrTempBuffer1,PokeNameData[aftermons]);

	beforemons=PokeParaGet(PP,ID_monsno);

	MsgControlInit(&FightMsg,FIGHT_TYPE);	//change 2001.07.12(木) by matsuda

	DecordPokeCellMake(&PM2FObjDataCell[beforemons], pm2fpara[beforemons].size,
				pm2fpara[beforemons].patcnt, (void*)0x2000000,(void*)DecordAdrs[1],beforemons);
	DecordPaletteWork((void*)PM2NObjDataPal[beforemons].pal_data,
		PA_OBJ0 + 0x10 * 1, 0x20);

//MonsOBJ2BG2(posx,posy,chr,patno,palno,chradrs,scrbase,chrabase)

	MonsOBJ2BG2(8,8,1,0,0,0x4000,28,1);

	DecordPokeCellMake(&PM2FObjDataCell[aftermons], pm2fpara[aftermons].size,
				pm2fpara[aftermons].patcnt, (void*)0x2000000,(void*)DecordAdrs[3],aftermons);
	DecordPaletteWork((void*)PM2NObjDataPal[aftermons].pal_data,
		PA_OBJ0 + 0x10 * 2, 0x20);

	MonsOBJ2BG2(24,24,3,0,1,0x0000,30,0);

	AddTask(ShinkaSequence3,0);

	*(vu16 *)REG_DISPCNT=
		DISP_MODE_0|DISP_BG0_ON|DISP_BG1_ON|DISP_BG2_ON|DISP_BG3_ON|DISP_OBJ_ON|DISP_OBJ_CHAR_1D_MAP;
	SetHBlankFunc(shinka3_h_blank_intr);
	SetVBlankFunc(shinka3_v_blank_intr);
	m4aMPlayAllStop();

	MainProcChange(MainShinka3);
}

void	MainShinka3(void)
{
	JumpActor();
	SetActor();
	BattleTalkMsgPut(&FightMsg);
	PaletteAnime();
	MainTask();
}

//const u32 DecordAdrs[]={0x2008000,0x200c000,0x2010000,0x2014000};

void	ShinkaSequence3(u8 no)
{
}

//==============================================================
//                    割り込みルーチン
//==============================================================

//--------------------------------------------------------------
//                    Ｈブランク関数
//--------------------------------------------------------------

void	shinka3_h_blank_intr(void)
{
}

//--------------------------------------------------------------
//                    Ｖブランク関数
//--------------------------------------------------------------

void shinka3_v_blank_intr(void)
{
		*(vu16 *)REG_BG0HOFS = ScrX0;
		*(vu16 *)REG_BG0VOFS = ScrY0;
		*(vu16 *)REG_BG1HOFS = ScrX1;
		*(vu16 *)REG_BG1VOFS = ScrY1;
		*(vu16 *)REG_BG2HOFS = ScrX2;
		*(vu16 *)REG_BG2VOFS = ScrY2;
		*(vu16 *)REG_BG3HOFS = ScrX3;
		*(vu16 *)REG_BG3VOFS = ScrY3;

		actOAMtrans();
		actDMAtrans();
		PaletteFadeTrans();
		LasterVblank();
}

