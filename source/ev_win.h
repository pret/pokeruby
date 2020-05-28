//=========================================================================
//	
//=========================================================================
#ifndef EV_WIN_H
#define EV_WIN_H
#undef GLOBAL
#ifdef EV_WIN_H_GLOBAL
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif


//=========================================================================
//	定義
//=========================================================================
//#define name value
//文字列データのナンバーの定義(ev_win.cにある)	add 01/10/05 nohara
#define	KAKKOYOSA	0
#define	UTSUKUSHISA	1
#define	KAWAISA		2
#define	KASHIKOSA	3
#define	TAKUMASHISA	4
#define	NORMAL		5
#define	SUPER		6
#define	HYPER		7
#define	MASTER		8
#define	KAKKOII		9
#define	UTSUKUSHII	10
#define	KAWAII		11
#define	KASHIKOI	12
#define	TAKUMASHII	13
#define	DOUGU		14
#define	TAISETUNAMONO	15
#define	BALL		16
#define	WAZAMACHINE	17
#define	KINOMI		18


//スクリプトウィンドウ　メッセージデータのナンバー定義(ev_win.cにある)
#define HAGI_MENU01			0
#define	TEST02				1			//dummy
#define	CONTEST_MENU01		2
#define	CONTEST_MENU02		3
#define	CONTEST_MENU03		4
#define	MINEBOARD_MENU02	5
#define	MINEBOARD_MENU01	6
#define	OTHERBOARD_MENU01	7
#define	PASO_MENU01			8			//dummy
#define	R104_R0101_MENU01	9			//dummy
#define	PC_BATTLE_MENU01	10			//dummy
#define	LETTER_GYM_MENU01	11			//dummy
#define	BICYCLE_MENU01		12
#define	BLACKBOARD_MENU01	13
#define HAGI_MENU02			14
#define IAI_MENU01			15			//dummy
#define MUSEUM_MENU01		16
#define COMM_BATTLE_MENU01	17
#define COMM_BATTLE_MENU02	18
#define KUSUNOKI_MENU01		19
#define INTRODUCE_MENU01	20
#define TSUGA_MENU01		21			//dummy
#define	PASO_MENU02			22			//dummy
#define	BATTLE_TOWER_MENU	23
#define	BATTLE_TOWER_LEVEL_MENU	24
#define	KARAKURI_QUIZ_11_MENU	25
#define	KARAKURI_QUIZ_12_MENU	26
#define	KARAKURI_QUIZ_13_MENU	27
#define	KARAKURI_QUIZ_21_MENU	28
#define	KARAKURI_QUIZ_22_MENU	29
#define	KARAKURI_QUIZ_23_MENU	30
#define	KARAKURI_QUIZ_31_MENU	31
#define	KARAKURI_QUIZ_32_MENU	32
#define	KARAKURI_QUIZ_33_MENU	33
#define	KARAKURI_QUIZ_41_MENU	34
#define	KARAKURI_QUIZ_42_MENU	35
#define	KARAKURI_QUIZ_43_MENU	36
#define	KARAKURI_QUIZ_51_MENU	37
#define	KARAKURI_QUIZ_52_MENU	38
#define	KARAKURI_QUIZ_53_MENU	39
#define	AOGIRI_MENU				40		//dummy
#define	MATSUBUSA_MENU			41		//dummy
#define VENDING_MACHINE_MENU	42
#define	KAZENO_MENU01			43
#define	KAZENO_MENU02			44
#define	TV_TOWER_MENU01			45
#define	SINKAI_ITEM_MENU		46
#define	PEKO_MENU				47
#define	KEIHIN_ITEM_MENU		48
#define	KEIHIN_COIN_MENU		49
#define	FISHING_CONDITION_MENU	50
#define	TREASURE_EXCHANGE_MENU	51		//dummy
#define	RENRAKUSEN_MENU			52
#define	TOWER_HUNE_MENU			53
#define RIGHT_LEFT_MENU			54
#define	KEIHIN_WAZA_MENU		55
#define	RENRAKUSEN2_MENU		56
#define	ELEVATOR_MENU			57

#define	TREASURE_EXCHANGE_MENU_RNNN	58
#define	TREASURE_EXCHANGE_MENU_NYNN	59
#define	TREASURE_EXCHANGE_MENU_RYNN	60
#define	TREASURE_EXCHANGE_MENU_NNBN	61
#define	TREASURE_EXCHANGE_MENU_RNBN	62
#define	TREASURE_EXCHANGE_MENU_NYBN	63
#define	TREASURE_EXCHANGE_MENU_RYBN	64
#define	TREASURE_EXCHANGE_MENU_NNNG	65
#define	TREASURE_EXCHANGE_MENU_RNNG	66
#define	TREASURE_EXCHANGE_MENU_NYNG	67
#define	TREASURE_EXCHANGE_MENU_RYNG	68
#define	TREASURE_EXCHANGE_MENU_NNBG	69
#define	TREASURE_EXCHANGE_MENU_RNBG	70
#define	TREASURE_EXCHANGE_MENU_NYBG	71
#define	TREASURE_EXCHANGE_MENU_RYBG	72

//typedef ...


//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;


//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);
#ifndef	ASM_CPP		/* これで囲んでいる個所はアセンブラでは解釈されない */
GLOBAL u8 EvWaitYesNoEnd(void);
GLOBAL u8 AddScriptYesNoTask(u8 x, u8 y);

GLOBAL u8 AddScriptEvWinTask(u8 x, u8 y, u8 no, u8 check);
GLOBAL u8 AddScriptEvWinCsrTask(u8 x, u8 y, u8 no, u8 check, u8 csr);
GLOBAL u8 AddScriptEvMenuTask(u8 x, u8 y, u8 no, u8 check);

GLOBAL u8 AddScriptEvHVWinTask(u8 x, u8 y, u8 no, u8 check, u8 arrange);

GLOBAL u8 FieldPokeCGWinOpen( u16 mons_no, u8 x, u8 y );// ポケモンＣＧ表示
GLOBAL void * FieldPokeCGWinClose( void );				// ポケモンＣＧ消去

GLOBAL const u8 * const msg_data_buf[];

GLOBAL u8 AddScriptPasoMenu();
GLOBAL void PasoMenuWriteInit();
GLOBAL void PasoMenuWriteInit2();

#endif

#undef GLOBAL
#endif	/*EV_WIN_H*/

