
//======================================================
//    shinka2.c                                           
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
#include "shinka2.h"

void	InitShinka2(PokemonParam *,u16);
void	MainShinka2(void);
void	ShinkaSequence2(u8);
void	MorphigDataCalc2(u8 *Badrs,u8 *Aadrs);
u8		MorphingAct2(void);

void	DotSet2(int,u8);
u8		DotReset2(int,u8);
//u8		DotMoveCheck2(int,u8);
u8		DotMoveCheck2(int,int);

u16		VectorCalc(u8,u8);

void	shinka2_h_blank_intr(void);
void	shinka2_v_blank_intr(void);

extern	actHeader MineHeader; 
extern	actHeader PokeFTbl[];
extern	actHeader PokeBTbl[];

extern	void	VoicePlay(u16,s8);
extern	u8		VoicePlayWait(void);

#define	SHINKA_X	0x78
#define	SHINKA_Y	0x40

enum{
	SS_SEQNO=0,
	SS_WORK0,
	SS_WORK1,
	SS_MONS1,
	SS_MONS2,
};

//モーフィングメインアクトシーケンスナンバー
enum{
	SEQ_DOTMOVESTOP=0,
	SEQ_DOTMOVELEFT_PSET,
	SEQ_DOTMOVELEFT_PRESET,
	SEQ_DOTMOVERIGHT_PSET,
	SEQ_DOTMOVERIGHT_PRESET,
	SEQ_DOTWAITLEFT_PSET,
	SEQ_DOTWAITLEFT_PRESET,
	SEQ_DOTWAITRIGHT_PSET,
	SEQ_DOTWAITRIGHT_PRESET,
	SEQ_DOTGOLEFT_PSET,
	SEQ_DOTGOLEFT_PRESET,
	SEQ_DOTGORIGHT_PSET,
	SEQ_DOTGORIGHT_PRESET,
};

//==============================================================
//                    進化用拡縮テーブル
//==============================================================

static const actAffAnm ShinkaAffanm[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x100, 0x100, 0, ACT_AFSET },	// 0
	{ -0x04, -0x04, 0, 0x100/0x04-1},	// 0
	{ACT_AFEND,0,0,0},				// 終了
};

static const	actAffAnm * const ShinkaAfftbl[] = {
	ShinkaAffanm,
};


//===============================================================
//
//		InitShinka2		ポケモン進化デモ
//
//	in	:	PP			ポケモンの構造体ポインタ
//			aftermons	進化後ポケモンナンバー
//			
//===============================================================

void	InitShinka2(PokemonParam *PP,u16 aftermons)
{
	u8	no;
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
	ScrX3=0x38;
	ScrY3=0xfff0;

	GroundNo=GROUND_ALL;
	FightREGSet();
	FightBGSetAll();

	InitActor();
	InitTask();
	ObjPalManInit();
	ObjPalManStart=4;	// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬNo開始 ここに移動 by matsuda 2001.09.26(水)

	beforemons=PokeParaGet(PP,ID_monsno);

	MsgControlInit(&FightMsg,FIGHT_TYPE);	//change 2001.07.12(木) by matsuda

	DecordPokeCellMake(&PM2FObjDataCell[beforemons], pm2fpara[beforemons].size,
				pm2fpara[beforemons].patcnt, (void*)0x2000000,(void*)DecordAdrs[1],beforemons);
	DecordPaletteWork((void*)PM2NObjDataPal[beforemons].pal_data,
		PA_OBJ0 + 0x10 * 1, 0x20);
	PokeActHeaderMake(beforemons,1);
	PokeActHeader.affData_p = ShinkaAfftbl;
	ServerWork[0]=no=AddActor(&PokeActHeader,SHINKA_X,SHINKA_Y,C_POKE1PRI+1);
	ActWork[no].move=SeqEnemyPokeWaitMain;
	ActWork[no].oamData.Pltt=1;
	ActWork[no].aff_pause=1;

	DecordPokeCellMake(&PM2FObjDataCell[aftermons], pm2fpara[aftermons].size,
				pm2fpara[aftermons].patcnt, (void*)0x2000000,(void*)DecordAdrs[3],aftermons);
	DecordPaletteWork((void*)PM2NObjDataPal[aftermons].pal_data,
		PA_OBJ0 + 0x10 * 2, 0x20);
	PokeActHeaderMake(aftermons,3);
	ServerWork[1]=no=AddActor(&PokeActHeader,SHINKA_X,SHINKA_Y,C_POKE1PRI);
	ActWork[no].move=SeqEnemyPokeWaitMain;
	ActWork[no].oamData.Pltt=2;

	ServerWork[2]=no=AddTask(ShinkaSequence2,0);
	TaskTable[no].work[SS_SEQNO]=0;
	TaskTable[no].work[SS_MONS1]=beforemons;
	TaskTable[no].work[SS_MONS2]=aftermons;

	memcpy((void *)0x2008000,(void*)0x2014000,0x800);
	MorphigDataCalc2((u8 *)DecordAdrs[1],(u8 *)DecordAdrs[3]);

	*(vu16 *)REG_DISPCNT=
		DISP_MODE_0|DISP_BG0_ON|DISP_BG1_ON|DISP_BG2_ON|DISP_BG3_ON|DISP_OBJ_ON|DISP_OBJ_CHAR_1D_MAP;
	SetHBlankFunc(shinka2_h_blank_intr);
	SetVBlankFunc(shinka2_v_blank_intr);
	m4aMPlayAllStop();

	MainProcChange(MainShinka2);
}

void	MainShinka2(void)
{
	JumpActor();
	SetActor();
	BattleTalkMsgPut(&FightMsg);
	PaletteAnime();
	MainTask();
}

enum{
	SEQ_NAKIGOE=0,
	SEQ_BGM,
	SEQ_FADE_WAIT,
	SEQ_MORPHING_INIT,
	SEQ_MORPHING,
	SEQ_FADE_WAIT2,
	SEQ_MORPHING_END,
	SEQ_JOB_END,
};

//const u32 DecordAdrs[]={0x2008000,0x200c000,0x2010000,0x2014000};

void	ShinkaSequence2(u8 no)
{
	switch(TaskTable[no].work[SS_SEQNO]){
		case SEQ_NAKIGOE:
			VoicePlay(TaskTable[no].work[SS_MONS1],0);
			TaskTable[no].work[SS_SEQNO]++;
			break;
		case SEQ_BGM:
			if(VoicePlayWait()){
				MusicPlay(MUS_ASHROAD);
				TaskTable[no].work[SS_SEQNO]++;
				PaletteFadeReq(0x00060000,4,0,16,0);
			}
			break;
		case SEQ_FADE_WAIT:
			if(FadeData.fade_sw == 0)
				TaskTable[no].work[SS_SEQNO]++;
			break;
		case SEQ_MORPHING_INIT:
			TaskTable[no].work[SS_SEQNO]++;
			ActWork[ServerWork[0]].aff_pause=0;
			MD2->Wait=1;
			break;
		case SEQ_MORPHING:
			if(--MD2->Wait==0){
				MD2->Wait=1;
				ActWork[ServerWork[0]].anm_no=0;
				ActWork[ServerWork[0]].anm_sw=1;
				ActWork[ServerWork[0]].anmend_sw=0;
				ActWork[ServerWork[1]].anm_no=0;
				ActWork[ServerWork[1]].anm_sw=1;
				ActWork[ServerWork[1]].anmend_sw=0;
				if(MorphingAct2()){
					memcpy((void *)0x2014000,(void*)0x2008000,0x800);
					TaskTable[no].work[SS_SEQNO]++;
					PaletteFadeReq(0x00060000,4,16,0,0);
					SePlay(SE_EXP);
				}
			}
			break;
		case SEQ_FADE_WAIT2:
			if(FadeData.fade_sw == 0){
				m4aMPlayAllStop();
				VoicePlay(TaskTable[no].work[SS_MONS2],0);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ_MORPHING_END:
			if(VoicePlayWait()){
				MusicPlay(MUS_FANFA5);
				TaskTable[no].work[SS_SEQNO]++;
			}
			break;
		case SEQ_JOB_END:
			break;
	}
}

void	MorphigDataCalc2(u8 *Badrs,u8 *Aadrs)
{
	int	x,y,seq,ofs;
	u8	*pos;
	int	length;

	for(y=0;y<64;y++){
//		MD2->LineCntB[y]=0;
		MD2->LineCntA[y]=0;
		for(x=0;x<32;x++){
//			MD2->SeqNoLeftB[y][x]=0;
//			MD2->SeqNoRightB[y][x]=0;
//			MD2->NowLeftPosB[y][x]=0;
//			MD2->NowRightPosB[y][x]=0;
			MD2->SeqNoLeftA[y][x]=0;
			MD2->SeqNoRightA[y][x]=0;
			MD2->NowLeftPosA[y][x]=0;
			MD2->NowRightPosA[y][x]=0;
			MD2->EndLeftPosA[y][x]=0;
			MD2->EndRightPosA[y][x]=0;
		}
	}

#if 0
	ofs=0;
	for(y=0;y<64;y++){
		seq=0;
		pos=Badrs+ofs;
		for(x=0;x<64;x++){
			MD2->MorphAdrs[y][(x>>1)]=(u32)pos;
			switch(seq){
				case 0:			//ドットがあるか判断
					switch(x&1){
						case 0:
							if(*pos&0x0f){
								MD2->NowLeftPosB[y][MD2->LineCntB[y]]=x;
								seq=1;
							}
							break;
						case 1:
							if(*pos&0xf0){
								MD2->NowLeftPosB[y][MD2->LineCntB[y]]=x;
								seq=1;
							}
							break;
					}
					break;
				case 1:			//ドットがないか判断
					switch(x&1){
						case 0:
							if((*pos&0x0f)==0){
								MD2->NowRightPosB[y][MD2->LineCntB[y]]=x-1;
								MD2->LineCntB[y]++;
								seq=0;
							}
							break;
						case 1:
							if((*pos&0xf0)==0){
								MD2->NowRightPosB[y][MD2->LineCntB[y]]=x-1;
								MD2->LineCntB[y]++;
								seq=0;
							}
							break;
					}
					break;
			}
			if(((x+1)&0x07)==0)
				pos+=0x1d;
			else if(x&1)
				pos++;
		}
		if(seq){
			MD2->NowRightPosB[y][MD2->LineCntB[y]]=x;
			MD2->LineCntB[y]++;
		}
		if(((y+1)&0x07)==0)
			ofs+=0xe4;
		else
			ofs+=4;
	}
#endif
	ofs=0;
	for(y=0;y<64;y++){
		seq=0;
		pos=Aadrs+ofs;
		for(x=0;x<64;x++){
			MD2->MorphAdrs[y][(x>>1)]=(u32)pos;
			switch(seq){
				case 0:			//ドットがあるか判断
					switch(x&1){
						case 0:
							if(*pos&0x0f){
								MD2->EndLeftPosA[y][MD2->LineCntA[y]]=x;
								seq=1;
							}
							*pos&=0xf0;
							break;
						case 1:
							if(*pos&0xf0){
								MD2->EndLeftPosA[y][MD2->LineCntA[y]]=x;
								seq=1;
							}
							*pos&=0x0f;
							break;
					}
					break;
				case 1:			//ドットがないか判断
					switch(x&1){
						case 0:
							if((*pos&0x0f)==0){
								MD2->EndRightPosA[y][MD2->LineCntA[y]]=x-1;
								MD2->LineCntA[y]++;
								seq=0;
							}
							else
								*pos&=0xf0;
							break;
						case 1:
							if((*pos&0xf0)==0){
								MD2->EndRightPosA[y][MD2->LineCntA[y]]=x-1;
								MD2->LineCntA[y]++;
								seq=0;
							}
							else
								*pos&=0x0f;
							break;
					}
					break;
			}
			if(((x+1)&0x07)==0)
				pos+=0x1d;
			else if(x&1)
				pos++;
		}
		if(seq){
			MD2->EndRightPosA[y][MD2->LineCntA[y]]=x-1;
			MD2->LineCntA[y]++;
		}
		if(((y+1)&0x07)==0)
			ofs+=0xe4;
		else
			ofs+=4;
	}
#if 0
	for(y=0;y<64;y++){
		for(x=0;x<MD2->LineCntB[y];x++){
			MD2->SeqNoLeftB[y][x]=SEQ_DOTMOVERIGHT_PRESET;
			MD2->SeqNoRightB[y][x]=SEQ_DOTMOVELEFT_PRESET;
		}
	}
#endif
	for(y=0;y<64;y++){
		for(x=0;x<MD2->LineCntA[y];x++){
			MD2->SeqNoLeftA[y][x]=SEQ_DOTWAITLEFT_PSET;
			MD2->SeqNoRightA[y][x]=SEQ_DOTWAITRIGHT_PSET;
			length=(MD2->EndRightPosA[y][x]-MD2->EndLeftPosA[y][x])/2;
			MD2->NowLeftPosA[y][x]=MD2->NowRightPosA[y][x]=MD2->EndLeftPosA[y][x]+length;
		}
	}

	length=0;
	for(ofs=0;ofs<MD2->LineCntA[32];ofs++){
		if(length<(MD2->EndRightPosA[32][ofs]-MD2->EndLeftPosA[32][ofs])){
			x=ofs;
			length=MD2->EndRightPosA[32][ofs]-MD2->EndLeftPosA[32][ofs];
		}
	}
	MD2->SeqNoLeftA[32][x]=SEQ_DOTMOVELEFT_PSET;
	MD2->SeqNoRightA[32][x]=SEQ_DOTMOVERIGHT_PSET;
	MD2->LeftMoveVTmp[32][x]=VectorCalc(MD2->NowLeftPosA[32][x],MD2->EndLeftPosA[32][x]);
	MD2->RightMoveVTmp[32][x]=VectorCalc(MD2->NowRightPosA[32][x],MD2->EndRightPosA[32][x]);
}

//==============================================================
//		モーフィングメインルーチン
//==============================================================

u8	MorphingAct2(void)
{
	int	x,y;
	u8	ret=1;
	int	i,time;

	for(y=0;y<64;y++){
#if 0
		for(x=0;x<MD2->LineCntB[y];x++){
			switch(MD2->SeqNoLeftB[y][x]){
				default:
				case SEQ_DOTMOVESTOP:
					break;
				case SEQ_DOTMOVERIGHT_PRESET:
					ret=0;
					if(DotReset2(y,MD2->NowLeftPosB[y][x]))
						MD2->SeqNoLeftB[y][x]=SEQ_DOTMOVESTOP;
					else
						MD2->NowLeftPosB[y][x]++;
					break;
			}
			switch(MD2->SeqNoRightB[y][x]){
				default:
				case SEQ_DOTMOVESTOP:
					break;
				case SEQ_DOTMOVELEFT_PRESET:
					ret=0;
					if(DotReset2(y,MD2->NowRightPosB[y][x]))
						MD2->SeqNoRightB[y][x]=SEQ_DOTMOVESTOP;
					else
						MD2->NowRightPosB[y][x]--;
					break;
			}
		}
#endif
		for(x=0;x<MD2->LineCntA[y];x++){
			switch(MD2->SeqNoLeftA[y][x]){
				default:
				case SEQ_DOTMOVESTOP:
					break;
				case SEQ_DOTMOVELEFT_PSET:
					ret=0;
					MD2->LeftMoveV[y][x]+=MD2->LeftMoveVTmp[y][x];
					time=(MD2->LeftMoveV[y][x]&0xff00)>>8;
					MD2->LeftMoveV[y][x]&=0xff;
					for(i=0;i<time;i++){
						DotSet2(y,MD2->NowLeftPosA[y][x]);
						if(MD2->EndLeftPosA[y][x]==MD2->NowLeftPosA[y][x]){
							MD2->SeqNoLeftA[y][x]=SEQ_DOTMOVESTOP;
							break;
						}
						else
							MD2->NowLeftPosA[y][x]--;
					}
					break;
				case SEQ_DOTWAITLEFT_PSET:
					ret=0;
//					if(DotMoveCheck2(y,MD2->NowLeftPosA[y][x]))
					if(DotMoveCheck2(y,x)){
						MD2->LeftMoveVTmp[y][x]=VectorCalc(MD2->NowLeftPosA[y][x],MD2->EndLeftPosA[y][x]);
						MD2->RightMoveVTmp[y][x]=VectorCalc(MD2->NowRightPosA[y][x],MD2->EndRightPosA[y][x]);
						MD2->SeqNoLeftA[y][x]=SEQ_DOTMOVELEFT_PSET;
					}
					break;
			}
			switch(MD2->SeqNoRightA[y][x]){
				default:
				case SEQ_DOTMOVESTOP:
					break;
				case SEQ_DOTMOVERIGHT_PSET:
					ret=0;
					MD2->RightMoveV[y][x]+=MD2->RightMoveVTmp[y][x];
					time=(MD2->RightMoveV[y][x]&0xff00)>>8;
					MD2->RightMoveV[y][x]&=0xff;
					for(i=0;i<time;i++){
						DotSet2(y,MD2->NowRightPosA[y][x]);
						if(MD2->EndRightPosA[y][x]==MD2->NowRightPosA[y][x]){
							MD2->SeqNoRightA[y][x]=SEQ_DOTMOVESTOP;
							break;
						}
						else
							MD2->NowRightPosA[y][x]++;
					}
					break;
				case SEQ_DOTWAITRIGHT_PSET:
					ret=0;
//					if(DotMoveCheck2(y,MD2->NowRightPosA[y][x]))
					if(DotMoveCheck2(y,x)){
						MD2->LeftMoveVTmp[y][x]=VectorCalc(MD2->NowLeftPosA[y][x],MD2->EndLeftPosA[y][x]);
						MD2->RightMoveVTmp[y][x]=VectorCalc(MD2->NowRightPosA[y][x],MD2->EndRightPosA[y][x]);
						MD2->SeqNoRightA[y][x]=SEQ_DOTMOVERIGHT_PSET;
					}
					break;
			}
		}
	}
	return ret;
}

void	DotSet2(int y,u8 x)
{
	u8	*adrs;

//	adrs=(u8 *)MD2->MorphAdrs[y][x>>1]+0x8000;
	adrs=(u8 *)MD2->MorphAdrs[y][x>>1];

	if(x&1)
		adrs[0]|=0xf0;
	else
		adrs[0]|=0x0f;
}

u8	DotReset2(int y,u8 x)
{
	u8	*adrs;

	adrs=(u8 *)MD2->MorphAdrs[y][x>>1];

	if(x&1){
		if(adrs[0]&0xf0){
			adrs[0]&=0x0f;
			return 0;
		}
		else
			return 1;
	}
	else{
		if(adrs[0]&0x0f){
			adrs[0]&=0xf0;
			return 0;
		}
		else
			return 1;
	}
}

#if 1
u8	DotMoveCheck2(int y,int x)
{
	int	i,x1,x2;
	u8	*adrs;

#if 0
	x1=MD2->EndLeftPosA[y][x];
	x2=MD2->EndRightPosA[y][x];
	if(y!=0){
		while(x1<=x2){
//			adrs=(u8 *)MD2->MorphAdrs[y-1][x1>>1]+0x8000;
			adrs=(u8 *)MD2->MorphAdrs[y-1][x1>>1];
			if(x1&1){
				if(adrs[0]&0xf0){
					MD2->NowLeftPosA[y][x]=MD2->NowRightPosA[y][x]=x1;
					return 1;
				}
			}
			else{
				if(adrs[0]&0x0f){
					MD2->NowLeftPosA[y][x]=MD2->NowRightPosA[y][x]=x1;
					return 1;
				}
			}
			x1++;
		}
	}
	x1=MD2->EndLeftPosA[y][x];
	x2=MD2->EndRightPosA[y][x];
	if(y!=63){
		while(x1<=x2){
//			adrs=(u8 *)MD2->MorphAdrs[y+1][x1>>1]+0x8000;
			adrs=(u8 *)MD2->MorphAdrs[y+1][x1>>1];
			if(x1&1){
				if(adrs[0]&0xf0){
					MD2->NowLeftPosA[y][x]=MD2->NowRightPosA[y][x]=x1;
					return 1;
				}
			}
			else{
				if(adrs[0]&0x0f){
					MD2->NowLeftPosA[y][x]=MD2->NowRightPosA[y][x]=x1;
					return 1;
				}
			}
			x1++;
		}
	}
#endif

	x1=MD2->NowLeftPosA[y][x]-8;
	if(x1<0)
		x1=0;

	x2=MD2->NowLeftPosA[y][x]+8;
	if(x2>63)
		x2=63;

	for(i=x1;i<x2;i++){
		if(y==0) break;
//		adrs=(u8 *)MD2->MorphAdrs[y-1][i>>1]+0x8000;
		adrs=(u8 *)MD2->MorphAdrs[y-1][i>>1];
		if(i&1){
			if(adrs[0]&0xf0)
				return 1;
		}
		else{
			if(adrs[0]&0x0f)
				return 1;
		}
	}
	for(i=x1;i<x2;i++){
		if(y==63) break;
//		adrs=(u8 *)MD2->MorphAdrs[y+1][i>>1]+0x8000;
		adrs=(u8 *)MD2->MorphAdrs[y+1][i>>1];
		if(i&1){
			if(adrs[0]&0xf0)
				return 1;
		}
		else{
			if(adrs[0]&0x0f)
				return 1;
		}
	}
	return 0;
}
#else
u8	DotMoveCheck2(int y,u8 x)
{
	int	i;
	s8	x1,x2;
	u8	*adrs;

	x1=x-2;
	if(x1<0)
		x1=0;

	x2=x+2;
	if(x2>63)
		x2=63;

	for(i=x1;i<x2;i++){
		if(y==0) break;
		adrs=(u8 *)MD2->MorphAdrs[y-1][i>>1]+0x8000;
		if(i&1){
			if(adrs[0]&0xf0)
				return 1;
		}
		else{
			if(adrs[0]&0x0f)
				return 1;
		}
	}
	for(i=x1;i<x2;i++){
		if(y==63) break;
		adrs=(u8 *)MD2->MorphAdrs[y+1][i>>1]+0x8000;
		if(i&1){
			if(adrs[0]&0xf0)
				return 1;
		}
		else{
			if(adrs[0]&0x0f)
				return 1;
		}
	}
	return 0;
}
#endif

u16	VectorCalc(u8 x1,u8 x2)
{
	u16	length;

	if(x1>x2)
		length=x1-x2;
	else
		length=x2-x1;

	if(length)
		length=length*24;
	else
		length=0x100;

	return(length);
}

//==============================================================
//                    割り込みルーチン
//==============================================================

//--------------------------------------------------------------
//                    Ｈブランク関数
//--------------------------------------------------------------

void	shinka2_h_blank_intr(void)
{
	u16	vpos;

	vpos=*(vu16 *)REG_VCOUNT&0xff;

	if(vpos == ((160-1)-8*6))
		*(vu16 *)REG_BG0CNT = BG_SCREEN_SIZE_2 | BG_PRIORITY_0
		| 24 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 | BG_MOS_OFF;
}

//--------------------------------------------------------------
//                    Ｖブランク関数
//--------------------------------------------------------------

void shinka2_v_blank_intr(void)
{
		*(vu16 *)REG_BG0CNT = BG_SCREEN_SIZE_2 | BG_PRIORITY_3
		| 24 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
		| BG_COLOR_16 | BG_MOS_OFF;

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

