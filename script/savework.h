//========================================================================
//
//
//	イベント用ワークエリア定義
//
//			2001_09_07 GAME FREAK Inc.
//========================================================================

#ifndef	SAVEWORK_H
#define SAVEWORK_H


/*
 プログラムよりと思われるワーク定義はsourceディレクトリの
  syswork.hに移動した
*/

#define		SVSCRWK_START				(80+SVWK_START)

//------------------------------------------------------------------------
//							フィールドタウン
//------------------------------------------------------------------------
#define	WK_SCENE_FIELD_T101				(0+SVSCRWK_START)
/* ミシロタウンシーンナンバー
01 ミシロのストッパーを解除(POS)
02 ミシロのストッパー「ロード１０１で叫び声が聞こえるよ」解除(POS)
03 母にランニングシューズを貰うイベント開始
04 母にランニングシューズを貰うイベント終了
*/

#define	WK_SCENE_FIELD_T102				(1+SVSCRWK_START)
/* コトキタウンシーンナンバー
01 コトキのストッパーを解除(POS)
   (コトキでモンスターボールを貰っている状態だったら
    強制的に01を入れるようにしている)
*/

#define	WK_SCENE_FIELD_T103				(2+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_T104				(3+SVSCRWK_START)
/*
00 何もなし
01 バッジを取得してサポートと遭遇可能
02 ゴーゴーゴーグル入手
*/

#define	WK_BASE_POSNO					(4+SVSCRWK_START)
/*
   秘密基地のデータ番号(syswork.hから移動) 
*/

#define	WK_SCENE_FIELD_T106				(5+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_T107				(6+SVSCRWK_START)
/*
*/

//------------------------------------------------------------------------
//							フィールドシティ
//------------------------------------------------------------------------
#define	WK_SCENE_FIELD_C101				(7+SVSCRWK_START)
/*
//01 父と話した
02 ミツルとポケモンを捕まえにいくイベントスタート
03 ミツルとポケモンを捕まえにいくイベント終了
04 ↑後トウカのポスイベント終了
*/

#define	WK_SCENE_FIELD_C102				(8+SVSCRWK_START)
/*
01 カイナにクスノキ艦長が帰っていることを知る(カイナＴＶがくる)
02 クスノキ艦長のインタビューイベント終了(野次馬状態が元に戻る)
*/

#define	WK_SCENE_FIELD_C103				(9+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_C104				(10+SVSCRWK_START)
/* カナズミシティシーンナンバー
01 ジムリーダーに勝利した
02 ポケモン盗難事件発生した
03 研究員と会話した(POS)
04 デボンのにもつを取り返した
05 デボンのにもつを渡した
*/

#define	WK_SCENE_FIELD_C105				(11+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_C106				(12+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_C107				(13+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_C108				(14+SVSCRWK_START)
/*
01 ミクリ達が祠の上の方にいる
02 ミクリ達に案内された
*/

#define	WK_SCENE_FIELD_C109				(15+SVSCRWK_START)
/*
*/

//------------------------------------------------------------------------
//							フィールドロード
//------------------------------------------------------------------------
#define	WK_SCENE_FIELD_R101				(16+SVSCRWK_START)
/*
01 マップ名を出さなくする
02 オダマキ博士からポケモンをもらうイベント中(強制)
03 オダマキ博士からポケモンをもらうイベント終了
*/

#define	WK_SCENE_FIELD_R102				(17+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R103				(18+SVSCRWK_START)
/*
01 サポートキャラとのバトルに勝利した
*/

#define	WK_SCENE_FIELD_R104				(19+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R105				(20+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R106				(21+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R107				(22+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R108				(23+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R109				(24+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R110				(25+SVSCRWK_START)
/*
01 サポートとの戦闘終了
*/

#define	WK_SCENE_FIELD_R111				(26+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R112				(27+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R113				(28+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R114				(29+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R115				(30+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R116				(31+SVSCRWK_START)
/*
01 カナシダトンネル前でハギのメッセージが出る(ハギ前)
02 上記	見た(ハギ前)
*/

#define	WK_SCENE_FIELD_R117				(32+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R118				(33+SVSCRWK_START)
/*
01 ダイゴイベント終了した
*/

#define	WK_SCENE_FIELD_R119				(34+SVSCRWK_START)
/*
01 サポートイベント終了した
*/

#define	WK_SCENE_FIELD_R120				(35+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R121				(36+SVSCRWK_START)
/*
01 アクア団がおくりび山の方へ去っていく
*/

#define	WK_SCENE_FIELD_R122				(37+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R123				(38+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R124				(39+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R125				(40+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R126				(41+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R127				(42+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R128				(43+SVSCRWK_START)
/*
01 デボン息子イベント開始
02 デボン息子イベント終了
*/

#define	WK_SCENE_FIELD_R129				(44+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R130				(45+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R131				(46+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R132				(47+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R133				(48+SVSCRWK_START)
/*
*/

#define	WK_SCENE_FIELD_R134				(49+SVSCRWK_START)
/*
*/

//------------------------------------------------------------------------
//							その他(部屋の中など)
//------------------------------------------------------------------------
#define	WK_SCENE_T101_R0101				(50+SVSCRWK_START)
/* 自宅１階 シーンナンバー
01 奥さんが部屋に入ると話し掛けてくる 
02 奥さんが部屋に入ると話し掛けきた
03 ゲームクリアした
04 ゲームクリアして１階に下りてきてパパの強制イベント
05 ↑イベント後フィールドに出た
*/

#define	WK_SCENE_T101_R0102				(51+SVSCRWK_START)
/* 自分の部屋 シーンナンバー 
// WK_SCENE_T101_R0202で見ている
*/

#define	WK_SCENE_T101_R0301				(52+SVSCRWK_START)
/* オダマキ研究所シーンナンバー
//01 オダマキ博士が留守なのを助手から聞いた
02 オダマキ博士研究所で初会話中
03 オダマキ博士に娘と対戦してこいと言われる
04 図鑑貰うオートイベント発生
05 図鑑・モンスターボールを貰った(オートイベント終了)
*/

#define	WK_SCENE_C101_R0201				(53+SVSCRWK_START)
/* トウカシティジムシーンナンバー
01 ミツルが訪れるイベント終了
02 ポケモン捕獲後のジムイベント終了
03 バッチ１つ
04 バッチ２つ
05 バッチ３つ
06 バッチ４つ
07 パパからバッチを貰った
*/

#define	WK_SCENE_SP_CONTEST				(54+SVSCRWK_START)
/*コンテストのシーンナンバー
01 参加したコンテスト開始
02 参加したコンテスト終了
*/

#define	WK_SCENE_SP_PC02				(55+SVSCRWK_START)
/* PC２階のシーンナンバー

*/

#define	WK_SCENE_SP_CONTEST03				(56+SVSCRWK_START)
/* コンテストの会場のナンバー(帰るとき＆通信checkで使用)
01 	シダケ
02	ハジツゲ
03	カイナ
04	ミナモ
05	ミナモ（通信）
*/

#define	WK_SCENE_BASE_GOODS				(57+SVSCRWK_START)
// 秘密基地のOBJグッズ配置フラグ

#define	WK_SCENE_SP_CONTESTITEM				(58+SVSCRWK_START)
/* コンテストで優勝したとき、荷物がいっぱいで貰えなかった場合
01 	ハジツゲで優勝
02	シゲタケで優勝
03	カイナで優勝
04	ミナモで優勝
*/

//#define	WK_SCENE_HAGI_EVENT				(59+SVSCRWK_START)
/*
*/

#define	WK_SCENE_T101_R0201				(60+SVSCRWK_START)
/*
01 奥さんが部屋に入ると話し掛けてくる 
02 奥さんが部屋に入ると話し掛けきた
03 ゲームクリアした
04 ゲームクリアして１階に下りてきてパパの強制イベント
05 ↑イベント後フィールドに出た
*/

#define	WK_SCENE_T101_R0202				(61+SVSCRWK_START)
/* オダマキ娘の部屋 シーンナンバー 
03 オダマキ娘と話した
04 図鑑入手した(モンスターボールをもらった)
*/

#define	WK_SCENE_HAGI_FUNE				(62+SVSCRWK_START)
/*
01 ハギ老人の小屋でムロに行くにしたら、１になり、field_r104で強制的に
   船移動が始まる
02 (同じ)ハギ老人の小屋に船で戻ると強制的にメッセージしゃべる
*/

#define	WK_SCENE_C104_R0103				(63+SVSCRWK_START)
/*
01 研究員からデボンのにもつを受け取る
*/

#define	WK_SCENE_R104_R0101				(64+SVSCRWK_START)
/*
01 カナシダトンネルイベント終了
*/

//#define	WK_SCENE_R116_R0101				(65+SVSCRWK_START)
/*
*/

#define	WK_SCENE_SP_OPENING				(66+SVSCRWK_START)
/*
01 (男の子)ゲームスタート
02 (女の子)ゲームスタート
03 (共通)自宅１階イベント中
04 (共通)自宅１階イベント終了
05 (共通)自宅２階に行った
06 (共通)自宅２階時計セットした
07 (共通)自宅イベント終了
08 (共通)家から出た
*/

#define	WK_SCENE_C103_R0101				(67+SVSCRWK_START)
/*
01 １つ目のスイッチを押している
02 ２つ目のスイッチを押している
03 ３つ目のスイッチを押している
*/

#define	WK_SCENE_C106_R0202				(68+SVSCRWK_START)
/*
01 　館長と話した
*/

#define	WK_SCENE_C106_R0401				(69+SVSCRWK_START)
/*
01 　ファンが近よるイベント発動するようになる
02 　ファンが近よるイベント終了
*/

#define	WK_SCENE_FUNE_POS				(70+SVSCRWK_START)
/*
00 船はない
01 ハギ老人の船の位置	ロード１０４
02						ムロ
03						ロード１０９
*/

#define	WK_SCENE_BASE_MAKE				(71+SVSCRWK_START)
/*
01 秘密基地作成時の強制移動終了
*/

#define	WK_SCENE_CAVE_D0601				(72+SVSCRWK_START)
/*
01 トレナビイベント終了
*/

#define	WK_SCENE_ARTIST_C106_R0301		(73+SVSCRWK_START)
/*
00 画家退場
01 画家登場
*/

#define	WK_SCENE_CAVE_D0201				(74+SVSCRWK_START)
/*
02 画面端にアクア団発生する
03 あとずさりした
04 カナシダトンネル開通(下側)
05 カナシダトンネル開通(上側)
06 カナシダトンネルイベント終了
*/

#define	WK_SCENE_CAVE_D1206				(75+SVSCRWK_START)
/*
01 超古代ポケモンイベント終了
*/

#define	WK_SCENE_POKE_LEAGUE			(76+SVSCRWK_START)
/*
01 r0101
02 r0102
03 r0103
04 r0104
*/

//#define	WK_SCENE_R114_R0101				(77+SVSCRWK_START)
/*
*/

//#define	WK_SCENE_CAVE_D0501				(78+SVSCRWK_START)
/*
*/

//#define	WK_SCENE_WEATHER_CTRL			(79+SVSCRWK_START)
/*
*/

#define	WK_SCENE_C102_R0601				(80+SVSCRWK_START)
/*
01 クスノキ艦長イベント開始
02 クスノキ艦長イベント終了(潜水艇盗まれた)
*/

//#define	WK_SCENE_C102_R0602				(81+SVSCRWK_START)
/*
*/

#define	WK_SCENE_CAVE_D1111				(82+SVSCRWK_START)
/*
01 超古代ポケモンに初めて会う時のイベント終了
*/

#define	WK_SCENE_ROPEWAY				(83+SVSCRWK_START)
/*
01 下から上に行く
02 上から下に行く
*/

#define	WK_SCENE_SAFARI_ZONE			(84+SVSCRWK_START)
/*
01 サファリゾーン帰り中(r121_r0101)
02 サファリゾーン入る(park_safari04)
*/

#define	WK_SCENE_SHISEN					(85+SVSCRWK_START)
/*
00 カラクリ大王の視線メッセージを表示する
01 カラクリ大王の視線メッセージを表示しない
*/

#define	WK_SCENE_R110_R0101				(86+SVSCRWK_START)
/*
01 マップチェンジでマップが変わったときの処理実行
*/

#define	WK_KARAKURI_DAIOU				(87+SVSCRWK_START)
/*
00 カラクリ大王が隠れている
01 カラクリ大王がダンジョンにいる
02 カラクリ大王が仕掛けを作成中
03 カラクリ大王がいなくなった(旅立った）
04 カラクリ大王がいなくなった(通路を出た直後で、画面にいない仕掛け中）
*/

#define	WK_SCENE_CAVE_D0701				(88+SVSCRWK_START)
/*
01 敵のボスに勝利した
02 出口ポス終了
*/

#define	WK_SCENE_CYCLE_ROAD				(89+SVSCRWK_START)
/*
01 サイクリングロードスタート
02 計測開始
03 計測終了
*/

#define	WK_SCENE_C102_R0501				(90+SVSCRWK_START)
/*
01 入場料金を払った
*/

#define	WK_SCENE_R110_R0104				(91+SVSCRWK_START)
/*
00 あいことば未入手
01 あいことば入手
02 扉を開けた
*/

#define	WK_SCENE_R110_R0105				(92+SVSCRWK_START)
/*
00 あいことば未入手
01 あいことば入手
02 扉を開けた
*/

#define	WK_SCENE_R110_R0106				(93+SVSCRWK_START)
/*
00 あいことば未入手
01 あいことば入手
02 扉を開けた
*/

#define	WK_SCENE_R110_R0107				(94+SVSCRWK_START)
/*
00 あいことば未入手
01 あいことば入手
02 扉を開けた
*/

#define	WK_SCENE_R110_R0108				(95+SVSCRWK_START)
/*
00 あいことば未入手
01 あいことば入手
02 扉を開けた
*/

#define	WK_SCENE_R110_R0109				(96+SVSCRWK_START)
/*
00 あいことば未入手
01 あいことば入手
02 扉を開けた
*/

#define	WK_SCENE_R110_R0110				(97+SVSCRWK_START)
/*
00 あいことば未入手
01 あいことば入手
02 扉を開けた
*/

#define	WK_SCENE_R110_R0111				(98+SVSCRWK_START)
/*
00 あいことば未入手
01 あいことば入手
02 扉を開けた
*/

#define	WK_SCENE_R119_TENKI				(99+SVSCRWK_START)
/*
01 解放
02 解放後、助手の位置を変更した
*/

#define	WK_SCENE_SP_SHIP01				(100+SVSCRWK_START)
/*
01 カイナから乗った
02 ミナモから乗った
03 カイナから乗って到着
04 ミナモから乗って到着
*/

#define	WK_SCENE_R110_R0103				(101+SVSCRWK_START)
/*
01 通路を通った
*/

#define	WK_SCENE_02_R110_R0110			(102+SVSCRWK_START)
/*
01 マップチェンジでマップが変わったときの処理実行
*/

#define	WK_SCENE_01_C102_R0401			(103+SVSCRWK_START)
/*
00 初めて会長に会った
01 ２回目以降
02 すべてのアイテム入手後
*/

//#define	WK_SCENE_PARK_KOKORO01		(104+SVSCRWK_START)
/*
*/

#define	WK_SCENE_CAVE_D0808			(105+SVSCRWK_START)
/*
01 マグマ団逃げ出す
02 マツブサがいる
03 マツブサが去っていく
*/

#define	WK_SCENE_CAVE_D1602			(106+SVSCRWK_START)
/*
01 扉を開けた
02 発電機のスイッチを踏んだ
*/

#define	WK_FUTAGO_01_FIELD_R104		(107+SVSCRWK_START)
/*
00 戦闘前
01 左に退いた
02 右に退いた
*/

#define	WK_SCENE_BATTLE_TOWER		(108+SVSCRWK_START)
/*
00 何もしてない
01 バトルタワーで遊んだ
*/

#define	WK_SCENE_CAVE_D0702			(109+SVSCRWK_START)
/*
01 でこぼこ山で火山灰を降らす(ロープウェイ側から降りてきた)
*/

#define	WK_SCENE_R113_R0101			(110+SVSCRWK_START)
/*
01 「はいぶくろ」入手
02 一度マップアウトした
10 あおいビードロ貰える状態
11 きいろビードロ貰える状態
12 あかいビードロ貰える状態
13 しろいビードロ貰える状態
14 くろいビードロ貰える状態
15 ガラスのいす貰える状態
16 ガラスのつくえ貰える状態
*/

#define	WK_SCENE_CAVE_D0101			(111+SVSCRWK_START)
/*
01 流星の洞窟イベント終了
*/

#define	WK_SCENE_TR_HOUSE			(112+SVSCRWK_START)
/*
01 対戦した(勝った)
02 対戦した(負けた)
03 対戦した(引き分け)
*/

#define	WK_SCENE_R110_R0102				(113+SVSCRWK_START)
/*
01 アイテムを貰っていないで出た状態
*/

#define	WK_SCENE_T107_R0201				(114+SVSCRWK_START)
/*
00 一週間たった
01 - 07後にアイテムを貰える
*/

#define	WK_SCENE_CAVE_D1301				(115+SVSCRWK_START)
/*
01 ミツルと対戦した
*/

#define	WK_SCENE_C104_R0102				(116+SVSCRWK_START)
/*
00 カセキを預けていない
01 カセキを預けた(再生前)
02 カセキを預けた(再生後)
*/

#define	WK_KASEKI_TYPE					(117+SVSCRWK_START)
/*
01 カセキ
02 タイコ
*/

#define	WK_SCENE_C107_R0501				(118+SVSCRWK_START)
/*
01 ダイゴに「ダイビング」もらう
*/

#define	WK_SCENE_02_FIELD_T102			(119+SVSCRWK_START)
/*
00 まだサポートイベント前
01 サポート待機
02 サポートイベント終了
*/

#endif /* SAVEWORK_H */

