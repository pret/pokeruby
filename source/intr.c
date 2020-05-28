//******************************************************************
//
//			intr.c
//
//			割込み関連プログラム
//			Copyright (C) 2001 GAME FREAK inc.
//******************************************************************

#include "common.h"
#include "multisio.h"
#include "intr.h"
#include "../library/AgbFlash1M.h"
#include "calctool.h"
#include "../library/AgbRtc.h"
#include "laster.h"

#include "db_watch.h"				// DEBUG_WATCH関連


extern void intr_main();

extern void MultiSioVsyncFunc( void );
extern	SoundArea m4a_sound;

//-------------------- 変数  ----------------------------
u32	IntrMainBuf[0x200];         // 割り込みメインルーチン用バッファ
IntrFuncp IntrTable[14];		// 割り込みテーブル用バッファ
s8	DmaCount;					// サウンド用(波形のバッファアドレス取得用）
u8  SioStopFlag;				// 通信ストップ用フラグ

//-------------------- サブルーチン ----------------------------
//void InterruptInit(void);
//void SetVBlankFunc(pFunc);
//void SetHBlankFunc(pFunc);
//void V_Wait(void);

//-------------------- サブルーチン(ローカル) ----------------------------
static void VBlankIntr(void);
static void HBlankIntr(void);
static void IntrDummy(void);

static void VCountIntr(void);
#ifdef GCDOWNLOAD
static void SioIntr(void);
#endif GCDOWNLOAD

//------------------------------------------------------------------
//                      割り込みテーブル                            
//------------------------------------------------------------------

const IntrFuncp IntrTable_0[14] = {
#ifndef GCDOWNLOAD
	Multi_SioIntr,      // 通信割り込み
#else	GCDOWNLOAD
	SioIntr,
#endif	GCDOWNLOAD
	Multi_SioTimerIntr, //タイマー３割り込み
	HBlankIntr,         // Ｈブランク割り込み
	VBlankIntr,         // Ｖブランク割り込み
	VCountIntr,         // Ｖカウンタ一致割り込み
	IntrDummy,          // タイマー０割り込み
	IntrDummy,          // タイマー１割り込み
	IntrDummy,          // タイマー２割り込み
	IntrDummy,          // ＤＭＡ０割り込み
	IntrDummy,          // ＤＭＡ１割り込み
	IntrDummy,          // ＤＭＡ２割り込み
	IntrDummy,          // ＤＭＡ３割り込み
	IntrDummy,          // キー割り込み
	IntrDummy,          // カセット割り込み
};

// フラッシュアクセスに使用するタイマ割り込みベクタのアドレス
const void * FlashTimerIntrAdrs = &(IntrTable[6]);

//==================================================================
//                      割り込み設定ルーチン                            
//==================================================================
//------------------------------------------------------------------
//		割込みテーブル初期化
//------------------------------------------------------------------
void InterruptInit(void)
{
	int i;
	for(i=0;i<14;i++)IntrTable[i]=IntrTable_0[i];
	DmaCopy(3, intr_main, IntrMainBuf, sizeof(IntrMainBuf), 32);// 割り込みメインルーチン セット
	IntrAddrSet(IntrMainBuf);				// *(vu32 *)INTR_VECTOR_BUF = (vu32 )IntrMainBuf;

	SetVBlankFunc(NULL);
	SetHBlankFunc(NULL);
#ifdef GCDOWNLOAD
	SetSioFunc(NULL);
#endif GCDOWNLOAD

	*(vu16 *)REG_IME = 1;
	*(vu16 *)REG_IE = V_BLANK_INTR_FLAG;// | H_BLANK_INTR_FLAG;
	*(vu16 *)REG_STAT = STAT_V_BLANK_IF_ENABLE; //|STAT_H_BLANK_IF_ENABLE;
	//*(vu16 *)REG_IE = V_BLANK_INTR_FLAG | H_BLANK_INTR_FLAG;
	//*(vu16 *)REG_STAT = STAT_V_BLANK_IF_ENABLE|STAT_H_BLANK_IF_ENABLE;
    *(vu16 *)REG_IE |= V_BLANK_INTR_FLAG;
};


//------------------------------------------------------------------
//		VBlank割込みセット
//------------------------------------------------------------------
//void SetVBlankFunc(void (*func)(void) )

void SetVBlankFunc(pFunc func)
{
	sys.pVBlank = func;
};

//------------------------------------------------------------------
//		HBlank割込みセット
//------------------------------------------------------------------
//void SetHBlankFunc(void (*func)(void) )

void SetHBlankFunc(pFunc func)
{
	sys.pHBlank = func;
};

//------------------------------------------------------------------
//		VCount割込みセット
//------------------------------------------------------------------
//void SetVCountFunc(void (*func)(void) )

void SetVCountFunc(pFunc func)
{
	sys.pVCount = func;
};

#ifdef GCDOWNLOAD
//------------------------------------------------------------------
//			   Sio割込みセット
//------------------------------------------------------------------
//void SetSioFunc(void (*func)(void) )

void SetSioFunc(pFunc func)
{
	sys.pSio = func;
};
#endif GCDOWNLOAD

//==================================================================
//                      割り込みルーチン
//==================================================================
//------------------------------------------------------------------
//                      Ｖブランク処理 
//------------------------------------------------------------------
#ifdef DEBUG_WATCH
unsigned short LYstart;
unsigned short LYend;
unsigned short LYVstart;
unsigned short LYVend;
void MActorSet(void);
#endif

static void VBlankIntr(void)
{
	u16 ImeBak;
	
#ifdef DEBUG_WATCH
    LYVstart= (*(vu16 *)REG_VCOUNT)&0x00ff;
#endif
//	MultiSioVsyncFunc();

	if(!SioStopFlag)									//ストップフラグが立ってなければ
		MltSioVblkIntr();								//通信を親が開始する

	ImeBak = *(vu16 *)REG_IME;							//IMEの退避
	*(vu16 *)REG_IME = 0;								// IME リセット
	m4aSoundVSync();
	*(vu16 *)REG_IME = ImeBak;							//IMEの退避

	sys.main_timer ++ ;

	if(sys.pVBlank!=NULL)(sys.pVBlank)();
	sys.vsync_counter++;

	DmaCount = m4a_sound.DmaCount;


	m4aSoundMain();


	TuushinRecvSet();			//insert by soga 2002.03.04

	pp_rand();		//毎sync乱数生成をよびだすことで
					//なるべく値をばらばらにする

#ifdef DEBUG_WATCH
    LYVend  = (*(vu16 *)REG_VCOUNT)&0x00ff;
    MActorSet();
#endif

	*(u16 *)INTR_CHECK_BUF |= V_BLANK_INTR_FLAG;     // Vブランク割込チェックのセット
	sys.IntrCheck |= V_BLANK_INTR_FLAG;
};

//------------------------------------------------------------------
//------------------------------------------------------------------

void FlashIntrInit(void)
{
//	SetFlashTimerIntr(2,&(IntrTable[6]));	// TIMER3
	SetFlashTimerIntr( 2, (void(**)())FlashTimerIntrAdrs );
}

//------------------------------------------------------------------
//                      Ｈブランク処理 
//------------------------------------------------------------------
static void HBlankIntr(void)
{
	if(sys.pHBlank!=NULL)(sys.pHBlank)();
	*(u16 *)INTR_CHECK_BUF |= H_BLANK_INTR_FLAG;     // Vブランク割込チェックのセット
	sys.IntrCheck |= H_BLANK_INTR_FLAG;
};

//------------------------------------------------------------------
//                      Ｖカウント処理 
//------------------------------------------------------------------
static void VCountIntr(void)
{
	if(sys.pVCount!=NULL)(sys.pVCount)();
	*(u16 *)INTR_CHECK_BUF |= V_COUNT_INTR_FLAG;     // Vブランク割込チェックのセット
	sys.IntrCheck |= V_COUNT_INTR_FLAG;
};

#ifdef GCDOWNLOAD
//------------------------------------------------------------------
//			 シリアル割り込み処理
//------------------------------------------------------------------
static void SioIntr(void)
{
  if(sys.pSio != NULL)	(sys.pSio)();
  *(u16 *)INTR_CHECK_BUF |= SIO_INTR_FLAG;     // シリアル割込チェックのセット
  sys.IntrCheck |= SIO_INTR_FLAG;
}
#endif GCDOWNLOAD

//------------------------------------------------------------------
//                      割り込み ダミールーチン
//------------------------------------------------------------------

static void IntrDummy(void)
{
};



void V_Wait(void)
{
#if 0
	sys.IntrCheck &= V_BLANK_INTR_FLAG ^ 0xffff;
	while(1) {
		if( (sys.IntrCheck & V_BLANK_INTR_FLAG) !=0){
			break;
		}
	}
#else
	sys.IntrCheck &= V_BLANK_INTR_FLAG ^ 0xffff;
	VBlankIntrWait();
#endif
}

#ifdef DEBUG_WATCH
/*==================================================================*/
/*                      ﾃﾞﾊﾞｯｸﾞ関連      　                         */
/*==================================================================*/
/*------------------------------------------------------------------*/
/*------------------------------------------------------------------*/
static const u8 mactor_Character[64] = {
0x00,0x20,0x00,0x00,0x00,0x22,0x00,0x00,
0x20,0x22,0x00,0x00,0x22,0x22,0x22,0x22,
0x00,0x00,0x00,0x00,0x00,0x00,0x20,0x20,
0x00,0x00,0x20,0x20,0x00,0x00,0x00,0x02,
0x00,0x40,0x00,0x00,0x00,0x44,0x00,0x00,
0x40,0x44,0x00,0x00,0x44,0x44,0x44,0x44,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
};

const u16 sys_obj_Palette[16] = {
0x0000,0x0000,0x001F,0x03E0,0x7C00,0x7FFF,0x7FFF,0x7FFF,
0x7FFF,0x7FFF,0x7FFF,0x7FFF,0x7FFF,0x7FFF,0x7FFF,0x7FFF,
};

static const OamData MOamData ={
0,0,0,0,0,0,4,0,0,0,0,5,0,15,0,
};

void MActorSet(void)
{
    u16 posy,posyv;

    CpuArrayCopy(mactor_Character,OBJ_MODE0_VRAM+0x7fc0,16);//OBJ CHR転送
    CpuArrayCopy(sys_obj_Palette,OBJ_PLTT+0x1e0,16);	       //OBJ COL転送

    if(LYend<LYstart) posy=(LYend+228)-LYstart;
    else              posy=LYend-LYstart;
    if(LYVend<LYVstart) posyv=(LYVend+228)-LYVstart;
    else              posyv=LYVend-LYVstart;

    sys.OAMbuf[127] = *(SysOamData *)&MOamData;
    sys.OAMbuf[127].VPos = posy-3;
    sys.OAMbuf[127].CharNo = 0x3ff;
    sys.OAMbuf[126] = *(SysOamData *)&MOamData;
    sys.OAMbuf[126].VPos = posyv-3;
    sys.OAMbuf[126].CharNo = 0x3fe;

    CpuCopy(&(sys.OAMbuf[126]),OAM+(sizeof(OamData))*126,(sizeof(OamData))*2,16);
}

#endif


//==================================================================
//
//		ソフトリセット
//
//		※リセット時のDMA暴走防止処理をここに追加する予定
//
//==================================================================

void PM_SoftReset( void )
{
	*(vu16 *)REG_IME = 0;			//割り込みを禁止する
	m4aSoundVSyncOff();				//サウンドDMAの起動をとめる
	LasterInit();					//ラスター機能を止める(DMA0とめている)
	DmaStop(1);						//DMA1をとめる
	DmaStop(2);						//DMA2をとめる
	DmaStop(3);						//DMA3をとめる

	RtcIoDisable();					//RTCレジスタを使用不可能にする

	SoftReset( RESET_ALL_FLAG );
}

//==================================================================
//
//		鳴き声展開ワーク（？）クリア
//
//		※鳴き声終了時の暴走回避
//
extern	u8	ImmSng[104];
//==================================================================
void	ImmSngClear(void)
{
	CpuClear(0,ImmSng,104,16);
}






















