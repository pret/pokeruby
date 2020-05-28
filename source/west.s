@======================================================
@	west.s
@======================================================

	.text
	.code 32

	.include	"west.h"
	
	.global		WazaEffSeqTbl
	.global		WazaEffBGMFadeNo
	.global		StatusEffSeqTbl
	.global		FightEffSeqTbl
	.global		EtcEffSeqTbl

#include "waza_dat.h"
#include "..\snd_file\mus_def.h"
#include "wazano.def"
#include "fight.def"

@======================================================
@	技エフェクトの動作シーケンスのマクロ説明
@======================================================

.if 0

CHAR_SET	chrid
	chridのCellSetとPalSetを行います。

CHAR_DEL	chrid
	chridのDelCellとDelPalを行います。

ADD_ACTOR	ActorHeaderAddress,cnt,…
	ActorHeaderAddressのアクターをAddActorします。
	cnt分、以降にあるデータをアクターテーブルの
	work[0]から順に格納していきます。
	
WAIT	waitcnt
	waitcntインター、待ちます。

WAIT_FLAG
	ADD_ACTORされたアクターがすべてDelActorされるまで待ちます。

LOOP_LABEL
	ループの開始点を設定します。このとき、ループカウンターもクリアされます。
	ループの入れ子は禁止です。

LOOP	loopcnt
	LOOP_LABELで設定した場所にloopcnt分ループします。

SEQEND
	技エフェクトシーケンスの終了です。必ず最後に入れてください。

.endif

@======================================================
@	技エフェクトのアクターテーブル
@======================================================

/*--- extern文は必要なさそうなのでｺﾒﾝﾄにする 01/06/06 by matsuda--------
	.extern		ActHatakuHeader
	.extern		ActHappaHeader
	.extern		ActAmaeruHeader
	.extern		ActNemuriKonaChrHeader
	.extern		ActDokuKonaChrHeader
	.extern		ActSibireKonaChrHeader
	.extern		ActKaenHeader
	.extern		ActSuketiHeader
	.extern 	ActQuakeHeader
	.extern 	ActStarHeader
	.extern 	ActZzzHeader
	.extern		ActTikyuuHeader
	.extern		ActKairikiHeader
	.extern		ActJiyumanTamaHeader
	.extern		ActSenHeader
	.extern		ActTaiatariHeader
	.extern		ActHaneruHeader
	.extern		ActHoneHeader
	.extern		ActRushHeader
	.extern		ActOnpaHeader
	.extern		ActKurumaHeader
	.extern		ActMovehitHeader
	.extern		ActFlashHeader
	.extern		ActHatakuFlipHeader
	.extern		ActKiraFlashHeader
	.extern		ActSupinHeader
	.extern		ActDaimonHeader
	.extern		ActDaimon2Header
	.extern		ActYadoriHeader
	.extern		ActHinokoAHeader
	.extern		ActHinokoBHeader
	.extern		ActHinokoHeader
	.extern		ActKobusiHeader
	.extern		ActDenkouHeader
	.extern		ActSonicHeader
	.extern		ActBumeHeader
	.extern		ActDenkiTamaHeader
	.extern		ActIbaruHeader
	.extern		ActIbaru2Header
	.extern		ActHukuroHeader
	.extern		ActMegakickHeader
	.extern		ActHumitukeHeader
	.extern		ActKinokoKonaChrHeader
	.extern		TaskSorawoTobu
	.extern		TaskSoraEndChk
	.extern		TaskPokeBanish
	.extern		ActIaigiriHeader
	.extern		ActHatakuPaHeader
	.extern		ActMezameHeader
	.extern		ActMezame2Header
	.extern		ActTurugiHeader
	.extern		ActTurugi2Header
	.extern		ActJikoanjiHeader
	.extern		ActHiyokoHeader
	.extern		ActFadeHeader
	.extern		WazaTaskColorFade
	.extern		ActUzuHeader
	.extern		ActSaiminHeader
	.extern		ActHorobiHeader
	.extern		ActKageHeader
	.extern		ActZibakuHeader
	.extern		ActTatakiHeader
	.extern		ActSuitoruHeader
	.extern		ActSuitoruTamaHeader
	.extern		ActAkumaHeader
	.extern		ActKissHeader
	.extern		ActMoveTamaHeader
	.extern		ActMoveTama2Header
	.extern		ActKiraHeader
	.extern		ActKira2Header
	.extern		ActMamoruHeader
	.extern		ActItamihitHeader
	.extern		ActChopHeader
	.extern		ActChop2Header
	.extern		ActKobanHeader
	.extern		ActKoban2Header
	.extern		ActGekiHeader
	.extern		ActGekihiHeader
	.extern		ActSeityouHeader
	.extern		ActMakibisiHeader
	.extern		ActKoori2Header
	.extern		ActKonayukiHeader
	.extern		ActAyasiiHikariHeader
	.extern		ActAseHeader
	.extern		TaskGensinoTikara
	.extern		ActRockOnHeader
	.extern		ActKuroiManazasiHeader
	.extern		ActIwaOtosiHeader
	.extern		ActDorobouHeader
	.extern		ActQuestionHeader
	.extern		ActMilkBinHeader
------------------------------------*/
	
@=================================================================
@
@	技エフェクトのキャラのCell&PalID定義（C言語で言うところのENUM）
@	Cellデータのテーブルはwaza_eff.datを参照
@=================================================================
/*
	INIT_CMD
//	DEF_CMD		WAZACHR_ID_HITCHR
	DEF_CMD		WAZACHR_ID_HAPPA
	DEF_CMD		WAZACHR_ID_AMAERU
	DEF_CMD		WAZACHR_ID_AWA
	DEF_CMD		WAZACHR_ID_CHOP
	DEF_CMD		WAZACHR_ID_DAMAGE
	DEF_CMD		WAZACHR_ID_EKI
	DEF_CMD		WAZACHR_ID_HITOMI
	DEF_CMD		WAZACHR_ID_HONE
	DEF_CMD		WAZACHR_ID_HONOO
	DEF_CMD		WAZACHR_ID_IBARU
	DEF_CMD		WAZACHR_ID_IWA
	DEF_CMD		WAZACHR_ID_KAMINARI
	DEF_CMD		WAZACHR_ID_KERI
	DEF_CMD		WAZACHR_ID_KIRA
	DEF_CMD		WAZACHR_ID_KOBAN
	DEF_CMD		WAZACHR_ID_ONPU
	DEF_CMD		WAZACHR_ID_PANCH
	DEF_CMD		WAZACHR_ID_PEN
	DEF_CMD		WAZACHR_ID_PENDANTO
	DEF_CMD		WAZACHR_ID_SEN
	DEF_CMD		WAZACHR_ID_SONIC
	DEF_CMD		WAZACHR_ID_STAR
	DEF_CMD		WAZACHR_ID_TAKARA
	DEF_CMD		WAZACHR_ID_TAMA
	DEF_CMD		WAZACHR_ID_TURUGI
	DEF_CMD		WAZACHR_ID_WA
	DEF_CMD		WAZACHR_ID_YADORIGI
	DEF_CMD		WAZACHR_ID_ZZZ
	DEF_CMD		WAZACHR_ID_NEMURIKONA
	DEF_CMD		WAZACHR_ID_DOKUKONA
	DEF_CMD		WAZACHR_ID_SIBIREKONA
	DEF_CMD		WAZACHR_ID_TIKYUU
	DEF_CMD		WAZACHR_ID_KAIRIKI
	DEF_CMD		WAZACHR_ID_HARI
	DEF_CMD		WAZACHR_ID_KOBUSI
	DEF_CMD		WAZACHR_ID_DENKOU
	DEF_CMD		WAZACHR_ID_KINOKOKONA
	DEF_CMD		WAZACHR_ID_IAIGIRI
	DEF_CMD		WAZACHR_ID_HATAKU
	DEF_CMD		WAZACHR_ID_QUESTION
	DEF_CMD		WAZACHR_ID_HIYOKO
	DEF_CMD		WAZACHR_ID_BAKUHATU
	DEF_CMD		WAZACHR_ID_AKUMA
	DEF_CMD		WAZACHR_ID_KISS
	DEF_CMD		WAZACHR_ID_TENSI
	DEF_CMD		WAZACHR_ID_ASE
	DEF_CMD		WAZACHR_ID_MAHOUZIN
	DEF_CMD		WAZACHR_ID_DOKU
	DEF_CMD		WAZACHR_ID_KAZE
	DEF_CMD		WAZACHR_ID_KOORI*/


@======================================================
@	技エフェクト開始時にBGMをフェードアウトする技のNo
@======================================================
WazaEffBGMFadeNo:
	.short		WAZANO_UTAU
	.short		WAZANO_HOROBINOUTA
	.short		WAZANO_KUSABUE
	.short		0xffff				//終端
//	.short		0xffff//4バイト境界調整　しないとﾎﾟｲﾝﾀ変数にちゃんと入らなかったりする
	

//----------------------------------------------------------
//	共通Define
//----------------------------------------------------------
#define WAIT_OFFSET		2		//WAITは実際は  WAIT  XXX+2 になってる
//-- BGPRI_GAPSET命令で使用 --//
#define BG_ATTACK			0	//Enemyが攻撃時にﾌﾟﾗｲｵﾘﾃｨを再設定
#define BG_DEFENCE			1	//Enemyが防御時にﾌﾟﾗｲｵﾘﾃｨを再設定
//-- ADD_ACTORのﾌﾟﾗｲｵﾘﾃｨ命令で使用 --//
#define A_UP				0			//攻撃ﾎﾟｹﾓﾝの上
#define A_DOWN				64			//攻撃ﾎﾟｹﾓﾝの下
#define D_UP				128			//防御ﾎﾟｹﾓﾝの上
#define D_DOWN				(128+64)	//防御ﾎﾟｹﾓﾝの下

@======================================================
@	技エフェクトの動作シーケンステーブル
@======================================================

WazaEffSeqTbl:
	.long	WEST_Hataku					@1オリジンなのでダミー
	.long	WEST_Hataku
	.long	WEST_KarateChop
	.long	WEST_OufukuBinta
	.long	WEST_RenzokuPanti
	.long	WEST_MegatonPanti
	.long	WEST_NekoNiKoban
	.long	WEST_HonoonoPanti
	.long	WEST_ReitouPanch
	.long	WEST_KaminariPunch
	.long	WEST_Hikkaku				@10

	.long	WEST_Hasamu
	.long	WEST_HasamiGirotin
	.long	WEST_Kamaitati
	.long	WEST_Turugi
	.long	WEST_Iaigiri
	.long	WEST_Kazeokosi
	.long	WEST_TubasadeUtu
	.long	WEST_Hukitobasi
	.long	WEST_SorawoTobu
	.long	WEST_Simetukeru				@20

	.long	WEST_Tataki
	.long	WEST_TurunoMuti
	.long	WEST_Fumituke
	.long	WEST_Nidogeri
	.long	WEST_MegatonKick
	.long	WEST_Tobigeri
	.long	WEST_MawasiGeri
	.long	WEST_SunaKake
	.long	WEST_Zutuki
	.long	WEST_TunodeTuku					@30

	.long	WEST_MidareDuki
	.long	WEST_TunoDrill
	.long	WEST_Taiatari
	.long	WEST_Nosikakari
	.long	WEST_Makituku
	.long	WEST_Tossin
	.long	WEST_Abareru
	.long	WEST_SutemiTakkuru
	.long	WEST_SippowoFuru
	.long	WEST_Dokubari				@40

	.long	WEST_DaburuNeedle
	.long	WEST_Misairu
	.long	WEST_Niramitukeru
	.long	WEST_Kamituku
	.long	WEST_Nakigoe
	.long	WEST_Hoeru
	.long	WEST_Utau
	.long	WEST_TyouOnpa
	.long	WEST_SonicBoom
	.long	WEST_Kanasibari				@50

	.long	WEST_Youkaieki
	.long	WEST_Hinoko
	.long	WEST_KaenHousya
	.long	WEST_SiroiKiri
	.long	WEST_MizuDeppou
	.long	WEST_HaidoroPonpu
	.long	WEST_Naminori
	.long	WEST_ReitouBeem
	.long	WEST_Fubuki
	.long	WEST_SaikeKousen			@60

	.long	WEST_BaburuKousen
	.long	WEST_OororaBeem
	.long	WEST_Hakaikousen
	.long	WEST_Tutuku
	.long	WEST_Dorirukuti
	.long	WEST_JigokuGuruma
	.long	WEST_Ketaguri
	.long	WEST_Counter
	.long	WEST_TikyuuNage
	.long	WEST_Kairiki				@70

	.long	WEST_Suitoru
	.long	WEST_Megadorein
	.long	WEST_Yadori
	.long	WEST_Seityou
	.long	WEST_HappaCutter
	.long	WEST_SolarBeem
	.long	WEST_DokuKona
	.long	WEST_SibireKona
	.long	WEST_NemuriKona
	.long	WEST_HanabiranoMai			@80

	.long	WEST_Itowohaku
	.long	WEST_RyuunoIkari
	.long	WEST_HonoonoUzu
	.long	WEST_DenkiShock
	.long	WEST_Jiyuman
	.long	WEST_Denjiha
	.long	WEST_Kaminari
	.long	WEST_IwaOtosi
	.long	WEST_Jisin
	.long	WEST_Ziware					@90

	.long	WEST_AnaWoHoru
	.long	WEST_Dokudoku
	.long	WEST_Nenriki
	.long	WEST_Phycokinesis
	.long	WEST_SaiminJyutu
	.long	WEST_YogaNoPose
	.long	WEST_KousokuIdou
	.long	WEST_DenkouSekka
	.long	WEST_Ikari
	.long	WEST_Teleport			@100

	.long	WEST_NightHead
	.long	WEST_Monomane
	.long	WEST_Iyanaoto
	.long	WEST_KageBunsin
	.long	WEST_Jikosaisei
	.long	WEST_KatakuNaru
	.long	WEST_TiisakuNaru
	.long	WEST_Enmaku
	.long	WEST_AyasiiHikari
	.long	WEST_KaraniKomoru			@110

	.long	WEST_Marukunaru
	.long	WEST_Barier
	.long	WEST_HikarinoKabe
	.long	WEST_KuroiKiri
	.long	WEST_Rifurector
	.long	WEST_Kiaidame
	.long	WEST_Gaman
	.long	WEST_YubiwoFuru
	.long	WEST_Hataku
	.long	WEST_Zibaku					@120

	.long	WEST_TamagoBakudan
	.long	WEST_SitadeNameru
	.long	WEST_Sumoggu
	.long	WEST_HedoroKougeki
	.long	WEST_HoneKonbou
	.long	WEST_Daimonji
	.long	WEST_Taki
	.long	WEST_Karadehasamu
	.long	WEST_SpeedStar
	.long	WEST_RocketZutuki		@130

	.long	WEST_TogeKyanon
	.long	WEST_Karamituku
	.long	WEST_Dowasure
	.long	WEST_SpoonMage				//※仮あて！
	.long	WEST_TamagoUmi
	.long	WEST_Tobihizageri
	.long	WEST_HebiNirami
	.long	WEST_Yumekui
	.long	WEST_Dokugasu
	.long	WEST_Tamanage				@140

	.long	WEST_Kyuuketu
	.long	WEST_AkumanoKiss
	.long	WEST_GodBird
	.long	WEST_Hensin
	.long	WEST_Awa
	.long	WEST_PiyopiyoPanchi
	.long	WEST_Kinokonohousi
	.long	WEST_Flash
	.long	WEST_SaikoWave
	.long	WEST_Haneru					@150

	.long	WEST_Tokeru
	.long	WEST_KurabuHanmer
	.long	WEST_Daibakuhatu
	.long	WEST_MidareHikkaki
	.long	WEST_HoneBoomeran
	.long	WEST_Nemuru
	.long	WEST_IwaNadare
	.long	WEST_HissatuMaeba
	.long	WEST_Kakubaru
	.long	WEST_Textyar				@160

	.long	WEST_TriAttack
	.long	WEST_IkariNoMaeba
	.long	WEST_Kirisaku
	.long	WEST_Migawari
	.long	WEST_Waruagaki
	.long	WEST_Suketi					@166
	.long	WEST_ToripuruKikku
	.long	WEST_Dorobou
	.long	WEST_Kumonosu
	.long	WEST_KokoronoMe				@170

	.long	WEST_Akumu
	.long	WEST_KaenGuruma
	.long	WEST_Ibiki
	.long	WEST_Noroi
	.long	WEST_Jitabata
	.long	WEST_Textyar2
	.long	WEST_EaroBurasuto
	.long	WEST_Watahousi
	.long	WEST_Kisikaisei
	.long	WEST_Urami					@180

	.long	WEST_Konayuki
	.long	WEST_Mamoru
	.long	WEST_MachPunch
	.long	WEST_KowaiKao
	.long	WEST_Damasiuti
	.long	WEST_TenshinoKiss
	.long	WEST_HaraDaiko
	.long	WEST_HedoroBakudan
	.long	WEST_DoroKake
	.long	WEST_Okutanhou				@190

	.long	WEST_Makibisi
	.long	WEST_Denjihou
	.long	WEST_Miyaburu
	.long	WEST_Mitizure
	.long	WEST_HorobinoUta
	.long	WEST_KogoeruKaze
	.long	WEST_Mikiri
	.long	WEST_BoonRush
	.long	WEST_RockOn
	.long	WEST_Gekirin					@200

	.long	WEST_SunaArasi
	.long	WEST_Gigadorein
	.long	WEST_Koraeru
	.long	WEST_Amaeru					@204
	.long	WEST_Korogaru
	.long	WEST_Mineuti
	.long	WEST_Ibaru
	.long	WEST_MilkNomi
	.long	WEST_Spark
	.long	WEST_RenzokuGiri			@210

	.long	WEST_HaganenoTubasa
	.long	WEST_KuroiManazasi
	.long	WEST_Meromero
	.long	WEST_Negoto
	.long	WEST_IyasinoSuzu
	.long	WEST_Ongaeshi
	.long	WEST_Present
	.long	WEST_Yatuatari
	.long	WEST_Sinpi
	.long	WEST_Itamiwake				@220

	.long	WEST_Seinaru
	.long	WEST_Magunityuudo
	.long	WEST_BakuretuPanti
	.long	WEST_MegaHoon
	.long	WEST_RyuunoIbuki
	.long	WEST_BatonTatti
	.long	WEST_Ankooru
	.long	WEST_Oiuti
	.long	WEST_Supin
	.long	WEST_Amaikaori					@230				//※仮あて！

	.long	WEST_AianTeeru
	.long	WEST_MetaruKuro
	.long	WEST_AtemiNage
	.long	WEST_AsanoHizasi
	.long	WEST_Kougousei
	.long	WEST_TukinoHikari
	.long	WEST_Mezameru
	.long	WEST_KurosuChop
	.long	WEST_Tatumaki
	.long	WEST_Amagoi					@240

	.long	WEST_Nihonbare
	.long	WEST_Kamikudaku
	.long	WEST_MirrorCote
	.long	WEST_Jikoanji
	.long	WEST_Sinsoku
	.long	WEST_GensinoTikara
	.long	WEST_ShadowBall
	.long	WEST_Miraiyoti
	.long	WEST_IwaKudaki
	.long	WEST_Uzusio					@250

	.long	WEST_Hukuro
	.long	WEST_NekoDamasi
	.long	WEST_Sawagu
	.long	WEST_Takuwaeru
	.long	WEST_Hakidasu
	.long	WEST_Nomikomu
	.long	WEST_Neppuu
	.long	WEST_Arale
	.long	WEST_Ichamon
	.long	WEST_Odateru		@260
	
	.long	WEST_Onibi
	.long	WEST_OkiMiyage
	.long	WEST_Karagenki
	.long	WEST_KiaiPunch
	.long	WEST_Kitsuke
	.long	WEST_KonoyubiTomare
	.long	WEST_GensinoTikara		//※仮あて！
	.long	WEST_Juden
	.long	WEST_Chohatu
	.long	WEST_Tedasuke	@270

	.long	WEST_Trick
	.long	WEST_Narikiri
	.long	WEST_Negaigoto
	.long	WEST_Nekonote
	.long	WEST_NewoHaru
	.long	WEST_BakaJikara
	.long	WEST_MagicCort
	.long	WEST_Recycle
	.long	WEST_Revenge
	.long	WEST_KawaraWari		@280

	.long	WEST_Akubi
	.long	WEST_HatakiOtosu
	.long	WEST_Gamusyara
	.long	WEST_Hunka
	.long	WEST_SkillSwap
	.long	WEST_Huuin
	.long	WEST_Reflesh
	.long	WEST_Onnen
	.long	WEST_Yokodori
	.long	WEST_HimitunoTikara				@290

	.long	WEST_Dive
	.long	WEST_Tuppari	
	.long	WEST_Hogosyoku
	.long	WEST_Hotarubi
	.long	WEST_LusterPurge
	.long	WEST_MistBall
	.long	WEST_FeatherDance
	.long	WEST_FurafuraDance
	.long	WEST_BureizuKick
	.long	WEST_DoroAsobi					@300

	.long	WEST_IceBall
	.long	WEST_NeedleArm
	.long	WEST_Namakeru
	.long	WEST_HyperVoice
	.long	WEST_DokuDokunoKiba
	.long	WEST_BreakCrow
	.long	WEST_BlastBurn
	.long	WEST_HydroCanon
	.long	WEST_CometPanchi
	.long	WEST_Odorokasu					@310

	.long	WEST_WeatherBall
	.long	WEST_AromaTherapy	//※仮あて！
	.long	WEST_UsoNaki
	.long	WEST_AirCutter
	.long	WEST_OverHeat
	.long	WEST_Kagiwakeru
	.long	WEST_GansekiHuuzi
	.long	WEST_SilverWind
	.long	WEST_Kinzokuon
	.long	WEST_Kusabue		@320

	.long	WEST_Kusuguru
	.long	WEST_CosmoPower		
	.long	WEST_SioFuki
	.long	WEST_SignalBeem
	.long	WEST_ShadowPunch
	.long	WEST_JintuRiki
	.long	WEST_SkyUpper
	.long	WEST_SunaJigoku
	.long	WEST_ZettaiReido
	.long	WEST_Dakuryuu					@330

	.long	WEST_TaneMasingan
	.long	WEST_TubameGaeshi
	.long	WEST_Turarabari
	.long	WEST_Teppeki
	.long	WEST_Tosenbou
	.long	WEST_Tooboe
	.long	WEST_DoragonKurou
	.long	WEST_HardPlant
	.long	WEST_BuildUp
	.long	WEST_Ukabu					@340

	.long	WEST_MaddoSyotto
	.long	WEST_PoisonTeeru
	.long	WEST_Hoshigaru
	.long	WEST_Voltecker
	.long	WEST_MagicalReef
	.long	WEST_MizuAsobi
	.long	WEST_Meisou
	.long	WEST_LeafBlade
	.long	WEST_RyunoMai
	.long	WEST_RockBlast				@350

	.long	WEST_Dengekiha
	.long	WEST_MizunoHadou
	.long	WEST_HametunoNegai
	.long	WEST_SaicoBoost

	.long	WEST_PartyAttack	//パーティアタック時の簡易ｴﾌｪｸﾄ

@======================================================
@	状態異常エフェクトの動作シーケンステーブル
@ a_status.hにｼｰｹﾝｽの並びのenumがあるのでそこと並びを一緒にしておくこと
@======================================================
StatusEffSeqTbl:
	.long	WEST_StDoku
	.long	WEST_StKonran
	.long	WEST_StYakedo
	.long	WEST_StMeromero
	.long	WEST_StNemuri
	.long	WEST_StMahi
	.long	WEST_StKoori
	.long	WEST_StNoroi
	.long	WEST_StAkumu


@======================================================
@	戦闘エフェクトの動作シーケンステーブル
@ client.hにｼｰｹﾝｽの並びのenumがあるのでそこと並びを一緒にしておくこと
@======================================================
FightEffSeqTbl:
	.long	WEST_FeHenge
	.long	WEST_FeStatus
	.long	WEST_FeMigawariKizetu
	.long	WEST_FePippiNingyou
	.long	WEST_FePoroc
	.long	WEST_FeFukuro
	.long	WEST_FeSimetuke
	.long	WEST_FeKaifuku
	.long	WEST_FeKemuridama
	.long	WEST_FeKiainoHatimaki
	.long	WEST_FeAmagoi
	.long	WEST_FeNihonbare
	.long	WEST_FeSunaArasi
	.long	WEST_FeArare
	.long	WEST_FeYadorigi
	.long	WEST_FeHitEffect
	.long	WEST_FeNusumu
	.long	WEST_FeYokodori
	.long	WEST_FeMiraiyoti
	.long	WEST_FeHametunoNegai
	.long	WEST_FeKiaiPunchTurn1
	.long	WEST_FeNewoharu
	.long	WEST_FeNegaigoto
	

@======================================================
@	戦闘のその他のエフェクトの動作シーケンステーブル
@ client.hにｼｰｹﾝｽの並びのenumがあるのでそこと並びを一緒にしておくこと
@======================================================
EtcEffSeqTbl:
	.long	WEST_FeLvUP
	.long	WEST_FePokeReturnMine
	.long	WEST_FePokeReturnEnemy
	.long	WEST_FePokeGetEffect
	.long	WEST_FePokeGetEffectSafari
	.long	WEST_FeMigawariOut
	.long	WEST_FeMigawariIn








@======================================================
@	はたく
@======================================================

WEST_Hataku:
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W003,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,2
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,6,1
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

@======================================================
@	おうふくビンタ
@======================================================

WEST_OufukuBinta:
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	TURN_CHK	WEST_OufukuBintaTurn0, WEST_OufukuBintaTurn1
WEST_OufukuBintaReturn:
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,6,1
	SEPLAY_PAN	SE_W003,WAZA_SE_R
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

WEST_OufukuBintaTurn0:	//偶数ﾀｰﾝ
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -8,0,1,2
	SEQ_JP		WEST_OufukuBintaReturn

WEST_OufukuBintaTurn1:	//奇数ﾀｰﾝ
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 8,0,1,2
	SEQ_JP		WEST_OufukuBintaReturn

@======================================================
@	どくのこな
@======================================================

WEST_DokuKona:
	CHAR_SET	WAZACHR_ID_DOKUKONA
	CHAR_SET	WAZACHR_ID_HEDORO
	SE_REPEAT	SE_W077,WAZA_SE_R,10,6
	ADD_ACTOR	ActDokuKonaChrHeader,D_UP+2,6,-30,-22,0x75,0x50,5,1
	ADD_ACTOR	ActDokuKonaChrHeader,D_UP+2,6,10,-22,0x75,0x50,-5,1
	ADD_ACTOR	ActDokuKonaChrHeader,D_UP+2,6,-25,-22,0x75,0x70,5,3
	WAIT		15
	ADD_ACTOR	ActDokuKonaChrHeader,D_UP+2,6,-5,-22,0x75,0x50,-5,1
	ADD_ACTOR	ActDokuKonaChrHeader,D_UP+2,6,5,-22,0x75,0x60,5,1
	ADD_ACTOR	ActDokuKonaChrHeader,D_UP+2,6,0,-22,0x75,0x45,-5,1
	ADD_ACTOR	ActDokuKonaChrHeader,D_UP+2,6,-15,-22,0x75,0x70,5,2
	WAIT		30
	ADD_ACTOR	ActDokuKonaChrHeader,D_UP+2,6,-15,-22,0x75,0x70,5,2
	ADD_ACTOR	ActDokuKonaChrHeader,D_UP+2,6,15,-22,0x75,0x50,-5,1
	ADD_ACTOR	ActDokuKonaChrHeader,D_UP+2,6,-10,-22,0x75,0x60,7,2
	ADD_ACTOR	ActDokuKonaChrHeader,D_UP+2,6,-5,-22,0x75,0x5a,-8,0
	WAIT		20
	ADD_ACTOR	ActDokuKonaChrHeader,D_UP+2,6,-10,-22,0x75,0x50,-5,1
	ADD_ACTOR	ActDokuKonaChrHeader,D_UP+2,6,0,-22,0x75,0x59,5,2
	ADD_ACTOR	ActDokuKonaChrHeader,D_UP+2,6,20,-22,0x75,0x70,-8,2
	ADD_ACTOR	ActDokuKonaChrHeader,D_UP+2,6,5,-22,0x75,0x50,5,1
	WAIT_FLAG
//	WAIT		15
//	SEQ_CALL	WEST_DokuKouka
//	WAIT_FLAG
	SEQEND

@======================================================
@	しびれごな
@======================================================

WEST_SibireKona:
	CHAR_SET	WAZACHR_ID_SIBIREKONA
	SE_REPEAT	SE_W077,WAZA_SE_R,10,6
	ADD_ACTOR	ActSibireKonaChrHeader,D_UP+2,6,-30,-22,0x75,0x50,5,1
	ADD_ACTOR	ActSibireKonaChrHeader,D_UP+2,6,10,-22,0x75,0x50,-5,1
	ADD_ACTOR	ActSibireKonaChrHeader,D_UP+2,6,-25,-22,0x75,0x70,5,3
	WAIT		15
	ADD_ACTOR	ActSibireKonaChrHeader,D_UP+2,6,-5,-22,0x75,0x50,-5,1
	ADD_ACTOR	ActSibireKonaChrHeader,D_UP+2,6,5,-22,0x75,0x60,5,1
	ADD_ACTOR	ActSibireKonaChrHeader,D_UP+2,6,0,-22,0x75,0x45,-5,1
	ADD_ACTOR	ActSibireKonaChrHeader,D_UP+2,6,-15,-22,0x75,0x70,5,2
	WAIT		30
	ADD_ACTOR	ActSibireKonaChrHeader,D_UP+2,6,-15,-22,0x75,0x70,5,2
	ADD_ACTOR	ActSibireKonaChrHeader,D_UP+2,6,15,-22,0x75,0x50,-5,1
	ADD_ACTOR	ActSibireKonaChrHeader,D_UP+2,6,-10,-22,0x75,0x60,7,2
	ADD_ACTOR	ActSibireKonaChrHeader,D_UP+2,6,-5,-22,0x75,0x5a,-8,0
	WAIT		20
	ADD_ACTOR	ActSibireKonaChrHeader,D_UP+2,6,-10,-22,0x75,0x50,-5,1
	ADD_ACTOR	ActSibireKonaChrHeader,D_UP+2,6,0,-22,0x75,0x59,5,2
	ADD_ACTOR	ActSibireKonaChrHeader,D_UP+2,6,20,-22,0x75,0x70,-8,2
	ADD_ACTOR	ActSibireKonaChrHeader,D_UP+2,6,5,-22,0x75,0x50,5,1
	WAIT_FLAG
	SEQEND

@======================================================
@	ねむりごな
@======================================================

WEST_NemuriKona:
	CHAR_SET	WAZACHR_ID_NEMURIKONA
	SE_REPEAT	SE_W077,WAZA_SE_R,10,6
	ADD_ACTOR	ActNemuriKonaChrHeader,D_UP+2,6,-30,-22,0x75,0x50,5,1
	ADD_ACTOR	ActNemuriKonaChrHeader,D_UP+2,6,10,-22,0x75,0x50,-5,1
	ADD_ACTOR	ActNemuriKonaChrHeader,D_UP+2,6,-25,-22,0x75,0x70,5,3
	WAIT		15
	ADD_ACTOR	ActNemuriKonaChrHeader,D_UP+2,6,-5,-22,0x75,0x50,-5,1
	ADD_ACTOR	ActNemuriKonaChrHeader,D_UP+2,6,5,-22,0x75,0x60,5,1
	ADD_ACTOR	ActNemuriKonaChrHeader,D_UP+2,6,0,-22,0x75,0x45,-5,1
	ADD_ACTOR	ActNemuriKonaChrHeader,D_UP+2,6,-15,-22,0x75,0x70,5,2
	WAIT		30
	ADD_ACTOR	ActNemuriKonaChrHeader,D_UP+2,6,-15,-22,0x75,0x70,5,2
	ADD_ACTOR	ActNemuriKonaChrHeader,D_UP+2,6,15,-22,0x75,0x50,-5,1
	ADD_ACTOR	ActNemuriKonaChrHeader,D_UP+2,6,-10,-22,0x75,0x60,7,2
	ADD_ACTOR	ActNemuriKonaChrHeader,D_UP+2,6,-5,-22,0x75,0x5a,-8,0
	WAIT		20
	ADD_ACTOR	ActNemuriKonaChrHeader,D_UP+2,6,-10,-22,0x75,0x50,-5,1
	ADD_ACTOR	ActNemuriKonaChrHeader,D_UP+2,6,0,-22,0x75,0x59,5,2
	ADD_ACTOR	ActNemuriKonaChrHeader,D_UP+2,6,20,-22,0x75,0x70,-8,2
	ADD_ACTOR	ActNemuriKonaChrHeader,D_UP+2,6,5,-22,0x75,0x50,5,1
	WAIT_FLAG
	SEQEND

@======================================================
@	スピードスター
@======================================================
#define SPEEDSTAR_SYNC	22
#define SPEEDSTAR_WAIT	5
WEST_SpeedStar:
	CHAR_SET	WAZACHR_ID_SPEEDSTAR
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
//	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W129,WAZA_SE_L
	ADD_ACTOR	SpeedStarHeader,D_UP+3,7, 20,-10, 20,0, SPEEDSTAR_SYNC, 20,1
	WAIT		SPEEDSTAR_WAIT
	SEPLAY_PAN	SE_W129,WAZA_SE_L
	ADD_ACTOR	SpeedStarHeader,D_UP+3,7, 20,-10, 20,5, SPEEDSTAR_SYNC, -18,1
	WAIT		SPEEDSTAR_WAIT
	SEPLAY_PAN	SE_W129,WAZA_SE_L
	ADD_ACTOR	SpeedStarHeader,D_UP+3,7, 20,-10, 20,-10, SPEEDSTAR_SYNC, 15,1
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,18,1
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 3,2,0,18,1
	WAIT		SPEEDSTAR_WAIT
	SEPLAY_PAN	SE_W129,WAZA_SE_L
	ADD_ACTOR	SpeedStarHeader,D_UP+3,7, 20,-10, 20,0, SPEEDSTAR_SYNC, -20,1
	WAIT		SPEEDSTAR_WAIT
	SEPLAY_PAN	SE_W129,WAZA_SE_L
	ADD_ACTOR	SpeedStarHeader,D_UP+3,7, 20,-10, 20,0, SPEEDSTAR_SYNC, 12,1
	WAIT		SPEEDSTAR_WAIT
//	SEPLAY_PAN	SE_W013,WAZA_SE_R
//	WAIT		SPEEDSTAR_SYNC - 2
//	ADD_ACTOR	ActHitMarkHeader,D_UP+4,4, -10,0,1,2
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	ちきゅうなげ
@======================================================
@
@WEST_TikyuuNage:
@	SE			SE_BAN
@	CHAR_SET	WAZACHR_ID_TIKYUU
@	CHAR_SET	WAZACHR_ID_HITMARK
@	POKEBG		1
@	BLDALPHA_SET	0xc,0x8
@	ADD_ACTOR	ActTikyuuHeader,D_UP+2,2,15,32
@	ADD_ACTOR	ActQuakeHeader,A_UP+2,4,5,1,10,1
@	ADD_ACTOR	ActQuakeHeader,A_UP+2,5,5,1,10,3,2
@	WAIT_FLAG
@//	ADD_ACTOR	ActTstHitRHeader,A_UP+3,2,0,5
@	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 0,5,1,2
@	WAIT_FLAG
@	POKEBG_RESET	1
@	BLDALPHA_RESET
@	SEQEND

@======================================================
@	かいりき
@======================================================

WEST_Kairiki:
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W036,WAZA_SE_L
	ADD_TASK	TaskPokeBuruDown,PRI5,5, 0,2,0,0x0060,30
	WAIT_FLAG
	WAIT		10
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,4
	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5, 1,18,6, 2,4
	WAIT		4
	SEPLAY_PAN	SE_W025B,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 16,12,1,1
	WAIT		4
	SEPLAY_PAN	SE_W025B,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, -16,-12,1,1
	WAIT		4
	SEPLAY_PAN	SE_W025B,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 3,4,1,1
	WAIT_FLAG
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,8,1
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	たいあたり
@======================================================

WEST_Taiatari:
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,4,4
	WAIT		6		@体当たりのﾙｰﾌﾟ回数と同じにしておくこと
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,2
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,6,1
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

@======================================================
@	のしかかり
@======================================================

WEST_Nosikakari:
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W036,WAZA_SE_L
	ADD_ACTOR	ActHaneruHeader,A_UP+2,3,6,1,0
	WAIT_FLAG
	WAIT		11
//	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,5,4
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0, 26,0, 0,5
	WAIT		6		@体当たりのﾙｰﾌﾟ回数と同じにしておくこと
	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4, -10,0,1,0
	SE_REPEAT	SE_W025B,WAZA_SE_R,10,2
	WAIT		1
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 1,-28,0,0,3
	WAIT_FLAG
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 1,4,0,12,1
	WAIT_FLAG
	WAIT		10
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,6
	WAIT		5
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 1,0,6
//	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,0,4,6,1
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	おんがえし
@======================================================
@
@WEST_Ongaesi:
@	SE			SE_BAN
@	CHAR_SET	WAZACHR_ID_HITMARK
@	POKEBG		1
@	BLDALPHA_SET	0xc,0x8
@	ADD_ACTOR	ActHaneruHeader,A_UP+2,3,6,1,0
@	WAIT_FLAG
@	ADD_ACTOR	ActHaneruHeader,A_UP+2,3,6,1,0
@	WAIT_FLAG
@	WAIT		11
@	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,5,4
@	WAIT		6		@体当たりのﾙｰﾌﾟ回数と同じにしておくこと
@//	ADD_ACTOR	ActTstHitRHeader,A_UP+2,2,0,0
@	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,2
@	WAIT_FLAG
@	POKEBG_RESET	1
@	BLDALPHA_RESET
@	SEQEND

@======================================================
@	ちょうおんぱ
@======================================================
#define TYOUONPA_SYNC	30
#define TYOUONPA_WAIT	2
WEST_TyouOnpa:
	CHAR_SET	WAZACHR_ID_ONPA
	POKEBG		2
	BGPRI_GAPSET3	BG_ATTACK
	BLDALPHA_SET	0xc,0x8
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,2,0,8,1
	SEQ_CALL	WEST_TyouOnpaSub
	SEQ_CALL	WEST_TyouOnpaSub
	SEQ_CALL	WEST_TyouOnpaSub
	SEQ_CALL	WEST_TyouOnpaSub
	SEQ_CALL	WEST_TyouOnpaSub
	SEQ_CALL	WEST_TyouOnpaSub
	WAIT_FLAG
	POKEBG_RESET	2
	BLDALPHA_RESET
	SEQEND

WEST_TyouOnpaSub:
	SEPLAY_PAN	SE_W048,WAZA_SE_L
	ADD_ACTOR	ActTyouOnpaHeader,D_UP+2,6, 16,0,0,0, TYOUONPA_SYNC,0x0000
	WAIT		TYOUONPA_WAIT
	END_CALL
	
@======================================================
@	いやなおと
@======================================================
#define IYANAOTO_SYNC	30
#define IYANAOTO_WAIT	2
WEST_Iyanaoto:
	CHAR_SET	WAZACHR_ID_ONPA_DB
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,3,0,2,1
	SEQ_CALL	WEST_IyanaotoSub
	SEQ_CALL	WEST_IyanaotoSub
	WAIT		16
	ADD_TASK	PokeSinMove,PRI5,5, 0,6,0x0800,2,1
	WAIT_FLAG
	SEQEND

WEST_IyanaotoSub:
	SEPLAY_PAN	SE_W103,WAZA_SE_L
	ADD_ACTOR	IyanaotoHeader,D_UP+2,6, 16,0,0,0, IYANAOTO_SYNC,0x0000
	WAIT		IYANAOTO_WAIT
	END_CALL

@======================================================
@	かえんぐるま
@======================================================
#define KAENGURUMA_WAIT		4
WEST_KaenGuruma:
	CHAR_SET	WAZACHR_ID_FIRE
	POKEBG		3
	BGPRI_GAPSET3	BG_DEFENCE
	ADD_ACTOR	ActKaenGurumaHeader,A_UP+3,4, 0,0,56,KAENGURUMA_WAIT*0
	SEPLAY_PAN	SE_W172,WAZA_SE_L
	WAIT		2
	ADD_ACTOR	ActKaenGurumaHeader,A_UP+3,4, 0,0,56,KAENGURUMA_WAIT*1
	SEPLAY_PAN	SE_W172,WAZA_SE_L
	WAIT		2
	ADD_ACTOR	ActKaenGurumaHeader,A_UP+3,4, 0,0,56,KAENGURUMA_WAIT*2
	SEPLAY_PAN	SE_W172,WAZA_SE_L
	WAIT		2
	ADD_ACTOR	ActKaenGurumaHeader,A_UP+3,4, 0,0,56,KAENGURUMA_WAIT*3
	SEPLAY_PAN	SE_W172,WAZA_SE_L
	WAIT		2
	ADD_ACTOR	ActKaenGurumaHeader,A_UP+3,4, 0,0,56,KAENGURUMA_WAIT*4
	SEPLAY_PAN	SE_W172,WAZA_SE_L
	WAIT		2
	ADD_ACTOR	ActKaenGurumaHeader,A_UP+3,4, 0,0,56,KAENGURUMA_WAIT*5
	SEPLAY_PAN	SE_W172,WAZA_SE_L
	WAIT		2
	ADD_ACTOR	ActKaenGurumaHeader,A_UP+3,4, 0,0,56,KAENGURUMA_WAIT*6
	SEPLAY_PAN	SE_W172,WAZA_SE_L
	WAIT_FLAG
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,24,0,0,6
	WAIT		4
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,5,0,8,1	
	ADD_TASK	TaskPokeFadeCtrl,PRI3,5, 1,0x1f,12,1,1,
	SEPLAY_PAN	SE_W172B,WAZA_SE_R
	SEQ_CALL	WEST_HonoonoPantiSub	//ほのおのパンチで使用してるﾙｰﾁﾝ
	WAIT		7
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,9
	WAIT_FLAG
	POKEBG_RESET	3
	SEQEND

WEST_KaenGurumaSub:
	ADD_ACTOR	ActKaenGurumaHeader,A_UP+3,3, 0,0,50
	WAIT		KAENGURUMA_WAIT
	END_CALL

@======================================================
@	ミサイルばり
@======================================================
#define MISAIRUBARI_SYNC	20
WEST_Misairu:
	CHAR_SET	WAZACHR_ID_HARI2
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W026,WAZA_SE_L
	ADD_ACTOR	MisairuBariHeader,A_UP+2,6, 20,-8, -8,-8, MISAIRUBARI_SYNC,-32
	WAIT		15
	ADD_ACTOR	MisairuBariHeader,A_UP+2,6, 20,-8, 8,8, MISAIRUBARI_SYNC,-40
	WAIT		5-1
	SEPLAY_PAN	SE_W030,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, -8,-8,1,2
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,2,1
	WAIT		10-1
	ADD_ACTOR	MisairuBariHeader,A_UP+2,6, 20,-8, 0,0, MISAIRUBARI_SYNC,-32
	WAIT		5-1
	SEPLAY_PAN	SE_W030,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 8,8,1,2
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,2,1
	WAIT		15-1
	SEPLAY_PAN	SE_W030,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,2
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,2,1
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

@======================================================
@	つららばり
@======================================================
#define TURARABARI_SYNC	20
WEST_Turarabari:
	CHAR_SET	WAZACHR_ID_TURAHARI
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W196,WAZA_SE_L
	ADD_ACTOR	TuraraBariHeader,A_UP+2,6, 20,-8, -8,-8, TURARABARI_SYNC,-32
	WAIT		15
	ADD_ACTOR	TuraraBariHeader,A_UP+2,6, 20,-8, 8,8, TURARABARI_SYNC,-40
	WAIT		5-1
	SEPLAY_PAN	SE_W030,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, -8,-8,1,2
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,2,1
	WAIT		10-1
	ADD_ACTOR	TuraraBariHeader,A_UP+2,6, 20,-8, 0,0, TURARABARI_SYNC,-32
	WAIT		5-1
	SEPLAY_PAN	SE_W030,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 8,8,1,2
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,2,1
	WAIT		15-1
	SEPLAY_PAN	SE_W030,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,2
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,2,1
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

@======================================================
@	とっしん
@======================================================

WEST_Tossin:
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
/*	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5, 0,18,6, 1,4
	WAIT_FLAG
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,20,0,0,4
*/
	SEPLAY_PAN	SE_W036,WAZA_SE_L
	ADD_TASK	PokeSinBackInit,PRI5,7, 0,-24,8,23, 10, 40,10
	WAIT		35
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 31,3,1,0x0000,10,0,0
	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4, -10,0,1,0
	SEPLAY_PAN	SE_W025B,WAZA_SE_R
	WAIT		1
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 1,-16,0,0,4
	WAIT_FLAG
//	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,5,0,6,1
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 1,4,0,12,1
	WAIT_FLAG
	WAIT		2
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,5
	WAIT		3
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 1,0,7
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND


@======================================================
@	すてみタックル
@======================================================

WEST_SutemiTakkuru:
	CHAR_SET	WAZACHR_ID_HITMARK
//	POKEBG		3
//	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W129,WAZA_SE_L
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 2,4,2,0x7fff,10,0,0
	WAIT_FLAG
	WAIT		10
	SEPLAY_PAN	SE_W207,WAZA_SE_L
	SE_WAITPLAY	SE_W207,WAZA_SE_L,8
	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5, 0,18,6, 2,4
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,PRI2,5, 1,0,16,16,0x7fff
//	WAIT		10
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,20,0,0,4
	WAIT		3
	WAIT_FLAG
//	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 31,3,1,0x0000,10,0,0
	SEPLAY_PAN	SE_W025B,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,D_UP+4,4, -10,0,1,0
//	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,8,0,7,1
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 1,-32,0,0,3
	WAIT_FLAG
	ADD_TASK	WazaPokeRollTask,PRI2,4, 8,-256,0,0
	ADD_TASK	WazaPokeRollTask,PRI2,4, 8,-256,1,0
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 0,4,0,12,1
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 1,4,0,12,1
	ADD_ACTOR	ActFadeHeader,PRI2,5, 1,2,16,0,0x7fff
	WAIT_FLAG
	ADD_TASK	WazaPokeRollTask,PRI2,4, 8,-256,0,1
	ADD_TASK	WazaPokeRollTask,PRI2,4, 8,-256,1,1
	WAIT_FLAG
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,5
	WAIT		3
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 1,0,7
	WAIT_FLAG
//	POKEBG_RESET	3
//	BLDALPHA_RESET
	SEQEND

@======================================================
@	どくばり
@======================================================

WEST_Dokubari:
	CHAR_SET	WAZACHR_ID_HARI2
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_HEDORO
	POKEBG		1
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W013B,WAZA_SE_L
	ADD_ACTOR	DaburuNeedleHeader,D_UP+2,5, 20,0, -8,0, 20
	WAIT_FLAG
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,2
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,5,1
	SEPLAY_PAN	SE_W030,WAZA_SE_R
	WAIT_FLAG
	SEQ_CALL	WEST_DokuKouka
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

@======================================================
@	ダブルニードル
@======================================================
#define DABURU_NEEDLE_SYNC	20
WEST_DaburuNeedle:
	CHAR_SET	WAZACHR_ID_HARI2
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	SE_REPEAT	SE_W013B,WAZA_SE_L,6,2
	ADD_ACTOR	DaburuNeedleHeader,D_UP+2,5, 10,-4, 0,-4, DABURU_NEEDLE_SYNC
	ADD_ACTOR	DaburuNeedleHeader,D_UP+2,5, 20,12, 10,12, DABURU_NEEDLE_SYNC
	WAIT		DABURU_NEEDLE_SYNC
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,5,1
	ADD_ACTOR	ActHitMarkYflipHeader,A_UP+3,4, 0,-4,1,3
	SE_REPEAT	SE_W030,WAZA_SE_R,5,2
	WAIT		1
	ADD_ACTOR	ActHitMarkYflipHeader,A_UP+3,4, 10,12,1,3
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

@======================================================
@	だいもんじ
@======================================================
#define DAIMONJI_WAIT	5
WEST_Daimonji:
	CHAR_SET	WAZACHR_ID_FIRE
	SE_TASK		DaimonjiSEPlay,2, SE_W172,SE_W172B
	SEQ_CALL	WEST_DaimonjiSub
	SEQ_CALL	WEST_DaimonjiSub
	SEQ_CALL	WEST_DaimonjiSub
	WAIT		24
	ADD_TASK	ColorFadeSeq,PRI10,5, 1,3,0,8,0x0000
	WAIT_FLAG
	WAIT		19
	@「大」
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,5,0,20,1
	SEQ_CALL	WEST_DaimonjiSub2
	WAIT		3
	SEQ_CALl	WEST_DaimonjiSub2
	WAIT		3
	SEQ_CALl	WEST_DaimonjiSub2
	WAIT		3
	SEQ_CALl	WEST_DaimonjiSub2
	WAIT		3
	SEQ_CALl	WEST_DaimonjiSub2
	WAIT		3
	SEQ_CALl	WEST_DaimonjiSub2
	WAIT		3
	SEQ_CALl	WEST_DaimonjiSub2
	WAIT		3
	SEQ_CALl	WEST_DaimonjiSub2
	WAIT		3
	SEQ_CALl	WEST_DaimonjiSub2
	WAIT_FLAG
	ADD_TASK	ColorFadeSeq,PRI10,5, 1,2,8,0,0x0000
	WAIT_FLAG
	SEQEND

WEST_DaimonjiSub:
	ADD_ACTOR	ActDaimonjiHeader,D_UP+2,3, 0,0,0
	ADD_ACTOR	ActDaimonjiHeader,D_UP+2,3, 0,0,51
	ADD_ACTOR	ActDaimonjiHeader,D_UP+2,3, 0,0,102
	ADD_ACTOR	ActDaimonjiHeader,D_UP+2,3, 0,0,153
	ADD_ACTOR	ActDaimonjiHeader,D_UP+2,3, 0,0,204
	WAIT		DAIMONJI_WAIT
	END_CALL

//-- 「大」の字 --//
WEST_DaimonjiSub2:
	ADD_ACTOR	ActDaimon2Header,D_UP+2,5,0,0,10,0,-2	@上
	ADD_ACTOR	ActDaimon2Header,D_UP+2,5,0,0,13,-2,0	@左
	ADD_ACTOR	ActDaimon2Header,D_UP+2,5,0,0,13,2,0	@右
	ADD_ACTOR	ActDaimon2Header,D_UP+2,5,0,0,15,-2,2	@左下
	ADD_ACTOR	ActDaimon2Header,D_UP+2,5,0,0,15,2,2	@右下
	END_CALL
	
@======================================================
@	やどりぎのタネ
@======================================================
#define YADORIGI_WAIT	8
#define YADORIGI_SYNC	35
WEST_Yadori:
	CHAR_SET	WAZACHR_ID_YADORIGI
	SEPLAY_PAN	SE_W077,WAZA_SE_L
	ADD_ACTOR	ActYadoriHeader,D_UP+2,6, 15,0, 0,24, YADORIGI_SYNC,-32
	WAIT		YADORIGI_WAIT
	SEPLAY_PAN	SE_W077,WAZA_SE_L
	ADD_ACTOR	ActYadoriHeader,D_UP+2,6, 15,0, -16,24, YADORIGI_SYNC,-40
	WAIT		YADORIGI_WAIT
	SEPLAY_PAN	SE_W077,WAZA_SE_L
	ADD_ACTOR	ActYadoriHeader,D_UP+2,6, 15,0, 16,24, YADORIGI_SYNC,-37
	WAIT		12
	SE_REPEAT	SE_W039,WAZA_SE_R,10,8
	WAIT_FLAG
	SEQEND

@======================================================
@	ひのこ
@======================================================
#define HINOKO_SYNC		20
#define HINOKO_SUBSYNC	20
WEST_Hinoko:
	CHAR_SET	WAZACHR_ID_FIRE
	SE_REPEAT	SE_W052,WAZA_SE_L,5,2
	ADD_ACTOR	ActHinokoHeader,D_UP+2,6, 20,0, -16,24, HINOKO_SYNC, 0x0001
	WAIT		4
	ADD_ACTOR	ActHinokoHeader,D_UP+2,6, 20,0, 0,24, HINOKO_SYNC, 0x0001
	WAIT		4
	ADD_ACTOR	ActHinokoHeader,D_UP+2,6, 20,0, 16,24, HINOKO_SYNC, 0x0001
	WAIT		HINOKO_SYNC	- 4
	SEPLAY_PAN	SE_W172,WAZA_SE_R
	SEQ_CALL	WEST_HinokoSub
	SEQ_CALL	WEST_HinokoSub
	SEQ_CALL	WEST_HinokoSub
	SEQEND

WEST_HinokoSub:
	ADD_ACTOR	ActHinokoSubHeader,D_UP+2,7, -24,24, 24,24, HINOKO_SUBSYNC, 1,1
	WAIT		4
	END_CALL

@======================================================
@	メガトンパンチ
@======================================================
#define MEGATONPANTI_SYNC	50//30
WEST_MegatonPanti:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_KAKUTOU
	POKEBG		1
	
	WAIT		2
//	SEQ_CALL	WEST_MegatonHaikeiChg
//	HAIKEI_CHG_WAIT
	ADD_ACTOR	ActFadeHeader,PRI2,5, 1,0,0,16,0x0
	
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W025,WAZA_SE_R
	ADD_ACTOR	MegatonPantiHeader2,A_UP+3,4, 0,0, 0,MEGATONPANTI_SYNC
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,2,0,7,0x7fff
	WAIT		MEGATONPANTI_SYNC
	SEQ_CALL	WEST_MegatonHaikeiChg
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,0
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,4,0,22,1
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,2,0,0,0x7fff
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 0x1f,3,1,0x0000,8,0,0
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET

	WAIT			2
	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
	
	SEQEND

WEST_MegatonHaikeiChg:		//メガトンキックでも使用
	WAIT		2
	ADD_TASK	ContestChkTask,PRI2,0
	WORKCHK_JP	7,1,WEST_MegatonContest
	ADD_TASK	TaskAttackOrDefense,PRI2,0
	WORKCHK_JP	7,0,WEST_MegatonEnemy	@攻撃か防御によってひっさつのBGを変える	相手
	WORKCHK_JP	7,1,WEST_MegatonMine	@										自分
WEST_MegatonHaikeiReturn:
	END_CALL

@==========（相手側）=================
WEST_MegatonEnemy:
//	HAIKEI_CHG	WAZAMAP_ID_HISSATU
	HAIKEI_SET	WAZAMAP_ID_HISSATU
	SEQ_JP		WEST_MegatonHaikeiReturn
	
@==========（自分側）=================
WEST_MegatonMine:
//	HAIKEI_CHG	WAZAMAP_ID_HISSATU2
	HAIKEI_SET	WAZAMAP_ID_HISSATU2
	SEQ_JP		WEST_MegatonHaikeiReturn

@==========コンテスト================
WEST_MegatonContest:
	HAIKEI_SET	WAZAMAP_ID_HISSATU3
	SEQ_JP		WEST_MegatonHaikeiReturn

@======================================================
@	メガトンキック
@======================================================
#define MEGATONKICK_SYNC	50//30
WEST_MegatonKick:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_KAKUTOU
	POKEBG		1

	WAIT		2
//	SEQ_CALL	WEST_MegatonHaikeiChg
//	HAIKEI_CHG_WAIT
	ADD_ACTOR	ActFadeHeader,PRI2,5, 1,0,0,16,0x0

	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W025,WAZA_SE_R
	ADD_ACTOR	MegatonPantiHeader2,A_UP+3,4, 0,0, 1,MEGATONKICK_SYNC
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,2,0,7,0x7fff
	WAIT		MEGATONKICK_SYNC
	SEPLAY_PAN	SE_W025B,WAZA_SE_R
	SEQ_CALL	WEST_MegatonHaikeiChg
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,0
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,4,0,22,1
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,2,0,0,0x7fff
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 0x1f,3,1,0x0000,8,0,0
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET

	WAIT			2
	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT

	SEQEND

@======================================================
@	れんぞくパンチ
@======================================================

WEST_RenzokuPanti:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_KAKUTOU
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	TURN_CHK	WEST_RenzokuPantiTurn0, WEST_RenzokuPantiTurn1
WEST_RenzokuPantiReturn:
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,6,1
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

WEST_RenzokuPantiTurn0:	//偶数ﾀｰﾝ
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -8,-8,1,2
	ADD_ACTOR	ActKakutouWaitHeader,A_UP+3,5, -8,0, 8, 1,0
	SEQ_JP		WEST_RenzokuPantiReturn

WEST_RenzokuPantiTurn1:	//奇数ﾀｰﾝ
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 8,-8,1,2
	ADD_ACTOR	ActKakutouWaitHeader,A_UP+3,5, 8,0, 8, 1,0
	SEQ_JP		WEST_RenzokuPantiReturn

@======================================================
@	ソニックブーム
@======================================================
#define SONICBOOM_SYNC		15
#define SONICBOOM_WAIT		4
WEST_SonicBoom:
	CHAR_SET	WAZACHR_ID_SONIC
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	SEQ_CALL	WEST_SonicBoomSub
	SEQ_CALL	WEST_SonicBoomSub
	SEQ_CALL	WEST_SonicBoomSub
//	WAIT		2
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,10,1
	SEQ_CALL	WEST_SonicBoomSub2
//	SEQ_CALL	WEST_SonicBoomSub2
//	SEQ_CALL	WEST_SonicBoomSub2
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

WEST_SonicBoomSub:
	SEPLAY_PAN	SE_W013B,WAZA_SE_L
//	ADD_ACTOR	ActSonicBoomHeader,D_UP+2,3, 16,0,SONICBOOM_SYNC
	ADD_ACTOR	ActSonicBoomHeader,D_UP+2,5, 16,0,0,0,SONICBOOM_SYNC
	WAIT		SONICBOOM_WAIT
	END_CALL

WEST_SonicBoomSub2:
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 0,0,1,2
	WAIT		SONICBOOM_WAIT
	END_CALL

@======================================================
@	でんきショック
@======================================================

WEST_DenkiShock:
	CHAR_SET	WAZACHR_ID_KAMINARI
	CHAR_SET	WAZACHR_ID_MAHI
	ADD_TASK	ColorFadeSeq,PRI10,5, 1,0,0,6,0
	WAIT_FLAG
	WAIT		10
	ADD_TASK	KaminariTask,PRI5,3, 0,-44,0
	SEPLAY_PAN	SE_W085,WAZA_SE_R
	WAIT		9
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,0,0,13,0
	WAIT_FLAG
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,0,13,0,0
	WAIT_FLAG
	WAIT		20
	SEQ_CALL	WEST_MahiKouka
	WAIT_FLAG
	WAIT		20
	ADD_TASK	ColorFadeSeq,PRI10,5, 1,0,6,0,0
	WAIT_FLAG
	SEQEND

@======================================================
@	じゅうまんボルト
@======================================================
#define JUMAN_SYNC		44
#define JUMAN_SEC		40
#define JUMAN_WIDTH	32
WEST_Jiyuman:
	CHAR_SET	WAZACHR_ID_KAMINARI
	CHAR_SET	WAZACHR_ID_ELBALL
	CHAR_SET	WAZACHR_ID_MAHI
	ADD_TASK	ColorFadeSeq,PRI10,5, 1,0,0,6,0
	WAIT_FLAG
	WAIT		10
	ADD_TASK	KaminariTask,PRI5,3, 24,-52,0
	SEPLAY_PAN	SE_W085,WAZA_SE_R
	WAIT		7
	ADD_TASK	KaminariTask,PRI5,3, -24,-52,0
	SEPLAY_PAN	SE_W085,WAZA_SE_R
	WAIT		7
	ADD_TASK	KaminariTask,PRI5,3, 0,-60,1
	SEPLAY_PAN	SE_W085,WAZA_SE_R
	WAIT		9
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,0,0,13,0
	WAIT_FLAG
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,0,13,0,0
	WAIT_FLAG
	WAIT		20
	ADD_ACTOR	ActJumanHeader,D_UP+3,4,	JUMAN_SYNC,0,0,3
	ADD_ACTOR	ActJumanSubHeader,D_UP+4,8,0,0,JUMAN_WIDTH,JUMAN_SYNC,0,JUMAN_SEC,0,0x8003
	ADD_ACTOR	ActJumanSubHeader,D_UP+4,8,0,0,JUMAN_WIDTH,JUMAN_SYNC,64,JUMAN_SEC,1,0x8003
	ADD_ACTOR	ActJumanSubHeader,D_UP+4,8,0,0,JUMAN_WIDTH,JUMAN_SYNC,128,JUMAN_SEC,0,0x8003
	ADD_ACTOR	ActJumanSubHeader,D_UP+4,8,0,0,JUMAN_WIDTH,JUMAN_SYNC,192,JUMAN_SEC,2,0x8003

	ADD_ACTOR	ActJumanSubHeader,D_UP+4,8,0,0,16,JUMAN_SYNC,32,JUMAN_SEC,0,0x8003
	ADD_ACTOR	ActJumanSubHeader,D_UP+4,8,0,0,16,JUMAN_SYNC,96,JUMAN_SEC,1,0x8003
	ADD_ACTOR	ActJumanSubHeader,D_UP+4,8,0,0,16,JUMAN_SYNC,160,JUMAN_SEC,0,0x8003
	ADD_ACTOR	ActJumanSubHeader,D_UP+4,8,0,0,16,JUMAN_SYNC,224,JUMAN_SEC,2,0x8003
	
//	SEPLAY_PAN	SE_W085B,WAZA_SE_R
	SEPLAY_PAN	SE_W063,WAZA_SE_R
	WAIT		0
	ADD_TASK	ColorFadeSeq,PRI10,5, 1,0,2,2,0
	WAIT		6	
	ADD_TASK	ColorFadeSeq,PRI10,5, 1,0,6,6,0
	WAIT		6
	ADD_TASK	ColorFadeSeq,PRI10,5, 1,0,2,2,0
	WAIT		6
	ADD_TASK	ColorFadeSeq,PRI10,5, 1,0,6,6,0
	WAIT_FLAG	
	WAIT		20
	SE_WAITPLAY	SE_W085B,WAZA_SE_R,19
	SEQ_CALL	WEST_MahiKouka
	WAIT_FLAG
	WAIT		20
	ADD_TASK	ColorFadeSeq,PRI10,5, 1,0,6,0,0
	WAIT_FLAG
	SEQEND

@======================================================
@	でんじは
@======================================================
#define DENJIHA_WAIT	4
WEST_Denjiha:
	CHAR_SET	WAZACHR_ID_KAMINARI
	CHAR_SET	WAZACHR_ID_MAHI
	CHAR_SET	WAZACHR_ID_DENJIHA
	ADD_TASK	ColorFadeSeq,PRI10,5, 1,0,0,6,0
	WAIT_FLAG
	WAIT		10
	ADD_TASK	KaminariTask,PRI5,3, 0,-48,0
	SEPLAY_PAN	SE_W086,WAZA_SE_R
	WAIT		20
	SE_REPEAT	SE_W085B,WAZA_SE_R,10,4
	ADD_ACTOR	DenjihaHeader,D_UP+2,2, -16,-16
	WAIT		DENJIHA_WAIT
	ADD_ACTOR	DenjihaHeader,D_UP+2,2, -16,0
	WAIT		DENJIHA_WAIT
	ADD_ACTOR	DenjihaHeader,D_UP+2,2, -16,16
	WAIT_FLAG
/*	WAIT		20
	SEQ_CALL	WEST_MahiKouka
	WAIT_FLAG
	WAIT		20*/
	ADD_TASK	ColorFadeSeq,PRI10,5, 1,0,6,0,0
	WAIT_FLAG
	SEQEND

@======================================================
@	251	ふくろだたき
@======================================================
WEST_Hukuro:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_KAKUTOU
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	TURN_CHK	WEST_HukuroTurn0, WEST_HukuroTurn1
WEST_HukuroReturn:
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

WEST_HukuroTurn0:	//偶数ﾀｰﾝ
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, 		-20,-20,1,2
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+3,5, 	-20,-12, 8, 1,0
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,6,1
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	WAIT		8
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, 		 8, 0,1,2
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+3,5,   8, 8, 8, 1,0
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,6,1
	SEPLAY_PAN	SE_W233B,WAZA_SE_R

	SEQ_JP		WEST_HukuroReturn

WEST_HukuroTurn1:	//奇数ﾀｰﾝ
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, 		 12,-20,1,2
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+3,5, 	 12,-12, 8, 1,0
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,6,1
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	WAIT		8
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, 		-12,0,1,2
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+3,5,  -12,8, 8, 1,0
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,6,1
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	SEQ_JP		WEST_HukuroReturn

@======================================================
@	ふみつけ
@======================================================
#define FUMITUKE_START_WAIT		15
WEST_Fumituke:
	CHAR_SET	WAZACHR_ID_KAKUTOU
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W104,WAZA_SE_R
	ADD_ACTOR	FumitukeHeader,A_UP+3,3, 0,-32,FUMITUKE_START_WAIT
	WAIT		FUMITUKE_START_WAIT+4
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,-8,1,1
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,0,4,9,1
	SEPLAY_PAN	SE_W025B,WAZA_SE_R
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

@======================================================
@	しっぽをふる
@======================================================

WEST_SippowoFuru:
	SE_REPEAT	SE_W039,WAZA_SE_L,24,3
	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5, 0,12,4, 2,3
	WAIT_FLAG
//	ADD_TASK	StatusEffectTask,PRI5,5, 1,1,1,1,0
	SEQEND

@======================================================
@	いあいぎり
@======================================================

WEST_Iaigiri:
	CHAR_SET	WAZACHR_ID_KIRISAKU2
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W015,WAZA_SE_R
	ADD_ACTOR	ActIaigiriHeader,A_UP+2,3,  40,-32,0
	WAIT		5
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,0,3,10,1
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	WAIT_FLAG
	SEQEND

@======================================================
@	めざめるパワー
@======================================================
#define MEZAME_AFF			(-7)
#define MEZAME_AFFSYNC		11
#define MEZAME_KAKUDO		(256/6)
#define MEZAME_BALLKAKUDO	(256/8)	//飛び散るﾎﾞｰﾙ
#define MEZAME_BALLSYNC		26
WEST_Mezameru:
	CHAR_SET	WAZACHR_ID_POWER
	SEPLAY_PAN	SE_W036, WAZA_SE_L
	ADD_TASK	PokeKakusyukuTask,PRI5,5, MEZAME_AFF,MEZAME_AFF,MEZAME_AFFSYNC,0,0
	WAIT_FLAG
	WAIT		30
	ADD_TASK	TaskPokeFadeCtrl,PRI5,5,  0,0x4fff,12,5,1,
	WAIT		4
	ADD_TASK	PokeKakusyukuTask,PRI5,5, MEZAME_AFF,MEZAME_AFF,MEZAME_AFFSYNC,0,0
	SEPLAY_PAN	SE_W179, WAZA_SE_L
	ADD_ACTOR	MezameruHeader,A_UP+2,2, MEZAME_BALLSYNC,MEZAME_KAKUDO*0
	ADD_ACTOR	MezameruHeader,A_UP+2,2, MEZAME_BALLSYNC,MEZAME_KAKUDO*1
	ADD_ACTOR	MezameruHeader,A_UP+2,2, MEZAME_BALLSYNC,MEZAME_KAKUDO*2
	ADD_ACTOR	MezameruHeader,A_UP+2,2, MEZAME_BALLSYNC,MEZAME_KAKUDO*3
	ADD_ACTOR	MezameruHeader,A_UP+2,2, MEZAME_BALLSYNC,MEZAME_KAKUDO*4
	ADD_ACTOR	MezameruHeader,A_UP+2,2, MEZAME_BALLSYNC,MEZAME_KAKUDO*5
	WAIT		MEZAME_BALLSYNC*2
	WORK_SET	7,0xffff
	SEPLAY_PAN	SE_W115, WAZA_SE_L
	ADD_TASK	PokeKakusyukuTask,PRI5,5, MEZAME_AFF,MEZAME_AFF,MEZAME_AFFSYNC,0,0
	ADD_ACTOR	Mezameru2Header,D_UP+2,1, MEZAME_BALLKAKUDO*0
	ADD_ACTOR	Mezameru2Header,D_UP+2,1, MEZAME_BALLKAKUDO*1
	ADD_ACTOR	Mezameru2Header,D_UP+2,1, MEZAME_BALLKAKUDO*2
	ADD_ACTOR	Mezameru2Header,D_UP+2,1, MEZAME_BALLKAKUDO*3
	ADD_ACTOR	Mezameru2Header,D_UP+2,1, MEZAME_BALLKAKUDO*4
	ADD_ACTOR	Mezameru2Header,D_UP+2,1, MEZAME_BALLKAKUDO*5
	ADD_ACTOR	Mezameru2Header,D_UP+2,1, MEZAME_BALLKAKUDO*6
	ADD_ACTOR	Mezameru2Header,D_UP+2,1, MEZAME_BALLKAKUDO*7
	SEQEND

@======================================================
@	きしかいせい
@======================================================
#define KISIKAISEI_KAKUDO		(256/6)
#define KISIKAISEI_BALLSYNC		26
WEST_Kisikaisei:
	CHAR_SET	WAZACHR_ID_NOMIKOMU
	CHAR_SET	WAZACHR_ID_KAKUTOU
	CHAR_SET	WAZACHR_ID_HITMARK
	SEPLAY_PAN	SE_W197,WAZA_SE_L
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 0x1f,3,3,0x7fff,8,0,0
	WAIT_FLAG
	WAIT		30
	ADD_TASK	WazaTaskColorFade,PRI2,6, 0x1f,3,2,0,10,0x7fff
	WAIT		10
	SEPLAY_PAN	SE_W179,WAZA_SE_L
	ADD_ACTOR	KisikaiseiHeader,A_UP+2,2, KISIKAISEI_BALLSYNC,KISIKAISEI_KAKUDO*0
	ADD_ACTOR	KisikaiseiHeader,A_UP+2,2, KISIKAISEI_BALLSYNC,KISIKAISEI_KAKUDO*1
	ADD_ACTOR	KisikaiseiHeader,A_UP+2,2, KISIKAISEI_BALLSYNC,KISIKAISEI_KAKUDO*2
	ADD_ACTOR	KisikaiseiHeader,A_UP+2,2, KISIKAISEI_BALLSYNC,KISIKAISEI_KAKUDO*3
	ADD_ACTOR	KisikaiseiHeader,A_UP+2,2, KISIKAISEI_BALLSYNC,KISIKAISEI_KAKUDO*4
	ADD_ACTOR	KisikaiseiHeader,A_UP+2,2, KISIKAISEI_BALLSYNC,KISIKAISEI_KAKUDO*5
	WAIT_FLAG
	WAIT		20
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,6,4
	WAIT		8
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 0x1f,3,1,0x7fff,8,0,0
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+4,5, 0,0, 10, 1,0
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 0,0,1,1
	ADD_TASK	TaskPokeDamageYure, PRI5,5, 0,1,8,1,0
	SEQEND

@======================================================
@	おいうち
@======================================================

WEST_Oiuti:
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	HAIKEI_CHG	WAZAMAP_ID_AKU
	HAIKEI_CHG_WAIT
	WAIT		0
	BLDALPHA_SET	0xc,0x8
	TURN_CHK	WEST_OiutiNormal, WEST_OiutiClitical
WEST_OiutiReturn:
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	WAIT			0
	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
	SEQEND

WEST_OiutiNormal:
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,2
	ADD_TASK	TaskPokeDamageYure, PRI5,5, 0,1,6,1,0
	SEQ_JP		WEST_OiutiReturn

WEST_OiutiClitical:		//ﾎﾟｹﾓﾝ交代時に「おいうち」がﾋｯﾄした
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,1
	ADD_TASK	TaskPokeDamageYure, PRI5,5, 0,1,6,1,0
	SEQ_JP		WEST_OiutiReturn

@======================================================
@	とげキャノン
@======================================================
#define TOGEKYANON_SYNC	20
WEST_TogeKyanon:
	CHAR_SET	WAZACHR_ID_HARI2
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	ADD_TASK	PokeSinBackInit,PRI5,7, 0,-4,0,4, 6, 8,4
	WAIT_FLAG
	SE_REPEAT	SE_W013B,WAZA_SE_L,5,3
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,5
	ADD_ACTOR	DaburuNeedleHeader,A_UP+2,5, 10,-8, -8,-8, TOGEKYANON_SYNC
	ADD_ACTOR	DaburuNeedleHeader,A_UP+2,5, 18,0, 0,0, TOGEKYANON_SYNC
	ADD_ACTOR	DaburuNeedleHeader,A_UP+2,5, 26,8, 8,8, TOGEKYANON_SYNC
	WAIT_FLAG
	ADD_ACTOR	ActHitMarkYflipHeader,A_UP+3,4, -8,-8,1,2
	ADD_ACTOR	ActHitMarkYflipHeader,A_UP+3,4, 0,0,1,2
	ADD_ACTOR	ActHitMarkYflipHeader,A_UP+3,4, 8,8,1,2
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,7,1
	SE_REPEAT	SE_W030,WAZA_SE_R,5,3
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

@======================================================
@	つるぎのまい
@======================================================

WEST_Turugi:
	CHAR_SET	WAZACHR_ID_TURUGI
	POKEBG		0
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W014,WAZA_SE_L
	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5, 0,16,6, 1,4
	ADD_ACTOR	ActTuruginoMaiHeader,A_UP+2,2, 0,0
	WAIT		22
#if 1
	ADD_TASK	WazaTaskWazaChrFlash,PRI2,7, WAZACHR_ID_TURUGI,2,2,0x7ff2,16,0,0
#else
//	ADD_TASK	WazaChrColorFade,PRI2,5, WAZACHR_ID_TURUGI,0,0,8,0x4bff
//	WAIT		8
//	ADD_TASK	WazaChrColorFade,PRI2,5, WAZACHR_ID_TURUGI,0,8,0,0x4bff
#endif
	WAIT_FLAG
	POKEBG_RESET	0
	BLDALPHA_RESET

	WAIT		1
//	ADD_TASK	StatusEffectTask,PRI5,5, 0,0,0,0,1
	
	SEQEND

@======================================================
@	じこあんじ
@======================================================
#define JIKOANJI_AFF		(-5)
WEST_Jikoanji:
	CHAR_SET	WAZACHR_ID_UZU
	POKEBG		2
//	HAIKEI_CHG	WAZAMAP_ID_UNEUNE	//chg_02.08.28_iwa
//	HAIKEI_HALF_WAIT
//	ADD_TASK	UneunePalAnmTask,PRI5,0
//	HAIKEI_CHG_WAIT
	ADD_TASK	WazaTaskColorFade,PRI2,6,	0x19,2,6,1,11,0x0000
	BLDALPHA_SET	0xc,0x8
	SE_REPEAT	SE_W060B,WAZA_SE_L,5,10
	ADD_ACTOR	JikoanjiHeader,A_UP+2,4, 0,0,0,0
	ADD_TASK	PokeSinMove,PRI5,5, 0,5,0x0a00,8,0
	WAIT		127
	WAIT		4
	SEPLAY_PAN	SE_W060,WAZA_SE_L
	ADD_TASK	PokeKakusyukuTask,PRI5,5, JIKOANJI_AFF,JIKOANJI_AFF,10,0,1
	ADD_TASK	ColorFadeSeq,PRI9, 5, 2,2,10,0,0x03ff
	WAIT		30
	POKEBG_RESET	2
	BLDALPHA_RESET
//	HAIKEI_RECOVER
//	HAIKEI_HALF_WAIT
//	WORK_SET	7,0xffff	//背景のパレットアニメ終了
//	HAIKEI_CHG_WAIT
	WAIT_FLAG
	SEQEND

@======================================================
@	ピヨピヨパンチ
@======================================================
#define PIYOPAN_SYNC	9
#define PIYOPAN_WAITSYNC	20
WEST_PiyopiyoPanchi:
	CHAR_SET	WAZACHR_ID_HIYOKO
	CHAR_SET	WAZACHR_ID_KAKUTOU
	CHAR_SET	WAZACHR_ID_HITMARK
//	CHAR_SET	WAZACHR_ID_PUNCH
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	SEQ_CALL	WEST_PiyopiyoPanchiSub
//	ADD_ACTOR	PunchHeader,D_UP+2,5, -32,24, 8,0, PIYOPAN_SYNC
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+5,5, 16,8,PIYOPAN_WAITSYNC, 1,0
	ADD_ACTOR	ActHitMarkHeader,D_UP+4,4, 16,0,1,1
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	ADD_ACTOR	PiyoHiyokoHeader,D_UP+3,4, 16,8,0x00a0,-32
	ADD_ACTOR	PiyoHiyokoHeader,D_UP+3,4, 16,8,-0x0100,-40
	ADD_ACTOR	PiyoHiyokoHeader,D_UP+3,4, 16,8,0x0080,-16
	ADD_ACTOR	PiyoHiyokoHeader,D_UP+3,4, 16,8,0x01a0,-38
	ADD_ACTOR	PiyoHiyokoHeader,D_UP+3,4, 16,8,-0x0080,-22
	ADD_ACTOR	PiyoHiyokoHeader,D_UP+3,4, 16,8,-0x0180,-31
	WAIT		10
	SEQ_CALL	WEST_PiyopiyoPanchiSub
//	ADD_ACTOR	PunchHeader,D_UP+2,5, -48,16, -8,-8, PIYOPAN_SYNC
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+5,5, -16,-8,PIYOPAN_WAITSYNC, 1,0
	ADD_ACTOR	ActHitMarkHeader,D_UP+4,4, -16,-16,1,1
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	ADD_ACTOR	PiyoHiyokoHeader,D_UP+3,4, -16,-8,0x00a0,-32
	ADD_ACTOR	PiyoHiyokoHeader,D_UP+3,4, -16,-8,-0x0100,-40
	ADD_ACTOR	PiyoHiyokoHeader,D_UP+3,4, -16,-8,0x0080,-16
	ADD_ACTOR	PiyoHiyokoHeader,D_UP+3,4, -16,-8,0x01a0,-38
	ADD_ACTOR	PiyoHiyokoHeader,D_UP+3,4, -16,-8,-0x0080,-22
	ADD_ACTOR	PiyoHiyokoHeader,D_UP+3,4, -16,-8,-0x0180,-31
	WAIT_FLAG
//	WAIT		8
//	ADD_TASK	PokeSinMove,PRI5,5, 0,6,0x0400,3,1
//	SEQ_CALL	WEST_PiyoriEffect
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

WEST_PiyopiyoPanchiSub:
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2, 6,4
	WAIT		6		@体当たりのﾙｰﾌﾟ回数と同じにしておくこと
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,7,1
	END_CALL
	
@======================================================
@	ほのおのうず
@======================================================

WEST_HonoonoUzu:	//ｽﾃｰﾀｽｴﾌｪｸﾄでもそのまま使用
	CHAR_SET	WAZACHR_ID_FIRE
	SEPLAY_PAN	SE_W221B,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,2,47,1
	SEQ_CALL	WEST_HonoonoUzuSub
	SEQ_CALL	WEST_HonoonoUzuSub
	SEQ_CALL	WEST_HonoonoUzuSub
	WAIT_FLAG
	SEQEND

WEST_HonoonoUzuSub:
	ADD_ACTOR	ActHonoonoUzuHeader,D_UP+2,7, 0,28, 0x0210,30, 13, 50,1
	WAIT		2
	ADD_ACTOR	ActHonoonoUzuHeader,D_UP+2,7, 0,32, 0x01e0,20, 16, -46,1
	WAIT		2
	ADD_ACTOR	ActHonoonoUzuHeader,D_UP+2,7, 0,33, 0x0240,20, 8, 42,1
	WAIT		2
	ADD_ACTOR	ActHonoonoUzuHeader,D_UP+2,7, 0,31, 0x0190,25, 11, -42,1
	WAIT		2
	ADD_ACTOR	ActHonoonoUzuHeader,D_UP+2,7, 0,28, 0x0200,25, 16, 46,1
	WAIT		2
	ADD_ACTOR	ActHonoonoUzuHeader,D_UP+2,7, 0,33, 0x01d0,30, 15, -50,1
	WAIT		2
	END_CALL


@======================================================
@	れんぞくぎり
@======================================================

WEST_RenzokuGiri:
	CHAR_SET	WAZACHR_ID_KIRISAKU2
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W013,WAZA_SE_R
	ADD_TASK	RenzokugiriGuusuuKisuuCheck,PRI2,0
	WORKCHK_JP	7,0,WEST_RenzokuGiriRight
	SEQ_JP		WEST_RenzokuGiriLeft
WEST_RenzokuGiriLeftRightReturn:
	ADD_TASK	GetRenzokugiriCunt,PRI2,0
	WORKCHK_JP	7,1,WEST_RenzokuGiriReturn
	WORKCHK_JP	7,2,WEST_RenzokuGiriTurn1
	WORKCHK_JP	7,3,WEST_RenzokuGiriTurn2
	SEQ_JP		WEST_RenzokuGiriTurn3
WEST_RenzokuGiriReturn:
	WAIT		5
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,0,3,10,1
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	WAIT_FLAG
	SEQEND

WEST_RenzokuGiriRight:	//右から斬る
	ADD_ACTOR	ActIaigiriHeader,A_UP+2,3,  40,-32,0
	SEQ_JP		WEST_RenzokuGiriLeftRightReturn

WEST_RenzokuGiriLeft:	//左から斬る
	ADD_ACTOR	ActIaigiriHeader,A_UP+2,3,  40,-32,1
	SEQ_JP		WEST_RenzokuGiriLeftRightReturn
	
WEST_RenzokuGiriTurn1:
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 31,3,1,0x2909,4,0,0
	SEQ_JP		WEST_RenzokuGiriReturn

WEST_RenzokuGiriTurn2:
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 31,3,3,0x2909,4,0,0
	SEQ_JP		WEST_RenzokuGiriReturn

WEST_RenzokuGiriTurn3:
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 31,3,3,0x2909,4,0,0
	SEQ_JP		WEST_RenzokuGiriReturn

@======================================================
@	じばく
@======================================================
#define JIBAKU_DX	6
#define JIBAKU_WAIT	6
WEST_Zibaku:
	CHAR_SET	WAZACHR_ID_DAIBAKUHATU
	ADD_TASK	ColorFadeSeq,PRI10,5, 2,1,0,9,0x001f
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 4,JIBAKU_DX,0,38,1
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 5,JIBAKU_DX,0,38,1
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 6,JIBAKU_DX,0,38,1
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 7,JIBAKU_DX,0,38,1
	//攻撃ﾎﾟｹﾓﾝはHPが既にHPが0でﾁｪｯｸにはじかれるので、これで揺らす
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 8,JIBAKU_DX,0,38,1
	SEQ_CALL	WEST_JibakuSub
	SEQ_CALL	WEST_JibakuSub
	WAIT_FLAG
	ADD_TASK	ColorFadeSeq,PRI10,5, 2,1,9,0,0x001f
	SEQEND
/*	CHAR_SET	WAZACHR_ID_BAKUHATU
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 31,4,1,0,9,0,0
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,4,0,16,1
	SEPLAY_PAN	SE_W120,WAZA_SE_L
	ADD_ACTOR	ActBakuhatuHeader,A_UP+4,4, 6,5,0,0
	WAIT		3
	SEPLAY_PAN	SE_W120,WAZA_SE_L
	ADD_ACTOR	ActBakuhatuHeader,A_UP+4,4, -16,-15,0,0
	WAIT		3
	SEPLAY_PAN	SE_W120,WAZA_SE_L
	ADD_ACTOR	ActBakuhatuHeader,A_UP+4,4, 16,-5,0,0
	WAIT		3
	SEPLAY_PAN	SE_W120,WAZA_SE_L
	ADD_ACTOR	ActBakuhatuHeader,A_UP+4,4, -12,18,0,0
	WAIT		3
	SEPLAY_PAN	SE_W120,WAZA_SE_L
	ADD_ACTOR	ActBakuhatuHeader,A_UP+4,4, 0,5,0,0
	WAIT		3
	WAIT_FLAG
	SEQEND
*/

WEST_JibakuSub:
	SEPLAY_PAN	SE_W120,WAZA_SE_L
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, 0,0, 0,1
	WAIT		JIBAKU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_L
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, 24,-24, 0,1
	WAIT		JIBAKU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_L
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, -16,16, 0,1
	WAIT		JIBAKU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_L
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, -24,-12, 0,1
	WAIT		JIBAKU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_L
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, 16,16, 0,1
	WAIT		JIBAKU_WAIT
	END_CALL

@======================================================
@	たたきつける
@======================================================

WEST_Tataki:
	CHAR_SET	WAZACHR_ID_BINTA
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W004,WAZA_SE_L
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,20,3,0,4
	WAIT		1
	ADD_ACTOR	ActHatakuHitHeader,A_UP+2,2,0,0
	WAIT		3
	SEPLAY_PAN	SE_W025B,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,1
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 1,-12,10,0,3
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,5
	WAIT		3
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 1,0,3,6,1
	WAIT_FLAG
	WAIT		5
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 1,0,6
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

@======================================================
@	つるのムチ
@======================================================

WEST_TurunoMuti:
	CHAR_SET	WAZACHR_ID_TURUNOMUTI
	SEPLAY_PAN	SE_W026,WAZA_SE_L
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2, 4,6
	WAIT		6		@体当たりのﾙｰﾌﾟ回数と同じにしておくこと
	SEPLAY_PAN	SE_W010,WAZA_SE_R
	ADD_ACTOR	TurunoMutiHeader,D_UP+2,2,0,0
	WAIT		6
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,6,1
	SEQEND

@======================================================
@	ドリルくちばし
@======================================================

WEST_Dorirukuti:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_KAITEN
//	POKEBG		3
//	BLDALPHA_SET	0xc,0x8
/*	SE_REPEAT	SE_W026,WAZA_SE_L,6,4
	ADD_ACTOR	ActKaitenHeader,A_UP+2,5, 0,-8, 0,40,0
	ADD_ACTOR	ActKaitenHeader,A_UP+2,5, 0,0, 0,40,1
	ADD_ACTOR	ActKaitenHeader,A_UP+2,5, 0,8, 0,40,2
	ADD_ACTOR	ActKaitenHeader,A_UP+2,5, 0,16, 0,40,3
	ADD_ACTOR	ActKaitenHeader,A_UP+2,5, 0,24, 0,40,4
	ADD_ACTOR	ActKaitenHeader,A_UP+2,5, 0,32, 0,40,0
	WAIT_FLAG
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,16,0,0,4
*/
	ADD_ACTOR	ActZutukiHeader,A_UP+2,1,0  @ 後ろに下げる＆頭を下げる
	SEPLAY_PAN	SE_W029, WAZA_SE_L,
	WAIT_FLAG
	WAIT		2
	ADD_ACTOR	ActZutukiHeader,A_UP+2,1,1  @ 前へ進める

	WAIT		2
	SE_REPEAT	SE_W030,WAZA_SE_R,4,8
	ADD_TASK	DoriruKutibasiTask,PRI5,0
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,4,0,18,1
	WAIT_FLAG
	ADD_ACTOR	ActZutukiHeader,A_UP+2,1,2  @ 頭を上げる
	WAIT_FLAG
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,6
	WAIT_FLAG
//	POKEBG_RESET	3
//	BLDALPHA_RESET
	SEQEND

@======================================================
@	たきのぼり
@======================================================
#define TAKINOBORI_AWASYNC	25
#define TAKIAWA_WAIT		4
#define TAKI_WAIT			2
WEST_Taki:
	CHAR_SET	WAZACHR_ID_MIZUHIT
	CHAR_SET	WAZACHR_ID_MIZU2
	CHAR_SET	WAZACHR_ID_YUKI2
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 0,0,2,23,1
//	ADD_TASK	PokeSinMove,PRI5,5, 0,16,0x0a00,8,0
	WAIT		5
	SEPLAY_PAN	SE_W152,WAZA_SE_L
	ADD_ACTOR	ActKurabuAwaHeader,A_UP+2,4, 10,10, TAKINOBORI_AWASYNC,0
	WAIT		TAKIAWA_WAIT
	SEPLAY_PAN	SE_W152,WAZA_SE_L
	ADD_ACTOR	ActKurabuAwaHeader,A_UP+2,4, -15,0, TAKINOBORI_AWASYNC,0
	WAIT		TAKIAWA_WAIT
	SEPLAY_PAN	SE_W152,WAZA_SE_L
	ADD_ACTOR	ActKurabuAwaHeader,A_UP+2,4, 20,10, TAKINOBORI_AWASYNC,0
	WAIT		TAKIAWA_WAIT
	SEPLAY_PAN	SE_W152,WAZA_SE_L
	ADD_ACTOR	ActKurabuAwaHeader,A_UP+2,4, 0,-10, TAKINOBORI_AWASYNC,0
	WAIT		TAKIAWA_WAIT
	SEPLAY_PAN	SE_W152,WAZA_SE_L
	ADD_ACTOR	ActKurabuAwaHeader,A_UP+2,4, -10,15, TAKINOBORI_AWASYNC,0
	WAIT		TAKIAWA_WAIT
	SEPLAY_PAN	SE_W152,WAZA_SE_L
	ADD_ACTOR	ActKurabuAwaHeader,A_UP+2,4, 25,20, TAKINOBORI_AWASYNC,0
	WAIT		TAKIAWA_WAIT
	SEPLAY_PAN	SE_W152,WAZA_SE_L
	ADD_ACTOR	ActKurabuAwaHeader,A_UP+2,4, -20,20, TAKINOBORI_AWASYNC,0
	WAIT		TAKIAWA_WAIT
	SEPLAY_PAN	SE_W152,WAZA_SE_L
	ADD_ACTOR	ActKurabuAwaHeader,A_UP+2,4, 12,0, TAKINOBORI_AWASYNC,0
	WAIT_FLAG
	WAIT		10
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,6,5
	WAIT		6
	SEQ_CALL	WEST_TakiSub
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

WEST_TakiSub:	//「ダイビング｣でも使用
	SEPLAY_PAN	SE_W127,WAZA_SE_R
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 1,4,0,17,1
	ADD_ACTOR	ActMizuHitHeader,A_UP+3,4, 0,20,1,1
	ADD_ACTOR	TakiSuitekiHeader,A_UP+4,2, 0,20
	ADD_ACTOR	TakiSuitekiHeader,A_UP+4,2, 0,20
	WAIT		TAKI_WAIT
	ADD_ACTOR	ActMizuHitHeader,A_UP+3,4, 0,15,1,1
	ADD_ACTOR	TakiSuitekiHeader,A_UP+4,2, 0,15
	ADD_ACTOR	TakiSuitekiHeader,A_UP+4,2, 0,15
	WAIT		TAKI_WAIT
	ADD_ACTOR	ActMizuHitHeader,A_UP+3,4, 0,10,1,1
	ADD_ACTOR	TakiSuitekiHeader,A_UP+4,2, 0,10
	ADD_ACTOR	TakiSuitekiHeader,A_UP+4,2, 0,10
	WAIT		TAKI_WAIT
	ADD_ACTOR	ActMizuHitHeader,A_UP+3,4, 0,5,1,1
	ADD_ACTOR	TakiSuitekiHeader,A_UP+4,2, 0,5
	ADD_ACTOR	TakiSuitekiHeader,A_UP+4,2, 0,5
	WAIT		TAKI_WAIT
	ADD_ACTOR	ActMizuHitHeader,A_UP+3,4, 0,0,1,1
	ADD_ACTOR	TakiSuitekiHeader,A_UP+4,2, 0,0
	ADD_ACTOR	TakiSuitekiHeader,A_UP+4,2, 0,0
	WAIT		TAKI_WAIT
	ADD_ACTOR	ActMizuHitHeader,A_UP+3,4, 0,-5,1,1
	ADD_ACTOR	TakiSuitekiHeader,A_UP+4,2, 0,-5
	ADD_ACTOR	TakiSuitekiHeader,A_UP+4,2, 0,-5
	WAIT		TAKI_WAIT
	ADD_ACTOR	ActMizuHitHeader,A_UP+3,4, 0,-10,1,1
	ADD_ACTOR	TakiSuitekiHeader,A_UP+4,2, 0,-10
	ADD_ACTOR	TakiSuitekiHeader,A_UP+4,2, 0,-10
	WAIT		TAKI_WAIT
	ADD_ACTOR	ActMizuHitHeader,A_UP+3,4, 0,-15,1,1
	ADD_ACTOR	TakiSuitekiHeader,A_UP+4,2, 0,-15
	ADD_ACTOR	TakiSuitekiHeader,A_UP+4,2, 0,-15
	WAIT		TAKI_WAIT
	ADD_ACTOR	ActMizuHitHeader,A_UP+3,4, 0,-20,1,1
	ADD_ACTOR	TakiSuitekiHeader,A_UP+4,2, 0,-20
	ADD_ACTOR	TakiSuitekiHeader,A_UP+4,2, 0,-20
	END_CALL
	
@======================================================
@	あくまのキッス
@======================================================
@
@WEST_Akuma:
@	SE			SE_BAN
@	CHAR_SET	WAZACHR_ID_AKUMA
@	CHAR_SET	WAZACHR_ID_KISS
@	CHAR_SET	WAZACHR_ID_MAHOUZIN
@	ADD_ACTOR	ActMahouzinHeader,A_UP+2,7,40,30,30,0,0,0,0
@	WAIT_FLAG
@	ADD_ACTOR	ActFlashHeader,A_UP+2,7,7,4,10,0x7fff,10,0,0
@	WAIT		10
@	ADD_TASK	WazaTaskColorFade,PRI2,6,7,2,6,3,10,0x5088
@	ADD_ACTOR	ActAkumaHeader,A_UP+2,7,40,10,100,0,0,0,0
@	ADD_ACTOR	ActKissHeader,A_UP+2,7,0,10,100,0,0,8,0
@	WAIT_FLAG
@	SEQEND


@======================================================
@	だいばくはつ
@======================================================
#define DAIBAKU_DX	8
#define DAIBAKUHATU_WAIT	6
WEST_Daibakuhatu:
	CHAR_SET	WAZACHR_ID_DAIBAKUHATU
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 1,8,9, 0x211a,8,0x0000,8
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 4,DAIBAKU_DX,0,40,1
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 5,DAIBAKU_DX,0,40,1
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 6,DAIBAKU_DX,0,40,1
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 7,DAIBAKU_DX,0,40,1
	//攻撃ﾎﾟｹﾓﾝはHPが既にHPが0でﾁｪｯｸにはじかれるので、これで揺らす
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 8,DAIBAKU_DX,0,40,1
	SEQ_CALL	WEST_DaibakuhatuSub
	SEQ_CALL	WEST_DaibakuhatuSub
	WAIT_FLAG
	ADD_TASK	ColorFadeSeq,PRI10,5, 1,1,16,16,0x7fff
	WAIT		50
	ADD_TASK	ColorFadeSeq,PRI10,5, 1,3,16,0,0x7fff
	SEQEND

WEST_DaibakuhatuSub:
	SEPLAY_PAN	SE_W153,WAZA_SE_L
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, 0,0, 0,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W153,WAZA_SE_L
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, 24,-24, 0,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W153,WAZA_SE_L
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, -16,16, 0,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W153,WAZA_SE_L
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, -24,-12, 0,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W153,WAZA_SE_L
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, 16,16, 0,1
	WAIT		DAIBAKUHATU_WAIT
	END_CALL
	
@======================================================
@	てんしのキッス
@======================================================
@
@WEST_Tensi:
@	SE			SE_BAN
@	CHAR_SET	WAZACHR_ID_TENSI
@	CHAR_SET	WAZACHR_ID_KISS
@	CHAR_SET	WAZACHR_ID_HIYOKO
@	CHAR_SET	WAZACHR_ID_MAHOUZIN
@	ADD_ACTOR	ActMahouzinHeader,A_UP+2,7,40,30,30,0,0,0,0
@	WAIT_FLAG
@	ADD_ACTOR	ActFlashHeader,A_UP+2,7,7,4,10,0x7fff,10,0,0
@	WAIT		10
@	ADD_TASK	WazaTaskColorFade,PRI2,6,7,2,6,3,10,0x5088
@	ADD_ACTOR	ActTensiHeader,A_UP+2,7,40,10,100,0,0,0,0
@	ADD_ACTOR	ActKissHeader,A_UP+2,7,0,10,100,0,0,8,0
@	WAIT_FLAG
@	ADD_ACTOR	ActHiyokoHeader,A_UP+2,5,0,-15,0,  3,85
@	ADD_ACTOR	ActHiyokoHeader,A_UP+2,5,0,-15,51  3,85
@	ADD_ACTOR	ActHiyokoHeader,A_UP+2,5,0,-15,102,3,85
@	ADD_ACTOR	ActHiyokoHeader,A_UP+2,5,0,-15,153,3,85
@	ADD_ACTOR	ActHiyokoHeader,A_UP+2,5,0,-15,204,3,85
@	WAIT_FLAG
@	SEQEND

@======================================================
@	まるくなる
@======================================================

WEST_Marukunaru:
	CHAR_SET	WAZACHR_ID_MARUMARU
	SE_REPEAT	SE_W161,WAZA_SE_L,18,3
	ADD_TASK	PokeMonotoneTask,PRI5,2, 0,0
	ADD_TASK	MarukunaruTask,PRI5,0
	WAIT_FLAG
	ADD_ACTOR	MarumaruHeader,A_UP+2,4, 0,6,0,1
	WAIT_FLAG
	ADD_TASK	PokeMonotoneTask,PRI5,2, 0,1
	WAIT_FLAG
	SEQEND

@======================================================
@	まもる
@======================================================

WEST_Mamoru:
	CHAR_SET	WAZACHR_ID_MAMORU
	POKEBG		2
	BGPRI_GAPSET	BG_ATTACK
	SE_WAITPLAY		SE_W115,WAZA_SE_L,16
	ADD_ACTOR	MamoruHeader,A_UP+2,3, 24,0,90
	WAIT_FLAG
	POKEBG_RESET	2
	SEQEND

@======================================================
@	みきり
@======================================================

WEST_Mikiri:
	CHAR_SET	WAZACHR_ID_L_HIKARI
	ADD_ACTOR	ActFadeHeader,A_UP+2,5,1,2,0,9,0x0000
//	ADD_TASK	ColorFadeSeq,PRI10,5, 1,2,0,9,0x0000
	WAIT_FLAG
	ADD_TASK	ColorFadeSeq,PRI10,5, 2,1,0,9,0x7FFF
	WAIT		18
	SEPLAY_PAN	SE_W197,WAZA_SE_L
	ADD_ACTOR	ActKiraHeader,A_UP+13,2,20,-20
	WAIT_FLAG
	WAIT		10
	ADD_ACTOR	ActFadeHeader,A_UP+2,5,1,2,9,0,0x0000
	ADD_TASK	ColorFadeSeq,PRI10,5, 2,2,9,0,0x7FFF
//	ADD_TASK	ColorFadeSeq,PRI10,5, 1,2,9,0,0x0000
	WAIT_FLAG
	SEQEND

@======================================================
@	やつあたり
@======================================================

WEST_Yatuatari:
#if 0
	SE			SE_BAN
	CHAR_SET	WAZACHR_ID_IBARU
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	ADD_ACTOR	ActIbaruHeader,A_UP+2,7, 24,-24,90,0,0,10,1
	WAIT_FLAG
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,3,4
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, -10,0,1,1
	WAIT		3	
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,3,-4
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 25,0,1,1
	WAIT		3	
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,3,4
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,1
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND
#endif
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_IKARI
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	ADD_TASK	NatukidoWorkSet,PRI1,0
	WORKCHK_JP	7,0,WEST_Yatuatari1
	WORKCHK_JP	7,1,WEST_Yatuatari2
	WORKCHK_JP	7,2,WEST_Yatuatari3
	SEQ_JP		WEST_Yatuatari4
WEST_YatuatariReturn:
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

WEST_Yatuatari1:	@なつき度最低
	SEPLAY_PAN	SE_W082,WAZA_SE_L
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 0,1,0,15,1
	ADD_TASK	ColorFadeSeq,PRI10,5, 2,3,0,9,0x001f
	WAIT_FLAG
	WAIT		20
	SEPLAY_PAN	SE_W207B,WAZA_SE_L
	ADD_ACTOR	ActIbaruIkariHeader,A_UP+2,3, 0,20,-28
	WAIT_FLAG
	SEPLAY_PAN	SE_W207B,WAZA_SE_L
	ADD_ACTOR	ActIbaruIkariHeader,A_UP+2,3, 0,20,-28
	WAIT_FLAG
	WAIT		10
	ADD_TASK	PokeSinMove,PRI5,5, 0,16,0x1800,8,0
	WAIT		5
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 1,4,0,30,1
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,0
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	WAIT		5
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 24,8,1,0
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	WAIT		5
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, -24,-16,1,0
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	WAIT		5
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 8,4,1,0
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	WAIT		5
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, -16,19,1,0
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	WAIT		5
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 18,-18,1,0
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	WAIT_FLAG
	ADD_TASK	ColorFadeSeq,PRI10,5, 2,3,9,0,0x001f
	SEQ_JP		WEST_YatuatariReturn

WEST_Yatuatari2:	@なつき度最低から2番目
	SEPLAY_PAN	SE_W082,WAZA_SE_L
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 0,1,0,15,1
	ADD_TASK	ColorFadeSeq,PRI10,5, 2,3,0,9,0x001f
	WAIT_FLAG
	WAIT		20
	SEPLAY_PAN	SE_W207B,WAZA_SE_L
	ADD_ACTOR	ActIbaruIkariHeader,A_UP+2,3, 0,20,-28
	WAIT_FLAG
	WAIT		5
	ADD_TASK	Yatuatari2Task,PRI5,0
	WAIT		7
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,8,1,1
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 1,4,0,6,1
	WAIT		14
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 12,-6,1,1
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 1,4,0,6,1
	WAIT		14
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, -12,-6,1,1
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 1,4,0,6,1
	WAIT_FLAG
	ADD_TASK	ColorFadeSeq,PRI10,5, 2,3,9,0,0x001f
	SEQ_JP		WEST_YatuatariReturn

WEST_Yatuatari3:	@なつき度最低から3番目
	SEPLAY_PAN	SE_W207B,WAZA_SE_L
	ADD_ACTOR	ActIbaruIkariHeader,A_UP+2,3, 0,20,-28
	WAIT_FLAG
	WAIT		5
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,4,4
	WAIT		6		@体当たりのﾙｰﾌﾟ回数と同じにしておくこと
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 10,4,1,1
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,6,1
	WAIT_FLAG
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,4,4
	WAIT		6		@体当たりのﾙｰﾌﾟ回数と同じにしておくこと
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -10,-4,1,2
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,6,1
	SEQ_JP		WEST_YatuatariReturn
	
WEST_Yatuatari4:	@なつき度最高
	ADD_ACTOR	YatuatariIkariHeader,A_UP+2,2, 20,-28
	WAIT_FLAG
	WAIT		10
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,10,2
	WAIT		12
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,2
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,1,0,6,1
	SEQ_JP		WEST_YatuatariReturn
	
@======================================================
@	しんぴのまもり
@======================================================
#define SINPI_WAIT		4
WEST_Sinpi:
	CHAR_SET	WAZACHR_ID_MAMORI
	POKEBG		2
	BLDALPHA_SET	0x8,0x8
	SEPLAY_PAN	SE_W208,WAZA_SE_L
	ADD_ACTOR	SinpiHeader,A_UP+2,0
	WAIT		SINPI_WAIT
	ADD_ACTOR	SinpiHeader,A_UP+2,0
	WAIT		SINPI_WAIT
	ADD_ACTOR	SinpiHeader,A_UP+2,0
	WAIT_FLAG
	SEPLAY_PAN	SE_REAPOKE,WAZA_SE_L
	ADD_TASK	WazaTaskColorFade,PRI2,6, 0xA,0,2,0,10,0x7fff
	WAIT_FLAG
	POKEBG_RESET	2
	BLDALPHA_RESET
	SEQEND
	
@======================================================
@	いたみわけ
@======================================================

WEST_Itamiwake:
	CHAR_SET	WAZACHR_ID_HIT1
	ADD_ACTOR	ItamiwakeHeader,A_UP+2,3, -8,-42,0
	ADD_ACTOR	ItamiwakeHeader,D_UP+2,3, -8,-42,1
	WAIT		10
	SEPLAY_PAN	SE_W207B,0
	ADD_TASK	ItamiwakeTask,PRI2,2, 0,0
	ADD_TASK	ItamiwakeTask,PRI2,2, 1,0
	WAIT_FLAG
	ADD_ACTOR	ItamiwakeHeader,A_UP+2,3, -24,-42,0
	ADD_ACTOR	ItamiwakeHeader,D_UP+2,3, -24,-42,1
	WAIT		10
	SEPLAY_PAN	SE_W207B,0
	ADD_TASK	ItamiwakeTask,PRI2,2, 0,1
	ADD_TASK	ItamiwakeTask,PRI2,2, 1,1
	WAIT_FLAG
	ADD_ACTOR	ItamiwakeHeader,A_UP+2,3, 8,-42,0
	ADD_ACTOR	ItamiwakeHeader,D_UP+2,3, 8,-42,1
	WAIT		10
	SEPLAY_PAN	SE_W207B,0
	ADD_TASK	ItamiwakeTask,PRI2,2, 0,2
	ADD_TASK	ItamiwakeTask,PRI2,2, 1,2
	SEQEND

@======================================================
@	はさむ
@======================================================
WEST_Hasamu:
	CHAR_SET	WAZACHR_ID_KIRISAKU2
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W011,WAZA_SE_R
	ADD_ACTOR	HasamuHeader,A_UP+2,1, 0
	ADD_ACTOR	HasamuHeader,A_UP+2,1, 1
	WAIT		9
	ADD_ACTOR	ActHitMarkHeader,A_UP+1,4, 0,0,1,2
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 1,2,0,5,1
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	ハサミギロチン
@======================================================
WEST_HasamiGirotin:
	CHAR_SET	WAZACHR_ID_KIRISAKU2
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8

	HAIKEI_CHKCHG	WAZAMAP_ID_ZIGZAG0,WAZAMAP_ID_ZIGZAG1,WAZAMAP_ID_ZIGZAG2
	HAIKEI_CHG_WAIT

	SEPLAY_PAN	SE_W011,WAZA_SE_R
	ADD_ACTOR	GirotinHeader,A_UP+2,1, 0
	ADD_ACTOR	GirotinHeader,A_UP+2,1, 1
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,2,0,16,0x0000
	WAIT		9
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 1,2,0,23,1
	WAIT		46
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 1,4,0,8,1
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,0
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 0x1f,3,1,0x0000,8,0,0
	SEPLAY_PAN	SE_W013,WAZA_SE_R
	WAIT_FLAG
//	ADD_TASK	ColorFadeSeq,PRI10,5, 4,0,16,0,0x0000
//	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET

	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT

	SEQEND

@======================================================
@	ネコにこばん
@======================================================

WEST_NekoNiKoban:
	CHAR_SET	WAZACHR_ID_KOBAN2
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W013B,WAZA_SE_L
	ADD_ACTOR	ActKobanHeader,A_UP+2,5, 20,0, 0,0, 0x0480
	WAIT_FLAG
	SEPLAY_PAN	SE_W006,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+1,4, 0,0,1,2
	ADD_ACTOR	ActKobanBaundHeader,A_UP+2,0
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,1,0,6,1
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

@======================================================
@	げきりん
@======================================================

WEST_Gekirin:
	CHAR_SET	WAZACHR_ID_FIRE
	SE_REPEAT	SE_W082,WAZA_SE_L,8,3
	ADD_TASK	WazaTaskColorFade,PRI2,6,7,2,5,3,8,0x1ae
//	ADD_ACTOR	ActGekiHeader,D_UP+2,2,14,100
	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5, 0,12,6, 5,4
	WAIT		0
	ADD_ACTOR	ActGekihiHeader,D_UP+2,6,0,0,30,0x500,0,3
	WAIT		0
	ADD_ACTOR	ActGekihiHeader,D_UP+2,6,0,0,30,-0x500,0,3
	WAIT		0
	ADD_ACTOR	ActGekihiHeader,D_UP+2,6,0,0,30,0,0x500,3
	WAIT		0
	ADD_ACTOR	ActGekihiHeader,D_UP+2,6,0,0,30,0,-0x500,3
	WAIT		0
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,40,1
	ADD_ACTOR	ActGekihiHeader,D_UP+2,6,0,0,30,0x500,0x300,3
	WAIT		0
	ADD_ACTOR	ActGekihiHeader,D_UP+2,6,0,0,30,-0x500,0x300,3
	WAIT		0
	ADD_ACTOR	ActGekihiHeader,D_UP+2,6,0,0,30,0x500,-0x300,3
	WAIT		0
	ADD_ACTOR	ActGekihiHeader,D_UP+2,6,0,0,30,-0x500,-0x300,3
	WAIT		0
	ADD_ACTOR	ActGekihiHeader,D_UP+2,6,0,0,30,0x500,0,3
	SEQ_CALL	WEST_GekirinSub
	SEQ_CALL	WEST_GekirinSub
//	SEQ_CALL	WEST_GekirinSub		//chg_02.08.28_iwasawa
//	SEQ_CALL	WEST_GekirinSub
	WAIT_FLAG
	SEQEND

WEST_GekirinSub:
	WAIT		3
	ADD_ACTOR	ActGekihiHeader,D_UP+2,6,0,0,30,-0x500,0,3
	WAIT		0
	ADD_ACTOR	ActGekihiHeader,D_UP+2,6,0,0,30,0,0x500,3
	WAIT		0
	ADD_ACTOR	ActGekihiHeader,D_UP+2,6,0,0,30,0,-0x500,3
	WAIT		0
	ADD_ACTOR	ActGekihiHeader,D_UP+2,6,0,0,30,0x500,0x300,3
	WAIT		0
	ADD_ACTOR	ActGekihiHeader,D_UP+2,6,0,0,30,-0x500,0x300,3
	WAIT		0
	ADD_ACTOR	ActGekihiHeader,D_UP+2,6,0,0,30,0x500,-0x300,3
	WAIT		0
	ADD_ACTOR	ActGekihiHeader,D_UP+2,6,0,0,30,-0x500,-0x300,3
	END_CALL

@======================================================
@	209:スパーク	
@======================================================
#define SPARK_WIDTH	32
#define SPARK_SYNC	12
#define SPARK_SEC	20
WEST_Spark:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_MAHI
	WAIT		0
	ADD_TASK	WazaTaskColorFade,PRI2,6,	0x03,-31,1,5,5,0x5bff
	SEPLAY_PAN	SE_W085B,WAZA_SE_L
	ADD_ACTOR	ActSparkHeader,A_UP,7,	 32, 24,190,12,0,1,0 
	WAIT		0
	ADD_ACTOR	ActSparkHeader,A_UP,7,	 80, 24, 22,12,0,1,0
	ADD_ACTOR	ActSparkHeader,A_UP,7,	156, 24,121,13,0,1,1
	WAIT		0
	ADD_TASK	WazaTaskColorFade,PRI2,6,	0x03,-31,1,0,0,0x5bff
	WAIT		10
	ADD_TASK	WazaTaskColorFade,PRI2,6,	0x03,-31,1,5,5,0x5bff
	SEPLAY_PAN	SE_W085B,WAZA_SE_L
	ADD_ACTOR	ActSparkHeader,A_UP,7,	100, 24, 60,10,0,1,0
	ADD_ACTOR	ActSparkHeader,A_UP,7,	170, 24, 42,11,0,1,1
	WAIT		0
	ADD_ACTOR	ActSparkHeader,A_UP,7,	238, 24,165,10,0,1,1
	WAIT		0
	ADD_TASK	WazaTaskColorFade,PRI2,6,	0x03,-31,1,0,0,0x5bff
	WAIT		20	
	ADD_TASK	WazaTaskColorFade,PRI2,6,	0x03,-31,1,7,7,0x5bff
	SEPLAY_PAN	SE_W085B,WAZA_SE_L
#if 1
	ADD_ACTOR	ActJumanSubHeader,A_UP+4,8,0,0,SPARK_WIDTH,SPARK_SYNC,0,SPARK_SEC,0,0x00
	ADD_ACTOR	ActJumanSubHeader,A_UP+4,8,0,0,SPARK_WIDTH,SPARK_SYNC,64,SPARK_SEC,1,0x00
	ADD_ACTOR	ActJumanSubHeader,A_UP+4,8,0,0,SPARK_WIDTH,SPARK_SYNC,128,SPARK_SEC,0,0x00
	ADD_ACTOR	ActJumanSubHeader,A_UP+4,8,0,0,SPARK_WIDTH,SPARK_SYNC,192,SPARK_SEC,2,0x00

	ADD_ACTOR	ActJumanSubHeader,A_UP+4,8,0,0,16,SPARK_SYNC,32,SPARK_SEC,0,0x00
	ADD_ACTOR	ActJumanSubHeader,A_UP+4,8,0,0,16,SPARK_SYNC,96,SPARK_SEC,1,0x00
	ADD_ACTOR	ActJumanSubHeader,A_UP+4,8,0,0,16,SPARK_SYNC,160,SPARK_SEC,0,0x00
	ADD_ACTOR	ActJumanSubHeader,A_UP+4,8,0,0,16,SPARK_SYNC,224,SPARK_SEC,2,0x00
#else
	ADD_ACTOR	ActSparkHeader,A_UP,7,	 32, 24,190,12,0,1,0 
	ADD_ACTOR	ActSparkHeader,A_UP,7,	  0, 24, 20,12,0,1,0
	ADD_ACTOR	ActSparkHeader,A_UP,7,	 96, 24, 42,13,0,1,0
	ADD_ACTOR	ActSparkHeader,A_UP,7,	 64, 24, 60,16,0,1,0
	ADD_ACTOR	ActSparkHeader,A_UP,7,	156, 24,121,15,0,1,0
	ADD_ACTOR	ActSparkHeader,A_UP,7,	238, 24,165,14,0,1,0
	ADD_ACTOR	ActSparkHeader,A_UP,7,	128, 24, 20,12,0,1,0
	ADD_ACTOR	ActSparkHeader,A_UP,7,	196, 24, 60,14,0,1,0
#endif	
	WAIT		4
	WAIT_FLAG
	ADD_TASK	WazaTaskColorFade,PRI2,6,	0x03,-31,1,0,0,0x5bff
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,		4,4
	WAIT		4		@体当たりのﾙｰﾌﾟ回数と同じにしておくこと
	SEPLAY_PAN	SE_W063,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, 0,0,1,2
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,6,1
	WAIT_FLAG
	ADD_TASK	WazaTaskColorFade,PRI2,6,	0x04,-31,2,0,6,0x5bff
	SEQ_CALL	WEST_MahiKouka
	WAIT_FLAG
	SEQEND

@======================================================
@	メロメロ
@======================================================

WEST_Meromero:
	CHAR_SET	WAZACHR_ID_HEART3
	SE_REPEAT	SE_W204,WAZA_SE_L,12,3
	ADD_TASK	PokeSinMove,PRI5,5, 0,12,0x1000,4,0
	WAIT		15
	ADD_ACTOR	MeromeroHeader,D_UP+3,2, 20,-8
	WAIT_FLAG
	SEPLAY_PAN	SE_W213,WAZA_SE_R
	ADD_ACTOR	MeroHeartHeader,D_UP+3,2, 0x00a0,-32
	ADD_ACTOR	MeroHeartHeader,D_UP+3,2, -0x0100,-40
	ADD_ACTOR	MeroHeartHeader,D_UP+3,2, 0x0080,-16
	ADD_ACTOR	MeroHeartHeader,D_UP+3,2, 0x01a0,-38
	ADD_ACTOR	MeroHeartHeader,D_UP+3,2, -0x0080,-22
	ADD_ACTOR	MeroHeartHeader,D_UP+3,2, -0x0180,-31
	WAIT_FLAG
	SE_WAITPLAY		SE_W213B,0,15
	ADD_TASK	MeromeroHaikeiTask,PRI5,0
	ADD_ACTOR	HeartUpHeader,A_UP+40,3, 16,0x0100,0
	ADD_ACTOR	HeartUpHeader,A_UP+40,3, 224,0x00f0,15
	ADD_ACTOR	HeartUpHeader,A_UP+40,3, 126,0x0110,30
	ADD_ACTOR	HeartUpHeader,A_UP+40,3, 80,0x00e0,45
	ADD_ACTOR	HeartUpHeader,A_UP+40,3, 170,0x0110,60
	ADD_ACTOR	HeartUpHeader,A_UP+40,3, 40,0x0100,75
	ADD_ACTOR	HeartUpHeader,A_UP+40,3, 112,0x0100,90
	ADD_ACTOR	HeartUpHeader,A_UP+40,3, 200,0x0110,90
	WAIT		75
	ADD_TASK	WazaTaskColorFade,PRI2,6, 4,4,4,0,10,0x6f3f
	SEQEND

@======================================================
@	せいちょう
@======================================================
#define SEITYOU_AFF		(-3)
WEST_Seityou:
	SEQ_CALL	WEST_SeityouSub
	WAIT_FLAG
	SEQ_CALL	WEST_SeityouSub
	WAIT_FLAG
//	ADD_TASK	StatusEffectTask,PRI5,5, 0,5,0,0,0
	SEQEND

WEST_SeityouSub:
	ADD_TASK	WazaTaskColorFade,PRI2,6, 2,0,2,0,8,0x7fff
	SEPLAY_PAN	SE_W036,WAZA_SE_L
	ADD_TASK	PokeKakusyukuTask,PRI5,5, SEITYOU_AFF,SEITYOU_AFF,16 ,0,0
	END_CALL

@======================================================
@	ふきとばし
@======================================================
#define FUKITOBASI_WAIT		15
#define FUKITOBASI_KAITENSYNC	60
WEST_Hukitobasi:
	CHAR_SET	WAZACHR_ID_KAITEN
	ADD_ACTOR	ActKaitenHeader,A_UP+2,5, 0,-8, 1,FUKITOBASI_KAITENSYNC,0
	ADD_ACTOR	ActKaitenHeader,A_UP+2,5, 0,0, 1,FUKITOBASI_KAITENSYNC,1
	ADD_ACTOR	ActKaitenHeader,A_UP+2,5, 0,8, 1,FUKITOBASI_KAITENSYNC,2
	ADD_ACTOR	ActKaitenHeader,A_UP+2,5, 0,16, 1,FUKITOBASI_KAITENSYNC,3
	ADD_ACTOR	ActKaitenHeader,A_UP+2,5, 0,24, 1,FUKITOBASI_KAITENSYNC,4
	ADD_ACTOR	ActKaitenHeader,A_UP+2,5, 0,32, 1,FUKITOBASI_KAITENSYNC,0
	WAIT		5
	SE_REPEAT	SE_W104,WAZA_SE_R,10,4
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,4,0,FUKITOBASI_WAIT,1
	WAIT		FUKITOBASI_WAIT*2-1
	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5, 1,12,6, 1,5
	WAIT		7
	SEPLAY_PAN	SE_W081,WAZA_SE_R
	ADD_TASK	PokeNigeruMoveTask,PRI5,2, 1,8
	WAIT_FLAG
	SEQEND

@======================================================
@	あやしいひかり
@======================================================

WEST_AyasiiHikari:
	CHAR_SET	WAZACHR_ID_AYASIIHIKARI
	POKEBG		3
	HAIKEI_CHG		WAZAMAP_ID_GHOST
	HAIKEI_CHG_WAIT
//	SE_TASK		SeRepeatPanMove,7, SE_W109,WAZA_SE_L,WAZA_SE_R,3,2,0,40
	ADD_TASK	SePanFlowTask,PRI2,4, WAZA_SE_L,WAZA_SE_R, 2,0
	ADD_TASK	WazaChrColorFadeRepeat,PRI2,6, WAZACHR_ID_AYASIIHIKARI,0,6,0,14,0x15f
	ADD_ACTOR	AyasiiHikariHeader,D_UP+2,3, 28,0, 0x0120
	WAIT_FLAG
	BLDALPHA_SET	0x8,0x8
	SEPLAY_PAN	SE_W081B,WAZA_SE_R
	ADD_ACTOR	AyasiiHikari2Header,D_UP+2,2, 0,-16
	WAIT_FLAG
	WAIT		0
	BLDALPHA_RESET
	POKEBG_RESET	3
	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
	SEQEND

@======================================================
@	ロックオン
@======================================================

WEST_RockOn:
	CHAR_SET	WAZACHR_ID_ROCKON
	ADD_ACTOR	RockOnHeader,A_UP+40,0
	ADD_ACTOR	RockOn2Header,A_UP+40,1, 1
	ADD_ACTOR	RockOn2Header,A_UP+40,1, 2
	ADD_ACTOR	RockOn2Header,A_UP+40,1, 3
	ADD_ACTOR	RockOn2Header,A_UP+40,1, 4
	WAIT		120
	WORK_SET	7,0xffff	//照準点滅ﾌﾗｸﾞON
	WAIT_FLAG
	SEQEND

@======================================================
@	くろいまなざし
@======================================================

WEST_KuroiManazasi:
	CHAR_SET	WAZACHR_ID_MANAZASI
	POKEBG		3
	SEPLAY_PAN	SE_W060,WAZA_SE_L
//	HAIKEI_CHG	WAZAMAP_ID_UNEUNE	//chg_02.08.28_iwasawa
//	HAIKEI_HALF_WAIT
//	ADD_TASK	UneunePalAnmTask,PRI5,0
//	HAIKEI_CHG_WAIT
	ADD_ACTOR		ActFadeHeader,A_UP+2,5,	1,1,0,16,0x0000
	SE_REPEAT		SE_W109,WAZA_SE_R,15,4
	SE_WAITPLAY		SE_W043,WAZA_SE_R,85
	ADD_ACTOR	ActKuroiManazasiHeader,A_UP+2,0
	WAIT		120
	ADD_ACTOR		ActFadeHeader,A_UP+2,5,	1,2,16,0,0x0000
	WAIT		30
//	WAIT		120
//	WAIT		30	//WAIT命令はs8なので127以上のｳｪｲﾄは分けてる
	POKEBG_RESET	3
//	HAIKEI_RECOVER		//chg_02.08.28_iwasawa
//	HAIKEI_HALF_WAIT
//	WORK_SET	7,0xffff	//背景のパレットアニメ終了
//	HAIKEI_CHG_WAIT
	WAIT_FLAG
	SEQEND

@======================================================
@	いわおとし
@======================================================

WEST_IwaOtosi:
	CHAR_SET	WAZACHR_ID_IWA
	ADD_ACTOR	ActQuakeHeader,D_UP+2,4,6,1,15,1
	ADD_ACTOR	ActIwaOtosiHeader,D_UP+2,4, 0,1,0,0
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	WAIT		6
	ADD_ACTOR	ActIwaOtosiHeader,D_UP+2,4, 19,1,10,0
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	WAIT		6
	ADD_ACTOR	ActIwaOtosiHeader,D_UP+2,4, -23,2,-10,0
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,0,5,20,1
	WAIT		6
	ADD_ACTOR	ActIwaOtosiHeader,D_UP+2,4, -15,1,-10,0
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	WAIT		6
	ADD_ACTOR	ActIwaOtosiHeader,D_UP+2,4, 23,2,10,0
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	WAIT_FLAG
	SEQEND

@======================================================
@	いわなだれ
@======================================================

WEST_IwaNadare:
	CHAR_SET	WAZACHR_ID_IWA
	POKEBG		3
	ADD_ACTOR	ActQuakeHeader,A_UP+2,4,7,1,11,1
	ADD_ACTOR	ActIwaOtosiHeader,D_UP+2,4, -5,1,-5,1
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	WAIT		2
	ADD_ACTOR	ActIwaOtosiHeader,D_UP+2,4, 5,0,6,1
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	WAIT		2
	ADD_ACTOR	ActIwaOtosiHeader,D_UP+2,4, 19,1,10,1
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	WAIT		2
	ADD_ACTOR	ActIwaOtosiHeader,D_UP+2,4, -23,2,-10,1
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,0,5,50,1
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 3,0,5,50,1
	WAIT		2
	SEQ_CALL	WEST_IwaNadareSub
	SEQ_CALL	WEST_IwaNadareSub
	WAIT_FLAG
	POKEBG_RESET	3
	SEQEND

WEST_IwaNadareSub:
	ADD_ACTOR	ActIwaOtosiHeader,D_UP+2,4, -20,0,-10,1
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	WAIT		2
	ADD_ACTOR	ActIwaOtosiHeader,D_UP+2,4, 28,1,10,1
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	WAIT		2
	ADD_ACTOR	ActIwaOtosiHeader,D_UP+2,4, -10,1,-5,1
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	WAIT		2
	ADD_ACTOR	ActIwaOtosiHeader,D_UP+2,4, 10,0,6,1
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	WAIT		2
	ADD_ACTOR	ActIwaOtosiHeader,D_UP+2,4, 24,1,10,1
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	WAIT		2
	ADD_ACTOR	ActIwaOtosiHeader,D_UP+2,4, -32,2,-10,1
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	WAIT		2
	ADD_ACTOR	ActIwaOtosiHeader,D_UP+2,4, -20,0,-10,1
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	WAIT		2
	ADD_ACTOR	ActIwaOtosiHeader,D_UP+2,4, 30,2,10,1
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	WAIT		2
	END_CALL

@======================================================
@	どろぼう
@======================================================

WEST_Dorobou:
	CHAR_SET	WAZACHR_ID_HITMARK
//	CHAR_SET	WAZACHR_ID_FUKURO3
	POKEBG		1
	WAIT		1
	HAIKEI_CHG	WAZAMAP_ID_AKU
//	WAIT_FLAG
	HAIKEI_CHG_WAIT
	BLDALPHA_SET	0xc,0x8
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,6,4
	WAIT		6		@体当たりのﾙｰﾌﾟ回数と同じにしておくこと
	SEPLAY_PAN	SE_W233,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,2
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,1,0,8,1
//	ADD_ACTOR	ActHoshigaruFukuroHeader,A_UP+2,5, 0,-5,10, 2,-1
	WAIT_FLAG
	WAIT		20
	POKEBG_RESET	1
	BLDALPHA_RESET
	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
//	WAIT_FLAG
	SEQEND

@======================================================
@	バブルこうせん
@======================================================
#define BABURU_SEC_SP	0x0100
#define BABURU_SYNC		50
WEST_BaburuKousen:
	CHAR_SET	WAZACHR_ID_AWA
	CHAR_SET	WAZACHR_ID_MIZU2
	POKEBG		1
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	WAIT		1
	SEQ_CALL	WEST_BaburuKousenSub
	ADD_TASK	PokeSinMove,PRI5,5, 0,3,0x0c00,8,1
	SEQ_CALL	WEST_BaburuKousenSub
	SEQ_CALL	WEST_BaburuKousenSub
	WAIT_FLAG
	SEQ_CALL	WEST_MizuKouka
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

WEST_BaburuKousenSub:
	ADD_ACTOR	ActBaburuHeader,A_UP+2,7, 18,0, 35,70,0,BABURU_SEC_SP,BABURU_SYNC
	SEPLAY_PAN	SE_W145,WAZA_SE_L
	WAIT		3
	ADD_ACTOR	ActBaburuHeader,A_UP+2,7, 18,0, 20,40,-10,BABURU_SEC_SP,BABURU_SYNC
	SEPLAY_PAN	SE_W145,WAZA_SE_L
	WAIT		3
	ADD_ACTOR	ActBaburuHeader,A_UP+2,7, 18,0, 10,-60,0,BABURU_SEC_SP,BABURU_SYNC
	SEPLAY_PAN	SE_W145,WAZA_SE_L
	WAIT		3
	ADD_ACTOR	ActBaburuHeader,A_UP+2,7, 18,0, 15,-15,10,BABURU_SEC_SP,BABURU_SYNC
	SEPLAY_PAN	SE_W145,WAZA_SE_L
	WAIT		3
	ADD_ACTOR	ActBaburuHeader,A_UP+2,7, 18,0, 30,10,-10,BABURU_SEC_SP,BABURU_SYNC
	SEPLAY_PAN	SE_W145,WAZA_SE_L
	WAIT		3
	ADD_ACTOR	ActBaburuHeader,A_UP+2,7, 18,0, 25,-30,10,BABURU_SEC_SP,BABURU_SYNC
	SEPLAY_PAN	SE_W145,WAZA_SE_L
	WAIT		3
	END_CALL
	
@======================================================
@	こごえるかぜ
@======================================================
#define KOGOERU_WAIT	5
#define KOGOERU_SP	0x0048	//25
WEST_KogoeruKaze:
	CHAR_SET	WAZACHR_ID_YUKI2
	CHAR_SET	WAZACHR_ID_TURARA
	POKEBG		3
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x0B,4, 0,4,0x0000
	HAIKEI_CHG	WAZAMAP_ID_ICE	//
	HAIKEI_HALF_WAIT			//
	SEPLAY_PAN	SE_W196,0		//	add_02.08.30_iwasawa
	HAIKEI_CHG_WAIT				//---------------------------
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5,0x0B,1,0,3,0x0
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5,7,1,0,3,0x0
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5,7,1,0,4,0xffff
	WAIT_FLAG
	SEPAN_FLOW	SE_W016,WAZA_SE_L,WAZA_SE_R,2,0
	SEQ_CALL	WEST_KogoeruKazeSub
	WAIT		KOGOERU_WAIT
	SEQ_CALL	WEST_KogoeruKazeSub
	SEPLAY_PAN	SE_W016B,WAZA_SE_R
	WAIT		50+KOGOERU_WAIT
	SEQ_CALL	WEST_IceSpeedKouka2
	WAIT_FLAG
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5,0x0B,1,3,0,0x0
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5,7,1,3,0,0x0
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5,7,1,4,0,0xffff
//	WAIT_FLAG
	POKEBG_RESET	3
	HAIKEI_RECOVER
	HAIKEI_HALF_WAIT
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x0B,4, 4,0,0x0000
	HAIKEI_CHG_WAIT
	SEQEND

WEST_KogoeruKazeSub:
	ADD_ACTOR	ActKogoeruHeader,D_UP+40,6, 0,0,0,0,KOGOERU_SP,1
	WAIT		KOGOERU_WAIT
	ADD_ACTOR	ActKogoeruHeader,D_UP+40,6, 0,10,0,10,KOGOERU_SP,1
	WAIT		KOGOERU_WAIT
	ADD_ACTOR	ActKogoeruHeader,D_UP+40,6, 0,-10,0,-10,KOGOERU_SP,1
	WAIT		KOGOERU_WAIT
	ADD_ACTOR	ActKogoeruHeader,D_UP+40,6, 0,15,0,15,KOGOERU_SP,1
	WAIT		KOGOERU_WAIT
	ADD_ACTOR	ActKogoeruHeader,D_UP+40,6, 0,-5,0,-5,KOGOERU_SP,1
	END_CALL

@======================================================
@	えんまく
@======================================================

WEST_Enmaku:
	CHAR_SET	WAZACHR_ID_ENMAKU
	CHAR_SET	WAZACHR_ID_BOURU
	SEPLAY_PAN	SE_W104,WAZA_SE_L
	ADD_ACTOR	ActEnmakuBouruHeader,D_UP+2,6, 20,0, 0,0, 35, -25
	WAIT_FLAG
	ADD_TASK	WazaTaskSmokeSet,PRI2,0
	WAIT		2
	SEPLAY_PAN	SE_W028,WAZA_SE_R
	ADD_ACTOR	ActEnmakuHeader,D_UP+4,5, 0,-12, 0x0068,0, 75
	ADD_ACTOR	ActEnmakuHeader,D_UP+4,5, 0,-12, 0x0048,1, 75
	ADD_ACTOR	ActEnmakuHeader,D_UP+4,5, 0,-6, 0x0038,1,75
	ADD_ACTOR	ActEnmakuHeader,D_UP+4,5, 0,-6, 0x0058,0, 75
	ADD_ACTOR	ActEnmakuHeader,D_UP+4,5, 0,0, 0x0038,0, 75
	ADD_ACTOR	ActEnmakuHeader,D_UP+4,5, 0,0, 0x0058,1, 75
	ADD_ACTOR	ActEnmakuHeader,D_UP+4,5, 0,6, 0x0048,0, 75
	ADD_ACTOR	ActEnmakuHeader,D_UP+4,5, 0,6, 0x0068,1, 75
	ADD_ACTOR	ActEnmakuHeader,D_UP+4,5, 0,12, 0x0048,0, 75
	ADD_ACTOR	ActEnmakuHeader,D_UP+4,5, 0,12, 0x0038,1, 75
	ADD_ACTOR	ActEnmakuHeader,D_UP+4,5, 0,18, 0x0050,0, 75
	ADD_ACTOR	ActEnmakuHeader,D_UP+4,5, 0,18, 0x0048,1, 75
	WAIT_FLAG
	SEQEND

@======================================================
@	テクスチャー
@======================================================
#define TEXTYAR_WAIT	3
WEST_Textyar:
	CHAR_SET	WAZACHR_ID_TEXTYAR
	POKEBG		2
	BGPRI_GAPSET	BG_ATTACK
	BLDALPHA_SET	16,0
	WAIT		0
	SEPLAY_PAN	SE_W129,WAZA_SE_L
	ADD_ACTOR	TextyarHeader,A_UP+2,2, -24,-24
	WAIT		TEXTYAR_WAIT
	ADD_ACTOR	TextyarHeader,A_UP+2,2, -8,-24
	WAIT		TEXTYAR_WAIT
	ADD_ACTOR	TextyarHeader,A_UP+2,2, 8,-24
	WAIT		TEXTYAR_WAIT
	ADD_ACTOR	TextyarHeader,A_UP+2,2, 24,-24
	WAIT		TEXTYAR_WAIT

	SEPLAY_PAN	SE_W129,WAZA_SE_L
	ADD_ACTOR	TextyarHeader,A_UP+2,2, -24,-8
	WAIT		TEXTYAR_WAIT
	ADD_ACTOR	TextyarHeader,A_UP+2,2, -8,-8
	WAIT		TEXTYAR_WAIT
	ADD_ACTOR	TextyarHeader,A_UP+2,2, 8,-8
	WAIT		TEXTYAR_WAIT
	ADD_ACTOR	TextyarHeader,A_UP+2,2, 24,-8
	WAIT		TEXTYAR_WAIT

	SEPLAY_PAN	SE_W129,WAZA_SE_L
	ADD_ACTOR	TextyarHeader,A_UP+2,2, -24,8
	WAIT		TEXTYAR_WAIT
	ADD_ACTOR	TextyarHeader,A_UP+2,2, -8,8
	WAIT		TEXTYAR_WAIT
	ADD_ACTOR	TextyarHeader,A_UP+2,2, 8,8
	WAIT		TEXTYAR_WAIT
	ADD_ACTOR	TextyarHeader,A_UP+2,2, 24,8
	WAIT		TEXTYAR_WAIT

	SEPLAY_PAN	SE_W129,WAZA_SE_L
	ADD_ACTOR	TextyarHeader,A_UP+2,2, -24,24
	WAIT		TEXTYAR_WAIT
	ADD_ACTOR	TextyarHeader,A_UP+2,2, -8,24
	WAIT		TEXTYAR_WAIT
	ADD_ACTOR	TextyarHeader,A_UP+2,2, 8,24
	WAIT		TEXTYAR_WAIT
	ADD_ACTOR	TextyarHeader,A_UP+2,2, 24,24
	
	WAIT		20
	SEPLAY_PAN	SE_W112,WAZA_SE_L
//	ADD_TASK	WazaChrColorFadeRepeat,PRI2,6, WAZACHR_ID_TEXTYAR,0,2,0,10,0x37ff
	ADD_TASK	WazaTaskWazaChrFlash,PRI2,7, WAZACHR_ID_TEXTYAR,1,1,0x37ff,12,0x0,0
	WAIT		6
	ADD_TASK	TextyarBldTask,PRI5,0	//この中でWazaEffWork[7]に終了ｺｰﾄﾞをｾｯﾄしてる
	WAIT_FLAG
	WAIT		1
	POKEBG_RESET	2
	BLDALPHA_RESET
	SEQEND

@======================================================
@	テクスチャー2
@======================================================
#define TEX2_COMMON_WAIT	60
#define TEX2_WAIT			5
WEST_Textyar2:
	CHAR_SET	WAZACHR_ID_TEXTYAR
	POKEBG		3
	BGPRI_GAPSET3	BG_DEFENCE
	BLDALPHA_SET	0,16
	WAIT		0
	SEPLAY_PAN	SE_W112,WAZA_SE_R
	ADD_ACTOR	Textyar2Header,A_UP+2,3, -24,-24, TEX2_COMMON_WAIT+TEX2_WAIT*0
	ADD_ACTOR	Textyar2Header,A_UP+2,3, -8,-24, TEX2_COMMON_WAIT+TEX2_WAIT*1
	ADD_ACTOR	Textyar2Header,A_UP+2,3, 8,-24, TEX2_COMMON_WAIT+TEX2_WAIT*2
	ADD_ACTOR	Textyar2Header,A_UP+2,3, 24,-24, TEX2_COMMON_WAIT+TEX2_WAIT*3
	ADD_ACTOR	Textyar2Header,A_UP+2,3, -24,-8, TEX2_COMMON_WAIT+TEX2_WAIT*4
	ADD_ACTOR	Textyar2Header,A_UP+2,3, -8,-8, TEX2_COMMON_WAIT+TEX2_WAIT*5
	ADD_ACTOR	Textyar2Header,A_UP+2,3, 8,-8, TEX2_COMMON_WAIT+TEX2_WAIT*6
	ADD_ACTOR	Textyar2Header,A_UP+2,3, 24,-8, TEX2_COMMON_WAIT+TEX2_WAIT*7
	ADD_ACTOR	Textyar2Header,A_UP+2,3, -24,8, TEX2_COMMON_WAIT+TEX2_WAIT*8
	ADD_ACTOR	Textyar2Header,A_UP+2,3, -8,8, TEX2_COMMON_WAIT+TEX2_WAIT*9
	ADD_ACTOR	Textyar2Header,A_UP+2,3, 8,8, TEX2_COMMON_WAIT+TEX2_WAIT*10
	ADD_ACTOR	Textyar2Header,A_UP+2,3, 24,8, TEX2_COMMON_WAIT+TEX2_WAIT*11
	ADD_ACTOR	Textyar2Header,A_UP+2,3, -24,24, TEX2_COMMON_WAIT+TEX2_WAIT*12
	ADD_ACTOR	Textyar2Header,A_UP+2,3, -8,24, TEX2_COMMON_WAIT+TEX2_WAIT*13
	ADD_ACTOR	Textyar2Header,A_UP+2,3, 8,24, TEX2_COMMON_WAIT+TEX2_WAIT*14
	ADD_ACTOR	Textyar2Header,A_UP+2,3, 24,24, TEX2_COMMON_WAIT+TEX2_WAIT*15
	ADD_TASK	Textyar2BldControl,PRI5,0
	
	WAIT		TEX2_COMMON_WAIT+TEX2_WAIT*0
	SEPLAY_PAN	SE_W129,WAZA_SE_R
	WAIT		TEX2_WAIT*2
	SEPLAY_PAN	SE_W129,WAZA_SE_R
	WAIT		TEX2_WAIT*2
	SEPLAY_PAN	SE_W129,WAZA_SE_R
	WAIT		TEX2_WAIT*2
	SEPLAY_PAN	SE_W129,WAZA_SE_R
	WAIT		TEX2_WAIT*2
	SEPLAY_PAN	SE_W129,WAZA_SE_R
	WAIT		TEX2_WAIT*2
	SEPLAY_PAN	SE_W129,WAZA_SE_R
	WAIT		TEX2_WAIT*2
	SEPLAY_PAN	SE_W129,WAZA_SE_R
	WAIT		TEX2_WAIT*2
	SEPLAY_PAN	SE_W129,WAZA_SE_R

	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	27  まわしげり
@======================================================
WEST_MawasiGeri:
	CHAR_SET	WAZACHR_ID_KAKUTOU
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	BLDALPHA_SET	0xc,0x8

	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5, 0,18,6, 1,4
	SEPLAY_PAN	SE_W104, WAZA_SE_L
	WAIT		6
	SEPLAY_PAN	SE_W104, WAZA_SE_L
	WAIT_FLAG
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,20,0,0,4
	ADD_ACTOR	ActMawasiGeriHeader,A_UP+2,6, -24,0, 48, 10,0x00a0,0
	WAIT		5
	SEPLAY_PAN	SE_W233B, WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -8,0,1,2
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,5,0,6,1
	WAIT_FLAG
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,1,8

	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

@======================================================
@	29  ずつき
@======================================================
WEST_Zutuki:
	CHAR_SET	WAZACHR_ID_HITMARK
//	POKEBG		1	//PTA時に問題があるのでBG落しはやめた 2002.09.08(日)by matsuda
//	BLDALPHA_SET	0x0c, 0x08

	ADD_ACTOR	ActZutukiHeader,A_UP+2,1,0  @ 後ろに下げる＆頭を下げる
	SEPLAY_PAN	SE_W029, WAZA_SE_L,
	WAIT_FLAG
	WAIT		2
	ADD_ACTOR	ActZutukiHeader,A_UP+2,1,1  @ 前へ進める
	WAIT_FLAG
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 0,2,0,4,1
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,5,0,6,1
	ADD_ACTOR	ActZutukiHeader,A_UP+2,1,2  @ 頭を上げる
//	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4,0,0,1,1
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+3,4, 0,0,1,1
	SEPLAY_PAN	SE_W233B, WAZA_SE_R,

	WAIT_FLAG
//	POKEBG_RESET	1
//	BLDALPHA_RESET
	SEQEND

@======================================================
@	30  つのでつく
@======================================================
WEST_TunodeTuku:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_TUNO
//	POKEBG		1	//PTA時に問題があるのでBG落しはやめた 2002.09.08(日)by matsuda
//	BLDALPHA_SET	0x0c, 0x08

	ADD_ACTOR	ActZutukiHeader,A_UP+2,1,0  @ 後ろに下げる＆頭を下げる
	SEPLAY_PAN	SE_W029, WAZA_SE_L,
	WAIT_FLAG
	WAIT		2
	ADD_ACTOR	ActZutukiHeader,A_UP+2,1,1  @ 前へ進める
	ADD_ACTOR	ActTunoHeader,D_UP+4, 3, 0,0,10,
	WAIT_FLAG
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 0,2,0,4,1
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,5,0,6,1
	ADD_ACTOR	ActZutukiHeader,A_UP+2,1,2  @ 頭を上げる
//	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4,0,0,1,1
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+3,4, 0,0,1,1
	SEPLAY_PAN	SE_W030, WAZA_SE_R,

	WAIT_FLAG
//	POKEBG_RESET	1
//	BLDALPHA_RESET
	SEQEND

@======================================================
@	31  みだれづき
@======================================================
WEST_MidareDuki:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_TUNO
//	POKEBG		1	//PTA時に問題があるのでBG落しはやめた 2002.09.08(日)by matsuda
//	BGPRI_GAPSET	BG_DEFENCE
//	BLDALPHA_SET	0x0c, 0x08
	ADD_TASK	WazaPokeRollTask,PRI2,4, 4,256,0,2
	TURN_CHK	WEST_MidareDukiTurn0, WEST_MidareDukiTurn1,
WEST_MidareDukiRet:
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,5,0,6,1
	WAIT_FLAG
//	POKEBG_RESET	1
//	BLDALPHA_RESET
	SEQEND

WEST_MidareDukiTurn0:	@ 偶数ﾀｰﾝ
	ADD_ACTOR	ActTunoHeader,D_UP+4, 3, 8,8,10,
	WAIT_FLAG
//	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4,8,8,1,1
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+3,4, 0,0,1,1
	SEPLAY_PAN	SE_W030, WAZA_SE_R,

	SEQ_JP		WEST_MidareDukiRet
WEST_MidareDukiTurn1:	@ 奇数ﾀｰﾝ
	ADD_ACTOR	ActTunoHeader,D_UP+4, 3, -8,-8,10,
	WAIT_FLAG
//	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4,-8,-8,1,1
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+3,4, 0,0,1,1
	SEPLAY_PAN	SE_W030, WAZA_SE_R,

	SEQ_JP		WEST_MidareDukiRet

@======================================================
@	32  つのドリル
@======================================================
#define TUNODRILL_WAIT  (4)
WEST_TunoDrill:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_TUNO
//	POKEBG		1	//PTA時に問題があるのでBG落しはやめた 2002.09.08(日)by matsuda
//	BGPRI_GAPSET	BG_DEFENCE
	
	CONTEST_CHK_JP	WEST_TunoDrillHaikeiContest
	HAIKEI_CHG	WAZAMAP_ID_NANAME
	HAIKEI_HALF_WAIT
	ADD_TASK	HaikeiMapScrTask,PRI5,4, -0x0900,0x0300,1,0xffff
WEST_TunoDrillHaikeiReturn:
	HAIKEI_CHG_WAIT
/*
	HAIKEI_CHG	WAZAMAP_ID_NANAME
	HAIKEI_HALF_WAIT
	ADD_TASK	HaikeiMapScrTask,PRI5,4, -0x0900,0x0300,1,0xffff
	HAIKEI_CHG_WAIT
*/	
	BLDALPHA_SET	0x0c, 0x08
	ADD_ACTOR	ActZutukiHeader,A_UP+2,1,0  @ 後ろに下げる＆頭を下げる
	SEPLAY_PAN	SE_W029, WAZA_SE_L,
	WAIT_FLAG
	WAIT		2
	ADD_ACTOR	ActZutukiHeader,A_UP+2,1,1  @ 前へ進める
	ADD_ACTOR	ActTunoHeader,D_UP+4, 3, 0,0,12,
	WAIT_FLAG
	SE			SE_BAN
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 0,2,0,40,1
@	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,12,0,40,1
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 1,10,0,40,1

//	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4,0,0,1,3
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+3,4, 0,0,1,3
	SEPLAY_PAN	SE_W030, WAZA_SE_R,
	WAIT		TUNODRILL_WAIT
//	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4,0,2,1,3
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+3,4, 0,2,1,3
	SEPLAY_PAN	SE_W030, WAZA_SE_R,
	WAIT		TUNODRILL_WAIT
//	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4,-4,3,1,3
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+3,4, -4,3,1,3
	SEPLAY_PAN	SE_W030, WAZA_SE_R,
	WAIT		TUNODRILL_WAIT
//	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4,-8,-5,1,3
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+3,4, -8,-5,1,3
	SEPLAY_PAN	SE_W030, WAZA_SE_R,
	WAIT		TUNODRILL_WAIT
//	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4,4,-12,1,3
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+3,4, 4,-12,1,3
	SEPLAY_PAN	SE_W030, WAZA_SE_R,
	WAIT		TUNODRILL_WAIT
//	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4,16,0,1,3
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+3,4, 16,0,1,3
	SEPLAY_PAN	SE_W030, WAZA_SE_R,
	WAIT		TUNODRILL_WAIT
//	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4,5,18,1,2
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+3,4, 5,18,1,3
	SEPLAY_PAN	SE_W030, WAZA_SE_R,
	WAIT		TUNODRILL_WAIT
//	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4,-17,12,1,2
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+3,4, -17,12,1,2
	SEPLAY_PAN	SE_W030, WAZA_SE_R,
	WAIT		TUNODRILL_WAIT
//	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4,-21,-15,1,2
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+3,4, -21,-15,1,2
	SEPLAY_PAN	SE_W030, WAZA_SE_R,
	WAIT		TUNODRILL_WAIT
//	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4,8,-27,1,2
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+3,4, 8,-27,1,2
	SEPLAY_PAN	SE_W030, WAZA_SE_R,
	WAIT		TUNODRILL_WAIT
//	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4,32,0,1,2
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+3,4, 32,0,1,2
	SEPLAY_PAN	SE_W030, WAZA_SE_R,
	WAIT		TUNODRILL_WAIT

	ADD_ACTOR	ActZutukiHeader,A_UP+2,1,2  @ 頭を上げる

	WAIT_FLAG
//	POKEBG_RESET	1
//	BLDALPHA_RESET

	HAIKEI_RECOVER
	HAIKEI_HALF_WAIT
	WORK_SET	7,0xffff	//背景のｽｸﾛｰﾙ終了
	HAIKEI_CHG_WAIT

	SEQEND

WEST_TunoDrillHaikeiContest:
	HAIKEI_CHG	WAZAMAP_ID_NANAME2
	HAIKEI_HALF_WAIT
	ADD_TASK	HaikeiMapScrTask,PRI5,4, 0x0900,0x0300,0,0xffff
	SEQ_JP		WEST_TunoDrillHaikeiReturn

@======================================================
@	37  あばれる
@======================================================
WEST_Abareru:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_KAKUTOU

	ADD_TASK	TaskAbareruAffine, PRI2, 0,
	ADD_TASK	TaskAbareruMove, PRI2, 0,

	ADD_ACTOR	RandomKakutouMarkHeader, D_UP+3, 3, 1,10,0,
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 1,4,0,7,1
	SEPLAY_PAN	SE_W004, WAZA_SE_R,
	WAIT		28

	ADD_ACTOR	RandomKakutouMarkHeader, D_UP+3, 3, 1,10,1,
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 1,4,0,7,1
	SEPLAY_PAN	SE_W233B, WAZA_SE_R,
	WAIT		28

	ADD_ACTOR	RandomKakutouMarkHeader, D_UP+3, 3, 1,10,3,
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 1,8,0,16,1
	SEPLAY_PAN	SE_W025B, WAZA_SE_R,

	SEQEND

@======================================================
@	47 うたう
@======================================================
WEST_Utau:
	CHAR_SET	WAZACHR_ID_ONPU

	POKEBG		3	@ ｷｬﾗ欠け対策

	ADD_TASK	TaskUtauPalReg, PRI2, 0,
	WAIT_FLAG

	SEPAN_FLOW	SE_W047,WAZA_SE_L,WAZA_SE_R,2,0

	ADD_ACTOR	ActUtauHeader,D_UP+2,3,7,0,12
	WAIT		5
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,6,1,12
	WAIT		5
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,1,2,12
	WAIT		5
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,2,3,12
	WAIT		5
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,3,0,12
	WAIT		4
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,2,1,12
	WAIT		4
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,5,2,12
	WAIT		4
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,6,3,12
	WAIT		4
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,2,0,12
	WAIT		4
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,2,1,12
	WAIT		4
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,1,2,12
	WAIT		4
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,5,3,12
	WAIT		4
	WAIT_FLAG

	POKEBG_RESET	3

	ADD_TASK	TaskUtauPalDel, PRI2, 0,
	WAIT_FLAG

	SEQEND

@======================================================
@	67  けたぐり
@======================================================
WEST_Ketaguri:
	CHAR_SET	WAZACHR_ID_KAKUTOU
	CHAR_SET	WAZACHR_ID_HITMARK

	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,20,0,0,4
	ADD_ACTOR	ActMawasiGeriHeader,D_UP+2,6, -24,28,40,8,0x00a0,0
	WAIT		4
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, -8,8,1,2
	ADD_TASK	WazaPokeRollTask,PRI2,4, 6,384,1,2
	SEPLAY_PAN	SE_W233B, WAZA_SE_R

	WAIT_FLAG
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,1,4

	SEQEND

@======================================================
@	89  じしん
@======================================================
WEST_Jisin:
	ADD_TASK	TaskQuake,PRI5,  3,5,10,50,
	ADD_TASK	TaskQuake,PRI5,  3,4,10,50,
	SEPLAY_PAN	SE_W089,0
	WAIT	10
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 1,3,1,0x0000,14,0x7fff,14
	WAIT	16
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 1,3,1,0x0000,14,0x7fff,14
	SEQEND

@======================================================
@	90  じわれ
@======================================================
WEST_Ziware:
	CHAR_SET		WAZACHR_ID_SUNA

	ADD_TASK	TaskQuake,PRI3,  3,5,10,50,
	ADD_TASK	TaskQuake,PRI3,  3,1,10,50,
	SEPLAY_PAN	SE_W089,WAZA_SE_R

	WAIT		8
	SEQ_CALL	WEST_JiwareSub
	WAIT		15
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 1,3,1,0x0000,14,0x7fff,14
	WAIT		15
	SEQ_CALL	WEST_JiwareSub2
	WAIT		15
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 1,3,1,0x0000,14,0x7fff,14
	WAIT		15
	SEQ_CALL	WEST_JiwareSub

	WAIT		50

	HAIKEI_CHG	WAZAMAP_ID_ZIWARE
	HAIKEI_HALF_WAIT
	ADD_TASK	TaskZiwareHaikeiPosSet,PRI5,3, 1,PRI5,0xffff
	HAIKEI_CHG_WAIT

	WAIT		40

	HAIKEI_RECOVER
	HAIKEI_HALF_WAIT
	WORK_SET	7,0xffff	// 背景のｵﾌｾｯﾄを元に戻す
	HAIKEI_CHG_WAIT

	SEQEND

WEST_JiwareSub:
	ADD_ACTOR	ActAnaWoHoruHeader, D_UP+2, 6, 1,0,12,-48,-16,24,
	ADD_ACTOR	ActAnaWoHoruHeader, D_UP+2, 6, 1,0,16,-16,-10,24,
	ADD_ACTOR	ActAnaWoHoruHeader, D_UP+2, 6, 1,1,14,-52,-18,24,
	ADD_ACTOR	ActAnaWoHoruHeader, D_UP+2, 6, 1,1,12,-32,-16,24,
	SEPLAY_PAN	SE_W091,WAZA_SE_R
	END_CALL

WEST_JiwareSub2:
	ADD_ACTOR	ActAnaWoHoruHeader, D_UP+2, 6, 1,0,12,-24,-16,24,
	ADD_ACTOR	ActAnaWoHoruHeader, D_UP+2, 6, 1,0,16,-38,-10,24,
	ADD_ACTOR	ActAnaWoHoruHeader, D_UP+2, 6, 1,1,14,-20,-18,24,
	ADD_ACTOR	ActAnaWoHoruHeader, D_UP+2, 6, 1,1,12,-36,-16,24,
	SEPLAY_PAN	SE_W091,WAZA_SE_R
	END_CALL


@======================================================
@	91  あなをほる
@======================================================
#define ANAWOHORU_WAIT  (32)

WEST_AnaWoHoru:
	TURN_CHK	WEST_AnaWoHoru1st, WEST_AnaWoHoru2nd,
WEST_AnaWoHoruRet:
	SEQEND

WEST_AnaWoHoru1st:
	CHAR_SET		WAZACHR_ID_SUNA
	CHAR_SET		WAZACHR_ID_KAKUSHI
	ADD_ACTOR		KakushiHeader,A_UP+1,3, 0,0,180
	ADD_ACTOR		KakushiHeader,A_UP+1,3, 0,1,180
	POKEBG_DROP		0
	WAIT			1
	ADD_TASK		TaskAnaWoHoru,PRI2,1,0,
	WAIT			6
	SEQ_CALL		WEST_AnaWoHoruSub
	SEQ_CALL		WEST_AnaWoHoruSub
	SEQ_CALL		WEST_AnaWoHoruSub
	SEQ_CALL		WEST_AnaWoHoruSub
	SEQ_CALL		WEST_AnaWoHoruSub
@	SEQ_CALL		WEST_AnaWoHoruSub
@	SEQ_CALL		WEST_AnaWoHoruSub
@	SEQ_CALL		WEST_AnaWoHoruSub
	WAIT_FLAG
	POKEBG_DROP_RESET	0
	WAIT			1
	ADD_TASK		TaskAnaWoHoru,PRI2,1,1,
	SEQ_JP			WEST_AnaWoHoruRet

WEST_AnaWoHoru2nd:
	CHAR_SET		WAZACHR_ID_HITMARK
	CHAR_SET		WAZACHR_ID_KAKUSHI

	ADD_TASK		TaskAnaWoHoru2nd,PRI2,1,0
	WAIT_FLAG
	POKEBG		0
	ADD_ACTOR		KakushiHeader,A_UP+1,3, 0,0,48
	ADD_ACTOR		KakushiHeader,A_UP+1,3, 0,1,48
	WAIT			1
	ADD_TASK		TaskAnaWoHoru2nd,PRI2,1,1
	WAIT			16
	ADD_ACTOR		ActHitMarkHeader,A_UP+2,4, -8,0,1,2
	ADD_TASK		TaskPokeBuruburu,PRI2,5, 1,5,0,6,1
	SEPLAY_PAN		SE_W025B, WAZA_SE_L
	POKEBG_RESET	0
	SEQ_JP			WEST_AnaWoHoruRet

WEST_AnaWoHoruSub: // 自分、方向、左右、上
	ADD_ACTOR	ActAnaWoHoruHeader, A_UP+2, 6, 0,0,12,4,-16,18,
	ADD_ACTOR	ActAnaWoHoruHeader, A_UP+2, 6, 0,0,16,4,-10,18,
	ADD_ACTOR	ActAnaWoHoruHeader, A_UP+2, 6, 0,1,14,4,-18,18,
	ADD_ACTOR	ActAnaWoHoruHeader, A_UP+2, 6, 0,1,12,4,-16,18,
	SEPLAY_PAN	SE_W091, WAZA_SE_L
	WAIT		ANAWOHORU_WAIT
	END_CALL

@======================================================
@	96  ヨガのポーズ
@======================================================
WEST_YogaNoPose:
	SEQ_CALL	WEST_ESP_MAPCHG
	ADD_TASK	TaskYogaNoPose,PRI2,0
	SEPLAY_PAN	SE_W029,WAZA_SE_L,
	WAIT		16
	SEPLAY_PAN	SE_W036,WAZA_SE_L,
	WAIT_FLAG
//	ADD_TASK	StatusEffectTask,PRI5,5, 0,0,0,0,0
//	WAIT_FLAG
	SEQ_CALL	WEST_ESP_MAPEND
	SEQEND

@======================================================
@	97  こうそくいどう
@======================================================
#define KOUSOKUIDOU_SE_WAIT  (12)
WEST_KousokuIdou:
	POKEBG			2
	BLDALPHA_SET	0xc,0x8

	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5, 0,24,6, 4,4
	ADD_TASK	TaskPokeZanzou, PRI2,4,0,4,7,10
	SEPLAY_PAN	SE_W104, WAZA_SE_L
	WAIT		KOUSOKUIDOU_SE_WAIT
	SEPLAY_PAN	SE_W104, WAZA_SE_L
	WAIT		KOUSOKUIDOU_SE_WAIT
	SEPLAY_PAN	SE_W104, WAZA_SE_L
	WAIT		KOUSOKUIDOU_SE_WAIT
	SEPLAY_PAN	SE_W104, WAZA_SE_L
	WAIT		KOUSOKUIDOU_SE_WAIT
	SEPLAY_PAN	SE_W104, WAZA_SE_L
	WAIT		KOUSOKUIDOU_SE_WAIT
	WAIT_FLAG

	POKEBG_RESET	2
	BLDALPHA_RESET
	WAIT		1

//	ADD_TASK	StatusEffectTask,PRI5,5, 0,3,0,0,1

	SEQEND

@======================================================
@	98  でんこうせっか
@======================================================
WEST_DenkouSekka:
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG			2
	BLDALPHA_SET	0xc,0x8

	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5, 0,24,6, 1,5
	ADD_TASK	TaskPokeZanzou, PRI2,4,0,4,7,3
	SEPLAY_PAN	SE_W026, WAZA_SE_L,
	WAIT		4
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,5,0,6,1
	ADD_ACTOR	ActHitMarkHeader,D_UP+4,4,0,0,1,1
	SEPLAY_PAN	SE_W233B, WAZA_SE_R,
	WAIT_FLAG

	POKEBG_RESET	2
	BLDALPHA_RESET
	WAIT_FLAG
	SEQEND

@======================================================
@	99  いかり
@======================================================
WEST_Ikari:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_IKARI
	POKEBG		1
	BLDALPHA_SET	0xc,0x8

	ADD_TASK	TaskPokeFadeCtrl, PRI3, 5, 0,0x001f,10,0,2,
	ADD_ACTOR	ActIbaruIkariHeader,PRI2,3,0,-20,-28,
	SEPLAY_PAN	SE_W207B,WAZA_SE_L,
	WAIT		20
	ADD_ACTOR	ActIbaruIkariHeader,PRI2,3,0,20,-28,
	SEPLAY_PAN	SE_W207B,WAZA_SE_L,
	WAIT_FLAG
	ADD_ACTOR	ActTaiatariHeader,PRI2,2,4,6
	WAIT		4
	ADD_ACTOR	ActHitMarkHeader,PRI2,4, 0,0,1,2
	ADD_TASK	TaskPokeDamageYure, PRI2, 5, 1,1,10,1,0,
	SEPLAY_PAN	SE_W233B,WAZA_SE_R,
	WAIT_FLAG
	POKEBG_RESET	1
	SEQEND

@======================================================
@	100  テレポート
@======================================================
WEST_Teleport:
	SEQ_CALL	WEST_ESP_MAPCHG

	ADD_TASK	TaskTeleport,PRI2,0
	SEPLAY_PAN	SE_W100,WAZA_SE_L,
	WAIT		15
	SEQ_CALL	WEST_ESP_MAPEND
	WAIT_FLAG
	SEQEND

@======================================================
@	104  かげぶんしん
@======================================================
WEST_KageBunsin:
	POKEBG			2
	BLDALPHA_SET	0xc,0x8
	ADD_TASK	TaskKageBunsin,PRI2,0,
	SEPLAY_PAN	SE_W104, WAZA_SE_L
	WAIT		32
	SEPLAY_PAN	SE_W104, WAZA_SE_L
	WAIT		24
	SEPLAY_PAN	SE_W104, WAZA_SE_L
	WAIT		16
	SEPLAY_PAN	SE_W104, WAZA_SE_L
	WAIT		8
	SEPLAY_PAN	SE_W104, WAZA_SE_L
	WAIT		8
	SEPLAY_PAN	SE_W104, WAZA_SE_L
	WAIT		8
	SEPLAY_PAN	SE_W104, WAZA_SE_L
	WAIT		8
	SEPLAY_PAN	SE_W104, WAZA_SE_L
	WAIT		8
	SEPLAY_PAN	SE_W104, WAZA_SE_L
	WAIT_FLAG
	POKEBG_RESET	2
	BLDALPHA_RESET
	WAIT		1

//	ADD_TASK	StatusEffectTask,PRI5,5, 0,4,0,0,0

	SEQEND

@======================================================
@	107  ちいさくなる
@======================================================
WEST_TiisakuNaru:
	BLDALPHA_SET	0xa,0x8
	ADD_TASK		TaskTiisakuNaru,PRI2,0,
	SE_REPEAT		SE_W107,WAZA_SE_L,34,3,
	WAIT_FLAG
	BLDALPHA_RESET
//	ADD_TASK	StatusEffectTask,PRI5,5, 0,4,0,0,0
	SEQEND

@======================================================
@	118  ゆびをふる
@======================================================
WEST_YubiwoFuru:
	CHAR_SET	WAZACHR_ID_YUBI
	CHAR_SET	WAZACHR_ID_FUKIDASI

	ADD_ACTOR	ActFukidashiHeader, A_UP+11, 2, 0,100,
	SEPLAY_PAN	SE_W118, WAZA_SE_L,
	WAIT		6	@ フキダシ出現までのウェイト
	ADD_ACTOR	ActYubiWoFuruHeader, A_UP+12, 1, 0,
	WAIT		24  @ 指を振り始めるまでのウェイト
	SE_REPEAT	SE_W039, WAZA_SE_L, 22, 3,
	WAIT_FLAG
	SEQEND

@======================================================
@	130  ロケットずつき
@======================================================
WEST_RocketZutuki:
	TURN_CHK	WEST_RocketZutuki1st, WEST_RocketZutuki2nd,
WEST_RocketZutukiRet:
	SEQEND

@ 1ﾀｰﾝ目
WEST_RocketZutuki1st:
	SEQ_CALL	WEST_RocketJosou
	SEQ_CALL	WEST_RocketJosou
//	ADD_TASK	StatusEffectTask,PRI5,5, 0,1,0,0,0
	WAIT_FLAG
	SEQ_JP		WEST_RocketZutukiRet

WEST_RocketJosou:
	ADD_ACTOR	ActPokeStraightMove2Header,A_UP+2,6, 0,-24,0,0,10,0
	SEPLAY_PAN	SE_W036, WAZA_SE_L,
	WAIT_FLAG
	ADD_TASK	WazaPokeRollTask,PRI2,4, 16,96,0,2
	WAIT_FLAG
	ADD_ACTOR	ActPokeStraightMove2Header,A_UP+2,6, 0,24,0,0,10,1
	WAIT_FLAG
	END_CALL

@ 2ﾀｰﾝ目
WEST_RocketZutuki2nd:
	CHAR_SET	WAZACHR_ID_HITMARK
//	POKEBG		1
//	BLDALPHA_SET	0x0c, 0x08
	ADD_TASK	TaskRocketZutuki,PRI2,1,0
	SEPLAY_PAN	SE_W036, WAZA_SE_L,
	WAIT_FLAG
	SE			SE_BAN
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 1,3,1,0x0000,14,0x7fff,14
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 0,2,0,40,1
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 1,10,0,40,1
//	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4,0,0,1,0
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+4,4,0,0,1,0
	SE_REPEAT	SE_W025B, WAZA_SE_R, 8, 3,
	WAIT_FLAG
	ADD_TASK	TaskRocketZutuki,PRI2,1,1
//	POKEBG_RESET	1
//	BLDALPHA_RESET
	SEQ_JP	WEST_RocketZutukiRet

@======================================================
@	133  ドわすれ
@======================================================
WEST_Dowasure:
	CHAR_SET	WAZACHR_ID_HATENA

	SEQ_CALL	WEST_ESP_MAPCHG
	WAIT		8
	ADD_ACTOR	ActDoWasureHeader,A_UP+20,0,
	SEPLAY_PAN	SE_W118, WAZA_SE_L,
	WAIT		54   @ ？マークを振り始めるまでのウェイト
	SE_REPEAT	SE_W118, WAZA_SE_L, 16, 3,
	WAIT_FLAG
//	ADD_TASK	StatusEffectTask,PRI5,5, 0,6,0,0,1
//	WAIT_FLAG
	SEQ_CALL	WEST_ESP_MAPEND
//	WAIT_FLAG
	SEQEND

@======================================================
@	134  スプーンまげ
@======================================================
WEST_SpoonMage:
	CHAR_SET	WAZACHR_ID_GANARI
	CHAR_SET	WAZACHR_ID_SPOON

	SEPLAY_PAN	SE_W060,WAZA_SE_L,
	SEQ_CALL	WEST_ESP_MAPCHG

	ADD_ACTOR	ActSpoonHeader, A_UP+20, 0,
	ADD_ACTOR	ActGanariHeader,A_UP+19,3, 32,-8,0
	ADD_ACTOR	ActGanariHeader,A_UP+19,3, 32,16,1
	SE_REPEAT	SE_W109,WAZA_SE_L,21,2,
	WAIT		60
	SEPLAY_PAN	SE_W146,WAZA_SE_L,
	WAIT		30
	SE_REPEAT	SE_W146,WAZA_SE_L,20,2,
	WAIT		70
	SEPLAY_PAN	SE_W207B,WAZA_SE_L,
	WAIT_FLAG

//	ADD_TASK	StatusEffectTask,PRI5,5,  1,2,1,0,0
//	WAIT_FLAG
	SEQ_CALL	WEST_ESP_MAPEND
	SEQEND

@======================================================
@	137  へびにらみ
@======================================================
WEST_HebiNirami:
	CHAR_SET	WAZACHR_ID_SHISEN
	CHAR_SET	WAZACHR_ID_KIRARI

	ADD_TASK	TaskHebiNirami, PRI5, 1, 0,
	SEPLAY_PAN	SE_W060B, WAZA_SE_L,
	WAIT_FLAG

@	HAIKEI_CHG	WAZAMAP_ID_KOWAIKAO
@	HAIKEI_HALF_WAIT
	ADD_TASK	ColorFadeSeq,PRI5,5, 1,0,0,16,0x0000

	WAIT_FLAG
	ADD_ACTOR	KirariActHeader,A_UP+0,2,-16,-8
	ADD_ACTOR	KirariActHeader,A_UP+0,2, 16,-8
@	HAIKEI_CHG_WAIT
	ADD_TASK	KowaikaoHaikeiTask,PRI5,0
	SEPLAY_PAN	SE_W043, WAZA_SE_L,
	WAIT		2
//	HAIKEI_RECOVER
//	HAIKEI_CHG_WAIT

	ADD_TASK	TaskPokeYure,PRI3,3,20,1,0,1

	WAIT_FLAG
	ADD_TASK	ColorFadeSeq,PRI5,5, 1,0,16,0,0x0000

	SEQEND

@======================================================
@	140  たまなげ
@======================================================
WEST_Tamanage:
	CHAR_SET	WAZACHR_ID_TAMANAGE
	ADD_TASK	TaskTamanage,PRI3,0,
	SEPLAY_PAN	SE_W207,WAZA_SE_L,
	WAIT		24
	ADD_ACTOR	ActQuakeHeader,A_UP+2,4,8,1,40,1,
	ADD_TASK	TaskPokeBuruburu,PRI3,5, 1,0,4,20,1,
	ADD_TASK	TaskPokeBuruburu,PRI3,5, 3,0,4,20,1,
	SE_REPEAT	SE_W070,WAZA_SE_R,8,2,

	SEQEND

@======================================================
@	143  ゴッドバード
@======================================================
WEST_GodBird:
	TURN_CHK	WEST_GodBird1st, WEST_GodBird2nd,
WEST_GodBirdReturn:
	SEQEND

WEST_GodBird1st:
//	CHAR_SET	WAZACHR_ID_JUUDEN2

	POKEBG	3
	BLDALPHA_SET	0x0c,0x0b

	ADD_TASK	TaskPartyAttackChk,PRI5,1,7,
	WORKCHK_JP	7,0,WEST_GodBird1stEnemy
	SEQ_JP		WEST_GodBird1stMine

// 1ﾀｰﾝ目（敵へ）
WEST_GodBird1stEnemy:
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x1b,1,0,12,0x0000
	WAIT_FLAG
	WAIT		12
//	ADD_ACTOR	GodBirdLightHeader,D_UP+2,0,
//	SE_REPEAT	SE_W043,WAZA_SE_R,8,6,
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x02,1,8,0,0x0000
	ADD_TASK	TaskQuake,PRI5,  3,0,2,16,
	SE_REPEAT	SE_W287,WAZA_SE_L,
	WAIT		8
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x02,1,0,15,0x7fff
	WAIT		20
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x02,1,15,0,0x7fff
	WAIT_FLAG
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x19,1,8,0,0x0000
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQ_JP	WEST_GodBirdReturn

// 1ﾀｰﾝ目（味方へ）
WEST_GodBird1stMine:
	ADD_TASK	ExceptColorFadeSeq,PRI10,5, 1,1,0,12,0x0000
	WAIT_FLAG
//	ADD_ACTOR	GodBirdLightHeader,D_UP+2,0,
//	SE_REPEAT	SE_W043,WAZA_SE_R,8,6,
	WAIT		12
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x02,1,8,0,0x0000
	ADD_TASK	TaskQuake,PRI5,  3,0,2,16,
	SEPLAY_PAN	SE_W287,WAZA_SE_L,
	WAIT		8
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x02,1,0,15,0x7fff
	WAIT		20
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x02,1,15,0,0x7fff
	WAIT_FLAG
//	ADD_TASK	ColorFadeSeq,PRI10,5, 0x1d,1,8,0,0x0000
	ADD_TASK	ExceptColorFadeSeq,PRI10,5, 4,1,8,0,0x0000
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQ_JP	WEST_GodBirdReturn

// 2ﾀｰﾝ目（攻撃
WEST_GodBird2nd:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_GODBIRD

	SEQ_CALL	WEST_KAZE_MAPCHG

	POKEBG		0
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x02,0,0,16,0x7fff
	WAIT		4
	ADD_TASK	WazaTaskPokeToumeiExe,PRI5,1,0,
//	ADD_TASK	TaskGodBirdAttack,PRI5,1,0,
	WAIT_FLAG
	ADD_TASK	SePlayCh2Task,PRI5,2, SE_W327,WAZA_SE_L,
	ADD_ACTOR	GodBirdHeader,D_UP+2,0,
	WAIT		14
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,10,0,18,1
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W025B,WAZA_SE_R,

	WAIT  20

	ADD_TASK	WazaTaskPokeToumeiRecovery,PRI5,1,1,
	WAIT		2
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x02,0,15,0,0x7fff

//	ADD_TASK	TaskGodBirdAttack,PRI5,1,1,
//	WAIT_FLAG
	WAIT_FLAG
	POKEBG_RESET	0

	SEQ_CALL	WEST_KAZE_MAPEND

	SEQ_JP	WEST_GodBirdReturn

@======================================================
@	148  フラッシュ
@======================================================
WEST_Flash:
	SEPLAY_PAN	SE_W043, WAZA_SE_L,

	ADD_TASK	TaskFlash, PRI2, 0,
	WAIT_FLAG

//	ADD_TASK	StatusEffectTask,PRI5,5, 1,2,1,0,0

	SEQEND

@======================================================
@	150  はねる
@======================================================
WEST_Haneru:
	ADD_TASK	TaskHaneru,PRI2,2,0,3,
	WAIT		8
	SE_REPEAT	SE_W039,WAZA_SE_L,38,3,
	WAIT_FLAG
	SEQEND

@======================================================
@	151  とける
@======================================================
WEST_Tokeru:
	POKEBG		0
	BLDALPHA_SET	0x0f,0x00
	ADD_TASK	TaskTokeru, PRI2, 1, 0,
	SEPLAY_PAN	SE_W151,WAZA_SE_L,
	WAIT_FLAG
	BLDALPHA_RESET
	POKEBG_RESET	0
	WAIT		1
//	ADD_TASK	StatusEffectTask,PRI5,5, 0,1,0,0,1
	SEQEND

@======================================================
@	159  かくばる
@======================================================
WEST_Kakubaru:
	CHAR_SET	WAZACHR_ID_KAKUBARU
	ADD_ACTOR	ActKakubaruHeader, A_UP+2, 0,
	WAIT_FLAG
//	ADD_TASK	StatusEffectTask,PRI5,5, 0,0,0,0,0
	SEQEND

@======================================================
@	162  いかりのまえば
@======================================================
WEST_IkariNoMaeba:
	CHAR_SET	WAZACHR_ID_HAGATA
	ADD_TASK	TaskPokeCenterBuru2, PRI2, 5, 0,1,0,20,1,
	SEPLAY_PAN	SE_W082, WAZA_SE_L,
	WAIT_FLAG
	ADD_TASK	TaskPokeCenterBuru2, PRI2, 5, 0,3,0,48,1,
	ADD_TASK	TaskPokeFadeCtrl, PRI2, 5, 0,0x04df,12,4,1,
	WAIT_FLAG
	WAIT		20
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,4,4
	WAIT		4
	ADD_ACTOR	ActIkariMaebaHeader, D_UP+2, 0,
	SEPLAY_PAN	SE_W044, WAZA_SE_R,
	WAIT		8
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 1,3,1,0x085f,14,0x7fff,14
	ADD_TASK	TaskPokeBuruburu, PRI2, 5, 1,0,7,12,1,
	WAIT_FLAG
	BLDALPHA_RESET
	SEQEND

@======================================================
@	163  きりさく
@======================================================
WEST_Kirisaku:
	CHAR_SET	WAZACHR_ID_KIRISAKI
	ADD_ACTOR	KirisakuHeader,D_UP+2,3,1,-8,0,
	SEPLAY_PAN	SE_W013, WAZA_SE_R
	WAIT		4
	ADD_ACTOR	KirisakuHeader,D_UP+2,3,1,8,0,
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,4,0,18,1
	SEPLAY_PAN	SE_W013, WAZA_SE_R
	WAIT_FLAG
	SEQEND

@======================================================
@	165  わるあがき
@======================================================
WEST_Waruagaki:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_AGAKI
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 0,3,0,12,4
	ADD_ACTOR	AgakiHeader, A_UP+2, 3, 0,0,2,
	ADD_ACTOR	AgakiHeader, A_UP+2, 3, 0,1,2,
	SE_REPEAT	SE_W029,WAZA_SE_L,12,4,
	WAIT_FLAG
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,2
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 1,3,0,6,1
	SEPLAY_PAN	SE_W025B, WAZA_SE_R,
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

@======================================================
@	166  スケッチ
@======================================================
WEST_Suketi:
	CHAR_SET	WAZACHR_ID_PEN
	POKEBG		1

	ADD_TASK	TaskSketch, PRI2, 0,
	ADD_ACTOR	ActSketchHeader,D_UP+2,0,
//	WAIT		37
//	SE_REPEAT	SE_W166,WAZA_SE_R,43,6,

	WAIT_FLAG

	POKEBG_RESET	1

	ADD_TASK	TaskHaneru,PRI2,2,0,2,
	SE_REPEAT	SE_W039,WAZA_SE_L,38,2,

	SEQEND

@======================================================
@	171  あくむ
@======================================================
WEST_Akumu:
	HAIKEI_CHG		WAZAMAP_ID_GHOST
	HAIKEI_CHG_WAIT

	CONTEST_CHK_JP	WEST_AkumuContest

	POKEBG			3
	ADD_TASK	TaskAkumu,PRI2,0,
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,40,1
	SEPLAY_PAN	SE_W171, WAZA_SE_R
	WAIT_FLAG
	POKEBG_RESET	3
	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
	SEQEND

WEST_AkumuContest:
	ADD_TASK	TaskPokeFadeCtrl,PRI2,5,  0,0x7fff,10,2,1,
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 0,3,0,32,1
	SEPLAY_PAN	SE_W171, WAZA_SE_R
	WAIT_FLAG
	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
	SEQEND

@======================================================
@	175  じたばた
@======================================================
WEST_Jitabata:
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	BLDALPHA_SET	0xc,0x8

@	ADD_TASK	TaskJitabata2, PRI2, 1, 0,
@	SE_REPEAT	SE_W029,WAZA_SE_L,8,2
@	WAIT_FLAG
@	ADD_ACTOR	ActRandomHitMarkHeader,D_UP+3,2,1,3,
@	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,6,1
@	SEPLAY_PAN	SE_W004,WAZA_SE_R,
@	WAIT_FLAG

@	ADD_TASK	TaskJitabata2, PRI2, 1, 0,
@	SE_REPEAT	SE_W029,WAZA_SE_L,8,2
@	WAIT_FLAG
@	ADD_ACTOR	ActRandomHitMarkHeader,D_UP+3,2,1,3,
@	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,6,1
@	SEPLAY_PAN	SE_W004,WAZA_SE_R,
@	WAIT_FLAG

	ADD_TASK	TaskJitabata2, PRI2, 1, 0,
	SE_REPEAT	SE_W029,WAZA_SE_L,8,2
	WAIT_FLAG
	ADD_ACTOR	ActRandomHitMarkHeader,D_UP+3,2,1,3,
	ADD_TASK	TaskPokeDamageYure, PRI2, 5, 0,1,30,1,0,
	SEPLAY_PAN	SE_W025B,WAZA_SE_R,
	WAIT_FLAG

	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

@======================================================
@	180  うらみ
@======================================================
WEST_Urami:
	HAIKEI_CHG		WAZAMAP_ID_GHOST
	SEPLAY_PAN		SE_W060,WAZA_SE_L,
	HAIKEI_CHG_WAIT

	POKEBG			3
	ADD_TASK		WazaTaskColorFade,PRI2,6, 2,2,6,0,8,0x7fff
	ADD_TASK		TaskUrami,PRI2,0,
	SE_REPEAT		SE_W060,WAZA_SE_R,20,3,
	WAIT_FLAG

	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
	POKEBG_RESET	1

	SEQEND

@======================================================
@	183  マッハパンチ
@======================================================
WEST_MachPunch:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_KAKUTOU
	POKEBG			2

	ADD_TASK	MineEnemyChkTask,PRI2,0
	WORKCHK_JP	7,1,WEST_MachPunchEnemyHaikei
	HAIKEI_CHG	WAZAMAP_ID_YOKO
WEST_MachPunchReturn:
	HAIKEI_HALF_WAIT
	ADD_TASK	HaikeiMapScrTask,PRI5,4, -0x0900,0x0000,1,0xffff
	HAIKEI_CHG_WAIT

	WAIT		0
//	BGPRI_GAPSET2
	BLDALPHA_SET	0x9,0x8
	ADD_TASK	TaskMachPunch,PRI2,2,0x7128,0x0a,
	SEPLAY_PAN	SE_W026, WAZA_SE_L
	WAIT		6   @ 移動幅が最大になったところでヒットマークを出すためのウェイト
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 0,0,1,1
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+4,5, 0,0, 8, 1,0
	SEPLAY_PAN	SE_W004, WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,6,1
	WAIT_FLAG
	POKEBG_RESET	2
	BLDALPHA_RESET

	HAIKEI_RECOVER
	HAIKEI_HALF_WAIT
	WORK_SET	7,0xffff	//背景のｽｸﾛｰﾙ終了
	HAIKEI_CHG_WAIT

	SEQEND

WEST_MachPunchEnemyHaikei:
	HAIKEI_CHG	WAZAMAP_ID_YOKO2
	SEQ_JP		WEST_MachPunchReturn

@======================================================
@	193 みやぶる
@======================================================
WEST_Miyaburu:
	CHAR_SET		WAZACHR_ID_LOUPE
	POKEBG			3
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0x10,0x00
	ADD_ACTOR		LoupeHeader, D_UP+2, 1, 1,
	WAIT	17
	SE_REPEAT		SE_W166,WAZA_SE_R,16,4,
	WAIT	48
	WAIT	24
	SEPLAY_PAN		SE_W166,WAZA_SE_R,
	WAIT	10
	ADD_TASK		TaskPokeFadeCtrl,PRI5,5, 1,0x7fff,12,2,1,
	SEPLAY_PAN		SE_W197,WAZA_SE_R,
	WAIT_FLAG
	BLDALPHA_RESET
	POKEBG_RESET	3
	SEQEND

@======================================================
@	194  みちずれ
@======================================================
WEST_Mitizure:
	CHAR_SET	WAZACHR_ID_MITIZURE

	HAIKEI_CHG		WAZAMAP_ID_GHOST
	SEPLAY_PAN		SE_W060,WAZA_SE_L,
	HAIKEI_CHG_WAIT

	ADD_TASK	TaskMitizureShadow,PRI5,2, 0, 48,
	SEPLAY_PAN	SE_W109,WAZA_SE_L,
	WAIT		48
	ADD_TASK	TaskPokeCenterBuru2, PRI2, 5, 0,2,0,24,1,
	ADD_TASK	ExceptColorFadeSeq, PRI2, 5,  6,1,0,12,0x77bd,
	WAIT		24
	ADD_TASK	ExceptColorFadeSeq, PRI2, 5,  6,1,12,0,0x77bd,
	SEPLAY_PAN	SE_W171,WAZA_SE_R,
	WAIT_FLAG

	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT

	BLDALPHA_RESET
	POKEBG_RESET

	WAIT_FLAG
	SEQEND

@======================================================
@	203  こらえる
@======================================================
WEST_Koraeru:
	CHAR_SET	WAZACHR_ID_KORAERU

	SEPLAY_PAN	SE_W082, WAZA_SE_L,
	SEQ_CALL	WEST_KoraeruSub
	WAIT		8
	ADD_TASK	WazaTaskColorFade,PRI2,6, 2,2,2,0,11,0x001f
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,1,0,32,1
	SEQ_CALL	WEST_KoraeruSub
	WAIT		8
	SEQ_CALL	WEST_KoraeruSub
	WAIT_FLAG
	SEQEND

WEST_KoraeruSub:	//「きあいだめ」「きあいパンチ」でも使用
	ADD_ACTOR	ActKoraeruHeader, A_UP+2,4,0,-24,26,2
	WAIT		4
	ADD_ACTOR	ActKoraeruHeader, A_UP+2,4,0, 14,28,1
	WAIT		4
	ADD_ACTOR	ActKoraeruHeader, A_UP+2,4,0, -5,10,2
	WAIT		4
	ADD_ACTOR	ActKoraeruHeader, A_UP+2,4,0, 28,26,3
	WAIT		4
	ADD_ACTOR	ActKoraeruHeader, A_UP+2,4,0,-12, 0,1
	END_CALL

@======================================================
@	204  あまえる
@======================================================
WEST_Amaeru:
	CHAR_SET	WAZACHR_ID_HEART2
//	ADD_TASK	AmaeruPokeTask,PRI5,0
//	ADD_TASK	PokeSinMove,PRI5,5, 0,12,0x0a00,4,0
	ADD_TASK	TaskPokeSwing, PRI5, 3, 0,2,0,
	ADD_ACTOR	HeartHeader,A_UP+3,2, 0,20
	SEPLAY_PAN	SE_W204,WAZA_SE_L,
	WAIT		15
	ADD_ACTOR	HeartHeader,A_UP+3,2, -20,20
	SEPLAY_PAN	SE_W204,WAZA_SE_L,
	WAIT		15
	ADD_ACTOR	HeartHeader,A_UP+3,2, 20,20
	SEPLAY_PAN	SE_W204,WAZA_SE_L,
	WAIT_FLAG
//	ADD_TASK	StatusEffectTask,PRI5,5, 1,1,1,0,1
	SEQEND

@======================================================
@	205  ころがる
@======================================================
WEST_Korogaru:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_SUNA
	CHAR_SET	WAZACHR_ID_IWA
	POKEBG		3
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8

	ADD_TASK	TaskKorogaru, PRI2, 0,
	WAIT_FLAG
	ADD_TASK	TaskPokeDamageYure, PRI2, 5, 0,1,30,1,0,
	ADD_ACTOR	ActHitMarkHeader,A_UP+4,4,0,0,1,2
	SEPLAY_PAN	SE_W025B, WAZA_SE_R,
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	206  みねうち
@======================================================
WEST_Mineuti:
	CHAR_SET	WAZACHR_ID_MINEUCHI
	CHAR_SET	WAZACHR_ID_HITMARK

	ADD_ACTOR	MineuchiHeader, D_UP+2, 0,
	SEPLAY_PAN	SE_W233, WAZA_SE_R
	WAIT		16
	ADD_ACTOR	MineuchiZanzouHeader, D_UP+2, 1, 0,
	SEPLAY_PAN	SE_W104, WAZA_SE_R
	WAIT		2
	ADD_ACTOR	MineuchiZanzouHeader, D_UP+2, 1, 16,
	WAIT		2
	ADD_ACTOR	MineuchiZanzouHeader, D_UP+2, 1, 32,
	SEPLAY_PAN	SE_W104, WAZA_SE_R
	WAIT		2
	ADD_ACTOR	MineuchiZanzouHeader, D_UP+2, 1, 48,
	WAIT		2
	ADD_ACTOR	MineuchiZanzouHeader, D_UP+2, 1, 64,
	SEPLAY_PAN	SE_W104, WAZA_SE_R
	WAIT		2
	ADD_ACTOR	MineuchiZanzouHeader, D_UP+2, 1, 80,
	WAIT		2
	WAIT_FLAG
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,5,0,6,1
	ADD_ACTOR	ActHitMarkHeader,D_UP+4,4,0,0,1,3
	SEPLAY_PAN	SE_W004, WAZA_SE_R
	SEQEND

@======================================================
@	207  いばる
@======================================================
WEST_Ibaru:
	CHAR_SET	WAZACHR_ID_HANAIKI
	CHAR_SET	WAZACHR_ID_IKARI	
	ADD_TASK	TaskIbaru,PRI2,0,
	SEPLAY_PAN	SE_W207,WAZA_SE_L,
	WAIT_FLAG
	ADD_ACTOR	ActIbaruHanaikiHeader,A_UP+2,0,
	SE_REPEAT	SE_W207,WAZA_SE_L,4,2,
	WAIT_FLAG
	WAIT		24
	ADD_ACTOR	ActIbaruIkariHeader,D_UP+2,3,1,-20,-28,
	SEPLAY_PAN	SE_W207B,WAZA_SE_R,
	WAIT		12
	ADD_ACTOR	ActIbaruIkariHeader,D_UP+2,3,1,20,-28,
	SEPLAY_PAN	SE_W207B,WAZA_SE_R,
	WAIT_FLAG
//	ADD_TASK	StatusEffectTask,PRI5,5, 0,0,1,0,1
	SEQEND

@======================================================
@	208 ミルクのみ
@======================================================
WEST_MilkNomi:
	CHAR_SET	WAZACHR_ID_MILK
	CHAR_SET	WAZACHR_ID_HAMON
	CHAR_SET	WAZACHR_ID_PIKARI

	POKEBG		1

	ADD_ACTOR	ActMilkHeader, A_UP+2, 0,
	WAIT		40
	SEPLAY_PAN	SE_W152,WAZA_SE_L,
	WAIT		12
	SEPLAY_PAN	SE_W152,WAZA_SE_L,
	WAIT		20
	SEPLAY_PAN	SE_W152,WAZA_SE_L,
	WAIT_FLAG
	ADD_ACTOR	HamonHeader,A_UP+3,4, 0,0,1,0,
	SEPLAY_PAN	SE_W208,WAZA_SE_L,
	WAIT_FLAG

	POKEBG_RESET	1

	SEQ_CALL	WEST_PikariDefence
	WAIT_FLAG

	SEQEND

@======================================================
@	222  マグニチュード
@======================================================
WEST_Magunityuudo:

	ADD_TASK	TaskMagnitudeCheck,PRI2,0
	WAIT_FLAG
	WORKCHK_JP	15,0,WEST_MagnitudeNoFlash
	WORKCHK_JP	15,1,WEST_MagnitudeFlash

WEST_MagnitudeReturn:
	SEQEND

//----- ﾌﾗｯｼｭなし ----------
WEST_MagnitudeNoFlash:
	ADD_TASK	TaskQuake,PRI5,  3,5,0,50,
	ADD_TASK	TaskQuake,PRI5,  3,4,0,50,
	SE_REPEAT	SE_W070,WAZA_SE_R,8,10,
	SEQ_JP	WEST_MagnitudeReturn

//----- ﾌﾗｯｼｭあり ----------
WEST_MagnitudeFlash:
	ADD_TASK	TaskQuake,PRI5,  3,5,0,50,
	ADD_TASK	TaskQuake,PRI5,  3,4,0,50,
	SE_REPEAT	SE_W070,WAZA_SE_R,8,10,
	WAIT	10
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 1,3,1,0x0000,14,0x7fff,14
	WAIT	16
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 1,3,1,0x0000,14,0x7fff,14
	SEQ_JP	WEST_MagnitudeReturn


@======================================================
@	229  こうそくスピン
@======================================================
WEST_Supin:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_SPIN

	POKEBG		0

	ADD_ACTOR	ActSpinHeader, A_UP+2, 6, 0,0,32,-32,40,-2,
	ADD_TASK	TaskSpin, PRI2, 3, 0,2,0,
	SE_REPEAT	SE_W013B,WAZA_SE_L,8,4,
	WAIT_FLAG
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, 0,0,1,2,0
	ADD_TASK	TaskPokeDamageYure, PRI2, 5, 0,1,10,1,0,
	SEPLAY_PAN	SE_W003,WAZA_SE_R,
	WAIT_FLAG
	WAIT		8
	ADD_TASK	TaskSpin, PRI2, 3, 0,2,1,
	SE_REPEAT	SE_W013B,WAZA_SE_L,8,4,
	WAIT_FLAG

	POKEBG_RESET	0

	SEQEND

@======================================================
@	236  つきのひかり
@======================================================
#define MOONLIGHT_WAIT  (30)
WEST_TukinoHikari:
	CHAR_SET	WAZACHR_ID_MOON
	CHAR_SET	WAZACHR_ID_MOONLIGHT
	CHAR_SET	WAZACHR_ID_PIKARI
	BLDALPHA_SET	0x00,0x10

//	ADD_TASK	TaskGaugeOff,PRI2,2,1,1
	ADD_ACTOR	ActFadeHeader,A_UP+2,5,1,1,0,16,0x0
	WAIT_FLAG

	ADD_ACTOR	ActMoonHeader,	A_UP+2,2,120,56
	ADD_TASK	TaskBldAlphaCtrl, PRI3, 5, 0x00, 0x10, 0x10, 0x00, 1,
	SEPLAY_PAN	SE_W236,0,

	WAIT		30
	ADD_ACTOR	ActMoonLightHeader,A_UP+40,2,-12,0,
	WAIT		MOONLIGHT_WAIT
	ADD_ACTOR	ActMoonLightHeader,A_UP+40,2,-24,0,
	WAIT		MOONLIGHT_WAIT
	ADD_ACTOR	ActMoonLightHeader,A_UP+40,2,21,0,
	WAIT		MOONLIGHT_WAIT
	ADD_ACTOR	ActMoonLightHeader,A_UP+40,2,0,0,
	WAIT		MOONLIGHT_WAIT
	ADD_ACTOR	ActMoonLightHeader,A_UP+40,2,10,0,

	WAIT		20
	ADD_TASK	TaskTukinoHikariFade, PRI2, 0,
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5,1,1,16,0,0x0
	WAIT_FLAG

	SEQ_CALL	WEST_Pikari
	WAIT_FLAG

//	ADD_TASK	TaskGaugeOn,PRI2,0
//	WAIT_FLAG
	SEQEND

@======================================================
@	245  しんそく
@======================================================
WEST_Sinsoku:
	CHAR_SET	WAZACHR_ID_KEMURI
	CHAR_SET	WAZACHR_ID_HITMARK
	
//	ADD_TASK	AttackClimemBanish,PRI2,0	//ﾊﾟｰﾃｨｱﾀｯｸ用
//	POKEBG		1
//	BLDALPHA_SET	0x0c,0x08

	ADD_TASK	MineEnemyChkTask,PRI2,0
	WORKCHK_JP	7,1,WEST_SinsokuEnemyHaikei
	HAIKEI_CHG	WAZAMAP_ID_YOKO
WEST_SinsokuHaikeiReturn:
	HAIKEI_HALF_WAIT
	ADD_TASK	HaikeiMapScrTask,PRI5,4, -0x0900,0x0000,1,0xffff
	HAIKEI_CHG_WAIT

	ADD_TASK	TaskSinsokuVanish, PRI2, 0,  @ 攻撃側が消える
	SE_REPEAT	SE_W013B,WAZA_SE_L,8,3,
	WAIT_FLAG
	
	WAIT		1
	ADD_TASK	AttackClimemBanish,PRI2,0	//ﾊﾟｰﾃｨｱﾀｯｸ用
	POKEBG		1
	BLDALPHA_SET	0x0c,0x08
	WAIT		18
	
	ADD_TASK	TaskSinsokuDamage, PRI2, 0,  @ 防御側ダメージ
	WAIT		2
	SEPLAY_PAN	SE_W004,WAZA_SE_R,
	ADD_ACTOR	ActSearchHitMarkHeader,D_UP+2,4, 1,0,-12,3,
	WAIT		10
	SEPLAY_PAN	SE_W004,WAZA_SE_R,
	ADD_ACTOR	ActSearchHitMarkHeader,D_UP+2,4, 1,0,12,3,
	WAIT		10
	SEPLAY_PAN	SE_W233B,WAZA_SE_R,
	ADD_ACTOR	ActSearchHitMarkHeader,D_UP+2,4, 1,0,0,3,
	WAIT_FLAG
	ADD_TASK	TaskSinsokuKemuriAdd, PRI2, 0  @ 煙が現れる
	WAIT		10
	ADD_TASK	TaskSinsokuAppear, PRI2, 0,  @ 攻撃側が現れる
	SE_REPEAT	SE_W104,WAZA_SE_L,8,4,
	WAIT_FLAG

	HAIKEI_RECOVER
	HAIKEI_HALF_WAIT
	WORK_SET	7,0xffff	//背景のｽｸﾛｰﾙ終了
	HAIKEI_CHG_WAIT

	POKEBG_RESET	1
	BLDALPHA_RESET
	WAIT			1
	WORK_SET	7,0x1000	//AttackClimemBanish用
	WAIT			1
	SEQEND

WEST_SinsokuEnemyHaikei:
	HAIKEI_CHG	WAZAMAP_ID_YOKO2
	SEQ_JP		WEST_SinsokuHaikeiReturn

@======================================================
@	253  さわぐ
@======================================================
WEST_Sawagu:
	CHAR_SET	WAZACHR_ID_SAWAGU
	CHAR_SET	WAZACHR_ID_HAMON

	POKEBG		3	@ ｷｬﾗ欠け対策

	ADD_TASK	TaskSawagu, PRI2, 1, 0,
	ADD_ACTOR	HamonColorHeader,A_UP+3,6, 0,0,0,0,0x001f,8,
	SEPLAY_PAN	SE_W253,WAZA_SE_L,
	ADD_ACTOR	ActSawaguHeader, A_UP+2, 4, 0, 29,-12,0,
	ADD_ACTOR	ActSawaguHeader, A_UP+2, 4, 0,-12,-29,1,
	WAIT		16
	ADD_TASK	TaskSawagu, PRI2, 1, 0,
	ADD_ACTOR	HamonColorHeader,A_UP+3,6, 0,0,0,0,0x001f,8,
	SEPLAY_PAN	SE_W253,WAZA_SE_L,
	ADD_ACTOR	ActSawaguHeader, A_UP+2, 4, 0, 12,-29,1,
	ADD_ACTOR	ActSawaguHeader, A_UP+2, 4, 0,-29,-12,0,
	WAIT		16
	ADD_TASK	TaskSawagu, PRI2, 1, 0,
	ADD_ACTOR	HamonColorHeader,A_UP+3,6, 0,0,0,0,0x001f,8,
	SEPLAY_PAN	SE_W253,WAZA_SE_L,
	ADD_ACTOR	ActSawaguHeader, A_UP+2, 4, 0, 24,-24,1,
	ADD_ACTOR	ActSawaguHeader, A_UP+2, 4, 0,-24,-24,0,
	WAIT_FLAG

	POKEBG_RESET	3

	SEQEND

@======================================================
@	257  ねっぷう
@======================================================
WEST_Neppuu:
#define NEPUU_SP_X	0x0900
#define NEPUU_SP_Y	0x0060
	CHAR_SET	WAZACHR_ID_SUNAARASI
	ADD_TASK	WazaChrColorFade,PRI5,5,  WAZACHR_ID_SUNAARASI,0,6,6,0x1f
	ADD_TASK	SunaArasiHaikeiTask,PRI5,1, 1
	ADD_TASK	NepuuBGFade, PRI6,2,  6,0x001f,
	SEPAN_FLOW	SE_W257,WAZA_SE_L,WAZA_SE_R,2,0
	WAIT		4
	ADD_TASK	TaskNeppuuMove,PRI5,0,
	WAIT		12
	ADD_ACTOR	SunaArasiHeader,A_UP+40,4, 10,NEPUU_SP_X,NEPUU_SP_Y,1
	WAIT		10
	ADD_ACTOR	SunaArasiHeader,A_UP+40,4, 90,NEPUU_SP_X-0x0100,NEPUU_SP_Y,1
	WAIT		10
	ADD_ACTOR	SunaArasiHeader,A_UP+40,4, 50,NEPUU_SP_X+0x0100,NEPUU_SP_Y,1
	WAIT		10
	ADD_ACTOR	SunaArasiHeader,A_UP+40,4, 20,NEPUU_SP_X,NEPUU_SP_Y,1
	WAIT		10
	ADD_ACTOR	SunaArasiHeader,A_UP+40,4, 70,NEPUU_SP_X-0x0140,NEPUU_SP_Y,1
	WAIT		10
	ADD_ACTOR	SunaArasiHeader,A_UP+40,4, 0,NEPUU_SP_X+0x0200,NEPUU_SP_Y,1
	WAIT		10
	ADD_ACTOR	SunaArasiHeader,A_UP+40,4, 60,NEPUU_SP_X+0x0100,NEPUU_SP_Y,1
	SEQEND

@======================================================
@	258  あられ
@======================================================
WEST_Arale:
	CHAR_SET	WAZACHR_ID_ARALE
	CHAR_SET	WAZACHR_ID_YUKI2
	ADD_TASK	ColorFadeSeq,PRI10,5, 1,3,0,6,0x0000
	WAIT_FLAG
	ADD_TASK	TaskArale,PRI5,0,
	SE_REPEAT	SE_W258,0,8,10,
	WAIT_FLAG
	ADD_TASK	ColorFadeSeq,PRI10,5, 1,3,6,0,0x0000
	SEQEND

@======================================================
@	259  いちゃもん
@======================================================
WEST_Ichamon:
	CHAR_SET	WAZACHR_ID_IKARI
	CHAR_SET	WAZACHR_ID_FUKIDASI
	ADD_TASK	TaskIchamon, PRI2, 0,
	WAIT_FLAG

	ADD_TASK	TaskPokeFadeCtrl, PRI2,5, 1,0x001f,10,1,1
	ADD_ACTOR	ActIbaruIkariHeader,D_UP+2,3,1,-20,-28,
	SEPLAY_PAN	SE_W207B, WAZA_SE_R,
	WAIT		20
	ADD_ACTOR	ActIbaruIkariHeader,D_UP+2,3,1,20,-28,
	SEPLAY_PAN	SE_W207B, WAZA_SE_R,

	SEQEND

@======================================================
@	262  おきみやげ
@======================================================
WEST_OkiMiyage:
	BLDALPHA_SET	0x00,0x10
	WAIT			1

//既に死んでしまっているのでBGに落せない。特別ﾙｰﾁﾝで落す 2002.09.04(水)by matsuda
//	POKEBG_DROP		0
	ADD_TASK	PokeBGDeadDrop,PRI2,0
	WAIT		1
	
	ADD_TASK	TaskOkimiyageAttack,PRI5,0,
	SEPLAY_PAN	SE_W060,WAZA_SE_L,
	WAIT		48
	SEPLAY_PAN	SE_W060B,WAZA_SE_L,
	WAIT_FLAG

//	POKEBG_DROP_RESET	0
	ADD_TASK	PokeBGDeadDropClear,PRI2,0

	WAIT	12

	BLDALPHA_SET	0x00,0x10
	WAIT			1
	POKEBG_DROP		1
	ADD_TASK	TaskOkimiyageDefence,PRI5,0,
	SEPLAY_PAN	SE_W060,WAZA_SE_R,
	WAIT_FLAG
	POKEBG_DROP_RESET	1
	WAIT	1
	BLDALPHA_RESET
	WAIT	1

//	ADD_TASK	StatusEffectTask,PRI5,5, 1,0xff,1,0,1,

	SEQEND

@======================================================
@	263  からげんき
@======================================================
WEST_Karagenki:
	CHAR_SET	WAZACHR_ID_ASE2

	ADD_TASK	TaskGamusyara, PRI2, 2, 0, 3,
	ADD_TASK	TaskKaraGenkiFade, PRI2, 2, 0, 72, // TaskGamusyaraと同sync数
	SE_REPEAT	SE_W207,WAZA_SE_L,24,3,

	SEQEND

@======================================================
@	265  きつけ
@======================================================
WEST_Kitsuke:
	CHAR_SET	WAZACHR_ID_TE
	CHAR_SET	WAZACHR_ID_KITSUKE

	ADD_ACTOR	KitsukeHandActor,D_UP+2, 3, 1,0,2,
	ADD_ACTOR	KitsukeHandActor,D_UP+2, 3, 1,1,2,
	WAIT		32
	ADD_TASK	TaskKitsukeNobi,PRI3,2,1,2,
	SE_REPEAT	SE_W003,WAZA_SE_R,12,2,
	WAIT_FLAG
	WAIT		4
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,6,2
	ADD_ACTOR	KitsukeMezameHeader, D_UP+2, 3, 1, 8, 3,
	SE_REPEAT	SE_W207B,WAZA_SE_R,16,3,

	SEQEND

@======================================================
@	266  このゆびとまれ
@======================================================
WEST_KonoyubiTomare:
	CHAR_SET	WAZACHR_ID_YUBI

	ADD_ACTOR	ActKonoyubiHeader, A_UP+2, 1, 0,
	SEPLAY_PAN	SE_W039,WAZA_SE_L,
	WAIT		18
	SEPLAY_PAN	SE_W213,WAZA_SE_L,
	WAIT		71
	SE_REPEAT	SE_W039,WAZA_SE_L,22,3,
	SEQEND

@======================================================
@	268  じゅうでん
@======================================================
WEST_Juden:
	CHAR_SET	WAZACHR_ID_JUUDEN1
	CHAR_SET	WAZACHR_ID_JUUDEN2
	CHAR_SET	WAZACHR_ID_JUUDEN3

	POKEBG		0
	BLDALPHA_SET	0x0c,0x08

	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 0x01,2,0,4,0x0000
	WAIT_FLAG

	ADD_TASK	TaskJuden1, PRI2,4, 0,60,2,12,  @ 細かい光り
	SEPLAY_PAN	SE_W268,WAZA_SE_L,
	WAIT		30
	SEPLAY_PAN	SE_W268,WAZA_SE_L,
	WAIT		30
	SEPLAY_PAN	SE_W268,WAZA_SE_L,
	ADD_ACTOR	ActJuden2, A_UP+2,1, 0,  @ 大きい光
	WAIT		25
	SEPLAY_PAN	SE_W268,WAZA_SE_L,
	WAIT		20
	SEPLAY_PAN	SE_W268,WAZA_SE_L,
	WAIT		15
	SEPLAY_PAN	SE_W268,WAZA_SE_L,
	WAIT		10
	WAIT		6
	SE_REPEAT	SE_W268,WAZA_SE_L,6,5,
	WAIT_FLAG
	ADD_ACTOR	ActJuden3, A_UP+2,3, 0,16,16,
	WAIT		2
	ADD_ACTOR	ActJuden3, A_UP+2,3, 0,-16,-16
	SEPLAY_PAN	SE_W085B,WAZA_SE_L,
	WAIT_FLAG

	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 0x01,4,4,0,0x0000

	POKEBG_RESET	0
	BLDALPHA_RESET
	SEQEND

@======================================================
@	269  ちょうはつ
@======================================================
WEST_Chohatu:
	CHAR_SET	WAZACHR_ID_CHOUHATU
	CHAR_SET	WAZACHR_ID_FUKIDASI
	CHAR_SET	WAZACHR_ID_IKARI

	ADD_ACTOR	ActFukidashiHeader, A_UP+11, 2, 0,45,
	SEPLAY_PAN	SE_W118, WAZA_SE_L,
	WAIT		6	@ フキダシ出現までのウェイト
	ADD_ACTOR	ActChohatuHeader, A_UP+12, 1, 0,
	WAIT		4
	SE_REPEAT	SE_W039,WAZA_SE_L,16,2
	WAIT_FLAG
	WAIT		8
	ADD_ACTOR	ActIbaruIkariHeader,D_UP+2,3,1,-20,-28,
	SEPLAY_PAN	SE_W207B,WAZA_SE_R,
	WAIT_FLAG
	WAIT		12
	ADD_ACTOR	ActIbaruIkariHeader,D_UP+2,3,1,20,-28,
	SEPLAY_PAN	SE_W207B,WAZA_SE_R,
	SEQEND

@======================================================
@	270  てだすけ
@======================================================
WEST_Tedasuke:
	CHAR_SET	WAZACHR_ID_TE

	ADD_TASK	TaskTedasuke,PRI5,0,
	ADD_ACTOR	ActTedasuke,A_UP+40,1,0,
	ADD_ACTOR	ActTedasuke,A_UP+40,1,1,
	WAIT		19
	SEPLAY_PAN	SE_W227,0
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 2,2,0,5,1
	WAIT		14
	SEPLAY_PAN	SE_W227,0
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 2,2,0,5,1
	WAIT		20
	SEPLAY_PAN	SE_W227,0
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 2,3,0,10,1
	ADD_TASK	TaskPokeFadeCtrl, PRI2, 5, 2,0x3ff,12,1,1,
	SEQEND

@======================================================
@	274  ねこのて
@======================================================
#define NEKONOTE_WAIT  (2)
WEST_Nekonote:
	CHAR_SET	WAZACHR_ID_NEKOTE

	ADD_ACTOR	NekoteHeader, A_UP+50, 5, 112, -16, 140, 128, 36,

	WAIT		NEKONOTE_WAIT
	ADD_ACTOR	NekoteHeader, A_UP+50, 5, 208, 128, -16,  48, 36,
	SEPLAY_PAN	SE_W010,0,

	WAIT		NEKONOTE_WAIT
	ADD_ACTOR	NekoteHeader, A_UP+50, 5, -16, 112, 256, -16, 36,
	SEPLAY_PAN	SE_W010,0,

	WAIT		NEKONOTE_WAIT
	ADD_ACTOR	NekoteHeader, A_UP+50, 5, 108, 128, 84,  -16, 36,
	SEPLAY_PAN	SE_W010,0,

	WAIT		NEKONOTE_WAIT
	ADD_ACTOR	NekoteHeader, A_UP+50, 5, -16, 56, 256,  56, 36,
	SEPLAY_PAN	SE_W010,0,

	SEQEND

@======================================================
@	276  ばかぢから
@======================================================
#define BAKA_GOMI_PUNCH_WAIT  (120)
#define BAKA_GOMI_ADD_WAIT    (8)
WEST_BakaJikara:
	CHAR_SET	WAZACHR_ID_JUUDEN2
	CHAR_SET	WAZACHR_ID_BAKA
	CHAR_SET	WAZACHR_ID_BAKAGOMI

	POKEBG			2
	BGPRI_GAPSET	BG_ATTACK
	BLDALPHA_SET	0x0c, 0x08,

	ADD_ACTOR	BakaHikariHeader, D_UP+2, 1, 0,
	SEPLAY_PAN	SE_W025,WAZA_SE_L,
	WAIT		20
	ADD_ACTOR	ActQuakeHeader,A_UP+2, 4, 4,1,BAKA_GOMI_PUNCH_WAIT+60,1
	ADD_TASK	SePlayCh2Task,PRI5,2,	SE_W089,0,
	WAIT		40
	ADD_ACTOR	BakaGomiHeader, A_UP+41, 4 , 200, 0x60, 1, BAKA_GOMI_PUNCH_WAIT,
	WAIT		BAKA_GOMI_ADD_WAIT
	ADD_ACTOR	BakaGomiHeader, A_UP+41, 4 ,  20, 0xF8, 4, BAKA_GOMI_PUNCH_WAIT-(BAKA_GOMI_ADD_WAIT*1),
	WAIT		BAKA_GOMI_ADD_WAIT
	ADD_ACTOR	BakaGomiHeader, A_UP+41, 4 , 130, 0xa0, 2, BAKA_GOMI_PUNCH_WAIT-(BAKA_GOMI_ADD_WAIT*2),
	WAIT		BAKA_GOMI_ADD_WAIT
	ADD_ACTOR	BakaGomiHeader, A_UP+41, 4 , 160, 0xc0, 0, BAKA_GOMI_PUNCH_WAIT-(BAKA_GOMI_ADD_WAIT*3),
	WAIT		BAKA_GOMI_ADD_WAIT
	ADD_ACTOR	BakaGomiHeader, A_UP+41, 4 ,  60, 0x120, 3, BAKA_GOMI_PUNCH_WAIT-(BAKA_GOMI_ADD_WAIT*4),

	WAIT		BAKA_GOMI_PUNCH_WAIT-(BAKA_GOMI_ADD_WAIT*4)-14

	ADD_ACTOR	BakaPunchHeader, D_UP+3, 1, 0,
	SEPLAY_PAN	SE_W207,WAZA_SE_L,
	WAIT		16

	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,8,0,16,1
	SEPLAY_PAN	SE_W025B,WAZA_SE_R,
	WAIT_FLAG

	POKEBG_RESET	2
	BLDALPHA_RESET
	WAIT		1

//	ADD_TASK	StatusEffectTask,PRI5, 5, 1,0xff,0,0,0
	SEQEND

@======================================================
@	278  リサイクル
@======================================================
WEST_Recycle:
	CHAR_SET	WAZACHR_ID_RECYCLE
	POKEBG			0
	BLDALPHA_SET	0x00,0x10
	WAIT		1
	ADD_ACTOR	RecycleHeader,A_UP+2,0,
	SE_REPEAT	SE_W036,WAZA_SE_L,24,3,
	WAIT_FLAG
	ADD_TASK	TaskPokeFadeCtrl,PRI5,5, 0,0x7fff,12,2,1,
	SEPLAY_PAN	SE_W036,WAZA_SE_L,
	WAIT_FLAG
	BLDALPHA_RESET
	POKEBG_RESET	0
	WAIT		1

	SEQEND

@======================================================
@	280  かわらわり
@======================================================
WEST_KawaraWari:
	CHAR_SET	WAZACHR_ID_MIRROR1
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_KAKUTOU
	CHAR_SET	WAZACHR_ID_KAWARA

	TURN_CHK	WEST_KawaraWariMirrorNon, WEST_KawaraWariMirror

WEST_KawaraWariMirrorNon:	//鏡なし
	POKEBG		1
	BLDALPHA_SET	0x0c,0x08

	ADD_ACTOR	ActTaiatariHeader,PRI2,2,3,8
	WAIT		4
//	ADD_ACTOR	ActKawaraWariMirror,PRI3,5, 1,0,0,90,10
	WAIT		1
	ADD_ACTOR	ActHitMarkHeader,PRI3,4, -18,-18,1,1
	ADD_ACTOR	ActKakutouWaitHeader,PRI2,5, -18,-18, 10, 1,0
	SEPLAY_PAN	SE_W233,WAZA_SE_R,
	WAIT		20

	ADD_ACTOR	ActTaiatariHeader,PRI2,2,3,8
	WAIT		5
	ADD_ACTOR	ActHitMarkHeader,PRI3,4, 18,18,1,1
	ADD_ACTOR	ActKakutouWaitHeader,PRI2,5, 18,18, 10, 1,0
	SEPLAY_PAN	SE_W233,WAZA_SE_R,
	WAIT		20

	ADD_TASK	PokeSinBackInit, PRI2, 7, 0,-24,0,24,10,24,3,
	ADD_ACTOR	ActFadeHeader,PRI2,5, 0x01,2,0,6,0x0000
	WAIT		37
	ADD_ACTOR	ActHitMarkHeader,PRI3,4, 0,0,1,1
	ADD_ACTOR	ActKakutouWaitHeader,PRI2,5, 0,0, 10, 1,0
	SEPLAY_PAN	SE_W233B,WAZA_SE_R,
	WAIT_FLAG
//	ADD_ACTOR	ActKawaraHeader, PRI2, 4, 1,0,-8,-12,
//	ADD_ACTOR	ActKawaraHeader, PRI2, 4, 1,1, 8,-12,
//	ADD_ACTOR	ActKawaraHeader, PRI2, 4, 1,2,-8, 12,
//	ADD_ACTOR	ActKawaraHeader, PRI2, 4, 1,3, 8, 12,
//	SEPLAY_PAN	SE_W280,WAZA_SE_R,
//	WAIT_FLAG

	ADD_ACTOR	ActFadeHeader,PRI2,5, 0x01,2,6,0,0x0000
	WAIT_FLAG

	POKEBG_RESET	1

	SEQEND

WEST_KawaraWariMirror:		//鏡あり
	POKEBG		1
	BLDALPHA_SET	0x0c,0x08

	ADD_ACTOR	ActTaiatariHeader,PRI2,2,3,8
	WAIT		4
	ADD_ACTOR	ActKawaraWariMirror,PRI3,5, 1,0,0,90,10
	WAIT		1
	ADD_ACTOR	ActHitMarkHeader,PRI3,4, -18,-18,1,1
	ADD_ACTOR	ActKakutouWaitHeader,PRI2,5, -18,-18, 10, 1,0
	SEPLAY_PAN	SE_W233,WAZA_SE_R,
	WAIT		20

	ADD_ACTOR	ActTaiatariHeader,PRI2,2,3,8
	WAIT		5
	ADD_ACTOR	ActHitMarkHeader,PRI3,4, 18,18,1,1
	ADD_ACTOR	ActKakutouWaitHeader,PRI2,5, 18,18, 10, 1,0
	SEPLAY_PAN	SE_W233,WAZA_SE_R,
	WAIT		20

	ADD_TASK	PokeSinBackInit, PRI2, 7, 0,-24,0,24,10,24,3,
	ADD_ACTOR	ActFadeHeader,PRI2,5, 0x01,2,0,6,0x0000
	WAIT		37
	ADD_ACTOR	ActHitMarkHeader,PRI3,4, 0,0,1,1
	ADD_ACTOR	ActKakutouWaitHeader,PRI2,5, 0,0, 10, 1,0
	SEPLAY_PAN	SE_W233B,WAZA_SE_R,
	WAIT_FLAG
	ADD_ACTOR	ActKawaraHeader, PRI2, 4, 1,0,-8,-12,
	ADD_ACTOR	ActKawaraHeader, PRI2, 4, 1,1, 8,-12,
	ADD_ACTOR	ActKawaraHeader, PRI2, 4, 1,2,-8, 12,
	ADD_ACTOR	ActKawaraHeader, PRI2, 4, 1,3, 8, 12,
	SEPLAY_PAN	SE_W280,WAZA_SE_R,
	WAIT_FLAG

	ADD_ACTOR	ActFadeHeader,PRI2,5, 0x01,2,6,0,0x0000
	WAIT_FLAG

	POKEBG_RESET	1

	SEQEND

@======================================================
@	281  あくび
@======================================================
WEST_Akubi:
	CHAR_SET	WAZACHR_ID_AKUBI
	ADD_TASK	TaskAkubi, PRI2, 1, 0,
	SEPLAY_PAN	SE_W281,WAZA_SE_L,
	WAIT_FLAG
	ADD_ACTOR	ActAkubi, D_UP+5, 1, 2,
	SEPLAY_PAN	SE_W255,WAZA_SE_L,
	WAIT		4
	ADD_ACTOR	ActAkubi, D_UP+5, 1, 1,
	WAIT		4
	ADD_ACTOR	ActAkubi, D_UP+5, 1, 0,
	WAIT_FLAG
	ADD_TASK	TaskAkubi, PRI2, 1, 1,
	SEPLAY_PAN	SE_W281,WAZA_SE_R,
	SEQEND

@======================================================
@	283  がむしゃら
@======================================================
WEST_Gamusyara:
	CHAR_SET	WAZACHR_ID_ASE2
	CHAR_SET	WAZACHR_ID_HITMARK

	ADD_TASK	TaskGamusyara, PRI2, 2, 0, 2,
	SE_REPEAT	SE_W039,WAZA_SE_L,24,2,
	ADD_TASK	TaskPokeFadeCtrl,PRI5,5,  0,0x02bf,12,1,2,
	WAIT		6
	ADD_TASK	TaskPokeDamageYure, PRI5,5, 0,1,8,1,0
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, 12,-12,1,2
	SEPLAY_PAN	SE_W003,WAZA_SE_R,
	WAIT		24
	ADD_TASK	TaskPokeDamageYure, PRI5,5, 0,1,8,1,0
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4,-12,12,1,2
	SEPLAY_PAN	SE_W004,WAZA_SE_R,
	SEQEND

@======================================================
@	284  ふんか
@======================================================
WEST_Hunka:
	CHAR_SET	WAZACHR_ID_HUNKA

	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 0x1f,2,0,4,0x001f
	WAIT_FLAG

	ADD_TASK	TaskHunkaActiton, PRI2, 0,
	SE_WAITPLAY	SE_W153, WAZA_SE_L, 60
	WAIT_FLAG
	ADD_TASK	TaskHunkaActiton, PRI2, 0,
	SE_WAITPLAY	SE_W153, WAZA_SE_L, 60
	WAIT_FLAG

@	ADD_TASK	TaskHunkaActiton, PRI2, 0,
@	SE_WAITPLAY	SE_W153, WAZA_SE_L, 60
@	WAIT_FLAG

	WAIT		30
	ADD_ACTOR	ActHunkaIwaL_Header,A_UP+40,  5, 200,-32, 0,100,0,
	ADD_ACTOR	ActHunkaIwaL_Header,A_UP+40,  5,  30,-32,16, 90,1,
	ADD_ACTOR	ActHunkaIwaL_Header,A_UP+40,  5, 150,-32,32, 60,2,
	ADD_ACTOR	ActHunkaIwaL_Header,A_UP+40,  5,  90,-32,48, 80,3,
	ADD_ACTOR	ActHunkaIwaL_Header,A_UP+40,  5, 110,-32,64, 50,0,
	ADD_ACTOR	ActHunkaIwaL_Header,A_UP+40,  5,  60,-32,80, 70,1,

	WAIT		22
//	ADD_ACTOR	ActQuakeHeader,A_UP+40,4,15,1,100,0
//	ADD_ACTOR	ActQuakeHeader,A_UP+40,5,15,1,100,2,2
	ADD_TASK	TaskQuake,PRI5,  3,5,8,60,
	ADD_TASK	TaskQuake,PRI5,  3,4,8,60,
	SE_REPEAT	SE_W088, WAZA_SE_R,  16, 12

	WAIT		80
	ADD_ACTOR	ActFadeHeader,A_UP+40,5, 0x1f,4,4,0,0x001f

	SEQEND

@======================================================
@	285  スキルスワップ
@======================================================
WEST_SkillSwap:
	CHAR_SET	WAZACHR_ID_SWAP

	SEQ_CALL	WEST_ESP_MAPCHG
	ADD_TASK	TaskSkillSwap, PRI3, 1, 1,
	ADD_TASK	TaskPokeFadeCtrl,PRI5,5, 1,0x7fff,12,3,1,
	SE_REPEAT	SE_W179,WAZA_SE_L,24,3,
	WAIT		16
	ADD_TASK	TaskSkillSwap, PRI3, 1, 0,
	ADD_TASK	TaskPokeFadeCtrl,PRI5,5, 0,0x7fff,12,3,1,
	WAIT_FLAG

	SEQ_CALL	WEST_ESP_MAPEND

	SEQEND


@======================================================
@	286  ふういん
@======================================================
WEST_Huuin:
	CHAR_SET	WAZACHR_ID_HUUIN
	CHAR_SET	WAZACHR_ID_HUUINBATSU

	SEQ_CALL	WEST_ESP_MAPCHG

	POKEBG		3

	ADD_TASK	TaskHuuin,PRI5,0,
	WAIT		8
	SE_REPEAT	SE_W030,WAZA_SE_L,8,5,
	WAIT_FLAG
	WAIT		4
	ADD_ACTOR	HuuinBatsuHeader,A_UP+5,2,0,40,
	ADD_TASK	TaskQuake,PRI5,  3,4,1,10,
	SEPLAY_PAN	SE_W063,WAZA_SE_L,

	POKEBG_RESET	3

	SEQ_CALL	WEST_ESP_MAPEND

	SEQEND

@======================================================
@	288 おんねん
@======================================================
WEST_Onnen:
	CHAR_SET	WAZACHR_ID_ONNEN

	POKEBG		0
	BGPRI_GAPSET2

	HAIKEI_CHG		WAZAMAP_ID_GHOST
	SEPLAY_PAN	SE_W060,WAZA_SE_L,
	HAIKEI_CHG_WAIT

//	ADD_TASK	HousiBGPriSet,PRI2,0
//	WAIT_FLAG

	ADD_TASK	TaskOnnen, PRI3, 0,
	SE_REPEAT	SE_W052,WAZA_SE_L,16,4,
	WAIT		10
	WAIT		80
	SEPLAY_PAN	SE_W171,WAZA_SE_R,
	WAIT_FLAG

	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
	POKEBG_RESET	0

	SEQEND

@======================================================
@	293  ほごしょく
@======================================================
WEST_Hogosyoku:
	POKEBG   2
	BGPRI_GAPSET	BG_ATTACK
	BLDALPHA_SET	0x10,0x00

//	ADD_TASK	TaskHogosyokuSet,PRI5, 0,
//	WAIT_FLAG
//	ADD_TASK	TaskBldAlphaCtrl, PRI5, 5, 0x10,0x00,0x00,0x10,2,
	ADD_TASK	FieldColorFadeSeq, PRI5, 4, 2,3,0,14,
	WAIT		16
	ADD_TASK	WazaTaskPokeToumeiExe,PRI2,1, 4,
	SEPLAY_PAN	SE_W185,WAZA_SE_L,
	WAIT_FLAG
	WAIT		8
	ADD_TASK	FieldColorFadeSeq, PRI5, 4, 2,0,0,0,
	WAIT_FLAG
	ADD_TASK	WazaTaskPokeToumeiRecovery, PRI2, 1,1,
	WAIT_FLAG


//	0:eva 初期値  1:evb 初期値  2: eva 最終値 3: evb 最終値  4:wait
	BLDALPHA_RESET
	POKEBG_RESET 2

	SEQEND

@======================================================
@	294  ほたるび
@======================================================
WEST_Hotarubi:
	CHAR_SET	WAZACHR_ID_JUUDEN2

	POKEBG		0
	BLDALPHA_SET	0x0c,0x08

	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 0x01,2,0,4,0x0000
	WAIT_FLAG

	ADD_ACTOR	ActHotarubi, A_DOWN+2,1, 0,
	WAIT		18
	SE_REPEAT	SE_W234,WAZA_SE_L,16,6,
	WAIT_FLAG

	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 0x01,4,4,0,0x0000

	POKEBG_RESET	0
	BLDALPHA_RESET
	WAIT		1
//	ADD_TASK	StatusEffectTask,PRI5,5, 0,5,0,0,1

	SEQEND

@======================================================
@	295  ラスターパージ
@======================================================
WEST_LusterPurge:
	CHAR_SET	WAZACHR_ID_PURGE
	CHAR_SET	WAZACHR_ID_HITMARK

//	SEQ_CALL	WEST_ESP_MAPCHG
	HAIKEI_CHG	WAZAMAP_ID_UNEUNE
	HAIKEI_HALF_WAIT
	ADD_TASK	UneunePalAnmTwinTask,PRI5,0
	HAIKEI_CHG_WAIT

	POKEBG	0
	BLDALPHA_SET	0x0c,0x08
	SEPLAY_PAN	SE_W076,WAZA_SE_L,

	ADD_ACTOR	LusterHeader,A_UP+41,4, 0,0,0,0,
	WAIT		20
	ADD_TASK	ExceptColorFadeSeq,PRI5,5, 5,2,0,16,0xffff  @ 全く同じに
	ADD_TASK	WazaChrColorFade,PRI5,5,WAZACHR_ID_PURGE, 2,0,16,0xffff  @
	WAIT_FLAG

	ADD_TASK	WazaChrColorFade,  PRI5,5, WAZACHR_ID_HITMARK, 0,12,12,0x5c00,
	WAIT_FLAG

	ADD_ACTOR	ActRandomHitMarkHeader,D_UP+3,2,1,2,
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W063,WAZA_SE_R,
	WAIT		3
	ADD_ACTOR	ActRandomHitMarkHeader,D_UP+3,2,1,2,
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W063,WAZA_SE_R,
	WAIT		3
	ADD_ACTOR	ActRandomHitMarkHeader,D_UP+3,2,1,2,
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W063,WAZA_SE_R,
	WAIT		3
	ADD_ACTOR	ActRandomHitMarkHeader,D_UP+3,2,1,2,
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W063,WAZA_SE_R,
	WAIT		3
	ADD_ACTOR	ActRandomHitMarkHeader,D_UP+3,2,1,2,
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W063,WAZA_SE_R,
	WAIT		3
	ADD_ACTOR	ActRandomHitMarkHeader,D_UP+3,2,1,2,
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W063,WAZA_SE_R,

	WAIT_FLAG

	ADD_TASK	ExceptColorFadeSeq,PRI5,5, 5, 2,16,0,0xffff
	ADD_TASK	TaskQuake,PRI5,3,1,5,14,
	WAIT_FLAG


	POKEBG_RESET	0
	BLDALPHA_RESET

	SEQ_CALL	WEST_ESP_MAPEND

	SEQEND

@======================================================
@	296:ミストボール
@======================================================
#if 1
WEST_MistBall:
	CHAR_SET	WAZACHR_ID_MIZU2
	CHAR_SET	WAZACHR_ID_FEATHERDANCE
	WAIT		0
	SEPLAY_PAN	SE_W081,WAZA_SE_L
	ADD_ACTOR	MistBallHeader,D_UP,6,	0,0,0,0,30,0x0000
	WAIT_FLAG
	SEPLAY_PAN	SE_W028,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,5,0,10,0
	ADD_ACTOR	ActFlashHeader,A_UP,7,		0x01,1, 1,0x7E17,0x10,0x7FFF,0x10
	WAIT		0
	SEPLAY_PAN	SE_W114,0
	ADD_TASK	MistBallInitTask,PRI5,0
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x04,3,0,16,0x7FFF
	WAIT		8
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,4,0,70,0
	WAIT		70
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x04,2,16,0,0x7FFF
	SEQEND
#else
WEST_MistBall:
	CHAR_SET	WAZACHR_ID_MIZU2
	CHAR_SET	WAZACHR_ID_FEATHERDANCE
	WAIT		0
	POKEBG		3
	BGPRI_GAPSET2
	WAIT		1
	SEPLAY_PAN	SE_W081,WAZA_SE_L
	ADD_ACTOR	MistBall01Header,D_UP,6,	0,0,0,0,45,0x0000
	WAIT_FLAG
	SEPLAY_PAN	SE_W028,WAZA_SE_R
	ADD_ACTOR	ActFlashHeader,A_UP,7,		0x01,1, 1,0x7E17,0x10,0x7FFF,0x10
	ADD_ACTOR	MistBall02Header,D_UP,6,	0x040f,0x2422,0x6004,32,0,0
	ADD_ACTOR	MistBall02Header,D_UP-1,6,	0x021F,0x1812,0x7803,32,0,0
	ADD_ACTOR	MistBall02Header,D_UP-2,6,	0x042f,0x2220,0x6004,32,1,0
	ADD_ACTOR	MistBall02Header,D_UP-3,6,	0x033f,0x1910,0x7803,32,0,0
	WAIT		0
	ADD_ACTOR	MistBall02Header,D_UP-4,6,	0x0208,0x2126,0x6004,32,0,0
	ADD_ACTOR	MistBall02Header,D_UP-5,6,	0x0328,0x1824,0x7803,32,1,0
	ADD_ACTOR	MistBall02Header,D_UP-6,6,	0x08D8,0x2216,0x6004,32,0,0
	ADD_ACTOR	MistBall02Header,D_UP-7,6,	0x0200,0x2028,0x7804,32,0,0
	WAIT        0
	ADD_ACTOR	MistBall02Header,D_UP-8,6,	0x03ef,0x2218,0x7803,32,1,0
	ADD_ACTOR	MistBall02Header,D_UP-9,6,	0x08df,0x1920,0x6004,32,0,0
	ADD_ACTOR	MistBall02Header,D_UP-10,6,	0x06d8,0x2016,0x7803,32,1,0
	ADD_ACTOR	MistBall02Header,D_UP-11,6,	0x044f,0x1814,0x6004,32,0,0
	WAIT_FLAG
	POKEBG_RESET	3
	WAIT		0
	SEQEND
#endif	
@======================================================
@	297:フェザーダンス
@======================================================
#define FEATHER_WAIT	6
WEST_FeatherDance:
	CHAR_SET	WAZACHR_ID_FEATHERDANCE
	POKEBG		3
	BGPRI_GAPSET2
	SEPLAY_PAN	SE_W080,WAZA_SE_R
	WAIT		0
	ADD_ACTOR	ActFeatherDanceHeader,D_UP,8,	0,-16,0x0040,0x0002,0x0068,0x2C28,32,0x0001
	WAIT		FEATHER_WAIT
	ADD_ACTOR	ActFeatherDanceHeader,D_UP,8,	0,-16,0x0020,0x0002,0x0068,0x2C28,32,0x0001
	ADD_ACTOR	ActFeatherDanceHeader,D_UP,8,	0,-16,0x0000,0x0002,0x0068,0x2C28,32,0x0001
	WAIT		FEATHER_WAIT
	ADD_ACTOR	ActFeatherDanceHeader,D_UP,8,	0,-16,0x00E0,0x0002,0x0068,0x2C28,32,0x0001
	ADD_ACTOR	ActFeatherDanceHeader,D_UP,8,	0,-16,0x0080,0x0002,0x0068,0x2C28,32,0x0001
	WAIT		FEATHER_WAIT
	ADD_ACTOR	ActFeatherDanceHeader,D_UP,8,	0,-16,0x00C0,0x0002,0x0068,0x2C28,32,0x0001
	ADD_ACTOR	ActFeatherDanceHeader,D_UP,8,	0,-16,0x00A0,0x0002,0x0068,0x2C28,32,0x0001
	WAIT		FEATHER_WAIT
	ADD_ACTOR	ActFeatherDanceHeader,D_UP,8,	0,-16,0x0060,0x0002,0x0068,0x2C28,32,0x0001
//	WAIT		FEATHER_WAIT
//	ADD_ACTOR	ActFeatherDanceHeader,D_UP,8,	0,-16,0x0040,0x0002,0x0068,0x2C28,32,0x0001
//	WAIT		FEATHER_WAIT
//	ADD_ACTOR	ActFeatherDanceHeader,D_UP,8,	0,-16,0x0020,0x0002,0x0068,0x2C28,32,0x0001
//	ADD_ACTOR	ActFeatherDanceHeader,D_UP,8,	0,-16,0x0000,0x0002,0x0068,0x2C28,32,0x0001
//	WAIT		FEATHER_WAIT
//	ADD_ACTOR	ActFeatherDanceHeader,D_UP,8,	0,-16,0x00E0,0x0002,0x0068,0x2C28,32,0x0001
//	ADD_ACTOR	ActFeatherDanceHeader,D_UP,8,	0,-16,0x0080,0x0002,0x0068,0x2C28,32,0x0001
//	WAIT		FEATHER_WAIT
//	ADD_ACTOR	ActFeatherDanceHeader,D_UP,8,	0,-16,0x00C0,0x0002,0x0068,0x2C28,32,0x0001
//	ADD_ACTOR	ActFeatherDanceHeader,D_UP,8,	0,-16,0x00A0,0x0002,0x0068,0x2C28,32,0x0001
//	WAIT		FEATHER_WAIT
//	ADD_ACTOR	ActFeatherDanceHeader,D_UP,8,	0,-16,0x0060,0x0002,0x0068,0x2C28,32,0x0001
	WAIT_FLAG
	POKEBG_RESET	3
	SEQEND

@======================================================
@	298  フラフラダンス
@======================================================
#define FURAFURA_WAIT  (24)
WEST_FurafuraDance:
	CHAR_SET	WAZACHR_ID_ONPU
	CHAR_SET	WAZACHR_ID_HIYOKO

	ADD_TASK	TaskFurafuraDance,PRI5,0,
	ADD_ACTOR	FuraOnpuHeader,A_UP+2, 3, 0,16,-2,
	SEPLAY_PAN	SE_W298,WAZA_SE_L,
	WAIT		FURAFURA_WAIT
	ADD_ACTOR	FuraOnpuHeader,A_UP+2, 3, 0, 0,-2,
	SEPLAY_PAN	SE_W298,WAZA_SE_L,
	WAIT		FURAFURA_WAIT
	ADD_ACTOR	FuraOnpuHeader,A_UP+2, 3, 0,-16,-2,
	SEPLAY_PAN	SE_W298,WAZA_SE_L,
	WAIT		FURAFURA_WAIT
	ADD_ACTOR	FuraOnpuHeader,A_UP+2, 3, 1,-8,-2,
	SEPLAY_PAN	SE_W298,WAZA_SE_L,
	WAIT		FURAFURA_WAIT
	ADD_ACTOR	FuraOnpuHeader,A_UP+2, 3, 2,8,-2,
	SEPLAY_PAN	SE_W298,WAZA_SE_L,

	SEQEND

@======================================================
@	300  どろあそび
@======================================================
#define DOROASOBI_WAIT  (24)  // 「はねる」１回分
WEST_DoroAsobi:
	CHAR_SET	WAZACHR_ID_SUNA
	ADD_TASK	TaskHaneru,PRI2,2,0,6,
	WAIT		DOROASOBI_WAIT
	ADD_ACTOR	DoroAsobiHeader,D_UP+2, 3, 0,-4,-16,
	ADD_ACTOR	DoroAsobiHeader,D_UP+2, 3, 0,4,-12,
	SEPLAY_PAN	SE_W091,WAZA_SE_L,
	WAIT		DOROASOBI_WAIT+8
	ADD_ACTOR	DoroAsobiHeader,D_UP+2, 3, 0,-3,-12,
	ADD_ACTOR	DoroAsobiHeader,D_UP+2, 3, 0,5,-14,
	SEPLAY_PAN	SE_W091,WAZA_SE_L,
	WAIT		DOROASOBI_WAIT+8
	ADD_ACTOR	DoroAsobiHeader,D_UP+2, 3, 0,-5,-18,
	ADD_ACTOR	DoroAsobiHeader,D_UP+2, 3, 0,3,-14,
	SEPLAY_PAN	SE_W091,WAZA_SE_L,
	WAIT		16

	ADD_ACTOR	DoroAsobiHeader,D_UP+2, 3, 1,  220,60,
	SE_WAITPLAY	SE_W145B,0,15,
	WAIT		2
	ADD_ACTOR	DoroAsobiHeader,D_UP+2, 3, 1, 60,100,
	SE_WAITPLAY	SE_W145B,0,25,
	WAIT		2
	ADD_ACTOR	DoroAsobiHeader,D_UP+2, 3, 1, 140,55,
	SE_WAITPLAY	SE_W145B,0,14,
	WAIT		2
	ADD_ACTOR	DoroAsobiHeader,D_UP+2, 3, 1, 180,50,
	SE_WAITPLAY	SE_W145B,0,10,
	WAIT		2
	ADD_ACTOR	DoroAsobiHeader,D_UP+2, 3, 1,  20, 90,
	SE_WAITPLAY	SE_W145B,0,22,
	WAIT		2
	ADD_ACTOR	DoroAsobiHeader,D_UP+2, 3, 1, 90,90,
	SE_WAITPLAY	SE_W145B,0,22,
	WAIT		2
	ADD_ACTOR	DoroAsobiHeader,D_UP+2, 3, 1, 160,60,
	SE_WAITPLAY	SE_W145B,0,15,
	WAIT		2
	ADD_ACTOR	DoroAsobiHeader,D_UP+2, 3, 1, 30,90,
	SE_WAITPLAY	SE_W145B,0,22,
	WAIT		2
	ADD_ACTOR	DoroAsobiHeader,D_UP+2, 3, 1, 120,60,
	SE_WAITPLAY	SE_W145B,0,15,
	WAIT		2
	ADD_ACTOR	DoroAsobiHeader,D_UP+2, 3, 1, 200,40,
	SE_WAITPLAY	SE_W145B,0,10,
	
	SEQEND

@======================================================
@	302  ニードルアーム
@======================================================
#define NEEDLEARM_SPEED   (16)
#define NEEDLEARM_WAIT    (2)
#define NEEDLEARM_SPEED2  (10)
WEST_NeedleArm:
	CHAR_SET	WAZACHR_ID_NEEDLEARM
@	CHAR_SET	WAZACHR_ID_HARI2
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_KAKUTOU

	SE_REPEAT	SE_W030,WAZA_SE_R,2,16,
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,0,  0,-32,NEEDLEARM_SPEED
	WAIT		NEEDLEARM_WAIT
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,0, 22,-22,NEEDLEARM_SPEED
	WAIT		NEEDLEARM_WAIT
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,0, 30,  0,NEEDLEARM_SPEED
	WAIT		NEEDLEARM_WAIT
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,0, 20, 20,NEEDLEARM_SPEED
	WAIT		NEEDLEARM_WAIT
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,0,  0, 28,NEEDLEARM_SPEED
	WAIT		NEEDLEARM_WAIT
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,0,-19, 19,NEEDLEARM_SPEED
	WAIT		NEEDLEARM_WAIT
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,0,-27,  0,NEEDLEARM_SPEED
	WAIT		NEEDLEARM_WAIT
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,0,-18,-18,NEEDLEARM_SPEED
	WAIT		NEEDLEARM_WAIT
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,0,  0,-25,NEEDLEARM_SPEED
	WAIT		NEEDLEARM_WAIT
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,0, 17,-17,NEEDLEARM_SPEED
	WAIT		NEEDLEARM_WAIT
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,0, 23,  0,NEEDLEARM_SPEED
	WAIT		NEEDLEARM_WAIT
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,0, 16, 16,NEEDLEARM_SPEED


	WAIT_FLAG
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,4,0,18,1
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 0,0,1,1
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+4,5, 0,0, 8, 1,0
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,1,  0,-24,NEEDLEARM_SPEED2
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,1, 17,-17,NEEDLEARM_SPEED2
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,1, 24,  0,NEEDLEARM_SPEED2
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,1, 17, 17,NEEDLEARM_SPEED2
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,1,  0, 24,NEEDLEARM_SPEED2
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,1,-17, 17,NEEDLEARM_SPEED2
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,1,-24,  0,NEEDLEARM_SPEED2
	ADD_ACTOR	NeedleArmHeader,D_UP+2,  5, 1,1,-17,-17,NEEDLEARM_SPEED2

	SEQEND

@======================================================
@	303  なまける
@======================================================
WEST_Namakeru:
	CHAR_SET	WAZACHR_ID_PIKARI
	ADD_TASK	TaskNamakeru, PRI2, 1, 0,
	SEPLAY_PAN	SE_W281,WAZA_SE_L,
	WAIT_FLAG
	SEQ_CALL	WEST_Pikari
//	SEPLAY_PAN	SE_W071B,WAZA_SE_L,
	WAIT_FLAG
	SEQEND

@======================================================
@	306 ブレイククロー
@======================================================
WEST_BreakCrow:
	CHAR_SET	WAZACHR_ID_MIRROR1
	CHAR_SET	WAZACHR_ID_KIRISAKU
	CHAR_SET	WAZACHR_ID_KAWARA
	POKEBG		1
	BLDALPHA_SET	0x0c,0x08

//	ADD_ACTOR	ActKawaraWariMirror,D_UP+1,5, 1,0,0,50,10
//	WAIT        8
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,6,4
	WAIT		4
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,18,1
	ADD_ACTOR	ActMetaruKuroHeader,D_UP+2,3, -10,-10,0
	ADD_ACTOR	ActMetaruKuroHeader,D_UP+2,3, -10,10,0
	SEPLAY_PAN	SE_W013,WAZA_SE_R,
	WAIT		12
	ADD_ACTOR	ActMetaruKuroHeader,D_UP+2,3, 10,-10,1
	ADD_ACTOR	ActMetaruKuroHeader,D_UP+2,3, 10,10,1
	SEPLAY_PAN	SE_W013,WAZA_SE_R,
	WAIT_FLAG
//	ADD_ACTOR	ActKawaraHeader, PRI2, 4, 1,0,-8,-12,
//	ADD_ACTOR	ActKawaraHeader, PRI2, 4, 1,1, 8,-12,
//	ADD_ACTOR	ActKawaraHeader, PRI2, 4, 1,2,-8, 12,
//	ADD_ACTOR	ActKawaraHeader, PRI2, 4, 1,3, 8, 12,
//	SEPLAY_PAN	SE_W280,WAZA_SE_R,

	WAIT_FLAG

	BLDALPHA_RESET
	POKEBG_RESET	1

	SEQEND
@======================================================
@	312:アロマセラピー
@======================================================
WEST_AromaTherapy:
	SEPLAY_PAN	SE_W080,0
	CHAR_SET	WAZACHR_ID_HANA
	CHAR_SET	WAZACHR_ID_HAMON
	CHAR_SET	WAZACHR_ID_KIRAKIRA2
	ADD_ACTOR	ActFadeHeader,A_UP,5, 0x01,0, 0,7,0x33ed
	WAIT		1
	POKEBG		0
	WAIT		1
	ADD_ACTOR	AromaTherapyHeader,A_UP,7,		 24,16,0,2,2,0,0
	ADD_ACTOR	AromaTherapyHeader,A_DOWN+2,7,	 64,24,0,3,1,1,0
	ADD_ACTOR	AromaTherapyHeader2,A_UP,7,		 16,24,0,2,1,0,0
	WAIT		20
	ADD_ACTOR	AromaTherapyHeader,A_DOWN+2,7,	 48,12,0,4,3,1,0
	ADD_ACTOR	AromaTherapyHeader,A_UP,7,		100,16,0,3,2,0,0
	ADD_ACTOR	AromaTherapyHeader,A_UP,7,		74,24,180,3,2,0,0
	WAIT		10
	ADD_ACTOR	AromaTherapyHeader,A_DOWN+2,7,	 80,30,0,4,1,1,0
	ADD_ACTOR	AromaTherapyHeader,A_UP,7,		128,12,0,3,3,0,0
	ADD_ACTOR	AromaTherapyHeader2,A_UP,7,		 90,16,0,2,1,0,0
	WAIT_FLAG
	POKEBG_RESET	0
	WAIT		1
	ADD_ACTOR	ActFadeHeader,A_UP,5,	0x01,0, 7,0,0x33ed
	WAIT		1
	SEPLAY_PAN	SE_W287, WAZA_SE_L,
	ADD_TASK	RefleshTask,PRI2,1,		1
	WAIT_FLAG
	SEPLAY_PAN	SE_W234, WAZA_SE_L,
	ADD_ACTOR	ActKirakira2MHeader,A_UP+16,7, -15,0,0,0x0000,0x0020,60,1
	WAIT		8
	ADD_ACTOR	ActKirakira2MHeader,A_UP+16,7, 12,-5,0,0x0000,0x0020,60,1
	WAIT_FLAG
	SEPLAY_PAN	SE_REAPOKE, WAZA_SE_L,
	ADD_ACTOR	ActFadeHeader,A_UP,5,	0x2B,3, 10,0,0x33ed	//0x7b0c
	ADD_ACTOR	HamonMHeader,A_UP+16,4,	0,0,0,1
	WAIT_FLAG
	SEQEND

@======================================================
@	313  うそなき
@======================================================
WEST_UsoNaki:
	CHAR_SET	WAZACHR_ID_MIZU2
	CHAR_SET	WAZACHR_ID_FUKIDASI
	CHAR_SET	WAZACHR_ID_ONPU

	ADD_TASK	WazaChrColorFade,PRI5, 5, WAZACHR_ID_MIZU2,0,4,4,0x7d6c
	WAIT_FLAG

	ADD_TASK	TaskPokeSwing, PRI5, 3, 0,2,1,
	SE_REPEAT	SE_W039,WAZA_SE_L,12,4,
	WAIT		8
	ADD_ACTOR	UsonakiHeader, A_UP+2, 2, 0,0,
	ADD_ACTOR	UsonakiHeader, A_UP+2, 2, 0,1,
	WAIT		8
	ADD_ACTOR	UsonakiHeader, A_UP+2, 2, 0,2,
	ADD_ACTOR	UsonakiHeader, A_UP+2, 2, 0,3,
	WAIT		8
	ADD_ACTOR	UsonakiHeader, A_UP+2, 2, 0,0,
	ADD_ACTOR	UsonakiHeader, A_UP+2, 2, 0,1,
	WAIT		8
	ADD_ACTOR	UsonakiHeader, A_UP+2, 2, 0,2,
	ADD_ACTOR	UsonakiHeader, A_UP+2, 2, 0,3,
	WAIT_FLAG

//	ADD_TASK	StatusEffectTask,PRI5,5, 1,6,1,0,1,
//	WAIT_FLAG

//	ADD_ACTOR	ActFukidashiHeader, A_UP+11, 2, 0,80,
//	SEPLAY_PAN	SE_W118, WAZA_SE_L,
//	WAIT		6	@ フキダシ出現までのウェイト
//	ADD_ACTOR	UsonakiOnpuHeader, A_UP+12, 1,0,

//	ADD_TASK	TaskHaneru,PRI2,2,0,2,

	SEQEND

@======================================================
@	314:エアカッター
@======================================================
WEST_AirCutter:
	CHAR_SET	WAZACHR_ID_SONIC
	CHAR_SET	WAZACHR_ID_KIRISAKU2
	CHAR_SET	WAZACHR_ID_HITMARK
	WAIT		0
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	WAIT		0
	ADD_TASK	TaskAirCutterInit,PRI2,5,	32,-24,0x0600,2,D_UP
	WAIT_FLAG
	SEPLAY_PAN	SE_W015,WAZA_SE_R
	ADD_ACTOR	ActIaigiriMHeader,A_UP+2,4,  40,-32,0,2
	WAIT		5
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,8,1
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 3,2,0,8,1
	WAIT_FLAG
	BLDALPHA_RESET
	POKEBG_RESET	3
	WAIT		0
	SEQEND

@======================================================
@	316 かぎわける
@======================================================
WEST_Kagiwakeru:
#if 0
	POKEBG			1
	ADD_TASK	TaskKagiwakeru,PRI5,0,
	SE_REPEAT	SE_W207,WAZA_SE_L,4,2,
	WAIT_FLAG
	POKEBG_RESET	1
	WAIT	1
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 1,3,1,0xFFFF,16,0xffff,0
	SEPLAY_PAN	SE_W043,WAZA_SE_L,
	SEQEND
#else
	POKEBG			1
	ADD_TASK	TaskKagiwakeru,PRI5,0,
	WAIT		24
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,3,4
	SEPLAY_PAN	SE_W207,WAZA_SE_L,
	WAIT		6
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,3,4
	SEPLAY_PAN	SE_W207,WAZA_SE_L,
	WAIT_FLAG
	POKEBG_RESET	1
	WAIT	1
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 1,3,1,0xFFFF,16,0xffff,0
	SEPLAY_PAN	SE_W043,WAZA_SE_L,
	SEQEND
#endif

@======================================================
@	320 くさぶえ
@======================================================
WEST_Kusabue:
	CHAR_SET	WAZACHR_ID_ONPU

	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 0x01,2,0,4,0x33f2
	WAIT_FLAG

	ADD_TASK	TaskUtauPalReg, PRI2, 0,
	WAIT_FLAG
	SEPAN_FLOW	SE_W320,WAZA_SE_L,WAZA_SE_R,2,0

	ADD_ACTOR	ActUtauHeader,D_UP+2,3,7,1,0
	WAIT		5
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,6,1,0
	WAIT		5
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,1,1,0
	WAIT		5
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,2,1,0
	WAIT		5
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,3,1,0
	WAIT		4
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,2,1,0
	WAIT		4
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,5,1,0
	WAIT		4
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,6,1,0
	WAIT		4
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,2,1,0
	WAIT		4
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,2,1,0
	WAIT		4
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,1,1,0
	WAIT		4
	ADD_ACTOR	ActUtauHeader,D_UP+2,3,5,1,0
	WAIT		4
	WAIT_FLAG

	ADD_TASK	TaskUtauPalDel, PRI2, 0,
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 0x01,4,4,0,0x33f2
	WAIT_FLAG

	SEQEND

@======================================================
@	321 くすぐる
@======================================================
WEST_Kusuguru:
	CHAR_SET	WAZACHR_ID_KIRARI

	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 2,0, 0,16,0x0000
	WAIT_FLAG
	ADD_ACTOR	KirariActHeader,A_UP+0,2,-16,-8
	ADD_ACTOR	KirariActHeader,A_UP+0,2, 16,-8
	SEPLAY_PAN	SE_W197,WAZA_SE_L,
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 2,0, 16,0,0x0000
	WAIT_FLAG

	WAIT		20

	ADD_TASK	PokeSinMove,PRI3,5,0,6,0x500,3,0,
	WAIT		12
	ADD_TASK	TaskPokeSwing, PRI3, 3,1,6,2,
	SE_REPEAT	SE_W039,WAZA_SE_R,8,8,
	WAIT_FLAG
//	ADD_TASK	StatusEffectTask,PRI5,5, 1,0xff,1,0,0
	SEQEND


@======================================================
@	323  しおふき
@======================================================
WEST_SioFuki:
	CHAR_SET	WAZACHR_ID_SIOFUKI
	CHAR_SET	WAZACHR_ID_MIZUHIT

	POKEBG		3
	BLDALPHA_SET	0x0c,0x08

	ADD_TASK	TaskShiofuki,PRI5,0,
	SEPLAY_PAN	SE_W029,WAZA_SE_L,
	WAIT		44
	SEPLAY_PAN	SE_W291,WAZA_SE_L,

	WAIT_FLAG

	WAIT		16

	ADD_TASK	TaskShiofuki2nd, PRI5,0,
	SEPLAY_PAN	SE_W057,WAZA_SE_R,

	POKEBG_RESET	3
	BLDALPHA_RESET


	SEQEND

@======================================================
@	325 シャドーパンチ
@======================================================
WEST_ShadowPunch:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_KAKUTOU

	HAIKEI_CHG		WAZAMAP_ID_GHOST
	HAIKEI_CHG_WAIT
	POKEBG			2
	BLDALPHA_SET	0x9,0x8

	ADD_TASK	TaskMachPunch,PRI2,2,0x0000,0x0d
	SEPLAY_PAN	SE_W026, WAZA_SE_L
	WAIT		6   @ 移動幅が最大になったところでヒットマークを出すためのウェイト
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 0,0,1,1
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+4,5, 0,0, 8, 1,0
	SEPLAY_PAN	SE_W004, WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,6,1
	WAIT_FLAG

	POKEBG_RESET	2
	BLDALPHA_RESET

	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT

	SEQEND


@======================================================
@	326 じんつうりき
@======================================================
WEST_JintuRiki:
	SEQ_CALL	WEST_ESP_MAPCHG

	POKEBG		3
	BLDALPHA_SET	0x0c,0x08

	ADD_TASK	TaskPokeFadeCtrl,PRI5,5, 0,0x037b,12,1,1,
	ADD_TASK	TaskJintuRiki, PRI5,1,0,
	SEPLAY_PAN	SE_W020,WAZA_SE_R,
	WAIT_FLAG
	ADD_TASK	TaskPokeFadeCtrl,PRI5,5, 0,0x037b,12,1,1,
	ADD_TASK	TaskJintuRiki, PRI5,1,1,
	SEPLAY_PAN	SE_W020,WAZA_SE_R,
	WAIT_FLAG
	ADD_TASK	TaskJintuRikiZanzou,PRI5, 1,0,
	ADD_TASK	TaskJintuRiki, PRI5,1,2,
	SEPLAY_PAN	SE_W043,WAZA_SE_L,
	WAIT_FLAG

	BLDALPHA_RESET
	POKEBG_RESET 3

	SEQ_CALL	WEST_ESP_MAPEND

	SEQEND

@======================================================
@	332 つばめがえし
@======================================================
WEST_TubameGaeshi:
	CHAR_SET	WAZACHR_ID_KIRISAKU2
	POKEBG		1
	BLDALPHA_SET	0xc,0x8

	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5, 0,24,6, 1,5
	ADD_TASK	TaskPokeZanzou, PRI2,4,0,4,7,3
	ADD_ACTOR	ActIaigiriHeader,A_UP+2,3,  40,-32,0
	SEPLAY_PAN	SE_W013B,WAZA_SE_L
	WAIT		5
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,0,3,10,1
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 31,3,1,0x0000,10,0,0
	SEPLAY_PAN	SE_W013,WAZA_SE_R
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET

	SEQEND

@======================================================
@	334  てっぺき
@======================================================
WEST_Teppeki:
	SE_REPEAT	SE_REAPOKE,WAZA_SE_L,28,2
	ADD_TASK	MetaruEffectTask,PRI5,3,0,0,0
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 1,8,2,0xffff,14,0xffff,0
	WAIT_FLAG
	SEQEND

@======================================================
@	335  とおせんぼう
@======================================================
WEST_Tosenbou:
	CHAR_SET	WAZACHR_ID_HUUINBATSU
	ADD_ACTOR	ActTosenbou,D_DOWN+2,0,
	SEPLAY_PAN	SE_W207,WAZA_SE_R,
	SEQEND

@======================================================
@	336  とおぼえ
@======================================================
WEST_Tooboe:
	CHAR_SET	WAZACHR_ID_HOERU
	ADD_TASK	TaskAkubi, PRI2, 1, 0,
	WAIT		12
	SEQ_CALL	WEST_HoeruSub
	ADD_TASK	PokeVoicePlayTask,PRI2,2, 0,3
	WAIT_FLAG
//	ADD_TASK	StatusEffectTask,PRI5,5, 0,0,0,0,0,
	WAIT		30	//ﾀｽｸがDelする前に終了しているようなのでｳｪｲﾄを入れる by matsuda
	SEQEND

@======================================================
@	339  ビルドアップ
@======================================================
WEST_BuildUp:
	CHAR_SET	WAZACHR_ID_HANAIKI
	ADD_TASK	TaskIbaru,PRI2,0,
	SEPLAY_PAN	SE_W207,WAZA_SE_L,
	WAIT_FLAG
	ADD_ACTOR	ActIbaruHanaikiHeader,A_UP+2,0,
	SE_REPEAT	SE_W207,WAZA_SE_L,4,2,
	WAIT_FLAG
//	ADD_TASK	StatusEffectTask,PRI5,5,0,0xff,0,0,0
	SEQEND

@======================================================
@	343  ほしがる
@======================================================
WEST_Hoshigaru:
	CHAR_SET	WAZACHR_ID_HEART2
	CHAR_SET	WAZACHR_ID_FUKURO3

	ADD_TASK	TaskPokeSwing, PRI5, 3, 0,2,0,
	ADD_ACTOR	HeartHeader,A_UP+3,2, 0,20
	SEPLAY_PAN	SE_W204,WAZA_SE_L,
	WAIT		15
	ADD_ACTOR	HeartHeader,A_UP+3,2, -20,20
	SEPLAY_PAN	SE_W204,WAZA_SE_L,
	WAIT		15
	ADD_ACTOR	HeartHeader,A_UP+3,2, 20,20
	SEPLAY_PAN	SE_W204,WAZA_SE_L,
	WAIT_FLAG
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,8,1
	SE_REPEAT	SE_W146,WAZA_SE_R,4,3,

//	ADD_ACTOR	ActHoshigaruFukuroHeader,A_UP+2,5, 0,-5,10, 2,-1
//	SEPLAY_PAN	SE_W233,WAZA_SE_R,

	SEQEND

@======================================================
@	344  ボルテッカー
@======================================================
WEST_Voltecker:
	CHAR_SET	WAZACHR_ID_KAMINARI
	CHAR_SET	WAZACHR_ID_JUUDEN2
	CHAR_SET	WAZACHR_ID_JUUDEN3

	POKEBG			0
	BLDALPHA_SET	0x0c,0x08

	ADD_TASK	ColorFadeSeq,PRI10,5, 1,0,0,8,0x0000
	WAIT_FLAG

	ADD_ACTOR	VoltHikariHeader,A_UP+1,0,
	SEPLAY_PAN	SE_W268,WAZA_SE_L,
	WAIT_FLAG
	POKEBG_RESET	0
	BLDALPHA_RESET
	WAIT			8
	ADD_TASK	TaskVoltLine,PRI5,1,0,
	SEPLAY_PAN	SE_W085,WAZA_SE_L,
	WAIT_FLAG
	ADD_TASK	TaskVoltLine,PRI5,1,1,
	SEPLAY_PAN	SE_W085,WAZA_SE_R,
	WAIT_FLAG
	ADD_TASK	TaskVoltLine,PRI5,1,2,
	SEPLAY_PAN	SE_W085,WAZA_SE_L,
	WAIT_FLAG
	ADD_TASK	TaskVoltLine,PRI5,1,3,
	SEPLAY_PAN	SE_W085,WAZA_SE_R,
	WAIT_FLAG
	ADD_TASK	TaskVoltLine,PRI5,1,4,
	SEPLAY_PAN	SE_W085,WAZA_SE_L,
	WAIT        8
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,10,0,18,1
	SEPLAY_PAN	SE_W120,WAZA_SE_R,
	ADD_ACTOR	ActJuden3, A_UP+2,3, 1,16,16,
	WAIT		2
	ADD_ACTOR	ActJuden3, A_UP+2,3, 1,-16,-16
	WAIT		8
	ADD_TASK	TaskVolteckerAppear,PRI5,0,
	WAIT_FLAG
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,3,0,9,1
	SEPLAY_PAN	SE_W085B,WAZA_SE_L,
	ADD_ACTOR	ActJuden3, A_UP+2,3, 0,16,16,
	WAIT		2
	ADD_ACTOR	ActJuden3, A_UP+2,3, 0,-16,-16
	WAIT_FLAG

	ADD_TASK	ColorFadeSeq,PRI10,5, 1,0,8,0,0x0000
	WAIT_FLAG

	SEQEND

@======================================================
@	346  みずあそび
@======================================================
WEST_MizuAsobi:
	CHAR_SET	WAZACHR_ID_SIOFUKI

	ADD_TASK	TaskMizuAsobi,PRI5,0,
	WAIT		8
	SEPLAY_PAN	SE_W057,WAZA_SE_L,
	WAIT		44
	SEPLAY_PAN	SE_W057,WAZA_SE_L,
	WAIT		44
	SEPLAY_PAN	SE_W057,WAZA_SE_L,
	WAIT		44
	SEPAN_FLOW	SE_W057,WAZA_SE_L,WAZA_SE_R,2,0

	SEQEND

@======================================================
@	347  めいそう
@======================================================
WEST_Meisou:
	CHAR_SET	WAZACHR_ID_HAMON

	POKEBG		2

	ADD_TASK	ExceptColorFadeSeq,PRI5,5, 0,0,0,16,0x0000  @ 自分以外全部
	WAIT_FLAG

	ADD_TASK	W_PokeBanishCtrl, PRI5,1,1,
	WAIT_FLAG

	ADD_ACTOR	Hamon2Header,A_UP+40,4, 0,0,0,0,
	SEPLAY_PAN	SE_W048,WAZA_SE_L,
	WAIT		14
	ADD_ACTOR	Hamon2Header,A_UP+40,4, 0,0,0,0,
	SEPLAY_PAN	SE_W048,WAZA_SE_L,
	WAIT		14
	ADD_ACTOR	Hamon2Header,A_UP+40,4, 0,0,0,0,
	SEPLAY_PAN	SE_W048,WAZA_SE_L,
	WAIT_FLAG

	ADD_TASK	W_PokeBanishCtrl, PRI5,1,0,
	WAIT_FLAG
	ADD_TASK	ExceptColorFadeSeq,PRI5,5, 0,0,16,0,0x0000  @ 自分以外全部
	WAIT_FLAG

	POKEBG_RESET  2
//	ADD_TASK	StatusEffectTask,PRI5,5, 0,0xff,0,0,0,

	SEQEND

@======================================================
@	348  リーフブレード
@======================================================
WEST_LeafBlade:
	CHAR_SET	WAZACHR_ID_HAPPA
	CHAR_SET	WAZACHR_ID_XHITMARK

	ADD_TASK	TaskLeafBlade,PRI5,0,
	WAIT		2
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,8,1
	SEPLAY_PAN	SE_W015,WAZA_SE_R,
	WAIT		50
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,8,1
	SEPLAY_PAN	SE_W015,WAZA_SE_R,
	WAIT		50
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,8,1
	SEPLAY_PAN	SE_W015,WAZA_SE_R,
	WAIT_FLAG

	POKEBG		1
	BLDALPHA_SET	0x0c,0x08
	WAIT		12

	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,8,0,18,1
	ADD_ACTOR	ActXHitMarkHeader,D_UP+2,4,  0,0,1,36,
	SEPLAY_PAN	SE_W043,WAZA_SE_R,

	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET

	SEQEND

@======================================================
@	349  りゅうのまい
@======================================================
WEST_RyunoMai:
	CHAR_SET	WAZACHR_ID_HUUIN

	POKEBG	0
	BGPRI_GAPSET    BG_ATTACK
	WAIT		1

	ADD_TASK	TaskRyunomai, PRI5, 0,
	SEPLAY_PAN	SE_W100,WAZA_SE_L,

	WAIT		8
	ADD_TASK	TaskCharFadeCtrl,PRI5,5,  WAZACHR_ID_HUUIN,0x4c00,14,0,3,
	ADD_ACTOR	RyuNoMaiHeader,A_UP+2, 1,0,
	ADD_ACTOR	RyuNoMaiHeader,A_UP+2, 1,43,
	ADD_ACTOR	RyuNoMaiHeader,A_UP+2, 1,85,
	ADD_ACTOR	RyuNoMaiHeader,A_UP+2, 1,128,
	ADD_ACTOR	RyuNoMaiHeader,A_UP+2, 1,170,
	ADD_ACTOR	RyuNoMaiHeader,A_UP+2, 1,213,
	WAIT		30
	SEPLAY_PAN	SE_W100,WAZA_SE_L,
	WAIT		30
	SEPLAY_PAN	SE_W100,WAZA_SE_L,
	WAIT_FLAG

	POKEBG_RESET	0
	WAIT			1

//	ADD_TASK	StatusEffectTask,PRI5,5, 0,0xff,0,0,0,

	SEQEND

@======================================================
@	351  でんげきは
@======================================================
WEST_Dengekiha:
	CHAR_SET	WAZACHR_ID_JUUDEN1
	CHAR_SET	WAZACHR_ID_JUUDEN2
	CHAR_SET	WAZACHR_ID_KAMINARI
	CHAR_SET	WAZACHR_ID_THUNDER2

	POKEBG		0
	BLDALPHA_SET	0x0c,0x08

	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 0x01,2,0,4,0x0000
	WAIT_FLAG

	ADD_TASK	TaskJuden1, PRI2,4, 0,20,0,2,  @ 細かい光り
	SEPLAY_PAN	SE_W268,WAZA_SE_L,
	WAIT		12
	ADD_ACTOR	DengekihaBallHeader, A_UP+2, 0,
	WAIT		30
	ADD_TASK	TaskDengekihaLine,PRI5,0,
	WAIT		12
//	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 1,12,5,0x7fff,15,0x0000,4
	WAIT_FLAG
	ADD_TASK	TaskDengekihaThunder,PRI5,0,
	SEPLAY_PAN	SE_W161B,WAZA_SE_R,
	WAIT_FLAG
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,0,6,18,1
	ADD_TASK	ColorFadeSeq,PRI5,5, 1,3,16,0,0x7fff
	ADD_TASK	ColorFadeSeq,PRI5,5, 4,0,16,16,0x0000
	WAIT		4
	ADD_TASK	ColorFadeSeq,PRI5,5, 4,0,0,0,0x0000
	WAIT_FLAG

	POKEBG_RESET	0
	BLDALPHA_RESET

	SEQEND


@======================================================
@	かたくなる
@======================================================
WEST_KatakuNaru:
	SE_REPEAT	SE_W231,WAZA_SE_L,28,2
	ADD_TASK	MetaruEffectTask,PRI5,3,0,0,0
	WAIT_FLAG
	SEQEND

@======================================================
@	はらだいこ
@======================================================
WEST_HaraDaiko:
	CHAR_SET	WAZACHR_ID_ONPU
	CHAR_SET	WAZACHR_ID_HIRATE2

	ADD_TASK	TaskUtauPalReg, PRI2, 0
	WAIT_FLAG

	SEQ_CALL	WEST_HaraDaikoRight
	ADD_ACTOR	HaraOnpuHeader,A_UP+2,4, 0,0,0,0
	SEPLAY_PAN	SE_W187,WAZA_SE_L
	WAIT		15
	SEQ_CALL	WEST_HaraDaikoLeft
	ADD_ACTOR	HaraOnpuHeader,A_UP+2,4, 1,1,1,0
	SEPLAY_PAN	SE_W187,WAZA_SE_L
	WAIT		15
	SEQ_CALL	WEST_HaraDaikoRight
	ADD_ACTOR	HaraOnpuHeader,A_UP+2,4, 0,3,3,128
	SEPLAY_PAN	SE_W187,WAZA_SE_L
	WAIT		7
	SEQ_CALL	WEST_HaraDaikoLeft
	ADD_ACTOR	HaraOnpuHeader,A_UP+2,4, 1,2,0,128
	SEPLAY_PAN	SE_W187,WAZA_SE_L
	WAIT		7
	SEQ_CALL	WEST_HaraDaikoRight
	ADD_ACTOR	HaraOnpuHeader,A_UP+2,4, 0,1,1,0
	SEPLAY_PAN	SE_W187,WAZA_SE_L
	WAIT		7
	SEQ_CALL	WEST_HaraDaikoLeft
	ADD_ACTOR	HaraOnpuHeader,A_UP+2,4, 1,0,3,0
	SEPLAY_PAN	SE_W187,WAZA_SE_L
	WAIT_FLAG
//	SEQ_CALL	WEST_StatusUpEffect
//	WAIT_FLAG
	
	ADD_TASK	TaskUtauPalDel, PRI2, 0
	WAIT_FLAG

	SEQEND

WEST_HaraDaikoLeft:
	ADD_ACTOR	HirateHeader,A_UP+3,1, 0
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 0,0,8,2,1
	END_CALL

WEST_HaraDaikoRight:
	ADD_ACTOR	HirateHeader,A_UP+3,1, 1
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 0,0,8,2,1
	END_CALL

@======================================================
@	こころのめ
@======================================================
#define KOKORO_HOUSYASEN_WAIT	2
#define HOUSYASEN_SYNC		6
WEST_KokoronoMe:
	CHAR_SET	WAZACHR_ID_SYUUTYUU
	CHAR_SET	WAZACHR_ID_EYE
	CHAR_SET	WAZACHR_ID_HIKARI
	POKEBG		4
	SEPLAY_PAN	SE_W109,WAZA_SE_R
	ADD_ACTOR	EyeHeader,A_UP+5,4, 0,0,1,0
	ADD_ACTOR	HikariHeader,A_UP+5,0
	WAIT		40
	SEPLAY_PAN	SE_W043,WAZA_SE_R
	ADD_TASK	WazaTaskColorFade,PRI2,6, 1,1,2,0,10,0x0000
	SEQ_CALL	WEST_KokoronoMeSub
	WAIT_FLAG
	POKEBG_RESET	4
	SEQEND

WEST_KokoronoMeSub:
	ADD_ACTOR	SyuutyuuHeader,A_UP+4,3, 70,0,HOUSYASEN_SYNC
	ADD_ACTOR	SyuutyuuHeader,A_UP+4,3, 40,40,HOUSYASEN_SYNC
	ADD_ACTOR	SyuutyuuHeader,A_UP+4,3, 10,-60,HOUSYASEN_SYNC
	ADD_ACTOR	SyuutyuuHeader,A_UP+4,3, -50,-40,HOUSYASEN_SYNC
	ADD_ACTOR	SyuutyuuHeader,A_UP+4,3, -40,40,HOUSYASEN_SYNC
	ADD_ACTOR	SyuutyuuHeader,A_UP+4,3, 50,-50,HOUSYASEN_SYNC
	WAIT		KOKORO_HOUSYASEN_WAIT
	ADD_ACTOR	SyuutyuuHeader,A_UP+4,3, 50,-30,HOUSYASEN_SYNC
	ADD_ACTOR	SyuutyuuHeader,A_UP+4,3, 60,10,HOUSYASEN_SYNC
	ADD_ACTOR	SyuutyuuHeader,A_UP+4,3, 0,60,HOUSYASEN_SYNC
	ADD_ACTOR	SyuutyuuHeader,A_UP+4,3, 0,-40,HOUSYASEN_SYNC
	ADD_ACTOR	SyuutyuuHeader,A_UP+4,3, -60,20,HOUSYASEN_SYNC
	ADD_ACTOR	SyuutyuuHeader,A_UP+4,3, -60,-30,HOUSYASEN_SYNC
	WAIT		KOKORO_HOUSYASEN_WAIT
	ADD_ACTOR	SyuutyuuHeader,A_UP+4,3, -50,50,HOUSYASEN_SYNC
	ADD_ACTOR	SyuutyuuHeader,A_UP+4,3, -60,20,HOUSYASEN_SYNC
	ADD_ACTOR	SyuutyuuHeader,A_UP+4,3, -40,-40,HOUSYASEN_SYNC
	ADD_ACTOR	SyuutyuuHeader,A_UP+4,3, 20,-60,HOUSYASEN_SYNC
	ADD_ACTOR	SyuutyuuHeader,A_UP+4,3, 50,-50,HOUSYASEN_SYNC
	ADD_ACTOR	SyuutyuuHeader,A_UP+4,3, 35,40,HOUSYASEN_SYNC
	WAIT		KOKORO_HOUSYASEN_WAIT
	END_CALL

/*
	CHAR_SET	WAZACHR_ID_KOKORONOME
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1, 3,0,10,0
	WAIT_FLAG
	ADD_ACTOR	ActKokoronoMeHeader,A_UP+2,6, -25,-15, 0, 30,20, 0
	ADD_ACTOR	ActKokoronoMeHeader,A_UP+2,6, 25,-15, 1, 30,20, 0
	ADD_ACTOR	ActKokoronoMeHeader,A_UP+2,6, -25,-15, 0, 30,20+3, 1
	ADD_ACTOR	ActKokoronoMeHeader,A_UP+2,6, 25,-15, 1, 30,20+3, 1
	WAIT_FLAG
	WAIT		10
	ADD_ACTOR	ActQuakeHeader,A_UP+2,5, 2,1,20,2,1
	WAIT_FLAG
	WAIT		10
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1, 3,10,0,0
	WAIT_FLAG
	SEQEND
*/

@======================================================
@	れいとうパンチ
@======================================================
WEST_ReitouPanch:
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	CHAR_SET	WAZACHR_ID_YUKI2
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_KAKUTOU
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1,0,7,0
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,2,0,9,0x7f4c
	WAIT		20
	SEPLAY_PAN	SE_W081,WAZA_SE_R
	ADD_ACTOR	ActReitouSubHeader,A_UP+2,1, 0
	ADD_ACTOR	ActReitouSubHeader,A_UP+2,1, 64
	ADD_ACTOR	ActReitouSubHeader,A_UP+2,1, 128
	ADD_ACTOR	ActReitouSubHeader,A_UP+2,1, 192
	WAIT		5
	ADD_ACTOR	ActReitouPantiHeader,A_UP+2,1,32
	ADD_ACTOR	ActReitouPantiHeader,A_UP+2,1,96
	ADD_ACTOR	ActReitouPantiHeader,A_UP+2,1,160
	ADD_ACTOR	ActReitouPantiHeader,A_UP+2,1,224
	WAIT		17
	ADD_ACTOR	ActKakutouWaitHeader,A_UP+4,5, 0,-10, 8, 1,0
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,-10,1,1
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	WAIT		2
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,5,3,1
	WAIT_FLAG
	WAIT		15
	SEQ_CALL	WEST_IceKouka
	WAIT		5
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,2,9,0,0x7f4c
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,0,7,0,0
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND
/*
WEST_ReitouPanch:
	SE			SE_BAN
	CHAR_SET	WAZACHR_ID_OBAKE
	CHAR_SET	WAZACHR_ID_KONAYUKI
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 4, 3,0,9,0x7f4c
	WAIT		20
	ADD_ACTOR	ActReitouSubHeader,A_UP+2,1, 0
	ADD_ACTOR	ActReitouSubHeader,A_UP+2,1, 64
	ADD_ACTOR	ActReitouSubHeader,A_UP+2,1, 128
	ADD_ACTOR	ActReitouSubHeader,A_UP+2,1, 196
	WAIT		10
	ADD_ACTOR	ActReitouSubHeader,A_UP+2,1, 0
	ADD_ACTOR	ActReitouSubHeader,A_UP+2,1, 64
	ADD_ACTOR	ActReitouSubHeader,A_UP+2,1, 128
	ADD_ACTOR	ActReitouSubHeader,A_UP+2,1, 196
	WAIT		10
	ADD_ACTOR	ActReitouSubHeader,A_UP+2,1, 0
	ADD_ACTOR	ActReitouSubHeader,A_UP+2,1, 64
	ADD_ACTOR	ActReitouSubHeader,A_UP+2,1, 128
	ADD_ACTOR	ActReitouSubHeader,A_UP+2,1, 196
	ADD_ACTOR	ActReitouPanchHeader,A_UP+2,2, 0, -10
	WAIT		2
	ADD_ACTOR	ActQuakeHeader,A_UP+2,5, 4,0,5,3,1
	WAIT		4
	ADD_ACTOR	ActReitouPanchHeader,A_UP+2,2, -24, 6
	WAIT		2
	ADD_ACTOR	ActQuakeHeader,A_UP+2,5, 4,0,5,3,1
	WAIT		4
	ADD_ACTOR	ActReitouPanchHeader,A_UP+2,2, 23, 10
	WAIT		2
	ADD_ACTOR	ActQuakeHeader,A_UP+2,5, 4,0,5,3,1
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 4, 3,9,0,0x7f4c
	WAIT_FLAG
	SEQEND
*/

@======================================================
@	156 ねむる
@======================================================
WEST_Nemuru:
	SEPLAY_PAN	SE_W173,WAZA_SE_L
	CHAR_SET	WAZACHR_ID_ZZZ2
	ADD_ACTOR	ActZzzzHeader,A_UP+2,5,	4,-10,16,0,0x0
	WAIT 20
	ADD_ACTOR	ActZzzzHeader,A_UP+2,5,	4,-10,16,0,0x0
	WAIT 20
	ADD_ACTOR	ActZzzzHeader,A_UP+2,5,	4,-10,16,0,0x0
	WAIT_FLAG
	SEQEND

@======================================================
@	ねんりき
@======================================================
#define NENRIKI_AFF		(-4)
WEST_Nenriki:
	POKEBG		3
	SEQ_CALL	WEST_ESP_MAPCHG
//	WAIT_FLAG
	BLDALPHA_SET	0x8,0x8
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,1,0,10,1
	ADD_TASK	WazaTaskColorFade,PRI2,6, 2,0,2,0,8,0x7fff
	WAIT_FLAG
	SEPLAY_PAN	SE_W048,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,15,1
	ADD_TASK	PokeKakusyukuTask,PRI5,5, NENRIKI_AFF,NENRIKI_AFF,15,1,1
//	WAIT_FLAG
//	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,4,0,7,1
//	ADD_TASK	PokeKakusyukuTask,PRI5,5, NENRIKI_AFF,NENRIKI_AFF,15,1,1
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	WAIT		1
	SEQ_CALL	WEST_ESP_MAPEND
//	WAIT_FLAG
	SEQEND

@======================================================
@	サイコキネシス
@======================================================
#define SAIKOKINESISU_AFF	(-6)
WEST_Phycokinesis:
	POKEBG		3
	SEQ_CALL	WEST_ESP_MAPCHG
	BLDALPHA_SET	0x8,0x8
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,1,0,10,1
	ADD_TASK	WazaTaskColorFade,PRI2,6, 2,0,2,0,8,0x02ff
	WAIT_FLAG
	SE_REPEAT	SE_W048,WAZA_SE_R,10,3
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,5,0,15,1
	ADD_TASK	PokeKakusyukuTask,PRI5,5, SAIKOKINESISU_AFF,SAIKOKINESISU_AFF,15,1,1
//	WAIT_FLAG
//	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,7,0,7,1
//	ADD_TASK	PokeKakusyukuTask,PRI5,5, SAIKOKINESISU_AFF,SAIKOKINESISU_AFF,15,1,1
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	WAIT		1
	SEQ_CALL	WEST_ESP_MAPEND
//	WAIT_FLAG
	SEQEND

@======================================================
@	みらいよち
@======================================================
#define MIRAI_ATTACK_AFF		(-4)
#define MIRAI_DEFENCE_AFF		(-5)
WEST_Miraiyoti:
//2ﾀｰﾝ目の処理はFightEffectになったので 2002.08.30(金) by matsuda
//	TURN_CHK	WEST_MiraiyotiTurn1, WEST_MiraiyotiTurn2
	SEQ_JP	WEST_MiraiyotiTurn1
WEST_MiraiyotiReturn:
	WAIT_FLAG
	WAIT		1
	SEQ_CALL	WEST_ESP_MAPEND
//	WAIT_FLAG
	SEQEND

WEST_MiraiyotiTurn1:			//1ﾀｰﾝ目
	POKEBG		2
	SEPLAY_PAN	SE_W060,WAZA_SE_L
	SEQ_CALL	WEST_ESP_MAPCHG
//	WAIT_FLAG
	BLDALPHA_SET	0x8,0x8
	SEPLAY_PAN	SE_W048,WAZA_SE_L
	ADD_TASK	WazaTaskColorFade,PRI2,6,	0x02,0,2,0,8,0x7FFF
	ADD_TASK	PokeKakusyukuTask,PRI5,5, MIRAI_ATTACK_AFF,MIRAI_ATTACK_AFF,15,0,1
	WAIT_FLAG
	POKEBG_RESET	2
	BLDALPHA_RESET
	SEQ_JP		WEST_MiraiyotiReturn

//2ﾀｰﾝ目の処理はFightEffectになったので使用されない。ｴﾌｪｸﾄの直しはFightEffectの方を。
WEST_MiraiyotiTurn2:			//2ﾀｰﾝ目
	POKEBG		3
	SEPLAY_PAN	SE_W060,WAZA_SE_L
	SEQ_CALL	WEST_ESP_MAPCHG
//	WAIT_FLAG
	BLDALPHA_SET	0x8,0x8
	SEPLAY_PAN	SE_W048,WAZA_SE_R
	SE_WAITPLAY	SE_W048,WAZA_SE_R,8
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,4,0,15,1
	ADD_TASK	PokeKakusyukuTask,PRI5,5, MIRAI_DEFENCE_AFF,MIRAI_DEFENCE_AFF,15,1,1
	WAIT_FLAG
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,4,0,24,1
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQ_JP		WEST_MiraiyotiReturn

@======================================================
@	かみなり
@======================================================
WEST_Kaminari:
	CHAR_SET	WAZACHR_ID_THUNDER2

	HAIKEI_CHG	WAZAMAP_ID_KUMORI
	HAIKEI_HALF_WAIT
	ADD_TASK	HaikeiMapScrTask,PRI5,4, -0x0100,0x0000,1,0xffff
	HAIKEI_CHG_WAIT

	ADD_ACTOR	ActFadeHeader,A_UP+2,5,1,2,0,16,0x0
	WAIT		16
	ADD_TASK	WazaTaskColorReversal,PRI2,3, 0x0101,0x0101,0x0101	//add test
	SEPLAY_PAN	SE_W086,WAZA_SE_R
	WAIT		1
	ADD_ACTOR	ActKaminariHeader,D_UP+2,2,16,-36
	WAIT		1
	ADD_ACTOR	ActKaminariHeader,D_UP+2,2,16,-20
	WAIT		1
	ADD_ACTOR	ActKaminariHeader,D_UP+2,2,16,12
	WAIT		20
	ADD_ACTOR	ActKaminariHeader,D_UP+6,2,-16,-32
	SEPLAY_PAN	SE_W086,WAZA_SE_R
	WAIT		1
	ADD_ACTOR	ActKaminariHeader,D_UP+6,2,-16,-16
	WAIT		1
	ADD_ACTOR	ActKaminariHeader,D_UP+6,2,-16,16
	SEPLAY_PAN	SE_W086,WAZA_SE_R
	WAIT		5
	ADD_TASK	WazaTaskColorReversal,PRI2,3, 0x0101,0x0101,0x0101	//add test
	WAIT		1
	ADD_ACTOR	ActKaminariHeader,D_UP+2,2,24,-32
	WAIT		1
	ADD_ACTOR	ActKaminariHeader,D_UP+2,2,24,-16
	WAIT		1
	ADD_ACTOR	ActKaminariHeader,D_UP+2,2,24,16
	WAIT 		30
	ADD_TASK	WazaTaskColorReversal,PRI2,3, 0x0101,0x0101,0x0101	//add test
	WAIT		5
	ADD_TASK	WazaTaskColorReversal,PRI2,3, 0x0101,0x0101,0x0101	//add test
	WAIT		1
	ADD_ACTOR	ActKaminariHeader,D_UP+2,2,0,-32
	SEPLAY_PAN	SE_W161B,WAZA_SE_R
	WAIT		1
	ADD_ACTOR	ActKaminariHeader,D_UP+2,2,0,-16
	WAIT		1
	ADD_ACTOR	ActKaminariHeader,D_UP+2,2,0,16
	WAIT 10
	ADD_TASK	WazaTaskColorReversal,PRI2,3, 0x0101,0x0101,0x0101	//add test
	WAIT		1
	ADD_TASK	TaskPokeYure,PRI2,4, 30,3,1,0
	WAIT		2
	ADD_TASK	WazaTaskColorReversal,PRI2,3, 0x0101,0x0101,0x0101	//add test
	WAIT		1
	ADD_ACTOR	ActFadeHeader,D_UP+2,5,1,2,16,0,0x0
	WAIT_FLAG

	HAIKEI_RECOVER
	HAIKEI_HALF_WAIT
	WORK_SET	7,0xffff	//背景のｽｸﾛｰﾙ終了
	HAIKEI_CHG_WAIT

	SEQEND

@======================================================
@	かみなりパンチ
@======================================================
WEST_KaminariPunch:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_KAKUTOU
	CHAR_SET	WAZACHR_ID_THUNDER2
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	ADD_ACTOR	ActFadeHeader,A_UP+2,5,1,2,0,16,0x0
//	WAIT		5
//	SEPLAY_PAN	SE_W268,WAZA_SE_R
	WAIT_FLAG
	SEPLAY_PAN	SE_W004,WAZA_SE_R
//	ADD_ACTOR	ActPunchHeader,A_UP+2, 2,0,0
//	ADD_ACTOR	ActTstHitBHeader,A_UP+2,2,0,0
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+4,5, 0,0, 8, 1,0
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 0,0,1,1
	WAIT		1
//	WAIT		15
	ADD_TASK	WazaTaskColorReversal,PRI2,3, 0x0101,0x0101,0x0101	//add test
	WAIT		1
	ADD_ACTOR	ActKaminariHeader,D_UP+2,2,0,-48
	WAIT		1
	ADD_ACTOR	ActKaminariHeader,A_UP+2,2,0,-16
	WAIT		1
	ADD_ACTOR	ActKaminariHeader,A_UP+2,2,0,16
	WAIT		1
	SEPLAY_PAN	SE_W161B,WAZA_SE_R
	ADD_TASK	WazaTaskColorReversal,PRI2,3, 0x0101,0x0101,0x0101	//add test
	WAIT		2
//	ADD_ACTOR	ActTstHitBHeader,A_UP+2,2,0,0
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,0,3,15,1
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,2
	WAIT		1
	ADD_ACTOR	ActFadeHeader,A_UP+2,5,1,2,16,0,0x0
	WAIT		20
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND


@======================================================
@	せいなるほのお
@======================================================
WEST_Seinaru:
	CHAR_SET	WAZACHR_ID_MERAMERA
	CHAR_SET	WAZACHR_ID_HIBASIRA
	SE_REPEAT	SE_W221, WAZA_SE_L, 7, 5
	ADD_ACTOR	ActSeinaruHonoo3Header,A_UP+2,6,-32,  0,50,5,-2,0
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo3Header,A_DOWN+2,6,-20, -10,50,5,-1,-1
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo3Header,A_DOWN+2,6,  0,-16,50,5,0,-1
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo3Header,A_DOWN+2,6, 20,-10,50,5,1,-1
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo3Header,A_UP+2,6, 32,  0,50,5, 2,0
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo3Header,A_UP+2,6, 20, 10,50,5, 1,1
	WAIT		1
	ADD_TASK	WazaTaskColorReversal,PRI2,3, 0x0101,0x0101,0x0101	//add test
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo3Header,A_UP+2,6,  0, 16,50,5, 0,1
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo3Header,A_UP+2,6,-20, 10,50,5,-1,1
	ADD_TASK	WazaTaskColorReversal,PRI2,3, 0x0101,0x0101,0x0101	//add test
	WAIT		1

	WAIT_FLAG

	SEPLAY_PAN	SE_W221B,WAZA_SE_R
	ADD_ACTOR	ActSeinaruHonooHeader,D_UP+2,6, -16,0, 70,16,0,1
	WAIT		10
	SEPLAY_PAN	SE_W221B,WAZA_SE_R
	ADD_ACTOR	ActSeinaruHonooHeader,D_UP+2,6,   0,0, 70,16,0,1
	WAIT		10
	SEPLAY_PAN	SE_W221B,WAZA_SE_R
	ADD_ACTOR	ActSeinaruHonooHeader,D_UP+2,6,  16,0, 80,16,0,1
	WAIT		1
	ADD_TASK	WazaTaskColorReversal,PRI2,3, 0x0101,0x0101,0x0101	//add test
	WAIT		1
	WAIT_FLAG
	ADD_TASK	WazaTaskColorReversal,PRI2,3, 0x0101,0x0101,0x0101	//add test
	WAIT		1
	SEPLAY_PAN	SE_W172B,WAZA_SE_R
	ADD_ACTOR	ActSeinaruHonoo2Header,D_UP+2,6,  0,0, 30,30,-1,0
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo2Header,D_UP+2,6,  0,0, 30,30,0,1
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo2Header,D_UP+2,6,  0,0, 30,30,-1,-1
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo2Header,D_UP+2,6,  0,0, 30,30,2,1
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo2Header,D_UP+2,6,  0,0, 30,30,1,-1
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo2Header,D_UP+2,6,  0,0, 30,30,-1,1
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo2Header,D_UP+2,6,  0,0, 30,30,1,-2
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo2Header,D_UP+2,6,  0,0, 30,30,3,1
	WAIT_FLAG
	SEQEND

@======================================================
@	ひっかく
@======================================================
WEST_Hikkaku:
@	CHAR_SET	WAZACHR_ID_HIKKAKU
/*
	CHAR_SET	WAZACHR_ID_CGATAKIRI
	WAIT		1
	ADD_ACTOR	ActHikkakuHeader,A_UP+2,2,  0,16
	WAIT		20
	ADD_TASK	TaskPokeYure,PRI2,	3, 20,3,0,0
*/
	CHAR_SET	WAZACHR_ID_HIKKAKU2
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W010,WAZA_SE_R
	ADD_ACTOR	ActHikkakuHeader,A_UP+2,4, 0,0,1,0
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,6,1
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	WAIT_FLAG
	SEQEND

@======================================================
@	りゅうのいぶき
@======================================================
#define RYUU_IBU_WAIT	2
WEST_RyuunoIbuki:
	CHAR_SET	WAZACHR_ID_FIRE
	POKEBG		3				//OBJﾚﾝｼﾞｵｰﾊﾞｰ対策
	BGPRI_GAPSET	BG_DEFENCE
	SE_REPEAT	SE_W172,WAZA_SE_L, 7,7
	ADD_ACTOR	ActRyuunoIbukiHeader,D_UP+2,5, 0,0, 0,0, 20
	WAIT		RYUU_IBU_WAIT
	ADD_ACTOR	ActRyuunoIbukiHeader,D_UP+2,5, 0,0, 0,0, 20
	WAIT		RYUU_IBU_WAIT
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,1,0,9,0x001f
	ADD_ACTOR	ActRyuunoIbukiHeader,D_UP+2,5, 0,0, 0,0, 20
	WAIT		RYUU_IBU_WAIT
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,21,1
	ADD_ACTOR	ActRyuunoIbukiHeader,D_UP+2,5, 0,0, 0,0, 20
	WAIT		RYUU_IBU_WAIT
	ADD_ACTOR	ActRyuunoIbukiHeader,D_UP+2,5, 0,0, 0,0, 20
	WAIT		RYUU_IBU_WAIT
	ADD_ACTOR	ActRyuunoIbukiHeader,D_UP+2,5, 0,0, 0,0, 20
	WAIT		RYUU_IBU_WAIT
	ADD_ACTOR	ActRyuunoIbukiHeader,D_UP+2,5, 0,0, 0,0, 20
	WAIT		RYUU_IBU_WAIT
	ADD_ACTOR	ActRyuunoIbukiHeader,D_UP+2,5, 0,0, 0,0, 20
	WAIT		RYUU_IBU_WAIT
	ADD_ACTOR	ActRyuunoIbukiHeader,D_UP+2,5, 0,0, 0,0, 20
	WAIT		RYUU_IBU_WAIT
	ADD_ACTOR	ActRyuunoIbukiHeader,D_UP+2,5, 0,0, 0,0, 20
	WAIT		RYUU_IBU_WAIT
	ADD_ACTOR	ActRyuunoIbukiHeader,D_UP+2,5, 0,0, 0,0, 20
	WAIT_FLAG
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,1,9,0,0x001f
	WAIT_FLAG
	POKEBG_RESET	3
	SEQEND

@======================================================
@	ほえる
@======================================================
#define HOERU_AFF		(-5)
WEST_Hoeru:
	CHAR_SET	WAZACHR_ID_HOERU
	POKEBG		0
	BGPRI_GAPSET	BG_ATTACK
	BLDALPHA_SET	0x8,0x8
	ADD_TASK	PokeVoicePlayTask,PRI2,2, 0,2
	ADD_TASK	PokeKakusyukuTask,PRI5,5, HOERU_AFF,HOERU_AFF,10,0,1
	SEQ_CALL	WEST_HoeruSub
	WAIT		20
	ADD_TASK	PokeNigeruMoveTask,PRI5,2, 1,2
	WAIT_FLAG
	POKEBG_RESET	0
	BLDALPHA_RESET
	WAIT_FLAG
	WAIT		20	//鳴き声が鳴り終わる前にﾀｲﾑｵｰﾊﾞｰﾁｪｯｸが来てしまうので
	SEQEND

WEST_HoeruSub:	//「なきごえ」でも使用
	ADD_ACTOR	HoeruHeader,PRI2,3, 24,-8,0
	ADD_ACTOR	HoeruHeader,PRI2,3, 24,0,2
	ADD_ACTOR	HoeruHeader,PRI2,3, 24,8,1
	WAIT		15
	ADD_ACTOR	HoeruHeader,PRI2,3, 24,-8,0
	ADD_ACTOR	HoeruHeader,PRI2,3, 24,0,2
	ADD_ACTOR	HoeruHeader,PRI2,3, 24,8,1
	END_CALL
	
@======================================================
@	なきごえ
@======================================================
WEST_Nakigoe:
	CHAR_SET	WAZACHR_ID_HOERU
	ADD_TASK	PokeVoicePlayTask,PRI2,2, 0,0xff
	SEQ_CALL	WEST_HoeruSub
	WAIT		10
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,1,0,9,1
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 3,1,0,9,1
	WAIT_FLAG
	WAIT		20	//鳴き声が鳴り終わる前にﾀｲﾑｵｰﾊﾞｰﾁｪｯｸが来てしまうので
//	ADD_TASK	StatusEffectTask,PRI5,5, 1,0,1,1,0
	SEQEND

@======================================================
@	いびき
@======================================================
#define IBIKI_AFF	(-7)
#define IBIKI_SYNC	24
WEST_Ibiki:
	CHAR_SET	WAZACHR_ID_Z
	POKEBG		2
	BLDALPHA_SET	0x8,0x8
	SEQ_CALL	WEST_IbikiSub
	WAIT		30
	SEQ_CALL	WEST_IbikiSub
	WAIT_FLAG
	POKEBG_RESET	2
	BLDALPHA_RESET
	SEQEND

WEST_IbikiSub:
	SEPLAY_PAN	SE_W173,WAZA_SE_L
	ADD_TASK	PokeKakusyukuTask,PRI5,5, IBIKI_AFF,IBIKI_AFF,7,0,1
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,4,0,7,1
	ADD_ACTOR	ActQuakeHeader,A_UP+2,5, 6,1,14,0,0
	ADD_ACTOR	IbikiHeader,A_UP+2,7, 0,0, -42,-38, IBIKI_SYNC,0,0
	ADD_ACTOR	IbikiHeader,A_UP+2,7, 0,0, 0,-42, IBIKI_SYNC,0,0
	ADD_ACTOR	IbikiHeader,A_UP+2,7, 0,0, 42,-38, IBIKI_SYNC,0,0
	END_CALL

@======================================================
@	ひかりのかべ
@======================================================
WEST_HikarinoKabe:
	CHAR_SET	WAZACHR_ID_S_HIKARI
	CHAR_SET	WAZACHR_ID_MIRROR0
//	POKEBG		2
	BLDALPHA_SET	0,16
	SE_WAITPLAY	SE_W115,WAZA_SE_L,15
	ADD_ACTOR	ActMirror0Header,A_UP+1,3, 40,0,WAZACHR_ID_MIRROR0
	WAIT		10
	SEQ_CALL	WEST_HikarinoKabeSub
	WAIT_FLAG
	WAIT		1	//ｳｪｲﾄを入れておかないと↓でｱｸﾀｰが消える前にALPHAをいじられてしまう
//	POKEBG_RESET	2
	BLDALPHA_RESET
	SEQEND

WEST_HikarinoKabeSub:	//※「ミラーコート｣でも使用
	ADD_ACTOR	ActSKiranHeader,A_UP+2,4, 23,0,0,1
	WAIT		6
	ADD_ACTOR	ActSKiranHeader,A_UP+2,4, 31,-8,0,1
	WAIT		5
	ADD_ACTOR	ActSKiranHeader,A_UP+2,4, 30,20,0,1
	WAIT		7
	ADD_ACTOR	ActSKiranHeader,A_UP+2,4, 10,-15,0,1
	WAIT		6
	ADD_ACTOR	ActSKiranHeader,A_UP+2,4, 20,10,0,1
	WAIT		6
	ADD_ACTOR	ActSKiranHeader,A_UP+2,4, 10,18,0,1
	END_CALL
	
@======================================================
@	ミラーコート
@======================================================
WEST_MirrorCote:
	CHAR_SET	WAZACHR_ID_S_HIKARI
	CHAR_SET	WAZACHR_ID_MIRROR2
//	POKEBG		2
	BLDALPHA_SET	0,16
	ADD_ACTOR	ActMirror2Header,A_UP+1,3, 40,0,WAZACHR_ID_MIRROR2
	WAIT		10
	SEPLAY_PAN	SE_W115,WAZA_SE_L
	SEQ_CALL	WEST_HikarinoKabeSub
	WAIT_FLAG
	WAIT		1	//ｳｪｲﾄを入れておかないと↓でｱｸﾀｰが消える前にALPHAをいじられてしまう
//	POKEBG_RESET	2
	BLDALPHA_RESET
	SEQEND

@======================================================
@	リフレクター
@======================================================
WEST_Rifurector:
	CHAR_SET	WAZACHR_ID_L_HIKARI
	CHAR_SET	WAZACHR_ID_MIRROR1
//	POKEBG		2
	BLDALPHA_SET	0,16
	SE_WAITPLAY	SE_W115,WAZA_SE_L,15
	ADD_ACTOR	ActMirror1Header,A_UP+1,3, 40,0,WAZACHR_ID_MIRROR1
	WAIT		20
	ADD_ACTOR	ActLKiranHeader,A_UP+2,4, 30,0,0,1
	WAIT		7
	ADD_ACTOR	ActLKiranHeader,A_UP+2,4, 19,-12,0,1
	WAIT		7
	ADD_ACTOR	ActLKiranHeader,A_UP+2,4, 10,20,0,1
	WAIT_FLAG
	WAIT		1	//ｳｪｲﾄを入れておかないと↓でｱｸﾀｰが消える前にALPHAをいじられてしまう
//	POKEBG_RESET	2
	BLDALPHA_RESET
	SEQEND

@======================================================
@	バリアー
@======================================================
WEST_Barier:
	CHAR_SET	WAZACHR_ID_MIRROR3
//	POKEBG		2
	BLDALPHA_SET	0,16
	SE_WAITPLAY	SE_W112,WAZA_SE_L,15
	ADD_ACTOR	ActMirror3Header,A_UP+3,3, 40,0,WAZACHR_ID_MIRROR3
	WAIT_FLAG
	WAIT		1	//ｳｪｲﾄを入れておかないと↓でｱｸﾀｰが消える前にALPHAをいじられてしまう
//	POKEBG_RESET	2
	BLDALPHA_RESET
	SEQEND

@======================================================
@	あわ
@======================================================
#define AWA_SEC_SP	0x0080
#define AWA_SYNC		100
WEST_Awa:
	CHAR_SET	WAZACHR_ID_AWA
	CHAR_SET	WAZACHR_ID_MIZU2
	POKEBG		1
//	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	WAIT		1
	ADD_ACTOR	ActBaburuHeader,A_UP+2,7, 18,0, 15,-15,10,AWA_SEC_SP,AWA_SYNC
	SEPLAY_PAN	SE_W145,WAZA_SE_L
	SE_WAITPLAY	SE_W145B,WAZA_SE_R,AWA_SYNC
	WAIT		6
	ADD_ACTOR	ActBaburuHeader,A_UP+2,7, 18,0, 35,37,40,AWA_SEC_SP,AWA_SYNC
	SEPLAY_PAN	SE_W145,WAZA_SE_L
	SE_WAITPLAY	SE_W145B,WAZA_SE_R,AWA_SYNC
	WAIT		6
	ADD_ACTOR	ActBaburuHeader,A_UP+2,7, 18,0, 10,-37,30,AWA_SEC_SP,AWA_SYNC
	SEPLAY_PAN	SE_W145,WAZA_SE_L
	SE_WAITPLAY	SE_W145B,WAZA_SE_R,AWA_SYNC
	WAIT		6
	ADD_ACTOR	ActBaburuHeader,A_UP+2,7, 18,0, 30,10,15,AWA_SEC_SP,AWA_SYNC
	SEPLAY_PAN	SE_W145,WAZA_SE_L
	SE_WAITPLAY	SE_W145B,WAZA_SE_R,AWA_SYNC
	WAIT		6
	ADD_ACTOR	ActBaburuHeader,A_UP+2,7, 18,0, 20,33,20,AWA_SEC_SP,AWA_SYNC
	SEPLAY_PAN	SE_W145,WAZA_SE_L
	SE_WAITPLAY	SE_W145B,WAZA_SE_R,AWA_SYNC
	WAIT		6
	ADD_ACTOR	ActBaburuHeader,A_UP+2,7, 18,0, 25,-30,10,AWA_SEC_SP,AWA_SYNC
	SEPLAY_PAN	SE_W145,WAZA_SE_L
	SE_WAITPLAY	SE_W145B,WAZA_SE_R,AWA_SYNC
	WAIT_FLAG
	SEQ_CALL	WEST_MizuKouka2
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

@======================================================
@	スモッグ
@======================================================
#define SUMOGGU_WAIT	7
#define SUMOGGU_SYNC	240
WEST_Sumoggu:
	CHAR_SET	WAZACHR_ID_DOKUGIRI
	POKEBG		3
	BGPRI_GAPSET2
	BLDALPHA_SET	0xc,0x8
	SE_REPEAT	SE_W054,WAZA_SE_R,17,10
	SEQ_CALL	WEST_SumogguSub
	SEQ_CALL	WEST_SumogguSub
	SEQ_CALL	WEST_SumogguSub
	SEQ_CALL	WEST_SumogguSub
	SEQ_CALL	WEST_SumogguSub
	SEQ_CALL	WEST_SumogguSub
	SEQ_CALL	WEST_SumogguSub
	WAIT		120
	SE_REPEAT	SE_W092,WAZA_SE_R,18,2
	ADD_TASK	WazaTaskColorFade,PRI2, 6, 4,2,2,0,12,0x681a
	WAIT		10
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,15,1
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

WEST_SumogguSub:
	ADD_ACTOR	ActSumogguHeader,A_UP+2,6, 0,-24, 48,SUMOGGU_SYNC,1,0
	WAIT		SUMOGGU_WAIT
	END_CALL

@======================================================
@	だましうち
@======================================================

WEST_Damasiuti:
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		0
	HAIKEI_CHG	WAZAMAP_ID_AKU
	HAIKEI_CHG_WAIT
	WAIT		0
	SEPLAY_PAN	SE_W185,WAZA_SE_L
	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5, 0,18,6, 1,3
	ADD_TASK	WazaTaskPokeToumeiExe,PRI2,1, 1
	WAIT_FLAG
	POKEBG_RESET	0
	POKE_BANISH_ON	0
	
	WAIT		1
	ADD_TASK	AttackClimemBanish,PRI2,0	//ﾊﾟｰﾃｨｱﾀｯｸ用
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	WAIT		1
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,1
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,9,1
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	
	WAIT		1
	WORK_SET	7,0x1000	//AttackClimemBanish用
	WAIT		32
	ADD_TASK	DamasiutiBldCntSet,PRI2,0	//BG化した時に見えないように半透明で消す
	POKEBG		0
	ADD_TASK	WazaTaskPokeToumeiRecovery,PRI2,1, 1
	WAIT_FLAG
	POKEBG_RESET	0
	WAIT		1
	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
	SEQEND

@======================================================
@	ねごと
@======================================================
@WEST_Negoto:
@	SE			SE_BAN
@	CHAR_SET	WAZACHR_ID_ZZZ
@	ADD_ACTOR	ActZzzzHeader,A_UP+2,5,1,2,16,0,0x0
@	WAIT 30
@	ADD_ACTOR	ActZzzzHeader,A_UP+2,5,1,2,16,0,0x0
@	WAIT 30
@	ADD_ACTOR	ActZzzzHeader,A_UP+2,5,1,2,16,0,0x0
@	WAIT 30
@	ADD_ACTOR	ActZzzzHeader,A_UP+2,5,1,2,16,0,0x0
@	WAIT_FLAG
@	SEQEND

@======================================================
@	すなかけ
@======================================================
#define SUNAKAKE_WAIT	0
WEST_SunaKake:
	CHAR_SET	WAZACHR_ID_SUNA
	POKEBG		2				//砂を攻撃側の方でも上のﾌﾟﾗｲｵﾘﾃｨにするためBGに落しとく
	BGPRI_GAPSET	BG_ATTACK
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W028,WAZA_SE_L
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,-10,0,0,3
	WAIT_FLAG
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,2
	SEQ_CALL	WEST_SunakakeSub
	SEQ_CALL	WEST_SunakakeSub
	SEQ_CALL	WEST_SunakakeSub
	SEQ_CALL	WEST_SunakakeSub
	SEQ_CALL	WEST_SunakakeSub
	SEQ_CALL	WEST_SunakakeSub
	WAIT_FLAG
	POKEBG_RESET	2
	BLDALPHA_RESET
	SEQEND

WEST_SunakakeSub:
	ADD_ACTOR	ActSunaKakeHeader,D_UP+2,5, 15,15, 20, 0,0
	ADD_ACTOR	ActSunaKakeHeader,D_UP+2,5, 15,15, 20, 10,10
	ADD_ACTOR	ActSunaKakeHeader,D_UP+2,5, 15,15, 20, -10,-10
	ADD_ACTOR	ActSunaKakeHeader,D_UP+2,5, 15,15, 20, 20,5
	ADD_ACTOR	ActSunaKakeHeader,D_UP+2,5, 15,15, 20, -20,-5
	WAIT		2
	END_CALL

@======================================================
@	どろかけ
@======================================================
WEST_DoroKake:
	CHAR_SET	WAZACHR_ID_SUNA
	SEPLAY_PAN	SE_W028,WAZA_SE_L
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,-10,0,0,3
	WAIT_FLAG
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,2
	SEQ_CALL	WEST_DorokakeSub
	SEQ_CALL	WEST_DorokakeSub
	SEQ_CALL	WEST_DorokakeSub
	SEQ_CALL	WEST_DorokakeSub
	SEQ_CALL	WEST_DorokakeSub
	SEQ_CALL	WEST_DorokakeSub
	WAIT_FLAG
	SEQEND

WEST_DorokakeSub:
	ADD_ACTOR	ActDoroKakeHeader,D_UP+2,5, 15,15, 20, 0,0
	ADD_ACTOR	ActDoroKakeHeader,D_UP+2,5, 15,15, 20, 10,5
	ADD_ACTOR	ActDoroKakeHeader,D_UP+2,5, 15,15, 20, -10,-5
	ADD_ACTOR	ActDoroKakeHeader,D_UP+2,5, 15,15, 20, 20,10
	ADD_ACTOR	ActDoroKakeHeader,D_UP+2,5, 15,15, 20, -20,-10
	WAIT		2
	END_CALL

@======================================================
@	りゅうのいかり
@======================================================
WEST_RyuunoIkari:
	CHAR_SET	WAZACHR_ID_FIRE
	CHAR_SET	WAZACHR_ID_HIBASIRA
	SEPLAY_PAN	SE_W082,WAZA_SE_L
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 0,0,2,40,1
	WAIT_FLAG
	ADD_ACTOR	ActPokeStraightMoveHeader,D_UP+2,5, 0,15,0,0,4
	WAIT_FLAG
	ADD_ACTOR	ActRyuunoIkariHeader,D_UP+2,5, 30,15,0,10,10
	WAIT_FLAG
	SE_REPEAT	SE_W172B,WAZA_SE_R,11,3
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,3,25,1
	ADD_ACTOR	ActHibasiraHeader,D_DOWN+2,3, 1,5,0
	WAIT		1
	ADD_ACTOR	ActHibasiraHeader,D_DOWN+2,3, 1,-10,-15
	WAIT		1
	ADD_ACTOR	ActHibasiraHeader,D_UP+2,3, 1,0,25
	WAIT		1
	ADD_ACTOR	ActHibasiraHeader,D_DOWN+2,3, 1,15,5
	WAIT		1
	ADD_ACTOR	ActHibasiraHeader,D_DOWN+2,3, 1,-25,0
	WAIT		1
	ADD_ACTOR	ActHibasiraHeader,D_UP+2,3, 1,30,30
	WAIT		1
	ADD_ACTOR	ActHibasiraHeader,D_UP+2,3, 1,-27,25
	WAIT		1
	ADD_ACTOR	ActHibasiraHeader,D_DOWN+2,3, 1,0,8
	WAIT_FLAG
	ADD_ACTOR	ActPokeDefaultMoveHeader,D_DOWN+2,3, 0,0,4
	WAIT_FLAG
	SEQEND


@======================================================
@	あまごい
@======================================================
WEST_Amagoi:
	CHAR_SET	WAZACHR_ID_AMAGOI
	SEPLAY_PAN	SE_W240,WAZA_SE_L
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 0xFF,2,0,4,0x0000	//add_02.08.27_iwa
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x0781,2,0,4,0x0000
	WAIT_FLAG
	ADD_TASK	WazaTaskAmagoi,PRI2,3, 0,3,120
	ADD_TASK	WazaTaskAmagoi,PRI2,3, 0,3,120
@	ADD_ACTOR	ActWazaAmagoiHeader,A_UP+2,2,5,5
	WAIT		120
	WAIT		30
	WAIT_FLAG
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 0xFF,2,4,0,0x0000	//add_02.08.27_iwa
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x0781,2,4,0,0x0000
	WAIT_FLAG
	SEQEND

@======================================================
@	かみつく
@======================================================
#define KAMITUKU_LOOP	10
#define KAMITUKU_OFFSET		32
#define KAMITUKU_DY		((KAMITUKU_OFFSET << 8) / KAMITUKU_LOOP)
WEST_Kamituku:
	CHAR_SET	WAZACHR_ID_KAMITUKU
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W044,WAZA_SE_R
	ADD_ACTOR	ActKamitukuHeader,A_UP+2,6,  0,-KAMITUKU_OFFSET,0,0,KAMITUKU_DY,KAMITUKU_LOOP
	ADD_ACTOR	ActKamitukuHeader,A_UP+2,6,  0,KAMITUKU_OFFSET,4,0,-KAMITUKU_DY,KAMITUKU_LOOP
	WAIT		KAMITUKU_LOOP
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,2
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,4,7,1
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	WAIT		1
	SEQEND

@======================================================
@	かみくだく
@======================================================
WEST_Kamikudaku:
	CHAR_SET	WAZACHR_ID_KAMITUKU
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	HAIKEI_CHG	WAZAMAP_ID_AKU
	HAIKEI_CHG_WAIT
//	WAIT_FLAG
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W044,WAZA_SE_R
	ADD_ACTOR	ActKamitukuHeader,A_UP+2,6,  -KAMITUKU_OFFSET,-KAMITUKU_OFFSET,1,KAMITUKU_DY,KAMITUKU_DY,KAMITUKU_LOOP
	ADD_ACTOR	ActKamitukuHeader,A_UP+2,6,  KAMITUKU_OFFSET,KAMITUKU_OFFSET,5,-KAMITUKU_DY,-KAMITUKU_DY,KAMITUKU_LOOP
	WAIT		KAMITUKU_LOOP
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -8,0,1,1
//	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,5,6,1
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,7,5,2
	WAIT_FLAG
	SEPLAY_PAN	SE_W044,WAZA_SE_R
	ADD_ACTOR	ActKamitukuHeader,A_UP+2,6,  KAMITUKU_OFFSET,-KAMITUKU_OFFSET,7,-KAMITUKU_DY,KAMITUKU_DY,KAMITUKU_LOOP
	ADD_ACTOR	ActKamitukuHeader,A_UP+2,6,  -KAMITUKU_OFFSET,KAMITUKU_OFFSET,3,KAMITUKU_DY,-KAMITUKU_DY,KAMITUKU_LOOP
	WAIT		KAMITUKU_LOOP
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 8,0,1,1
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,8,4,2
//	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,6,7,2
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	WAIT		1
	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
//	WAIT_FLAG
	SEQEND

@======================================================
@	からではさむ
@======================================================
WEST_Karadehasamu:		//しめつけｴﾌｪｸﾄでもそのまま使用
	CHAR_SET	WAZACHR_ID_KARA3
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W011,WAZA_SE_R
	ADD_ACTOR	ActKaraHeader,A_UP+2,6,  -KAMITUKU_OFFSET,0,2,KAMITUKU_DY,0,KAMITUKU_LOOP
	ADD_ACTOR	ActKaraHeader,A_UP+2,6,  KAMITUKU_OFFSET,0,6,-KAMITUKU_DY,0,KAMITUKU_LOOP
	WAIT		KAMITUKU_LOOP
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,2
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,3,0,5,1
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	WAIT_FLAG
	SEQEND

@======================================================
@	れいとうビーム
@======================================================
#define REITOUBEEM_M_SP	11
#define REITOUBEEM_S_SP	20

WEST_ReitouBeem:
	POKEBG		1
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	CHAR_SET	WAZACHR_ID_YUKI2
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1,0,7,0
	WAIT_FLAG//		20
	SE_TASK		SeRepeatPanMove,7, SE_W062B,WAZA_SE_L,WAZA_SE_R,4,4,0,10
	ADD_ACTOR	ActReitouBeem2Header,A_UP+2,5, 20,12,0,12,REITOUBEEM_S_SP
	ADD_ACTOR	ActReitouBeem2Header,A_UP+2,5, 20,-12,0,-12,REITOUBEEM_S_SP
	WAIT		1
	SEQ_CALL	WEST_ReitouBeemSub
	SEQ_CALL	WEST_ReitouBeemSub
	SEQ_CALL	WEST_ReitouBeemSub
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 4,-31,0,7,0x7e80	//add_0820_iwa
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0, 25,1
	SEQ_CALL	WEST_ReitouBeemSub
	SEQ_CALL	WEST_ReitouBeemSub
	SEQ_CALL	WEST_ReitouBeemSub
	SEQ_CALL	WEST_ReitouBeemSub
	SEQ_CALL	WEST_ReitouBeemSub
	SEQ_CALL	WEST_ReitouBeemSub
	SEQ_CALL	WEST_ReitouBeemSub
	SEQ_CALL	WEST_ReitouBeemSub
	ADD_ACTOR	ActReitouBeem1Header,A_UP+2,5, 20,0,0,0,REITOUBEEM_M_SP
	WAIT		1
	ADD_ACTOR	ActReitouBeem1Header,A_UP+2,5, 20,0,0,0,REITOUBEEM_M_SP
	WAIT_FLAG
	WAIT		20
	SEQ_CALL	WEST_IceKouka
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 4,5,7,0,0x7e80	//add_0820_iwa
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,0,7,0,0
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

WEST_ReitouBeemSub:
	ADD_ACTOR	ActReitouBeem2Header,A_UP+2,5, 20,12,0,12,REITOUBEEM_S_SP
	ADD_ACTOR	ActReitouBeem2Header,A_UP+2,5, 20,-12,0,-12,REITOUBEEM_S_SP
	ADD_ACTOR	ActReitouBeem1Header,A_UP+2,5, 20,0,0,0,REITOUBEEM_M_SP
	WAIT		1
	END_CALL

@======================================================
@	からにこもる
@======================================================
WEST_KaraniKomoru:
/*	CHAR_SET	WAZACHR_ID_KARA3
	POKEBG		0
	BLDALPHA_SET	0xc,0x8
	ADD_ACTOR	ActKaraniKomoruHeader,A_UP+2,5, 0,-20,20,20,30
	WAIT		20 - WAIT_OFFSET
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,0,15,0,20
	WAIT_FLAG
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,10
	WAIT_FLAG
	POKEBG_RESET	0
	BLDALPHA_RESET
	SEQEND
*/
	SEPLAY_PAN	SE_W029,WAZA_SE_L
	ADD_TASK	KaranikomoruTask,PRI5,0
/*	ADD_TASK	WazaPokeRollTask,PRI2,4, 6,0x0300,0,0
	WAIT_FLAG
	WAIT		30
	ADD_TASK	WazaPokeRollTask,PRI2,4, 6,0x0300,0,1
	ADD_TASK	KaranikomoruTask,PRI5,2, -0x00a0, 6
	WAIT_FLAG
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,1	//一応
*/	WAIT_FLAG
	SEQEND

@======================================================
@	オーロラビーム
@======================================================
#define OORORA_BEEM_SP	17//35
WEST_OororaBeem:
	CHAR_SET	WAZACHR_ID_WAKKA

	HAIKEI_CHG	WAZAMAP_ID_AURORA
	HAIKEI_CHG_WAIT
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1,0,7,0x7e3f
//	WAIT_FLAG

	SEPLAY_PAN	SE_W062,WAZA_SE_L
	WORK_SET	7,0					//ﾌﾗｸﾞで使用する個所を0ｸﾘｱ
	ADD_TASK	OororaBeemControlTask,PRI10,1, 130
	SEQ_CALL	WEST_OororaBeemSub
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 1,1,0,17,1
	SEQ_CALL	WEST_OororaBeemSub
	SEQ_CALL	WEST_OororaBeemSub
	SEQ_CALL	WEST_OororaBeemSub
	WORK_SET	7,0xffff			//輪を大きくするﾌﾗｸﾞをｾｯﾄ
	SE_TASK		SeRepeatPanMove,7, SE_W062B,WAZA_SE_L,WAZA_SE_R,3,6,0,10
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 1,2,0,40,1
	SEQ_CALL	WEST_OororaBeemSub
	SEQ_CALL	WEST_OororaBeemSub
	SEQ_CALL	WEST_OororaBeemSub
	SEQ_CALL	WEST_OororaBeemSub
	SEQ_CALL	WEST_OororaBeemSub
	SEQ_CALL	WEST_OororaBeemSub
	WAIT_FLAG

//	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1,7,0,0x7e3f
//	WAIT_FLAG
	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
	SEQEND

WEST_OororaBeemSub:
	ADD_ACTOR	ActOororaBeemHeader,D_UP+2,5, 20,0,0,0,OORORA_BEEM_SP
	WAIT		1
	ADD_ACTOR	ActOororaBeemHeader,D_UP+2,5, 20,0,0,0,OORORA_BEEM_SP
	WAIT		1
	ADD_ACTOR	ActOororaBeemHeader,D_UP+2,5, 20,0,0,0,OORORA_BEEM_SP
	WAIT		1
	ADD_ACTOR	ActOororaBeemHeader,D_UP+2,5, 20,0,0,0,OORORA_BEEM_SP
	WAIT		1
	END_CALL

@======================================================
@	ソーラービーム
@======================================================
#define SOLAR_KYUUSYUU_SYNC		16
#define SOLAR_BEEM_SYNC			20
#define	SOLAR_BEEM_WAIT			4
#define SOLAR_TAME_WAIT			2
WEST_SolarBeem:
	CHAR_SET	WAZACHR_ID_SOLAR
	TURN_CHK	WEST_SolarBeemTurn1, WEST_SolarBeemTurn2
WEST_SolarBeemReturn:
	WAIT_FLAG
	SEQEND

WEST_SolarBeemTurn1:	//光をためる(1ﾀｰﾝ目)
	POKEBG		2
	BLDALPHA_SET	0xc,0x8
	ADD_TASK	WazaTaskColorFade,PRI2,6, 2,1,4,0,11,0x2fff
	SEPLAY_PAN	SE_W025,WAZA_SE_L
	SEQ_CALL	WEST_SolarBeemTurn1Sub
	WAIT_FLAG
	POKEBG_RESET	2
	BLDALPHA_RESET
	SEQ_JP		WEST_SolarBeemReturn

WEST_SolarBeemTurn1Sub:
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, 40,40,SOLAR_KYUUSYUU_SYNC
	WAIT		SOLAR_TAME_WAIT
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, -40,-40,SOLAR_KYUUSYUU_SYNC
	WAIT		SOLAR_TAME_WAIT
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, 0,40,SOLAR_KYUUSYUU_SYNC
	WAIT		SOLAR_TAME_WAIT
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, 0,-40,SOLAR_KYUUSYUU_SYNC
	WAIT		SOLAR_TAME_WAIT
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, 40,-20,SOLAR_KYUUSYUU_SYNC
	WAIT		SOLAR_TAME_WAIT
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, 40,20,SOLAR_KYUUSYUU_SYNC
	WAIT		SOLAR_TAME_WAIT
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, -40,-20,SOLAR_KYUUSYUU_SYNC
	WAIT		SOLAR_TAME_WAIT
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, -40,20,SOLAR_KYUUSYUU_SYNC
	WAIT		SOLAR_TAME_WAIT

	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, -20,30,SOLAR_KYUUSYUU_SYNC
	WAIT		SOLAR_TAME_WAIT
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, 20,-30,SOLAR_KYUUSYUU_SYNC
	WAIT		SOLAR_TAME_WAIT
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, -20,-30,SOLAR_KYUUSYUU_SYNC
	WAIT		SOLAR_TAME_WAIT
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, 20,30,SOLAR_KYUUSYUU_SYNC
	WAIT		SOLAR_TAME_WAIT
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, -40,0,SOLAR_KYUUSYUU_SYNC
	WAIT		SOLAR_TAME_WAIT
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, 40,0,SOLAR_KYUUSYUU_SYNC
	WAIT		SOLAR_TAME_WAIT
	END_CALL

WEST_SolarBeemTurn2:	//ビームを出す(2ﾀｰﾝ目)
	SEQ_CALL	WEST_SOLAR_MAPCHG
	SEPAN_FLOW	SE_W076,WAZA_SE_L,WAZA_SE_R,2,0
	ADD_TASK	SolarBeemSubTask,PRI5,0

//	SEQ_CALL	WEST_SolarBeemTurn2Sub
	ADD_ACTOR	ActSolarBeemHeader,D_UP+3,4, 15,0,SOLAR_BEEM_SYNC,0
	WAIT		SOLAR_BEEM_WAIT
	ADD_ACTOR	ActSolarBeemHeader,D_UP+3,4, 15,0,SOLAR_BEEM_SYNC,1
	WAIT		SOLAR_BEEM_WAIT
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,1,0,10,0x03f9	//add_0829_iwa
	ADD_ACTOR	ActSolarBeemHeader,D_UP+3,4, 15,0,SOLAR_BEEM_SYNC,2
	WAIT		SOLAR_BEEM_WAIT
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 1,2,0,65,1
	ADD_ACTOR	ActSolarBeemHeader,D_UP+3,4, 15,0,SOLAR_BEEM_SYNC,3
	WAIT		SOLAR_BEEM_WAIT
	ADD_ACTOR	ActSolarBeemHeader,D_UP+3,4, 15,0,SOLAR_BEEM_SYNC,4
	WAIT		SOLAR_BEEM_WAIT
	ADD_ACTOR	ActSolarBeemHeader,D_UP+3,4, 15,0,SOLAR_BEEM_SYNC,5
	WAIT		SOLAR_BEEM_WAIT
	ADD_ACTOR	ActSolarBeemHeader,D_UP+3,4, 15,0,SOLAR_BEEM_SYNC,6
	WAIT		SOLAR_BEEM_WAIT

	SEQ_CALL	WEST_SolarBeemTurn2Sub
	SEQ_CALL	WEST_SolarBeemTurn2Sub
	WAIT_FLAG
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,1,10,0,0x03f9	//add_0829_iwa
	
	SEQ_CALL	WEST_SOLAR_MAPEND
	SEQ_JP		WEST_SolarBeemReturn

WEST_SolarBeemTurn2Sub:
	ADD_ACTOR	ActSolarBeemHeader,D_UP+3,4, 15,0,SOLAR_BEEM_SYNC,0
	WAIT		SOLAR_BEEM_WAIT
	ADD_ACTOR	ActSolarBeemHeader,D_UP+3,4, 15,0,SOLAR_BEEM_SYNC,1
	WAIT		SOLAR_BEEM_WAIT
	ADD_ACTOR	ActSolarBeemHeader,D_UP+3,4, 15,0,SOLAR_BEEM_SYNC,2
	WAIT		SOLAR_BEEM_WAIT
	ADD_ACTOR	ActSolarBeemHeader,D_UP+3,4, 15,0,SOLAR_BEEM_SYNC,3
	WAIT		SOLAR_BEEM_WAIT
	ADD_ACTOR	ActSolarBeemHeader,D_UP+3,4, 15,0,SOLAR_BEEM_SYNC,4
	WAIT		SOLAR_BEEM_WAIT
	ADD_ACTOR	ActSolarBeemHeader,D_UP+3,4, 15,0,SOLAR_BEEM_SYNC,5
	WAIT		SOLAR_BEEM_WAIT
	ADD_ACTOR	ActSolarBeemHeader,D_UP+3,4, 15,0,SOLAR_BEEM_SYNC,6
	WAIT		SOLAR_BEEM_WAIT
	END_CALL

@======================================================
@	ふぶき
@======================================================
#define FUBUKI_SP		0x0050	//20
WEST_Fubuki:
	CHAR_SET	WAZACHR_ID_YUKI2
	POKEBG		3
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5,7,1,0,3,0x0
	ADD_TASK	MineEnemyChkTask,PRI2,0
	WORKCHK_JP	7,1,WEST_FubukiEnemyHaikei
	HAIKEI_CHG	WAZAMAP_ID_YOKO	//↑←フェードの変わりに背景差し替え
WEST_FubukiHaikeiReturn:
	HAIKEI_HALF_WAIT
	ADD_TASK	HaikeiMapScrTask,PRI5,4, -0x0900,0x0000,1,0xffff
	HAIKEI_CHG_WAIT

	WAIT_FLAG
	SEPAN_FLOW	SE_W059,WAZA_SE_L,WAZA_SE_R,2,0
	SEQ_CALL	WEST_FubukiSub
	SEQ_CALL	WEST_FubukiSub
	SEPLAY_PAN	SE_W059B,WAZA_SE_R
	WAIT_FLAG
	SEQ_CALL	WEST_IceKouka2
	WAIT_FLAG
	POKEBG_RESET	3
	WAIT		20
	
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5,7,1,3,0,0x0
	HAIKEI_RECOVER
	HAIKEI_HALF_WAIT
	WORK_SET	7,0xffff	//背景のｽｸﾛｰﾙ終了
	HAIKEI_CHG_WAIT

	SEQEND

WEST_FubukiSub:
	ADD_ACTOR	ActKogoeruHeader,A_UP+40,6, 0,-10,0,-10,0x0048,1
	ADD_ACTOR	ActFubukiHeader,A_UP+40,8, 0,0,0,0,FUBUKI_SP,0,0,1
	WAIT		3
	ADD_ACTOR	ActKogoeruHeader,A_UP+40,6, 0,-15,0,-15,0x0048,1
	ADD_ACTOR	ActFubukiHeader,A_UP+40,8, 0,-10,0,-10,FUBUKI_SP,0,0,1
	WAIT		3
	ADD_ACTOR	ActKogoeruHeader,A_UP+40,6, 0,-5,0,-5,0x0048,1
	ADD_ACTOR	ActFubukiHeader,A_UP+40,8, 0,10,0,10,FUBUKI_SP,0,0,1
	WAIT		3
	ADD_ACTOR	ActKogoeruHeader,A_UP+40,6, 0,-10,0,-10,0x0048,1
	ADD_ACTOR	ActFubukiHeader,A_UP+40,8, 0,-20,0,-20,FUBUKI_SP,0,0,1
	WAIT		3
	ADD_ACTOR	ActKogoeruHeader,A_UP+40,6, 0,-20,0,-20,0x0048,1
	ADD_ACTOR	ActFubukiHeader,A_UP+40,8, 0,15,0,15,FUBUKI_SP,0,0,1
	WAIT		3
	ADD_ACTOR	ActKogoeruHeader,A_UP+40,6, 0,-15,0,-15,0x0048,1
	ADD_ACTOR	ActFubukiHeader,A_UP+40,8, 0,-20,0,-20,FUBUKI_SP,0,0,1
	WAIT		3
	ADD_ACTOR	ActKogoeruHeader,A_UP+40,6, 0,-25,0,-25,0x0048,1
	ADD_ACTOR	ActFubukiHeader,A_UP+40,8, 0,20,0,20,FUBUKI_SP,0,0,1
	WAIT		3
	END_CALL

WEST_FubukiEnemyHaikei:
	HAIKEI_CHG	WAZAMAP_ID_YOKO2
	SEQ_JP		WEST_FubukiHaikeiReturn

@======================================================
@	こなゆき
@======================================================
#define KONAYUKI_SP		0x0038
#define KONAYUKI_DY		4
#define KONAYUKI_SEC	4
WEST_Konayuki:
	CHAR_SET	WAZACHR_ID_YUKI2
	POKEBG		3
	ADD_ACTOR	ActFadeHeader,A_UP+2,5,0x1f,1,0,3,0x0
	WAIT_FLAG
	SEPAN_FLOW	SE_W016,WAZA_SE_L,WAZA_SE_R,2,0
	SEQ_CALL	WEST_KonayukiSub
	SEQ_CALL	WEST_KonayukiSub
	SEPLAY_PAN	SE_W016B,WAZA_SE_R
	WAIT_FLAG
	SE_WAIT_FLAG
	SEQ_CALL	WEST_IceKouka2
	WAIT_FLAG
	POKEBG_RESET	3
	WAIT		20
	ADD_ACTOR	ActFadeHeader,A_UP+2,5,0x1f,1,3,0,0x0
	SEQEND

WEST_KonayukiSub:
	ADD_ACTOR	KonayukiHeader,A_UP+40,8, 0,0,0,0,KONAYUKI_SP,KONAYUKI_DY,KONAYUKI_SEC,1
	WAIT		3
	ADD_ACTOR	KonayukiHeader,A_UP+40,8, 0,-10,0,-10,KONAYUKI_SP,KONAYUKI_DY,KONAYUKI_SEC,1
	WAIT		3
	ADD_ACTOR	KonayukiHeader,A_UP+40,8, 0,10,0,10,KONAYUKI_SP,-KONAYUKI_DY,3,1
	WAIT		3
	ADD_ACTOR	KonayukiHeader,A_UP+40,8, 0,-20,0,-20,KONAYUKI_SP,-KONAYUKI_DY,5,1
	WAIT		3
	ADD_ACTOR	KonayukiHeader,A_UP+40,8, 0,15,0,15,KONAYUKI_SP,KONAYUKI_DY,KONAYUKI_SEC,1
	WAIT		3
	ADD_ACTOR	KonayukiHeader,A_UP+40,8, 0,-20,0,-20,KONAYUKI_SP,KONAYUKI_DY,KONAYUKI_SEC,1
	WAIT		3
	ADD_ACTOR	KonayukiHeader,A_UP+40,8, 0,20,0,20,KONAYUKI_SP,KONAYUKI_DY,4,1
	WAIT		3
	END_CALL

@======================================================
@	ハイドロポンプ
@======================================================
#define HAIDORO_FURIHABA_Y0		16
#define HAIDORO_FURIHABA_Y1		(-16)
#define HAIDORO_WAIT			1
WEST_HaidoroPonpu:
	CHAR_SET	WAZACHR_ID_HAIDORO
	CHAR_SET	WAZACHR_ID_MIZUHIT
	POKEBG		3
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 0,0,2,40,1
	WAIT		6
	SEPAN_FLOW	SE_W056,WAZA_SE_L,WAZA_SE_R,2,0
	ADD_TASK	HaidoriKakudoTask,PRI5,1, 100
	SEQ_CALL	WEST_HaidoroPonpuSub
	SEQ_CALL	WEST_HaidoroPonpuSub
	SEQ_CALL	WEST_HaidoroPonpuSub
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,3,0,37,1
	SEQ_CALL	WEST_HaidoroPonpuHit
	SEQ_CALL	WEST_HaidoroPonpuSub
	SEQ_CALL	WEST_HaidoroPonpuSub
	SEQ_CALL	WEST_HaidoroPonpuHit
	SEQ_CALL	WEST_HaidoroPonpuSub
	SEQ_CALL	WEST_HaidoroPonpuSub
	SEQ_CALL	WEST_HaidoroPonpuHit
	SEQ_CALL	WEST_HaidoroPonpuSub
	SEQ_CALL	WEST_HaidoroPonpuSub
	SEQ_CALL	WEST_HaidoroPonpuHit
	SEQ_CALL	WEST_HaidoroPonpuSub
	SEQ_CALL	WEST_HaidoroPonpuSub
	SEQ_CALL	WEST_HaidoroPonpuHit
	WAIT		HAIDORO_WAIT
	WAIT		HAIDORO_WAIT
	SEQ_CALL	WEST_HaidoroPonpuHit
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

WEST_HaidoroPonpuSub:
	ADD_ACTOR	ActHaidoroHeader,A_UP+3,4, 10,10,0,HAIDORO_FURIHABA_Y0
	ADD_ACTOR	ActHaidoroHeader,A_UP+3,4, 10,10,0,HAIDORO_FURIHABA_Y1
	WAIT		HAIDORO_WAIT
	ADD_ACTOR	ActHaidoroHeader,A_UP+3,4, 10,10,0,HAIDORO_FURIHABA_Y0
	ADD_ACTOR	ActHaidoroHeader,A_UP+3,4, 10,10,0,HAIDORO_FURIHABA_Y1
	WAIT		HAIDORO_WAIT
	END_CALL
	
WEST_HaidoroPonpuHit:
	ADD_ACTOR	ActMizuHitHeader,A_UP+4,4, 0,15,1,1
	ADD_ACTOR	ActMizuHitHeader,A_UP+4,4, 0,-15,1,1
	END_CALL

@======================================================
@	シグナルビーム
@======================================================
#define SIGNAL_FURIHABA_Y0		16
#define SIGNAL_FURIHABA_Y1		(-16)
#define SIGNAL_WAIT				1
WEST_SignalBeem:
	CHAR_SET	WAZACHR_ID_SIGNALRED
	CHAR_SET	WAZACHR_ID_SIGNALGREEN
	CHAR_SET	WAZACHR_ID_HIYOKO
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 0,0,2,25,1
	WAIT		6
	SEPAN_FLOW	SE_W062,WAZA_SE_L,WAZA_SE_R,1,0
	ADD_TASK	HaidoriKakudoTask,PRI5,1, 100
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,3,0,25,1
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 4,8,5,0x001f,8,0x03c1,8
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	//add_0826_iwasawa
#if 1
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
	SEQ_CALL	WEST_SignalBeemSub
#endif
	WAIT_FLAG
//	SEQ_CALL	WEST_PiyoriEffect
	SEQEND

WEST_SignalBeemSub:
	ADD_ACTOR	SignalBeemRedHeader,D_UP+3,4, 10,10,0,SIGNAL_FURIHABA_Y0
	ADD_ACTOR	SignalBeemGreenHeader,D_UP+3,4, 10,10,0,SIGNAL_FURIHABA_Y1
	WAIT		SIGNAL_WAIT
	END_CALL
	
@======================================================
@	すいとる
@======================================================
#define SUITORU_WAIT	4
WEST_Suitoru:
	CHAR_SET	WAZACHR_ID_SOLAR
	CHAR_SET	WAZACHR_ID_PIKARI
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BGPRI_GAPSET3	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1,0,4,0x33ed
	WAIT_FLAG
	SEPLAY_PAN	SE_W071,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,2
	WAIT		2
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,5,5,1
	WAIT_FLAG
	WAIT		3
	SEQ_CALL	WEST_SuitoruSub
	WAIT_FLAG
	WAIT		15
	SEQ_CALL	WEST_PikariAttack
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1,4,0,0x33ed
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

WEST_SuitoruSub:	//※「きゅうけつ」でも使用
	SEPLAY_PAN	SE_W152,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,8,26
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W152,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 10,-5,-8,26
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W152,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -5,15,16,33
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W152,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,-15,-16,36
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W152,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,8,26
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W152,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 10,-5,-8,26
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W152,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -10,20,20,39
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W152,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 5,-18,-20,35
	WAIT		SUITORU_WAIT
	END_CALL

@======================================================
@	メガドレイン
@======================================================
WEST_Megadorein:
	CHAR_SET	WAZACHR_ID_SOLAR
	CHAR_SET	WAZACHR_ID_PIKARI
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BGPRI_GAPSET3	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1,0,8,0x33ed
	WAIT_FLAG
	SEPLAY_PAN	SE_W071,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,1
	WAIT		2
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,5,5,1
	WAIT_FLAG
	WAIT		3
	SEQ_CALL	WEST_MegadorainSub
	WAIT_FLAG
	WAIT		15
	SEQ_CALL	WEST_PikariAttack
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1,8,0,0x33ed
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

WEST_MegadorainSub:
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 5,-18,-20,35
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 10,-5,-8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -10,20,20,39
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -5,15,16,33
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 10,-5,-8,26
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,-15,-16,36
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,8,26
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,-15,-16,36
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 10,-5,-8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -5,15,16,33
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -10,20,20,39
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 10,-5,-8,26
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 5,-18,-20,35
	WAIT		SUITORU_WAIT
	END_CALL

@======================================================
@	ギガドレイン
@======================================================
WEST_Gigadorein:
	CHAR_SET	WAZACHR_ID_SOLAR
	CHAR_SET	WAZACHR_ID_PIKARI
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BGPRI_GAPSET3	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1,0,12,0x33ed
	WAIT_FLAG
	SEPLAY_PAN	SE_W071,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,0
	WAIT		2
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,5,5,1
	WAIT_FLAG
	WAIT		3
	SEQ_CALL	WEST_GigadorainSub
	WAIT_FLAG
	WAIT		15
	SEQ_CALL	WEST_PikariAttack
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1,12,0,0x33ed
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

WEST_GigadorainSub:		//※「ゆめくい」でも使用
	SEPLAY_PAN	SE_W202,WAZA_SE_R	//ゆめくいで追加した効果音
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 5,-18,-40,35
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -10,20,20,39
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W202,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,28,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 10,-5,-8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -10,20,40,39
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W202,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 10,-5,-8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -5,15,16,33
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 10,-5,-32,26
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W202,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,-15,-16,36
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 10,-5,-8,26
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W202,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -5,15,16,33
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,-15,-16,36
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,8,26
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W202,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -5,15,16,33
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 10,-5,-40,26
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W202,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -5,15,36,33
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 10,-5,-8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -10,20,20,39
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W202,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 5,-18,-20,35
	WAIT		SUITORU_WAIT
	END_CALL

@======================================================
@	きゅうけつ
@======================================================
WEST_Kyuuketu:
	CHAR_SET	WAZACHR_ID_HARI2
	CHAR_SET	WAZACHR_ID_SOLAR
	WAIT		1
	CHAR_SET	WAZACHR_ID_PIKARI
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BGPRI_GAPSET3	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	WAIT		1
	ADD_ACTOR	ActKyuuketuHeader,A_UP+2,3, -20,15,12
	WAIT_FLAG
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,2
	SEPLAY_PAN	SE_W071,WAZA_SE_R
	WAIT		2
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,5,5,1
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1,0,7,0x0000
	WAIT_FLAG
	SEQ_CALL	WEST_SuitoruSub		//※「すいとる」のを使用
	WAIT_FLAG
	WAIT		15
	SEQ_CALL	WEST_PikariAttack
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1,7,0,0x0000
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	こうごうせい
@======================================================
WEST_Kougousei:
	CHAR_SET	WAZACHR_ID_PIKARI
	CHAR_SET	WAZACHR_ID_KIRAKIRA2
	ADD_TASK	WazaTaskColorFade,PRI2,6, 2,2,2,0,16,0x4bfb
	SEPLAY_PAN	SE_W025,WAZA_SE_L
	SEQ_CALL	WEST_Kirakira
	WAIT_FLAG
	SEQ_CALL	WEST_PikariAttack
	WAIT_FLAG
	SEQEND

@======================================================
@	どくどく
@======================================================
WEST_Dokudoku:
	CHAR_SET	WAZACHR_ID_DOKUDOKU
	CHAR_SET	WAZACHR_ID_HEDORO
	SEQ_CALL	WEST_DokudokuSub
	SEQ_CALL	WEST_DokudokuSub
	WAIT_FLAG
	WAIT		15
	SEQ_CALL	WEST_DokuKouka
	WAIT_FLAG
	SEQEND

WEST_DokudokuSub:
	ADD_ACTOR	ActDokudokuHeader,D_UP+2,4, -24,16,1,1
	SEPLAY_PAN	SE_W092,WAZA_SE_R
	WAIT		15
	ADD_ACTOR	ActDokudokuHeader,D_UP+2,4, 8,16,1,1
	SEPLAY_PAN	SE_W092,WAZA_SE_R
	WAIT		15
	ADD_ACTOR	ActDokudokuHeader,D_UP+2,4, -8,16,1,1
	SEPLAY_PAN	SE_W092,WAZA_SE_R
	WAIT		15
	ADD_ACTOR	ActDokudokuHeader,D_UP+2,4, 24,16,1,1
	SEPLAY_PAN	SE_W092,WAZA_SE_R
	WAIT		15
	END_CALL

@======================================================
@	ヘドロこうげき
@======================================================
#define HEDORO_KOUGEKI_SYNC		40
WEST_HedoroKougeki:
	CHAR_SET	WAZACHR_ID_HEDORO
	SEPLAY_PAN	SE_W145C,WAZA_SE_L
	ADD_ACTOR	ActHedoroHeader,D_UP+2,4, 20,0,HEDORO_KOUGEKI_SYNC,0
	WAIT_FLAG
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,3,0,5,1
	ADD_TASK	WazaTaskColorFade,PRI2,6, 4,1,2,0,12,0x7c1e
//	WAIT_FLAG
//	WAIT		15
	SEQ_CALL	WEST_DokuKouka
	WAIT_FLAG
	SEQEND

@======================================================
@	ヘドロばくだん
@======================================================
#define HEDORO_BAKUDAN_SYNC		20
WEST_HedoroBakudan:
	CHAR_SET	WAZACHR_ID_HEDORO
	SEQ_CALL	WEST_HedoroBakudanSub
	SEQ_CALL	WEST_HedoroBakudanSub
	SEQ_CALL	WEST_HedoroBakudanSub
	SEQ_CALL	WEST_HedoroBakudanSub
	SEQ_CALL	WEST_HedoroBakudanSub
	SEQ_CALL	WEST_HedoroBakudanSub
	SEQ_CALL	WEST_HedoroBakudanSub
	SEQ_CALL	WEST_HedoroBakudanSub
	SEQ_CALL	WEST_HedoroBakudanSub
	SEQ_CALL	WEST_HedoroBakudanSub
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 1,3,0,15,1
	ADD_TASK	WazaTaskColorFade,PRI2,6, 4,1,2,0,12,0x7c1e
	ADD_ACTOR	ActHedoroSubHeader,D_UP+2,3, 42,27,HEDORO_BAKUDAN_SYNC
	ADD_ACTOR	ActHedoroSubHeader,D_UP+2,3, -27,44,HEDORO_BAKUDAN_SYNC
	ADD_ACTOR	ActHedoroSubHeader,D_UP+2,3, 39,-28,HEDORO_BAKUDAN_SYNC
	ADD_ACTOR	ActHedoroSubHeader,D_UP+2,3, -42,-42,HEDORO_BAKUDAN_SYNC
	SEPLAY_PAN	SE_W091,WAZA_SE_R
	WAIT		5
	ADD_ACTOR	ActHedoroSubHeader,D_UP+2,3, 0,40,HEDORO_BAKUDAN_SYNC
	ADD_ACTOR	ActHedoroSubHeader,D_UP+2,3, -8,-44,HEDORO_BAKUDAN_SYNC
	ADD_ACTOR	ActHedoroSubHeader,D_UP+2,3, -46,-28,HEDORO_BAKUDAN_SYNC
	ADD_ACTOR	ActHedoroSubHeader,D_UP+2,3, 46,9,HEDORO_BAKUDAN_SYNC
	SEPLAY_PAN	SE_W091,WAZA_SE_R
	WAIT		5
	ADD_ACTOR	ActHedoroSubHeader,D_UP+2,3, 42,0,HEDORO_BAKUDAN_SYNC
	ADD_ACTOR	ActHedoroSubHeader,D_UP+2,3, -43,-12,HEDORO_BAKUDAN_SYNC
	ADD_ACTOR	ActHedoroSubHeader,D_UP+2,3, 16,-46,HEDORO_BAKUDAN_SYNC
	ADD_ACTOR	ActHedoroSubHeader,D_UP+2,3, -16,44,HEDORO_BAKUDAN_SYNC
	SEPLAY_PAN	SE_W091,WAZA_SE_R
	WAIT		0
	SE_WAIT_FLAG
	WAIT_FLAG
	SEQ_CALL	WEST_DokuKouka
	WAIT_FLAG
	SEQEND

WEST_HedoroBakudanSub:
	SEPLAY_PAN	SE_W145C,WAZA_SE_L
	ADD_ACTOR	ActHedoroHeader,D_UP+2,4, 20,0,HEDORO_KOUGEKI_SYNC,0
	WAIT		3
	END_CALL

@======================================================
@	ようかいえき
@======================================================
#define YOUKAIEKI_SYNC	50
WEST_Youkaieki:
	CHAR_SET	WAZACHR_ID_HEDORO
	POKEBG		3
	ADD_ACTOR	YoukaiekiHeader,D_UP+2,6, 20,0,HEDORO_KOUGEKI_SYNC,1,0,0
	SEPLAY_PAN	SE_W145C,WAZA_SE_L
	WAIT		5
	ADD_ACTOR	YoukaiekiHeader,D_UP+2,6, 20,0,HEDORO_KOUGEKI_SYNC,1,24,0
	SEPLAY_PAN	SE_W145C,WAZA_SE_L
	WAIT		5
	ADD_ACTOR	YoukaiekiHeader,D_UP+2,6, 20,0,HEDORO_KOUGEKI_SYNC,1,-24,0
	SEPLAY_PAN	SE_W145C,WAZA_SE_L
	WAIT		15
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 1,2,0,10,1
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 3,2,0,10,1
	ADD_TASK	WazaTaskColorFade,PRI2,6, 20,2,2,0,12,0x7c1e
	ADD_ACTOR	ActHedoroSuitekiHeader,D_UP+2,5, 0,-22,0,15,YOUKAIEKI_SYNC+5
	SEPLAY_PAN	SE_W145,WAZA_SE_R
	WAIT		10
	ADD_ACTOR	ActHedoroSuitekiHeader,D_UP+2,5, -26,-24,0,15,YOUKAIEKI_SYNC+5
	SEPLAY_PAN	SE_W145,WAZA_SE_R
	WAIT		10
	ADD_ACTOR	ActHedoroSuitekiHeader,D_UP+2,5, 15,-27,0,15,YOUKAIEKI_SYNC
	SEPLAY_PAN	SE_W145,WAZA_SE_R
	WAIT		10
	ADD_ACTOR	ActHedoroSuitekiHeader,D_UP+2,5, -15,-17,0,10,YOUKAIEKI_SYNC-5
	SEPLAY_PAN	SE_W145,WAZA_SE_R
	WAIT		10
	ADD_ACTOR	ActHedoroSuitekiHeader,D_UP+2,5, 27,-22,0,15,YOUKAIEKI_SYNC
	SEPLAY_PAN	SE_W145,WAZA_SE_R
	WAIT_FLAG
	POKEBG_RESET	3
	SEQEND

@======================================================
@	ホネブーメラン
@======================================================

WEST_HoneBoomeran:
	CHAR_SET	WAZACHR_ID_HONE
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W155,WAZA_SE_L
	ADD_ACTOR	ActHoneBoomeranHeader,A_UP+2,0
	WAIT		20
	SEPLAY_PAN	SE_W030,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,1
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,5,0,5,1
	WAIT		17
	SEPLAY_PAN	SE_W233,WAZA_SE_L
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,6,-4
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	ホネこんぼう
@======================================================

WEST_HoneKonbou:
	CHAR_SET	WAZACHR_ID_HONE
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W155,WAZA_SE_R
	ADD_ACTOR	ActHoneKonbouHeader,A_UP+2,5, -42,-25, 0,0, 15
	WAIT		12
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,1
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,5,5,1
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 7,5,1,0x0000,10,0,0
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	ボーンラッシュ
@======================================================

WEST_BoonRush:
	CHAR_SET	WAZACHR_ID_HONE
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W155,WAZA_SE_R
	ADD_ACTOR	ActHoneKonbouHeader,A_UP+2,5, -42,-25, 0,0, 15
	WAIT		12
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,2
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,3,5,1
	SEPLAY_PAN	SE_W030,WAZA_SE_R
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	まきびし
@======================================================
#define MAKIBISI_WAIT	10
#define MAKIBISI_SYNC	30

WEST_Makibisi:
	CHAR_SET	WAZACHR_ID_MAKIBISI2
	POKEBG		3		//まきびしを2体の前に出すため
	SEPLAY_PAN	SE_W026,WAZA_SE_L
	SE_WAITPLAY	SE_W030,WAZA_SE_R,MAKIBISI_SYNC - WAIT_OFFSET
	ADD_ACTOR	ActMakibisiHeader,D_UP+2,5, 20,0,0,24,MAKIBISI_SYNC
	WAIT		MAKIBISI_WAIT
	SEPLAY_PAN	SE_W026,WAZA_SE_L
	SE_WAITPLAY	SE_W030,WAZA_SE_R,MAKIBISI_SYNC - WAIT_OFFSET
	ADD_ACTOR	ActMakibisiHeader,D_UP+2,5, 20,0,-24,24,MAKIBISI_SYNC
	WAIT		MAKIBISI_WAIT
//	SEPLAY_PAN	SE_W026,WAZA_SE_L
	SE_WAITPLAY	SE_W030,WAZA_SE_R,MAKIBISI_SYNC - WAIT_OFFSET
	ADD_ACTOR	ActMakibisiHeader,D_UP+2,5, 20,0,24,24,MAKIBISI_SYNC
	WAIT_FLAG
	POKEBG_RESET	3
	SEQEND


@======================================================
@	メガホーン
@======================================================

WEST_MegaHoon:
	CHAR_SET	WAZACHR_ID_MEGAHOON
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3

	SEPLAY_PAN	SE_W082,WAZA_SE_L
	CONTEST_CHK_JP	WEST_MegahoonHaikeiContest
	HAIKEI_CHG	WAZAMAP_ID_NANAME
	HAIKEI_HALF_WAIT
	ADD_TASK	HaikeiMapScrTask,PRI5,4, -0x0900,0x0300,1,0xffff
WEST_MegahoonHaikeiReturn:
	HAIKEI_CHG_WAIT

	BLDALPHA_SET	0xc,0x8
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 0,2,0,15,1
	WAIT_FLAG
	WAIT		10
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,24,0,0,6
	WAIT		3
	ADD_ACTOR	ActMegaHoonHeader,A_UP+3,5, -42,25, 0,0, 6
	WAIT		4
	SEPLAY_PAN	SE_W011,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,0
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 1,-16,4,1,4
	WAIT_FLAG
//	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,7,0,15,1
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 1,-4,1,12,1		//chg_02.08.28_iwa
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 7,5,1,0x7fff,10,0,0
	WAIT		10
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,11
	WAIT		3
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 1,0,7
	WAIT_FLAG
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET

	HAIKEI_RECOVER
	HAIKEI_HALF_WAIT
	WORK_SET	7,0xffff	//背景のｽｸﾛｰﾙ終了
	HAIKEI_CHG_WAIT

	SEQEND

WEST_MegahoonHaikeiContest:
	HAIKEI_CHG	WAZAMAP_ID_NANAME2
	HAIKEI_HALF_WAIT
	ADD_TASK	HaikeiMapScrTask,PRI5,4, 0x0900,0x0300,0,0xffff
	SEQ_JP		WEST_MegahoonHaikeiReturn

@======================================================
@	かぜおこし
@======================================================

WEST_Kazeokosi:
	CHAR_SET	WAZACHR_ID_KAZE
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W016,WAZA_SE_R
	ADD_ACTOR	ActKazeOkosiHeader,A_UP+2,2, 0,-16
	ADD_TASK	KazeColorManageTask,PRI5,2, 1,70
	WAIT_FLAG
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 1,1,0,7,1
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,2
	SEPLAY_PAN	SE_W016B,WAZA_SE_R
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	つばさでうつ
@======================================================
#define TUBASA_SYNC	20
WEST_TubasadeUtu:
	CHAR_SET	WAZACHR_ID_KAZE
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	SE_REPEAT	SE_W017,WAZA_SE_L,20,2
	ADD_TASK	TaskPokeKurukuru,PRI2,5, 0,12,4, 1,4
	ADD_TASK	KazeColorManageTask,PRI5,2, 1,70
	ADD_ACTOR	ActTubasadeUtuHeader,A_UP+2,5, -25,0, 0,0, TUBASA_SYNC
	ADD_ACTOR	ActTubasadeUtuHeader,A_UP+2,5, 25,0,  0,0, TUBASA_SYNC
	WAIT		24
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,24,0,0,9
	WAIT		TUBASA_SYNC - 3
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 16,0,1,1
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -16,0,1,1
	SE_REPEAT	SE_W003,WAZA_SE_R,5,2
	WAIT_FLAG
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,11
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	つつく
@======================================================

WEST_Tutuku:
	CHAR_SET	WAZACHR_ID_HITMARK
//	POKEBG		3
//	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W030,WAZA_SE_R
	ADD_TASK	KinomiPokeRollTask,PRI2,4,	3,-0x0300,1,2
//	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, -12,0,1,3
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+3,4, -12,0,1,3
	WAIT_FLAG
//	POKEBG_RESET	3
//	BLDALPHA_RESET
	SEQEND

@======================================================
@	エアロブラスト
@======================================================
#define EARO_WAIT	3
#define EARO_SYNC	15
WEST_EaroBurasuto:
	CHAR_SET	WAZACHR_ID_EARO
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3

	SEQ_CALL	WEST_KAZE_MAPCHG
	
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1,0,11,0x54a3
//	WAIT_FLAG
	SEQ_CALL	WEST_EaroBurasutoSub
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,5,0,50,1
	SEQ_CALL	WEST_EaroBurasutoSub
	SEQ_CALL	WEST_EaroBurasutoSub
	SEQ_CALL	WEST_EaroBurasutoSub
	SEQ_CALL	WEST_EaroBurasutoSub
	WAIT_FLAG
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,0
	SEPLAY_PAN	SE_W013,WAZA_SE_R
	WAIT_FLAG
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1,11,0,0x54a3
//	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET

	WAIT		0
	SEQ_CALL	WEST_KAZE_MAPEND

	SEQEND
	
WEST_EaroBurasutoSub:
	SEPLAY_PAN	SE_W026,WAZA_SE_L
	ADD_ACTOR	ActEaroHeader,A_UP+2,7, 14,-12, 0,-12, EARO_SYNC,0,0
	ADD_ACTOR	ActEaroHeader,A_UP+2,7, 26,8, 12,8, EARO_SYNC,0,0
	WAIT		EARO_WAIT
	SEPLAY_PAN	SE_W026,WAZA_SE_L
	ADD_ACTOR	ActEaroHeader,A_UP+2,7, 14,-12, 0,-12, EARO_SYNC,1,0
	ADD_ACTOR	ActEaroHeader,A_UP+2,7, 26,8, 12,8, EARO_SYNC,1,0
	WAIT		EARO_WAIT
	SEPLAY_PAN	SE_W026,WAZA_SE_L
	ADD_ACTOR	ActEaroHeader,A_UP+2,7, 14,-12, 0,-12, EARO_SYNC,2,0
	ADD_ACTOR	ActEaroHeader,A_UP+2,7, 26,8, 12,8, EARO_SYNC,2,0
	WAIT		EARO_WAIT
	SEPLAY_PAN	SE_W026,WAZA_SE_L
	ADD_ACTOR	ActEaroHeader,A_UP+2,7, 14,-12, 0,-12, EARO_SYNC,3,0
	ADD_ACTOR	ActEaroHeader,A_UP+2,7, 26,8, 12,8, EARO_SYNC,3,0
	WAIT		EARO_WAIT
	END_CALL

@======================================================
@	みずでっぽう
@======================================================
#define MIZUDEPPOU_SYNC	40
WEST_MizuDeppou:
	CHAR_SET	WAZACHR_ID_MIZU2
	CHAR_SET	WAZACHR_ID_MIZUHIT
	POKEBG		3
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	ADD_ACTOR	ActMizuDeppouHeader,A_UP+2,6, 20,0, 0,0, MIZUDEPPOU_SYNC,-25
	SEPLAY_PAN	SE_W145,WAZA_SE_L
	WAIT_FLAG
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 1,1,0,8,1
	ADD_ACTOR	ActMizuHitHeader,A_UP+4,4, 0,0,1,2
	ADD_ACTOR	ActMizuSuitekiHeader,A_UP+2,5, 0,-15,0,15, 55
	SEPLAY_PAN	SE_W152,WAZA_SE_R
	WAIT		10
	ADD_ACTOR	ActMizuSuitekiHeader,A_UP+2,5, 15,-20,0,15, 50
	SEPLAY_PAN	SE_W152,WAZA_SE_R
	WAIT		10
	ADD_ACTOR	ActMizuSuitekiHeader,A_UP+2,5, -15,-10,0,10, 45
	SEPLAY_PAN	SE_W152,WAZA_SE_R
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	クラブハンマー
@======================================================
#define KURABU_AWA_WAIT	4
#define KURABUAWA_SYNC	20
WEST_KurabuHanmer:
	CHAR_SET	WAZACHR_ID_YUKI2
	CHAR_SET	WAZACHR_ID_MIZUHIT
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	ADD_ACTOR	ActMizuHitHeader,A_UP+4,4, 0,0,1,0
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	WAIT		1
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 0x1f,3,1,0x7ead,10,0,0
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 1,-24,0,0,4
	WAIT_FLAG
	WAIT		8
	WAIT_FLAG
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 1,0,4
	WAIT_FLAG
	SE_REPEAT	SE_W152,WAZA_SE_R, 20,3
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,4,8,1
	ADD_ACTOR	ActKurabuAwaHeader,A_UP+2,4, 10,10, KURABUAWA_SYNC,1
	WAIT		KURABU_AWA_WAIT
	ADD_ACTOR	ActKurabuAwaHeader,A_UP+2,4, 20,-20, KURABUAWA_SYNC,1
	WAIT		KURABU_AWA_WAIT
	ADD_ACTOR	ActKurabuAwaHeader,A_UP+2,4, -15,15, KURABUAWA_SYNC,1
	WAIT		KURABU_AWA_WAIT
	ADD_ACTOR	ActKurabuAwaHeader,A_UP+2,4, 0,0, KURABUAWA_SYNC,1
	WAIT		KURABU_AWA_WAIT
	ADD_ACTOR	ActKurabuAwaHeader,A_UP+2,4, -10,-20, KURABUAWA_SYNC,1
	WAIT		KURABU_AWA_WAIT
	ADD_ACTOR	ActKurabuAwaHeader,A_UP+2,4, 16,-8, KURABUAWA_SYNC,1
	WAIT		KURABU_AWA_WAIT
	ADD_ACTOR	ActKurabuAwaHeader,A_UP+2,4, 5,8, KURABUAWA_SYNC,1
	WAIT		KURABU_AWA_WAIT
	ADD_ACTOR	ActKurabuAwaHeader,A_UP+2,4, -16,0, KURABUAWA_SYNC,1
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	なみのり
@======================================================
WEST_Naminori:
	ADD_TASK	WazaNaminoriTask,PRI2,1, 0
	WAIT		24
	SEPAN_FLOW	SE_W057,WAZA_SE_L,WAZA_SE_R,2,0
	WAIT_FLAG
	SEQEND

@======================================================
@	かえんほうしゃ
@======================================================
#define KAENHOUSYA_FURIHABA_Y0		16
#define KAENHOUSYA_FURIHABA_Y1		(-16)
#define KAENHOUSYA_WAIT			2
WEST_KaenHousya:
	CHAR_SET	WAZACHR_ID_FIRE
	POKEBG		3
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 0,0,2,46,1
	WAIT		6
	ADD_TASK	HaidoriKakudoTask,PRI5,1, 100
	SEPAN_FLOW	SE_W053,WAZA_SE_L,WAZA_SE_R,2,0
	SEQ_CALL	WEST_KaenHousyaSub
	SEQ_CALL	WEST_KaenHousyaSub
	SEQ_CALL	WEST_KaenHousyaSub
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,3,0,43,1
	SEQ_CALL	WEST_KaenHousyaSub
	SEQ_CALL	WEST_KaenHousyaSub
	SEQ_CALL	WEST_KaenHousyaSub
	SEQ_CALL	WEST_KaenHousyaSub
	SEQ_CALL	WEST_KaenHousyaSub
	SEQ_CALL	WEST_KaenHousyaSub
	SEQ_CALL	WEST_KaenHousyaSub
	SEQ_CALL	WEST_KaenHousyaSub
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

WEST_KaenHousyaSub:
	ADD_ACTOR	ActKaenHousyaHeader,A_UP+3,4, 10,10,0,KAENHOUSYA_FURIHABA_Y0
//	ADD_ACTOR	ActKaenHousyaHeader,A_UP+3,4, 10,10,0,KAENHOUSYA_FURIHABA_Y1
	WAIT		KAENHOUSYA_WAIT
	ADD_ACTOR	ActKaenHousyaHeader,A_UP+3,4, 10,10,0,KAENHOUSYA_FURIHABA_Y0
//	ADD_ACTOR	ActKaenHousyaHeader,A_UP+3,4, 10,10,0,KAENHOUSYA_FURIHABA_Y1
	WAIT		KAENHOUSYA_WAIT
	END_CALL

@======================================================
@	すなあらし
@======================================================
#define SUNAARASI_SP_X	0x0900
#define SUNAARASI_SP_Y	0x0060
WEST_SunaArasi:
	CHAR_SET	WAZACHR_ID_SUNAARASI
	//SEPAN_FLOWFIX	SE_W054,WAZA_SE_L,WAZA_SE_R,1,0
	SEPLAY_PAN	SE_W201,0
	ADD_TASK	SunaArasiHaikeiTask,PRI5,1, 0
	WAIT		16
	ADD_ACTOR	SunaArasiHeader,A_UP+40,4, 10,SUNAARASI_SP_X,SUNAARASI_SP_Y,0
	WAIT		10
	ADD_ACTOR	SunaArasiHeader,A_UP+40,4, 90,SUNAARASI_SP_X-0x0100,SUNAARASI_SP_Y,0
	WAIT		10
	ADD_ACTOR	SunaArasiHeader,A_UP+40,4, 50,SUNAARASI_SP_X+0x0100,SUNAARASI_SP_Y,0
	WAIT		10
	ADD_ACTOR	SunaArasiHeader,A_UP+40,4, 20,SUNAARASI_SP_X,SUNAARASI_SP_Y,0
	WAIT		10
	ADD_ACTOR	SunaArasiHeader,A_UP+40,4, 70,SUNAARASI_SP_X-0x0140,SUNAARASI_SP_Y,0
	WAIT		10
	ADD_ACTOR	SunaArasiHeader,A_UP+40,4, 0,SUNAARASI_SP_X+0x0200,SUNAARASI_SP_Y,0
	WAIT		10
	ADD_ACTOR	SunaArasiHeader,A_UP+40,4, 60,SUNAARASI_SP_X+0x0100,SUNAARASI_SP_Y,0
	SEQEND

@======================================================
@	うずしお
@======================================================
WEST_Uzusio:	//しめつけｴﾌｪｸﾄでもそのまま使用
//	CHAR_SET	WAZACHR_ID_YUKI2
	CHAR_SET	WAZACHR_ID_HAIDORO	//chg_02.08.28_iwasawa
	POKEBG		3
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	WAIT		0
	ADD_ACTOR	ActFadeHeader,A_UP,5, 0x04,2, 0,7,0x5da0
	SEPLAY_PAN	SE_W250,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,2,50,1
	SEQ_CALL	WEST_UzusioSub
	SEQ_CALL	WEST_UzusioSub
	SEQ_CALL	WEST_UzusioSub
	WAIT		12
	ADD_ACTOR	ActFadeHeader,A_UP,5, 0x04,2, 7,0,0x5da0
	WAIT_FLAG
	POKEBG_RESET	3
	SEQEND

WEST_UzusioSub:
#if 1
	ADD_ACTOR	ActUzusioHeader,D_UP+2,7, 0,28, 0x0180,50, 8, 50,1
	WAIT		2
	ADD_ACTOR	ActUzusioHeader,D_UP+2,7, 0,32, 0x00f0,40, 11, -46,1
	WAIT		2
	ADD_ACTOR	ActUzusioHeader,D_UP+2,7, 0,33, 0x01a0,40, 4, 42,1
	WAIT		2
	ADD_ACTOR	ActUzusioHeader,D_UP+2,7, 0,31, 0x0120,45, 6, -42,1
	WAIT		2
	ADD_ACTOR	ActUzusioHeader,D_UP+2,7, 0,28, 0x01c0,45, 11, 46,1
	WAIT		2
	ADD_ACTOR	ActUzusioHeader,D_UP+2,7, 0,33, 0x01d0,50, 10, -50,1
	WAIT		2
#else
	ADD_ACTOR	ActUzusioHeader,D_UP+2,7, 0,28, 0x0180,50, 10, 50,1
	WAIT		2
	ADD_ACTOR	ActUzusioHeader,D_UP+2,7, 0,32, 0x00f0,40, 13, -46,1
	WAIT		2
	ADD_ACTOR	ActUzusioHeader,D_UP+2,7, 0,33, 0x01a0,40, 8, 42,1
	WAIT		2
	ADD_ACTOR	ActUzusioHeader,D_UP+2,7, 0,31, 0x0120,45, 11, -42,1
	WAIT		2
	ADD_ACTOR	ActUzusioHeader,D_UP+2,7, 0,28, 0x01c0,45, 16, 46,1
	WAIT		2
	ADD_ACTOR	ActUzusioHeader,D_UP+2,7, 0,33, 0x01d0,50, 15, -50,1
	WAIT		2
#endif
	END_CALL

@======================================================
@	そらをとぶ
@======================================================
#define SORA_TURN2_SYNC		20	//敵の所に到達するまでのSync回数
WEST_SorawoTobu:
	CHAR_SET	WAZACHR_ID_SORA2
	CHAR_SET	WAZACHR_ID_HITMARK
	TURN_CHK	WEST_SorawoTobuTurn1, WEST_SorawoTobuTurn2
WEST_SorawoTobuReturn:
	WAIT_FLAG
	SEQEND

WEST_SorawoTobuTurn1:	//1ターン目:上空へ飛ぶ
	SEPLAY_PAN	SE_W019,WAZA_SE_L
	ADD_ACTOR	ActSorawoTobu0Header,A_UP+2,4, 0,0, 13, 0x0150
	SEQ_JP		WEST_SorawoTobuReturn

WEST_SorawoTobuTurn2:	//2ターン目:急降下
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W104,WAZA_SE_L
	ADD_ACTOR	ActSorawoTobu1Header,A_UP+2,1, SORA_TURN2_SYNC
	WAIT		SORA_TURN2_SYNC
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,0
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,6,0,8,1
	SEPLAY_PAN	SE_W013,WAZA_SE_R
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQ_JP		WEST_SorawoTobuReturn

@======================================================
@	うかぶ
@======================================================
#define SORA_TURN2_SYNC		20	//敵の所に到達するまでのSync回数
WEST_Ukabu:
	CHAR_SET	WAZACHR_ID_SORA2
	CHAR_SET	WAZACHR_ID_HITMARK
	TURN_CHK	WEST_UkabuTurn1, WEST_UkabuTurn2
WEST_UkabuReturn:
	SEQEND

WEST_UkabuTurn1:	//1ターン目:上空へ飛ぶ
	SEPLAY_PAN	SE_W100,WAZA_SE_L
	ADD_ACTOR	UkabuHeader,A_UP+2,2, 0,0
	SEQ_JP		WEST_UkabuReturn

WEST_UkabuTurn2:	//2ターン目:急降下
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W207,WAZA_SE_R
	ADD_ACTOR	UkabuHeader2,D_UP+3,0
	WAIT		7
	SEPLAY_PAN	SE_W025B,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, 0,0,1,0
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,5,11,1
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQ_JP		WEST_UkabuReturn

@======================================================
@	からてチョップ
@======================================================

WEST_KarateChop:
	CHAR_SET	WAZACHR_ID_KAKUTOU
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W104,WAZA_SE_R
	ADD_ACTOR	ActKakutouHeader,A_UP+2,8, -16,0,0,0, 10,1, 3,0
	WAIT_FLAG
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,2
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,4,0,6,1
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	クロスチョップ
@======================================================
WEST_KurosuChop:
	CHAR_SET	WAZACHR_ID_KAKUTOU
	CHAR_SET	WAZACHR_ID_XHITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W025,WAZA_SE_R
	ADD_ACTOR	ActKurosuTyoppuHeader,A_UP+2,3, 0,0,0
	ADD_ACTOR	ActKurosuTyoppuHeader,A_UP+2,3, 0,0,1
	WAIT		40
	SEPLAY_PAN	SE_W013,WAZA_SE_R
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 31,3,1,0x7fff,10,0x0000,10
	ADD_ACTOR	ActXHitMarkHeader,A_UP+3,4, 0,0,1,20
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,7,0,9,1
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND


@======================================================
@	とびげり
@======================================================

WEST_Tobigeri:
	CHAR_SET	WAZACHR_ID_KAKUTOU
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,4,4
	WAIT		3
//	ADD_ACTOR	ActKakutouHeader,A_UP+2,8, -16,8,0,0, 10,1, 1,1
	ADD_ACTOR	TobigeriHeader,A_UP+2,8, -16,8,0,0, 10,1, 1,1
	SEPLAY_PAN	SE_W026,WAZA_SE_R
	WAIT_FLAG
	ADD_ACTOR	ActHitMarkHeader,A_UP+1,4, 0,0,1,1
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,5,0,7,1
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	とびひざげり
@======================================================

WEST_Tobihizageri:
	CHAR_SET	WAZACHR_ID_KAKUTOU
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,-24,0,0,8
	WAIT_FLAG
	WAIT		10
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,3
	WAIT		2
	ADD_ACTOR	TobigeriHeader,A_UP+2,8, -16,8,0,0, 10,1, 1,1
	SEPLAY_PAN	SE_W026,WAZA_SE_R
	WAIT_FLAG
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,1
//	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,5,0,7,1
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 1,-28,0,0,3
	WAIT		3
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 1,3,0,11,1
	WAIT_FLAG
	WAIT		5
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 1,0,6
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	にどげり
@======================================================
#define NIDOGERI_WAITSYNC	20
WEST_Nidogeri:
	CHAR_SET	WAZACHR_ID_KAKUTOU
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	ADD_ACTOR	RandomKakutouMarkHeader, A_UP+3, 3, 1,NIDOGERI_WAITSYNC,1,	//chg_0820_iwa
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,4,0,6,1
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	WAIT_FLAG
//	ADD_ACTOR	ActKakutouWaitHeader,A_UP+3,5, 12,4,NIDOGERI_WAITSYNC, 1,1
//	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 12,4-8,1,2
//	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,4,0,6,1
//	SEPLAY_PAN	SE_W233B,WAZA_SE_R		//chg_0820_iwa

	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	トリプルキック
@======================================================
#define TORIPURUKIKKU_WAITSYNC	20
WEST_ToripuruKikku:
	CHAR_SET	WAZACHR_ID_KAKUTOU
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
#if 1
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	TURN_JP		0,WEST_ToripuruKikkuTurn1
	TURN_JP		1,WEST_ToripuruKikkuTurn2
	SEQ_JP		WEST_ToripuruKikkuTurn3
#else
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+3,5, -16,-8,TORIPURUKIKKU_WAITSYNC, 1,1
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, -16,-8-8,1,2
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,4,0,6,1
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	WAIT_FLAG
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+3,5, 8,8,TORIPURUKIKKU_WAITSYNC, 1,1
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, 8,8-8,1,2
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,4,0,6,1
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	WAIT_FLAG
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+3,5, 0,0,TORIPURUKIKKU_WAITSYNC, 1,1
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, 0,0-8,1,1
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,6,0,8,1
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
#endif
WEST_ToripuruKikkuReturn:
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

#if 1
WEST_ToripuruKikkuTurn1:		//1ターン目
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+4,5, -16,-8,TORIPURUKIKKU_WAITSYNC, 1,1
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, -16,-16,1,2
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,4,0,6,1
	SEQ_JP		WEST_ToripuruKikkuReturn

WEST_ToripuruKikkuTurn2:		//2ターン目
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+4,5, 8,8,TORIPURUKIKKU_WAITSYNC, 1,1
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 8,0,1,2
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,4,0,6,1
	SEQ_JP		WEST_ToripuruKikkuReturn

WEST_ToripuruKikkuTurn3:		//3ターン目
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+4,5, 0,0,TORIPURUKIKKU_WAITSYNC, 1,1
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 0,-8,1,1
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,6,0,8,1
	SEQ_JP		WEST_ToripuruKikkuReturn
#endif

@======================================================
@	ばくれつパンチ
@======================================================

WEST_BakuretuPanti:
	CHAR_SET	WAZACHR_ID_KAKUTOU
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_DAIBAKUHATU
	CHAR_SET	WAZACHR_ID_BAKUHATU
	WAIT		1
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+3,5, 0,0, 20, 1,0
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, 0,0,1,0
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,5,0,7,1
	WAIT		1
	SE_WAIT_FLAG
#if 1		//chg_02.08_iwa
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 1,5,0,28,1
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, 0,0, 1,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, 24,-24, 1,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, -16,16, 1,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, -24,-12, 1,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, 16,16, 1,1
#else
	SE_REPEAT	SE_W120,WAZA_SE_R,7,3
	ADD_TASK	TaskPokeCenterBuru,PRI5,5, 1,5,0,14,1
	ADD_ACTOR	ActBakuhatuHeader,D_UP+1,4, 6,5,1,0
	WAIT		3
	ADD_ACTOR	ActBakuhatuHeader,D_UP+1,4, -10,-16,1,0
	WAIT		3
	ADD_ACTOR	ActBakuhatuHeader,D_UP+1,4, -7,2,1,0
	WAIT		4
	ADD_ACTOR	ActBakuhatuHeader,D_UP+1,4, 12,-8,1,0
#endif	
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	カウンター
@======================================================
WEST_Counter:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_KAKUTOU
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5, 0,18,6, 1,4
	SEPLAY_PAN	SE_W233,WAZA_SE_L
	WAIT_FLAG
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,20,0,0,4
	WAIT		4
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -15,18,1,0
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	WAIT		1
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,5,0,25,1
	ADD_ACTOR	ActKakutouWaitHeader,A_UP+3,5, -15,18, 8, 1,0
	WAIT		3
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,-4,1,0
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	WAIT		1
	ADD_ACTOR	ActKakutouWaitHeader,A_UP+3,5, 0,-4, 8, 1,0
	WAIT		3
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 15,9,1,0
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	WAIT		1
	ADD_ACTOR	ActKakutouWaitHeader,A_UP+3,5, 15,9, 8, 1,0
	WAIT		5
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,5
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	あてみなげ
@======================================================

WEST_AtemiNage:
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W233,WAZA_SE_L
	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5, 0,12,4, 1,2
	WAIT_FLAG
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,20,0,0,4
	WAIT		2
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,1
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	WAIT		1
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 1,-24,0,0,4
	WAIT_FLAG
	WAIT		3
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,7
	WAIT		11
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 1,0,10
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	いわくだき
@======================================================
WEST_IwaKudaki:
	CHAR_SET	WAZACHR_ID_IWA
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_KAKUTOU
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	WAIT		1
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,1
	ADD_ACTOR	ActKakutouWaitHeader,A_UP+2,5, 0,0, 8, 1,0
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,5,1
	WAIT_FLAG
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	ADD_ACTOR	ActIwaKudakiSubHeader,A_UP+2,6, 0,0, 20,24, 14, 2
	ADD_ACTOR	ActIwaKudakiSubHeader,A_UP+2,6, 5,0, -20,24, 14, 1
	ADD_ACTOR	ActIwaKudakiSubHeader,A_UP+2,6, 0,5, 20,-24, 14, 2
	ADD_ACTOR	ActIwaKudakiSubHeader,A_UP+2,6, -5,0, -20,-24, 14, 2
	ADD_ACTOR	ActIwaKudakiSubHeader,A_UP+2,6, 0,-5, 30,18, 8, 2
	ADD_ACTOR	ActIwaKudakiSubHeader,A_UP+2,6, 0,0, 30,-18, 8, 2
	ADD_ACTOR	ActIwaKudakiSubHeader,A_UP+2,6, 0,0, -30,18, 8, 2
	ADD_ACTOR	ActIwaKudakiSubHeader,A_UP+2,6, 0,0, -30,-18, 8, 2
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,0,3,7,1
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	じごくぐるま
@======================================================
WEST_JigokuGuruma:
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W104,WAZA_SE_L
	SE_WAITPLAY	SE_W004,WAZA_SE_R,10
	SE_WAITPLAY	SE_W104,WAZA_SE_L,20
	SE_WAITPLAY	SE_W004,WAZA_SE_R,30
	SE_WAITPLAY	SE_W104,WAZA_SE_L,40
	SE_WAITPLAY	SE_W004,WAZA_SE_R,50
	SE_WAITPLAY	SE_W104,WAZA_SE_L,60
	SE_WAITPLAY	SE_W004,WAZA_SE_R,70
	SE_WAITPLAY	SE_W104,WAZA_SE_L,80
	SE_WAITPLAY	SE_W004,WAZA_SE_R,90
	ADD_TASK	TaskPokeKurukuru,PRI2,5, 0,-18,6, 6,4
	ADD_TASK	TaskPokeKurukuru,PRI2,5, 1,18,6, 6,4
	SEQ_CALL	WEST_JigokuGurumaSub
	SEQ_CALL	WEST_JigokuGurumaSub
	SEQ_CALL	WEST_JigokuGurumaSub
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

WEST_JigokuGurumaSub:
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,-12,1,1
	WAIT		8
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, -12,8,1,1
	WAIT		8
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 12,0,1,1
	WAIT		8
	END_CALL

@======================================================
@	にほんばれ
@======================================================
#define NIHONBARE_WAIT	6
WEST_Nihonbare:
	CHAR_SET	WAZACHR_ID_HIZASI
	POKEBG		2
	BLDALPHA_SET	0xd,0x3
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 31,1, 0,6,0x7fff
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x0781,1,0,6,0x7fff
	WAIT_FLAG
	SEPAN_FLOWFIX	SE_W080,WAZA_SE_L,WAZA_SE_R,1,0
	SEQ_CALL	WEST_NihonbareSub
	SEQ_CALL	WEST_NihonbareSub
	SEQ_CALL	WEST_NihonbareSub
	SEQ_CALL	WEST_NihonbareSub
	WAIT_FLAG
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 31,1, 6,0,0x7fff
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x0781,1,6,0,0x7fff
	WAIT_FLAG
	POKEBG_RESET	2
	BLDALPHA_RESET
	SEQEND

WEST_NihonbareSub:
	ADD_ACTOR	ActNihonbareHeader,A_UP+40,0
	WAIT		NIHONBARE_WAIT
	END_CALL

@======================================================
@	わたほうし
@======================================================
#define WATAHOUSI_WAIT	12
WEST_Watahousi:
	CHAR_SET	WAZACHR_ID_HOUSI
	POKEBG		3
	BGPRI_GAPSET	BG_DEFENCE
	SE_REPEAT	SE_W077,WAZA_SE_R,18,10
	SEQ_CALL	WEST_WatahousiSub
	SEQ_CALL	WEST_WatahousiSub
	SEQ_CALL	WEST_WatahousiSub
	WAIT_FLAG
	POKEBG_RESET	3
	SEQEND

WEST_WatahousiSub:
	ADD_ACTOR	ActHousiHeader,A_UP+2,5, 0,-20,85, 80, 0
	WAIT		WATAHOUSI_WAIT
	ADD_ACTOR	ActHousiHeader,A_UP+2,5, 0,-10,170, 80, 0
	WAIT		WATAHOUSI_WAIT
	ADD_ACTOR	ActHousiHeader,A_UP+2,5, 0,-15,0, 80, 0
	WAIT		WATAHOUSI_WAIT
	END_CALL

@======================================================
@	キノコのほうし
@======================================================
#define KINOKONOHOUSI_WAIT	12
WEST_Kinokonohousi:
	CHAR_SET	WAZACHR_ID_HOUSI
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	ADD_TASK	HousiBGPriSet,PRI2,0
	SE_REPEAT	SE_W077,WAZA_SE_R,16,11
	SEQ_CALL	WEST_KinokonohousiSub
	SEQ_CALL	WEST_KinokonohousiSub
	SEQ_CALL	WEST_KinokonohousiSub
	WAIT_FLAG
	WAIT		1
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

WEST_KinokonohousiSub:
	ADD_ACTOR	ActHousiHeader,D_UP+2,5, 0,-20,85, 80, 1
	WAIT		KINOKONOHOUSI_WAIT
	ADD_ACTOR	ActHousiHeader,D_UP+2,5, 0,-10,170, 80, 1
	WAIT		KINOKONOHOUSI_WAIT
	ADD_ACTOR	ActHousiHeader,D_UP+2,5, 0,-15,0, 80, 1
	WAIT		KINOKONOHOUSI_WAIT
	END_CALL

@======================================================
@	はなびらのまい
@======================================================
#define HANABIRA_WAITSYNC	15
WEST_HanabiranoMai:
	CHAR_SET	WAZACHR_ID_HANA
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W080,WAZA_SE_L
	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5, 0,12,6, 6,3
	ADD_ACTOR	ActHanabiranoMaiHeader,A_UP+2,4, 0,-24, 8, 140
	ADD_ACTOR	ActHanabiranoMaiSubHeader,A_UP+2,4, 16,-24, 8, 100
	ADD_ACTOR	ActHanabiranoMaiSubHeader,A_UP+2,4, -16,-24, 8, 100
	WAIT		HANABIRA_WAITSYNC
	ADD_ACTOR	ActHanabiranoMaiHeader,A_UP+2,4, 0,-24, 8, 140
	ADD_ACTOR	ActHanabiranoMaiSubHeader,A_UP+2,4, 32,-24, 8, 100
	ADD_ACTOR	ActHanabiranoMaiSubHeader,A_UP+2,4, -32,-24, 8, 100
	WAIT		HANABIRA_WAITSYNC
	ADD_ACTOR	ActHanabiranoMaiHeader,A_UP+2,4, 0,-24, 8, 140
	ADD_ACTOR	ActHanabiranoMaiSubHeader,A_UP+2,4, 24,-24, 8, 100
	ADD_ACTOR	ActHanabiranoMaiSubHeader,A_UP+2,4, -24,-24, 8, 100
	WAIT		30
	ADD_ACTOR	ActHanabiranoMaiSubHeader,A_UP+2,4, 16,-24, 0, 100
	ADD_ACTOR	ActHanabiranoMaiSubHeader,A_UP+2,4, -16,-24, 0, 100
	WAIT		30
	ADD_ACTOR	ActHanabiranoMaiSubHeader,A_UP+2,4, 20,-16, 14, 80
	ADD_ACTOR	ActHanabiranoMaiSubHeader,A_UP+2,4, -20,-14, 16, 80
	WAIT_FLAG
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,24,0,0,5
	WAIT		3
	SEPLAY_PAN	SE_W025B,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,0
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,6,0,8,1
	WAIT_FLAG
	WAIT		8
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,7
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	はっぱカッター
@======================================================
#define HAPPACUTTER_SYNC	22
#define HAPPA_WAIT			2
WEST_HappaCutter:
	CHAR_SET	WAZACHR_ID_HAPPA
	CHAR_SET	WAZACHR_ID_HAPPACUTTER
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
//	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	WAIT		1
	SE_REPEAT	SE_W077,WAZA_SE_L,10,5
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,-3,-2,10
	WAIT		HAPPA_WAIT
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,-1,-1,15
	WAIT		HAPPA_WAIT
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,-4,-4,7
	WAIT		HAPPA_WAIT
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,3,-3,11
	WAIT		HAPPA_WAIT
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,-1,-6,8
	WAIT		HAPPA_WAIT
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,2,-1,12
	WAIT		HAPPA_WAIT
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,-3,-4,13
	WAIT		HAPPA_WAIT
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,4,-5,7
	WAIT		HAPPA_WAIT
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,2,-6,11
	WAIT		HAPPA_WAIT
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,-3,-5,8
	WAIT		60
	SEPLAY_PAN	SE_W013B,WAZA_SE_L
	ADD_ACTOR	ActHappaCutterHeader,D_UP+3,7, 20,-10, 20,0, HAPPACUTTER_SYNC, 20,1
	ADD_ACTOR	ActHappaCutterHeader,D_UP+3,7, 20,-10, 20,0, HAPPACUTTER_SYNC, -20,1
	WAIT		HAPPACUTTER_SYNC - 2
	SEPLAY_PAN	SE_W013,WAZA_SE_R
//	ADD_ACTOR	ActHitMarkHeader,D_UP+4,4, -10,-4,1,2
//	ADD_ACTOR	ActHitMarkHeader,D_UP+4,4, 10,4,1,2
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,8,1
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 3,2,0,8,1
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	げんしのちから
@======================================================
#define GENSI_SYNC	60
WEST_GensinoTikara:
	CHAR_SET	WAZACHR_ID_IWA
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	ADD_ACTOR	ActQuakeHeader,A_UP+2,4, 4,1,10,1
	ADD_ACTOR	ActGensiHeader,A_UP+2,5, 20,32,  -48, 50, 2
	ADD_ACTOR	ActGensiHeader,A_UP+2,5, 0,32,   -38, 25, 5
	ADD_ACTOR	ActGensiHeader,A_UP+2,5, 32,32,  -28, 40, 3
	ADD_ACTOR	ActGensiHeader,A_UP+2,5, -20,32, -48, 50, 2
	ADD_ACTOR	ActGensiHeader,A_UP+2,5, 20,32, -28, GENSI_SYNC, 1
	ADD_ACTOR	ActGensiHeader,A_UP+2,5, 0,32,  -28, 30, 4
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,1,0,GENSI_SYNC/2,1
	SEPLAY_PAN	SE_W082,WAZA_SE_L
	WAIT		10
	ADD_ACTOR	ActGensiHeader,A_UP+2,5, 15,32,   -48, 25, 5
	ADD_ACTOR	ActGensiHeader,A_UP+2,5, -10,32,  -42, 30, 4
	WAIT		10
	ADD_ACTOR	ActGensiHeader,A_UP+2,5, 0,32,   -42, 25, 5
	ADD_ACTOR	ActGensiHeader,A_UP+2,5, -25,32,  -48, 30, 4
	WAIT_FLAG
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,16,0,0,4
	WAIT		3
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,1
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,6,1
	WAIT_FLAG
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,7
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	オクタンほう
@======================================================
WEST_Okutanhou:
	CHAR_SET	WAZACHR_ID_BOMB
	CHAR_SET	WAZACHR_ID_BOURU
	SEPLAY_PAN	SE_W025B,WAZA_SE_L
	ADD_ACTOR	ActTamanageHeader,D_UP+2,6, 20,0, 0,0, 20,0
	WAIT_FLAG
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	ActSmokeHeader,D_UP+2,4, 8,8,1,0
	WAIT		2
	ADD_ACTOR	ActSmokeHeader,D_UP+2,4, -8,-8,1,0
	WAIT		2
	ADD_ACTOR	ActSmokeHeader,D_UP+2,4, 8,-8,1,0
	WAIT		2
	ADD_ACTOR	ActSmokeHeader,D_UP+2,4, -8,8,1,0
	WAIT_FLAG
	SEQEND

@======================================================
@	しろいきり
@======================================================
#define SIROIKIRI_WAIT	7
#define SIROIKIRI_SYNC	240
WEST_SiroiKiri:
	CHAR_SET	WAZACHR_ID_KIRI2
	POKEBG		2
//	BGPRI_GAPSET2
	BLDALPHA_SET	0xc,0x8
	SE_REPEAT	SE_W054,WAZA_SE_L,20,15
	SEQ_CALL	WEST_SiroiKiriSub
	SEQ_CALL	WEST_SiroiKiriSub
	SEQ_CALL	WEST_SiroiKiriSub
	SEQ_CALL	WEST_SiroiKiriSub
	SEQ_CALL	WEST_SiroiKiriSub
	SEQ_CALL	WEST_SiroiKiriSub
	SEQ_CALL	WEST_SiroiKiriSub
	WAIT		32
	ADD_TASK	WazaTaskColorFade,PRI2,6, 0xa,8,2,0,14,0x7fff
	WAIT_FLAG
	POKEBG_RESET	2
	BLDALPHA_RESET
	SEQEND

WEST_SiroiKiriSub:
	ADD_ACTOR	ActSiroiKiriHeader,A_UP+2,6, 0,-24, 48,SIROIKIRI_SYNC,0,1
	WAIT		SIROIKIRI_WAIT
	END_CALL

@======================================================
@	くろいきり
@======================================================
WEST_KuroiKiri:
	
	WAIT_FLAG
//	SEPAN_FLOWFIX	SE_W054,WAZA_SE_L,WAZA_SE_R,1,0
	SEPLAY_PAN	SE_W114,0
	ADD_TASK	KuroikiriInitTask,PRI5,0
	WAIT		30
//	ADD_TASK	ColorFadeSeq,PRI10,5, 2+4+8+16,2,0,16,0x0000
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x0780,2,0,16,0x0000
	WAIT		90
//	ADD_TASK	ColorFadeSeq,PRI10,5, 2+4+8+16,1,16,0,0x0000
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x0780,1,16,0,0x0000
	SEQEND

@======================================================
@	ほのおのパンチ
@======================================================
WEST_HonoonoPanti:
	CHAR_SET	WAZACHR_ID_KAKUTOU
	CHAR_SET	WAZACHR_ID_FIRE
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,2,0,9,0x001f
	ADD_ACTOR	ActHonoonoPantiHeader,D_UP+1,1, 0
	ADD_ACTOR	ActHonoonoPantiHeader,D_UP+1,1, 64
	ADD_ACTOR	ActHonoonoPantiHeader,D_UP+1,1, 128
	ADD_ACTOR	ActHonoonoPantiHeader,D_UP+1,1, 196
	SEPLAY_PAN	SE_W172,WAZA_SE_R
	WAIT_FLAG
//	ADD_ACTOR	ActBakuretuPantiHeader,A_UP+2,5, 0,10, 2,3,30
	ADD_ACTOR	ActKakutouWaitHeader,D_UP+3,5, 0,0, 8, 1,0
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, 0,0,1,1
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,0,3,15,1
	SEQ_CALL	WEST_HonoonoPantiSub
	WAIT		4
	SEPLAY_PAN	SE_W007,WAZA_SE_R
	WAIT_FLAG
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,0,9,0,0x001f
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

WEST_HonoonoPantiSub:	//※「かえんぐるま」「ブレイズキック」でも使用
	ADD_ACTOR	ActHonoonoPantiSubHeader,D_UP+1,5, 0,10, 0x00c0,0x00b0,40
	ADD_ACTOR	ActHonoonoPantiSubHeader,D_UP+1,5, 0,10, -0x00c0,0x00f0,40
	ADD_ACTOR	ActHonoonoPantiSubHeader,D_UP+1,5, 0,10, 0x00c0,-0x00a0,40
	ADD_ACTOR	ActHonoonoPantiSubHeader,D_UP+1,5, 0,10, -0x00c0,-0x0070,40
	ADD_ACTOR	ActHonoonoPantiSubHeader,D_UP+1,5, 0,10, 0x00a0,0x0030,40
	ADD_ACTOR	ActHonoonoPantiSubHeader,D_UP+1,5, 0,10, -0x00e0,-0x0020,40
	ADD_ACTOR	ActHonoonoPantiSubHeader,D_UP+1,5, 0,10, 0x0070,-0x0080,40
	END_CALL

@======================================================
@	にらみつける
@======================================================
#define NIRAMI_AFF		(-5)
WEST_Niramitukeru:
	CHAR_SET	WAZACHR_ID_FLASH
	POKEBG		0
	BGPRI_GAPSET	BG_ATTACK
	BLDALPHA_SET	0x8,0x8
	SEPLAY_PAN	SE_W043,WAZA_SE_L
	ADD_ACTOR	ActMiyaburuHeader,A_UP+2,2, 24,-12
	ADD_TASK	PokeKakusyukuTask,PRI5,5, NIRAMI_AFF,NIRAMI_AFF,10,0,1
	WAIT_FLAG
	WAIT		10
//	ADD_ACTOR	ActQuakeHeader,A_UP+2,5, 2,1,18,2,1
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,1,0,9,1
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 3,1,0,9,1
	WAIT_FLAG
	POKEBG_RESET	0
	BLDALPHA_RESET
	WAIT			1
//	ADD_TASK	StatusEffectTask,PRI5,5, 1,1,1,1,0

	WAIT_FLAG
	SEQEND

@======================================================
@	ゆめくい
@======================================================
#define YUMEKUI_AFF	(-6)
WEST_Yumekui:
	CHAR_SET	WAZACHR_ID_SOLAR
	CHAR_SET	WAZACHR_ID_PIKARI
	POKEBG		3
	BGPRI_GAPSET3	BG_DEFENCE
	SEPLAY_PAN	SE_W060,WAZA_SE_L
	SEQ_CALL	WEST_ESP_MAPCHG
//	WAIT_FLAG
	BLDALPHA_SET	0x8,0x8
	SEPLAY_PAN	SE_W107,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,5,0,15,1
	ADD_TASK	PokeKakusyukuTask,PRI5,5, YUMEKUI_AFF,YUMEKUI_AFF,15,1,1
//	WAIT_FLAG
//	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,7,0,7,1
//	ADD_TASK	PokeKakusyukuTask,PRI5,5, YUMEKUI_AFF,YUMEKUI_AFF,15,1,1
	WAIT_FLAG
	BLDALPHA_SET	0xc,0x8
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,0,2,25,1
	SEQ_CALL	WEST_YumekuiSub
	WAIT_FLAG
	WAIT		15
	SEQ_CALL	WEST_Pikari
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	WAIT		1
	SEQ_CALL	WEST_ESP_MAPEND
//	WAIT_FLAG
	SEQEND

WEST_YumekuiSub:		//※「ゆめくい」でも使用
	SEPLAY_PAN	SE_W207,WAZA_SE_R	//ゆめくいで追加した効果音
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 5,-18,-40,35
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -10,20,20,39
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W207,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,28,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 10,-5,-8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -10,20,40,39
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W207,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 10,-5,-8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -5,15,16,33
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 10,-5,-32,26
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W207,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,-15,-16,36
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 10,-5,-8,26
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W207,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -5,15,16,33
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,-15,-16,36
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,8,26
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W207,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -5,15,16,33
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 10,-5,-40,26
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W207,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -5,15,36,33
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 10,-5,-8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, -10,20,20,39
	WAIT		SUITORU_WAIT
	SEPLAY_PAN	SE_W207,WAZA_SE_R
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 0,5,8,26
	ADD_ACTOR	ActSuitoruHeader,A_UP+3,4, 5,-18,-20,35
	WAIT		SUITORU_WAIT
	END_CALL

@======================================================
@	139:どくガス
@======================================================
#define DGASU_SYNC	64	
WEST_Dokugasu:
	CHAR_SET	WAZACHR_ID_DOKUGIRI
	CHAR_SET	WAZACHR_ID_HEDORO
	WAIT		0
	POKEBG		3
	BGPRI_GAPSET2
	BLDALPHA_SET	0xc,0x8
	WAIT		0
	SEPLAY_PAN	SE_W054,WAZA_SE_L
	ADD_ACTOR	ActDokugasuHeader,D_UP,8,		DGASU_SYNC,0,0,-32,-6,0x1060,0x0430,0
	WAIT		4
	SEPLAY_PAN	SE_W054,WAZA_SE_L
	ADD_ACTOR	ActDokugasuHeader,D_UP,8,		DGASU_SYNC,0,0,-32,-6,0x1060,0x0430,0
	WAIT		4
	SEPLAY_PAN	SE_W054,WAZA_SE_L
	ADD_ACTOR	ActDokugasuHeader,D_UP,8,		DGASU_SYNC,0,0,-32,-6,0x1060,0x0430,0
	WAIT		4
	SEPLAY_PAN	SE_W054,WAZA_SE_L
	ADD_ACTOR	ActDokugasuHeader,D_UP,8,		DGASU_SYNC,0,0,-32,-6,0x1060,0x0430,0
	WAIT		4
	SEPLAY_PAN	SE_W054,WAZA_SE_L
	ADD_ACTOR	ActDokugasuHeader,D_UP,8,		DGASU_SYNC,0,0,-32,-6,0x1060,0x0430,0
	WAIT		4
	SEPLAY_PAN	SE_W054,WAZA_SE_L
	ADD_ACTOR	ActDokugasuHeader,D_UP,8,		DGASU_SYNC,0,0,-32,-6,0x1060,0x0430,0
	WAIT		DGASU_SYNC-24
	SE_REPEAT	SE_W054,WAZA_SE_R,28,6
	ADD_TASK	WazaTaskColorFade,PRI2, 6, 4,6,2,0,12,0x681a
//	WAIT		80
//	ADD_TASK	WazaTaskColorFade,PRI2, 6, 4,8,1,12,0,0x681a
	WAIT_FLAG
	BLDALPHA_RESET
	POKEBG_RESET	3
	WAIT		0
	SEQEND


@======================================================
@	しめつける
@======================================================
#define SIMETUKE_AFF		(10)
WEST_Simetukeru:
	ADD_TASK	PokeSinMove,PRI5,5, 0,6,0x0d00,4,0
	SEQ_JP		WEST_SimetukeruMain

WEST_SimetukeruMain:	//「しめつける」「まきつく」共通部分
	SEPLAY_PAN	SE_W020,WAZA_SE_R
	SEQ_CALL	WEST_SimetukeruSub
//	WAIT		3
	SEQ_CALL	WEST_SimetukeruSub
	WAIT_FLAG
	SEQEND

WEST_SimetukeruSub:
//	ADD_TASK	PokeKakusyukuTask,PRI5,5, SIMETUKE_AFF,0,5, 1,0
	ADD_TASK	PokeKakusyukuTask,PRI5,5, SIMETUKE_AFF,-5,5, 1,0	//chg_0820_iwa
//	WAIT_FLAG
	WAIT		SIMETUKE_AFF*2 - WAIT_OFFSET*2
	END_CALL

@======================================================
@	まきつく
@======================================================
WEST_Makituku:
	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5, 0,6,4, 2,4
	SEQ_JP		WEST_SimetukeruMain
	
@======================================================
@	サイケこうせん
@======================================================
#define SAIKEKOUSEN_SYNC	13
#define SAIKEKOUSEN_WAIT	4
WEST_SaikeKousen:
	CHAR_SET	WAZACHR_ID_ONPA
	SEPLAY_PAN	SE_W060,WAZA_SE_L
	SEQ_CALL	WEST_ESP_MAPCHG
//	WAIT_FLAG
	SE_TASK		SeRepeatPanMove,7, SE_W060B,WAZA_SE_L,WAZA_SE_R,3,4,0,15
	SEQ_CALL	WEST_SaikeKousenSub
	SEQ_CALL	WEST_SaikeKousenSub
	ADD_TASK	PokeSinMove,PRI5,5, 0,6,0x0800,4,1
	ADD_TASK	WazaTaskColorFade,PRI2,6, 4,2,2,0,12,0x7e5f
	SEQ_CALL	WEST_SaikeKousenSub
	SEQ_CALL	WEST_SaikeKousenSub
	SEQ_CALL	WEST_SaikeKousenSub
	SEQ_CALL	WEST_SaikeKousenSub
	SEQ_CALL	WEST_SaikeKousenSub
	SEQ_CALL	WEST_SaikeKousenSub
	SEQ_CALL	WEST_SaikeKousenSub
	SEQ_CALL	WEST_SaikeKousenSub
	SEQ_CALL	WEST_SaikeKousenSub
	WAIT_FLAG
	WAIT		1
	SEQ_CALL	WEST_ESP_MAPEND
//	WAIT_FLAG
	SEQEND

WEST_SaikeKousenSub:
	ADD_ACTOR	ActSaikeKousenHeader,D_UP+2,6, 16,0,0,0, SAIKEKOUSEN_SYNC,0x0000
	WAIT		SAIKEKOUSEN_WAIT
	END_CALL

@======================================================
@	さいみんじゅつ
@======================================================
#define SAIMIN_SYNC	27
#define SAIMIN_WAIT	6
WEST_SaiminJyutu:
	CHAR_SET	WAZACHR_ID_ONPA
	SEQ_CALL	WEST_ESP_MAPCHG
//	WAIT_FLAG
	SEQ_CALL	WEST_SaiminJyutuSub
	SEQ_CALL	WEST_SaiminJyutuSub
	SEQ_CALL	WEST_SaiminJyutuSub
	ADD_TASK	WazaTaskColorFade,PRI2,6, 4,2,2,0,12,0x7e5f
	WAIT_FLAG
	WAIT		1
	SEQ_CALL	WEST_ESP_MAPEND
//	WAIT_FLAG
	SEQEND

WEST_SaiminJyutuSub:
	SEPLAY_PAN	SE_W048,WAZA_SE_L
	ADD_ACTOR	ActSaikeKousenHeader,D_UP+2,6, 0,8,0,8, SAIMIN_SYNC,0x0000
	ADD_ACTOR	ActSaikeKousenHeader,D_UP+2,6, 16,-8,0,-8, SAIMIN_SYNC,0x0000
	WAIT		SAIMIN_WAIT
	END_CALL

@======================================================
@	サイコウェーブ
@======================================================
#define SAIKOWAVE_FURIHABA_Y0		16
#define SAIKOWAVE_WAIT			4
WEST_SaikoWave:
	CHAR_SET	WAZACHR_ID_ONPA_B
	SEPLAY_PAN	SE_W060,WAZA_SE_L
	SEQ_CALL	WEST_ESP_MAPCHG
//	WAIT_FLAG
	ADD_TASK	HaidoriKakudoTask,PRI5,1, 100
	SE_TASK		SeRepeatPanMove,7, SE_W100,WAZA_SE_L,WAZA_SE_R,2,9,0,10
	SEQ_CALL	WEST_SaikoWaveSub
	SEQ_CALL	WEST_SaikoWaveSub
	ADD_TASK	WazaTaskColorFade,PRI2,6, 4,1,4,0,12,0x7e5f
	SEQ_CALL	WEST_SaikoWaveSub
	SEQ_CALL	WEST_SaikoWaveSub
	SEQ_CALL	WEST_SaikoWaveSub
	SEQ_CALL	WEST_SaikoWaveSub
	WAIT_FLAG
	WAIT		1
	SEQ_CALL	WEST_ESP_MAPEND
//	WAIT_FLAG
	SEQEND

WEST_SaikoWaveSub:
	ADD_ACTOR	ActSaikoWaveHeader,D_UP+3,4, 10,10,0,SAIKOWAVE_FURIHABA_Y0
	WAIT		SAIKOWAVE_WAIT
	ADD_ACTOR	ActSaikoWaveHeader,D_UP+3,4, 10,10,0,SAIKOWAVE_FURIHABA_Y0
	WAIT		SAIKOWAVE_WAIT
	END_CALL

@======================================================
@	でんじほう
@======================================================
#define DENJIHOU_SYNC	30
#define DENJI_FURIHABA	16
#define DENJI_SEC		40	//秒速度
WEST_Denjihou:
	CHAR_SET	WAZACHR_ID_DENJIHOU2
	CHAR_SET	WAZACHR_ID_MAHI
	SEPLAY_PAN	SE_W086,WAZA_SE_L
	ADD_ACTOR	ActDenjihouHeader,D_UP+3,6, 10,0, 0,0, DENJIHOU_SYNC,0x0000
	ADD_ACTOR	ActDenjihouSubHeader,D_UP+4,7,10,0,DENJI_FURIHABA,DENJIHOU_SYNC,0,DENJI_SEC,0
	ADD_ACTOR	ActDenjihouSubHeader,D_UP+4,7,10,0,DENJI_FURIHABA,DENJIHOU_SYNC,64,DENJI_SEC,1
	ADD_ACTOR	ActDenjihouSubHeader,D_UP+4,7,10,0,DENJI_FURIHABA,DENJIHOU_SYNC,128,DENJI_SEC,0
	ADD_ACTOR	ActDenjihouSubHeader,D_UP+4,7,10,0,DENJI_FURIHABA,DENJIHOU_SYNC,192,DENJI_SEC,2

	ADD_ACTOR	ActDenjihouSubHeader,D_UP+4,7,10,0,8,DENJIHOU_SYNC,32,DENJI_SEC,0
	ADD_ACTOR	ActDenjihouSubHeader,D_UP+4,7,10,0,8,DENJIHOU_SYNC,96,DENJI_SEC,1
	ADD_ACTOR	ActDenjihouSubHeader,D_UP+4,7,10,0,8,DENJIHOU_SYNC,160,DENJI_SEC,0
	ADD_ACTOR	ActDenjihouSubHeader,D_UP+4,7,10,0,8,DENJIHOU_SYNC,224,DENJI_SEC,2

	WAIT_FLAG
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,4,0,5,1
	WAIT		15
	SE_WAITPLAY	SE_W085B,WAZA_SE_R,19
	SEQ_CALL	WEST_MahiKouka
	WAIT_FLAG
	SEQEND

@======================================================
@	はがねのつばさ
@======================================================
WEST_HaganenoTubasa:
	CHAR_SET	WAZACHR_ID_KAZE
	CHAR_SET	WAZACHR_ID_HITMARK
	SE_REPEAT	SE_W231,WAZA_SE_L,28,2
	ADD_TASK	MetaruEffectTask,PRI5,3, 0,0,0
	WAIT_FLAG
	POKEBG		3
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	SE_REPEAT	SE_W017,WAZA_SE_L,20,2	//はがねのつばさで追加した
	ADD_TASK	TaskPokeKurukuru,PRI2,5, 0,12,4, 1,4
	ADD_TASK	KazeColorManageTask,PRI5,2, 1,70
	ADD_ACTOR	ActTubasadeUtuHeader,A_UP+2,5, -25,0, 0,0, TUBASA_SYNC
	ADD_ACTOR	ActTubasadeUtuHeader,A_UP+2,5, 25,0,  0,0, TUBASA_SYNC
	WAIT		24
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,24,0,0,9
	WAIT		TUBASA_SYNC - 3
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 16,0,1,1
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -16,0,1,1
	SEPLAY_PAN	SE_W013,WAZA_SE_R
	WAIT_FLAG
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,11
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	アイアンテール
@======================================================
WEST_AianTeeru:
	CHAR_SET	WAZACHR_ID_HITMARK
	SE_REPEAT	SE_W231,WAZA_SE_L,28,2
	ADD_TASK	MetaruEffectTask,PRI5,3, 1,0,0
	WAIT_FLAG
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,4,4
	WAIT		6		@体当たりのﾙｰﾌﾟ回数と同じにしておくこと
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, 0,0,1,2
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,6,1
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	WAIT_FLAG
	ADD_TASK	PokeMonotoneTask,PRI5,2, 0,1
	POKEBG_RESET	1
	BLDALPHA_RESET
	WAIT_FLAG
	SEQEND

@======================================================
@	ポイズンテール
@======================================================
WEST_PoisonTeeru:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_HEDORO
	SE_REPEAT	SE_W231,WAZA_SE_L,28,2
	ADD_TASK	MetaruEffectTask,PRI5,3, 1,1,0x5cd8
	WAIT_FLAG
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,4,4
	WAIT		6		@体当たりのﾙｰﾌﾟ回数と同じにしておくこと
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, 0,0,1,2
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,6,1
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	WAIT_FLAG
	ADD_TASK	PokeMonotoneTask,PRI5,2, 0,1
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQ_CALL	WEST_DokuKouka
	WAIT_FLAG
	SEQEND

@======================================================
@	メタルクロー
@======================================================
WEST_MetaruKuro:
	CHAR_SET	WAZACHR_ID_KIRISAKU
	SE_REPEAT	SE_W231,WAZA_SE_L,28,2
	ADD_TASK	MetaruEffectTask,PRI5,3, 0,0,0
	WAIT_FLAG
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,6,4
	WAIT		4-WAIT_OFFSET
	SEPLAY_PAN	SE_W013,WAZA_SE_R
	ADD_ACTOR	ActMetaruKuroHeader,D_UP+2,3, -10,-10,0
	ADD_ACTOR	ActMetaruKuroHeader,D_UP+2,3, -10,10,0
	ADD_ACTOR	ActQuakeHeader,A_UP+2,5, -4,1,10, 3,1
	WAIT		8
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,6,4
	WAIT		4-WAIT_OFFSET
	SEPLAY_PAN	SE_W013,WAZA_SE_R
	ADD_ACTOR	ActMetaruKuroHeader,D_UP+2,3, 10,-10,1
	ADD_ACTOR	ActMetaruKuroHeader,D_UP+2,3, 10,10,1
	ADD_ACTOR	ActQuakeHeader,A_UP+2,5, -4,1,10, 3,1
	WAIT_FLAG
	SEQEND

@======================================================
@	ナイトヘッド
@======================================================
#define NIGHTHEAD_WAIT	70
WEST_NightHead:
	POKEBG		0
	BGPRI_GAPSET	BG_ATTACK
//	BLDALPHA_SET	0x8,0x8
	SEPLAY_PAN	SE_W060,WAZA_SE_L
	HAIKEI_CHG	WAZAMAP_ID_GHOST
	HAIKEI_CHG_WAIT
//	WAIT_FLAG
	WAIT		10
	SEPLAY_PAN	SE_W043,WAZA_SE_L
	ADD_TASK	NightHeadTask,PRI5,1, NIGHTHEAD_WAIT+15
	WAIT		NIGHTHEAD_WAIT
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,12,1
	ADD_TASK	WazaTaskColorFade,PRI2,6, 4,0,2,0,13,0x0000
	WAIT_FLAG
	POKEBG_RESET	0
//	BLDALPHA_RESET
	WAIT		1
	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
//	WAIT_FLAG
	SEQEND

@======================================================
@	タマゴばくだん
@======================================================

WEST_TamagoBakudan:
	CHAR_SET	WAZACHR_ID_DAIBAKUHATU
	CHAR_SET	WAZACHR_ID_TAMAGO
	SEPLAY_PAN	SE_W039,WAZA_SE_L
	ADD_ACTOR	TamagoBakudanHeader,D_UP+2,6, 10,0,0,0, 25,-32
	WAIT_FLAG
//	ADD_ACTOR	ActFlashHeader,D_UP+2,7, 31,4,1,0,9,0,0
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,4,0,16,1
	ADD_ACTOR	DaibakuhatuHeader,D_UP+4,4, 6,5,1,0
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	WAIT		3
	ADD_ACTOR	DaibakuhatuHeader,D_UP+4,4, -16,-15,1,0
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	WAIT		3
	ADD_ACTOR	DaibakuhatuHeader,D_UP+4,4, 16,-5,1,0
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	WAIT		3
	ADD_ACTOR	DaibakuhatuHeader,D_UP+4,4, -12,18,1,0
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	WAIT		3
	ADD_ACTOR	DaibakuhatuHeader,D_UP+4,4, 0,5,1,0
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	WAIT		3
	WAIT_FLAG
	SEQEND

@======================================================
@	シャドーボール
@======================================================
WEST_ShadowBall:
	CHAR_SET	WAZACHR_ID_SHADOWBALL
	HAIKEI_CHG	WAZAMAP_ID_GHOST
	HAIKEI_CHG_WAIT
//	WAIT_FLAG
	WAIT		15
	SE_TASK		SeRepeatPanMove,7, SE_W054,WAZA_SE_L,WAZA_SE_R,5,5,0,5
	ADD_ACTOR	ShadowBallHeader,D_UP+2,3,16,16,8,
	WAIT_FLAG
	SEPLAY_PAN	SE_W028,WAZA_SE_R
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,4,0,8,1
	WAIT_FLAG
	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
//	WAIT_FLAG
	SEQEND

@======================================================
@	したでなめる
@======================================================
WEST_SitadeNameru:
	CHAR_SET	WAZACHR_ID_SITA
//	HAIKEI_CHG	WAZAMAP_ID_GHOST
//	HAIKEI_CHG_WAIT
	WAIT		15
	SEPLAY_PAN	SE_W122,WAZA_SE_R
	ADD_ACTOR	SitadeNameruHeader,D_UP+2,2, 0,0
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,1,0,16,1
	WAIT_FLAG
//	HAIKEI_RECOVER
//	HAIKEI_CHG_WAIT
	SEQEND

@======================================================
@	きあいだめ
@======================================================
WEST_Kiaidame:
/*	CHAR_SET	WAZACHR_ID_KIAI2
	POKEBG		2
	BGPRI_GAPSET	BG_ATTACK
	BLDALPHA_SET	4,16
	SEPLAY_PAN	SE_W082,WAZA_SE_L
	ADD_ACTOR	KiaidameHeader,A_UP+2,2, 0,5
	WAIT_FLAG
	WAIT		1
	POKEBG_RESET	2
	BLDALPHA_RESET
	SEQEND
*/
	CHAR_SET	WAZACHR_ID_KORAERU

	SEPLAY_PAN	SE_W082, WAZA_SE_L,
	SEQ_CALL	WEST_KoraeruSub
	WAIT		8
	ADD_TASK	WazaTaskColorFade,PRI2,6, 2,2,2,0,11,0x7fff
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,1,0,32,1
	SEQ_CALL	WEST_KoraeruSub
	WAIT		8
	SEQ_CALL	WEST_KoraeruSub
	WAIT_FLAG
	SEQEND

@======================================================
@	がまん
@======================================================
WEST_Gaman:
	TURN_CHK	WEST_GamanTurn1, WEST_GamanTurn2
	SEQEND

WEST_GamanTurn1:	//1ﾀｰﾝ目
	SE_REPEAT	SE_W036,WAZA_SE_L,9,2
	ADD_TASK	WazaTaskColorFade,PRI2,6, 2,2,2,0,11,0x001f
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,1,0,32,1
	WAIT_FLAG
	SEQEND

WEST_GamanTurn2:	//2ﾀｰﾝ目
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	SE_REPEAT	SE_W036,WAZA_SE_L,9,2
	ADD_TASK	ColorFadeSeq,PRI10,5, 2,2,0,11,0x001f
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,1,0,32,1
	WAIT_FLAG
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,24,0,0,4
	WAIT_FLAG
//	ADD_TASK	TaskPokeDamageYure,PRI5,5, 1,1,10,1,0
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 0,2,0,12,1
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,16,1
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+1,4, 18,-8,1,1
	WAIT		5
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+1,4, -18,8,1,1
	WAIT		5
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+1,4, -8,-5,1,1
	WAIT_FLAG
	WAIT		5
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,7
	WAIT_FLAG
	ADD_TASK	ColorFadeSeq,PRI10,5, 2,2,11,0,0x001f
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	いとをはく
@======================================================
#define ITOWOHAKU_WAIT	1
#define ITOKARAMI_WAIT	4
WEST_Itowohaku:
	CHAR_SET	WAZACHR_ID_ITO2
	CHAR_SET	WAZACHR_ID_ITODAMA
	POKEBG		3
	WAIT		0
	ADD_ACTOR	ActFadeHeader,PRI5,5, 1,2, 0,9,0
	WAIT_FLAG
	SE_REPEAT	SE_W081,WAZA_SE_L,9,6
	SEQ_CALL	WEST_ItowohakuSub
	SEQ_CALL	WEST_ItowohakuSub
	SEQ_CALL	WEST_ItowohakuSub
	SEQ_CALL	WEST_ItowohakuSub
	SEQ_CALL	WEST_ItowohakuSub
	SEQ_CALL	WEST_ItowohakuSub
	SEQ_CALL	WEST_ItowohakuSub
	SEQ_CALL	WEST_ItowohakuSub
	SEQ_CALL	WEST_ItowohakuSub
	SEQ_CALL	WEST_ItowohakuSub
	SEQ_CALL	WEST_ItowohakuSub
	SEQ_CALL	WEST_ItowohakuSub
	SEQ_CALL	WEST_ItowohakuSub
	SEQ_CALL	WEST_ItowohakuSub
	SEQ_CALL	WEST_ItowohakuSub
	SEQ_CALL	WEST_ItowohakuSub
	SEQ_CALL	WEST_ItowohakuSub
	SEQ_CALL	WEST_ItowohakuSub
	WAIT_FLAG
	SEPLAY_PAN	SE_W081B,WAZA_SE_R
	ADD_ACTOR	ItoHeader,D_UP+2,2, 0,10
	WAIT		ITOKARAMI_WAIT
	ADD_ACTOR	ItoHeader,D_UP+2,2, 0,-2
	WAIT		ITOKARAMI_WAIT
	ADD_ACTOR	ItoHeader,D_UP+2,2, 0,22
	WAIT_FLAG
	POKEBG_RESET	3
	WAIT		1
//	ADD_TASK	StatusEffectTask,PRI2,5	1,3,1,1,0
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,PRI5,5, 1,2, 9,0,0
	SEQEND

WEST_ItowohakuSub:	//「クモのす」でも使用
	ADD_ACTOR	ItowoHakuHeader,D_UP+2,5, 20,0, 0x0200,20,1
	WAIT		ITOWOHAKU_WAIT
	END_CALL

@======================================================
@	クモのす
@======================================================
WEST_Kumonosu:
	CHAR_SET	WAZACHR_ID_KUMONOSU
	CHAR_SET	WAZACHR_ID_ITODAMA
	POKEBG		3
	WAIT		0
	ADD_ACTOR	ActFadeHeader,PRI5,5, 1,2, 0,9,0
	WAIT_FLAG
	BGPRI_GAPSET	BG_DEFENCE
	SE_REPEAT	SE_W081,WAZA_SE_L,9,6
	SEQ_CALL	WEST_KumonosuSub
	SEQ_CALL	WEST_KumonosuSub
	SEQ_CALL	WEST_KumonosuSub
	SEQ_CALL	WEST_KumonosuSub
	SEQ_CALL	WEST_KumonosuSub
	SEQ_CALL	WEST_KumonosuSub
	SEQ_CALL	WEST_KumonosuSub
	SEQ_CALL	WEST_KumonosuSub
	SEQ_CALL	WEST_KumonosuSub
	SEQ_CALL	WEST_KumonosuSub
	SEQ_CALL	WEST_KumonosuSub
	SEQ_CALL	WEST_KumonosuSub
	SEQ_CALL	WEST_KumonosuSub
	SEQ_CALL	WEST_KumonosuSub
	WAIT_FLAG
	SEPLAY_PAN	SE_W081B,WAZA_SE_R
	ADD_ACTOR	KumonosuHeader,A_UP+2,0
	WAIT_FLAG
	POKEBG_RESET	3
	WAIT		1
	ADD_ACTOR	ActFadeHeader,PRI5,5, 1,2, 9,0,0
	SEQEND

WEST_KumonosuSub:
	ADD_ACTOR	ItowoHakuHeader,D_UP+2,5, 20,0, 0x0200,20,0
	WAIT		ITOWOHAKU_WAIT
	END_CALL

@======================================================
@	かまいたち
@======================================================
#define KAMA_F		16	//振り幅
#define KAMA_SEC	7	//秒速度
#define KAMA_SYNC	40	//Sync回数
#define KAMA_EARO_SYNC	22
#define KAMA_EARO_WAIT	2
WEST_Kamaitati:
	TURN_CHK	WEST_KamaitatiTurn1, WEST_KamaitatiTurn2
WEST_KamaitatiReturn:
	WAIT_FLAG
	SEQEND

WEST_KamaitatiTurn1:
	CHAR_SET	WAZACHR_ID_KAZE
	SEPLAY_PAN	SE_W016,WAZA_SE_L
	ADD_ACTOR	KamaitatiHeader,A_UP+2,7, 32,0, KAMA_F,KAMA_F,0,KAMA_SEC,KAMA_SYNC
	ADD_ACTOR	KamaitatiHeader,A_UP+2,7, 32,0, KAMA_F,KAMA_F,85,KAMA_SEC,KAMA_SYNC
	ADD_ACTOR	KamaitatiHeader,A_UP+2,7, 32,0, KAMA_F,KAMA_F,170,KAMA_SEC,KAMA_SYNC
	WAIT_FLAG
	SEPLAY_PAN	SE_W016B,WAZA_SE_L
	SEQ_JP		WEST_KamaitatiReturn

WEST_KamaitatiTurn2:
	CHAR_SET	WAZACHR_ID_EARO
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
//	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W013B,WAZA_SE_L
	ADD_ACTOR	ActEaroHeader,A_UP+2,7, 14,8, 0,0, KAMA_EARO_SYNC,2,1
	WAIT		KAMA_EARO_WAIT
	SEPLAY_PAN	SE_W013B,WAZA_SE_L
	ADD_ACTOR	ActEaroHeader,A_UP+2,7, 14,-8, 16,14, KAMA_EARO_SYNC,1,1
	WAIT		KAMA_EARO_WAIT
	SEPLAY_PAN	SE_W013B,WAZA_SE_L
	ADD_ACTOR	ActEaroHeader,A_UP+2,7, 14,12, -16,-14, KAMA_EARO_SYNC,0,1
	WAIT		KAMA_EARO_SYNC - KAMA_EARO_WAIT*2 - 1
	SEPLAY_PAN	SE_W013,WAZA_SE_R
//	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,1
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,10,1
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 3,2,0,10,1
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQ_JP		WEST_KamaitatiReturn

@======================================================
@	かなしばり
@======================================================
WEST_Kanasibari:
	CHAR_SET	WAZACHR_ID_L_HIKARI
	POKEBG		1
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0x8,0x8
	SEPLAY_PAN	SE_W197,WAZA_SE_L
	ADD_ACTOR	ActKiraHeader,A_UP+13,2,24,-16
	WAIT_FLAG
	ADD_TASK	KanasibariTask,PRI5,0
	SE_REPEAT	SE_W020,WAZA_SE_R,15,4
	WAIT_FLAG
	WAIT		1
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

@======================================================
@	じこさいせい
@======================================================
#define JIKOSAISEI_SYNC		13
#define JIKOSAISEI_WAIT		3
WEST_Jikosaisei:
	CHAR_SET	WAZACHR_ID_SOLAR
	CHAR_SET	WAZACHR_ID_PIKARI
	POKEBG		2
	BLDALPHA_SET	0xc,0x8
	SE_REPEAT	SE_W025,WAZA_SE_L,13,3
	ADD_TASK	WazaTaskColorFade,PRI2,6, 2,0,6,0,11,0x2fff
	SEQ_CALL	WEST_JikosaiseiSub
	SEQ_CALL	WEST_JikosaiseiSub
	SEQ_CALL	WEST_JikosaiseiSub
	WAIT_FLAG
	POKEBG_RESET	2
	BLDALPHA_RESET
	WAIT		1
	SEQ_CALL	WEST_PikariAttack
	WAIT_FLAG
	SEQEND

WEST_JikosaiseiSub:
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, 40,-10,JIKOSAISEI_SYNC
	WAIT		JIKOSAISEI_WAIT
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, -35,-10,JIKOSAISEI_SYNC
	WAIT		JIKOSAISEI_WAIT
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, 15,-40,JIKOSAISEI_SYNC
	WAIT		JIKOSAISEI_WAIT
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, -10,-32,JIKOSAISEI_SYNC
	WAIT		JIKOSAISEI_WAIT
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, 25,-20,JIKOSAISEI_SYNC
	WAIT		JIKOSAISEI_WAIT
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, -40,-20,JIKOSAISEI_SYNC
	WAIT		JIKOSAISEI_WAIT
	ADD_ACTOR	ActHikariKyuusyuuHeader,A_UP+2,3, 5,-40,JIKOSAISEI_SYNC
	WAIT		JIKOSAISEI_WAIT
	END_CALL

@======================================================
@	ものまね
@======================================================
#define MONOMANE_DXSP		0x0008	//移動速度
#define MONOMANE_DXSYNC		24
WEST_Monomane:
	CHAR_SET	WAZACHR_ID_SOLAR
	POKEBG_DROP	3
	BLDALPHA_SET	11,5
	SEPAN_FLOW	SE_W107,WAZA_SE_R,WAZA_SE_L,-3,0
	ADD_TASK	MonomaneTask,PRI5,2, 0x0080,MONOMANE_DXSYNC
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 4,1,0,10,0x7fff
	WAIT		15	//MONOMANE_DXSYNC
	ADD_ACTOR	MonomaneHeader,D_UP+2,2, -12,24
	WAIT		10
	WORK_SET	7,0xffff
	WAIT_FLAG
	SEPLAY_PAN	SE_W036,WAZA_SE_L
	ADD_TASK	WazaTaskColorFade,PRI2,6, 2,0,2,0,11,0x7fff
	WAIT_FLAG
	POKEBG_DROP_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	からみつく
@======================================================
#define KARAMITUKU_WAIT		7
WEST_Karamituku:
	CHAR_SET	WAZACHR_ID_KARAMITUKU
	SE_REPEAT	SE_W010,WAZA_SE_R,6,4
	ADD_ACTOR	KaramitukuHeader,D_UP+4,4, 0,16,0,2
	WAIT		KARAMITUKU_WAIT
	ADD_ACTOR	KaramitukuHeader,D_UP+3,4, 0,0,0,2
	ADD_ACTOR	KaramitukuHeader,D_UP+2,4, 0,8,1,2
	WAIT		KARAMITUKU_WAIT
	ADD_ACTOR	KaramitukuHeader,D_UP+3,4, 0,-8,1,2
	WAIT		8
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,6,1
	WAIT		20
	SEPLAY_PAN	SE_W020,WAZA_SE_R
	WORK_SET	7,0xffff
	WAIT_FLAG
	SEQEND

@======================================================
@	のろい
@======================================================
WEST_Noroi:
	TURN_CHK	WEST_GhostNoroi,WEST_NormalNoroi

WEST_GhostNoroi:	//ｺﾞｰｽﾄﾀｲﾌﾟのﾎﾟｹﾓﾝが使用した時の「のろい」ｴﾌｪｸﾄ
	CHAR_SET	WAZACHR_ID_KUGI2
	CHAR_SET	WAZACHR_ID_NOROI
	POKEBG		2
	ADD_TASK	NoroiTask,PRI5, 0
	WAIT_FLAG
	WAIT		20
	ADD_ACTOR	KugiHeader,A_UP+2,0
	WAIT		60
	SEQ_CALL	WEST_GhostNoroiSub
	WAIT		41
	SEQ_CALL	WEST_GhostNoroiSub
	WAIT		41
	SEQ_CALL	WEST_GhostNoroiSub
	WAIT_FLAG
	POKEBG_RESET	2
	WAIT		1
	POKEBG		3
	SEPLAY_PAN	SE_W171,WAZA_SE_R
	ADD_ACTOR	DokuroHeader,D_UP+2,0
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,14,1
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,PRI2,5, 1,1, 16,0,0x0000
	WAIT_FLAG
	POKEBG_RESET	3
	SEQEND

WEST_GhostNoroiSub:
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,4,0,10,0
	SEPLAY_PAN	SE_W020,WAZA_SE_L
	END_CALL

WEST_NormalNoroi:	//ｺﾞｰｽﾄﾀｲﾌﾟ以外のﾎﾟｹﾓﾝが使用した時の「のろい」ｴﾌｪｸﾄ
//	ADD_TASK	StatusEffectTask,PRI2,5	0,0xff,0,0,0
	ADD_TASK	PokeSinMove,PRI5,5, 0,10,0x0600,3,0
	WAIT_FLAG
	WAIT		10
	SEQ_CALL	WEST_NoroiNormalSub
	WAIT_FLAG
	SEQEND

WEST_NoroiNormalSub:
	SEPLAY_PAN	SE_W082,WAZA_SE_L
	ADD_TASK	StUpEffectTask,PRI5,0
	ADD_TASK	WazaTaskColorFade,PRI5,6, 2,4,2,0,10,0x001f
	END_CALL

@======================================================
@	タマゴうみ
@======================================================
WEST_TamagoUmi:
	CHAR_SET	WAZACHR_ID_TAMAGO2
	CHAR_SET	WAZACHR_ID_HAMON
	CHAR_SET	WAZACHR_ID_PIKARI
	POKEBG		2
	SEPLAY_PAN	SE_W039,WAZA_SE_L
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 0,0,2,6,1
	ADD_ACTOR	TamagoUmiHeader,A_UP+4,3, 0,16,0
	ADD_ACTOR	TamagoUmiHeader,A_UP+4,3, 0,16,1
	WAIT		120
	WAIT		7
	SEPLAY_PAN	SE_W030,WAZA_SE_L
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 31,3, 10,0,0x7b0c
	ADD_ACTOR	HamonHeader,A_UP+3,4, 31,16, 0,1
	WAIT		8
	ADD_ACTOR	HamonHeader,A_UP+3,4, 31,16, 0,1
	WAIT		60
	WORK_SET	7,0xffff
	WAIT_FLAG
	POKEBG_RESET	2
	SEQ_CALL	WEST_PikariDefence
	SEQEND

@======================================================
@	いやしのすず
@======================================================
//#define IYASINOSUZU_WAIT	
WEST_IyasinoSuzu:
	CHAR_SET	WAZACHR_ID_BELL2
	CHAR_SET	WAZACHR_ID_ONPU2
	CHAR_SET	WAZACHR_ID_HAMON
	CHAR_SET	WAZACHR_ID_KIRAKIRA2
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x0A,0,0,10,0x7fff
	WAIT_FLAG
	ADD_TASK	OnpuPalSetTask,PRI5,0
	ADD_ACTOR	BellHeader,A_UP+2,4, 0,-24, 0,1
	WAIT		12	//BELL_ANMWAIT*2
	ADD_ACTOR	OnpuHeader,A_UP+40,7, 0,-24, 48,-18, 35, 0,0
	ADD_ACTOR	OnpuHeader,A_UP+40,7, 0,-24, -48,20, 30, 1,1
	ADD_ACTOR	OnpuHeader,A_UP+40,7, 0,-24, -38,-29, 30, 2,2
	ADD_ACTOR	OnpuHeader,A_UP+40,7, 0,-24, 36,18, 30, 3,3
	SEQ_CALL	WEST_IyasinoSuzuSub
	WAIT		33	//BELL_ANMWAIT*3+BELL_CORNER_ANMWAIT
	ADD_ACTOR	OnpuHeader,A_UP+40,7, 0,-24, 19,26, 35, 4,4
	ADD_ACTOR	OnpuHeader,A_UP+40,7, 0,-24, -34,-12, 30, 5,5
	ADD_ACTOR	OnpuHeader,A_UP+40,7, 0,-24, 41,-20, 34, 6,6
	ADD_ACTOR	OnpuHeader,A_UP+40,7, 0,-24, -15,26, 32, 7,0
	SEQ_CALL	WEST_IyasinoSuzuSub
	WAIT		33	//BELL_ANMWAIT*3+BELL_CORNER_ANMWAIT
	ADD_ACTOR	OnpuHeader,A_UP+40,7, 0,-24, -48,18, 31, 0,2
	ADD_ACTOR	OnpuHeader,A_UP+40,7, 0,-24, 48,-20, 30, 2,5
	ADD_ACTOR	OnpuHeader,A_UP+40,7, 0,-24, 38,29, 33, 4,3
	ADD_ACTOR	OnpuHeader,A_UP+40,7, 0,-24, -36,-18, 30, 6,1
	SEQ_CALL	WEST_IyasinoSuzuSub
	WAIT_FLAG
	ADD_TASK	OnpuPalDelTask,PRI5,0
	WAIT_FLAG							//↓add_02.08.27_iwasawa
	SEPLAY_PAN	SE_W234, WAZA_SE_L,
	ADD_ACTOR	ActKirakira2MHeader,A_UP+16,7, -15,0,0,0x0000,0x0020,60,1
	WAIT		8
	ADD_ACTOR	ActKirakira2MHeader,A_UP+16,7, 12,-5,0,0x0000,0x0020,60,1
	WAIT_FLAG
	SEPLAY_PAN	SE_REAPOKE, WAZA_SE_L,
	ADD_TASK	ExceptColorFadeSeq,PRI10,5, 0x4,3,10,0,0x7b0c
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x0A,3,10,0,0x7fff
	ADD_ACTOR	HamonMHeader,A_UP+16,4,	0,0,0,1
	SEQEND

WEST_IyasinoSuzuSub:
	ADD_TASK	ExceptColorFadeSeq,PRI10,5, 0x4,3,8,0,0x7b0c
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x0A,3,2,10,0x7fff
	ADD_ACTOR	HamonHeader,A_UP+40,4, 0,-24, 0,1
	SEPLAY_PAN	SE_W215,WAZA_SE_L
	END_CALL

@======================================================
@	ねこだまし
@======================================================
WEST_NekoDamasi:
	SEPLAY_PAN	SE_W260,0
	ADD_TASK	NekoDamasiTask,PRI5,0
	WAIT_FLAG
	SEPLAY_PAN	SE_W166,WAZA_SE_R
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,4,0,5,1
	ADD_TASK	PokeBikkuri,PRI3,0
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,3, 16,0,0x7fff
	SEQEND

@======================================================
@	184 こわいかお
@======================================================
WEST_KowaiKao:
	CHAR_SET	WAZACHR_ID_KIRARI
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1+2+8+16,3, 0,16,0x0000
	SEPLAY_PAN	SE_W060,WAZA_SE_L
	WAIT_FLAG
//	HAIKEI_CHG	WAZAMAP_ID_KOWAIKAO
//	HAIKEI_HALF_WAIT
	WAIT		10
	SEPLAY_PAN	SE_W043,WAZA_SE_L
	ADD_TASK	KowaikaoHaikeiTask,PRI5,0
	WAIT		13
	ADD_ACTOR	KirariActHeader,A_UP+0,2,-16,-8
	ADD_ACTOR	KirariActHeader,A_UP+0,2, 16,-8
	WAIT_FLAG
//	WAIT		30
	ADD_TASK	TaskPokeYure,PRI3,3,20,1,0,1
	SEPLAY_PAN	SE_W081B,WAZA_SE_R
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1+2+8+16,3, 16,0,0x0000
	WAIT_FLAG
//	ADD_TASK	StatusEffectTask,PRI5,5, 1,3,1,0,1
	SEQEND


@======================================================
@	てんしのキッス
@======================================================
WEST_TenshinoKiss:
	CHAR_SET	WAZACHR_ID_HEART3
	CHAR_SET	WAZACHR_ID_ANGEL
	ADD_ACTOR	ActAngelHeader,D_UP+2,2,16,-48
	SEPLAY_PAN	SE_W215,WAZA_SE_R
	WAIT 23
	SEPLAY_PAN	SE_W215,WAZA_SE_R
	WAIT 23
	SEPLAY_PAN	SE_W215,WAZA_SE_R
	
	WAIT_FLAG
	ADD_ACTOR	MeroHeartHeader,D_UP+3,2, 0x00a0,-30
	SEPLAY_PAN	SE_W213,WAZA_SE_R
	ADD_ACTOR	MeroHeartHeader,D_UP+3,2, -0x0100,-42
	ADD_ACTOR	MeroHeartHeader,D_UP+3,2, 0x0080,-14
	ADD_ACTOR	MeroHeartHeader,D_UP+3,2, 0x01a0,-38
	ADD_ACTOR	MeroHeartHeader,D_UP+3,2, -0x0080,-22
	ADD_ACTOR	MeroHeartHeader,D_UP+3,2, -0x0180,-31
	SEQEND

@======================================================
@	142 あくまのキッス
@======================================================
WEST_AkumanoKiss:
	CHAR_SET	WAZACHR_ID_HEART1
	CHAR_SET	WAZACHR_ID_DEVIL
	ADD_ACTOR	ActAkumaHeader,D_UP+2,2,0,-24
	SEPLAY_PAN	SE_W060B,WAZA_SE_R
	WAIT_FLAG
//	ADD_ACTOR	DevilHeartHeader,D_UP+3,2, 0x00a0,-30
	SEPLAY_PAN	SE_W213,WAZA_SE_R
	ADD_ACTOR	DevilHeartHeader,D_UP+3,2, -0x0100,-42
	ADD_ACTOR	DevilHeartHeader,D_UP+3,2, 0x0080,-14
	ADD_ACTOR	DevilHeartHeader,D_UP+3,2, 0x01a0,-38
	ADD_ACTOR	DevilHeartHeader,D_UP+3,2, -0x0080,-22
//	ADD_ACTOR	DevilHeartHeader,D_UP+3,2, -0x0180,-31
	SEQEND
@======================================================
@	みだれひっかき
@======================================================
#define MIDARE_TAIATARI_SYNC	5
WEST_MidareHikkaki:
	CHAR_SET	WAZACHR_ID_HIKKAKI
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2, MIDARE_TAIATARI_SYNC,5
	WAIT		4
	SEPLAY_PAN	SE_W010,WAZA_SE_R
	ADD_ACTOR	HikkakiHeader,D_UP+2,3, 16,0,1
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,5,1
	WAIT		MIDARE_TAIATARI_SYNC*2
	ADD_ACTOR	ActTaiatariHeader,D_UP+2,2, MIDARE_TAIATARI_SYNC,5
	WAIT		4
	SEPLAY_PAN	SE_W010,WAZA_SE_R
	ADD_ACTOR	HikkakiHeader,D_UP+2,3, -16,0,0
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,4,0,7,1
	SEQEND


@======================================================
@	ねをはる
@======================================================
WEST_NewoHaru:
	CHAR_SET	WAZACHR_ID_NEKKO
	CHAR_SET	WAZACHR_ID_SOLAR
	ADD_ACTOR	ActNeHeader	A_UP+2,5, 16,10+16, -1,2, 150
	SEPLAY_PAN	SE_W010,WAZA_SE_L
	WAIT		10
	ADD_ACTOR	ActNeHeader	A_UP+2,5,-32, 4+16,  1,1, 140
	SEPLAY_PAN	SE_W010,WAZA_SE_L
	WAIT		10
	ADD_ACTOR	ActNeHeader	A_UP+2,5, 32, 6+16,  1,0, 130
	SEPLAY_PAN	SE_W010,WAZA_SE_L
	WAIT		10
	ADD_ACTOR	ActNeHeader	A_UP+2,5,-16, 9+16, -1,3, 120
	SEPLAY_PAN	SE_W010,WAZA_SE_L
	WAIT		40
	ADD_ACTOR	ActNewoHauHeader,A_UP+3,5,32,10+16,-1,3,30
	WAIT		5
	SEPLAY_PAN	SE_W145C,WAZA_SE_L
	WAIT		5
	ADD_ACTOR	ActNewoHauHeader,A_UP+3,5,-48,4+16, 1,2,30
	SEPLAY_PAN	SE_W145C,WAZA_SE_L
	WAIT		5
	SEPLAY_PAN	SE_W145C,WAZA_SE_L
	WAIT		5
	ADD_ACTOR	ActNewoHauHeader,A_UP+3,5, 48,10+16,-2,3,18
	SEPLAY_PAN	SE_W145C,WAZA_SE_L
	WAIT		10
	WAIT_FLAG
	SEQEND



@======================================================
@	プレゼント	
@======================================================
WEST_Present:
	CHAR_SET	WAZACHR_ID_FUKURO3
	ADD_TASK	TaskDamageOrCure,PRI2,0
	ADD_ACTOR	ActFukuroHeader	D_UP+2,5, 0,-5,10, 2,-1
	SEPLAY_PAN	SE_W039,WAZA_SE_L
	WAIT		14
	SEPLAY_PAN	SE_W145B,WAZA_SE_L
	WAIT		14
	SEPLAY_PAN	SE_W145B,0
	WAIT		20
	SEPLAY_PAN	SE_W145B,WAZA_SE_R
	WAIT_FLAG	
	WORKCHK_JP	7,0,WEST_PresentNext0			@プレゼントの結果は爆発
	WORKCHK_JP	7,1,WEST_PresentNext1			@　　　　　　　　　回復
	SEQEND
	
WEST_PresentNext0:
	CHAR_SET	WAZACHR_ID_DAIBAKUHATU
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,D_UP+3,4, 0,0, 1,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,D_UP+3,4, 24,-24, 1,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,D_UP+3,4, -16,16, 1,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,D_UP+3,4, -24,-12, 1,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,D_UP+3,4, 16,16, 1,1
	SEQEND



WEST_PresentNext1:
	CHAR_SET	WAZACHR_ID_MOONLIGHT
	CHAR_SET	WAZACHR_ID_PIKARI
	SEPLAY_PAN	SE_W234,WAZA_SE_R
	ADD_ACTOR	ActPresentOkHeader,D_UP+4,4,-16,32,-3,1
	WAIT		3
	ADD_ACTOR	ActPresentOkHeader,D_UP+4,4, 16,32,-3,-1
	WAIT		3
	ADD_ACTOR	ActPresentOkHeader,D_UP+4,4,32,32,-3,1
	WAIT		3
	ADD_ACTOR	ActPresentOkHeader,D_UP+4,4,-32,32,-3,1
	WAIT		3
	ADD_ACTOR	ActPresentOkHeader,D_UP+4,4,0,32,-3,1
	WAIT		3
	ADD_ACTOR	ActPresentOkHeader,D_UP+4,4,-8,32,-3,1
	WAIT		3
	ADD_ACTOR	ActPresentOkHeader,D_UP+4,4,-8,32,-3,1
	WAIT		3
	ADD_ACTOR	ActPresentOkHeader,D_UP+4,4,24,32,-3,1
	WAIT		3
	ADD_ACTOR	ActPresentOkHeader,D_UP+4,4,-24,32,-3,1
	WAIT_FLAG	
	SE_WAIT_FLAG
	SEQ_CALL	WEST_PikariDefence
	SEQEND

@======================================================
@	バトンタッチ
@======================================================
WEST_BatonTatti:
	CHAR_SET	WAZACHR_ID_MONSBALL
	SEPLAY_PAN	SE_W226,WAZA_SE_L
	ADD_TASK	WazaTaskColorFade,PRI2,6, 0x1f,1,2,0,11,0x7adf
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 0x1f,1, 10,0,0x7adf
	ADD_ACTOR	BatonTattiHeader,A_UP+2,0
	SEQEND

@======================================================
@	ほろびのうた
@======================================================
WEST_HorobinoUta:
	CHAR_SET	WAZACHR_ID_ONPU2
	ADD_ACTOR	HorobiOnpuHeader A_UP+4,3, 0,0,16*0
	ADD_ACTOR	HorobiOnpuHeader A_UP+4,3, 1,1,16*1
	ADD_ACTOR	HorobiOnpuHeader A_UP+4,3, 2,1,16*2
	ADD_ACTOR	HorobiOnpuHeader A_UP+4,3, 3,2,16*3
	ADD_ACTOR	HorobiOnpuHeader A_UP+4,3, 4,2,16*4
	ADD_ACTOR	HorobiOnpuHeader A_UP+4,3, 5,0,16*5
	ADD_ACTOR	HorobiOnpuHeader A_UP+4,3, 6,0,16*6
	ADD_ACTOR	HorobiOnpuHeader A_UP+4,3, 7,1,16*7
	ADD_ACTOR	HorobiOnpuHeader A_UP+4,3, 8,2,16*8
	ADD_ACTOR	HorobiOnpuHeader A_UP+4,3, 9,0,16*9		@10
	ADD_ACTOR	HorobiOnpuHeader A_UP+4,3,10,2,16*10
	ADD_ACTOR	HorobiOnpuHeader A_UP+4,3,11,0,16*11
	ADD_ACTOR	HorobiOnpuHeader A_UP+4,3,12,1,16*12
	ADD_ACTOR	HorobiOnpuHeader A_UP+4,3,13,3,16*13
	ADD_ACTOR	HorobiOnpuHeader A_UP+4,3,14,3,16*14
	ADD_ACTOR	HorobiOnpuHeader A_UP+4,3,15,0,16*15
	ADD_ACTOR	HorobiOnpu2Header A_UP+4,3,15,0,0
	WAIT		20
	SEPAN_FLOW	SE_W195,WAZA_SE_L,WAZA_SE_R,2,0
	WAIT		80
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,3, 0,16,0x0000		@フェードアウト
	ADD_TASK	PokeMonotoneTask,PRI5,2, 4,0
	ADD_TASK	PokeMonotoneTask,PRI5,2, 5,0
	ADD_TASK	PokeMonotoneTask,PRI5,2, 6,0
	ADD_TASK	PokeMonotoneTask,PRI5,2, 7,0
	WAIT		100
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,3, 16,0,0x0000		@フェードイン
	ADD_TASK	PokeMonotoneTask,PRI5,2, 4,1
	ADD_TASK	PokeMonotoneTask,PRI5,2, 5,1
	ADD_TASK	PokeMonotoneTask,PRI5,2, 6,1
	ADD_TASK	PokeMonotoneTask,PRI5,2, 7,1

	WAIT_FLAG
	SEQEND

@======================================================
@	ねごと
@======================================================
WEST_Negoto:
	CHAR_SET	WAZACHR_ID_ZZZ2
	ADD_TASK	PokeSinMove,PRI5,5,0,4,0x1000,2,0
	WAIT	20

	ADD_ACTOR	ActNegotoHeader, D_UP+2,4,0, 20, 5, -1
	SEPLAY_PAN	SE_W173,WAZA_SE_L
	WAIT	6
	ADD_ACTOR	ActNegotoHeader, D_UP+2,4,0, 20, 5, -1
	WAIT	6
	ADD_ACTOR	ActNegotoHeader, D_UP+2,4,0, 20, 5, -1

	WAIT	20
	ADD_ACTOR	ActNegotoHeader, D_UP+2,4,0, 20, 5, -5
	SEPLAY_PAN	SE_W173,WAZA_SE_L
	WAIT	6
	ADD_ACTOR	ActNegotoHeader, D_UP+2,4,0, 20, 5, -5
	WAIT	6
	ADD_ACTOR	ActNegotoHeader, D_UP+2,4,0, 20, 5, -5

	WAIT	20
	ADD_ACTOR	ActNegotoHeader, D_UP+2,4,0, 20, 5, -3
	SEPLAY_PAN	SE_W173,WAZA_SE_L
	WAIT	6
	ADD_ACTOR	ActNegotoHeader, D_UP+2,4,0, 20, 5, -3
	WAIT	6
	ADD_ACTOR	ActNegotoHeader, D_UP+2,4,0, 20, 5, -3
	WAIT_FLAG
	SEQEND


@======================================================
@	158 ひっさつまえば
@======================================================
WEST_HissatuMaeba:
	CHAR_SET	WAZACHR_ID_HAGATA
	SEPLAY_PAN	SE_W044,WAZA_SE_R
	WAIT		1

	WAIT		2
	ADD_TASK	ContestChkTask,PRI2,0
	WORKCHK_JP	7,1,WEST_HissatuMaebaNext2
	ADD_TASK	TaskAttackOrDefense,PRI2,0
	WORKCHK_JP	7,0,WEST_HissatuMaebaNext0			@攻撃か防御によってひっさつのBGを変える	相手
	SEQ_JP		WEST_HissatuMaebaNext1
WEST_HissatuMaebaReturn:
	HAIKEI_HALF_WAIT
	ADD_ACTOR	ActHissatuMaebaHeader,D_UP+2,0
	HAIKEI_CHG_WAIT
	ADD_TASK	TaskPokeBuruburu,PRI3,5,1,0,10,10,1
	SEPLAY_PAN	SE_W043,WAZA_SE_R
	WAIT		20
	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
	WAIT_FLAG
	SEQEND


@==========ひっさつまえば分岐（相手側）=================	
WEST_HissatuMaebaNext0:
	HAIKEI_CHG	WAZAMAP_ID_HISSATU
	SEQ_JP		WEST_HissatuMaebaReturn

@==========ひっさつまえば分岐（自分側）=================	
WEST_HissatuMaebaNext1:
	HAIKEI_CHG	WAZAMAP_ID_HISSATU2
	SEQ_JP		WEST_HissatuMaebaReturn

@==========ひっさつまえば分岐（コンテスト）=================	
WEST_HissatuMaebaNext2:
	HAIKEI_CHG	WAZAMAP_ID_HISSATU3
	SEQ_JP		WEST_HissatuMaebaReturn





@======================================================
@	トライアタック
@======================================================
WEST_TriAttack:
	CHAR_SET	WAZACHR_ID_TRI
	ADD_ACTOR	ActTriAttackHeader,D_UP+2,2,16,0
	SEPLAY_PAN	SE_W161,WAZA_SE_L
	WAIT		20
	SEPLAY_PAN	SE_W161,WAZA_SE_L
	WAIT 		20
	SE_TASK	SeRepeatPanMove,7,	SE_W161,WAZA_SE_L,WAZA_SE_R,5,6,0,7
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5,1,2,0,16,0x0
	WAIT		16

	CHAR_SET	WAZACHR_ID_MERAMERA
	ADD_ACTOR	ActSeinaruHonoo2Header,D_UP+2,6,  0,0, 30,30,-1,0
	SEPLAY_PAN	SE_W172B,WAZA_SE_R
	ADD_ACTOR	ActSeinaruHonoo2Header,D_UP+2,6,  0,0, 30,30,0,1
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo2Header,D_UP+2,6,  0,0, 30,30,-1,-1
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo2Header,D_UP+2,6,  0,0, 30,30,2,1
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo2Header,D_UP+2,6,  0,0, 30,30,1,-1
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo2Header,D_UP+2,6,  0,0, 30,30,-1,1
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo2Header,D_UP+2,6,  0,0, 30,30,1,-2
	WAIT		1
	ADD_ACTOR	ActSeinaruHonoo2Header,D_UP+2,6,  0,0, 30,30,3,1
	WAIT 		2
	ADD_TASK	TaskPokeYure,PRI2,4, 20,3,1,1
	WAIT_FLAG
	

	CHAR_SET	WAZACHR_ID_THUNDER2
	ADD_TASK	WazaTaskColorReversal,PRI2,3, 0x0101,0x0101,0x0101
	SEPLAY_PAN	SE_W161B,WAZA_SE_R
	ADD_ACTOR	ActKaminariHeader,D_UP+2,2,0,-48
	WAIT		1
	ADD_ACTOR	ActKaminariHeader,D_UP+2,2,0,-16
	WAIT		1
	ADD_ACTOR	ActKaminariHeader,D_UP+2,2,0,16
	WAIT		20
	ADD_TASK	TaskPokeYure,PRI2,4, 20,3,1,0
	WAIT		2
	ADD_TASK	WazaTaskColorReversal,PRI2,3, 0x0101,0x0101,0x0101
	WAIT_FLAG
	
	CHAR_SET	WAZACHR_ID_YUKI2
	SEQ_CALL	WEST_IceKouka
	ADD_ACTOR	ActFadeHeader,A_UP+2,5,1,2,16,0,0x0
	
	WAIT_FLAG
	SEQEND

@======================================================
@	おにび
@======================================================
#define ONIBI_KANSETU_WAIT	3
#define ONIBI_INIT_SEC		(256 / 6)
WEST_Onibi:
	CHAR_SET	WAZACHR_ID_ONIBI
	CHAR_SET	WAZACHR_ID_ONIBALL
	POKEBG		3
	BGPRI_GAPSET3	BG_DEFENCE
//	BGPRI_GAPSET	BG_DEFENCE		//chg_0827_iwa
	SEPLAY_PAN	SE_W052,WAZA_SE_L
	SE_WAITPLAY	SE_W052,WAZA_SE_L,10
	ADD_TASK	SePanFlowTask,PRI2,4, WAZA_SE_L,WAZA_SE_L, 1,0	//Panの初期化
	ADD_ACTOR	OniballHeader,A_UP+2,3, 0,0,0
	WAIT		ONIBI_KANSETU_WAIT
	ADD_ACTOR	OniballHeader,A_UP+3,3, 0,0,1
	WAIT		ONIBI_KANSETU_WAIT
	ADD_ACTOR	OniballHeader,A_UP+4,3, 0,0,2
	WAIT		ONIBI_KANSETU_WAIT
	ADD_ACTOR	OniballHeader,A_UP+4,3, 0,0,3
	WAIT		40
//	SE_TASK		SeRepeatPanMove,7, SE_W172,WAZA_SE_L,WAZA_SE_R,1,2,0,55
	ADD_TASK	SePanFlowTask,PRI2,4, WAZA_SE_L,WAZA_SE_R, 2,0
	WAIT_FLAG
	BGPRI_GAPSET2		//add_0827_iwa
	SEPLAY_PAN	SE_W172B,WAZA_SE_R
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,4,0,13,1
	ADD_ACTOR	OnibiHeader,A_UP+2,1, ONIBI_INIT_SEC * 0
	ADD_ACTOR	OnibiHeader,A_UP+2,1, ONIBI_INIT_SEC * 1
	ADD_ACTOR	OnibiHeader,A_UP+2,1, ONIBI_INIT_SEC * 2
	ADD_ACTOR	OnibiHeader,A_UP+2,1, ONIBI_INIT_SEC * 3
	ADD_ACTOR	OnibiHeader,A_UP+2,1, ONIBI_INIT_SEC * 4
	ADD_ACTOR	OnibiHeader,A_UP+2,1, ONIBI_INIT_SEC * 5
	WAIT_FLAG
	POKEBG_RESET	3
	SEQEND

@======================================================
@	アンコール
@======================================================
WEST_Ankooru:
	CHAR_SET	WAZACHR_ID_SPOTLIGHT
	CHAR_SET	WAZACHR_ID_TE
	ADD_TASK	ContWinCaver,PRI2,0
	ADD_TASK	WazaHardFadeTask,PRI2,5, 0xf8,3,0,10,0
	WAIT_FLAG
//	SE_REPEAT	SE_W227,WAZA_SE_L,6,16
	ADD_ACTOR	AnkooruHeader,D_UP+2,2, 0,-8
	ADD_ACTOR	HakusyuHeader,A_UP+2,5, -2,0, 0,0,9
	ADD_ACTOR	HakusyuHeader,A_UP+2,5, 2,0, 1,0,9
	ADD_ACTOR	HakusyuWinObjHeader,A_UP+3,5, -2,0, 0,0,9
	ADD_ACTOR	HakusyuWinObjHeader,A_UP+3,5, 2,0, 1,0,9
	WAIT		16
//	SEPLAY_PAN	SE_W227B,WAZA_SE_R
	ADD_TASK	SePlayCh2Task,PRI5,2, SE_W227B,WAZA_SE_R,
	ADD_TASK	PokeSinMove,PRI5,5, 1,8,0x0600,5,1
	WAIT_FLAG
	ADD_TASK	WazaHardFadeTask,PRI2,5, 0xf8,3,10,0,1
	WAIT_FLAG
	ADD_TASK	ContWinClose,PRI2,0
	SEQEND



@======================================================
@	トリック
@======================================================
WEST_Trick:
	CHAR_SET	WAZACHR_ID_FUKURO3
	CHAR_SET	WAZACHR_ID_KEMURI
	ADD_ACTOR	ActTrickFukuroHeader,A_UP+2,2,-40,80
	ADD_ACTOR	ActTrickFukuroHeader,A_UP+2,2,-40,208
	WAIT		16
	SEPLAY_PAN	SE_W166,0
	ADD_TASK	PokeBikkuri,PRI3,0
	ADD_TASK	PokeBikkuriJibun,PRI3,0
	WAIT		30
	SEPLAY_PAN	SE_W104,0
	WAIT		24
	SEPLAY_PAN	SE_W104,0
	WAIT		16
	SEPLAY_PAN	SE_W104,0
	WAIT		16
	SEPLAY_PAN	SE_W104,0
	WAIT		16
	SEPLAY_PAN	SE_W104,0
	WAIT		16
	SEPLAY_PAN	SE_W104,0
	WAIT		16
	SEPLAY_PAN	SE_W213,0
	ADD_TASK	TaskPokeBuruburu,PRI3,5,0,5,0,7,2
	ADD_TASK	TaskPokeBuruburu,PRI3,5,1,5,0,7,2
	WAIT_FLAG
	SEQEND

@======================================================
@	273 ねがいごと
@======================================================
WEST_Negaigoto:
	CHAR_SET	WAZACHR_ID_SHOOTINGSTAR
	CHAR_SET	WAZACHR_ID_KIRAKIRA2
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,3, 0,10,0x0000
	WAIT_FLAG
	SEPAN_FLOW_AF	SE_W115,WAZA_SE_R,WAZA_SE_L,-3,0
	ADD_ACTOR	NegaigotoHeader,A_UP+40,0
	WAIT_FLAG
	WAIT		60		//しっぽのキラキラが消えるまでｳｪｲﾄ
	SE_REPEAT	SE_W215,WAZA_SE_L,16,3
	SEQ_CALL	WEST_Kirakira
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,3, 10,0,0x0000
	WAIT_FLAG
	SEQEND

@======================================================
@	たくわえる
@======================================================
#define TAKUWAE_KYUUSYUU_SYNC		13
#define TAKUWAE_TAME_WAIT			1
WEST_Takuwaeru:
	CHAR_SET	WAZACHR_ID_TAKUWAE
	SEPLAY_PAN	SE_W025,WAZA_SE_L
	ADD_TASK	WazaTaskColorFade,PRI2,6, 0x2,8,1,0,12,0x7fff
	ADD_TASK	TakuwaeruTask,PRI5,0
	SEQ_CALL	WEST_TakuwaeruSub
//	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,1,0,8,4
	SEQ_CALL	WEST_TakuwaeruSub
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 2,0, 12,0,0x7FFF
	SEQEND

WEST_TakuwaeruSub:
	ADD_ACTOR	TakuwaeruHeader,A_UP+2,3, 55,55,TAKUWAE_KYUUSYUU_SYNC
	WAIT		TAKUWAE_TAME_WAIT
	ADD_ACTOR	TakuwaeruHeader,A_UP+2,3, -55,-55,TAKUWAE_KYUUSYUU_SYNC
	WAIT		TAKUWAE_TAME_WAIT
	ADD_ACTOR	TakuwaeruHeader,A_UP+2,3, 0,55,TAKUWAE_KYUUSYUU_SYNC
	WAIT		TAKUWAE_TAME_WAIT
	ADD_ACTOR	TakuwaeruHeader,A_UP+2,3, 0,-55,TAKUWAE_KYUUSYUU_SYNC
	WAIT		TAKUWAE_TAME_WAIT
	ADD_ACTOR	TakuwaeruHeader,A_UP+2,3, 55,-34,TAKUWAE_KYUUSYUU_SYNC
	WAIT		TAKUWAE_TAME_WAIT
	ADD_ACTOR	TakuwaeruHeader,A_UP+2,3, 55,34,TAKUWAE_KYUUSYUU_SYNC
	WAIT		TAKUWAE_TAME_WAIT
	ADD_ACTOR	TakuwaeruHeader,A_UP+2,3, -55,-34,TAKUWAE_KYUUSYUU_SYNC
	WAIT		TAKUWAE_TAME_WAIT
	ADD_ACTOR	TakuwaeruHeader,A_UP+2,3, -55,34,TAKUWAE_KYUUSYUU_SYNC
	WAIT		TAKUWAE_TAME_WAIT
	END_CALL

@======================================================
@	はきだす
@======================================================
#define HAKIDASU_KAKUDO		(256/8)	//飛び散るﾎﾞｰﾙ
#define HAKIDASU_KAKUDO3	(256/8)	//貯え3の時の追加で飛び散るﾎﾞｰﾙ
#define HAKIDASU_SYNC		(12)	//移動を続けるSync
WEST_Hakidasu:
	CHAR_SET	WAZACHR_ID_HAKIDASU
	CHAR_SET	WAZACHR_ID_HITMARK
//	POKEBG		3		PTA時にBGとOBJ,大きいﾎﾟｹﾓﾝ同士のﾌﾟﾗｲｵﾘﾃｨ関係維持が出来ないためBG落しはやめた　2002.09.05(木) by matsuda
//	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W036,WAZA_SE_L
	ADD_TASK	HakidasuTask,PRI5,0
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,1,0,8,2
	WAIT		45
	SEPLAY_PAN	SE_W255,WAZA_SE_L
	WAIT		3
#if 1	//chg_02.08.27_iwasawa
	ADD_ACTOR	HakidasuHeader,A_UP+2,2, HAKIDASU_KAKUDO*0,HAKIDASU_SYNC
	ADD_ACTOR	HakidasuHeader,A_UP+2,2, HAKIDASU_KAKUDO*1,HAKIDASU_SYNC
	ADD_ACTOR	HakidasuHeader,A_UP+2,2, HAKIDASU_KAKUDO*2,HAKIDASU_SYNC
	ADD_ACTOR	HakidasuHeader,A_UP+2,2, HAKIDASU_KAKUDO*3,HAKIDASU_SYNC
	ADD_ACTOR	HakidasuHeader,A_UP+2,2, HAKIDASU_KAKUDO*4,HAKIDASU_SYNC
	ADD_ACTOR	HakidasuHeader,A_UP+2,2, HAKIDASU_KAKUDO*5,HAKIDASU_SYNC
	ADD_ACTOR	HakidasuHeader,A_UP+2,2, HAKIDASU_KAKUDO*6,HAKIDASU_SYNC
	ADD_ACTOR	HakidasuHeader,A_UP+2,2, HAKIDASU_KAKUDO*7,HAKIDASU_SYNC
#else
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, HAKIDASU_KAKUDO*0
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, HAKIDASU_KAKUDO*1
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, HAKIDASU_KAKUDO*2
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, HAKIDASU_KAKUDO*3
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, HAKIDASU_KAKUDO*4
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, HAKIDASU_KAKUDO*5
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, HAKIDASU_KAKUDO*6
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, HAKIDASU_KAKUDO*7
#endif	
	WAIT		5
	TURN_JP		2,WEST_HakidasuTakuwae2
	TURN_JP		3,WEST_HakidasuTakuwae3
WEST_HakidasuReturn:
	WAIT		5
//	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,8,1
	ADD_TASK	TaskPokeDamageYure, PRI2,5, 0,1,8,1,0,
	SEPLAY_PAN	SE_W003,WAZA_SE_R
//	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, -12,10,1,1
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+3,4, -12,10,1,1
	WAIT		5
	SEPLAY_PAN	SE_W003,WAZA_SE_R
//	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 12,-10,1,1
	ADD_ACTOR	ActHitMarkBlinkHeader,D_UP+3,4, 12,-10,1,1
	WAIT_FLAG
//	POKEBG_RESET	3
//	BLDALPHA_RESET
	SEQEND

WEST_HakidasuTakuwae2:
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, (HAKIDASU_KAKUDO*0+HAKIDASU_KAKUDO/2)&0xff
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, (HAKIDASU_KAKUDO*2+HAKIDASU_KAKUDO/2)&0xff
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, (HAKIDASU_KAKUDO*4+HAKIDASU_KAKUDO/2)&0xff
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, (HAKIDASU_KAKUDO*6+HAKIDASU_KAKUDO/2)&0xff
	SEQ_JP		WEST_HakidasuReturn

WEST_HakidasuTakuwae3:
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, (HAKIDASU_KAKUDO3*0+HAKIDASU_KAKUDO3/2)&0xff
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, (HAKIDASU_KAKUDO3*1+HAKIDASU_KAKUDO3/2)&0xff
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, (HAKIDASU_KAKUDO3*2+HAKIDASU_KAKUDO3/2)&0xff
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, (HAKIDASU_KAKUDO3*3+HAKIDASU_KAKUDO3/2)&0xff
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, (HAKIDASU_KAKUDO3*4+HAKIDASU_KAKUDO3/2)&0xff
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, (HAKIDASU_KAKUDO3*5+HAKIDASU_KAKUDO3/2)&0xff
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, (HAKIDASU_KAKUDO3*6+HAKIDASU_KAKUDO3/2)&0xff
	ADD_ACTOR	HakidasuHeader,A_UP+2,1, (HAKIDASU_KAKUDO3*7+HAKIDASU_KAKUDO3/2)&0xff
	SEQ_JP		WEST_HakidasuReturn

@======================================================
@	のみこむ
@======================================================
#define NOMIKOMU_BALL_Y		(-8)
#define NOMIKOMU_WAIT		1
WEST_Nomikomu:
	CHAR_SET	WAZACHR_ID_NOMIKOMU
	CHAR_SET	WAZACHR_ID_PIKARI
	SEPLAY_PAN	SE_W036,WAZA_SE_L
	ADD_TASK	NomikomuTask,PRI5,0
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,1,0,8,2
	WAIT		38
	SEPLAY_PAN	SE_W255,WAZA_SE_L
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,2,0,12,1
	SEQ_CALL	WEST_NomikomuSub
	TURN_JP		2,WEST_NomikomuTakuwae2
	TURN_JP		3,WEST_NomikomuTakuwae3
WEST_NomikomuReturn:
	WAIT_FLAG
	SEQ_CALL	WEST_Pikari
	SEQEND

WEST_NomikomuSub:
	ADD_ACTOR	NomikomuHeader,A_UP+2,2, 0,NOMIKOMU_BALL_Y
	WAIT		NOMIKOMU_WAIT
	ADD_ACTOR	NomikomuHeader,A_UP+2,2, -24,NOMIKOMU_BALL_Y
	WAIT		NOMIKOMU_WAIT
	ADD_ACTOR	NomikomuHeader,A_UP+2,2, 16,NOMIKOMU_BALL_Y
	WAIT		NOMIKOMU_WAIT
	ADD_ACTOR	NomikomuHeader,A_UP+2,2, -16,NOMIKOMU_BALL_Y
	WAIT		NOMIKOMU_WAIT
	ADD_ACTOR	NomikomuHeader,A_UP+2,2, 24,NOMIKOMU_BALL_Y
	WAIT		NOMIKOMU_WAIT
	END_CALL

//-- たくわえが2つあった場合 --//
WEST_NomikomuTakuwae2:
	SEQ_CALL	WEST_NomikomuSub
	SEQ_JP		WEST_NomikomuReturn

//-- たくわえが3つあった場合 --//
WEST_NomikomuTakuwae3:
	SEQ_CALL	WEST_NomikomuSub
	SEQ_CALL	WEST_NomikomuSub
	SEQ_JP		WEST_NomikomuReturn

@======================================================
@	へんしん
@======================================================
WEST_Hensin:
	POKEBG		0
//	ADD_TASK	HensinLasterTask,PRI1,0
	SEPLAY_PAN	SE_W100,WAZA_SE_L
	SE_WAITPLAY	SE_W107,WAZA_SE_L,48
	ADD_TASK	HensinMosaic,PRI2,1, 0
	WAIT_FLAG
	POKEBG_RESET	0
	SEQEND

@======================================================
@	あさのひざし
@======================================================
#define ASAHIZA_KIRA_WAIT	5
#define ASAHIZA_KIRA_SP		0x0280
#define ASAHIZA_KIRA_DELWAIT	30
WEST_AsanoHizasi:
	CHAR_SET	WAZACHR_ID_ASAKIRA
	CHAR_SET	WAZACHR_ID_PIKARI
	ADD_TASK	AsanoHizasiTask,PRI5,0
	WAIT		8
//	ADD_TASK	WazaTaskColorFade,PRI2,6, 0x1f,10,2,0,12,0x7fff
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x0781,8,0,12,0x7fff
	WAIT		14
	SEQ_CALL	WEST_AsanoHizasiSub
	SEQ_CALL	WEST_AsanoHizasiSub
	SEQ_CALL	WEST_AsanoHizasiSub
	SEQ_CALL	WEST_AsanoHizasiSub
	SEQ_CALL	WEST_AsanoHizasiSub
	SEQ_CALL	WEST_AsanoHizasiSub
	SEQ_CALL	WEST_AsanoHizasiSub
	SEQ_CALL	WEST_AsanoHizasiSub
	SEQ_CALL	WEST_AsanoHizasiSub
	SEQ_CALL	WEST_AsanoHizasiSub
	SEQ_CALL	WEST_AsanoHizasiSub
	SEQ_CALL	WEST_AsanoHizasiSub
	SEQ_CALL	WEST_AsanoHizasiSub
	SEQ_CALL	WEST_AsanoHizasiSub
	SEQ_CALL	WEST_AsanoHizasiSub
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x0781,3,12,0,0x7fff
	WAIT_FLAG
	SE_WAIT_FLAG
	SEQ_CALL	WEST_PikariAttack
	SEQEND

WEST_AsanoHizasiSub:
	ADD_ACTOR	AsakiraHeader,A_UP+2,2, ASAHIZA_KIRA_DELWAIT,ASAHIZA_KIRA_SP
	WAIT		ASAHIZA_KIRA_WAIT
	END_CALL
	
@======================================================
@	230 あまいかおり
@======================================================
WEST_Amaikaori:
	CHAR_SET	WAZACHR_ID_HANABIRA3
	
	SEPLAY_PAN	SE_W230,WAZA_SE_L
	ADD_ACTOR	ActAmaikaoriHeader,A_UP+2,3,100,0,100
	WAIT		25
	SEPAN		0
	SEQ_CALL	WEST_AmaiKaoriSub
	ADD_ACTOR	ActAmaikaoriHeader,A_UP+2,2,55,0
	SEPAN		WAZA_SE_R
	ADD_TASK	WazaTaskColorFade,PRI2,6, 4+16,1,5,5,13,0x56bf
	SEQ_CALL	WEST_AmaiKaoriSub
	WAIT_FLAG
	
	SEQEND

WEST_AmaiKaoriSub:
	ADD_ACTOR	ActAmaikaoriHeader,A_UP+2,3,70,1,64
	WAIT		2
	ADD_ACTOR	ActAmaikaoriHeader,A_UP+2,3,60,0,64
	WAIT		5
	ADD_ACTOR	ActAmaikaoriHeader,A_UP+2,3,80,1,64
	WAIT		2
	ADD_ACTOR	ActAmaikaoriHeader,A_UP+2,3,58,0,120
	WAIT		2
	ADD_ACTOR	ActAmaikaoriHeader,A_UP+2,3,100,0,120
	WAIT		2
	ADD_ACTOR	ActAmaikaoriHeader,A_UP+2,3,90,0,64
	WAIT		2
	ADD_ACTOR	ActAmaikaoriHeader,A_UP+2,3,48,0,64
	WAIT		2
	ADD_ACTOR	ActAmaikaoriHeader,A_UP+2,3,95,1,80
	WAIT		2
	ADD_ACTOR	ActAmaikaoriHeader,A_UP+2,3,100,0,120
	WAIT		2
	ADD_ACTOR	ActAmaikaoriHeader,A_UP+2,3,75,1,64
	WAIT		2
	ADD_ACTOR	ActAmaikaoriHeader,A_UP+2,3,85,0,120
	WAIT		2

	END_CALL

@======================================================
@	はかいこうせん
@======================================================
WEST_Hakaikousen:
	CHAR_SET	WAZACHR_ID_SOLAR
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,4, 0,16,0x0000
	WAIT_FLAG
	WAIT		10
	SEPLAY_PAN	SE_W063,WAZA_SE_L
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,1,0,4,1
	WAIT_FLAG
	WAIT		30
	SE_TASK		SeRepeatPanMove,7, SE_W063B,WAZA_SE_L,WAZA_SE_R,1,15,0,5
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 0,0,4,50,1
//	ADD_TASK	WazaChrColorFadeRepeat,PRI2,6, WAZACHR_ID_SOLAR,0,10,0,11,0x37ff
	ADD_TASK	WazaTaskWazaChrFlash,PRI2,7, WAZACHR_ID_SOLAR,1,12,0x001f,16,0x0,0
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,4,0,50,1
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,2,0,11,0x6739
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	SEQ_CALL	WEST_HakaikousenSub
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,2,11,0,0x6739
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,4, 16,0,0x0000
	SEQEND

WEST_HakaikousenSub:
	ADD_ACTOR	HakaiKousenHeader,D_UP+2,0
	ADD_ACTOR	HakaiKousenHeader,D_UP+2,0
	WAIT		1
	END_CALL

@======================================================
@	おだてる
@======================================================
#if 1		//chg_02.08.27_iwasawa
WEST_Odateru:
	CHAR_SET	WAZACHR_ID_SPOTLIGHT
	CHAR_SET	WAZACHR_ID_KAMIFUBUKI
//	SEPLAY_PAN	SE_W227B, WAZA_SE_R
	ADD_TASK	SePlayCh2Task,PRI5,2, SE_W227B,WAZA_SE_R,
	ADD_TASK	ContWinCaver,PRI2,0
	ADD_TASK	WazaHardFadeTask,PRI2,5, 0xf8,3,0,10,0
	WAIT_FLAG
	ADD_ACTOR	OdateruSpotHeader,D_UP+2,3, 0,-8,80
	WAIT		0
	ADD_ACTOR	ActHaneruHeader,A_UP+2,3, 5,2,1
	WAIT		10
	ADD_ACTOR	ActHaneruHeader,A_UP+2,3, 5,2,1
	WAIT		0
//	SEPLAY_PAN	SE_W260, WAZA_SE_L
//	SE_WAITPLAY	SE_W260, WAZA_SE_R,6
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W260,WAZA_SE_L,
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	WAIT		5
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W260,WAZA_SE_R,
	WAIT_FLAG
	ADD_TASK	WazaHardFadeTask,PRI2,5, 0xf8,3,10,0,1
	WAIT_FLAG
	ADD_TASK	ContWinClose,PRI2,0
	SEQEND
#else
WEST_Odateru:
	CHAR_SET	WAZACHR_ID_SPOTLIGHT
	CHAR_SET	WAZACHR_ID_KAMIFUBUKI
	SEPLAY_PAN	SE_W227B, WAZA_SE_R
	ADD_TASK	WazaHardFadeTask,PRI2,5, 0xf8,3,0,10,0
	WAIT_FLAG
	ADD_ACTOR	OdateruSpotHeader,D_UP+2,3, 0,-8,80
	WAIT		50
	ADD_TASK	WazaHardFadeTask,PRI2,5, 0xf8,3,10,0,1
	WAIT_FLAG
	SEPLAY_PAN	SE_W260, WAZA_SE_L
//	SE_WAITPLAY	SE_W260, WAZA_SE_L,6
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	SEQ_CALL	WEST_OdateruSub
	WAIT		6
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W260,WAZA_SE_R,
	WAIT_FLAG
	WAIT		20
	ADD_ACTOR	ActHaneruHeader,A_UP+2,3, 5,2,1
	WAIT_FLAG
	ADD_ACTOR	ActHaneruHeader,A_UP+2,3, 5,2,1
	SEQEND

#endif
WEST_OdateruSub:
	ADD_ACTOR	KamifubukiHeader,A_UP+40,1, 0
	ADD_ACTOR	KamifubukiHeader,A_UP+40,1, 1
	END_CALL

@======================================================
@	なりきり
@======================================================
WEST_Narikiri:
	POKEBG		2
//	SEQ_CALL	WEST_ESP_MAPCHG
	ADD_TASK	ColorFadeSeq,PRI10,5,	4,2,0,16,0x7fff
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,2,0,10,0x0000
	WAIT_FLAG
	SEPLAY_PAN	SE_W161,WAZA_SE_L
	SE_WAITPLAY	SE_W197,WAZA_SE_L,30
	ADD_TASK	NarikiriTask,PRI2,0
	WAIT_FLAG
	POKEBG_RESET	2
	ADD_TASK	ColorFadeSeq,PRI10,5,	4,2,16,0,0x7fff
	WAIT		8
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,2,10,0,0x0000
//	SEQ_CALL	WEST_ESP_MAPEND
	SEQEND

@======================================================
@	リフレッシュ
@======================================================
WEST_Reflesh:
	CHAR_SET	WAZACHR_ID_HAMON
	CHAR_SET	WAZACHR_ID_KIRAKIRA2
	SEPLAY_PAN	SE_W287,WAZA_SE_L
	ADD_TASK	RefleshTask,PRI2,1, 0
	WAIT_FLAG
	SEPLAY_PAN	SE_W234,WAZA_SE_L
	SEQ_CALL	WEST_Kirakira
	WAIT_FLAG
	SEPLAY_PAN	SE_REAPOKE,WAZA_SE_L
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 31,3, 10,0,0x7b0c
	ADD_ACTOR	HamonHeader,A_UP+3,4, 0,0,0,0
	SEQEND

@======================================================
@	ブレイズキック
@======================================================
#define BUREIZUKICK_SYNC	30
WEST_BureizuKick:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_KAKUTOU
	CHAR_SET	WAZACHR_ID_FIRE
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W172,WAZA_SE_R
	ADD_ACTOR	MegatonPantiHeader,D_UP+3,4, 0,0, 1,BUREIZUKICK_SYNC
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,2,0,7,0x7fff
	WAIT		BUREIZUKICK_SYNC
	SEPLAY_PAN	SE_W007,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, 0,0,1,0
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,14,1
	ADD_TASK	ColorFadeSeq,PRI10,5, 4,2,0,0,0x7fff
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 0x1f,3,1,0x0000,8,0,0
	SEQ_CALL	WEST_HonoonoPantiSub
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

@======================================================
@	ハイパーボイス
@======================================================
#define HYPER_VOICE_WAIT	8
WEST_HyperVoice:
	CHAR_SET	WAZACHR_ID_HAMON
	SEQ_CALL	WEST_HyperVoiceSub
	WAIT_FLAG
	WAIT		HYPER_VOICE_WAIT
	SEQ_CALL	WEST_HyperVoiceSub
	WAIT_FLAG
	SEQEND

WEST_HyperVoiceSub:
	ADD_TASK	HyperVoicePlayTask,PRI5,0
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 31,3, 8,0,0x03ff
	ADD_TASK	PokeKakusyukuTask,PRI5,5,	-5,-5,5, 0,0		//chg_0826_iwa
	ADD_ACTOR	HamonMoveHeader,A_UP,7,	45,0,0,0,0,0,1	//0826_iwa
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,1,0, 6,1
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 3,1,0, 6,1
	ADD_TASK	TaskHaikeiQuake,PRI2,4, 1,0, 6,1
	END_CALL

@======================================================
@	すなじごく
@======================================================
WEST_SunaJigoku:	//しめつけｴﾌｪｸﾄでそのまま使用
	CHAR_SET	WAZACHR_ID_SUNA
	ADD_ACTOR	ActFadeHeader,A_UP,5, 0x04,2, 0,7,0x0233	//add_0826_iwa
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,2,43,1
	SEPLAY_PAN	SE_W328,WAZA_SE_R
	SEQ_CALL	WEST_SunaJigokuSub
	SEQ_CALL	WEST_SunaJigokuSub
	SEQ_CALL	WEST_SunaJigokuSub
	WAIT		22
	ADD_ACTOR	ActFadeHeader,A_UP,5, 0x04,2, 7,0,0x0233
	WAIT_FLAG
	SEQEND

#if 1
WEST_SunaJigokuSub:
	ADD_ACTOR	ActSunaArasiHeader,D_UP+2,7, 0,32, 0x0210,30, 10, 50,1
	WAIT		2
	ADD_ACTOR	ActSunaArasiHeader,D_UP+2,7, 0,36, 0x01e0,20, 13, -46,1
	WAIT		2
	ADD_ACTOR	ActSunaArasiHeader,D_UP+2,7, 0,37, 0x0240,20,  5, 42,1
	WAIT		2
	ADD_ACTOR	ActSunaArasiHeader,D_UP+2,7, 0,35, 0x0190,25,  8, -42,1
	WAIT		2
	ADD_ACTOR	ActSunaArasiHeader,D_UP+2,7, 0,32, 0x0200,25, 13, 46,1
	WAIT		2
	ADD_ACTOR	ActSunaArasiHeader,D_UP+2,7, 0,37, 0x01d0,30, 12, -50,1
	WAIT		2
	END_CALL
#else
WEST_SunaJigokuSub:
	ADD_ACTOR	ActSunaArasiHeader,D_UP+2,7, 0,32, 0x0210,30, 15, 50,1
	WAIT		2
	ADD_ACTOR	ActSunaArasiHeader,D_UP+2,7, 0,36, 0x01e0,20, 18, -46,1
	WAIT		2
	ADD_ACTOR	ActSunaArasiHeader,D_UP+2,7, 0,37, 0x0240,20, 10, 42,1
	WAIT		2
	ADD_ACTOR	ActSunaArasiHeader,D_UP+2,7, 0,35, 0x0190,25, 13, -42,1
	WAIT		2
	ADD_ACTOR	ActSunaArasiHeader,D_UP+2,7, 0,32, 0x0200,25, 18, 46,1
	WAIT		2
	ADD_ACTOR	ActSunaArasiHeader,D_UP+2,7, 0,37, 0x01d0,30, 17, -50,1
	WAIT		2
	END_CALL
#endif

@======================================================
@	ぜったいれいど
@======================================================
WEST_ZettaiReido:
	HAIKEI_CHG	WAZAMAP_ID_ICE
	HAIKEI_HALF_WAIT
	SEPLAY_PAN	SE_W196,0
	HAIKEI_CHG_WAIT
	CHAR_SET	WAZACHR_ID_KOORI
	POKEBG		3
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	ADD_TASK	KooriStatusEffectTask,PRI2,0
	SE_WAITPLAY	SE_W258,WAZA_SE_R,17
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
	SEQEND

@======================================================
@	つっぱり
@======================================================

WEST_Tuppari:
	CHAR_SET	WAZACHR_ID_KAKUTOU
	CHAR_SET	WAZACHR_ID_HITMARK
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	ADD_TASK	WazaPokeRollTask PRI5,4,	8,5,0,0
	WAIT		6
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,4,3
	WAIT		4
	SEPLAY_PAN	SE_W207,WAZA_SE_R
	ADD_ACTOR	ActTuppariHeader,D_UP+2,4, 10,-8, 14,3
	WAIT_FLAG
	ADD_TASK	WazaPokeRollTask PRI5,4,	8,5,0,1
	SEPLAY_PAN	SE_W003,WAZA_SE_R
	TURN_CHK	WEST_TuppariTurn0, WEST_TuppariTurn1
WEST_TuppariReturn:
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,4,0,6,1
	WAIT_FLAG
	BLDALPHA_RESET
	SEQEND

WEST_TuppariTurn0:	//偶数ﾀｰﾝ
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, 8,0,1,2
	SEQ_JP		WEST_TuppariReturn

WEST_TuppariTurn1:	//奇数ﾀｰﾝ
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, -8,0,1,2
	SEQ_JP		WEST_TuppariReturn


@======================================================
@	だくりゅう
@======================================================
WEST_Dakuryuu:
	SEPAN_FLOW	SE_W250,WAZA_SE_L,WAZA_SE_R,2,0
	ADD_TASK	WazaNaminoriTask,PRI2,1, 1
	WAIT_FLAG
	SEQEND

@======================================================
@	タネマシンガン
@======================================================
WEST_TaneMasingan:
	CHAR_SET	WAZACHR_ID_YADORIGI
	ADD_ACTOR	TaneMasinganHeader,D_UP+2,2, 20,0
	WAIT		5
	ADD_ACTOR	TaneMasinganHeader,D_UP+2,2, 20,0
	WAIT		5
	ADD_ACTOR	TaneMasinganHeader,D_UP+2,2, 20,0
	WAIT		5
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,30,1
	ADD_ACTOR	TaneMasinganHeader,D_UP+2,2, 20,0
	WAIT		5
	ADD_ACTOR	TaneMasinganHeader,D_UP+2,2, 20,0
	WAIT		5
	ADD_ACTOR	TaneMasinganHeader,D_UP+2,2, 20,0
	WAIT		5
	ADD_ACTOR	TaneMasinganHeader,D_UP+2,2, 20,0
	WAIT		5
	ADD_ACTOR	TaneMasinganHeader,D_UP+2,2, 20,0
	WAIT		5
	ADD_ACTOR	TaneMasinganHeader,D_UP+2,2, 20,0
	WAIT		5
	ADD_ACTOR	TaneMasinganHeader,D_UP+2,2, 20,0
	WAIT_FLAG
	SEQEND

@======================================================
@	ドラゴンクロー
@======================================================
WEST_DoragonKurou:
	CHAR_SET	WAZACHR_ID_FIRE
	CHAR_SET	WAZACHR_ID_KIRISAKU
	SEPLAY_PAN	SE_W221B,WAZA_SE_L
	ADD_TASK	ColorFadeSeq,PRI10,5, 2,4,0,8,0x027f
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 0,0,2,15,1
	SEQ_CALL	WEST_DoragonKurouSub
	SEQ_CALL	WEST_DoragonKurouSub
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,6,4
	ADD_ACTOR	ActHonoonoUzuHeader,A_UP+2,7, 0,28, 0x0210,30, 13, 50,0
	WAIT		2
//	SEPLAY_PAN	SE_W013,WAZA_SE_R
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W013,WAZA_SE_R
	ADD_ACTOR	ActMetaruKuroHeader,D_UP+2,3, -10,-10,0
	ADD_ACTOR	ActMetaruKuroHeader,D_UP+2,3, -10,10,0
	ADD_ACTOR	ActQuakeHeader,A_UP+2,5, -4,1,10, 3,1
	ADD_ACTOR	ActHonoonoUzuHeader,A_UP+2,7, 0,32, 0x01e0,20, 16, -46,0
	WAIT		2
	ADD_ACTOR	ActHonoonoUzuHeader,A_UP+2,7, 0,33, 0x0240,20, 8, 42,0
	WAIT		2
	ADD_ACTOR	ActHonoonoUzuHeader,A_UP+2,7, 0,31, 0x0190,25, 11, -42,0
	WAIT		2
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,6,4
	ADD_ACTOR	ActHonoonoUzuHeader,A_UP+2,7, 0,28, 0x0200,25, 16, 46,0
	WAIT		2
	//SEPLAY_PAN	SE_W013,WAZA_SE_R
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W013,WAZA_SE_R
	ADD_ACTOR	ActMetaruKuroHeader,D_UP+2,3, 10,-10,1
	ADD_ACTOR	ActMetaruKuroHeader,D_UP+2,3, 10,10,1
	ADD_ACTOR	ActQuakeHeader,A_UP+2,5, -4,1,10, 3,1
	ADD_ACTOR	ActHonoonoUzuHeader,A_UP+2,7, 0,33, 0x01d0,30, 15, -50,0
	WAIT		2
	ADD_ACTOR	ActHonoonoUzuHeader,A_UP+2,7, 0,28, 0x0210,30, 13, 50,0
	WAIT		2
	ADD_ACTOR	ActHonoonoUzuHeader,A_UP+2,7, 0,32, 0x01e0,20, 16, -46,0
	WAIT		2
	ADD_ACTOR	ActHonoonoUzuHeader,A_UP+2,7, 0,33, 0x0240,20, 8, 42,0
	WAIT		2
	ADD_ACTOR	ActHonoonoUzuHeader,A_UP+2,7, 0,31, 0x0190,25, 11, -42,0
	WAIT		2
	ADD_ACTOR	ActHonoonoUzuHeader,A_UP+2,7, 0,28, 0x0200,25, 16, 46,0
	WAIT		2
	ADD_ACTOR	ActHonoonoUzuHeader,A_UP+2,7, 0,33, 0x01d0,30, 15, -50,0
	ADD_TASK	ColorFadeSeq,PRI10,5, 2,4,8,0,0x027f
//	SEQ_CALL	WEST_DoragonKurouSub
	WAIT_FLAG
	SEQEND

WEST_DoragonKurouSub:
	ADD_ACTOR	ActHonoonoUzuHeader,A_UP+2,7, 0,28, 0x0210,30, 13, 50,0
	WAIT		2
	ADD_ACTOR	ActHonoonoUzuHeader,A_UP+2,7, 0,32, 0x01e0,20, 16, -46,0
	WAIT		2
	ADD_ACTOR	ActHonoonoUzuHeader,A_UP+2,7, 0,33, 0x0240,20, 8, 42,0
	WAIT		2
	ADD_ACTOR	ActHonoonoUzuHeader,A_UP+2,7, 0,31, 0x0190,25, 11, -42,0
	WAIT		2
	ADD_ACTOR	ActHonoonoUzuHeader,A_UP+2,7, 0,28, 0x0200,25, 16, 46,0
	WAIT		2
	ADD_ACTOR	ActHonoonoUzuHeader,A_UP+2,7, 0,33, 0x01d0,30, 15, -50,0
	WAIT		2
	END_CALL
	SEQEND

@======================================================
@	マッドショット
@======================================================
#define MADDOSYOTTO_FURIHABA_Y0		16
#define MADDOSYOTTO_FURIHABA_Y1		(-16)
#define MADDOSYOTTO_WAIT			2
WEST_MaddoSyotto:
	CHAR_SET	WAZACHR_ID_MADDO
	POKEBG		3
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 0,0,2,46,1
	WAIT		6
	ADD_TASK	HaidoriKakudoTask,PRI5,1, 100
	SEPAN_FLOW	SE_W250,WAZA_SE_L,WAZA_SE_R,1,0
	SEQ_CALL	WEST_MaddoSyottoSub
	SEQ_CALL	WEST_MaddoSyottoSub
	SEQ_CALL	WEST_MaddoSyottoSub
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,3,0,43,1
	SEQ_CALL	WEST_MaddoSyottoSub
	SEQ_CALL	WEST_MaddoSyottoSub
	SEQ_CALL	WEST_MaddoSyottoSub
	SEQ_CALL	WEST_MaddoSyottoSub
	SEQ_CALL	WEST_MaddoSyottoSub
	SEQ_CALL	WEST_MaddoSyottoSub
	SEQ_CALL	WEST_MaddoSyottoSub
	SEQ_CALL	WEST_MaddoSyottoSub
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

WEST_MaddoSyottoSub:
	ADD_ACTOR	MaddoSyottoHeader,A_UP+3,4, 10,10,0,MADDOSYOTTO_FURIHABA_Y0
//	ADD_ACTOR	MaddoSyottoHeader,A_UP+3,4, 10,10,0,MADDOSYOTTO_FURIHABA_Y1
	WAIT		MADDOSYOTTO_WAIT
	ADD_ACTOR	MaddoSyottoHeader,A_UP+3,4, 10,10,0,MADDOSYOTTO_FURIHABA_Y0
//	ADD_ACTOR	MaddoSyottoHeader,A_UP+3,4, 10,10,0,MADDOSYOTTO_FURIHABA_Y1
	WAIT		MADDOSYOTTO_WAIT
	END_CALL


@======================================================
@	309 コメットパンチ
@======================================================
WEST_CometPanchi:
	CHAR_SET	WAZACHR_ID_SHOOTINGSTAR
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_KAKUTOU
	SEPAN_FLOW	SE_W112,WAZA_SE_L,WAZA_SE_R,3,0
	HAIKEI_CHG	WAZAMAP_ID_UCHU
	HAIKEI_CHG_WAIT
	
	WAIT_FLAG
	ADD_ACTOR	CometPanchiHeader,D_UP+3,5,-80+32,-64,40+32,32,30
	WAIT		10
	ADD_ACTOR	CometPanchiHeader,D_UP+3,5,-80-32,-64,40-32,32,30
	WAIT		40
	ADD_ACTOR	MegatonPantiHeader,D_UP+3,4, 0,0, 0,30
	ADD_ACTOR	CometPanchiHeader,D_UP+3,5,-80,-64,40,32,30
	WAIT		20
//	ADD_ACTOR	CometPanchi2Header,D_UP+3,2, 0x00a0,-30
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 0,0,1,1
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,5,0,20,1
	
	WAIT_FLAG
	WAIT		10
	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
	WAIT_FLAG
	SEQEND

@======================================================
@	リベンジ
@======================================================
WEST_Revenge:
	CHAR_SET	WAZACHR_ID_REVENGE1
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W036,WAZA_SE_L
	ADD_ACTOR	Revenge1Header,A_UP+2,2, 10,-10,0
	WAIT_FLAG
	ADD_TASK	WazaTaskColorFade,PRI2,6, 2,0,4,2,8,0x001f
	WAIT_FLAG
	CHAR_DEL	WAZACHR_ID_REVENGE1
	CHAR_SET	WAZACHR_ID_REVENGE2
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2, 6,4
	WAIT		4
	SEPLAY_PAN	SE_W207,WAZA_SE_R
	ADD_ACTOR	Revenge2Header,D_UP+2,2, 10,-10,1
	WAIT_FLAG
	CHAR_DEL	WAZACHR_ID_REVENGE2
	CHAR_SET	WAZACHR_ID_HITMARK
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,3,0,10,1
//	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, -10,-8,1,1
	ADD_ACTOR	ActHitMarkWaitHeader,D_UP+3,5, -10,-8,1,1,8	//chg_020827_iwa
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	WAIT		8
//	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 10,8,1,1
	ADD_ACTOR	ActHitMarkWaitHeader,D_UP+3,5, 10,8,1,1,8	//chg_020827_iwa
	SEPLAY_PAN	SE_W025B,WAZA_SE_R
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND
	
	
@======================================================
@	どくどくのキバ
@======================================================
WEST_DokuDokunoKiba:
	CHAR_SET	WAZACHR_ID_HAGATA
	CHAR_SET	WAZACHR_ID_HEDORO
	SEPLAY_PAN	SE_W044,WAZA_SE_R
	ADD_ACTOR	ActHissatuMaebaHeader,D_UP+2,0
	WAIT		10
	ADD_TASK	TaskPokeBuruburu,PRI3,5,1,3,0,10,1
	WAIT_FLAG
	ADD_TASK	WazaTaskColorFade,PRI2, 6, 4,0,4,0,12,0x681a
	SEQ_CALL	WEST_DokuKouka
	WAIT_FLAG
	SEQEND

@======================================================
@	みがわり
@======================================================
WEST_Migawari:
	SEPLAY_PAN	SE_W213,WAZA_SE_L
	ADD_TASK	MigawariTask,PRI2,0
	SEQEND

@======================================================
@	338 ハードプラント
@======================================================
WEST_HardPlant:
	CHAR_SET	WAZACHR_ID_NEKKO
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	ADD_ACTOR	ActFadeHeader,A_UP,5, 	1,2, 0,5,0x0000	
	WAIT_FLAG
	ADD_ACTOR	ActNe2Header	A_UP+2,6, 10, 8,2, 0,0, 100
	SEPLAY_PAN	SE_W010,WAZA_SE_L
	WAIT		5
	ADD_ACTOR	ActNe2Header	A_UP+2,6, 20, -8,-2, 0,1, 95
	SEPLAY_PAN	SE_W010,WAZA_SE_L+21
	WAIT		5
	ADD_ACTOR	ActNe2Header	A_UP+2,6, 30, 8,-4, 0,0, 90
	SEPLAY_PAN	SE_W010,WAZA_SE_L+42
	WAIT		5
	ADD_ACTOR	ActNe2Header	A_UP+2,6, 40, -8, 4,0,1, 85
	SEPLAY_PAN	SE_W010,WAZA_SE_L+64
	WAIT		5
	ADD_ACTOR	ActNe2Header	A_UP+2,6, 50, 8,  0,0,0, 85
	SEPLAY_PAN	SE_W010,WAZA_SE_L+85
	WAIT		5
	ADD_ACTOR	ActNe2Header	A_UP+2,6, 60, -8, -2,0,1, 85
	SEPLAY_PAN	SE_W010,WAZA_SE_L+106
	WAIT		5
	ADD_ACTOR	ActNe2Header	A_UP+2,6, 75, 8,  0,0,0, 85
	SEPLAY_PAN	SE_W010,WAZA_SE_L+127
	WAIT		5
	ADD_ACTOR	ActNe2Header	A_UP+2,6, 85, 16, 6, 0,3, 80
	SEPLAY_PAN	SE_W010,WAZA_SE_L+127
	WAIT		5
	ADD_ACTOR	ActNe2Header	A_UP+2,6, 85, -16,-6, 0,2, 75
	SEPLAY_PAN	SE_W010,WAZA_SE_L+127
	WAIT		5
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -10,-10,1,3
	SEPLAY_PAN	SE_W003,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI3,5,1,8,0,20,1
	WAIT 3
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 10,8,1,3
	SEPLAY_PAN	SE_W003,WAZA_SE_R
	WAIT 3
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 10,-3,1,2
	SEPLAY_PAN	SE_W003,WAZA_SE_R
	WAIT 3
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -3,1,1,2
	SEPLAY_PAN	SE_W003,WAZA_SE_R
	WAIT 2
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -10,1,1,1
	SEPLAY_PAN	SE_W003,WAZA_SE_R
	WAIT 2
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,10,1,1
	SEPLAY_PAN	SE_W003,WAZA_SE_R
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP,5, 	1,2, 5,0,0x0000	
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

@======================================================
@	きんぞくおん
@======================================================
#define KINZOKUON_SYNC	30
#define KINZOKUON_WAIT	2
WEST_Kinzokuon:
	CHAR_SET	WAZACHR_ID_KINZOKUON
	POKEBG		3
	BGPRI_GAPSET3	BG_DEFENCE
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,2,0,8,1
	SEQ_CALL	WEST_KinzokuonSub
	SEQ_CALL	WEST_KinzokuonSub
	SEQ_CALL	WEST_KinzokuonSub
	SEQ_CALL	WEST_KinzokuonSub
//	SEQ_CALL	WEST_KinzokuonSub
//	SEQ_CALL	WEST_KinzokuonSub
	WAIT_FLAG
	POKEBG_RESET	3
	WAIT		0
//	ADD_TASK	StatusEffectTask,PRI5,5, 1,5,1,0,1
	WAIT_FLAG
	SEQEND

WEST_KinzokuonSub:
	SEPAN_FLOW	SE_W103,WAZA_SE_L,WAZA_SE_R,2,0
	ADD_ACTOR	KinzokuonHeader,D_UP+2,6, 16,0,0,0, KINZOKUON_SYNC,0x0000
	WAIT		KINZOKUON_WAIT
	END_CALL


@======================================================
@	きあいパンチ
@======================================================
WEST_KiaiPunch:
//	TURN_CHK	WEST_KiaiPunchTurn1, WEST_KiaiPunchTurn2
	SEQ_JP		WEST_KiaiPunchTurn2		//1ﾀｰﾝ目はFightEffectになった2002.09.04(水)
WEST_KiaiPunchReturn:
	WAIT_FLAG
	SEQEND

WEST_KiaiPunchTurn2:	//2ターン目:パンチ
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_KAKUTOU


	WAIT		1
	ADD_TASK	ContestChkTask,PRI2,0
	WORKCHK_JP	7,1,WEST_KiaiPunchNext2
	ADD_TASK	TaskAttackOrDefense,PRI2,0
	WORKCHK_JP	7,0,WEST_KiaiPunchNext0			@攻撃か防御によってひっさつのBGを変える	相手
	WORKCHK_JP	7,1,WEST_KiaiPunchNext1			@										自分

WEST_KiaiPunchTurn2_b:
	HAIKEI_CHG_WAIT
	
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W207,WAZA_SE_R
	ADD_ACTOR	ActKiaiPunchHeader, D_UP+2, 0

	WAIT		10
//	ADD_TASK	TaskHaikeiQuake,PRI2,4,		2,0,10,1
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -10,-8,1,0
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,8,0,24,1
	WAIT 8
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 10,2,1,0
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
//	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,6,0,8,1
	WAIT 8
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 10,-6,1,0
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
//	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,6,0,8,1
	WAIT 8
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,8,1,0
	SEPLAY_PAN	SE_W025B,WAZA_SE_R
//	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,6,0,8,1
	
	WAIT_FLAG
	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQ_JP		WEST_KiaiPunchReturn


WEST_KiaiPunchNext0:	
	HAIKEI_CHG	WAZAMAP_ID_HISSATU
	SEQ_JP		WEST_KiaiPunchTurn2_b

WEST_KiaiPunchNext1:	
	HAIKEI_CHG	WAZAMAP_ID_HISSATU2
	SEQ_JP		WEST_KiaiPunchTurn2_b

WEST_KiaiPunchNext2:
	HAIKEI_CHG	WAZAMAP_ID_HISSATU3
	SEQ_JP		WEST_KiaiPunchTurn2_b

@======================================================
@	216	おんがえし
@======================================================
WEST_Ongaeshi:
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	ADD_TASK	TaskOngaeshiCheck,PRI2,0
	WAIT		2
	WORKCHK_JP	7,0,WEST_OngaeshiJump0
	WORKCHK_JP	7,1,WEST_OngaeshiJump1
	WORKCHK_JP	7,2,WEST_OngaeshiJump2
	WORKCHK_JP	7,3,WEST_OngaeshiJump3

WEST_OngaeshiReturn:
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND


@==========おんがえしその１=================	
WEST_OngaeshiJump0:
	ADD_ACTOR	ActHaneruHeader,A_UP+2,3,16,1,0
	ADD_TASK	SePlayCh2Task,PRI5,2, SE_W039,WAZA_SE_L
	WAIT_FLAG
	ADD_ACTOR	ActHaneruHeader,A_UP+2,3,16,1,0
	ADD_TASK	SePlayCh2Task,PRI5,2, SE_W039,WAZA_SE_L
//	ADD_TASK	SePlayCh2Task,PRI5,2, SE_W039,WAZA_SE_L
	WAIT		5
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -10,-8,1,2
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W004,WAZA_SE_R
//	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,6,0,8,1
	SEQ_JP	WEST_OngaeshiReturn
	
@==========おんがえしその２=================	
WEST_OngaeshiJump1:
	ADD_ACTOR	ActHaneruHeader,A_UP+2,3,	6,1,0
	ADD_TASK	SePlayCh2Task,PRI5,2, SE_W039,WAZA_SE_L
	WAIT_FLAG
	ADD_ACTOR	ActHaneruHeader,A_UP+2,3,	6,1,0
	ADD_TASK	SePlayCh2Task,PRI5,2, SE_W039,WAZA_SE_L
	WAIT_FLAG
	WAIT		11
	ADD_ACTOR	ActTaiatariHeader,A_UP+2,2,5,4
	WAIT		6		@体当たりのﾙｰﾌﾟ回数と同じにしておくこと
	ADD_ACTOR	ActHitMarkHeader,A_UP+3,4, 0,0,1,2
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W025B,WAZA_SE_R
	SEQ_JP	WEST_OngaeshiReturn
	
@==========おんがえしその３=================	
WEST_OngaeshiJump2:
	ADD_ACTOR	ActHaneruHeader,A_UP+2,3,	6,1,0
	ADD_TASK	SePlayCh2Task,PRI5,2, SE_W039,WAZA_SE_L
	WAIT_FLAG
	ADD_ACTOR	ActHaneruHeader,A_UP+2,3,	6,1,0
	ADD_TASK	SePlayCh2Task,PRI5,2, SE_W039,WAZA_SE_L
	WAIT_FLAG
	ADD_ACTOR	ActHaneruHeader,A_UP+2,3,	6,1,0
	ADD_TASK	SePlayCh2Task,PRI5,2, SE_W039,WAZA_SE_L
	WAIT_FLAG
	ADD_ACTOR	ActHaneruHeader,A_UP+2,3,	6,1,0
	ADD_TASK	SePlayCh2Task,PRI5,2, SE_W039,WAZA_SE_L
	WAIT_FLAG

	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -10,-8,1,2
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W233B,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,6,0,8,1
	WAIT 8
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 10,10,1,2
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W233B,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,6,0,8,1
	WAIT 8
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 3,-5,1,2
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W233B,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,6,0,8,1
	WAIT 8
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -5,3,1,2
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W233B,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,6,0,8,1
	SEQ_JP	WEST_OngaeshiReturn
	
@==========おんがえしその４=================	
WEST_OngaeshiJump3:
	ADD_ACTOR	ActFadeHeader,PRI2, 5, 1,0,0,6,0
	WAIT_FLAG	

	ADD_ACTOR	ActHaneruHeader,A_UP+2,3,	16,1,0		@一発目
	ADD_TASK	SePlayCh2Task,PRI5,2, SE_W039,WAZA_SE_L
	WAIT		8
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 3,-5,1,2
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W233B,WAZA_SE_R
	WAIT_FLAG

	ADD_ACTOR	ActHaneruHeader,A_UP+2,3,	12,1,0		@２発目
	ADD_TASK	SePlayCh2Task,PRI5,2, SE_W039,WAZA_SE_L
	WAIT		5
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -10,-8,1,2
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W233B,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,6,0,8,1
	WAIT_FLAG
	WAIT		4

	ADD_ACTOR	ActHaneruHeader,A_UP+2,3,	8,1,0
	ADD_TASK	SePlayCh2Task,PRI5,2, SE_W039,WAZA_SE_L
	WAIT		5
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -10,-8,1,2
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W233B,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,6,0,8,1
	WAIT_FLAG
	WAIT		2

	ADD_TASK	TaskPokeZanzou, PRI2,4,	0,4,5,1

	ADD_ACTOR	ActHaneruHeader,A_UP+2,3,	4,1,0
	ADD_TASK	SePlayCh2Task,PRI5,2, SE_W039,WAZA_SE_L
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -10,-8,1,2
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W233B,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,6,0,8,1
	ADD_TASK	TaskPokeZanzou, PRI2,4,	0,4,5,1
	WAIT_FLAG

	ADD_ACTOR	ActHaneruHeader,A_UP+2,3,	4,2,0
	ADD_TASK	SePlayCh2Task,PRI5,2, SE_W039,WAZA_SE_L
	WAIT		5
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -10,-8,1,2
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W233B,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,6,0,8,1
	ADD_TASK	TaskPokeZanzou, PRI2,4,	0,4,5,1
	WAIT_FLAG

	SEQ_CALL	WEST_OngaeshiPart0
	SEQ_CALL	WEST_OngaeshiPart0
	SEQ_CALL	WEST_OngaeshiPart0
	SEQ_CALL	WEST_OngaeshiPart0

	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -10,-8,1,0
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W025B,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,8,0,24,1
	WAIT 6
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 10,10,1,0
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W025B,WAZA_SE_R
	WAIT 6
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 3,-5,1,0
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W025B,WAZA_SE_R
	WAIT 6
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, -5,3,1,0
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W025B,WAZA_SE_R
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,PRI2, 5, 1,0,6,0,0
	SEQ_JP	WEST_OngaeshiReturn

WEST_OngaeshiPart0:
	ADD_ACTOR	ActHaneruHeader,A_UP+2,3,	4,3,0
	ADD_TASK	SePlayCh2Task,PRI5,2, SE_W039,WAZA_SE_L
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4,  0,0,1,2
	ADD_TASK	SePlayCh1Task,PRI5,2, SE_W233B,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,6,0,8,1
	ADD_TASK	TaskPokeZanzou, PRI2,4,	0,4,5,1
	WAIT_FLAG
	END_CALL



@======================================================
@	322 コスモパワー
@======================================================
WEST_CosmoPower:
	CHAR_SET	WAZACHR_ID_KIRAKIRA2
	ADD_TASK	SePlayCh2Task,PRI5,2,SE_W322,0
	SEPLAY_PAN	SE_W322,0
	ADD_TASK	TaskOtherPokemonFade,PRI2,4,	0,0,15,0
	WAIT_FLAG	
	HAIKEI_CHG	WAZAMAP_ID_UCHU
	HAIKEI_HALF_WAIT
	ADD_TASK	HaikeiMapScrTask,PRI2,4,	0,128,0,0xffff
	HAIKEI_CHG_WAIT
	WAIT		70

	ADD_TASK	SePlayCh1Task,PRI5,2,SE_W234,WAZA_SE_L
	ADD_ACTOR	ActKirakira2Header,A_UP+2,6, -15,0,0,0x0000,0x0020,60
	WAIT		8
	ADD_ACTOR	ActKirakira2Header,A_UP+2,6, 12,-5,0,0x0000,0x0020,60

	WAIT		40	
	ADD_TASK	TaskOtherPokemonFade,PRI2,4,	0,15,0,0
	WAIT_FLAG
	HAIKEI_RECOVER
	HAIKEI_HALF_WAIT
	WORK_SET	7,0xffff	//背景のｽｸﾛｰﾙ終了
	HAIKEI_CHG_WAIT
//	ADD_TASK	StatusEffectTask,PRI2,5	0,0xff,0,0,0
	WAIT_FLAG
	SEQEND


@======================================================
@	307 ブラストバーン
@======================================================
WEST_BlastBurn:
	CHAR_SET	WAZACHR_ID_HIBASIRA
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W221,WAZA_SE_L
	ADD_ACTOR	ActSeinaruHonoo3Header,A_UP+2,6,	-32,  0,24,0,0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_UP+2,6,	-20,-10,24,0,0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_DOWN+2,6,  	  0,-16,24,0,0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_DOWN+2,6,  	 20,-10,24,0,0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_DOWN+2,6,  	 32,  0,24,0, 0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_DOWN+2,6,  	 20, 10,24,0, 0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_UP+2,6,	  0, 16,24,0,0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_UP+2,6,	-20, 10,24,0,0,0
	WAIT		25

	SEPLAY_PAN	SE_W172B,WAZA_SE_L
	ADD_ACTOR	ActSeinaruHonoo3Header,A_UP+2,6,-64,  0,24,0,0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_UP+6,6,-40,-20,24,0,0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_DOWN+6,6,    0,-32,24,0,0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_DOWN+6,6,   40,-20,24,0,0,0
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,6,0,8,1
	ADD_ACTOR	ActSeinaruHonoo3Header,A_DOWN+2,6,   64,  0,24,0, 0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_DOWN+2,6,   40, 20,24,0, 0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_UP+2,6,  0, 32,24,0,0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_UP+2,6,-40, 20,24,0,0,0
	ADD_TASK	WazaTaskColorReversal,PRI2,3, 0x0101,0x0101,0x0101	//add test
	WAIT		25

	SEPLAY_PAN	SE_W172B,WAZA_SE_L
	ADD_ACTOR	ActSeinaruHonoo3Header,A_UP+2,6,-96,  0,24,0,0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_UP+6,6,-60,-30,24,0,0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_DOWN+6,6,    0,-48,24,0,0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_DOWN+6,6,   60,-30,24,0,0,0

	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, -4,3,1,0
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,12,0,20,1
	ADD_TASK	TaskHaikeiQuake,PRI2,4,		2,0,10,1

	ADD_ACTOR	ActSeinaruHonoo3Header,A_DOWN+2,6,   96,  0,24,0, 0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_DOWN+2,6,   60, 30,24,0, 0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_UP+2,6,  0, 48,24,0,0,0
	ADD_ACTOR	ActSeinaruHonoo3Header,A_UP+2,6,-60, 30,24,0,0,0
	ADD_TASK	WazaTaskColorReversal,PRI2,3, 0x0101,0x0101,0x0101	//add test
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET

	SEQEND

@======================================================
@	317	がんせきふうじ
@======================================================
WEST_GansekiHuuzi:
	CHAR_SET	WAZACHR_ID_HUUINBATSU
	CHAR_SET	WAZACHR_ID_IWA
	ADD_TASK	TaskHaikeiQuake,PRI2,4,		2,0,10,1
	WAIT_FLAG

	ADD_ACTOR	ActGansekiHeader,D_UP+2,5,	20,12,64,114,0
	WAIT		8
	ADD_TASK	TaskHaikeiQuake,PRI2,4,		0,2,3,1
	SEPLAY_PAN	SE_W070,WAZA_SE_R
	WAIT		8

	ADD_ACTOR	ActGansekiHeader,D_UP+2,5,	-20,12,64,98,0
	WAIT		8
	ADD_TASK	TaskHaikeiQuake,PRI2,4,		0,2,3,1
	SEPLAY_PAN	SE_W070,WAZA_SE_R
	WAIT		8

	ADD_ACTOR	ActGansekiHeader,D_DOWN+2,5,	3,6,64,82,0
	WAIT		8
	ADD_TASK	TaskHaikeiQuake,PRI2,4,		0,2,3,1
	SEPLAY_PAN	SE_W070,WAZA_SE_R
	WAIT		8

	ADD_ACTOR	ActGansekiHeader,D_UP+2,5,	-3,13,64,66,0
	WAIT		8
	ADD_TASK	TaskHaikeiQuake,PRI2,4,		0,2,3,1
	SEPLAY_PAN	SE_W070,WAZA_SE_R
	WAIT		24
	SEPLAY_PAN	SE_W063,WAZA_SE_R
	ADD_ACTOR	HuuinBatsuHeader,D_UP+5,2,1,50,
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,3,0,20,1
	ADD_TASK	TaskHaikeiQuake,PRI2,4,		2,0,10,1
	WAIT_FLAG
	SEQEND

@======================================================
@	318:ぎんいろのかぜ
@======================================================
WEST_SilverWind:
	CHAR_SET	WAZACHR_ID_SILVERWIND
	SEPAN_FLOW	SE_W016,WAZA_SE_L,WAZA_SE_R,2,0
	SEPLAY_PAN	SE_W234,0
	WAIT		0
	POKEBG		3
	BGPRI_GAPSET2
	WAIT		0
	ADD_TASK	ExceptColorFadeSeq,PRI10,5, 1,0, 0,4,0x0000
	ADD_TASK	MineEnemyChkTask2,PRI2,0
	WORKCHK_JP	7,1,WEST_SilverWindEnemyHaikei
	HAIKEI_CHG	WAZAMAP_ID_YOKO3
	HAIKEI_HALF_WAIT
	ADD_TASK	HaikeiMapScrTask,PRI5,4, 0x0600,0x0000,0,0xffff
WEST_SilverWindHaikeiReturn:
	WAIT		0
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x01,0, 4,4,0x0000
	HAIKEI_CHG_WAIT
	ADD_ACTOR	SilverWindHeader0,D_DOWN+2,7,	 -32,16,  0,6,2,3,1
	ADD_ACTOR	SilverWindHeader0,D_DOWN+2,7,	  -8,18, 64,3,2,2,1
	ADD_ACTOR	SilverWindHeader0,D_UP-8,7,		 -24,18, 90,5,1,2,1
	ADD_ACTOR	SilverWindHeader0,D_UP-8,7,		 -40,14,128,4,1,2,1
	WAIT		0
	ADD_ACTOR	SilverWindHeader1,D_DOWN+2,7,	 -32,16,  0,6,2,3,1
	ADD_ACTOR	SilverWindHeader1,D_DOWN+2,7,	  -8,18, 64,3,2,2,1
	ADD_ACTOR	SilverWindHeader1,D_UP-8,7,		 -24,18, 90,5,1,2,1
	ADD_ACTOR	SilverWindHeader1,D_UP-8,7,		 -40,14,128,4,1,2,1
	WAIT		0
	ADD_ACTOR	SilverWindHeader2,D_DOWN+2,7,	 -32,16,  0,6,2,3,1
	ADD_ACTOR	SilverWindHeader2,D_DOWN+2,7,	  -8,18, 64,3,2,2,1
	ADD_ACTOR	SilverWindHeader2,D_UP-8,7,		 -24,18, 90,5,1,2,1
	ADD_ACTOR	SilverWindHeader2,D_UP-8,7,		 -40,14,128,4,1,2,1
	WAIT		6
	ADD_ACTOR	SilverWindHeader0,D_DOWN+2,7,	  -4,16,  0,6,1,2,1
	ADD_ACTOR	SilverWindHeader0,D_DOWN+2,7,	 -16,12,192,5,2,3,1
	WAIT		0
	ADD_ACTOR	SilverWindHeader1,D_DOWN+2,7,	  -4,16,  0,6,1,2,1
	ADD_ACTOR	SilverWindHeader1,D_DOWN+2,7,	 -16,12,192,5,2,3,1
	WAIT		0
	ADD_ACTOR	SilverWindHeader2,D_DOWN+2,7,	  -4,16,  0,6,1,2,1
	ADD_ACTOR	SilverWindHeader2,D_DOWN+2,7,	 -16,12,192,5,2,3,1
	WAIT_FLAG
	SEPLAY_PAN	SE_W016B,WAZA_SE_R
	POKEBG_RESET	3
	WAIT		0
	HAIKEI_RECOVER
	HAIKEI_HALF_WAIT
	ADD_TASK	ExceptColorFadeSeq,PRI10,5, 1,0, 4,0,0x0000
	WORK_SET	7,0xffff	//背景のｽｸﾛｰﾙ終了
	HAIKEI_CHG_WAIT
	SEQEND
	
WEST_SilverWindEnemyHaikei:
	HAIKEI_CHG	WAZAMAP_ID_YOKO4
	HAIKEI_HALF_WAIT
	ADD_TASK	HaikeiMapScrTask,PRI5,4, -0x0600,0x0000,0,0xffff
	SEQ_JP		WEST_SilverWindHaikeiReturn

@======================================================
@	よこどり
@======================================================
WEST_Yokodori:
	SEPLAY_PAN	SE_W036, WAZA_SE_L,
	ADD_TASK	PokeSinBackInit,PRI5,7, 0,-12,4,10, 10, 12,6
	SEQEND

@======================================================
@	ダイビング
@======================================================
WEST_Dive:
	CHAR_SET	WAZACHR_ID_DIVE
	CHAR_SET	WAZACHR_ID_SPLASH
	TURN_CHK	WEST_DiveTurn1, WEST_DiveTurn2
	
WEST_DiveTurn1:		//1ﾀｰﾝ目
	CHAR_SET	WAZACHR_ID_SORA2
	SEPLAY_PAN	SE_W029,WAZA_SE_L
	ADD_ACTOR	DiveHeader,A_UP+2,4, 0,0, 13, 0x0150
	WAIT_FLAG
	SEPLAY_PAN	SE_W291,WAZA_SE_L
	ADD_ACTOR	MizusibukiHeader,A_UP+3,1, 0
	SEQ_CALL	WEST_DiveSub1
	SEQ_CALL	WEST_DiveSub1
	SEQ_CALL	WEST_DiveSub1
	SEQ_CALL	WEST_DiveSub1
	SEQ_CALL	WEST_DiveSub1
	SEQEND

WEST_DiveSub1:
	ADD_ACTOR	SplashHeader,A_UP+5,2, 0,0
	ADD_ACTOR	SplashHeader,A_UP+5,2, 1,0
	END_CALL

WEST_DiveTurn2:		//2ﾀｰﾝ目
	CHAR_SET	WAZACHR_ID_MIZUHIT
	CHAR_SET	WAZACHR_ID_MIZU2
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W153,WAZA_SE_R
	ADD_ACTOR	MizusibukiHeader,D_UP+3,1, 1
	SEQ_CALL	WEST_DiveSub2
	SEQ_CALL	WEST_DiveSub2
	SEQ_CALL	WEST_DiveSub2
	SEQ_CALL	WEST_DiveSub2
	SEQ_CALL	WEST_DiveSub2
	WAIT		12
	SEQ_CALL	WEST_TakiSub
	WAIT_FLAG
	POKE_BANISH_OFF	0
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND
	
WEST_DiveSub2:
	ADD_ACTOR	SplashHeader,D_UP+5,2, 0,1
	ADD_ACTOR	SplashHeader,D_UP+5,2, 1,1
	END_CALL

@======================================================
@	350 ロックブラスト
@======================================================
WEST_RockBlast:
	CHAR_SET	WAZACHR_ID_IWA
	CHAR_SET	WAZACHR_ID_HITMARK
	ADD_ACTOR	ActTaiatariHeader,PRI2,2,4,6
	WAIT		3
	SEPLAY_PAN	SE_W207,WAZA_SE_L
	ADD_ACTOR	ActRockBlastHeader,D_UP+2,6,	16,0,0,0,25,0x0101
	WAIT_FLAG
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 0,0,1,1
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	ADD_ACTOR	ActIwaKudakiSubHeader,D_UP+2,6, 0,0, 20,24, 14, 2
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,5,1
	ADD_ACTOR	ActIwaKudakiSubHeader,D_UP+2,6, 5,0, -20,24, 14, 1
	ADD_ACTOR	ActIwaKudakiSubHeader,D_UP+2,6, 0,5, 20,-24, 14, 2
	ADD_ACTOR	ActIwaKudakiSubHeader,D_UP+2,6, -5,0, -20,-24, 14, 2

	WAIT_FLAG
	SEQEND

@======================================================
@	315	オーバーヒート
@======================================================
WEST_OverHeat:
	CHAR_SET	WAZACHR_ID_FIRE
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
	BLDALPHA_SET	0xc,0x12
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1, 0,5,0x1c
	WAIT_FLAG	
	ADD_TASK	TaskWazaEffectPalPush,PRI5,2,0,1
	WAIT		1
	ADD_TASK	TaskWazaEffectPalMoveTrans,PRI5,1,0			//背景を赤くフェードさせた後、パレットを保存して赤いままにしてしまう
	WAIT		1
	SEPLAY_PAN	SE_W082,WAZA_SE_L
	ADD_TASK	TaskWazaEffectPalPush,PRI5,2,1,0
	WAIT		1
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 2,1, 0,13,0x1c
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 0,2,0,15,1
	WAIT_FLAG
	SEPLAY_PAN	SE_W172B,WAZA_SE_L
	ADD_ACTOR	ActOverHeatHeader,A_UP+2,5,	1,  0,30,25,-20
	ADD_ACTOR	ActOverHeatHeader,A_UP+2,5,	1, 32,30,25,-20
	ADD_ACTOR	ActOverHeatHeader,A_UP+2,5,	1, 64,30,25,-20
	ADD_ACTOR	ActOverHeatHeader,A_UP+2,5,	1, 96,30,25,-20
	ADD_ACTOR	ActOverHeatHeader,A_UP+2,5,	1,128,30,25,-20
	ADD_ACTOR	ActOverHeatHeader,A_DOWN+2,5,	1,160,30,25,-20
	ADD_ACTOR	ActOverHeatHeader,A_DOWN+2,5,	1,192,30,25,-20
	ADD_ACTOR	ActOverHeatHeader,A_DOWN+2,5,	1,224,30,25,-20
	WAIT		5
	ADD_ACTOR	ActOverHeatHeader,A_UP+2,5,	1,  0,30,25,0
	ADD_ACTOR	ActOverHeatHeader,A_UP+2,5,	1, 32,30,25,0
	ADD_ACTOR	ActOverHeatHeader,A_UP+2,5,	1, 64,30,25,0
	ADD_ACTOR	ActOverHeatHeader,A_UP+2,5,	1, 96,30,25,0
	ADD_ACTOR	ActOverHeatHeader,A_UP+2,5,	1,128,30,25,0
	ADD_ACTOR	ActOverHeatHeader,A_DOWN+2,5,	1,160,30,25,0
	ADD_ACTOR	ActOverHeatHeader,A_DOWN+2,5,	1,192,30,25,0
	ADD_ACTOR	ActOverHeatHeader,A_DOWN+2,5,	1,224,30,25,0
	WAIT		5
	ADD_ACTOR	ActOverHeatHeader,A_UP+2,5,	1,  0,30,25,10
	ADD_ACTOR	ActOverHeatHeader,A_UP+2,5,	1, 32,30,25,10
	ADD_ACTOR	ActOverHeatHeader,A_UP+2,5,	1, 64,30,25,10
	ADD_ACTOR	ActOverHeatHeader,A_UP+2,5,	1, 96,30,25,10
	ADD_ACTOR	ActOverHeatHeader,A_UP+2,5,	1,128,30,25,10
	ADD_ACTOR	ActOverHeatHeader,A_DOWN+2,5,	1,160,30,25,10
	ADD_ACTOR	ActOverHeatHeader,A_DOWN+2,5,	1,192,30,25,10
	ADD_ACTOR	ActOverHeatHeader,A_DOWN+2,5,	1,224,30,25,10
	WAIT		5
	WAIT_FLAG	
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, -5,3,1,0
	SEPLAY_PAN	SE_W007,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,10,0,25,1
	WAIT		6
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 8,-5,1,0
	SEPLAY_PAN	SE_W007,WAZA_SE_R
	WAIT		8
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 10,10,1,0
	SEPLAY_PAN	SE_W007,WAZA_SE_R
	WAIT		8
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 0,0,1,0
	SEPLAY_PAN	SE_W007,WAZA_SE_R

	ADD_TASK	TaskWazaEffectPalMoveTrans,PRI5,1,1
	WAIT		1
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 2,-1, 0,13,0x4a52

	ADD_TASK	TaskPokeBuruburu,PRI5,5, 0,3,0,15,1
	WAIT_FLAG

	ADD_TASK	TaskWazaEffectPalPop,PRI5,2,0,1				//赤いままにしていた背景のパレットを戻す
	WAIT		1
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1, 5,0,0x1c
	WAIT_FLAG	


	POKEBG_RESET	3
	BLDALPHA_RESET
	WAIT_FLAG
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1+2,0, 0,11,0x4a52
//	WAIT_FLAG	
	WAIT		15
	ADD_TASK	TaskWazaEffectPalPop,PRI5,2,1,0
	WAIT		1
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 2,0, 13,0,0x4a52
	WAIT_FLAG	
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,0, 11,0,0x4a52
//	WAIT_FLAG	
	
	SEQEND

@======================================================
@	308	ハイドロカノン
@======================================================
WEST_HydroCanon:
	CHAR_SET	WAZACHR_ID_HAIDORO
	CHAR_SET	WAZACHR_ID_MIZUHIT
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W057,WAZA_SE_L
	ADD_ACTOR	ActHydroCanonHeader,D_UP+2,0
	WAIT		10
	ADD_TASK	WazaTaskColorReversal,PRI2,3, 0x0101,0x0101,0x0101	//add test
	WAIT		30
//	WAIT		10
	SEPAN_FLOW	SE_W056,WAZA_SE_L,WAZA_SE_R,2,0
	SEQ_CALL	WEST_HydroCanonSub
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,10,0,40,1
	ADD_ACTOR	ActMizuHitHeader,D_UP+2,4, 0,0,1,0
	SEQ_CALL	WEST_HydroCanonSub
	ADD_ACTOR	ActMizuHitHeader,D_UP+2,4, 0,0,1,0
	SEQ_CALL	WEST_HydroCanonSub
	ADD_ACTOR	ActMizuHitHeader,D_UP+2,4, 0,0,1,0
	SEQ_CALL	WEST_HydroCanonSub
	ADD_ACTOR	ActMizuHitHeader,D_UP+2,4, 0,0,1,0
	SEQ_CALL	WEST_HydroCanonSub
	ADD_ACTOR	ActMizuHitHeader,D_UP+2,4, 0,0,1,0
	SEQ_CALL	WEST_HydroCanonSub
	ADD_ACTOR	ActMizuHitHeader,D_UP+2,4, 0,0,1,0
	WAIT_FLAG
	ADD_TASK	WazaTaskColorReversal,PRI2,3, 0x0101,0x0101,0x0101	//add test
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	
	SEQEND

WEST_HydroCanonSub:
	ADD_ACTOR	ActHydroCanonHeader2,D_UP+2,6,	10,-10,0,0,15,0x0101
	WAIT		1
	ADD_ACTOR	ActHydroCanonHeader2,D_UP+2,6,	10,-10,0,0,15,0x0101
	WAIT		1
	ADD_ACTOR	ActHydroCanonHeader2,D_UP+2,6,	10,-10,0,0,15,0x0101
	WAIT		1
	ADD_ACTOR	ActHydroCanonHeader2,D_UP+2,6,	10,-10,0,0,15,0x0101
	WAIT		1
	ADD_ACTOR	ActHydroCanonHeader2,D_UP+2,6,	10,-10,0,0,15,0x0101
	END_CALL


@======================================================
@	310 おどろかす
@======================================================
WEST_Odorokasu:
	CHAR_SET	WAZACHR_ID_SPLASH
	SEPLAY_PAN	SE_W227,WAZA_SE_L
	ADD_ACTOR	ActTaiatariHeader,PRI2,2,4,6
	WAIT		25
	ADD_ACTOR	SplashHeader,D_UP+5,2, 0,1
	SEPLAY_PAN	SE_W166,WAZA_SE_R
	ADD_ACTOR	SplashHeader,D_UP+5,2, 1,1
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,4,0,5,1
	ADD_TASK	PokeBikkuri,PRI3,0
	WAIT_FLAG
	SEQEND


@======================================================
@	69 ちきゅうなげ
@======================================================
WEST_TikyuuNage:
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_IWA
	WORK_SET	7,0				//ワーククリア
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	WAIT_FLAG
	ADD_TASK	TaskTikyuunageCheck,PRI3,0		@レベルによって分岐
	WAIT		1
	HAIKEI_CHG	WAZAMAP_ID_TATE
	HAIKEI_HALF_WAIT
	ADD_TASK		SeqWazaTaskTikyuuNageInit,PRI3,0
	SEPLAY_PAN		SE_W327,0
	HAIKEI_CHG_WAIT
	WAIT_FLAG
	ADD_TASK		SeqWazaTaskTikyuuNage2,PRI3,0
	WORKCHK_JP	7,0,WEST_TikyuuNageJump0
	WORKCHK_JP	7,1,WEST_TikyuuNageJump1
	WORKCHK_JP	7,2,WEST_TikyuuNageJump2

WEST_TikyuuNageReturn:
	HAIKEI_RECOVER
	HAIKEI_HALF_WAIT
	WORK_SET	7,0x0fff	//背景のｽｸﾛｰﾙ終了
	HAIKEI_CHG_WAIT
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

WEST_TikyuuNageJump0:							@ﾚﾍﾞﾙ33まで
//	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5,	0,20,8,1,2
//	WAIT		16
	SEQ_CALL	WEST_TikyuuNageHit1
	WAIT		16
	SEQ_CALL	WEST_TikyuuNageHit2
//	WAIT_FLAG
	SEQ_JP		WEST_TikyuuNageReturn

WEST_TikyuuNageJump1:							@ﾚﾍﾞﾙ66まで
//	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5,	0,20,8,2,3
//	WAIT		12
	SEQ_CALL	WEST_TikyuuNageHit1
	WAIT		14
	SEQ_CALL	WEST_TikyuuNageHit2
	WAIT		14
	SEQ_CALL	WEST_TikyuuNageHit1
	SEQ_JP		WEST_TikyuuNageReturn

WEST_TikyuuNageJump2:							@ﾚﾍﾞﾙ66以上
//	ADD_TASK	TaskPokeKurukuruFlip,PRI2,5,	0,20,8,3,4
//	WAIT		10
	SEQ_CALL	WEST_TikyuuNageHit2
	WAIT		10
	SEQ_CALL	WEST_TikyuuNageHit1
	WAIT		10
	SEQ_CALL	WEST_TikyuuNageHit2
	WAIT		10
	SEQ_CALL	WEST_TikyuuNageHit1
	SEQ_JP		WEST_TikyuuNageReturn

WEST_TikyuuNageHit1:
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, -10,-8,1,1
	SEPLAY_PAN	SE_W070,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,0,3,5,1
	ADD_ACTOR	ActIwaKakeraHeader,D_UP+2,4,	-12,27,2,3
	ADD_ACTOR	ActIwaKakeraHeader,D_UP+2,4,	  8,28,3,4
	ADD_ACTOR	ActIwaKakeraHeader,D_UP+2,4,	 -4,30,2,3
	ADD_ACTOR	ActIwaKakeraHeader,D_UP+2,4,	 12,25,4,4
	END_CALL

WEST_TikyuuNageHit2:
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 10,-8,1,1
	SEPLAY_PAN		SE_W088,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,0,3,5,1
	ADD_ACTOR	ActIwaKakeraHeader,D_UP+2,4,	-12,32,3,4
	ADD_ACTOR	ActIwaKakeraHeader,D_UP+2,4,	  8,31,2,2
	ADD_ACTOR	ActIwaKakeraHeader,D_UP+2,4,	 -4,28,2,3
	ADD_ACTOR	ActIwaKakeraHeader,D_UP+2,4,	 12,30,4,3
	END_CALL

@======================================================
@	マジックコート
@======================================================
#define MAGICCORT_ANMWAIT	5
WEST_MagicCort:
	CHAR_SET	WAZACHR_ID_MIRROR4
//	POKEBG		2
	BLDALPHA_SET	0,16
	SE_WAITPLAY	SE_W112,WAZA_SE_L,15
	ADD_ACTOR	ActMirror4Header,A_UP+3,3, 40,0,WAZACHR_ID_MIRROR4
	WAIT_FLAG
	WAIT		1	//ｳｪｲﾄを入れておかないと↓でｱｸﾀｰが消える前にALPHAをいじられてしまう
//	POKEBG_RESET	2
	BLDALPHA_RESET
	SEQEND

@======================================================
@	352  みずのはどう
@======================================================
WEST_MizunoHadou:
	CHAR_SET	WAZACHR_ID_MIZU2
	CHAR_SET	WAZACHR_ID_MIZUONPA
	POKEBG		1
	BGPRI_GAPSET	BG_DEFENCE
	SEPLAY_PAN	SE_W145C,WAZA_SE_L
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,0, 0,7,0x7320
	WAIT 		10
	ADD_ACTOR	ActMizuAwaHeader,A_DOWN+2,7,	100,100, 8,1,20,40,0
	ADD_ACTOR	ActMizuAwaHeader,A_DOWN+2,7,	 20,100,16,2,10,35,1
	ADD_ACTOR	ActMizuAwaHeader,A_DOWN+2,7,	200, 80, 8,1,40,20,0
	ADD_ACTOR	ActMizuAwaHeader,A_DOWN+2,7,	 80, 60,10,3,20,50,0
	ADD_ACTOR	ActMizuAwaHeader,A_DOWN+2,7,	140,100,16,1,20,30,1
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	WAIT_FLAG
	SEPLAY_PAN	SE_W202,WAZA_SE_L
	ADD_ACTOR	ActMizunoHadouHeader,D_UP+2,4,	0,0,40,15
	WAIT 		5
	SEPLAY_PAN	SE_W202,WAZA_SE_L
	ADD_ACTOR	ActMizunoHadouHeader,D_UP+2,4,	0,0,40,15
	WAIT 		5
	SEPLAY_PAN	SE_W202,WAZA_SE_L
	ADD_ACTOR	ActMizunoHadouHeader,D_UP+2,4,	0,0,40,15
	WAIT		13
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,0,8,18,1
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1, 7,0,0x7320
	WAIT_FLAG
	POKEBG_RESET	3
	SEQEND

@======================================================
@	サイコブースト
@======================================================
WEST_SaicoBoost:
	CHAR_SET	WAZACHR_ID_JUUDEN2
	POKEBG		2

//	SEQ_CALL	WEST_ESP_MAPCHG
	HAIKEI_CHG	WAZAMAP_ID_UNEUNE
	HAIKEI_HALF_WAIT
	ADD_TASK	UneunePalAnmTwinTask,PRI5,0
	HAIKEI_CHG_WAIT

	WAIT		6
	
	ADD_TASK	WazaTaskColorFade,PRI2,6, 1,2,8, 0,10, 0x0000
	WAIT		0
	BGPRI_GAPSET	BG_ATTACK
	BLDALPHA_SET	0x8,0x8
	WAIT		10
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 0,3,0,240,0
	SE_REPEAT	SE_W060B,WAZA_SE_L,14,10
	ADD_ACTOR	SaicoBoostHeader,A_UP+2,0
	WAIT		110
	SE_REPEAT	SE_W060B,WAZA_SE_L,7,10
	WAIT_FLAG
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,-8,1,24,1
	SEPLAY_PAN	SE_W043,WAZA_SE_R,
	WAIT_FLAG
	POKEBG_RESET	2
	BLDALPHA_RESET

//	WAIT		1
//	ADD_TASK	StatusEffectTask,PRI2,5	1,5,0,0,1
//	WAIT_FLAG
	SEQ_CALL	WEST_ESP_MAPEND
	SEQEND


@======================================================
@	282  はたきおとす
@======================================================
WEST_HatakiOtosu:
//	CHAR_SET	WAZACHR_ID_FUKURO3
	CHAR_SET	WAZACHR_ID_HATAKU2
	CHAR_SET	WAZACHR_ID_HITMARK
	ADD_ACTOR	ActTaiatariHeader,PRI2,2,4,6
	WAIT		4
	SEPLAY_PAN	SE_W233,WAZA_SE_R
	ADD_ACTOR	ActHatakiOtosuHeader,D_UP+2,2,	-16,-16
	WAIT		8
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 0x1f,5,1,0x7fff,10,0,0
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 0,0,1,2
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 1,-12,10,0,3
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,5
	WAIT		3
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 1,0,3,6,1
	WAIT		5
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 1,0,6
	WAIT		10
//	ADD_ACTOR	ActOutFukuroHeader,D_UP+2,0
	WAIT_FLAG
	SEQEND


@======================================================
@	353 はめつのねがい
@======================================================
WEST_HametunoNegai:
	ADD_TASK	TaskHametunoNegaiCheck,PRI2,0
	WAIT		1

	//2ﾀｰﾝ目はFightEffectで出るようになったので 2002.08.30(金) by matsuda
//	WORKCHK_JP	7,0,WEST_HametunoNegaiJump0		@1ターン目2ターン目は待機
//	WORKCHK_JP	7,1,WEST_HametunoNegaiJump1		@3ターン目に攻撃


WEST_HametunoNegaiJump0:
	POKEBG		2

	ADD_TASK	PokeMonotoneTask,PRI5,2, 1,0

	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1, 0,4,0x0
	WAIT_FLAG
	BLDALPHA_SET	0x8,0x8
	SEPLAY_PAN	SE_W060,WAZA_SE_L
	ADD_TASK	PokeKakusyukuTask,PRI5,5, MIRAI_ATTACK_AFF,MIRAI_ATTACK_AFF,15,0,1
	WAIT_FLAG
	WAIT		20
	ADD_TASK	PokeMonotoneTask,PRI5,2, 1,1
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1, 4,0,0x0
	WAIT_FLAG
	POKEBG_RESET	2
	BLDALPHA_RESET
	
	SEQEND

//2ﾀｰﾝ目はFightEffectで出るようになったので、ｴﾌｪｸﾄの修正はFightEffectの方を。
WEST_HametunoNegaiJump1:
	CHAR_SET	WAZACHR_ID_DAIBAKUHATU
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,3, 0,16,0x7fff
	WAIT_FLAG
	WAIT		10
	ADD_TASK	HametunoNegaiTask,PRI5,0
	WAIT		5
	SEPLAY_PAN	SE_W109,WAZA_SE_L
	WAIT		10
	SEPLAY_PAN	SE_W109,0
	WAIT		10
	SEPLAY_PAN	SE_W109,WAZA_SE_R
	WAIT		23
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 1,10,0,20,1
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, 0,0, 1,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, 24,-24, 1,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, -16,16, 1,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, -24,-12, 1,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, 16,16, 1,1
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,3, 16,0,0x7fff
	WAIT_FLAG
	
	SEQEND


@======================================================
@	スカイアッパー
@======================================================
#define SKYUPPER_WAIT	40
#define SKYHIT_WAIT		1
WEST_SkyUpper:
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG			3
	BGPRI_GAPSET	BG_DEFENCE

	HAIKEI_CHG	WAZAMAP_ID_TATE
	HAIKEI_HALF_WAIT
	SEPLAY_PAN	SE_W327,WAZA_SE_L
	ADD_TASK	SkyUpperHaikeiScrollTask,PRI5,1, SKYUPPER_WAIT+15
	HAIKEI_CHG_WAIT

	BLDALPHA_SET	0xc,0x8
	WAIT		SKYUPPER_WAIT - WAIT_OFFSET
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 0,28,0,0,5
	WAIT		4
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,4,0,6,1
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, -28,28, 1,1
	WAIT		SKYHIT_WAIT
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, -15,8, 1,1
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	WAIT		SKYHIT_WAIT
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, -5,-12, 1,1
	WAIT		SKYHIT_WAIT
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 0,-32, 1,1
	WAIT		SKYHIT_WAIT
	SEPLAY_PAN	SE_W233B,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 5,-52, 1,1
	ADD_ACTOR	ActPokeStraightMoveHeader,A_UP+2,5, 1,-26,16,1,4
	WAIT		4
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 1,0,3,6,1
	WAIT		30
	
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 0,0,6
	WAIT		4
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP+2,3, 1,0,6
	POKEBG_RESET	3
	BLDALPHA_RESET

	HAIKEI_RECOVER
	HAIKEI_HALF_WAIT
	WORK_SET	7,0xffff	//背景のｽｸﾛｰﾙ終了
	HAIKEI_CHG_WAIT
	SEQEND

@======================================================
@	ひみつのちから
@======================================================
WEST_HimitunoTikara:
	ADD_TASK	WorkSetGroundNo,PRI5,0
	WORKCHK_JP	0,GROUND_KUSA, WEST_NeedleArm
	WORKCHK_JP	0,GROUND_LONGKUSA, WEST_MagicalReef
	WORKCHK_JP	0,GROUND_SUNA, WEST_MaddoSyotto
	WORKCHK_JP	0,GROUND_MIZU, WEST_Taki
	WORKCHK_JP	0,GROUND_UMI, WEST_Naminori
	WORKCHK_JP	0,GROUND_IKE, WEST_BaburuKousen
	WORKCHK_JP	0,GROUND_IWA, WEST_IwaOtosi
	WORKCHK_JP	0,GROUND_DOUKUTSU, WEST_Kamituku
	WORKCHK_JP	0,GROUND_ROOM, WEST_Kairiki
	SEQ_JP		WEST_Tataki		//GROUND_ALL


@======================================================
@	239 たつまき
@======================================================
WEST_Tatumaki:
	CHAR_SET	WAZACHR_ID_HAPPA
	CHAR_SET	WAZACHR_ID_HITMARK
	CHAR_SET	WAZACHR_ID_IWA
	POKEBG			3
	BGPRI_GAPSET	BG_DEFENCE

	SEPLAY_PAN	SE_W239,WAZA_SE_R
	ADD_ACTOR	ActTatumakiHappaHeader,D_UP+2,5,	120,70,5,70,30
	WAIT		1
	ADD_ACTOR	ActTatumakiHappaHeader,D_UP+2,5,	115,55,6,60,25
	WAIT		1
	ADD_ACTOR	ActTatumakiHappaHeader,D_UP+2,5,	115,60,7,60,30
	ADD_ACTOR	ActTatumakiHappaHeader,D_UP+2,5,	115,55,10,60,30
	WAIT		3
	ADD_ACTOR	ActTatumakiIwaHeader,D_UP+2,5,		100,50,4,50,26
	WAIT		1
	ADD_ACTOR	ActTatumakiHappaHeader,D_UP+2,5,	105,25,8,60,20
	WAIT		1
	ADD_ACTOR	ActTatumakiHappaHeader,D_UP+2,5,	115,40,10,48,30
	WAIT		3
	ADD_ACTOR	ActTatumakiIwaHeader,D_UP+2,5,		120,30,6,45,25
	ADD_ACTOR	ActTatumakiHappaHeader,D_UP+2,5,	115,35,10,60,30
	WAIT		3
	ADD_ACTOR	ActTatumakiIwaHeader,D_UP+2,5,		105,20,8,40,0
	WAIT		3
	ADD_ACTOR	ActTatumakiHappaHeader,D_UP+2,5,	20,255,15,32,0
	ADD_ACTOR	ActTatumakiHappaHeader,D_UP+2,5,	110,10,8,32,20
	
	WAIT_FLAG

	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, -32,-16, 1,3
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 1,3,0,12,1
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 3,3,0,12,1
	WAIT		4
	ADD_ACTOR	ActRandomHitMarkHeader,D_UP+3,2,  1,3
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	WAIT		4
	ADD_ACTOR	ActRandomHitMarkHeader,D_UP+3,2,  1,3
	SEPLAY_PAN	SE_W004,WAZA_SE_R
	WAIT		4
	ADD_ACTOR	ActHitMarkHeader,D_UP+3,4, 32, 20, 1,3
	SEPLAY_PAN	SE_W004,WAZA_SE_R

	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	
	SEQEND

@======================================================
@	マジカルリーフ
@======================================================
#define MAGICAL_SYNC	32
#define MAGICAL_WAIT			2
WEST_MagicalReef:
	CHAR_SET	WAZACHR_ID_HAPPA
	CHAR_SET	WAZACHR_ID_HAPPACUTTER
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		3
//	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	WAIT		1
	SE_REPEAT	SE_W077,WAZA_SE_L,10,5
	ADD_TASK	MagicalReefColorTask,PRI5,0
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,-3,-2,10
	WAIT		MAGICAL_WAIT
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,-1,-1,15
	WAIT		MAGICAL_WAIT
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,-4,-4,7
	WAIT		MAGICAL_WAIT
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,3,-3,11
	WAIT		MAGICAL_WAIT
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,-1,-6,8
	WAIT		MAGICAL_WAIT
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,2,-1,12
	WAIT		MAGICAL_WAIT
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,-3,-4,13
	WAIT		MAGICAL_WAIT
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,4,-5,7
	WAIT		MAGICAL_WAIT
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,2,-6,11
	WAIT		MAGICAL_WAIT
	ADD_ACTOR	ActHappaHeader,A_UP+2,3,-3,-5,8
	WAIT		60
	SEPLAY_PAN	SE_W013B,WAZA_SE_L
	ADD_ACTOR	ActHappaCutterHeader,D_UP+3,7, 20,-10, 20,0, MAGICAL_SYNC, 20,0
	ADD_ACTOR	ActHappaCutterHeader,D_UP+3,7, 20,-10, 20,0, MAGICAL_SYNC, -20,0
	WAIT		MAGICAL_SYNC - 2
	SEPLAY_PAN	SE_W013,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,D_UP+4,4, -10,-4,1,2
	ADD_ACTOR	ActHitMarkHeader,D_UP+4,4, 10,4,1,2
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,8,1
	WAIT		20
	WORK_SET	7,0xffff	//葉っぱのｶﾗｰｱﾆﾒ終了
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

@======================================================
@	アイスボール
@======================================================
#define ICEBALL_SYNC	30
WEST_IceBall:
	CHAR_SET	WAZACHR_ID_ICE
	CHAR_SET	WAZACHR_ID_YUKI2
	
	ADD_TASK	IceBallTurnWorkSet,PRI5,1, 0
	WORKCHK_JP	0,4, WEST_IceBallLastTurnHaikeiIN
WEST_IceBallReturnIN:
	SEPLAY_PAN	SE_W196,WAZA_SE_L
	ADD_ACTOR	IceBallHeader,D_UP+2,6, 15,0,-12,-16, ICEBALL_SYNC,-40
	WAIT		ICEBALL_SYNC - WAIT_OFFSET
	SEPLAY_PAN	SE_W280,WAZA_SE_R
//	ADD_TASK	TaskPokeDamageYure, PRI2,5, 0,1,8,1,0,
	ADD_TASK	IceBallTurnWorkSet,PRI5,1, 0
	WORKCHK_JP	0,0, WEST_IceCrashTurn0
	WORKCHK_JP	0,1, WEST_IceCrashTurn1
	WORKCHK_JP	0,2, WEST_IceCrashTurn2
	WORKCHK_JP	0,3, WEST_IceCrashTurn3
	WORKCHK_JP	0,4, WEST_IceCrashTurn4
WEST_IceCrashReturn:
	ADD_TASK	IceBallTurnWorkSet,PRI5,1, 0
	WORKCHK_JP	0,4, WEST_IceBallLastTurnHaikeiOUT
WEST_IceBallReturnOUT:
	SEQEND


WEST_IceBallLastTurnHaikeiIN:	//背景IN
	HAIKEI_CHG	WAZAMAP_ID_ICE
	SEQ_JP		WEST_IceBallReturnIN

WEST_IceBallLastTurnHaikeiOUT:	//背景OUT
	HAIKEI_CHG_WAIT
	WAIT		45
	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
	SEQ_JP		WEST_IceBallReturnOUT

WEST_IceCrashTurn0:
	ADD_TASK	TaskPokeDamageYure, PRI2,5, 0,1,8,1,0,
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_JP		WEST_IceCrashReturn

WEST_IceCrashTurn1:
	ADD_TASK	TaskPokeDamageYure, PRI2,5, 0,1,10,1,0,
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_JP		WEST_IceCrashReturn

WEST_IceCrashTurn2:
	ADD_TASK	TaskPokeDamageYure, PRI2,5, 0,1,14,1,0,
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_JP		WEST_IceCrashReturn

WEST_IceCrashTurn3:
	ADD_TASK	TaskPokeDamageYure, PRI2,5, 0,1,18,1,0,
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_JP		WEST_IceCrashReturn
WEST_IceCrashTurn4:
	ADD_TASK	TaskPokeDamageYure, PRI2,5, 0,1,30,1,0,
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_CALL	WEST_IceCrashSub
	SEQ_JP		WEST_IceCrashReturn

WEST_IceCrashSub:
	ADD_ACTOR	IceCrashHeader,D_UP+4,2, -12,-16
	END_CALL

@======================================================
@	311 ウェザーボール
@======================================================
WEST_WeatherBall:
	CHAR_SET	WAZACHR_ID_WBALL
	ADD_ACTOR	ActHaneruHeader,A_UP+2,3,	8,1,0
	WAIT		8
	SEPLAY_PAN	SE_W207,WAZA_SE_L
	ADD_ACTOR	ActMoveTama3Header,A_UP+2,0
	WAIT_FLAG	
	WAIT		15
	SEPLAY_PAN	SE_W197,0
	ADD_ACTOR	ActFlashHeader,A_UP+2,7, 0x1f,5,1,0x7fff,10,0,0
	WAIT_FLAG	
	ADD_TASK	TaskWeatherBallCheck,PRI2,0
	WAIT		1
	WORKCHK_JP	7,0,WEST_WeatherBallJump0		@天気なし
	WORKCHK_JP	7,1,WEST_WeatherBallJump1		@はれ
	WORKCHK_JP	7,2,WEST_WeatherBallJump2		@あめ
	WORKCHK_JP	7,3,WEST_WeatherBallJump3		@すなあらし
	WORKCHK_JP	7,4,WEST_WeatherBallJump4		@あられ
	

	
WEST_WeatherBallJump0:
	CHAR_SET	WAZACHR_ID_HITMARK
	ADD_ACTOR	ActMoveTama4Header,D_UP+2,6,		-30,-100,25,1,0,0
	WAIT_FLAG	
	SEPLAY_PAN	SE_W025B,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,D_UP+4,4, -10,0,1,2
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,0,3,8,1
	WAIT_FLAG	
	SEQEND		

WEST_WeatherBallJump1:
	CHAR_SET	WAZACHR_ID_FIRE
	ADD_ACTOR	ActWeatherFireHeader,D_UP+2,6,		-30,-100,25,1, 40,10
	SEPLAY_PAN	SE_W172,WAZA_SE_R
	WAIT		10
	ADD_ACTOR	ActWeatherFireHeader,D_UP+2,6,		-30,-100,25,1,-40,20
	SEPLAY_PAN	SE_W172,WAZA_SE_R
	WAIT		10
	ADD_ACTOR	ActWeatherFireHeader,D_UP+2,6,		-30,-100,25,1,0,0
	SEPLAY_PAN	SE_W172,WAZA_SE_R
	WAIT_FLAG	
	SEPLAY_PAN	SE_W172B,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,0,3,8,1
	WAIT_FLAG	
	SEQEND		

WEST_WeatherBallJump2:
	CHAR_SET	WAZACHR_ID_MIZU2
	ADD_ACTOR	ActWeatherMizuHeader,D_UP+2,6,		-30,-100,25,1,50,10
	SEPLAY_PAN	SE_W152,WAZA_SE_R
	WAIT		8
	ADD_ACTOR	ActWeatherMizuHeader,D_UP+2,6,		-30,-100,25,1,-20,20
	SEPLAY_PAN	SE_W152,WAZA_SE_R
	WAIT		13
	ADD_ACTOR	ActWeatherMizuHeader,D_UP+2,6,		-30,-100,25,1,0,0
	SEPLAY_PAN	SE_W152,WAZA_SE_R
	WAIT_FLAG	
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,0,3,8,1
	SEPLAY_PAN	SE_W202,WAZA_SE_R
	WAIT_FLAG	
	SEQEND		

WEST_WeatherBallJump3:
	CHAR_SET	WAZACHR_ID_IWA
	ADD_ACTOR	ActWeatherIwaHeader,D_UP+2,6,		-30,-100,25,1,30,0
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	WAIT		5
	ADD_ACTOR	ActWeatherIwaHeader,D_UP+2,6,		-30,-100,25,1,-40,20
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	WAIT		14
	ADD_ACTOR	ActWeatherIwaHeader,D_UP+2,6,		-30,-100,25,1,0,0
	SEPLAY_PAN	SE_W088,WAZA_SE_R
	WAIT_FLAG	
	SEPLAY_PAN	SE_W070,WAZA_SE_R
	ADD_ACTOR	ActIwaKakeraHeader,D_UP+2,4,	-12,27,2,3
	ADD_ACTOR	ActIwaKakeraHeader,D_UP+2,4,	  8,28,3,4
	ADD_ACTOR	ActIwaKakeraHeader,D_UP+2,4,	 -4,30,2,3
	ADD_ACTOR	ActIwaKakeraHeader,D_UP+2,4,	 12,25,4,4
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,8,1
	WAIT_FLAG	
	SEQEND		

WEST_WeatherBallJump4:
	CHAR_SET	WAZACHR_ID_ARALE
	CHAR_SET	WAZACHR_ID_YUKI2
	ADD_ACTOR	ActWeatherArareHeader,D_UP+2,6,		-30,-100,25,25,-40,20
	SEPLAY_PAN	SE_W258,WAZA_SE_R
	WAIT		10
	ADD_ACTOR	ActWeatherArareHeader,D_UP+2,6,		-30,-100,25,25,40,0
	SEPLAY_PAN	SE_W258,WAZA_SE_R
	WAIT		10
	ADD_ACTOR	ActWeatherArareHeader,D_UP+2,6,		-30,-100,25,25,0,0
	SEPLAY_PAN	SE_W258,WAZA_SE_R
	WAIT_FLAG	
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,8,1
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	SEQ_CALL	WEST_IceKouka
	WAIT_FLAG	
	SEQEND		
	
@======================================================
@	パーティアタック時の簡易ｴﾌｪｸﾄ
@======================================================
WEST_PartyAttack:
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W003,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,2
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,6,1
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND













//=========================================================================
//	共通シーケンス		SEQ_CALLで呼び出すもの
//=========================================================================

//----------------------------------------------------------
// 追加効果で氷が発生する技の共通ｴﾌｪｸﾄ
//	WAZACHR_ID_YUKI2をキャラセットしておくこと
//----------------------------------------------------------
WEST_IceKouka:
	ADD_ACTOR	ActIceKoukaHeader,D_UP+2,3, -10,-10,0
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	WAIT		4
	ADD_ACTOR	ActIceKouka2Header,D_UP+2,3, 10,20,0
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	WAIT		4
	ADD_ACTOR	ActIceKoukaHeader,D_UP+2,3, -5,10,0
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	WAIT		4
	ADD_ACTOR	ActIceKouka2Header,D_UP+2,3, 17,-12,0
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	WAIT		4
	ADD_ACTOR	ActIceKouka2Header,D_UP+2,3, -15,15,0
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	WAIT		4
	ADD_ACTOR	ActIceKouka2Header,D_UP+2,3, 0,0,0
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	WAIT		4
	ADD_ACTOR	ActIceKoukaHeader,D_UP+2,3, 20,2,0
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	END_CALL

//-- 2体選択Ver --//
WEST_IceKouka2:
	ADD_ACTOR	ActIceKoukaHeader,D_UP+2,3, -10,-10,1
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	WAIT		4
	ADD_ACTOR	ActIceKouka2Header,D_UP+2,3, 10,20,1
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	WAIT		4
	ADD_ACTOR	ActIceKoukaHeader,D_UP+2,3, -29,0,1
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	WAIT		4
	ADD_ACTOR	ActIceKouka2Header,D_UP+2,3, 29,-20,1
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	WAIT		4
	ADD_ACTOR	ActIceKoukaHeader,D_UP+2,3, -5,10,1
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	WAIT		4
	ADD_ACTOR	ActIceKouka2Header,D_UP+2,3, 17,-12,1
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	WAIT		4
	ADD_ACTOR	ActIceKoukaHeader,D_UP+2,3, -20,0,1
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	WAIT		4
	ADD_ACTOR	ActIceKouka2Header,D_UP+2,3, -15,15,1
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	WAIT		4
	ADD_ACTOR	ActIceKouka2Header,D_UP+2,3, 26,-5,1
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	WAIT		4
	ADD_ACTOR	ActIceKouka2Header,D_UP+2,3, 0,0,1
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	WAIT		4
	ADD_ACTOR	ActIceKoukaHeader,D_UP+2,3, 20,2,1
	SEPLAY_PAN	SE_W196,WAZA_SE_R
	END_CALL

//----------------------------------------------------------
//	追加効果で素早さが下がる氷属性の技の共通エフェクト
//		WAZACHR_ID_TURARA
//----------------------------------------------------------
#define ICESPEEDKOUKA_WAIT	4
#define ICESPEEDKOUKA_DY	24//12
WEST_IceSpeedKouka:
	SE_REPEAT	SE_W196,WAZA_SE_R,6,4
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, 0,ICESPEEDKOUKA_DY,0
	WAIT		ICESPEEDKOUKA_WAIT
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, 8,ICESPEEDKOUKA_DY,0
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, -8,ICESPEEDKOUKA_DY,0
	WAIT		ICESPEEDKOUKA_WAIT
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, 16,ICESPEEDKOUKA_DY,0
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, -16,ICESPEEDKOUKA_DY,0
	WAIT		ICESPEEDKOUKA_WAIT
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, 24,ICESPEEDKOUKA_DY,0
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, -24,ICESPEEDKOUKA_DY,0
	WAIT		ICESPEEDKOUKA_WAIT
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, 32,ICESPEEDKOUKA_DY,0
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, -32,ICESPEEDKOUKA_DY,0
	END_CALL

//-- 2体選択モード --//
WEST_IceSpeedKouka2:
	SE_REPEAT	SE_W196,WAZA_SE_R,6,4
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, 0,ICESPEEDKOUKA_DY,1
	WAIT		ICESPEEDKOUKA_WAIT
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, 8,ICESPEEDKOUKA_DY,1
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, -8,ICESPEEDKOUKA_DY,1
	WAIT		ICESPEEDKOUKA_WAIT
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, 16,ICESPEEDKOUKA_DY,1
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, -16,ICESPEEDKOUKA_DY,1
	WAIT		ICESPEEDKOUKA_WAIT
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, 24,ICESPEEDKOUKA_DY,1
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, -24,ICESPEEDKOUKA_DY,1
	WAIT		ICESPEEDKOUKA_WAIT
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, 32,ICESPEEDKOUKA_DY,1
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, -32,ICESPEEDKOUKA_DY,1
	WAIT		ICESPEEDKOUKA_WAIT
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, 40,ICESPEEDKOUKA_DY,1
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, -40,ICESPEEDKOUKA_DY,1
	WAIT		ICESPEEDKOUKA_WAIT
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, 48,ICESPEEDKOUKA_DY,1
	ADD_ACTOR	ActIceSpeedKoukaHeader,D_UP+2,3, -48,ICESPEEDKOUKA_DY,1
	END_CALL

//----------------------------------------------------------
//	キラキラ エフェクト
//		WAZACHR_ID_KIRAKIRA2
//----------------------------------------------------------
WEST_Kirakira:
	ADD_ACTOR	ActKirakira2Header,A_UP+2,6, -15,0,0,0x0000,0x0020,60
	WAIT		8
	ADD_ACTOR	ActKirakira2Header,A_UP+2,6, 12,-5,0,0x0000,0x0020,60
	WAIT		8
	END_CALL

//----------------------------------------------------------
//	回復時などのキラキラ
//		WAZACHR_ID_PIKARI
//----------------------------------------------------------
//-- AttackNo側に出す --//
WEST_Pikari:
WEST_PikariAttack:
	SEPLAY_PAN	SE_W071B,WAZA_SE_L
	ADD_ACTOR	ActPikariHeader,A_UP+2,4,0,-5,0,0
	WAIT	7
	ADD_ACTOR	ActPikariHeader,A_UP+2,4,-15,10,0,0
	WAIT	7
	ADD_ACTOR	ActPikariHeader,A_UP+2,4,-15,-15,0,0
	WAIT	7
	ADD_ACTOR	ActPikariHeader,A_UP+2,4,10,-5,0,0
	WAIT	7
	END_CALL

//-- DefenceNo側に出す --//
WEST_PikariDefence:
	SEPLAY_PAN	SE_W071B,WAZA_SE_R
	ADD_ACTOR	ActPikariHeader,D_UP+2,4,0,-5,1,0
	WAIT	7
	ADD_ACTOR	ActPikariHeader,D_UP+2,4,-15,10,1,0
	WAIT	7
	ADD_ACTOR	ActPikariHeader,D_UP+2,4,-15,-15,1,0
	WAIT	7
	ADD_ACTOR	ActPikariHeader,D_UP+2,4,10,-5,1,0
	WAIT	7
	END_CALL

//----------------------------------------------------------
//	追加効果で毒が発生する技の共通ｴﾌｪｸﾄ
//		WAZACHR_ID_HEDORO
//----------------------------------------------------------
#define DOKUKOUKA_WAIT	6
WEST_DokuKouka:
	ADD_ACTOR	ActDokuKoukaHeader,D_UP+2,3, 10,10,0
	SEPLAY_PAN	SE_W092,WAZA_SE_R
	WAIT		DOKUKOUKA_WAIT
	ADD_ACTOR	ActDokuKoukaHeader,D_UP+2,3, 20,-20,0
	SEPLAY_PAN	SE_W092,WAZA_SE_R
	WAIT		DOKUKOUKA_WAIT
	ADD_ACTOR	ActDokuKoukaHeader,D_UP+2,3, -20,15,0
	SEPLAY_PAN	SE_W092,WAZA_SE_R
	WAIT		DOKUKOUKA_WAIT
	ADD_ACTOR	ActDokuKoukaHeader,D_UP+2,3, 0,0,0
	SEPLAY_PAN	SE_W092,WAZA_SE_R
	WAIT		DOKUKOUKA_WAIT
	ADD_ACTOR	ActDokuKoukaHeader,D_UP+2,3, -20,-20,0
	SEPLAY_PAN	SE_W092,WAZA_SE_R
	WAIT		DOKUKOUKA_WAIT
	ADD_ACTOR	ActDokuKoukaHeader,D_UP+2,3, 16,-8,0
	SEPLAY_PAN	SE_W092,WAZA_SE_R
	END_CALL

//----------------------------------------------------------
//	追加効果で素早さが下がる水系の技の共通ｴﾌｪｸﾄ
//		WAZACHR_ID_MIZU2
//----------------------------------------------------------
#define MIZUKOUKA_WAIT	6
WEST_MizuKouka:
	ADD_ACTOR	ActMizuKoukaHeader,A_UP+2,3, 10,10,0
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	WAIT		MIZUKOUKA_WAIT
	ADD_ACTOR	ActMizuKoukaHeader,A_UP+2,3, 20,-20,0
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	WAIT		MIZUKOUKA_WAIT
	ADD_ACTOR	ActMizuKoukaHeader,A_UP+2,3, -20,15,0
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	WAIT		MIZUKOUKA_WAIT
	ADD_ACTOR	ActMizuKoukaHeader,A_UP+2,3, 0,0,0
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	WAIT		MIZUKOUKA_WAIT
	ADD_ACTOR	ActMizuKoukaHeader,A_UP+2,3, -20,-20,0
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	WAIT		MIZUKOUKA_WAIT
	ADD_ACTOR	ActMizuKoukaHeader,A_UP+2,3, 16,-8,0
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	END_CALL

//-- 2体選択モード --//
WEST_MizuKouka2:
	ADD_ACTOR	ActMizuKoukaHeader,A_UP+2,3, 10,10,1
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	WAIT		MIZUKOUKA_WAIT
	ADD_ACTOR	ActMizuKoukaHeader,A_UP+2,3, -28,-10,1
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	WAIT		MIZUKOUKA_WAIT
	ADD_ACTOR	ActMizuKoukaHeader,A_UP+2,3, 20,-20,1
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	WAIT		MIZUKOUKA_WAIT
	ADD_ACTOR	ActMizuKoukaHeader,A_UP+2,3, -20,15,1
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	WAIT		MIZUKOUKA_WAIT
	ADD_ACTOR	ActMizuKoukaHeader,A_UP+2,3, 0,0,1
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	WAIT		MIZUKOUKA_WAIT
	ADD_ACTOR	ActMizuKoukaHeader,A_UP+2,3, 27,8,1
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	WAIT		MIZUKOUKA_WAIT
	ADD_ACTOR	ActMizuKoukaHeader,A_UP+2,3, -20,-20,1
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	WAIT		MIZUKOUKA_WAIT
	ADD_ACTOR	ActMizuKoukaHeader,A_UP+2,3, 16,-8,1
	SEPLAY_PAN	SE_W145C,WAZA_SE_R
	END_CALL

//----------------------------------------------------------
//	追加効果でマヒの効果がある電気系の技の共通ｴﾌｪｸﾄ
//		WAZACHR_ID_MAHI
//----------------------------------------------------------
#define MAHIKOUKA_DELWAIT	5
#define MAHIKOUKA_WAIT		2
WEST_MahiKouka:
	SEPLAY_PAN	SE_W085B,WAZA_SE_R
	ADD_ACTOR	ActMahiKoukaHeader,D_UP+2,4, 5,0, MAHIKOUKA_DELWAIT,0
	WAIT		MAHIKOUKA_WAIT
	ADD_ACTOR	ActMahiKoukaHeader,D_UP+2,4, -5,10, MAHIKOUKA_DELWAIT,1
	WAIT		MAHIKOUKA_WAIT
	ADD_ACTOR	ActMahiKoukaHeader,D_UP+2,4, 15,20, MAHIKOUKA_DELWAIT,2
	WAIT		MAHIKOUKA_WAIT
	ADD_ACTOR	ActMahiKoukaHeader,D_UP+2,4, -15,-10, MAHIKOUKA_DELWAIT,0
	WAIT		MAHIKOUKA_WAIT
	ADD_ACTOR	ActMahiKoukaHeader,D_UP+2,4, 25,0, MAHIKOUKA_DELWAIT,1
	WAIT		MAHIKOUKA_WAIT
	ADD_ACTOR	ActMahiKoukaHeader,D_UP+2,4, -8,8, MAHIKOUKA_DELWAIT,2
	WAIT		MAHIKOUKA_WAIT
	ADD_ACTOR	ActMahiKoukaHeader,D_UP+2,4, 2,-8, MAHIKOUKA_DELWAIT,0
	WAIT		MAHIKOUKA_WAIT
	ADD_ACTOR	ActMahiKoukaHeader,D_UP+2,4, -20,15, MAHIKOUKA_DELWAIT,1
	END_CALL

//----------------------------------------------------------
//	混乱時の「ひよこ」エフェクト
//		WAZACHR_ID_HIYOKO
//----------------------------------------------------------
WEST_PiyoriEffect:
	SE_REPEAT	SE_W146,WAZA_SE_R,13,6
	ADD_ACTOR	ActHiyokoHeader,D_UP+2,5,0,-15,0,  3,90
	ADD_ACTOR	ActHiyokoHeader,D_UP+2,5,0,-15,51  3,90
	ADD_ACTOR	ActHiyokoHeader,D_UP+2,5,0,-15,102,3,90
	ADD_ACTOR	ActHiyokoHeader,D_UP+2,5,0,-15,153,3,90
	ADD_ACTOR	ActHiyokoHeader,D_UP+2,5,0,-15,204,3,90
	END_CALL

//----------------------------------------------------------
//	背景をエスパー用に切り替え
//----------------------------------------------------------
WEST_ESP_MAPCHG:
	HAIKEI_CHG	WAZAMAP_ID_UNEUNE
	HAIKEI_HALF_WAIT
	ADD_TASK	UneunePalAnmTask,PRI5,0
	HAIKEI_CHG_WAIT
	END_CALL

//----------------------------------------------------------
//	エスパー用背景を元に戻す
//----------------------------------------------------------
WEST_ESP_MAPEND:
	HAIKEI_RECOVER
	HAIKEI_HALF_WAIT
	WORK_SET	7,0xffff	//背景のパレットアニメ終了
	HAIKEI_CHG_WAIT
	END_CALL

//----------------------------------------------------------
//	風背景に切り替え
//----------------------------------------------------------
WEST_KAZE_MAPCHG:
	CONTEST_CHK_JP	WEST_KazeHaikeiContest
	HAIKEI_CHG	WAZAMAP_ID_KAZE
	HAIKEI_HALF_WAIT
	ADD_TASK	HaikeiMapScrTask,PRI5,4, -0x0900,0x0300,1,0xffff
WEST_KazeMapChgRet:
	HAIKEI_CHG_WAIT
	END_CALL

WEST_KazeHaikeiContest:
	HAIKEI_CHG	WAZAMAP_ID_KAZE2
	HAIKEI_HALF_WAIT
	ADD_TASK	HaikeiMapScrTask,PRI5,4, 0x0900,0x0300,0,0xffff
	SEQ_JP	WEST_KazeMapChgRet

//----------------------------------------------------------
//	風背景を元に戻す
//----------------------------------------------------------
WEST_KAZE_MAPEND:
	HAIKEI_RECOVER
	HAIKEI_HALF_WAIT
	WORK_SET	7,0xffff	//背景のｽｸﾛｰﾙ終了
	HAIKEI_CHG_WAIT
	END_CALL

//----------------------------------------------------------
//	ソーラービーム背景に切り替え
//----------------------------------------------------------
WEST_SOLAR_MAPCHG:
	ADD_TASK	ContestChkTask,PRI2,0
	WORKCHK_JP	7,1,WEST_SolarMapContest
	ADD_TASK	TaskAttackOrDefense,PRI2,0
	WORKCHK_JP	7,0,WEST_SolarMapEnemy	@攻撃か防御によってBGを変える	相手
	SEQ_JP		WEST_SolarMapMine	@									自分
WEST_SolarMapChgReturn:
	HAIKEI_CHG_WAIT
	END_CALL

WEST_SolarMapContest:
	HAIKEI_CHG	WAZAMAP_ID_SOLAR2
	SEQ_JP		WEST_SolarMapChgReturn

WEST_SolarMapMine:
	HAIKEI_CHG	WAZAMAP_ID_SOLAR1
	SEQ_JP		WEST_SolarMapChgReturn

WEST_SolarMapEnemy:
	HAIKEI_CHG	WAZAMAP_ID_SOLAR
	SEQ_JP		WEST_SolarMapChgReturn

//----------------------------------------------------------
//	ソーラービーム背景を元に戻す
//----------------------------------------------------------
WEST_SOLAR_MAPEND:
	HAIKEI_RECOVER
	HAIKEI_CHG_WAIT
	END_CALL



















//=========================================================================
//	状態異常エフェクト用に一時的に使用
//=========================================================================
//----------------------------------------------------------
//	毒
//----------------------------------------------------------
WEST_StDoku:
//	CHAR_SET	WAZACHR_ID_HEDORO
//	SEQ_CALL	WEST_DokuKouka
	SE_REPEAT	SE_W092,WAZA_SE_R,13,6
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,1,0,18,2
	ADD_TASK	WazaTaskColorFade,PRI2,6, 2,2,2, 0,12,0x7c1e
	SEQEND

//----------------------------------------------------------
//	混乱
//----------------------------------------------------------
WEST_StKonran:
	CHAR_SET	WAZACHR_ID_HIYOKO
	SEQ_CALL	WEST_PiyoriEffect
	SEQEND
	
//----------------------------------------------------------
//	やけど
//----------------------------------------------------------
WEST_StYakedo:
	CHAR_SET	WAZACHR_ID_FIRE
	SEPLAY_PAN	SE_W172,WAZA_SE_R
	SEQ_CALL	WEST_YakedoSub
	SEQ_CALL	WEST_YakedoSub
	SEQ_CALL	WEST_YakedoSub
	WAIT_FLAG
	SEQEND

WEST_YakedoSub:
	ADD_ACTOR	YakedoHeader,D_UP+2,7, -24,24, 24,24, HINOKO_SUBSYNC, 1,1
	WAIT		4
	END_CALL

//----------------------------------------------------------
//	メロメロ
//----------------------------------------------------------
WEST_StMeromero:
	CHAR_SET	WAZACHR_ID_HEART2
	SEPLAY_PAN	SE_W204,WAZA_SE_L,
	ADD_ACTOR	HeartHeader,A_UP+3,2, 0,20
	WAIT		15
	SEPLAY_PAN	SE_W204,WAZA_SE_L,
	ADD_ACTOR	HeartHeader,A_UP+3,2, -20,20
	WAIT		15
	SEPLAY_PAN	SE_W204,WAZA_SE_L,
	ADD_ACTOR	HeartHeader,A_UP+3,2, 20,20
	SEQEND

//----------------------------------------------------------
//	ねむり
//----------------------------------------------------------
WEST_StNemuri:
	CHAR_SET	WAZACHR_ID_ZZZ2
	SEPLAY_PAN	SE_W173,WAZA_SE_L
	ADD_ACTOR	ActZzzzHeader,A_UP+2,5,	4,-10,16,0,0x0
	WAIT 30
	ADD_ACTOR	ActZzzzHeader,A_UP+2,5,	4,-10,16,0,0x0
	SEQEND

//----------------------------------------------------------
//	麻痺
//----------------------------------------------------------
WEST_StMahi:
	CHAR_SET	WAZACHR_ID_MAHI
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,1,0,10,1
	SEQ_CALL	WEST_MahiKouka
	SEQEND

//----------------------------------------------------------
//	こおり
//----------------------------------------------------------
WEST_StKoori:
	SEPLAY_PAN	SE_W196,0
	CHAR_SET	WAZACHR_ID_KOORI
	POKEBG		3
	BGPRI_GAPSET	BG_DEFENCE
//	BLDALPHA_SET	0xc,0x8
	SE_WAITPLAY	SE_W258,WAZA_SE_R,17
	ADD_TASK	KooriStatusEffectTask,PRI2,0
	WAIT_FLAG
	POKEBG_RESET	3
//	BLDALPHA_RESET
	SEQEND

//----------------------------------------------------------
//	のろい
//----------------------------------------------------------
WEST_StNoroi:
	CHAR_SET	WAZACHR_ID_NOROI
	POKEBG		3
	SEPLAY_PAN	SE_W171,WAZA_SE_R
	ADD_ACTOR	DokuroHeader,D_UP+2,0
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,14,1
	WAIT_FLAG
	POKEBG_RESET	3
	SEQEND

//----------------------------------------------------------
//	あくむ
//----------------------------------------------------------
WEST_StAkumu:
	CHAR_SET	WAZACHR_ID_DEVIL
	POKEBG		3
	SEPLAY_PAN	SE_W171,WAZA_SE_R
	ADD_ACTOR	AkumuHeader,D_UP+2,0
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,14,1
	WAIT_FLAG
	POKEBG_RESET	3
	SEQEND














//=========================================================================
//	戦闘エフェクト
//=========================================================================
//----------------------------------------------------------
//	変化
//----------------------------------------------------------
WEST_FeHenge:
	ADD_TASK	HengeBanishChk,PRI2,0
	WORKCHK_JP	7,1,WEST_FeHengeBanish
	SEQ_JP		WEST_FeHengeNormal

WEST_FeHengeNormal:		//通常時の変化エフェクト
	POKEBG		0
	SEPLAY_PAN	SE_W100,WAZA_SE_L
	SE_WAITPLAY	SE_W107,WAZA_SE_L,48
	ADD_TASK	HensinMosaic,PRI2,1, 1
	WAIT_FLAG
	POKEBG_RESET	0
	SEQEND

WEST_FeHengeBanish:		//「そらをとぶ」等でﾎﾟｹﾓﾝが消えている時。ｷｬﾗ展開のみをする
	ADD_TASK	WestHengeChrTrans,PRI2,1, 1
	SEQEND

//----------------------------------------------------------
//	ステータス上昇・下降エフェクト
//----------------------------------------------------------
WEST_FeStatus:
//	SEQ_CALL	WEST_MigawariChkOut		//add by matsuda 2002.08.27(火)
//	ADD_TASK	StatusEffectTask,PRI5,4, 1,1,1,1
	ADD_TASK	FeStatusEffectTask,PRI5,0
	WAIT_FLAG
//	SEQ_CALL	WEST_MigawariChkIn		//add by matsuda 2002.08.27(火)
	SEQEND

//----------------------------------------------------------
//	「みがわり」キャラ気絶
//----------------------------------------------------------
WEST_FeMigawariKizetu:
	POKEBG		0
	ADD_TASK	MigawariKizetuTask,PRI5,0
	ADD_TASK	ColorFadeSeq,PRI10,5, 2,0,0,16,0x7fff
	WAIT_FLAG
	WAIT		1
	POKEBG_RESET	0
	WAIT		2
	BLDALPHA_RESET
	ADD_TASK	ColorFadeSeq,PRI10,5, 2,0,0,0,0x7fff
	ADD_TASK	MigawariInOutTask,PRI2,1, 1
	SEQEND
	
//----------------------------------------------------------
//	ピッピ人形
//----------------------------------------------------------
WEST_FePippiNingyou:
	ADD_TASK	MigawariTask,PRI2,0
	SEQEND

//----------------------------------------------------------
//	ポロックを投げるエフェクト
//----------------------------------------------------------
#define POROC_ST_X	(-16)
#define POROC_ST_Y	(7)
WEST_FePoroc:
	ADD_TASK	AttackDefenceMineEnemySet,PRI2,0
	ADD_TASK	PorocCellPalSet,PRI2,0
	WAIT		0
	SE_WAITPLAY	SE_W026,WAZA_SE_L,22
	ADD_ACTOR	PorocHeader,D_UP+3,4, POROC_ST_X,POROC_ST_Y,0,32
//	WAIT_FLAG
	WAIT		50
	SE_REPEAT	SE_W039,WAZA_SE_R,19,2
	ADD_TASK	PokeSinMove,PRI5,5, 1,8,0x0600,2,1
	WAIT_FLAG
	ADD_TASK	PorocCellPalDel,PRI2,0
	SEQEND

//----------------------------------------------------------
//	「はたきおとす」で出る袋
//----------------------------------------------------------
WEST_FeFukuro:
	CHAR_SET	WAZACHR_ID_FUKURO3
	ADD_ACTOR	ActOutFukuroHeader,D_UP+2,0
	SEQEND

//----------------------------------------------------------
//	しめつけ
//----------------------------------------------------------
#define KARAMITUKU_WAIT		7
WEST_FeSimetuke:
	ADD_TASK	SimetukeWazaCheck,PRI5,0
	WORKCHK_JP	0,1,WEST_FeSimetukeHonoo
	WORKCHK_JP	0,2,WEST_FeSimetukeUzusio
	WORKCHK_JP	0,3,WEST_FeSimetukeKaradehasamu
	WORKCHK_JP	0,4,WEST_FeSimetukeSunajigoku
	SEQ_JP		WEST_FeSimetukeKusa
	
//-- 草系しめつけるｴﾌｪｸﾄ --//
WEST_FeSimetukeKusa:
	CHAR_SET	WAZACHR_ID_KARAMITUKU
	SE_REPEAT	SE_W010,WAZA_SE_R,6,2
	ADD_ACTOR	KaramitukuHeader,D_UP+4,4, 0,16,0,1
	WAIT		KARAMITUKU_WAIT
//	ADD_ACTOR	KaramitukuHeader,D_UP+3,4, 0,0,0,1
	ADD_ACTOR	KaramitukuHeader,D_UP+2,4, 0,8,1,1
	WAIT		3
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 1,2,0,8,1
	WAIT		20
	WORK_SET	7,0xffff
	SEPLAY_PAN	SE_W020,WAZA_SE_R
	WAIT_FLAG
	SEQEND

//-- ほのおのうず絞めつけｴﾌｪｸﾄ --//
WEST_FeSimetukeHonoo:
	CHAR_SET	WAZACHR_ID_FIRE
	SEPLAY_PAN	SE_W221B,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,2,30,1
	SEQ_CALL	WEST_HonoonoUzuSub
	SEQ_CALL	WEST_HonoonoUzuSub
//	SEQ_CALL	WEST_HonoonoUzuSub
	WAIT_FLAG
	SE_STOP
	SEQEND

//-- うずしお絞めつけｴﾌｪｸﾄ --//
WEST_FeSimetukeUzusio:
	CHAR_SET	WAZACHR_ID_HAIDORO	//chg_02.08.28_iwasawa
	POKEBG		3
	BGPRI_GAPSET	BG_DEFENCE
	BLDALPHA_SET	0xc,0x8
	WAIT		0
	ADD_ACTOR	ActFadeHeader,A_UP,5, 0x04,2, 0,7,0x5da0
	SEPLAY_PAN	SE_W250,WAZA_SE_R
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,2,30,1
	SEQ_CALL	WEST_UzusioSub
	SEQ_CALL	WEST_UzusioSub
//	SEQ_CALL	WEST_UzusioSub
	WAIT		12
	ADD_ACTOR	ActFadeHeader,A_UP,5, 0x04,2, 7,0,0x5da0
	WAIT_FLAG
	SE_STOP
	POKEBG_RESET	3
	SEQEND

//-- からではさむ絞めつけｴﾌｪｸﾄ --//
WEST_FeSimetukeKaradehasamu:
	CHAR_SET	WAZACHR_ID_KARA3
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W011,WAZA_SE_R
	ADD_ACTOR	ActKaraHeader,A_UP+2,6,  -KAMITUKU_OFFSET,0,2,KAMITUKU_DY,0,KAMITUKU_LOOP
	ADD_ACTOR	ActKaraHeader,A_UP+2,6,  KAMITUKU_OFFSET,0,6,-KAMITUKU_DY,0,KAMITUKU_LOOP
	WAIT		KAMITUKU_LOOP
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,2
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,3,0,5,1
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	WAIT_FLAG
	SEQEND

//-- すなじごく絞めつけｴﾌｪｸﾄ --//
WEST_FeSimetukeSunajigoku:
	CHAR_SET	WAZACHR_ID_SUNA
	ADD_ACTOR	ActFadeHeader,A_UP,5, 0x04,2, 0,7,0x0233	//add_0826_iwa
	ADD_TASK	TaskPokeBuruburu,PRI5,5, 1,0,2,30,1
	SEPLAY_PAN	SE_W328,WAZA_SE_R
	SEQ_CALL	WEST_SunaJigokuSub
	SEQ_CALL	WEST_SunaJigokuSub
//	SEQ_CALL	WEST_SunaJigokuSub
	WAIT		22
	ADD_ACTOR	ActFadeHeader,A_UP,5, 0x04,2, 7,0,0x0233
	WAIT_FLAG
	SE_STOP
	SEQEND

//----------------------------------------------------------
//	木の実系 回復エフェクト
//----------------------------------------------------------
WEST_FeKaifuku:
	CHAR_SET	WAZACHR_ID_HAMON
	CHAR_SET	WAZACHR_ID_KIRAKIRA2
	WAIT		0
	
//	SEQ_CALL	WEST_MigawariChkOut		//add by matsuda 2002.08.27(火)
	
	SEPLAY_PAN	SE_W036, WAZA_SE_L,
	ADD_TASK	KinomiPokeRollTask,PRI2,4,	16,0x0080,0,2
	WAIT_FLAG
	SEPLAY_PAN	SE_W036, WAZA_SE_L,
	ADD_TASK	KinomiPokeRollTask,PRI2,4,	16,0x0080,0,2
	WAIT_FLAG
	SEPLAY_PAN	SE_W036, WAZA_SE_L,
	ADD_TASK	KinomiPokeRollTask,PRI2,4,	16,0x0080,0,2
	WAIT_FLAG
	SEPLAY_PAN	SE_W234, WAZA_SE_L,
	SEQ_CALL	WEST_Kirakira
	WAIT_FLAG
	SEPLAY_PAN	SE_REAPOKE, WAZA_SE_L,
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 2,3, 7,0,0x67F1//0x7b0c
	ADD_ACTOR	HamonHeader,A_UP+3,4, 0,0,0,0
	WAIT_FLAG
	
//	SEQ_CALL	WEST_MigawariChkIn		//add by matsuda 2002.08.27(火)
	
	SEQEND

//----------------------------------------------------------
//	けむりだま
//----------------------------------------------------------
WEST_FeKemuridama:
	CHAR_SET	WAZACHR_ID_AKUBI
	POKEBG		0
	BLDALPHA_SET	0x0C,0x04
	WAIT		0

	SEPLAY_PAN	SE_BOWA2,WAZA_SE_R
	ADD_ACTOR	ActKemuridamaHeader, D_UP,4, 0,32,28,30
	WAIT		4
	SEPLAY_PAN	SE_BOWA2,WAZA_SE_R
	ADD_ACTOR	ActKemuridamaHeader, D_UP-1,4, 2,12,20,30
	WAIT		12
	
	SEPLAY_PAN	SE_BOWA2,WAZA_SE_R
	ADD_ACTOR	ActKemuridamaHeader, D_UP-2,4, 2,-28,4,30
	WAIT		4
//	ADD_ACTOR	ActKemuridamaHeader, D_UP-3,4, 1,-20,-12,30
	WAIT		8
	SEPLAY_PAN	SE_BOWA2,WAZA_SE_R
	ADD_ACTOR	ActKemuridamaHeader, D_UP-4,4, 2,14,-20,30
	WAIT		4
//	ADD_ACTOR	ActKemuridamaHeader, D_UP-4,4, 0,16,-16,30
//	WAIT		8
	SEPLAY_PAN	SE_BOWA2,WAZA_SE_R
	ADD_TASK	WazaTaskPokeToumeiExe,PRI2,1,	2
	ADD_ACTOR	ActKemuridamaHeader, D_UP-5,4, 3,4,4,30
	WAIT		14
//	ADD_ACTOR	ActKemuridamaHeader, D_UP-4,4, 0,-12,12,30
//	WAIT		8

	SEPLAY_PAN	SE_BOWA2,WAZA_SE_R
	ADD_ACTOR	ActKemuridamaHeader, D_UP-6,4, 3,-14,18,46
	WAIT		0
	ADD_ACTOR	ActKemuridamaHeader, D_UP-7,4, 3, 14,-14,46
	WAIT		0
	ADD_ACTOR	ActKemuridamaHeader, D_UP-8,4, 3,-12,-10,46
	WAIT		0
	ADD_ACTOR	ActKemuridamaHeader, D_UP-9,4, 3,14,14,46
	WAIT		0
	ADD_ACTOR	ActKemuridamaHeader, D_UP-10,4, 3,0,0,46
	
	WAIT_FLAG
	POKEBG_RESET	0
	POKE_BANISH_ON	0
	WAIT			0
	BLDALPHA_RESET
	SEQEND

//----------------------------------------------------------
//	きあいのハチマキ
//----------------------------------------------------------
WEST_FeKiainoHatimaki:
	ADD_ACTOR	ActFadeHeader,A_UP,5, 0x02,7, 0,9,0x001f
	SEPLAY_PAN	SE_W082, WAZA_SE_L,
	ADD_TASK	TaskKiainoHatimakiInit,PRI5,7,	30,0x0080,0,1, 2,0,1
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP,5, 0x02,4, 9,0,0x001f
	WAIT_FLAG
	WAIT		6
	ADD_ACTOR	ActPokeDefaultMoveHeader,A_UP,3,	0,0,15
	SEQEND

//----------------------------------------------------------
//	あまごい
//----------------------------------------------------------
WEST_FeAmagoi:
	CHAR_SET	WAZACHR_ID_AMAGOI
	SEPLAY_PAN	SE_W240,WAZA_SE_L
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 0xFF,2,0,4,0x0000	//add_02.08.27_iwa
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x0781,2,0,4,0x0000
	WAIT_FLAG
	ADD_TASK	WazaTaskAmagoi,PRI2,3, 0,3,60
	ADD_TASK	WazaTaskAmagoi,PRI2,3, 0,3,60
@	ADD_ACTOR	ActWazaAmagoiHeader,A_UP+2,2,5,5
	WAIT		50
	WAIT_FLAG
//	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 0xFF,2,4,0,0x0000	//add_02.08.27_iwa
	ADD_TASK	ColorFadeSeq,PRI10,5, 0x0781,2,4,0,0x0000
	WAIT_FLAG
	SEQEND
	
//----------------------------------------------------------
//	にほんばれ
//----------------------------------------------------------
WEST_FeNihonbare:
	SEQ_JP		WEST_Nihonbare

//----------------------------------------------------------
//	すなあらし
//----------------------------------------------------------
WEST_FeSunaArasi:
	SEQ_JP		WEST_SunaArasi

//----------------------------------------------------------
//	あられ
//----------------------------------------------------------
WEST_FeArare:
	SEQ_JP		WEST_Arale

//----------------------------------------------------------
//	やどりぎのタネ
//----------------------------------------------------------
WEST_FeYadorigi:
	ADD_TASK	BtlWorkAttackDefenceSet,PRI5,0
	WAIT		0
	SEQ_JP		WEST_Suitoru

//----------------------------------------------------------
//	次ﾊﾞｰｼﾞｮﾝとの通信時に、現ﾊﾞｰｼﾞｮﾝにない技を出してきた時に変わりに出すｴﾌｪｸﾄ
//----------------------------------------------------------
WEST_FeHitEffect:
	CHAR_SET	WAZACHR_ID_HITMARK
	POKEBG		1
	BLDALPHA_SET	0xc,0x8
	SEPLAY_PAN	SE_W003,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,A_UP+2,4, 0,0,1,2
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,3,0,6,1
	WAIT_FLAG
	POKEBG_RESET	1
	BLDALPHA_RESET
	SEQEND

//----------------------------------------------------------
//	「どろぼう」「ほしがる」で成功した時のｴﾌｪｸﾄ
//----------------------------------------------------------
WEST_FeNusumu:
	CHAR_SET	WAZACHR_ID_FUKURO3
	ADD_TASK	AttackDefenceNoSet,PRI2,0
	ADD_TASK	TsuikaClientDefenceSet,PRI2,0
	WAIT		1
	ADD_ACTOR	ActHoshigaruFukuroHeader,A_UP+2,5, 0,-5,10, 2,-1
	SEQEND

//----------------------------------------------------------
//	よこどり
//----------------------------------------------------------
WEST_FeYokodori:
	CHAR_SET	WAZACHR_ID_FUKURO3
	ADD_TASK	YokodoriClientSet,PRI2,0

	SEQ_CALL	WEST_MigawariChkOut
	WAIT		1
	
	ADD_TASK	PokeSinMove,PRI2,5, 0,5,0x1400,4,1
	WAIT_FLAG
	ADD_TASK	YokodoriPartyAttackChk,PRI2,0
	WORKCHK_JP	7,0,WEST_YokodoriNormal
	SEQ_JP		WEST_YokodoriPartyAttack
WEST_FeYokodoriReturn:
	WAIT_FLAG
	SEQ_CALL	WEST_MigawariChkIn
	SEQEND
	
WEST_YokodoriNormal:
	SEPLAY_PAN	SE_W104,WAZA_SE_L
	ADD_TASK	YokodoriTask,PRI2,0
//	ADD_ACTOR	YokodoriFukuroHeader,D_DOWN+2,0
	SEQ_JP		WEST_FeYokodoriReturn

WEST_YokodoriPartyAttack:
	SEPLAY_PAN	SE_W104,WAZA_SE_L
	ADD_TASK	YokodoriPartyMoveTask,PRI2,0
	SEQ_JP		WEST_FeYokodoriReturn
	
//----------------------------------------------------------
//	みらいよち
//----------------------------------------------------------
WEST_FeMiraiyoti:
	ADD_TASK	DefenceNoClientSet,PRI2,0
	POKEBG		3
	SEPLAY_PAN	SE_W060,WAZA_SE_L
	SEQ_CALL	WEST_ESP_MAPCHG
//	WAIT_FLAG
	BLDALPHA_SET	0x8,0x8
	SEPLAY_PAN	SE_W048,WAZA_SE_R
	SE_WAITPLAY	SE_W048,WAZA_SE_R,8
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,4,0,15,1
	ADD_TASK	PokeKakusyukuTask,PRI5,5, MIRAI_DEFENCE_AFF,MIRAI_DEFENCE_AFF,15,1,1
	WAIT_FLAG
	ADD_TASK	TaskPokeBuruburu,PRI2,5, 1,4,0,24,1
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	WAIT_FLAG
	WAIT		1
	SEQ_CALL	WEST_ESP_MAPEND
//	WAIT_FLAG
	SEQEND

//----------------------------------------------------------
//	はめつのねがい
//----------------------------------------------------------
WEST_FeHametunoNegai:
	ADD_TASK	DefenceNoClientSet,PRI2,0
	CHAR_SET	WAZACHR_ID_DAIBAKUHATU
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,3, 0,16,0x7fff
	WAIT_FLAG
	WAIT		10
	ADD_TASK	HametunoNegaiTask,PRI5,0
	WAIT		9
	SEPLAY_PAN	SE_W109,WAZA_SE_L
	WAIT		9
	SEPLAY_PAN	SE_W109,0
	WAIT		9
	SEPLAY_PAN	SE_W109,WAZA_SE_R
	WAIT		25
	ADD_TASK	TaskPokeCenterBuru2,PRI2,5, 1,10,0,20,1
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, 0,0, 1,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, 24,-24, 1,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, -16,16, 1,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, -24,-12, 1,1
	WAIT		DAIBAKUHATU_WAIT
	SEPLAY_PAN	SE_W120,WAZA_SE_R
	ADD_ACTOR	DaibakuhatuHeader,A_UP+3,4, 16,16, 1,1
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,3, 16,0,0x7fff
	WAIT_FLAG
	SEQEND

//----------------------------------------------------------
//	「きあいパンチ」の1ﾀｰﾝ目の気合をためるエフェクト
//----------------------------------------------------------
WEST_FeKiaiPunchTurn1:	//1ターン目:赤くなってふるえる
	CHAR_SET	WAZACHR_ID_KORAERU

	SEPLAY_PAN	SE_W082, WAZA_SE_L,
	SEQ_CALL	WEST_KoraeruSub
	WAIT		8
	ADD_TASK	WazaTaskColorFade,PRI2,6, 2,2,2,0,11,0x001f
	ADD_TASK	TaskPokeCenterBuru,PRI2,5, 0,1,0,32,1
	SEQ_CALL	WEST_KoraeruSub
	WAIT		8
	SEQ_CALL	WEST_KoraeruSub
	WAIT_FLAG
	SEQEND

//----------------------------------------------------------
//	「ねをはる」の継続エフェクト
//----------------------------------------------------------
WEST_FeNewoharu:
	CHAR_SET	WAZACHR_ID_SOLAR
	CHAR_SET	WAZACHR_ID_PIKARI
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1,0,4,0x33ed
	WAIT_FLAG
	WAIT		3
	SEQ_CALL	WEST_SuitoruSub
	WAIT_FLAG
	WAIT		15
	SEQ_CALL	WEST_PikariAttack
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,1,4,0,0x33ed
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQEND

//----------------------------------------------------------
//	「ねがいごと」の2ﾀｰﾝ後の回復エフェクト
//----------------------------------------------------------
WEST_FeNegaigoto:
	CHAR_SET	WAZACHR_ID_PIKARI
	CHAR_SET	WAZACHR_ID_KIRAKIRA2
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,3, 0,10,0x0000
	WAIT_FLAG
	SEPLAY_PAN	SE_W025,WAZA_SE_L
	SEQ_CALL	WEST_Kirakira
	WAIT_FLAG
	SEQ_CALL	WEST_PikariAttack
	WAIT_FLAG
	ADD_ACTOR	ActFadeHeader,A_UP+2,5, 1,3, 10,0,0x0000
	SEQEND


//=========================================================================
//	共通シーケンス
//=========================================================================
//----------------------------------------------------------
//	身代わりﾌﾗｸﾞをﾁｪｯｸして、身代わりｷｬﾗが出ているならば身代わりをｽﾗｲﾄﾞｱｳﾄ
//----------------------------------------------------------
WEST_MigawariChkOut:
	ADD_TASK	MigawariFlagChkTask,PRI2,0
	WORKCHK_JP	7,1, WEST_MigawariChkOutSub
WEST_MigawariChkOutSubReturn:
	WAIT_FLAG
	END_CALL

WEST_MigawariChkOutSub:
	ADD_TASK	MigawariInOutTask,PRI2,1, 1
	WAIT_FLAG
	SEQ_JP		WEST_MigawariChkOutSubReturn

//----------------------------------------------------------
//	身代わりﾌﾗｸﾞをﾁｪｯｸして、身代わりﾌﾗｸﾞが立っているならば身代わりｷｬﾗをｽﾗｲﾄﾞｲﾝ
//----------------------------------------------------------
WEST_MigawariChkIn:
	ADD_TASK	MigawariFlagChkTask,PRI2,0
	WORKCHK_JP	7,1, WEST_MigawariChkInSub
WEST_MigawariChkInSubReturn:
	WAIT_FLAG
	END_CALL

WEST_MigawariChkInSub:
	ADD_TASK	MigawariInOutTask,PRI2,1, 0
	WAIT_FLAG
	SEQ_JP		WEST_MigawariChkInSubReturn










//=========================================================================
//	戦闘その他のエフェク
//=========================================================================
//----------------------------------------------------------
//	レベルアップ
//----------------------------------------------------------
WEST_FeLvUP:
	SEPLAY_PAN	SE_EXPMAX,0
	ADD_TASK	LvUpGaugePaletteSet,PRI2,0
	WAIT		0
	ADD_TASK	LvUpEffColorFade,PRI5,2, 0,0
/*	WAIT_FLAG
	SEPLAY_PAN	SE_W025,0
	ADD_TASK	LvUpEffColorFade,PRI5,2, 1,5
	ADD_TASK	LvUpEffTask,PRI5,0
*/	WAIT_FLAG
	ADD_TASK	LvUpGaugePaletteRecover,PRI2,0
	SEQEND

//----------------------------------------------------------
//	自機側ポケモンを引っ込める
//----------------------------------------------------------
WEST_FePokeReturnMine:
	ADD_TASK	PokeReturnMineHikariEff,PRI2,0
	WAIT		10
	ADD_TASK	PokeReturnMineEff,PRI2,0
	SEQEND

//----------------------------------------------------------
//	敵側ポケモンを引っ込める
//----------------------------------------------------------
WEST_FePokeReturnEnemy:
	ADD_TASK	PokeReturnMineHikariEff,PRI2,0
	WAIT		10
	ADD_TASK	PokeReturnMineEff,PRI2,0
	SEQEND

//----------------------------------------------------------
//	ポケモンゲットエフェクト
//----------------------------------------------------------
WEST_FePokeGetEffect:
	ADD_TASK	WestMonsBallCellPalSet,PRI2,0
	WAIT		0
	SEPLAY_PAN	SE_NAGERU,0
	ADD_TASK	AddMonsBallActor,PRI2,0
	ADD_TASK	TrainerPokeCheck,PRI2,0	//ﾄﾚｰﾅｰ戦かﾁｪｯｸ
	WORKCHK_JP	7,0xffff, WEST_FeTrainerHajike
WEST_FePokeGetEffectReturn:
	WAIT_FLAG
	ADD_TASK	WestMonsBallCellPalDel,PRI2,0
	SEQEND

//-- ｹﾞｯﾄしようとしたﾎﾟｹﾓﾝがﾄﾚｰﾅｰのだった場合のはじくｴﾌｪｸﾄ --//
WEST_FeTrainerHajike:
	CHAR_SET	WAZACHR_ID_HITMARK
	WAIT		25//30
	POKEBG		3
	BLDALPHA_SET	0xc,0x8
	WAIT		0
	SEPLAY_PAN	SE_W003,WAZA_SE_R
	ADD_ACTOR	ActHitMarkHeader,D_UP+2,4, -4,-20,1,2
	WAIT_FLAG
	POKEBG_RESET	3
	BLDALPHA_RESET
	SEQ_JP		WEST_FePokeGetEffectReturn
	
//----------------------------------------------------------
//	ポケモンゲットエフェクト(サファリ用)
//----------------------------------------------------------
WEST_FePokeGetEffectSafari:
	ADD_TASK	WestMonsBallCellPalSet,PRI2,0
	WAIT		0
//	SEPLAY_PAN	SE_NAGERU,0		ｻﾌｧﾘでは↓のﾀｽｸの中で音を鳴らしてる
	ADD_TASK	AddMonsBallActorSafari,PRI2,0
	WAIT_FLAG
	ADD_TASK	WestMonsBallCellPalDel,PRI2,0
	SEQEND
	
//----------------------------------------------------------
//	「みがわり」キャラをｽﾗｲﾄﾞｱｳﾄさせてポケモンをｲﾝさせる
//----------------------------------------------------------
WEST_FeMigawariOut:
	ADD_TASK	MigawariInOutTask,PRI2,1, 1
	SEQEND

//----------------------------------------------------------
//	ポケモンをｽﾗｲﾄﾞｱｳﾄさせて「みがわり」キャラをｽﾗｲﾄﾞｲﾝさせる
//----------------------------------------------------------
WEST_FeMigawariIn:
	ADD_TASK	MigawariInOutTask,PRI2,1, 0
	SEQEND

