/***********************************************************************
**	流行語データ
***********************************************************************/
#include "common.h"
#include "pm_str.h"
#include "kaiwa.h"
#include "calctool.h"
#include "ev_flag.h"
#include "popword.h"
#include "pokesio.h"
#include "sysflag.h"
#include "kaiwa_code.h"

/*======================================
==	定数
======================================*/
#define MIX_DATA_SIZE    (sizeof(Fld.PopWord))                // 通信時のデータサイズ
#define MIX_TMP_BUFFER   (PopularWord*)(&(UserWork[0x7800]))  // 通信時に全データをコピーしておく一時バッファ
#define MIX_SORT_BUFFER  (PopularWord*)(&(UserWork[0x7900]))  // 通信時ソートに使うバッファ

/*======================================
==	内部関数宣言
======================================*/
static void set_rand_power(PopularWord *word);
static u8 is_greater(PopularWord *word1, PopularWord *word2, u8 type);
static u8 is_dup_regist_word(u16 *word);
static u8 is_same_word(u16 *word1, u16 *word2);
static s16 check_mix_dup_word(PopularWord *pop, u16 record);

/*====================================================================*/
/*	流行語データ初期化（ゲーム開始時）                                */
/*====================================================================*/
void PopWord_Init(void)
{
	u16 i;
	for(i = 0; i < POPWORD_MAX; i++){
		Fld.PopWord[i].word[0] = KaiwaGetRandomWord(KWC_JOUTAI);
		if(pp_rand() & 1){
			Fld.PopWord[i].word[1] = KaiwaGetRandomWord(KWC_SEIKATU);
		}else{
			Fld.PopWord[i].word[1] = KaiwaGetRandomWord(KWC_SYUMI);
		}

		Fld.PopWord[i].powerup_flag = pp_rand() & 1;

		set_rand_power(&(Fld.PopWord[i]));
	}
	PopWord_Sort(Fld.PopWord, POPWORD_MAX, POPSORT_NOWPOWER);
}
/*====================================================================*/
/*	流行語データ更新（１日ごとの初回起動時）                          */
/*                                                                    */
/*  days   ... 何日分すすめるか？                                     */
/*                                                                    */
/*====================================================================*/
#define POW_RATIO  (5)   // １日あたりの増減量
void PopWord_Update(u16 days)
{
	u16 i;
	u32 tmp, rem, pow, Power;
	PopularWord  *data;

	if(days == 0){ return; }

	Power = POW_RATIO * days;

	for(i = 0; i < POPWORD_MAX; i++){
		pow = Power;

		data = &(Fld.PopWord[i]);
		if(data->powerup_flag == 0){
			if((u16)(data->now_power) >= (u16)pow){
				data->now_power -= pow;
				if(data->now_power==0){
					data->powerup_flag=1;
				}
				continue;
			}
			pow -= data->now_power;
			data->now_power = 0;
			data->powerup_flag = 1;
		}

		tmp = data->now_power + pow;
		if((u16)tmp > (u16)(data->max_power)){
			rem = tmp % data->max_power;
			tmp /= data->max_power;
			data->powerup_flag = !(tmp & 1);
			if(data->powerup_flag){
				data->now_power = rem;
			}else{
				data->now_power = data->max_power - rem;
			}
		}else{
			data->now_power = tmp;
			if(data->now_power == data->max_power){
				data->powerup_flag = 0;
			}
		}
	}
	PopWord_Sort(Fld.PopWord, POPWORD_MAX, POPSORT_NOWPOWER);
}
/*====================================================================*/
/*	新規に入力された流行語の能力値決定＆登録                          */
/*                                                                    */
/*  word   簡易会話データ                                             */
/*                                                                    */
/*  戻り値   1 ... 最新流行語として登録された                         */
/*           0 ... 潜在流行語として登録された                         */
/*                                                                    */
/*====================================================================*/
u8 PopWord_Add(u16 *word)
{
	PopularWord tmp = {};
	u16 i, j;

	// 重複していたら登録しない
	if(is_dup_regist_word(word)){
		return 0;
	}

	// レコードコーナー通信未経験で、初めて入力する場合は
	// 無条件に最新流行語として上書きする
	if(EventFlagCheck(SYS_POPWORD_INPUT) == 0){
		EventFlagSet(SYS_POPWORD_INPUT);
		if(EventFlagCheck(SYS_MIX_RECORD) == 0){
			Fld.PopWord[0].word[0] = word[0];
			Fld.PopWord[0].word[1] = word[1];
			return 1;
		}
	}

	// 以下、通常処理
	tmp.word[0] = word[0];
	tmp.word[1] = word[1];
	tmp.powerup_flag = 1;
	set_rand_power(&tmp);

	for(i = 0; i < POPWORD_MAX; i++){
		if(is_greater(&tmp, Fld.PopWord + i, POPSORT_NOWPOWER)){
			for(j = POPWORD_MAX-1; j > i; j--){
				Fld.PopWord[j] = Fld.PopWord[j-1];
			}
			Fld.PopWord[i] = tmp;
			return (i == 0);
		}
	}
	// 最下位には必ず入れる
	Fld.PopWord[POPWORD_MAX-1] = tmp;

	return 0;
}
/*====================================================================*/
/*	流行語データを能力値で降順にソート                                */
/*                                                                    */
/*  word  PopularWord 構造体の配列                                    */
/*  max   データ件数                                                  */
/*  type  ソートタイプ（enum POPWORD_SORT_TYPE）                      */
/*                                                                    */
/*====================================================================*/
void PopWord_Sort(PopularWord *word, u16 max, u8 type)
{
	u16 i, j;
	PopularWord tmp;

	for(i = 0; i < max; i++){
		for(j = i + 1; j < max; j++){
			if(is_greater(word+j, word+i, type)){
				tmp = word[j];
				word[j] = word[i];
				word[i] = tmp;
			}
		}
	}
}
/*====================================================================*/
/*	流行語データを混ぜる（レコードコーナー通信）                      */
/*                                                                    */
/*  adrs   流行語データ配列のアドレス                                 */
/*  size   次の配列までのオフセット                                   */
/*  id     通信ＩＤ                                                   */
/*                                                                    */
/*====================================================================*/
void PopWordMixer(void *adrs, u32 size, u8 id)
{
	PopularWord *to, *from, *dup;
	u16 members, record, i, j;
	s16 dup_no;

	// 同じ単語組み合わせが重複しないように
	// 全メンバーのデータをソート用バッファにコピー
	members = GetConnectSioMenberNum();

	for(i = 0; i < members; i++){
		memcpy((u8*)MIX_TMP_BUFFER+i*MIX_DATA_SIZE, (u8*)adrs+i*size, MIX_DATA_SIZE);
	}

	from = (PopularWord*)MIX_TMP_BUFFER;
	to = MIX_SORT_BUFFER;
	record = 0;

	for(i = 0; i < members; i++){
		for(j = 0; j < POPWORD_MAX; j++){
			dup_no = check_mix_dup_word(from, record);
			if(dup_no < 0){
				*to++ = *from;
				record++;
			}else{
				dup = MIX_SORT_BUFFER + dup_no;
				if(dup->now_power < from->now_power){
					*dup = *from;
				}
			}
			from++;
		}
	}

	// ソート後、上位データを自分のデータとする
	PopWord_Sort(MIX_SORT_BUFFER, record, POPSORT_MIXER);

	from = MIX_SORT_BUFFER;
	to = Fld.PopWord;

	for(i = 0; i < POPWORD_MAX; i++){
		*to++ = *from++;
	}
}
/*====================================================================*/
/*	流行語文字列を StrTempBuffer0 にコピー                            */
/*                                                                    */
/*  ※スクリプト対応   ScriptParameter0 ... 何番目の流行語か？        */
/*                                                                    */
/*====================================================================*/
void PopWord_SetBuffer(void)
{
	PopularWord *pop = &(Fld.PopWord[ScriptParameter0]);
	KaiwaCopySentence(StrTempBuffer0, pop->word, 2, 1);
}
/*====================================================================*/
/*	現在の流行語が、まもなく替わりそうかどうかチェック                */
/*                                                                    */
/*  ※スクリプト対応   AnswerWork  0 ... まだ／1...替わりそう         */
/*                                                                    */
/*====================================================================*/
void PopWord_CheckComingWord(void)
{
	u8 result = 0;

	do {
		s16 diff;

		diff = Fld.PopWord[0].now_power - Fld.PopWord[1].now_power;
		if(diff > 1){ break; }
		if(Fld.PopWord[0].powerup_flag){ break; }
		if(!(Fld.PopWord[1].powerup_flag)){ break; }

		result = 1;

	}while(0);

	AnswerWork = result;
}
/*====================================================================*/
/*	流行語組み合わせによって異なる数値(3bit)をAnswerWork にセット     */
/*                                                                    */
/*  ※スクリプト対応                                                  */
/*                                                                    */
/*====================================================================*/
void PopWord_GetValue(void)
{
	AnswerWork = (Fld.PopWord[0].word[0] + Fld.PopWord[0].word[1]) & 0x07;
}


/**********************************************************************
**	２つの流行語のうち、どちらが上位か判定
**
**  word1, word2  流行語アドレス
**  type          判定タイプ（enum POPWORD_SORT_TYPE）
**
**  戻り値   1 ... word1 が上位   0 ... word2 が上位
**
**********************************************************************/
static u8 is_greater(PopularWord *word1, PopularWord *word2, u8 type)
{
	switch(type){
	case POPSORT_NOWPOWER:
		if(word1->now_power > word2->now_power) return 1;
		if(word1->now_power < word2->now_power) return 0;
		if(word1->max_power > word2->max_power) return 1;
		if(word1->max_power < word2->max_power) return 0;
		break;

	case POPSORT_MAXPOWER:
		if(word1->max_power > word2->max_power) return 1;
		if(word1->max_power < word2->max_power) return 0;
		if(word1->now_power > word2->now_power) return 1;
		if(word1->now_power < word2->now_power) return 0;
		break;

	case POPSORT_MIXER:
		if(word1->now_power > word2->now_power) return 1;
		if(word1->now_power < word2->now_power) return 0;
		if(word1->max_power > word2->max_power) return 1;
		if(word1->max_power < word2->max_power) return 0;
		if(word1->random > word2->random) return 1;
		if(word1->random < word2->random) return 0;
		if(word1->word[0] > word2->word[0]) return 1;
		if(word1->word[0] < word2->word[0]) return 0;
		if(word1->word[1] > word2->word[1]) return 1;
		if(word1->word[1] < word2->word[1]) return 0;
		return 1;
		// ↑通信時ソートではランダム判定をしない。
		// 単語データ値でも判定しているので必ず判定できるはずだが、
		// 念のために１を返している

	}
	return pp_rand() & 1;
}
/**********************************************************************
**	能力値、潜在能力値、乱数をランダムに決定する
**
**  word   能力値を決定するデータ構造体アドレス
**
**********************************************************************/
static void set_rand_power(PopularWord *word)
{
	u16 pow = pp_rand() % 98;
	if(pow > 50){
		pow = pp_rand() % 98;
		if(pow > 80){
			pow = pp_rand() % 98;
		}
	}
	word->max_power = 30 + pow;
	word->now_power = 30 + (pp_rand() % (pow+1));

	word->random = pp_rand();
}
/**********************************************************************
**	すでに登録されている流行語と重複しているかチェック
**
**  word   簡易会話データアドレス
**
**********************************************************************/
static u8 is_dup_regist_word(u16 *word)
{
	u16 i;
	for(i = 0; i < POPWORD_MAX; i++){
		if(is_same_word(word, Fld.PopWord[i].word)){ return 1; }
	}
	return 0;
}
/**********************************************************************
**	２つの流行語の単語が同じかどうかチェック
**
**  word1, word2  簡易会話データアドレス
**
**********************************************************************/
static u8 is_same_word(u16 *word1, u16 *word2)
{
	u16 i;

	for(i = 0; i < 2; i++){
		if(*word1++ != *word2++){ return 0; }
	}
	return 1;
}
/**********************************************************************
**	通信用ワークにある流行語データと、重複していないかチェック
**
**  pop     チェックする流行語データ
**	record  通信用ワークにあるデータ件数
**
**	return:  0 以上 ... 重複があった場合のデータ番号
**	        -1      ... 重複なし
**
**
**********************************************************************/
static s16 check_mix_dup_word(PopularWord *pop, u16 record)
{
	PopularWord *work_pop;
	s16 i;

	work_pop = MIX_SORT_BUFFER;
	for(i = 0; i < record; i++){
		if(is_same_word(pop->word, work_pop->word)){ return i; }
		work_pop++;
	}
	return -1;
}

