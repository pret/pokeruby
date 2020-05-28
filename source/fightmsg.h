#include	"fightmsg.def"

//戦闘メッセージ用の特殊コード

#define	I_MSG			I_MSG_		//戦闘でだけで機能する仮の機能

enum{
	EV_STR_BUF0=0,		//EvStrBuf0の中身を参照
	EV_STR_BUF1,		//EvStrBuf1の中身を参照
	MY_MONS,			//自分側のポケモンの名前を参照
	ENEMY_MONS,			//相手側のポケモンの名前を参照
	MY_MONS2,			//自分側のポケモンの名前を参照(2vs2)
	ENEMY_MONS2,		//相手側のポケモンの名前を参照(2vs2)
	MY_TMONS,			//自分側のポケモンの名前を参照
	ENEMY_TMONS,			//相手側のポケモンの名前を参照
	MY_TMONS2,			//自分側のポケモンの名前を参照(2vs2)
	ENEMY_TMONS2,		//相手側のポケモンの名前を参照(2vs2)
	SIDE_MONS,			//AttackClientをみて自分か相手かを判断して、
						//そちら側のポケモンの名前を参照
	SIDE_MONS2,			//AttackClientをみて自分か相手かを判断して、
						//そちら側のポケモンの名前を参照(2vs2)
	ATTACK_MONS,		//AttackClientのポケモンの名前を参照
	DEFENCE_MONS,		//DefenceClientのポケモンの名前を参照
	TSUIKA_MONS,		//TsuikaClientのポケモンの名前を参照
	CLIENT_MONS,		//ClientNoのポケモンの名前を参照
	CLIENTNOWORK,		//UserWork[CLIENT_NO_WORK]のポケモンの名前を参照
	WAZA_NAME,			//WazaNoから技の名前を参照
	WAZA_NAME_TMP,		//WazaNoTmpから技の名前を参照
	ITEM_NAME,			//ItemNoからアイテムの名前を参照
	SPEABI_NAME,		//SpeabiNoから特殊能力の名前を参照
	SPEABI_NAMEA,		//SpeabiNoから特殊能力の名前を参照(AttackClient)
	SPEABI_NAMED,		//SpeabiNoから特殊能力の名前を参照(DefenceClient)
	SPEABI_NAMEC,		//SpeabiNoから特殊能力の名前を参照(CLIENT_NO_WORK)
	SPEABI_NAMET,		//SpeabiNoから特殊能力の名前を参照(TsuikaClient)
	TRAINER_TYPE,		//FieldTrainerIDからトレーナータイプを参照
	TRAINER_NAME,		//FieldTrainerIDからトレーナー名を参照
	TRAINER_MYNAME,		//通信トレーナー名を参照
	TRAINER_MYNAME2,	//通信トレーナー名を参照
	TRAINER_ENENAME,	//通信トレーナー名を参照
	TRAINER_ENENAME2,	//通信トレーナー名を参照
	TRAINER_CLIENTNO,	//通信トレーナー名を参照
	MY_NAME,			//自分の名前を参照
	TRAINER_LOSE,		//FieldTrainerIDからトレーナーの負け台詞を参照
	CLIENT_SELMONS_WORK,	//UserWork[CLIENT_NO_WORK]
							//UserWork[SEL_MONS_WORK]からポケモンの名前を参照	
	PASO_NAME,			//だれかのパソコンかマユミのパソコン
	SIDE_ATTACK_NAMENO,	//あいて、みかた
	SIDE_DEFENCE_NAMENO,	//あいて、みかた
	SIDE_ATTACK_NAMEHA,	//あいて、みかた
	SIDE_DEFENCE_NAMEHA,	//あいて、みかた
	SIDE_ATTACK_NAMEWO,	//あいて、みかた
	SIDE_DEFENCE_NAMEWO,	//あいて、みかた
};

//戦闘メッセージ用の特殊コード(EvStrBufに設定されるコード)
//EvStrBuf[0]にはI_MSGが入っている

enum{
	EV_MSGID=0,			//次の2バイトをメッセージIDと解釈する
	EV_NUM,				//数値データを文字に変換する
						//+1:EV_NUM
						//+2:データのバイト数
						//+3:数値の桁数
						//+4-:データのバイト数分の数値データ
	EV_WAZANO,			//次の2バイトを技ナンバーと解釈する
	EV_ZOKUSEI,			//次の1バイトを属性ナンバーと解釈する
	EV_NICKNAME,		//ポケモンのニックネームに変換する
						//+1:EV_NICKNAME
						//+2:ClientNo
						//+3:SelMonsNo
	EV_STATUS,			//次の1バイトをステータスナンバーと解釈する
	EV_MONSNAME,		//次の2バイトをモンスターナンバーと解釈して
						//モンスターの名前に変換する（NICKNAMEではない）
	EV_NICKNAMEONLY,	//ポケモンのニックネームに変換する(「てきの」をつけない）
						//+1:EV_NICKNAMEONLY
						//+2:ClientNo
						//+3:SelMonsNo
	EV_TASTE,			//次の1バイトをTasteナンバーと解釈する
	EV_SPEABINO,		//次の1バイトを特性ナンバーと解釈する
	EV_ITEMNO,			//次の2バイトをアイテムナンバーと解釈する
};

//特殊な判定系
#if 0
	DousuruMsg,
	YesNoMsg,
	EnemyMsg,
	TaikiMsg,
#endif

#ifndef	__FIGHTMSG_H_
#define	__FIGHTMSG_H_

typedef struct{
	u16	WazaNo;
	u16	WazaNoTmp;

	u16	ItemNo;
	u8	SpeabiNo;
	u8	ClientNoWork;			//UserWork[CLIENT_NO_WORK]

	u8	SelMonsWork;			//UserWork[SEL_MONS_WORK]
	u8	MessageOffset;			//UserWork[MESSAGE_OFFSET]
	u8	ItemClient;
	u8	WazaType;

	u8	Speabi[4];

	u8	EvStrBuf0[16];
	u8	EvStrBuf1[16];
}FightMsgStruct;

extern	void	FightMsgID(u16);
extern	int		FightMsgCreate(u8 *);
extern	int		FightMsgCreateAct(u8 *,u8 *);
extern	void	WazaMsgCreate1(u8 *);
extern	void	WazaMsgCreate2(u8 *);

extern	const u16 NoHitMsgTbl[];
extern	const u16 ShimeWazaNo[];

extern	const u8 * const FightMsgTbl[];

//ローカライズのために統合したメッセージ群
extern	const u8 ShinkaBeforeMsg[];
extern	const u8 ShinkaAfterMsg[];
extern	const u8 ShinkaCancelMsg[];
extern	const u8 DousuruMsg[];
extern	const u8 SafariDousuruMsg[];
extern	const u8 DemoDousuruMsg[];
extern	const u8 TaikiMsg[];
extern	const u8 CommandMsg[];
extern	const u8 SafariCommandMsg[];
extern	const u8 WazaInfoMsg[];
extern	const u8 ColBlueMsg[];
extern	const u8 WasureMsg[];
extern	const u8 YesNoMsg[];
extern	const u8 WazaSwapMsg[];
extern	const u8 SafariBallMsg[];
extern	const u8 NokoriMsg[];
extern	const u8 NankoMsg[];
extern	const u8 NemuriMsg[];
extern	const u8 DokuMsg[];
extern	const u8 YakedoMsg[];
extern	const u8 MahiMsg[];
extern	const u8 KooriMsg[];
extern	const u8 KonranMsg[];
extern	const u8 MeromeroMsg[];
extern	const u8 SpaceMsg[];
extern	const u8 ScrollWaitMsg[];
extern	const u8 CRMsg[];
extern	const u8 HaMsg[];
extern	const u8 HaScrollWaitMsg[];
extern	const u8 LevelUpWindowMsg[];
extern	const u8 LevelUpWindowMsgArrow[];
extern	const u8 LevelUpWindowMsgPlus[];
extern	const u8 LevelUpWindowMsgMinus[];
extern	const u8 * const LevelUpWindowMsgTbl[];
extern	const u8 DarekanoMsg[];
extern	const u8 MayuminoMsg[];
extern	const u8 HuseiNaTamagoMsg[];
extern	const u8 KeikentiGetNormalMsg[];
extern	const u8 KeikentiGetOomeMsg[];
extern	const u8 TokuseiNoReshuffleMsg[];
extern	const u8 MitsuruNameMsg[];
extern	const u8 FightWinMsg[];
extern	const u8 FightLoseMsg[];
extern	const u8 FightDrawMsg[];

#endif	__FIGHTMSG_H_

