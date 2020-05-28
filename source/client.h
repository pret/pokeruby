
#ifndef __CLIENT_H__
#define __CLIENT_H__


#define ARROW_DEL	0	//いらなくなったゲージの矢印アクターを削除


//----------------------------------------------------------
//	外部関数宣言
//----------------------------------------------------------
extern	void	ClientDummy(void);
extern	void	ClientInit(void);
extern	void	ClientPokeListReturn(void);
extern	void	BtlItemReturn(void);
extern	void	TrainerDelEnd(actWork *xreg);
extern	void	ClientCommandWait(void);
extern	void	CommandCsrOn(u8,u8);
extern	void	CommandCsrOff(u8);
extern	void	VoiceCheckTask(u8 id);
extern	void	ClientWazaSelect(void);
extern	u8		ClientWazaSelectShinka(void);
extern	void	ClientBSSWazaSelect(void);
extern	void	ClientBSSWazaSelectAct(void);
extern	void	ClientBSSPokeparaGet(void);
extern	void	ClientBSSPokeparaGet2(void);
extern	void	ClientBSSPokeparaPut(void);

//----------------------------------------------------------
//	外部変数宣言
//----------------------------------------------------------
extern u8 ClientStruct[];	//透明ｱｸﾀｰ監視用
extern u8 ClientGaugeSt[];	//ｹﾞｰｼﾞｱｸﾀｰ監視用
extern u8 GaugeArrowActNo;
extern u8 TempClientNo;
extern	u8	CommandCsrPos[];
extern	u8	WazaCsrPos[];
extern u8 ClientEffectWait;
extern u8 TemotiGauge[];
extern u32	HenshinRnd[];	//へんしん用の個性乱数

//----------------------------------------------------------
//	定数
//----------------------------------------------------------
#define	CGX_START	0x080
#define	CGX_START2	0x180
#define	CGX_START3	0x280
#define	CSR_SCR		24

#define	CSR_CHR_U	0x0001
#define	CSR_CHR_D	0x0002
#define	SPACE_CHR_D	0x000a
#define	SPACE_CHR_B	0x1016

#define	WIN_CHR_UL	0x1022
#define	WIN_CHR_U	0x1023
#define	WIN_CHR_UR	0x1024
#define	WIN_CHR_ML	0x1025
#define	WIN_CHR_M	0x1026
#define	WIN_CHR_MR	0x1027
#define	WIN_CHR_DL	0x1028
#define	WIN_CHR_D	0x1029
#define	WIN_CHR_DR	0x102a

//-- 戦闘画面ｳｨﾝﾄﾞｳのﾒｯｾｰｼﾞ表示座標 --//
#define CL_WINMSG_X	2
#define CL_WINMSG_Y	15

//-- 手持ちボール数が表示されている時間 --//
#define TEMOTI_BALL_WAIT	92

//-- 敵側の初回の手持ちゲージを出すタイミングを少し遅らせるｳｪｲﾄ --//
#define ENEMY_TEMOTI_INIT_WAIT	2

#include	"client.def"


//-- その他エフェクト(EtcEffSeqTbl)用のID --//
enum{
	FE_ID_LVUP,			//レベルアップ時のエフェクト
	FE_ID_POKERETURN_MINE,	//自機側ポケモン引っ込めるエフェクト
	FE_ID_POKERETURN_ENEMY,	//敵側ポケモン引っ込めるエフェクト
	FE_ID_POKEGET,		//捕まえエフェクト
	FE_ID_POKEGET_SAFARI,	//捕まえエフェクト(サファリ用)
	FE_ID_MIGAWARI_OUT,	//「みがわり」キャラをｽﾗｲﾄﾞｱｳﾄ
	FE_ID_MIGAWARI_IN,	//「みがわり」キャラをｽﾗｲﾄﾞｲﾝ
};


/*----------------------------------------------------------
	ﾎﾟｹﾓﾝのｱｸﾀｰﾜｰｸ使用状況
常駐
	work[0] = 自分のｸﾗｲｱﾝﾄﾅﾝﾊﾞｰ
以下ﾃﾝﾎﾟﾗﾘ領域
	work[1] = ﾀﾞﾒｰｼﾞの点滅ｶｳﾝﾀｰとして使用
	work[2] = monsno
他未使用
-----------------------------------------------------------*/







//----------------------------------------------------------
//	ｸﾗｲｱﾝﾄｼｽﾃﾑ構造体宣言
//----------------------------------------------------------

//画面切り替え後も保持するデータはここに追加していく
typedef struct{
	u8 act_banish:1;		//ｸﾗｲｱﾝﾄのﾎﾟｹﾓﾝがﾊﾞﾆｯｼｭ状態かどうかを保持
	u8 pinch_se:1;			//1=ﾋﾟﾝﾁ時の警告音が鳴ってる
	u8 migawari:1;			//「みがわり」実行中ﾌﾗｸﾞ(1:実行中　0:してない)
	u8 migawari_out:1;		//「みがわり」を引っ込めているか(1:引っ込め中、0:場に出てる)
	u8 gauge_mode:1;		//HPｹﾞｰｼﾞの表示ﾀｲﾌﾟ(0:ﾊﾞｰで表示　1:数値で表示)
	u8 			:3;
	u16 hensin_monsno;		//変身した時のﾎﾟｹﾓﾝ番号を保持(0の場合は変身してない)
}ClientMemory;

//画面切り替えで消えてもいいような情報はこの構造体に追加していく
typedef struct{
	u8 temoti_gauge_flg:1;	//1:手持ちｹﾞｰｼﾞ出してる		0:出してない
	u8 gauge_motion_set:1;	//1:選択中のゆらゆらする動き実行中	0:してない
	u8 poke_motion_set:1;
	u8 ball_eff_wait:1;		//1:ﾎﾞｰﾙから出現ｴﾌｪｸﾄ実行中	0:してない
	u8 status_eff:1;		//1:ｽﾃｰﾀｽ異常ｴﾌｪｸﾄ発動中
	u8 fight_eff:1;			//1:戦闘ｴﾌｪｸﾄ発動中
	u8 etc_eff:1;			//1:その他ｴﾌｪｸﾄ発動中
	u8 rare_eff:1;			//1:レア登場エフェクト実行中
	
	u8 rare_eff_end:1;		//1:レア登場エフェクト終了
	u8 temoti_wait:5;		//初回時の手持ちゲージを出すまでのｳｪｲﾄ
	u8		:2;
	
	u8 gauge_motion_no;		//選択中のゆらゆらする動きを実行する透明ｱｸﾀｰのNo
	u8 poke_motion_no;
	u8 WazaEffSeqNo;
	u8 wait_work;			//waitのｶｳﾝﾀ用のﾜｰｸ
	u8 poke_aff_no;			//各ﾎﾟｹﾓﾝが取得しているAffineNo ※技ｴﾌｪｸﾄで一時的に0ｸﾘｱするのでここに退避させる
	u8 shadow_act;			//ﾎﾟｹﾓﾝの影のActNo
	u8 setime_wait;			//SE終了待ちのﾀｲﾑｱｳﾄｶｳﾝﾄ
	u8 send_out_wait;		//SendOut終了時のｳｪｲﾄ
}ClientSystem;

//各ｸﾗｲｱﾝﾄ毎には持たないワーク ※画面切り替えで消える
typedef struct{
	u16 work[4];			//FightEffectSetで渡す引数
	u8 get_rate;			//ﾎﾟｹﾓﾝｹﾞｯﾄｴﾌｪｸﾄで使用(ﾎﾞｰﾙのｸﾞｶﾞ回数)
	u8 sendout_eff:1;		//SendOutエフェクト中
	u8 get_banish:1;		//ﾎﾟｹﾓﾝｹﾞｯﾄｴﾌｪｸﾄ前に対象のﾎﾟｹﾓﾝのﾊﾞﾆｯｼｭ情報を保存
	u8			:6;
	
	u8 hikari_count;		//ﾓﾝｽﾀｰﾎﾞｰﾙ出現の光ｷｬﾗがｾｯﾄされた回数をｶｳﾝﾄ
	s16 ball_temp;			//ｹﾞｯﾄｴﾌｪｸﾄ作業用ﾃﾝﾎﾟﾗﾘﾜｰｸ
}BtlWorkData;

//各ｸﾗｲｱﾝﾄのゲージの計算用ワークとして使用
typedef struct{
	u8	actno;			//ゲージのｱｸﾀｰの配列番号
	s32 MaxHP;			//最大HP(ｹﾞｰｼﾞﾏｯｸｽ値)
	s32 NowHP;			//現在のHP(ﾀﾞﾒｰｼﾞを受ける前)
	s32 beHP;			//受けたﾀﾞﾒｰｼﾞ(回復する場合はﾏｲﾅｽで入れる) 変動させる値
	//s16 HP_Work;		//作業用ﾜｰｸ
	s32 HP_Work;		//2002.09.14(土)
}GaugeData;

#define CLIENT_MEMORY_SIZEOF	(sizeof(ClientMemory)*CLIENT_MAX)
#define CLIENT_SYSTEM_SIZEOF	(sizeof(ClientSystem)*CLIENT_MAX)
#define BTLWORKDATA_SIZEOF		(sizeof(BtlWorkData))
#define GAUGE_DATA_SIZEOF		(sizeof(GaugeData)*CLIENT_MAX)

#define	MATSUDA_USER_WORK_START	0x17800	//松田君が戦闘で使用できるUserWorkのスタート
#define CLI_MEMORY_USERWORK		MATSUDA_USER_WORK_START
#define CLI_SYS_USERWORK		(CLI_MEMORY_USERWORK+CLIENT_MEMORY_SIZEOF)
#define BTLWORKDATA_USERWORK	(CLI_SYS_USERWORK+CLIENT_SYSTEM_SIZEOF)
#define GAUGE_DATA_USERWORK		(BTLWORKDATA_USERWORK+BTLWORKDATA_SIZEOF)
//#define CLI_DMMY				(GAUGE_DATA_USERWORK+BTLWORKDATA_SIZEOF)


//----------------------------------------------------------
//	クライアントのｼｽﾃﾑ構造体にｱｸｾｽする時に使用するマクロ
// 0x18000よりも前に定義されているので画面切り替え後も保持されてるデータ
//----------------------------------------------------------
#define Climem	((ClientMemory*)&UserWork[CLI_MEMORY_USERWORK])
#define CliSys	((ClientSystem*)&UserWork[CLI_SYS_USERWORK])
#define BtlWork	((BtlWorkData*)&UserWork[BTLWORKDATA_USERWORK])
#define gwork	((GaugeData*)&UserWork[GAUGE_DATA_USERWORK])


// 背景切り替えでｽｸﾘｰﾝﾃﾞｰﾀを展開しているのでｺﾝﾃｽﾄでは1000h確保
#define CONTEST_WAZAEFF_USERWORK	0x14800	//ｺﾝﾃｽﾄの技ｴﾌｪｸﾄ用のUserWork
// 戦闘はｽｸﾘｰﾝﾃﾞｰﾀの一時展開はしていないので800hでOK
#define BATTLE_WAZAEFF_USERWORK	0x18000	//戦闘の技ｴﾌｪｸﾄ用のUserWork
//技ｴﾌｪｸﾄで使用できるUserWork
#define WAZAEFF_USERWORK		\
			(ContestCheck() ? CONTEST_WAZAEFF_USERWORK : BATTLE_WAZAEFF_USERWORK)
#define WAZAEFF_USERWORK_SIZE		0x0800




#endif //__CLIENT_H__

