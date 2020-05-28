#ifndef __D_MATSU_H__
#define __D_MATSU_H__


//----------------------------------------------------------
//	定数
//----------------------------------------------------------
#define MA_DEBUG	1	//1：デバッグ状態	０：非デバッグ状態

#define DEBUG_MSG_MAX	5

//----------------------------------------------------------
//	外部関数宣言
//----------------------------------------------------------
extern void DebugMsgPrint(u8 *msg, u8 x, u8 y, u8 put_no);
extern void DebugNumMsgPrint(int num, u8 x, u8 y, u8 put_no);
extern void KoutokutenDataSet(void);
extern void ErrorMsgPut(const u8 *err_msg);

//----------------------------------------------------------
//	デバック用グローバル変数
//----------------------------------------------------------
extern u8 DebugContestFlag;	//1=1次審査、2次審査を飛ばす


#endif __D_MATSU_H__

