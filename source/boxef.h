/***********************************************************************
**	ボックス－スイッチオン・オフエフェクト
**
***********************************************************************/
#ifndef _BOX_EF_H_
#define _BOX_EF_H_

/*======================================
==	構造体定義
======================================*/
typedef struct {
	/* InitBoxOnEffect, InitBoxOffEffect 呼び出し前に初期化しておく */

	u16 cell_id;     // 内部アクターに割り当てるセルＩＤ
	u16 pal_id;      // 内部アクターに割り当てるパレットＩＤ
	u16 line_speed;  // 中央のラインが伸びる（縮む）速度。 0 ならデフォルト値を使います
	u16 open_speed;  // 画面が開く（閉じる）速度。 0 ならデフォルト値を使います

	/* 内部で勝手に操作する */
	u16 prog_no;
	u16 del_act_cnt;
	s16 line;
	u32 pal_mask;

}SCAN_WORK;

/*======================================
==	関数プロトタイプ
======================================*/
void InitBoxOnEffect(SCAN_WORK *work);
u8 CheckBoxOnEffect(void);
void InitBoxOffEffect(SCAN_WORK *work);
u8 CheckBoxOffEffect(void);

#endif
