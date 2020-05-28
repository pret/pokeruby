@======================================================
@		waza_seq.s
@======================================================

	.text
	.code 32

	.include	"waza_seq.def"
@	.include	"fightmsg.def"

@======================================================
@	define宣言
@======================================================

MOJI_WAIT	=	0x040

@======================================================
@	global宣言
@======================================================

	.global		WazaEffectTbl

@======================================================
@	特殊技シーケンス　global宣言
@======================================================

	.global		WAZA_KizetsuA
	.global		WAZA_KizetsuD
	.global		WAZA_Win
	.global		WAZA_Lose
	.global		WAZA_TrainerWin
	.global		WAZA_TuushinWin
	.global		WAZA_BattleTowerWin
	.global		WAZA_ItemEscape
	.global		WAZA_SpeabiEscape
	.global		WAZA_Escape
	.global		WAZA_EnemyEscape
	.global		WAZA_TrainerEscape
	.global		WAZA_EscapeNG
	.global		WAZA_EscapeNG2
	.global		WAZA_SafariBallThrowNG
	.global		WAZA_PokeReshuffle
	.global		WAZA_PokeAppear
	.global		WAZA_Wait
	.global		WAZA_LevelUp
@	.global		WAZA_LevelUpA
@	.global		WAZA_LevelUpD
	.global		WAZA_GetEXP
	.global		WAZA_Zenmetsu
	.global		WAZA_Umakukimaran
	.global		WAZA_NormalNohit
	.global		WAZA_NormalNohitWait
	.global		WAZA_NormalNohit2
	.global		WAZA_HitCalc
	.global		WAZA_HitCalcOnly
	.global		WAZA_Hit

	.global		WAZA_OrderIgnoreSleep
	.global		WAZA_OrderIgnore
	.global		WAZA_Namakeru
	.global		WAZA_Hirune
	.global		WAZA_OwnAttack

	.global		WAZA_MigawariKizetsu
	.global		WAZA_BlankMsg
	.global		WAZA_WazaEnd

@======================================================
@	天候シーケンス
@======================================================

	.global		WAZA_Amefuri
	.global		WAZA_WeatherDamage
	.global		WAZA_WeatherDamageEnd
	.global		WAZA_Hare
	.global		WAZA_HareEnd
@フィールドの天候を反映
	.global		WAZA_FieldWeather

@======================================================
@	フィールドコンディションシーケンス
@======================================================

	.global		WAZA_ReflecEnd
	.global		WAZA_Shinpi
	.global		WAZA_ShinpiEnd

@======================================================
@	技効果シーケンス
@======================================================

	.global		WAZA_Yadorigi
	.global		WAZA_Gaman
	.global		WAZA_GamanOff
	.global		WAZA_GamanFaild
	.global		WAZA_Hukitobashi
	.global		WAZA_Shiroikiri
	.global		WAZA_CondUpMsg
	.global		WAZA_CondUpTsuikaMsg
	.global		WAZA_CondDownMsg
	.global		WAZA_CondDownTsuikaMsg
	.global		WAZA_Ikari
	.global		WAZA_Kanashibari
	.global		WAZA_Kanashibari2
	.global		WAZA_KanashibariEnd
	.global		WAZA_EncoreEnd
	.global		WAZA_Michidure
	.global		WAZA_MakibishiA
	.global		WAZA_MakibishiD
	.global		WAZA_MakibishiK
	.global		WAZA_Horobinoutaing
	.global		WAZA_Horobinouta
	.global		WAZA_Genshinochikara
	.global		WAZA_Kousokuspin
	.global		WAZA_ShimeEscape
	.global		WAZA_YadorigiEscape
	.global		WAZA_MakibishiEscape
	.global		WAZA_Miraiyochi
	.global		WAZA_Waruagaki
	.global		WAZA_PPNone
	.global		WAZA_PPNoneAttack
	.global		WAZA_Ichamon
	.global		WAZA_Ichamon2
	.global		WAZA_Chouhatsu
	.global		WAZA_Chouhatsu2
@	.global		WAZA_Mamoru
	.global		WAZA_Negaigoto
	.global		WAZA_Newoharu
	.global		WAZA_Bakadikara
	.global		WAZA_Hatakiotosu
	.global		WAZA_Huuin
	.global		WAZA_Huuin2
	.global		WAZA_Onnen
	.global		WAZA_MagicCort
	.global		WAZA_Yokodori
	.global		WAZA_Koraeta
	.global		WAZA_Kaifuku
	.global		WAZA_Mantan
	.global		WAZA_Ichigeki
	.global		WAZA_OverHeat
	.global		WAZA_Handou

@======================================================
@	技を出す前にメッセージを出す技シーケンス
@======================================================

	.global		WAZA_KiaiPunch

@======================================================
@	ポケモン状態異常シーケンス
@======================================================

	.global		WAZA_Nemuru
	.global		WAZA_Mezame
	.global		WAZA_SawaguMezame
	.global		WAZA_Doku
	.global		WAZA_Yakedo
	.global		WAZA_Koori
	.global		WAZA_Melt
	.global		WAZA_Melt2
	.global		WAZA_Mahi
	.global		WAZA_Hirumu
	.global		WAZA_Sawagu
	.global		WAZA_AbareruEnd
	.global		WAZA_Konran
	.global		WAZA_KonranEnd
	.global		WAZA_Dokudoku
	.global		WAZA_Nekonikoban
	.global		WAZA_Shime
	.global		WAZA_ShimeEnd
	.global		WAZA_Meromero
	.global		WAZA_MeromeroNext
	.global		WAZA_Akumu
@	.global		WAZA_KaengurumaMelt
@	.global		WAZA_Kaenguruma
	.global		WAZA_Noroi
	.global		WAZA_NoMahi

@======================================================
@	技追加効果シーケンス
@======================================================

	.global		WAZA_AddNemuri
	.global		WAZA_AddNemuri2
	.global		WAZA_AddDoku
	.global		WAZA_AddYakedo
	.global		WAZA_AddKoori
	.global		WAZA_AddMahi
	.global		WAZA_AddSawagu
	.global		WAZA_AddDokudoku
	.global		WAZA_AddNekonikoban
	.global		WAZA_AddShime
	.global		WAZA_AddKonran
	.global		WAZA_AddHanekaeri
	.global		WAZA_AddDorobou

@======================================================
@	特殊能力シーケンス
@======================================================

	.global		WAZA_Amehurashi
	.global		WAZA_Kasokusouti
	.global		WAZA_Ganzyou
	.global		WAZA_Shimerike
	.global		WAZA_Tikuden
	.global		WAZA_Tyosui
	.global		WAZA_TikudenPPDec
	.global		WAZA_TyosuiPPDec
	.global		WAZA_Hensyoku
	.global		WAZA_Juunan
	.global		WAZA_Donkan
	.global		WAZA_Meneki
	.global		WAZA_Mypace
	.global		WAZA_Moraibi
	.global		WAZA_MoraibiPPDec
	.global		WAZA_Ikaku
	.global		WAZA_IkakuAct
	.global		WAZA_ClearBody
	.global		WAZA_Samehada
	.global		WAZA_Housi
	.global		WAZA_Dokunotoge
	.global		WAZA_Sinkuro
	.global		WAZA_Seidenki
	.global		WAZA_Trace
	.global		WAZA_Bouon
	.global		WAZA_Ameukezara
	.global		WAZA_Sunaokosi
	.global		WAZA_Honoonokarada
	.global		WAZA_Surudoime
	.global		WAZA_Kairikibasami
	.global		WAZA_MeromeroBody
	.global		WAZA_Nentyaku
	.global		WAZA_Dappi
	.global		WAZA_Tenkiya
	.global		WAZA_Tenkiya2
	.global		WAZA_Hideri
	.global		WAZA_Hiraishin
	.global		WAZA_Mizunobeeru
	.global		WAZA_Seisinryoku

	.global		WAZA_NOKaifuku
	.global		WAZA_NOKaifukuPPDec

	.global		WAZA_SpeabiNoJoutaiijou

@======================================================
@	装備アイテムシーケンス
@======================================================

	.global		WAZA_ItemNoMahi
	.global		WAZA_ItemNoDoku
	.global		WAZA_ItemNoYakedo
	.global		WAZA_ItemNoKoori
	.global		WAZA_ItemNoNemuri
	.global		WAZA_ItemNoKonran
	.global		WAZA_ItemNoJoutaiijou
	.global		WAZA_ItemAbiKaifuku
	.global		WAZA_ItemNoMahi2
	.global		WAZA_ItemNoDoku2
	.global		WAZA_ItemNoYakedo2
	.global		WAZA_ItemNoKoori2
	.global		WAZA_ItemNoNemuri2
	.global		WAZA_ItemNoKonran2
	.global		WAZA_ItemNoJoutaiijou2
	.global		WAZA_ItemAbiKaifuku2

	.global		WAZA_ItemHPKaifuku
	.global		WAZA_ItemPPKaifuku
	.global		WAZA_ItemHPKaifukuEveryTurn
	.global		WAZA_ItemHPKaifukuEveryTurn2
	.global		WAZA_ItemOnaziWazaOnly
	.global		WAZA_ItemKoraeta
	.global		WAZA_ItemHPKaifukuKonran
	.global		WAZA_ItemCondUp
	.global		WAZA_ItemCriticalUp

@======================================================
@	通信時アラートメッセージ
@======================================================

	.global		WAZA_DouguAlert

#include	"server.def"
#include	"tokusyu.def"
#include	"agbmons.def"
#include	"..\snd_file\mus_def.h"
#include	"wazano.def"
#include	"record.h"
#include	"fntequ.h"
#include	"fightmsg.def"
#include	"client.def"

WazaEffectTbl:
	.long	WAZA_NormalHit			@000 ノーマル
	.long	WAZA_SleepHit			@001 相手を眠らせる
	.long	WAZA_DokuHit			@002 毒の追加効果
	.long	WAZA_SuitoriHit			@003 吸血
	.long	WAZA_YakedoHit			@004 やけどの追加効果
	.long	WAZA_KooriHit			@005 こおりの追加効果
	.long	WAZA_MahiHit			@006 まひの追加効果
	.long	WAZA_JibakuHit			@007 自爆
	.long	WAZA_YumekuiHit			@008 夢喰い
	.long	WAZA_OumuHit			@009 オウム返し
	.long	WAZA_PowUp1Hit			@010 自分の攻撃力を１ランク上げる
	.long	WAZA_DefUp1Hit			@011 自分の防御力を１ランク上げる
	.long	WAZA_NormalHit			@012 自分の素早さを１ランク上げる
	.long	WAZA_SpePowUp1Hit		@013 自分の特殊攻撃力を１ランク上げる
	.long	WAZA_NormalHit			@014 自分の特殊防御力を１ランク上げる
	.long	WAZA_NormalHit			@015 自分の命中率を１ランク上げる
	.long	WAZA_AvoidUp1Hit		@016 自分の回避率を１ランク上げる
	.long	WAZA_NormalHit			@017 必ずヒットする(17という数字で対処）
	.long	WAZA_PowDown1Hit		@018 相手の攻撃力を１ランク下げる
	.long	WAZA_DefDown1Hit		@019 相手の防御力を１ランク下げる
	.long	WAZA_AgiDown1Hit		@020 相手の素早さを１ランク下げる
	.long	WAZA_NormalHit			@021 相手の特殊攻撃力を１ランク下げる
	.long	WAZA_NormalHit			@022 相手の特殊防御力を１ランク下げる
	.long	WAZA_HitDown1Hit		@023 相手の命中率を１ランク下げる
	.long	WAZA_AvoidDown1Hit		@024 相手の回避率を１ランク下げる
	.long	WAZA_KuroikiriHit		@025 双方にかかっている状態変化と、攻撃補助系の技の効果を解除する
	.long	WAZA_GamanHit			@026 がまん
	.long	WAZA_AbareruHit			@027 あばれる
	.long	WAZA_HukitobashiHit		@028 ふきとばし
	.long	WAZA_RenzokuHit			@029 ２～５ターンの連続攻撃
	.long	WAZA_TextureHit			@030 テクスチャー
	.long	WAZA_HirumuHit			@031 追加効果で相手がひるむ
	.long	WAZA_JikosaiseiHit		@032 自己再生
	.long	WAZA_DokudokuDirectHit	@033 相手に毒を与える（どくどく）
	.long	WAZA_NekonikobanHit		@034 ねこにこばん
	.long	WAZA_HikarinokabeHit	@035 特殊攻撃で受けるダメージが１／２になる
	.long	WAZA_TriAttackHit		@036 トライアタック
	.long	WAZA_NemuruHit			@037 ねむる
	.long	WAZA_IchigekiHit		@038 一撃必殺
	.long	WAZA_KamaitachiHit		@039 １ターンためて攻撃（専用メッセージが必要）
	.long	WAZA_IkarinomaebaHit	@040 相手のＨＰを半分にする
	.long	WAZA_Kotei40Hit			@041 固定ダメージ40
	.long	WAZA_ShimeHit			@042 ２～５ターンしめつけ
	.long	WAZA_NormalHit			@043 クリティカルヒットになりやすい(043という数字で対処)
	.long	WAZA_Renzoku2Hit		@044 連続で２回攻撃が当たる
	.long	WAZA_TobigeriHit		@045 攻撃が外れると、与えるはずのダメージの１／２を自分が受ける
	.long	WAZA_ShiroiKiriHit		@046 ステータスを変化させる補助攻撃を受けなくなる
	.long	WAZA_KiaidameHit		@047 クリティカル率をアップする
	.long	WAZA_HanekaeriHit		@048 与えたダメージの１／４が自分にはねかえってくる
	.long	WAZA_KonranDirectHit	@049 相手を混乱させる
	.long	WAZA_PowUp2Hit			@050 自分の攻撃力を２ランク上げる
	.long	WAZA_DefUp2Hit			@051 自分の防御力を２ランク上げる
	.long	WAZA_AgiUp2Hit			@052 自分の素早さを２ランク上げる
	.long	WAZA_SpePowUp2Hit		@053 自分の特殊攻撃力を２ランク上げる
	.long	WAZA_SpeDefUp2Hit		@054 自分の特殊防御力を２ランク上げる
	.long	WAZA_NormalHit			@055 自分の命中率を２ランク上げる
	.long	WAZA_NormalHit			@056 自分の回避率を２ランク上げる
	.long	WAZA_HenshinHit			@057 へんしん
	.long	WAZA_PowDown2Hit		@058 相手の攻撃力を２ランク下げる
	.long	WAZA_DefDown2Hit		@059 相手の防御力を２ランク下げる
	.long	WAZA_AgiDown2Hit		@060 相手の素早さを２ランク下げる
	.long	WAZA_NormalHit			@061 相手の特殊攻撃力を２ランク下げる
	.long	WAZA_SpeDefDown2Hit		@062 相手の特殊防御力を２ランク下げる
	.long	WAZA_NormalHit			@063 相手の命中率を２ランク下げる
	.long	WAZA_NormalHit			@064 相手の回避率を２ランク下げる
	.long	WAZA_ReflecHit			@065 物理攻撃で受けるダメージが１／２になる
	.long	WAZA_DokuDirectHit		@066 相手に毒を与える
	.long	WAZA_MahiDirectHit		@067 相手をまひさせる
	.long	WAZA_PowDownAddHit		@068 追加効果で相手の攻撃力を１ランク下げる
	.long	WAZA_DefDownAddHit		@069 追加効果で相手の防御力を１ランク下げる
	.long	WAZA_AgiDownAddHit		@070 追加効果で相手の素早さを１ランク下げる
	.long	WAZA_SpePowDownAddHit	@071 追加効果で相手の特殊攻撃力を１ランク下げる
	.long	WAZA_SpeDefDownAddHit	@072 追加効果で相手の特殊防御力を１ランク下げる
	.long	WAZA_HitDownAddHit		@073 追加効果で相手の命中率を１ランク下げる
	.long	WAZA_NormalHit			@074 追加効果で相手の回避率を１ランク下げる
	.long	WAZA_GodBirdHit			@075 ため＋ひるむの追加効果
	.long	WAZA_KonranAddHit		@076 追加効果で相手を混乱させる
	.long	WAZA_RenzokuDokuAddHit	@077 連続で２回攻撃し、追加効果で相手をどく状態にする
	.long	WAZA_NormalHit			@078 後攻になるが、攻撃は必ずあたる(78という数字で対処)
	.long	WAZA_MigawariHit		@079 みがわりを出す
	.long	WAZA_HandouHit			@080 攻撃の次の１ターン行動不能になる
	.long	WAZA_IkariHit			@081 いかり
	.long	WAZA_MonomaneHit		@082 ものまね
	.long	WAZA_YubiwohuruHit		@083 ゆびをふる
	.long	WAZA_YadorigiHit		@084 やどりぎ
	.long	WAZA_HaneruHit			@085 何もおこらない
	.long	WAZA_KanashibariHit		@086 相手が直前に出した技を封じる
	.long	WAZA_ChikyuuNageHit		@087 自分のレベル分のダメージを与える
	.long	WAZA_PsychoWaveHit		@088 １～自分のレベル分のダメージを与える
	.long	WAZA_CounterHit			@089 カウンター
	.long	WAZA_EncoreHit			@090 アンコール
	.long	WAZA_ItamiwakeHit		@091 いたみわけ
	.long	WAZA_IbikiHit			@092 いびき
	.long	WAZA_Texture2Hit		@093 自分のタイプをランダムで変えてしまう
	.long	WAZA_LockOnHit			@094 次の自分の攻撃の命中率を１００％にする
	.long	WAZA_SketchHit			@095 スケッチ
	.long	WAZA_NormalHit			@096 攻撃力を１段階上げる＋こおり状態の場合はこおりが溶ける
	.long	WAZA_NegotoHit			@097 自分が眠り状態の時、他の３つの技の１つをランダムで出す
	.long	WAZA_MichidureHit		@098 次の相手の攻撃で自分がひんしになると、相手もひんしになる
	.long	WAZA_JitabataHit		@099 自分の体力が少ないほど攻撃力が上がる
	.long	WAZA_UramiHit			@100 相手のＰＰを２～５削る
	.long	WAZA_NormalHit			@101 相手の体力を必ず１残す（101という数字で対処）
	.long	WAZA_IyashinosuzuHit	@102 自分の状態変化を直す
	.long	WAZA_NormalHit			@103 先制攻撃になる(技リストのプライオリティで対処）
	.long	WAZA_TripleKickHit		@104 トリプルキック。１～３回当たる。ダメージは1＜２＜３
	.long	WAZA_DorobouHit			@105 相手が装備しているどうぐを盗む
	.long	WAZA_KuroimanazashiHit	@106 相手を逃げられなくする。
	.long	WAZA_AkumuHit			@107 悪夢
	.long	WAZA_ChiisakunaruHit	@108 ちいさくなる
	.long	WAZA_NoroiHit			@109 のろい
	.long	WAZA_NormalHit			@110 こばんなげ
	.long	WAZA_MamoruHit			@111 次の相手の攻撃を受けない
	.long	WAZA_MakibishiHit		@112 まきびし
	.long	WAZA_MiyaburuHit		@113 みやぶる
	.long	WAZA_HorobinoutaHit		@114 ほろびのうた
	.long	WAZA_SunaarashiHit		@115 すなあらし
	.long	WAZA_KoraeruHit			@116 次の相手の攻撃を受けても体力が１残る
	.long	WAZA_KorogaruHit		@117 ５ターン連続で攻撃、ターンごとに威力が上がる
	.long	WAZA_IbaruHit			@118 相手の攻撃力を２段階上げてこんらんさせる
	.long	WAZA_RenzokugiriHit		@119 連続で出すごとに威力が上がる
	.long	WAZA_MeromeroHit		@120 相手をメロメロ状態にする
	.long	WAZA_NatsukiHit			@121 なつき度が高いほど威力が高い
	.long	WAZA_PresentHit			@122 プレゼント
	.long	WAZA_NatsukiHit			@123 なつき度が低いほど威力が高い
	.long	WAZA_ShinpinomamoriHit	@124 ５ターンの間、状態変化（どく、まひ）を受けない
	.long	WAZA_KaengurumaHit		@125 やけどの追加効果＋こおり状態の場合はこおりが溶ける
	.long	WAZA_MagnitudeHit		@126 マグニチュード
	.long	WAZA_BatontouchHit		@127 バトンタッチ
	.long	WAZA_NormalHit			@128 おいうち（技ナンバーで対応）
	.long	WAZA_KousokuSpinHit		@129 こうそくスピン
	.long	WAZA_Kotei20Hit			@130 固定ダメージ20
	.long	WAZA_NormalHit			@131 未使用
	.long	WAZA_WeatherkaifukuHit	@132 体力を半分回復。朝だと全回復
	.long	WAZA_WeatherkaifukuHit	@133 体力を半分回復。昼だと全回復
	.long	WAZA_WeatherkaifukuHit	@134 体力を半分回復。夜、深夜だと全回復
	.long	WAZA_MezameruPowerHit	@135 めざめるパワー
	.long	WAZA_AmagoiHit			@136 あまごい
	.long	WAZA_NihonbareHit		@137 にほんばれ
	.long	WAZA_DefUpAddHit		@138 追加効果で自分の防御力を１段階上げる
	.long	WAZA_PowUpAddHit		@139 追加効果で自分の攻撃力を１段階上げる
	.long	WAZA_GenshinochikaraHit	@140 追加効果で５つのステータスが１段階上がる
	.long	WAZA_NormalHit			@141 相手をひるませる（未使用）
	.long	WAZA_HaradaikoHit		@142 はらだいこ
	.long	WAZA_JikoanjiHit		@143 相手にかかっている補助効果をコピーする
	.long	WAZA_MirrorCoatHit		@144 相手の特殊攻撃のダメージを倍にして返す
	.long	WAZA_RocketzutukiHit	@145  ため＋防御力アップ
	.long	WAZA_TatumakiHit		@146 ひるむ　＋　空をとんでいる相手に倍のダメージ
	.long	WAZA_JisinHit			@147 地面に潜っている相手に倍のダメージ
	.long	WAZA_MiraiyochiHit		@148 みらいよち　３ターン後に攻撃がくる
	.long	WAZA_KazeokosiHit		@149 空をとんでいる相手に倍のダメージ
	.long	WAZA_HumitukeHit		@150 小さくなっている相手に倍のダメージ
	.long	WAZA_SolarBeamHit		@151 ソーラービーム　はれだとためずに攻撃できる
	.long	WAZA_KaminariHit		@152 雨だと命中率アップ　はれだとダウン
	.long	WAZA_TeleportHit		@153 テレポート（野性のポケモンとの戦闘から離脱）
	.long	WAZA_HukurodatakiHit	@154 ふくろだたき
	.long	WAZA_KieruTameHit		@155 そらをとぶ、あなをほる
	.long	WAZA_MarukunaruHit		@156 まるくなる
	.long	WAZA_KaifukuHit			@157 ミルクのみ、タマゴうみ
	.long	WAZA_NekodamashiHit		@158 ねこだまし
	.long	WAZA_SawaguHit			@159 さわぐ
	.long	WAZA_TakuwaeruHit		@160 たくえわえる
	.long	WAZA_HakidasuHit		@161 はきだす
	.long	WAZA_NomikomuHit		@162 のみこむ
	.long	WAZA_NormalHit			@163 未使用
	.long	WAZA_ArareHit			@164 あられ
	.long	WAZA_IchamonHit			@165 いちゃもん
	.long	WAZA_OdateruHit			@166 おだてる
	.long	WAZA_OnibiHit			@167 おにび
	.long	WAZA_OkimiyageHit		@168 おきみやげ
	.long	WAZA_KaragenkiHit		@169 からげんき
	.long	WAZA_KiaiPunchHit		@170 きあいパンチ
	.long	WAZA_KitsukeHit			@171 きつけ
	.long	WAZA_KonoyubitomareHit	@172 このゆびとまれ
	.long	WAZA_ShizennochikaraHit	@173 しぜんのちから
	.long	WAZA_JuudenHit			@174 じゅうでん
	.long	WAZA_ChouhatsuHit		@175 ちょうはつ
	.long	WAZA_TedasukeHit		@176 てだすけ
	.long	WAZA_TrickHit			@177 トリック
	.long	WAZA_NarikiriHit		@178 なりきり
	.long	WAZA_NegaigotoHit		@179 ねがいごと
	.long	WAZA_NekonoteHit		@180 ねこのて
	.long	WAZA_NewoharuHit		@181 ねをはる
	.long	WAZA_BakadikaraHit		@182 ばかぢから
	.long	WAZA_MagicCortHit		@183 マジックコート
	.long	WAZA_RecycleHit			@184 リサイクル
	.long	WAZA_RevengeHit			@185 リベンジ
	.long	WAZA_KawarawariHit		@186 かわらわり（186という数字で対処）
	.long	WAZA_AkubiHit			@187 あくび
	.long	WAZA_HatakiotosuHit		@188 はたきおとす
	.long	WAZA_GamusyaraHit		@189 がむしゃら
	.long	WAZA_HunkaHit			@190 ふんか
	.long	WAZA_SkillSwapHit		@191 スキルスワップ
	.long	WAZA_HuuinHit			@192 ふういん
	.long	WAZA_RefleshHit			@193 リフレッシュ
	.long	WAZA_OnnenHit			@194 おんねん
	.long	WAZA_YokodoriHit		@195 よこどり
	.long	WAZA_KetaguriHit		@196 けたぐり
	.long	WAZA_HimitunoTikaraHit	@197 ひみつのちから
	.long	WAZA_SutemiTackleHit	@198 すてみタックル
	.long	WAZA_AllKonranHit		@199 全てのポケモンが混乱
	.long	WAZA_YakedoHit			@200 急所にあたりやすい＋やけど追加
	.long	WAZA_AsobiHit			@201 電気系の技の威力を半減
	.long	WAZA_DokuDokuHit		@202 追加効果でどくどく
	.long	WAZA_WeatherHit			@203 天気によって威力とタイプ
	.long	WAZA_OverHeatHit		@204 自分の特攻が、がくっと下がる
	.long	WAZA_KusuguruHit		@205 相手の攻撃、防御が下がる
	.long	WAZA_CosmoPowerHit		@206 防御、特防があがる
	.long	WAZA_SkyUpperHit		@207 空を飛んでいる相手にもあたる
	.long	WAZA_BuildUpHit			@208 攻撃、防御があがる
	.long	WAZA_DokuHit			@209 急所にあたりやすい＋毒追加
	.long	WAZA_AsobiHit			@210 炎系の技の威力を半減
	.long	WAZA_MeisouHit			@211 特攻、特防があがる
	.long	WAZA_RyuunomaiHit		@212 攻撃と素早さがあがる
	.long	WAZA_HogosyokuHit		@213 フィールドと同じタイプになる

@===================================================
@	000 ノーマル
@===================================================

WAZA_NormalHit:
	IF16				FLAG_NE,WazaNo,WAZANO_NAMINORI,WAZA_NormalHitStart
	WAZAKOUKA_CHECK		SIDE_DEFENCE,WAZAKOUKA_DAIBINGU,FLAG_OFF,WAZA_NormalHitStart
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_DAIBINGUHIT
	SETVALUE			UserWork+DAMAGE_VALUE,2
WAZA_NormalHitStart:
	BADGECHECK
WAZA_NormalHit2:		@バッジチェックはしない
	HITCHECK			WAZA_NormalNohit,0
						@ヒットしなかったら、指定したアドレスへジャンプ
WAZA_HitCalc:
	ATTACK_MESSAGE
	PP_DEC
WAZA_HitCalcOnly:
	CRITICAL_CHECK
	DAMAGE_CALC
	TYPE_CHECK
	DAMAGE_LOSS
WAZA_Hit:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	WAZAKOUKA_SE
	POKE_BLINK			SIDE_DEFENCE
	CLIENT_BIT_WAIT
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	CRITICAL_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	TSUIKA_CHECK
	KIZETSU_CHECK		SIDE_DEFENCE,0,0
WAZA_WazaEnd:
	SETVALUE			UserWork+WKC_WORK0,0
	WKC_ACT				WKC_CHECK_ALL,0
	WAZAEND
WAZA_NormalNohitBitSet:
	SET8BIT				WazaStatusFlag,WAZASTATUSFLAG_NOHIT
WAZA_NormalNohit:
	ATTACK_MESSAGE
	PP_DEC
WAZA_NormalNohitWait:
	WAIT				MOJI_WAIT/2
WAZA_NormalNohit2:
	WAZAKOUKA_SE
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	001 相手を眠らせる
@===================================================

WAZA_SleepHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_Umakukimaran
	CONDITION_CHECK		SIDE_DEFENCE,CONDITION_NEMURI,WAZA_SleepAlready
	SAWAGU_CHECK		WAZA_SleepNG
	CONDITION_CHECK		SIDE_DEFENCE,CONDITION_BAD,WAZA_Umakukimaran
@	HITCHECK			WAZA_SleepNohit,0
	HITCHECK			WAZA_Umakukimaran,0
	SIDECONDITION_CHECK	SIDE_DEFENCE,SIDE_CONDITION_SHINPI,WAZA_Shinpi
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			ServerWork+3,COND_NEMURI
	TSUIKA_DIRECT_ACT
	JUMP				WAZA_WazaEnd

WAZA_SleepAlready:
	WAIT				MOJI_WAIT/2
	MESSAGE				ALREADYSLEEPMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd
WAZA_SleepNohit:
	WAIT				MOJI_WAIT/2
	MESSAGE				SIPPAIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd
WAZA_SleepNG:
	WAIT				MOJI_WAIT/2
	MESSAGE_TBL			SleepNGMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd
	
@===================================================
@	002 毒の追加効果
@===================================================

WAZA_DokuHit:
	SETVALUE			ServerWork+3,COND_DOKU
	JUMP				WAZA_NormalHit

@===================================================
@	003 吸血
@===================================================

WAZA_SuitoriHit:
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
						@ヒットしなかったら、指定したアドレスへジャンプ
	ATTACK_MESSAGE
	PP_DEC
	CRITICAL_CHECK
	DAMAGE_CALC
	TYPE_CHECK
	DAMAGE_LOSS
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	WAZAKOUKA_SE
	POKE_BLINK			SIDE_DEFENCE
	CLIENT_BIT_WAIT
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	CRITICAL_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	SUITORI
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI
	SPEABI_CHECK		SIDE_DEFENCE,TOKUSYU_HEDOROEKI,WAZA_SuitoriHedoro
	SETVALUE			ServerWork+5,0
	JUMP				WAZA_SuitoriNext
WAZA_SuitoriHedoro:
	DAMAGE_CHG			DAMAGE_NEG			@プラマイ反転
	SETVALUE			ServerWork+5,1
WAZA_SuitoriNext:
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
	IF8					FLAG_BIT,WazaStatusFlag,WAZASTATUSFLAG_NOCRITICAL,WAZA_SuitoriNoMsg
	MESSAGE_TBL			SuitoriMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_SuitoriNoMsg:
	KIZETSU_CHECK		SIDE_ATTACK,0,0
	KIZETSU_CHECK		SIDE_DEFENCE,0,0
	JUMP				WAZA_WazaEnd

@===================================================
@	004 やけどの追加効果
@===================================================

WAZA_YakedoHit:
	SETVALUE			ServerWork+3,COND_YAKEDO
	JUMP				WAZA_NormalHit

@===================================================
@	005 こおりの追加効果
@===================================================

WAZA_KooriHit:
	SETVALUE			ServerWork+3,COND_KOORI
	JUMP				WAZA_NormalHit

@===================================================
@	006 まひの追加効果
@===================================================

WAZA_MahiHit:
	SETVALUE			ServerWork+3,COND_MAHI
	JUMP				WAZA_NormalHit

@===================================================
@	007 自爆
@===================================================

WAZA_JibakuHit:
@	BADGECHECK2			@まもるチェックのないバッジチェック
	BADGECHECK	
	ATTACK_MESSAGE
	PP_DEC
	JIBAKU_INIT
	JIBAKU
	CLIENT_BIT_WAIT
	IF8					FLAG_NBIT,WazaStatusFlag,WAZASTATUSFLAG_NOHIT,WAZA_JibakuStart
	GOSUB				WAZA_JibakuEffect
	JUMP				WAZA_JibakuLoop
WAZA_JibakuStart:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
WAZA_JibakuLoop:
@	SETVALUE			WazaStatusFlag,0
	LOOPINIT			@ループするときに初期化するワークがまとまっている
	CRITICAL_CHECK
	DAMAGE_CALC
	TYPE_CHECK	
	DAMAGE_LOSS
	HITCHECK			WAZA_JibakuNohit,0
	WAZAKOUKA_SE
						@ヒットしなかったら、指定したアドレスへジャンプ
	POKE_BLINK			SIDE_DEFENCE
	CLIENT_BIT_WAIT
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	CRITICAL_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	KIZETSU_CHECK		SIDE_DEFENCE,0,0
	SETVALUE			UserWork+WKC_WORK0,WKC_IKARI_CHECK
	WKC_ACT				WKC_CHECK_KOKOMADE,WKC_DOUBLE_ATTACK
	JIBAKU_LOOP			WAZA_JibakuLoop
	KIZETSU_CHECK		SIDE_ATTACK,0,0
	WAZAEND

WAZA_JibakuNohit:
	WAZAKOUKA_SE
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	SETVALUE			UserWork+WKC_WORK0,WKC_IKARI_CHECK
	WKC_ACT				WKC_CHECK_KOKOMADE,WKC_DOUBLE_ATTACK
	JIBAKU_LOOP			WAZA_JibakuLoop
	KIZETSU_CHECK		SIDE_ATTACK,0,0
	WAZAEND

WAZA_JibakuEffect:
	RESET8BIT			WazaStatusFlag,WAZASTATUSFLAG_NOHIT
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SET8BIT				WazaStatusFlag,WAZASTATUSFLAG_NOHIT
	SEQRET

.if 0
WAZA_JibakuMamoru:
	ATTACK_MESSAGE
	PP_DEC
	WAIT				MOJI_WAIT
	MESSAGE				MAMORUNOHITMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JIBAKU_INIT
	JIBAKU
	CLIENT_BIT_WAIT
	RESET8BIT			WazaStatusFlag,WAZASTATUSFLAG_NOHIT
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SET8BIT				WazaStatusFlag,WAZASTATUSFLAG_NOHIT
	WAZAKOUKA_SE
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	KIZETSU_CHECK		SIDE_ATTACK,0,0
	JUMP				WAZA_WazaEnd
.endif

@===================================================
@	008 夢喰い
@===================================================

WAZA_YumekuiHit:
	BADGECHECK
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_YumekuiHitNG
	CONDITION_CHECK		SIDE_DEFENCE,CONDITION_NEMURI,WAZA_YumekuiHitOK
WAZA_YumekuiHitNG:
	ATTACK_MESSAGE
	PP_DEC
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_SleepNohit
WAZA_YumekuiHitOK:
	HITCHECK			WAZA_NormalNohit,0
						@ヒットしなかったら、指定したアドレスへジャンプ
	ATTACK_MESSAGE
	PP_DEC
	CRITICAL_CHECK
	DAMAGE_CALC
	TYPE_CHECK
	DAMAGE_LOSS
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	WAZAKOUKA_SE
	POKE_BLINK			SIDE_DEFENCE
	CLIENT_BIT_WAIT
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	CRITICAL_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	SUITORI
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
	IF8					FLAG_BIT,WazaStatusFlag,WAZASTATUSFLAG_NOCRITICAL,WAZA_YumekuiNoMsg
	MESSAGE				YUMEKUIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
WAZA_YumekuiNoMsg:
	KIZETSU_CHECK		SIDE_DEFENCE,0,0
	JUMP				WAZA_WazaEnd

@===================================================
@	009 オウム返し
@===================================================

WAZA_OumuHit:
	BADGECHECK
	ATTACK_MESSAGE
	WAIT				MOJI_WAIT
	OUMU_CHECK
	PP_DEC
	SET8BIT				WazaStatusFlag,WAZASTATUSFLAG_UMAKUKIMARAN
	MESSAGE				OUMUNGMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	010 自分の攻撃力を１ランク上げる
@===================================================

WAZA_PowUp1Hit:
	SETVALUE			UserWork+COND_CHG_WORK,COND_POW+PARA_RANKU1
	JUMP				WAZA_CondUp

@===================================================
@	011 自分の防御力を１ランク上げる
@===================================================

WAZA_DefUp1Hit:
	SETVALUE			UserWork+COND_CHG_WORK,COND_DEF+PARA_RANKU1
	JUMP				WAZA_CondUp

@===================================================
@	013 自分の特殊攻撃力を１ランク上げる
@===================================================

WAZA_SpePowUp1Hit:
	SETVALUE			UserWork+COND_CHG_WORK,COND_SPEPOW+PARA_RANKU1
	JUMP				WAZA_CondUp

@===================================================
@	016 自分の回避率を１ランク上げる
@===================================================
WAZA_AvoidUp1Hit:
	SETVALUE			UserWork+COND_CHG_WORK,COND_AVOID+PARA_RANKU1

@===================================================
@	自分のパラメータを上げる
@===================================================

WAZA_CondUp:
	BADGECHECK
WAZA_CondUp2:
	ATTACK_MESSAGE
	PP_DEC
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_CondUpEnd
@あがらないメッセージのときは、技エフェクトをださない
	IF8					FLAG_NE,ServerWork+5,2,WAZA_CondUpEff
	WAIT				MOJI_WAIT/2
	JUMP				WAZA_CondUpMsg
WAZA_CondUpEff:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
WAZA_CondUpStatusEffect:
	COND_CHG_WORK_SET
	FIGHT_EFFECT		SIDE_ATTACK,FE_ID_STATUS_UPDOWN,UserWork+FIGHT_EFFECT_WORK
WAZA_CondUpMsg:
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_CondUpEnd:
	JUMP				WAZA_WazaEnd

WAZA_CondUpTsuikaMsg:
	FIGHT_EFFECT		SIDE_TSUIKA,FE_ID_STATUS_UPDOWN,UserWork+FIGHT_EFFECT_WORK
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@===================================================
@	018 相手の攻撃力を１ランク下げる
@===================================================

WAZA_PowDown1Hit:
	SETVALUE			UserWork+COND_CHG_WORK,COND_POW+PARA_RANKD1
	JUMP				WAZA_CondDown

@===================================================
@	019 相手の防御力を１ランク下げる
@===================================================

WAZA_DefDown1Hit:
	SETVALUE			UserWork+COND_CHG_WORK,COND_DEF+PARA_RANKD1
	JUMP				WAZA_CondDown

@===================================================
@	020 相手の素早さを１ランク下げる
@===================================================

WAZA_AgiDown1Hit:
	SETVALUE			UserWork+COND_CHG_WORK,COND_AGI+PARA_RANKD1
	JUMP				WAZA_CondDown

@===================================================
@	023 相手の命中率を１ランク下げる
@===================================================

WAZA_HitDown1Hit:
	SETVALUE			UserWork+COND_CHG_WORK,COND_HIT+PARA_RANKD1
	JUMP				WAZA_CondDown

@===================================================
@	024 相手の回避率を１ランク下げる
@===================================================

WAZA_AvoidDown1Hit:
	SETVALUE			UserWork+COND_CHG_WORK,COND_AVOID+PARA_RANKD1

@===================================================
@	相手のパラメータを下げる
@===================================================

WAZA_CondDown:
	BADGECHECK
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_UmakukimaranPP
	HITCHECK			WAZA_NormalNohit,0
	ATTACK_MESSAGE
	PP_DEC
	CONDCHG				TSUIKA_DIRECT,WAZA_CondDownEnd
@さがらないメッセージのときは、技エフェクトをださない
	IF8					FLAG_NC,ServerWork+5,2,WAZA_CondDownEff
	IF8					FLAG_EQ,ServerWork+5,3,WAZA_CondDownEnd
	WAIT				MOJI_WAIT/2
	JUMP				WAZA_CondDownMsg
WAZA_CondDownEff:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
WAZA_CondDownStatusEffect:
	COND_CHG_WORK_SET
	FIGHT_EFFECT		SIDE_DEFENCE,FE_ID_STATUS_UPDOWN,UserWork+FIGHT_EFFECT_WORK
WAZA_CondDownMsg:
	MESSAGE_TBL			CondDownMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_CondDownEnd:
	JUMP				WAZA_WazaEnd

WAZA_CondDownTsuikaMsg:
	FIGHT_EFFECT		SIDE_TSUIKA,FE_ID_STATUS_UPDOWN,UserWork+FIGHT_EFFECT_WORK
	MESSAGE_TBL			CondDownMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@===================================================
@	025 双方にかかっている状態変化と、攻撃補助系の技の効果を解除する
@===================================================

WAZA_KuroikiriHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	KUROIKIRI
	MESSAGE				KUROIKIRIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	026 がまん
@===================================================

WAZA_GamanHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_TAME
	GAMAN
	JUMP				WAZA_WazaEnd

@===================================================
@	027 あばれる
@===================================================

WAZA_AbareruHit:
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
@あばれている間はPPをDECしない
	ATTACK_MESSAGE
	CONDITION2_CHECK	SIDE_ATTACK,CONDITION2_KEEP,WAZA_AbareruNoPPDec
	PP_DEC
WAZA_AbareruNoPPDec:
	ABARERU
	JUMP				WAZA_HitCalcOnly

@===================================================
@	028 ふきとばし
@===================================================

WAZA_HukitobashiHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	SPEABI_CHECK		SIDE_DEFENCE,TOKUSYU_KYUUBAN,WAZA_Kyuuban
	WAZAKOUKA_CHECK		SIDE_DEFENCE,WAZAKOUKA_NEWOHARU,FLAG_ON,WAZA_Newoharare
@そらをとぶとあなをほる
@	WAZAKOUKA_CHECK		SIDE_DEFENCE,WAZAKOUKA_KIE,FLAG_ON,WAZA_Umakukimaran
	HITCHECK			WAZA_Umakukimaran,HITCHECK_KIE
	HITCHECK			WAZA_NormalNohit2,0
	HUKITOBASHI			WAZA_Umakukimaran

@===================================================
@	029 ２～５ターンの連続攻撃
@===================================================

WAZA_RenzokuHit:
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
						@ヒットしなかったら、指定したアドレスへジャンプ
	ATTACK_MESSAGE
	PP_DEC
	RENZOKU				0					@0の場合は２～５回
	RENZOKU_NUM_INIT
	@ダブルニードルを使うとこのワークに値が入っているので、初期化しておく（念のため）
	SETVALUE			UserWork+SERVER_WORK3_TEMP,0
WAZA_RenzokuLoop:
	HP_CHECK			SIDE_ATTACK,WAZA_RenzokuNoMsg
	HP_CHECK			SIDE_DEFENCE,WAZA_RenzokuNoHit
	IF16				FLAG_EQ,WazaNoTmp,WAZANO_NEGOTO,WAZA_RenzokuStart
	CONDITION_CHECK		SIDE_ATTACK,CONDITION_NEMURI,WAZA_RenzokuNoHit
WAZA_RenzokuStart:
@	SETVALUE			WazaStatusFlag,0
	LOOPINIT			@ループするときに初期化するワークがまとまっている
	SETWORK				ServerWork+3,UserWork+SERVER_WORK3_TEMP,1
	CRITICAL_CHECK
	DAMAGE_CALC
	TYPE_CHECK
	IF8					FLAG_BIT,WazaStatusFlag,WAZASTATUSFLAG_NOCRITICAL,WAZA_RenzokuNoHitWait
	DAMAGE_LOSS
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	WAZAKOUKA_SE
	POKE_BLINK			SIDE_DEFENCE
	CLIENT_BIT_WAIT
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	CRITICAL_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	MESSAGE				BLANKMSGNO
	MESSAGE_WAIT		1
@	ADDVALUE			EvStrBuf0+4,1
	ADDVALUE			UserWork+RENZOKU_COUNT+4,1
	SETVALUE			UserWork+WKC_WORK0,WKC_IKARI_CHECK
	WKC_ACT				WKC_CHECK_KOKOMADE,WKC_DOUBLE_ATTACK
	IF8					FLAG_BIT,WazaStatusFlag,WAZASTATUSFLAG_KORAETA,WAZA_RenzokuNoHit
	LOOP				WAZA_RenzokuLoop
	JUMP				WAZA_RenzokuNoHit
WAZA_RenzokuNoHitWait:
	WAIT				MOJI_WAIT/2
WAZA_RenzokuNoHit:
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	IF8					FLAG_BIT,WazaStatusFlag,WAZASTATUSFLAG_NOCRITICAL,WAZA_RenzokuNoMsg
	SETWORK				EvStrBuf0,UserWork+RENZOKU_COUNT,6
	MESSAGE				RENZOKUHITMSGNO
	MESSAGE_WAIT		MOJI_WAIT
WAZA_RenzokuNoMsg:
	TSUIKA_CHECK
	KIZETSU_CHECK		SIDE_DEFENCE,0,0
	SETVALUE			UserWork+WKC_WORK0,WKC_SPEABI_SINKURO_DEFENCE
	WKC_ACT				WKC_CHECK_ONLY,0
	SETVALUE			UserWork+WKC_WORK0,WKC_SPEABI_CHECK_ALL
	WKC_ACT				WKC_CHECK_ALL,0
	WAZAEND

@===================================================
@	030 テクスチャー
@===================================================

WAZA_TextureHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	TEXTURE				WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				TEXTUREMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	031 追加効果で相手がひるむ
@===================================================

WAZA_HirumuHit:
	SETVALUE			ServerWork+3,COND2_HIRUMU
	JUMP				WAZA_NormalHit

@===================================================
@	032 自己再生
@===================================================

WAZA_JikosaiseiHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	KAIFUKU				WAZA_Mantan,SIDE_ATTACK
Jikosaisei:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
	MESSAGE				JIKOSAISEIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	033 相手に毒を与える（どくどく）
@===================================================

WAZA_DokudokuDirectHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	SPEABI_CHECK		SIDE_DEFENCE,TOKUSYU_MENEKI,WAZA_MenekiJump
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_Umakukimaran
	CONDITION_CHECK		SIDE_DEFENCE,CONDITION_DOKU,WAZA_DokudokuAlready
	CONDITION_CHECK		SIDE_DEFENCE,CONDITION_DOKUDOKU,WAZA_DokudokuAlready
	CONDITION_CHECK		SIDE_DEFENCE,CONDITION_BAD,WAZA_Umakukimaran
	CHECK_TYPE			SIDE_DEFENCE,POISON_TYPE,WAZA_Koukanai
	CHECK_TYPE			SIDE_DEFENCE,METAL_TYPE,WAZA_Koukanai
	HITCHECK			WAZA_Umakukimaran,0
	SIDECONDITION_CHECK	SIDE_DEFENCE,SIDE_CONDITION_SHINPI,WAZA_Shinpi
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			ServerWork+3,COND_DOKUDOKU
	TSUIKA_DIRECT_ACT
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
WAZA_DokudokuDirectHitEnd:
	JUMP				WAZA_WazaEnd
WAZA_DokudokuAlready:
	WAIT				MOJI_WAIT
	MESSAGE				DOKUMSG3NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

WAZA_MenekiJump:
	SETWORK				TsuikaClient,DefenceClient,1
	SETVALUE			ServerWork+5,0
	GOSUB				WAZA_Meneki
	JUMP				WAZA_WazaEnd
	

@===================================================
@	034 ねこにこばん
@===================================================

WAZA_NekonikobanHit:
	SETVALUE			ServerWork+3,COND2_NEKONIKOBAN
	JUMP				WAZA_NormalHit

@===================================================
@	035 特殊攻撃で受けるダメージが１／２になる
@===================================================

WAZA_HikarinokabeHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	HIKARINOKABE				
	JUMP				WAZA_Kabe

@===================================================
@	036 トライアタック
@===================================================

WAZA_TriAttackHit:
	SETVALUE			ServerWork+3,COND2_TRIATTACK
	JUMP				WAZA_NormalHit

@===================================================
@	037 ねむる
@===================================================

WAZA_NemuruHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	CONDITION_CHECK		SIDE_ATTACK,CONDITION_NEMURI,WAZA_SleepAlreadyA
	SAWAGU_CHECK		WAZA_NemuruNG
	NEMURU				WAZA_Mantan
	WAIT				MOJI_WAIT/2
	MESSAGE_TBL			NemuruMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	CONDITION_GAUGE		SIDE_ATTACK
	CLIENT_BIT_WAIT
	JUMP				WAZA_Kaifuku

WAZA_NemuruNG:
	WAIT				MOJI_WAIT
	MESSAGE_TBL			SleepNGMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

WAZA_SleepAlreadyA:
	WAIT				MOJI_WAIT/2
	MESSAGE				ALREADYSLEEPMSGANO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	038 一撃必殺
@===================================================

WAZA_IchigekiHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
@	WAZAKOUKA_CHECK		SIDE_DEFENCE,WAZAKOUKA_KIE,FLAG_ON,WAZA_Umakukimaran
	HITCHECK			WAZA_Umakukimaran,HITCHECK_KIE
	TYPE_CHECK
	IF8					FLAG_BIT,WazaStatusFlag,WAZASTATUSFLAG_NOCRITICAL,WAZA_Hit
	ICHIGEKI			WAZA_IchigekiNohit
	MICHIDURE_CHECK
	JUMP				WAZA_Hit
WAZA_IchigekiNohit:
	WAIT				MOJI_WAIT
	MESSAGE_TBL			IchigekiMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	039 １ターンためて攻撃（専用メッセージが必要）
@===================================================

WAZA_KamaitachiHit:
	CONDITION2_CHECK	SIDE_ATTACK,CONDITION2_KEEP,WAZA_TameAftar
	IF32				FLAG_BIT,ServerStatusFlag,SERVER_STATUS_FLAG_DOUBLE_CHECK,WAZA_TameAftar
	SETVALUE			UserWork+TAME_MSG_NO,0		@かまいたちのメッセージナンバー
	GOSUB				WAZA_TameBefore
	JUMP				WAZA_WazaEnd
WAZA_TameAftar:
	BADGECHECK
	SETVALUE			ServerWork+3,COND2_KEEP
	SETVALUE			UserWork+WAZA_EFF_CNT,1	@ため後の技エフェクト呼び出し
	SAKUJO				SIDE_ATTACK
@ためた後はPP_DECをしない
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NOPP_DEC
	IF16				FLAG_NE,WazaNo,WAZANO_GODDOBAADO,WAZA_NormalHit2
	SETVALUE			ServerWork+3,COND2_HIRUMU
	JUMP				WAZA_NormalHit2
WAZA_TameBefore:
	BADGECHECK
@	ATTACK_MESSAGE
@	CLIENT_BIT_WAIT
	MESSAGE				BLANKMSGNO
	PP_DEC
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_TAME
	SETVALUE			ServerWork+3,COND2_KEEP+TSUIKA_ATTACK
	TSUIKA_DIRECT_ACT
	SETWORK				ServerWork+5,UserWork+TAME_MSG_NO,1		@ため技系のメッセージナンバー
	MESSAGE_TBL			TameMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@===================================================
@	040 相手のＨＰを半分にする
@===================================================

WAZA_IkarinomaebaHit:
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
	ATTACK_MESSAGE
	PP_DEC
	TYPE_CHECK
	RESET8BIT			WazaStatusFlag,WAZASTATUSFLAG_BATSUGUN|WAZASTATUSFLAG_IMAHITOTSU
	HPHALF
	JUMP				WAZA_Hit

@===================================================
@	041 固定ダメージ40
@===================================================

WAZA_Kotei40Hit:
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
	ATTACK_MESSAGE
	PP_DEC
	TYPE_CHECK
	RESET8BIT			WazaStatusFlag,WAZASTATUSFLAG_BATSUGUN|WAZASTATUSFLAG_IMAHITOTSU
	SETVALUE			WazaDamage,40
	SETVALUE			WazaDamage+1,0
	SETVALUE			WazaDamage+2,0
	SETVALUE			WazaDamage+3,0
	KORAERU_CHECK
	JUMP				WAZA_Hit

@===================================================
@	042 ２～５ターンしめつけ
@===================================================

WAZA_ShimeHit:
	IF16				FLAG_NE,WazaNo,WAZANO_UZUSIO,WAZA_ShimeHitStart
	WAZAKOUKA_CHECK		SIDE_DEFENCE,WAZAKOUKA_DAIBINGU,FLAG_OFF,WAZA_ShimeHitStart
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_DAIBINGUHIT
	SETVALUE			UserWork+DAMAGE_VALUE,2
WAZA_ShimeHitStart:
	SETVALUE			ServerWork+3,COND2_SHIME
	JUMP				WAZA_NormalHit

@===================================================
@	044 連続で２回攻撃が当たる
@===================================================

WAZA_Renzoku2Hit:
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
						@ヒットしなかったら、指定したアドレスへジャンプ
	ATTACK_MESSAGE
	PP_DEC
	RENZOKU				2					@0以外は指定回数
	RENZOKU_NUM_INIT
	@ダブルニードルを使うとこのワークに値が入っているので、初期化しておく（念のため）
	SETVALUE			UserWork+SERVER_WORK3_TEMP,0
	JUMP				WAZA_RenzokuLoop

@===================================================
@	045 攻撃が外れると、与えるはずのダメージの１／２を自分が受ける
@===================================================

WAZA_TobigeriHit:
	BADGECHECK
	HITCHECK			WAZA_TobigeriNohit,0
						@ヒットしなかったら、指定したアドレスへジャンプ
	JUMP				WAZA_HitCalc
WAZA_TobigeriNohit:
	ATTACK_MESSAGE
	PP_DEC
	WAIT				MOJI_WAIT
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	IF8					FLAG_BIT,WazaStatusFlag,WAZASTATUSFLAG_KOUKANAI,WAZA_WazaEnd
	MESSAGE				TOBIGERIMISSMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	DAMAGE_CALC
	TYPE_CHECK
	DAMAGE_LOSS
	DAMAGE_CHG			DAMAGE_HALF
	RESET8BIT			WazaStatusFlag,WAZASTATUSFLAG_NOHIT
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
	KIZETSU_CHECK		SIDE_ATTACK,0,0
	SET8BIT				WazaStatusFlag,WAZASTATUSFLAG_NOHIT
	JUMP				WAZA_WazaEnd

@===================================================
@	046 ステータスを変化させる補助攻撃を受けなくなる
@===================================================

WAZA_ShiroiKiriHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	SHIROIKIRI
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE_TBL			ShiroikiriMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	047 クリティカル率をアップする
@===================================================

WAZA_KiaidameHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	CONDITION2_CHECK	SIDE_ATTACK,CONDITION2_KIAIDAME,WAZA_Umakukimaran
	KIAIDAME
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE_TBL			KiaidameMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	048 与えたダメージの１／４が自分にはねかえってくる
@===================================================

WAZA_HanekaeriHit:
	SETVALUE			ServerWork+3,COND2_HANEKAERI+TSUIKA_ALWAYS+TSUIKA_ATTACK
	IF16				FLAG_NE,WazaNo,WAZANO_WARUAGAKI,WAZA_NormalHit
	INC_RECORD			CNT_WAZA_WARUAGAKI	@わるあがきをした回数をCountUp
	JUMP				WAZA_NormalHit

@===================================================
@	049 相手を混乱させる
@===================================================

WAZA_KonranDirectHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	SPEABI_CHECK		SIDE_DEFENCE,TOKUSYU_MAIPEESU,WAZA_Mypace
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_Umakukimaran
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_KONRAN,WAZA_KonranAlready
	HITCHECK			WAZA_Umakukimaran,0
	SIDECONDITION_CHECK	SIDE_DEFENCE,SIDE_CONDITION_SHINPI,WAZA_Shinpi
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			ServerWork+3,COND2_KONRAN
	TSUIKA_DIRECT_ACT
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd
WAZA_KonranAlready:
	WAIT				MOJI_WAIT/2
	MESSAGE				KONRANMSG5NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	050 自分の攻撃力を２ランク上げる
@===================================================

WAZA_PowUp2Hit:
	SETVALUE			UserWork+COND_CHG_WORK,COND_POW+PARA_RANKU2
	JUMP				WAZA_CondUp

@===================================================
@	051 自分の防御力を２ランク上げる
@===================================================

WAZA_DefUp2Hit:
	SETVALUE			UserWork+COND_CHG_WORK,COND_DEF+PARA_RANKU2
	JUMP				WAZA_CondUp

@===================================================
@	052 自分の素早さを２ランク上げる
@===================================================

WAZA_AgiUp2Hit:
	SETVALUE			UserWork+COND_CHG_WORK,COND_AGI+PARA_RANKU2
	JUMP				WAZA_CondUp

@===================================================
@	053 自分の特殊攻撃力を２ランク上げる
@===================================================

WAZA_SpePowUp2Hit:
	SETVALUE			UserWork+COND_CHG_WORK,COND_SPEPOW+PARA_RANKU2
	JUMP				WAZA_CondUp

@===================================================
@	054 自分の特殊防御力を２ランク上げる
@===================================================

WAZA_SpeDefUp2Hit:
	SETVALUE			UserWork+COND_CHG_WORK,COND_SPEDEF+PARA_RANKU2
	JUMP				WAZA_CondUp

@===================================================
@	057 へんしん
@===================================================

WAZA_HenshinHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	HENSHIN
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE_TBL			HenshinMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	058 相手の攻撃力を２ランク下げる
@===================================================

WAZA_PowDown2Hit:
	SETVALUE			UserWork+COND_CHG_WORK,COND_POW+PARA_RANKD2
	JUMP				WAZA_CondDown

@===================================================
@	059 相手の防御力を２ランク下げる
@===================================================

WAZA_DefDown2Hit:
	SETVALUE			UserWork+COND_CHG_WORK,COND_DEF+PARA_RANKD2
	JUMP				WAZA_CondDown

@===================================================
@	060 相手の素早さを２ランク下げる
@===================================================

WAZA_AgiDown2Hit:
	SETVALUE			UserWork+COND_CHG_WORK,COND_AGI+PARA_RANKD2
	JUMP				WAZA_CondDown

@===================================================
@	062 相手の特殊防御力を２ランク下げる
@===================================================

WAZA_SpeDefDown2Hit:
	SETVALUE			UserWork+COND_CHG_WORK,COND_SPEDEF+PARA_RANKD2
	JUMP				WAZA_CondDown

@===================================================
@	065 物理攻撃で受けるダメージが１／２になる
@===================================================

WAZA_ReflecHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	REFLEC				
WAZA_Kabe:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE_TBL			ReflecMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	066 相手に毒を与える
@===================================================

WAZA_DokuDirectHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	SPEABI_CHECK		SIDE_DEFENCE,TOKUSYU_MENEKI,WAZA_MenekiJump
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_Umakukimaran
	CONDITION_CHECK		SIDE_DEFENCE,CONDITION_DOKU,WAZA_DokudokuAlready
	CONDITION_CHECK		SIDE_DEFENCE,CONDITION_DOKUDOKU,WAZA_DokudokuAlready
	CHECK_TYPE			SIDE_DEFENCE,POISON_TYPE,WAZA_Koukanai
	CHECK_TYPE			SIDE_DEFENCE,METAL_TYPE,WAZA_Koukanai
	CONDITION_CHECK		SIDE_DEFENCE,CONDITION_BAD,WAZA_Umakukimaran
	HITCHECK			WAZA_Umakukimaran,0
	SIDECONDITION_CHECK	SIDE_DEFENCE,SIDE_CONDITION_SHINPI,WAZA_Shinpi
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			ServerWork+3,COND_DOKU
	TSUIKA_DIRECT_ACT
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	067 相手をまひさせる
@===================================================

WAZA_MahiDirectHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	SPEABI_CHECK		SIDE_DEFENCE,TOKUSYU_ZYUUNAN,WAZA_JuunanJump
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_Umakukimaran
	TYPE_CHECK
	IF8					FLAG_BIT,WazaStatusFlag,WAZASTATUSFLAG_NOCRITICAL,WAZA_Umakukimaran
	CONDITION_CHECK		SIDE_DEFENCE,CONDITION_MAHI,WAZA_MahiAlready
	CONDITION_CHECK		SIDE_DEFENCE,CONDITION_BAD,WAZA_Umakukimaran
	HITCHECK			WAZA_Umakukimaran,0
	SIDECONDITION_CHECK	SIDE_DEFENCE,SIDE_CONDITION_SHINPI,WAZA_Shinpi
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			ServerWork+3,COND_MAHI
	TSUIKA_DIRECT_ACT
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

WAZA_MahiAlready:
	WAIT				MOJI_WAIT/2
	MESSAGE				MAHIMSG3NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

WAZA_JuunanJump:
	SETWORK				TsuikaClient,DefenceClient,1
	SETVALUE			ServerWork+5,0
	GOSUB				WAZA_Juunan
	JUMP				WAZA_WazaEnd

@===================================================
@	068 追加効果で相手の攻撃力を１ランク下げる
@===================================================

WAZA_PowDownAddHit:
	SETVALUE			ServerWork+3,COND2_POWDOWN
	JUMP				WAZA_NormalHit

@===================================================
@	069 追加効果で相手の防御力を１ランク下げる
@===================================================

WAZA_DefDownAddHit:
	SETVALUE			ServerWork+3,COND2_DEFDOWN
	JUMP				WAZA_NormalHit

@===================================================
@	070 追加効果で相手の素早さを１ランク下げる
@===================================================

WAZA_AgiDownAddHit:
	SETVALUE			ServerWork+3,COND2_AGIDOWN
	JUMP				WAZA_NormalHit

@===================================================
@	071 追加効果で相手の特殊攻撃力を１ランク下げる
@===================================================

WAZA_SpePowDownAddHit:
	SETVALUE			ServerWork+3,COND2_SPEPOWDOWN
	JUMP				WAZA_NormalHit

@===================================================
@	072 追加効果で相手の特殊防御力を１ランク下げる
@===================================================

WAZA_SpeDefDownAddHit:
	SETVALUE			ServerWork+3,COND2_SPEDEFDOWN
	JUMP				WAZA_NormalHit

@===================================================
@	073 追加効果で相手の命中率を１ランク下げる
@===================================================

WAZA_HitDownAddHit:
	SETVALUE			ServerWork+3,COND2_HITDOWN
	JUMP				WAZA_NormalHit

@===================================================
@	075 ため＋きぜつの追加効果
@===================================================

WAZA_GodBirdHit:
	CONDITION2_CHECK	SIDE_ATTACK,CONDITION2_KEEP,WAZA_TameAftar
	IF32				FLAG_BIT,ServerStatusFlag,SERVER_STATUS_FLAG_DOUBLE_CHECK,WAZA_TameAftar
	SETVALUE			UserWork+TAME_MSG_NO,3		@ゴッドバードのメッセージナンバー
	GOSUB				WAZA_TameBefore
	JUMP				WAZA_WazaEnd

@===================================================
@	076 追加効果で相手を混乱させる
@===================================================

WAZA_KonranAddHit:
	SETVALUE			ServerWork+3,COND2_KONRAN
	JUMP				WAZA_NormalHit

@===================================================
@	077 連続で２回攻撃し、追加効果で相手をどく状態にする
@===================================================

WAZA_RenzokuDokuAddHit:
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
						@ヒットしなかったら、指定したアドレスへジャンプ
@	SETVALUE			ServerWork+3,COND_DOKU
	SETVALUE			UserWork+SERVER_WORK3_TEMP,COND_DOKU
	ATTACK_MESSAGE
	PP_DEC
	RENZOKU				2					@0以外は指定回数
	RENZOKU_NUM_INIT
	JUMP				WAZA_RenzokuLoop

@===================================================
@	079 みがわりを出す
@===================================================

WAZA_MigawariHit:
	BADGECHECK
	PP_DEC
	ATTACK_MESSAGE
	CLIENT_BIT_WAIT
	CONDITION2_CHECK	SIDE_ATTACK,CONDITION2_MIGAWARI,WAZA_MigawariAlready
	MIGAWARI
	IF8					FLAG_NE,ServerWork+5,1,WAZA_MigawariEff
	WAIT				MOJI_WAIT/2
	JUMP				WAZA_MigawariNoEff
WAZA_MigawariEff:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
WAZA_MigawariNoEff:
	MESSAGE_TBL			MigawariMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd
WAZA_MigawariAlready:
	WAIT				MOJI_WAIT/2
	MESSAGE				MIGAWARIALREADYMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	080 攻撃の次の１ターン行動不能になる
@===================================================

WAZA_HandouHit:
@	CONDITION2_CHECK	SIDE_ATTACK,CONDITION2_HANDOU,WAZA_Handou
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
						@ヒットしなかったら、指定したアドレスへジャンプ
	SETVALUE			ServerWork+3,COND2_HANDOU+TSUIKA_ALWAYS+TSUIKA_ATTACK
@	TSUIKA_DIRECT_ACT
@	SETVALUE			ServerWork+3,0
	JUMP				WAZA_HitCalc

WAZA_Handou:
	MESSAGE				HANDOUMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	081 いかり
@===================================================

WAZA_IkariHit:
	BADGECHECK
	HITCHECK			WAZA_IkariNohit,0
						@ヒットしなかったら、指定したアドレスへジャンプ
	SETVALUE			ServerWork+3,COND2_IKARI
	TSUIKA_DIRECT_ACT
	SETVALUE			ServerWork+3,0
	JUMP				WAZA_HitCalc
WAZA_IkariNohit:
	SETVALUE			ServerWork+3,COND2_IKARI
	SAKUJO				SIDE_ATTACK
	JUMP				WAZA_NormalNohit	

@===================================================
@	082 ものまね
@===================================================

WAZA_MonomaneHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_Umakukimaran
@	WAZAKOUKA_CHECK		SIDE_DEFENCE,WAZAKOUKA_KIE,FLAG_ON,WAZA_Umakukimaran
	HITCHECK			WAZA_Umakukimaran,HITCHECK_KIE
	MONOMANE			WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				MONOMANEMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	083 ゆびをふる
@===================================================

WAZA_YubiwohuruHit:
	BADGECHECK
	ATTACK_MESSAGE
	WAIT				MOJI_WAIT/2
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			UserWork+WAZA_EFF_CNT,0
	SETVALUE			UserWork+WAZA_EFF_CNT_TMP,0
	YUBIWOHURU

@===================================================
@	084 やどりぎ
@===================================================

WAZA_YadorigiHit:
	BADGECHECK
	ATTACK_MESSAGE
	WAIT				MOJI_WAIT/2
	PP_DEC
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_Umakukimaran
	HITCHECK			YadorigiNext,0
YadorigiNext:
	YADORIGI		
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE_TBL			YadorigiMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	085 何もおこらない
@===================================================

WAZA_HaneruHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	INC_RECORD			CNT_WAZA_HANERU		@はねるをした回数をCountUp
	MESSAGE				NANIMOOKORANMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	086 相手が直前に出した技を封じる
@===================================================

WAZA_KanashibariHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
@	GUARDCHECK			WAZA_Umakukimaran			@まもる、みきりチェック
	HITCHECK			WAZA_Umakukimaran,0
	KANASHIBARI			WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				KANASHIBARIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	087 自分のレベル分のダメージを与える
@===================================================

WAZA_ChikyuuNageHit:
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
	ATTACK_MESSAGE
	PP_DEC
	TYPE_CHECK
	RESET8BIT			WazaStatusFlag,WAZASTATUSFLAG_BATSUGUN|WAZASTATUSFLAG_IMAHITOTSU
	CHIKYUUNAGE
	KORAERU_CHECK
	JUMP				WAZA_Hit

@===================================================
@	088 １～自分のレベル分のダメージを与える
@===================================================

WAZA_PsychoWaveHit:
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
	ATTACK_MESSAGE
	PP_DEC
	TYPE_CHECK
	RESET8BIT			WazaStatusFlag,WAZASTATUSFLAG_BATSUGUN|WAZASTATUSFLAG_IMAHITOTSU
	PSYCHOWAVE
	KORAERU_CHECK
	JUMP				WAZA_Hit

@===================================================
@	089 相手の物理攻撃のダメージを倍にして返す
@===================================================

WAZA_CounterHit:
.if 0
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
	COUNTER				WAZA_UmakukimaranPP
	ATTACK_MESSAGE
	PP_DEC
	TYPE_CHECK_NO_HIT
	KORAERU_CHECK
	JUMP				WAZA_Hit
.else
	BADGECHECK
	COUNTER				WAZA_UmakukimaranPP
	HITCHECK			WAZA_NormalNohit,0
	ATTACK_MESSAGE
	PP_DEC
	TYPE_CHECK_NO_HIT
	KORAERU_CHECK
	JUMP				WAZA_Hit
.endif

@===================================================
@	090 アンコール
@===================================================

WAZA_EncoreHit:
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
	ATTACK_MESSAGE
	PP_DEC
	ENCORE				WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				ENCOREMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	091 いたみわけ
@===================================================

WAZA_ItamiwakeHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
@	GUARDCHECK			WAZA_Umakukimaran			@まもる、みきりチェック
@	WAZAKOUKA_CHECK		SIDE_DEFENCE,WAZAKOUKA_KIE,FLAG_ON,WAZA_Umakukimaran
	HITCHECK			WAZA_Umakukimaran,HITCHECK_KIE
	ITAMIWAKE			WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
	SETWORK				WazaDamage,UserWork+ITAMIWAKE_WORK,4
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	MESSAGE				ITAMIWAKEMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	092 いびき
@===================================================

WAZA_IbikiHit:
	BADGECHECK
	CONDITION_CHECK		SIDE_ATTACK,CONDITION_NEMURI,WAZA_Ibiki
	ATTACK_MESSAGE
	PP_DEC
	JUMP				WAZA_Umakukimaran
WAZA_Ibiki:
	@ねごとから発生したいびきでは「ぐうぐうねている」を出さない
	IF16				FLAG_EQ,WazaNoTmp,WAZANO_NEGOTO,WAZA_IbikiNoMsg
	MESSAGE				SLEEPMSG1NO
	MESSAGE_WAIT		MOJI_WAIT
	STATUS_EFFECT		SIDE_ATTACK
WAZA_IbikiNoMsg:
	ATTACK_MESSAGE
	PP_DEC
	HITCHECK			WAZA_NormalNohit2,0
	SETVALUE			ServerWork+3,COND2_HIRUMU
	JUMP				WAZA_HitCalcOnly

@===================================================
@	093 自分のタイプをランダムで変えてしまう
@===================================================

WAZA_Texture2Hit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	TEXTURE2			WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				TEXTUREMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	094 次の自分の攻撃の命中率を１００％にする
@===================================================

WAZA_LockOnHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_Umakukimaran
	HITCHECK			WAZA_Umakukimaran,0
	LOCKON
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				LOCKONMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	095 スケッチ
@===================================================

WAZA_SketchHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_Umakukimaran
	SKETCH				WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				SKETCHMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	097 自分が眠り状態の時、他の３つの技の１つをランダムで出す
@===================================================

WAZA_NegotoHit:
	BADGECHECK
	CONDITION_CHECK		SIDE_ATTACK,CONDITION_NEMURI,WAZA_Negoto
	ATTACK_MESSAGE
WAZA_UmakukimaranJump:
	PP_DEC
	JUMP				WAZA_Umakukimaran
WAZA_Negoto:
	MESSAGE				SLEEPMSG1NO
	MESSAGE_WAIT		MOJI_WAIT
	STATUS_EFFECT		SIDE_ATTACK
	ATTACK_MESSAGE
	PP_DEC
	@ねごとから発生した技のPPをDecしないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NOPP_DEC
	NEGOTO				WAZA_NegotoOK
	WAIT				MOJI_WAIT
	JUMP				WAZA_Umakukimaran
WAZA_NegotoOK:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			UserWork+WAZA_EFF_CNT,0
	SETVALUE			UserWork+WAZA_EFF_CNT_TMP,0
	WAZASEQADRS			1

@===================================================
@	098 次の相手の攻撃で自分がひんしになると、相手もひんしになる
@===================================================

WAZA_MichidureHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	MICHIDURE
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				MICHIDUREMSG1NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	099 自分の体力が少ないほど攻撃力が上がる
@===================================================

WAZA_JitabataHit:
	JITABATA
	JUMP				WAZA_NormalHit

@===================================================
@	100 相手のＰＰを２～５削る
@===================================================

WAZA_UramiHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
@	GUARDCHECK			WAZA_Umakukimaran			@まもる、みきりチェック
	HITCHECK			WAZA_Umakukimaran,0
	URAMI				WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				URAMIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	102 自分の状態変化を直す
@===================================================

WAZA_IyashinosuzuHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	IYASHINOSUZU
	CLIENT_BIT_WAIT
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE_TBL			IyashiNoSuzuMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	IF16				FLAG_NE,WazaNo,WAZANO_IYASINOSUZU,WAZA_IyashinosuzuNext
WAZA_IyashinosuzuBouon:
	IF8					FLAG_NBIT,ServerWork+5,1,WAZA_IyashinosuzuBouonNext
	MESSAGE				BOUONMSGNO
	MESSAGE_WAIT		MOJI_WAIT
WAZA_IyashinosuzuBouonNext:
	IF8					FLAG_NBIT,ServerWork+5,2,WAZA_IyashinosuzuNext
	MESSAGE				BOUONMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
WAZA_IyashinosuzuNext:
	CONDITION_GAUGE		SIDE_ATTACK_DOUBLE
	CLIENT_BIT_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	104 トリプルキック。１～３回当たる。ダメージは1＜２＜３
@===================================================

WAZA_TripleKickHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	SETVALUE			UserWork+TRIPLE_KICK_POW+0,0
	SETVALUE			UserWork+TRIPLE_KICK_POW+1,0
	RENZOKU_NUM_INIT
	LOOPCNT				3
WAZA_TripleKickLoop:
	HP_CHECK			SIDE_ATTACK,WAZA_TripleKickNoMsg
	HP_CHECK			SIDE_DEFENCE,WAZA_TripleKickNohitWait
	IF16				FLAG_EQ,WazaNoTmp,WAZANO_NEGOTO,WAZA_TripleKickStart
	CONDITION_CHECK		SIDE_ATTACK,CONDITION_NEMURI,WAZA_TripleKickNohitWait
WAZA_TripleKickStart:
@	SETVALUE			WazaStatusFlag,0
	LOOPINIT			@ループするときに初期化するワークがまとまっている
	HITCHECK			WAZA_TripleKickNohitWait,0
						@ヒットしなかったら、指定したアドレスへジャンプ
	ADDVALUE			UserWork+TRIPLE_KICK_POW+0,10
@	ADDVALUE			EvStrBuf0+4,1
	ADDVALUE			UserWork+RENZOKU_COUNT+4,1
	SETWORK				DamagePowWork,UserWork+TRIPLE_KICK_POW+0,2
	CRITICAL_CHECK
	DAMAGE_CALC
	TYPE_CHECK
	DAMAGE_LOSS
@	KORAERU_CHECK		@もしかしたら入れないとだめかも
	IF8					FLAG_BIT,WazaStatusFlag,WAZASTATUSFLAG_NOCRITICAL,WAZA_TripleKickNohitWait
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	WAZAKOUKA_SE
	POKE_BLINK			SIDE_DEFENCE
	CLIENT_BIT_WAIT
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	CRITICAL_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	MESSAGE				BLANKMSGNO
	MESSAGE_WAIT		1
	SETVALUE			UserWork+WKC_WORK0,WKC_IKARI_CHECK
	WKC_ACT				WKC_CHECK_KOKOMADE,WKC_DOUBLE_ATTACK
	IF8					FLAG_BIT,WazaStatusFlag,WAZASTATUSFLAG_KORAETA,WAZA_TripleKickNohit
	LOOP				WAZA_TripleKickLoop
	JUMP				WAZA_TripleKickNohit
WAZA_TripleKickNohitWait:
	WAIT				MOJI_WAIT/2
WAZA_TripleKickNohit:
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
@	IF8					FLAG_BIT,WazaStatusFlag,WAZASTATUSFLAG_NOCRITICAL,WAZA_RenzokuNoMsg
	IF8					FLAG_EQ,UserWork+RENZOKU_COUNT+4,0,WAZA_TripleKickNoMsg
	SETWORK				EvStrBuf0,UserWork+RENZOKU_COUNT,6
	MESSAGE				RENZOKUHITMSGNO
	MESSAGE_WAIT		MOJI_WAIT
WAZA_TripleKickNoMsg:
	TSUIKA_CHECK
	KIZETSU_CHECK		SIDE_DEFENCE,0,0
	SETVALUE			UserWork+WKC_WORK0,WKC_HIT_FLAG_SET
	WKC_ACT				WKC_CHECK_ALL,0
	WAZAEND

@===================================================
@	105 相手が装備しているどうぐを盗む
@===================================================

WAZA_DorobouHit:
	SETVALUE			ServerWork+3,COND2_DOROBOU
	JUMP				WAZA_NormalHit

@===================================================
@	106 相手を逃げられなくする。
@===================================================

WAZA_KuroimanazashiHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
@	GUARDCHECK			WAZA_Umakukimaran			@まもる、みきりチェック
	HITCHECK			WAZA_Umakukimaran,HITCHECK_GUARD
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_KUROIMANAZASHI,WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			ServerWork+3,COND2_KUROIMANAZASHI
	TSUIKA_DIRECT_ACT
	MESSAGE				KUROIMANAZASHIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	107 悪夢
@===================================================

WAZA_AkumuHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_Umakukimaran
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_AKUMU,WAZA_Umakukimaran
	CONDITION_CHECK		SIDE_DEFENCE,CONDITION_NEMURI,WAZA_AddAkumu
	JUMP				WAZA_Umakukimaran
WAZA_AddAkumu:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			ServerWork+3,COND2_AKUMU
	TSUIKA_DIRECT_ACT
	MESSAGE				AKUMUMSG1NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	108 ちいさくなる
@===================================================

WAZA_ChiisakunaruHit:
	BADGECHECK
	CHIISAKUNARU
	SETVALUE			UserWork+COND_CHG_WORK,COND_AVOID+PARA_RANKU1
	JUMP				WAZA_CondUp2

@===================================================
@	109 のろい
@===================================================

WAZA_NoroiHit:
	MONS_TYPE			SIDE_ATTACK,GHOST_TYPE,WAZA_GhostNoroi
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	CONDCHG_CHECK		SIDE_ATTACK,IFC,COND_AGI,0,WAZA_NoroiStart
	CONDCHG_CHECK		SIDE_ATTACK,IFNE,COND_POW,12,WAZA_NoroiStart
	CONDCHG_CHECK		SIDE_ATTACK,IFEQ,COND_DEF,12,WAZA_Umakukimaran
WAZA_NoroiStart:
	SETWORK				DefenceClient,AttackClient,1
	SETVALUE			UserWork+WAZA_EFF_CNT,1	@ノーマル用のエフェクトナンバー
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			UserWork+COND_CHG_WORK,COND_AGI+PARA_RANKD1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_NoroiNoAgiDown
	MESSAGE_TBL			CondDownMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_NoroiNoAgiDown:
	SETVALUE			UserWork+COND_CHG_WORK,COND_POW+PARA_RANKU1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_NoroiNoPowUp
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_NoroiNoPowUp:
	SETVALUE			UserWork+COND_CHG_WORK,COND_DEF+PARA_RANKU1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_NoroiNoDefUp
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_NoroiNoDefUp:
	JUMP				WAZA_WazaEnd
WAZA_GhostNoroi:
	IFWNE				AttackClient,DefenceClient,1,WAZA_GhostNoroiStart
	SUBROUTINE_CALL		SIDE_ATTACK,DEFENCE_CLIENT_GET
WAZA_GhostNoroiStart:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_Umakukimaran
	NOROI				WAZA_Umakukimaran
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI
	SETVALUE			UserWork+WAZA_EFF_CNT,0	@ゴースト用のエフェクトナンバー
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
	MESSAGE				NOROIMSG1NO
	MESSAGE_WAIT		MOJI_WAIT
	KIZETSU_CHECK		SIDE_ATTACK,0,0
	JUMP				WAZA_WazaEnd

@===================================================
@	111 次の相手の攻撃を受けない
@===================================================

@===================================================
@	116 次の相手の攻撃を受けても体力が１残る
@===================================================

WAZA_MamoruHit:
WAZA_KoraeruHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	GUARD_SUCCESS_CHECK
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE_TBL			MamoruMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	112 まきびし
@===================================================

WAZA_MakibishiHit:
	BADGECHECK
	MAKIBISHI			WAZA_UmakukimaranPP
	ATTACK_MESSAGE
	PP_DEC
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				MAKIBISHIMSG1NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	113 みやぶる
@===================================================

WAZA_MiyaburuHit:
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
	ATTACK_MESSAGE
	PP_DEC
	MIYABURU
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				MIYABURUMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	114 ほろびのうた
@===================================================

WAZA_HorobinoutaHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	HOROBINOUTA			WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				HOROBINOUTAMSG1NO
	MESSAGE_WAIT		MOJI_WAIT
	SETVALUE			UserWork+CLIENT_NO_WORK,0
WAZA_HorobinoutaLoop:
	SPEABI_CHECK		SIDE_CLIENTNOWORK,TOKUSYU_BOUON,WAZA_HorobinoutaBouon
WAZA_HorobinoutaNext:
	ADDVALUE			UserWork+CLIENT_NO_WORK,1
	IFWNE				UserWork+CLIENT_NO_WORK,ClientSetMax,1,WAZA_HorobinoutaLoop
	JUMP				WAZA_WazaEnd

WAZA_HorobinoutaBouon:
	MESSAGE				BOUONMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_HorobinoutaNext

@===================================================
@	115 すなあらし
@===================================================

WAZA_SunaarashiHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	SUNAARASHI
	JUMP				WAZA_Tenkou

@===================================================
@	117 ５ターン連続で攻撃、ターンごとに威力が上がる
@===================================================

WAZA_KorogaruHit:
	BADGECHECK
	ATTACK_MESSAGE
@ころがっている間はPPをDECしない
	CONDITION2_CHECK	SIDE_ATTACK,CONDITION2_KEEP,WAZA_KorogaruNoPPDec
	PP_DEC
WAZA_KorogaruNoPPDec:
	HITCHECK			WAZA_Korogaru,0
WAZA_Korogaru:
	TYPE_CHECK_NO_HIT
	KOROGARU
	JUMP				WAZA_HitCalcOnly

@===================================================
@	118 相手の攻撃力を２段階上げてこんらんさせる
@===================================================

WAZA_IbaruHit:
	BADGECHECK
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_NormalNohitBitSet
	HITCHECK			WAZA_NormalNohit,0
	ATTACK_MESSAGE
	PP_DEC
	IBARU				COND_POW,WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			UserWork+COND_CHG_WORK,COND_POW+PARA_RANKU2
	CONDCHG				TSUIKA_DIRECT,WAZA_IbaruNoMsg
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_IbaruNoMsg
	COND_CHG_WORK_SET
	FIGHT_EFFECT		SIDE_DEFENCE,FE_ID_STATUS_UPDOWN,UserWork+FIGHT_EFFECT_WORK
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_IbaruNoMsg:
	SPEABI_CHECK		SIDE_DEFENCE,TOKUSYU_MAIPEESU,WAZA_Mypace
	SIDECONDITION_CHECK	SIDE_DEFENCE,SIDE_CONDITION_SHINPI,WAZA_Shinpi
	SETVALUE			ServerWork+3,COND2_KONRAN
	TSUIKA_DIRECT_ACT
	JUMP				WAZA_WazaEnd

@===================================================
@	119 連続で出すごとに威力が上がる
@===================================================

WAZA_RenzokugiriHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	HITCHECK			WAZA_Renzokugiri,0
WAZA_Renzokugiri:
	RENZOKUGIRI
	CRITICAL_CHECK
	DAMAGE_CALC
	TYPE_CHECK
	IF8					FLAG_BIT,WazaStatusFlag,WAZASTATUSFLAG_NOCRITICAL,WAZA_Renzokugiri
	DAMAGE_LOSS
	JUMP				WAZA_Hit

@===================================================
@	120 相手をメロメロ状態にする
@===================================================

WAZA_MeromeroHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
@	GUARDCHECK			WAZA_Umakukimaran			@まもる、みきりチェック
	HITCHECK			WAZA_Umakukimaran,0
	MEROMERO			WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				MEROMEROMSG1NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	121 なつき度が高いほど威力が高い
@	123 なつき度が低いほど威力が高い
@===================================================

WAZA_NatsukiHit:
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
	NATSUKI
	JUMP				WAZA_HitCalc

@===================================================
@	122 プレゼント
@===================================================

WAZA_PresentHit:
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
	ATTACK_MESSAGE
	PP_DEC
	TYPE_CHECK
	PRESENT				

@===================================================
@	124 ５ターンの間、状態変化（どく、まひ）を受けない
@===================================================

WAZA_ShinpinomamoriHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	SHINPINOMAMORI		
	JUMP				WAZA_Kabe

@===================================================
@	125 やけどの追加効果＋こおり状態の場合はこおりが溶ける
@===================================================

WAZA_KaengurumaHit:
@	SETVALUE			ServerWork+3,COND2_KAENGURUMA+TSUIKA_ALWAYS
	SETVALUE			ServerWork+3,COND_YAKEDO
	JUMP				WAZA_NormalHit

@===================================================
@	126 マグニチュード
@===================================================

WAZA_MagnitudeHit:
.if 0
	BADGECHECK
	WAZAKOUKA_CHECK		SIDE_DEFENCE,WAZAKOUKA_ANAWOHORU,FLAG_OFF,WAZA_Magnitude
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_ANAWOHORUHIT
	SETVALUE			UserWork+DAMAGE_VALUE,2
WAZA_Magnitude:
	HITCHECK			WAZA_NormalNohit,0
	ATTACK_MESSAGE
	WAIT				MOJI_WAIT/2
	PP_DEC
	MAGNITUDE		
	MESSAGE				MAGNITUDEMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_HitCalcOnly
.endif
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	JISIN
	MAGNITUDE		
	WAIT				MOJI_WAIT/2
	MESSAGE				MAGNITUDEMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_JisinLoop

@===================================================
@	127 バトンタッチ
@===================================================

WAZA_BatontouchHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	RESHUFFLE_CHECK		SIDE_ATTACK+0x80,WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	POKE_RESHUFFLE		SIDE_ATTACK,WAZA_Umakukimaran
	SIZENKAIHUKU		SIDE_ATTACK
	CLIENT_BIT_WAIT
	POKE_RESHUFFLE_WAIT	SIDE_ATTACK,PRW_NORMAL
	POKEDELACTOR		SIDE_ATTACK
	APPEAR_EFFECT_INIT	SIDE_ATTACK
	APPEAR_EFFECT		SIDE_ATTACK
@	MESSAGE_TBL			PokeAppearMsgTbl
	POKE_HPMAX_RATE		SIDE_ATTACK
	MESSAGE				IREKAEAFTERMSGNO
@	WAIT				MOJI_WAIT/2
	APPEAR_EFFECT_WAIT	SIDE_ATTACK,APPEAR_BATONTOUCH
	CLIENT_BIT_WAIT
	POKE_RESHUFFLE_END	SIDE_ATTACK
	JUMP				WAZA_WazaEnd

@===================================================
@	129 こうそくスピン
@===================================================

WAZA_KousokuSpinHit:
	SETVALUE			ServerWork+3,COND2_KOUSOKUSPIN+TSUIKA_ALWAYS
	JUMP				WAZA_NormalHit

@===================================================
@	130 固定ダメージ20
@===================================================

WAZA_Kotei20Hit:
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
	ATTACK_MESSAGE
	PP_DEC
	TYPE_CHECK
	RESET8BIT			WazaStatusFlag,WAZASTATUSFLAG_BATSUGUN|WAZASTATUSFLAG_IMAHITOTSU
	SETVALUE			WazaDamage+0,20
	SETVALUE			WazaDamage+1,0
	SETVALUE			WazaDamage+2,0
	SETVALUE			WazaDamage+3,0
	KORAERU_CHECK
	JUMP				WAZA_Hit

@===================================================
@	132 体力を半分回復。朝だと全回復
@	133 体力を半分回復。昼だと全回復
@	134 体力を半分回復。夜、深夜だと全回復
@===================================================

WAZA_WeatherkaifukuHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	WEATHERKAIFUKU		WAZA_Mantan
	JUMP				WAZA_Kaifuku

@===================================================
@	135 めざめるパワー
@===================================================

WAZA_MezameruPowerHit:
	MEZAMERUPOWER
	JUMP				WAZA_NormalHit

@===================================================
@	136 あまごい
@===================================================

WAZA_AmagoiHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	AMAGOI
WAZA_Tenkou:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE_TBL			TenkouMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	GOSUB				WAZA_TenkiyaCheck
	JUMP				WAZA_WazaEnd

@===================================================
@	137 にほんばれ
@===================================================

WAZA_NihonbareHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	NIHONBARE
	JUMP				WAZA_Tenkou

@===================================================
@	138 追加効果で自分の防御力を１段階上げる
@===================================================

WAZA_DefUpAddHit:
	SETVALUE			ServerWork+3,COND2_DEFUP+TSUIKA_ATTACK
	JUMP				WAZA_NormalHit

@===================================================
@	139 追加効果で自分の攻撃力を１段階上げる
@===================================================

WAZA_PowUpAddHit:
	SETVALUE			ServerWork+3,COND2_POWUP+TSUIKA_ATTACK
	JUMP				WAZA_NormalHit

@===================================================
@	140 追加効果で５つのステータスが１段階上がる
@===================================================

WAZA_GenshinochikaraHit:
	SETVALUE			ServerWork+3,COND2_GENSHINOCHIKARA+TSUIKA_ATTACK
	JUMP				WAZA_NormalHit

@===================================================
@	142 はらだいこ
@===================================================

WAZA_HaradaikoHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	HARADAIKO			WAZA_Umakukimaran
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
	MESSAGE				HARADAIKOMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	143 相手にかかっている補助効果をコピーする
@===================================================

WAZA_JikoanjiHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	JIKOANJI			WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				JIKOANJIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	144 相手の特殊攻撃のダメージを倍にして返す
@===================================================

WAZA_MirrorCoatHit:
.if 0
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
	MIRRORCOAT			WAZA_UmakukimaranPP
	ATTACK_MESSAGE
	PP_DEC
	TYPE_CHECK_NO_HIT
	KORAERU_CHECK
	JUMP				WAZA_Hit
.else
	BADGECHECK
	MIRRORCOAT			WAZA_UmakukimaranPP
	HITCHECK			WAZA_NormalNohit,0
	ATTACK_MESSAGE
	PP_DEC
	TYPE_CHECK_NO_HIT
	KORAERU_CHECK
	JUMP				WAZA_Hit
.endif

@===================================================
@	145  ため＋防御力アップ
@===================================================

WAZA_RocketzutukiHit:
	CONDITION2_CHECK	SIDE_ATTACK,CONDITION2_KEEP,WAZA_TameAftar
	IF32				FLAG_BIT,ServerStatusFlag,SERVER_STATUS_FLAG_DOUBLE_CHECK,WAZA_TameAftar
	SETVALUE			UserWork+TAME_MSG_NO,2		@ロケットずつきのメッセージナンバー
	GOSUB				WAZA_TameBefore
	SETVALUE			UserWork+COND_CHG_WORK,COND_DEF+PARA_RANKU1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_RocketzutukiEnd
@あがらないメッセージは出さない
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_RocketzutukiEnd
	COND_CHG_WORK_SET
	FIGHT_EFFECT		SIDE_ATTACK,FE_ID_STATUS_UPDOWN,UserWork+FIGHT_EFFECT_WORK
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_RocketzutukiEnd:
	JUMP				WAZA_WazaEnd

@===================================================
@	146 ひるむ　＋　空をとんでいる相手に倍のダメージ
@===================================================

WAZA_TatumakiHit:
	WAZAKOUKA_CHECK		SIDE_DEFENCE,WAZAKOUKA_SORAWOTOBU,FLAG_OFF,WAZA_Tatumaki
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_SORAWOTOBUHIT
	SETVALUE			UserWork+DAMAGE_VALUE,2
WAZA_Tatumaki:
	SETVALUE			ServerWork+3,COND2_HIRUMU
	JUMP				WAZA_NormalHit

@===================================================
@	147 地面に潜っている相手に倍のダメージ
@===================================================

WAZA_JisinHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	JISIN
WAZA_JisinLoop:
	LOOPINIT			@ループするときに初期化するワークがまとまっている
	WAZAKOUKA_CHECK		SIDE_DEFENCE,WAZAKOUKA_ANAWOHORU,FLAG_OFF,WAZA_JisinNext
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_ANAWOHORUHIT
	SETVALUE			UserWork+DAMAGE_VALUE,2
	JUMP				WAZA_Jisin
WAZA_JisinNext:
	RESET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_ANAWOHORUHIT
	SETVALUE			UserWork+DAMAGE_VALUE,1
WAZA_Jisin:
@	SETVALUE			WazaStatusFlag,0
	HITCHECK			WAZA_JisinNohit,0
						@ヒットしなかったら、指定したアドレスへジャンプ
	CRITICAL_CHECK
	DAMAGE_CALC
	TYPE_CHECK
	DAMAGE_LOSS
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	WAZAKOUKA_SE
	POKE_BLINK			SIDE_DEFENCE
	CLIENT_BIT_WAIT
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	CRITICAL_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	MESSAGE				BLANKMSGNO
	MESSAGE_WAIT		1
	KIZETSU_CHECK		SIDE_DEFENCE,0,0
	SETVALUE			UserWork+WKC_WORK0,WKC_IKARI_CHECK
	WKC_ACT				WKC_CHECK_KOKOMADE,WKC_DOUBLE_ATTACK
	JIBAKU_LOOP			WAZA_JisinLoop
	WAZAEND
WAZA_JisinNohit:
	WAIT				MOJI_WAIT/2
	TYPE_CHECK
	WAZAKOUKA_SE
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	SETVALUE			UserWork+WKC_WORK0,WKC_IKARI_CHECK
	WKC_ACT				WKC_CHECK_KOKOMADE,WKC_DOUBLE_ATTACK
	JIBAKU_LOOP			WAZA_JisinLoop
	WAZAEND

@===================================================
@	148 みらいよち　３ターン後に攻撃がくる
@===================================================

WAZA_MiraiyochiHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
@	SIDECONDITION_CHECK	SIDE_DEFENCE,SIDE_CONDITION_MIRAIYOCHI,WAZA_Umakukimaran
@	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_HENSYOKU_NOHIT
@	MIRAIYOCHI
	MIRAIYOCHI			WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE_TBL			MiraiyochiMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	149 空をとんでいる相手に倍のダメージ
@===================================================

WAZA_KazeokosiHit:
	WAZAKOUKA_CHECK		SIDE_DEFENCE,WAZAKOUKA_SORAWOTOBU,FLAG_OFF,WAZA_NormalHit
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_SORAWOTOBUHIT
	SETVALUE			UserWork+DAMAGE_VALUE,2
	JUMP				WAZA_NormalHit

@===================================================
@	150 小さくなっている相手に倍のダメージ
@===================================================

WAZA_HumitukeHit:
@WazaKoukaのフラグが立ってなかったときの飛び先を指定
	WAZAKOUKA_CHECK		SIDE_DEFENCE,WAZAKOUKA_CHIISAKUNARU,FLAG_OFF,WAZA_Tatumaki
	SETVALUE			UserWork+DAMAGE_VALUE,2
	JUMP				WAZA_Tatumaki

@===================================================
@	151 ソーラービーム　はれだとためずに攻撃できる
@===================================================

WAZA_SolarBeamHit:
	SPEABI_HAVE_HP_CHECK	TOKUSYU_NOOTENKI,WAZA_SolarBeamNoHareCheck
	SPEABI_HAVE_HP_CHECK	TOKUSYU_EAROKKU,WAZA_SolarBeamNoHareCheck
	IF16				FLAG_BIT,FieldCondition,FIELD_CONDITION_HIDERING,WAZA_TameAftar2
WAZA_SolarBeamNoHareCheck:
	CONDITION2_CHECK	SIDE_ATTACK,CONDITION2_KEEP,WAZA_TameAftar
	IF32				FLAG_BIT,ServerStatusFlag,SERVER_STATUS_FLAG_DOUBLE_CHECK,WAZA_TameAftar
	SETVALUE			UserWork+TAME_MSG_NO,1		@ソーラービームのメッセージナンバー
	GOSUB				WAZA_TameBefore
	JUMP				WAZA_WazaEnd
WAZA_TameAftar2:
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_TAME
	SETVALUE			ServerWork+3,COND2_KEEP+TSUIKA_ATTACK
	TSUIKA_DIRECT_ACT
	PP_DEC
	JUMP				WAZA_TameAftar

@===================================================
@	152 雨だと命中率アップ　はれだとダウン（かみなり）
@===================================================

WAZA_KaminariHit:
	SETVALUE			ServerWork+3,COND_MAHI
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_SORAWOTOBUHIT
	JUMP				WAZA_NormalHit

@===================================================
@	153 テレポート（野性のポケモンとの戦闘から離脱）
@===================================================

.if 0
WAZA_TeleportHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	IF16				FLAG_BIT,FightType,FIGHT_TYPE_TRAINER,WAZA_Umakukimaran
	CONDITION2_CHECK	SIDE_ATTACK,CONDITION2_SHIME,WAZA_Umakukimaran
	CONDITION2_CHECK	SIDE_ATTACK,CONDITION2_KUROIMANAZASHI,WAZA_Umakukimaran
	WAZAKOUKA_CHECK		SIDE_ATTACK,WAZAKOUKA_NEWOHARU,FLAG_ON,WAZA_Umakukimaran
	SPEABI_CHECK		SIDE_ENEMY_BENCH,TOKUSYU_KAGEHUMI,WAZA_SpeabiUmakukimaran
	SPEABI_CHECK		SIDE_ATTACK,TOKUSYU_HUYUU,WAZA_TeleportNoCheckArizigoku
	CHECK_TYPE			SIDE_ATTACK,HIKOU_TYPE,WAZA_TeleportNoCheckArizigoku
	SPEABI_CHECK		SIDE_ENEMY_BENCH,TOKUSYU_ARIZIGOKU,WAZA_SpeabiUmakukimaran
WAZA_TeleportNoCheckArizigoku:
	CHECK_TYPE			SIDE_ATTACK,METAL_TYPE,WAZA_TeleportZiryoku
	JUMP				WAZA_TeleportStart
WAZA_TeleportZiryoku:
	SPEABI_CHECK		SIDE_ENEMY_BENCH,TOKUSYU_ZIRYOKU,WAZA_SpeabiUmakukimaran
WAZA_TeleportStart:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				TELEPORTMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SETVALUE			WinLoseFlag,FIGHT_END
	JUMP				WAZA_WazaEnd
.else
WAZA_TeleportHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	IF16				FLAG_BIT,FightType,FIGHT_TYPE_TRAINER,WAZA_Umakukimaran
	SUBROUTINE_CALL		SIDE_ATTACK,TELEPORT_CHECK
	IF8					FLAG_EQ,ServerWork+0,1,WAZA_Umakukimaran
	IF8					FLAG_EQ,ServerWork+0,2,WAZA_SpeabiUmakukimaran2
WAZA_TeleportStart:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				TELEPORTMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SETVALUE			WinLoseFlag,FIGHT_END
	JUMP				WAZA_WazaEnd
.endif

@===================================================
@	154 ふくろだたき
@===================================================

WAZA_HukurodatakiHit:
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
	ATTACK_MESSAGE
	WAIT				MOJI_WAIT/2
	PP_DEC
	SETVALUE			ServerWork,0
WAZA_Hukurodataki:
	LOOPINIT			@ループするときに初期化するワークがまとまっている
	HUKURODATAKI		WAZA_HukurodatakiEnd,WAZA_Umakukimaran
	MESSAGE				HUKURODATAKIMSGNO
	CRITICAL_CHECK
	IF8					FLAG_NE,CriticalValue,2,WAZA_HukurodatakiNext
	DAMAGE_CHG			DAMAGE_BAI
WAZA_HukurodatakiNext:
	DAMAGE_LOSS
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	WAZAKOUKA_SE
	POKE_BLINK			SIDE_DEFENCE
	CLIENT_BIT_WAIT
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	CRITICAL_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	KIZETSU_CHECK		SIDE_DEFENCE,0,0
	SETVALUE			UserWork+WKC_WORK0,WKC_IKARI_CHECK
	WKC_ACT				WKC_CHECK_KOKOMADE,WKC_DOUBLE_ATTACK
	JUMP				WAZA_Hukurodataki
WAZA_HukurodatakiEnd:
	WAZAEND

@===================================================
@	155 そらをとぶ、あなをほる
@===================================================

WAZA_KieruTameHit:
	CONDITION2_CHECK	SIDE_ATTACK,CONDITION2_KEEP,WAZA_KieruTameAftar
	IF32				FLAG_BIT,ServerStatusFlag,SERVER_STATUS_FLAG_DOUBLE_CHECK,WAZA_KieruTameAftar
	IF16				FLAG_EQ,WazaNo,WAZANO_SORAWOTOBU,WAZA_Sorawotobu
	IF16				FLAG_EQ,WazaNo,WAZANO_DAIBINGU,WAZA_Daibingu
	IF16				FLAG_EQ,WazaNo,WAZANO_TOBIHANERU,WAZA_Ukabu
	SETVALUE			UserWork+TAME_MSG_NO,5		@あなをほるのメッセージナンバー
	JUMP				WAZA_KieruTame
WAZA_Ukabu:
	SETVALUE			UserWork+TAME_MSG_NO,7		@うかぶのメッセージナンバー
	JUMP				WAZA_KieruTame
WAZA_Daibingu:
	SETVALUE			UserWork+TAME_MSG_NO,6		@ダイビングのメッセージナンバー
	JUMP				WAZA_KieruTame
WAZA_Sorawotobu:
	SETVALUE			UserWork+TAME_MSG_NO,4		@そらをとぶのメッセージナンバー
WAZA_KieruTame:
	GOSUB				WAZA_TameBefore
	KIERUTAME
	JUMP				WAZA_WazaEnd
WAZA_KieruTameAftar:
	BADGECHECK
	SETVALUE			ServerWork+3,COND2_KEEP
	SETVALUE			UserWork+WAZA_EFF_CNT,1	@ため後の技エフェクト呼び出し
	SAKUJO				SIDE_ATTACK
@ためた後はPP_DECをしない
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NOPP_DEC
@技うかぶは、まひの追加効果
	IF16				FLAG_NE,WazaNo,WAZANO_TOBIHANERU,WAZA_KieruTameHitOk
	SETVALUE			ServerWork+3,COND_MAHI
WAZA_KieruTameHitOk:
	HITCHECK			WAZA_KieruTameNoHit,0
	KIERUTAME_AFTAR
	JUMP				WAZA_HitCalc
WAZA_KieruTameNoHit:
	KIERUTAME_AFTAR
	JUMP				WAZA_NormalNohit	

@===================================================
@	156 まるくなる
@===================================================

WAZA_MarukunaruHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	MARUKUNARU
	SETVALUE			UserWork+COND_CHG_WORK,COND_DEF+PARA_RANKU1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_MarukunaruNoDefUp
@あがらないメッセージのときは、技エフェクトをださない
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_CondUpMsg
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
WAZA_MarukunaruNoDefUp:
	JUMP				WAZA_CondUpStatusEffect

@===================================================
@	157 ミルクのみ、タマゴうみ
@===================================================

WAZA_KaifukuHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	KAIFUKU				WAZA_Mantan,SIDE_DEFENCE
WAZA_Kaifuku:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	MESSAGE				JIKOSAISEIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd
WAZA_Mantan:
	WAIT				MOJI_WAIT/2
	MESSAGE				MANTANMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	158 ねこだまし
@===================================================

WAZA_NekodamashiHit:
	BADGECHECK
	NEKODAMASHI			WAZA_NekodamashiNoHit
	SETVALUE			ServerWork+3,COND2_HIRUMU+TSUIKA_ALWAYS
	JUMP				WAZA_NormalHit
WAZA_NekodamashiNoHit:
WAZA_UmakukimaranPP:
	ATTACK_MESSAGE
WAZA_UmakukimaranPPDec:
	PP_DEC
WAZA_Umakukimaran:
	WAIT				MOJI_WAIT/2
	SET8BIT				WazaStatusFlag,WAZASTATUSFLAG_UMAKUKIMARAN
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

WAZA_Koukanai:
	WAIT				MOJI_WAIT/2
	SET8BIT				WazaStatusFlag,WAZASTATUSFLAG_KOUKANAI
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	159 さわぐ
@===================================================

WAZA_SawaguHit:
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
	SETVALUE			ServerWork+3,COND2_SAWAGU+TSUIKA_ATTACK
@さわいでいる間はPPをDECしない
	ATTACK_MESSAGE
	CONDITION2_CHECK	SIDE_ATTACK,CONDITION2_KEEP,WAZA_SawaguNoPPDec
	PP_DEC
WAZA_SawaguNoPPDec:
	SAWAGU
	JUMP				WAZA_HitCalcOnly

@===================================================
@	160 たくえわえる
@===================================================

WAZA_TakuwaeruHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	TAKUWAERU
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE_TBL			TakuwaeruMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	161 はきだす
@===================================================

WAZA_HakidasuHit:
	BADGECHECK
	IF8					FLAG_EQ,ServerWork+6,MSG_MAMORUNOHIT,WAZA_HakidasuMamoru
	ATTACK_MESSAGE
	PP_DEC
	HITCHECK			WAZA_NormalNohit,0
	HAKIDASU			WAZA_HakidasuNoHit
	TYPE_CHECK
	KORAERU_CHECK
	JUMP				WAZA_Hit
WAZA_HakidasuNoHit:
	WAIT				MOJI_WAIT/2
	MESSAGE				HAKIDASUMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

WAZA_HakidasuMamoru:
	ATTACK_MESSAGE
	PP_DEC
	WAIT				MOJI_WAIT
	HAKIDASU			WAZA_HakidasuNoHit
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	162 のみこむ
@===================================================

WAZA_NomikomuHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	NOMIKOMU			WAZA_NomikomuNoHit
	JUMP				WAZA_Kaifuku
WAZA_NomikomuNoHit:
	WAIT				MOJI_WAIT/2
	MESSAGE_TBL			NomikomuMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

.if 0
@===================================================
@	163 ねっぷう
@===================================================

WAZA_NeppuuHit:
	KYOURYOKU			0
	MESSAGE_WAIT		MOJI_WAIT
	KYOURYOKU			3
	WAZA_EFFECT_WAIT
	KYOURYOKU			1
	MESSAGE_WAIT		MOJI_WAIT
	KYOURYOKU			4
	WAZA_EFFECT_WAIT
	MESSAGE				NEPPUUMSGNO
	MESSAGE_WAIT		MOJI_WAIT
@WAZA_DoubleHit:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
WAZA_NeppuuDoubleHitAgain:
	CRITICAL_CHECK
	KYOURYOKU			2
	TYPE_CHECK
	DAMAGE_LOSS
	HITCHECK			WAZA_NeppuuNohit,0
	WAZAKOUKA_SE
	POKE_BLINK			SIDE_DEFENCE
	CLIENT_BIT_WAIT
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	CRITICAL_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	KIZETSU_CHECK		SIDE_DEFENCE,0,0
	CHECK2vs2			WAZA_NeppuuDoubleHitAgain
	WAZAEND
WAZA_NeppuuNohit:
	WAZAKOUKA_SE
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	CHECK2vs2			WAZA_NeppuuDoubleHitAgain
	WAZAEND
.endif

@===================================================
@	164 あられ
@===================================================

WAZA_ArareHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	ARARE
	JUMP				WAZA_Tenkou

@===================================================
@	165 いちゃもん
@===================================================

WAZA_IchamonHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	HITCHECK			WAZA_Umakukimaran,0
	ICHAMON				WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				ICHAMONMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	166 おだてる
@===================================================

WAZA_OdateruHit:
	BADGECHECK
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_NormalNohitBitSet
	HITCHECK			WAZA_NormalNohit,0
	ATTACK_MESSAGE
	PP_DEC
	IBARU				COND_SPEPOW,WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			UserWork+COND_CHG_WORK,COND_SPEPOW+PARA_RANKU1
	CONDCHG				TSUIKA_DIRECT,WAZA_OdateruNoMsg
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_OdateruNoMsg
	COND_CHG_WORK_SET
	FIGHT_EFFECT		SIDE_DEFENCE,FE_ID_STATUS_UPDOWN,UserWork+FIGHT_EFFECT_WORK
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_OdateruNoMsg:
	SPEABI_CHECK		SIDE_DEFENCE,TOKUSYU_MAIPEESU,WAZA_Mypace
	SIDECONDITION_CHECK	SIDE_DEFENCE,SIDE_CONDITION_SHINPI,WAZA_Shinpi
	SETVALUE			ServerWork+3,COND2_KONRAN
	TSUIKA_DIRECT_ACT
	JUMP				WAZA_WazaEnd

@===================================================
@	167 おにび
@===================================================

WAZA_OnibiHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_Umakukimaran
	CONDITION_CHECK		SIDE_DEFENCE,CONDITION_YAKEDO,WAZA_YakedoAlready
	CHECK_TYPE			SIDE_DEFENCE,FIRE_TYPE,WAZA_Koukanai
	SPEABI_CHECK		SIDE_DEFENCE,TOKUSYU_MIZUNOBEERU,WAZA_MizunobeeruJump
	CONDITION_CHECK		SIDE_DEFENCE,CONDITION_BAD,WAZA_Umakukimaran
	HITCHECK			WAZA_Umakukimaran,0
	SIDECONDITION_CHECK	SIDE_DEFENCE,SIDE_CONDITION_SHINPI,WAZA_Shinpi
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			ServerWork+3,COND_YAKEDO
	TSUIKA_DIRECT_ACT
	JUMP				WAZA_WazaEnd
WAZA_MizunobeeruJump:
	SETWORK				TsuikaClient,DefenceClient,1
	SETVALUE			ServerWork+5,0
	GOSUB				WAZA_Mizunobeeru
	JUMP				WAZA_WazaEnd
WAZA_YakedoAlready:
	WAIT				MOJI_WAIT/2
	MESSAGE				ALREADYYAKEDOMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	168 おきみやげ
@===================================================

WAZA_OkimiyageHit:
@	BADGECHECK2			@まもるチェックのないバッジチェック
	BADGECHECK
	IF8					FLAG_EQ,ServerWork+6,MSG_MAMORUNOHIT,WAZA_OkimiyageMamoru
	ATTACK_MESSAGE
	PP_DEC
	OKIMIYAGE			WAZA_Umakukimaran
	JIBAKU				@自分を瀕死にする
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_OkimiyageMigawari
@	GUARDCHECK			WAZA_OkimiyageNoHit		@まもる、みきりチェック
	SETVALUE			UserWork+COND_CHG_MULTI,0
	COND_CHG_BIT_CHECK	SIDE_DEFENCE,COND_BIT_POW+COND_BIT_SPEPOW,COND_FLAG_DOWN+COND_FLAG_DOUBLE+COND_FLAG_MULTI
	COND_CHG_BIT_CHECK	SIDE_DEFENCE,COND_BIT_POW,COND_FLAG_DOWN+COND_FLAG_DOUBLE
	SETVALUE			UserWork+COND_CHG_WORK,COND_POW+PARA_RANKD2
	CONDCHG				TSUIKA_DIRECT,WAZA_OkimiyageNext
	IF8					FLAG_C,ServerWork+5,1,WAZA_OkimiyageNext
	MESSAGE_TBL			CondDownMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_OkimiyageNext:
	COND_CHG_BIT_CHECK	SIDE_DEFENCE,COND_BIT_SPEPOW,COND_FLAG_DOWN+COND_FLAG_DOUBLE
	SETVALUE			UserWork+COND_CHG_WORK,COND_SPEPOW+PARA_RANKD2
	CONDCHG				TSUIKA_DIRECT,WAZA_OkimiyageNoHit
	IF8					FLAG_C,ServerWork+5,1,WAZA_OkimiyageNoHit
	MESSAGE_TBL			CondDownMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_OkimiyageNoHit:
	KIZETSU_CHECK		SIDE_ATTACK,0,0
	JUMP				WAZA_WazaEnd

WAZA_OkimiyageMigawari:
	MESSAGE				OKIMIYAGEMIGAWARIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_OkimiyageNoHit

@守られたときは、技エフェクトを出さない
WAZA_OkimiyageMamoru:
	ATTACK_MESSAGE
	PP_DEC
	OKIMIYAGE			WAZA_OkimiyageMamoruNext
WAZA_OkimiyageMamoruNext:
	JIBAKU
	WAIT				MOJI_WAIT
	WAZAKOUKA_SE
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	KIZETSU_CHECK		SIDE_ATTACK,0,0
	JUMP				WAZA_WazaEnd

@===================================================
@	169 からげんき
@===================================================

WAZA_KaragenkiHit:
	CONDITION_CHECK		SIDE_ATTACK,CONDITION_KARAGENKI,WAZA_Karagenki
	JUMP				WAZA_NormalHit
WAZA_Karagenki:
	SETVALUE			UserWork+DAMAGE_VALUE,2	@2倍ダメージ
	JUMP				WAZA_NormalHit

@===================================================
@	170 きあいパンチ
@===================================================

WAZA_KiaiPunchHit:
	BADGECHECK
	KIAIPUNCH			WAZA_NormalHit2
	PP_DEC
	MESSAGE				KIAIPUNCHNOMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	171 きつけ
@===================================================

WAZA_KitsukeHit:
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_NormalHit
	SETVALUE			ServerWork+3,COND_NOMAHI+TSUIKA_ALWAYS
	CONDITION_CHECK		SIDE_DEFENCE,CONDITION_MAHI,WAZA_Kitsuke
	JUMP				WAZA_NormalHit
WAZA_Kitsuke:
	SETVALUE			UserWork+DAMAGE_VALUE,2	@2倍ダメージ
	JUMP				WAZA_NormalHit

@===================================================
@	172 このゆびとまれ
@===================================================

WAZA_KonoyubitomareHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	KONOYUBITOMARE
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				KONOYUBITOMAREMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	173 しぜんのちから
@===================================================

WAZA_ShizennochikaraHit:
	BADGECHECK
	ATTACK_MESSAGE
	WAIT				MOJI_WAIT/2
	SHIZENNOCHIKARA
	MESSAGE				SHIZENNOCHIKARAMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@===================================================
@	174 じゅうでん
@===================================================

WAZA_JuudenHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	JUUDEN
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				JUUDENMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	175 ちょうはつ
@===================================================

WAZA_ChouhatsuHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	HITCHECK			WAZA_Umakukimaran,0
	CHOUHATSU			WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				CHOUHATSUMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	176 てだすけ
@===================================================

WAZA_TedasukeHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	TEDASUKE			WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				TEDASUKEMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	177 トリック
@===================================================

WAZA_TrickHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_Umakukimaran
	HITCHECK			WAZA_Umakukimaran,0
	TRICK				WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				TRICKMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	MESSAGE_TBL			TrickMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	178 なりきり
@===================================================

WAZA_NarikiriHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	HITCHECK			WAZA_Umakukimaran,HITCHECK_KIE
	NARIKIRI			WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				NARIKIRIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	179 ねがいごと
@===================================================

WAZA_NegaigotoHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	@0は動作フラグ（0:ねがいごとをする1:ねがいごとがかなった処理）
	NEGAIGOTO			0,WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
@ATTACK_MESSAGEとおなじだったので
@	MESSAGE				NEGAIGOTOMSGNO
@	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	180 ねこのて
@===================================================

WAZA_NekonoteHit:
	BADGECHECK
	ATTACK_MESSAGE
	NEKONOTE			WAZA_UmakukimaranPPDec
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			UserWork+WAZA_EFF_CNT,0
	SETVALUE			UserWork+WAZA_EFF_CNT_TMP,0
	WAZASEQADRS			1

@===================================================
@	181 ねをはる
@===================================================

WAZA_NewoharuHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	NEWOHARU			WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				NEWOHARUMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	182 ばかぢから
@===================================================

WAZA_BakadikaraHit:
	SETVALUE			ServerWork+3,COND2_BAKADIKARA+TSUIKA_ALWAYS+TSUIKA_ATTACK
	JUMP				WAZA_NormalHit

@===================================================
@	183 マジックコート
@===================================================

WAZA_MagicCortHit:
	BADGECHECK
	MAGICCORT			WAZA_UmakukimaranPP
	ATTACK_MESSAGE
	PP_DEC
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				MAGICCORTMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	184 リサイクル
@===================================================

WAZA_RecycleHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	RECYCLE				WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				RECYCLEMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	185 リベンジ
@===================================================

WAZA_RevengeHit:
	REVENGE
	JUMP				WAZA_NormalHit

@===================================================
@	186 かわらわり
@===================================================

WAZA_KawarawariHit:
	BADGECHECK
	HITCHECK			WAZA_NormalNohit,0
						@ヒットしなかったら、指定したアドレスへジャンプ
	ATTACK_MESSAGE
	PP_DEC
	KAWARAWARI
	CRITICAL_CHECK
	DAMAGE_CALC
	TYPE_CHECK
	DAMAGE_LOSS
	IF8					FLAG_EQ,UserWork+WAZA_EFF_CNT,0,WAZA_KawarawariEff
	RESET8BIT			WazaStatusFlag,WAZASTATUSFLAG_KOUKANAI+WAZASTATUSFLAG_NOHIT
WAZA_KawarawariEff:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	IF8					FLAG_NC,UserWork+WAZA_EFF_CNT,2,WAZA_KawarawariNoMes
	MESSAGE				KAWARAWARIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
WAZA_KawarawariNoMes:
	TYPE_CHECK_NO_HIT
	WAZAKOUKA_SE
	POKE_BLINK			SIDE_DEFENCE
	CLIENT_BIT_WAIT
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	CRITICAL_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	TSUIKA_CHECK
	KIZETSU_CHECK		SIDE_DEFENCE,0,0
	JUMP				WAZA_WazaEnd

@===================================================
@	187 あくび
@===================================================

WAZA_AkubiHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	SPEABI_CHECK		SIDE_DEFENCE,TOKUSYU_YARUKI,WAZA_SpeabiUmakukimaran
	SPEABI_CHECK		SIDE_DEFENCE,TOKUSYU_HUMIN,WAZA_SpeabiUmakukimaran
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_Umakukimaran
@	WAZAKOUKA_CHECK		SIDE_DEFENCE,WAZAKOUKA_KIE,FLAG_ON,WAZA_Umakukimaran
	SIDECONDITION_CHECK	SIDE_DEFENCE,SIDE_CONDITION_SHINPI,WAZA_Shinpi
	HITCHECK			WAZA_Umakukimaran,HITCHECK_KIE
	SAWAGU_CHECK		WAZA_Umakukimaran
	AKUBI				WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				AKUBIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

WAZA_SpeabiUmakukimaran:
	SETWORK				UserWork+CLIENT_NO_WORK,UserWork+SPEABI_CLIENT,1
WAZA_SpeabiUmakukimaran2:
	WAIT				MOJI_WAIT/2
	MESSAGE				TOKUSYUUMAKUKIMARANMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	188 はたきおとす
@===================================================

WAZA_HatakiotosuHit:
.if 0
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	HATAKIOTOSU			WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				HATAKIOTOSUMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	WAZAEND
.endif
	SETVALUE			ServerWork+3,COND2_HATAKIOTOSU
	JUMP				WAZA_NormalHit

@===================================================
@	189 がむしゃら
@===================================================

WAZA_GamusyaraHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	GAMUSYARA			WAZA_Umakukimaran
	SETWORK				HitDamage,WazaDamage,4
	HITCHECK			WAZA_NormalNohit2,0
	TYPE_CHECK
	IF8					FLAG_BIT,WazaStatusFlag,WAZASTATUSFLAG_NOCRITICAL,WAZA_Hit
	RESET8BIT			WazaStatusFlag,WAZASTATUSFLAG_BATSUGUN|WAZASTATUSFLAG_IMAHITOTSU
	SETWORK				WazaDamage,HitDamage,4
	KORAERU_CHECK
	JUMP				WAZA_Hit

@===================================================
@	190 ふんか
@===================================================

WAZA_HunkaHit:
	HUNKA
	JUMP				WAZA_NormalHit

@===================================================
@	191 スキルスワップ
@===================================================

WAZA_SkillSwapHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	HITCHECK			WAZA_Umakukimaran,HITCHECK_KIE
	SKILLSWAP			WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				SKILLSWAPMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	192 ふういん
@===================================================

WAZA_HuuinHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	HUUIN				WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				HUUINMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	193 リフレッシュ
@===================================================

WAZA_RefleshHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	REFLESH				WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				REFLESHMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	CONDITION_GAUGE		SIDE_ATTACK
	JUMP				WAZA_WazaEnd

@===================================================
@	194 おんねん
@===================================================

WAZA_OnnenHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	ONNEN				WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				ONNENMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	195 よこどり
@===================================================

WAZA_YokodoriHit:
	BADGECHECK
	YOKODORI			WAZA_UmakukimaranPP
	ATTACK_MESSAGE
	PP_DEC
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	WAIT				MOJI_WAIT/2
	MESSAGE				YOKODORIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	196 けたぐり
@===================================================

WAZA_KetaguriHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	KETAGURI
	HITCHECK			WAZA_NormalNohit2,0
	JUMP				WAZA_HitCalcOnly

@===================================================
@	197 ひみつのちから
@===================================================

WAZA_HimitunoTikaraHit:
	HIMITUNOTIKARA
	JUMP				WAZA_NormalHit

@===================================================
@	198 すてみタックル
@===================================================

WAZA_SutemiTackleHit:
	SETVALUE			ServerWork+3,COND2_HANEKAERI2+TSUIKA_ALWAYS+TSUIKA_ATTACK
	JUMP				WAZA_NormalHit

@===================================================
@	199 全てのポケモンが混乱
@===================================================

WAZA_AllKonranHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	SETVALUE			DefenceClient,0
WAZA_AllKonranLoop:
@	SETVALUE			WazaStatusFlag,0
	LOOPINIT			@ループするときに初期化するワークがまとまっている
	SETVALUE			ServerWork+3,COND2_KONRAN
	IFWEQ				AttackClient,DefenceClient,1,WAZA_AllKonranNext
	SPEABI_CHECK		SIDE_DEFENCE,TOKUSYU_MAIPEESU,WAZA_AllKonranMypace
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_AllKonranUmakukimaran
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_KONRAN,WAZA_AllKonranAlready
	HITCHECK			WAZA_AllKonranNohit,0
	SIDECONDITION_CHECK	SIDE_DEFENCE,SIDE_CONDITION_SHINPI,WAZA_AllKonranShinpi
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	TSUIKA_DIRECT_ACT
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
WAZA_AllKonranNext:
	SETVALUE			UserWork+WKC_WORK0,WKC_IKARI_CHECK
	WKC_ACT				WKC_CHECK_KOKOMADE,WKC_DOUBLE_ATTACK
	ADDVALUE			DefenceClient,1
	IFWNE				DefenceClient,ClientSetMax,1,WAZA_AllKonranLoop
	WAZAEND

WAZA_AllKonranMypace:
	WAIT				MOJI_WAIT/2
	MESSAGE				MYPACEMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_AllKonranNext

WAZA_AllKonranShinpi:
	WAIT				MOJI_WAIT/2
	MESSAGE				SHINPIGUARDMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_AllKonranNext

WAZA_AllKonranUmakukimaran:
	WAIT				MOJI_WAIT/2
	MESSAGE				UMAKUKIMARANMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_AllKonranNext

WAZA_AllKonranAlready:
	WAIT				MOJI_WAIT/2
	MESSAGE				KONRANMSG5NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_AllKonranNext

WAZA_AllKonranNohit:
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_AllKonranNext

@===================================================
@	201 電気系の技の威力を半減
@===================================================
@===================================================
@	210 炎系の技の威力を半減
@===================================================

WAZA_AsobiHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	ASOBI				WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE_TBL			AsobiMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	202 追加効果でどくどく
@===================================================

WAZA_DokuDokuHit:
	SETVALUE			ServerWork+3,COND_DOKUDOKU
	JUMP				WAZA_NormalHit

@===================================================
@	203 天気によって威力とタイプ
@===================================================

WAZA_WeatherHit:
	WEATHER_BALL
	JUMP				WAZA_NormalHit

@===================================================
@	204 自分の特攻が、がくっと下がる
@===================================================

WAZA_OverHeatHit:
	SETVALUE			ServerWork+3,COND2_OVERHEAT+TSUIKA_ALWAYS+TSUIKA_ATTACK
	JUMP				WAZA_NormalHit

@===================================================
@	205 相手の攻撃、防御が下がる
@===================================================

WAZA_KusuguruHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	CONDCHG_CHECK		SIDE_DEFENCE,IFC,COND_POW,0,WAZA_KusuguruStart
	CONDCHG_CHECK		SIDE_DEFENCE,IFEQ,COND_DEF,0,WAZA_KusuguruNoHit
WAZA_KusuguruStart:
	HITCHECK			WAZA_Umakukimaran,0
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			UserWork+COND_CHG_MULTI,0
	COND_CHG_BIT_CHECK	SIDE_DEFENCE,COND_BIT_POW+COND_BIT_DEF,COND_FLAG_DOWN+COND_FLAG_MULTI
	COND_CHG_BIT_CHECK	SIDE_DEFENCE,COND_BIT_POW,COND_FLAG_DOWN
	SETVALUE			UserWork+COND_CHG_WORK,COND_POW+PARA_RANKD1
	CONDCHG				TSUIKA_DIRECT,WAZA_KusuguruNext
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_KusuguruNext
	MESSAGE_TBL			CondDownMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_KusuguruNext:
	COND_CHG_BIT_CHECK	SIDE_DEFENCE,COND_BIT_DEF,COND_FLAG_DOWN
	SETVALUE			UserWork+COND_CHG_WORK,COND_DEF+PARA_RANKD1
	CONDCHG				TSUIKA_DIRECT,WAZA_KusuguruEnd
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_KusuguruEnd
	MESSAGE_TBL			CondDownMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_KusuguruEnd:
	JUMP				WAZA_WazaEnd
WAZA_KusuguruNoHit:
	WAIT				MOJI_WAIT/2
	SET8BIT				WazaStatusFlag,WAZASTATUSFLAG_UMAKUKIMARAN
	MESSAGE				NOURYOKUNODOWNMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	206 防御、特防があがる
@===================================================

WAZA_CosmoPowerHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	CONDCHG_CHECK		SIDE_ATTACK,IFNC,COND_DEF,12,WAZA_CosmoPowerStart
	CONDCHG_CHECK		SIDE_ATTACK,IFEQ,COND_SPEDEF,12,WAZA_MeisouNoHit
WAZA_CosmoPowerStart:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			UserWork+COND_CHG_MULTI,0
	COND_CHG_BIT_CHECK	SIDE_ATTACK,COND_BIT_DEF+COND_BIT_SPEDEF,COND_FLAG_UP
	SETVALUE			UserWork+COND_CHG_WORK,COND_DEF+PARA_RANKU1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_CosmoPowerNext
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_CosmoPowerNext
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_CosmoPowerNext:
	SETVALUE			UserWork+COND_CHG_WORK,COND_SPEDEF+PARA_RANKU1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_CosmoPowerEnd
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_CosmoPowerEnd
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_CosmoPowerEnd:
	JUMP				WAZA_WazaEnd

@===================================================
@	207 空を飛んでいる相手にもあたる
@===================================================

WAZA_SkyUpperHit:
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_SORAWOTOBUHIT
	JUMP				WAZA_NormalHit

@===================================================
@	208 攻撃、防御があがる
@===================================================

WAZA_BuildUpHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	CONDCHG_CHECK		SIDE_ATTACK,IFNC,COND_POW,12,WAZA_BuildUpStart
	CONDCHG_CHECK		SIDE_ATTACK,IFEQ,COND_DEF,12,WAZA_MeisouNoHit
WAZA_BuildUpStart:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			UserWork+COND_CHG_MULTI,0
	COND_CHG_BIT_CHECK	SIDE_ATTACK,COND_BIT_POW+COND_BIT_DEF,COND_FLAG_UP
	SETVALUE			UserWork+COND_CHG_WORK,COND_POW+PARA_RANKU1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_BuildUpNext
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_BuildUpNext
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_BuildUpNext:
	SETVALUE			UserWork+COND_CHG_WORK,COND_DEF+PARA_RANKU1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_BuildUpEnd
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_BuildUpEnd
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_BuildUpEnd:
	JUMP				WAZA_WazaEnd

@===================================================
@	211 特攻、特防があがる
@===================================================

WAZA_MeisouHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	CONDCHG_CHECK		SIDE_ATTACK,IFNC,COND_SPEPOW,12,WAZA_MeisouStart
	CONDCHG_CHECK		SIDE_ATTACK,IFEQ,COND_SPEDEF,12,WAZA_MeisouNoHit
WAZA_MeisouStart:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			UserWork+COND_CHG_MULTI,0
	COND_CHG_BIT_CHECK	SIDE_ATTACK,COND_BIT_SPEPOW+COND_BIT_SPEDEF,COND_FLAG_UP
	SETVALUE			UserWork+COND_CHG_WORK,COND_SPEPOW+PARA_RANKU1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_MeisouNext
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_MeisouNext
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_MeisouNext:
	SETVALUE			UserWork+COND_CHG_WORK,COND_SPEDEF+PARA_RANKU1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_MeisouEnd
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_MeisouEnd
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_MeisouEnd:
	JUMP				WAZA_WazaEnd
WAZA_MeisouNoHit:
	WAIT				MOJI_WAIT/2
	SET8BIT				WazaStatusFlag,WAZASTATUSFLAG_UMAKUKIMARAN
	MESSAGE				NOURYOKUNOUPMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	212 攻撃と素早さがあがる
@===================================================

WAZA_RyuunomaiHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	CONDCHG_CHECK		SIDE_ATTACK,IFNC,COND_POW,12,WAZA_RyuunomaiStart
	CONDCHG_CHECK		SIDE_ATTACK,IFEQ,COND_AGI,12,WAZA_MeisouNoHit
WAZA_RyuunomaiStart:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SETVALUE			UserWork+COND_CHG_MULTI,0
	COND_CHG_BIT_CHECK	SIDE_ATTACK,COND_BIT_POW+COND_BIT_AGI,COND_FLAG_UP
	SETVALUE			UserWork+COND_CHG_WORK,COND_POW+PARA_RANKU1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_RyuunomaiNext
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_RyuunomaiNext
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_RyuunomaiNext:
	SETVALUE			UserWork+COND_CHG_WORK,COND_AGI+PARA_RANKU1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_RyuunomaiEnd
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_RyuunomaiEnd
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_RyuunomaiEnd:
	JUMP				WAZA_WazaEnd

@===================================================
@	213 フィールドと同じタイプになる
@===================================================

WAZA_HogosyokuHit:
	BADGECHECK
	ATTACK_MESSAGE
	PP_DEC
	HOGOSYOKU			WAZA_Umakukimaran
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	MESSAGE				TEXTUREMSGNO	@ATTACK_MONSは　？タイプに　なった
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	特殊技シーケンス
@===================================================

WAZA_KizetsuA:
	VOICE				SIDE_ATTACK
	WAIT				MOJI_WAIT
	KIZETSU				SIDE_ATTACK
	KIZETSU_WAIT		SIDE_ATTACK
	MESSAGE				KIZETSUMSGANO
	SEQRET

WAZA_KizetsuD:
	VOICE				SIDE_DEFENCE
	WAIT				MOJI_WAIT
	KIZETSU				SIDE_DEFENCE
	KIZETSU_WAIT		SIDE_DEFENCE
	MESSAGE				KIZETSUMSGDNO
	SEQRET

WAZA_GetEXP:
	SETVALUE			UserWork+GETEXP_SEQNO,0
	GET_EXP				SIDE_DEFENCE
@	WAZAEND
	SEQEND

WAZA_Zenmetsu:
	ZENMETSU_CHECK		WAZA_DoubleNockDown
	IF8					FLAG_NE,WinLoseFlag,0,_ZenmetsuEnd
	IF16				FLAG_BIT,FightType,FIGHT_TYPE_TRAINER,WAZA_MineReshuffleStart
	IF32				FLAG_NBIT,ServerStatusFlag,SERVER_STATUS_FLAG_MINE_KIZETSU,WAZA_MineReshuffleStart
	MESSAGE				NEXTPOKEMSGNO
	SETVALUE			ServerWork+0,0		@シーケンスナンバーを初期化
	YES_NO_WINDOW
	IF8					FLAG_EQ,ServerWork+1,0,WAZA_MineReshuffleStart
	ESCAPE_CHECK		_ZenmetsuEnd
	MESSAGE				ESCAPENGMSG4NO
WAZA_MineReshuffleStart:
	POKE_RESHUFFLE		SIDE_KIZETSU,_ZenmetsuEnd	@2体2で入れ替えできない場合の飛び先
	POKE_RESHUFFLE_WAIT	SIDE_KIZETSU,PRW_NORMAL
@入れ替え戦を選択しているときの処理
	IF16				FLAG_NBIT,FightType,FIGHT_TYPE_TRAINER,WAZA_NoMineReshuffle	
	IF16				FLAG_BIT,FightType,FIGHT_TYPE_TUUSHIN,WAZA_NoMineReshuffle	
	IF16				FLAG_BIT,FightType,FIGHT_TYPE_BATTLE_TOWER,WAZA_NoMineReshuffle	
	IF16				FLAG_BIT,FightType,FIGHT_TYPE_2vs2,WAZA_NoMineReshuffle	
	IF32				FLAG_BIT,ServerStatusFlag,SERVER_STATUS_FLAG_MINE_KIZETSU,WAZA_NoMineReshuffle
	IF8					FLAG_EQ,UserWork+BTL_TYPE,1,WAZA_NoMineReshuffle
	RESHUFFLE_CHECK		SIDE_ATTACK,WAZA_NoMineReshuffle
	MESSAGE				TORIKAERUMSGNO
	SETVALUE			ServerWork+0,0		@シーケンスナンバーを初期化
	YES_NO_WINDOW
	IF8					FLAG_EQ,ServerWork+1,1,WAZA_NoMineReshuffle
	GET_RESHUFFLE_CLIENT
	POKE_RESHUFFLE		SIDE_ATTACK+B_CANCEL_OK,WAZA_NoMineReshuffle
	POKE_RESHUFFLE_WAIT	SIDE_ATTACK,PRW_NORMAL
@ポケモンを選択しなかった（Bキャンセルも含む）時の飛び先	
	IF8					FLAG_EQ,ServerWork+0,6,WAZA_NoMineReshuffle
	RESHUFFLE_NICKNAME
	SUBROUTINE_CALL		SIDE_ATTACK,RESHUFFLE_INIT
	POKE_HPDEC_RATE		SIDE_ATTACK
	MESSAGE				IREKAEMSGNO
@	MESSAGE_WAIT		MOJI_WAIT/2
	SIZENKAIHUKU		SIDE_ATTACK
	CLIENT_BIT_WAIT
	MODOSU_EFFECT
	CLIENT_BIT_WAIT
	BALL_GAUGE_SET		SIDE_ATTACK
	APPEAR_EFFECT_INIT	SIDE_ATTACK
	APPEAR_EFFECT		SIDE_ATTACK
	POKE_HPMAX_RATE		SIDE_ATTACK
	MESSAGE				IREKAEAFTERMSGNO
@	WAIT				MOJI_WAIT/2
	BALL_GAUGE_OFF		SIDE_ATTACK
	APPEAR_EFFECT_WAIT	SIDE_ATTACK,APPEAR_NORMAL
	CLIENT_BIT_WAIT
	POKE_RESHUFFLE_END	SIDE_ATTACK
	EXPFLAG_CLEAR		@FightJoinFlagのクリア
WAZA_NoMineReshuffle:
	BALL_GAUGE_SET		SIDE_KIZETSU
	APPEAR_EFFECT_INIT	SIDE_KIZETSU
	APPEAR_EFFECT		SIDE_KIZETSU
@	MESSAGE_TBL			PokeAppearMsgTbl
	POKE_HPMAX_RATE		SIDE_KIZETSU
	MESSAGE				IREKAEAFTERMSGNO
@	WAIT				MOJI_WAIT/2
	BALL_GAUGE_OFF		SIDE_KIZETSU
	APPEAR_EFFECT_WAIT	SIDE_KIZETSU,APPEAR_NORMAL
	CLIENT_BIT_WAIT
WAZA_MakibishiAfter:
	POKE_RESHUFFLE_END	SIDE_KIZETSU
	IF16				FLAG_BIT,FightType,FIGHT_TYPE_2vs2,_ZenmetsuEnd
	SCA_END_SET
_ZenmetsuEnd:
@	WAZAEND
	SEQEND

WAZA_DoubleNockDown:
	POKE_RESHUFFLE		SIDE_DOUBLE1,WAZA_DoubleNockDownNext
WAZA_DoubleNockDownNext:
	POKE_RESHUFFLE_WAIT	SIDE_KIZETSU,PRW_AFTER_SELMONS_SET
	POKE_RESHUFFLE		SIDE_DOUBLE2,WAZA_DoubleNockDownEnd
	POKE_RESHUFFLE_WAIT	SIDE_KIZETSU,PRW_AFTER_SELMONS_SET
WAZA_DoubleNockDownStart:
	POKE_RESHUFFLE_WAIT	SIDE_KIZETSU,PRW_NORMAL
	BALL_GAUGE_SET		SIDE_KIZETSU
	APPEAR_EFFECT_INIT	SIDE_KIZETSU
	APPEAR_EFFECT		SIDE_KIZETSU
	POKE_HPMAX_RATE		SIDE_KIZETSU
	MESSAGE				IREKAEAFTERMSGNO
	BALL_GAUGE_OFF		SIDE_KIZETSU
	APPEAR_EFFECT_WAIT	SIDE_KIZETSU,APPEAR_NORMAL
	CLIENT_BIT_WAIT
	POKE_RESHUFFLE_END	SIDE_DOUBLE1
	IFWNE				KizetsuClient,ClientSetMax,1,WAZA_DoubleNockDownStart
WAZA_DoubleNockDownEnd:
@	WAZAEND
	SEQEND

WAZA_TrainerWin:
	MESSAGE				TRAINERWINMSGNO
	TRAINER_APPEAR		SIDE_ENEMY
	CLIENT_BIT_WAIT
	MESSAGE				TRAINERLOSEMSGNO
	OKODUKAI_CALC
	MESSAGE				OKODUKAIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
WAZA_Win:
	KOBAN_CHECK
	MONOHIROI
	SEQEND

WAZA_Lose:
	IF16				FLAG_BIT,FightType,FIGHT_TYPE_BATTLE_TOWER,WAZA_Lose_END
	IF16				FLAG_BIT,FightType,FIGHT_TYPE_CARD_E,WAZA_Lose_END
	IF16				FLAG_EQ,FieldTrainerID,ORUSUBAN_TRAINER,WAZA_Lose_END
	MESSAGE				LOSEMSG1NO
	MESSAGE_WAIT		MOJI_WAIT
	MESSAGE				LOSEMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
WAZA_Lose_END:
	SEQEND


WAZA_TuushinWin:
	MESSAGE				TAISENENDMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	END_FIGHT
	MESSAGE_WAIT		MOJI_WAIT
	SEQEND

WAZA_BattleTowerWin:
	MESSAGE				TRAINERWINMSGNO
	TRAINER_APPEAR		SIDE_ENEMY
	CLIENT_BIT_WAIT
	SEQEND

WAZA_ItemEscape:
	FIGHT_EFFECT		SIDE_ATTACK,FE_ID_KEMURIDAMA,0
	MESSAGE				ITEMESCAPEMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SEQEND

WAZA_SpeabiEscape:
@	SE_PLAY				SE_NIGERU
	MESSAGE				SPEABIESCAPEMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SEQEND

WAZA_Escape:
	MESSAGE				ESCAPEMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SEQEND

WAZA_EnemyEscape:
	MESSAGE				ENEMYESCAPEMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SEQEND

WAZA_TrainerEscape:
	MESSAGE				TRAINERESCAPEMSGNO
	SEQEND

WAZA_EscapeNG:
	MESSAGE_TBL			EscapeNGMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	SEQEND

WAZA_EscapeNG2:
	ALERT_MESSAGE_TBL	EscapeNGMsgTbl
	ALERTEND

WAZA_SafariBallThrowNG:
	ALERT_MESSAGE		SAFARIBALLNGMSGNO
	ALERTEND

WAZA_PokeReshuffle:
	POKE_HPDEC_RATE		SIDE_ATTACK
	MESSAGE				IREKAEMSGNO
@	MESSAGE_WAIT		MOJI_WAIT/2
	SETVALUE			UserWork+DAMAGE_VALUE,2	@おいうちは2倍ダメージ
	IF8					FLAG_BIT,FightType,FIGHT_TYPE_2vs2,WAZA_OiuchiCheck2vs2
WAZA_OiuchiCheck1vs1:
	LOOPCNT				1
	JUMP				WAZA_OiuchiCheck
WAZA_OiuchiCheck2vs2:
	LOOPCNT				2
WAZA_OiuchiCheck:
	OIUCHI_CHECK		WAZA_NoOiuchi
	SWITCH_A_D
	MICHIDURE_CHECK
	GOSUB				WAZA_OiuchiAttack
	SWITCH_A_D
WAZA_NoOiuchi:
	LOOP				WAZA_OiuchiCheck
	SIZENKAIHUKU		SIDE_ATTACK
	CLIENT_BIT_WAIT
	MODOSU_EFFECT
	CLIENT_BIT_WAIT
	BALL_GAUGE_SET		SIDE_ATTACK
@POKE_RESHUFFLE_WAITを通しても問題ないはず
	POKE_RESHUFFLE_WAIT	SIDE_ATTACK,PRW_LISTROW_SET
WAZA_PokeAppear:
	APPEAR_EFFECT_INIT	SIDE_ATTACK
	APPEAR_EFFECT		SIDE_ATTACK
	POKE_HPMAX_RATE		SIDE_ATTACK
	MESSAGE				IREKAEAFTERMSGNO
@	WAIT				MOJI_WAIT/2
	BALL_GAUGE_OFF		SIDE_ATTACK
	APPEAR_EFFECT_WAIT	SIDE_ATTACK,APPEAR_NORMAL
	CLIENT_BIT_WAIT
	POKE_RESHUFFLE_END	SIDE_ATTACK
	SETVALUE			UserWork+WKC_WORK0,WKC_SPEABI_CHECK_ALL
	WKC_ACT				WKC_CHECK_ONLY,0
	SETVALUE			UserWork+WKC_WORK0,WKC_OUMU_WAZA_NO
	WKC_ACT				WKC_CHECK_ONLY,0
	SEQEND

WAZA_OiuchiAttack:
	WAIT				MOJI_WAIT/2
	ATTACK_MESSAGE
	PP_DEC
	CRITICAL_CHECK
	DAMAGE_CALC
	TYPE_CHECK
	DAMAGE_LOSS
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	WAZAKOUKA_SE
	POKE_BLINK			SIDE_DEFENCE
	CLIENT_BIT_WAIT
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	CRITICAL_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	KIZETSU_CHECK		SIDE_DEFENCE,0,0
	SETVALUE			UserWork+WKC_WORK0,WKC_SPEABI_CHECK
	WKC_ACT				WKC_CHECK_KOKOMADE,WKC_KODAWARI_SET
@	IF32				FLAG_NBIT,ServerStatusFlag,SERVER_STATUS_FLAG_KIZETSUBIT,WAZA_NoKizetsu
	SUBROUTINE_CALL		SIDE_DEFENCE,CHECK_KIZETSU
	IF8					FLAG_EQ,ServerWork+0,0,WAZA_NoKizetsu
	SETVALUE			UserWork+GETEXP_SEQNO,0
	GET_EXP				SIDE_DEFENCE
WAZA_NoKizetsu:
	SEQRET

WAZA_Wait:
	WAIT				MOJI_WAIT/2
	SEQRET

WAZA_LevelUp:
	ME_PLAY				MUS_FANFA1
	MESSAGE				LEVELUPMSGNO
	SETVALUE			UserWork+SW_SEQNO,0
	STATUS_WINDOW
	WAZAOBOE_CHECK		WAZA_WazaOboe,WAZA_NoWazaOboe,1
	JUMP				WAZA_WazaWasureStart
WAZA_WazaOboeLoop:
	WAZAOBOE_CHECK		WAZA_WazaOboe,WAZA_NoWazaOboe,0
WAZA_WazaWasureStart:
	OBOEWAZANO_SET
	MESSAGE				WAZAOBOEMSG2NO
@	MESSAGE_WAIT		MOJI_WAIT
	MESSAGE				WAZAOBOEMSG3NO
@	MESSAGE_WAIT		MOJI_WAIT
	MESSAGE				WAZAWASUREMSGNO
	CLIENT_BIT_WAIT
	SETVALUE			UserWork+WW_SEQNO,0
	WAZAWASURE_CHECK	WAZA_WazaWasure
WAZA_WazaAkirame:
	MESSAGE				WAZAAKIRAMEMSGNO
	CLIENT_BIT_WAIT
	SETVALUE			UserWork+WW_SEQNO,0
	WAZAAKIRAME_CHECK	WAZA_WazaWasureStart
	MESSAGE				WAZAAKIRAMEMSG2NO
@	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaOboeLoop
WAZA_WazaWasure:
	MESSAGE				WAZAWASUREMSG2NO
@	MESSAGE_WAIT		MOJI_WAIT*2
	MESSAGE				WAZAWASUREMSG3NO
@	MESSAGE_WAIT		MOJI_WAIT
	MESSAGE				WAZAWASUREMSG4NO
@	MESSAGE_WAIT		MOJI_WAIT
WAZA_WazaOboe:
	OBOEWAZANO_SET
	ME_PLAY				MUS_FANFA1
	MESSAGE				WAZAOBOEMSGNO
	MESSAGE_WAIT		MOJI_WAIT
@	SETVALUE			ServerWork,0
@	WAZA_GET
@	CLIENT_BIT_WAIT
	SUBROUTINE_CALL		SIDE_ATTACK,KODAWARI_RESET
	JUMP				WAZA_WazaOboeLoop
WAZA_NoWazaOboe:
@こだわりハチマキの技を忘れた時の処理
	SEQRET

@===================================================
@	雨降り
@===================================================

WAZA_Amefuri:
	MESSAGE_TBL			AmagoiKeepMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_Amefuri_End
	FIGHT_EFFECT		SIDE_ATTACK,FE_ID_AMAGOI,0
WAZA_Amefuri_End:
	SEQEND

@===================================================
@	天候によるダメージ
@===================================================

.if 0
WAZA_WeatherDamage:
	MESSAGE_TBL			WeatherKeepMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	FIGHT_EFFECT2		SIDE_ATTACK,UserWork+FIGHT_EFFECT_WORK,0
	SETVALUE			ServerWork,0
WAZA_WeatherDamageLoop:
	SETWORKOFS			AttackClient,ActionClientNo,ServerWork,1
	WEATHER_KEEP
	IF32				FLAG_EQ,WazaDamage,0,WAZA_WeatherDamageNext
	MESSAGE_TBL			WeatherDamageMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
@自分のHPを減らすのをみがわりが受けないようにする。技を無属性にする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI+SERVER_STATUS_FLAG_NO_ZOKUSEI+SERVER_STATUS_FLAG_NOGAMAN+SERVER_STATUS_FLAG_NO_MICHIDURE
	WAZAKOUKA_SE
	POKE_BLINK			SIDE_ATTACK
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
	KIZETSU_CHECK		SIDE_ATTACK,0,0
	ZENMETSU_CHECK		WAZA_DoubleNockDown
	IF8					FLAG_NE,WinLoseFlag,0,WAZA_WeatherDamageRet
WAZA_WeatherDamageNext:
	ADDVALUE			ServerWork,1
	IFWNE				ServerWork,ClientSetMax,1,WAZA_WeatherDamageLoop
WAZA_WeatherDamageRet:
	RESET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI+SERVER_STATUS_FLAG_NO_ZOKUSEI+SERVER_STATUS_FLAG_NOGAMAN+SERVER_STATUS_FLAG_NO_MICHIDURE
	SEQEND
.else
WAZA_WeatherDamage:
	MESSAGE_TBL			WeatherKeepMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	FIGHT_EFFECT2		SIDE_ATTACK,UserWork+FIGHT_EFFECT_WORK,0
	SETVALUE			ServerWork,0
WAZA_WeatherDamageLoop:
	SETWORKOFS			AttackClient,ActionClientNo,ServerWork,1
	WEATHER_KEEP
	IF32				FLAG_EQ,WazaDamage,0,WAZA_WeatherDamageNext
	MESSAGE_TBL			WeatherDamageMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
@自分のHPを減らすのをみがわりが受けないようにする。技を無属性にする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI+SERVER_STATUS_FLAG_NO_ZOKUSEI+SERVER_STATUS_FLAG_NOGAMAN+SERVER_STATUS_FLAG_NO_MICHIDURE
	WAZAKOUKA_SE
	POKE_BLINK			SIDE_ATTACK
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
	KIZETSU_CHECK		SIDE_ATTACK,0,0
	ZENMETSU_CHECK		WAZA_WeatherDamageNext
WAZA_WeatherDamageNext:
	IF8					FLAG_NE,WinLoseFlag,0,WAZA_WeatherDamageRet
	ADDVALUE			ServerWork,1
	IFWNE				ServerWork,ClientSetMax,1,WAZA_WeatherDamageLoop
WAZA_WeatherDamageRet:
	RESET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI+SERVER_STATUS_FLAG_NO_ZOKUSEI+SERVER_STATUS_FLAG_NOGAMAN+SERVER_STATUS_FLAG_NO_MICHIDURE
	SEQEND
.endif

WAZA_WeatherDamageEnd:
	MESSAGE_TBL			WeatherDamageEndMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	SEQEND

@===================================================
@	晴れ
@===================================================

WAZA_Hare:
	MESSAGE				NIHONBAREKEEPMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	FIGHT_EFFECT		SIDE_ATTACK,FE_ID_NIHONBARE,0
	SEQEND

WAZA_HareEnd:
	MESSAGE				NIHONBAREENDMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SEQEND

@===================================================
@	フィールドの天候を反映	
@===================================================

WAZA_FieldWeather:
	MESSAGE_TBL			WeatherMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	FIGHT_EFFECT2		SIDE_ATTACK,UserWork+FIGHT_EFFECT_WORK,0
	SPEABIEND

@===================================================
@	物理ガード
@===================================================

WAZA_ReflecEnd:
	MESSAGE				WAZAKOUKAENDMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SEQEND

@===================================================
@	しんぴのまもり
@===================================================

WAZA_Shinpi:
	WAIT				MOJI_WAIT/2
	MESSAGE				SHINPIGUARDMSGNO
	MESSAGE_WAIT		MOJI_WAIT
@	WAZAEND								@WazaKoukaCheckをしないようにする対策
	SEQEND

WAZA_ShinpiEnd:
	WAIT				MOJI_WAIT/2
	MESSAGE				SHINPIENDMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SEQEND

@===================================================
@	技効果シーケンス
@===================================================

@===================================================
@	やどりぎ
@===================================================

WAZA_Yadorigi:
	FIGHT_EFFECT		SIDE_ATTACK,FE_ID_YADORIGI,UserWork+FIGHT_EFFECT_WORK
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI+SERVER_STATUS_FLAG_NO_ZOKUSEI
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
	SETWORK				WazaDamage,HitDamage,4
@特殊能力ヘドロえきは、体力がへる
	SPEABI_CHECK		SIDE_ATTACK,TOKUSYU_HEDOROEKI,WAZA_YadorigiHedoro
	DAMAGE_CHG			DAMAGE_NEG			@プラマイ反転
	SETVALUE			ServerWork+5,3
	JUMP				WAZA_YadorigiNext
WAZA_YadorigiHedoro:
	SETVALUE			ServerWork+5,4
WAZA_YadorigiNext:
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI+SERVER_STATUS_FLAG_NO_ZOKUSEI
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	MESSAGE_TBL			YadorigiMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	KIZETSU_CHECK		SIDE_ATTACK,0,0
	KIZETSU_CHECK		SIDE_DEFENCE,0,0
@	WAZAEND								@WazaKoukaCheckをしないようにする対策
	SEQEND

@===================================================
@	がまんしている
@===================================================

WAZA_Gaman:
	MESSAGE				GAMANMSG1NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@===================================================
@	がまんがとかれた
@===================================================

WAZA_GamanOff:
	MESSAGE				GAMANMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
@	HITCHECK			WAZA_GamanMamoruCheck,0
	HITCHECK			WAZA_NormalNohit2,0
	TYPE_CHECK
	RESET8BIT			WazaStatusFlag,WAZASTATUSFLAG_BATSUGUN|WAZASTATUSFLAG_IMAHITOTSU
	SETWORK				WazaDamage,UserWork+GAMANDAMAGE,4
	KORAERU_CHECK
	SETVALUE			UserWork+WAZA_EFF_CNT,1	@ため後の技エフェクト呼び出し
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	WAZAKOUKA_SE
	POKE_BLINK			SIDE_DEFENCE
	CLIENT_BIT_WAIT
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	KIZETSU_CHECK		SIDE_DEFENCE,0,0
	JUMP				WAZA_WazaEnd

.if 0
WAZA_GamanMamoruCheck:
	IF8					FLAG_EQ,ServerWork+6,MSG_MAMORUNOHIT,WAZA_MamoruMessage
	JUMP				WAZA_NormalNohit2
.endif

WAZA_GamanFaild:
	MESSAGE				GAMANMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_Umakukimaran

@======================================================
@	ふきとばしとかほえるとか
@======================================================

WAZA_Hukitobashi:
	WAZA_EFFECT
	WAZA_EFFECT_WAIT
	SIZENKAIHUKU		SIDE_DEFENCE
@	HUKITOBASHI_OIUCHI	WAZA_HikitobashiNoOiuchi
@	GOSUB				WAZA_OiuchiAttack
@	SETWORK				AttackClient,UserWork+PUSH_ATTACK_CLIENT,1
@	IF32				FLAG_BIT,ServerStatusFlag,SERVER_STATUS_FLAG_KIZETSUBIT,WAZA_HukitobashiEnd
@WAZA_HikitobashiNoOiuchi:
	POKEDELACTOR		SIDE_DEFENCE
	CLIENT_BIT_WAIT
	IF16				FLAG_BIT,FightType,FIGHT_TYPE_TRAINER,WAZA_HukitobashiReshuffle
	SETVALUE			WinLoseFlag,FIGHT_END
	ITEMEND				@戦闘終了させます
WAZA_HukitobashiReshuffle:
	APPEAR_EFFECT_INIT	SIDE_DEFENCE
	APPEAR_EFFECT		SIDE_DEFENCE
	APPEAR_EFFECT_WAIT	SIDE_DEFENCE,APPEAR_NORMAL
	CLIENT_BIT_WAIT
	MESSAGE				HIKIZURIMSGNO
	POKE_RESHUFFLE_END	SIDE_DEFENCE
WAZA_HukitobashiEnd:
	JUMP				WAZA_WazaEnd

@======================================================
@	しろいきり
@======================================================

WAZA_Shiroikiri:
	WAIT				MOJI_WAIT/2
	MESSAGE				SHIROIKIRIGUARDMSGNO
	MESSAGE_WAIT		MOJI_WAIT
@	WAZAEND
	SEQRET

@======================================================
@	いかり
@======================================================

WAZA_Ikari:
	MESSAGE				IKARIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@======================================================
@	かなしばり
@======================================================

WAZA_Kanashibari:
	MESSAGE				KANASHIBARIMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

WAZA_Kanashibari2:
	ALERT_MESSAGE		KANASHIBARIMSG2NO
@	WAZAEND
	ALERTEND

WAZA_KanashibariEnd:
	MESSAGE				KANASHIBARIENDMSGNO
	MESSAGE_WAIT		MOJI_WAIT
@	WAZAEND								@WazaKoukaCheckをしないようにする対策
	SEQEND

@======================================================
@	アンコール
@======================================================

WAZA_EncoreEnd:
	MESSAGE				ENCOREENDMSGNO
	MESSAGE_WAIT		MOJI_WAIT
@	WAZAEND								@WazaKoukaCheckをしないようにする対策
	SEQEND

@======================================================
@	みちづれ
@======================================================

WAZA_Michidure:
	MESSAGE				MICHIDUREMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI+SERVER_STATUS_FLAG_NO_ZOKUSEI
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
	KIZETSU_CHECK		SIDE_ATTACK,0,0
	SEQRET

@======================================================
@	まきびし
@======================================================

WAZA_MakibishiA:
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI+SERVER_STATUS_FLAG_NO_ZOKUSEI
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
	GOSUB				WAZA_Makibishi
	KIZETSU_CHECK		SIDE_ATTACK,0,0
	KIZETSU_CHECK		SIDE_ATTACK,1,WAZA_ZenmetsuJumpA
@	JUMP				WAZA_MakibishiAfter
@	SETWORK				WazaSeqAdrs,PushWazaSeqAdrs,4
	SEQRET
WAZA_ZenmetsuJumpA:
	SETVALUE			UserWork+GETEXP_SEQNO,0
	GET_EXP				SIDE_ATTACK
	JUMP				WAZA_Zenmetsu

WAZA_MakibishiD:
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI+SERVER_STATUS_FLAG_NO_ZOKUSEI
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	GOSUB				WAZA_Makibishi
	KIZETSU_CHECK		SIDE_DEFENCE,0,0
	KIZETSU_CHECK		SIDE_DEFENCE,1,WAZA_ZenmetsuJumpD
@	JUMP				WAZA_MakibishiAfter
@	SETWORK				WazaSeqAdrs,PushWazaSeqAdrs,4
	SEQRET
WAZA_ZenmetsuJumpD:
	SETVALUE			UserWork+GETEXP_SEQNO,0
	GET_EXP				SIDE_DEFENCE
	JUMP				WAZA_Zenmetsu

WAZA_MakibishiK:
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI+SERVER_STATUS_FLAG_NO_ZOKUSEI
	HP_DEC				SIDE_KIZETSU
	HP_DEC_WAIT			SIDE_KIZETSU
	GOSUB				WAZA_Makibishi
	KIZETSU_CHECK		SIDE_KIZETSU,0,0
	KIZETSU_CHECK		SIDE_KIZETSU,1,WAZA_ZenmetsuJumpK
@	JUMP				WAZA_MakibishiAfter
@	SETWORK				WazaSeqAdrs,PushWazaSeqAdrs,4
	SEQRET
WAZA_ZenmetsuJumpK:
	SETVALUE			UserWork+GETEXP_SEQNO,0
	GET_EXP				SIDE_KIZETSU
	JUMP				WAZA_Zenmetsu

.if 0
WAZA_MakibishiA:
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI+SERVER_STATUS_FLAG_NO_ZOKUSEI
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
	GOSUB				WAZA_Makibishi
	KIZETSU_CHECK		SIDE_ATTACK
@	WAZAEND
	SEQRET

WAZA_MakibishiD:
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI+SERVER_STATUS_FLAG_NO_ZOKUSEI
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	GOSUB				WAZA_Makibishi
	KIZETSU_CHECK		SIDE_DEFENCE
@	WAZAEND
	SEQRET

WAZA_MakibishiK:
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI+SERVER_STATUS_FLAG_NO_ZOKUSEI
	HP_DEC				SIDE_KIZETSU
	HP_DEC_WAIT			SIDE_KIZETSU
	GOSUB				WAZA_Makibishi
	KIZETSU_CHECK		SIDE_KIZETSU
@	WAZAEND
	SEQRET
.endif

WAZA_Makibishi:
	MESSAGE				MAKIBISHIMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@======================================================
@	ほろびのうた
@======================================================

WAZA_Horobinouta:
	MESSAGE				HOROBINOUTAMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI+SERVER_STATUS_FLAG_NO_ZOKUSEI
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
	KIZETSU_CHECK		SIDE_ATTACK,0,0
	SEQEND

WAZA_Horobinoutaing:
	MESSAGE				HOROBINOUTAMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
@	WAZAEND								@WazaKoukaCheckをしないようにする対策
	SEQEND

@======================================================
@	げんしのちから
@======================================================

WAZA_Genshinochikara:
	CONDCHG_CHECK		SIDE_ATTACK,IFNC,COND_POW,12,WAZA_GenshinochikaraStart
	CONDCHG_CHECK		SIDE_ATTACK,IFNC,COND_DEF,12,WAZA_GenshinochikaraStart
	CONDCHG_CHECK		SIDE_ATTACK,IFNC,COND_AGI,12,WAZA_GenshinochikaraStart
	CONDCHG_CHECK		SIDE_ATTACK,IFNC,COND_SPEPOW,12,WAZA_GenshinochikaraStart
	CONDCHG_CHECK		SIDE_ATTACK,IFEQ,COND_SPEDEF,12,WAZA_GenshiEnd
WAZA_GenshinochikaraStart:
	SETVALUE			UserWork+COND_CHG_MULTI,0
	COND_CHG_BIT_CHECK	SIDE_ATTACK,COND_BIT_POW+COND_BIT_DEF+COND_BIT_AGI+COND_BIT_SPEPOW+COND_BIT_SPEDEF,COND_FLAG_UP
	SETVALUE			UserWork+COND_CHG_WORK,COND_POW+PARA_RANKU1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_GenshiNoPowUp
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_GenshiNoPowUp:
	SETVALUE			UserWork+COND_CHG_WORK,COND_DEF+PARA_RANKU1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_GenshiNoDefUp
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_GenshiNoDefUp:
	SETVALUE			UserWork+COND_CHG_WORK,COND_AGI+PARA_RANKU1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_GenshiNoAgiUp
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_GenshiNoAgiUp:
	SETVALUE			UserWork+COND_CHG_WORK,COND_SPEPOW+PARA_RANKU1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_GenshiNoSpePowUp
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_GenshiNoSpePowUp:
	SETVALUE			UserWork+COND_CHG_WORK,COND_SPEDEF+PARA_RANKU1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_GenshiEnd
	MESSAGE_TBL			CondUpMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_GenshiEnd:
	SEQRET

WAZA_Kousokuspin:
	KOUSOKUSPIN
	SEQRET

WAZA_ShimeEscape:
	MESSAGE				SHIMEESCAPEMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

WAZA_YadorigiEscape:
	MESSAGE				YADORIGIESCAPEMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

WAZA_MakibishiEscape:
	MESSAGE				MAKIBISHIESCAPEMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@======================================================
@	みらいよち
@======================================================

WAZA_Miraiyochi:
	MESSAGE				MIRAIYOCHIMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	IF8					FLAG_NE,ServerWork+5,0,WAZA_HametsunonegaiHitCheck
@ヒットしなかったら、指定したアドレスへジャンプ
	HITCHECK			WAZA_MiraiyochiNoHit,WAZANO_MIRAIYOTI
	JUMP				WAZA_MiraiyochiStart
WAZA_HametsunonegaiHitCheck:
@ヒットしなかったら、指定したアドレスへジャンプ
	HITCHECK			WAZA_MiraiyochiNoHit,WAZANO_HAMETUNONEGAI
WAZA_MiraiyochiStart:
@	DAMAGE_CALC
	DAMAGE_LOSS_ONLY
	IF8					FLAG_NE,ServerWork+5,0,WAZA_HametsunonegaiEff
	FIGHT_EFFECT		SIDE_ATTACK,FE_ID_MIRAIYOTI,0
	JUMP				WAZA_MiraiyochiNext
WAZA_HametsunonegaiEff:
	FIGHT_EFFECT		SIDE_ATTACK,FE_ID_HAMETUNONEGAI,0
WAZA_MiraiyochiNext:
	WAZAKOUKA_SE
	POKE_BLINK			SIDE_DEFENCE
	CLIENT_BIT_WAIT
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
	KIZETSU_CHECK		SIDE_DEFENCE,0,0
@	ZENMETSU_CHECK		WAZA_DoubleNockDown
	ZENMETSU_CHECK		WAZA_MiraiyochiEnd
WAZA_MiraiyochiEnd:
@いかりのボルテージを上げるので、WazaKoukaCheckをとおす
@	WAZAEND
	SETVALUE			UserWork+WKC_WORK0,WKC_IKARI_CHECK
	WKC_ACT				WKC_CHECK_ONLY,0
	SETVALUE			UserWork+WKC_WORK0,WKC_SOUBI_CHECK_ALL
	WKC_ACT				WKC_CHECK_KOKOMADE,WKC_HIT_FLAG_SET
@外れたフラグを落とさないと次の「ほろびのうた」がきかなくなる
	SETVALUE			WazaStatusFlag,0
	SEQEND

WAZA_MiraiyochiNoHit:
	WAIT				MOJI_WAIT/2
	SETVALUE			WazaStatusFlag,0
	SET8BIT				WazaStatusFlag,WAZASTATUSFLAG_UMAKUKIMARAN
	WAZAKOUKA_MESSAGE
	MESSAGE_WAIT		MOJI_WAIT
@	WAZAEND
@外れたフラグを落とさないと次の「ほろびのうた」がきかなくなる
	SETVALUE			WazaStatusFlag,0
	SEQEND

@======================================================
@	わるあがき
@======================================================

WAZA_Waruagaki:
@	MESSAGE				WARUAGAKIMSGNO
	ALERT_MESSAGE		WARUAGAKIMSGNO
@	WAZAEND
	ALERTEND

@======================================================
@	PPがない
@======================================================

WAZA_PPNone:
@	MESSAGE				PPNONEMSGNO
	ALERT_MESSAGE		PPNONEMSGNO
@	WAZAEND
	ALERTEND

@======================================================
@	PPがない（相手の技をうけて攻撃する前にPPがなくなった）
@======================================================

WAZA_PPNoneAttack:
	ATTACK_MESSAGE
	WAIT				MOJI_WAIT/2
	MESSAGE				PPNONEMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@======================================================
@	いちゃもん
@======================================================

WAZA_Ichamon:
@	MESSAGE				ICHAMONMSG2NO
	ALERT_MESSAGE		ICHAMONMSG2NO
@	WAZAEND
	ALERTEND

WAZA_Ichamon2:
	MESSAGE				ICHAMONMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@======================================================
@	ちょうはつ
@======================================================

WAZA_Chouhatsu:
@	MESSAGE				CHOUHATSUMSG2NO
	ALERT_MESSAGE		CHOUHATSUMSG2NO
@	WAZAEND
	ALERTEND

WAZA_Chouhatsu2:
	MESSAGE				CHOUHATSUMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@======================================================
@	まもる
@======================================================

.if 0
WAZA_Mamoru:
	ATTACK_MESSAGE
	PP_DEC
WAZA_MamoruMessage:
	WAIT				MOJI_WAIT/2
	MESSAGE				MAMORUNOHITMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SETVALUE			ServerWork+6,MSG_MAMORUNOHIT2
	JUMP				WAZA_Umakukimaran
.endif

@======================================================
@	ねがいごと
@======================================================

WAZA_Negaigoto:
	@0は動作フラグ（0:ねがいごとをする1:ねがいごとがかなった処理）
	NEGAIGOTO			1,WAZA_NegaigotoMantan
	FIGHT_EFFECT		SIDE_DEFENCE,FE_ID_NEGAIGOTO,0
	MESSAGE				NEGAIGOTOMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	MESSAGE				JIKOSAISEIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SEQEND
WAZA_NegaigotoMantan:
	MESSAGE				NEGAIGOTOMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	WAIT				MOJI_WAIT/2
	MESSAGE				MANTANMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SEQEND

@======================================================
@	ねをはる
@======================================================

WAZA_Newoharu:
	FIGHT_EFFECT		SIDE_ATTACK,FE_ID_NEWOHARU,0
	MESSAGE				NEWOHARUMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
@	WAZAEND								@WazaKoukaCheckをしないようにする対策
	SEQEND

WAZA_Newoharare:
	WAIT				MOJI_WAIT/2
	MESSAGE				NEWOHARAREMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@======================================================
@	ばかぢから
@======================================================

@下がらない特性でも下がるように変更
WAZA_Bakadikara:
	SETVALUE			UserWork+COND_CHG_MULTI,0
	COND_CHG_BIT_CHECK	SIDE_ATTACK,COND_BIT_POW+COND_BIT_DEF,COND_FLAG_DOWN+COND_FLAG_MULTI+COND_FLAG_NO_TOKUSEI
	COND_CHG_BIT_CHECK	SIDE_ATTACK,COND_BIT_POW,COND_FLAG_DOWN+COND_FLAG_NO_TOKUSEI
	SETVALUE			UserWork+COND_CHG_WORK,COND_POW+PARA_RANKD1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK+NOCHECK_TOKUSEI,WAZA_BakadikaraNext
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_BakadikaraNext
	MESSAGE_TBL			CondDownMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_BakadikaraNext:
	COND_CHG_BIT_CHECK	SIDE_ATTACK,COND_BIT_DEF,COND_FLAG_DOWN+COND_FLAG_NO_TOKUSEI
	SETVALUE			UserWork+COND_CHG_WORK,COND_DEF+PARA_RANKD1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK+NOCHECK_TOKUSEI,WAZA_BakadikaraEnd
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_BakadikaraEnd
	MESSAGE_TBL			CondDownMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_BakadikaraEnd:
	SEQRET
@特性でさがらない対応したやつ
.if 0
	SETVALUE			UserWork+COND_CHG_MULTI,0
	COND_CHG_BIT_CHECK	SIDE_ATTACK,COND_BIT_POW+COND_BIT_DEF,COND_FLAG_DOWN+COND_FLAG_MULTI
	COND_CHG_BIT_CHECK	SIDE_ATTACK,COND_BIT_POW,COND_FLAG_DOWN
	SETVALUE			UserWork+COND_CHG_WORK,COND_POW+PARA_RANKD1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_BakadikaraNext
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_BakadikaraNext
	MESSAGE_TBL			CondDownMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_BakadikaraNext:
	COND_CHG_BIT_CHECK	SIDE_ATTACK,COND_BIT_DEF,COND_FLAG_DOWN
	SETVALUE			UserWork+COND_CHG_WORK,COND_DEF+PARA_RANKD1
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_BakadikaraEnd
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_BakadikaraEnd
	MESSAGE_TBL			CondDownMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_BakadikaraEnd:
	SEQRET
.endif

@======================================================
@	はたきおとす
@======================================================

WAZA_Hatakiotosu:
	FIGHT_EFFECT		SIDE_DEFENCE,FE_ID_FUKURO,0
	MESSAGE				HATAKIOTOSUMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@======================================================
@	ふういん
@======================================================

WAZA_Huuin:
	MESSAGE				HUUINMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

WAZA_Huuin2:
	ALERT_MESSAGE		HUUINMSG2NO
@	WAZAEND
	ALERTEND

@======================================================
@	おんねん
@======================================================

WAZA_Onnen:
	MESSAGE				ONNENMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@======================================================
@	マジックコート
@======================================================

WAZA_MagicCort:
	ATTACK_MESSAGE
	PP_DEC
	WAIT				MOJI_WAIT/2
	MESSAGE				MAGICCORTMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NOATTACK_MES+SERVER_STATUS_FLAG_NOPP_DEC+SERVER_STATUS_FLAG_NOPP_CHECK
@	SWITCH_A_D
@このゆびとまれのためにDefenceClientをきめる
	SUBROUTINE_CALL		SIDE_ATTACK,MAGICCORT_A_D
	SEQRET

@======================================================
@	よこどり
@======================================================

WAZA_Yokodori:
	ATTACK_MESSAGE
	PP_DEC
@	WAIT				MOJI_WAIT/2
	YOKODORI_CLIENT_SET
	FIGHT_EFFECT		SIDE_DEFENCE,FE_ID_YOKODORI,0
	MESSAGE				YOKODORIMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NOATTACK_MES+SERVER_STATUS_FLAG_NOPP_DEC+SERVER_STATUS_FLAG_NOPP_CHECK
	SWITCH_A_D
	SEQRET

@======================================================
@	こらえる
@======================================================

WAZA_Koraeta:
	MESSAGE			KORAETAMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	SEQRET

@======================================================
@	いちげきひっさつ
@======================================================

WAZA_Ichigeki:
	MESSAGE			ICHIGEKIMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	SEQRET

@======================================================
@	オーバーヒート
@======================================================

WAZA_OverHeat:
	SETVALUE			UserWork+COND_CHG_MULTI,0
	COND_CHG_BIT_CHECK	SIDE_ATTACK,COND_BIT_SPEPOW,COND_FLAG_DOWN+COND_FLAG_DOUBLE+COND_FLAG_NO_TOKUSEI
	SETVALUE			UserWork+COND_CHG_WORK,COND_SPEPOW+PARA_RANKD2
	CONDCHG				TSUIKA_DIRECT+TSUIKA_ATTACK+NOCHECK_TOKUSEI,WAZA_OverHeatEnd
	IF8					FLAG_EQ,ServerWork+5,2,WAZA_OverHeatEnd
	MESSAGE_TBL			CondDownMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_OverHeatEnd:
	SEQRET

@======================================================
@	技を出す前にメッセージを出す技シーケンス
@======================================================

@======================================================
@	きあいパンチ
@======================================================

WAZA_KiaiPunch:
	MESSAGE				BLANKMSGNO
	MESSAGE_WAIT		1
	FIGHT_EFFECT		SIDE_ATTACK,FE_ID_KIAI_TURN1,0
	MESSAGE				KIAIPUNCHMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SEQEND

@======================================================
@	ポケモン状態異常シーケンス
@======================================================

@======================================================
@	ねむり状態
@======================================================

WAZA_Nemuru:
	MESSAGE				SLEEPMSG1NO
	MESSAGE_WAIT		MOJI_WAIT
	STATUS_EFFECT		SIDE_ATTACK
	JUMP				WAZA_WazaEnd

@======================================================
@	めざめ状態
@======================================================

WAZA_Mezame:
@もう1回BADGE_CHECKを通すためにCHECKEDを落とす
	RESET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_CHECKED
	MESSAGE_TBL			SleepMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	CONDITION_GAUGE		SIDE_ATTACK
	SEQRET

WAZA_SawaguMezame:
	MESSAGE				SLEEPMSG4NO
	MESSAGE_WAIT		MOJI_WAIT
	CONDITION_GAUGE		SIDE_ATTACK
	SEQEND

@======================================================
@	どく状態&どくどく状態
@======================================================

WAZA_Doku:
WAZA_Dokudoku:
	MESSAGE				DOKUMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
WAZA_HPDecAttack:				 @HPを減らすだけなのでシーケンスを共有する
	STATUS_EFFECT		SIDE_ATTACK
WAZA_HPDecAttack2:				 @HPを減らすだけなのでシーケンスを共有する(STATUS_EFFECTを呼ばない）
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI+SERVER_STATUS_FLAG_NO_ZOKUSEI
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
	KIZETSU_CHECK		SIDE_ATTACK,0,0
@	ZENMETSU_CHECK		WAZA_DoubleNockDown
	ZENMETSU_CHECK		WAZA_DokuNext
WAZA_DokuNext:
@	WAZAEND								@WazaKoukaCheckをしないようにする対策
	SEQEND

@======================================================
@	やけど状態
@======================================================

WAZA_Yakedo:
	MESSAGE				YAKEDOMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_HPDecAttack		@HPを減らす動作シーケンス

@======================================================
@	こおり状態
@======================================================

WAZA_Koori:
	MESSAGE				KOORIMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	STATUS_EFFECT		SIDE_ATTACK
	JUMP				WAZA_WazaEnd

@======================================================
@	とけた状態
@======================================================

WAZA_Melt:
	MESSAGE_TBL			MeltMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	CONDITION_GAUGE		SIDE_ATTACK
	SEQRET

@======================================================
@	とけた状態
@======================================================

WAZA_Melt2:
	MESSAGE				KOORIMSG3NO
	MESSAGE_WAIT		MOJI_WAIT
	CONDITION_GAUGE		SIDE_DEFENCE
	SEQRET

@======================================================
@	まひ状態
@======================================================

WAZA_Mahi:
	MESSAGE				MAHIMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	STATUS_EFFECT		SIDE_ATTACK
	JUMP				WAZA_WazaEnd


@======================================================
@	ひるんだ状態
@======================================================

WAZA_Hirumu:
	MESSAGE				HIRUMUMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@======================================================
@	さわいでいる状態
@======================================================

WAZA_Sawagu:
	MESSAGE_TBL			SawaguMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
@	WAZAEND								@WazaKoukaCheckをしないようにする対策
	SEQEND

@======================================================
@	あばれおわったあと
@======================================================

WAZA_AbareruEnd:
	STATUS_EFFECT_DIRECT	SIDE_ATTACK,CONDNO_COND2,CONDITION2_KONRAN
	MESSAGE				ABARERUENDMSGNO
	MESSAGE_WAIT		MOJI_WAIT
@	WAZAEND								@WazaKoukaCheckをしないようにする対策
	SEQEND

@======================================================
@	こんらん状態
@======================================================

WAZA_Konran:
	MESSAGE				KONRANMSG1NO
	MESSAGE_WAIT		MOJI_WAIT
	STATUS_EFFECT2		SIDE_ATTACK,CONDITION2_KONRAN
	IF8					FLAG_EQ,ServerWork+5,0,WAZA_konranRet
WAZA_KonranAct:
	SUBROUTINE_CALL		SIDE_ATTACK,SERVER_KEEP_OFF
	DAMAGE_LOSS_ONLY
	MESSAGE				KONRANMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	WAZAKOUKA_SE
	POKE_BLINK			SIDE_ATTACK
	CLIENT_BIT_WAIT
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI+SERVER_STATUS_FLAG_NO_ZOKUSEI
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
	KIZETSU_CHECK		SIDE_ATTACK,0,0
	JUMP				WAZA_WazaEnd
WAZA_konranRet:
	SEQRET

@======================================================
@	こんらん終了
@======================================================

WAZA_KonranEnd:
	MESSAGE				KONRANMSG3NO
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@======================================================
@	ねこにこばん
@======================================================

WAZA_Nekonikoban:
	MESSAGE				NEKONIKOBANMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@======================================================
@	しめ技系
@======================================================

WAZA_Shime:
	FIGHT_EFFECT		SIDE_ATTACK,FE_ID_SIMETUKE,UserWork+FIGHT_EFFECT_WORK
	MESSAGE				SHIMEKEIZOKUMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_HPDecAttack2		@HPを減らす動作シーケンス

WAZA_ShimeEnd:
	MESSAGE				SHIMEENDMSGNO
	MESSAGE_WAIT		MOJI_WAIT
@	WAZAEND								@WazaKoukaCheckをしないようにする対策
	SEQEND

@======================================================
@	メロメロ
@======================================================

WAZA_Meromero:
	MESSAGE				MEROMEROMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	STATUS_EFFECT2		SIDE_ATTACK,CONDITION2_MEROMERO
	SEQRET

WAZA_MeromeroNext:
	MESSAGE				MEROMEROMSG3NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@======================================================
@	あくむ
@======================================================

WAZA_Akumu:
	MESSAGE				AKUMUMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	STATUS_EFFECT2		SIDE_ATTACK,CONDITION2_AKUMU
	JUMP				WAZA_HPDecAttack2		@HPを減らす動作シーケンス

@======================================================
@	のろい
@======================================================

WAZA_Noroi:
	MESSAGE				NOROIMSG2NO
	MESSAGE_WAIT		MOJI_WAIT
	STATUS_EFFECT2		SIDE_ATTACK,CONDITION2_NOROI
	JUMP				WAZA_HPDecAttack2		@HPを減らす動作シーケンス

@======================================================
@	まひをなおす
@======================================================

WAZA_NoMahi:
	MESSAGE				NOMAHIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	CONDITION_GAUGE		SIDE_DEFENCE
	SEQRET

.if 0
@======================================================
@	かえんぐるま
@======================================================

WAZA_KaengurumaMelt:
	GOSUB				WAZA_Kaenguruma
	GOSUB				WAZA_Melt
	CONDITION_GAUGE		SIDE_ATTACK
	SEQRET

WAZA_Kaenguruma:
	SETVALUE			ServerWork+3,COND_YAKEDO
	TSUIKA_CHECK
	SEQRET
.endif

@======================================================
@	技追加効果シーケンス
@======================================================

@======================================================
@	ねむり
@======================================================

WAZA_AddNemuri:
@	MESSAGE				SLEEPBEGINMSGNO
	STATUS_EFFECT		SIDE_TSUIKA
	MESSAGE_TBL			AddNemuriMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
WAZA_ConditionSet:
	CONDITION_GAUGE		SIDE_TSUIKA
	CLIENT_BIT_WAIT
	SEQRET

WAZA_AddNemuri2:
	STATUS_EFFECT		SIDE_TSUIKA
	MESSAGE				SLEEPBEGINMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	CONDITION_GAUGE		SIDE_TSUIKA
	CLIENT_BIT_WAIT
	VANISH_OFF			SIDE_TSUIKA
@	WAZAEND								@WazaKoukaCheckをしないようにする対策
	SEQEND

@======================================================
@	どく
@======================================================

WAZA_AddDoku:
@	MESSAGE				DOKUMSG1NO
	STATUS_EFFECT		SIDE_TSUIKA
	MESSAGE_TBL			AddDokuMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_ConditionSet

@======================================================
@	やけど
@======================================================

WAZA_AddYakedo:
@	MESSAGE				YAKEDOMSG1NO
	STATUS_EFFECT		SIDE_TSUIKA
	MESSAGE_TBL			AddYakedoMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_ConditionSet

@======================================================
@	こおり
@======================================================

WAZA_AddKoori:
@	MESSAGE				KOORIMSG1NO
	STATUS_EFFECT		SIDE_TSUIKA
	MESSAGE_TBL			AddKooriMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_ConditionSet

@======================================================
@	まひ
@======================================================

WAZA_AddMahi:
@	MESSAGE				MAHIMSG1NO
	STATUS_EFFECT		SIDE_TSUIKA
	MESSAGE_TBL			AddMahiMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_ConditionSet

@======================================================
@	さわぐ
@======================================================

WAZA_AddSawagu:
	MESSAGE				SAWAGUMSG1NO
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@======================================================
@	どくどく
@======================================================

WAZA_AddDokudoku:
	STATUS_EFFECT		SIDE_TSUIKA
	MESSAGE				DOKUMSG4NO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_ConditionSet

@======================================================
@	ねこにこばん
@======================================================

WAZA_AddNekonikoban:
	MESSAGE				NEKONIKOBANMSG1NO
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@======================================================
@	しめ技系
@======================================================

WAZA_AddShime:
	MESSAGE_TBL			ShimeMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@======================================================
@	こんらん
@======================================================

WAZA_AddKonran:
	STATUS_EFFECT_DIRECT	SIDE_TSUIKA,CONDNO_COND2,CONDITION2_KONRAN
	MESSAGE				KONRANMSG4NO
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@======================================================
@	はんどう
@======================================================

WAZA_AddHanekaeri:
@わるあがきは、かならずはねかえる
	IF16				FLAG_EQ,WazaNo,WAZANO_WARUAGAKI,WAZA_AddHanekaeriStart
@特殊能力いしあたまは、はねかえりを受けない
	SPEABI_CHECK		SIDE_ATTACK,TOKUSYU_ISIATAMA,WAZA_AddHanekaeriEnd
WAZA_AddHanekaeriStart:
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI+SERVER_STATUS_FLAG_NO_ZOKUSEI
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
	MESSAGE				HANEKAERIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	KIZETSU_CHECK		SIDE_ATTACK,0,0
WAZA_AddHanekaeriEnd:
	SEQRET

@======================================================
@	どろぼう
@======================================================

WAZA_AddDorobou:
	FIGHT_EFFECT		SIDE_DEFENCE,FE_ID_NUSUMU,0
	MESSAGE				DOROBOUMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@======================================================
@	特殊能力シーケンス
@======================================================

@======================================================
@	攻撃のターンで発生しない特殊能力はSPEABIENDを使用する
@======================================================

@======================================================
@	あめふらし
@======================================================

WAZA_Amehurashi:
	WAIT				MOJI_WAIT/2
	MESSAGE				AMEHURASHIMSGNO
	CLIENT_BIT_WAIT
	FIGHT_EFFECT		SIDE_FIELD,FE_ID_AMAGOI,0
	GOSUB				WAZA_TenkiyaCheck
	SPEABIEND

@======================================================
@	かそくそうち
@======================================================

WAZA_Kasokusouti:
	FIGHT_EFFECT		SIDE_ATTACK,FE_ID_STATUS_UPDOWN,UserWork+FIGHT_EFFECT_WORK
	MESSAGE				KASOKUSOUTIMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SPEABIEND

@======================================================
@	トレース
@======================================================

WAZA_Trace:
	WAIT				MOJI_WAIT/2
	MESSAGE				TRACEMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SPEABIEND

@======================================================
@	あめうけざら
@======================================================

WAZA_Ameukezara:
	MESSAGE			AMEUKEZARAMSGNO
	MESSAGE_WAIT	MOJI_WAIT
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT		ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI
	HP_DEC			SIDE_ATTACK
	HP_DEC_WAIT		SIDE_ATTACK
	SPEABIEND

@======================================================
@	すなおこし
@======================================================

WAZA_Sunaokosi:
	WAIT				MOJI_WAIT/2
	MESSAGE				SUNAOKOSIMSGNO
	CLIENT_BIT_WAIT
	FIGHT_EFFECT		SIDE_FIELD,FE_ID_SUNAARASI,0
	GOSUB				WAZA_TenkiyaCheck
	SPEABIEND

@======================================================
@	だっぴ
@======================================================

WAZA_Dappi:
	MESSAGE			DAPPIMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	CONDITION_GAUGE	SIDE_ATTACK
	SPEABIEND

@======================================================
@	てんきや
@======================================================

WAZA_TenkiyaCheck:
	SETVALUE		UserWork+CLIENT_NO_WORK,0
WAZA_TenkiyaCheckLoop:
	TENKIYA_CHECK
	ADDVALUE		UserWork+CLIENT_NO_WORK,1
	IFWNE			UserWork+CLIENT_NO_WORK,ClientSetMax,1,WAZA_TenkiyaCheckLoop
WAZA_TenkiyaCheckEnd:
	SEQRET

WAZA_Tenkiya:
	GOSUB			WAZA_Tenkiya2
	SPEABIEND

WAZA_Tenkiya2:
	TENKIYA
	CLIENT_BIT_WAIT
	MESSAGE			TENKIYAMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	SEQRET

@======================================================
@	いかく
@======================================================

WAZA_Ikaku:
	GOSUB				WAZA_IkakuAct2
	SPEABIEND

WAZA_IkakuAct2:
	WAIT				MOJI_WAIT/2
WAZA_IkakuAct:
	SETVALUE			DefenceClient,0
	SETVALUE			UserWork+COND_CHG_WORK,COND_POW+PARA_RANKD1
WAZA_IkakuLoop:
	IKAKU				WAZA_IkakuEnd
	CONDITION2_CHECK	SIDE_DEFENCE,CONDITION2_MIGAWARI,WAZA_IkakuNoMsg
	SPEABI_CHECK		SIDE_DEFENCE,TOKUSYU_KURIABODHI,WAZA_NoIkaku
	SPEABI_CHECK		SIDE_DEFENCE,TOKUSYU_KAIRIKIBASAMI,WAZA_NoIkaku
	SPEABI_CHECK		SIDE_DEFENCE,TOKUSYU_SIROIKEMURI,WAZA_NoIkaku
	CONDCHG				TSUIKA_DIRECT+IKAKU_CONDCHG,WAZA_IkakuNoMsg
	IF8					FLAG_C,ServerWork+5,1,WAZA_IkakuNoMsg
	COND_CHG_WORK_SET
	FIGHT_EFFECT		SIDE_DEFENCE,FE_ID_STATUS_UPDOWN,UserWork+FIGHT_EFFECT_WORK
	MESSAGE				IKAKUMSGNO
	MESSAGE_WAIT		MOJI_WAIT
WAZA_IkakuNoMsg:
	ADDVALUE			DefenceClient,1
	JUMP				WAZA_IkakuLoop
WAZA_IkakuEnd:
	SEQRET
WAZA_NoIkaku:
	WAIT				MOJI_WAIT/2
	MESSAGE				CLEARBODYNOIKAKUMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_IkakuNoMsg

@======================================================
@	ひでり
@======================================================

WAZA_Hideri:
	WAIT				MOJI_WAIT/2
	MESSAGE				HIDERIMSGNO
	CLIENT_BIT_WAIT
	FIGHT_EFFECT		SIDE_FIELD,FE_ID_NIHONBARE,0
	GOSUB				WAZA_TenkiyaCheck
	SPEABIEND

@======================================================
@	ひらいしん
@======================================================

WAZA_Hiraishin:
	ATTACK_MESSAGE
	WAIT				MOJI_WAIT/2
	MESSAGE				HIRAISHINMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NOATTACK_MES
	SEQRET

@======================================================
@	攻撃のターンの途中で発生し、
@	そのままシーケンスを終了させてよい特殊能力はWAZAENDを使用する
@======================================================

@======================================================
@	がんじょう
@======================================================

WAZA_Ganzyou:
	WAIT				MOJI_WAIT/2
	MESSAGE				GANZYOUMSGNO
	WAIT				MOJI_WAIT
	JUMP				WAZA_WazaEnd

@======================================================
@	しめりけ
@======================================================

WAZA_Shimerike:
	WAIT				MOJI_WAIT/2
	MESSAGE				SHIMERIKEMSGNO
	WAIT				MOJI_WAIT
	JUMP				WAZA_WazaEnd

@======================================================
@	ちくでん＆ちょすい
@======================================================

WAZA_TikudenPPDec:
WAZA_TyosuiPPDec:
	PP_DEC
WAZA_Tikuden:
WAZA_Tyosui:
	ATTACK_MESSAGE
	WAIT				MOJI_WAIT/2
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI
	HP_DEC				SIDE_DEFENCE
	HP_DEC_WAIT			SIDE_DEFENCE
	MESSAGE				HPKAIFUKUMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SET8BIT				WazaStatusFlag,WAZASTATUSFLAG_KOUKANAI
	JUMP				WAZA_WazaEnd

WAZA_NOKaifukuPPDec:
	PP_DEC
WAZA_NOKaifuku:
	ATTACK_MESSAGE
	WAIT				MOJI_WAIT/2
	MESSAGE				NOHPKAIFUKUMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SET8BIT				WazaStatusFlag,WAZASTATUSFLAG_KOUKANAI
	JUMP				WAZA_WazaEnd

@======================================================
@	もらいび
@======================================================

WAZA_MoraibiPPDec:
	PP_DEC
WAZA_Moraibi:
	ATTACK_MESSAGE
	WAIT				MOJI_WAIT/2
	MESSAGE_TBL			MoraibiMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@======================================================
@	きゅうばん
@======================================================

WAZA_Kyuuban:
	WAIT				MOJI_WAIT/2
	MESSAGE				KYUUBANMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@======================================================
@	クリアボディ
@======================================================

WAZA_ClearBody:
	WAIT				MOJI_WAIT/2
	MESSAGE				CLEARBODYMSGNO
	MESSAGE_WAIT		MOJI_WAIT
@	WAZAEND
	SEQRET

@======================================================
@	みずのベール
@======================================================

WAZA_Mizunobeeru:
	WAIT				MOJI_WAIT/2
	MESSAGE_TBL			MizunobeeruMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@======================================================
@	じゅうなん
@======================================================

WAZA_Juunan:
	WAIT				MOJI_WAIT/2
	MESSAGE_TBL			JuunanMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET			

@======================================================
@	めんえき
@======================================================

WAZA_Meneki:
	WAIT				MOJI_WAIT/2
	MESSAGE_TBL			MenekiMsgTbl
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@======================================================
@	どんかん
@======================================================

WAZA_Donkan:
	WAIT				MOJI_WAIT/2
	MESSAGE				DONKANMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@======================================================
@	せいしんりょく
@======================================================

WAZA_Seisinryoku:
	WAIT				MOJI_WAIT/2
	MESSAGE				SEISINRYOKUMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@======================================================
@	マイペース
@======================================================

WAZA_Mypace:
	WAIT				MOJI_WAIT/2
	MESSAGE				MYPACEMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@======================================================
@	ぼうおん
@======================================================

WAZA_Bouon:
	ATTACK_MESSAGE
	PP_DEC
	WAIT				MOJI_WAIT/2
	MESSAGE				BOUONMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@======================================================
@	COND_??系を下げない効果なので、ルーチンを共有
@	するどいめ
@	かいりきバサミ
@======================================================

WAZA_Surudoime:
WAZA_Kairikibasami:
	WAIT				MOJI_WAIT/2
	MESSAGE				NOCONDDOWNMSGNO
	MESSAGE_WAIT		MOJI_WAIT
@	WAZAEND
	SETVALUE			ServerWork+5,3
	SEQRET				@「くすぐる」とか複数パラメータ変化系を
						@途中でやめないようにするため

@======================================================
@	ねんちゃく
@======================================================

WAZA_Nentyaku:
	WAIT				MOJI_WAIT/2
	MESSAGE				TOKUSEINOWAZAMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	JUMP				WAZA_WazaEnd

@======================================================
@	攻撃の終了で発生する特殊能力はSEQENDを使用する
@	あるいは、途中でもサブルーチンジャンプで
@	呼ばれたものはSEQRETを使用する
@======================================================

@======================================================
@	へんしょく
@======================================================

WAZA_Hensyoku:
	MESSAGE				HENSYOKUMSGNO
	MESSAGE_WAIT		MOJI_WAIT
@	WAZAEND
	SEQRET

@======================================================
@	さめはだ
@======================================================

WAZA_Samehada:
@自分のHPを減らすのをみがわりが受けないようにする
	SET32BIT			ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI+SERVER_STATUS_FLAG_NO_ZOKUSEI
	HP_DEC				SIDE_ATTACK
	HP_DEC_WAIT			SIDE_ATTACK
	MESSAGE				SAMEHADAMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	KIZETSU_CHECK		SIDE_ATTACK,0,0
@	WAZAEND
	SEQRET

@======================================================
@	メロメロボディ
@======================================================

WAZA_MeromeroBody:
	STATUS_EFFECT2		SIDE_ATTACK,CONDITION2_MEROMERO
	MESSAGE				SPEABIMEROMEROMSGNO
	MESSAGE_WAIT		MOJI_WAIT
	SEQRET

@======================================================
@	特殊能力ほうしは、どく、まひ、ねむりを追加するので、ルーチンを共有する
@	特殊能力どくのトゲは、どくを追加するので、ルーチンを共有する
@	特殊能力シンクロは、追加効果を返すので、ルーチンを共有する
@	特殊能力せいでんきは、まひを追加するので、ルーチンを共有する
@	特殊能力ほのおのからだは、やけどを追加するので、ルーチンを共有する
@======================================================

WAZA_Housi:
WAZA_Dokunotoge:
WAZA_Seidenki:
WAZA_Honoonokarada:
	CLIENT_BIT_WAIT
	TSUIKA_INDIRECT_ACT
	SEQRET

WAZA_Sinkuro:
	CLIENT_BIT_WAIT
	TSUIKA_DIRECT_ACT
	SEQRET

@======================================================
@	特性効果で状態異常を回復
@======================================================

WAZA_SpeabiNoJoutaiijou:
	MESSAGE			SPEABINOJOUTAIIJOUMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	CONDITION_GAUGE	SIDE_CLIENTNOWORK
	SEQRET

@======================================================
@	他人のポケモンがいうことを聞かない処理
@======================================================

WAZA_OrderIgnoreSleep:
	MESSAGE			ORDERIGNORESLEEPMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	SETVALUE		UserWork+WKC_WORK0,0
	WKC_ACT			WKC_CHECK_KOKOMADE,WKC_DOUBLE_ATTACK
	WAZAEND

WAZA_OrderIgnore:
	MESSAGE			ORDERIGNOREMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	WAZASEQADRS		0

WAZA_Namakeru:
	MESSAGE_TBL		NamaketeiruMsgTbl
	MESSAGE_WAIT	MOJI_WAIT
	SETVALUE		UserWork+WKC_WORK0,0
	WKC_ACT			WKC_CHECK_KOKOMADE,WKC_DOUBLE_ATTACK
	WAZAEND

WAZA_Hirune:
	MESSAGE			HIRUNEMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	SETVALUE		ServerWork+3,COND_NEMURI+TSUIKA_ATTACK
	TSUIKA_DIRECT_ACT
	SETVALUE		UserWork+WKC_WORK0,0
	WKC_ACT			WKC_CHECK_KOKOMADE,WKC_DOUBLE_ATTACK
	WAZAEND

WAZA_OwnAttack:
	MESSAGE			IUKOTOWOKIKANAIMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	JUMP			WAZA_KonranAct

@======================================================
@	みがわりの気絶
@======================================================

WAZA_MigawariKizetsu:
	FIGHT_EFFECT	SIDE_DEFENCE,FE_ID_MIGAWARI_KIZETU,0
	MESSAGE			MIGAWARIENDMSGNO
	SEQRET

@======================================================
@	装備アイテム効果
@======================================================

WAZA_ItemNoMahi:
	GOSUB			WAZA_ItemNoMahi2
	SEQEND
WAZA_ItemNoMahi2:
	FIGHT_EFFECT	SIDE_CLIENTNOWORK,FE_ID_KAIFUKU,0
	MESSAGE			ITEMNOMAHIMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	CONDITION_GAUGE	SIDE_CLIENTNOWORK
	KILLITEM		SIDE_CLIENTNOWORK
	SEQRET

WAZA_ItemNoDoku:
	GOSUB			WAZA_ItemNoDoku2
	SEQEND

WAZA_ItemNoDoku2:
	FIGHT_EFFECT	SIDE_CLIENTNOWORK,FE_ID_KAIFUKU,0
	MESSAGE			ITEMNODOKUMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	CONDITION_GAUGE	SIDE_CLIENTNOWORK
	KILLITEM		SIDE_CLIENTNOWORK
	SEQRET

WAZA_ItemNoYakedo:
	GOSUB			WAZA_ItemNoYakedo2
	SEQEND

WAZA_ItemNoYakedo2:
	FIGHT_EFFECT	SIDE_CLIENTNOWORK,FE_ID_KAIFUKU,0
	MESSAGE			ITEMNOYAKEDOMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	CONDITION_GAUGE	SIDE_CLIENTNOWORK
	KILLITEM		SIDE_CLIENTNOWORK
	SEQRET

WAZA_ItemNoKoori:
	GOSUB			WAZA_ItemNoKoori2
	SEQEND

WAZA_ItemNoKoori2:
	FIGHT_EFFECT	SIDE_CLIENTNOWORK,FE_ID_KAIFUKU,0
	MESSAGE			ITEMNOKOORIMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	CONDITION_GAUGE	SIDE_CLIENTNOWORK
	KILLITEM		SIDE_CLIENTNOWORK
	SEQRET

WAZA_ItemNoNemuri:
	GOSUB			WAZA_ItemNoNemuri2
	SEQEND

WAZA_ItemNoNemuri2:
	FIGHT_EFFECT	SIDE_CLIENTNOWORK,FE_ID_KAIFUKU,0
	MESSAGE			ITEMNONEMURIMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	CONDITION_GAUGE	SIDE_CLIENTNOWORK
	KILLITEM		SIDE_CLIENTNOWORK
	SEQRET

WAZA_ItemNoKonran:
	GOSUB			WAZA_ItemNoKonran2
	SEQEND

WAZA_ItemNoKonran2:
	FIGHT_EFFECT	SIDE_CLIENTNOWORK,FE_ID_KAIFUKU,0
	MESSAGE			ITEMNOKONRANMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	KILLITEM		SIDE_CLIENTNOWORK
	SEQRET

WAZA_ItemNoJoutaiijou:
	GOSUB			WAZA_ItemNoJoutaiijou2
	SEQEND

WAZA_ItemNoJoutaiijou2:
	FIGHT_EFFECT	SIDE_CLIENTNOWORK,FE_ID_KAIFUKU,0
@	MESSAGE			ITEMNOJOUTAIIJOUMSGNO
	MESSAGE_TBL		ItemMultiRecoverTbl
	MESSAGE_WAIT	MOJI_WAIT
	CONDITION_GAUGE	SIDE_CLIENTNOWORK
	KILLITEM		SIDE_CLIENTNOWORK
	SEQRET

WAZA_ItemAbiKaifuku:
	GOSUB			WAZA_ItemAbiKaifuku2
	SEQEND

WAZA_ItemAbiKaifuku2:
	FIGHT_EFFECT	SIDE_CLIENTNOWORK,FE_ID_KAIFUKU,0
	MESSAGE			ITEMABIKAIFUKUMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	KILLITEM		SIDE_CLIENTNOWORK
	SEQRET

WAZA_ItemHPKaifuku:
	FIGHT_EFFECT	SIDE_ATTACK,FE_ID_KAIFUKU,0
	MESSAGE			ITEMHPKAIFUKUMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	SET32BIT		ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI
	HP_DEC			SIDE_ATTACK
	HP_DEC_WAIT		SIDE_ATTACK
	KILLITEM		SIDE_ATTACK
	SEQEND

WAZA_ItemPPKaifuku:
	FIGHT_EFFECT	SIDE_ATTACK,FE_ID_KAIFUKU,0
	MESSAGE			ITEMPPKAIFUKUMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	KILLITEM		SIDE_ATTACK
	SEQEND

WAZA_ItemHPKaifukuEveryTurn:
	GOSUB			WAZA_ItemHPKaifukuEveryTurn2
	SEQEND

WAZA_ItemHPKaifukuEveryTurn2:
	FIGHT_EFFECT	SIDE_ATTACK,FE_ID_KAIFUKU,0
	MESSAGE			ITEMHPKAIFUKUEVERYTURNMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	SET32BIT		ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI
	HP_DEC			SIDE_ATTACK
	HP_DEC_WAIT		SIDE_ATTACK
	SEQRET

WAZA_ItemOnaziWazaOnly:
	ALERT_MESSAGE	ITEMONAZIWAZAONLYMSGNO
	ALERTEND

WAZA_ItemKoraeta:
	FIGHT_EFFECT	SIDE_DEFENCE,FE_ID_KIAINOHATIMAKI,0
	MESSAGE			ITEMKORAETAMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	SEQRET

WAZA_ItemHPKaifukuKonran:
	FIGHT_EFFECT	SIDE_ATTACK,FE_ID_KAIFUKU,0
	MESSAGE			ITEMHPKAIFUKUMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	SET32BIT		ServerStatusFlag,SERVER_STATUS_FLAG_NO_MIGAWARI
	HP_DEC			SIDE_ATTACK
	HP_DEC_WAIT		SIDE_ATTACK
	MESSAGE			SEEDKONRANMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	SETVALUE		ServerWork+3,COND2_KONRAN+TSUIKA_ATTACK
	TSUIKA_DIRECT_ACT
	KILLITEM		SIDE_ATTACK
	SEQEND

WAZA_ItemCondUp:
	FIGHT_EFFECT	SIDE_ATTACK,FE_ID_KAIFUKU,0
	CONDCHG			TSUIKA_DIRECT+TSUIKA_ATTACK,WAZA_ItemNoCondUp
WAZA_ItemNoCondUp:
	SETVALUE		ServerWork+5,4
	GOSUB			WAZA_CondUpTsuikaMsg
	KILLITEM		SIDE_ATTACK
	SEQEND

WAZA_ItemCriticalUp:
	FIGHT_EFFECT	SIDE_ATTACK,FE_ID_KAIFUKU,0
	MESSAGE			ITEMCRITICALUPMSGNO
	MESSAGE_WAIT	MOJI_WAIT
	KILLITEM		SIDE_ATTACK
	SEQEND

@======================================================
@	通信時アラートメッセージ
@======================================================

WAZA_DouguAlert:
	ALERT_MESSAGE	DOUGUALERTMSGNO
	ALERTEND

@======================================================
@	メッセージを消す
@======================================================

WAZA_BlankMsg:
	MESSAGE			BLANKMSGNO
	SEQRET

