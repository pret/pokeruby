//**********************************************************************
//		mul_play.h	
//**********************************************************************
#ifndef MUL_PLAY_H
#define MUL_PLAY_H

#undef	EXT
#ifdef 	EVOBJMV_H_PROTO
#define	EXT	/**/
#else
#define	EXT extern
#endif

//======================================================================
//		define
//======================================================================
#define	COMM_PLAYER_MAX 	4				// 通信用自機最大数

//------------------------------------------
//	通信用自機動作ｺｰﾄﾞ
//------------------------------------------
enum
{
	HCMD_NOTHING,							// 動作無し
	HCMD_UP,								// 上方向
	HCMD_DOWN,								// 下方向
	HCMD_LEFT,								// 左方向
	HCMD_RIGHT,								// 右方向
	HCMD_EVENT,								// ｲﾍﾞﾝﾄ
	HCMD_WAIT,								// ｲﾍﾞﾝﾄ開始待ち
	HCMD_UP_SITE,							// 上方向振り向き
	HCMD_DOWN_SITE,							// 下方向振り向き
	HCMD_LEFT_SITE,							// 左方向振り向き
	HCMD_RIGHT_SITE,						// 右方向振り向き

	HCMD_END,								// これ以上の場合はエラー処理
};

//======================================================================
//		typedef
//======================================================================
//------------------------------------------
//	通信自機用情報
//------------------------------------------
typedef struct
{
	u8 sw;									// 生存
	u8 my_no;								// ﾜｰｸﾅﾝﾊﾞ
	u8 evobjno;								// ｲﾍﾞﾝﾄOBJﾅﾝﾊﾞ
	u8 mv_status;							// 動作状態
}PLAYER_STATUS;

#define	PLAYER_STATUS_SIZE 		(sizeof(PLAYER_STATUS))
#define PLAYER_STATUS_SIZE_MAX	(PLAYER_STATUS_SIZE*COMM_PLAYER_MAX)

//------------------------------------------
//	通信自機用	ｲﾍﾞﾝﾄOBJ
//------------------------------------------
typedef struct
{
	u32	sw:1;								// ｽｲｯﾁ
	u32 sex:1;								// 性別
	u32 debug:1;							// ﾃﾞﾊﾞｯｸ用
	u32 :29;								// ﾋﾞｯﾄ余り

	u8	actno;								// ｱｸﾀｰﾅﾝﾊﾞ
	u8	obj_code;							// ｷｬﾗｺｰﾄﾞ
	u8	mv_code;							// 動作ｺｰﾄﾞ
	u8	ev_type;							// ｲﾍﾞﾝﾄﾀｲﾌﾟ

	u8	objID;								// OBJ ID
	u8	mapID;								// MAP ID
	u8	divID;								// DIV ID
	u8	height:4;							// 高さ
	u8	height_pri:4;						// 高さﾌﾟﾗｲｵﾘﾃｨ

	s16 dx;									// ﾄﾞｯﾄ座標
	s16 dy;
	s16	gx;									// ｸﾞﾛｰﾊﾞﾙ現座標
	s16	gy;
	s16	old_gx;								// ｸﾞﾛｰﾊﾞﾙ過去座標
	s16	old_gy;

	u8	site;								// 向き格納
	u8	mv_site;							// 移動方向
	u8	dmy1;								// ﾀﾞﾐｰ
	u8	dmy2;								// ﾀﾞﾐｰ

	u8	acmd;								// ｱﾆﾒｰｼｮﾝｺｰﾄﾞ格納
	u8	ev_work;							// ｲﾍﾞﾝﾄﾜｰｸ
	u8	attr;								// ﾏｯﾌﾟｱﾄﾘﾋﾞｭｰﾄ
	u8	old_attr;							// ﾏｯﾌﾟｱﾄﾘﾋﾞｭｰﾄ
	
	u8	dmy3;								// ﾀﾞﾐｰ
	u8	work0;								// ﾜｰｸ0
	u8	work1;								// ﾜｰｸ1
	u8	:8;
}EV_PLAYER;

//======================================================================
//		ｸﾞﾛｰﾊﾞﾙ
//======================================================================
EXT PLAYER_STATUS Player[COMM_PLAYER_MAX];

//======================================================================
//		関数ﾌﾟﾛﾄﾀｲﾌﾟ
//======================================================================
EXT void InitPlayer(PLAYER_STATUS*);		// 自機情報初期化
EXT void InitAllPlayer(void);				// 自機情報全初期化
EXT void SetPlayer(u8,s16,s16,u8);			// 自機ｾｯﾄ
EXT void SetPlayerSite(u8,u8);				// 自機方向ｾｯﾄ
EXT void DelPlayer(u8);						// 自機削除(仮)
EXT void UpdatePlayer(u8,u8);				// 自機動作
EXT void SetPlayerActor(u8);				// 自機ｱｸﾀｰｾｯﾄ
EXT u8 GetPlayerActorNumber(u8);			// 自機ｱｸﾀｰﾅﾝﾊﾞ取得
EXT void GetPlayerPos(u8,s16*,s16*);		// 自機座標取得
EXT u8 GetPlayerSite(u8);					// 自機向き取得
EXT u8 GetPlayerHeight(u8);					// 自機高さ取得
EXT s16 GetPlayerMoveAmount(u8);			// 自機移動量取得

EXT u8 CheckTalkPlayer(s16, s16);			//ﾌﾟﾚｲﾔｰへの話しかけﾁｪｯｸ

#undef EXT
#endif // MUL_PLAY_H
