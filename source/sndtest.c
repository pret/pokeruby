//=========================================================================
//	
//	ｻｳﾝﾄﾞﾁｪｯｸ
//
//=========================================================================
#include "common.h"
#include "intr.h"
#include "actor.h"
#include "actanm.h"
#include "palanm.h"
#include "task.h"
#include "print.h"
#include "task.h"
#include "poketool.h"
#include "decord.h"
#include "objdata.h"
#include "menu.h"
#include "window.h"
#include "z_naki.h"
#include "mus_tool.h"

extern	void	TitleInit(void);
extern	const	u32	DecordAdrs[];

void	SndTestInit(void);
void	SndTestMain(void);

void	SndTestInitTask(u8 id);
void	SndTestScreenTask(u8 id);
void	SndTestMainTask(u8 id);
void	SndTestExitTask(u8 id);

void	SndTestNewDrvCheckInit(u8 id);
void	SndTestNewDrvCheckMain(u8 id);
static void SndTestNewDrvCheckNum( s8 sw );
static void	SndTestNewDrvCheckScreen( void );
static void SndTestNewDrvCheckCursor( u8 oldc, u8 newc );
static void SNumPut2( s32 no, u16 x, u16 y, u8 keta );
void	SndTestWazaInit(u8 id);
void	SndTestWazaMain(u8 id);
static void SndTestWazaScreen( void );

static void SndTestNakigoeInit(u8 id);
static void SndTestNakigoeMain(u8 id);
static void SndTestNakigoeScreen( void );

static	void	SndTestMainCursorSet(u8 mode);
static	void	SNumPut(u16 no,u16 x,u16 y);
static	void	SNamePut(const u8* name,u16 x,u16 y);
static	const	u8*	const BGM_NameTable[];
static	const	u8*	const SE_NameTable[];

#define	MODE	0
#define	BGM_NUM	1
#define	SE_NUM	2
#define	NOW_BGM	3
#define	NOW_SE	4

#define	BGM_NUM_START	349
#define	BGM_NUM_END		(435+31)
#define	SE_NUM_START	0
#define	SE_NUM_END		(205+42)

#define FADETEST (0)
#if FADETEST
u8 fade_test_work;
#endif

//2002.9.13 TETSU
u8 SoundHighSpeed = {0};
//2002.9.13 TETSU
/********************************************************************/
/*                                                                  */
/*				ﾒｲﾝ													*/
/*                                                                  */
/********************************************************************/
void	SndTestMain(void)
{
		MainTask();
		JumpActor();
		SetActor();
		PaletteAnime();
}

/********************************************************************/
/*                                                                  */
/*				割り込み											*/
/*                                                                  */
/********************************************************************/
static void VInterFunc( void )
{
	actOAMtrans();						//ｱｸﾀｰ転送処理1
	actDMAtrans();						//ｱｸﾀｰ転送処理2
	PaletteFadeTrans();

	if(SoundHighSpeed){
		m4aSoundMain();
		m4aSoundMain();
		m4aSoundMain();
	}
}

/********************************************************************/
/*				初期化												*/
/********************************************************************/
void	SndTestInit(void)
{
	u8	taskID;

	SetVBlankFunc(NULL);			//割込み関数設定(VBLANK)

    *(vu16 *)REG_DISPCNT	= 0;
    *(vu16 *)REG_BG2CNT		= 0;
    *(vu16 *)REG_BG1CNT		= 0;
    *(vu16 *)REG_BG0CNT		= 0;

	*(vu16 *)REG_BG2HOFS	= 0;
	*(vu16 *)REG_BG2VOFS	= 0;
    *(vu16 *)REG_BG1HOFS	= 0;
    *(vu16 *)REG_BG1VOFS	= 0; 
    *(vu16 *)REG_BG0HOFS	= 0;
    *(vu16 *)REG_BG0VOFS	= 0; 

    DmaClear(3, 0, VRAM, VRAM_SIZE,           16);	// VRAM   初期化
    DmaClear(3, 0, OAM,  OAM_SIZE,            32);	// OAM    初期化
    DmaClear(3, 0, PLTT, PLTT_SIZE,           16);	// ﾊﾟﾚｯﾄ  初期化

	PaletteAnimeInit();

	InitTask();										// ﾀｽｸ  初期化
	InitActor();									// ｱｸﾀｰ 初期化
	PrintScreenInit(DEFAULT_TYPE);
	NMenuScreenInit(FIELD_MENU_TYPE);

	PaletteFadeReq(0xffffffff,0,16,0,0);

	*(vu16 *)REG_WIN0H	= 0;
	*(vu16 *)REG_WIN0V	= 0;
	*(vu16 *)REG_WIN1H	= 0;
	*(vu16 *)REG_WIN1V	= 0;

	*(vu16 *)REG_WININ	= 0x1111;
 	*(vu16 *)REG_WINOUT	= 0x0031;

   	*(vu16 *)REG_BLDCNT   = 0x00e1;	//半透明設定
   	*(vu16 *)REG_BLDALPHA = 0;
   	*(vu16 *)REG_BLDY	  = 7;

    *(vu16 *)REG_IE    = 1;// IME ｾｯﾄ
    *(vu16 *)REG_IE   |= V_BLANK_INTR_FLAG;// VBLANK割込許可
    *(vu16 *)REG_STAT |= STAT_V_BLANK_IF_ENABLE;

	SetVBlankFunc(VInterFunc);			//割込み関数設定(VBLANK)
//	sys.pMainProc = SndTestMain;
	MainProcChange( SndTestMain );

	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
                          |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						  | DISP_BG0_ON					// BG0有効
						  | DISP_WIN01_ON				// WIN0&1 ON
						  | DISP_OBJ_ON;
	taskID = AddTask(SndTestInitTask, 0);
	TaskTable[taskID].work[MODE] 	= 0;
	TaskTable[taskID].work[BGM_NUM] = 0;
	TaskTable[taskID].work[SE_NUM] 	= 0;
	TaskTable[taskID].work[NOW_BGM] = 0;
	//2002.9.13 TETSU
	SoundHighSpeed = 0;
	TaskTable[taskID].work[NOW_BGM] = 0;
	//2002.9.13 TETSU
	m4aSoundInit();							// サウンドドライバ初期化

#if FADETEST
	fade_test_work = 0;
#endif
}






/********************************************************************/
/*				導入												*/
/********************************************************************/
void	SndTestInitTask(u8 id)
{
	u8	indexstr[] = {SA_,U_,N_,DO_,TI_,EE_,TTU_,KU_,EOM_};
	u8	indexstr1[] = {B__,G__,M__,EOM_};
	u8	indexstr2[] = {S__,E__,spc_,EOM_};
	u8	indexstr3[] = {A__,tenten_,sa_,i_,se_,i_,spc_,B__,tenten_,o_,wa_,ri_,EOM_};
	u8	indexstr4[] = {L__,tenten_,U__,P__,spc_,R__,tenten_,D__,O__,W__,N__,EOM_};
	u8	indexstr5[] = {R__,tenten_,D__,R__,I__,V__,E__,R__,bou_,T__,E__,S__,T__,EOM_};

	if(FadeData.fade_sw == 0){
		NMenuWinBoxWrite( 2, 0,27, 3);
		NMenuWinBoxWrite( 2, 5,27,10);
		NMenuWinBoxWrite( 2,12,27,17);
		NMenuMsgWrite(indexstr,4,1);
		NMenuMsgWrite(indexstr3,14,1);
		NMenuMsgWrite(indexstr1,4,6);
		NMenuMsgWrite(indexstr4,14,6);
		NMenuMsgWrite(indexstr2,4,13);
		NMenuMsgWrite(indexstr4,14,13);
		NMenuMsgWrite(indexstr5,14,18);
		TaskTable[id].TaskAdrs = SndTestScreenTask;
		*(vu16 *)REG_WIN0H	= (17*0x100)+223;
		*(vu16 *)REG_WIN0V	= 1*0x100+31;
	}
}

/********************************************************************/
/*				ｽｸﾘｰﾝ描画											*/
/********************************************************************/
void	SndTestScreenTask(u8 id)
{
	SndTestMainCursorSet(TaskTable[id].work[MODE]);
	SNumPut(TaskTable[id].work[BGM_NUM]+BGM_NUM_START,7,8);
	SNamePut((u8*)BGM_NameTable[(TaskTable[id].work[BGM_NUM])],11,8);

	SNumPut(TaskTable[id].work[SE_NUM]+SE_NUM_START,7,15);
	SNamePut((u8*)SE_NameTable[(TaskTable[id].work[SE_NUM])],11,15);
	
	TaskTable[id].TaskAdrs = SndTestMainTask;
}

/********************************************************************/
/*				ﾒｲﾝ制御												*/
/********************************************************************/
/*				ｷｰﾁｪｯｸ												*/
static u8	SndTestMainKeyCheck(u8 task_id)
{
	/* 音楽フェードインテスト */
#if FADETEST
	if( fade_test_work ){
		switch( fade_test_work ){
			case 1:
				m4aSongNumStart(TaskTable[task_id].work[BGM_NUM]+BGM_NUM_START);
				m4aMPlayImmInit( &m4a_mplay000 );
				m4aMPlayVolumeControl( &m4a_mplay000, 0xffff, 256/256 );
				fade_test_work++;
				break;
			case 2:
				fade_test_work++;
				m4aMPlayFadeOutPause( &m4a_mplay000, 2 );
				break;
			case 3:
				m4aMPlayFadeInContinue( &m4a_mplay000, 4 );
				fade_test_work = 0;
				break;
		}
	}
#endif
	/* */

		//新型ドライバテストモードへ
	if( sys.Trg & R_BUTTON ){
		TaskTable[task_id].TaskAdrs = SndTestNewDrvCheckInit;
		return 0;
	}

		//技効果音テストモードへ
	if( sys.Trg & L_BUTTON ){
		TaskTable[task_id].TaskAdrs = SndTestWazaInit;
		return 0;
	}

		//鳴き声画面のいろいろ実験モードへ
	if( sys.Trg & START_BUTTON ){
		TaskTable[task_id].TaskAdrs = SndTestNakigoeInit;
		return 0;
	}

		//再生
	if(sys.Trg & A_BUTTON){
		if(TaskTable[task_id].work[MODE]){
			if(TaskTable[task_id].work[NOW_SE]){
				if(TaskTable[task_id].work[SE_NUM]){
					m4aSongNumStop(TaskTable[task_id].work[NOW_SE]+SE_NUM_START);
					m4aSongNumStart(TaskTable[task_id].work[SE_NUM]+SE_NUM_START);
					TaskTable[task_id].work[NOW_SE] = TaskTable[task_id].work[SE_NUM];
				}else{
					m4aSongNumStop(TaskTable[task_id].work[NOW_SE]+SE_NUM_START);
					TaskTable[task_id].work[NOW_SE] = 0;
				}
			}else{
				if(TaskTable[task_id].work[SE_NUM]){
					m4aSongNumStart(TaskTable[task_id].work[SE_NUM]+SE_NUM_START);
					TaskTable[task_id].work[NOW_SE] = TaskTable[task_id].work[SE_NUM];
				}
			}
		}else{
			if(TaskTable[task_id].work[NOW_BGM]){
				if(TaskTable[task_id].work[BGM_NUM]){
					m4aSongNumStop(TaskTable[task_id].work[NOW_BGM]+BGM_NUM_START);
#if FADETEST
					fade_test_work = 1;
#else
					m4aSongNumStart( TaskTable[task_id].work[BGM_NUM]+BGM_NUM_START );
/*
					m4aMPlayImmInit( &m4a_mplay000 );
					m4aMPlayVolumeControl( &m4a_mplay000, 0xffff, 0 );
					m4aSongNumStop ( TaskTable[task_id].work[BGM_NUM]+BGM_NUM_START );
					m4aMPlayFadeInContinue( &m4a_mplay000, 4 );
					m4aSongNumStart(TaskTable[task_id].work[BGM_NUM]+BGM_NUM_START);
*/
#endif
					TaskTable[task_id].work[NOW_BGM] = TaskTable[task_id].work[BGM_NUM];
				}else{
					m4aSongNumStop(TaskTable[task_id].work[NOW_BGM]+BGM_NUM_START);
					TaskTable[task_id].work[NOW_BGM] = 0;
				}
			}else{
				if(TaskTable[task_id].work[BGM_NUM]){
#if FADETEST
					fade_test_work = 1;
#else
					m4aSongNumStart( TaskTable[task_id].work[BGM_NUM]+BGM_NUM_START );
/*
					m4aMPlayImmInit( &m4a_mplay000 );
					m4aMPlayVolumeControl( &m4a_mplay000, 0xffff, 0 );
					m4aSongNumStop ( TaskTable[task_id].work[BGM_NUM]+BGM_NUM_START );
					m4aMPlayFadeInContinue( &m4a_mplay000, 4 );
*/
#endif
					TaskTable[task_id].work[NOW_BGM] = TaskTable[task_id].work[BGM_NUM];
				}
			}
		}
		return 0;
	}
		//ﾁｪｯｸ終了
	if(sys.Trg & B_BUTTON){
		m4aSongNumStart(SE_SELECT);
		PaletteFadeReq(0xffffffff,0,0,16,0);
		TaskTable[task_id].TaskAdrs = SndTestExitTask;
		return 0;
	}
		//BGM SE ﾓｰﾄﾞ変更
	if(sys.Repeat & U_KEY){
		TaskTable[task_id].work[MODE]^=1;
		return 1;
	}
	if(sys.Repeat & D_KEY){
		TaskTable[task_id].work[MODE]^=1;
		return 1;
	}
		//BGM SE ﾅﾝﾊﾞｰ変更
	if(sys.Repeat & R_KEY){
		if(TaskTable[task_id].work[MODE]){
			if(TaskTable[task_id].work[SE_NUM]>0){
				TaskTable[task_id].work[SE_NUM]--;
			}else{
				TaskTable[task_id].work[SE_NUM]=(SE_NUM_END-SE_NUM_START);
			}
		}else{
			if(TaskTable[task_id].work[BGM_NUM]>0){
				TaskTable[task_id].work[BGM_NUM]--;
			}else{
				TaskTable[task_id].work[BGM_NUM]=(BGM_NUM_END-BGM_NUM_START);
			}
		}
		return 1;
	}
	if(sys.Repeat & L_KEY){
		if(TaskTable[task_id].work[MODE]){
			if(TaskTable[task_id].work[SE_NUM]<(SE_NUM_END-SE_NUM_START)){
				TaskTable[task_id].work[SE_NUM]++;
			}else{
				TaskTable[task_id].work[SE_NUM]=0;
			}
		}else{
			if(TaskTable[task_id].work[BGM_NUM]<(BGM_NUM_END-BGM_NUM_START)){
				TaskTable[task_id].work[BGM_NUM]++;
			}else{
				TaskTable[task_id].work[BGM_NUM]=0;
			}
		}
		return 1;
	}
//2002.9.13 TETSU
	if(sys.Cont & SELECT_BUTTON){
		SoundHighSpeed = 1;
	}else{
		SoundHighSpeed = 0;
	}
//2002.9.13 TETSU
	return 0;
}

/********************************************************************/
void	SndTestMainTask(u8 id)
{
	if(SndTestMainKeyCheck(id)){
		TaskTable[id].TaskAdrs = SndTestScreenTask;
	}
}

/********************************************************************/
/*				終了												*/
/********************************************************************/
void	SndTestExitTask(u8 id)
{
	if(FadeData.fade_sw == 0){
		DelTask(id);
	//	sys.pMainProc = TitleInit;
		MainProcChange( TitleInit );
	}
}


/********************************************************************/
/*				その他												*/
/********************************************************************/
static	void	SndTestMainCursorSet(u8 mode)
{
	switch(mode){

	default:
	case 0:
		*(vu16 *)REG_WIN1H	= 17*0x100+223;
		*(vu16 *)REG_WIN1V	= 41*0x100+87;
		break;
	case 1:
		*(vu16 *)REG_WIN1H	= 17*0x100+223;
		*(vu16 *)REG_WIN1V	= 97*0x100+143;
		break;
	}
}

static	void	SNumPut(u16 no,u16 x,u16 y)
{
	u8	numstr[5];
	u8	i,numw,f;

	for(i=0;i<3;i++) numstr[i] = spc_;
	numstr[3] = tenten_;
	numstr[4] = EOM_;

	f = 0;

	if((numw = no/100)){
		numstr[0] = n0_+numw; 
		f = 1;
	}
	if((numw = no%100/10)||f)	numstr[1] = n0_+numw; 
	numstr[2] = n0_+(no%100%10); 
	NMenuMsgWrite(numstr,x,y);
}

static	void	SNamePut(const u8* name,u16 x,u16 y)
{
	u8	i,numstr[11];

	for(i=0;i<11;i++) numstr[i] = spc_;
	numstr[10] = EOM_;

	i=0;
	while((name[i]!=EOM_)&&(i<10)){
		numstr[i] = name[i];
		i++;
	}
	NMenuMsgWrite(numstr,x,y);
}

/********************************************************************/
/*				サウンドドライバ機能確認用							*/
/********************************************************************/
#define ST_VOICE_MAX_	(388-1)	//(251-1)	//(127)

#define	ST_MENU_	(9-1)
#define STVoiceNo	0
#define STVolume	1
#define STPanpot	2
#define	STPitch		3
#define	STLength	4
#define	STRelease	5
#define	STProgress	6
#define STChorus	7
#define STPriority	8

	u8	STFlag = 0;
	u8	STFlag_old = 0;
	s8	STCursor = 0;
	s32	STWork[ ST_MENU_ + 1 ] = {};
	u8	STRev = 0;
	u8	STstereo = 0;
	MusicPlayerArea* STreturn;

extern	ToneData	voicegroup200[];
extern	ToneData	voicegroup201[];
extern	ToneData	voicegroup202[];
extern	ToneData	voicegroup203[];
extern	ToneData	voicegroup204[];
extern	ToneData	voicegroup205[];
extern	ToneData	voicegroup206[];
extern	ToneData	voicegroup207[];

	//カーソルのポジション
static const u8	STCursor_pos[] = {
		1, 1,
		1, 3,
		1, 5,
		1, 7,
		1, 9,
		1, 11,
		1, 13,
		1, 15,
		1, 17,
	};

//------------------------------

void	SndTestNewDrvCheckInit(u8 id)
{
	u8	indexstr100[] = {B__,bo_,ta_,n_,de_,spc_,mo_,do_,ru_,EOM_};
	u8	indexstr101[] = {A__,bo_,ta_,n_,de_,spc_,sa_,i_,se_,i_,EOM_};

	u8	indexstr150[] = {V__,O__,I__,C__,E__,tenten_,tenten_,tenten_,tenten_,EOM_};
	u8	indexstr151[] = {V__,O__,L__,U__,M__,E__,tenten_,tenten_,tenten_,EOM_};
	u8	indexstr152[] = {P__,A__,N__,P__,O__,T__,tenten_,tenten_,tenten_,EOM_};
	u8	indexstr153[] = {P__,I__,T__,C__,H__,tenten_,tenten_,tenten_,tenten_,EOM_};
	u8	indexstr154[] = {L__,E__,N__,G__,T__,H__,tenten_,tenten_,tenten_,EOM_};
	u8	indexstr155[] = {R__,E__,L__,E__,A__,S__,E__,tenten_,tenten_,EOM_};
	u8	indexstr156[] = {P__,R__,O__,G__,R__,E__,S__,S__,tenten_,EOM_};
	u8	indexstr157[] = {C__,H__,O__,R__,U__,S__,tenten_,tenten_,tenten_,EOM_};
	u8	indexstr158[] = {P__,R__,I__,O__,R__,I__,T__,Y__,tenten_,EOM_};
	u8	indexstr200[] = {sa_,i_,se_,i_,ti_,yu_,u_,tenten_,EOM_};
	u8	indexstr201[] = {ha_,n_,te_,n_,tenten_,tenten_,tenten_,tenten_,EOM_};
	u8	indexstr202[] = {su_,te_,re_,o_,tenten_,tenten_,tenten_,tenten_,EOM_};

	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
                          |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						  | DISP_BG0_ON					// BG0有効
						  | DISP_WIN0_ON				// WIN0 ON
						  | DISP_OBJ_ON;

	NMenuWinBoxWrite( 0, 0, 29, 19);
	NMenuMsgWrite(indexstr100,19,4);
	NMenuMsgWrite(indexstr101,19,2);

	NMenuMsgWrite(indexstr150,2,1);
	NMenuMsgWrite(indexstr151,2,3);
	NMenuMsgWrite(indexstr152,2,5);
	NMenuMsgWrite(indexstr153,2,7);
	NMenuMsgWrite(indexstr154,2,9);
	NMenuMsgWrite(indexstr155,2,11);
	NMenuMsgWrite(indexstr156,2,13);
	NMenuMsgWrite(indexstr157,2,15);
	NMenuMsgWrite(indexstr158,2,17);
	NMenuMsgWrite(indexstr200,19,16);
	NMenuMsgWrite(indexstr201,19,14);
	NMenuMsgWrite(indexstr202,19,12);

	*(vu16 *)REG_WIN0H	= (0*0x100)+240;
	*(vu16 *)REG_WIN0V	= (0*0x100)+160;

	STCursor = 0;
	STFlag = 0;
	STFlag_old = 0;
	STreturn = 0;
	STRev = 0;
	STstereo = 1;
	STWork[ STVoiceNo ] = 0;
	STWork[ STVolume ] = 120;
	STWork[ STPanpot ] = 0;
	STWork[ STPitch ] = 256 * 12 * 5;
	STWork[ STLength ] = 60 * 3;
	STWork[ STProgress ] = 0;
	STWork[ STRelease ] = 0;
	STWork[ STChorus ] = 0;
	STWork[ STPriority ] = 2;

	SndTestNewDrvCheckScreen();
	SndTestNewDrvCheckCursor( 0, 0 );
	TaskTable[id].TaskAdrs = SndTestNewDrvCheckMain;
}

//------------------------------

void	SndTestNewDrvCheckMain(u8 id)
{
	u8	old;
	u8	bank;
	u8	num;

	if( sys.Trg & B_BUTTON ){
		*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
    	                      |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
							  | DISP_BG0_ON					// BG0有効
							  | DISP_WIN01_ON				// WIN0&1 ON
							  | DISP_OBJ_ON;
		*(vu16 *)REG_WIN0H	= (17*0x100)+223;
		*(vu16 *)REG_WIN0V	= 1*0x100+31;
		NMenuBoxClear( 0, 0, 29, 19 );
		TaskTable[id].TaskAdrs = SndTestInitTask;
		return;
	}

	if( sys.Repeat & U_KEY ){
		old = STCursor;
		STCursor--;
		if( STCursor < 0 )
			STCursor = ST_MENU_;
		SndTestNewDrvCheckCursor( old, STCursor );
		return;
	}

	if( sys.Repeat & D_KEY ){
		old = STCursor;
		STCursor++;
		if( STCursor > ST_MENU_ )
			STCursor = 0;
		SndTestNewDrvCheckCursor( old, STCursor );
		return;
	}

	if( sys.Trg & START_BUTTON ){
		STRev ^= 1;
		SndTestNewDrvCheckScreen();
		return;
	}

	if( sys.Trg & SELECT_BUTTON ){
		STstereo ^= 1;
		SndTestNewDrvCheckScreen();
		pokStereoMono( STstereo );
		return;
	}

	if( sys.Repeat & R_BUTTON ){
		SndTestNewDrvCheckNum( 10 );
		SndTestNewDrvCheckScreen();
		return;
	}
	if( sys.Repeat & L_BUTTON ){
		SndTestNewDrvCheckNum( -10 );
		SndTestNewDrvCheckScreen();
		return;
	}

	if( sys.Repeat & L_KEY ){
		SndTestNewDrvCheckNum( -1 );
		SndTestNewDrvCheckScreen();
		return;
	}
	if( sys.Repeat & R_KEY ){
		SndTestNewDrvCheckNum( 1 );
		SndTestNewDrvCheckScreen();
		return;
	}

	if( sys.Trg & A_BUTTON ){
		pokVoiceVolume( STWork[ STVolume ] );						//初期音量設定 (0～127)
		pokVoicePanpot( STWork[ STPanpot ] );						//初期パンポット指定 (-127～127)
		pokVoicePitch( STWork[ STPitch ] );							//初期ピッチ指定 (256=半音)
		pokVoiceLength( STWork[ STLength ] );						//再生時間指定 (60=1秒)
		pokVoiceProgress( STWork[ STProgress ] );					//波形再生開始位置指定 (0～nバイト)
		pokVoiceRelease( STWork[ STRelease ] );						//波形再生の減衰割合指定
		pokVoiceChorus( STWork[ STChorus ] );
		pokVoicePriority( STWork[ STPriority ] );

		num = STWork[ STVoiceNo ] % 128;
		bank = STWork[ STVoiceNo ] / 128;
		switch( bank ){
			case 0:
				if( STRev ){
					STreturn =
					 pokVoiceStart( &voicegroup204[ num ] );		//波形を逆再生
				}else{
					STreturn =
					 pokVoiceStart( &voicegroup200[ num ] );		//波形を直接再生
				}
				break;
			case 1:
				if( STRev ){
					STreturn =
					 pokVoiceStart( &voicegroup205[ num ] );		//波形を逆再生
				}else{
					STreturn =
					 pokVoiceStart( &voicegroup201[ num ] );		//波形を直接再生
				}
				break;
			case 2:
				if( STRev ){
					STreturn =
					 pokVoiceStart( &voicegroup206[ num ] );		//波形を逆再生
				}else{
					STreturn =
					 pokVoiceStart( &voicegroup202[ num ] );		//波形を直接再生
				}
				break;
			case 3:
				if( STRev ){
					STreturn =
					 pokVoiceStart( &voicegroup207[ num ] );		//波形を逆再生
				}else{
					STreturn =
					 pokVoiceStart( &voicegroup203[ num ] );		//波形を直接再生
				}
				break;
		}
	}

	if( STreturn ){
		STFlag = pokVoiceCheck( STreturn );
		if( STFlag != STFlag_old )
			SndTestNewDrvCheckScreen();
		STFlag_old = STFlag;
	}
}

//------------------------------

static void SndTestNewDrvCheckNum( s8 sw ){
	s32	number_[] = {
		//min, max
		0, ST_VOICE_MAX_,	//voice no
		0, 127,				//volume
		-127, 127,			//panpot
		-128, 32639,		//pitch
		0, 65535,			//length
		0, 255,				//release
		0, 65535,			//progress
		-64, 63,			//chorus
	};

	STWork[ STCursor ] += sw;
	if( STWork[ STCursor ] > number_[ STCursor * 2 + 1 ] )
		STWork[ STCursor ] = number_[ STCursor * 2 ];
	if( STWork[ STCursor ] < number_[ STCursor * 2 ] )
		STWork[ STCursor ] = number_[ STCursor * 2 + 1 ];
}

//------------------------------

static void	SndTestNewDrvCheckScreen( void ){
	SNumPut2( STWork[ STVoiceNo ]+1, 11, 1, 5 );
	SNumPut2( STWork[ STVolume ], 11, 3, 5 );
	SNumPut2( STWork[ STPanpot ], 11, 5, 5 );
	SNumPut2( STWork[ STPitch ], 11, 7, 5 );
	SNumPut2( STWork[ STLength ], 11, 9, 5 );
	SNumPut2( STWork[ STRelease ], 11, 11, 5 );
	SNumPut2( STWork[ STProgress ], 11, 13, 5 );
	SNumPut2( STWork[ STChorus ], 11, 15, 5 );
	SNumPut2( STWork[ STPriority ], 11, 17, 5 );

	SNumPut2( STFlag, 27, 16, 1 );
	SNumPut2( STRev, 27, 14, 1 );
	SNumPut2( STstereo, 27, 12, 1 );
}

//------------------------------

static void SndTestNewDrvCheckCursor( u8 oldc, u8 newc ){
	u8	Cursor[] = { cursor_, EOM_ };
	u8	Cursor_del[] = { spc_, EOM_ };

	NMenuMsgWrite( Cursor_del, STCursor_pos[ oldc * 2 ], STCursor_pos[ oldc * 2 + 1 ] );
	NMenuMsgWrite( Cursor, STCursor_pos[ newc * 2 ], STCursor_pos[ newc * 2 + 1 ] );
}

//------------------------------

static void SNumPut2( s32 no, u16 x, u16 y, u8 keta )
{
	s32	data[] = { 1, 10, 100, 1000, 10000, 100000 };

	u8	numstr[8];
	s8	i, numw, f, m;

	for( i = 0; i <= keta; i++ )
		numstr[ i ] = spc_;
	numstr[keta+1] = EOM_;

	m = 0;
	if( no < 0 ){
		no *= -1;
		m = 1;
	}

	f = 0;
	if( keta == 1 )
		f = 1;

	for( i = keta-1; i >= 0 ; i-- ){
		numw = no / data[i];
		if( numw || f || ( i == 0 ) ){
			if( m && ( f == 0 ) )
				numstr[ keta-i-1 ] = bou_;
			numstr[ keta-i ] = n0_ + numw;
			f = 1;
		}
		no %= data[i];
	}
	NMenuMsgWrite( numstr, x, y );
}

/********************************************************************/
/*				技効果音テスト用									*/
/********************************************************************/
#define STFlag STProgress
#define STTimer STRelease
#define STPanMove STChorus
#define ST_MOVE_LR	127
#define ST_MOVE_RL	-128
#define STPanTableMax (5-1)

static const s8 STPanTable[] = {
	WAZA_SE_R,
	0,
	WAZA_SE_L,
	ST_MOVE_LR,
	ST_MOVE_RL,
};

void	SndTestWazaInit(u8 id)
{
	u8	indexstr300[] = {S__,E__,EOM_};
	u8	indexstr301[] = {P__,A__,N__,EOM_};
	u8	indexstr400[] = {sa_,i_,se_,i_,ti_,yu_,u_,tenten_,EOM_};

	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
                          |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						  | DISP_BG0_ON					// BG0有効
						  | DISP_WIN0_ON				// WIN0 ON
						  | DISP_OBJ_ON;

	NMenuWinBoxWrite( 0, 0, 29, 19);
	NMenuMsgWrite(indexstr300,3,2);
	NMenuMsgWrite(indexstr301,3,4);
	NMenuMsgWrite(indexstr400,3,8);

	*(vu16 *)REG_WIN0H	= (0*0x100)+240;
	*(vu16 *)REG_WIN0V	= (0*0x100)+160;

	STWork[ STVoiceNo ] = SE_NUM_START+1;
	STWork[ STPanpot ] = 0;
	STWork[ STPanMove ] = 0;
	STWork[ STFlag ] = 0;
	STWork[ STTimer ] = 0;

	SndTestWazaScreen();
	TaskTable[id].TaskAdrs = SndTestWazaMain;
}

void	SndTestWazaMain(u8 id)
{
	SndTestWazaScreen();

	if( STWork[ STFlag ] ){
		if( STWork[ STTimer ] ){
			STWork[ STTimer ]--;
		}else{
			switch( STPanTable[ STWork[ STPanpot ] ] ){
				case ST_MOVE_LR:
					STWork[ STPanMove ] += 2;
					if( STWork[ STPanMove ] >= WAZA_SE_R )
						break;
					SePan( STWork[ STPanMove ] );
					break;
				case ST_MOVE_RL:
					STWork[ STPanMove ] -= 2;
					if( STWork[ STPanMove ] <= WAZA_SE_L )
						break;
					SePan( STWork[ STPanMove ] );
					break;
			}
		}
	}

	if( sys.Trg & B_BUTTON ){
		*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
    	                      |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
							  | DISP_BG0_ON					// BG0有効
							  | DISP_WIN01_ON				// WIN0&1 ON
							  | DISP_OBJ_ON;
		*(vu16 *)REG_WIN0H	= (17*0x100)+223;
		*(vu16 *)REG_WIN0V	= 1*0x100+31;
		NMenuBoxClear( 0, 0, 29, 19 );
		TaskTable[id].TaskAdrs = SndTestInitTask;
		return;
	}

	if( sys.Trg & A_BUTTON ){
		switch( STPanTable[ STWork[ STPanpot ] ] ){
			case ST_MOVE_LR:
				SePlayPan( STWork[ STVoiceNo ], WAZA_SE_L );
				STWork[ STPanMove ] = WAZA_SE_L;
				STWork[ STFlag ] = 1;
				STWork[ STTimer ] = 30;
				break;
			case ST_MOVE_RL:
				SePlayPan( STWork[ STVoiceNo ], WAZA_SE_R );
				STWork[ STPanMove ] = WAZA_SE_R;
				STWork[ STFlag ] = 1;
				STWork[ STTimer ] = 30;
				break;
			default:
				SePlayPan( STWork[ STVoiceNo ], STPanTable[ STWork[ STPanpot ] ] );
				STWork[ STFlag ] = 0;
				break;
		}
		return;
	}

	if( sys.Trg & L_BUTTON ){
		STWork[ STPanpot ]++;
		if( STWork[ STPanpot ] > STPanTableMax )
			STWork[ STPanpot ] = 0;
	//	SndTestWazaScreen();
	}

	if( sys.Trg & R_BUTTON ){
		STWork[ STPanpot ]--;
		if( STWork[ STPanpot ] < 0 )
			STWork[ STPanpot ] = STPanTableMax;
	//	SndTestWazaScreen();
	}

	if( sys.Repeat & R_KEY ){
		STWork[ STVoiceNo ]++;
		if( STWork[ STVoiceNo ] > SE_NUM_END )
			STWork[ STVoiceNo ] = SE_NUM_START;
	//	SndTestWazaScreen();
		return;
	}

	if( sys.Repeat & L_KEY ){
		STWork[ STVoiceNo ]--;
		if( STWork[ STVoiceNo ] < SE_NUM_START )
			STWork[ STVoiceNo ] = SE_NUM_END;
	//	SndTestWazaScreen();
		return;
	}
}

static void SndTestWazaScreen( void )
{
	u8	indexstrLR[] = {spc_,spc_,L__,R__,EOM_};
	u8	indexstrRL[] = {spc_,spc_,R__,L__,EOM_};
	u8	r;

	SNumPut2( STWork[ STVoiceNo ], 7, 2, 3 );

	switch( STPanTable[ STWork[ STPanpot ] ] ){
		case ST_MOVE_LR:
			NMenuMsgWrite( indexstrLR ,7, 4 );
			break;
		case ST_MOVE_RL:
			NMenuMsgWrite( indexstrRL ,7, 4 );
			break;
		default:
			SNumPut2( STPanTable[ STWork[ STPanpot ] ], 7, 4, 3 );
			break;
	}

	r = SeEndCheck();
	SNumPut2( r, 12, 8, 1 );
}


/********************************************************************/
/*				鳴き声画面のいろいろ関連							*/
/********************************************************************/
u16	pok_no;

static void SndTestNakigoeInit(u8 id)
{
	HakeiSet	hs;
	MeterSet	ms;
	u8			init_end;

	PrintScreenInit(DEFAULT_TYPE);
	NMenuScreenInit(FIELD_MENU_TYPE);

	pok_no = 1;

	InitActor();
	ObjPalManInit();

	//波形表示設定
	hs.ChrAddr = 0x2000;
	hs.ScrBlock = 29;
	hs.PalNo = 12;
	hs.XSize = 30;
	hs.YOffs = 4;
	init_end = 0;
	ZNakiInitSeq = 0;
	while( init_end == 0 )
		init_end = HakeiInit( &hs,3 );

	//VUメーター表示設定
	ms.ChrAddr = 0x0000;
	ms.ScrBlock = 15;
	ms.PalNo = 13;
	ms.XPos = 12;
	ms.YPos = 12;
	init_end = 0;
	ZNakiInitSeq = 0;
	while( init_end == 0 )
		init_end = VuMeterInit( &ms,2 );

	NMenuWinBoxWrite( 0, 16, 5, 19 );
	SndTestNakigoeScreen();
	PaletteFadeReq( 0xffffffff, 0, 16, 0, 0 );

	*(vu16 *)REG_BG2HOFS = 0;
	*(vu16 *)REG_BG2VOFS = 0;

	//VUメーター用
	*(vu16 *)REG_BG2CNT = BG_COLOR_16					//16色選択
						| BG_SCREEN_SIZE_0				//スクリーンサイズ
						| BG_PRIORITY_1					//BG優先順位
						| 15 << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
						| 0 << BG_CHAR_BASE_SHIFT ;		//キャラクタベースブロック

	*(vu16 *)REG_BG3CNT = BG_COLOR_16					//16色選択
						| BG_SCREEN_SIZE_0				//スクリーンサイズ
						| BG_PRIORITY_3					//BG優先順位
						| 29 << BG_SCREEN_BASE_SHIFT 	//スクリーンベースブロック
						| 0 << BG_CHAR_BASE_SHIFT ;		//キャラクタベースブロック

	*(vu16 *)REG_DISPCNT = DISP_MODE_0					// BGモード 
						| DISP_OBJ_CHAR_1D_MAP			// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						| DISP_BG0_ON					// BG0有効
						| DISP_BG2_ON					// BG2有効
						| DISP_BG3_ON					// BG1有効 (波形など)
						| DISP_OBJ_ON;					// OBJ有効（Vuメター)

	m4aMPlayFadeOutPause( &m4a_mplay000, 2 );
	TaskTable[id].TaskAdrs = SndTestNakigoeMain;
}

static void SndTestNakigoeMain(u8 id)
{
	HakeiMain(3);

	if( sys.Trg & A_BUTTON ){
		HakeiStart( pok_no );
	}
	if( sys.Trg & R_BUTTON ){
		VoicePlayStop();
	}
	if( sys.Repeat & U_KEY ){
		pok_no--;
		if( pok_no < 1 )
			pok_no = 384;
		SndTestNakigoeScreen();
	}
	if( sys.Repeat & D_KEY ){
		pok_no++;
		if( pok_no > 384 )
			pok_no = 1;
		SndTestNakigoeScreen();
	}
	if( sys.Trg & B_BUTTON ){
		*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
    	                      |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
							  | DISP_BG0_ON					// BG0有効
							  | DISP_WIN01_ON				// WIN0&1 ON
							  | DISP_OBJ_ON;
		*(vu16 *)REG_WIN0H	= (17*0x100)+223;
		*(vu16 *)REG_WIN0V	= 1*0x100+31;
		NMenuBoxClear( 0, 0, 29, 19 );
		TaskTable[id].TaskAdrs = SndTestInitTask;
		VuMeterEnd();
		return;
	}
}

static void SndTestNakigoeScreen( void )
{
	SNumPut2( pok_no, 1, 17, 3 );
}

/********************************************************************/
/*				曲名ﾃｰﾌﾞﾙ											*/
/********************************************************************/
static	const	u8	BGM_Name0[]	={S__,T__,O__,P__,EOM_};
static	const	u8	BGM_Name1[]	={T__,E__,T__,S__,U__,J__,I__,EOM_};
static	const	u8	BGM_Name2[]	={F__,I__,E__,L__,D__,n1_,n3_,EOM_};
static	const	u8	BGM_Name3[]	={K__,A__,C__,H__,I__,n2_,n2_,EOM_};
static	const	u8	BGM_Name4[]	={K__,A__,C__,H__,I__,n2_,EOM_};
static	const	u8	BGM_Name5[]	={K__,A__,C__,H__,I__,n3_,EOM_};
static	const	u8	BGM_Name5a[]={K__,A__,C__,H__,I__,n5_,EOM_};
static	const	u8	BGM_Name6[]	={P__,C__,C__,EOM_};
static	const	u8	BGM_Name7[]	={N__,I__,B__,I__,EOM_};
static	const	u8	BGM_Name8[] ={S__,U__,I__,K__,U__,N__,EOM_};
static	const	u8	BGM_Name9[] ={D__,O__,O__,R__,O__,n1_,EOM_};
static	const	u8	BGM_Name10[]={D__,O__,O__,R__,O__,bou_,X__,n1_,EOM_};
static	const	u8	BGM_Name11[]={D__,O__,O__,R__,O__,bou_,X__,n3_,EOM_};
static	const	u8	BGM_Name12[]={M__,A__,C__,H__,I__,bou_,S__,n2_,EOM_};
static	const	u8	BGM_Name13[]={M__,A__,C__,H__,I__,bou_,S__,n4_,EOM_};
static	const	u8	BGM_Name14[]={G__,I__,M__,EOM_};
static	const	u8	BGM_Name15[]={N__,A__,M__,I__,N__,O__,R__,I__,EOM_};
static	const	u8	BGM_Name16[]={D__,A__,N__,n0_,n1_,EOM_};
static	const	u8	BGM_Name17[]={F__,A__,N__,F__,A__,n1_,EOM_};
static	const	u8	BGM_Name18[]={M__,E__,bou_,A__,S__,A__,EOM_};
static	const	u8	BGM_Name19[]={M__,E__,bou_,B__,A__,C__,H__,I__,EOM_};
static	const	u8	BGM_Name20[]={F__,A__,N__,F__,A__,n4_,EOM_};
static	const	u8	BGM_Name21[]={F__,A__,N__,F__,A__,n5_,EOM_};
static	const	u8	BGM_Name22[]={M__,E__,bou_,W__,A__,Z__,A__,EOM_};
static	const	u8	BGM_Name23[]={B__,I__,J__,Y__,U__,T__,U__,EOM_};
static	const	u8	BGM_Name24[]={D__,O__,O__,R__,O__,bou_,X__,n4_,EOM_};
static	const	u8	BGM_Name25[]={F__,U__,N__,E__,bou_,K__,A__,N__,EOM_};
static	const	u8	BGM_Name26[]={M__,E__,bou_,S__,H__,I__,N__,K__,A__,EOM_};
static	const	u8	BGM_Name27[]={S__,H__,I__,N__,K__,A__,EOM_};
static	const	u8	BGM_Name28[]={M__,E__,bou_,W__,A__,S__,U__,R__,E__,EOM_};
static	const	u8	BGM_Name29[]={S__,Y__,O__,U__,J__,O__,E__,Y__,E__,EOM_};
static	const	u8	BGM_Name30[]={B__,O__,Y__,E__,Y__,E__,EOM_};
static	const	u8	BGM_Name31[]={D__,A__,N__,n0_,n2_,EOM_};
static	const	u8	BGM_Name32[]={M__,A__,C__,H__,I__,bou_,S__,n3_,EOM_};
static	const	u8	BGM_Name33[]={O__,D__,A__,M__,A__,K__,I__,EOM_};
static	const	u8	BGM_Name34[]={B__,bou_,T__,O__,W__,E__,R__,EOM_};
static	const	u8	BGM_Name35[]={S__,W__,I__,M__,E__,Y__,E__,EOM_};
static	const	u8	BGM_Name36[]={D__,A__,N__,n0_,n3_,EOM_};
static	const	u8	BGM_Name37[]={M__,E__,bou_,K__,I__,N__,O__,M__,I__,EOM_};
static	const	u8	BGM_Name38[]={M__,E__,bou_,T__,A__,M__,A__,EOM_};
static	const	u8	BGM_Name39[]={M__,E__,bou_,B__,bou_,B__,I__,G__,EOM_};
static	const	u8	BGM_Name40[]={M__,E__,bou_,B__,bou_,S__,M__,A__,L__,L__,EOM_};
static	const	u8	BGM_Name41[]={M__,E__,bou_,Z__,A__,N__,N__,E__,N__,EOM_};
static	const	u8	BGM_Name42[]={B__,D__,bou_,T__,I__,M__,E__,EOM_};

static	const	u8	BGM_Name50[]={T__,E__,S__,T__,n1_,EOM_};
static	const	u8	BGM_Name51[]={T__,E__,S__,T__,n2_,EOM_};
static	const	u8	BGM_Name52[]={T__,E__,S__,T__,n3_,EOM_};
static	const	u8	BGM_Name53[]={T__,E__,S__,T__,n4_,EOM_};
static	const	u8	BGM_Name54[]={T__,E__,S__,T__,EOM_};
static	const	u8	BGM_Name55[]={G__,O__,M__,A__,C__,H__,I__,n0_,EOM_};
static	const	u8	BGM_Name56[]={G__,O__,T__,O__,W__,N__,EOM_};
static	const	u8	BGM_Name57[]={P__,O__,K__,E__,C__,E__,N__,EOM_};
static	const	u8	BGM_Name58[]={N__,E__,X__,T__,R__,O__,A__,D__,EOM_};
static	const	u8	BGM_Name59[]={G__,R__,A__,N__,R__,O__,A__,D__,EOM_};
static	const	u8	BGM_Name60[]={C__,Y__,C__,L__,I__,N__,G__,EOM_};
static	const	u8	BGM_Name61[]={F__,R__,I__,E__,N__,D__,L__,Y__,EOM_};
static	const	u8	BGM_Name62[]={M__,I__,S__,H__,I__,R__,O__,EOM_};
static	const	u8	BGM_Name63[]={T__,O__,Z__,A__,N__,EOM_};
static	const	u8	BGM_Name64[]={G__,I__,R__,L__,E__,Y__,E__,EOM_};
static	const	u8	BGM_Name65[]={M__,I__,N__,A__,M__,O__,EOM_};
static	const	u8	BGM_Name66[]={A__,S__,H__,R__,O__,A__,D__,EOM_};
static	const	u8	BGM_Name67[]={E__,V__,E__,N__,T__,n0_,EOM_};
static	const	u8	BGM_Name68[]={D__,E__,E__,P__,D__,E__,E__,P__,EOM_};
static	const	u8	BGM_Name69[]={K__,A__,C__,H__,I__,n1_,EOM_};
static	const	u8	BGM_Name70[]={T__,I__,T__,L__,E__,n3_,EOM_};
//static	const	u8	BGM_Name71[]={B__,O__,Y__,E__,Y__,E__,EOM_};
static	const	u8	BGM_Name72[]={D__,E__,M__,O__,n1_,EOM_};
static	const	u8	BGM_Name73[]={G__,I__,R__,L__,bou_,S__,U__,P__,EOM_};
static	const	u8	BGM_Name74[]={H__,A__,G__,E__,S__,H__,I__,I__,EOM_};
static	const	u8	BGM_Name75[]={K__,A__,K__,K__,O__,I__,I__,EOM_};
static	const	u8	BGM_Name76[]={K__,A__,Z__,A__,N__,B__,A__,I__,EOM_};
static	const	u8	BGM_Name77[]={A__,Q__,A__,bou_,n0_,EOM_};
static	const	u8	BGM_Name78[]={T__,S__,U__,R__,E__,T__,E__,K__,EOM_};
static	const	u8	BGM_Name79[]={B__,O__,Y__,bou_,S__,U__,P__,EOM_};
static	const	u8	BGM_Name80[]={R__,A__,I__,N__,B__,O__,W__,EOM_};
static	const	u8	BGM_Name81[]={A__,Y__,A__,S__,I__,I__,EOM_};
static	const	u8	BGM_Name82[]={K__,A__,C__,H__,I__,n4_,EOM_};
static	const	u8	BGM_Name83[]={R__,O__,P__,E__,W__,A__,Y__,EOM_};
static	const	u8	BGM_Name84[]={C__,A__,S__,I__,N__,O__,EOM_};
static	const	u8	BGM_Name85[]={H__,I__,G__,H__,T__,O__,W__,N__,EOM_};
static	const	u8	BGM_Name86[]={S__,A__,F__,A__,R__,I__,EOM_};
static	const	u8	BGM_Name87[]={C__,bou_,R__,O__,A__,D__,EOM_};
static	const	u8	BGM_Name88[]={A__,J__,I__,T__,O__,EOM_};
static	const	u8	BGM_Name89[]={M__,bou_,B__,O__,A__,T__,EOM_};
static	const	u8	BGM_Name90[]={M__,bou_,D__,U__,N__,G__,O__,N__,EOM_};
static	const	u8	BGM_Name91[]={F__,I__,N__,E__,C__,I__,T__,Y__,EOM_};
static	const	u8	BGM_Name92[]={M__,A__,C__,H__,U__,P__,I__,EOM_};
static	const	u8	BGM_Name93[]={P__,bou_,S__,C__,H__,O__,O__,L__,EOM_};
static	const	u8	BGM_Name94[]={D__,E__,N__,D__,O__,U__,EOM_};
static	const	u8	BGM_Name95[]={T__,O__,N__,E__,K__,U__,S__,A__,EOM_};
static	const	u8	BGM_Name96[]={M__,A__,B__,O__,R__,O__,S__,I__,EOM_};
static	const	u8	BGM_Name97[]={C__,O__,N__,bou_,F__,A__,N__,EOM_};
static	const	u8	BGM_Name98[]={C__,O__,N__,T__,E__,S__,T__,n0_,EOM_};
static	const	u8	BGM_Name99[]={M__,G__,M__,n0_,EOM_};
static	const	u8	BGM_Name100[]={T__,bou_,B__,A__,T__,T__,L__,E__,EOM_};
static	const	u8	BGM_Name101[]={O__,O__,A__,M__,E__,EOM_};
static	const	u8	BGM_Name102[]={H__,I__,D__,E__,R__,I__,EOM_};
static	const	u8	BGM_Name103[]={R__,U__,N__,E__,C__,I__,T__,Y__,EOM_};
static	const	u8	BGM_Name104[]={C__,O__,N__,bou_,K__,EOM_};
static	const	u8	BGM_Name105[]={E__,I__,K__,O__,U__,bou_,R__,EOM_};
static	const	u8	BGM_Name106[]={K__,A__,R__,A__,K__,U__,R__,I__,EOM_};
static	const	u8	BGM_Name107[]={H__,U__,T__,A__,G__,O__,EOM_};
static	const	u8	BGM_Name108[]={S__,I__,T__,E__,N__,N__,O__,U__,EOM_};
static	const	u8	BGM_Name109[]={Y__,A__,M__,A__,bou_,E__,Y__,E__,EOM_};
static	const	u8	BGM_Name110[]={C__,O__,N__,L__,O__,B__,B__,Y__,EOM_};
static	const	u8	BGM_Name111[]={I__,N__,T__,E__,R__,bou_,V__,EOM_};
static	const	u8	BGM_Name112[]={D__,A__,I__,G__,O__,EOM_};
static	const	u8	BGM_Name113[]={T__,H__,A__,N__,K__,F__,O__,R__,EOM_};
static	const	u8	BGM_Name114[]={E__,N__,D__,EOM_};

static	const	u8	BGM_Name150[]={B__,A__,T__,T__,L__,E__,n2_,n7_,EOM_};
static	const	u8	BGM_Name151[]={B__,A__,T__,T__,L__,E__,n3_,n1_,EOM_};
static	const	u8	BGM_Name152[]={B__,A__,T__,T__,L__,E__,n2_,n0_,EOM_};
static	const	u8	BGM_Name153[]={B__,A__,T__,T__,L__,E__,n3_,n2_,EOM_};
static	const	u8	BGM_Name154[]={B__,A__,T__,T__,L__,E__,n3_,n3_,EOM_};
static	const	u8	BGM_Name155[]={B__,A__,T__,T__,L__,E__,n3_,n6_,EOM_};
static	const	u8	BGM_Name156[]={B__,A__,T__,T__,L__,E__,n3_,n4_,EOM_};
static	const	u8	BGM_Name157[]={B__,A__,T__,T__,L__,E__,n3_,n5_,EOM_};
static	const	u8	BGM_Name158[]={B__,A__,T__,T__,L__,E__,n3_,n8_,EOM_};
static	const	u8	BGM_Name159[]={B__,A__,T__,T__,L__,E__,n3_,n0_,EOM_};


static	const	u8*	const BGM_NameTable[]={
BGM_Name0,
BGM_Name1,
BGM_Name2,
BGM_Name3,
BGM_Name4,
BGM_Name5,
BGM_Name5a,
BGM_Name6,
BGM_Name7,
BGM_Name8,
BGM_Name9,
BGM_Name10,
BGM_Name11,
BGM_Name12,
BGM_Name13,
BGM_Name14,
BGM_Name15,
BGM_Name16,
BGM_Name17,
BGM_Name18,
BGM_Name19,
BGM_Name20,
BGM_Name21,
BGM_Name22,
BGM_Name23,
BGM_Name24,
BGM_Name25,
BGM_Name26,
BGM_Name27,
BGM_Name28,
BGM_Name29,
BGM_Name30,
BGM_Name31,
BGM_Name32,
BGM_Name33,
BGM_Name34,
BGM_Name35,
BGM_Name36,
BGM_Name37,
BGM_Name38,
BGM_Name39,
BGM_Name40,
BGM_Name41,
BGM_Name42,

BGM_Name50,
BGM_Name51,
BGM_Name52,
BGM_Name53,
BGM_Name54,
BGM_Name55,
BGM_Name56,
BGM_Name57,
BGM_Name58,
BGM_Name59,
BGM_Name60,
BGM_Name61,
BGM_Name62,
BGM_Name63,
BGM_Name64,
BGM_Name65,
BGM_Name66,
BGM_Name67,
BGM_Name68,
BGM_Name69,
BGM_Name70,
//BGM_Name71,
BGM_Name72,
BGM_Name73,
BGM_Name74,
BGM_Name75,
BGM_Name76,
BGM_Name77,
BGM_Name78,
BGM_Name79,
BGM_Name80,
BGM_Name81,
BGM_Name82,
BGM_Name83,
BGM_Name84,
BGM_Name85,
BGM_Name86,
BGM_Name87,
BGM_Name88,
BGM_Name89,
BGM_Name90,
BGM_Name91,
BGM_Name92,
BGM_Name93,
BGM_Name94,
BGM_Name95,
BGM_Name96,
BGM_Name97,
BGM_Name98,
BGM_Name99,
BGM_Name100,
BGM_Name101,
BGM_Name102,
BGM_Name103,
BGM_Name104,
BGM_Name105,
BGM_Name106,
BGM_Name107,
BGM_Name108,
BGM_Name109,
BGM_Name110,
BGM_Name111,
BGM_Name112,
BGM_Name113,
BGM_Name114,

BGM_Name150,
BGM_Name151,
BGM_Name152,
BGM_Name153,
BGM_Name154,
BGM_Name155,
BGM_Name156,
BGM_Name157,
BGM_Name158,
BGM_Name159,
};

static	const	u8	SE_Name0[]	={S__,T__,O__,P__,EOM_};

static	const	u8	SE_Name1[]	={K__,A__,I__,F__,U__,K__,U__,EOM_};
static	const	u8	SE_Name2[]	={P__,C__,bou_,L__,O__,G__,O__,N__,EOM_};
static	const	u8	SE_Name3[]	={P__,C__,bou_,O__,F__,F__,EOM_};
static	const	u8	SE_Name4[]	={P__,C__,bou_,O__,N__,EOM_};
static	const	u8	SE_Name5[]	={S__,E__,L__,E__,C__,T__,EOM_};
static	const	u8	SE_Name6[]	={W__,I__,N__,bou_,O__,P__,E__,N__,EOM_};
static	const	u8	SE_Name7[]	={W__,A__,L__,L__,bou_,H__,I__,T__,EOM_};
static	const	u8	SE_Name8[]	={D__,O__,O__,R__,EOM_};
static	const	u8	SE_Name9[]	={K__,A__,I__,D__,A__,N__,EOM_};
static	const	u8	SE_Name10[]	={D__,A__,N__,S__,A__,EOM_};
static	const	u8	SE_Name11[]	={J__,I__,T__,E__,N__,S__,Y__,A__,EOM_};
static	const	u8	SE_Name12[]	={K__,O__,U__,K__,A__,bou_,L__,EOM_};
static	const	u8	SE_Name13[]	={K__,O__,U__,K__,A__,bou_,M__,EOM_};
static	const	u8	SE_Name14[]	={K__,O__,U__,K__,A__,bou_,H__,EOM_};
static	const	u8	SE_Name15[]	={B__,O__,W__,A__,n2_,EOM_};
static	const	u8	SE_Name16[]	={P__,O__,K__,E__,bou_,D__,E__,A__,D__,EOM_};
static	const	u8	SE_Name17[]	={N__,I__,G__,E__,R__,U__,EOM_};
static	const	u8	SE_Name18[]	={J__,I__,D__,O__,bou_,D__,O__,A__,EOM_};
static	const	u8	SE_Name19[]	={N__,A__,M__,I__,N__,O__,R__,I__,EOM_};
static	const	u8	SE_Name20[]	={B__,A__,N__,EOM_};
static	const	u8	SE_Name21[]	={P__,I__,N__,EOM_};
static	const	u8	SE_Name22[]	={B__,O__,O__,EOM_};
static	const	u8	SE_Name23[]	={B__,O__,W__,A__,EOM_};
static	const	u8	SE_Name24[]	={J__,Y__,U__,N__,I__,EOM_};
static	const	u8	SE_Name25[]	={A__,EOM_};
static	const	u8	SE_Name26[]	={I__,EOM_};
static	const	u8	SE_Name27[]	={U__,EOM_};
static	const	u8	SE_Name28[]	={E__,EOM_};
static	const	u8	SE_Name29[]	={O__,EOM_};
static	const	u8	SE_Name30[]	={N__,EOM_};
static	const	u8	SE_Name31[]	={S__,E__,I__,K__,A__,I__,EOM_};
static	const	u8	SE_Name32[]	={H__,A__,Z__,U__,R__,E__,EOM_};
static	const	u8	SE_Name33[]	={E__,X__,P__,EOM_};
static	const	u8	SE_Name34[]	={J__,I__,T__,E__,bou_,P__,Y__,O__,K__,O__,EOM_};
static	const	u8	SE_Name35[]	={M__,U__,bou_,P__,A__,C__,H__,I__,EOM_};
static	const	u8	SE_Name36[]	={T__,K__,bou_,K__,A__,S__,Y__,A__,EOM_};
static	const	u8	SE_Name37[]	={F__,U__,bou_,Z__,A__,K__,U__,EOM_};
static	const	u8	SE_Name38[]	={F__,U__,bou_,Z__,A__,K__,U__,n2_,EOM_};
static	const	u8	SE_Name39[]	={F__,U__,bou_,Z__,U__,Z__,U__,Z__,U__,EOM_};
static	const	u8	SE_Name40[]	={R__,U__,bou_,G__,A__,S__,H__,I__,N__,EOM_};
static	const	u8	SE_Name41[]	={R__,U__,bou_,G__,A__,S__,Y__,A__,N__,EOM_};
static	const	u8	SE_Name42[]	={R__,U__,bou_,B__,A__,R__,I__,EOM_};
static	const	u8	SE_Name43[]	={R__,U__,bou_,H__,Y__,U__,U__,EOM_};
static	const	u8	SE_Name44[]	={K__,I__,bou_,G__,A__,S__,Y__,A__,N__,EOM_};
static	const	u8	SE_Name45[]	={T__,K__,bou_,W__,A__,R__,P__,I__,N__,EOM_};
static	const	u8	SE_Name46[]	={T__,K__,bou_,W__,A__,R__,P__,O__,U__,T__,EOM_};
static	const	u8	SE_Name47[]	={T__,U__,bou_,S__,A__,A__,EOM_};
static	const	u8	SE_Name48[]	={H__,I__,bou_,T__,U__,R__,U__,N__,EOM_};
static	const	u8	SE_Name49[]	={T__,R__,A__,C__,K__,bou_,M__,O__,V__,E__,EOM_};
static	const	u8	SE_Name50[]	={T__,R__,A__,C__,K__,bou_,S__,T__,O__,P__,EOM_};
static	const	u8	SE_Name51[]	={T__,R__,A__,C__,K__,bou_,H__,A__,I__,K__,EOM_};
static	const	u8	SE_Name52[]	={T__,R__,A__,C__,K__,bou_,D__,O__,O__,R__,EOM_};
static	const	u8	SE_Name53[]	={M__,O__,T__,E__,R__,EOM_};
static	const	u8	SE_Name54[]	={C__,A__,R__,D__,EOM_};
static	const	u8	SE_Name55[]	={S__,A__,V__,E__,EOM_};
static	const	u8	SE_Name56[]	={K__,O__,N__,EOM_};
static	const	u8	SE_Name57[]	={K__,O__,N__,n2_,EOM_};
static	const	u8	SE_Name58[]	={K__,O__,N__,n3_,EOM_};
static	const	u8	SE_Name59[]	={K__,O__,N__,n4_,EOM_};
static	const	u8	SE_Name60[]	={S__,U__,I__,K__,O__,M__,U__,EOM_};
static	const	u8	SE_Name61[]	={N__,A__,G__,E__,R__,U__,EOM_};
static	const	u8	SE_Name62[]	={T__,O__,Y__,bou_,C__,EOM_};
static	const	u8	SE_Name63[]	={T__,O__,Y__,bou_,D__,EOM_};
static	const	u8	SE_Name64[]	={T__,O__,Y__,bou_,E__,EOM_};
static	const	u8	SE_Name65[]	={T__,O__,Y__,bou_,F__,EOM_};
static	const	u8	SE_Name66[]	={T__,O__,Y__,bou_,G__,EOM_};
static	const	u8	SE_Name67[]	={T__,O__,Y__,bou_,A__,EOM_};
static	const	u8	SE_Name68[]	={T__,O__,Y__,bou_,B__,EOM_};
static	const	u8	SE_Name69[]	={T__,O__,Y__,bou_,C__,n1_,EOM_};
static	const	u8	SE_Name70[]	={M__,I__,Z__,U__,EOM_};
static	const	u8	SE_Name71[]	={H__,A__,S__,H__,I__,EOM_};
static	const	u8	SE_Name72[]	={D__,A__,U__,G__,I__,EOM_};
static	const	u8	SE_Name73[]	={P__,I__,N__,P__,O__,N__,EOM_};
static	const	u8	SE_Name74[]	={F__,U__,U__,S__,E__,N__,n1_,EOM_};
static	const	u8	SE_Name75[]	={F__,U__,U__,S__,E__,N__,n2_,EOM_};
static	const	u8	SE_Name76[]	={F__,U__,U__,S__,E__,N__,n3_,EOM_};
static	const	u8	SE_Name77[]	={T__,O__,Y__,bou_,K__,A__,B__,E__,EOM_};
static	const	u8	SE_Name78[]	={T__,O__,Y__,bou_,D__,A__,N__,G__,O__,EOM_};
static	const	u8	SE_Name79[]	={D__,O__,K__,U__,EOM_};
static	const	u8	SE_Name80[]	={E__,S__,U__,K__,A__,EOM_};
static	const	u8	SE_Name81[]	={T__,bou_,A__,M__,E__,EOM_};
static	const	u8	SE_Name82[]	={T__,bou_,A__,M__,E__,bou_,E__,EOM_};
static	const	u8	SE_Name83[]	={T__,bou_,O__,O__,A__,M__,E__,EOM_};
static	const	u8	SE_Name84[]	={T__,bou_,O__,O__,A__,M__,E__,bou_,E__,EOM_};
static	const	u8	SE_Name85[]	={T__,bou_,K__,O__,A__,M__,E__,EOM_};
static	const	u8	SE_Name86[]	={T__,bou_,K__,O__,A__,M__,E__,bou_,E__,EOM_};
static	const	u8	SE_Name87[]	={T__,bou_,K__,A__,M__,I__,EOM_};
static	const	u8	SE_Name88[]	={T__,bou_,K__,A__,M__,I__,n2_,EOM_};
static	const	u8	SE_Name89[]	={E__,L__,E__,B__,E__,T__,A__,EOM_};
static	const	u8	SE_Name90[]	={H__,I__,N__,S__,I__,EOM_};
static	const	u8	SE_Name91[]	={E__,X__,P__,M__,A__,X__,EOM_};
static	const	u8	SE_Name92[]	={T__,A__,M__,A__,K__,O__,R__,O__,EOM_};
static	const	u8	SE_Name93[]	={T__,A__,M__,A__,K__,O__,R__,O__,bou_,E__,EOM_};
static	const	u8	SE_Name94[]	={B__,A__,S__,A__,B__,A__,S__,A__,EOM_};
static	const	u8	SE_Name95[]	={R__,E__,G__,I__,EOM_};
static	const	u8	SE_Name96[]	={C__,bou_,G__,A__,J__,I__,EOM_};
static	const	u8	SE_Name97[]	={C__,bou_,M__,A__,K__,U__,bou_,U__,EOM_};
static	const	u8	SE_Name98[]	={C__,bou_,M__,A__,K__,U__,bou_,D__,EOM_};
static	const	u8	SE_Name99[]	={C__,bou_,P__,A__,S__,I__,EOM_};
static	const	u8	SE_Name100[]={C__,bou_,S__,Y__,U__,EOM_};
static	const	u8	SE_Name101[]={C__,bou_,P__,I__,K__,O__,N__,EOM_};
static	const	u8	SE_Name102[]={R__,E__,A__,P__,O__,K__,E__,EOM_};
static	const	u8	SE_Name103[]={O__,P__,bou_,B__,A__,S__,Y__,U__,EOM_};
static	const	u8	SE_Name104[]={B__,T__,bou_,S__,T__,A__,R__,T__,EOM_};
static	const	u8	SE_Name105[]={D__,E__,N__,D__,O__,U__,EOM_};
static	const	u8	SE_Name106[]={J__,I__,H__,A__,N__,K__,I__,EOM_};
static	const	u8	SE_Name107[]={T__,A__,M__,A__,EOM_};
static	const	u8	SE_Name108[]={Z__,bou_,S__,C__,R__,O__,L__,L__,EOM_};
static	const	u8	SE_Name109[]={Z__,bou_,P__,A__,G__,E__,EOM_};
static	const	u8	SE_Name110[]={P__,N__,bou_,O__,N__,EOM_};
static	const	u8	SE_Name111[]={P__,N__,bou_,O__,F__,F__,EOM_};
static	const	u8	SE_Name112[]={Z__,bou_,S__,E__,A__,R__,C__,H__,EOM_};
static	const	u8	SE_Name113[]={T__,A__,M__,A__,G__,O__,EOM_};
static	const	u8	SE_Name114[]={T__,B__,bou_,S__,T__,A__,R__,T__,EOM_};
static	const	u8	SE_Name115[]={T__,B__,bou_,K__,O__,N__,EOM_};
static	const	u8	SE_Name116[]={T__,B__,bou_,K__,A__,R__,A__,EOM_};
static	const	u8	SE_Name117[]={B__,I__,D__,O__,R__,O__,EOM_};

static	const	u8	SE_Name200[] ={W__,n0_,n8_,n5_,EOM_};
static	const	u8	SE_Name201[] ={W__,n0_,n8_,n5_,B__,EOM_};
static	const	u8	SE_Name202[] ={W__,n2_,n3_,n1_,EOM_};
static	const	u8	SE_Name203[] ={W__,n1_,n7_,n1_,EOM_};
static	const	u8	SE_Name204[] ={W__,n2_,n3_,n3_,EOM_};
static	const	u8	SE_Name205[] ={W__,n2_,n3_,n3_,B__,EOM_};
static	const	u8	SE_Name206[] ={W__,n1_,n4_,n5_,EOM_};
static	const	u8	SE_Name207[] ={W__,n1_,n4_,n5_,B__,EOM_};
static	const	u8	SE_Name208[] ={W__,n1_,n4_,n5_,C__,EOM_};
static	const	u8	SE_Name209[] ={W__,n2_,n4_,n0_,EOM_};
static	const	u8	SE_Name210[] ={W__,n0_,n1_,n5_,EOM_};
static	const	u8	SE_Name211[] ={W__,n0_,n8_,n1_,EOM_};
static	const	u8	SE_Name212[] ={W__,n0_,n8_,n1_,B__,EOM_};
static	const	u8	SE_Name213[] ={W__,n0_,n8_,n8_,EOM_};
static	const	u8	SE_Name214[] ={W__,n0_,n1_,n6_,EOM_};
static	const	u8	SE_Name215[] ={W__,n0_,n1_,n6_,B__,EOM_};
static	const	u8	SE_Name216[] ={W__,n0_,n0_,n3_,EOM_};
static	const	u8	SE_Name217[] ={W__,n1_,n0_,n4_,EOM_};
static	const	u8	SE_Name218[] ={W__,n0_,n1_,n3_,EOM_};
static	const	u8	SE_Name219[] ={W__,n1_,n9_,n6_,EOM_};
static	const	u8	SE_Name220[] ={W__,n0_,n8_,n6_,EOM_};
static	const	u8	SE_Name221[] ={W__,n0_,n0_,n4_,EOM_};
static	const	u8	SE_Name222[] ={W__,n0_,n2_,n5_,EOM_};
static	const	u8	SE_Name223[] ={W__,n0_,n2_,n5_,B__,EOM_};
static	const	u8	SE_Name224[] ={W__,n1_,n5_,n2_,EOM_};
static	const	u8	SE_Name225[] ={W__,n0_,n2_,n6_,EOM_};
static	const	u8	SE_Name226[] ={W__,n1_,n7_,n2_,EOM_};
static	const	u8	SE_Name227[] ={W__,n1_,n7_,n2_,B__,EOM_};
static	const	u8	SE_Name228[] ={W__,n0_,n5_,n3_,EOM_};
static	const	u8	SE_Name229[] ={W__,n0_,n0_,n7_,EOM_};
static	const	u8	SE_Name230[] ={W__,n0_,n9_,n2_,EOM_};
static	const	u8	SE_Name231[] ={W__,n2_,n2_,n1_,EOM_};
static	const	u8	SE_Name232[] ={W__,n2_,n2_,n1_,B__,EOM_};
static	const	u8	SE_Name233[] ={W__,n0_,n5_,n2_,EOM_};
static	const	u8	SE_Name234[] ={W__,n0_,n3_,n6_,EOM_};
static	const	u8	SE_Name235[] ={W__,n0_,n5_,n9_,EOM_};
static	const	u8	SE_Name236[] ={W__,n0_,n5_,n9_,B__,EOM_};
static	const	u8	SE_Name237[] ={W__,n0_,n1_,n0_,EOM_};
static	const	u8	SE_Name238[] ={W__,n0_,n1_,n1_,EOM_};
static	const	u8	SE_Name239[] ={W__,n0_,n1_,n7_,EOM_};
static	const	u8	SE_Name240[] ={W__,n0_,n1_,n9_,EOM_};
static	const	u8	SE_Name241[] ={W__,n0_,n2_,n8_,EOM_};
static	const	u8	SE_Name242[] ={W__,n0_,n1_,n3_,B__,EOM_};
static	const	u8	SE_Name243[] ={W__,n0_,n4_,n4_,EOM_};
static	const	u8	SE_Name244[] ={W__,n0_,n2_,n9_,EOM_};
static	const	u8	SE_Name245[] ={W__,n0_,n5_,n7_,EOM_};
static	const	u8	SE_Name246[] ={W__,n0_,n5_,n6_,EOM_};
static	const	u8	SE_Name247[] ={W__,n2_,n5_,n0_,EOM_};
static	const	u8	SE_Name248[] ={W__,n0_,n3_,n0_,EOM_};
static	const	u8	SE_Name249[] ={W__,n0_,n3_,n9_,EOM_};
static	const	u8	SE_Name250[] ={W__,n0_,n5_,n4_,EOM_};
static	const	u8	SE_Name251[] ={W__,n0_,n7_,n7_,EOM_};
static	const	u8	SE_Name252[] ={W__,n0_,n2_,n0_,EOM_};
static	const	u8	SE_Name253[] ={W__,n0_,n8_,n2_,EOM_};
static	const	u8	SE_Name254[] ={W__,n0_,n4_,n7_,EOM_};
static	const	u8	SE_Name255[] ={W__,n1_,n9_,n5_,EOM_};
static	const	u8	SE_Name256[] ={W__,n0_,n0_,n6_,EOM_};
static	const	u8	SE_Name257[] ={W__,n0_,n9_,n1_,EOM_};
static	const	u8	SE_Name258[] ={W__,n1_,n4_,n6_,EOM_};
static	const	u8	SE_Name259[] ={W__,n1_,n2_,n0_,EOM_};
static	const	u8	SE_Name260[] ={W__,n1_,n5_,n3_,EOM_};
static	const	u8	SE_Name261[] ={W__,n0_,n7_,n1_,B__,EOM_};
static	const	u8	SE_Name262[] ={W__,n0_,n7_,n1_,EOM_};
static	const	u8	SE_Name263[] ={W__,n1_,n0_,n3_,EOM_};
static	const	u8	SE_Name264[] ={W__,n0_,n6_,n2_,EOM_};
static	const	u8	SE_Name265[] ={W__,n0_,n6_,n2_,B__,EOM_};
static	const	u8	SE_Name266[] ={W__,n0_,n4_,n8_,EOM_};
static	const	u8	SE_Name267[] ={W__,n1_,n8_,n7_,EOM_};
static	const	u8	SE_Name268[] ={W__,n1_,n1_,n8_,EOM_};
static	const	u8	SE_Name269[] ={W__,n1_,n5_,n5_,EOM_};
static	const	u8	SE_Name270[] ={W__,n1_,n2_,n2_,EOM_};
static	const	u8	SE_Name271[] ={W__,n0_,n6_,n0_,EOM_};
static	const	u8	SE_Name272[] ={W__,n1_,n8_,n5_,EOM_};
static	const	u8	SE_Name273[] ={W__,n0_,n1_,n4_,EOM_};
static	const	u8	SE_Name274[] ={W__,n0_,n4_,n3_,EOM_};
static	const	u8	SE_Name275[] ={W__,n2_,n0_,n7_,EOM_};
static	const	u8	SE_Name276[] ={W__,n2_,n0_,n7_,B__,EOM_};
static	const	u8	SE_Name277[] ={W__,n2_,n1_,n5_,EOM_};
static	const	u8	SE_Name278[] ={W__,n1_,n0_,n9_,EOM_};
static	const	u8	SE_Name279[] ={W__,n1_,n7_,n3_,EOM_};
static	const	u8	SE_Name280[] ={W__,n2_,n8_,n0_,EOM_};
static	const	u8	SE_Name281[] ={W__,n2_,n0_,n2_,EOM_};
static	const	u8	SE_Name282[] ={W__,n0_,n6_,n0_,B__,EOM_};
static	const	u8	SE_Name283[] ={W__,n0_,n7_,n6_,EOM_};
static	const	u8	SE_Name284[] ={W__,n0_,n8_,n0_,EOM_};
static	const	u8	SE_Name285[] ={W__,n1_,n0_,n0_,EOM_};
static	const	u8	SE_Name286[] ={W__,n1_,n0_,n7_,EOM_};
static	const	u8	SE_Name287[] ={W__,n1_,n6_,n6_,EOM_};
static	const	u8	SE_Name288[] ={W__,n1_,n2_,n9_,EOM_};
static	const	u8	SE_Name289[] ={W__,n1_,n1_,n5_,EOM_};
static	const	u8	SE_Name290[] ={W__,n1_,n1_,n2_,EOM_};
static	const	u8	SE_Name291[] ={W__,n1_,n9_,n7_,EOM_};
static	const	u8	SE_Name292[] ={W__,n1_,n9_,n9_,EOM_};
static	const	u8	SE_Name293[] ={W__,n2_,n3_,n6_,EOM_};
static	const	u8	SE_Name294[] ={W__,n2_,n0_,n4_,EOM_};
static	const	u8	SE_Name295[] ={W__,n2_,n6_,n8_,EOM_};
static	const	u8	SE_Name296[] ={W__,n0_,n7_,n0_,EOM_};
static	const	u8	SE_Name297[] ={W__,n0_,n6_,n3_,EOM_};
static	const	u8	SE_Name298[] ={W__,n1_,n2_,n7_,EOM_};
static	const	u8	SE_Name299[] ={W__,n1_,n7_,n9_,EOM_};
static	const	u8	SE_Name300[] ={W__,n1_,n5_,n1_,EOM_};
static	const	u8	SE_Name301[] ={W__,n2_,n0_,n1_,EOM_};
static	const	u8	SE_Name302[] ={W__,n1_,n6_,n1_,EOM_};
static	const	u8	SE_Name303[] ={W__,n1_,n6_,n1_,B__,EOM_};
static	const	u8	SE_Name304[] ={W__,n2_,n2_,n7_,EOM_};
static	const	u8	SE_Name305[] ={W__,n2_,n2_,n7_,B__,EOM_};
static	const	u8	SE_Name306[] ={W__,n2_,n2_,n6_,EOM_};
static	const	u8	SE_Name307[] ={W__,n2_,n0_,n8_,EOM_};
static	const	u8	SE_Name308[] ={W__,n2_,n1_,n3_,EOM_};
static	const	u8	SE_Name309[] ={W__,n2_,n1_,n3_,B__,EOM_};
static	const	u8	SE_Name310[] ={W__,n2_,n3_,n4_,EOM_};
static	const	u8	SE_Name311[] ={W__,n2_,n6_,n0_,EOM_};
static	const	u8	SE_Name312[] ={W__,n3_,n2_,n8_,EOM_};
static	const	u8	SE_Name313[] ={W__,n3_,n2_,n0_,EOM_};
static	const	u8	SE_Name314[] ={W__,n2_,n5_,n5_,EOM_};
static	const	u8	SE_Name315[] ={W__,n2_,n9_,n1_,EOM_};
static	const	u8	SE_Name316[] ={W__,n0_,n8_,n9_,EOM_};
static	const	u8	SE_Name317[] ={W__,n2_,n3_,n9_,EOM_};
static	const	u8	SE_Name318[] ={W__,n2_,n3_,n0_,EOM_};
static	const	u8	SE_Name319[] ={W__,n2_,n8_,n1_,EOM_};
static	const	u8	SE_Name320[] ={W__,n3_,n2_,n7_,EOM_};
static	const	u8	SE_Name321[] ={W__,n2_,n8_,n7_,EOM_};
static	const	u8	SE_Name322[] ={W__,n2_,n5_,n7_,EOM_};
static	const	u8	SE_Name323[] ={W__,n2_,n5_,n3_,EOM_};
static	const	u8	SE_Name324[] ={W__,n2_,n5_,n8_,EOM_};
static	const	u8	SE_Name325[] ={W__,n3_,n2_,n2_,EOM_};
static	const	u8	SE_Name326[] ={W__,n2_,n9_,n8_,EOM_};
static	const	u8	SE_Name327[] ={W__,n2_,n8_,n7_,B__,EOM_};
static	const	u8	SE_Name328[] ={W__,n1_,n1_,n4_,EOM_};
static	const	u8	SE_Name329[] ={W__,n0_,n6_,n3_,B__,EOM_};

static	const	u8*	const SE_NameTable[]={
SE_Name0,
SE_Name1,
SE_Name2,
SE_Name3,
SE_Name4,
SE_Name5,
SE_Name6,
SE_Name7,
SE_Name8,
SE_Name9,
SE_Name10,
SE_Name11,
SE_Name12,
SE_Name13,
SE_Name14,
SE_Name15,
SE_Name16,
SE_Name17,
SE_Name18,
SE_Name19,
SE_Name20,
SE_Name21,
SE_Name22,
SE_Name23,
SE_Name24,
SE_Name25,
SE_Name26,
SE_Name27,
SE_Name28,
SE_Name29,
SE_Name30,
SE_Name31,
SE_Name32,
SE_Name33,
SE_Name34,
SE_Name35,
SE_Name36,
SE_Name37,
SE_Name38,
SE_Name39,
SE_Name40,
SE_Name41,
SE_Name42,
SE_Name43,
SE_Name44,
SE_Name45,
SE_Name46,
SE_Name47,
SE_Name48,
SE_Name49,
SE_Name50,
SE_Name51,
SE_Name52,
SE_Name53,
SE_Name54,
SE_Name55,
SE_Name56,
SE_Name57,
SE_Name58,
SE_Name59,
SE_Name60,
SE_Name61,
SE_Name62,
SE_Name63,
SE_Name64,
SE_Name65,
SE_Name66,
SE_Name67,
SE_Name68,
SE_Name69,
SE_Name70,
SE_Name71,
SE_Name72,
SE_Name73,
SE_Name74,
SE_Name75,
SE_Name76,
SE_Name77,
SE_Name78,
SE_Name79,
SE_Name80,
SE_Name81,
SE_Name82,
SE_Name83,
SE_Name84,
SE_Name85,
SE_Name86,
SE_Name87,
SE_Name88,
SE_Name89,
SE_Name90,
SE_Name91,
SE_Name92,
SE_Name93,
SE_Name94,
SE_Name95,
SE_Name96,
SE_Name97,
SE_Name98,
SE_Name99,
SE_Name100,
SE_Name101,
SE_Name102,
SE_Name103,
SE_Name104,
SE_Name105,
SE_Name106,
SE_Name107,
SE_Name108,
SE_Name109,
SE_Name110,
SE_Name111,
SE_Name112,
SE_Name113,
SE_Name114,
SE_Name115,
SE_Name116,
SE_Name117,

SE_Name200,
SE_Name201,
SE_Name202,
SE_Name203,
SE_Name204,
SE_Name205,
SE_Name206,
SE_Name207,
SE_Name208,
SE_Name209,
SE_Name210,
SE_Name211,
SE_Name212,
SE_Name213,
SE_Name214,
SE_Name215,
SE_Name216,
SE_Name217,
SE_Name218,
SE_Name219,
SE_Name220,
SE_Name221,
SE_Name222,
SE_Name223,
SE_Name224,
SE_Name225,
SE_Name226,
SE_Name227,
SE_Name228,
SE_Name229,
SE_Name230,
SE_Name231,
SE_Name232,
SE_Name233,
SE_Name234,
SE_Name235,
SE_Name236,
SE_Name237,
SE_Name238,
SE_Name239,
SE_Name240,
SE_Name241,
SE_Name242,
SE_Name243,
SE_Name244,
SE_Name245,
SE_Name246,
SE_Name247,
SE_Name248,
SE_Name249,
SE_Name250,
SE_Name251,
SE_Name252,
SE_Name253,
SE_Name254,
SE_Name255,
SE_Name256,
SE_Name257,
SE_Name258,
SE_Name259,
SE_Name260,
SE_Name261,
SE_Name262,
SE_Name263,
SE_Name264,
SE_Name265,
SE_Name266,
SE_Name267,
SE_Name268,
SE_Name269,
SE_Name270,
SE_Name271,
SE_Name272,
SE_Name273,
SE_Name274,
SE_Name275,
SE_Name276,
SE_Name277,
SE_Name278,
SE_Name279,
SE_Name280,
SE_Name281,
SE_Name282,
SE_Name283,
SE_Name284,
SE_Name285,
SE_Name286,
SE_Name287,
SE_Name288,
SE_Name289,
SE_Name290,
SE_Name291,
SE_Name292,
SE_Name293,
SE_Name294,
SE_Name295,
SE_Name296,
SE_Name297,
SE_Name298,
SE_Name299,
SE_Name300,
SE_Name301,
SE_Name302,
SE_Name303,
SE_Name304,
SE_Name305,
SE_Name306,
SE_Name307,
SE_Name308,
SE_Name309,
SE_Name310,
SE_Name311,
SE_Name312,
SE_Name313,
SE_Name314,
SE_Name315,
SE_Name316,
SE_Name317,
SE_Name318,
SE_Name319,
SE_Name320,
SE_Name321,
SE_Name322,
SE_Name323,
SE_Name324,
SE_Name325,
SE_Name326,
SE_Name327,
SE_Name328,
SE_Name329,
};




