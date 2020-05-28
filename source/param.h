//----------------------------------------------------------
//	ポケモンのパラーメーター構成
//----------------------------------------------------------
#ifndef __PARAM_H__
#define __PARAM_H__

#define	MONS_MALE		0
#define	MONS_FEMALE		254
#define	MONS_UNKNOWN	255

#if 0
typedef struct
{
	u16	monsno;						//02h
	u16 item;						//04h
	
	u16	waza[4];					//0ch

	u8	pp[4];						//10h

	u8	pp_count;					//11h
	u8	style;						//12h	かっこよさ
	u8	beautiful;					//13h	うつくしさ
	u8	cute;						//14h	かわいさ
	
	u32	id_no;						//18h
	u32	exp;						//1ch

	u8	hp_exp;						//1dh
	u8	pow_exp;					//1eh
	u8	def_exp;					//1fh
	u8	agi_exp;					//20h

	u8	spepow_exp;					//21h
	u8	spedef_exp;					//22h
	u8	friend;						//23h
	u8	clever;						//24h	かしこさ
	
	u32	pokerus		:8;				//25h
	u32	get_place	:8;				//28h	捕まえた場所
	u32	get_level	:7;				//28h	捕まえたレベル（本当は8ビットもいらないけど）
	u32	get_cassette:4;				//28h	捕まえたカセット（カラーバージョン）
	u32	get_ball	:4;				//28h	捕まえたボール
	u32	oyasex		:1;				//28h	親の性別
	
	u32	hp_rnd		:5;				//2ch
	u32	pow_rnd		:5;				//2ch
	u32	def_rnd		:5;				//2ch
	u32	agi_rnd		:5;				//2ch
	u32	spepow_rnd	:5;				//2ch
	u32	spedef_rnd	:5;				//2ch
	u32	tamago_flag	:1;				//2ch	0:タマゴじゃない1:タマゴだよ
	u32	speabi		:1;				//2ch	特殊能力（0:特殊能力1　1:特殊能力2）

	u16	checksum;					//2eh
	u8	strong;						//2fh	たくましさ
	u8	fur;						//30h	毛艶

	u32	personal_rnd;				//34h

	u8	nickname[MONS_NAME_SIZE+EOM_SIZE];				//3fh
	u8	mark;						//40h	ポケモンにつけるマーク（ボックス）

	u8	oyaname[PERSON_NAME_SIZE+EOM_SIZE];				//48h

	u32	stylemedal			:3;		//4ch	かっこよさ勲章
	u32	beautifulmedal		:3;		//4ch	うつくしさ勲章
	u32	cutemedal			:3;		//4ch	かわいさ勲章
	u32	clevermedal			:3;		//4ch	かしこさ勲章
	u32	strongmedal			:3;		//4ch	たくましさ勲章
	u32	champ_ribbon		:1;		//4ch	チャンプリボン
	u32	winning_ribbon		:1;		//4ch	ウィニングリボン
	u32	victory_ribbon		:1;		//4ch	ビクトリーリボン
	u32	bromide_ribbon		:1;		//4ch	ブロマイドリボン
	u32	ganba_ribbon		:1;		//4ch	がんばリボン
	u32	marine_ribbon		:1;		//4ch	マリンリボン
	u32	land_ribbon			:1;		//4ch	ランドリボン
	u32	sky_ribbon			:1;		//4ch	スカイリボン
	u32	country_ribbon		:1;		//4ch	カントリーリボン
	u32	national_ribbon		:1;		//4ch	ナショナルリボン
	u32	earth_ribbon		:1;		//4ch	アースリボン
	u32	world_ribbon		:1;		//4ch	ワールドリボン
	u32  :5;

	u8	amari[4];					//50h	続編のための余り領域
}PokemonPasoParam;
#else

typedef struct
{
	u16	monsno;
	u16 item;
	u32	exp;
	u8	pp_count;
	u8	friend;
	u16	amari;
}PokemonPara1;

typedef struct
{
	u16	waza[4];
	u8	pp[4];								//12バイト
}PokemonPara2;

typedef struct
{
	u8	hp_exp;
	u8	pow_exp;
	u8	def_exp;
	u8	agi_exp;
	u8	spepow_exp;
	u8	spedef_exp;
	u8	style;						//	かっこよさ
	u8	beautiful;					//	うつくしさ
	u8	cute;						//	かわいさ
	u8	clever;						//　かしこさ
	u8	strong;						//	たくましさ
	u8	fur;						//	毛艶	12バイト
}PokemonPara3;
	
typedef struct
{
	u32	pokerus		:8;
	u32	get_place	:8;				//	捕まえた場所
	u32	get_level	:7;				//	捕まえたレベル
	u32	get_cassette:4;				//	捕まえたカセット（カラーバージョン）
	u32	get_ball	:4;				//	捕まえたボール
	u32	oyasex		:1;				//	親の性別
	
	u32	hp_rnd		:5;
	u32	pow_rnd		:5;
	u32	def_rnd		:5;
	u32	agi_rnd		:5;
	u32	spepow_rnd	:5;
	u32	spedef_rnd	:5;
	u32	tamago_flag	:1;				//	0:タマゴじゃない1:タマゴだよ
	u32	speabi		:1;				//	特殊能力（0:特殊能力1　1:特殊能力2）

	u32	stylemedal			:3;		//	かっこよさ勲章
	u32	beautifulmedal		:3;		//	うつくしさ勲章
	u32	cutemedal			:3;		//	かわいさ勲章
	u32	clevermedal			:3;		//	かしこさ勲章
	u32	strongmedal			:3;		//	たくましさ勲章
	u32	champ_ribbon		:1;		//	チャンプリボン
	u32	winning_ribbon		:1;		//	ウィニングリボン
	u32	victory_ribbon		:1;		//	ビクトリーリボン
	u32	bromide_ribbon		:1;		//	ブロマイドリボン
	u32	ganba_ribbon		:1;		//	がんばリボン
	u32	marine_ribbon		:1;		//	マリンリボン
	u32	land_ribbon			:1;		//	ランドリボン
	u32	sky_ribbon			:1;		//	スカイリボン
	u32	country_ribbon		:1;		//	カントリーリボン
	u32	national_ribbon		:1;		//	ナショナルリボン
	u32	earth_ribbon		:1;		//	アースリボン
	u32	world_ribbon		:1;		//	ワールドリボン
	u32	amari_ribbon		:5;		//	あまってます12バイト
}PokemonPara4;

typedef struct
{
	PokemonPara1	PP1;
	PokemonPara2	PP2;
	PokemonPara3	PP3;
	PokemonPara4	PP4;
}PokemonParaData11;

typedef struct
{
	PokemonPara1	PP1;
	PokemonPara2	PP2;
	PokemonPara4	PP4;
	PokemonPara3	PP3;
}PokemonParaData12;

typedef struct
{
	PokemonPara1	PP1;
	PokemonPara3	PP3;
	PokemonPara2	PP2;
	PokemonPara4	PP4;
}PokemonParaData13;

typedef struct
{
	PokemonPara1	PP1;
	PokemonPara3	PP3;
	PokemonPara4	PP4;
	PokemonPara2	PP2;
}PokemonParaData14;

typedef struct
{
	PokemonPara1	PP1;
	PokemonPara4	PP4;
	PokemonPara2	PP2;
	PokemonPara3	PP3;
}PokemonParaData15;

typedef struct
{
	PokemonPara1	PP1;
	PokemonPara4	PP4;
	PokemonPara3	PP3;
	PokemonPara2	PP2;
}PokemonParaData16;

typedef struct
{
	PokemonPara2	PP2;
	PokemonPara1	PP1;
	PokemonPara3	PP3;
	PokemonPara4	PP4;
}PokemonParaData21;

typedef struct
{
	PokemonPara2	PP2;
	PokemonPara1	PP1;
	PokemonPara4	PP4;
	PokemonPara3	PP3;
}PokemonParaData22;

typedef struct
{
	PokemonPara2	PP2;
	PokemonPara3	PP3;
	PokemonPara1	PP1;
	PokemonPara4	PP4;
}PokemonParaData23;

typedef struct
{
	PokemonPara2	PP2;
	PokemonPara3	PP3;
	PokemonPara4	PP4;
	PokemonPara1	PP1;
}PokemonParaData24;

typedef struct
{
	PokemonPara2	PP2;
	PokemonPara4	PP4;
	PokemonPara1	PP1;
	PokemonPara3	PP3;
}PokemonParaData25;

typedef struct
{
	PokemonPara2	PP2;
	PokemonPara4	PP4;
	PokemonPara3	PP3;
	PokemonPara1	PP1;
}PokemonParaData26;

typedef struct
{
	PokemonPara3	PP3;
	PokemonPara1	PP1;
	PokemonPara2	PP2;
	PokemonPara4	PP4;
}PokemonParaData31;

typedef struct
{
	PokemonPara3	PP3;
	PokemonPara1	PP1;
	PokemonPara4	PP4;
	PokemonPara2	PP2;
}PokemonParaData32;

typedef struct
{
	PokemonPara3	PP3;
	PokemonPara2	PP2;
	PokemonPara1	PP1;
	PokemonPara4	PP4;
}PokemonParaData33;

typedef struct
{
	PokemonPara3	PP3;
	PokemonPara2	PP2;
	PokemonPara4	PP4;
	PokemonPara1	PP1;
}PokemonParaData34;

typedef struct
{
	PokemonPara3	PP3;
	PokemonPara4	PP4;
	PokemonPara1	PP1;
	PokemonPara2	PP2;
}PokemonParaData35;

typedef struct
{
	PokemonPara3	PP3;
	PokemonPara4	PP4;
	PokemonPara2	PP2;
	PokemonPara1	PP1;
}PokemonParaData36;

typedef struct
{
	PokemonPara4	PP4;
	PokemonPara1	PP1;
	PokemonPara2	PP2;
	PokemonPara3	PP3;
}PokemonParaData41;

typedef struct
{
	PokemonPara4	PP4;
	PokemonPara1	PP1;
	PokemonPara3	PP3;
	PokemonPara2	PP2;
}PokemonParaData42;

typedef struct
{
	PokemonPara4	PP4;
	PokemonPara2	PP2;
	PokemonPara1	PP1;
	PokemonPara3	PP3;
}PokemonParaData43;

typedef struct
{
	PokemonPara4	PP4;
	PokemonPara2	PP2;
	PokemonPara3	PP3;
	PokemonPara1	PP1;
}PokemonParaData44;

typedef struct
{
	PokemonPara4	PP4;
	PokemonPara3	PP3;
	PokemonPara1	PP1;
	PokemonPara2	PP2;
}PokemonParaData45;

typedef struct
{
	PokemonPara4	PP4;
	PokemonPara3	PP3;
	PokemonPara2	PP2;
	PokemonPara1	PP1;
}PokemonParaData46;

typedef struct
{
	u32	personal_rnd;
	u32	id_no;
	u8	nickname[MONS_NAME_SIZE];			//M_N_S=10
	u8	country_code;						//国コード
	u8	fusei_tamago_flag	:1;				//データ改ざん時のタマゴフラグ
	u8	poke_exist_flag		:1;				//ポケモン存在フラグ
	u8	egg_exist_flag		:1;				//タマゴとしての存在フラグ
	u8						:5;
	u8	oyaname[PERSON_NAME_SIZE];			//P_N_S=7
	u8	mark;								//ポケモンにつけるマーク（ボックス）
	u16	checksum;
	u16	amari;								//	続編のための余り領域
											//32バイト
	u8	paradata[sizeof(PokemonPara1)+
				 sizeof(PokemonPara2)+
				 sizeof(PokemonPara3)+
				 sizeof(PokemonPara4)];
}PokemonPasoParam;
#endif

typedef struct
{
	PokemonPasoParam	PPP;
	u32	condition;		//04h
	u8	level;			//05h
	u8	mailid;			//06h
	u16	hp;				//08h
	u16	hpmax;			//0ah
	u16	pow;			//0ch
	u16	def;			//0eh
	u16	agi;			//10h
	u16	spepow;			//12h
	u16	spedef;			//14h
}PokemonParam;

typedef struct
{
	u16	monsno;					//02h
	u16	pow;					//04h

	u16	def;					//06h
	u16	agi;					//08h

	u16	spepow;					//0ah
	u16	spedef;					//0ch

	u16	waza[4];				//14h
	
	u32	hp_rnd		:5;
	u32	pow_rnd		:5;
	u32	def_rnd		:5;
	u32	agi_rnd		:5;
	u32	spepow_rnd	:5;
	u32	spedef_rnd	:5;
	u32	tamago_flag	:1;			//18h	0:タマゴじゃない1:タマゴだよ
	u32	speabi		:1;			//18h	特殊能力（0:特殊能力1　1:特殊能力2）

	s8	abiritycnt[8];			//20h

	u8	speabino;				//21h
	u8	type1;					//22h
	u8	type2;					//23h
	u8	work;					//24h	4バイト境界補正
										//ここから上はへんしん用パラメータ
										//移動は厳禁
										
	u8	pp[4];					//28h

	u16	hp;						//2ah
	u8	level;					//2bh
	u8	friend;					//2ch

	u16	hpmax;					//2eh
	u16 item;					//30h

	u8	nickname[MONS_NAME_SIZE+EOM_SIZE];			//3bh
	u8	pp_count;				//3ch

	u8	oyaname[PERSON_NAME_SIZE+EOM_SIZE];			//44h

	u32	exp;					//48h
	u32	personal_rnd;			//4ch
	u32	condition;				//50h
	u32	condition2;				//54h
	u32	id_no;					//58h

}PokemonServerParam;

typedef struct
{
	u16	waza[4];				//08h
	u8	pp[4];					//0ch
	u8	pp_count;				//10h
}PokemonWazaParam;

typedef	struct
{
	u8	battleeffect;
	u8	damage;
	u8	wazatype;
	u8	hitprobability;

	u8	pp;
	u8	addeffect;
	u8	attackrange;
	s8	attackpri;

	u8	flag;
}WazaTblDat;

typedef	struct
{
	u8	loopcnt:7;
	u8	flag:1;
}WazaEffectWork;

typedef	struct
{
	u32	henshin_rnd;			//へんしん用の個性乱数

	u16	kanashibariwazano;		//かなしばり技ナンバー
	u16	encorewazano;			//アンコール技ナンバー

	u8	successcnt;
	u8	takuwaerucnt;			//たくわえるカウンター
	u8	migawarihp;				//みがわりヒットポイント
	u8	kanashibaricnt		:4;	//かなしばりカウンター
	u8	kanashibaricnttmp	:4;	//かなしばりカウンター（初期値）

	u8	encorewazapos;			//アンコール技ポジション
	u8	encoreclient;			//アンコール技を当てるクライアント
	u8	encorecnt			:4;	//アンコールカウンター
	u8	encorecnttmp		:4;	//アンコールカウンター
	u8	horobinoutacnt		:4;	//ほろびのうたカウンタ
	u8	horobinoutacnttmp	:4;	//ほろびのうたカウンタ

	u8	renzokugiricnt;			//れんぞくぎりカウンタ
	u8	korogarucnt			:4;	//ころがるカウンタ
	u8	korogarucnttmp		:4;	//ころがるカウンタ
	u8	juudencnt			:4;	//じゅうでんカウンタ
	u8	juudencnttmp		:4;	//じゅうでんカウンタ
	u8	chouhatsucnt		:4;	//ちょうはつカウンタ
	u8	chouhatsucnttmp		:4;	//ちょうはつカウンタ

	u8	manazashiclientno;		//くろいまなざしクライアント
	u8	lockonclientno;			//ロックオンしたクライアント
	u8	nekodamashicnt;			//ネコだましカウンタ
	u8	shimewazano;			//しめ系の技ナンバー

	u8	namakebit			:1;	//特性なまけ用のフラグ
	u8						:3;
	u8	monomanebit			:4; //ものまねした技の位置ビット

	u8	handoucnt;				//はんどうカウンタ
}WazaKoukaCount;

typedef	struct
{
	u8	butsuriguardcnt;
	u8	tokusyuguardcnt;
	u8	shiroikiricnt;
	u8	kyouwazaclient;

	u16	kyouwazano;
	u8	makibishicnt;
	u8	shinpicnt;

	u8	konoyubitomareflag;		//このゆびとまれ
	u8	konoyubitomareno;		//このゆびとまれ
}SideConditionCount;

typedef struct
{
	u32	guardflag			:1;		//まもる、みきり
	u32	koraeruflag			:1;		//こらえる
	u32	waruagakiflag		:1;		//わるあがき
	u32	tedasukeflag		:1;		//てだすけ
	u32	magiccortflag		:1;		//マジックコート
	u32	yokodoriflag		:1;		//よこどり
	u32	michidureflag		:1;		//みちづれ
	u32	mahiflag			:1;		//まひで攻撃できなかった
	u32	konranflag 			:1;		//こんらんで自分を攻撃
	u32	koukanaiflag		:1;		//こうかがなかった
	u32	tamewazaflag		:1;		//ため系の技のためターン
	u32	itemescapeflag		:2;		//アイテムで逃げた
	u32	huuinflag			:1;		//ふういんで技が出せなかった
	u32	meromeroflag		:1;		//メロメロで技が出せなかった
	u32	kanashibariflag		:1;		//かなしばりで技が出せなかった
	u32	chouhatsuflag		:1;		//ちょうはつで技が出せなかった
	u32	ichamonflag			:1;		//いちゃもんで技が出せなかった
	u32	hirumuflag			:1;		//ひるんで技が出せなかった
	u32	ppdecflag			:1;		//PP_DECを通った
	u32						:12;
	s32	butsurihitdamage;			//カウンター用の物理攻撃ダメージ保存ワーク
	s32	tokusyuhitdamage;			//ミラーコート用の特殊攻撃ダメージワーク
	u8	butsurihitclient;			//物理攻撃をしたClientNo保存ワーク（カウンター用）
	u8	tokusyuhitclient;			//特殊攻撃をしたClientNo保存ワーク（ミラーコート用）
}OneTurnFlag;					//そのターンだけ保持するフラグ群

typedef struct{
	u32	clearbodyflag		:1;		//クリアボディ発動
	u32	hiraishinflag		:1;		//ひらいしんで技をうけた
	u32	vanishoffflag		:1;		//バニッシュオフフラグ
	u32	ikakuflag			:1;		//いかくした
	u32	traceflag			:1;		//トレースした
	u32	nopressureflag		:1;		//プレッシャーチェックをしないフラグ
	u32	reshuffleflag		:1;		//入れ替えたフラグ
	u32	itemkoraeruflag		:1;		//アイテムでこらえた
	u32						:24;
	s32	kaigaradamage;				//かいがらのすず用のダメージワーク
	s32	butsurihitdamage;			//カウンター用の物理攻撃ダメージ保存ワーク
	s32	tokusyuhitdamage;			//ミラーコート用の特殊攻撃ダメージワーク
	u8	butsurihitclient;			//物理攻撃をしたClientNo保存ワーク（カウンター用）
	u8	tokusyuhitclient;			//特殊攻撃をしたClientNo保存ワーク（ミラーコート用）
}OneSelfTurnFlag;				//自分のターンだけ保持するフラグ群

typedef	struct
{
	u8	miraiyochicnt[4];
	u8	miraiyochiattackclient[4];
	s32	miraiyochidamage[4];
	u16	miraiyochiwazano[4];
	u8	negaigotocnt[4];			//ねがいごとカウンタ
	u8	negaigotoselmonsno[4];		//ねがいごとセルモンス
	u8	FCCcnt;
	u8	hatakiotosuitem[2];		//はたきおとすアイテム
}FieldConditionCount;

typedef	struct
{
	u16		pow;			//セットするパワー乱数(u8でOKだけど4バイト境界対策）
	u16		level;			//セットするポケモンのレベル
	u16		monsno;			//セットするポケモン
}TrainerTypeNormalData;

typedef	struct
{
	u16		pow;			//セットするパワー乱数(u8でOKだけど4バイト境界対策）
	u16		level;			//セットするポケモンのレベル
	u16		monsno;			//セットするポケモン
	u16		waza[4];		//持ってる技
}TrainerTypeWazaData;

typedef	struct
{
	u16		pow;			//セットするパワー乱数(u8でOKだけど4バイト境界対策）
	u16		level;			//セットするポケモンのレベル
	u16		monsno;			//セットするポケモン
	u16		itemno;			//セットするアイテム
}TrainerTypeItemData;

typedef	struct
{
	u16		pow;			//セットするパワー乱数(u8でOKだけど4バイト境界対策）
	u16		level;			//セットするポケモンのレベル
	u16		monsno;			//セットするポケモン
	u16		itemno;			//セットするアイテム
	u16		waza[4];		//持ってる技
}TrainerTypeMultiData;

typedef	struct
{
	u8		datatype;
	u8		type;
	u8		sex;
	u8		chrnum;
	u8		name[6];
	u16		item[4];
	u8		fighttype;		//戦闘の種類（1対1か2対2か？）
	u32		aitbl;
	u8		monscount;		//持ってるポケモンの数
	void	*TPD;
}TrainerData;

typedef	struct
{
	u16		waza1;			//協力技発動技１
	u16		waza2;			//協力技発動技２
	u16		wazano;			//協力技ナンバー
}KyouryokuWaza;

enum{
	THROW_HYPER_BALL=0,		//ハイパーボール
	THROW_SUPER_BALL,		//スーパーボール
	THROW_MONS_BALL,		//モンスターボール
	THROW_SAFARI_BALL,		//サファリボール
	THROW_NET_BALL,			//ネットボール
	THROW_DIVE_BALL,		//ダイブボール
	THROW_NEST_BALL,		//ネストボール
	THROW_REPEAT_BALL,		//リピートボール
	THROW_TIMER_BALL,		//タイマーボール
	THROW_GORGEOUS_BALL,	//ゴージャスボール
	THROW_PREMIUM_BALL,		//プレミアボール
	FTW_BALL_MAX,
};

typedef struct
{
	u8	MineKizetsuCount;		//ポケモンが瀕死になった回数
	u8	EnemyKizetsuCount;		//戦闘で倒したポケモンの数
	u8	PokeReshuffleCount;		//自分がポケモン交換した回数
	u8	ItemUseKaifukuCount;	//アイテムを使った回数回復系（きずぐすり等）

	u8	ItemUseFukkatsu;		//アイテムを使った回数復活（げんきのかたまり等）
	u8	DamageFlag			:1;			//ダメージフラグ
	u8	ThrowMasterBallFlag	:1;	//マスターボールを投げたかのフラグ
	u8						:6;
	u16	MineLastPokeNo;			//自分が最後に出していたポケモンナンバー

	u8	MineLastPokeNickname[MONS_NAME_SIZE+EOM_SIZE];
								//自分が最後に出していたポケモンのニックネーム
	u8	FightTurn;				//戦闘ターン数

	u8	MineLastPokeNickname2[MONS_NAME_SIZE+EOM_SIZE];
							//自分が最後に出していたポケモンのニックネーム(2vs2)
	u8	dummy;					//4バイト境界補正

	u16	EnemyLastPokeNo;		//相手の最後のポケモンナンバー
	u16	MineLastWazaNo;			//自分が最後に使った技

	u16	EnemyLastWazaNo;		//相手が最後に使った技
	u16	MineLastPokeNo2;		//自分が最後に出していたポケモンナンバー(2vs2)

	u16	GetPokeNo;				//捕まえたポケモンのポケモンナンバー
								
	u8	GetPokeNickname[MONS_NAME_SIZE+EOM_SIZE];	//捕まえたポケモンにつけたニックネーム
	u8	dummy2;					//4バイト境界補正

	u8	ThrowBall[FTW_BALL_MAX];	
					//戦闘中にボールを投げた数(ボールの種類は上記を参照）
	u8	dummy3;					//4バイト境界補正
}FightTVWork;


typedef struct{
	u32	abirityflag[4];			//特殊能力用フラグ（クライアント分用意4バイト）
}SpecialAbirityData;

typedef struct{
	u8	*PushAdrsBuf[8];
	u8	PushAdrsCnt;
}PushAdrs;

typedef struct{
	pFunc	RetServerSequence[8];
	u8		PushServerAdrsCnt;
}PushServerAdrs;

typedef struct{
	u16		wazano[4];

	u8		pp[4];

	u8		ppmax[4];

	u16		monsno;
	u8		type1;
	u8		type2;
}WazaList;

typedef struct{
	u16		hp;
	u16		dummy;
	u32		condition;
}BallGaugePara;

typedef struct{
	u8		type;			//トレーナーの種類
	u8		name[3];		//トレーナーの名前
	u8		flag;			//種類フラグ
	u8		work;			//1バイトあまっています（4バイト境界補正）
	u16		kaiwa[6];		//簡易会話
}BattleTowerTrainerData;

typedef struct{
	u16		monsno;				//ポケモンナンバー
	u8		item;				//持っているアイテム
	u8		flag;				//種類フラグ
	u16		waza[4];			//持っている技
	u8		expbit;				//努力値ビット
	u8		chr;				//性格
	u16		work;				//2バイトあまっています（4バイト境界補正）
}BattleTowerPokemonData;

typedef struct{
	u16	hpmax;
	u16	pow;
	u16	def;
	u16	agi;
	u16	spepow;
	u16	spedef;
}PushPokeParam;

typedef struct{
	u16	monsno;
	u16	item;

	u16	waza[4];

	u8	level;
	u8	pp_count;
	u8	hp_exp;
	u8	pow_exp;

	u8	def_exp;
	u8	agi_exp;
	u8	spepow_exp;
	u8	spedef_exp;

	u32	id_no;

	u32	hp_rnd		:5;
	u32	pow_rnd		:5;
	u32	def_rnd		:5;
	u32	agi_rnd		:5;
	u32	spepow_rnd	:5;
	u32	spedef_rnd	:5;
	u32	tamago_flag	:1;	// 0:タマゴじゃない1:タマゴだよ
	u32	speabi		:1;	// 特殊能力（0:特殊能力1　1:特殊能力2）

	u32	personal_rnd;

	u8	nickname[MONS_NAME_SIZE+EOM_SIZE];
	u8	friend;

}StockBattleTowerPokemon;

typedef struct{
	u8						level;
	u8						trainerno;
	u16						win;

	u8						name[PERSON_NAME_SIZE+EOM_SIZE];

	u8						id[4];

	u16						kaiwa[6];		//簡易会話

	StockBattleTowerPokemon	SBTP[3];

	u32						checksum;
}StockBattleTowerTrainer;

typedef struct{
	u8						level;
	u8						trainerno;
	u16						win;

	u8						name[PERSON_NAME_SIZE+EOM_SIZE];

	u8						id[4];

	u16						aisatukaiwa[6];		//簡易会話（あいさつ）

	u16						winkaiwa[6];		//簡易会話（戦闘勝利）

	u16						losekaiwa[6];		//簡易会話（戦闘負け）

	StockBattleTowerPokemon	SBTP[3];

	u32						checksum;

}StockBattleCardETrainer;

typedef struct
{
	u16	MineLastPokeNo;			//自分が最後に出していたポケモンナンバー
	u16	EnemyLastPokeNo;			//相手が最後に出していたポケモンナンバー
	u8	TrainerName[PERSON_NAME_SIZE+EOM_SIZE];
	u8	MineLastPokeNickname[MONS_NAME_SIZE+EOM_SIZE];
								//自分が最後に出していたポケモンのニックネーム
}StockBattleTowerTVData;

typedef struct
{
	u16	monsno;
	u16	itemno;
	u8	nickname[MONS_NAME_SIZE+EOM_SIZE];
	u8	level;
	u16	hp;
	u16	hpmax;
	u32	condition;
	u32	personal_rnd;
	u8	sex;
	u8	dummy[3];
}MultiPokeListData;

typedef struct
{
	u8 name[SEED_NAME_SIZE+EOM_SIZE];	//名前
	u8 item_equip;
	u8 item_param[18];
	u8 item_power;
}FightRamSeed;

#endif	__PARAM_H__

