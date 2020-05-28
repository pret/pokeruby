//=========================================================================
//
//		ポケモンに持たせるメール
//												by matsuda	2001.08.28(火)
//=========================================================================

#ifndef __MAIL_H__
#define __MAIL_H__

#include "param.h"	// PokemonParam型のため


//=========================================================================
//	定数定義
//=========================================================================
#define MAIL_MSG_LEN		9		//簡易会話数(本文)
#define MAIL_TEMOTI_STOCK	6		//手持ちでｽﾄｯｸしておける数
#define MAIL_PASOCOM_STOCK	10		//ﾊﾟｿｺﾝでｽﾄｯｸして置ける数
#define MAIL_STOCK_MAX	(MAIL_TEMOTI_STOCK+MAIL_PASOCOM_STOCK)

#define NON_ITEM	0	//ｱｲﾃﾑなし状態(とりあえず0がｱｲﾃﾑなし)

#define	NON_MAIL	0xff	//ﾒｰﾙを持っていないときのIDNo

#define MAIL_HOLDMONSNO_ANNOON	30000	//hold_monsnoにｱﾝﾉｰﾝが入ってきた時の基準値


//=========================================================================
//	構造体宣言
//=========================================================================

//-- (SRAMに保存しておくもの) --//
typedef struct{
	u16 msg[MAIL_MSG_LEN];			//メール本文
	u8 writer_name[PERSON_NAME_SIZE+EOM_SIZE];				//書いた人の名前
	u8 writer_id[4];				//書いた人のID
	u16 hold_monsno;				//持たせたﾎﾟｹﾓﾝNo
	u16 design_no;					//絵柄(ｱｲﾃﾑNo)  ※NON_ITEMだった場合は使用してない
}MAIL_DATA;



//=========================================================================
//	外部関数
//=========================================================================
extern void MailWorkInit(void);
extern u8 PokeMailCheck(PokemonParam *pp);
extern u8 PokeAddNewMail(PokemonParam *pp, u16 itemno);
extern u8 MailTrans(PokemonParam *pp);
extern void PokeDelMail(PokemonParam *pp);
extern u8 MailItemNoCheck(u16 itemno);
extern u8 PokeAddWrittenMail(PokemonParam *pp, MAIL_DATA *md);
extern void MailDataInit(MAIL_DATA *md);
extern void PasoDelMail(u8 mailid);
extern u16 GetMailHoldMonsNo(u16 hold_monsno, u16 *annon_id);
extern u16 MailHoldMonsNoMake(u16 monsno, u32 personal_rnd);



#endif	//__MAIL_H__

