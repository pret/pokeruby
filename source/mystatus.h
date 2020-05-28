//**********************************************************************
//		mystatus.h
//**********************************************************************
#ifndef	MYSTATUS_H
#define	MYSTATUS_H

#undef	EXT
#ifdef 	MYSTATUS_H_PROTO
#define	EXT	/**/
#else
#define	EXT extern
#endif

//----------------------------------------------------------------------
//		define typedef
//----------------------------------------------------------------------
typedef struct												// ÄÚ°Å°¶°ÄŞ
{
	u8	sex;												// «•Ê
	u8	star;												// ¯(¶°ÄŞÚÍŞÙ)
	u8	zukan_get_flag;										// }ŠÓ¹Ş¯ÄÌ×¸Ş
	u8	zukan_complete_flag;								// }ŠÓŠ®¬Ì×¸Ş
	u8	contest_art_flag;									// ºİÃ½Ä,”üpŠÙ²ÍŞİÄ¸Ø±Ì×¸Ş
	u16	clear_time_h;										// ‰‰ñ¸Ø±À²Ñ()
	u16	clear_time_m;										// ‰‰ñ¸Ø±À²Ñ(•ª)
	u16	clear_time_s;										// ‰‰ñ¸Ø±À²Ñ(•b)
	u16	zukan_num;											// }ŠÓ
	u16	id;													// ID
	u16	play_time_h;										// ÌßÚ²ŠÔ()
	u16 play_time_m;										// ÌßÚ²ŠÔ(•ª)
	u16	cable_fight_win;									// ¹°ÌŞÙ‘ÎíŸ‚¿”
	u16	cable_fight_lose;									// ¹°ÌŞÙ‘Îí•‰‚¯”
	u16	battle_tower_win;									// ÊŞÄÙÀÜ°Ÿ‚¿”
	u16	battle_tower_cons_win;								// ÊŞÄÙÀÜ°˜AŸ”
	u16	cable_contest_win;									// ¹°ÌŞÙºİÃ½Ä—DŸ”
	u16	make_cube;											// ·­°ÌŞì¬”
	u16 cable_poke_exe;										// Îß¹Óİ¹°ÌŞÙŒğŠ·‰ñ”
	u32 gold;												// ‚¨‹à
	u16	kaiwa[4];											// ŠÈˆÕ‰ï˜b
	u8	name[PERSON_NAME_SIZE+EOM_SIZE];					// –¼‘O(11BYTE)
}TRCARD;

#define TRCARD_SIZE	(sizeof(TRCARD))

enum														// ¶°ÄŞÚÍŞÙ
{
	TRCARD_NORMAL = 0,										// É°ÏÙ
	TRCARD_BRONZE,											// ÌŞÛİ½Ş
	TRCARD_COPPER,											// ¶¯Êß-
	TRCARD_SILVER,											// ¼ÙÊŞ°
	TRCARD_GOLD,											// ºŞ°ÙÄŞ
};

#define TRCARD_CABLE_F_WIN_MAX		(9999)					// ¹°ÌŞÙ‘ÎíŸ‚¿Å‘å
#define TRCARD_CABLE_F_LOSE_MAX		(9999)					// ¹°ÌŞÙ‘Îí•‰‚¯Å‘å
#define TRCARD_POKE_EXE_MAX			(65535)					// Îß¹ÓİŒğŠ·Å‘å

//----------------------------------------------------------------------
//		¸ŞÛ°ÊŞÙ
//----------------------------------------------------------------------
EXT TRCARD MultiTrainerCard[];								// ’ÊM—pÄÚ°Å°¶°ÄŞÜ°¸

//----------------------------------------------------------------------
//		ŠÖ”
//----------------------------------------------------------------------
EXT void SetTrainerCardPlayer(pFunc);						// ålŒöÄÚ°Å°¶°ÄŞ
EXT void SetTrainerCardFriend(u8,pFunc);					// ’ÊMÄÚ°Å°¶°ÄŞ
EXT void SetTrainerCardWorkPlayer(TRCARD*);					// ÌßÚ²Ô°ÄÚ°Å°¶°ÄŞÜ°¸¾¯Ä
EXT u8 GetMultiTrainerCardStar(u8);							// ’ÊMÄÚ°Å°¶°ÄŞÚÍŞÙæ“¾

EXT void FontHeroNameWrite(s16,s16);						// ålŒö–¼‘O•`‰æ
EXT void FontHeroSexWrite(s16,s16);							// ålŒö«•Ê•`‰æ
EXT void FontPokeZukanNumWrite(s16,s16);					// Îß¹Óİ}ŠÓ”•`‰æ
EXT void FontOpPokeZukanNumWrite(s16,s16);					// Îß¹Óİ}ŠÓ”•`‰æ(‘±‚«)
EXT void FontPlayTimeWrite(s16,s16);						// ÌßÚ² ŠÔ•`‰æ
EXT void FontOpPlayTimeWrite(s16,s16);						// ÌßÚ²ŠÔ•`‰æ(‘±‚«)
EXT void FontBatchWrite(s16,s16);							// ÊŞ¯Á”•`‰æ

EXT void MyStatusWindow(s16,s16);							// ½Ã°À½³¨İÄŞ³•`‰æ
EXT void MyStatusWindowClear(s16,s16);						// ½Ã°À½³¨İÄŞ³Á‹

#ifdef PM_DEBUG
EXT void SetTrainerCardPlayerDebug(pFunc);					// ÃŞÊŞ¯¸Ş½Ã°À½
EXT void SetTrainerCardFriendDebug(pFunc);					// ÃŞÊŞ¯¸Ş½Ã°À½
EXT void InitTrainerCardFriendDebug( void );				// ÃŞÊŞ¯¸Ş½Ã°À½‰Šú‰»
#endif

#undef EXT
#endif // MYSTATUS_H
