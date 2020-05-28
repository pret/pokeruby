//=========================================================================
//	スクリーン制御
//=========================================================================

#ifndef MAPBG_H
#define MAPBG_H
#undef GLOBAL
#ifdef MAPBG_H_GLOBAL
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定数定義
//=========================================================================

/* スクロール制御用構造体 */
typedef struct scrlCtrl{
		void (* controler)(struct scrlCtrl *);
		int work;
		int dx;
		int dy;
		int xdiff;
		int ydiff;
}FieldScrollCtrl;


//=========================================================================
//	変数
//=========================================================================

extern FieldScrollCtrl scroll;
extern s16 FieldActOX;
extern s16 FieldActOY;

extern u8 MapViewControlFlag;	/* マップ制御フラグ */

//=========================================================================
//	関数プロトタイプ
//=========================================================================
GLOBAL void InitMapBG(void);
GLOBAL void MakeMapBG(void);
GLOBAL void MapBGVsync(void);
GLOBAL void GetMapRegPos( s16 *x, s16 *y );
GLOBAL void RewriteSingleBG(int map_x, int map_y);
GLOBAL void WriteMapBGdirect(int map_x, int map_y, const u16 * celldata);

GLOBAL void InitFieldScroll(void);
GLOBAL void ControlFieldScroll(void);
GLOBAL int	SetFieldScroll(u8 actno);
GLOBAL void ChangeFieldScroll(int dx, int dy);

GLOBAL void CtrlFieldScrl(void);

GLOBAL void MapViewInit(void);
GLOBAL void MapViewControl(void);

GLOBAL void SetMapViewFunc(pFunc func);
GLOBAL void SetMapViewOffset(s16 x, s16 y);

#undef GLOBAL
#endif	/*MAPBG_H*/

