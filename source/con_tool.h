#ifndef __CON_TOOL_H__
#define __CON_TOOL_H__


//----------------------------------------------------------
//	定数
//----------------------------------------------------------
enum{			//GetBP関数で使用
	STYLE_MAIN,			//格好よさ
	BEAUTIFUL_MAIN,		//美しさ
	CUTE_MAIN,			//かわいさ
	CLEVER_MAIN,		//賢さ
	STRONG_MAIN,		//たくましさ
};
#define HEART_ICON_MAX		8		//技の説明表示に出すﾊｰﾄの最大数
#define METER_ONE_AP		10		//ﾒｰﾀｰ1つでどれだけのAP値を表すか

//-- ｽｸﾘｰﾝﾃﾞｰﾀ定数 --//
#define MENUWIN_CLEAR_SCRN	0x000c	//通常ﾒﾆｭｰが表示されている部分のｸﾘｱｰ用ｽｸﾘｰﾝﾃﾞｰﾀ
#define HEART_REDSPACE_SCRN	0x5035	//赤の空白のﾊｰﾄｷｬﾗ
#define HEART_BLACKSPACE_SCRN	0x5036	//黒の空白のﾊｰﾄｷｬﾗ
#define HEART_RED_SCRN0		0x5012	//赤いﾊｰﾄのｽｸﾘｰﾝﾃﾞｰﾀ
#define HEART_RED_SCRN1		0x5011	//薄い赤色のﾊｰﾄのｽｸﾘｰﾝﾃﾞｰﾀ
#define HEART_BLACK_SCRN0	0x5014	//黒いﾊｰﾄのｽｸﾘｰﾝﾃﾞｰﾀ
#define HEART_BLACK_SCRN1	0x5013	//灰色のﾊｰﾄのｽｸﾘｰﾝﾃﾞｰﾀ
#define HEART_CLEAR_SCRN	MSG_CLEAR_NO	//クリア用のﾊｰﾄのｽｸﾘｰﾝﾃﾞｰﾀ

#define STYLE_MSG_SCRN		0x4040	//技説明画面の技属性(かっこいい等)のｽｸﾘｰﾝ
#define BEAUTIFUL_MSG_SCRN	0x4045
#define CUTE_MSG_SCRN		0x404a
#define CLEVER_MSG_SCRN		0x406a
#define STRONG_MSG_SCRN		0x408a

#define BASE_HEART_SCRN0	0x5011	//APﾒｰﾀｰのﾍﾞｰｽとなるｽｸﾘｰﾝﾃﾞｰﾀ
#define BASE_HEART_SCRN1	0x6011	//APﾒｰﾀｰのﾍﾞｰｽとなるｽｸﾘｰﾝﾃﾞｰﾀ
#define BASE_HEART_SCRN2	0x7011	//APﾒｰﾀｰのﾍﾞｰｽとなるｽｸﾘｰﾝﾃﾞｰﾀ
#define BASE_HEART_SCRN3	0x8011	//APﾒｰﾀｰのﾍﾞｰｽとなるｽｸﾘｰﾝﾃﾞｰﾀ

#define BASE_METER_SCRN0	0x50a2	//APﾒｰﾀｰのﾍﾞｰｽとなるｽｸﾘｰﾝﾃﾞｰﾀ
#define BASE_METER_SCRN1	0x60a2	//APﾒｰﾀｰのﾍﾞｰｽとなるｽｸﾘｰﾝﾃﾞｰﾀ
#define BASE_METER_SCRN2	0x70a2	//APﾒｰﾀｰのﾍﾞｰｽとなるｽｸﾘｰﾝﾃﾞｰﾀ
#define BASE_METER_SCRN3	0x80a2	//APﾒｰﾀｰのﾍﾞｰｽとなるｽｸﾘｰﾝﾃﾞｰﾀ
enum{
	METER_WHITE,		//白色メーター
	METER_GRAY,
	METER_GREEN,
	METER_ORANJI,
	METER_BLUE,
	METER_PINK,
};

enum{
	SHIELD_TYPE,
	KINTYOU_TYPE,
	YASUMI_TYPE,
	BOUGAI_TARGET_TYPE,
	BOUGAI2BAI_TYPE,
};


//----------------------------------------------------------
//	セル＆パレットID
//----------------------------------------------------------
enum{
	CELLID_JYUNNIICON0 = 20000,
	CELLID_JYUNNIICON1,
	CELLID_JYUNNIICON2,
	CELLID_JYUNNIICON3,
	CELLID_HEARTICON,
	CELLID_SINSAIN,
	CELLID_SORTICON0,
	CELLID_SORTICON1,
	CELLID_SORTICON2,
	CELLID_SORTICON3,
};

//----------------------------------------------------------
//	データ
//----------------------------------------------------------
extern const actHeader JyunniIconHeader[];
extern const CellData JyunniIconCell;
extern const PalData JyunniIconPal[];


//----------------------------------------------------------
//	UserWorkに美術館ﾃﾞｰﾀを形成し、ｱｸｾｽするためのマクロ
//----------------------------------------------------------
//※PORTRAIT_DATAは見かけ上30byteだが、ｺﾝﾊﾟｲﾗの関係上実際には32byteとして取得される
#define TEMP_PORTRAIT_ADRS	(0x15e00-(sizeof(PORTRAIT_DATA)))		//美術館ﾃﾞｰﾀを一時的にUserWorkに形成
#define PORTRAIT_TEMP	((PORTRAIT_DATA*)&UserWork[TEMP_PORTRAIT_ADRS])

//-- 似顔絵を見る関数を呼ぶ時に引数として使用 --//
#define TEMP_PORTRAIT_MSGFLG	(TEMP_PORTRAIT_ADRS - 1)	//0:通常表示,1:文字なし表示
#define TEMP_PORTRAIT_PLACE		(TEMP_PORTRAIT_ADRS - 2)	//0:ハジツゲ......12:美術館５(仕様参照)
	
//----------------------------------------------------------
//	外部関数宣言
//----------------------------------------------------------
extern void SetBreederData(u8,u8);
extern void PutPlayerInfo(void);
extern void GetBreederNo(void);
extern u8 ContestPokeActorSet(void);
extern void PlayerInfoCopy(void);
extern void PutWazaComment(u16 wazano);
extern void WazaCommentClear(void);
extern void ContestTalkMsgClear(void);
extern void UseWorkGetAll(void);
extern void UsedWorkNamePutAll(u8);
extern void TotalAPCalc(void);
extern void PenaltyCalc(void);
extern u8 ConWazaMsgSet(u8 brd_no, u8 msg_no);
//extern void SetJudgeParam(void);
extern void GetEvaluationValueAll(void);
extern void GetEvaluationValue(u8 brd);
extern void GetBPAll(u8 MainContest);
extern void ConWazaFlagCheckClear(void);
extern void SetMyBreederData(u8 temotino);
extern u16 GetBP(u8 brd, u8 MainContest);
extern void TuusintyuuMsgPut(void);
extern u16 UseWorkGet(u8 pos);
extern u8 ContestPokeActorSet2(u16 monsno, u32,u32);
extern u8 WazaCalcFlagCheck(u8 brd);
extern u8 AppealMeterTaskSet(s16 now_ap, s16 add_ap, u8 col, u8 brd_pos);
extern void AppealMeterClear(void);
extern void WazaKubunIconPut(u16 wazano, u8 brd_pos);
extern void WazaKubunIconPutAll(void);
extern void JyunniIconPut(void);
extern u8 JyunniIconEffectEndCheck(void);
extern void JyunniIconAllDataSet(void);
extern void EyeColorTaskSet(void);
extern void EyeColorFadeStop(u8 brd_pos);
extern void EyeColorFadeStart(u8 brd_pos);
extern void MeterColorTaskSet(void);
extern void MeterColorFlagClear(u8 brd_pos);
extern void MeterColorClearAll(void);
extern void AppealPutMsgSet(u8);
extern u8 YasumiTurnCheck(u8 brd);
extern void EyeColorStatusCheckSet(u8 brd);
extern u8 AppealKoukaColorTaskSet(u8 *color_flg);
extern u8 BreederWindowObjSet(u8 brd);
extern void BrdWinAlphaRegSet(void);
extern void BrdWinWazaPutEffSet(u8 actno, u8);
extern void BrdWinObjDel(u8 actno);
extern void WazaPutBrdWinLight(u8 brd, u8 houkou);
extern void AppealMeterWhiteSet(s16 ap, u8 brd);
extern void UsedWorkNameClear(u8 brd);
extern void UsedWorkNameClearAll(void);
extern void UsedWorkNamePut(u8 brd, u8 deep);
extern void DebugAPPut(void);
extern void DebugAPUpdatingCheckPut(void);
extern u8 AppealMeterTaskSet2(s16 now_ap, s16 add_ap, u8 brd);
extern u8 PortraitDataSet(u8 tiiki_no);
extern u8 PortraitDataSpaceSearch(u8 tiiki_no, u8 slide_flg);
extern void InitPortraitData(void);
extern u8 ContestJudgeActorSet(void);
extern u8 AppealHeartTaskSet(s16 now_ap, s16 add_ap, u8 brd_pos);
extern void SetHeartIconMove(u8 brd);
extern void HeartIconAllSet(void);
extern void SetHeartIconMoveAll(void);
extern u8 CheckHeartIconMoveAll(void);
extern void BreederDataSort(u8 sort_type);
extern void ReWritePlayerInfo(void);
extern void HeartIconYposSet(void);
extern void HearIconEva(u8 evac);
extern void ContestWazaCalc(u8 nowbrd);
extern void BougaiMsgSet(u8, u8 damage);
extern void AppealKoukaMsgSet(u8, u8 msgid);
extern void AppealMsgSet(u8 brd, u8);
extern void ConWazaBrdSort(void);
extern u8 BonusIconPut(u8 brd_pos, u8);
extern void BonusIconResetAll(void);
extern u8 JudgeFukidasiActorSet(void);
extern void JudgeFukidasiSet(u8 fukidasi_type);
extern void TensyonNumPut(void);
extern s8 TensyonCheck(u16 wazano);
extern void TensyonMsgPut(void);
extern void NextSortPrint(u8);
extern u8 WazaKoukaIconPut(u8 brd);
extern void WazaKoukaIconPutAll(void);
extern void KintyouFlgSet(u8 brd);
extern void AppealKoukaMsgSet2nd(u8 brdno, u8 msgid);
extern u8 ContestParticipationCheck(PokemonParam *pp);
extern void BougaiReceiveIconPut(void);
extern u8 Combo1TermCheck(u8 brd);
extern u8 Combo1HasseiCheck(u8 brd);
extern void VoltageIconActorSet(void);
extern void VoltageIconAnmSet(s8 tensyon);
extern u8 TensyonMaxPalAnmSet(void);
extern void VoltageGaugeSlidPut(s8 flg);
extern void KankyakuAnmSet(void);
extern void VoltageGaugeSlidOut(void);
extern void VoltageGaugeSlidIn(void);
extern void KankyakuColorFadeSet(s8 flg, s8 muki);
extern void VoltageGaugePut(void);
extern void VoltageGaugeBanish(void);
extern void InfoMaskEffectDataSet(void);
extern void InfoMaskEffectDataClear(void);
extern s16 GetNijisinsaPoint(u8 brd);
extern void SortIconAllSet(void);
extern void HeartIconAffEffSet(u8 aff_type);
extern void ContestWazaEffectWorkClear(u8 brd);
extern u8 ContestSioOyaCheck(void);
extern void GetTurnKekkaMsgID(void);
extern void SetRangeClient(u16 wazano);
extern void ConWazaEffParaSet(u8 brd);
extern void SetEnemyBanishActor(void);
extern void EnemyBanishActorParamInit(void);
extern u16 GetContWazaNo(u16 wazano);
extern u16 GetContMonsNo(u16 monsno);
extern void ContestWazaEffectWorkSet(u8 brd);
extern u8 ContestPokeFlipCheck(u16 monsno);

//-- テスト関数 --//
extern void DownMoveEffect(u8 id);
#if 0
extern void RightMoveEffect(u8 id);
extern void BldMoveEffect(u8 id);
extern void LasterMoveEffect(u8 id);
#endif


#endif	//__CON_TOOL_H__

