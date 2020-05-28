//=========================================================================
//	Define制御定義
//=========================================================================

#ifndef __CLI_DEF_H__
#define __CLI_DEF_H__


//----------------------------------------------------------
//	ﾎﾟｹﾓﾝの座標(1vs1と2vs2)
//----------------------------------------------------------
//-- 味方 --//
#define C_POKE_X		72//80					//1vs1
#define C_POKE_Y		(80)
#define C_POKE1X		32					//2vs2
#define C_POKE1Y		C_POKE_Y
#define C_POKE2X		90
#define C_POKE2Y		(C_POKE1Y+8)
//-- 敵 --//
#define CAI_POKE_X		176					//1vs1
#define CAI_POKE_Y		((32-8)+16)
#define CAI_POKE1X		(208-8)			//2vs2
#define CAI_POKE1Y		CAI_POKE_Y
#define CAI_POKE2X		(144+8)
#define CAI_POKE2Y		(CAI_POKE_Y-8)

#if 0	// 2002.06.19(水)

#define C_POKE1PRI		5					//ｱｸﾀｰﾌﾟﾗｲｵﾘﾃｨ
#define C_POKE2PRI		C_POKE1PRI			//ｱｸﾀｰﾌﾟﾗｲｵﾘﾃｨ
#define CAI_POKE1PRI	C_POKE1PRI
#define CAI_POKE2PRI	C_POKE1PRI

#else	//++++++++++++++++++++++

#define C_POKE1PRI		30		//味方1		ｱｸﾀｰ(ｿﾌﾄ)ﾌﾟﾗｲｵﾘﾃｨ
#define C_POKE2PRI		20		//味方2
#define CAI_POKE1PRI	40		//敵1
#define CAI_POKE2PRI	50		//敵2

#endif

#define POKE_OAM_PRI	2	//ﾎﾟｹﾓﾝｱｸﾀｰのOAMのﾌﾟﾗｲｵﾘﾃｨ(ﾊｰﾄﾞ)

//----------------------------------------------------------
//	ﾄﾚｰﾅｰ
//----------------------------------------------------------
#define C_TRN_X			80			//ﾄﾚｰﾅｰのX座標
#define C_TRN_Y			80//(C_POKE_Y)
#define C_TRN_PRI		C_POKE1PRI

//#define TRAINER_OUT_SP	(-4)
#define TRAINER_RETURN_SYNCNUM	50	//60			//味方
#define ENEMYTRAINER_RETURN_SYNCNUM		35	//敵

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝがﾀﾞﾒｰｼﾞを受けたときの点滅
//----------------------------------------------------------
#define BLINK_INTERVAL		4	//点滅する間隔
#define DAMAGE_BLINK_WAIT	(BLINK_INTERVAL*8)	//点滅ｴﾌｪｸﾄの総時間

//----------------------------------------------------------
//	変身時のﾊﾟﾚｯﾄの色を落す時のEVY値
//----------------------------------------------------------
#define HENSIN_EVY		6

//----------------------------------------------------------
//	選択中のポケモン、ゲージがゆらゆらする動き
//----------------------------------------------------------
#define GAUGE_MOTION_ADDSEC		7
#define GAUGE_MOTION_FURIHABA	1
#define POKE_MOTION_ADDSEC		7	//5
#define POKE_MOTION_FURIHABA	1	//2
#define GAUGE_ENEMY_MOTION_ADDSEC		15	//敵のゲージ
#define GAUGE_ENEMY_MOTION_FURIHABA	1


//----------------------------------------------------------
//	ﾓﾝｽﾀｰﾎﾞｰﾙから出る煙
//----------------------------------------------------------
#define MBSMOKE_PRI		2					//ｱｸﾀｰﾌﾟﾗｲｵﾘﾃｨ
#define MBSMOKE_ANMWAIT	4
#define MBSMOKE_CELL	1					//0:常駐  1:使用するたびにCellSet&PalSet



//----------------------------------------------------------
//	ﾎﾞｰﾙから出てくる煙の拡縮ﾃﾞｰﾀ
//----------------------------------------------------------
#define MBS_AFF_SP		11
#define MBS_AFF_LOOP	18
#define MBS_START_AFF	(0x70)	//最初の拡縮値

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝ気絶
//----------------------------------------------------------
#define C_POKE_KIZETU_SP	5			//ﾎﾟｹﾓﾝが下に落ちていくｽﾋﾟｰﾄﾞ

//----------------------------------------------------------
//	ﾓﾝｽﾀｰﾎﾞｰﾙ使用ｴﾌｪｸﾄ
//----------------------------------------------------------
#define MONS_BALL_X		C_POKE1X	//初期位置
#define MONS_BALL_Y		C_POKE1Y
#define MONS_BALL_PRI	(C_POKE1PRI -1)	//ｱｸﾀｰﾌﾟﾗｲｵﾘﾃｨ
#define SUCCESS_RATE	4			//ｹﾞｯﾄ成功レート

//----------------------------------------------------------
//	ｹﾞｰｼﾞ
//----------------------------------------------------------
// ｹﾞｰｼﾞ初期位置
//-- 1vs1 --//
#define C_GAUGE_X			158//152
#define C_GAUGE_Y			88//86//70
#define CAI_GAUGE_X			44//48//24
#define CAI_GAUGE_Y			30//32//20
//-- 2vs2 --//
#define GAUGE_OFFSET_X		12	//敵、味方のｹﾞｰｼﾞのｵﾌｾｯﾄを統一にするため
#define GAUGE_OFFSET_Y		25

#if 0	//2002.08.14(水)

#define C_GAUGE_X2			(240-96+27)
#define C_GAUGE_Y2			102//86
#define C_GAUGE_X1			(C_GAUGE_X2 - GAUGE_OFFSET_X)
#define C_GAUGE_Y1			(C_GAUGE_Y2 - GAUGE_OFFSET_Y)

#elif 0	//2002.08.16(金)

#define C_GAUGE_X2			(240-96+27)
#define C_GAUGE_Y1			102//86
#define C_GAUGE_X1			(C_GAUGE_X2 - GAUGE_OFFSET_X)
#define C_GAUGE_Y2			(C_GAUGE_Y1 - GAUGE_OFFSET_Y)

#else

#define C_GAUGE_X2			(240-96+27)
#define C_GAUGE_Y2			102//86
#define C_GAUGE_X1			(C_GAUGE_X2 - GAUGE_OFFSET_X)
#define C_GAUGE_Y1			(C_GAUGE_Y2 - GAUGE_OFFSET_Y)

#endif

#if 0	//

#define CAI_GAUGE_X2		32//24
#define CAI_GAUGE_Y2		19//0
#define CAI_GAUGE_X1		(CAI_GAUGE_X2+GAUGE_OFFSET_X)//40	//敵側
#define CAI_GAUGE_Y1		(CAI_GAUGE_Y2+GAUGE_OFFSET_Y)

#elif 0	// 2002.07.26(金) 敵のゲージの位置を変更

#define CAI_GAUGE_X2		32//24
#define CAI_GAUGE_Y1		(CAI_GAUGE_Y2+GAUGE_OFFSET_Y)
#define CAI_GAUGE_X1		(CAI_GAUGE_X2+GAUGE_OFFSET_X)//40	//敵側
#define CAI_GAUGE_Y2		19//0

#else	//2002.08.14(水)

#define CAI_GAUGE_X2		32//24
#define CAI_GAUGE_Y2		(CAI_GAUGE_Y1+GAUGE_OFFSET_Y)
#define CAI_GAUGE_X1		(CAI_GAUGE_X2+GAUGE_OFFSET_X)//40	//敵側
#define CAI_GAUGE_Y1		19//0

#endif

//-- ｹﾞｰｼﾞ ｱｸﾀｰﾌﾟﾗｲｵﾘﾃｨ --//
#define GAUGE_ACT_PRI		1					//ｹﾞｰｼﾞ本体
#define HP_GAUGE_ACT_PRI	(GAUGE_ACT_PRI-1)	//HPﾒｰﾀｰ
#define GAUGE_ARROW_PRI		(GAUGE_ACT_PRI+1)	//矢印
//-- ｹﾞｰｼﾞ ハードプライオリティ --//
#define GAUGE_OAM_PRI		1

//-- 手持ちポケモン表示ゲージ --//
#define TEMOTI_GAUGE_Y		68//60
#define TEMOTI_GAUGE_PRI	10
#define TEMOTI_BALL_PRI		(TEMOTI_GAUGE_PRI-1)
#define TEMOTI_BALLPUT_WAIT	180	//ゲージを消すまでのｳｪｲﾄ
#define MINE_TEMOTI_GAUGE_X	0x88//154	//ゲージ表示座標
#define MINE_TEMOTI_GAUGE_Y	96
#define TEMOTI_GAUGE_SP		5
#define TEMOTI_GAUEG_MOVE_SYNC	20
#define ENEMY_TEMOTI_GAUGE_X	0x68//45
#define ENEMY_TEMOTI_GAUGE_Y	16//12	//40
#define TEMOTI_ENEMY2_X		0x68//45
#define TEMOTI_ENEMY2_Y		40	//12

//ﾊﾞﾄﾙｹﾞｰｼﾞ転送ｷｬﾗ展開先ｱﾄﾞﾚｽ
#define GAUGE_DECORD_ADR	0x2000000
//転送ｷｬﾗ並び、ﾄｯﾌﾟｷｬﾗからの差分
#define HP_CHR_OFFSET		0
#define EXP_CHR_OFFSET		0
#define NUM_CHR_OFFSET		18
//#define LV_CHR_OFFSET		40	//add 2001.08.08(水)
#define NAME_CHR_OFFSET		41//39
//ｷｬﾗ転送位置
#define MINE_LV_POS			0x49//36
#define MINE_LV_POS2		0x29	//2vs2
#define MINE_HP_POS			0x1d	//0x1c	//29
#define MINE_HPMAX_POS		0x59	//0x2c	//(32+25)
#define MINE_GAUGE_HPPOS1	22
#define MINE_GAUGE_HPPOS2	(32+16)
#define MINE_GAUGE_EXPPOS1	35		//左側
#define MINE_GAUGE_EXPPOS2	27		//右側
#define ENEMY_HPGAUGE_POS1	(64+20)
#define ENEMY_HPGAUGE_POS2	(64+48)
#define ENEMY_LV_POS		0x28//(64+36)
#define ENEMY_HP_POS		0x14	//(MINE_HP_POS + 64)
#define ENEMY_HPMAX_POS		0x30	//(MINE_HPMAX_POS + 64)
#define LVPOS_2VS2			MINE_LV_POS


//----------------------------------------------------------
//  仮決定Define定義
//----------------------------------------------------------
#define DECORD_WORK_ADR		(0x02010000)	//DecordWramで展開するときのRAMｱﾄﾞﾚｽ
//#define ACTOR_PUSH_ADR		0x2003000		//ｱｸﾀｰをPush、Popする時のｱﾄﾞﾚｽ
#define ACTOR_PUSH_ADR	(0x2028000 - ALL_ACTWORK_SIZEOF -1)//ｱｸﾀｰをPush、Popする時のｱﾄﾞﾚｽ

//----------------------------------------------------------
//	デバックﾌﾗｸﾞ
//----------------------------------------------------------
#define GAUGE_DEBUG			1	// 1 = ﾃﾞﾊﾞｯｸﾓｰﾄﾞ

//----------------------------------------------------------
//	ﾃｽﾄ用
//----------------------------------------------------------
#define TEST_ENEMY_X		(176)
#define TEST_ENEMY_Y		32


//----------------------------------------------------------
//	ｺﾏﾝﾄﾞｾﾚｸﾄ画面ｶｰｿﾙ位置
//----------------------------------------------------------
#define FIGHT_CSRPOS		0
#define ITEM_CSRPOS			1
#define POKE_CSRPOS			2
#define ESCAPE_CSRPOS		3

//サファリゾーン用
#define BALL_CSRPOS			0
#define CUBE_CSRPOS			1
#define APPROACH_CSRPOS		2


//----------------------------------------------------------
//	FightEffect実行前のSE終了待ちのﾀｲﾑｱｳﾄｶｳﾝﾀ-
//----------------------------------------------------------
#define EFF_SETIME_OUT_COUNT	30


#endif	//__CLI_DEF_H__
