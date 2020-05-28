/********************************************************************/
/*                     f_tool.h                                     */
/*                   フォント関連ツール                             */
/*                       by tomo                                    */
/********************************************************************/
/*==================================================================*/
/*             メッセージ系構造体                                   */
/*==================================================================*/
typedef struct{
	const char	*text;		/* TEXTﾃﾞｰﾀアドレス*/

	u8		col_f;  		/* 色番号(文字) */
	u8		col_b;			/* 色番号(背景) */

	u8		status;			/* ステータス */

	u32		cgx_adrs;		/* 実際に書きこむアドレス(CGX) */
	u8		cgx_block;		/* ｷｬﾗｸﾀｰﾍﾞｰｽﾌﾞﾛｯｸ(cbb)(半固定)*/
	u16		cgx_ofs;		/* CGXアドレスのTOPからのｵﾌｾｯﾄ*/
	u16		cgx_p;			/* ofsからの移動距離(可変）*/
	u8		*cgx_area;		/* CGXを書きこむエリアの先頭ｱﾄﾞﾚｽ*/

	u32		screen_adrs;	/* 実際に書きこむアドレス(CGX) */
	u8		screen_block;	/* ｽｸﾘｰﾝﾍﾞｰｽﾌﾞﾛｯｸ(sbb)(半固定)*/
	u16		screen_ofs;		/* SCREEN(CELL)のTOPからのｵﾌｾｯﾄ*/
	u16		screen_p;		/* ofsからの移動距離(可変）*/
	u8		screen_x,screen_y;	/* 表示位置(半固定) */

	u16		text_p;			/* 読み出すテキスト位置 */

	u8		cnt;			/* 表示ウエイトのカウント*/
	u8		spd;			/* 表示ウエイト0:なし */
	u8		flg;			/* 表示状態ﾌﾗｸﾞ */

	u8		code1,code2;	/* 実行中のコード、パラメータ*/

}MES;

/*==================================================================*/
/*==================================================================*/
#define H_CHAR (32)						/*１行のキャラ数*/
#define FONT_SIZE	(8*8/2)				/*フォントのサイズ（バイト数）*/
#define FONT2_SIZE		(FONT_SIZE*2)	/*現在使用しているフォントのバイト数*/
#define B_FONT_SIZE	(8)					/*フォントの圧縮時のサイズ*/
#define B_LINE_SIZE	(B_FONT_SIZE*32)	/*１行の圧縮時のサイズ*/

#define FONT_CGX_BLOCK		3				/*フォント表示用CGXエリア*/
#define FONT_SCREEN_BLOCK	31				/*フォント表示用ｽｸﾘｰﾝエリア*/

#define MES_SPD_CODE		'S'				/*スピード*/
#define MES_TRG_CODE		'T'				/*トリガー*/
#define MES_GOBI_CODE		'G'				/*語尾*/
#define MES_KOMMANDO_CODE	'K'				/*コマンド表示*/
#define MES_END_CODE		'$'				/*メッセージ終了*/
#define MES_X_CODE			'X'				/*X表示位置*/
#define MES_Y_CODE			'Y'				/*X表示位置*/
#define MES_B_CODE			'B'				/*BG色*/
#define MES_C_CODE			'C'				/*TEXT色*/
#define MES_SPACE_CODE		'>'				/*空白*/
#define MES_RET_CODE		'\\'			/*改行*/
#define MES_WAIT_CODE		'W'				/*外部ｺﾝﾄﾛｰﾙ用ウエイトモード*/
#define MES_LIST_CODE		'L'				/**/
#define MES_V_CODE			'V'				/*数値*/

#define MES_WAIT			MES_SPD3		/*1文字表示のウエイト*/
#define MES_SPD1			0				/*最速ウエイトなし*/
#define MES_SPD2			4				/*高速*/
#define MES_SPD3			8				/*通常の速度*/
#define MES_SPD4			16				/*低速*/
#define MES_SPD5			32				/*鈍速*/

/*色の指定*/
#define COL_NUKE   0x00
#define COL_BLACK  0x01
#define COL_RED    0x02
#define COL_GREEN  0x03
#define COL_BLUE   0x04
#define COL_YELLOW 0x05
#define COL_LBLUE  0x06
#define COL_PURPLE 0x07
#define COL_DGRAY  0x08
#define COL_LGRAY  0x09

#define COL_WHITE  0x0f
/*==================================================================*/
