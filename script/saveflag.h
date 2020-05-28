//======================================================================
//
//	ゲーム内セーブフラグ定義
//
//
//	2001_09_05	GAME FREAK Inc.
//======================================================================

#ifndef SAVEFLAG_H
#define SAVEFLAG_H

//----------------------------------------------------------------------
//	汎用フラグ			//ev_check.cでid=0は無効になっている
//----------------------------------------------------------------------
#define	FH_00							1
#define	FH_01							2
#define	FH_02							3
#define	FH_03							4
#define	FH_04							5
#define	FH_05							6
#define	FH_06							7
#define	FH_07							8
#define FH_08							9
#define FH_09							10
#define FH_10							11
#define FH_11							12
#define FH_12							13
#define FH_13							14
#define FH_14							15
#define FH_15							16

//マップ遷移のタイミングで元に戻るOBJのflagに使用する(MapEdit)
//「いあいぎり」で切れる木など
#define	FH_OBJ00						17
#define	FH_OBJ01						18
#define	FH_OBJ02						19
#define	FH_OBJ03						20
#define	FH_OBJ04						21
#define	FH_OBJ05						22
#define	FH_OBJ06						23
#define	FH_OBJ07						24
#define	FH_OBJ08						25
#define	FH_OBJ09						26
#define	FH_OBJ10						27
#define	FH_OBJ11						28
#define	FH_OBJ12						29
#define	FH_OBJ13						30
#define	FH_OBJ14						31
#define	FH_OBJ15						32

//----------------------------------------------------------------------
//	イベント進行制御フラグ
//
//	(FE_FLAG_START - FH_FLAG_START)
//	(     80       -    600      )
//----------------------------------------------------------------------
#define FE_FLAG_START					(80)

#define FE_MAMA_01_P01_T101_R0101		(FE_FLAG_START+0)	//お母さんと一度会話した
#define FE_CLOCK_SET					(FE_FLAG_START+1)	//時刻設定したか
#define FE_ODAMAKI_01_P01_T101_R0301	(FE_FLAG_START+2)	//ポケモンもらったか？

#define FE_BASHA_01_P01_FIELD_C101		(FE_FLAG_START+3)	//ミツル母と会話した
#define FE_BASHA_01_P02_FIELD_C101		(FE_FLAG_START+4)	//ミツルと会話した
#define FE_PAPA_01_P01_C101_R0201		(FE_FLAG_START+5)	//お父さんとの始めての会話
#define FE_BALL_01_P01_SP_CONTEST		(FE_FLAG_START+6)	//モンスターボール

#define FE_WOMAN2_01_P01_T101_R0201		(FE_FLAG_START+7)	//オダマキの妻
#define FE_STUDYM1_01_P01_T101_R0301	(FE_FLAG_START+8)	//オダマキの助手１
#define FE_WORKERM1_01_C103_R0201		(FE_FLAG_START+9)	//カゼノと一度会話した

#define FE_CYCLE_01_P01_C103_R0201		(FE_FLAG_START+10)	//自転車入手
#define FE_SCOOP_01_P01_FIELD_R115		(FE_FLAG_START+11)	//スコップ入手
#define FE_ROPE_01_P01_FIELD_R114		(FE_FLAG_START+12)	//ロープ入手
#define FE_KAMA_01_P01_FIELD_R119		(FE_FLAG_START+13)	//カマ入手
#define FE_ZYOURO_GET					(FE_FLAG_START+14)	//ジョウロ入手
#define FE_CUBECASE_GET					(FE_FLAG_START+15)	//キューブケース入手
#define FE_HIMITSU_GET					(FE_FLAG_START+16)	//ひみつのちから入手(技ナンバーがまだなので)

#define FE_HOKAKUDEMO_01_P01_FIELD_R102	(FE_FLAG_START+17)	//捕獲デモ
#define FE_SCHOOLM1_01_P01_FIELD_C103	(FE_FLAG_START+18)	//TV起動OBJ
#define FE_GYM03_DOOR					(FE_FLAG_START+19)	//キンセツジムのドアの状態
#define FE_GYM07_SWITCH_01				(FE_FLAG_START+20)	//トクサネジムのスイッチの状態
#define FE_GYM07_SWITCH_02				(FE_FLAG_START+21)	//トクサネジムのスイッチの状態
#define FE_GYM07_SWITCH_03				(FE_FLAG_START+22)	//トクサネジムのスイッチの状態
#define FE_GYM07_SWITCH_04				(FE_FLAG_START+23)	//トクサネジムのスイッチの状態

//#define FE_LETTER_POKE_01_C101_PC01	(FE_FLAG_START+24)	//ポケモンアンケート
#define FE_LETTER_RECENTLY_01			(FE_FLAG_START+25)	//最近の出来事

#define FE_HWAZA04_01_T106_R0201		(FE_FLAG_START+26)	//かいりき04を貰った
#define FE_HWAZA06_01_C103_R0301		(FE_FLAG_START+27)	//いわくくだき06を貰った
#define FE_MITSURU_01_T106_R0201		(FE_FLAG_START+28)	//療養所のミツルがいなくなった
#define FE_HWAZA05_01_CAVE_D0502		(FE_FLAG_START+29)	//フラッシュ05を貰った
#define FE_HWAZA02_01_FIELD_R119		(FE_FLAG_START+30)	//そらをとぶ02を貰った
#define FE_AKUA_01_CAVE_D0901			(FE_FLAG_START+31)	//見張り話した(ミナモアジト)
#define FE_AKUA_01_CAVE_D0903			(FE_FLAG_START+32)	//中ボス倒した(ミナモアジト)
#define FE_POKE1_01_CAVE_D1206			(FE_FLAG_START+33)	//古代ポケモンイベント終了
#define FE_FREAK1_01_R114_R0102			(FE_FLAG_START+34)	//化石マニアイベント終了
#define FE_INSEKI_GET					(FE_FLAG_START+35)	//「いんせき」入手
#define FE_MONSBALL_GET					(FE_FLAG_START+36)	//モンスターボールを貰った(ミシロ)
#define FE_BIGMAN1_01_T107_R0201		(FE_FLAG_START+37)	//アイテム貰った(キナギ)
#define FE_WOMAN1_01_C105_R0301			(FE_FLAG_START+38)	//アイテム貰った(ヒワマキ)
#define FE_WOMAN1_01_C107_R0401			(FE_FLAG_START+39)	//アイテム貰った(トクサネ)
//#define FE_TRAINERM1_01_C105_R0101		(FE_FLAG_START+40)	//アイテム貰った(ヒワマキ)
#define FE_FIGHTER1_01_C108_R0201		(FE_FLAG_START+41)	//アイテム貰った(ルネ)
#define FE_HWAZA03_GET					(FE_FLAG_START+42)	//なみのり03を貰った
#define FE_HWAZA08_GET					(FE_FLAG_START+43)	//ダイビング08を貰った
//#define FE_KUSUNOKI_01_FIELD_C102		(FE_FLAG_START+44)	//カイナ潜水艇イベント終了
#define FE_LEADER08_01_FIELD_C108		(FE_FLAG_START+45)	//ミクリ案内した
#define FE_MITSURU_01_CAVE_D1301		(FE_FLAG_START+46)	//ミツルに勝利した
#define FE_WOMAN1_01_R104_R0201			(FE_FLAG_START+47)	//長女(花屋)
#define FE_GIRL1_01_R104_R0201			(FE_FLAG_START+48)	//三女(花屋)
#define FE_POKE1_01_CAVE_D1111			(FE_FLAG_START+49)	//不思議な洞窟でイベント見た
#define FE_SUPPORT_01_FIELD_R103		(FE_FLAG_START+50)	//サポートに勝利した(ロード１０３)
#define FE_MAYUMI_01_R114_R0201			(FE_FLAG_START+51)	//マユミと会話した(ロード１１４)
#define FE_BOY4_01_FIELD_T102			(FE_FLAG_START+52)	//アイテム貰った(コトキ)
#define FE_OMAMORIKOBAN_GET				(FE_FLAG_START+53)	//「おまもりこばん」入手
#define FE_SODATE_TAMAGO				(FE_FLAG_START+54)	//育て屋じいさん「たまご」できた
#define FE_MIDDLEM2_01_C101_R0101		(FE_FLAG_START+55)	//ミツル父と会話した
#define FE_HAIBUKURO_GET				(FE_FLAG_START+56)	//「はいぶくろ」入手
#define FE_HWAZA01_GET					(FE_FLAG_START+57)	//いあいぎり01を貰った
#define FE_BOY1_01_R116_R0101			(FE_FLAG_START+58)	//？？を貰った
#define FE_BOSS_01_CAVE_D0701			(FE_FLAG_START+59)	//えんとつ山で敵のボスを倒した
#define FE_ITEM_01_R109_R0101			(FE_FLAG_START+60)	//海の家でアイテムもらった
#define FE_WIN_01_R109_R0101			(FE_FLAG_START+61)	//海の家でトレーナー全員に勝利した
#define FE_DEBON_01_FIELD_C104			(FE_FLAG_START+62)	//盗難イベント中
#define FE_DEBON_02_FIELD_C104			(FE_FLAG_START+63)	//盗難イベント終了
#define FE_DEBON_NIMOTSU_RETURN			(FE_FLAG_START+64)	//デボンの荷物を返している
#define FE_DEBON_NIMOTSU_GET			(FE_FLAG_START+65)	//デボンのにもつを手に入れた
//#define FE_DEBON_NIMOTSU_RETURN			(FE_FLAG_START+66)	//デボンのにもつを渡した
#define FE_HAGI_01_R104_R0101			(FE_FLAG_START+67)	//ハギと一度話した
#define FE_MIDDLEM1_01_C102_R0101		(FE_FLAG_START+68)	//ツガと一度話した
#define FE_AQUA_01_C102_R0502			(FE_FLAG_START+69)	//造船所のアクア団イベント終了(+デボンの荷物を渡した)
#define FE_KONTESUTOPASU_GET			(FE_FLAG_START+70)	//コンテストパスを貰った
#define FE_POKE_GET_R119_R0101			(FE_FLAG_START+71)	//お天気研究所でポケモンゲット
#define FE_SUGOITURIZAO_GET				(FE_FLAG_START+72)	//すごいつりざおゲット
#define FE_KOUKAN_01					(FE_FLAG_START+73)	//交換フラグ１
#define FE_KOUKAN_02					(FE_FLAG_START+74)	//交換フラグ２
#define FE_KOUKAN_03					(FE_FLAG_START+75)	//交換フラグ３
//#define FE_HYOUKA_GET_ITEM01			(FE_FLAG_START+76)	//評価アイテム
//#define FE_HYOUKA_GET_ITEM02			(FE_FLAG_START+77)	//評価アイテム
//#define FE_HYOUKA_GET_ITEM03			(FE_FLAG_START+78)	//評価アイテム
#define FE_WORKERM1_04_FIELD_C104		(FE_FLAG_START+79)	//会話した

#define FE_PICTURE_01_C106_R0202		(FE_FLAG_START+80)	//かっこいい絵飾った
#define FE_PICTURE_02_C106_R0202		(FE_FLAG_START+81)	//うつくしい絵飾った
#define FE_PICTURE_03_C106_R0202		(FE_FLAG_START+82)	//かわいい絵飾った
#define FE_PICTURE_04_C106_R0202		(FE_FLAG_START+83)	//かしこい絵飾った
#define FE_PICTURE_05_C106_R0202		(FE_FLAG_START+84)	//たくましい絵飾った

#define FE_WAZAM_01_C104_R0201			(FE_FLAG_START+85)	//技マシン？？
#define FE_WAZAM_01_T103_R0201			(FE_FLAG_START+86)	//技マシン？？
#define FE_WAZAM_01_C103_R0101			(FE_FLAG_START+87)	//技マシン？？
#define FE_WAZAM_01_T104_R0201			(FE_FLAG_START+88)	//技マシン？？
#define FE_WAZAM_01_C101_R0201			(FE_FLAG_START+89)	//技マシン？？
#define FE_WAZAM_01_C105_R0201			(FE_FLAG_START+90)	//技マシン？？
#define FE_WAZAM_01_C107_R0101			(FE_FLAG_START+91)	//技マシン？？
#define FE_WAZAM_01_C108_R0101			(FE_FLAG_START+92)	//技マシン？？

#define FE_BASE_CHAR_FLAG				(FE_FLAG_START+93)	//お留守番キャラ
#define FE_BASE_GOODS_FLAG01			(FE_FLAG_START+94)	//グッズ01
#define FE_BASE_GOODS_FLAG02			(FE_FLAG_START+95)	//
#define FE_BASE_GOODS_FLAG03			(FE_FLAG_START+96)	//
#define FE_BASE_GOODS_FLAG04			(FE_FLAG_START+97)	//
#define FE_BASE_GOODS_FLAG05			(FE_FLAG_START+98)	//
#define FE_BASE_GOODS_FLAG06			(FE_FLAG_START+99)	//
#define FE_BASE_GOODS_FLAG07			(FE_FLAG_START+100)	//
#define FE_BASE_GOODS_FLAG08			(FE_FLAG_START+101)	//
#define FE_BASE_GOODS_FLAG09			(FE_FLAG_START+102)	//
#define FE_BASE_GOODS_FLAG10			(FE_FLAG_START+103)	//
#define FE_BASE_GOODS_FLAG11			(FE_FLAG_START+104)	//
#define FE_BASE_GOODS_FLAG12			(FE_FLAG_START+105)	//
#define FE_BASE_GOODS_FLAG13			(FE_FLAG_START+106)	//
#define FE_BASE_GOODS_FLAG14			(FE_FLAG_START+107)	//グッズ14

#define FE_POKEGEAR_GET					(FE_FLAG_START+108)	//「トレナビ」入手
#define FE_TEGAMI_CLEAR					(FE_FLAG_START+109)	//手紙イベントクリア
#define FE_MITSURU_02_FIELD_C103		(FE_FLAG_START+110)	//キンセツのミツルがシダケに向かった
#define FE_WOMAN1_01_T106_R0201			(FE_FLAG_START+111)	//一度話した
#define FE_TUKINOISI_GET				(FE_FLAG_START+112)	//「つきのいし」入手
#define FE_MITSURU_02_T106_R0201		(FE_FLAG_START+113)	//親戚の家でミツルと話した

#define FE_KARAKURI10_SWITCH_01			(FE_FLAG_START+114)	//カラクリ屋敷マップ１０の矢印面のスイッチ１
#define FE_KARAKURI10_SWITCH_02			(FE_FLAG_START+115)	//カラクリ屋敷マップ１０の矢印面のスイッチ２
#define FE_KARAKURI10_SWITCH_03			(FE_FLAG_START+116)	//カラクリ屋敷マップ１０の矢印面のスイッチ３
#define FE_KARAKURI10_SWITCH_04			(FE_FLAG_START+117)	//カラクリ屋敷マップ１０の矢印面のスイッチ４
#define FE_KARAKURI10_SWITCH_05			(FE_FLAG_START+118)	//カラクリ屋敷マップ１０の矢印面のスイッチ５

#define FE_KANASIDA_GO					(FE_FLAG_START+119)	//カナシダトンネル開通した

#define	FE_DAISUKI_GOODS_FLAG01			(FE_FLAG_START+120)	//かっこよさアイテム
#define	FE_DAISUKI_GOODS_FLAG02			(FE_FLAG_START+121)	//うつくしさアイテム
#define	FE_DAISUKI_GOODS_FLAG03			(FE_FLAG_START+122)	//かわいさアイテム
#define	FE_DAISUKI_GOODS_FLAG04			(FE_FLAG_START+123)	//かしこさアイテム
#define	FE_DAISUKI_GOODS_FLAG05			(FE_FLAG_START+124)	//たくましさアイテム

#define	FE_MUGENNOTIKETTO_GET			(FE_FLAG_START+125)	//「むげんのチケット」入手
#define	FE_KOKORO_BATTLE				(FE_FLAG_START+126)	//南の孤島で戦闘した
//#define	FE_NEW_KINSETSU					(FE_FLAG_START+127)	//ニューキンセツイベントクリア
#define	FE_TIKANOKAGI_GET				(FE_FLAG_START+128)	//「ちかのカギ」入手
#define	FE_WAZAM24_GET					(FE_FLAG_START+129)	//「技マシン２４」入手
//#define	FE_HATSUDEN_SW					(FE_FLAG_START+130)	//発電スイッチ押した
//#define	FE_TIKANOKAGI_USE				(FE_FLAG_START+131)	//ちかのカギを使用した
#define	FE_TAMA_GET						(FE_FLAG_START+132)	//「べにいろ・あいいろのたま」入手

#define FE_PUREMIABOORU_GET				(FE_FLAG_START+133)	//「プレミアボール」入手

#define FE_SINKAI_ITEM_GET				(FE_FLAG_START+134)	//「しんかいのキバ」か「しんかいのうろこ」を入手

#define FE_BOY1_FESTA					(FE_FLAG_START+135)	//少年と話した(フェスタ)
#define FE_GIRL1_FESTA					(FE_FLAG_START+136)	//少女と話した(フェスタ)

#define FE_TREASURE_HUNTER				(FE_FLAG_START+137)	//と一度話した
#define FE_EVILM1_01_FIELD_C106			(FE_FLAG_START+138)	//アクア団と会話した
#define FE_MAGMABOSS_01_CAVE_D0701_TALK	(FE_FLAG_START+139)	//マグマ団ボスと会話した(えんとつ山)
#define FE_SORAISI_01_T105_R0201		(FE_FLAG_START+140)	//ソライシ博士と会話した

#define FE_GOOGURU_GET					(FE_FLAG_START+141)	//ゴーゴーゴーグル入手

#define FE_BOY3_01_C105_R0501			(FE_FLAG_START+142)	//鳥ポケモンが飛び立った(ヒワマキから)
#define FE_BOY3_02_C105_R0501			(FE_FLAG_START+143)	//アイテムを貰った
#define FE_POKE_01_C107_R0301			(FE_FLAG_START+144)	//鳥ポケモンが飛び立った(トクサネから)

#define FE_COIN_20_GET_C103_R0401		(FE_FLAG_START+145)	//コイン２０枚をゲット
#define FE_GOODS_GET_C103_R0401			(FE_FLAG_START+146)	//グッズをゲット

#define FE_IITURIZAO_GET				(FE_FLAG_START+147)	//いいつりざおゲット
#define FE_DENSETU_OPEN					(FE_FLAG_START+148)	//伝説洞窟開いたか

#define FE_WAZAM27_GET					(FE_FLAG_START+149)	//「技マシン２７」入手
#define FE_WAZAM36_GET					(FE_FLAG_START+150)	//「技マシン３６」入手
#define FE_WAZAM05_GET					(FE_FLAG_START+151)	//「技マシン０５」入手
#define FE_WAZAM19_GET					(FE_FLAG_START+152)	//「技マシン１９」入手
#define FE_WAZAM04_GET					(FE_FLAG_START+153)	//「技マシン０４」入手
#define FE_WAZAM44_GET					(FE_FLAG_START+154)	//「技マシン４４」入手
#define FE_WAZAM45_GET					(FE_FLAG_START+155)	//「技マシン４５」入手

#define FE_GOODS_GET_C106_R0202			(FE_FLAG_START+156)	//ガラスのオブジェ入手
#define FE_GINNOTATE_GET				(FE_FLAG_START+157)	//「ぎんのたて」入手
#define FE_KINNOTATE_GET				(FE_FLAG_START+158)	//「きんのたて」入手

#define FE_SOUKO_OPEN_CAVE_D1704		(FE_FLAG_START+159)	//そうこの扉を開けた(鍵を使った）

#define FE_DOOR_OPEN_01_CAVE_D1712		(FE_FLAG_START+160)	//１号室の扉を開けた(鍵を使った）
#define FE_DOOR_OPEN_02_CAVE_D1712		(FE_FLAG_START+161)	//２号室の扉を開けた(鍵を使った）
#define FE_DOOR_OPEN_04_CAVE_D1712		(FE_FLAG_START+162)	//４号室の扉を開けた(鍵を使った）
#define FE_DOOR_OPEN_06_CAVE_D1712		(FE_FLAG_START+163)	//６号室の扉を開けた(鍵を使った）

#define FE_SORAISI_01_CAVE_D0101		(FE_FLAG_START+164)	//ソライシ博士と会話した(流星の滝)
#define FE_HOERUKODOORU_GET				(FE_FLAG_START+165)	//「ホエルコドール」入手
#define FE_ORENNOMI_GET					(FE_FLAG_START+166)	//「オレンのみ」入手
#define FE_WIN_01_SP_SHIP01				(FE_FLAG_START+167)	//船の上で全員に勝利した

#define FE_KINOMI_A_GET					(FE_FLAG_START+168)	//木の実Ａ入手
#define FE_KINOMI_B_GET					(FE_FLAG_START+169)	//木の実Ｂ入手
#define FE_KINOMI_C_GET					(FE_FLAG_START+170)	//木の実Ｃ入手
#define FE_KINOMI_D_GET					(FE_FLAG_START+171)	//木の実Ｄ入手
#define FE_KINOMI_E_GET					(FE_FLAG_START+172)	//木の実Ｅ入手

#define FE_SIROISUKAAHU_GET				(FE_FLAG_START+173)	//白いスカーフゲット
#define FE_MOKUTAN_GET					(FE_FLAG_START+174)	//「もくたん」入手
#define FE_MOVE_POKE_WATCH				(FE_FLAG_START+175)	//移動ポケモンニュース見た
#define FE_SHOP_01_C104_FS01			(FE_FLAG_START+176)	//新型ボールの話を聞いた
#define FE_BORONOTURIZAO_GET			(FE_FLAG_START+177)	//「ボロのつりざお」入手
#define FE_KOINKEESU_GET				(FE_FLAG_START+178)	//「コインケース」入手
#define FE_OLDWOMAN1_01_CAVE_D0808		(FE_FLAG_START+179)	//たまを返した
#define FE_WAZAM49_GET					(FE_FLAG_START+180)	//「技マシン４９」入手
#define FE_WAZAM28_GET					(FE_FLAG_START+181)	//「技マシン２８」入手
#define FE_WAZAM09_GET					(FE_FLAG_START+182)	//「技マシン０９」入手

#define FE_TRAINERM1_01_C109_R0206		(FE_FLAG_START+183)	//ポケモンリーグのストッパー解除

#define FE_WAZAM10_GET					(FE_FLAG_START+184)	//「技マシン１０」入手
#define FE_WAZAM41_GET					(FE_FLAG_START+185)	//「技マシン４１」入手

#define FE_SOONANO_TAMAGO_GET			(FE_FLAG_START+186)	//ソーナノのタマゴ入手
#define FE_KASEKI_RETURN				(FE_FLAG_START+187)	//「カセキ」を再生させた

#define FE_BASE_ENTRY					(FE_FLAG_START+188)	//秘密基地を登録した

#define FE_WAZAM46_GET					(FE_FLAG_START+189)	//「技マシン４６」入手

#define FE_CONTEST_SUPER_WIN			(FE_FLAG_START+190)	//スーパーランク優勝
#define FE_KUSUNOKI_01_C102_R0601		(FE_FLAG_START+191)	//クスノキ艦長(船乗り場)
#define FE_GAKUSYUUSOUTI_GET			(FE_FLAG_START+192)	//「がくしゅうそうち」入手
#define FE_PC_POKERUS					(FE_FLAG_START+193)	//ポケルスに初めて感染した

#define FE_DASH_SHOES_GET				(FE_FLAG_START+194)	//ダッシュシューズ入手
#define FE_SENSEINOTUME_GET				(FE_FLAG_START+195)	//「せんせいのつめ」入手
#define FE_OUZYANOSIRUSI_GET			(FE_FLAG_START+196)	//「おうじゃのしるし」入手
#define FE_KYOUSEIGIBUSU_GET			(FE_FLAG_START+197)	//「きょうせいギブス」入手
#define FE_YASURAGINOSUZU_GET			(FE_FLAG_START+198)	//「やすらぎのスズ」入手
#define FE_SIROIHAABU_GET				(FE_FLAG_START+199)	//「しろいハーブ」入手
#define FE_YAWARAKAISUNA_GET			(FE_FLAG_START+200)	//「やわらかいすな」入手
#define FE_KAKURE_01_FIELD_R120			(FE_FLAG_START+201)	//カクレオンと話した
#define FE_KIYOMENOOHUDA_GET			(FE_FLAG_START+202)	//「きよめのおふだ」入手
#define FE_KIAINOHATIMAKI_GET			(FE_FLAG_START+203)	//「きあいのはちまき」入手
#define FE_MITSURU_01_FIELD_C103		(FE_FLAG_START+204)	//ミツルと一度話した
#define FE_DEBONSUKOOPU_GET				(FE_FLAG_START+205)	//「デボンスコープ」入手
#define FE_SUPPORT_01_FIELD_C106		(FE_FLAG_START+206)	//サポートと会話した

#define FE_WORKERM1_01_FIELD_R116		(FE_FLAG_START+207)	//デボン社員と一度会話した
#define FE_SUPPORT_01_FIELD_C104		(FE_FLAG_START+208)	//サポートと一度会話した
#define FE_SIRUKUNOSUKAAHU_GET			(FE_FLAG_START+209)	//「シルクのスカーフ」入手

#define FE_DEBON_01_FIELD_R120			(FE_FLAG_START+210)	//120番道路でデボンと一度会話した
#define FE_HUNENOTIKETTO_GET			(FE_FLAG_START+211)	//「ふねのチケット」入手
#define FE_SUPPORT_02_FIELD_C106		(FE_FLAG_START+212)	//ミナモのサポートイベント終了
#define FE_SUPPORT_01_T101_R0202		(FE_FLAG_START+213)	//自宅でサポートと会話した(ミナモ後)
#define FE_TANTIKI_RETURN				(FE_FLAG_START+214)	//探知機を返した
#define FE_KAKURE_01_FIELD_C105			(FE_FLAG_START+215)	//ヒワマキのカクレオンイベント終了
#define FE_BATCH_04_GET					(FE_FLAG_START+216)	//バッチを４つ持っている
#define FE_KISEKINOTANE_GET				(FE_FLAG_START+217)	//「きせきのタネ」入手
#define FE_POKE1_01_C107_R0501			(FE_FLAG_START+218)	//「ダンバル」ゲット
#define FE_WAZA_GET_T107_R0201			(FE_FLAG_START+219)	//「技マシン２１・２７」入手
#define FE_GENTLEM1_01_T107_R0201		(FE_FLAG_START+220)	//会話した
#define FE_SMAMA_01_T101_R0201			(FE_FLAG_START+221)	//サポート母のメッセージを変更する
#define FE_HWAZA08_TALK_GET				(FE_FLAG_START+222)	//ダイゴから直接「秘伝マシン」をもらった


//----------------------------------------------------------------------
//	隠しアイテム用
//
//	(FH_FLAG_START - FV_FLAG_START)
//	(    600       -    700      )
//----------------------------------------------------------------------
#define FH_FLAG_START					(600)


//----------------------------------------------------------------------
//	バニッシュフラグ
//
//	(FV_FLAG_START - FT_FLAG_START)
//	(    700       -    1200      )
//----------------------------------------------------------------------
#define FV_FLAG_START					(700)

#define FV_BAG1_01_FIELD_R101			(FV_FLAG_START+0)	//オダマキのリュック
//#define FV_CONTEST_00_T105_R0102		(FV_FLAG_START+4)	//コンテストのキャラ全員
//#define FV_CONTEST_01_C106_R0302		(FV_FLAG_START+5)	//コンテストのキャラ01
//#define FV_CONTEST_02_C106_R0302		(FV_FLAG_START+6)	//コンテストのキャラ02
//#define FV_CONTEST_03_C106_R0302		(FV_FLAG_START+7)	//コンテストのキャラ03
//#define FV_CONTEST_04_C106_R0302		(FV_FLAG_START+8)	//コンテストのキャラ04

#define FV_RECEPTION01_01_SP_PC02		(FV_FLAG_START+9)	//PC２階受け付け
#define FV_RECEPTION01_02_SP_PC02		(FV_FLAG_START+10)	//PC２階受け付け
#define FV_RECEPTION02_01_SP_PC02		(FV_FLAG_START+11)	//PC２階受け付け
#define FV_RECEPTION02_02_SP_PC02		(FV_FLAG_START+12)	//PC２階受け付け
#define FV_RECEPTION03_01_SP_PC02		(FV_FLAG_START+13)	//PC２階受け付け
#define FV_RECEPTION03_02_SP_PC02		(FV_FLAG_START+14)	//PC２階受け付け

#define FV_ODAMAKI_01_FIELD_R101		(FV_FLAG_START+20)	//オダマキ(ロード１０１)
#define FV_ODAMAKI_01_T101_R0301		(FV_FLAG_START+21)	//オダマキ(研究所)
#define FV_SUPPORTW_01_T101_R0202		(FV_FLAG_START+22)	//オダマキ娘(２階)
#define FV_SUPPORT_01_FIELD_R103		(FV_FLAG_START+23)	//サポート(ロード１０３)
#define FV_WORKERM1_01_CAVE_D0601		(FV_FLAG_START+24)	//トレナビくれる人
#define FV_SEAMAN1_01_CAVE_D0601		(FV_FLAG_START+25)	//マリン団(↑のイベント)
#define FV_MITSURU_01_FIELD_C101		(FV_FLAG_START+26)	//ミツル
#define FV_NOTE_01_C107_R0501			(FV_FLAG_START+27)	//ダイゴのノート
#define FV_WOMAN2_01_FIELD_C101			(FV_FLAG_START+28)	//ミツルのお母さん
//#define FV_SEAMAN1_01_FIELD_C104		(FV_FLAG_START+30)	//マリン団１(ポケモン盗難事件)
#define FV_SEAMAN1_02_FIELD_C104		(FV_FLAG_START+31)	//マリン団２(ポケモン盗難事件)
#define FV_WORKERM1_04_FIELD_C104		(FV_FLAG_START+32)	//社員(ポケモン盗難事件)
#define FV_POKE1_02_CAVE_D1111			(FV_FLAG_START+33)	//超古代ポケモンシルエット(海底洞窟)
#define FV_SENRI_01_T101_R0101			(FV_FLAG_START+34)	//センリ(自宅)
//#define FV_WORKERM1_01_FIELD_C104		(FV_FLAG_START+35)	//カナズミストッパー
//#define FV_WORKERM1_02_FIELD_C104		(FV_FLAG_START+36)	//カナズミストッパー
#define FV_POKE1_01_CAVE_D0601			(FV_FLAG_START+37)	//ハギ老人のポケモン
#define FV_HAGI_01_FIELD_R104			(FV_FLAG_START+38)	//ハギ老人
#define FV_HAGI_01_R104_R0101			(FV_FLAG_START+39)	//ハギ老人(小屋)
#define FV_HAGI_01_FIELD_T103			(FV_FLAG_START+40)	//ハギ老人(ムロ)
#define FV_HAGI_01_FIELD_R109			(FV_FLAG_START+41)	//ハギ老人(ロード１０９)
#define FV_FUNE_01_FIELD_R104			(FV_FLAG_START+42)	//渡し船(ロード１０４)
#define FV_FUNE_01_FIELD_T103			(FV_FLAG_START+43)	//渡し船(ムロ)
#define FV_FUNE_01_FIELD_R109			(FV_FLAG_START+44)	//渡し船(ロード１０９)
//#define FV_DEVON1_01_FIELD_C104		(FV_FLAG_START+45)	//カナズミストッパー(移動後)
//#define FV_DEVON1_02_FIELD_C104		(FV_FLAG_START+46)	//カナズミストッパー(移動後)
#define FV_EVILM1_01_CAVE_D0601			(FV_FLAG_START+47)	//アクア団
#define FV_POKE1_02_CAVE_D0601			(FV_FLAG_START+48)	//ハギ老人のポケモン(小さな洞窟)
#define FV_EVILM1_02_CAVE_D0601			(FV_FLAG_START+49)	//アクア団(小さな洞窟)
#define FV_POKE1_01_FIELD_R101			(FV_FLAG_START+50)	//オダマキ博士追いかけるポケモン
#define FV_MITSURU_02_CAVE_D1301		(FV_FLAG_START+51)	//ミツル(チャンピオンロード)
#define FV_MAMA_01_FIELD_T101			(FV_FLAG_START+52)	//引越し中のお母さん(男の子)
#define FV_PAPA_01_OPENING_ROOM01		(FV_FLAG_START+53)	//父ストッパーの位置
#define FV_POKE1_01_OPENING_ROOM01		(FV_FLAG_START+54)	//引越し手伝いポケモン(１階)
#define FV_POKE1_02_OPENING_ROOM01		(FV_FLAG_START+55)	//引越し手伝いポケモン(１階)
#define FV_PAPA_02_OPENING_ROOM01		(FV_FLAG_START+56)	//父仕事に出掛ける
#define FV_MAMA_01_OPENING_ROOM02		(FV_FLAG_START+57)	//引越し手伝いポケモン(２階)
#define FV_MAMA_01_T101_R0101			(FV_FLAG_START+58)	//母(男の子の家)
#define FV_MAMA_01_T101_R0201			(FV_FLAG_START+59)	//母(女の子の家)
#define FV_SUPPORTM_01_T101_R0102		(FV_FLAG_START+60)	//オダマキ息子(２階)
#define FV_TRUCK1_01_FIELD_T101			(FV_FLAG_START+61)	//引越しトラック
#define FV_TRUCK1_02_FIELD_T101			(FV_FLAG_START+62)	//引越しトラック
//#define FV_LETTER_GYM_01_FIELD_C104		(FV_FLAG_START+63)	//カナズミ
//#define FV_INTERVIEW_01_C101_PC01		(FV_FLAG_START+64)	//トウカpcインタビューの人
//#define FV_INTERVIEW_01_C102_PC01		(FV_FLAG_START+65)	//カイナpcインタビューの人
//#define FV_INTERVIEW_01_C103_PC01		(FV_FLAG_START+66)	//キンセツpcインタビューの人
//#define FV_INTERVIEW_01_C104_PC01		(FV_FLAG_START+67)	//カナズミpcインタビューの人
#define FV_MIDDLEM1_01_FIELD_R111		(FV_FLAG_START+68)	//バトル一家
#define FV_MIDDLEW1_01_FIELD_R111		(FV_FLAG_START+69)	//バトル一家
#define FV_SCHOOLW1_01_FIELD_R111		(FV_FLAG_START+70)	//バトル一家
#define FV_OLDWOMAN1_01_FIELD_R111		(FV_FLAG_START+71)	//バトル一家
#define FV_PAPA_01_C101_R0201			(FV_FLAG_START+72)	//ジムお父さん
#define FV_POKE1_01_CAVE_D2308			(FV_FLAG_START+73)	//タイクーン
#define FV_ARTIST_01_C106_R0301			(FV_FLAG_START+74)	//コンテストの絵描き
#define FV_GENTLEM1_01_C106_R0201		(FV_FLAG_START+75)	//美術館の館長
#define FV_GALLERY_01_C106_R0201		(FV_FLAG_START+76)	//美術館の客（ステップ１）
#define FV_GALLERY_02_C106_R0201		(FV_FLAG_START+77)	//美術館の客（ステップ２）
#define FV_GALLERY_03_C106_R0201		(FV_FLAG_START+78)	//美術館の客（ステップ３）
#define FV_GALLERY_04_C106_R0201		(FV_FLAG_START+79)	//美術館の客（ステップ４）
#define FV_GALLERY_05_C106_R0201		(FV_FLAG_START+80)	//美術館の客（ステップ５）
#define FV_DANPEI_01_C101_R0201			(FV_FLAG_START+81)	//未来のチャンピォン言う人(トウカ)
#define FV_MAMA_02_T101_R0101			(FV_FLAG_START+82)	//母移動(男の子の家)
#define FV_MAMA_02_T101_R0201			(FV_FLAG_START+83)	//母移動(女の子の家)
#define FV_WOMAN2_01_T101_R0101			(FV_FLAG_START+84)	//隣の家のお母さん
#define FV_WOMAN2_01_T101_R0201			(FV_FLAG_START+85)	//隣の家のお母さん
//#define FV_BALL1_01_FIELD_R102			(FV_FLAG_START+86)	//きずぐすり
//#define FV_BALL1_01_FIELD_R116			(FV_FLAG_START+87)	//きずぐすり
//#define FV_BALL1_02_FIELD_R116			(FV_FLAG_START+88)	//きずぐすり
#define FV_FAN_01_C106_R0401			(FV_FLAG_START+89)	//ファン１
#define FV_FAN_02_C106_R0401			(FV_FLAG_START+90)	//ファン２
#define FV_FAN_03_C106_R0401			(FV_FLAG_START+91)	//ファン３
#define FV_FAN_04_C106_R0401			(FV_FLAG_START+92)	//ファン４
//#define FV_BALL1_01_CAVE_D0601			(FV_FLAG_START+93)	//きずぐすり
//#define FV_BALL1_02_CAVE_D0601			(FV_FLAG_START+94)	//きずぐすり
//#define FV_BALL1_03_CAVE_D0601			(FV_FLAG_START+95)	//きずぐすり
#define FV_INTERVW1_01_CAMERA			(FV_FLAG_START+96)	//インタビュアー＆カメラマン(r111)
#define FV_INTERVW1_02_CAMERA			(FV_FLAG_START+97)	//インタビュアー＆カメラマン(r118)
#define FV_INTERVW1_03_CAMERA			(FV_FLAG_START+98)	//インタビュアー＆カメラマン(r120)
#define FV_INTERVW1_04_CAMERA			(FV_FLAG_START+99)	//インタビュアー＆カメラマン(r111)
#define FV_INTERVM1_01_T105_R0101		(FV_FLAG_START+100)	//コンテスト後のインタビュー
#define FV_INTERVM1_01_T106_R0101		(FV_FLAG_START+101)	//コンテスト後のインタビュー
#define FV_INTERVM1_01_C106_R0301		(FV_FLAG_START+102)	//コンテスト後のインタビュー
#define FV_INTERVM1_01_C102_R0201		(FV_FLAG_START+103)	//コンテスト後のインタビュー
#define FV_MITSURU_01_FIELD_C103		(FV_FLAG_START+104)	//ミツル(キンセツジム前)
#define FV_MIDDLEM2_01_FIELD_C103		(FV_FLAG_START+105)	//伯父さん(キンセツジム前)
#define FV_MITSURU_01_T106_R0201		(FV_FLAG_START+106)	//ミツル(療養所)
#define FV_FIGHTER1_01_CAVE_D0201		(FV_FLAG_START+107)	//トンネル男(カナシダトンネル)
#define FV_FIGHTER1_01_T106_R0201		(FV_FLAG_START+108)	//トンネル男(療養所)
#define FV_MIDDLEM2_01_T106_R0201		(FV_FLAG_START+109)	//伯父さん(療養所)
#define FV_AKUA_01_CAVE_D0701			(FV_FLAG_START+110)	//アクア団(えんとつ山)
#define FV_MIDDLEM1_03_FIELD_C101		(FV_FLAG_START+111)	//ミツル父(ジム前)
#define FV_MIDDLEW1_03_FIELD_C101		(FV_FLAG_START+112)	//ミツル母(ジム前)
#define FV_FREAK1_01_FIELD_R116			(FV_FLAG_START+113)	//マニア(ロード１１６)
#define FV_SUPPORT_01_FIELD_C104		(FV_FLAG_START+114)	//サポート(カナズミ)
#define FV_LEADER08_01_C108_R0101		(FV_FLAG_START+115)	//ミクリ(ジム)
#define FV_LEADER08_01_FIELD_C108		(FV_FLAG_START+116)	//ミクリ(祭壇前)
//#define FV_BALL1_01_CAVE_D1205			(FV_FLAG_START+117)	//たきのぼり(秘伝マシン)
//#define FV_AKUA_01_R114_R0102			(FV_FLAG_START+118)	//アクア団(化石マニアの洞窟)
#define FV_AKUA_01_FIELD_R112			(FV_FLAG_START+119)	//アクア団(ロープウェイ前)
#define FV_MAGMA_01_FIELD_R112			(FV_FLAG_START+120)	//マグマ団(フエンへの見張り)
#define FV_AKUA_01_CAVE_D0901			(FV_FLAG_START+121)	//アクア団(アジト見張り)
#define FV_AKUA_02_CAVE_D0901			(FV_FLAG_START+122)	//アクア団(アジト見張り)
#define FV_KUSUNOKI_01_C102_R0102		(FV_FLAG_START+123)	//クスノキ艦長(造船所)
//#define FV_AKUA_01_CAVE_D1206			(FV_FLAG_START+124)	//アクア団(祭壇最深部)
#define FV_POKE1_01_CAVE_D1206			(FV_FLAG_START+125)	//古代ポケモン(祭壇最深部)
#define FV_FREAK1_01_R114_R0102			(FV_FLAG_START+126)	//化石マニア(洞窟内)
#define FV_FREAK1_01_R114_R0101			(FV_FLAG_START+127)	//化石マニア(部屋)
#define FV_AQUABOSS_01_CAVE_D1111		(FV_FLAG_START+128)	//アオギリ(不思議な洞窟)
#define FV_MAGMABOSS_01_CAVE_D1111		(FV_FLAG_START+129)	//マツブサ(不思議な洞窟)
//#define FV_AQUA_01_CAVE_D1111R			(FV_FLAG_START+130)	//部下(不思議な洞窟)
#define FV_MAGMA_01_CAVE_D1111S			(FV_FLAG_START+131)	//部下(不思議な洞窟)
//#define FV_BALL1_01_CAVE_D0503			(FV_FLAG_START+132)	//きずぐすり
#define FV_DAIGO_01_CAVE_D0504			(FV_FLAG_START+133)	//ダイゴ(ムロ洞窟)
#define FV_DAIGO_01_FIELD_R128			(FV_FLAG_START+134)	//ダイゴ(ロード１２８)
#define FV_CAMERA1_01_FIELD_C102		(FV_FLAG_START+135)	//カメラマン(カイナ)
#define FV_EVILM1_ALL_C106_R0801		(FV_FLAG_START+136)	//悪者(ミナモの部屋)
//#define FV_SEAMAN1_02_FIELD_C102		(FV_FLAG_START+137)	//船乗り(カイナ)
//#define FV_EVILM1_03_C106_R0801			(FV_FLAG_START+138)	//悪者(ミナモの部屋)
//#define FV_OLDMAN1_01_FIELD_C108		(FV_FLAG_START+139)	//ストッパー(祭壇前)
#define FV_KUSUNOKI_01_FIELD_C102		(FV_FLAG_START+140)	//クスノキ艦長(カイナ)
#define FV_KUSUNOKI_01_C102_R0601		(FV_FLAG_START+141)	//クスノキ艦長(船乗り場)
//#define FV_SEAMAN1_02_C102_R0601		(FV_FLAG_START+142)	//船乗り(船乗り場)
#define FV_INTERVW1_01_C102_R0601		(FV_FLAG_START+143)	//インタビュアー(船乗り場)
#define FV_CAMERA1_01_C102_R0601		(FV_FLAG_START+144)	//カメラマン(船乗り場)
#define FV_EVILM1_01_C102_R0601			(FV_FLAG_START+145)	//アクア団(船乗り場)
#define FV_AQUABOSS_01_C102_R0601		(FV_FLAG_START+146)	//アオギリ(船乗り場)
#define FV_HAGI_01_C102_R0601			(FV_FLAG_START+147)	//ハギ老人(船乗り場)
#define FV_SUBMARINE1_01_C102_R0601		(FV_FLAG_START+148)	//船(船乗り場)
#define FV_DOLL1_01_T101_R0202			(FV_FLAG_START+149)	//ドール(サポート女宅)
#define FV_FUNE_01_C102_R0601			(FV_FLAG_START+150)	//潜水艇(船乗り場)
#define FV_SUPPORT_01_FIELD_R119		(FV_FLAG_START+151)	//サポート(ロード１１９)
#define FV_EVILM1_ALL_FIELD_C106		(FV_FLAG_START+152)	//アクア団(ミナモ)
//#define FV_FS_ALL_C108_FS01				(FV_FLAG_START+153)	//ﾌﾚﾝﾄﾞﾘｼｮｯﾌﾟの客(ルネ)
#define FV_OBJ_ALL_FIELD_C108			(FV_FLAG_START+154)	//ルネのOBJ(ルネ)
#define FV_WORKERW2_01_FIELD_C108		(FV_FLAG_START+155)	//トレーナー(祭壇前)
#define FV_WORKERW2_02_FIELD_C108		(FV_FLAG_START+156)	//トレーナー(祭壇前)
//#define FV_MAGMA_01_CAVE_D1206			(FV_FLAG_START+157)	//マグマ団(祭壇最深部)
#define FV_MITSURU_01_CAVE_D1301		(FV_FLAG_START+158)	//ミツル(チャンピオンロード)
#define FV_POKE1_01_CAVE_D1111			(FV_FLAG_START+159)	//超古代ポケモン(不思議な洞窟)
#define FV_HISHIP1_01_C102_R0601		(FV_FLAG_START+160)	//高速船(カイナ～ミナモ間)
#define FV_HISHIP1_01_C106_R0501		(FV_FLAG_START+161)	//高速船(ミナモ～カイナ間)
//#define FV_MIDDLEM1_01_FIELD_C108		(FV_FLAG_START+162)	//ルネのOBJ(middlem1,woman2)
//#define FV_BALL1_01_CAVE_D0501			(FV_FLAG_START+163)	//あなぬけのひも
//#define FV_BALL1_01_CAVE_D0502			(FV_FLAG_START+164)	//きずぐすり
//#define FV_BALL1_01_FIELD_R115			(FV_FLAG_START+165)	//きずぐすり
#define FV_MITSURU_01_C101_R0201		(FV_FLAG_START+166)	//ミツル(トウカジム)
#define FV_MITSURU_01_FIELD_R102		(FV_FLAG_START+167)	//ミツル(ロード１０２)
#define FV_BIGMAN1_01_FIELD_T101		(FV_FLAG_START+168)	//ビッグマン(ミシロ)
#define FV_HAGI_01_C102_R0101			(FV_FLAG_START+169)	//ハギ(造船所)
#define FV_MAYUMI_01_R114_R0201			(FV_FLAG_START+170)	//マユミ(ロード１１４)
#define FV_MAYUMI_01_T105_PC01			(FV_FLAG_START+171)	//マユミ(シダケ)
#define FV_MIDDLEM1_01_R110_R0101		(FV_FLAG_START+172)	//カラクリ大王
//#define FV_AQUA_01_CAVE_D0701S			(FV_FLAG_START+173)	//アクア団(藍)
//#define FV_MAGMA_01_CAVE_D0701S			(FV_FLAG_START+174)	//マグマ団(藍)
//#define FV_AQUA_01_CAVE_D0701R			(FV_FLAG_START+175)	//アクア団(朱)
//#define FV_MAGMA_01_CAVE_D0701R			(FV_FLAG_START+176)	//マグマ団(朱)
#define FV_ALL_01_CAVE_D0701			(FV_FLAG_START+177)	//アクア、マグマ以外の人達
#define FV_AQUAM1_01_CAVE_D0201			(FV_FLAG_START+178)	//アクア団(カナシダトンネル)
#define FV_HAGI_01_CAVE_D0201			(FV_FLAG_START+179)	//ハギ(カナシダトンネル)
#define FV_POKEMON_01_CAVE_D0201		(FV_FLAG_START+180)	//ピーコ(カナシダトンネル)
#define FV_POKEMON_01_R104_R0101		(FV_FLAG_START+181)	//ピーコ(自宅)
#define FV_EVIL_ALL_FIELD_C102			(FV_FLAG_START+182)	//造船所前のアクア団達
#define FV_AQUA_ALL_C102_R0501			(FV_FLAG_START+183)	//造船所１階のアクア団達
#define FV_AQUAM1_01_C102_R0502			(FV_FLAG_START+184)	//造船所２階のアクア団
#define FV_AQUAM1_02_C102_R0502			(FV_FLAG_START+185)	//造船所２階のアクア団
#define FV_AQUABOSS_01_C102_R0502		(FV_FLAG_START+186)	//造船所２階のアクア団ボス
#define FV_KUSUNOKI_01_C102_R0502		(FV_FLAG_START+187)	//造船所２階のクスノキ
#define FV_BATTLE_TOWER_TRAINER			(FV_FLAG_START+188)	//バトルタワーの人
#define FV_SUPPORT_01_T101_R0301		(FV_FLAG_START+189)	//サポート(研究所)
#define FV_AQUA_ALL_FIELD_R119			(FV_FLAG_START+190)	//アクア団(ロード１１９)
#define FV_HAGI_01_FIELD_R116			(FV_FLAG_START+191)	//ハギ(ロード１１６)
#define FV_TENKI_01_R119_R0101			(FV_FLAG_START+192)	//研究者(１階)
#define FV_TENKI_01_R119_R0102			(FV_FLAG_START+193)	//研究者(２階)
#define FV_FIGHTER1_01_FIELD_R116		(FV_FLAG_START+194)	//トンネル男(ロード１１６)
#define FV_ARTIST_02_C106_R0301			(FV_FLAG_START+195)	//コンテストの絵描き:通信
#define FV_ODAMAKI_HYOUKA_T101_R0301	(FV_FLAG_START+196)	//図鑑評価オダマキ(研究所)
#define FV_ODAMAKI_HYOUKA_FIELD_R101	(FV_FLAG_START+197)	//図鑑評価オダマキ(ロード１０１)
#define FV_ODAMAKI_HYOUKA_FIELD_R103	(FV_FLAG_START+198)	//図鑑評価オダマキ(ロード１０３)
#define FV_MIDDLEM1_01_R110_R0102		(FV_FLAG_START+199)	//カラクリ大王(奥の間）
#define FV_EVIL_ALL_FIELD_R110			(FV_FLAG_START+200)	//アクア団(ロード１１０)
#define FV_INTERVW1_05_CAMERA			(FV_FLAG_START+201)	//インタビュアー＆カメラマン(r118)
#define FV_INTERVW1_06_CAMERA			(FV_FLAG_START+202)	//インタビュアー＆カメラマン(r120)
#define FV_INTERVW1_07_CAMERA			(FV_FLAG_START+203)	//インタビュアー＆カメラマン(r111)
#define FV_INTERVW1_08_CAMERA			(FV_FLAG_START+204)	//インタビュアー＆カメラマン(r118)
#define FV_OBJ_ALL_C102_R0601			(FV_FLAG_START+205)	//船着場のOBJ
#define FV_TRAINERW1_01_FIELD_R104		(FV_FLAG_START+206)	//トレーナー女（サン・トウカの前）
#define FV_POKE_01_FIELD_T105			(FV_FLAG_START+207)	//ポケモン(広報用)
#define FV_WORKERW2_01_C106_R0501		(FV_FLAG_START+208)	//受け付け(ミナモ船乗り場)
#define FV_SEAMAN1_01_C106_R0501		(FV_FLAG_START+209)	//受け付け(ミナモ船乗り場)
#define FV_DUMMY_01_PARK_KOKORO02		(FV_FLAG_START+210)	//ダミー(南の孤島)
#define FV_KOKORO_01_PARK_KOKORO02		(FV_FLAG_START+211)	//ラティアス・ラティオス(南の孤島)
#define FV_TETTSUSEN_01_FIELD_C103		(FV_FLAG_START+212)	//テッセン(キンセツ)
#define FV_TETTSUSEN_01_C103_R0101		(FV_FLAG_START+213)	//テッセン(ジム)
#define FV_EVIL_ALL_FIELD_R121			(FV_FLAG_START+214)	//アクア団(r121)
#define FV_TR_ALL_CAVE_D0803			(FV_FLAG_START+215)	//トレーナー(おくりび山)
#define FV_AQUABOSS_01_CAVE_D0808S		(FV_FLAG_START+216)	//アオギリ(おくりび山)
#define FV_AQUA_ALL_CAVE_D0808S			(FV_FLAG_START+217)	//アクア団(おくりび山)
#define FV_INTERVW1_01_PARK_BATTLE01	(FV_FLAG_START+218)	//インタビュアー(バトルタワー)
#define FV_SUPPORT_01_FIELD_R110		(FV_FLAG_START+219)	//サポート(r110)
#define FV_SUPPORT_01_C109_R0105		(FV_FLAG_START+220)	//サポート(チャンピオンの部屋)
#define FV_ODAMAKI_01_C109_R0105		(FV_FLAG_START+221)	//オダマキ(チャンピオンの部屋)
#define FV_SUPPORT_02_FIELD_R110		(FV_FLAG_START+222)	//サポート自転車(r110)
#define FV_SUPPORT_02_FIELD_R119		(FV_FLAG_START+223)	//サポート自転車(r119)
#define FV_AQUA_ALL_CAVE_D0901			(FV_FLAG_START+224)	//アクア団(アジト)
#define FV_GUEST_ALL_C106_R0102			(FV_FLAG_START+225)	//ミナモの民宿２Fのお客一括表示
#define FV_AQUA_ALL_CAVE_D0701			(FV_FLAG_START+226)	//アクア団(えんとつ山)
#define FV_MAGMA_ALL_CAVE_D0701			(FV_FLAG_START+227)	//マグマ団(えんとつ山)
#define FV_SORAISI_01_T105_R0201		(FV_FLAG_START+228)	//ソライシ博士(ソライシ研究所)
#define FV_SUPPORT_01_FIELD_T104		(FV_FLAG_START+229)	//サポート(T104)
#define FV_SUPPORT_02_FIELD_T104		(FV_FLAG_START+230)	//サポート自転車(T104)
#define FV_IWA_01_CAVE_D0201			(FV_FLAG_START+231)	//岩(カナシダトンネル特殊)
#define FV_IWA_02_CAVE_D0201			(FV_FLAG_START+232)	//岩(カナシダトンネル特殊)
#define FV_POKE_01_C105_R0501			(FV_FLAG_START+233)	//鳥ポケモン(ヒワマキ)
#define FV_POKE_01_C107_R0301			(FV_FLAG_START+234)	//鳥ポケモン(トクサネ)
#define FV_POKE_01_CAVE_D0401			(FV_FLAG_START+235)	//伝説ポケモン
#define FV_POKE_01_CAVE_D1801			(FV_FLAG_START+236)	//伝説ポケモン
#define FV_POKE_01_CAVE_D1901			(FV_FLAG_START+237)	//伝説ポケモン
#define FV_AQUA_ALL_CAVE_D0101			(FV_FLAG_START+238)	//アクア団(流星の洞窟)
#define FV_MAGMA_ALL_CAVE_D0101			(FV_FLAG_START+239)	//マグマ団(流星の洞窟)
#define FV_FREAK1_01_T103_R0301			(FV_FLAG_START+240)	//マニア(流行部屋)
#define FV_OWNER_01_PARK_BATTLE01		(FV_FLAG_START+241)	//オーナー(バトルタワー)
#define FV_SORAISI_01_CAVE_D0101		(FV_FLAG_START+242)	//ソライシ博士(流星の滝)
#define FV_SUBMARINE1_01_CAVE_D0903		(FV_FLAG_START+243)	//潜水艦(ミナモのアジト)
#define FV_AQUABOSS_01_FIELD_R128		(FV_FLAG_START+244)	//アオギリ(r128)
#define FV_MAGMABOSS_01_FIELD_R128		(FV_FLAG_START+245)	//マツブサ(r128)
#define FV_AQUA_ALL_CAVE_D1103			(FV_FLAG_START+246)	//アクア団(海底洞窟)
#define FV_WORKERM1_01_FIELD_R116		(FV_FLAG_START+247)	//研究員(r116)
#define FV_SHOPM1_04_FIELD_C102			(FV_FLAG_START+248)	//店員(カイナ)
#define FV_WORKERM1_01_C104_R0103		(FV_FLAG_START+249)	//研究員(デボン本社３階)
#define FV_HAGI_01_SP_SHIP01			(FV_FLAG_START+250)	//ハギ・ピーコ(連絡船)
#define FV_FREAK1_01_SP_SHIP03			(FV_FLAG_START+251)	//マニア(連絡船)
#define FV_SIO_01_ASASE					(FV_FLAG_START+252)	//「あさせのしお」
#define FV_SIO_02_ASASE					(FV_FLAG_START+253)	//「あさせのしお」
#define FV_SIO_03_ASASE					(FV_FLAG_START+254)	//「あさせのしお」
#define FV_SIO_04_ASASE					(FV_FLAG_START+255)	//「あさせのしお」
#define FV_KAI_01_ASASE					(FV_FLAG_START+256)	//「あさせのかいがら」
#define FV_KAI_02_ASASE					(FV_FLAG_START+257)	//「あさせのかいがら」
#define FV_KAI_03_ASASE					(FV_FLAG_START+258)	//「あさせのかいがら」
#define FV_KAI_04_ASASE					(FV_FLAG_START+259)	//「あさせのかいがら」
#define FV_BOY1_01_FIELD_R111			(FV_FLAG_START+260)	//ひみつのちからをくれる人
#define FV_OBJ_ALL_C102_R0501			(FV_FLAG_START+261)	//博物館ギャラリー
#define FV_HORIDASI_01_C106_R1106		(FV_FLAG_START+262)	//掘り出し物屋
#define FV_KASEKI_01_FIELD_R111			(FV_FLAG_START+263)	//カセキ（ねっこ）
#define FV_KASEKI_02_FIELD_R111			(FV_FLAG_START+264)	//カセキ（ツメ）
#define FV_EVILM1_06_C102_R0501			(FV_FLAG_START+265)	//アイテムをくれるアクア団
#define FV_DAIGO_01_FIELD_R118			(FV_FLAG_START+266)	//ダイゴ(r118)
#define FV_DAIGO_01_C107_R0501			(FV_FLAG_START+267)	//ダイゴ(トクサネ)
#define FV_BALL_01_C107_R0501			(FV_FLAG_START+268)	//アイテムボール(トクサネ)
#define FV_KAKURE_01_FIELD_C105			(FV_FLAG_START+269)	//カクレオン(ヒワマキ)
#define FV_KAKURE_01_FIELD_R120			(FV_FLAG_START+270)	//カクレオン(ヒワマキ)
#define FV_SUPPORT_01_FIELD_C106		(FV_FLAG_START+271)	//サポート(ミナモ)
#define FV_DAIGO_01_FIELD_R120			(FV_FLAG_START+272)	//ダイゴ(ヒワマキ)
#define FV_DAIGO_01_FIELD_C108			(FV_FLAG_START+273)	//ダイゴ(ルネ)
#define FV_BIRIRIDAMA_01				(FV_FLAG_START+274)	//ビリリダマ(ニューキンセツ)
#define FV_BIRIRIDAMA_02				(FV_FLAG_START+275)	//ビリリダマ(ニューキンセツ)
#define FV_BIRIRIDAMA_03				(FV_FLAG_START+276)	//ビリリダマ(ニューキンセツ)
#define FV_MARUMAIN_01					(FV_FLAG_START+277)	//マルマイン(アジト)
#define FV_MARUMAIN_02					(FV_FLAG_START+278)	//マルマイン(アジト)
#define FV_SUPPORT_01_FIELD_T102		(FV_FLAG_START+279)	//サポート(コトキ)
#define FV_SUBMARINE_06_CAVE_D1101		(FV_FLAG_START+280)	//潜水艇
#define FV_KAKUREONB_01_FIELD_R120		(FV_FLAG_START+281)	//カクレオン写りこみ(ロード１２０)
#define FV_KAKURE_02_FIELD_R120			(FV_FLAG_START+282)	//カクレオン(ロード１２０)
#define FV_WOMAN1_01_CAVE_D0201			(FV_FLAG_START+283)	//ミチル(カナシダトンネル)
#define FV_WOMAN1_01_T106_R0201			(FV_FLAG_START+284)	//ミチル(親戚の家)
#define FV_KAKURE_03_FIELD_R120			(FV_FLAG_START+285)	//カクレオン(ロード１２０)
#define FV_KAKURE_04_FIELD_R120			(FV_FLAG_START+286)	//カクレオン(ロード１２０)
#define FV_KAKURE_05_FIELD_R120			(FV_FLAG_START+287)	//カクレオン(ロード１２０)
#define FV_KAKURE_06_FIELD_R120			(FV_FLAG_START+288)	//カクレオン(ロード１２０)
#define FV_KAKURE_01_FIELD_R119			(FV_FLAG_START+289)	//カクレオン(ロード１１９)
#define FV_KAKURE_02_FIELD_R119			(FV_FLAG_START+290)	//カクレオン(ロード１１９)
#define FV_BOY2_01_FIELD_R101			(FV_FLAG_START+291)	//少年(ロード１０１)

//フィールド上のモンスターボールのスタートが(FV_FLAG_START+300)になっている
//1000 - 1199が確保されている



//----------------------------------------------------------------------
//	トレーナー用
//
//	(FT_FLAG_START - TRFLG_START)
//	(    1200       -    1280      )
//----------------------------------------------------------------------
#define FT_FLAG_START					(1200)

//#define FT_GIRL4_01_FIELD_R103			(FT_FLAG_START+0)	//オダマキ娘(ロード１０３)

#define FT_GYM_01_LEADER				(FT_FLAG_START+1)	//ジム(カナズミ)
/*
#define FT_GYM_01_OBJ01					(FT_FLAG_START+2)	//ジム(カナズミ)
#define FT_GYM_01_OBJ02					(FT_FLAG_START+3)	//ジム
*/

#define FT_GYM_02_LEADER				(FT_FLAG_START+4)	//ジム(ムロ)
/*
#define FT_GYM_02_OBJ01					(FT_FLAG_START+5)	//ジム
#define FT_GYM_02_OBJ02					(FT_FLAG_START+6)	//ジム
#define FT_GYM_02_OBJ03					(FT_FLAG_START+7)	//ジム
*/

#define FT_GYM_03_LEADER				(FT_FLAG_START+8)	//ジム(キンセツ)
/*
#define FT_GYM_03_OBJ01					(FT_FLAG_START+9)	//ジム
#define FT_GYM_03_OBJ02					(FT_FLAG_START+10)	//ジム
#define FT_GYM_03_OBJ03					(FT_FLAG_START+11)	//ジム
#define FT_GYM_03_OBJ04					(FT_FLAG_START+12)	//ジム
*/

#define FT_GYM_04_LEADER				(FT_FLAG_START+13)	//ジム(フエン)
/*
#define FT_GYM_04_OBJ01					(FT_FLAG_START+14)	//ジム
#define FT_GYM_04_OBJ02					(FT_FLAG_START+15)	//ジム
#define FT_GYM_04_OBJ03					(FT_FLAG_START+16)	//ジム
*/

#define FT_GYM_05_LEADER				(FT_FLAG_START+17)	//ジム(トウカ)
/*
#define FT_GYM_05_OBJ01					(FT_FLAG_START+18)	//ジム
#define FT_GYM_05_OBJ02					(FT_FLAG_START+19)	//ジム
#define FT_GYM_05_OBJ03					(FT_FLAG_START+20)	//ジム
#define FT_GYM_05_OBJ04					(FT_FLAG_START+21)	//ジム
#define FT_GYM_05_OBJ05					(FT_FLAG_START+22)	//ジム
#define FT_GYM_05_OBJ06					(FT_FLAG_START+23)	//ジム
#define FT_GYM_05_OBJ07					(FT_FLAG_START+24)	//ジム
*/

#define FT_GYM_06_LEADER				(FT_FLAG_START+25)	//ジム(ヒワマキ)
/*
#define FT_GYM_06_OBJ01					(FT_FLAG_START+26)	//ジム
#define FT_GYM_06_OBJ02					(FT_FLAG_START+27)	//ジム
#define FT_GYM_06_OBJ03					(FT_FLAG_START+28)	//ジム
*/

#define FT_GYM_07_LEADER				(FT_FLAG_START+29)	//ジム(トクサネ)
/*
#define FT_GYM_07_OBJ01					(FT_FLAG_START+30)	//ジム
#define FT_GYM_07_OBJ02					(FT_FLAG_START+31)	//ジム
#define FT_GYM_07_OBJ03					(FT_FLAG_START+32)	//ジム
#define FT_GYM_07_OBJ04					(FT_FLAG_START+33)	//ジム
#define FT_GYM_07_OBJ05					(FT_FLAG_START+34)	//ジム
#define FT_GYM_07_OBJ06					(FT_FLAG_START+35)	//ジム
*/

#define FT_GYM_08_LEADER				(FT_FLAG_START+36)	//ジム(ルネ)
/*
#define FT_GYM_08_OBJ01					(FT_FLAG_START+37)	//ジム
#define FT_GYM_08_OBJ02					(FT_FLAG_START+38)	//ジム
#define FT_GYM_08_OBJ03					(FT_FLAG_START+39)	//ジム
#define FT_GYM_08_OBJ04					(FT_FLAG_START+40)	//ジム
#define FT_GYM_08_OBJ05					(FT_FLAG_START+41)	//ジム
#define FT_GYM_08_OBJ06					(FT_FLAG_START+42)	//ジム
#define FT_GYM_08_OBJ07					(FT_FLAG_START+43)	//ジム
#define FT_GYM_08_OBJ08					(FT_FLAG_START+44)	//ジム
*/

#define FT_SHITEN_01					(FT_FLAG_START+45)	//四天王
#define FT_SHITEN_02					(FT_FLAG_START+46)	//四天王
#define FT_SHITEN_03					(FT_FLAG_START+47)	//四天王
#define FT_SHITEN_04					(FT_FLAG_START+48)	//四天王

#define FT_MITSURU_01_CAVE_D1301		(FT_FLAG_START+49)	//ミツル(チャンピオンロード)

#endif  /* SAVEFLAG_H */
