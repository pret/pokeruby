/***********************************************************************
**	トレナビ（計算ルーチン等）
***********************************************************************/
#include "tnavi_com.h"
#include "poketool.h"
#include "decord.h"
#include "box2.h"
#include "decord.h"
#include "objdata.h"
#include "mus_tool.h"
#include "laster.h"
#include "ev_fight.h"
#include "map.h"
#include "fld_tool.h"
#include "message.h"
#include "../data/revenge.h"

/*==============================================
==	毛並みレベル計算マクロ
==============================================*/
#define CALC_FUR_LEVEL(val)  ((val==255)? (FUR_LV_MAX) : ((val)/29))

#define CONDITION_SORT_UNIT (15)   // 一度にソートする最大数（コンディション）
#define RIBBON_SORT_UNIT    (15)   // 一度にソートする最大数（リボン）

/*==============================================
==	プロトタイプ
==============================================*/
/* コンディション用パラメータセット */
static void set_poke_infostr(s16 sort_no, u8 work_no);
static void set_poke_rador_dat(s16 sort_no, u8 work_no);
static void set_poke_image(s16 sort_no, u8 work_no);

/* モーフィング処理 */
static void init_morph(POS *begin, POS *end);
static u8 prog_morph(void);

/* レーダー計算 */
static void calc_param_to_pos(u8 *param, POS *pos);
static void calc_rwin_area(POS *pos);
static void calc_lwin_area(POS *pos);


/***********************************************************************
**	文字列コピー＆指定文字数だけスペース詰め
**
**	dst  コピー先バッファ
**	src  コピー元文字列
**	len  スペースを詰める文字数
**
**	戻り値   EOM_アドレス
**
***********************************************************************/
static u8 *PM_strcpy_spc(u8 *src, const u8 *dst, s16 len)
{
	while(*dst != EOM_){
		*src++ = *dst++;
		len--;
	}
	while(len-- > 0){
		*src++ = spc_;
	}
	*src = EOM_;
	return src;
}
/***********************************************************************
**	ポケモンデータ文字列をバッファにコピー
**
**	buf        コピー先バッファ
**	sort_no    ソート順位
**	ribon_flg  0 ... リボン個数表示部には何も書かない
**             1 ... リボン個数を表示する
**             2 ... リボン個数表示部をスペースで埋める
**
**	戻り値  EOM_アドレス
**
***********************************************************************/
u8* TNaviSub_CopyPokeDatStr(u8 *buf, u16 sort_no, u8 ribon_flg)
{
	u16 b, p, lv, sex, len, monsno;
	u8 *cp, *cp_save;

	b = NaviWork->sort_data[sort_no].box;
	p = NaviWork->sort_data[sort_no].poke;

	if(TNaviSub_PokeParaGet(b, p, ID_tamago_flag, NULL))
	{
		return PM_strcpy_clear(buf, str_tamago, spc_, 12);
	}

	TNaviSub_PokeParaGet(b, p, ID_nickname, buf);
	NickNameCutOff(buf);

	monsno = TNaviSub_PokeParaGet(b, p, ID_monsno, NULL);
	if(b == BOX_KAZU){
//		lv = PokeLevelCalc(PokeParaMine + p);
		lv = PokeParaGet(PokeParaMine + p, ID_level);
		sex = PokeSexGet(PokeParaMine+p);

	}else{
		u32 rnd;

		lv = PokePasoLevelCalc(&(BoxData.PPPBox[b][p]));
		rnd = TNaviSub_PokeParaGet(b, p, ID_personal_rnd, NULL);
		sex = PokeSexGetMonsNo(monsno, rnd);
	}

	// ニドラン♂・♀は、ニックネームがついていない場合
	// 性別表示しない。
	if(monsno == MONSNO_NIDORAN_F
	|| monsno == MONSNO_NIDORAN_M)
	{
		if(PM_strcmp(buf, PokeNameData[monsno])==0){
			sex = MONS_UNKNOWN;
		}
	}


	cp = buf;
	len = 0;
	while(*cp != EOM_){ cp++; len++; }
	while(len++ < 5){
		*cp++ = spc_;
	}

	*cp++ = spc_;
	*cp++ = CTRL_;
	*cp++ = C_PAL_;
	switch(sex){
	case MONS_MALE:   *cp++ = TNAVI_MALE_PAL>>4;   *cp++ = osu_; break;
	case MONS_FEMALE: *cp++ = TNAVI_FEMALE_PAL>>4; *cp++ = mesu_; break;
	default:          *cp++ = NaviWork->font_base_pal; *cp++ = spc_; break;
	}
	*cp++ = CTRL_;
	*cp++ = C_PAL_;
	*cp++ = NaviWork->font_base_pal;

	*cp++ = sura_;
	*cp++ = spc_;
	cp_save = cp;
	cp = PM_NumMsgSet(cp, lv, NUM_MODE_LEFT, 3);
	len = (cp - cp_save);
	*cp++ = spc_;

	if(ribon_flg==0){
		len = 3-len;
		while(len--){
			*cp++ = spc_;
		}
	}
	if(ribon_flg==1){
		len = 3-len;
		while(len--){
			*cp++ = spc_;
		}
		cp = PM_NumMsgSet(cp, NaviWork->sort_data[sort_no].param, NUM_MODE_SPACE, 2);
		*cp++ = ko_;
	}
	if(ribon_flg==2){
		len = 4-len;
		while(len--){
			*cp++ = spc_;
		}
	}
	*cp = EOM_;
	return cp;
}
/***********************************************************************
**	リスト内ランク文字列をバッファにコピー（コンディション）
**
**	buf        コピー先バッファ
**	rank       順位
**
**	戻り値  EOM_アドレス
**
***********************************************************************/
u8* TNaviSub_CopyRankStr(u8 *buf, u16 rank)
{
	u8 *cp;

	cp = PM_NumMsgSet(buf, rank, NUM_MODE_SPACE, 4);
	cp = PM_strcpy(cp, PN_rank_str);

	return cp;
}
/***********************************************************************
**	リスト内通し番号文字列をバッファにコピー（リボン）
**
**	buf        コピー先バッファ
**	pos        通し番号
**
**	戻り値  EOM_アドレス
**
***********************************************************************/
u8* TNaviSub_CopyPosStr(u8 *buf, u16 pos)
{
	u8 *cp;

	cp = PM_NumMsgSet(buf, pos, NUM_MODE_SPACE, 3);
	*cp++ = sura_;
	cp = PM_NumMsgSet(cp, NaviWork->list_max+1, NUM_MODE_SPACE, 3);

	return cp;
}
/***********************************************************************
**	ポケモンの各種能力値を返す
**
**  box      ボックスナンバー（BOX_KAZU ならてもち）
**  poke     ボックス内の通し番号
**  id       パラメータID
**  buf      文字列受け取りバッファ
**
**  戻り値   能力値
**
***********************************************************************/
u32 TNaviSub_PokeParaGet(u16 box, u16 poke, int id, u8 *buf)
{
	if(box == BOX_KAZU){
		if(id == ID_nickname || id == ID_oyaname){
			return PokeParaGet(PokeParaMine+poke, id, buf);
		}else{
			return PokeParaGet(PokeParaMine+poke, id);
		}
	}else{
		if(id == ID_nickname || id == ID_oyaname){
			return PokePasoParaGet(&(BoxData.PPPBox[box][poke]), id, buf);
		}else{
			return PokePasoParaGet(&(BoxData.PPPBox[box][poke]), id);
		}
	}
}
/***********************************************************************
**	ポケモンのマーキング値をセット
**
**  box      ボックスナンバー（BOX_KAZU なら手持ち）
**  poke     ボックス内の通し番号
**  mark     マーキング
**
***********************************************************************/
void TNaviSub_PokeMarkSet(u16 box, u16 poke, u8 mark)
{
	if(box == BOX_KAZU){
		PokeParaPut(PokeParaMine + poke, ID_mark, &mark);
	}else{
		PokePasoParaPut(&(BoxData.PPPBox[box][poke]), ID_mark, &mark);
	}
}
/***********************************************************************
**	指定ソート順位のポケモン名、ボックス名、順位などをワークに作成
**
**  sort_no  ソート順位
**  work_no  ワークナンバー（０～２）
**
***********************************************************************/
static void set_poke_infostr(s16 sort_no, u8 work_no)
{
	if(NaviWork->sort_data[sort_no].enable){
		u16 b;

		TNaviSub_CopyPokeDatStr(NaviWork->poke_name[work_no], sort_no, 0);

		b = NaviWork->sort_data[sort_no].box;
		if(b == BOX_KAZU){
			PM_strcpy_spc(NaviWork->box_name[work_no], PN_temoti_str, BOXNAME_MAX);
		}else{
			PM_strcpy_spc(NaviWork->box_name[work_no], BoxData.BoxName[b], BOXNAME_MAX);
		}

		NaviWork->pokename_enable[work_no] = 1;

	}else{
		u16 i;
		for(i = 0; i < POKELIST_MAXLEN; i++){
			NaviWork->poke_name[work_no][i] = spc_;
		}
		NaviWork->poke_name[work_no][i] = EOM_;

		for(i = 0; i < BOXNAME_MAX; i++){
			NaviWork->box_name[work_no][i] = spc_;
		}
		NaviWork->box_name[work_no][i] = EOM_;

		NaviWork->pokename_enable[work_no] = 0;
	}
}
/***********************************************************************
**	指定ソート順位ポケモンのレーダー用パラメータを指定ワークに作成
**
**  sort_no  ソート順位
**  work_no  ワークナンバー（０～２）
**
***********************************************************************/
static void set_poke_rador_dat(s16 sort_no, u8 work_no)
{
	u16 b, p;

	if(NaviWork->sort_data[sort_no].enable){

		b = NaviWork->sort_data[sort_no].box;
		p = NaviWork->sort_data[sort_no].poke;


		NaviWork->poke_param[work_no][0] = TNaviSub_PokeParaGet(b, p, ID_style, NULL);
		NaviWork->poke_param[work_no][1] = TNaviSub_PokeParaGet(b, p, ID_strong, NULL);
		NaviWork->poke_param[work_no][2] = TNaviSub_PokeParaGet(b, p, ID_clever, NULL);
		NaviWork->poke_param[work_no][3] = TNaviSub_PokeParaGet(b, p, ID_cute, NULL);
		NaviWork->poke_param[work_no][4] = TNaviSub_PokeParaGet(b, p, ID_beautiful, NULL);
		NaviWork->poke_fur[work_no] = CALC_FUR_LEVEL(TNaviSub_PokeParaGet(b, p, ID_fur, NULL));
		NaviWork->poke_mark[work_no] = TNaviSub_PokeParaGet(b, p, ID_mark, NULL);

		calc_param_to_pos(NaviWork->poke_param[work_no], NaviWork->point[work_no]);

	}else{
		u16 i;
		for(i = 0; i < 5; i++){
			NaviWork->poke_param[work_no][i] = 0;
			NaviWork->point[work_no][i].x = RADOR_CX;
			NaviWork->point[work_no][i].y = RADOR_CY;
		}
	}
}

/***********************************************************************
**	指定ソート順位のポケモン画像を、指定ワークエリアに展開
**
**  sort_no  ソート順位
**  work_no  ワークナンバー（０～２）
**
***********************************************************************/
static void set_poke_image(s16 sort_no, u8 work_no)
{
	u32 id, rnd;
	u16 b, p, monsno;

	if(NaviWork->sort_data[sort_no].enable == 0){ return; }

	b = NaviWork->sort_data[sort_no].box;
	p = NaviWork->sort_data[sort_no].poke;
	monsno = TNaviSub_PokeParaGet(b, p, ID_monsno_egg, NULL);

	id = TNaviSub_PokeParaGet(b, p, ID_id_no, NULL);
	rnd = TNaviSub_PokeParaGet(b, p, ID_personal_rnd, NULL);

	DecordPokeCellMakeBuchi(&PM2FObjDataCell[monsno],
			pm2fpara[monsno].size, 1,
			(void *)(NaviWork->PokeCellWork),(void *)(NaviWork->PokeCell[work_no]),
			monsno, rnd);

//	LZ77UnCompWram((PalData *)(&PM2NObjDataPal[monsno])->pal_data, (void *)(NaviWork->PokePal[work_no]));


	LZ77UnCompWram((void*)PokePalGetPara(monsno,id,rnd), (void*)(NaviWork->PokePal[work_no]));

	NaviWork->pokeimg_monsno[work_no] = monsno;

}
/***********************************************************************
**	指定ソート順位ポケモンのコンディション画面用データを全て
**	ワークにセット
**
**  sort_no  ソート順位
**  work_no  ワークナンバー（０～２）
**
***********************************************************************/
static void set_all_condition_data(s16 sort_no, u8 work_no)
{
	set_poke_infostr(sort_no, work_no);
	set_poke_rador_dat(sort_no, work_no);
	set_poke_image(sort_no, work_no);
}
/*============================================================================*/
/*   ポケモンデータソート                                                     */
/*============================================================================*/
/*******************************************************
**	ソート初期化
*******************************************************/
static void init_sort(void)
{
	NaviWork->sort_cnt = 0;
}
/*******************************************************
**	新しいデータを１件追加
*******************************************************/
static void add_new_sortdata(POKE_SORT_DATA *data)
{
	u16 min, max, pos;

	min = 0;
	max = NaviWork->sort_cnt;
	pos = min + (max-min) / 2;

	while(max != pos){
		if(data->param > NaviWork->sort_data[pos].param){
			max = pos;
		}else{
			min = pos + 1;
		}
		pos = min + (max-min) / 2;
	}

	for(max = NaviWork->sort_cnt; max > pos; max--){
		NaviWork->sort_data[max] = NaviWork->sort_data[max-1];
	}
	NaviWork->sort_data[pos] = *data;

	NaviWork->sort_cnt++;
}
/*******************************************************
**	ソート終了
*******************************************************/
static void finish_sort(void)
{
	u16 i;

	// 順位の振りなおし
	NaviWork->sort_data[0].rank = 1;
	for(i = 1; i < NaviWork->sort_cnt; i++){
		if(NaviWork->sort_data[i].param == NaviWork->sort_data[i-1].param){
			NaviWork->sort_data[i].rank = NaviWork->sort_data[i-1].rank;
		}else{
			NaviWork->sort_data[i].rank = i + 1;
		}
	}

	// リスト画面用パラメータ設定
	NaviWork->list_cursor_pos = 0;
	NaviWork->list_top = 0;
	NaviWork->list_rank = 0;
	NaviWork->list_bottom = ((NaviWork->sort_cnt <= LIST_MAX)? NaviWork->sort_cnt : LIST_MAX) - 1;
	NaviWork->list_max = NaviWork->sort_cnt - 1;
	NaviWork->list_scroll_flg = (NaviWork->list_max >= LIST_MAX);

}
/*============================================================================*/
/*   コンディション画面用データ初期化                                         */
/*============================================================================*/
/*******************************************************
**	初期化共通処理                                    **
*******************************************************/
static void condition_init_common(void)
{
	set_all_condition_data(NaviWork->condition_poke_sel, 0);
	TNaviObj_UpdatePokeImg(0);

	if(NaviWork->condition_poke_cnt == 1){
		NaviWork->PokeSelNow = 0;
		NaviWork->PokeSelNext = 0;
		NaviWork->PokeSelPrev = 0;
	}else{
		s16 next, prev;

		NaviWork->PokeSelNow = 0;
		NaviWork->PokeSelNext = 1;
		NaviWork->PokeSelPrev = 2;

		next = NaviWork->condition_poke_sel + 1;
		if(next >= NaviWork->condition_poke_cnt){
			next = 0;
		}
		prev = NaviWork->condition_poke_sel -  1;
		if(prev < 0){
			prev = NaviWork->condition_poke_cnt - 1;
		}

		set_all_condition_data(next, 1);
		set_all_condition_data(prev, 2);
	}
}
/*******************************************************
**	コンディション画面用データ初期化（てもち）
*******************************************************/
void TNaviSub_ConditionInitStock(void)
{
	u16 i, c;
	for(i = 0, c = 0; i < NaviWork->stock_poke_cnt; i++){
		if(PokeParaGet(PokeParaMine + i, ID_tamago_flag) == 0){
			NaviWork->sort_data[c].box = BOX_KAZU;
			NaviWork->sort_data[c].poke = i;
			NaviWork->sort_data[c].rank = c+1;
			NaviWork->sort_data[c].enable = 1;  // 無効データ
			c++;
		}
	}
	NaviWork->sort_data[c].box = 0;
	NaviWork->sort_data[c].poke = 0;
	NaviWork->sort_data[c].rank = 0;
	NaviWork->sort_data[c].enable = 0;  // 無効データ

	NaviWork->condition_poke_sel = 0;
	NaviWork->condition_poke_cnt = c + 1;

	condition_init_common();

	NaviWork->list_kirikae_ok = 1;
}
/*******************************************************
**	コンディション画面用データ初期化（ソート）
*******************************************************/

void TNaviSub_ConditionInitSort(void)
{
	NaviWork->condition_poke_sel = NaviWork->list_rank;

	condition_init_common();

	if(NaviWork->list_max==0){
		NaviWork->list_kirikae_ok = 0;
	}else{
		NaviWork->list_kirikae_ok = 1;
	}
}
void TNaviSub_ConditionSortInit(void)
{
	NaviWork->sort_box = 0;
	NaviWork->sort_poke = 0;

	init_sort();


	if(NaviWork->comm_flg == FALSE)
	{
		while(1){
			if(!TNaviSub_ConditionSort()){ break; }
		}
	}

}

u8 TNaviSub_ConditionSort(void)
{
	POKE_SORT_DATA data;
	u16 i;

	switch(NaviWork->sort_box){
	default:
		data.enable = 1;

		for(i = 0; i < CONDITION_SORT_UNIT; i++)
		{
			if(PokePasoParaGet(&(BoxData.PPPBox[NaviWork->sort_box][NaviWork->sort_poke]), ID_monsno) != NON_POKE)
			{
				if(PokePasoParaGet(&(BoxData.PPPBox[NaviWork->sort_box][NaviWork->sort_poke]), ID_tamago_flag)==0)
				{
					data.box = NaviWork->sort_box;
					data.poke = NaviWork->sort_poke;
					data.param = PokePasoParaGet(&(BoxData.PPPBox[NaviWork->sort_box][NaviWork->sort_poke]), NaviWork->sort_ID);
					add_new_sortdata(&data);
				}
			}

			if(++(NaviWork->sort_poke) == BOX_PM_KAZU)
			{
				NaviWork->sort_poke = 0;
				if(++(NaviWork->sort_box) == BOX_KAZU)
				{
					break;
				}
			}
		}
		break;

	case BOX_KAZU:
		data.enable = 1;
		data.box = BOX_KAZU;
		for(i = 0; i < NaviWork->stock_poke_cnt; i++){
			if(PokeParaGet(PokeParaMine + i, ID_tamago_flag))
			{
				continue;
			}
			data.poke = i;
			data.param = PokeParaGet(PokeParaMine + i, NaviWork->sort_ID);
			add_new_sortdata(&data);
		}
		finish_sort();
		NaviWork->condition_poke_cnt = NaviWork->sort_cnt;
		NaviWork->sort_box++;
		break;

	case BOX_KAZU+1:
		return 0;
	}

	return 1;
}
/*====================================================================*/
/*  レーダーモーフィング・ポケモンウィンドウ同期                      */
/*====================================================================*/
/*******************************************************
**	コンディション画面に入る：初期化
*******************************************************/
void TNaviSub_ConditionInInit(void)
{
	init_morph(NaviWork->point[3], NaviWork->point[NaviWork->PokeSelNow]);
//	TNaviBG_WriteConditionData(NaviWork->PokeSelNow);
	prog_morph();
}
/*******************************************************
**	コンディション画面に入る：実行
*******************************************************/
u8 TNaviSub_ConditionIn(void)
{
	u8 val1, val2;

	val1 = prog_morph();
	val2 = TNaviBG_PokeWinUp();
	return (val1 || val2);
}
/*******************************************************
**	コンディション画面を抜ける：初期化
*******************************************************/
void TNaviSub_ConditionOutInit(void)
{
	if(
		NaviWork->condition_mode == CONDITION_MODE_STOCK  &&
		NaviWork->condition_poke_sel == NaviWork->stock_poke_cnt
	){
		return;
	}
	init_morph(NaviWork->point[NaviWork->PokeSelNow], NaviWork->point[3]);
}
/*******************************************************
**	コンディション画面を抜ける：実行
*******************************************************/
u8 TNaviSub_ConditionOut(void)
{
	u8 val1, val2;

	val1 = prog_morph();
	val2 = TNaviBG_PokeWinDown();
	return (val1 || val2);
}
/*******************************************************
**	コンディションポケモン切り替え：初期化
*******************************************************/
#define ConditionPrevSel  ((NaviWork->condition_poke_sel)? (NaviWork->condition_poke_sel-1):(NaviWork->condition_poke_cnt-1))
#define ConditionNextSel  ((NaviWork->condition_poke_sel<(NaviWork->condition_poke_cnt-1))?(NaviWork->condition_poke_sel+1):0)
static u8 change_appear(void);
static u8 change_disappear(void);
static u8 change_normal(void);

void TNaviSub_ConditionChangeInit(u8 fUp)
{
	u16 n;
	u8  now_enable, next_enable;

	n = (fUp)? NaviWork->PokeSelPrev : NaviWork->PokeSelNext;
	init_morph(NaviWork->point[NaviWork->PokeSelNow], NaviWork->point[n]);

	now_enable = NaviWork->sort_data[NaviWork->condition_poke_sel].enable;
	if(fUp){
		NaviWork->PokeSelPrev = NaviWork->PokeSelNext;
		NaviWork->PokeSelNext = NaviWork->PokeSelNow;
		NaviWork->PokeSelNow = n;
		NaviWork->PokeSelBlank = NaviWork->PokeSelPrev;
		NaviWork->condition_poke_sel = ConditionPrevSel;
		NaviWork->condition_blank_poke = ConditionPrevSel;
	}else{
		NaviWork->PokeSelNext = NaviWork->PokeSelPrev;
		NaviWork->PokeSelPrev = NaviWork->PokeSelNow;
		NaviWork->PokeSelNow = n;
		NaviWork->PokeSelBlank = NaviWork->PokeSelNext;
		NaviWork->condition_poke_sel = ConditionNextSel;
		NaviWork->condition_blank_poke = ConditionNextSel;
	}
	next_enable = NaviWork->sort_data[NaviWork->condition_poke_sel].enable;

	if(!now_enable){
		NaviWork->condition_change_func = change_appear;
	}else if(!next_enable){
		NaviWork->condition_change_func = change_disappear;
	}else{
		NaviWork->condition_change_func = change_normal;
	}

	NaviWork->condition_change_prog = 0;
}
/*******************************************************
**	コンディションポケモン切り替え：実行
*******************************************************/
u8 TNaviSub_ConditionChange(void)
{
	return (*(NaviWork->condition_change_func))();
}
static u8 change_appear(void)
{
	switch(NaviWork->condition_change_prog){
	case 0:
		TNaviObj_UpdatePokeImg(NaviWork->PokeSelNow);
		TNaviBG_WriteConditionData(NaviWork->PokeSelNow);
		NaviWork->condition_change_prog++;
		/* FALLTHROW */
	case 1:
		if(!TNaviSub_ConditionIn()){
			set_all_condition_data(NaviWork->condition_blank_poke, NaviWork->PokeSelBlank);
			NaviWork->condition_change_prog++;
		}
		break;

	case 2:
		return 0;
	}
	return 1;
}
static u8 change_disappear(void)
{
	switch(NaviWork->condition_change_prog){
	case 0:
		if(!TNaviSub_ConditionOut()){
			TNaviBG_WriteConditionData(NaviWork->PokeSelNow);
			set_all_condition_data(NaviWork->condition_blank_poke, NaviWork->PokeSelBlank);
			NaviWork->condition_change_prog++;
		}
		break;

	case 1:
		return 0;
	}
	return 1;
}
static u8 change_normal(void)
{
	switch(NaviWork->condition_change_prog){
	case 0:
		prog_morph();
		if(!TNaviBG_PokeWinDown()){
			TNaviObj_UpdatePokeImg(NaviWork->PokeSelNow);
			TNaviBG_WriteConditionData(NaviWork->PokeSelNow);
			NaviWork->condition_change_prog++;
		}
		break;

	case 1:
		if(!TNaviSub_ConditionIn()){
			NaviWork->condition_change_prog++;
		}
		break;

	case 2:
		set_all_condition_data(NaviWork->condition_blank_poke, NaviWork->PokeSelBlank);
		return 0;
	}
	return 1;
}
/*====================================================================*/
/*  モーフィング                                                      */
/*====================================================================*/
/*******************************************************
**	モーフィング初期化                                **
**                                                    **
**	begin, end   開始、終了時の座標データ             **
********************************************************/
static void init_morph(POS *begin, POS *end)
{
	s32 val, step;
	u16 i, j;
	for(i = 0; i < 5; i++){
		val = begin[i].x << 8;
		step = ((end[i].x - begin[i].x) << 8) / MORPH_STEP;
		for(j = 0; j < (MORPH_STEP-1); j++){
			NaviWork->point_morph[j][i].x = ((val >> 8) + ((val>>7)&1));
			val += step;
		}
		NaviWork->point_morph[j][i].x = end[i].x;

		val = begin[i].y << 8;
		step = ((end[i].y - begin[i].y) << 8) / MORPH_STEP;
		for(j = 0; j < (MORPH_STEP-1); j++){
			NaviWork->point_morph[j][i].y = ((val >> 8) + ((val>>7)&1));
			val += step;
		}
		NaviWork->point_morph[j][i].y = end[i].y;
	}
	NaviWork->morph_cnt = 0;
}
/*******************************************************
**	モーフィング実行                                  **
**                                                    **
**	戻り値  1 ... 継続  0 ... 終了                    **
**          ※終了後、何度呼び出しても良い            **
*******************************************************/
static u8 prog_morph(void)
{
	if(NaviWork->morph_cnt < MORPH_STEP){
		TNaviSub_SetRadorPoint(NaviWork->point_morph[NaviWork->morph_cnt++]);
		return (NaviWork->morph_cnt != MORPH_STEP);
	}else{
		return 0;
	}
	return 1;
}

void TNaviSub_InitMorph(POS *begin, POS *end)
{
	init_morph(begin, end);
}
u8 TNaviSub_ProgMorph(void)
{
	return prog_morph();
}

/*====================================================================*/
/*  レーダー用計算ルーチン                                            */
/*====================================================================*/
/*******************************************************
**	レーダー領域に座標をセット                        **
*******************************************************/
void TNaviSub_SetRadorPoint(POS *point)
{
	u16 i;
	for(i = 0; i < 5; i++){
		NaviWork->rador_point[i] = point[i];
	}
	NaviWork->calc_win_flag = 1;
}
/*******************************************************
**	０～２５５の各パラメータをレーダーの座標に換算    **
*******************************************************/
#if 0  /* --- 単純に割っただけ --- */

#define PARAM_TO_R(p)  (((p)>>3)+4)

#else  /* --- ﾊﾟﾗﾒｰﾀが低いほどレーダーが大きく動くように --- */

static const u8 ParamToR_Table[256] = {
 4, 5, 6, 7, 8, 9, 9,10,10,11,11,12,12,13,13,13,13,14,14,14,
14,15,15,15,15,16,16,16,16,16,16,17,17,17,17,17,17,18,18,18,
18,18,18,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,21,
21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,23,23,23,
23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,25,25,25,
25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,26,
26,27,27,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,
28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,
29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,
30,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,32,32,
32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,33,33,33,33,
33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,
34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,35
};

#define PARAM_TO_R(p)  (ParamToR_Table[p])

#endif


static void calc_param_to_pos(u8 *param, POS *pos)
{
	u8 r, angle;
	u16 i;
	s8 num;

	r = PARAM_TO_R(*param);  // r: 4～35の値になる
	param++;
	pos->x = RADOR_CX;
	pos->y = RADOR_CY - r;

	angle = 64;
	num = 0;
	for(i = 1; i < 5; i++){
		angle += 51;
		if(--(num) < 0){ num = 4; }
		if(num == 2){ angle++; }
		r = PARAM_TO_R(*param);
		param++;

		pos[num].x = (((s32)(r * sin_cos_table[angle+64]))>>8) + RADOR_CX;
		pos[num].y = RADOR_CY - (((s32)(r * sin_cos_table[angle]))>>8);

		// 誤差を補正
		if(num <= 2){
			if(!(r==32 && num==2)){
				pos[num].x++;
			}
		}
	}
}

void TNaviSub_ParamToPos(u8 *param, POS *pos)
{
	calc_param_to_pos(param, pos);
}

/*******************************************************
**	ウィンドウ領域に直線データを計算して入れる
*******************************************************/
enum { LEFT_LINE = 0, RIGHT_LINE };

//static void win_line(u8 *winarea, POS *bpoint, POS *epoint, u8 mode, u8 *winarea_next)
static void win_line(u16 *winarea, POS *bpoint, POS *epoint, u8 mode, u16 *winarea_next)
{
#define LINE_SHIFT  (10)
#define ROUND(x)    (((x)>>(LINE_SHIFT-1))&1)


	u16  *end_area;
	u16 height, top, bottom, end_x, i;
	s32 x, step;

	step = 0;
	if(bpoint->y < epoint->y){
		top = bpoint->y;
		bottom = epoint->y;
		x = bpoint->x << LINE_SHIFT;
		end_x = epoint->x;
		height = bottom - top;
		if(height){
			step = (((s32)(epoint->x - bpoint->x)) << LINE_SHIFT) / height;
		}
	}else{
		bottom = bpoint->y;
		top = epoint->y;
		x = epoint->x << LINE_SHIFT;
		end_x = bpoint->x;
		height = bottom - top;
		if(height){
			step = (((s32)(bpoint->x - epoint->x)) << LINE_SHIFT) / height;
		}
	}

	height++;
	// 移動制限なし
	if(winarea_next == NULL){
		winarea += ((top - RADOR_TOP) * 2);
		for(i = 0; i < height; i++){
			winarea[mode] = ((x >> LINE_SHIFT)) + ROUND(x) + mode;
			x += step;
			winarea += 2;
		}
		end_area = winarea - 2;
	// ボトムライン：右下がり
	}else if(step > 0){
		winarea_next += ((top - RADOR_TOP) * 2);
		for(i = 0; i < height; i++){
			if(x >= (RADOR_CX << LINE_SHIFT)){
				break;
			}
			winarea_next[mode] = (x >> LINE_SHIFT) + ROUND(x) + mode;
			x += step;
			winarea_next += 2;
		}
		NaviWork->bottom_cy = top + i;
		winarea += ((NaviWork->bottom_cy - RADOR_TOP) * 2);
		for( ; i < height; i++){
			winarea[mode] = (x >> LINE_SHIFT) + ROUND(x) + mode;
			x += step;
			winarea += 2;
		}
		end_area = winarea - 2;
	// ボトムライン：左下がり
	}else if(step < 0){
		winarea += ((top - RADOR_TOP) * 2);
		for(i = 0; i < height; i++){
			winarea[mode] = (x >> LINE_SHIFT) + ROUND(x) + mode;
			if(x < (RADOR_CX << LINE_SHIFT)){
				winarea[mode] = RADOR_CX;
				break;
			}
			x += step;
			winarea += 2;
		}
		NaviWork->bottom_cy = top + i;
		winarea_next += ((NaviWork->bottom_cy - RADOR_TOP) * 2);
		for( ; i < height; i++){
			winarea_next[mode] = (x >> LINE_SHIFT) + ROUND(x) + mode;
			x += step;
			winarea_next += 2;
		}
		end_area = winarea_next - 2;

	// ボトムライン：水平
	}else{
		NaviWork->bottom_cy = top;
		winarea += ((top - RADOR_TOP) * 2);
		winarea_next += ((top - RADOR_TOP) * 2);
		winarea[RIGHT_LINE] = bpoint->x + 1;
		winarea_next[LEFT_LINE] = epoint->x;
		winarea_next[RIGHT_LINE] = RADOR_CX;
		return;
	}
	end_area[mode] = end_x + mode;

#undef LINE_SHIFT
#undef DECIMAL_MASK
}
/*******************************************************
**	右ウィンドウ領域を計算
*******************************************************/
static void calc_rwin_area(POS *pos)
{
	u8 mode;
	u16 top, i, bottom_line;

	if(pos[0].y < pos[1].y){
		top = pos[0].y;
		win_line(NaviWork->rwin_x[0], pos, pos + 1, RIGHT_LINE, NULL);
	}else{
		top = pos[1].y;
		win_line(NaviWork->rwin_x[0], pos + 1, pos, LEFT_LINE, NULL);
	}

	win_line(NaviWork->rwin_x[0], pos + 1, pos + 2, RIGHT_LINE, NULL);

	mode = (pos[2].y > pos[3].y)? LEFT_LINE : RIGHT_LINE;
	win_line(NaviWork->rwin_x[0], pos + 2, pos + 3, mode, NaviWork->lwin_x[0]);

//	max = (pos[0].y < top)? top : pos[0].y;
	for(i = RADOR_TOP; i < top; i++){
		NaviWork->rwin_x[i-RADOR_TOP][0] = 0;
		NaviWork->rwin_x[i-RADOR_TOP][1] = 0;
	}
	for(i = pos[0].y; i <= NaviWork->bottom_cy; i++){
		NaviWork->rwin_x[i-RADOR_TOP][0] = RADOR_CX;
	}
	bottom_line = (NaviWork->bottom_cy < pos[2].y)? pos[2].y : NaviWork->bottom_cy;
	for(i = bottom_line+1; i <= RADOR_BOTTOM; i++){
		NaviWork->rwin_x[i-RADOR_TOP][0] = 0;
		NaviWork->rwin_x[i-RADOR_TOP][1] = 0;
	}
}
/*******************************************************
**	左ウィンドウ領域を計算
*******************************************************/
static void calc_lwin_area(POS *pos)
{
	u16 top, bottom_line, i;

	if(pos[0].y < pos[4].y){
		top = pos[0].y;
		win_line(NaviWork->lwin_x[0], pos, pos + 4, LEFT_LINE, NULL);
	}else{
		top = pos[4].y;
		win_line(NaviWork->lwin_x[0], pos + 4, pos, RIGHT_LINE, NULL);
	}

	win_line(NaviWork->lwin_x[0], pos + 4, pos + 3, LEFT_LINE, NULL);

	for(i = RADOR_TOP; i < top; i++){
		NaviWork->lwin_x[i-RADOR_TOP][0] = 0;
		NaviWork->lwin_x[i-RADOR_TOP][1] = 0;
	}
	for(i = pos[0].y; i <= NaviWork->bottom_cy; i++){
		NaviWork->lwin_x[i-RADOR_TOP][1] = RADOR_CX;
	}
	bottom_line = (NaviWork->bottom_cy < (pos[3].y+1))? (pos[3].y+1) : NaviWork->bottom_cy;
	for(i = bottom_line; i <= RADOR_BOTTOM; i++){
		NaviWork->lwin_x[i-RADOR_TOP][0] = 0;
		NaviWork->lwin_x[i-RADOR_TOP][1] = 0;
	}
}
/***********************************************
**	レーダー用ラスター初期化処理
***********************************************/
void TNaviSub_LadorLasterInitBegin(void)
{
	NaviWork->laster_init_prog = 0;
}
u8 TNaviSub_LadorLasterInitMain(void)
{
	switch(NaviWork->laster_init_prog){
	case 0:
		LasterWorkInit();
		break;

	case 1:
		{
			LasterData  LD = {
				(void*)REG_WINCNT,
				H_DMA_ENABLE32,
				LASTER_NORMAL,
				0,
			};
			LasterDmaSet(LD);
		}
		NaviWork->laster_init_prog++;
		return 0;

	default:
		return 0;
	}
	NaviWork->laster_init_prog++;
	return 1;
}
void TNaviSub_LadorLasterQuit(void)
{
	LasterSys.TransType = LASTER_END;
	LasterVblank();
}
/***********************************************************************
**	レーダーエリア計算
***********************************************************************/
void TNaviSub_CalcRador(void)
{
	if(NaviWork->calc_win_flag){
		u16 i;
		calc_rwin_area(NaviWork->rador_point);
		calc_lwin_area(NaviWork->rador_point);

		for(i = 0; i < RADOR_HEIGHT; i++)
		{
			LasterBuffer[1][(RADOR_TOP-1+i)*2] = LasterBuffer[0][(RADOR_TOP-1+i)*2] = (NaviWork->rwin_x[i][0] << 8) | (NaviWork->rwin_x[i][1]);
			LasterBuffer[1][(RADOR_TOP-1+i)*2+1] = LasterBuffer[0][(RADOR_TOP-1+i)*2+1] = (NaviWork->lwin_x[i][0] << 8) | (NaviWork->lwin_x[i][1]);
		}
		
		NaviWork->calc_win_flag = 0;
	}
}
// キューブデモ画面用計算
// up ... データエリア全体の上昇幅
void CubeDemo_CalcRador(u8 up)
{
	if(NaviWork->calc_win_flag){
		u16 i, line;

		calc_rwin_area(NaviWork->rador_point);
		calc_lwin_area(NaviWork->rador_point);

		line = (RADOR_TOP-1-up)*2;

		for(i = 0; i < RADOR_HEIGHT; i++)
		{
			LasterBuffer[1][line] = LasterBuffer[0][line] = (NaviWork->rwin_x[i][0] << 8) | (NaviWork->rwin_x[i][1]);
			LasterBuffer[1][line+1] = LasterBuffer[0][line+1] = (NaviWork->lwin_x[i][0] << 8) | (NaviWork->lwin_x[i][1]);
			line += 2;
		}
		
		NaviWork->calc_win_flag = 0;
	}
}
/*====================================================================*/
/*  リスト用キーリード                                                */
/*====================================================================*/
static u8 listkey_up(void);
static u8 listkey_down(void);
static u8 listkey_pageup(void);
static u8 listkey_pagedown(void);
static void listpos_inc(s16 val);

/***********************************************
**	キーリードメイン
**
**	return   enum LISTKEY
**
***********************************************/
u8 TNaviSub_ListKeyRead(void)
{
	if(sys.Repeat & U_KEY){
		return listkey_up();
	}
	if(sys.Repeat & D_KEY){
		return listkey_down();
	}
	if(sys.Repeat & L_KEY){
		return listkey_pageup();
	}
	if(sys.Repeat & R_KEY){
		return listkey_pagedown();
	}
	return LISTKEY_NOMOVE;
}
static u8 listkey_up(void)
{
	if(NaviWork->list_rank == 0){
		return LISTKEY_NOMOVE;
	}

	if(NaviWork->list_scroll_flg){
		if(NaviWork->list_cursor_pos == 0){
			TNaviBG_ListScrollInit(-1);
			listpos_inc(-1);
			return LISTKEY_SCROLL;
		}
	}

	NaviWork->list_cursor_pos--;
	if(NaviWork->list_scroll_flg == 0){
		if(NaviWork->list_cursor_pos < 0){
			NaviWork->list_cursor_pos = NaviWork->list_bottom;
		}
	}
	NaviWork->list_rank = NaviWork->list_top + NaviWork->list_cursor_pos;
	if(NaviWork->list_rank > NaviWork->list_max){
		NaviWork->list_rank -= (NaviWork->list_max + 1);
	}
	return LISTKEY_MOVE;
}
static u8 listkey_down(void)
{
	if(NaviWork->list_rank == NaviWork->list_max){
		return LISTKEY_NOMOVE;
	}

	if(NaviWork->list_scroll_flg){
		if(NaviWork->list_cursor_pos == (LIST_MAX-1)){
			TNaviBG_ListScrollInit(1);
			listpos_inc(1);
			return LISTKEY_SCROLL;
		}
	}

	NaviWork->list_cursor_pos++;
	if(NaviWork->list_scroll_flg == 0){
		if(NaviWork->list_cursor_pos > NaviWork->list_bottom){
			NaviWork->list_cursor_pos = 0;
		}
	}
	NaviWork->list_rank = NaviWork->list_top + NaviWork->list_cursor_pos;
	if(NaviWork->list_rank > NaviWork->list_max){
		NaviWork->list_rank -= (NaviWork->list_max + 1);
	}
	return LISTKEY_MOVE;
}
static u8 listkey_pageup(void)
{
	s16 scr_lines;

	if(NaviWork->list_top == 0 ||
	   NaviWork->list_scroll_flg == 0)
	{
		return LISTKEY_NOMOVE;
	}

	scr_lines = (NaviWork->list_top < LIST_MAX)? -(NaviWork->list_top) : -LIST_MAX;

	TNaviBG_ListScrollInit(scr_lines);
	listpos_inc(scr_lines);

	return LISTKEY_SCROLL;
}
static u8 listkey_pagedown(void)
{
	s16 scr_lines;

	if(NaviWork->list_bottom == NaviWork->list_max ||
	   NaviWork->list_scroll_flg == 0
	){
		return LISTKEY_NOMOVE;
	}

	scr_lines = NaviWork->list_max - NaviWork->list_bottom;
	if(scr_lines > LIST_MAX){ scr_lines = LIST_MAX; }

	TNaviBG_ListScrollInit(scr_lines);
	listpos_inc(scr_lines);
	return LISTKEY_SCROLL;
}

static void listpos_inc(s16 val)
{
	NaviWork->list_top += val;
	if(NaviWork->list_top > NaviWork->list_max){
		NaviWork->list_top -= (NaviWork->list_max + 1);
	}
	if(NaviWork->list_top < 0){
		NaviWork->list_top += (NaviWork->list_max + 1);
	}

	NaviWork->list_bottom += val;
	if(NaviWork->list_bottom > NaviWork->list_max){
		NaviWork->list_bottom -= (NaviWork->list_max + 1);
	}
	if(NaviWork->list_bottom < 0){
		NaviWork->list_bottom += (NaviWork->list_max + 1);
	}

	NaviWork->list_rank += val;
	if(NaviWork->list_rank > NaviWork->list_max){
		NaviWork->list_rank -= (NaviWork->list_max + 1);
	}
	if(NaviWork->list_rank < 0){
		NaviWork->list_rank += (NaviWork->list_max + 1);
	}

}
/*====================================================================*/
/*  リスト画面復帰                                                    */
/*====================================================================*/
void TNaviSub_ListRecover(void)
{
	if(NaviWork->list_scroll_flg){
		if(NaviWork->condition_poke_sel < (NaviWork->list_max - (LIST_MAX-1))){
			NaviWork->list_cursor_pos = 0;
			NaviWork->list_top = NaviWork->condition_poke_sel;
			NaviWork->list_rank = NaviWork->condition_poke_sel;
			NaviWork->list_bottom = NaviWork->list_top + (LIST_MAX-1);
			if(NaviWork->list_bottom > NaviWork->list_max){
				NaviWork->list_bottom -= (NaviWork->list_max + 1);
			}
		}else{
			NaviWork->list_top = NaviWork->list_max - (LIST_MAX-1);
			NaviWork->list_bottom = NaviWork->list_max;
			NaviWork->list_rank = NaviWork->condition_poke_sel;
			NaviWork->list_cursor_pos = (LIST_MAX-1) - (NaviWork->list_max - NaviWork->list_rank);
		}
	}else{
		NaviWork->list_cursor_pos = NaviWork->condition_poke_sel;
		NaviWork->list_rank = NaviWork->condition_poke_sel;
	}
}
/*====================================================================*/
/*  リボン画面用データ処理                                            */
/*====================================================================*/
//------------------------------------------------//
// ↓enum RIBBON_TYPE と順番が一致するように！！  //
//------------------------------------------------//
static const u16 RibbonPokeParaID[] = 
{
	ID_champ_ribbon,
	ID_stylemedal, ID_beautifulmedal, ID_cutemedal, 
	ID_clevermedal, ID_strongmedal, 
	ID_winning_ribbon, ID_victory_ribbon, ID_bromide_ribbon,ID_ganba_ribbon,
	ID_marine_ribbon, ID_land_ribbon, ID_sky_ribbon,
	ID_country_ribbon, ID_national_ribbon,
	ID_earth_ribbon, ID_world_ribbon,
};
/*******************************************************
**	リボンを持っているポケモンがいるか？
*******************************************************/
#define RIBBON_SEARCH_UNIT  (10)
void TNaviSub_RibbonPokeCheckInit(void)
{
	NaviWork->sort_box = 0;
	NaviWork->sort_poke = 0;
	NaviWork->search_ribbon_result = -1;  // -1:未確定

	if(NaviWork->comm_flg == FALSE){
		while(1){
			if(!TNaviSub_RibbonPokeCheck()){ break; }
		}
	}
}
u8 TNaviSub_RibbonPokeCheck(void)
{
	u16 i;

	if(NaviWork->search_ribbon_result != -1)
	{
		return 0;
	}

	switch(NaviWork->sort_box){
	default:
		for(i = 0 ; i < RIBBON_SEARCH_UNIT; i++){
			if(PokePasoParaGet(&(BoxData.PPPBox[NaviWork->sort_box][NaviWork->sort_poke]), ID_ribbon_cnt))
			{
				NaviWork->search_ribbon_result = 1;
				return 0;
			}
			if(PokePasoParaGet(&(BoxData.PPPBox[NaviWork->sort_box+(BOX_KAZU/2)][NaviWork->sort_poke]), ID_ribbon_cnt))
			{
				NaviWork->search_ribbon_result = 1;
				return 0;
			}
			if(++(NaviWork->sort_poke) >= BOX_PM_KAZU){
				NaviWork->sort_poke = 0;
				if(++(NaviWork->sort_box) >= (BOX_KAZU/2)){
					break;
				}
			}
		}
		break;

	case BOX_KAZU/2:
		NaviWork->search_ribbon_result = 0;
		for(i = 0; i < TEMOTI_POKEMAX; i++){
			if(PokeParaGet(PokeParaMine+i, ID_ribbon_cnt)){
				NaviWork->search_ribbon_result = 1;
				break;
			}
		}
		NaviWork->sort_box++;
		return 0;

	case (BOX_KAZU/2)+1:
		return 0;
	}
	return 1;
}
/*******************************************************
**	リボンリスト用データソート
*******************************************************/
void TNaviSub_RibbonSortInit(void)
{
	NaviWork->sort_box = 0;
	NaviWork->sort_poke = 0;
	

	init_sort();

	if(NaviWork->comm_flg == FALSE)
	{
		while(1){
			if(!TNaviSub_RibbonSort()){ break; }
		}
	}
}
u8 TNaviSub_RibbonSort(void)
{
	POKE_SORT_DATA data;
	u16 i;
	u8 param;

	switch(NaviWork->sort_box){
	default:
		data.enable = 1;
		for(i = 0; i < RIBBON_SORT_UNIT; i++)
		{
			param = PokePasoParaGet(&(BoxData.PPPBox[NaviWork->sort_box][NaviWork->sort_poke]), ID_ribbon_cnt);
			if(param)
			{
				data.box = NaviWork->sort_box;
				data.poke = NaviWork->sort_poke;
				data.param = param;
				add_new_sortdata(&data);
			}

			if(++(NaviWork->sort_poke) == BOX_PM_KAZU)
			{
				NaviWork->sort_poke = 0;
				if(++(NaviWork->sort_box) == BOX_KAZU)
				{
					break;
				}
			}
		}
		break;

	case BOX_KAZU:
		data.enable = 1;
		data.box = BOX_KAZU;
		for(i = 0; i < TEMOTI_POKEMAX; i++)
		{
			param = PokeParaGet(PokeParaMine+i, ID_ribbon_cnt);
			if(param)
			{
				data.poke = i;
				data.param = param;
				add_new_sortdata(&data);
			}
		}
		finish_sort();
		NaviWork->sort_box++;
		return 0;

	case BOX_KAZU+1:
		return 0;
	}

	return 1;

}
/*******************************************************
**	リボン画面用データ初期化
*******************************************************/
void TNaviSub_RibbonDataInit(void)
{
	u32 ribbon_flg;
	u16 i, j;
	u8  ribbon_cnt, ribbon_type, ribbon_type_add;

	// ポケモン名・画像データを０番のワークエリアにセット
	TNaviSub_CopyPokeDatStr(NaviWork->poke_name[0], NaviWork->list_rank, 0);
	set_poke_image(NaviWork->list_rank, 0);
	NaviWork->condition_poke_sel = NaviWork->list_rank;

	// 所有リボンの個所に獲得フラグをセット
	NaviWork->ribbon_cnt = 0;
	ribbon_type = CHAMP_RIBBON;
	ribbon_flg = TNaviSub_PokeParaGet(
			NaviWork->sort_data[NaviWork->list_rank].box,
			NaviWork->sort_data[NaviWork->list_rank].poke,
			ID_ribbon_bit, NULL
	);

	NaviWork->event_ribbon_cnt = 0;
	for(i = 0; i < NELEMS(RibbonPokeParaID); i++)
	{
		switch(RibbonPokeParaID[i]){
		case ID_stylemedal:
		case ID_beautifulmedal:
		case ID_cutemedal:
		case ID_clevermedal:
		case ID_strongmedal:
			ribbon_cnt = ribbon_flg & 7;
			ribbon_flg >>= 3;
			ribbon_type_add = 4;
			break;

		default:
			ribbon_cnt = ribbon_flg & 1;
			ribbon_flg >>= 1;
			ribbon_type_add = 1;
			break;
		}

		for(j = 0; j < ribbon_cnt; j++)
		{
			NaviWork->ribbon_type[NaviWork->ribbon_cnt++] = ribbon_type + j;
		}

		if(ribbon_cnt && IS_EVENT_RIBBON(ribbon_type)){
			NaviWork->event_ribbon_cnt++;
		}

		ribbon_type += ribbon_type_add;
	}

	// カーソル位置など初期化
	if(NaviWork->ribbon_cnt != NaviWork->event_ribbon_cnt){
		NaviWork->ribbon_cursor_x = 0;
		NaviWork->ribbon_cursor_y = 0;
	}else{
		// イベントリボンしか無いケース
		NaviWork->ribbon_cursor_x = 0;
		NaviWork->ribbon_cursor_y = RIBBON_FRAME_Y - 1;
	}


	ribbon_cnt = NaviWork->ribbon_cnt - NaviWork->event_ribbon_cnt;
	for(i = 0; i < (RIBBON_FRAME_Y-1); i++){
		if(ribbon_cnt >= RIBBON_FRAME_X){
			NaviWork->ribbon_xlimit[i] = RIBBON_FRAME_X;
			ribbon_cnt -= RIBBON_FRAME_X;
		}else{
			NaviWork->ribbon_xlimit[i] = ribbon_cnt;
			ribbon_cnt = 0;
		}
	}
	NaviWork->ribbon_xlimit[i] = NaviWork->event_ribbon_cnt;
}
/*******************************************************
**	リボン画面キーリード
*******************************************************/
u8 TNaviSub_RibonKeyRead(void)
{
	s8 x, y, ret;

	x = NaviWork->ribbon_cursor_x;
	y = NaviWork->ribbon_cursor_y;
	ret = RIBBON_KEY_CHANGE;

	do{
		if(sys.Repeat & U_KEY){
			if(y > 0){
				while(y > 0)
				{
					y--;
					if(NaviWork->ribbon_xlimit[y] != 0){ break; }
				}
				if(NaviWork->ribbon_xlimit[y] != 0)
				{
					if(x >= NaviWork->ribbon_xlimit[y])
					{
						x = NaviWork->ribbon_xlimit[y] - 1;
					}
					break;
				}else{
					y = NaviWork->ribbon_cursor_y;
				}
			}
		}
		if(sys.Repeat & D_KEY){
			if(y < (RIBBON_FRAME_Y-1))
			{
				while(y < (RIBBON_FRAME_Y-1))
				{
					y++;
					if(NaviWork->ribbon_xlimit[y] != 0){ break; }
				}
				if(NaviWork->ribbon_xlimit[y] != 0)
				{
					if(x >= NaviWork->ribbon_xlimit[y])
					{
						x = NaviWork->ribbon_xlimit[y] - 1;
					}
					break;
				}else{
					y = NaviWork->ribbon_cursor_y;
				}
			}
		}
		if(sys.Repeat & L_KEY){
			if(x > 0){
				x--;
				break;
			}
		}
		if(sys.Repeat & R_KEY){
			if(x < (NaviWork->ribbon_xlimit[y] - 1))
			{
				x++;
				break;
			}
		}

		ret = RIBBON_KEY_DEFAULT;

	}while(0);

	if(ret == RIBBON_KEY_CHANGE){
		if(x != NaviWork->ribbon_cursor_x || y != NaviWork->ribbon_cursor_y)
		{
			NaviWork->ribbon_cursor_x = x;
			NaviWork->ribbon_cursor_y = y;
		}
		else
		{
			ret = RIBBON_KEY_DEFAULT;
		}
	}

	return ret;
}

/*******************************************************
**	リボン画面ポケモン変更
*******************************************************/
//----------------------------------------
//  初期化
//  vector  -1:上へ  1:下へ
//----------------------------------------
void TNaviSub_RibbonPokeChangeInit(s8 vector)
{
	NaviWork->list_rank += vector;
	if(NaviWork->list_rank < 0){
		NaviWork->list_rank = NaviWork->list_max;
	}
	if(NaviWork->list_rank > NaviWork->list_max){
		NaviWork->list_rank = 0;
	}
	NaviWork->ribbon_change_vector = vector;
	NaviWork->condition_poke_sel = NaviWork->list_rank;

	*(vu16*)REG_WININ =  (WIN_ALL_ON<<8)  | (WIN_ALL_ON ^ WIN_BG3_ON);
	*(vu16*)REG_WINOUT = (WIN_ALL_ON<<8) | WIN_ALL_ON;
	*(vu16*)REG_WIN0H = (88<<8)|240;
	*(vu16*)REG_WIN0V = (32<<8)|96;

	NaviWork->condition_change_prog = 0;
}
//----------------------------------------
// 実行
// return:  1:継続中  0:終了
//----------------------------------------
u8 TNaviSub_RibbonPokeChange(void)
{
	switch(NaviWork->condition_change_prog){
	case 0:
		if(!TNaviBG_PokeWinDown())
		{
			NaviWork->condition_change_prog++;
		}
		break;
	case 1:
		*(vu16*)REG_DISPCNT |= DISP_WIN0_ON;
		TNaviBG_EraceRibbonPokeInfo();
		TNaviSub_RibbonDataInit();
		NaviWork->condition_change_prog++;
		break;
	case 2:
		TNaviBG_RibbonMapMake();
		NaviWork->condition_change_prog++;
		break;
	case 3:
		TNaviBG_RibbonMapTrans();
		NaviWork->condition_change_prog++;
		break;
	case 4:
		set_poke_image(NaviWork->list_rank, 0);
		NaviWork->condition_change_prog++;
		break;
	case 5:
		TNaviObj_UpdatePokeImg(0);
		NaviWork->condition_change_prog++;
		break;
	case 6:
		if(!TNaviBG_PokeWinUp()){
			TNaviBG_WriteRibbonPokeInfo();
			*(vu16*)REG_DISPCNT &= (~DISP_WIN0_ON);
			NaviWork->condition_change_prog++;
			return 0;
		}
		break;
	default:
		return 0;
	}
	return 1;
}

/*====================================================================*/
/*                                                                    */
/*  トレーナーアイ関連                                                */
/*                                                                    */
/*====================================================================*/
#define TRAINER_IMG_HOFS  (-72)  // 隠れているとき
#define TRAINER_IMG_SPEED (8)    // 1syncあたりの移動幅

/*====================================================*/
/*  リスト初期化                                      */
/*====================================================*/
void TNaviSub_TrainerListInit(void)
{
	// 再戦トレーナー以外に登録するトレーナー
	static const struct{
		u16  id;
		u16  Wpos;
	}TrainerID[] = {
		{ LEADERW_01,  MAPPOS_C_104 },
		{ LEADERM_02,  MAPPOS_T_103 },
		{ LEADERM_03,  MAPPOS_C_103 },
		{ LEADERW_04,  MAPPOS_T_104 },
		{ LEADERM_05,  MAPPOS_C_101 },
		{ LEADERW_06,  MAPPOS_C_105 },
		{ LEADER_07,   MAPPOS_C_107 },
		{ LEADERM_08,  MAPPOS_C_108 },
		{ BIG4M_01,    MAPPOS_C_109 },
		{ BIG4W_02,    MAPPOS_C_109 },
		{ BIG4W_03,    MAPPOS_C_109 },
		{ BIG4M_04,    MAPPOS_C_109 },
		{ CHAMPION_01, MAPPOS_C_109 },
	};
	const MapTotalData *map;
	u16 i;

	NaviWork->trainer_count = 0;

	// 再戦トレーナー
	for(i = 0; i < REVENGE_DATA_MAX; i++)
	{
		if(CheckTrainerFlagByID(RevengeDataTbl[i].id[0]))
		{
			NaviWork->trainer_data[NaviWork->trainer_count].id = RevengeDataTbl[i].id[0];
			NaviWork->trainer_data[NaviWork->trainer_count].regist_id = i;
			NaviWork->trainer_data[NaviWork->trainer_count].revenge_flag = Fld.RevengeFlag[i];
			map = GetTotalMapData(RevengeDataTbl[i].div_id, RevengeDataTbl[i].map_id);
			NaviWork->trainer_data[NaviWork->trainer_count].Wpos = map->WorldPos;
			NaviWork->trainer_count++;
		}
	}

	// 再戦トレーナー以外
	for(i = 0; i < NELEMS(TrainerID); i++)
	{
		if(CheckTrainerFlagByID(TrainerID[i].id))
		{
			NaviWork->trainer_data[NaviWork->trainer_count].id = TrainerID[i].id;
			NaviWork->trainer_data[NaviWork->trainer_count].Wpos = TrainerID[i].Wpos;
			NaviWork->trainer_data[NaviWork->trainer_count].revenge_flag = 0;

#if 1
//			↓本来はこちらが正しい
			NaviWork->trainer_data[NaviWork->trainer_count].regist_id = REVENGE_DATA_MAX + i;
#else
//			↓現在はトレーナーデータが用意されていないためこうしている
			NaviWork->trainer_data[NaviWork->trainer_count].regist_id = 100 + i;
#endif

			NaviWork->trainer_count++;
		}
	}

	NaviWork->list_cursor_pos = 0;
	NaviWork->list_top = 0;
	NaviWork->list_rank = 0;
	NaviWork->list_bottom = ((NaviWork->trainer_count <= LIST_MAX)? NaviWork->trainer_count : LIST_MAX) - 1;
	NaviWork->list_max = NaviWork->trainer_count - 1;
	NaviWork->list_scroll_flg = (NaviWork->list_max >= LIST_MAX);


}
/*====================================================*/
/*  データ画面初期化                                  */
/*====================================================*/
void TNaviSub_TrainerDataInit(void)
{
	u8 work_no;
	// とりあえず今は１件分の画像データをワークに展開しているだけ

	work_no = 0;

	NaviWork->PokeSelNow = work_no;
	TNaviSub_DecordTrainerCell(work_no);
	NaviWork->trainer_hofs = TRAINER_IMG_HOFS;

	TNaviObj_UpdateTrainerImg(work_no);

	NaviWork->condition_poke_sel = NaviWork->list_rank;
}
void TNaviSub_DecordTrainerCell(u8 work_no)
{
	u16 type;

	type = NaviWork->trainer_data[NaviWork->list_rank].id;
	type = TD[type].chrnum;

	DecordPokeCellMake((CellData*)&TRFObjDataCell[type], trfpara[type].size, 1, 
		(void *)(NaviWork->PokeCellWork),(void *)(NaviWork->PokeCell[work_no]), type);

	LZ77UnCompWram((void*)(TRFObjDataPal[type].pal_data), (void *)(NaviWork->PokePal[work_no]));
}
/*====================================================*/
/*  トレーナー画像スライドイン・アウト                */
/*====================================================*/
u8 TNaviSub_TrainerImgIn(void)
{
	if(NaviWork->trainer_hofs == 0){ return 0; }

	NaviWork->trainer_hofs += TRAINER_IMG_SPEED;
	if(NaviWork->trainer_hofs >= 0){
		NaviWork->trainer_hofs = 0;
		return 0;
	}
	return 1;
}
u8 TNaviSub_TrainerImgOut(void)
{
	if(NaviWork->trainer_hofs == TRAINER_IMG_HOFS){ return 0; }

	NaviWork->trainer_hofs -= TRAINER_IMG_SPEED;
	if(NaviWork->trainer_hofs <= TRAINER_IMG_HOFS){
		NaviWork->trainer_hofs = TRAINER_IMG_HOFS;
		return 0;
	}
	return 1;
}
/*====================================================*/
/*  再戦アイコンのエフェクト                          */
/*====================================================*/
#define ICONEFF_OX  (232)
#define ICONEFF_OY  (8)
#define ICON_INTERVAL  (8)  // チカチカする間隔

void TNaviSub_RevengeIconEff_Init(void)
{
	NaviWork->revenge_icon_timer = 0;
	NaviWork->revenge_icon_flg = 0;

	*(vu16*)REG_BLDCNT = BLD_BG3_1ST | BLD_DOWN_MODE;  // スクロール文字ＢＧ
	*(vu16*)REG_BLDY = 0x00;

	*(vu16*)REG_WININ =  0x3f3f;   // 内部：特殊効果あり
	*(vu16*)REG_WINOUT = 0x1f1f;  // 外部：特殊効果なし

	TNaviSub_RevengeIconEff_Mode(0);

}
void TNaviSub_RevengeIconEff(void)
{
	if(++(NaviWork->revenge_icon_timer) > ICON_INTERVAL)
	{
		NaviWork->revenge_icon_timer = 0;
		NaviWork->revenge_icon_flg++;
		if(NaviWork->revenge_icon_flg & 1){
			*(vu16*)REG_BLDY = 0x06;
		}else{
			*(vu16*)REG_BLDY = 0x00;
		}
	}
}
// モード設定  0:ﾘｽﾄﾓｰﾄﾞ/1:ﾃﾞｰﾀﾓｰﾄﾞ
void TNaviSub_RevengeIconEff_Mode(u8 mode)
{
	if(mode == 0){
		// 右端１列全部
		*(vu16*)REG_WIN0H = (ICONEFF_OX << 8) | (ICONEFF_OX+8);
		*(vu16*)REG_WIN0V = (ICONEFF_OY << 8) | (ICONEFF_OY+LIST_MAX*16);
		// 右上１文字分のみ
	}else{
		*(vu16*)REG_WIN0H = (ICONEFF_OX << 8) | (ICONEFF_OX+8);
		*(vu16*)REG_WIN0V = (ICONEFF_OY << 8) | (ICONEFF_OY+16);
	}

}
void TNaviSub_RevengeIconEff_Quit(void)
{
	*(vu16*)REG_BLDCNT = 0;
	*(vu16*)REG_BLDY = 0x00;
}
/*====================================================*/
/*  トレーナーデータ文字列作成                        */
/*====================================================*/
void TNaviSub_MakeTrainerStr(u8 *buf, u16 sort_no)
{
	const TrainerData *TDat;
	u8 *cp;

	TDat = &(TD[NaviWork->trainer_data[sort_no].id]);

	if(sort_no < NaviWork->trainer_count){
		buf[0] = spc_;
		cp = PM_strcpy_clear(buf+1, TrainerTypeName[TDat->type], spc_, 10);
		cp = PM_strcpy_clear(cp, TDat->name, spc_, 5);
	}else{
		PM_strclear(NaviWork->list_buf, spc_, LIST_STR_MAX);
	}
}
//----------------------------------------
// トレーナー切り替え（初期化）
// vector  -1:上へ  1:下へ
//----------------------------------------
void TNaviSub_TrainerChangeInit(s8 vector)
{
	NaviWork->list_rank += vector;
	if(NaviWork->list_rank < 0){
		NaviWork->list_rank = NaviWork->list_max;
	}
	if(NaviWork->list_rank > NaviWork->list_max){
		NaviWork->list_rank = 0;
	}
	NaviWork->ribbon_change_vector = vector;
	NaviWork->condition_poke_sel = NaviWork->list_rank;

	NaviWork->condition_change_prog = 0;
}
//----------------------------------------
// トレーナー切り替え（実行）
// return:  1:継続中  0:終了
//----------------------------------------
u8 TNaviSub_TrainerChange(void)
{
	switch(NaviWork->condition_change_prog){
	case 0:
		if(!TNaviSub_TrainerImgOut()){
			NaviWork->condition_change_prog++;
		}
		break;

	case 1:
		TNaviSub_DecordTrainerCell(0);
		NaviWork->condition_change_prog++;
		break;

	case 2:
		TNaviObj_UpdateTrainerImg(0);
		NaviWork->condition_change_prog++;
		break;

	case 3:
		TNaviSub_MakeTrainerStr(NaviWork->list_buf, NaviWork->list_rank);
		TEyeObjStrChange(NaviWork->list_buf);
		TNaviBG_UpdateTrainerName();
		TNaviBG_UpdateTrainerTimei(NaviWork->list_rank);
		NaviWork->condition_change_prog++;
		break;

	case 4:
		TNaviBG_WriteTrainerInfo_Begin();
		NaviWork->ribbon_change_subprog = 0;
		NaviWork->condition_change_prog++;
	case 5:
		if(NaviWork->ribbon_change_subprog < 2){
			TNaviBG_WriteTrainerInfo();
			NaviWork->ribbon_change_subprog++;
			break;
		}
		NaviWork->condition_change_prog++;
	case 6:
		if(TNaviSub_TrainerImgIn() == 0
		&& TNaviBG_WriteTrainerInfo() == 0
		){
			NaviWork->condition_change_prog++;
		}
		break;

	default:
		return 0;
	}
	return 1;
}
/*====================================================================*/
/*  てもちポケモンの毛並みレベルを再計算（キューブデモ用）            */
/*  no  てもちの何番目のポケモン？                                    */
/*                                                                    */
/*====================================================================*/
void TNaviSub_UpdateFurLv(u8 no)
{
	u8 fur;

	fur = PokeParaGet(PokeParaMine + no, ID_fur);
	NaviWork->poke_fur[NaviWork->PokeSelNow] = CALC_FUR_LEVEL(fur);
}
