/**********************************************************************/
/*  ポケモンくじデータ操作                                            */
/*                                                            taya    */
/**********************************************************************/

#include "common.h"
#include "calctool.h"
#include "syswork.h"
#include "ev_flag.h"
#include "pokelist.h"
#include "pasocom.h"
#include "item.h"
#include "poketool.h"

//===========================================
// マクロ
//===========================================
#define POKELOT_MAXNUMBER  (65535)  // 当選ナンバー最大値
#define POKELOT_MAXDAYS  (0)   // 日数更新での日数制限（０なら制限しない）

//===========================================
// プロトタイプ
//===========================================
static void set_pokelot_value(u32 val);
static u32  get_pokelot_value(void);
static u8 check_hit_keta(u16 val1, u16 val2);

//===========================================
// 景品
//===========================================
static const u16 PokeLotPrizeTable[4] = {
	ITEM_POINTOAPPU,         // ３等：ポイントアップ
	ITEM_GAKUSYUUSOUTI,  // ２等：がくしゅうそうち
	ITEM_GENKINOKATAMARI, // １等：げんきのかたまり
	ITEM_MASUTAABOORU,      // 特等：マスターボール
};



/*==============================================================
==  ゲーム開始時の初期化処理
==============================================================*/
void InitPokeLot(void)
{
	u16  L, H;

	L = pp_rand();
	H = pp_rand();

	set_pokelot_value((H<<16) | L);
	SetEventWorkValue(WK_POKELOT_PRIZE, 0);
}
/*==============================================================
==  日数経過による更新処理
==============================================================*/
void UpdatePokeLot(u16 days)
{
	u32  value;

	value = pp_rand();

#if POKELOT_MAXDAYS
	if(days > POKELOT_MAXDAYS){ days = POKELOT_MAXDAYS; }
#endif

	while(days--){
		value = value * 1103515245L + 12345;
	}

	set_pokelot_value(value);
}
/*==============================================================
==  当選ナンバーを AnswerWork にセット
==============================================================*/
void GetPokeLotNumber(void)
{
	u32 value;

	value = get_pokelot_value();
//	AnswerWork = (u16)(value / 65536L) % 32768U;
	AnswerWork = (u16)(value % (POKELOT_MAXNUMBER+1));
}
/*==============================================================
==  AnswerWork に入っているナンバーで当選チェック
==  【結果】
==    ScriptParameter0  ... 0(はずれ）～4（特等）
==  ※ScriptParameter1  ... もらえるアイテムナンバー
==  ※ScriptParameter2  ... 当選ポケモンが（0:てもち 1:ボックス）
==  ※StrTempBuffer0   ... 当選ポケモン名
==
==  ※当選しなかった場合、これらの値は内容が保証されません
==============================================================*/
void CheckPokeLotNumber(void)
{
	u32 id;
	u16 monsbox, monspos, i, j;
	u8  keta;

	ScriptParameter0 = 0;
	monsbox = monspos = 0;

	// 手持ちチェック
	for(i = 0; i < TEMOTI_POKEMAX; i++)
	{
		if(PokeParaGet(PokeParaMine+i, ID_monsno) != 0)
		{
			if(PokeParaGet(PokeParaMine+i, ID_tamago_flag) == 0)
			{
				id = (PokeParaGet(PokeParaMine + i, ID_id_no) & 0xffff);
				keta = check_hit_keta(AnswerWork, id);
				if(keta > ScriptParameter0 && keta > 1)
				{
					ScriptParameter0 = keta - 1;
					monsbox = BOX_KAZU;
					monspos = i;
				}
			}
		}else{
			break;
		}
	}

	// ボックスチェック
	for(i = 0; i < BOX_KAZU; i++)
	{
		for(j = 0; j < BOX_PM_KAZU; j++)
		{
			if(PokePasoParaGet(&(BoxData.PPPBox[i][j]), ID_monsno) != 0)
			{
				if(PokePasoParaGet(&(BoxData.PPPBox[i][j]), ID_tamago_flag) == 0)
				{
					id = (PokePasoParaGet(&(BoxData.PPPBox[i][j]), ID_id_no) & 0xffff);
					keta = check_hit_keta(AnswerWork, id);
					if(keta > ScriptParameter0 && keta > 1)
					{
						ScriptParameter0 = keta - 1;
						monsbox = i;
						monspos = j;
					}
				}
			}
		}
	}

	// 当選していた
	if(ScriptParameter0)
	{
		ScriptParameter1 = PokeLotPrizeTable[ScriptParameter0-1];
		if(monsbox == BOX_KAZU){
			ScriptParameter2 = 0;
			PokeParaGet(PokeParaMine + monspos, ID_nickname, StrTempBuffer0);
		}else{
			ScriptParameter2 = 1;
			PokePasoParaGet(&(BoxData.PPPBox[monsbox][monspos]), ID_nickname, StrTempBuffer0);
		}
		NickNameCutOff(StrTempBuffer0);
	}
}
/*====================================================*/
/*  一致桁数を計算                                    */
/*  val1, val2   比較する数値                         */
/*  return:  一致桁数（0～5）                         */
/*====================================================*/
static u16 V1 = 0, V2 = 0;

static u8 check_hit_keta(u16 val1, u16 val2)
{
	u8  i, hit;

	hit = 0;

	for(i = 0; i < 5; i++)
	{
		V1 = val1 % 10;
		V2 = val2 % 10;
		if((val1%10) != (val2%10)){ break; }
		val1 /= 10;
		val2 /= 10;
		hit++;
	}

	return hit;
}
/*====================================================*/
/*  ポケモンくじ用乱数セット                          */
/*  val    乱数32bit                                  */
/*====================================================*/
static void set_pokelot_value(u32 val)
{
	u16 L, H;

	H = (val >> 16) & 0xffff;
	L = val & 0xffff;
	SetEventWorkValue(WK_POKELOT_RND1, L);
	SetEventWorkValue(WK_POKELOT_RND2, H);
}
/*====================================================*/
/*  ポケモンくじ用乱数ゲット                          */
/*====================================================*/
static u32 get_pokelot_value(void)
{
	u16 L, H;
	L = GetEventWorkValue(WK_POKELOT_RND1);
	H = GetEventWorkValue(WK_POKELOT_RND2);
	return ((H<<16)|L);
}


/*==============================================================
==  任意の数値を当選ナンバーに（デバッグ用）
==============================================================*/
void SetPokeLotNumber(u16 num)
{
	set_pokelot_value(num);
}

