@===================================================================
@
@	スクリプトからの関数呼び出しテーブル定義
@
@	_2001_08_24 by tama
@
@===================================================================


@----------------------------------------------------------
@
@	関数テーブル定義用のマクロ宣言
@
@----------------------------------------------------------
	.MACRO	INIT_CALL
.IFDEF	EV_CALL_S_GLOBAL
	.ALIGN
.ENDIF
DEF_CALL_COUNT	=	0
	.ENDM

	.MACRO	DEF_CALL	funcID , symname

.IFDEF	EV_CALL_S_GLOBAL			@ 唯一の個所でしかテーブルは生成しない
.WORD	\symname
.ENDIF
\funcID			=	DEF_CALL_COUNT
DEF_CALL_COUNT 	=	(DEF_CALL_COUNT + 1)

	.ENDM

.MACRO	EV_CALL_LABEL	adrs
.IFDEF	EV_CALL_S_GLOBAL
	.GLOBAL	\adrs
\adrs:
.ENDIF
.ENDM


	INIT_CALL
	EV_CALL_LABEL		ScriptCallTable
	DEF_CALL	PC_KAIFUKU,		PokeAllKaifuku	@ add by matsuda 2001.09.07(金)
	DEF_CALL	SET_EXIT,		ForceExitSet	@ 強制マップ遷移処理（出口の上でのみ使用）
	DEF_CALL	FORCE_COMM_IN,	AddCommMapChangeTask
	DEF_CALL	FORCE_COMM_OUT,	AddCommEndMapChangeTask
	DEF_CALL	SET_COMM_EXIT,	CommExitSet
	DEF_CALL	COMM_EXIT_WAIT,	CommExitWait

	DEF_CALL	BASE_SET,		BaseSet				@ 2001/10/04 nakahiro
	DEF_CALL	MY_BASE_CHECK,	MyBaseCheck			@ 2001/10/04 nakahiro
	DEF_CALL	CHANGE_BASE,	ChangeBaseMap		@ 2001/10/05 nakahiro
	DEF_CALL	BASE_MOVE,		BaseMove			@ 2001/10/05 nakahiro
	DEF_CALL	BASE_MOVE2,		BaseMove2			@ 2002/07/30 nakahiro
	DEF_CALL	WHOSE_BASE,		BaseBoardCheck		@ 2001/10/09 nakahiro
	DEF_CALL	B_ENTRY_CHECK,	CheckBaseEntry		@ 2001/10/16 nakahiro
	DEF_CALL	B_ENTRY_CHANGE,	ChangeBaseEntry		@ 2001/10/16 nakahiro
	DEF_CALL	B_RARNG_CHECK,	BaseRearrangeCheck	@ 2001/10/30 nakahiro
	DEF_CALL	B_ENTRY_INIT,	BaseEntryListInit	@ 2002/06/21 nakahiro
	DEF_CALL	ORUSUBAN_SET,	OrusubanBattle		@ 2001/12/18 nakahiro
	DEF_CALL	ORUSUBAN_CHECK,	OrusubanFlgCheck	@ 2001/12/18 nakahiro
	DEF_CALL	GOODS_OBJ_INIT, SetOBJGoods			@ 2001/12/20 nakahiro
	DEF_CALL	GOODS_OBJ_PUT,  PutOBJGoods			@ 2001/12/20 nakahiro
	DEF_CALL	GET_GOODS,      ObjGoodsReturn		@ 2001/12/21 nakahiro
	DEF_CALL	BASE_TYPE,		ScriptBaseTypeSet	@ 2001/12/25 nakahiro
	DEF_CALL	ORUSUBAN_CODE,	SetOrusubanOBJCode	@ 2001/12/26 nakahiro
	DEF_CALL	GET_GOODS2,     ObjGoodsReturn2		@ 2001/12/21 nakahiro
	DEF_CALL	BASE_MAKE,      MakeBaseFinal		@ 2002/03/14 nakahiro
	DEF_CALL	ORUSUBAN_FLAG	OrusubanBtlFlgSet	@ 2002/07/20 nakahiro
	DEF_CALL	BASE_PC_OFF_ANM	BasePCOffAnm		@ 2002/08/07 nakahiro

	DEF_CALL	COMM_MIXER,		CommMixStart	@ まぜる通信開始

	DEF_CALL	CONNECT_BATTLE,	ConnectBattleSio	@通信対戦受付
	DEF_CALL	CONNECT_TRADE,	ConnectTradeSio		@通信交換受付
	DEF_CALL	CONNECT_RECORD,	ConnectRecordSio	@レコードコーナー受付
	DEF_CALL	COMM_END,		PokemonMultiSioEnd	@通信終了処理
	DEF_CALL	COMM_BATTLE,	AddCommBattleStartTask		@通信対戦開始
	DEF_CALL	COMM_TRADE,		AddCommTradeStartTask		@通信交換開始
	DEF_CALL	COMM_RECORD,	ChangeToKoukan		@レコード交換開始
	DEF_CALL	COMM_SAVE,		ConnectSave			@通信前のセーブ処理
	DEF_CALL	CONNECT_BLEND,	ConnectBlendSio		@ﾌﾞﾚﾝﾄﾞﾏｼｰﾝ通信確認 02/02/27 nohara
	@DEF_CALL	GET_COMM_NUM,	GetConnectSioMenberNum@通信人数取得 02/02/27 nohara
	DEF_CALL	SET_BLEND_COMM_NAME,SetBlendCommName@ﾌﾞﾚﾝﾄﾞﾏｼｰﾝ通信で取得した名前 02/02/27 nohara
	DEF_CALL	SET_BLEND_COMM_OBJ,SetBlendCommOBJ	@ﾌﾞﾚﾝﾄﾞﾏｼｰﾝ通信のOBJ配置 02/02/27 nohara

	DEF_CALL	TEMOTI_POKE_PUSH,	BackUpPokeParaMine		@手持ちポケモン退避
	DEF_CALL	TEMOTI_POKE_POP,	RecoverPokeParaMine		@手持ちポケモン復帰
	DEF_CALL	BATTLE_POKE_SEL,	SelectBattleMonsStart	@手持ちポケモン選択
	DEF_CALL	COMM_TR_CARD,	CommTrainerCard			@トレーナーカード表示

	DEF_CALL	GET_SEED_PARAM,	SeedScriptParam	@ タネの名前などを取得
	DEF_CALL	SEED_CHOICE,	SeedChoice		@ タネを選択
	DEF_CALL	SEED_SET,		SeedSet			@ タネをセット
	DEF_CALL	SEED_GET,		SeedGet			@ タネをとる
	DEF_CALL	SEED_CLEAR,		SeedClear		@ 苗床を初期状態にする
	DEF_CALL	SEED_WATER,		SeedWaterSet	@ 水やり
	DEF_CALL	CHK_SEED_POCKET,SeedPocketCheck	@ タネポケットのチェック
	DEF_CALL	CHK_RAM_SEED,	CheckRamSeedExist@ RAM木の実が存在するかチェック

	DEF_CALL	TR_TYPE_GET,	GetTrainerType
	DEF_CALL	TR_BEFORE_MSG,	PutTrainerBeforeFightMsg
	DEF_CALL	TR_NOFIGHT_MSG,	PutTrainerNotFightMsg
	DEF_CALL	TR_FLAG_CHECK,	CheckNowTrainerFlag
	DEF_CALL	TR_MOVE_CTRL,	AddTrainerMoveCtrlTask
	DEF_CALL	TR_BGM_SET,		SetTrainerBGM
	DEF_CALL	TR_REVENGER_CHK,IsRevengerCheck
	DEF_CALL	TR_REV_FLAG_CHK,CheckRevengerFlag
	DEF_CALL	TR_REV_FIGHT,	FieldRevengeTrainerFightStart

	DEF_CALL	PASO_BOX_MENU,	BoxMenuStart
	DEF_CALL	POKE2VS2_CHK,	AnswerPoke2vs2Check	@2vs2対戦可能かどうかのチェック

	DEF_CALL	RETURN_TVCELL,  ReturnTVCell		@ TVのセルを元に戻す
	DEF_CALL	TV_BROADCAST,	TVBroadCastSelect	@ TV放送
	DEF_CALL	CM_BROADCAST,	CMBroadCastSet		@ TV放送(CM)
	DEF_CALL	CHK_TV_WATCH_FLAG,TVDataWatchFlagOnChk	@ 放送出来るTVデータがあるか
	DEF_CALL	GET_TV_TYPE,	ScrTVTypeGet		@ datatype 取得
	DEF_CALL	LETTER_TYPE_CHK,LetterTypeSelectChk	@ 手紙型のデータ作成チェック
	DEF_CALL	TV_DATA_SET,	TVDataSetSelect		@ データセット
	DEF_CALL	TOP_POKE_NICK_CHK,ScrTopPokeNickNameChk@ 先頭ポケモンにニックネームついてるか
	DEF_CALL	SET_TV_CON_TYPE,ScrTVContestTypeGet	@ 保存してあるコンテストのタイプセット
	DEF_CALL	CHK_GENERATING,	ScrGeneratingBroadCastChk@ 大量発生上書きチェック
	DEF_CALL	CHK_TV_TYPE,	ScrTVDataTypeChk	@ 指定したＴＶデータがすでにあるか
	DEF_CALL	CHK_HOME_TV,	TVMyHomeChk			@ 自宅ＴＶが見れるか
	DEF_CALL	SET_TV_PAPAMAMA,TVNoDataMsgSet		@ パパママセット
	DEF_CALL	TV_BROADCAST_INIT,TVBroadCastInit	@ 放送前の初期化

@	DEF_CALL	GET_LISTPOKE,   GetListChoicePoke@ コンテスト
	DEF_CALL	GET_CHAMPENTNO, GetChampEntryNumber@ 
	DEF_CALL	GET_TUUSINENTNO,GetEntryNo		@ 
	DEF_CALL	GET_CHAMP_OBJID,GetChampObjID	@ 
	DEF_CALL	GET_CHAMP_NAME, GetChampBreederName@ 
	DEF_CALL	GET_CHAMP_POKENAME,GetChampPokeName@ 
	DEF_CALL	SET_BRD_DATA,	SetBrdName		@ 
	DEF_CALL	GET_PRIMARYRANK,GetPrimaryRank	@ 
@	DEF_CALL	GET_CONRANK,	GetContestRank	@ 
@	DEF_CALL	GET_CONTYPE,	GetContestType	@ 
	DEF_CALL	SET_BRD_OBJ,	SetBreederObj	@ 
	DEF_CALL	CONSANKA_CHECK,	ContestSankaCheck
	DEF_CALL	GET_BP_BRD_DATA,GetBPBreederData
	DEF_CALL	SET_CON_SIO_OBJ,ContestSioObjChrSet
	DEF_CALL	GET_BP_NUM,		GetBPNum		@ 
	DEF_CALL	CHK_RIBBON,		RibbonCheck		@ 
	DEF_CALL	SET_RIBBON,		RibbonSet		@ 
	DEF_CALL	CHK_D_CON,		CheckDebugContestFlag
	DEF_CALL	CHK_BROMIDE_RIBBON,	BromideRibbonCheckSet
	DEF_CALL	CHK_SIO_CONTEST,	ConnectContestSio	@コンテストの通信接続チェック
	
	DEF_CALL	SAVE_INTERFACE,	ReportSequenceStart

	DEF_CALL	ZYOURO_ANIME,	AddZyouroAnimeTask

	DEF_CALL	KAIWA_INPUT,	KaiwaInput	@ 簡易会話入力画面
	DEF_CALL	GET_KAIWA_MSG,	KaiwaCodeToMsgBuffer  @ 指定会話コードを文字列変換、バッファ格納


	DEF_CALL	GET_OYAJI_TYPE, OyajiScr_GetType	@ おやじタイプ取得
	DEF_CALL	OYAJI_SING_CHK, OyajiScr_SingerCheck@ シンガーフラグチェック
	DEF_CALL	OYAJI_SING_DONE,OyajiScr_SingerDone	@ シンガー歌詞変更
	DEF_CALL	OYAJI_NAUI_CHK, OyajiScr_NowCheck	@ ナウイフラグチェック
	DEF_CALL	OYAJI_NAUI_DONE,OyajiScr_NowDone	@ ナウイ言葉を教わったセット
	DEF_CALL	OYAJI_NAUI_WORD,OyajiScr_NowWord	@ ナウイ新しく言葉を教わる
	DEF_CALL	SET_OYAJI_SING_WORD,OyajiScr_AddSingTask@ 歌表示
	DEF_CALL	SET_OBJ_OYAJI,	SetOBJOyajiType		@ OBJCHRWORK1にセット
	DEF_CALL	OYAJI_MARCHEN_WORD,OyajiScr_MarchenWord	@ 新しいセリフをbufにコピー
	DEF_CALL	OYAJI_MARCHEN_CHK,OyajiScr_MarchenCheckWord@ 新しいセリフがあるかchk

	DEF_CALL	OYAJI_DEN_GET_CNT	,OyajiScr_LegendGetCount	@でんせつの数を取得
	DEF_CALL	OYAJI_DEN_MSGPUT	,OyajiScr_LegendMsg			@でんせつＭＳＧ表示
	DEF_CALL	OYAJI_DEN_WINDOW	,OyajiScr_LegendWindow		@でんせつ選択ウィンドウ
	DEF_CALL	OYAJI_DEN_RENEW_CHK	,OyajiScr_LegendRenewCheck	@でんせつ更新チェック
	DEF_CALL	OYAJI_DEN_NEW_CHK	,OyajiScr_LegendNewCheck	@でんせつ新規チェック
	DEF_CALL	OYAJI_DEN_ADD_CHK	,OyajiScr_LegendAddCheck	@でんせつ追加チェック

	DEF_CALL	OYAJI_RECYCLE_SELECT,InitRecycleWinSelect		@ グッズ選択初期設定
	DEF_CALL	OYAJI_TRADE_CHANGE,  TradeOyajiTradeCheck		@ グッズ交換したか
	DEF_CALL	OYAJI_TRADE_GOODS_CHECK, TradeOyajiGoodsMaxCheck   @ グッズを持っているか
	DEF_CALL	OYAJI_TRADE_GENRE_CHECK, TradeOyajiGoodsGenreCheck @ グッズの項目チェック
	DEF_CALL	OYAJI_TRADE_MY_GOODS_SELECT, TradeOyajiMyGoodsSelect @ 交換するグッズを選ぶ
	DEF_CALL	OYAJI_TRADE_ADD,		TradeOyageGoodsTarade @ グッズを交換


	DEF_CALL	KINOKOKO_OYAJI_SIZE_MSGSET,	KinokokoSizeOyajiRecordInfoSet		@おおきさオヤジ(キノココ):MSGセット
	DEF_CALL	KINOKOKO_OYAJI_SIZE_CHECK,	KinokokoSizeOyajiCheck				@おおきさオヤジ(キノココ)：ポケモンチェック
	DEF_CALL	NAMAZO_OYAJI_SIZE_MSGSET,	NamazoSizeOyajiRecordInfoSet		@おおきさオヤジ(ナマゾ):MSGセット
	DEF_CALL	NAMAZO_OYAJI_SIZE_CHECK,	NamazoSizeOyajiCheck				@おおきさオヤジ(ナマゾ)：ポケモンチェック

	DEF_CALL	NICKNAME_CHK,	ScrNickNameChangeChk@ ニックネームついてるか
	DEF_CALL	SET_MY_POKENAME,ScrSetMyPokeNick	@ ニックネームをbufにset
	DEF_CALL	ID_CHK,			ScrTrainerIDCmp		@ ID比較

	DEF_CALL	SET_POPWORD,	PopWord_SetBuffer	@ 流行をbufにセット
	DEF_CALL	POPWORD_COMING_CHK,PopWord_CheckComingWord@ 流行が替わりそうかチェック
	DEF_CALL	RAND_WORD_COPY,	KaiwaCopyRandomWord	@ 単語をランダムにbufにコピー
	DEF_CALL	GET_POPWORD_VALUE,	PopWord_GetValue	@ 流行語の合計3bit

	DEF_CALL	CHANGE_CNVBTN,	ChangeCnvbtn		@ 便利ボタンの交換

	DEF_CALL	GET_POKE_COUNT,	 PokeCountMineGet	@ 手持ちのポケモン数
	DEF_CALL	GET_POKE_COUNT2, Box_CountMinePoke	@ タマゴを除いた手持ちのポケモン数
	DEF_CALL	GET_POKE_COUNT3, Box_CountMinePokeEx@ タマゴと瀕死を除いた手持ちのポケモン数

	DEF_CALL	ART_COND_CHK,	ArtMuseumCondCheck	@ ﾏｽﾀｰで高得点優勝か
	DEF_CALL	SET_NEW_ART,	ArtMuseumPortraitSet@ 新しい絵をセット
	DEF_CALL	ART_CHK,		ArtMuseumPortraitCheck@ すでに飾られているか
	DEF_CALL	ART_COUNT_CHK,	ArtMuseumCountCheck	@ 絵の枚数を調べる
	DEF_CALL	PICTURE_PUT,	PortraitPicturePut	@ 

	DEF_CALL	GYM03_DOOR_CHANGE_CELL,ScrGYM03DoorChangeCell@ ドアのセルを変更
	DEF_CALL	GYM03_SWITCH_CHANGE_CELL,ScrGYM03SwitchChangeCell@ スイッチのセルを変更
	DEF_CALL	MSGEXPANDBUF,	ScrMsgExpandBufferSet@ FieldMsgSet(MsgExpandBuffer)
	DEF_CALL	MAKE_MAP_BG,	MakeMapBG			@ ﾀﾞﾐｰVram 展開
	DEF_CALL	GET_MY_POS,		ScrGetMyPos			@ 自機の位置を取得する
	DEF_CALL	GYM03_ALL_CHANGE_CELL,ScrGYM03AllChangeCell@ キンセツジムのセルをすべて変更

	DEF_CALL	GYM05_DOOR_ANIME,	ScrGYM05DoorAnimeWait	@ ドアをアニメさせる
	DEF_CALL	GYM05_DOOR_CHG_CELL,ScrGYM05DoorChangeCell	@ ドアのセルを変更

	@DEF_CALL	C106_POKE_CHG_CELL,	ScrC106ChangeCell	@ ホエルコのセルを変更
	DEF_CALL	GET_ID_NO,			ScrGetID			@ ID取得(今は下一桁)
	DEF_CALL	SET_SEX_NAME_01,	ScrSetName01		@ お姉ちゃん、お兄ちゃんセット(仮)
	DEF_CALL	SET_SEX_NAME_02,	ScrSetName02		@ むすこ、むすめセット(仮)
	DEF_CALL	WK_FLAG_SET,		ScrWKFlagSet		@ wkに入っている値をflagnoとして渡す

	DEF_CALL	SET_ROPEWAY_ID,	ScrSetRopewayMapID		@ ロープウェイの接続先をセット
	DEF_CALL	ROPEWAY_START,	DemoRopewayCall			@ ロープウェイデモ呼び出し

	DEF_CALL	BGM_START,			MapBGM_Start
	DEF_CALL	TIME_SET_WINDOW,	TimeSetWindow		@ 時計合わせる
	DEF_CALL	TIME_CHK_WINDOW,	ScrTokeiLookInit	@ 時間確認
	DEF_CALL	FIRST_BATTLE,		PokeSelEventStart
	DEF_CALL	CAPUTURE_DEMO,		StartCaptureDemoEncountEvent


	DEF_CALL	CHANGE_NICKNAME,ScrNickNameChange	@ 姓名判断氏用名前入力画面を呼ぶ
	DEF_CALL	NAME_POKE_LIST,	NamePokeListInit	@ 姓名判断氏用ﾎﾟｹﾓﾝﾘｽﾄ画面を呼ぶ

	DEF_CALL	CHK_CUBECASE,	CheckCube			@ キューブケースに空きがあるか

	DEF_CALL	START_BLENDER,	BlendMachineTitleInit@ タネブレンダーを呼ぶ

	DEF_CALL	START_ROULETTE,	RouletteSet			@ ルーレットを呼ぶ 02/05/10 by nakahiro

	DEF_CALL	CHK_FAN_BIT,	ScrFanBitChk		@ 自分のファンかチェック
	DEF_CALL	GET_FAN_COUNT,	FanNoGet			@ ファンの人数を取得
	DEF_CALL	SET_FAN_NAME,	ScrFanNameSet		@ ファンの名前をセット
	DEF_CALL	SET_FAN_TIME,	FanCommBattleTimeSet@ 時間をセット
	DEF_CALL	CHK_FAN_TIME,	FanTimeChk			@ 時間をチェック
	DEF_CALL	SET_FAN_FLAG,	FanStartFlagOn		@ フラグオン
	DEF_CALL	FAN_START,		FanStart			@ ファン企画スタート
	DEF_CALL	ADD_FAN_POINT,	ScrFanPointAdd		@ ファンポイント処理

	DEF_CALL	IWA_ENCOUNT,	IwakudakiEncount	@ 岩砕きエンカウント

	DEF_CALL	GET_CAMERA_VS,	TVCameraBattleGet	@ 戦闘回数を取得
	DEF_CALL	SET_CAMERA_DATA,TVCameraDataSet		@ データセット
	DEF_CALL	SET_CAMERA_VS,	TVCameraBattleDataSet@ 戦闘時のデータセット
	DEF_CALL	CAMERA_BROADCAST,TVCameraBroadCastSet@ 放送
	DEF_CALL	CHK_TV_CAMERA,	TVCameraBroadCastChk@ 放送できるか
	DEF_CALL	SET_CAMERA_KAIWA,TVCameraKaiwaSet	@ 前回の簡易会話セット
	DEF_CALL	CHK_OLD_CAMERA,	TVCameraOldFlagChk	@ 前回のフラグをチェックする
	DEF_CALL	GET_CAMERA_OBJID,TVCameraObjIDGet	@ インタビュアーのOBJ指定を取得する

	@DEF_CALL	TEST_NOHARA,	TestNoharaCall		@ テスト用
	DEF_CALL	GET_WIN_LOSE,	ScrGetWinLoseFlag			@ 戦闘状態を取得する

	DEF_CALL	GET_SODATE_NAME,SodateyaPokeNameSet			@ 育て屋にいるポケモンの名前をセットする
	DEF_CAll	GET_SODATEYA_ZIISAN,SodateyaZiisannCheck	@ 育て屋の状態チェック
	DEF_CALL	DEL_SODATEYA_EGG	DelSodateyaTamago		@ 育て屋にあるタマゴを消す
	DEF_CALL	GET_SODATEYA_EGG	PokeTamagoDel			@ 育て屋からタマゴを貰う
	DEF_CALL	MSG_SODATEYA_AISHOU	SodateyaPokeAffinityMsgSet	@ 育て屋にいるポケモンの相性文字列をセット
	DEF_CALL	MSG_AZUKE_SET	SodateyaAzukeName			@ 育て屋にあずけるポケモンの名前をセット
	DEF_CALL	SET_SODATEYA_POKE	PokeSodateSet			@ ポケモンをあずける
	DEF_CALL	SODAYE_POKELIST	SodatePokeListCall			@ 育て屋用のポケモンリスト呼び出し
	DEF_CALL	HIKITORI_LIST	SodateyaSelectPoke			@ 育て屋から引き取るときにポケモン選択
	DEF_CALL	SODATE_POKE_LEVEL_STR SodatePokeLevelSet	@ 育て屋にいるポケモンのレベル差を文字列でセット
	DEF_CALL	HIKITORI_RYOUKIN PokeHikitoriRyoukin		@ 指定したポケモンと育て屋料金を格納
	DEF_CALL	HIKITORI_POKE	PokeHikitori				@ ポケモンを引き取る
	DEF_CALL	TAMAGO_HUKA		SodateTamagoHuka			@ タマゴがポケモンに孵化する
	DEF_CALL	TAMAGO_DEMO		TamagoDemoCall				@タマゴ生まれデモ
	DEF_CALL	SIOMAIL_CHECK	SodateyaMailCheck			@ レコードコーナーからメールが来ているか

	DEF_CALL	SCORE_WINDOW,	PutTaisenScoreWindow
	DEF_CALL	COMP_MY_GOLD	CheckMyGold					@ScriptParameter0よりもお金を持っているか
	DEF_CALL	SUB_MY_GOLD		SubMyGold					@Scriptparameter0円お金を差し引く
	DEF_CALL	POISON_MSG,		PoisonDead
	DEF_CALL	GAME_OVER,		GameOver

	DEF_CALL	GYM_DOOR_INIT,	DoorObjInit
	DEF_CALL	GYM_DOOR_SET,	DoorObjSet

	DEF_CALL	CRUISE_START,	ShipStepCountStart			@船内デモモード開始
	DEF_CALL	CRUISE_END,		ShipStepCountEnd			@船内デモモード終了

	DEF_CALL	SAFARI_START,	  SafariModeStart
	DEF_CALL	SAFARI_END,		  SafariModeEnd
	DEF_CALL	SAFARI_CUBECHECK, SafariCubeTableCheck		@ キューブ置き場にキューブが置かれているか
	DEF_CALL	SAFARI_CUBECASE,  SafariTblCubeCaseCall		@ キューブ置き場でのケース呼び出し

	DEF_CALL	MABOROSHI_CHECK,	Maboroshi_Check			@マボロシジマの出現チェック
	DEF_CALL	ASASE_TIDE_CHECK,	AsaseTideCheck			@浅瀬の洞窟の満ち引きチェック

	DEF_CALL	HYOUKA_INIT,	ZukanHyouka_Init			@図鑑評価システム初期化
	DEF_CALL	GET_ZUKAN_NUM,	ScrZukanNumGet				@図鑑
	DEF_CALL	SET_HYOUKA_MSG,	SetZukanHyoukaMsg			@図鑑評価メッセージセット

	DEF_CALL	ADD_PASO_ANIME,	PasoAnimeTaskAdd			@ パソコンアニメ追加
	DEF_CALL	DEL_PASO_ANIME,	PasoAnimeTaskDel			@ パソコンアニメ削除
	DEF_CALL	SET_NOW_FLOOR,	ElevatorNowFloorSet			@ エレベータ処理
	DEF_CALL	ADD_NOTE_ANIME,	NoteAnimeTaskAdd			@ ノートアニメ追加
	DEF_CALL	DEL_NOTE_ANIME,	NoteAnimeSeqDel				@ ノートアニメ削除

	DEF_CALL	WAZAOSIE_POKELIST, ManiaPokeListInit		@ 技教えマニアポケリスト呼び出し
	DEF_CALL	ST_WAZAWASURE,     WazaWasureCall			@ 技忘れ画面呼び出し（４つ以下）
	DEF_CALL	WAZA_WASURE_MAIN,  WazaWasureMain			@ 技忘れメイン処理
	DEF_CALL	WAZA_WASURE_NAME,  WazaWasureStrSet			@ 文字列をセット
	DEF_CALL	WAZA_WASURE_CHECK, WazaWasureCheck			@ 覚えている技の個数を調べる
	DEF_CALL	WAZA_OSHIE_MANIA,  WazaOshieManiaCall		@ ワザおしえマニア画面へ飛ぶ

	DEF_CALL	SET_CYCLE_RECORD,	CyclingRoadRecordSet	@ サイクリングロード記録セット
	DEF_CALL	START_CYCLE_ROAD,	CyclingRoadEventStart	@ サイクリングロードイベントスタート
	DEF_CALL	CHK_CYCLE_ROAD,		CyclingRoadGateChk		@ 自転車乗っているかチェック
	DEF_CALL	GOAL_CYCLE_ROAD,	CyclingRoadGoal			@ ゴール処理
	DEF_CALL	BEFORE_MAP_CYCLE,	CyclingRoadBeforeMapChk	@ 前のマップを見てシーンを戻す
	DEF_CALL	GET_NATUKIDO_LEVEL,	GetNatukidoLevel	@ 前のマップを見てシーンを戻す
	DEF_CALL	BATTLE_TOWER_INIT,	BattleTowerWorkInit	@ バトルタワーデータの初期化
	DEF_CALL	BATTLE_TOWER_TRAINER_SET,	BattleTowerTrainerSet	@ バトルタワーのトレーナーを決める
	DEF_CALL	BATTLE_TOWER_POKE_CHECK,	BattleTowerPokeCheck	@ バトルタワーの参加ポケモンチェック
	DEF_CALL	BATTLE_TOWER_KAIWA_GET,	BattleTowerKaiwaGet	@ バトルタワーの簡易会話を取得する
	DEF_CALL	BATTLE_CARD_E_KAIWA_GET,	BattleCardEKaiwaGet	@ カードｅの簡易会話を取得する
	DEF_CALL	BATTLE_EVENT_FIGHT,	BattleEventFight		@ いろいろなイベント戦闘を呼び出す
	DEF_CALL	BATTLE_TOWER_WORK_SET,	BattleTowerWorkSet	@ バトルタワー用のワークに値をセット
	DEF_CALL	BATTLE_TOWER_WORK_GET,	BattleTowerWorkGet	@ バトルタワー用のワークから値をゲット
	DEF_CALL	BATTLE_TOWER_MONS_SEL,	BattleTowerMonsSel	@ バトルタワーの選択ポケモンセット
	DEF_CALL	BATTLE_TOWER_SAVE,	BattleTowerSave		@ バトルタワーの保存
	DEF_CALL	BATTLE_TOWER_RESET,	BattleTowerReset	@ ソフトリセット
	DEF_CALL	BATTLE_TOWER_ITEM_SET,	BattleTowerItemSet	@ バトルタワーでの景品ゲット
	DEF_CALL	BATTLE_TOWER_ITEM_GET,	BattleTowerItemGet	@ バトルタワーでの景品ゲット
	DEF_CALL	BATTLE_TOWER_RIBBON_GET,	BattleTowerRibbonGet	@ バトルタワーでのリボンゲット
	DEF_CALL	BATTLE_TOWER_POKE_SEL,	SelectBattleTowerMonsStart	@バトルタワーでの手持ちポケモン選択
	DEF_CALL	BATTLE_CARD_E_DATA_CHECK,	BattleCardECheckSumCheck	@ カードｅデータのチェックサムチェック
	DEF_CALL	BATTLE_TOWER_RENSHOU,	BattleTowerRenshouGet	@ バトルタワーでの連勝数ゲット
	DEF_CALL	SORT_SELECT_POKEMON,	SortSelectPokemon	@ 選択した3体を手持ちにセット
	DEF_CALL	MY_ROOM_MY_PC,		MyPC_MyRoomCall		@ 自分のPCを自分の部屋から呼び出し
	DEF_CALL	GLOBAL_PC_MY_PC,	MyPC_GlobalPCCall	@ 自分のPCを公共用端末から呼び出し
	DEF_CALL	TOWN_MAP,			ScrInfoMapInit		@ タウンマップ呼び出し
	DEF_CALL	KOUKAN_JUNBI,		EventKoukanJunbi	@ 交換イベント用のポケモンデータ生成
	DEF_CALL	KOUKAN_POKE,		EventKoukanTest		@ 交換イベントのポケモンと入れかえる
	DEF_CALL	KOUKAN_POKEDEMO,	KoukanDemoOfflineCall @交換イベントのデモ開始
	DEF_CALL	TEMOTI_MONSNO,		PokeMineMonsNumber  @ PARA1の手持ちポケモンの種類番号を返す

	DEF_CALL	GET_START_WEEK,		ScrGetWeekFromGameStart @ ゲーム初めてから何週間たったか取得

	DEF_CALL	GET_LOT_NUM,		GetPokeLotNumber	 @ ポケモンくじの当選番号取得
	DEF_CALL	CHK_LOT_NUM,		CheckPokeLotNumber	 @ ポケモンくじの当選チェック
	DEF_CALL	BLENDMACHINE_SCORE	PutBlendMachineScoreWindow	@きのみブレンダーの速度ランキング

	DEF_CALL	KARAKURI_HIDE_ITEM_ON,	KarakuriHideItemOn	 @ カラクリ隠しアイテム制御(登場)
	DEF_CALL	KARAKURI_HIDE_ITEM_OFF,	KarakuriHideItemOff	 @ カラクリ隠しアイテム制御(消去)

	DEF_CALL	PASO_MENU_WRITE,	AddScriptPasoMenu	 @ パソコンメニュー表示
	DEF_CALL	DENDOU_IRI,			ScrDendouLookInit	 @ でんどういり表示

	DEF_CALL	HYOUSYOU_START,		ScrHyousyouInit		 @ 表彰状表示

	DEF_CALL	DAISUKI_STYLE_CHECK,	DaisukiClubStyleCheck	@ だいすきクラブ用かっこよさチェック
	DEF_CALL	DAISUKI_BEAUTIFUL_CHECK,	DaisukiClubBeautifulCheck	@ だいすきクラブ用美しさチェック
	DEF_CALL	DAISUKI_CUTE_CHECK,	DaisukiClubCuteCheck	@ だいすきクラブ用かわいさチェック
	DEF_CALL	DAISUKI_CLEVER_CHECK,	DaisukiClubCleverCheck	@ だいすきクラブ用賢さチェック
	DEF_CALL	DAISUKI_STRONG_CHECK,	DaisukiClubStrongCheck	@ だいすきクラブ用たくましさチェック

	DEF_CALL	SHIP_EVENT_START,	ShipEventModeStart

	DEF_CALL	SOFT_RESET,			PM_SoftReset		@ ソフトリセット
	DEF_CALL	GAME_CLEAR,			ScrGameClear		@ エンディングへ

	DEF_CALL	ELEVATOR_MOVE,		AddElevatorMoveTask	@ エレベータ揺れ処理追加
	DEF_CALL	KAZANBAI_MENU,		AddKazanbaiMenuTask	@ 火山灰のアイテムメニュー表示

	DEF_CALL	SET_MAP_SCROOL,		ScrMapScroolSet		@ スクロール用ダミーOBJ追加
	DEF_CALL	RESET_MAP_SCROOL,	ScrMapScroolReset	@ スクロールアクタークリア

	DEF_CALL	GET_LIKE_CUBE,		ScrGetLikeCube		@ 性格によって好きなキューブ名取得
	DEF_CALL	GET_BASE_MAPNO,		ScrGetMyBaseMapNo	@ 自分の秘密基地のあるマップ名取得

	DEF_CALL	TENJI_POKE_RETU,	TenjiPokeRetuChk	@ ポケモンの並びが正しいか
	DEF_CALL	TENJI_WAIT_START,	TenjiWaitEventStart	@ キーを押さずに待つイベント
	DEF_CALL	START_JEWEL_EFFECT,	StartJewelEffect	@ 宝玉エフェクト開始
	DEF_CALL	FINISH_JEWEL_EFFECT,FinishJewelEffect	@ 宝玉エフェクト終了
	DEF_CALL	PUT_BTOWER_SCORE,	PutBattleTowerScoreWindow
	DEF_CALL	WEATHER_CHG_WAIT,	ScrWeatherChangeWait	@天候変化待ち

	DEF_CALL	GET_CARD_TR_NAME,	ScrBattleCardENameGet @ カードeトレーナー名前取得

	DEF_CALL	GET_SLOT_ATARI,		ScrSlotAtariGet		@ スロット当たり台取得
	DEF_CALL	GET_HERO_SITE,		GetHeroSite			@ 自機の方向を取得

	DEF_CALL	KEY_1_CHECK,		Key1Check			@ 座礁船カギ１取得チェック
	DEF_CALL	KEY_2_CHECK,		Key2Check			@ 座礁船カギ２取得チェック
	DEF_CALL	KEY_4_CHECK,		Key4Check			@ 座礁船カギ４取得チェック
	DEF_CALL	KEY_6_CHECK,		Key6Check			@ 座礁船カギ６取得チェック

	DEF_CALL	CHK_GANBA_RIBBON,	ChkGanbaRibbon		@ 「がんばリボン」を持っているか
	DEF_CALL	SET_GANBA_RIBBON,	SetGanbaRibbon		@ 「がんばリボン」をセットする
	DEF_CALL	CHK_GANBA_RIBBON_PARA_EXP,ChkGanbaRibbonParaExp	@ 「がんばリボン」を貰えるか
	DEF_CALL	COMM_SET_TALK_OBJ,		SetTalkObjSiteToHero	@自機の方向を向かせる
	DEF_CALL	COMM_RESET_TALK_OBJ,	ResetTalkObjSite		@解除

	DEF_CALL	ADD_MOVE_POKE,		AddMvPoke			@移動ポケモンセット
	DEF_CALL	CHK_KANASIDA_IWA,	ChkKanasidaIwa		@カナシダトンネル岩砕きチェック

	DEF_CALL	TYPE_KUSA_ALL_CHECK,	TypeKusaAllCheck		@ くさポケモンが手持ちでいるかチェック
	DEF_CALL	CONTEST_MAP_CHANGE,		AddContestMapChangeTask
	DEF_CALL	MITSURU_POKE_SET,	ScrMitsuruPokeSet	@ミツルの捕獲ポケモンセット
	DEF_CALL	CHK_FIRST_POKENO,	ScrFirstPokeNumChk	@初めてのポケモンナンバーチェック

	DEF_CALL	BASE_ENTRY_NAME,	MakeBaseNameScript	@ 登録する基地の持ち主の名前を取得

	DEF_CALL	POKE_BOX_SPACE_CHECK,	BoxSpacePokemonCheck	@ ポケモンがボックスに入れられるかチェック
	DEF_CALL	TENJI_MOVE,			AddTenjiMoveTask	@ 点字揺れ処理

	DEF_CALL	WRITE_NOW_FLOOR,	ElevatorNowFloorWrite	@ 現在のフロア名を表示する

	DEF_CALL	BASE_GOODS_TATE,	BaseGoodsTateCheck	@ 盾の種類を取得
	DEF_CALL	CHK_TEMOTI_POKERUS,	ScrTemotiPokerusCheck	@ 手持ちにポケルスがいるかのチェック
	DEF_CALL	SET_CRACKED_ICE,	SetAllCrackedIceCell	@ルネジムの割れた個所の反映処理

	DEF_CALL	KODAI_POKE_SHAKE,	AddKodaiMoveTask	@ 超古代ポケモンの揺れ

	DEF_CALL	KODAI_POKE_FIGHT,	StartKodaiPokeEncountEvent	@超古代ポケモンと対戦
	DEF_CALL	SP_WILD_POKE_FIGHT,	StartSpPokeEncountEvent		@特別なポケモンとの対戦
	DEF_CALL	TENJI_POKE_FIGHT,	StartTenjiPokeEncountEvent	@点字ポケモンとの対戦

	DEF_CALL	TR_STOP_OBJMOVE,	StopTrainerObjMove		@トレーナー動作コードを静止状態に

	DEF_CALL	TENJI_MOVE2,		AddTenjiMove2Task	@ 点字揺れ処理２

	DEF_CALL	CHK_HIDE_MEGANE,	ChkHideKuroiMegane	@ 隠しの「くろいメガネ」入手しているか
	DEF_CALL	HIDERI_FLASH		HideriFlashEffect	@ はじめて「ひでり」になった時の画面フラッシュエフェクト
	DEF_CALL	CHANGE_MAP,			AddMapChangeSeNotTask	@マップ遷移呼び出し
	DEF_CALL	CHANGE_MAP_FALL,	AddMapChangeFallTask	@落とし穴エフェクトのマップ遷移呼び出し

	DEF_CALL	OPEN_CONPOKE_CG,	ContestPokeCGWinOpen	@コンテストでのポケモンCG表示セット
	DEF_CALL	CLOSE_CONPOKE_CG,	ContestPokeCGWinClose	@↑表示をdelする
	DEF_CALL	CARD_E_FOBJ_SET,	BattleCardEFObjSet		@カードｅ対戦時のフィールドOBJをセットする
	DEF_CALL	KOKORO_POKE_FIGHT,	StartKokoroPokeEncountEvent	@南の孤島でのポケモン対戦
	DEF_CALL	SET_WEATHER_R119,	SetWeatherR119			@ロード１１９の天候操作
	DEF_CALL	SET_WEATHER_R123,	SetWeatherR123			@ロード１２３の天候操作

	DEF_CALL	SET_CON_MUS,		ContestMusSet			@コンテスト
	DEF_CALL	GET_LISTNO_POKENO,	GetListNoPokeNo			@リストから選んだ番号のポケモンナンバー取得

	DEF_CALL	WAZA_WASURE_TAMAGO	WazaWasureTamagoCheck	@ 技忘れじいさんタマゴチェック
	DEF_CALL	ADD_TOWER_OWNER		AddTowerOwner			@ バトルタワーオーナー追加処理

	DEF_CALL	BASE_NEW_MAKE_MOVE	MyBaseNewMakeMove		@ 新規基地作成のための引越し処理
	DEF_CALL	PUSH_TEMOTI_ITEM,	BackUpTemotiItem		@ 手持ち道具内容を退避

	DEF_CALL	BGM_FADEOUT_END,	FieldBGMFadeOutEnd		@ BGMフェードアウト→終了

	DEF_CALL	SET_GAME_DAY,		ScrSetWazaGetGameDays	@ アイテムを入手した日にちをセット
	DEF_CALL	GET_ONE_WEEK,		ScrGetOneWeekFromWazaGet@ 入手後一週間以上たっているか

	DEF_CALL	CHK_HYOUSYOU_NUM,	ZukanHyousyouCheckHouen @ ホウエン図鑑の表彰状が見れるか

	DEF_CALL	OYANAME_CHK,		ScrOyaNameCmp			@ 親名比較
	DEF_CALL	GET_LOT_NUM_MSG,	ScrPokeLotNumGet		@ 当たりナンバーの文字列取得

	DEF_CALL	TV_TOWER_HUSEI_CHK,	TVBattleTowerHuseiChk	@ インタビュアーを削除、シーンクリア

	DEF_CALL	TRADE_DISABLE_ITEM_CHK, ScrCheckTradeDisableItem	@手持ちポケモンのどうぐチェック

	DEF_CALL	GET_CONT_RND,		GetContRnd			@コンテスト用のランダム値取得

	EV_CALL_LABEL	ScriptCallTableEnd




