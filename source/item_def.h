//=========================== ポケット番号 ===============================
#include "pocketno.h"	// ここに移動

//============================== 戻り先 ==================================
#define FIELD_POKELIST		1
#define	FIELD_MAIN			2
#define	FIELD_CUBECASE		3
#define	FIELD_BAG			4

#define	BATTLE_POKELIST		1
#define	BATTLE_MAIN			2

//==================== フィールドプログラムアドレス ======================
extern void CheckFieldCycle(u8);			// 自転車が使用できるか
extern void CheckFieldFishing(u8);			// 釣り竿が使用できるか
extern void SetPokeSkillInit(u8);			// ポケモンに技を覚えさせる初期設定
extern void CheckSeedUse(u8);				// タネが使用できるか
extern void SetUseMsg(u8);					// アイテム使用メッセージ表示
extern void CheckZyouroUse(u8);				// じょうろが使用可能かチェック
extern void FieldBagMailUseInit(u8);		// メールを使用
extern void FldPokeRecoverInit(u8);			// 回復アイテム
extern void FldPokePPRecoverInit(u8);		// PP回復アイテム
extern void FldPokeWazaPointUpInit(u8);		// ポイントアップ
extern void FldPokeListLvUptUpInit(u8);		// ふしぎなアメ
extern void FldUseSpray(u8);				// スプレー
extern void FldAnanukeInit(u8);				// あなぬけのひも
extern void FldItemCubeCase(u8);			// キューブケース
extern void FldUseEvolutionItem(u8);		// 進化アイテム
extern void FldItemDowsingMachine(u8);		// ダウジングマシン
extern void FldItemCoinCase(u8);			// コインケース
extern void FldUseEncountVidro(u8);			// ビードロ
extern void FldItemUseRAMKinomi(u8);		// ナゾの実（ RAM木の実 ）
extern void FldPokeAllDethRecoverInit(u8);	// 全員瀕死回復アイテム

extern void DummyItemUseFunc(u8);			// 使用できないアイテム（仮）

#define	ITEMPG_FLD_CYCLE		CheckFieldCycle
#define	ITEMPG_FLD_FISHING		CheckFieldFishing
#define ITEMPG_FLD_SKILL		SetPokeSkillInit
#define ITEMPG_FLD_SEED			CheckSeedUse
#define ITEMPG_FLD_USEMSG		SetUseMsg
#define ITEMPG_FLD_ZYOURO		CheckZyouroUse
#define ITEMPG_FLD_MAIL			FieldBagMailUseInit
#define ITEMPG_FLD_RECOVERY		FldPokeRecoverInit
#define ITEMPG_FLD_PP_RECOVERY	FldPokePPRecoverInit
#define ITEMPG_FLD_W_POINT_UP	FldPokeWazaPointUpInit
#define	ITEMPG_FLD_LIST_LV_UP	FldPokeListLvUptUpInit
#define	ITEMPG_FLD_SPRAY		FldUseSpray
#define	ITEMPG_FLD_ESCAPE		FldAnanukeInit
#define	ITEMPG_FLD_CUBECASE		FldItemCubeCase
#define	ITEMPG_FLD_EVOLUTION	FldUseEvolutionItem
#define	ITEMPG_FLD_DOWSING		FldItemDowsingMachine
#define	ITEMPG_FLD_COINCASE		FldItemCoinCase
#define	ITEMPG_FLD_VIDRO		FldUseEncountVidro
#define ITEMPG_FLD_RAM_KINOMI	FldItemUseRAMKinomi
#define	ITEMPG_FLD_ALLDETH_RCV	FldPokeAllDethRecoverInit

#define	ITEMPG_FLD_DUMMY		DummyItemUseFunc

//====================== バトルプログラムアドレス ========================
extern void BtlMonsterBallUse(u8);		// モンスターボール（戦闘）
extern void BtlStRecoverItem(u8);		// 回復アイテム（戦闘）
extern void BtlPPRecoverItem(u8);		// PP回復アイテム（戦闘）
extern void BtlBagUseItem(u8);			// 戦闘用ステータスアップアイテム
extern void BtlItemUseNigaiKinomi(u8);	// にがいきのみ（戦闘）
extern void BtlEscapeItem(u8);			// ピッピ人形（仮名）（戦闘）
extern void BtlItemUseRAMKinomi(u8);	// ナゾの実（ RAM木の実 ）
extern void BtlAllDethRecoverItem(u8);	// 全員瀕死回復アイテム（戦闘）

#define	ITEMPG_BTL_BALL			BtlMonsterBallUse
#define	ITEMPG_BTL_RECOVERY		BtlStRecoverItem
#define	ITEMPG_BTL_PP_RECOVERY	BtlPPRecoverItem
#define	ITEMPG_BTL_STATUS_UP	BtlBagUseItem
#define	ITEMPG_BTL_KONRAN_RCV	BtlItemUseNigaiKinomi
#define	ITEMPG_BTL_ESCAPE		BtlEscapeItem
#define ITEMPG_BTL_RAM_KINOMI	BtlItemUseRAMKinomi
#define	ITEMPG_BTL_ALLDETH_RCV	BtlAllDethRecoverItem
