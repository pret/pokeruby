
#ifndef	__POKETOOL_H_
#define	__POKETOOL_H_


#include	"param.h"
#include	"poketool.def"
#include	"chr.def"

extern	const	u32	GrowTbl[8][101];

extern	void	PokeParaCalc(PokemonParam *);
extern	void	PokeReplace(PokemonPasoParam *,PokemonParam *);
extern	void	PokeActHeaderMake(u16,u8);
extern	void	TrainerActHeaderMake(u16,u8);
extern	u8		AddPokemon(PokemonParam *);
extern	void	AddPokemonAct(PokemonParam *,PokemonParam *,int);
extern	u8		Poke2vs2Check(void);
extern	void	PokeWazaOboe(PokemonParam *);
extern	u16		PokeWazaOboeCheck(PokemonParam *,u8);

extern	u8		PokeCountMineGet();
extern	u8		PokeCountEnemyGet();

extern void PokePasoParaInit(PokemonPasoParam *PPP);
extern	void	PokeParaInit(PokemonParam *);
extern	void	PokeParaMineInit(void);
extern	void	PokeParaEnemyInit(void);

extern	u16		PokeWazaSet(PokemonParam *,u16);
extern  u8		PokeOboeruWazaAllGet(u16 monsno,u16 *nobuf);
extern	void	PokeWazaSetPos(PokemonParam *,u16,u8);
extern	u16		PokeWazaSetServer(PokemonServerParam *,u16);
extern	void	PokeWazaSetPosServer(PokemonServerParam *,u16,u8);
extern	void	PokePPCountClear(PokemonParam *,u8);
extern	void	PokePPCountClearServer(PokemonServerParam *,u8);
extern	s32		WazaDamageCalc(PokemonServerParam *,PokemonServerParam *,int,u16,u16,u8,u8,u8);
extern	u8 		HitCountCheck(u8);
extern	u8 		GetDefenceClient(u8);
extern	u8		PPCountGet(PokemonParam *,int);
extern	u8		PokeSexGet(PokemonParam *);
extern	u8		PokePasoSexGet(PokemonPasoParam *);
extern	u8		PokeSexGetMonsNo(u16 no,u32 rnd);
extern	u8		PokeLevelCalc(PokemonParam *);
extern	u8		PokePasoLevelCalc(PokemonPasoParam *);

extern	PokemonParam	PokeParaMine[6];
extern	PokemonParam	PokeParaEnemy[6];
extern	u8	PokeCountMine;
extern	u8	PokeCountEnemy;
extern	const u8 CondChgTable[][2];
extern	actHeader	PokeActHeader;

extern	const	u8	PokeNameData[][6];		//from monsname.h
extern	const	u8	WazaNameData[][8];		//from wazaname.h

extern	u16	wazapow;
extern	u8	BattlePokeAnmNo[4];

extern	u16	OboeWazaNo;

//=============================================================
//
//	PokeParaSet(ポケモンのパラメータをセットする）
//
//	引数：
//	PP	=	パラメータをセットする構造体のポインタ
//	pokeno	=　ポケモンナンバー
//	pokelevel　=　ポケモンのレベル
//	pow		=	セットするパワー乱数(POW_RNDの時は乱数でセット）
//	rndflag =	個性乱数のセットの有無（0:乱数でセット1:次のu32をセット）
//	rnd		=	セットする個性乱数（0の時は乱数でセット）
//
//=============================================================

extern	void	PokeParaSet(PokemonParam *PP,u16 pokeno,u8 pokelevel,u8 pow,u8 rndflag,u32 rnd,u8 idflag,u32 id);

extern	void	PokePasoParaSet(PokemonPasoParam *PPP,u16 pokeno,u8 pokelevel,u8 pow,u8 rndflag,u32 rnd,u8 idflag,u32 id);

//=============================================================
//
//	PokeParaSetChr(ポケモンのパラメータをセットする。性格もきめうちで）
//
//	引数：
//	PP			=	パラメータをセットする構造体のポインタ
//	pokeno		=　ポケモンナンバー
//	pokelevel	=　ポケモンのレベル
//	pow			=	セットするパワー乱数(POW_RNDの時は乱数でセット）
//	chr			=	セットする性格（０～２４）chr.defに定義されてます
//
//=============================================================

extern	void	PokeParaSetChr(PokemonParam *PP,u16 pokeno,u8 pokelevel,u8 pow,u8 chr);

//=============================================================
//
//	PokeParaSetSexChr(ポケモンのパラメータをセットする。性別、性格もきめうちで）
//
//	引数：
//	PP			=	パラメータをセットする構造体のポインタ
//	pokeno		=　ポケモンナンバー
//	pokelevel	=　ポケモンのレベル
//	pow			=	セットするパワー乱数(POW_RNDの時は乱数でセット）
//	chr			=	セットする性格（０～２４）chr.defに定義されてます
//	annon		=	アンノーンの形状も（0:関係無し）
//
//=============================================================

extern	void	PokeParaSetSexChr(PokemonParam *PP,u16 pokeno,u8 pokelevel,u8 pow,u8 sex,u8 chr,u8 annon);

//=============================================================
//
//	PokeParaSetDemo(ポケモンのパラメータをセットする。捕獲デモ専用）
//
//	引数：
//	PP			=	パラメータをセットする構造体のポインタ
//	pokeno		=　ポケモンナンバー
//	pokelevel	=　ポケモンのレベル
//
//=============================================================

extern	void	PokeParaSetDemo(PokemonParam *PP,u16 pokeno,u8 pokelevel);

//===============================================================
//
//	ポケモンパラメータゲット関数
//
// in :	PP	ゲットするポケモンパラメータ構造体のポインタ
//		id	ゲットするパラメータのID（poketool.def参照）
//		...	実際はchar型のポインタを入れる（nicknameなどの配列）
//			必要のないときはなくてもよい
//===============================================================

extern	u32		PokeParaGet(PokemonParam *PP,int ,...);

//===============================================================
//
//	ポケモンパラメータゲット関数（パソコン用）
//
// in :	PPP	ゲットするポケモンパラメータ構造体のポインタ
//		id	ゲットするパラメータのID（poketool.def参照）
//		...	実際はchar型のポインタを入れる（nicknameなどの配列）
//			必要のないときはなくてもよい
//===============================================================

extern	u32		PokePasoParaGet(PokemonPasoParam *PPP,int ,...);

//===============================================================
//
//	ポケモンパラメータプット関数
//
// in :	PP	プットするポケモンパラメータ構造体のポインタ
//		id	プットするパラメータのID（poketool.def参照）
//		buf	プットするデータのポインタを入れる
//===============================================================

extern	void	PokeParaPut(PokemonParam *PP,int,const u8 *);

//===============================================================
//
//	ポケモンパラメータプット関数（パソコン用）
//
// in :	PPP	プットするポケモンパラメータ構造体のポインタ
//		id	プットするパラメータのID（poketool.def参照）
//		buf	プットするデータのポインタを入れる
//===============================================================

extern	void	PokePasoParaPut(PokemonPasoParam *PPP,int,const u8 *);

//===============================================================
//
//	自分についている特殊能力を取得する関数
//
// in :	monsno	取得するポケモンナンバー
//		abiflag	取得する特殊能力のフラグ（ 0 or 1 ）
// out:	特殊能力ナンバー(tokusyu.def参照）
//===============================================================

extern	u8		SpecialAbirityGet(u16 monsno,u8 abiflag);

//===============================================================
//
//	自分についている特殊能力を取得する関数
//
// in :	PokemonParam	取得するポケモンの構造体のポインタ
// out:	特殊能力ナンバー(tokusyu.def参照）
//===============================================================

extern	u8		SpecialAbirityNoGet(PokemonParam *);

//===============================================================
//
//	お留守番対戦用トレーナーデータセット関数
//
// in :	SBD	セットする秘密基地データのポインタ
//===============================================================

extern	void	OrusubanTaisenSet(SECRET_BASE_DATA *SBD);

//===============================================================
//		お留守番対戦のトレーナーグラフィックIDを返す
//===============================================================

extern	u8		OrusubanChrGet(void);

//===============================================================
//		お留守番対戦のトレーナータイプIDを返す
//===============================================================

extern	u8		OrusubanTypeGet(void);

//===============================================================
//
//	アイテムを使用してポケモンのステータス異常を回復する
//
// in :	PP	回復するポケモンデータのポインタ
// 		itemno	使用するアイテム
// 		pos		ポケモンリストで何番目のポケモンかを指示
// 		pos2	技リストで何番目の技かを指示（PPとか限定）
// out:	0	回復成功
// 		1	使用しても効果がない
//===============================================================

//extern	u8	StatusRecover(PokemonParam *PP,u16 itemno,u8 pos,u8 pos2);
extern	u8	StatusRecover(PokemonParam *PP,u16 itemno,u8 pos,u8 pos2);
extern	u8	StatusRecover2(PokemonParam *PP,u16 itemno,u8 pos,u8 pos2,u8 hpflag);

//===============================================================
//
//	モンスターボールを投げれるかのチェック
//
// out:	0	投げれます
// 		1	投げれません
//===============================================================

extern	u8	BallThrowCheck(void);
extern	u8	BallThrowCheckSafari(void);

//===============================================================
//
//	モンスターネームを指定バッファにコピー
//
//	in : buf	コピーするバッファ
//		 monsno	ポケモンナンバー
//===============================================================

extern	u8	PokeNameSet(u8 *buf,u16 monsno);

//===============================================================
//
//	PPMaxをゲット
//
//	in : wazano	ゲットする技ナンバー
//		 maxup	アイテムによるマックスアップカウンター
//		 pos	カウンター位置（u8を2ビットずつ使用しているので）
//===============================================================

extern	u8	PPMaxGet(u16 wazano,u8 maxup,u8 pos);

//===============================================================
//
//	戦闘で使えるアイテムかチェックしてメッセージのポインタを返す
//	（チェックはなくなって、単純にメッセージをゲットする関数になりました）
//
//	in : itemno	使うアイテムナンバー
//
//	out: 表示するメッセージのポインタ
//===============================================================

extern	u8	*FightItemUseMsgGet(u16 itemno);

//===============================================================
//
//	ポケモンの性格をゲット
//
//	in : PP	ゲットするポケモンの構造体のポインタ
//
//	out: 性格ナンバー
//===============================================================

extern	u8	PokeSeikakuGet(PokemonParam *PP);

//===============================================================
//
//	ポケモンの性格をゲット（個性乱数を引数にする）
//
//	in : rnd	個性乱数
//
//	out: 性格ナンバー
//===============================================================

extern	u8	PokeSeikakuGetRnd(u32 rnd);

//===============================================================
//
//	進化チェック
//
//	in : PP		チェックするポケモンの構造体のポインタ
//		 type	進化条件（poketool.defに定義）
//		 itemno	アイテム進化チェック時の使用アイテム(...にあたる。ないときは指定しなくても可）
//
//	out : 0 進化せず
//		  0以外	進化したポケモンナンバー
//
//===============================================================

extern	u16	PokeShinkaCheck(PokemonParam *PP,u8 type,...);

//===============================================================
//
//		図鑑ナンバーからモンスターナンバーをゲット
//
//	in : zukanno	図鑑ナンバー
//
//	out : monsno	モンスターナンバー
//
//===============================================================

extern	u16		PokeHouenNo2MonsNoGet(u16 zukanno);

extern	u16		PokeZukanNo2MonsNoGet(u16 zukanno);

extern	u16		PokeZukanNo2HouenNoGet(u16 zukanno);

//===============================================================
//
//		モンスターナンバーから図鑑ナンバーをゲット
//
//	in : monsno	モンスターナンバー
//
//	out : zukanno	図鑑ナンバー
//
//===============================================================

extern	u16		PokeMonsNo2ZukanNoGet(u16 monsno);

extern	u16		PokeMonsNo2HouenNoGet(u16 monsno);

extern	u16		PokeHouenNo2ZukanNoGet(u16 zukanno);

//===============================================================
//
//		モンスターナンバーからボイスナンバーをゲット
//
//	in : monsno	モンスターナンバー
//
//	out : voiceno	鳴き声ナンバー
//
//===============================================================

extern	u16		PokeMonsNo2VoiceNoGet(u16 monsno);

//===============================================================
//
//		ブチポケモンに個性乱数からブチをつける
//
//	in : monsno	ブチポケモンのポケモンナンバー
//	     rnd	ブチポケモンの個性乱数
//		 adrs	グラフィックデータが展開されている領域の先頭アドレス
//
//		ブチポケモンではない場合は、何もせずリターン
//
//===============================================================

extern	void	PokeBuchiMake(u16 monsno,u32 rnd,u8 *adrs);
extern	void	PokeBuchiMakeFB(u16 monsno,u32 rnd,u8 *adrs,u8 dir);

//===============================================================
//
//		進化時のニックネームつけ
//
//	in : PP			ポケモンの構造体ポインタ
//		 beforemons	進化前ポケモンナンバー
//		 aftermons	進化後ポケモンナンバー
//
//===============================================================

extern	void	PokeParaNickNameSet(PokemonParam *PP,u16 beforemons,u16 aftermons);

//===============================================================
//
//		マルチプレイ通信時のチーム内での前衛・後衛を取得
//
//	out :   0		前衛
//			0以外	後衛
//
//===============================================================

extern	u16	GetTeamPos(void);
extern	u16	GetTeamPos2(u8);

//===============================================================
//
//		マルチプレイ通信時のチーム内でのClientNoからIDを取得
//
//	out :   i		IDナンバー
//
//===============================================================

extern	int	GetTeamPosID(u16 pos);

//===============================================================
//
//		トレーナーの性別を取得（視線ルーチン曲の鳴らし分け用）
//
//	in : trainerID	トレーナーのID
//	out :   0:男　1:女　3:怪しい人	...
//
//===============================================================

#define	EYE_BOY			0		//男
#define	EYE_GIRL		1		//女
#define	EYE_LITTLE_GIRL	2		//小さい女の子
#define	EYE_AYASII		3		//怪しい人
#define	EYE_HAGESII		4		//はげしい人
#define	EYE_KAKKOII		5		//かっこいい人
#define	EYE_AQUADAN		6		//アクア団
#define	EYE_MAGUMADAN	7		//マグマ団
#define	EYE_SWIMMER		8		//スイマー
#define	EYE_FUTAGO		9		//双子
#define	EYE_SITENNOU	10		//四天王
#define	EYE_DEBU		11		//登山家orどっしり系
#define	EYE_INTERVIEWER	12		//インタビュアー
#define	EYE_GENTLEMAN	13		//ジェントルマン

extern	u8	GetTrainerSex(u16 trainerID);

//===============================================================
//
//		ポケモンの性格によるパラメータ増減を計算する
//
//	in : chr	性格
//		 para	計算する値
//		 cond	計算するパラメータ	COND_POW		攻撃力
//									COND_DEF		防御力
//									COND_AGI		素早さ
//									COND_SPEPOW		特殊攻撃力
//									COND_SPEDEF		特殊防御力
//
//	out : ret	計算結果
//
//===============================================================

extern	u8	PokeChrAbiCalc(u8 chr,u16 para,u8 cond);

//===============================================================
//
//		なつき度計算
//
//	in	:	PP	なつき度を計算するポケモン構造体のポインタ
//			id	なつき度計算するポケモンに行った行動IDナンバー（poketool.defに定義）
//
//===============================================================

extern	void	FriendCalc(PokemonParam *PP,u8 id);

//===============================================================
//
//		努力値ゲットルーチン
//
//	in	:	PP		努力値をゲットするポケモン構造体のポインタ
//			monsno	倒した相手ポケモンナンバー
//
//===============================================================

extern	void	ParaExpGet(PokemonParam *PP,u16 monsno);

//===============================================================
//
//		努力値トータルゲットルーチン
//		(今回は6パラメータの合計が510(暫定)を越えないようにするため）
//
//	in	:	PP		努力値のトータルを求めるポケモン構造体のポインタ
//
//	out	:	努力値の合計
//
//===============================================================

extern	u16		ParaExpTotalGet(PokemonParam *PP);

//===============================================================
//
//		ポケモンにポケルスを感染させる
//
//	in	:	PP		感染させるポケモン構造体ポインタ
//
//===============================================================

extern	void	PokerusSetCheck(PokemonParam *PP);

//===============================================================
//
//		ポケモンがポケルスに感染しているかチェック
//
//	in	:	PP			感染をチェックするポケモン構造体のポインタ
//			checkbit	0bit目をON：PP[0]をチェック
//									:
//									:
//						5bit目をON：PP[6]をチェック
//						0のときは、PP[0]だけをチェック
//
//===============================================================

extern	u8		PokerusCheck(PokemonParam *PP,u8 checkbit);
//過去に感染していたことも込み
extern	u8		PokerusedCheck(PokemonParam *PP,u8 checkbit);

//===============================================================
//
//		ポケルスの日数カウンターをデクリメントする
//
//	in	:	day		経過日数
//
//===============================================================

extern	void	PokerusCounterDec(u16 day);

//===============================================================
//
//		ポケルスの感染チェックルーチン
//
//	in	:	PP			感染をチェックするポケモン構造体のポインタ
//
//===============================================================

extern	void	PokerusCatchCheck(PokemonParam *PP);

//===============================================================
//
//		ポケモンのレベルアップチェックをする
//
//	in	:	PP		チェックするポケモン構造体のポインタ
//
//	out	:	0:レベルアップしない
//			1:レベルアップした（その場合levelに+1する）
//
//===============================================================

extern	u8	PokeLevelUpCheck(PokemonParam *PP);

//=============================================================
//
//　	押し出し式に技を覚える。
//
//	in	:	PP		セットする構造体のポインタ
//			wazano	覚える技
//
//=============================================================

extern	void	PokeWazaOboeOshidashi(PokemonParam *PP,u16 wazano);

//===============================================================
//
//		ポケモンに技マシンが使えるかチェック
//
//	in	:	PP			チェックするポケモン構造体のポインタ
//			machineno	使う技マシンナンバー
//
//	out	:	0:つかえない
//			1:つかえる
//
//===============================================================

extern	u32		PokeWazaMachineCheck(PokemonParam *PP,u8 machineno);

//===============================================================
//
//		ポケモンが覚える技を指定されたバッファに格納する
//
//	in	:	PP			技をおぼえるポケモン構造体のポインタ
//			nobuf		技ナンバーを格納するバッファのポインタ
//
//	out	:	格納した技ナンバーの数
//
//===============================================================

extern	u8		PokeOboeruWazaGet(PokemonParam *PP,u16 *nobuf);

//===============================================================
//
//		ポケモンが思い出せる技があるかチェックする
//
//	in	:	PP			技を思い出すポケモン構造体のポインタ
//
//	out	:	格納した技ナンバーの数
//
//===============================================================

extern	u8		PokeOboeruWazaCheck(PokemonParam *PP);

//======================================================================================
//
//	PokeParaSetPowRnd(ポケモンのパラメータをセットする。パワー乱数をu32で受け取って代入）
//
//	引数：
//	PP			=	パラメータをセットする構造体のポインタ
//	pokeno		=　ポケモンナンバー
//	pokelevel	=　ポケモンのレベル
//	pow			=	セットするパワー乱数
//
//======================================================================================

extern	void	PokeParaSetPowRnd(PokemonParam *PP,u16 pokeno,u8 pokelevel,u32 pow,u32 rnd);

//======================================================================================
//
//	PokeParaSetPowRndBuf(ポケモンのパラメータをセットする。パワー乱数をu8 *で受け取って代入）
//
//	引数：
//	PP			=	パラメータをセットする構造体のポインタ
//	pokeno		=　ポケモンナンバー
//	pokelevel	=　ポケモンのレベル
//	pow			=	セットするパワー乱数
//
//======================================================================================

extern	void	PokeParaSetPowRndBuf(PokemonParam *PP,u16 pokeno,u8 pokelevel,u8 *pow,u32 id);

//======================================================================================
//
//	PokeParaSetParaExp(ポケモンのパラメータをセットする。努力値もセットする）
//
//	引数：
//	PP			=	パラメータをセットする構造体のポインタ
//	pokeno		=　ポケモンナンバー
//	pokelevel	=　ポケモンのレベル
//	pow			=	セットするパワー乱数
//	expbit		=	セットする努力値のビット(0bit:hp_exp 1bit:pow_exp 2bit:def_exp...）
//
//======================================================================================

extern	void	PokeParaSetParaExp(PokemonParam *PP,u16 pokeno,u8 pokelevel,u8 pow,u8 expbit);

//======================================================================================
//
//	PokeParaSetStock(ポケモンのパラメータをセットする。バトルタワーストックデータ専用）
//
//	引数：
//	PP			=	パラメータをセットする構造体のポインタ
//	SBTP		=	バトルタワーストックデータ
//
//======================================================================================

extern	void	PokeParaSetStock(PokemonParam *PP,StockBattleTowerPokemon *SBTP);

//======================================================================================
//PokemonParamからStockBattleTowerPokemon型データを生成
//	※バトルタワー・カードeトレーナー専用
//
//	引数：
//	PP			=	パラメータをセットする構造体のポインタ
//	SBTP		=	バトルタワーストックデータ
//======================================================================================

extern void PokeParaGetStock(PokemonParam * PP, StockBattleTowerPokemon * SBTP);

//===============================================================
//
//		ポケモンナンバー変換（ポケモンナンバーを表示するときは必ず使うこと！）
//
//	IN	:pokenum		開発ナンバー
//
//	OUT	:ホウエン図鑑しかない　ホウエン図鑑に登録されている　→ ホウエンナンバー出力
//		:　　　　　　　　　　　ホウエン図鑑に登録されていない→ 0xffff（表示なし）
//		:全国図鑑がみれる　→　全国ナンバー出力
//
//===============================================================
extern	u16	PokemonNumberGet(u16 pokenum);

//===============================================================
//		ポケモンのアニメーションナンバー保持ワークの初期化
//===============================================================

extern	void	PokeAnmNoInit(void);

//===============================================================
//		戦闘曲を鳴らす
//===============================================================

extern	void	FightBGMSet(void);
extern	void	FightBGMSet2(u16 music);

//===============================================================
//
//		ポケモンのパレットアドレスをゲット
//
//	in	:	PP	チェックするポケモンの構造体のポインタ
//
//	out	:	パレットデータのアドレス
//===============================================================

extern	u32		PokePalGet(PokemonParam *PP);

//===============================================================
//
//		ポケモンのパレットアドレスをゲット（パラメータ指定）
//
//	in	:	monsno	チェックするモンスターNo
//			id		チェックするポケモンのID
//			rnd		チェックするポケモンの個性乱数
//
//	out	:	パレットデータのアドレス
//===============================================================

extern	u32		PokePalGetPara(u16 monsno,u32 id,u32 rnd);

//===============================================================
//
//		ポケモンのパレットテーブルアドレスをゲット
//
//	in	:	PP	チェックするポケモンの構造体のポインタ
//
//	out	:	パレットテーブルのアドレス
//===============================================================

extern	u32		PokePalDataGet(PokemonParam *PP);

//===============================================================
//
//		ポケモンのパレットテーブルアドレスをゲット（パラメータ指定）
//
//	in	:	monsno	チェックするモンスターNo
//			id		チェックするポケモンのID
//			rnd		チェックするポケモンの個性乱数
//
//	out	:	パレットテーブルのアドレス
//===============================================================

extern	u32		PokePalDataGetPara(u16 monsno,u32 id,u32 rnd);

//===============================================================
//
//		秘伝技かどうかチェック
//
//	in	:	wazano	チェックする技No
//
//	out	:	0:秘伝技ではない　1:秘伝技です
//
//===============================================================

extern	u32		HidenWazaCheck(u16 wazano);

//===============================================================
//
//		反転表示可能なポケモンかどうかチェック
//
//	in	:	monsno	チェックするモンスターNo
//
//	out	:	0:反転可能　1:反転不可
//
//===============================================================

extern	u8		PokeReverseCheck(u16 monsno);

//===============================================================
//
//		ポケモンの好みの味かどうかチェック
//
//	in	:	PP		チェックするポケモン構造体のポインタ
//			rnd		性格を導き出すための個性乱数
//			taste	チェックする味
//
//	out	:	-1:嫌い　0:普通	1:好き
//
//===============================================================

s8		PokeLikeTasteCheck(PokemonParam *PP,u8 taste);
s8		PokeLikeTasteCheckRnd(u32 rnd,u8 taste);

//===============================================================
//
//		自分の持ちポケモンかどうかチェック
//
//	in	:	PP		チェックするポケモン構造体のポインタ
//
//	out	:	0:自分の	1:他人の
//
//===============================================================

extern	u8		PokeOneSelfCheck(PokemonParam *);
extern	u8		PokeOneSelfCheckAct(u32,u8 *);

//===============================================================
//
//		ppをmaxにする（ボックスに預けるとき専用）
//
//	in	:	PP		maxにするポケモン構造体のポインタ
//			PPP		maxにするポケモン構造体のポインタ
//
//===============================================================

extern	void	PokePPMaxSet(PokemonParam *);
extern	void	PokePasoPPMaxSet(PokemonPasoParam *);

//===============================================================
//
//		特性で入れ替えできないときに表示するメッセージをゲット
//
//===============================================================

extern	void	PokeNoReshuffleMsgGet(void);

//===============================================================
//
//		野性ポケモンに持たせるアイテムのセット
//
//===============================================================

extern	void	PokeItemSet(void);

//===============================================================
//
//		アイテムパラメータテーブルのオフセットを求める
//
//===============================================================

extern	u8	ItemParamPosGet(u16 itemno,u8 pos,u8 checkbit);

//===============================================================
//
//		ポケモンがレアかどうかチェック
//
//	out	0:レアじゃない
//		1:レアです
//
//===============================================================

extern	u8		PokeRareGet(PokemonParam *PP);
extern	u8		PokeRareGetPara(u32 id,u32 rnd);

//===============================================================
//
//		仲間のトレーナー名をゲット
//
//===============================================================

extern	u8		*TeamTrainerNameGet(void);

#endif

#define	POW_RND		32	//PokeParaSetを使うときにパワー乱数をランダムでとるための値
#define	RND_NO_SET	0	//PokeParaSetを使うときに個性乱数をランダムでセットするための値
#define	RND_SET		1	//PokeParaSetを使うときに個性乱数を固定値でセットするための値
#define	ID_NO_SET	0	//PokeParaSetを使うときにIDをランダムでセットするための値
#define	ID_SET		1	//PokeParaSetを使うときにIDを固定値でセットするための値
#define	ID_NO_RARE	2	//PokeParaSetを使うときにIDを個性乱数との組み合わせでレアが出ないようにするの値
#define	NO_WAZA_SET	0xffff		//技のセットができなかったときの返り値
#define	SAME_WAZA_SET	0xfffe		//すでに覚えていた技のときの返り値
