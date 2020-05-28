//====================================================================
//
//						ＴＶ企画ＣＭ型定義
//
//====================================================================
#ifndef __CM_H__
#define __CM_H__


//データタイプ定義
#define CM_NODATA_TYPE			0		//データなし
#define CM_BARGAIN_TYPE			1		//大安売り(がんばり屋)
#define CM_CASINO_TYPE			2		//カジノデー
#define CM_FIND_ITEM_TYPE		3		//掘り出しもの(ミナモデパート屋上)

#define CM_DATATYPE_MAX			4		//CMデータの種類


#ifndef ASM_CPP		/* アセンブラの場合のみこのシンボルが定義される */


//fd_shop.cで使用
#define	SALE_FLG				( CMEventStartChk( CM_BARGAIN_TYPE ) )

#define TODAY_TIME				1			//1日
#define CMDATA_MAX				16			//CMデータMAX

//100分の1の確率(65535/100=655)
#define CM_START_ON				655		//CMが発生する値(以上で発生)
#define CM_TIME_COUNT			(4)			//作成した時にセットする日数
#define CM_BROADCAST_TIME		(TODAY_TIME*2)//放送開始の日数 2日から
#define CM_BROADCAST_CHANGE_TIME	(20)	//朝、夜メッセージを分ける時間


//====================================================================
//							extern宣言
//====================================================================
extern void CMDataAllInit();
extern u8 CMTimeCountChk();
extern void CMDataSet();
extern u8 CMEventStartChk(u8);
extern s8 CMDataAkiChk(TV_CM *);
extern void CMDataClear(u8);
extern void CMDataSort();
extern void CMData_Update(u16);


#endif	/*ASM_CPP*/
#endif	/*__CM_H__*/

