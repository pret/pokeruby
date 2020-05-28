//====================================================================
//							externêÈåæ
//====================================================================
extern void TVContestRankGet(u8,u8);
extern void TVContestTypeGet(u8,u8);
extern void ScrTVContestTypeGet();
extern void SetNumSelectBuf(u8,int);
extern void SetTotalMoneySelectBuf(u8,TV_Sec_Shop_Work*);
extern u8 TVSecDataTypeChk(u8);
extern void TVShopDataSort();
extern void TVLetterDataTypeChk(u8);
extern void ScrInterViewTypeChk();
extern void ScrLetterPokeChk();
extern void TVDataClear(TV_EVENT *,u8);
extern void TVDataSort(TV_EVENT *);
extern void SetRndPokeSelectBuf(u8);
extern u16 SetRndChoicePokeSelectBuf(u8,u16);
extern u16 RndChoicePoke(u16);
extern void ScrTVDataHimselfAkiChk();
extern s8 TVDataHimselfAkiChk(TV_EVENT *);
extern s8 TVDataPartnerAkiChk(TV_EVENT *);
extern void ScrLetterRecentlyTypeChk();
extern void DebugTVTypeChange();
extern u8 TVRndChk(u16);
extern void GetLetterRndKaiwaWord(TV_Letter_Work*);
extern u8 TopPokeNickNameChk(u8);
extern u8 ScrTopPokeNickNameChk();
extern u8 GetPokeNickNameBit(TV_Name_Work*);
extern void SetMojiNoSelectBuf(u8,u8,u8,u16,u16,TV_Name_Work*);
extern void ScrLetterNameTypeChk();
extern u16 GetNumKeta(int num);
extern u8 TVDataCopyTypeGet();
extern u32 GetMyDataID();
extern u8 TVMyHomeChk();
extern void ScrLetterConTypeChk();

