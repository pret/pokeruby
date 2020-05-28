//==========================================================
//	通信タスク用定義
//==========================================================

#define	REQ_WORK0		10
#define	REQ_SEQ_NO		11
#define	REQ_BUF_OVER	12
#define	REQ_BUF_WAIT	13
#define	REQ_BUF_SET		14
#define	REQ_BUF_GET		15
#define	TUUSHIN_TASK_BUF_SIZE	0x1000
#define	TUUSHIN_TASK_BUF_START	0x014000

#define	RECV_BUF_OVER	12
#define	RECV_BUF_WAIT	13
#define	RECV_BUF_SET	14
#define	RECV_BUF_GET	15
#define	RECV_TASK_BUF_START		0x015000

//==========================================================

#define	BSS_SERVER		0
#define	BSS_CLIENT		1
#define	BSS_CLIENT_BIT	2

#define	BSS_CLIENT_MINE		0
#define	BSS_CLIENT_ENEMY	1
#define	BSS_CLIENT_MINE2	2
#define	BSS_CLIENT_ENEMY2	3

#define	BSS_SELMONSNO		0
#define	BSS_SELMONS0		0x01
#define	BSS_SELMONS1		0x02
#define	BSS_SELMONS2		0x04
#define	BSS_SELMONS3		0x08
#define	BSS_SELMONS4		0x10
#define	BSS_SELMONS5		0x20

#define	BSS_DATASTART		3
#define	BSS_DATALOW			3
#define	BSS_DATAHIGH		4

#define	SIDE_MINE			0
#define	SIDE_ENEMY			1

//関数ＩＤ宣言

enum{
	BSS_POKEPARA_GET=0,		//指定したポケモンデータを取得する。			0x00
	BSS_POKEPARA_GET2,		//指定したアドレスのポケモンデータを取得する。	0x01
	BSS_POKEPARA_PUT,		//指定したポケモンデータを変更する。			0x02
	BSS_POKEPARA_PUT2,		//指定したポケモンデータを変更する。			0x03
	BSS_POKE_ENCOUNT,		//ポケモン登場エフェクトを起動する。			0x04
	BSS_POKE_APPEAR,		//ポケモン登場エフェクトを起動する。			0x05
	BSS_POKE_RETURN,		//ポケモンを戻すエフェクトを起動する。			0x06
	BSS_TRAINER_ENCOUNT,	//トレーナー登場エフェクトを起動する。			0x07
	BSS_TRAINER_APPEAR,		//トレーナー登場エフェクトを起動する。			0x08
	BSS_TRAINER_RETURN,		//トレーナーを戻すエフェクトを起動する。		0x09
	BSS_POKE_KIZETSU,		//ポケモンが気絶するエフェクトを起動する。		0x0a
	BSS_POKE_ZENMETSU,		//ポケモンが全滅したときのエフェクトを起動する。0x0b
	BSS_GET_SUCCESS,		//ポケモン捕獲成功のエフェクトを出す。			0x0c
	BSS_GET_FAIL,			//ポケモン捕獲失敗のエフェクトを出す。			0x0d
	BSS_POKE_LEVELUP,		//ポケモンレベルアップのエフェクトを出す。		0x0e
	BSS_WAZA_EFFECT,		//指定した技ナンバーのエフェクトを出す。		0x0f
	BSS_MESSAGE,			//送ったデータを文字データと解釈して			0x10
							//メッセージ表示をする。
	BSS_ALERT_MESSAGE,		//送ったデータを文字データと解釈して			0x11
							//メッセージ表示をする。
	BSS_COMMAND_SELECT, 	//コマンド選択ウィンドウを表示して、			0x12
							//選択シーケンスを作動させる。
	BSS_COMMAND_SELECT_COPY,//コマンド選択を指定されたClientNoと、			0x13
							//同期させる。
	BSS_WAZA_SELECT,		//技選択ウィンドウを表示して、					0x14
							//選択シーケンスを作動させる。
	BSS_ITEM_SELECT,		//アイテム選択ウィンドウを表示して				0x15
							//選択シーケンスを作動させる。
	BSS_POKE_SELECT,		//ポケモン選択ウィンドウを表示して、			0x16
							//選択シーケンスを作動させる。
	BSS_ESCAPE,				//逃げるエフェクトを起動する。					0x17
	BSS_HP_GAUGE,			//ＨＰゲージを増減する。						0x18
	BSS_EXP_GAUGE,			//ＥＸＰゲージを増減する。						0x19
	BSS_STATUS_SET,			//指定されたステータス異常エフェクトを起動する。0x1a
							//ゲージに状態異常を表示するのもいっしょにやる
	BSS_STATUS_EFFECT,		//指定されたステータス異常エフェクトを起動する。0x1b
	BSS_STATUS_CLEAR,		//指定されたステータス異常をクリアする。		0x1c
	BSS_DATA_TRANS,			//データ要求に対する応答として使用する。		0x1d
	BSS_DATA_RAM_TRANS,		//指定アドレス（RAM、VRAM、CGRAM）に			0x1e
							//データを転送する。
	BSS_BGM_TRANS,			//曲データを転送する。							0x1f
	BSS_VOICE_TRANS,		//鳴き声データを転送する。						0x20
	BSS_SELECT_RETURN,		//メニューで選択した項目IDを返す。				0x21
	BSS_POKE_RESHUFFLE,		//ポケモン入れ替えを行ったことを知らせる。		0x22
	BSS_USE_ITEM,			//アイテム使用を知らせる。						0x23
	BSS_USE_BALL,			//ボール使用を知らせる。						0x24
	BSS_LOOPCOUNT_CLEAR,	//技エフェクト用のカウンタのクリア				0x25
	BSS_LOOPCOUNT_SET,		//技エフェクト用のカウンタのセット				0x26
	BSS_SWITCHFLAG_CLEAR,	//技エフェクト用のフラグのクリア				0x27
	BSS_SWITCHFLAG_SET,		//技エフェクト用のフラグのセット				0x28
	BSS_POKEDAMAGE_BLINK,	//ﾀﾞﾒｰｼﾞを受けたときのﾎﾟｹﾓﾝ点滅					0x29
	BSS_GAUGE_OFF,			//ゲージを消す									0x2a
	BSS_SE_PLAY,			//SEを鳴らす									0x2b
	BSS_ME_PLAY,			//SEを鳴らす									0x2c
	BSS_VOICE_PLAY,			//鳴き声を鳴らす								0x2d
	BSS_ENCOUNT_EFFECT,		//エンカウントエフェクトをセット				0x2e
	BSS_POKE_SENDOUT,		//ポケモン繰り出しシーケンスを発動				0x2f
	BSS_BALL_GAUGE_SET,		//トレーナー戦時のボールゲージを表示			0x30
	BSS_BALL_GAUGE_OFF,		//トレーナー戦時のボールゲージを非表示			0x31
	BSS_GAUGE_YURE_STOP,	//トレーナー戦時のゲージのゆれを止める			0x32
	BSS_VANISH_ON_OFF,		//クライアントが管理しているポケモンのVANISH ON/OFF	0x33
	BSS_FIGHT_EFFECT,		//戦闘時の特定のエフェクトを出す				0x34
	BSS_TUUSHIN_WAIT,		//通信待機中のメッセージを出す					0x35
	BSS_CSRPOS_CLEAR,		//記憶しているカーソル位置のクリア				0x36
	BSS_FIGHT_END,			//対戦終了を知らせる							0x37
	
	BSS_END_ID,				//ナンバーの終端（これ以降に追加は禁止）
};

//取得パラメータコード一覧

enum{
	BSS_PARA_FIGHT=0,			//戦闘時に必要なパラメータ全て
	BSS_PARA_MONSNO,			//モンスター番号
	BSS_PARA_ITEM,				//装備アイテム
	BSS_PARA_WAZA,				//技すべて
	BSS_PARA_WAZA1,				//技
	BSS_PARA_WAZA2,				//技
	BSS_PARA_WAZA3,				//技
	BSS_PARA_WAZA4,				//技
	BSS_PARA_PP,				//技ポイント＆技ポイントカウンタすべて
	BSS_PARA_PP1,				//技ポイント
	BSS_PARA_PP2,				//技ポイント
	BSS_PARA_PP3,				//技ポイント
	BSS_PARA_PP4,				//技ポイント
	BSS_PARA_PPCOUNT1,			//技ポイントカウンタ
	BSS_PARA_PPCOUNT2,			//技ポイントカウンタ
	BSS_PARA_PPCOUNT3,			//技ポイントカウンタ
	BSS_PARA_PPCOUNT4,			//技ポイントカウンタ
	BSS_PARA_ID,				//ＩＤナンバー
	BSS_PARA_EXP,				//基本経験値
	BSS_PARA_HPEXP,				//ＨＰ努力値
	BSS_PARA_POWEXP,			//攻撃力努力値
	BSS_PARA_DEFEXP,			//防御力努力値
	BSS_PARA_AGIEXP,			//素早さ努力値
	BSS_PARA_SPEPOWEXP,			//特殊攻撃努力値
	BSS_PARA_SPEDEFEXP,			//特殊防御努力値
	BSS_PARA_FRIEND,			//友好値
	BSS_PARA_POKERUS,			//ポケルス
	BSS_PARA_GET_PLACE,			//捕獲場所
	BSS_PARA_GET_LEVEL,			//捕獲レベル
	BSS_PARA_GET_CASSETTE,		//捕獲カセット
	BSS_PARA_GET_BALL,			//捕獲ボール
	BSS_PARA_POWERRND,			//パワー乱数すべて
	BSS_PARA_HPRND,				//HPパワー乱数
	BSS_PARA_POWRND,			//攻撃力パワー乱数
	BSS_PARA_DEFRND,			//防御力パワー乱数
	BSS_PARA_AGIRND,			//素早さパワー乱数
	BSS_PARA_SPEPOWRND,			//特殊攻撃力パワー乱数
	BSS_PARA_SPEDEFRND,			//特殊防御力パワー乱数
	BSS_PARA_CHRRND,			//個性乱数
	BSS_PARA_SUM,				//チェックサム
	BSS_PARA_CONDITION,			//コンディション
	BSS_PARA_LEVEL,				//レベル
	BSS_PARA_HP,				//ＨＰ残量
	BSS_PARA_HPMAX,				//ＨＰＭＡＸ
	BSS_PARA_POW,				//攻撃力
	BSS_PARA_DEF,				//防御力
	BSS_PARA_AGI,				//素早さ
	BSS_PARA_SPEPOW,			//特殊攻撃力
	BSS_PARA_SPEDEF,			//特殊防御力
	BSS_PARA_STYLE,				//かっこよさ	add 2001.09.19(水) by matsuda
	BSS_PARA_BEAUTIFUL,			//美しさ
	BSS_PARA_CUTE,				//かわいさ
	BSS_PARA_CLEVER,			//賢さ
	BSS_PARA_STRONG,			//たくましさ
	BSS_PARA_FUR,				//毛艶
	BSS_PARA_STYLEMEDAL,		//かっこよさ勲章
	BSS_PARA_BEAUTIFULMEDAL,	//美しさ勲章
	BSS_PARA_CUTEMEDAL,			//かわいさ勲章
	BSS_PARA_CLEVERMEDAL,		//賢さ勲章
	BSS_PARA_STRONGMEDAL,		//たくましさ勲章
};

//ステータス異常ナンバーリスト
enum{
	BSS_STATUS_NEMURI=0,		//眠り
	BSS_STATUS_MAHI,			//麻痺
	BSS_STATUS_KONRAN,			//混乱
};

//項目ID一覧
enum{
	BSS_SELECT_RETURN_FIGHT=0,			//たたかう
	BSS_SELECT_RETURN_ITEM,				//リュック
	BSS_SELECT_RETURN_POKE,				//ポケモン
	BSS_SELECT_RETURN_ESCAPE,			//にげる
	BSS_SELECT_RETURN_SAFARI,			//サファリゾーン特有のアクション
	BSS_SELECT_RETURN_BALL,				//サファリボールを投げる
	BSS_SELECT_RETURN_CUBE,				//キューブ
	BSS_SELECT_RETURN_APPROACH,			//ちかづく
	BSS_SELECT_RETURN_SAFARI_ESCAPE,	//にげる
	BSS_SELECT_RETURN_GET_DEMO,			//捕獲デモ特有のアクション
	BSS_SELECT_RETURN_WAZA,				//技
	BSS_SELECT_RETURN_LEVELUP,			//レベルアップ
	BSS_SELECT_RETURN_B_CANCEL,			//Bボタンを押して戻ってきた
};

//技リスト選択フラグ
enum{
	BSS_WAZA_SELECT_NORMAL=0,		//通常選択
	BSS_WAZA_SELECT_WAZAWASURE,		//技忘れ用選択
};

//カーソル位置クリアフラグ
enum{
	BSS_CSRPOS_CLEAR_ALL=0,			//カーソル位置クリアオール
	BSS_CSRPOS_CLEAR_COMMAND,		//カーソル位置クリアコマンド
	BSS_CSRPOS_CLEAR_WAZA,			//カーソル位置クリア技
};
