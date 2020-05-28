/***********************************************************************
**	ボックス画面から使うサブルーチン群
**
***********************************************************************/
#include "common.h"
#include "fntequ.h"
#include "boxsub.h"
#include "actanm.h"
#include "box2.h"
#include "box_mode.h"
#include "poketool.h"
#include "palanm.h"
#include "fld_main.h"
#include "menu.h"
#include "task.h"
#include "intr.h"
#include "weather.h"
#include "script.h"
#include "window.h"
#include "calctool.h"
#include "scr_tool.h"
#include "fld_task.h"
#include "message.h"

/***********************************************************************
**	指定アドレスにフォントキャラ描画
**
**	str   描画文字列
**	dst   描画先アドレス
**	type  描画タイプ   DRAWTYPE_16TRANS   ... 8x16, 透過色有効
**                     DRAWTYPE_16NOTRANS ... 8x16, 透過色塗りつぶし
**                     DRAWTYPE_8TRANS    ... 8x8,  透過色有効
**                     DRAWTYPE_8NOTRANS  ... 8x8,  透過色塗りつぶし
**
**        ※現在、8x8 サイズのフォント指定には対応していない
**
**  line_size  １行あたりのバイト数（描画先）
**  bg_col      塗りつぶしの場合の背景色ナンバー
**
**  work_buf   ワークエリアアドレス（描画する文字ＣＧＸ領域の半分以上のサイズが必要）
**
***********************************************************************/

// フォントアドレス計算マクロ
#define	FONT8x16sDATAADRS(code)	( (u32)(font8x16s_Character) \
		+ (u32)( (code & 0xfff0) * 0x20 * 2 + (code & 0xf)*0x20 ) )

// フォントイメージ
extern u8 font8x16s_Character[];

void BoxDrawFont(const u8 *str, u8 *dst, u8 type, u16 line_size, u8 bg_col, u8 *work_buf)
{
	const u8 *src;
	u16 i, len;

	len = PM_strlen(str);

	if(type == DRAWTYPE_16TRANS){
		for(i = 0; i < len; i++){
			src = (const u8*)FONT8x16sDATAADRS(str[i]);
			CpuCopy(src, dst, 0x20, 16);
			CpuCopy(src+(16*0x20), dst+line_size, 0x20, 16);
			dst += 0x20;
		}
	}else{
		u8  bg_hi, hi, lo;
		u16 size, j, p, c;
		c = 0;
		bg_hi = (bg_col << 4);
		size = len * 0x20;
		for(j = 0; j < 2; j++){
			for(i = 0; i < len; i++){
				src = (u8*)FONT8x16sDATAADRS(str[i]) + (j * 16 * 0x20);
				for(p = 0; p < 32; p++){
					hi = (*src) & 0xf0;
					lo = (*src) & 0x0f;
					if(!hi){ hi = bg_hi; }
					if(!lo){ lo = bg_col; }
					work_buf[c++] = (hi | lo);
					src++;
				}
			}
			CpuCopy(work_buf, dst, size, 16);
			dst += line_size;
			c = 0;
		}
	}
}
/***********************************************************************
**	連続した領域に 32x16 ＯＢＪとして使用できるようにフォントキャラ描画
**
**	str   描画文字列
**	dst   描画先アドレス
**	type  描画タイプ   DRAWTYPE_16TRANS   ... 8x16, 透過色有効
**                     DRAWTYPE_16NOTRANS ... 8x16, 透過色塗りつぶし
**                     DRAWTYPE_8TRANS    ... 8x8,  透過色有効
**                     DRAWTYPE_8NOTRANS  ... 8x8,  透過色塗りつぶし
**
**        ※現在、8x8 サイズのフォント指定には対応していない
**
**  bg_col      塗りつぶしの場合の背景色ナンバー
**  work        ワークエリアアドレス（0x80 以上の領域が必要）
**
***********************************************************************/
void BoxDrawFont_32x16(const u8 *str, u8 *dst, u8 type, u8 bg_col, u8 *work)
{
	u8 buf[8];
	u16 i;
	u8 end = 0;

	while(!end){
		for(i = 0; i < 4; i++){
			if(*str == EOM_){
				if(i == 0){
					return;
				}
				end = 1;
				break;
			}
			buf[i] = *str++;
		}
		while(i < 4){
			buf[i++] = spc_;
		}
		buf[i] = EOM_;

		BoxDrawFont(buf, dst, type, 4*0x20, bg_col, work);
		dst += (8*0x20);
	}

}
/***********************************************************************
**	指定ボックスにいるポケモンの数を返す
**
**	box   ボックスナンバー
**
***********************************************************************/
u8 GetPasoBoxPokeCount(u8 box)
{
	u16 i, cnt;
	for(i = 0, cnt = 0; i < BOX_PM_KAZU; i++){
		if(NON_POKE != PokePasoParaGet(&(BoxData.PPPBox[box][i]), ID_monsno)){
			cnt++;
		}
	}
	return cnt;
}
/***********************************************************************
**	指定ボックスの、空いている場所を返す
**
**	box   ボックスナンバー
**
**	戻り値  空きがあれば    0 ～ (BOX_KAZU-1）の正の整数
**	        空きがなければ  -1
***********************************************************************/
s16 GetPasoBoxBlankPos(u8 box)
{
	u16 i;
	for(i = 0; i < BOX_PM_KAZU; i++){
		if(NON_POKE == PokePasoParaGet(&(BoxData.PPPBox[box][i]), ID_monsno)){
			return i;
		}
	}
	return -1;
}
/***********************************************************************
**	たまご以外のてもちポケモン数をカウント
**	reuturn ポケモン数
***********************************************************************/
u8 Box_CountMinePoke(void)
{
	u16 i, c;
	for(i = 0, c = 0; i < TEMOTI_POKEMAX; i++){
		if((PokeParaGet(PokeParaMine + i, ID_monsno) != NON_POKE)
		&& (PokeParaGet(PokeParaMine + i, ID_tamago_flag) == 0)
		){
			c++;
		}
	}
	return c;
}


// =================================================================
// Box_CountMinePokeExSub
// 概要  : たまごと瀕死以外のてもちポケモン数をカウントのサブルーチン
// 引数  : no :無視する指定の手持ちポケモンの場所
// 戻り値: u8 戦闘に参加できるポケモンの数
// =================================================================
u8 Box_CountMinePokeExSub(u8 no)
{
	u16 i, c;
	for(i = 0, c = 0; i < TEMOTI_POKEMAX; i++){						//[除外条件]
		if(i==no) continue;
		if((PokeParaGet(PokeParaMine + i, ID_monsno) != NON_POKE)	//ポケモンいない
		&& (PokeParaGet(PokeParaMine + i, ID_tamago_flag) == 0)		//タマゴ
		&& (PokeParaGet(PokeParaMine + i, ID_hp) != 0)				//瀕死
		){
			c++;
		}
	}
	return c;
	
}
/***********************************************************************
**  [スクリプト用]
**	たまごと瀕死以外のてもちポケモン数をカウント
**  指定のポケモンは飛ばしてカウントする（ScriptParameter0）
**
**	reuturn 戦闘に参加できるポケモンのポケモン数
***********************************************************************/
u8 Box_CountMinePokeEx(void)
{
	return Box_CountMinePokeExSub(ScriptParameter0);
}

/***********************************************************************
**	たまごを含むてもちポケモン数をカウント
**	reuturn ポケモン数
***********************************************************************/
u8 Box_CountMine(void)
{
	u16 i, c;
	for(i = 0, c = 0; i < TEMOTI_POKEMAX; i++){
		if(PokeParaGet(PokeParaMine + i, ID_monsno) != NON_POKE)
		{
			c++;
		}
	}
	return c;
}
/*==============================================
==	文字列コピー＆指定文字数までスペース詰め
==	dst  コピー先アドレス
==	src  コピー元文字列
==	len  文字数
==	return:  EOM_ アドレス
==============================================*/
u8* BoxStrClearCopy(u8 *dst, const u8 *src, u16 len)
{
	u8 *cp;

	cp = PM_strcpy(dst, src);
	while(cp < &dst[len]){
		*cp++ = spc_;
	}
	*cp = EOM_;
	return cp;
}
/***********************************************************************
**	矩形境域分のマップデータを指定位置に転送（256 x 256 モードのみ）
**
**	dst            転送先ブロックの先頭アドレス
**  dx,dy          転送先ブロック座標（0～29）
**  src            転送元マップデータアドレス
**  sx, sy         転送元ブロック座標（0～29）
**  width, height  転送矩形サイズ（0 ～ 29）
**  src_xblocks    転送元マップデータの横ブロック数
**
***********************************************************************/
void BoxTransMap(u16 *dest, u16 dx, u16 dy, const u16 *src, u16 sx, u16 sy, u16 width, u16 height, u16 src_xblocks)
{
	u16 size, i;

	size = width * sizeof(u16);
	dest += (dy * 32 + dx);
	src += (sy * src_xblocks + sx);
	for(i = 0; i < height; i++){
		CpuCopy(src, dest, size, 16);
		dest += 32;
		src += src_xblocks;
	}
}
/***********************************************************************
**	マップデータを指定矩形領域分ゼロクリア
**
**	addr           クリアするマップデータアドレス
**  x,y            クリア開始ブロック（0 ～ 29）
**  width, height  矩形サイズ（0 ～ 29）
**
***********************************************************************/
void BoxClearMap(u16 *addr, u16 x, u16 y, u16 width, u16 height)
{
	u16 i, size;

	addr += ((y * 32) + x);
	size = width * sizeof(u16);
	for(i = 0; i < height; i++){
//		DmaClear(3, 0, addr, size, 16);
		DIV_DMACLEAR(3, 0, addr, size, 16);
		addr += 32;
	}
}
/***********************************************************************
**	ボックスデータオフセットのインクリメント・デクリメント
**
**	array    ボックスデータ配列の先頭アドレス
**	now_pos  現在のオフセット
**	max      配列の要素数
**	type     NEXT_OFS   次のｵﾌｾｯﾄ（ﾎﾟｹﾓﾝのみ）
**	         PREV_OFS   前のｵﾌｾｯﾄ（ﾎﾟｹﾓﾝのみ)
**	         NEXT_OFS_TAMAGO   次のｵﾌｾｯﾄ（ﾀﾏｺﾞ含む）
**	         PREV_OFS_TAMAGO   前のｵﾌｾｯﾄ（ﾀﾏｺﾞ含む）
**
**	戻り値   0～max  の範囲でｵﾌｾｯﾄ値が返る。
**           有効なﾃﾞｰﾀが見つからなくなったら -1
**
***********************************************************************/
s16  BoxNextOffsetSearch(PokemonPasoParam *array, u8 now_pos, u8 max, u8 type)
{
	s16 next_pos, v;

	if(type == NEXT_OFS || type == NEXT_OFS_TAMAGO){
		v = 1;
	}else{
		v = -1;
	}

	// ﾀﾏｺﾞﾁｪｯｸなし
	if(type == NEXT_OFS_TAMAGO || type == PREV_OFS_TAMAGO)
	{
		next_pos = ((s8)now_pos) + v;
		while(next_pos >= 0 && next_pos <= max)
		{
			if(PokePasoParaGet(array + next_pos, ID_monsno) != NON_POKE)
			{
				return next_pos;
			}
			next_pos += v;
		}
	}
	// ﾀﾏｺﾞﾁｪｯｸあり
	else
	{
		next_pos = ((s8)now_pos) + v;
		while(next_pos >= 0 && next_pos <= max)
		{
			if((PokePasoParaGet(array + next_pos, ID_monsno) != NON_POKE)
			&& (PokePasoParaGet(array + next_pos, ID_tamago_flag) == 0) )
			{
				return next_pos;
			}
			next_pos += v;
		}
	}
	return -1;
}



/******************************************************************************/
/*                                                                            */
/*  ボックスメニュー（フィールド）                                            */
/*                                                                            */
/******************************************************************************/
/***********************************************************************
**	ボックス呼び出しメニュー表示＆選択                                **
***********************************************************************/
#define BOX_CALL_MENU_X  (13)
#define BOX_CALL_MENU_Y  (9)


static const MENU_ITEM BoxCallMenu[] =
{
	{ BoxCallMenu0, (void*)BoxInfoStr0 },
	{ BoxCallMenu1, (void*)BoxInfoStr1 },
	{ BoxCallMenu2, (void*)BoxInfoStr2 },
	{ BoxCallMenu3, (void*)BoxInfoStr3 },
};

static u8 BoxMenuSel = 0;

static void draw_boxmenu(u8 num);
static void box_field_recover(void);

//-------------------------------------------------------------------------
//	ボックス呼び出しメニュースタート
//	※スクリプトからタスク起動→スクリプト停止、
//	　という手順で制御が渡される
//	　復帰時にはContinueFieldScriptを呼び出して
//	　スクリプトを継続する必要がある
//	add by tama 2001.10.24
//-------------------------------------------------------------------------
static void box_menu_func_task(u8 id)
{
	TASK_TABLE *task = &TaskTable[id];
	switch(task->work[0]){
	case 0:
		draw_boxmenu(task->work[1]);
		NMenuTalkWinWrite();
		NMenuMsgWrite(BoxCallMenu[task->work[1]].ptr, MWIN_MSGXPOS, MWIN_MSGYPOS);
		task->work[0]++;
		break;

	case 1:
		if(FieldFadeinCheck()){
			task->work[0]++;
		}
		break;

	case 2:
		task->work[2] = NMenuVCursorControl();
		switch(task->work[2]){
		case CURSOR_DEFAULT_VALUE:
			task->work[3] = task->work[1];
			if(sys.Trg & U_KEY){
				if(--(task->work[3]) < 0){ task->work[3] = 3; }
			}
			if(sys.Trg & D_KEY){
				if(++(task->work[3]) > 3){ task->work[3] = 0; }
			}
			if(task->work[1] != task->work[3]){
				task->work[1] = task->work[3];
				NMenuMsgWrite(BoxCallMenu[task->work[1]].ptr, MWIN_MSGXPOS, MWIN_MSGYPOS);
			}
			return;

		case CURSOR_CANCEL_VALUE:
		case 3:
			NMenuBoxClear(0, 0, BOX_CALL_MENU_X, BOX_CALL_MENU_Y);
			ResetForceEvent();
			ContinueFieldScript();
			DelTask(id);
			return;

		default:
			// 「つれていく」＆てもちいっぱい
			if(task->work[2] == 0 && Box_CountMine() == TEMOTI_POKEMAX)
			{
				NMenuMsgWrite(BoxMenuAlert1, MWIN_MSGXPOS, MWIN_MSGYPOS);
				task->work[0] = 3;
				break;
			}
			// 「あずける」＆てもち一体
			if(task->work[2] == 1 && Box_CountMine() == 1)
			{
				NMenuMsgWrite(BoxMenuAlert0, MWIN_MSGXPOS, MWIN_MSGYPOS);
				task->work[0] = 3;
				break;
			}
			FieldFadeControl(FIELD_BLACK_OUT, 0);
			task->work[0] = 4;
			break;
		}
		break;

	// アラート表示ウェイト
	case 3:
		if(sys.Trg&(A_BUTTON|B_BUTTON)){
			NMenuMsgWrite(BoxCallMenu[task->work[1]].ptr, MWIN_MSGXPOS, MWIN_MSGYPOS);
			task->work[0] = 2;
			break;
		}
		if(sys.Trg&U_KEY){
			if(--(task->work[1]) < 0){ task->work[1] = 3; }
			NMenuVCursorSet(-1);
			task->work[1] = NMenuVCursorPosGet();
			NMenuMsgWrite(BoxCallMenu[task->work[1]].ptr, MWIN_MSGXPOS, MWIN_MSGYPOS);
			task->work[0] = 2;
			break;
		}
		if(sys.Trg&D_KEY){
			if(++(task->work[1]) > 3){ task->work[1] = 0; }
			NMenuVCursorSet(1);
			task->work[1] = NMenuVCursorPosGet();
			NMenuMsgWrite(BoxCallMenu[task->work[1]].ptr, MWIN_MSGXPOS, MWIN_MSGYPOS);
			task->work[0] = 2;
			break;
		}

		break;

	case 4:
		if(FadeData.fade_sw == 0){
			BoxIn(task->work[2]);
			DelTask(id);
		}
		break;

	}
}
/*******************************************************
**	メニュー選択開始
*******************************************************/
void BoxMenuStart(void)
{
	u16 task_no;

	task_no = AddTask( box_menu_func_task, 80 );
	TaskTable[task_no].work[0] = 0;
	TaskTable[task_no].work[1] = 0;

	SetForceEvent();
}
/*******************************************************
**	フィールド復帰
*******************************************************/
static void box_field_recover(void)
{
	u16 task_no;

	task_no = AddTask( box_menu_func_task, 80 );
	TaskTable[task_no].work[0] = 0;
	TaskTable[task_no].work[1] = BoxMenuSel;

	FieldFadeBlackInSet();
//	SetFieldPaletteBlack();
//	FieldFadeControl(FIELD_BLACK_IN, 0);
};

/*******************************************************
**	ボックスメニュー描画
*******************************************************/
static void draw_boxmenu(u8 num)
{
	NMenuWinBoxWrite(0, 0, BOX_CALL_MENU_X, BOX_CALL_MENU_Y);
	NMenuFixListWrite(2, 1, 4, BoxCallMenu);
	NMenuVCursorInit(1, 1, 4, num);
}
/*******************************************************
**	ボックス→フィールド復帰
*******************************************************/
void FieldBoxMenuRecover(void)
{
	BoxMenuSel = Work->mode;
	pFieldRecoverFunc = box_field_recover;
	MainProcChange(FieldMainRecover);
//	FieldFadeControl(FIELD_BLACK_IN, 0);
}

/******************************************************************************/
/*                                                                            */
/*  ボックスデータ初期化                                                      */
/*                                                                            */
/******************************************************************************/

/*==============================================================
==  ゲーム開始時
==============================================================*/
void InitBoxData(void)
{
	u8 *cp;
	u16 i, j;

	BoxData.CurrentBoxNo = 0;
// ボックスポケモン
	for(i=0; i < BOX_KAZU ;i++)
	{
		for(j=0; j < BOX_PM_KAZU ;j++)
		{
			PokePasoParaInit(&(BoxData.PPPBox[i][j]));
		}
	}

// ボックス名
	for(i = 0; i < BOX_KAZU; i++){
		cp = PM_strcpy(BoxData.BoxName[i], BoxNameHeaderStr);
		cp = PM_NumMsgSet(cp, i+1, NUM_MODE_LEFT, 2);
	}

// ボックス用壁紙ナンバー
	for(i = 0; i < BOX_KAZU; i++){
		BoxData.BGNum[i] = i % 4;
	}

}


#ifdef PM_DEBUG
/*==============================================================
==  ダミーポケモンデータセット（デバッグ開始時）
==============================================================*/
#include "waza_tbl.h"   // WTD 参照
#include "monsno.def"
extern const u32 GrowTbl[][101];
void SetDummyBoxData(void)
{
	static const u16 kari_box_poke[]={
#if 0
		MONSNO_BAKUUDA, MONSNO_PERIPPAA,  MONSNO_DONMERU,
		MONSNO_TAMAZARASI, MONSNO_KINOKOKO, 1,

		MONSNO_KAKUREON,  MONSNO_SOONANO, MONSNO_HOERUKO,
		MONSNO_RURIRI, MONSNO_YOMAWARU, 2,

		MONSNO_PIKATYUU, MONSNO_NUKENIN, MONSNO_PITYUU,
		MONSNO_HASUBOO, MONSNO_KINOKOKO, 3,

		MONSNO_HAGANEERU, MONSNO_RUNATOON, MONSNO_TAMAZARASI,
		MONSNO_KODORA, MONSNO_SAMEHADAA, MONSNO_PITYUU,

		MONSNO_NIDORAN_F, MONSNO_NIDORAN_M, 6,  7,  8,  9,

 16, 11, 12, 13, 14,
 16, 16, 17, 18, 19,
 20, 21, 22, 23, 24,
 25, 26, 27, 28, 29,
 30, 31, 32, 33, 34,

#else
		0,
#endif
	};

	u16 t= 0, i = 0, j = 0, ribon_poke = 0;
	u32 val;
	t = 0;
	ribon_poke = 20; // リボンを持たせるポケモンの数

	for(i = 0; i < BOX_KAZU; i++){
		for(j = 0; j < BOX_PM_KAZU; j++){
			if(t >= NELEMS(kari_box_poke)){
				i = BOX_KAZU;
				break;
			}

#if 1
			// ポケモンくじデバッグに便利なので、ランダムなＩＤをセット
			// IDは暗号化のキーなので、データをPokePasoParaSetでセットした後に
			// 書き換えることは禁止です。
			val = pp_rand();
			PokePasoParaSet(&(BoxData.PPPBox[i][j]),kari_box_poke[t],j+1,POW_RND,RND_NO_SET,0,ID_SET,val);
			if(kari_box_poke[t] == NON_POKE){
				t++;
				continue;
			}
			if(kari_box_poke[t] == MONSNO_PITYUU){
				u8 flg = 1;
				PokePasoParaPut(&(BoxData.PPPBox[i][j]), ID_tamago_flag, &flg);
			}
			// トレナビテスト用にコンディションを適当にセット
			val = pp_rand() & 0xff;
			PokePasoParaPut(&(BoxData.PPPBox[i][j]), ID_style, (u8*)(&val));
			val = pp_rand() & 0xff;
			PokePasoParaPut(&(BoxData.PPPBox[i][j]), ID_beautiful, (u8*)(&val));
			val = pp_rand() & 0xff;
			PokePasoParaPut(&(BoxData.PPPBox[i][j]), ID_cute, (u8*)(&val));
			val = pp_rand() & 0xff;
			PokePasoParaPut(&(BoxData.PPPBox[i][j]), ID_clever, (u8*)(&val));
			val = pp_rand() & 0xff;
			PokePasoParaPut(&(BoxData.PPPBox[i][j]), ID_strong, (u8*)(&val));
			val = pp_rand() & 0xff;
			PokePasoParaPut(&(BoxData.PPPBox[i][j]), ID_fur, (u8*)(&val));

			if(ribon_poke){
				ribon_poke--;
				val = 1;
				PokePasoParaPut(&(BoxData.PPPBox[i][j]), ID_stylemedal, (u8*)(&val));
			}

			t++;
#endif
		}
	}
}

#endif  // #ifdef PM_DEBUG

