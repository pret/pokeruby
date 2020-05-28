#ifndef __CONMSG_H__
#define __CONMSG_H__


extern const u8 jyuni_msg[];
extern const u8 ranking_no_msg[];
extern const u8 yasumi_msg[];
extern const u8 tuusintyuu_msg[];
extern const u8 WhiteCode_msg[];
extern const u8 yuusyou_msg[];
extern const u8 mojimoji_msg[];
extern const u8 dokidoki_msg[];
extern const u8 deredere_msg[];
extern const u8 orooro_msg[];
extern const u8 bikubiku_msg[];
extern const u8 Kintyou_msg[];
extern const u8 Penalty_msg[];
extern const u8 TensionUp_msg[];
extern const u8 TensionDown_msg[];
extern const u8 TensionMax_msg[];
extern const u8 *const TensyonKindMsgTbl[];
extern const u8 Tensyon_msg[];
extern const u8 TugiYasumi_msg[];
extern const u8 Mituduketeiru_msg[];
extern const u8 Mewomukerare_msg[];

//----------------------------------------------------------
//	技のアピール効果のメッセージのID
//----------------------------------------------------------
enum{
	APPEAL1_MSG = 0,
	APPEAL2_MSG,
	APPEAL4_0_MSG,
	APPEAL5_0_MSG,
	APPEAL6_0_MSG,
	APPEAL7_0_MSG,
	APPEAL8_MSG,
	APPEAL16_0_MSG,
	APPEAL16_1_MSG,
	APPEAL25_0_MSG,
	APPEAL25_1_MSG,
	APPEAL26_MSG,
	APPEAL27_0_MSG,
	APPEAL27_1_MSG,
	APPEAL28_MSG,
	APPEAL29_MSG,
	APPEAL30_MSG,
	APPEAL31_0_MSG,
	APPEAL31_1_MSG,
	APPEAL32_0_MSG,
	APPEAL32_1_MSG,
	APPEAL33_0_MSG,
	APPEAL33_1_MSG,
	APPEAL33_2_MSG,
	APPEAL33_3_MSG,
	APPEAL34_0_MSG,
	APPEAL34_1_MSG,
	APPEAL34_2_MSG,
	APPEAL34_3_MSG,
	APPEAL34_4_MSG,
	APPEAL34_5_MSG,
	APPEAL35_MSG,
	APPEAL36_MSG,
	APPEAL37_0_MSG,
	APPEAL37_1_MSG,
	APPEAL38_MSG,
	APPEAL39_MSG,
	APPEAL40_MSG,
	APPEAL41_MSG,
	APPEAL43_MSG,
	//ｺﾝﾎﾞメッセージ
	COMBO_MSG,
	COMBO1_MSG,
	COMBO2_MSG,
	COMBO3_MSG,
	//妨害を受けた時、防御状態のメッセージ
	APPEAL4_MSG,
	APPEAL5_MSG,
	APPEAL6_MSG,
	APPEAL7_MSG,
	//妨害技を出す時のメッセージ
	BIKKURISASEYOUTOSITA_MSG,
	//妨害を受けた時のメッセージ
	BOUGAI10_MSG,
	BOUGAI20_MSG,
	BOUGAI30_MSG,
	BOUGAI40_MSG,
	BOUGAI60_MSG,
	DEMOSIPPAI_MSG,
	DEMOKINTYOU_MSG,
	DEMODAREMOKINTYOU_MSG,
	DEMOMUSI_MSG,
	DEMOTYOUSIHA_MSG,
	TYOUSIGAYOKUNAKUTE_MSG,
	HEIKIDATTA_MSG,
	TYUUMOKUWOATUMETA_MSG,
};


//----------------------------------------------------------
//	メッセージテーブル
//----------------------------------------------------------
extern const u8 *const AppealMsgTbl[];
extern const u8 *const ConTypeWazaMsgTbl[];


#endif	//__CONMSG_H__

