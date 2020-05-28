/***********************************************************************
**	全体地図表示画面制御
**********************************************************************/
#ifndef _WMAP_H_
#define _WMAP_H_

/*==============================================
==	定数
==============================================*/
#define DIVNAME_BUFSIZE (32)

/*==============================================
==	画像
==============================================*/
const u16 wmap_cursor_Palette[16];
const u8 wmap_cursor_Character[8*4*1];

/*==============================================
==	ワーク構造体定義
==============================================*/
typedef struct {
	u8  divname_buf[DIVNAME_BUFSIZE];
	TALK_WIN  divname_win;

	s16 bg_hofs;
	u16 bg_vofs;
	u16 point_div;
	u16  vc;
	u16  bldy;

	u8  fWorp;

	u8  fDebug;  // デバッグモードか？

	actWork *cursor_actor;
	actWork *hero_actor;

}WMAP_WORK;

/*==============================================
==	関数プロトタイプ
==============================================*/
void SetWMapWorkAddr(WMAP_WORK* addr);
void WMapInit_Data(void);
void WMapInit_BG(void);
void Wmap_AddObj(u16 cellid, u16 palid);
void Wmap_DelObj(void);
void Wmap_StopObj(u8 fStop);

#endif /* #ifndef _WMAP_H_ */
