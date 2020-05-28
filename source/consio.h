#ifndef __CONSIO_H__
#define __CONSIO_H__


//----------------------------------------------------------
//	ﾃﾞｰﾀ要求ｺｰﾄﾞ
//----------------------------------------------------------
enum{	//50に特に意味はない　0や1よりも要求ｺｰﾄﾞとして何となく適してるかなぁと
	BD_REQ = 50,	//ﾌﾞﾘｰﾀﾞｰﾃﾞｰﾀ要求ｺｰﾄﾞ
	CBT_REQ,		//ChangeBackTask実行ﾘｸｴｽﾄｺｰﾄﾞ
	STANDBY_REQ,	//ｺﾝﾃｽﾄ開始時の同期を取るためのｽﾀﾝﾊﾞｲｺｰﾄﾞ
	WAZANO_REQ,		//技ﾅﾝﾊﾞｰを送信しろ
	EVALUATION_REQ,	//評価値を送信しろ
	CT_REQ,			//ｺﾝﾃｽﾄﾀｲﾌﾟを送信しろ
	BD_GET,			//ﾌﾞﾘﾀﾞｰﾃﾞｰﾀ取得
	JUDGE_GET,		//審判ﾃﾞｰﾀ取得
	TANE_GET,		//ﾗﾝﾀﾞﾑﾀﾈ取得
	CONKIND_GET,	//conkind取得
	CONTYPE_GET,	//ｺﾝﾃｽﾄﾀｲﾌﾟ取得
	WAZANO_GET,		//技ﾅﾝﾊﾞｰ取得
	EVALUATION_GET,	//評価値取得
};


extern void ContestSioInit(u8 id);
extern void BreederTransData(u8 id);
extern void RandTaneTransData(u8 id);
extern void ContestTypeTransData(u8 id);
extern void ContestStandbyCheck(u8 id);
extern void ContWazaNoSioGet(u8 id);
extern void EvaluationSioGet(u8 id);
extern void ContestTypeGetAllData(u8 id);
extern void ContWazaCalcDataSioGet(u8 id);
extern void ContestVersionGetAllData(u8 id);
extern void ContBPAllTransData(u8 id);
extern void BrdSortInitAllTransData(u8 id);


#endif

