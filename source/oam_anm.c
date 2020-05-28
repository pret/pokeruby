//**********************************************************************
//		oam_anm.c
//		±ÆÒÊßÀ°İÃ°ÌŞÙ
//**********************************************************************
#include	<agb.h>
#include 	"common.h"
#include	"actor.h"

//----------------------------------------------------------------------
//		ÃŞ°ÀÌ§²Ù²İ¸Ù°ÄŞ
//----------------------------------------------------------------------
//#include "../objdata/a_mine.ach"			// const u8 a_mine_Character[14208];
//#include "../objdata/a_debu.ach"			// const u8 a_debu_Character[31296];
//#include "..\objdata\carton.ach" 			// const u8 carton_Character[1792];

//extern	const	u8	carton_Character[];

//======================================================================
//		ÊßÀ°İÃ°ÌŞÙ
//======================================================================
const	actAnmData actAnmTransDataTable[] =
{
//---------------------------------------------------------------
// { “]‘—æ·¬×ÃŞ°À±ÄŞÚ½, “]‘——Ê }
{0,0},															// Dummy
//--------------------------------------------------------------- 00

#if 0
//---------------------------------------------------------------
{ &carton_Character[(0x20*8) * 0], 0x20*8},						// ‰º	’â~	1
{ &carton_Character[(0x20*8) * 1], 0x20*8},						// ã	’â~	2
{ &carton_Character[(0x20*8) * 2], 0x20*8},						// ¶‰E ’â~	3
{ &carton_Character[(0x20*8) * 3], 0x20*8},						// ‰º 	•às	4
{ &carton_Character[(0x20*8) * 4], 0x20*8},						// ã	•às	5
{ &carton_Character[(0x20*8) * 5], 0x20*8},						// ¶‰E •às1	6
{ &carton_Character[(0x20*8) * 6], 0x20*8},						// ¶‰E •às2	7
//--------------------------------------------------------------- 01
#endif
};

#if 0

typedef struct {
	const u16 cellNo = 0xffff;		// ¾ÙÅİÊŞ° (0xffff‚Ìê‡‚Í·¬×“]‘—Œ^) add matsuda
	const u16 palNo;				// ÊßÚ¯ÄÏÈ°¼Ş¬“o˜^ÅİÊŞ

//----	
	ActAnmData *TransAdrs;			// “]‘—Ã°ÌŞÙ±ÄŞÚ½
	
			or 

	const u8 TransTblNo = 2;		// “]‘—Ã°ÌŞÙQÆÅİÊŞ
//----
	
	const ActOamData *oamData_p;	// OAMŠî–{ÃŞ°À±ÄŞÚ½
	const actAnm **anmData_p;		// ACTOR\¬ÊßÀ°İÃ°ÌŞÙ±ÄŞÚ½
	const actAffAnm **affData_p;	// ŠgkÊß¯Ä kaga
	void (*moveData_p)(actWork *);	// ACTOR“®ìÊßÀ°İŠÖ”±ÄŞÚ½
}actHeader;	//±¸À°Í¯ÀŞ\‘¢‘Ì

const	actAnmData **actAnmTransDataTable[] =
{
	Field_Char,							// Ì¨°ÙÄŞ				// cellNo 0xffff
	PokeFront_Char,						// Îß¹Óİ ³–Ê			// cellNo 0xfffe
	PokeBack_Char,						// Îß¹Óİ ”wŒã			// cellNo 0xfffd
};


const	actAnmData *Field_Char[] =
{
	carton_Character,					// ålŒö				// 0
	TrainBoy_Character,					// ­”NÄÚ°Å°			// 1
	TrainGirl_Character,				// ­—ÄÚ°Å°			// 2
};

const	actAnmData *PokeFront_Char[] =
{
	Dmmy,								// •sv‹c‚¾‚Ë
	Dmmy,
	Dmmy,
	Dmmy,
}

#endif

