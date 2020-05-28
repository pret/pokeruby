//====================================================================
//
//							fan.h
//
//====================================================================
#ifndef __FAN_H__
#define __FAN_H__

//====================================================================
//							定義
//====================================================================
#define FAN_BIT				(8)					//ファンビット

//ビットナンバー
#define	FAN_SCHOOLW1		(FAN_BIT+0)
#define	FAN_MIDDLEM2		(FAN_BIT+1)
#define	FAN_OJYOU2			(FAN_BIT+2)
#define	FAN_BOYA1			(FAN_BIT+3)
#define	FAN_BOY2			(FAN_BIT+4)
#define	FAN_YOUNGM1			(FAN_BIT+5)
#define	FAN_WORKERW1		(FAN_BIT+6)
#define	FAN_OLDWOMAN1		(FAN_BIT+7)

//ファンポイント計算用定義
#define	FAN_POINT_DATA_MAX		(4)
#define	FAN_SHITEN_TYPE			(0)				//四天王戦
#define	FAN_BASE_TYPE			(1)				//秘密基地対戦
#define	FAN_CONTEST_TYPE		(2)				//コンテスト
#define	FAN_BATTLE_TOWER_TYPE	(3)				//バトルタワー


#ifndef ASM_CPP		/* アセンブラの場合のみこのシンボルが定義される */


#define FLD(id)				(Fld.EventWork[id-SVWK_START])	//セーブワーク
#define FAN_WK				(EV_FAN_WORK)					//ワーク
#define FAN_TM				(EV_FAN_TIME)					//時間
#define FAN_MAX				(8)					//ファンの人数
#define FIRST_FAN_MAX		(3)					//最初のファンの人数
#define	FAN_TIME_OVER		(12)				//１２時間経過していたらファンを減らす
#define FAN_POINT_OBJ_ADD_MAX	(3)				//３人までファンポイントで増やせる
#define FAN_POINT_MAX		(20)				//ファンポイントの最大数
#define FAN_TIME_OBJ_SUB_MAX	(4)				//４人まで時間で減らせる

#define FAN_START_FLAG_BIT	(7)					//ファン作動フラグビット
#define FAN_START_FLAG_ON	(1 << FAN_START_FLAG_BIT)	//ファン作動フラグオン

#define FAN_POINT_BIT		(0)					//ファンポイントビット
#define FAN_POINT			( (FLD(FAN_WK) & 0x7f) )	//ファンポイント


//====================================================================
//							extern宣言
//====================================================================
extern void FanAllInit();
extern void FanCommBattleTimeSet();
extern void FanStart();
extern u8 FanPointCalc(u8);
extern u8 FanBitOn();
extern u8 FanBitOff();
extern u16 FanNoGet();
extern void FanTimeChk();
extern void FanCommBattleWinLoseChk();
extern void FanStartFlagOn();
extern u8 ScrFanPointAdd();

extern const u8 fan_obj_add[FAN_MAX];
extern const u8 fan_obj_sub[FAN_MAX];


#endif	/*ASM_CPP*/
#endif	/*__FAN_H__*/


