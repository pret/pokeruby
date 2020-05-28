/***********************************************************************
**	マーキングウィンドウ操作
**	masao taya
***********************************************************************/
#ifndef _MARKING_H_
#define _MARKING_H_


typedef struct {
	u16 cell_id; // 使用してよいセルＩＤの先頭数値（ここから３つ使用）
	u16 pal_id;  // 使用してよいパレットＩＤ（ここから２つ使用）
	u8  mark;    // マーク状態（初期状態を反映する）

	s8  cursor;
	u8  mark_work[4];

	actWork *win_actor[2];
	actWork *mark_actor[4];
	actWork *cursor_actor;
	actWork *kettei_actor;

	const u8 *win_char;
	const u16 *win_pltt;
	u8  win_cell[32*128];
	u8  fontcell_work[32*4];
	u8  cellmake_line;

}MARKING_WORK;


void MarkingWorkInit(MARKING_WORK *work);
void MarkingCellMakeInit(void);
u8 MarkingCellMake(void);
void MarkingCellMakeNow(void);
void MarkingWindowDisp(u8 mark, s16 x, s16 y);
void MarkingWindowQuit(void);
u8  MarkingControl(void);
actWork* MarkingStateAnmObjAdd(u16 cell_id, u16 pal_id, const u16 *pal_addr);
actWork* MarkingStateObjAdd(u16 cell_id, u16 pal_id, const u16 *pal_addr);
void MarkingCharDataCopy(u8 mark, u8 *addr);

/* ---------------------------------------------------------------------
	使い方

１．MARKING_WORK構造体を１つ用意し、mark, cell_id, pal_id に必要な
    値をセットする。

２．MarkingSelInit(u16 x, u16 y, MARKING_WORK *work)を呼ぶ。
    x, y .... マーキングウィンドウ左上隅の座標（ドット単位）
    work ...  １．で用意した構造体のアドレス

    →マーキングウィンドウが表示される

３．以降、０が帰るまで MarkingControl を毎Sync呼ぶ。
    ０が帰ったら、MarkingSelQuit() でリソース開放

４．ウィンドウ操作後のマーク状態が、１．で用意した MARKING_WORK構造体
    の mark にセットされる。

５．マーク状態を示すＯＢＪは

    MarkingStateObjAdd
    MarkingStateAnmObjAdd

    の、どちらかの関数で作成する。

    pal は、１番に背景色、２番に非選択色、３番に選択色の入ったパレット。
    アクターへのポインタが帰るので、位置やプライオリティをセット。

    AnmObjAdd で作成した アクターは、
    アニメナンバーを MARKING_WORK構造体の mark 値にセットすることで更新。

    ObjAdd で作成したアクターは、
    キャラデータアドレスを
    MarkingCharDataCopy へ渡して更新。

	

※必要なリソース

・アクター８個
・OBJ VRAM     169キャラ分（5,408 bytes）
・OBJ PALETTE  １本分

----------------------------------------------------------------------*/


#endif /* #ifndef _MARKING_H_ */
