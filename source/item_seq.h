extern	u32	ItemBallTbl[];
extern	u32	ItemNormalTbl[];
extern	u32	ItemFightTbl[];
extern	u32	SpecialActionTbl[];
extern	void	ITEM_MonsGetSuccess(void);
extern	void	ITEM_MonsGetFail(void);
extern	void	ITEM_DemoMonsGetSuccess(void);
extern	void	ITEM_TrainerMonsGet(void);

//特殊アクションのテーブルナンバー
enum{
	SPEACT_SAFARI_NO=0,
	SPEACT_APPROACH_NO,
	SPEACT_CUBETHROW_NO,
	SPEACT_GET_DEMO_NO,
};
