/***********************************************************************
**	簡易会話データ
***********************************************************************/
#include "kaiwa_com.h"
#include "kaiwa.dat"
#include "kaiwa.h"
#include "poketool.h"
#include "tv_def.h"
#include "script.h"
#include "pm_str.h"
#include "fld_talk.h"
#include "zukan.h"
#include "sysflag.h"
#include "monsno.def"
#include "wazano.def"


/*====================================================================*/
/* プロトタイプ                                                       */
/*====================================================================*/
static u16 get_known_poke_code(void);
static u8 is_unknown_code(u16 code);

/*====================================================================*/
/* マクロ                                                             */
/*====================================================================*/
#define IS_EX_CATEGORY(c)   ((c)==KWC_POKEMON||(c)==KWC_POKEMON2||(c)==KWC_WAZA1||(c)==KWC_WAZA2)

/*====================================================================*/
/* カテゴリ名                                                         */
/*====================================================================*/
static const u8 kwc_pokemon[] = {  PO_, KE_, MO_,  N_,EOM_, };  // ポケモン
static const u8 kwc_trainer[] = {  TO_, RE_,bou_, NA_,bou_,EOM_, };  // トレーナー
static const u8 kwc_status[] = {  SU_, TE_,bou_, TA_, SU_,EOM_, };  // ステータス
static const u8 kwc_battle[] = {  BA_, TO_, RU_,EOM_, };  // バトル
static const u8 kwc_aisatu[] = {   a_,  i_, sa_, tu_,EOM_, };  // あいさつ
static const u8 kwc_hito[] = {  hi_, to_,EOM_, };  // ひと
static const u8 kwc_koe[] = {  ko_,  e_,EOM_, };  // こえ
static const u8 kwc_kaiwa[] = {  ka_,  i_, wa_,EOM_, };  // かいわ
static const u8 kwc_musubi[] = {  mu_, su_, bi_,EOM_, };  // むすび
static const u8 kwc_kimoti[] = {  ki_, mo_, ti_,EOM_, };  // きもち
static const u8 kwc_joutai[] = {  zi_,yyo_,  u_, ta_,  i_,EOM_, };  // じょうたい
static const u8 kwc_koudou[] = {  ko_,  u_, do_,  u_,EOM_, };  // こうどう
static const u8 kwc_seikatu[] = {  se_,  i_, ka_, tu_,EOM_, };  // せいかつ
static const u8 kwc_syumi[] = {  si_,yyu_, mi_,EOM_, };  // しゅみ
static const u8 kwc_jikan[] = {  zi_, ka_,  n_,EOM_, };  // じかん
static const u8 kwc_arekore[] = {   a_, re_, ko_, re_,EOM_, };  // あれこれ
static const u8 kwc_kurikaesi[] = {  ku_, ri_, ka_,  e_, si_,EOM_, };  // くりかえし
static const u8 kwc_event[] = {   I_, BE_,  N_, TO_,EOM_, };  // イベント
static const u8 kwc_waza1[] = {  wa_, za_, n1_,EOM_, };  // わざ１
static const u8 kwc_waza2[] = {  wa_, za_, n2_,EOM_, };  // わざ２
static const u8 kwc_now[] = {  NA_,  U_,  I_, ko_, to_, ba_,EOM_, };  // ナウイことば
static const u8 kwc_pokemon2[] = {  PO_, KE_, MO_,  N_, n2_,EOM_, };  // ポケモン２

static const u8 * const kwc_tbl[] = {
kwc_pokemon,
kwc_trainer,
kwc_status,
kwc_battle,
kwc_aisatu,
kwc_hito,
kwc_koe,
kwc_kaiwa,
kwc_musubi,
kwc_kimoti,
kwc_joutai,
kwc_koudou,
kwc_seikatu,
kwc_syumi,
kwc_jikan,
kwc_arekore,
kwc_kurikaesi,
kwc_event,
kwc_waza1,
kwc_waza2,
kwc_now,
kwc_pokemon2,
};
extern	const	u8	WazaNameData[][8];

static const u8 UnknownCode[] = { hate_, hate_, hate_, EOM_ };

/**********************************************************************
**	カテゴリ名をバッファにコピー
**
**	dst       コピー先バッファ
**	category  カテゴリナンバー
**  spc_len   != 0 なら、指定の長さだけ空白で埋める
**
**  return:   コピー後の EOM_ アドレス
**
**********************************************************************/
u8* KaiwaCopyCategoryName(u8 *dst, u8 category, u16 spc_len)
{
	u16  len;
	u8 *cp;

	cp = PM_strcpy(dst, kwc_tbl[category]);
	len = (u16)(cp - dst);
	while(len < spc_len){
		*cp++ = spc_;
		len++;
	}
	*cp = EOM_;
	return cp;
}
/**********************************************************************
**	指定されたカテゴリが使えるかどうかフラグチェック
**********************************************************************/
u8 KaiwaIsEnableCategory(u8 category)
{
	switch(category){
	case KWC_NOW:
		return EventFlagCheck(SYS_NOW_OYAJI_MEET);

	case KWC_EVENT:
	case KWC_WAZA1:
	case KWC_WAZA2:
		return EventFlagCheck(SYS_GAME_CLEAR);

	case KWC_POKEMON2:
		return KaiwaPoke2CategoryCheck();

	default:
		return 1;
	}
}
/**********************************************************************
**	指定された単語が使えるかどうかフラグチェック
**********************************************************************/
static u8 is_enable_word(u8 category_no, u16 word_no)
{
	switch(category_no){
	case KWC_NOW:
		if(KaiwaWork->hidden_category_flg[category_no-KWC_BORDER] == 0)
		{
			return 0;
		}
		return NowWordFlagCheck(word_no);

	case KWC_POKEMON:
		return ZukanCheck(PokeMonsNo2ZukanNoGet(word_no), Z_SEE_CHK);

	case KWC_EVENT:
	case KWC_WAZA1:
	case KWC_WAZA2:
		if(KaiwaWork->hidden_category_flg[category_no-KWC_BORDER] == 0)
		{
			return 0;
		}
		break;

	case KWC_POKEMON2:
		return KaiwaPoke2CategoryCheck();

	default:
		break;
	}
	return 1;
}
/**********************************************************************
**	指定されたカテゴリ内で有効な単語数を返す
**	（カテゴリ自体が無効なら０）
**********************************************************************/
u16 KaiwaEnableWordCnt(u8 category)
{
	switch(category){
	case KWC_POKEMON:
		return ZukanHouenTotal(Z_SEE_CHK);

	case KWC_NOW:
		return KnownNowWordCnt();

	default:
		if(KaiwaIsEnableCategory(category))
		{
			return CategoryWordCntTbl[category];
		}
		else
		{
			return 0;
		}
	}
}

/**********************************************************************
**	単語ソート用テーブルを初期化
**********************************************************************/
void KaiwaInitWordSort(void)
{
	u16 i, p, j, begin, end;
	u16 category, word_len, code;

	for(i = 0; i < KWC_MAX; i++){
		KaiwaWork->charsort_work[i] = 0;
	}

	for(i = 0; i < KAIWA_INITIAL_CNT; i++){
		begin = KaiwaCharSortIndexTbl[i];
		end = KaiwaCharSortIndexTbl[i+1];
		p = begin;
		j = 0;
		KaiwaWork->initial_word_cnt[i] = 0;
		while(p < end){
			category = KaiwaCharSortTbl[p++];

			// 重複あり
			while(category == 0xff){
				unsigned char dup_cnt, find_enable = 0;
				dup_cnt = KaiwaCharSortTbl[p++];
				while(dup_cnt--){
					category = KaiwaCharSortTbl[p++];
					if(!find_enable){
						if(IS_EX_CATEGORY(category)){
							const u16 *tbl;
							tbl = (const u16*)(KaiwaWordTbl[category]);
							code = tbl[KaiwaWork->charsort_work[category]];
						}else{
							code = KaiwaWork->charsort_work[category];
						}
						if(is_enable_word(category, code)){
							KaiwaWork->charsort_tbl[i][j++] = MAKE_CODE(category,code);
							KaiwaWork->initial_word_cnt[i]++;
							find_enable = 1;
						}
					}
					KaiwaWork->charsort_work[category]++;
				}
				if(p >= end){ break; }
				category = KaiwaCharSortTbl[p++];
			}
			if(p >= end){ break; }

			word_len = KaiwaCharSortTbl[p++];

			if(IS_EX_CATEGORY(category)){
				const u16 *tbl;
				tbl = (const u16*)(KaiwaWordTbl[category]);
				while(word_len--){
					if(is_enable_word(category, tbl[KaiwaWork->charsort_work[category]])){
						code = MAKE_CODE(category, tbl[KaiwaWork->charsort_work[category]]);
						KaiwaWork->charsort_tbl[i][j++] = code;
						KaiwaWork->initial_word_cnt[i]++;
					}
					KaiwaWork->charsort_work[category]++;
				}
			}else{
				code = MAKE_CODE(category, KaiwaWork->charsort_work[category]);
				while(word_len--){
					if(is_enable_word(category, KaiwaWork->charsort_work[category])){
						KaiwaWork->charsort_tbl[i][j++] = code;
						KaiwaWork->initial_word_cnt[i]++;
					}
					KaiwaWork->charsort_work[category]++;
					code++;
				}
			}
		}
	}
}
/**********************************************************************
**	単語ごとの文字列ポインタテーブル初期化
**********************************************************************/
void KaiwaInitWordPointerTbl(void)
{
	const u8 *cp;
	u16 i, cnt;

	for(i = 0; i < KWC_MAX; i++){
		if(!IS_EX_CATEGORY(i)){
			cp = KaiwaWordTbl[i];
			cnt = 0;
			while(*cp != EOM_){
				KaiwaWork->word_tbl[i][cnt] = cp;
				while(*cp != EOM_){ cp++; }
				cp++;
				cnt++;
			}
		}
	}
}
/**********************************************************************
**	単語選択ウィンドウのデータ配列を初期化
**********************************************************************/
void KaiwaInitWordWindowData(void)
{
	// カテゴリモード
	if(KaiwaWork->select_mode == KAIWA_SEL_CATEGORY){
		u16 category, i, j, c;
		category = KaiwaWork->select_group_num;
		KaiwaWork->category_word_cnt[category] = 0;
		i = j = 0;
		if(IS_EX_CATEGORY(category)){
			const u16 *tbl = (u16*)KaiwaWordTbl[category];
			for(c = 0; c < CategoryWordCntTbl[KaiwaWork->select_group_num]; c++)
			{
				if(is_enable_word(category, tbl[c]))
				{
					KaiwaWork->word_code_tbl[i][j] = MAKE_CODE(category, tbl[c]);
					KaiwaWork->category_word_cnt[category]++;
					if(++j > 2){
						j = 0;
						i++;
					}
				}
			}
		}else{
			for(c = 0; c < CategoryWordCntTbl[KaiwaWork->select_group_num]; c++)
			{
				if(is_enable_word(category, c))
				{
					KaiwaWork->word_code_tbl[i][j] = MAKE_CODE(category, c);
					KaiwaWork->category_word_cnt[category]++;
					if(++j > 2){
						j = 0;
						i++;
					}
				}
			}
		}
	// あいうえおモード
	}else{
		u16 initial, i, j, c;

		initial = KaiwaWork->select_group_num;
		i = j = 0;
		for(c = 0; c < KaiwaWork->initial_word_cnt[initial]; c++)
		{
			KaiwaWork->word_code_tbl[i][j] = KaiwaWork->charsort_tbl[initial][c];
			if(++j > 2)
			{
				j = 0;
				i++;
			}
		}
	}
}
/**********************************************************************
**	簡易会話コード→単語文字列に変換
**
**	dst   文字列用アドレス
**	code  会話コード
**  space_len   指定の長さまで空白で埋める
**
**  戻り値  EOM_アドレス
**
**********************************************************************/
u8 * KaiwaCodeToWord(u8 *dst, u16 code, u16 space_len)
{
	u16 category, word, len;
	u8 *cp;

	if(is_unknown_code(code)){
		return PM_strcpy(dst, UnknownCode);
	}

	if(code == KAIWA_CODE_BLANK){
		*dst = EOM_;
		return dst;
	}

	category = CODE_TO_CATEGORY(code);
	word = CODE_TO_WORD(code);
	switch(category){
	case KWC_POKEMON:
	case KWC_POKEMON2:
		cp = PM_strcpy(dst, PokeNameData[word]);
		break;

	case KWC_WAZA1:
	case KWC_WAZA2:
		cp = PM_strcpy(dst, WazaNameData[word]);
		break;

	default:
		cp = PM_strcpy(dst, KaiwaWork->word_tbl[category][word]);
		break;
	}

	len = (u16)(cp - dst);
	while(len < space_len){
		*cp++ = spc_;
		len++;
	}
	*cp = EOM_;
	return cp;
}

/**********************************************************************
**	簡易会話コード→単語の文字数カウント
**
**	code    会話コード
**  戻り値  文字数
**
**********************************************************************/
u16 KaiwaCodeLen(u16 code)
{
	u16 category, word, len;
	const u8 *cp;

	if(is_unknown_code(code)){
		return PM_strlen(UnknownCode);
	}

	if(code == KAIWA_CODE_BLANK){
		return 0;
	}

	category = CODE_TO_CATEGORY(code);
	word = CODE_TO_WORD(code);
	switch(category){
	case KWC_POKEMON:
	case KWC_POKEMON2:
		cp = PokeNameData[word];
		break;

	case KWC_WAZA1:
	case KWC_WAZA2:
		cp = WazaNameData[word];
		break;

	default:
		cp = KaiwaWork->word_tbl[category][word];
		break;
	}

	for(len = 0; *cp != EOM_; cp++, len++);

	return len;
}
/**********************************************************************
**	ゲーム内で扱える簡易会話コードか？
**（未来ﾊﾞｰｼﾞｮﾝとの通信・不正操作対応）
**
**	code    会話コード
**  戻り値  1:扱えません  0:扱えます
**
**********************************************************************/
static u8 is_unknown_code(u16 code)
{
	const u16 *tbl;
	u16 category, word, i;

	if(code == KAIWA_CODE_BLANK){
		return 0;
	}

	category = CODE_TO_CATEGORY(code);
	word = CODE_TO_WORD(code);

	if(category >= KWC_MAX) return 1;

	switch(category){
	case KWC_POKEMON:
	case KWC_POKEMON2:
	case KWC_WAZA1:
	case KWC_WAZA2:
		tbl = (const u16*)(KaiwaWordTbl[category]);
		for(i = 0; i < CategoryWordCntTbl[category]; i++)
		{
			if(word == tbl[i]){
				return 0;
			}
		}
		return 1;

	default:
		if(word >= CategoryWordCntTbl[category]){
			return 1;
		}
		break;
	}

	return 0;
}

/*====================================================================*/
/*  外部からの会話コード→文字列変換                                  */
/*====================================================================*/
// １単語
u8 *KaiwaCopyWord(u8 *dst, u16 code)
{
	u16 category, word;
	const u8 *cp;

	if(is_unknown_code(code)){
		return PM_strcpy(dst, UnknownCode);
	}

	if(code == KAIWA_CODE_BLANK){
		*dst = EOM_;
		return dst;
	}

	category = CODE_TO_CATEGORY(code);
	word = CODE_TO_WORD(code);

	switch(category){
	case KWC_POKEMON:
	case KWC_POKEMON2:
		dst = PM_strcpy(dst, PokeNameData[word]);
		break;

	case KWC_WAZA1:
	case KWC_WAZA2:
		dst = PM_strcpy(dst, WazaNameData[word]);
		break;

	default:
		cp = KaiwaWordTbl[category];
		while(word--){
			while(*cp++ != EOM_);
		}
		dst = PM_strcpy(dst, cp);
		break;
	}

	*dst = EOM_;
	return dst;

}
// １文章
u8* KaiwaCopySentence(u8 *dst, u16 *code, u16 rows, u16 cols)
{
	u16 x, y;

	rows--;
	for(y = 0; y < cols; y++){
		for(x = 0; x < rows; x++){
			dst = KaiwaCopyWord(dst, *code);
			if(*code != KAIWA_CODE_BLANK){
				*dst++ = spc_;
			}
			code++;
		}
		dst = KaiwaCopyWord(dst, *code++);
		*dst++ = CR_;
	}
	*(--dst) = EOM_;
	return dst;
}
// 文字列長の取得
u16 KaiwaWordLenGet(u16 code)
{
	const u8 *cp;
	u16 len, word, category;

	if(code == KAIWA_CODE_BLANK){
		return 0;
	}

	category = CODE_TO_CATEGORY(code);
	word = CODE_TO_WORD(code);

	switch(category){
	case KWC_POKEMON:
	case KWC_POKEMON2:
		cp = PokeNameData[word];
		break;

	case KWC_WAZA1:
	case KWC_WAZA2:
		cp = WazaNameData[word];
		break;

	default:
		cp = KaiwaWordTbl[category];
		while(word--){
			while(*cp++ != EOM_);
		}
		break;
	}

	for(len = 0; *cp != EOM_; cp++, len++);

	return len;
}
/***********************************************************************
**	会話コードを文字列化した時に、指定文字数をオーバーする行があるか？
**	code   会話コード先頭
**	rows   列数
**	cols   行数
**	max    １行文字数マックス
**
**	ret:  0:ｵｰﾊﾞｰしない  1:ｵｰﾊﾞｰする
***********************************************************************/
u8 KaiwaLineOverCheck(const u16 *code, u8 rows, u8 cols, u16 max)
{
	u16 len;
	u8  x, y;

	for(y = 0; y < cols; y++){
		len = 0;
		for(x = 0; x < rows; x++){
			len += KaiwaWordLenGet(*code++);
		}
		if(len > max)
		{
			return 1;
		}
	}
	return 0;
}
/*====================================================================*/
/*  ＴＶデータ用会話コード格納エリアを初期化                          */
/*====================================================================*/
void KaiwaTVWorkInit(u8 mode, u16 num)
{
	u16 *addr, cnt;

	switch(mode){
	case KAIWA_MODE_HAGAKI:
		cnt = 6;
		addr = ((TV_Letter_Work*)(&(Fld.tv_event[num])))->easytalk;
		break;

	case KAIWA_MODE_INTERVIEW:
		cnt = 2;
		addr = &(((TV_Club_Work*)(&(Fld.tv_event[num])))->easytalk_no[0]);
		break;

	case KAIWA_MODE_GYMREADER:
		cnt = 1;
		addr = &(((TV_GYM_Work*)(&(Fld.tv_event[num])))->easytalk_no);
		break;

	default:
		return;
	}

	while(cnt--){
		*addr++ = KAIWA_CODE_BLANK;
	}
}
void KaiwaWorkInit(u16 *addr, u16 size)
{
	while(size--){
		*addr++ = KAIWA_CODE_BLANK;
	}
}

/*====================================================================*/
/*  指定されたカテゴリの単語コードを１つランダムに返す                */
/*====================================================================*/
u16 KaiwaGetRandomWord(u16 category)
{
	u16 word;

	word = pp_rand() % CategoryWordCntTbl[category];

	if(IS_EX_CATEGORY(category))
	{
		const u16 *tbl;

		tbl = (const u16*)(KaiwaWordTbl[category]);
		word = tbl[word];
	}

	return MAKE_CODE(category, word);
}
/*====================================================================*/
/*  指定されたカテゴリの中から、入力で使える単語をランダムに返す      */
/*====================================================================*/
u16 KaiwaGetRandomKnownWord(u16 category)
{
	if(KaiwaIsEnableCategory(category) == 0){
		return KAIWA_CODE_BLANK;
	}

	switch(category){
	case KWC_NOW:
		return NowWordGetKnown();

	case KWC_POKEMON:
		return get_known_poke_code();

	default:
		return KaiwaGetRandomWord(category);
	}
}
/*====================================================================*/
/*  スクリプトとのやりとり                                            */
/*====================================================================*/
/*
	自己紹介、戦闘開始、勝ち、負けメッセージを
	メッセージ用バッファにコピー
*/
void KaiwaCodeToMsgBuffer(void)
{
	u16 *code_p, col, row;
	u8 *cp;

	switch(ScriptParameter0){
	case KAIWA_MODE_SELF:
		code_p = Fld.kaiwa_self;
		col = 2, row = 2;
		break;

	case KAIWA_MODE_BATTLE_START:
		code_p = Fld.kaiwa_battle;
		if(KaiwaLineOverCheck(code_p, 3, 2, 20)==0){
			col = 3; row = 2;
		}else{
			col = 2; row = 3;
		}
		break;

	case KAIWA_MODE_BATTLE_WON:
		code_p = Fld.kaiwa_win;
		col = 3; row = 2;
		break;

	case KAIWA_MODE_BATTLE_LOST:
		code_p = Fld.kaiwa_lose;
		col = 3; row = 2;
		break;

	default:
		return;
	}

	cp = KaiwaCopySentence(MsgExpandBuffer, code_p, col, row);
//	*(cp++) = NORMAL_WAIT_;
//	*cp = EOM_;
	FieldMsgSetNoSkip(MsgExpandBuffer);
}
/***********************************************************************
**	単語をランダムにバッファコピー
***********************************************************************/
void KaiwaCopyRandomWord(void)
{
	u16 r;

	r = ((pp_rand() & 1)? KWC_SYUMI : KWC_SEIKATU);
	r = KaiwaGetRandomKnownWord(r);
	KaiwaCopyWord(StrTempBuffer1, r);
}



/*====================================================================*/
/*  隠し単語・カテゴリに関するセーブ領域を操作する                    */
/*                                                                    */
/*                                                                    */
/*                                                                    */
/*====================================================================*/
#define NOW_BYTE_OFS         (0)   // kaiwa_word_flag[8]の何バイト目から使うか？
#define NOW_WORD_MAX         (33)  // 単語数最大


#define POKE2_BYTE_OFS       (7)   // kaiwa_word_flag[8]の何バイト目から使うか？

/*===============================================*/
/*  ナウいことばフラグチェック                   */
/*===============================================*/
u8 NowWordFlagCheck(u8 word_no)
{
	u8 byte, bit;

	byte = word_no / 8;
	bit = word_no & 7;

	return (Fld.kaiwa_word_flag[byte] & (1 << bit)) != 0;
}
/*===============================================*/
/*  ナウいことばフラグセット                     */
/*===============================================*/
void NowWordFlagSet(u8 word_no)
{
	u8 byte, bit;

	if(word_no < NOW_WORD_MAX){

		byte = word_no / 8;
		bit = word_no & 7;

		Fld.kaiwa_word_flag[byte] |= (1 << bit);
	}
}
/*===============================================*/
/*  覚えているナウいことばの総数                 */
/*===============================================*/
u8 KnownNowWordCnt(void)
{
	u8 i, cnt;

	for(i = 0, cnt = 0; i <NOW_WORD_MAX; i++)
	{
		if(NowWordFlagCheck(i)){ cnt++; }
	}
	return cnt;
}
/*===============================================*/
/*  覚えていないナウイ言葉をランダムに返す       */
/*（全部覚えているときは KAIWA_CODE_BLANK）      */
/*===============================================*/
u16 NowWordGetUnknown(void)
{
	u16 no, cnt, i;

	cnt = KnownNowWordCnt();
	if(cnt == NOW_WORD_MAX){ return KAIWA_CODE_BLANK; }

	no = pp_rand() % (NOW_WORD_MAX - cnt);
	for(i = 0; i < NOW_WORD_MAX; i++){
		if(!NowWordFlagCheck(i)){
			if(no == 0){
				NowWordFlagSet(i);
				return MAKE_CODE(KWC_NOW, i);
			}
			no--;
		}
	}
	return KAIWA_CODE_BLANK;
}
/*===============================================*/
/*  覚えているナウイ言葉をランダムに返す         */
/*（覚えていないときは KAIWA_CODE_BLANK)         */
/*===============================================*/
u16 NowWordGetKnown(void)
{
	u16 cnt, i;

	cnt = KnownNowWordCnt();
	if(cnt == 0){ return KAIWA_CODE_BLANK; }

	cnt = pp_rand() % cnt;
	for(i = 0; i < NOW_WORD_MAX; i++){
		if(NowWordFlagCheck(i)){
			if(cnt == 0){
				return MAKE_CODE(KWC_NOW, i);
			}
			cnt--;
		}
	}
	return KAIWA_CODE_BLANK;
}
/*===============================================*/
/*  ポケモン２フラグチェック                     */
/*===============================================*/
u8 KaiwaPoke2CategoryCheck(void)
{
	return ZukanSpecialFlagCheck();
//	return (Fld.kaiwa_word_flag[POKE2_BYTE_OFS] != 0);
}
/*===============================================*/
/*  見たことのあるポケモン名の会話コードを       */
/*  ランダムで返す                               */
/*===============================================*/
static u16 get_known_poke_code(void)
{
	const u16 *tbl;
	u16 cnt, i, z_no;

	cnt = KaiwaEnableWordCnt(KWC_POKEMON);
	if(cnt == 0){ return KAIWA_CODE_BLANK; }
	cnt = pp_rand() % cnt;

	tbl = (const u16*)(KaiwaWordTbl[KWC_POKEMON]);

	for(i = 0; i < CategoryWordCntTbl[KWC_POKEMON]; i++){
		z_no = PokeMonsNo2ZukanNoGet(*tbl);
		if(ZukanCheck(z_no, Z_SEE_CHK))
		{
			if(cnt == 0){
				return MAKE_CODE(KWC_POKEMON, *tbl);
			}
			cnt--;
		}
		tbl++;
	}
	return KAIWA_CODE_BLANK;
}
