#ifndef __A_STATUS_H__
#define __A_STATUS_H__


//----------------------------------------------------------
//	外部関数宣言
//----------------------------------------------------------
extern void SetDokuStatusEffect(u8 , u8 selmons_no, u8 condition);
extern void SetNemuriStatusEffect(u8 , u8 selmons_no, u8 condition);
extern void SetKooriStatusEffect(u8);
extern void SetMahiStatusEffect(u8, u8 selmons_no, u8 condition);
extern void SetYakedoStatusEffect(u8 , u8 selmons_no, u8 condition);
extern u8 StatusChangeEffect(u8 client_no, u8 up_down);

extern void SetStatusEffect(u8 client_no, u8 conditon_no);


//----------------------------------------------------------
//	シーケンステーブルに定義されているエフェクトの並び
//----------------------------------------------------------
enum{
	STEFF_DOKU = 0,
	STEFF_KONRAN,
	STEFF_YAKEDO,
	STEFF_MEROMERO,
	STEFF_NEMURI,
	STEFF_MAHI,
	STEFF_KOORI,
	STEFF_NOROI,
	STEFF_AKUMU,
	STEFF_SIMETUKE,
};



#endif	//__A_STATUS_H__

