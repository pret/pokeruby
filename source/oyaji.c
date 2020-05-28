/***********************************************************************
**	おやじデータ管理
***********************************************************************/
#include "common.h"
#include "ev_flag.h"
#include "pm_str.h"
#include "kaiwa.h"
#include "kaiwa_code.h"
#include "fld_talk.h"
#include "oyaji.h"
#include "evobjdef.h"				//nohara 01/12/22
//#include "../script/savework.h"		//OBJCHRWORK参照のため
#include "sysflag.h"				//SVWK_START参照のため
#include "syswork.h"
#include "task.h"
#include "script.h"
#include "print.h"
#include "menutool.h"
#include "mus_tool.h"
#include "calctool.h"
#include "oyaji03.h"
#include "message.h"

extern void SongOyajiInit( s16* work, u16 tango, u16 melody );
extern void SongOyajiPlay( s16* work, u8 code );
extern void SongOyajiPicthChange( s16* work );

extern void InitOyajiLegend(void);
extern void ResetOyajiLegend(void);

extern void InitRecycleOyaji(void);	// 2002/02/18 by nakahiro

/*==============================================
==	プロトタイプ
==============================================*/
static void add_oyaji_sing_task(u8 mode);
void SetOBJOyajiType(void);


/***********************************************************************
**	おやじデータ領域初期化（ゲーム開始時）                            **
***********************************************************************/
/*===========================*/
/* シンガーソングおやじ      */
/*===========================*/
static void init_singer(void)
{
	// 初期の会話コード
	static const u16 codes[] = {
		0x1a04,    // おかし
		0x1228,    // だいすき
		0x0a0f,    // おねえさん
		0x1c25,    // まいにち
		0x200e,    // だらだら
		0x1a1a,    // ダイエット
	};
	OYAJIDATA_SINGER *dat = (OYAJIDATA_SINGER *)(Fld.oyaji_work);
	u16 i;

	dat->type = OYAJITYPE_SINGER;
	dat->changed = 0;
	for(i = 0; i < SONG_WORD_MAX; i++){
		dat->word[i] = codes[i];
	}
}
/*===========================*/
/* ナウイおやじ              */
/*===========================*/
static void init_now(void)
{
	OYAJIDATA_NOW *dat = (OYAJIDATA_NOW *)(Fld.oyaji_work);
	dat->type = OYAJITYPE_NOW;
	dat->told = 0;
}
/*===========================*/
/* デンセツおやじ            */
/*===========================*/
static void init_legend(void)
{
	InitOyajiLegend();
}

/*===========================*/
/* メルヘンおやじ            */
/*===========================*/
static void init_marchen(void)
{
	OYAJIDATA_MARCHEN *dat = (OYAJIDATA_MARCHEN *)(Fld.oyaji_work);
	dat->type = OYAJITYPE_MARCHEN;
	dat->cnt = 0;
}

/*==========================================*/
/* リサイクルおやじ 2002/02/18 by nakahiro  */
/*==========================================*/
static void init_recycle(void)
{
	InitRecycleOyaji();
}

/*===========================*/
/* メイン                    */
/*===========================*/
void OyajiInit(void)
{
	u16 id;

	id = (MyData.ID[1] << 8) | MyData.ID[0];
	id %= 10;
	id /= 2;

	switch(id){
	case 0: init_singer(); break;
	case 1: init_now(); break;
	case 2: init_recycle(); break;	// 2002/02/18 by nakahiro
	case 3: init_legend(); break;
	case 4: init_marchen(); break;
	}

	SetOBJOyajiType();	//nohara 01/12/22
}
#ifdef PM_DEBUG
/*===========================*/
/* おやじ変更（デバッグ用）  */
/*===========================*/
void OyajiChange(u8 type)
{
	switch(type){
	case OYAJITYPE_SINGER: init_singer(); break;

	case OYAJITYPE_NOW:
	{
		// 初期化するが、教わった単語は残す
		u8 tmp[NELEMS(Fld.kaiwa_word_flag)];
		u8 i;
		for(i = 0; i < NELEMS(tmp); i++){ tmp[i] = Fld.kaiwa_word_flag[i]; }
		init_now();
		for(i = 0; i < NELEMS(tmp); i++){ Fld.kaiwa_word_flag[i] = tmp[i]; }
	}
	break;

	case OYAJITYPE_RECYCLE:	init_recycle();	break;	// 2002/02/18 by nakahiro
	case OYAJITYPE_LEGEND:	init_legend();	break;
	case OYAJITYPE_MARCHEN: init_marchen(); break;

	}

	SetOBJOyajiType();	//nohara 01/12/22
}
#endif
/***********************************************************************
**	現在ＲＯＭにいるおやじタイプを判定                                **
***********************************************************************/
u8 GetOyajiType(void)
{
	return *(u8*)(Fld.oyaji_work);
}
/***********************************************************************
**	スクリプトとのやりとり                                            **
***********************************************************************/
// タイプ判定
void OyajiScr_GetType(void)
{
	AnswerWork = GetOyajiType();
}
// シンガー：歌詞変更フラグチェック
void OyajiScr_SingerCheck(void)
{
	AnswerWork = ((OYAJIDATA_SINGER *)(Fld.oyaji_work))->changed;
}
// シンガー：歌詞変更
void OyajiScr_SingerDone(void)
{
	OYAJIDATA_SINGER *dat = (OYAJIDATA_SINGER *)(Fld.oyaji_work);
	u16 i;

	PM_strcpy(dat->writer_name, MyData.my_name);
	for(i = 0; i < 4; i++){
		dat->writer_id[i] = MyData.ID[i];
	}
	for(i = 0; i < SONG_WORD_MAX; i++){
		dat->word[i] = dat->new_word[i];
	}
	dat->changed = 1;
}
// シンガー：歌詞をバッファにセット
void OyajiScr_SingerSetWord(void)
{
	OYAJIDATA_SINGER *dat = (OYAJIDATA_SINGER *)(Fld.oyaji_work);
	u16 *word;
	u8 *cp;
	u16 i;

	if(ScriptParameter0 == 0){
		word = dat->word;
	}else{
		word = dat->new_word;
	}

	cp = MsgExpandBuffer;
	for(i = 0; i < 2; i++){
		cp = KaiwaCopyWord(cp, *word++);
		*cp++ = spc_;
		cp = KaiwaCopyWord(cp, *word++);
		*cp++ = CR_;
		cp = KaiwaCopyWord(cp, *word++);

		if(i == 0){
			*cp++ = CTRL_;
			*cp++ = C_CLR_;
		}
	}

//	FieldMsgSetNoSkip(MsgExpandBuffer);
}
// シンガー：歌詞表示タスク登録
void OyajiScr_AddSingTask(void)
{
	add_oyaji_sing_task(ScriptParameter0);
	NMenuTalkWinWrite();
	StopFieldScript();
}
// ナウイ：ことばを教えたかどうかチェック
void OyajiScr_NowCheck(void)
{
	AnswerWork = ((OYAJIDATA_NOW *)(Fld.oyaji_work))->told;
}
// ナウイ：ことばを教わったフラグセット
void OyajiScr_NowDone(void)
{
	((OYAJIDATA_NOW *)(Fld.oyaji_work))->told = 1;
}
// ナウイ：新しく言葉を教わる
void OyajiScr_NowWord(void)
{
	u16 code = NowWordGetUnknown();

	if(code == KAIWA_CODE_BLANK){
		AnswerWork = 0;
	}else{
		KaiwaCopyWord(StrTempBuffer0, code);
		AnswerWork = 1;
	}
}
// メルヘン：新しいセリフがあるかチェック
void OyajiScr_MarchenCheckWord(void)
{
	OYAJIDATA_MARCHEN *dat = (OYAJIDATA_MARCHEN *)(Fld.oyaji_work);
	if(dat->cnt == MARCHEN_WORD_MAX){
		AnswerWork = 0;
		dat->cnt = 0;
	}else{
		AnswerWork = 1;
	}
}
// メルヘン：新しいセリフをバッファにコピー
static void  init_marchen_word(void);

void OyajiScr_MarchenWord(void)
{
	OYAJIDATA_MARCHEN *dat = (OYAJIDATA_MARCHEN *)(Fld.oyaji_work);

	if(dat->cnt == 0){
		init_marchen_word();
	}

	if(dat->word_code[dat->cnt] != KAIWA_CODE_BLANK){
		static const u8 * const subword[] = {
			MeruhenSubWord0, MeruhenSubWord1, MeruhenSubWord2, MeruhenSubWord3,
			MeruhenSubWord4, MeruhenSubWord5, MeruhenSubWord6, MeruhenSubWord7,
		};

		u8 *cp, sub;

		sub = pp_rand() % MARCHEN_SUB_MAX;
		cp = KaiwaCopyWord(MsgExpandBuffer, dat->word_code[dat->cnt]);
		cp = PM_strcpy(cp, MeruhenJoinWord);
		cp = PM_strcpy(cp, subword[sub]);
		PM_strcpy(cp, MeruhenEndWord);

	}else{
		static const u8 * const word[] = {
			MeruhenOriginalWord0, MeruhenOriginalWord1, MeruhenOriginalWord2, MeruhenOriginalWord3,
			MeruhenOriginalWord4, MeruhenOriginalWord5, MeruhenOriginalWord6, MeruhenOriginalWord7,
		};

		PM_strcpy(MsgExpandBuffer, word[dat->exword_no[dat->ex_cnt++]]);
	}

	// 1/10の確率で途中終了する
	if(pp_rand()%10 == 0){
		dat->cnt = MARCHEN_WORD_MAX;
	}else{
		dat->cnt++;
	}
	AnswerWork = 1;
}
static void init_marchen_word(void)
{
	OYAJIDATA_MARCHEN *dat = (OYAJIDATA_MARCHEN *)(Fld.oyaji_work);
	u16 i, tmp, total, r;
	s16 cnt;
	u16 category_tbl[][2] = {
		{  KWC_POKEMON,  0 },  // ポケモン
		{  KWC_SEIKATU,  0 },  // せいかつ
		{  KWC_SYUMI,    0 },  // しゅみ
		{  KWC_WAZA1,    0 },  // わざ
		{  KWC_WAZA2,    0 },  // わざ２
		{  KWC_POKEMON2, 0 },  // ポケモン２
	};

	// 特殊コード出現順をシャッフルしておく
	for(i = 0; i < MARCHEN_EXWORD_MAX; i++){
		dat->exword_no[i] = i;
	}
	for(i = 0; i < MARCHEN_EXWORD_MAX; i++){
		r = pp_rand() % (i+1);
		tmp = dat->exword_no[i];
		dat->exword_no[i] = dat->exword_no[r];
		dat->exword_no[r] = tmp;
	}

	// 使用カテゴリのうち、使える単語数をｶｳﾝﾄしておく
	total = 0;
	for(i = 0; i < NELEMS(category_tbl); i++)
	{
		category_tbl[i][1] = KaiwaEnableWordCnt(category_tbl[i][0]);
		total += category_tbl[i][1];
	}
	dat->ex_cnt = 0;

	tmp = 0;
	for(i = 0; i < MARCHEN_WORD_MAX; i++){
		r = pp_rand() % 10;
		if(r < 3 && tmp < MARCHEN_EXWORD_MAX)
		{
			dat->word_code[i] = KAIWA_CODE_BLANK;  // 特殊ﾒｯｾｰｼﾞとして扱う
			tmp++;
		}
		else
		{

			cnt = pp_rand() % total;
			for(r = 0; i < NELEMS(category_tbl); r++)
			{
				cnt -= category_tbl[r][1];
				if(cnt <= 0){
					break;
				}
			}
			if(r == NELEMS(category_tbl)){ r = 0; } // あり得ないけど一応

			dat->word_code[i] = KaiwaGetRandomKnownWord(category_tbl[r][0]);
//			dat->word_sub[i] = pp_rand() % MARCHEN_SUB_MAX;
		}
	}

}
/***********************************************************************
**	通信交換終了直後の処理                                            **
***********************************************************************/
/*===========================*/
/* シンガー                  */
/*===========================*/
static void reset_singer(void)
{
	OYAJIDATA_SINGER *dat = (OYAJIDATA_SINGER *)(Fld.oyaji_work);
	dat->changed = 0;
}
/*===========================*/
/* ナウい                    */
/*===========================*/
static void reset_now(void)
{
	OYAJIDATA_NOW *dat = (OYAJIDATA_NOW *)(Fld.oyaji_work);
	dat->told = 0;
}
/*===========================*/
/* リサイクル                */
/*===========================*/
static void reset_recycle(void)
{
	ResetRGGiveFlag();
}
/*===========================*/
/* デンセツ                  */
/*===========================*/
static void reset_legend(void)
{
	ResetOyajiLegend();
}
/*===========================*/
/* メイン                    */
/*===========================*/
void OyajiReset(void)
{
	switch(GetOyajiType()){
	case OYAJITYPE_SINGER: reset_singer(); break;
	case OYAJITYPE_NOW: reset_now(); break;
	case OYAJITYPE_LEGEND: reset_legend(); break;
	case OYAJITYPE_RECYCLE: reset_recycle(); break;
	case OYAJITYPE_MARCHEN: break;
	}

	SetOBJOyajiType();	//nohara 01/12/22
}
/***********************************************************************
**	シンガーソングおやじの歌表示タスク                                **
***********************************************************************/
/* 単語コード→メロディナンバー変換マクロ（てきとう）*/
#define CODE_TO_MERODY(code)    (((code)&3)+(((code)>>3)&1))
/* 進捗度定義 */
enum SING_TASK_PROG {
	SING_INIT_ALL = 0,
	SING_FADEOUT_WAIT,
	SING_INIT_WORD,
	SING_PUT_CHAR,
	SING_PUT_WAIT,
	SING_PUTCHAR_WAIT,
};
/* ワーク定義 */
enum SING_TASK_WORK {
	STW_PROG = 0,
	STW_SUBPROG,
	STW_TIMER,
	STW_COUNT,
	STW_WORD_COUNT,
	STW_MODE,

	// ここから下はサウンド側で使用
	STW_SOUNDWORK,
};
static void oyaji_sing_task(u8 task_no);
//========================================
// 歌詞表示タスクセット
// mode  (0:本決まり  1:試し聴き)
//========================================
static void add_oyaji_sing_task(u8 mode)
{
	u8 no;
	no = AddTask( oyaji_sing_task, 80 );
	TaskTable[no].work[STW_MODE] = mode;
}
//========================================
// 歌詞表示タスク
//========================================
static void oyaji_sing_task(u8 task_no)
{
	extern TALK_WIN *pWin;
	TASK_TABLE *task = &TaskTable[task_no];

	switch(task->work[STW_PROG]){
	// 全体初期化
	case SING_INIT_ALL:
		{
			OyajiScr_SingerSetWord();
			MsgControlInit(pWin, FIELD_MENU_TYPE);
			TalkMsgSet(pWin, MsgExpandBuffer, 2, 4, 15);
			task->work[STW_SUBPROG] = 0;
			task->work[STW_TIMER] = 0;
			task->work[STW_COUNT] = 0;
			task->work[STW_WORD_COUNT] = 0;

			MusicFadeOutPause(4);
			task->work[STW_PROG] = SING_FADEOUT_WAIT;
		}
		break;

	// ＢＧＭフェードアウト待ち
	case SING_FADEOUT_WAIT:
		if(MusicFadeOutPauseWait()){
			task->work[STW_PROG] = SING_INIT_WORD;
		}
		break;

	// 単語ごとの初期化
	case SING_INIT_WORD:
		{
			OYAJIDATA_SINGER *dat = (OYAJIDATA_SINGER *)(Fld.oyaji_work);
			u8 *cp = MsgExpandBuffer + task->work[STW_COUNT];
			u16 word_len = 0;
			static u16 merody_num = 0;
			while(*cp != spc_ && *cp != CR_ && *cp != CTRL_ && *cp != EOM_){
				cp++;
				word_len++;
			}
			if(task->work[STW_MODE]==0){
				merody_num = CODE_TO_MERODY(dat->word[task->work[STW_WORD_COUNT]]);
			}else{
				merody_num = CODE_TO_MERODY(dat->new_word[task->work[STW_WORD_COUNT]]);
			}
			// 文字数・単語コードよりメロディ決定
			SongOyajiInit( task->work, word_len, merody_num );
		}
		task->work[STW_WORD_COUNT]++;

		if(task->work[STW_TIMER] == 0){
			task->work[STW_PROG] = SING_PUT_CHAR;
			task->work[STW_SUBPROG] = 0;
		}else{
			task->work[STW_PROG] = SING_PUTCHAR_WAIT;
			task->work[STW_SUBPROG] = 0;
		}
		break;

	case SING_PUTCHAR_WAIT:
		if(task->work[STW_TIMER]){
			task->work[STW_TIMER]--;
		}else{
			task->work[STW_PROG] = SING_PUT_CHAR;
		}
		break;

	// １文字表示
	case SING_PUT_CHAR:
		// 終端ならスクリプト再開
		if(MsgExpandBuffer[task->work[STW_COUNT]] == EOM_){
			MusicFadeInContinue(6);
			ContinueFieldScript();
			DelTask(task_no);
			break;
		}
		// スペース、改行、フォント制御コマンドで単語ごとの初期化へ
		if(MsgExpandBuffer[task->work[STW_COUNT]] == spc_){
			TalkMsgPutc(pWin);
			task->work[STW_COUNT]++;
			task->work[STW_PROG] = SING_INIT_WORD;
			task->work[STW_TIMER] = 0;
			break;
		}
		if(MsgExpandBuffer[task->work[STW_COUNT]] == CR_){
			task->work[STW_COUNT]++;
			task->work[STW_PROG] = SING_INIT_WORD;
			task->work[STW_TIMER] = 0;
			break;
		}
		if(MsgExpandBuffer[task->work[STW_COUNT]] == CTRL_){
			task->work[STW_COUNT] += 2;
			task->work[STW_PROG] = SING_INIT_WORD;
			task->work[STW_TIMER] = 8;
			break;
		}

		switch(task->work[STW_SUBPROG]){
		case 0:  // 文字表示
			TalkMsgPutc(pWin);
			task->work[STW_SUBPROG]++;
			break;
		case 1:  // 音を鳴らす
			SongOyajiPlay( task->work, MsgExpandBuffer[ task->work[STW_COUNT] ] );
			task->work[STW_SUBPROG]++;
			break;
		case 2:  // ピッチ変更
			SongOyajiPicthChange( task->work );
			task->work[STW_COUNT]++;
			task->work[STW_SUBPROG] = 0;
			task->work[STW_TIMER] = 16;	//8; // 文字表示ウェイト（調節する）
			task->work[STW_PROG] = SING_PUT_WAIT;
			break;
		}
		break;

	// １文字表示後ウェイト
	case SING_PUT_WAIT:
		if(--(task->work[STW_TIMER]) == 0){
			task->work[STW_PROG] = SING_PUT_CHAR;
		}
		break;

	}

}

/*==============================================================*/
/* ワーク参照型OBJにおやじのタイプを代入する                    */
/*==============================================================*/
void SetOBJOyajiType(void)
{
	//Fld.EventWork[OBJCHRWORK1-SVWK_START] = ( OYAJI1+GetOyajiType() );
	SetEventWorkValue( OBJCHRWORK1, ( OYAJI1+GetOyajiType() ) );
}

