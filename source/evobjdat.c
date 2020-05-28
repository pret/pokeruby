//**********************************************************************
//		evobjdat.c
//		ｲﾍﾞﾝﾄ OBJ ﾃﾞｰﾀ
//**********************************************************************
#define		EVOBJDAT_H_PROTO

#include	<agb.h>
#include	"actor.h"
#include	"actanm.h"
#include	"evobj.h"
#include	"fld_eff.h"
#include	"jiki.h"

//----------------------------------------------------------------------
//		ﾃﾞｰﾀｲﾝｸﾙｰﾄﾞ
//----------------------------------------------------------------------
#include	"..\objdata\hero.ach"
#include	"..\objdata\hero.acl"
#include	"..\objdata\hero_ref.acl"
#include	"..\objdata\h_hiden.ach"
#include	"..\objdata\h_swim.ach"
#include	"..\objdata\c_hero0.ach"
#include	"..\objdata\c_hero1.ach"
// #include	"..\objdata\h_fish.ach"				// ｲﾗﾝ
#include	"..\objdata\turiact1.ach"
#include	"..\objdata\joroactm.ach"
#include	"..\objdata\moyohjiki.ach"
#include	"..\objdata\moguri.ach"
#include	"..\objdata\moguri.acl"

#include	"..\objdata\heroine.ach"
#include	"..\objdata\heroine.acl"
#include	"..\objdata\c_hine0.ach"
#include	"..\objdata\c_hine1.ach"
#include	"..\objdata\hine_swim.ach"
#include	"..\objdata\hine_hiden.ach"
// #include	"..\objdata\hine_fish.ach"			// ｲﾗﾝ
#include	"..\objdata\turiactf1.ach"
#include	"..\objdata\joroactf.ach"

#include	"..\objdata\opp.acl"
#include	"..\objdata\opp_01.ach"
#include	"..\objdata\opp_02.ach"
#include	"..\objdata\opp_03.ach"
#include	"..\objdata\opp_04.ach"
#include	"..\objdata\opp_05.ach"
#include	"..\objdata\opp_06.ach"
#include	"..\objdata\opp_07.ach"
#include	"..\objdata\opp_08.ach"
#include	"..\objdata\opp_09.ach"
#include	"..\objdata\opp_10.ach"
#include	"..\objdata\opp_11.ach"
#include	"..\objdata\opp_12.ach"
#include	"..\objdata\opp_13.ach"
#include	"..\objdata\opp_14.ach"
#include	"..\objdata\opp_15.ach"
#include	"..\objdata\opp_16.ach"
#include	"..\objdata\opp_17.ach"
#include	"..\objdata\opp_18.ach"
#include	"..\objdata\opp_19.ach"
#include	"..\objdata\opp_20.ach"
#include	"..\objdata\opp_21.ach"
#include	"..\objdata\opp_22.ach"
#include	"..\objdata\opp_23.ach"
#include	"..\objdata\opp_24.ach"
#include	"..\objdata\opp_25.ach"
#include	"..\objdata\opp_26.ach"
#include	"..\objdata\opp_27.ach"
#include	"..\objdata\opp_28.ach"
#include	"..\objdata\opp_29.ach"
#include	"..\objdata\opp_30.ach"
#include	"..\objdata\opp_31.ach"
#include	"..\objdata\opp_32.ach"
#include	"..\objdata\opp_33.ach"
#include	"..\objdata\opp_34.ach"
#include	"..\objdata\opp_35.ach"
#include	"..\objdata\opp_36.ach"
#include	"..\objdata\opp_37.ach"
#include	"..\objdata\opp_38.ach"
#include	"..\objdata\opp_39.ach"
#include	"..\objdata\opp_40.ach"
#include	"..\objdata\opp_41.ach"
#include	"..\objdata\opp_42.ach"
#include	"..\objdata\opp_43.ach"
#include	"..\objdata\opp_44.ach"
#include	"..\objdata\opp_45.ach"
#include	"..\objdata\opp_46.ach"
#include	"..\objdata\opp_47.ach"
#include	"..\objdata\opp_48.ach"
#include	"..\objdata\opp_49.ach"
#include	"..\objdata\opp_50.ach"
#include	"..\objdata\opp_51.ach"
#include	"..\objdata\opp_52.ach"
#include	"..\objdata\opp_53.ach"
#include	"..\objdata\opp_54.ach"
#include	"..\objdata\opp_55.ach"

#include	"..\objdata\op_nurse.ach"
#include	"..\objdata\o_pokeb.ach"
#include	"..\objdata\op_odama.ach"
#include	"..\objdata\op_intrvm.ach"
#include	"..\objdata\op_intrvf.ach"
#include	"..\objdata\op_7oyaji1.ach"
#include	"..\objdata\op_7oyaji2.ach"
#include	"..\objdata\op_shopm.ach"
#include	"..\objdata\op_shopf.ach"
#include	"..\objdata\op_pcgirl.ach"
#include	"..\objdata\op_artist.ach"
#include	"..\objdata\op_camera.ach"
#include	"..\objdata\op_waruken.ach"
#include	"..\objdata\op_dbnsya.ach"
#include	"..\objdata\op_aquam.ach"
#include	"..\objdata\op_aquaf.ach"
#include	"..\objdata\op_magm.ach"
#include	"..\objdata\op_magf.ach"
#include	"..\objdata\op_4kgt.ach"
#include	"..\objdata\op_4fyu.ach"
#include	"..\objdata\op_4prm.ach"
#include	"..\objdata\op_4gnj.ach"
#include	"..\objdata\op_jrttj.ach"
#include	"..\objdata\op_jrtuk.ach"
#include	"..\objdata\op_jrtsn.ach"
#include	"..\objdata\op_jrair.ach"
#include	"..\objdata\op_jrsnr.ach"
#include	"..\objdata\op_jrnag.ach"
#include	"..\objdata\op_jr2f.ach"
#include	"..\objdata\op_jr2r.ach"
#include	"..\objdata\op_jrmkr.ach"
#include	"..\objdata\op_champ.ach"
#include	"..\objdata\op_mitsru.ach"
#include	"..\objdata\op_sup.ach"
#include	"..\objdata\op_onsen.ach"
#include	"..\objdata\op_lati.ach"
#include	"..\objdata\op_gba.ach"
#include	"..\objdata\op_sikai.ach"
#include	"..\objdata\op_aquab.ach"
#include	"..\objdata\op_magb.ach"
#include	"..\objdata\op_kiog.ach"
#include	"..\objdata\op_grdn.ach"
#include	"..\objdata\op_densets.ach"
#include	"..\objdata\op_eneco.ach"
#include	"..\objdata\op_kakreon.ach"
#include	"..\objdata\op_tycoon.ach"
#include	"..\objdata\op_jiguma.ach"
#include	"..\objdata\op_pika.ach"
#include	"..\objdata\op_mariruri.ach"
#include	"..\objdata\op_camome.ach"
#include	"..\objdata\op_ukib.ach"
#include	"..\objdata\op_ruriri.ach"
#include	"..\objdata\op_mama.ach"

#include	"..\objdata\op_kiog_mc.acl"
#include	"..\objdata\op_grdn_mc.acl"

#include	"..\objdata\hob_gds.ach"
#include	"..\objdata\hob_gds16.ach"
#include	"..\objdata\hob_gds32.ach"

#include	"..\objdata\o_tachigi.ach"
#include	"..\objdata\o_crushiw.ach"
#include	"..\objdata\o_pushiw.ach"

#include	"..\objdata\o_ship1.ach"
#include	"..\objdata\o_kaseki.ach"

#if (SUBMARINE_CHMODE == SUBM_CHMODE_IWA)
#include	"..\objdata\o_subm.ach"
#else
#include	"..\objdata\submarine_obj.ach"
#include	"..\objdata\submarine_obj.acl"
#endif

#include	"..\objdata\truck.ach"
#include	"..\objdata\truck.acl"
#include	"..\objdata\hikobj.ach"
#include	"..\objdata\hikobj.acl"
#include	"..\objdata\opobj1.ach"
#include	"..\objdata\opobj2.ach"
#include	"..\objdata\opobj2.acl"

#include	"..\objdata\ropeway.ach"
#include	"..\objdata\ropeway.acl"

#include	"..\objdata\ship_obj.ach"
#include	"..\objdata\ship_obj.acl"

#include	"..\objdata\seedeff0.ach"
#include	"..\objdata\seed00.ach"
#include	"..\objdata\seed01.ach"
#include	"..\objdata\seed02.ach"
#include	"..\objdata\seed03.ach"
#include	"..\objdata\seed04.ach"
#include	"..\objdata\seed05.ach"
#include	"..\objdata\seed06.ach"
#include	"..\objdata\seed07.ach"
#include	"..\objdata\seed08.ach"
#include	"..\objdata\seed09.ach"
#include	"..\objdata\seed10.ach"
#include	"..\objdata\seed11.ach"
#include	"..\objdata\seed12.ach"
#include	"..\objdata\seed13.ach"
#include	"..\objdata\seed14.ach"
#include	"..\objdata\seed15.ach"
#include	"..\objdata\seed16.ach"
#include	"..\objdata\seed17.ach"
#include	"..\objdata\seed18.ach"
#include	"..\objdata\seed19.ach"
#include	"..\objdata\seed20.ach"
#include	"..\objdata\seed21.ach"
#include	"..\objdata\seed22.ach"
#include	"..\objdata\seed23.ach"
#include	"..\objdata\seed24.ach"
#include	"..\objdata\seed25.ach"
#include	"..\objdata\seed26.ach"
#include	"..\objdata\seed27.ach"
#include	"..\objdata\seed28.ach"
#include	"..\objdata\seed29.ach"
#include	"..\objdata\seed30.ach"

#include	"..\objdata\hoeruko.ach"
// #include	"..\objdata\pokeswim.ach"			// ｲﾗﾝ

#include	"..\objdata\a_debu.ach"
#include	"..\objdata\a_debu.acl"
#include	"..\objdata\a_debu_ref.acl"

#include	"..\objdata\shade.ach"

#include	"..\objdata\objgrass.ach"			// ｲﾗﾝ
#include	"..\objdata\objgrass.acl"			// ｲﾗﾝ

#include	"..\objdata\mizutama.ach"

#include	"..\objdata\hai_ani.ach"
// #include	"..\objdata\hai_ani.acl"			// ｲﾗﾝ

#include	"..\objdata\exit_cur.ach"

#include	"..\objdata\map_eff.acl"

#include	"..\objdata\hokori1.ach"

#include	"..\objdata\kusa1.ach"				// ｲﾗﾝ
#include	"..\objdata\kusa3.ach"
#include	"..\objdata\kusa4.ach"				// ｲﾗﾝ
#include	"..\objdata\kusa6.ach"
#include	"..\objdata\kusa2.ach"
#include	"..\objdata\kusa5.ach"
#include	"..\objdata\kusa7.ach"
#include	"..\objdata\kusa11.ach"
#include	"..\objdata\kusa_s.ach"

#include	"..\objdata\ashiato1.ach"
#include	"..\objdata\ashiato2.ach"
#include	"..\objdata\ashiato3.ach"
#include	"..\objdata\suna3.ach"
#include	"..\objdata\suna4.ach"

#include	"..\objdata\shibuki3.ach"

#include	"..\objdata\mizu1.ach"
#include	"..\objdata\mizu2.ach"
#include	"..\objdata\mizu3.ach"

#include	"..\objdata\trai_hidew.ach"
#include	"..\objdata\trai_hider.ach"
#include	"..\objdata\trai_hides.ach"

#include	"..\objdata\onsen.ach"

#include	"..\objdata\gym_o04.acl"
#include	"..\objdata\gym04_1.ach"
#include	"..\objdata\gym04_2.ach"

#include	"..\objdata\awa.ach"

#include	"..\objdata\kirari.ach"
#include	"..\objdata\kirari.acl"

#include	"..\objdata\soratobu.ach"

//----------------------------------------------------------------------
//		外部参照
//----------------------------------------------------------------------
extern const u8 baggage_Character[];
extern const u16 baggage_Palette[];

//----------------------------------------------------------------------
//		ﾃﾞｰﾀﾌﾟﾛﾄ
//----------------------------------------------------------------------
static const SXYObjHead main_hero_Head;
static const SXYObjHead main_hero_c0_Head;
static const SXYObjHead main_hero_c1_Head;
static const SXYObjHead main_hero_swim_Head;
static const SXYObjHead main_hero_hiden_Head;
static const SXYObjHead main_hero_div_Head;
static const SXYObjHead main_hero_fish_Head;
static const SXYObjHead main_hero_joro_Head;

static const SXYObjHead main_hine_Head;
static const SXYObjHead main_hine_c0_Head;
static const SXYObjHead main_hine_c1_Head;
static const SXYObjHead main_hine_swim_Head;
static const SXYObjHead main_hine_hiden_Head;
static const SXYObjHead main_hine_div_Head;
static const SXYObjHead main_hine_fish_Head;
static const SXYObjHead main_hine_joro_Head;

static const SXYObjHead BigManHead0;

static const SXYObjHead opp_01_Head;
static const SXYObjHead opp_02_Head;
static const SXYObjHead opp_03_Head;
static const SXYObjHead opp_04_Head;
static const SXYObjHead opp_05_Head;
static const SXYObjHead opp_06_Head;
static const SXYObjHead opp_07_Head;
static const SXYObjHead opp_08_Head;
static const SXYObjHead opp_09_Head;
static const SXYObjHead opp_10_Head;
static const SXYObjHead opp_11_Head;
static const SXYObjHead opp_12_Head;
static const SXYObjHead opp_13_Head;
static const SXYObjHead opp_14_Head;
static const SXYObjHead opp_15_Head;
static const SXYObjHead opp_16_Head;
static const SXYObjHead opp_17_Head;
static const SXYObjHead opp_18_Head;
static const SXYObjHead opp_19_Head;
static const SXYObjHead opp_20_Head;
static const SXYObjHead opp_21_Head;
static const SXYObjHead opp_22_Head;
static const SXYObjHead opp_23_Head;
static const SXYObjHead opp_24_Head;
static const SXYObjHead opp_25_Head;
static const SXYObjHead opp_26_Head;
static const SXYObjHead opp_27_Head;
static const SXYObjHead opp_28_Head;
static const SXYObjHead opp_29_Head;
static const SXYObjHead opp_30_Head;
static const SXYObjHead opp_31_Head;
static const SXYObjHead opp_32_Head;
static const SXYObjHead opp_33_Head;
static const SXYObjHead opp_34_Head;
static const SXYObjHead opp_35_Head;
static const SXYObjHead opp_36_Head;
static const SXYObjHead opp_37_Head;
static const SXYObjHead opp_38_Head;
static const SXYObjHead opp_39_Head;
static const SXYObjHead opp_40_Head;
static const SXYObjHead opp_41_Head;
static const SXYObjHead opp_42_Head;
static const SXYObjHead opp_43_Head;
static const SXYObjHead opp_44_Head;
static const SXYObjHead opp_45_Head;
static const SXYObjHead opp_46_Head;
static const SXYObjHead opp_47_Head;
static const SXYObjHead opp_48_Head;
static const SXYObjHead opp_49_Head;
static const SXYObjHead opp_50_Head;
static const SXYObjHead opp_51_Head;
static const SXYObjHead opp_52_Head;
static const SXYObjHead opp_53_Head;
static const SXYObjHead op_nurse_Head;
static const SXYObjHead o_pokeb_Head;
static const SXYObjHead op_odama_Head;
static const SXYObjHead opp_54_Head;
static const SXYObjHead opp_55_Head;
static const SXYObjHead op_intrvm_Head;
static const SXYObjHead op_intrvf_Head;
static const SXYObjHead op_7oyaji1_Head;
static const SXYObjHead op_7oyaji2_Head;
static const SXYObjHead op_7oyaji3_Head;
static const SXYObjHead op_7oyaji4_Head;
static const SXYObjHead op_7oyaji5_Head;
static const SXYObjHead op_7oyaji6_Head;
static const SXYObjHead op_7oyaji7_Head;
static const SXYObjHead op_shopm_Head;
static const SXYObjHead op_shopf_Head;
static const SXYObjHead op_pcgirl_Head;
static const SXYObjHead op_artist_Head;
static const SXYObjHead op_camera_Head;
static const SXYObjHead op_waruken_Head; 
static const SXYObjHead op_dbnsya_Head; 
static const SXYObjHead op_aquam_Head; 
static const SXYObjHead op_aquaf_Head; 
static const SXYObjHead op_magm_Head; 
static const SXYObjHead op_magf_Head; 
static const SXYObjHead op_4kgt_Head; 
static const SXYObjHead op_4fyu_Head; 
static const SXYObjHead op_4prm_Head; 
static const SXYObjHead op_4gnj_Head; 
static const SXYObjHead op_jrttj_Head; 
static const SXYObjHead op_jrtuk_Head; 
static const SXYObjHead op_jrtsn_Head; 
static const SXYObjHead op_jrair_Head; 
static const SXYObjHead op_jrsnr_Head; 
static const SXYObjHead op_jrnag_Head; 
static const SXYObjHead op_jr2f_Head; 
static const SXYObjHead op_jr2r_Head; 
static const SXYObjHead op_jrmkr_Head; 
static const SXYObjHead op_champ_Head; 
static const SXYObjHead op_mitsru_Head; 
static const SXYObjHead op_sup_Head; 
static const SXYObjHead op_onsen_Head;
static const SXYObjHead op_latias_Head;
static const SXYObjHead op_latios_Head;
static const SXYObjHead op_gba_Head;
static const SXYObjHead op_sikai_Head;
static const SXYObjHead op_aquab_Head;
static const SXYObjHead op_magb_Head;
static const SXYObjHead op_kiog_Head;
static const SXYObjHead op_grdn_Head;
static const SXYObjHead o_kaseki_Head;
static const SXYObjHead op_densets0_Head;
static const SXYObjHead op_densets1_Head;
static const SXYObjHead op_densets2_Head;
static const SXYObjHead op_eneco_Head;
static const SXYObjHead op_kakreon_Head;
static const SXYObjHead op_kiog_mc_Head;
static const SXYObjHead op_grdn_mc_Head;
static const SXYObjHead op_tycoon_Head;
static const SXYObjHead op_jiguma_Head;
static const SXYObjHead op_pika_Head;
static const SXYObjHead op_mariruri_Head;
static const SXYObjHead op_camome_Head;
static const SXYObjHead op_kakreon_bridge_Head;
static const SXYObjHead op_ukib_Head;
static const SXYObjHead op_ruriri_Head;
static const SXYObjHead op_mama_Head;

static const SXYObjHead hob_gds1_Head;
static const SXYObjHead hob_gds2_Head;
static const SXYObjHead hob_gds3_Head;
static const SXYObjHead hob_gds4_Head;
static const SXYObjHead hob_gds5_Head;
static const SXYObjHead hob_gds6_Head;

static const SXYObjHead o_tachigi1_Head;
static const SXYObjHead o_crushiw_Head;
static const SXYObjHead o_pushiw_Head;

static const SXYObjHead o_ship1_Head;

static const SXYObjHead SeedHead;
static const SXYObjHead Seed16x16Head;
static const SXYObjHead Seed16x32Head;

static const SXYObjHead truck_Head;
static const SXYObjHead hikobj1_Head;
static const SXYObjHead hikobj2_Head;
static const SXYObjHead opobj1_Head;
static const SXYObjHead opobj2_Head;
static const SXYObjHead cargo1_Head;
static const SXYObjHead ropeway_Head;
static const SXYObjHead ship_obj_Head;
static const SXYObjHead o_subm_Head;

static const SXYObjHead doll1_Head;
static const SXYObjHead doll2_Head;
static const SXYObjHead doll3_Head;
static const SXYObjHead doll4_Head;
static const SXYObjHead doll5_Head;
static const SXYObjHead doll6_Head;
static const SXYObjHead doll7_Head;
static const SXYObjHead doll8_Head;
static const SXYObjHead doll9_Head;
static const SXYObjHead doll10_Head;
static const SXYObjHead doll11_Head;
static const SXYObjHead doll12_Head;
static const SXYObjHead doll13_Head;
static const SXYObjHead doll14_Head;
static const SXYObjHead doll15_Head;
static const SXYObjHead doll16_Head;
static const SXYObjHead doll17_Head;
static const SXYObjHead doll18_Head;
static const SXYObjHead doll19_Head;
static const SXYObjHead doll20_Head;
static const SXYObjHead doll21_Head;
static const SXYObjHead doll22_Head;
static const SXYObjHead doll23_Head;
static const SXYObjHead doll24_Head;
static const SXYObjHead doll25_Head;

static const SXYObjHead cushion1_Head;
static const SXYObjHead cushion2_Head;
static const SXYObjHead cushion3_Head;
static const SXYObjHead cushion4_Head;
static const SXYObjHead cushion5_Head;
static const SXYObjHead cushion6_Head;
static const SXYObjHead cushion7_Head;
static const SXYObjHead cushion8_Head;
static const SXYObjHead cushion9_Head;
static const SXYObjHead cushion10_Head;

static const SXYObjHead bigdoll1_Head;
static const SXYObjHead bigdoll2_Head;
static const SXYObjHead bigdoll3_Head;
static const SXYObjHead bigdoll4_Head;
static const SXYObjHead bigdoll5_Head;
static const SXYObjHead bigdoll6_Head;
static const SXYObjHead bigdoll7_Head;
static const SXYObjHead bigdoll8_Head;
static const SXYObjHead bigdoll9_Head;
static const SXYObjHead bigdoll10_Head;

static const SXYObjHead hero_Head;
static const SXYObjHead hero_c0_Head;
static const SXYObjHead hero_c1_Head;
static const SXYObjHead hero_swim_Head;
static const SXYObjHead hero_hiden_Head;
static const SXYObjHead hero_remodel_Head;
static const SXYObjHead contest_hero_Head;

static const SXYObjHead hine_Head;
static const SXYObjHead hine_c0_Head;
static const SXYObjHead hine_c1_Head;
static const SXYObjHead hine_swim_Head;
static const SXYObjHead hine_hiden_Head;
static const SXYObjHead hine_remodel_Head;
static const SXYObjHead contest_hine_Head;

static const actHeader Shade8x8ActHead;
static const actHeader Shade16x8ActHead;
static const actHeader Shade32x8ActHead;
static const actHeader Shade64x32ActHead;
static const actHeader ShortGrassShakeActHead;
static const actHeader RippleActHead;
static const actHeader Ash16x16ActHead;
static const actHeader PokeSwim32x32ActHead;
static const actHeader ExitCursor16x16ActHead;
static const actHeader HokoriActHead;
static const actHeader ShortGrassFallActHead;
static const actHeader FootPrintActHead;
static const actHeader FootPrintDeepActHead;
static const actHeader FootPrintCycleActHead;
static const actHeader SplashSeaActHead;
static const actHeader SplashActHead;
static const actHeader SplashWaterActHead;
static const actHeader LongGrassShakeActHead;
static const actHeader LongGrassFallActHead;
static const actHeader ShortGrassEncountActHead;
static const actHeader LongGrassEncountActHead;
static const actHeader SandEncountActHead;
static const actHeader DeepSandHead;
static const actHeader WaterEncountActHead;
static const actHeader RefAffActHead;
static const actHeader SeedEffectActHead;
static const actHeader TraiHideWActHead;
static const actHeader TraiHideRActHead;
static const actHeader TraiHideSActHead;
static const actHeader PokeSoraActHead;
static const actHeader GrassSActHead;
static const actHeader OnsenActHead;
static const actHeader GymSandActHead;
static const actHeader GayserActHead;
static const actHeader AwaActHead;
static const actHeader KirariActHead;

//======================================================================
//		ｲﾍﾞﾝﾄ OBJ 動作ﾃｰﾌﾞﾙ
//======================================================================
void (* const EvObjMoveTbl[])( actWork * ) =
{
	EvObj_DmyMove,					// MV_DMY
	EvObj_DirectMove,				// MV_OFF
	EvObj_RandomMove,				// MV_ON
	EvObj_VMove,					// MV_VON
	EvObj_VMove,					// MV_VOND
	EvObj_HMove,					// MV_HON
	EvObj_HMove,					// MV_HONR
	EvObj_DirectSite,				// MV_DOWN
	EvObj_DirectSite,				// MV_UP
	EvObj_DirectSite,				// MV_LEFT
	EvObj_DirectSite,				// MV_RIGHT
	EvObj_HeroMove,					// MV_HERO
	EvObj_Seed,						// MV_SEED
	EvObj_DirectVSite,				// MV_V
	EvObj_DirectHSite,				// MV_H
	EvObj_DirectULSite,				// MV_UL
	EvObj_DirectURSite,				// MV_UR
	EvObj_DirectDLSite,				// MV_DL
	EvObj_DirectDRSite,				// MV_DR
	EvObj_DirectLVSite,				// MV_LV
	EvObj_DirectRVSite,				// MV_RV
	EvObj_DirectUHSite,				// MV_UH
	EvObj_DirectDHSite,				// MV_DH
	EvObj_DirectSpinL,				// MV_SPINL
	EvObj_DirectSpinR,				// MV_SPINR
	EvObj_Route2Pos,				// MV_RTU
	EvObj_Route2Pos,				// MV_RTD
	EvObj_Route2Pos,				// MV_RTL
	EvObj_Route2Pos,				// MV_RTR
	EvObj_RouteURLD,				// MV_RTURLD
	EvObj_RouteRLDU,				// MV_RTRLDU
	EvObj_RouteDURL,				// MV_RTDURL
	EvObj_RouteLDUR,				// MV_RTLDUR
	EvObj_RouteULRD,				// MV_RTULRD
	EvObj_RouteLRDU,				// MV_RTLRDU
	EvObj_RouteDULR,				// MV_RTDULR
	EvObj_RouteRDUL,				// MV_RTRDUL
	EvObj_RouteLUDR,				// MV_RTLUDR
	EvObj_RouteUDRL,				// MV_RTUDRL
	EvObj_RouteRLUD,				// MV_RTRLUD
	EvObj_RouteDRLU,				// MV_RTDRLU
	EvObj_RouteRUDL,				// MV_RTRUDL
	EvObj_RouteUDLR,				// MV_RTUDLR
	EvObj_RouteLRUD,				// MV_RTLRUD
	EvObj_RouteDLRU,				// MV_RTDLRU
	EvObj_RouteUL,					// MV_RTUL
	EvObj_RouteDR,					// MV_RTDR
	EvObj_RouteLD,					// MV_RTLD
	EvObj_RouteRU,					// MV_RTRU
	EvObj_RouteUR,					// MV_RTUR
	EvObj_RouteDL,					// MV_RTDL
	EvObj_RouteLU,					// MV_RTLU
	EvObj_RouteRD,					// MV_RTRD
	EvObj_CopyMove,					// MV_COPYD
	EvObj_CopyMove,					// MV_COPYU
	EvObj_CopyMove,					// MV_COPYL
	EvObj_CopyMove,					// MV_COPYR
	EvObj_HideWood,					// MV_HIDEW
	EvObj_HideRock,					// MV_HIDER
	EvObj_CopyMoveGrass,			// MV_COPYGRASSD
	EvObj_CopyMoveGrass,			// MV_COPYGRASSU
	EvObj_CopyMoveGrass,			// MV_COPYGRASSL
	EvObj_CopyMoveGrass,			// MV_COPYGRASSR
	EvObj_HideSand,					// MV_HIDES
	EvObj_StayWalk1,				// MV_STAYWALK1D
	EvObj_StayWalk1,				// MV_STAYWALK1U
	EvObj_StayWalk1,				// MV_STAYWALK1L
	EvObj_StayWalk1,				// MV_STAYWALK1R
	EvObj_StayWalk2,				// MV_STAYWALK2D
	EvObj_StayWalk2,				// MV_STAYWALK2U
	EvObj_StayWalk2,				// MV_STAYWALK2L
	EvObj_StayWalk2,				// MV_STAYWALK2R
	EvObj_StayWalk4,				// MV_STAYWALK4D
	EvObj_StayWalk4,				// MV_STAYWALK4U
	EvObj_StayWalk4,				// MV_STAYWALK4L
	EvObj_StayWalk4,				// MV_STAYWALK4R
	EvObj_Vanish,					// MV_VANISH
};

//======================================================================
//		ｲﾍﾞﾝﾄ OBJ 動作制限ﾌﾗｸﾞﾃｰﾌﾞﾙ
//======================================================================
const u8 EvObjMoveLimitFlagTbl[] =
{
	0,								// MV_DMY
	0,								// MV_OFF
	1,								// MV_ON
	1,								// MV_VON
	1,								// MV_VOND
	1,								// MV_HON
	1,								// MV_HONR
	0,								// MV_DOWN
	0,								// MV_UP
	0,								// MV_LEFT
	0,								// MV_RIGHT
	0,								// MV_HERO
	0,								// MV_SEED
	0,								// MV_V
	0,								// MV_H
	0,								// MV_UL
	0,								// MV_UR
	0,								// MV_DL
	0,								// MV_DR
	0,								// MV_LV
	0,								// MV_RV
	0,								// MV_UH
	0,								// MV_DH
	0,								// MV_SPINL
	0,								// MV_SPINR
	1,								// MV_RTU
	1,								// MV_RTD
	1,								// MV_RTL
	1,								// MV_RTR
	1,								// MV_RTURLD
	1,								// MV_RTRLDU
	1,								// MV_RTDURL
	1,								// MV_RTLDUR
	1,								// MV_RTULRD
	1,								// MV_RTLRDU
	1,								// MV_RTDULR
	1,								// MV_RTRDUL
	1,								// MV_RTLUDR
	1,								// MV_RTUDRL
	1,								// MV_RTRLUD
	1,								// MV_RTDRLU
	1,								// MV_RTRUDL
	1,								// MV_RTUDLR
	1,								// MV_RTLRUD
	1,								// MV_RTDLRU
	1,								// MV_RTUL
	1,								// MV_RTDR
	1,								// MV_RTLD
	1,								// MV_RTRU
	1,								// MV_RTUR
	1,								// MV_RTDL
	1,								// MV_RTLU
	1,								// MV_RTRD
	1,								// MV_COPYD
	1,								// MV_COPYU
	1,								// MV_COPYL
	1,								// MV_COPYR
	0,								// MV_HIDEW
	0,								// MV_HIDER
	1,								// MV_COPYGRASSD
	1,								// MV_COPYGRASSU
	1,								// MV_COPYGRASSL
	1,								// MV_COPYGRASSR
	0,								// MV_HIDES
	0,								// MV_STAYWALK1D
	0,								// MV_STAYWALK1U
	0,								// MV_STAYWALK1L
	0,								// MV_STAYWALK1R
	0,								// MV_STAYWALK2D
	0,								// MV_STAYWALK2U
	0,								// MV_STAYWALK2L
	0,								// MV_STAYWALK2R
	0,								// MV_STAYWALK4D
	0,								// MV_STAYWALK4U
	0,								// MV_STAYWALK4L
	0,								// MV_STAYWALK4R
	0,								// MV_VANISH
};

//======================================================================
//		ｲﾍﾞﾝﾄ OBJ 基本動作方向
//======================================================================
const u8 EvObjDefaultSiteTbl[] =
{
	SITE_D,							// MV_DMY
	SITE_D,							// MV_OFF
	SITE_D,							// MV_ON
	SITE_U,							// MV_VON
	SITE_D,							// MV_VOND
	SITE_L,							// MV_HON
	SITE_R,							// MV_HONR
	SITE_U,							// MV_UP
	SITE_D,							// MV_DOWN
	SITE_L,							// MV_LEFT
	SITE_R,							// MV_RIGHT
	SITE_D,							// MV_HERO
	SITE_D,							// MV_SEED
	SITE_D,							// MV_V
	SITE_L,							// MV_H
	SITE_U,							// MV_UL
	SITE_U,							// MV_U
	SITE_D,							// MV_DL
	SITE_D,							// MV_DR
	SITE_D,							// MV_LV
	SITE_D,							// MV_RV
	SITE_U,							// MV_UH
	SITE_D,							// MV_DH
	SITE_D,							// MV_SPINL
	SITE_D,							// MV_SPINR
	SITE_U,							// MV_RTU
	SITE_D,							// MV_RTD
	SITE_L,							// MV_RTL
	SITE_R,							// MV_RTR
	SITE_U,							// MV_RTURLD
	SITE_R,							// MV_RTRLDU
	SITE_D,							// MV_RTDURL
	SITE_L,							// MV_RTLDUR
	SITE_U,							// MV_RTULRD
	SITE_L,							// MV_RTLRDU
	SITE_D,							// MV_RTDULR
	SITE_R,							// MV_RTRDUL
	SITE_L,							// MV_RTLUDR
	SITE_U,							// MV_RTUDRL
	SITE_R,							// MV_RTRLUD
	SITE_D,							// MV_RTDRLU
	SITE_R,							// MV_RTRUDL
	SITE_U,							// MV_RTUDLR
	SITE_L,							// MV_RTLRUD
	SITE_D,							// MV_RTDLRU
	SITE_U,							// MV_RTUL
	SITE_D,							// MV_RTDR
	SITE_L,							// MV_RTLD
	SITE_R,							// MV_RTRU
	SITE_U,							// MV_RTUR
	SITE_D,							// MV_RTDL
	SITE_L,							// MV_RTLU
	SITE_R,							// MV_RTRD
	SITE_U,							// MV_COPYU
	SITE_D,							// MV_COPYD
	SITE_L,							// MV_COPYL
	SITE_R,							// MV_COPYR
	SITE_D,							// MV_HIDEW
	SITE_D,							// MV_HIDER
	SITE_U,							// MV_COPYGRASSD
	SITE_D,							// MV_COPYGRASSU
	SITE_L,							// MV_COPYGRASSL
	SITE_R,							// MV_COPYGRASSR
	SITE_D,							// MV_HIDES
	SITE_D,							// MV_STAYWALK1D
	SITE_U,							// MV_STAYWALK1U
	SITE_L,							// MV_STAYWALK1L
	SITE_R,							// MV_STAYWALK1R
	SITE_D,							// MV_STAYWALK2D
	SITE_U,							// MV_STAYWALK2U
	SITE_L,							// MV_STAYWALK2L
	SITE_R,							// MV_STAYWALK2R
	SITE_D,							// MV_STAYWALK4D
	SITE_U,							// MV_STAYWALK4U
	SITE_L,							// MV_STAYWALK4L
	SITE_R,							// MV_STAYWALK4R
	SITE_D,							// MV_VANISH
};

//======================================================================
//		ｲﾍﾞﾝﾄ OBJ ﾍｯﾀﾞﾃｰﾌﾞﾙ
//======================================================================
const SXYObjHead * const SxyObjHeadTbl[] =
{
	&main_hero_Head,				// 0
	&main_hero_c0_Head,				// 1
	&main_hero_swim_Head,			// 2
	&main_hero_hiden_Head,			// 3
	&BigManHead0,					// 4
	&opp_01_Head,					// 5 
	&opp_02_Head,					// 6
	&opp_03_Head,					// 7
	&opp_04_Head,					// 8
	&opp_05_Head,					// 9
	&opp_06_Head,					// 10
	&opp_07_Head,					// 11
	&opp_08_Head,					// 12
	&opp_09_Head,					// 13
	&opp_10_Head,					// 14
	&opp_11_Head,					// 15
	&opp_12_Head,					// 16
	&opp_13_Head,					// 17
	&opp_14_Head,					// 18
	&opp_15_Head,					// 19
	&opp_16_Head,					// 20
	&opp_17_Head,					// 21
	&opp_18_Head,					// 22
	&opp_19_Head,					// 23
	&opp_20_Head,					// 24
	&opp_21_Head,					// 25
	&opp_22_Head,					// 26
	&opp_23_Head,					// 27
	&opp_24_Head,					// 28
	&opp_25_Head,					// 29
	&opp_26_Head,					// 30
	&opp_27_Head,					// 31
	&opp_28_Head,					// 32
	&opp_29_Head,					// 33
	&opp_30_Head,					// 34
	&opp_31_Head,					// 35
	&opp_32_Head,					// 36
	&opp_33_Head,					// 37
	&opp_34_Head,					// 38
	&opp_35_Head,					// 39
	&opp_36_Head,					// 40
	&opp_37_Head,					// 41
	&opp_38_Head,					// 42
	&opp_39_Head,					// 43
	&opp_40_Head,					// 44
	&opp_41_Head,					// 45
	&opp_42_Head,					// 46
	&opp_43_Head,					// 47
	&opp_44_Head,					// 48
	&opp_45_Head,					// 49
	&opp_46_Head,					// 50
	&opp_47_Head,					// 51
	&opp_48_Head,					// 52
	&opp_49_Head,					// 53
	&opp_50_Head,					// 54
	&opp_51_Head,					// 55
	&opp_52_Head,					// 56
	&opp_53_Head,					// 57
	&op_nurse_Head,					// 58
	&o_pokeb_Head,					// 59
	&SeedHead,						// 60
	&Seed16x16Head,					// 61
	&Seed16x32Head,					// 62
	&main_hero_c1_Head,				// 63
	&op_odama_Head,					// 64
	&opp_54_Head,					// 65
	&opp_55_Head,					// 66
	&op_intrvm_Head,				// 67
	&op_intrvf_Head,				// 68
	&op_7oyaji1_Head,				// 69
	&op_7oyaji2_Head,				// 70
	&op_7oyaji3_Head,				// 71
	&op_7oyaji4_Head,				// 72
	&op_7oyaji5_Head,				// 73
	&op_7oyaji6_Head,				// 74
	&op_7oyaji7_Head,				// 75
	&hob_gds1_Head,					// 76
	&hob_gds2_Head,					// 77
	&hob_gds3_Head,					// 78
	&hob_gds4_Head,					// 79
	&hob_gds5_Head,					// 80
	&hob_gds6_Head,					// 81
	&o_tachigi1_Head,				// 82
	&op_shopm_Head,					// 83
	&op_shopf_Head,					// 84
	&op_pcgirl_Head,				// 85
	&o_crushiw_Head,				// 86
	&o_pushiw_Head,					// 87
	&o_ship1_Head,					// 88
	&main_hine_Head,				// 89
	&main_hine_c0_Head,				// 90
	&main_hine_c1_Head,				// 91
	&main_hine_swim_Head,			// 92
	&main_hine_hiden_Head,			// 93
	&truck_Head,					// 94
	&hikobj1_Head,					// 95
	&hikobj2_Head,					// 96
	&opobj1_Head,					// 97
	&opobj2_Head,					// 98
	&op_artist_Head,				// 99
	&hero_Head,						// 100
	&hero_c0_Head,					// 101
	&hero_c1_Head,					// 102
	&hero_swim_Head,				// 103
	&hero_hiden_Head,				// 104
	&hine_Head,						// 105
	&hine_c0_Head,					// 106
	&hine_c1_Head,					// 107
	&hine_swim_Head,				// 108
	&hine_hiden_Head,				// 109
	&op_camera_Head,				// 110
	&main_hero_div_Head,			// 111
	&main_hine_div_Head,			// 112
	&cargo1_Head,					// 113
	&ropeway_Head,					// 114
	&op_waruken_Head,				// 115
	&op_dbnsya_Head,				// 116
	&op_aquam_Head,					// 117
	&op_aquaf_Head,					// 118
	&op_magm_Head,					// 119
	&op_magf_Head,					// 120
	&op_4kgt_Head,					// 121
	&op_4fyu_Head,					// 122
	&op_4prm_Head,					// 123
	&op_4gnj_Head,					// 124
	&op_jrttj_Head,					// 125
	&op_jrtuk_Head,					// 126
	&op_jrtsn_Head,					// 127
	&op_jrair_Head,					// 128
	&op_jrsnr_Head,					// 129
	&op_jrnag_Head,					// 130
	&op_jr2f_Head,					// 131
	&op_jr2r_Head,					// 132
	&op_jrmkr_Head,					// 133
	&op_champ_Head,					// 134
	&op_mitsru_Head,				// 135
	&op_sup_Head,					// 136
	&main_hero_fish_Head,			// 137
	&main_hine_fish_Head,			// 138
	&op_onsen_Head,					// 139
	&ship_obj_Head,					// 140
	&o_subm_Head,					// 141
	&doll1_Head,					// 142
	&doll2_Head,					// 143
	&doll3_Head,					// 144
	&doll4_Head,					// 145
	&doll5_Head,					// 146
	&doll6_Head,					// 147
	&doll7_Head,					// 148
	&doll8_Head,					// 149
	&doll9_Head,					// 150
	&doll10_Head,					// 151
	&doll11_Head,					// 152
	&doll12_Head,					// 153
	&doll13_Head,					// 154
	&doll14_Head,					// 155
	&doll15_Head,					// 156
	&doll16_Head,					// 157
	&doll17_Head,					// 158
	&doll18_Head,					// 159
	&doll19_Head,					// 160
	&doll20_Head,					// 161
	&doll21_Head,					// 162
	&doll22_Head,					// 163
	&doll23_Head,					// 164
	&doll24_Head,					// 165
	&doll25_Head,					// 166
	&cushion1_Head,					// 167
	&cushion2_Head,					// 168
	&cushion3_Head,					// 169
	&cushion4_Head,					// 170
	&cushion5_Head,					// 171
	&cushion6_Head,					// 172
	&cushion7_Head,					// 173
	&cushion8_Head,					// 174
	&cushion9_Head,					// 175
	&cushion10_Head,				// 176
	&bigdoll1_Head,					// 177
	&bigdoll2_Head,					// 178
	&bigdoll3_Head,					// 179
	&bigdoll4_Head,					// 180
	&bigdoll5_Head,					// 181
	&bigdoll6_Head,					// 182
	&bigdoll7_Head,					// 183
	&bigdoll8_Head,					// 184
	&bigdoll9_Head,					// 185
	&bigdoll10_Head,				// 186
	&op_latias_Head,				// 187
	&op_latios_Head,				// 188
	&op_gba_Head,					// 189
	&op_sikai_Head,					// 190
	&main_hero_joro_Head,			// 191
	&main_hine_joro_Head,			// 192
	&hero_remodel_Head,				// 193
	&hine_remodel_Head,				// 194
	&op_aquab_Head,					// 195
	&op_magb_Head,					// 196
	&op_kiog_Head,					// 197
	&op_grdn_Head,					// 198
	&o_kaseki_Head,					// 199
	&op_densets0_Head,				// 200
	&op_densets1_Head,				// 201
	&op_densets2_Head,				// 202
	&op_eneco_Head,					// 203
	&op_kakreon_Head,				// 204
	&op_kiog_mc_Head,				// 205
	&op_grdn_mc_Head,				// 206
	&op_tycoon_Head,				// 207
	&op_jiguma_Head,				// 208
	&op_pika_Head,					// 209
	&op_mariruri_Head,				// 210
	&op_camome_Head,				// 211
	&op_kakreon_bridge_Head,		// 212
	&op_ukib_Head,					// 213
	&op_ruriri_Head,				// 214
	&op_mama_Head,					// 215
	&contest_hero_Head,				// 216
	&contest_hine_Head,				// 217
};

//======================================================================
//		ｲﾍﾞﾝﾄ OBJ 付属ｱｸﾀｰﾃｰﾌﾞﾙ
//======================================================================
const actHeader * const EvActHeadTbl[] =
{
	&Shade8x8ActHead,				// 0	影8x8
	&Shade16x8ActHead,				// 1	影16x8
	&Shade32x8ActHead,				// 2	影32x8
	&Shade64x32ActHead,				// 3	影64x32
	&ShortGrassShakeActHead,		// 4	短い草揺れ
	&RippleActHead,					// 5	水溜り
	&Ash16x16ActHead,				// 6	灰
	&PokeSwim32x32ActHead,			// 7	なみのりﾎﾟｹﾓﾝ
	&ExitCursor16x16ActHead,		// 8	出口ｶｰｿﾙ
	&HokoriActHead,					// 9	砂埃
	&ShortGrassFallActHead,			// 10	短い草ﾁﾘ
	&FootPrintActHead,				// 11	足跡1
	&SplashSeaActHead,				// 12	飛沫3
	&SplashActHead,					// 13	水1
	&SplashWaterActHead,			// 14	水2
	&LongGrassShakeActHead,			// 15	草4
	&LongGrassFallActHead,			// 16	草6
	&ShortGrassEncountActHead,		// 17	草2
	&LongGrassEncountActHead,		// 18	草5
	&SandEncountActHead,			// 19	砂3
	&WaterEncountActHead,			// 20	水3
	&RefAffActHead,					// 21	映りこみ拡縮
	&SeedEffectActHead,				// 22	種ｴﾌｪｸﾄ0
	&FootPrintDeepActHead,			// 23	足跡2
	&TraiHideWActHead,				// 24	ﾄﾚｰﾅｰ木
	&TraiHideRActHead,				// 25	ﾄﾚｰﾅｰ岩
	&PokeSoraActHead,				// 26	そらとびﾎﾟｹﾓﾝ
	&FootPrintCycleActHead,			// 27	足跡3
	&TraiHideSActHead,				// 28	ﾄﾚｰﾅｰ砂
	&DeepSandHead,					// 29	砂4
	&GrassSActHead,					// 30	短い草s
	&OnsenActHead,					// 31	温泉
	&GymSandActHead,				// 32	ｼﾞﾑ砂煙
	&GayserActHead,					// 33	間欠泉
	&AwaActHead,					// 34	泡
	&KirariActHead,					// 35	星ｷﾗﾘ
};

//**********************************************************************
//	各ﾃﾞｰﾀ
//**********************************************************************

//======================================================================
//		ｱﾆﾒﾄﾗﾝｽﾃﾞｰﾀﾃｰﾌﾞﾙ
//======================================================================
//------------------------------------------
//	ﾋｰﾛｰ	16x32
//------------------------------------------
static const actAnmData hero_celltrans[] =
{
//	{ 転送先ｷｬﾗﾃﾞｰﾀｱﾄﾞﾚｽ, 転送量 }
	{ &hero_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &hero_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &hero_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &hero_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &hero_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &hero_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &hero_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &hero_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &hero_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8

	{ &hero_Character[(0x20*8) * 9], 0x20*8},		// 下	ﾀﾞｯｼｭ停止	0
	{ &hero_Character[(0x20*8) * 10], 0x20*8},		// 上	ﾀﾞｯｼｭ停止	1
	{ &hero_Character[(0x20*8) * 11], 0x20*8},		// 左右 ﾀﾞｯｼｭ停止	2
	{ &hero_Character[(0x20*8) * 12], 0x20*8},		// 下 	ﾀﾞｯｼｭ歩行1	3
	{ &hero_Character[(0x20*8) * 13], 0x20*8},		// 下 	ﾀﾞｯｼｭ歩行2	4
	{ &hero_Character[(0x20*8) * 14], 0x20*8},		// 上	ﾀﾞｯｼｭ歩行1	5
	{ &hero_Character[(0x20*8) * 15], 0x20*8},		// 上	ﾀﾞｯｼｭ歩行2	6
	{ &hero_Character[(0x20*8) * 16], 0x20*8},		// 左右 ﾀﾞｯｼｭ歩行1	7
	{ &hero_Character[(0x20*8) * 17], 0x20*8},		// 左右 ﾀﾞｯｼｭ歩行2	8
};

//------------------------------------------
//	主人公自転車ﾚｰｽﾀｲﾌﾟ	32x32
//------------------------------------------
static const actAnmData cycle_r_h_celltrans[] =
{
	{ &c_hero0_Character[(0x20*16) * 0], 0x20*16},	// 下	停止	0
	{ &c_hero0_Character[(0x20*16) * 1], 0x20*16},	// 上	停止	1
	{ &c_hero0_Character[(0x20*16) * 2], 0x20*16},	// 左右	停止	2
	{ &c_hero0_Character[(0x20*16) * 3], 0x20*16},	// 下	歩行	3
	{ &c_hero0_Character[(0x20*16) * 4], 0x20*16},	// 下	歩行	4
	{ &c_hero0_Character[(0x20*16) * 5], 0x20*16},	// 上	歩行	5
	{ &c_hero0_Character[(0x20*16) * 6], 0x20*16},	// 上	歩行	6
	{ &c_hero0_Character[(0x20*16) * 7], 0x20*16},	// 左右	歩行	7
	{ &c_hero0_Character[(0x20*16) * 8], 0x20*16},	// 左右	歩行	8
};

//------------------------------------------
//	主人公自転車ｽﾎﾟｰﾂﾀｲﾌﾟ	32x32
//------------------------------------------
static const actAnmData cycle_s_h_celltrans[] =
{
	{ &c_hero1_Character[(0x20*16) * 0], 0x20*16},	// 下	停止	0
	{ &c_hero1_Character[(0x20*16) * 1], 0x20*16},	// 上	停止	1
	{ &c_hero1_Character[(0x20*16) * 2], 0x20*16},	// 左右	停止	2
	{ &c_hero1_Character[(0x20*16) * 3], 0x20*16},	// 下	歩行	3
	{ &c_hero1_Character[(0x20*16) * 4], 0x20*16},	// 下	歩行	4
	{ &c_hero1_Character[(0x20*16) * 5], 0x20*16},	// 上	歩行	5
	{ &c_hero1_Character[(0x20*16) * 6], 0x20*16},	// 上	歩行	6
	{ &c_hero1_Character[(0x20*16) * 7], 0x20*16},	// 左右	歩行	7
	{ &c_hero1_Character[(0x20*16) * 8], 0x20*16},	// 左右	歩行	8

	{ &c_hero1_Character[(0x20*16) * 9], 0x20*16},	// 下ﾌﾛﾝﾄ	0
	{ &c_hero1_Character[(0x20*16) * 10], 0x20*16},	// 下ﾌﾛﾝﾄ	1
	{ &c_hero1_Character[(0x20*16) * 11], 0x20*16},	// 下ﾘｱ		0
	{ &c_hero1_Character[(0x20*16) * 12], 0x20*16},	// 下ﾘｱ		1
	{ &c_hero1_Character[(0x20*16) * 13], 0x20*16},	// 上ﾌﾛﾝﾄ	0
	{ &c_hero1_Character[(0x20*16) * 14], 0x20*16},	// 上ﾌﾛﾝﾄ	1
	{ &c_hero1_Character[(0x20*16) * 15], 0x20*16},	// 上ﾘｱ		0
	{ &c_hero1_Character[(0x20*16) * 16], 0x20*16},	// 上ﾘｱ		1
	{ &c_hero1_Character[(0x20*16) * 17], 0x20*16},	// 左右ﾌﾛﾝﾄ	0
	{ &c_hero1_Character[(0x20*16) * 18], 0x20*16},	// 左右ﾌﾛﾝﾄ	1
	{ &c_hero1_Character[(0x20*16) * 19], 0x20*16},	// 左右ﾘｱ	0
	{ &c_hero1_Character[(0x20*16) * 20], 0x20*16},	// 左右ﾘｱ	1
	{ &c_hero1_Character[(0x20*16) * 21], 0x20*16},	// 下ｳｲﾘｰ	0
	{ &c_hero1_Character[(0x20*16) * 22], 0x20*16},	// 下ｳｲﾘｰ	1
	{ &c_hero1_Character[(0x20*16) * 23], 0x20*16},	// 上ｳｲﾘｰ	0
	{ &c_hero1_Character[(0x20*16) * 24], 0x20*16},	// 上ｳｲﾘｰ	1
	{ &c_hero1_Character[(0x20*16) * 25], 0x20*16},	// 左右ｳｲﾘｰ	0
	{ &c_hero1_Character[(0x20*16) * 26], 0x20*16},	// 左右ｳｲﾘｰ	1
};

//------------------------------------------
//	主人公波乗り	32x32
//------------------------------------------
static const actAnmData swim_h_celltrans[] =
{
	{ &h_swim_Character[(0x20*16) * 0], 0x20*16},	// 下	停止	0
	{ &h_swim_Character[(0x20*16) * 2], 0x20*16},	// 上	停止	1
	{ &h_swim_Character[(0x20*16) * 4], 0x20*16},	// 左右	停止	2
	{ &h_swim_Character[(0x20*16) * 0], 0x20*16},	// 下	歩行	3
	{ &h_swim_Character[(0x20*16) * 0], 0x20*16},	// 下	歩行	4
	{ &h_swim_Character[(0x20*16) * 2], 0x20*16},	// 上	歩行	5
	{ &h_swim_Character[(0x20*16) * 2], 0x20*16},	// 上	歩行	6
	{ &h_swim_Character[(0x20*16) * 4], 0x20*16},	// 左右	歩行	7
	{ &h_swim_Character[(0x20*16) * 4], 0x20*16},	// 左右	歩行	8
//	ｼﾞｬﾝﾌﾟ用
	{ &h_swim_Character[(0x20*16) * 1], 0x20*16},	// 下1			9
	{ &h_swim_Character[(0x20*16) * 3], 0x20*16},	// 上1			10
	{ &h_swim_Character[(0x20*16) * 5], 0x20*16},	// 左右1		11
};

//------------------------------------------
//	主人公ﾀﾞｲﾋﾞﾝｸﾞ	32x32
//------------------------------------------
static const actAnmData div_h_celltrans[] =
{
	{ &moguri_Character[(0x20*16) * 0], 0x20*16},	// 下	停止	0
	{ &moguri_Character[(0x20*16) * 1], 0x20*16},	// 上	停止	1
	{ &moguri_Character[(0x20*16) * 2], 0x20*16},	// 左右	停止	2
	{ &moguri_Character[(0x20*16) * 0], 0x20*16},	// 下	歩行	3
	{ &moguri_Character[(0x20*16) * 0], 0x20*16},	// 下	歩行	4
	{ &moguri_Character[(0x20*16) * 1], 0x20*16},	// 上	歩行	5
	{ &moguri_Character[(0x20*16) * 1], 0x20*16},	// 上	歩行	6
	{ &moguri_Character[(0x20*16) * 2], 0x20*16},	// 左右	歩行	7
	{ &moguri_Character[(0x20*16) * 2], 0x20*16},	// 左右	歩行	8
};

//------------------------------------------
//	秘伝技発生主人公	32x32
//------------------------------------------
static const actAnmData hiden_h_celltrans[] =
{
	{ &h_hiden_Character[(0x20*16) * 0], 0x20*16},	// 振りかざし 0
	{ &h_hiden_Character[(0x20*16) * 1], 0x20*16},	// 振りかざし 1
	{ &h_hiden_Character[(0x20*16) * 2], 0x20*16},	// 振りかざし 2
	{ &h_hiden_Character[(0x20*16) * 3], 0x20*16},	// 振りかざし 3
	{ &h_hiden_Character[(0x20*16) * 4], 0x20*16},	// 振りかざし 4
};

//------------------------------------------
//	太っちょ男	32x32
//------------------------------------------
static const actAnmData a_debu_celltrans[] =
{
	{ &a_debu_Character[(0x20*16) * 0], 0x20*16},	// 下	停止	0
	{ &a_debu_Character[(0x20*16) * 1], 0x20*16},	// 上	停止	1
	{ &a_debu_Character[(0x20*16) * 2], 0x20*16},	// 左右 停止	2
	{ &a_debu_Character[(0x20*16) * 3], 0x20*16},	// 下 	歩行	3
	{ &a_debu_Character[(0x20*16) * 4], 0x20*16},	// 上	歩行	4
	{ &a_debu_Character[(0x20*16) * 5], 0x20*16},	// 左右 歩行1	5
	{ &a_debu_Character[(0x20*16) * 6], 0x20*16},	// 左右 歩行2	6
};

//------------------------------------------
//	男の子1
//------------------------------------------
static const actAnmData opp_01_celltrans[] =
{
	{ &opp_01_Character[(0x20*4) * 0], 0x20*4},		// 下	停止	0
	{ &opp_01_Character[(0x20*4) * 1], 0x20*4},		// 上	停止	1
	{ &opp_01_Character[(0x20*4) * 2], 0x20*4},		// 左右 停止	2
	{ &opp_01_Character[(0x20*4) * 3], 0x20*4},		// 下 	歩行1	3
	{ &opp_01_Character[(0x20*4) * 4], 0x20*4},		// 下 	歩行2	4
	{ &opp_01_Character[(0x20*4) * 5], 0x20*4},		// 上	歩行1	5
	{ &opp_01_Character[(0x20*4) * 6], 0x20*4},		// 上	歩行2	6
	{ &opp_01_Character[(0x20*4) * 7], 0x20*4},		// 左右 歩行1	7
	{ &opp_01_Character[(0x20*4) * 8], 0x20*4},		// 左右 歩行2	8
};

//------------------------------------------
//	女の子1
//------------------------------------------
static const actAnmData opp_02_celltrans[] =
{
	{ &opp_02_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_02_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_02_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_02_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_02_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_02_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_02_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_02_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_02_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	少年1
//------------------------------------------
static const actAnmData opp_03_celltrans[] =
{
	{ &opp_03_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_03_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_03_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_03_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_03_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_03_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_03_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_03_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_03_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	少女1
//------------------------------------------
static const actAnmData opp_04_celltrans[] =
{
	{ &opp_04_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_04_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_04_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_04_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_04_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_04_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_04_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_04_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_04_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	少年2
//------------------------------------------
static const actAnmData opp_05_celltrans[] =
{
	{ &opp_05_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_05_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_05_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_05_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_05_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_05_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_05_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_05_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_05_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	少女2
//------------------------------------------
static const actAnmData opp_06_celltrans[] =
{
	{ &opp_06_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_06_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_06_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_06_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_06_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_06_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_06_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_06_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_06_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	男の子2
//------------------------------------------
static const actAnmData opp_07_celltrans[] =
{
	{ &opp_07_Character[(0x20*4) * 0], 0x20*4},		// 下	停止	0
	{ &opp_07_Character[(0x20*4) * 1], 0x20*4},		// 上	停止	1
	{ &opp_07_Character[(0x20*4) * 2], 0x20*4},		// 左右 停止	2
	{ &opp_07_Character[(0x20*4) * 3], 0x20*4},		// 下 	歩行1	3
	{ &opp_07_Character[(0x20*4) * 4], 0x20*4},		// 下 	歩行2	4
	{ &opp_07_Character[(0x20*4) * 5], 0x20*4},		// 上	歩行1	5
	{ &opp_07_Character[(0x20*4) * 6], 0x20*4},		// 上	歩行2	6
	{ &opp_07_Character[(0x20*4) * 7], 0x20*4},		// 左右 歩行1	7
	{ &opp_07_Character[(0x20*4) * 8], 0x20*4},		// 左右 歩行2	8
};

//------------------------------------------
//	女の子2
//------------------------------------------
static const actAnmData opp_08_celltrans[] =
{
	{ &opp_08_Character[(0x20*4) * 0], 0x20*4},		// 下	停止	0
	{ &opp_08_Character[(0x20*4) * 1], 0x20*4},		// 上	停止	1
	{ &opp_08_Character[(0x20*4) * 2], 0x20*4},		// 左右 停止	2
	{ &opp_08_Character[(0x20*4) * 3], 0x20*4},		// 下 	歩行1	3
	{ &opp_08_Character[(0x20*4) * 4], 0x20*4},		// 下 	歩行2	4
	{ &opp_08_Character[(0x20*4) * 5], 0x20*4},		// 上	歩行1	5
	{ &opp_08_Character[(0x20*4) * 6], 0x20*4},		// 上	歩行2	6
	{ &opp_08_Character[(0x20*4) * 7], 0x20*4},		// 左右 歩行1	7
	{ &opp_08_Character[(0x20*4) * 8], 0x20*4},		// 左右 歩行2	8
};

//------------------------------------------
//	少年3
//------------------------------------------
static const actAnmData opp_09_celltrans[] =
{
	{ &opp_09_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_09_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_09_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_09_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_09_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_09_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_09_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_09_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_09_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	少女3
//------------------------------------------
static const actAnmData opp_10_celltrans[] =
{
	{ &opp_10_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_10_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_10_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_10_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_10_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_10_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_10_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_10_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_10_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	少年4
//------------------------------------------
static const actAnmData opp_11_celltrans[] =
{
	{ &opp_11_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_11_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_11_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_11_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_11_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_11_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_11_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_11_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_11_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	少女4
//------------------------------------------
static const actAnmData opp_12_celltrans[] =
{
	{ &opp_12_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_12_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_12_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_12_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_12_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_12_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_12_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_12_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_12_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	大男
//------------------------------------------
static const actAnmData opp_13_celltrans[] =
{
	{ &opp_13_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_13_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_13_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_13_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_13_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_13_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_13_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_13_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_13_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	叔母ちゃん
//------------------------------------------
static const actAnmData opp_14_celltrans[] =
{
	{ &opp_14_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_14_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_14_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_14_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_14_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_14_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_14_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_14_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_14_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	叔父さん1
//------------------------------------------
static const actAnmData opp_15_celltrans[] =
{
	{ &opp_15_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_15_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_15_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_15_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_15_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_15_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_15_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_15_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_15_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	女性1
//------------------------------------------
static const actAnmData opp_16_celltrans[] =
{
	{ &opp_16_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_16_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_16_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_16_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_16_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_16_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_16_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_16_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_16_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	老人1
//------------------------------------------
static const actAnmData opp_17_celltrans[] =
{
	{ &opp_17_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_17_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_17_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_17_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_17_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_17_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_17_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_17_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_17_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	老婆1
//------------------------------------------
static const actAnmData opp_18_celltrans[] =
{
	{ &opp_18_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_18_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_18_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_18_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_18_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_18_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_18_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_18_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_18_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ｻﾗﾘｰﾏﾝ
//------------------------------------------
static const actAnmData opp_19_celltrans[] =
{
	{ &opp_19_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_19_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_19_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_19_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_19_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_19_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_19_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_19_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_19_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ｻﾗﾘｰｳｰﾏﾝ
//------------------------------------------
static const actAnmData opp_20_celltrans[] =
{
	{ &opp_20_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_20_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_20_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_20_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_20_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_20_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_20_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_20_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_20_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	叔父さん2
//------------------------------------------
static const actAnmData opp_21_celltrans[] =
{
	{ &opp_21_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_21_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_21_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_21_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_21_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_21_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_21_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_21_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_21_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	女性2
//------------------------------------------
static const actAnmData opp_22_celltrans[] =
{
	{ &opp_22_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_22_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_22_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_22_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_22_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_22_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_22_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_22_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_22_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	料理人2
//------------------------------------------
static const actAnmData opp_23_celltrans[] =
{
	{ &opp_23_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_23_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_23_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_23_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行1	3
	{ &opp_23_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行2	4
	{ &opp_23_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行1	5
	{ &opp_23_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行2	6
	{ &opp_23_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行1	7
	{ &opp_23_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ｳｪｰﾄﾚｽ
//------------------------------------------
static const actAnmData opp_24_celltrans[] =
{
	{ &opp_24_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_24_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_24_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_24_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_24_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_24_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_24_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_24_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_24_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	老人2
//------------------------------------------
static const actAnmData opp_25_celltrans[] =
{
	{ &opp_25_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_25_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_25_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_25_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行1	3
	{ &opp_25_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行2	4
	{ &opp_25_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行1	5
	{ &opp_25_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行2	6
	{ &opp_25_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行1	7
	{ &opp_25_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	老婆2
//------------------------------------------
static const actAnmData opp_26_celltrans[] =
{
	{ &opp_26_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_26_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_26_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_26_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行1	3
	{ &opp_26_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行2	4
	{ &opp_26_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行1	5
	{ &opp_26_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行2	6
	{ &opp_26_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行1	7
	{ &opp_26_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ﾎﾞｰｲｽｶｳﾄ	
//------------------------------------------
static const actAnmData opp_27_celltrans[] =
{
	{ &opp_27_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_27_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_27_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_27_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_27_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_27_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_27_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_27_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_27_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ｶﾞｰﾙｽｶｳﾄ
//------------------------------------------
static const actAnmData opp_28_celltrans[] =
{
	{ &opp_28_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_28_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_28_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_28_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_28_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_28_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_28_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_28_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_28_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	少年5
//------------------------------------------
static const actAnmData opp_29_celltrans[] =
{
	{ &opp_29_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_29_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_29_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_29_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_29_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_29_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_29_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_29_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_29_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	少女5
//------------------------------------------
static const actAnmData opp_30_celltrans[] =
{
	{ &opp_30_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_30_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_30_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_30_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_30_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_30_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_30_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_30_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_30_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	小僧1
//------------------------------------------
static const actAnmData opp_31_celltrans[] =
{
	{ &opp_31_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_31_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_31_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_31_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_31_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_31_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_31_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_31_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_31_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	小僧2
//------------------------------------------
static const actAnmData opp_32_celltrans[] =
{
	{ &opp_32_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_32_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_32_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_32_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_32_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_32_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_32_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_32_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_32_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	少年6
//------------------------------------------
static const actAnmData opp_33_celltrans[] =
{
	{ &opp_33_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_33_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_33_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_33_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_33_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_33_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_33_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_33_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_33_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	少年7
//------------------------------------------
static const actAnmData opp_34_celltrans[] =
{
	{ &opp_34_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_34_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_34_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_34_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_34_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_34_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_34_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_34_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_34_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	少年8
//------------------------------------------
static const actAnmData opp_35_celltrans[] =
{
	{ &opp_35_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_35_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_35_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_35_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_35_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_35_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_35_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_35_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_35_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	警備員1
//------------------------------------------
static const actAnmData opp_36_celltrans[] =
{
	{ &opp_36_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_36_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_36_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_36_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_36_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_36_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_36_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_36_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_36_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ﾛｹｯﾄ団女1
//------------------------------------------
static const actAnmData opp_37_celltrans[] =
{
	{ &opp_37_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_37_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_37_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_37_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_37_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_37_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_37_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_37_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_37_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	海ﾊﾟﾝ野郎1
//------------------------------------------
static const actAnmData opp_38_celltrans[] =
{
	{ &opp_38_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_38_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_38_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_38_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_38_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_38_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_38_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_38_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_38_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	海ﾊﾟﾝ女郎1
//------------------------------------------
static const actAnmData opp_39_celltrans[] =
{
	{ &opp_39_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_39_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_39_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_39_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_39_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_39_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_39_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_39_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_39_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	格闘家1
//------------------------------------------
static const actAnmData opp_40_celltrans[] =
{
	{ &opp_40_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_40_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_40_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_40_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_40_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_40_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_40_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_40_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_40_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	女性3
//------------------------------------------
static const actAnmData opp_41_celltrans[] =
{
	{ &opp_41_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_41_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_41_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_41_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_41_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_41_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_41_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_41_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_41_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	研究員男1
//------------------------------------------
static const actAnmData opp_42_celltrans[] =
{
	{ &opp_42_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_42_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_42_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_42_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_42_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_42_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_42_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_42_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_42_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	少女6
//------------------------------------------
static const actAnmData opp_43_celltrans[] =
{
	{ &opp_43_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_43_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_43_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_43_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_43_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_43_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_43_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_43_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_43_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	老人3
//------------------------------------------
static const actAnmData opp_44_celltrans[] =
{
	{ &opp_44_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_44_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_44_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_44_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_44_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_44_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_44_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_44_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_44_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	大男2
//------------------------------------------
static const actAnmData opp_45_celltrans[] =
{
	{ &opp_45_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_45_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_45_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_45_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_45_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_45_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_45_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_45_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_45_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	釣り人1
//------------------------------------------
static const actAnmData opp_46_celltrans[] =
{
	{ &opp_46_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_46_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_46_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_46_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_46_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_46_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_46_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_46_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_46_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	格闘家2
//------------------------------------------
static const actAnmData opp_47_celltrans[] =
{
	{ &opp_47_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_47_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_47_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_47_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_47_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_47_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_47_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_47_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_47_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ｻﾗﾘｰｳｰﾏﾝ2
//------------------------------------------
static const actAnmData opp_48_celltrans[] =
{
	{ &opp_48_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_48_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_48_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_48_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_48_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_48_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_48_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_48_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_48_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	お嬢3
//------------------------------------------
static const actAnmData opp_49_celltrans[] =
{
	{ &opp_49_Character[(0x20*4) * 0], 0x20*4},		// 下	停止	0
	{ &opp_49_Character[(0x20*4) * 1], 0x20*4},		// 上	停止	1
	{ &opp_49_Character[(0x20*4) * 2], 0x20*4},		// 左右 停止	2
	{ &opp_49_Character[(0x20*4) * 3], 0x20*4},		// 下 	歩行1	3
	{ &opp_49_Character[(0x20*4) * 4], 0x20*4},		// 下 	歩行2	4
	{ &opp_49_Character[(0x20*4) * 5], 0x20*4},		// 上	歩行1	5
	{ &opp_49_Character[(0x20*4) * 6], 0x20*4},		// 上	歩行2	6
	{ &opp_49_Character[(0x20*4) * 7], 0x20*4},		// 左右 歩行1	7
	{ &opp_49_Character[(0x20*4) * 8], 0x20*4},		// 左右 歩行2	8
};

//------------------------------------------
//	お嬢4
//------------------------------------------
static const actAnmData opp_50_celltrans[] =
{
	{ &opp_50_Character[(0x20*4) * 0], 0x20*4},		// 下	停止	0
	{ &opp_50_Character[(0x20*4) * 1], 0x20*4},		// 上	停止	1
	{ &opp_50_Character[(0x20*4) * 2], 0x20*4},		// 左右 停止	2
	{ &opp_50_Character[(0x20*4) * 3], 0x20*4},		// 下 	歩行1	3
	{ &opp_50_Character[(0x20*4) * 4], 0x20*4},		// 下 	歩行2	4
	{ &opp_50_Character[(0x20*4) * 5], 0x20*4},		// 上	歩行1	5
	{ &opp_50_Character[(0x20*4) * 6], 0x20*4},		// 上	歩行2	6
	{ &opp_50_Character[(0x20*4) * 7], 0x20*4},		// 左右 歩行1	7
	{ &opp_50_Character[(0x20*4) * 8], 0x20*4},		// 左右 歩行2	8
};

//------------------------------------------
//	山男1
//------------------------------------------
static const actAnmData opp_51_celltrans[] =
{
	{ &opp_51_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_51_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_51_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_51_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_51_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_51_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_51_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_51_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_51_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	自転車男1
//------------------------------------------
static const actAnmData opp_52_celltrans[] =
{
	{ &opp_52_Character[(0x20*16) * 0], 0x20*16},	// 下	停止	0
	{ &opp_52_Character[(0x20*16) * 1], 0x20*16},	// 上	停止	1
	{ &opp_52_Character[(0x20*16) * 2], 0x20*16},	// 左右 停止	2
	{ &opp_52_Character[(0x20*16) * 3], 0x20*16},	// 下 	歩行1	3
	{ &opp_52_Character[(0x20*16) * 4], 0x20*16},	// 下 	歩行2	4
	{ &opp_52_Character[(0x20*16) * 5], 0x20*16},	// 上	歩行1	5
	{ &opp_52_Character[(0x20*16) * 6], 0x20*16},	// 上	歩行2	6
	{ &opp_52_Character[(0x20*16) * 7], 0x20*16},	// 左右 歩行1	7
	{ &opp_52_Character[(0x20*16) * 8], 0x20*16},	// 左右 歩行2	8
};

//------------------------------------------
//	自転車女1
//------------------------------------------
static const actAnmData opp_53_celltrans[] =
{
	{ &opp_53_Character[(0x20*16) * 0], 0x20*16},	// 下	停止	0
	{ &opp_53_Character[(0x20*16) * 1], 0x20*16},	// 上	停止	1
	{ &opp_53_Character[(0x20*16) * 2], 0x20*16},	// 左右 停止	2
	{ &opp_53_Character[(0x20*16) * 3], 0x20*16},	// 下 	歩行1	3
	{ &opp_53_Character[(0x20*16) * 4], 0x20*16},	// 下 	歩行2	4
	{ &opp_53_Character[(0x20*16) * 5], 0x20*16},	// 上	歩行1	5
	{ &opp_53_Character[(0x20*16) * 6], 0x20*16},	// 上	歩行2	6
	{ &opp_53_Character[(0x20*16) * 7], 0x20*16},	// 左右 歩行1	7
	{ &opp_53_Character[(0x20*16) * 8], 0x20*16},	// 左右 歩行2	8
};

//------------------------------------------
//	ﾎﾟｹｾﾝ姉さん
//------------------------------------------
static const actAnmData op_nurse_celltrans[] =
{
	{ &op_nurse_Character[(0x20*8) * 0], 0x20*8},	// 下	停止	0
	{ &op_nurse_Character[(0x20*8) * 1], 0x20*8},	// 上	停止	1
	{ &op_nurse_Character[(0x20*8) * 2], 0x20*8},	// 左右 停止	2
	{ &op_nurse_Character[(0x20*8) * 3], 0x20*8},	// 下 	歩行1	3
	{ &op_nurse_Character[(0x20*8) * 4], 0x20*8},	// 下 	歩行2	4
	{ &op_nurse_Character[(0x20*8) * 5], 0x20*8},	// 上	歩行1	5
	{ &op_nurse_Character[(0x20*8) * 6], 0x20*8},	// 上	歩行2	6
	{ &op_nurse_Character[(0x20*8) * 7], 0x20*8},	// 左右 歩行1	7
	{ &op_nurse_Character[(0x20*8) * 8], 0x20*8},	// 左右 歩行2	8
	{ &op_nurse_Character[(0x20*8) * 9], 0x20*8},	// お辞儀	9
};

//------------------------------------------
//	ｶﾌﾟｾﾙ
//------------------------------------------
static const actAnmData o_pokeb_celltrans[] =
{
	{ &o_pokeb_Character[(0x20*4) * 0], 0x20*4},	// 0
};

//------------------------------------------
//	ｵﾀﾞﾏｷ
//------------------------------------------
static const actAnmData op_odama_celltrans[] =
{
	{ &op_odama_Character[(0x20*8) * 0], 0x20*8},	// 下	停止	0
	{ &op_odama_Character[(0x20*8) * 1], 0x20*8},	// 上	停止	1
	{ &op_odama_Character[(0x20*8) * 2], 0x20*8},	// 左右 停止	2
	{ &op_odama_Character[(0x20*8) * 3], 0x20*8},	// 下 	歩行1	3
	{ &op_odama_Character[(0x20*8) * 4], 0x20*8},	// 下 	歩行2	4
	{ &op_odama_Character[(0x20*8) * 5], 0x20*8},	// 上	歩行1	5
	{ &op_odama_Character[(0x20*8) * 6], 0x20*8},	// 上	歩行2	6
	{ &op_odama_Character[(0x20*8) * 7], 0x20*8},	// 左右 歩行1	7
	{ &op_odama_Character[(0x20*8) * 8], 0x20*8},	// 左右 歩行2	8
};

//------------------------------------------
//	若者男1
//------------------------------------------
static const actAnmData opp_54_celltrans[] =
{
	{ &opp_54_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_54_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_54_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_54_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_54_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_54_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_54_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_54_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_54_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	若者男2
//------------------------------------------
static const actAnmData opp_55_celltrans[] =
{
	{ &opp_55_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &opp_55_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &opp_55_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &opp_55_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &opp_55_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &opp_55_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &opp_55_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &opp_55_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &opp_55_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ｲﾝﾀﾋﾞｭｱ男1
//------------------------------------------
static const actAnmData op_intrvm_celltrans[] =
{
	{ &op_intrvm_Character[(0x20*8) * 0], 0x20*8},	// 下	停止	0
	{ &op_intrvm_Character[(0x20*8) * 1], 0x20*8},	// 上	停止	1
	{ &op_intrvm_Character[(0x20*8) * 2], 0x20*8},	// 左右 停止	2
	{ &op_intrvm_Character[(0x20*8) * 3], 0x20*8},	// 下 	歩行1	3
	{ &op_intrvm_Character[(0x20*8) * 4], 0x20*8},	// 下 	歩行2	4
	{ &op_intrvm_Character[(0x20*8) * 5], 0x20*8},	// 上	歩行1	5
	{ &op_intrvm_Character[(0x20*8) * 6], 0x20*8},	// 上	歩行2	6
	{ &op_intrvm_Character[(0x20*8) * 7], 0x20*8},	// 左右 歩行1	7
	{ &op_intrvm_Character[(0x20*8) * 8], 0x20*8},	// 左右 歩行2	8
};

//------------------------------------------
//	ｲﾝﾀﾋﾞｭｱ女1
//------------------------------------------
static const actAnmData op_intrvf_celltrans[] =
{
	{ &op_intrvf_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_intrvf_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_intrvf_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_intrvf_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_intrvf_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_intrvf_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_intrvf_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_intrvf_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_intrvf_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	7おやじ1
//------------------------------------------
static const actAnmData op_7oyaji1_celltrans[] =
{
	{ &op_7oyaji1_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_7oyaji1_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_7oyaji1_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_7oyaji1_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_7oyaji1_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_7oyaji1_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_7oyaji1_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_7oyaji1_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_7oyaji1_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	7おやじ2
//------------------------------------------
static const actAnmData op_7oyaji2_celltrans[] =
{
	{ &op_7oyaji2_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_7oyaji2_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_7oyaji2_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_7oyaji2_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_7oyaji2_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_7oyaji2_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_7oyaji2_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_7oyaji2_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_7oyaji2_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ｸﾞｯｽﾞ1
//------------------------------------------
static const actAnmData hob_gds1_celltrans[] =
{
	{ &hob_gds_Character[(0x20*4) * 0], 0x20*4},
};

//------------------------------------------
//	ｸﾞｯｽﾞ2
//------------------------------------------
static const actAnmData hob_gds2_celltrans[] =
{
	{ &hob_gds_Character[(0x20*4) * 1], 0x20*4},
};

//------------------------------------------
//	ｸﾞｯｽﾞ3
//------------------------------------------
static const actAnmData hob_gds3_celltrans[] =
{
	{ &hob_gds_Character[(0x20*4) * 2], 0x20*4},
};

//------------------------------------------
//	ｸﾞｯｽﾞ4
//------------------------------------------
static const actAnmData hob_gds4_celltrans[] =
{
	{ &hob_gds_Character[(0x20*4) * 3], 0x20*4},
};

//------------------------------------------
//	ｸﾞｯｽﾞ5
//------------------------------------------
static const actAnmData hob_gds5_celltrans[] =
{
	{ &hob_gds_Character[(0x20*4) * 4], 0x20*4},
};

//------------------------------------------
//	ｸﾞｯｽﾞ6
//------------------------------------------
static const actAnmData hob_gds6_celltrans[] =
{
	{ &hob_gds_Character[(0x20*4) * 5], 0x20*4},
};

//------------------------------------------
//	木1
//------------------------------------------
static const actAnmData o_tachigi1_celltrans[] =
{
	{ &o_tachigi_Character[(0x20*4) * 0], 0x20*4},
	{ &o_tachigi_Character[(0x20*4) * 1], 0x20*4},
	{ &o_tachigi_Character[(0x20*4) * 2], 0x20*4},
	{ &o_tachigi_Character[(0x20*4) * 3], 0x20*4},
};

//------------------------------------------
//	店員男1
//------------------------------------------
static const actAnmData op_shopm_celltrans[] =
{
	{ &op_shopm_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_shopm_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_shopm_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_shopm_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_shopm_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_shopm_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_shopm_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_shopm_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_shopm_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	店員女1
//------------------------------------------
static const actAnmData op_shopf_celltrans[] =
{
	{ &op_shopf_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_shopf_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_shopf_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_shopf_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_shopf_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_shopf_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_shopf_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_shopf_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_shopf_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ﾎﾟｹｾﾝ姉さん2
//------------------------------------------
static const actAnmData op_pcgirl_celltrans[] =
{
	{ &op_pcgirl_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_pcgirl_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_pcgirl_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_pcgirl_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_pcgirl_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_pcgirl_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_pcgirl_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_pcgirl_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_pcgirl_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	砕ける岩1
//------------------------------------------
static const actAnmData o_crushiw_celltrans[] =
{
	{ &o_crushiw_Character[(0x20*4) * 0], 0x20*4},
	{ &o_crushiw_Character[(0x20*4) * 1], 0x20*4},
	{ &o_crushiw_Character[(0x20*4) * 2], 0x20*4},
	{ &o_crushiw_Character[(0x20*4) * 3], 0x20*4},
};

//------------------------------------------
//	押せる岩1
//------------------------------------------
static const actAnmData o_pushiw_celltrans[] =
{
	{ &o_pushiw_Character[(0x20*4) * 0], 0x20*4},
};

//------------------------------------------
//	船1
//------------------------------------------
static const actAnmData o_ship1_celltrans[] =
{
	{ &o_ship1_Character[(0x20*16) * 0], 0x20*16},		// 下	停止	0
	{ &o_ship1_Character[(0x20*16) * 1], 0x20*16},		// 上	停止	1
	{ &o_ship1_Character[(0x20*16) * 2], 0x20*16},		// 左右 停止	2
	{ &o_ship1_Character[(0x20*16) * 0], 0x20*16},		// 下 	歩行1	3
	{ &o_ship1_Character[(0x20*16) * 0], 0x20*16},		// 下 	歩行2	4
	{ &o_ship1_Character[(0x20*16) * 1], 0x20*16},		// 上	歩行1	5
	{ &o_ship1_Character[(0x20*16) * 1], 0x20*16},		// 上	歩行2	6
	{ &o_ship1_Character[(0x20*16) * 2], 0x20*16},		// 左右 歩行1	7
	{ &o_ship1_Character[(0x20*16) * 2], 0x20*16},		// 左右 歩行2	8
};

//------------------------------------------
//	ﾄﾗｯｸ
//------------------------------------------
static const actAnmData truck_celltrans[] =
{
	{ &truck_Character[(0x20*36) * 0], 0x20*36},
};

//------------------------------------------
//	引越しﾎﾟｹﾓﾝ1
//------------------------------------------
static const actAnmData hikobj1_celltrans[] =
{
	{ &hikobj_Character[(0x20*16) * 0], 0x20*16},		// 下	停止	0
	{ &hikobj_Character[(0x20*16) * 0], 0x20*16},		// 上	停止	1
	{ &hikobj_Character[(0x20*16) * 0], 0x20*16},		// 左右 停止	2
	{ &hikobj_Character[(0x20*16) * 1], 0x20*16},		// 下 	歩行1	3
	{ &hikobj_Character[(0x20*16) * 2], 0x20*16},		// 下 	歩行2	4
	{ &hikobj_Character[(0x20*16) * 1], 0x20*16},		// 上	歩行1	5
	{ &hikobj_Character[(0x20*16) * 2], 0x20*16},		// 上	歩行2	6
	{ &hikobj_Character[(0x20*16) * 1], 0x20*16},		// 左右 歩行1	7
	{ &hikobj_Character[(0x20*16) * 2], 0x20*16},		// 左右 歩行2	8
};

//------------------------------------------
//	引越しﾎﾟｹﾓﾝ2
//------------------------------------------
static const actAnmData hikobj2_celltrans[] =
{
	{ &hikobj_Character[(0x20*16) * 3], 0x20*16},		// 下	停止	0
	{ &hikobj_Character[(0x20*16) * 3], 0x20*16},		// 上	停止	1
	{ &hikobj_Character[(0x20*16) * 3], 0x20*16},		// 左右 停止	2
	{ &hikobj_Character[(0x20*16) * 4], 0x20*16},		// 下 	歩行1	3
	{ &hikobj_Character[(0x20*16) * 4], 0x20*16},		// 下 	歩行2	4
	{ &hikobj_Character[(0x20*16) * 4], 0x20*16},		// 上	歩行1	5
	{ &hikobj_Character[(0x20*16) * 4], 0x20*16},		// 上	歩行2	6
	{ &hikobj_Character[(0x20*16) * 4], 0x20*16},		// 左右 歩行1	7
	{ &hikobj_Character[(0x20*16) * 4], 0x20*16},		// 左右 歩行2	8
};

//------------------------------------------
//	ﾘｭｯｸ
//------------------------------------------
static const actAnmData opobj1_celltrans[] =
{
	{ &opobj1_Character[(0x20*4) * 0], 0x20*4},
};

//------------------------------------------
//	襲うﾎﾟｹﾓﾝ
//------------------------------------------
static const actAnmData opobj2_celltrans[] =
{
	{ &opobj2_Character[(0x20*16) * 0], 0x20*16},		// 下	停止	0
	{ &opobj2_Character[(0x20*16) * 1], 0x20*16},		// 上	停止	1
	{ &opobj2_Character[(0x20*16) * 2], 0x20*16},		// 左右 停止	2
	{ &opobj2_Character[(0x20*16) * 3], 0x20*16},		// 下 	歩行1	3
	{ &opobj2_Character[(0x20*16) * 4], 0x20*16},		// 下 	歩行2	4
	{ &opobj2_Character[(0x20*16) * 5], 0x20*16},		// 上	歩行1	5
	{ &opobj2_Character[(0x20*16) * 6], 0x20*16},		// 上	歩行2	6
	{ &opobj2_Character[(0x20*16) * 7], 0x20*16},		// 左右 歩行1	7
	{ &opobj2_Character[(0x20*16) * 8], 0x20*16},		// 左右 歩行2	8
};

//------------------------------------------
//	絵描きさん1
//------------------------------------------
static const actAnmData op_artist_celltrans[] =
{
	{ &op_artist_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_artist_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_artist_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_artist_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_artist_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_artist_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_artist_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_artist_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_artist_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	女主人公
//------------------------------------------
static const actAnmData heroine_celltrans[] =
{	
	{ &heroine_Character[(0x20*8) * 0], 0x20*8},	// 下	停止	0
	{ &heroine_Character[(0x20*8) * 1], 0x20*8},	// 上	停止	1
	{ &heroine_Character[(0x20*8) * 2], 0x20*8},	// 左右 停止	2
	{ &heroine_Character[(0x20*8) * 3], 0x20*8},	// 下 	歩行1	3
	{ &heroine_Character[(0x20*8) * 4], 0x20*8},	// 下 	歩行2	4
	{ &heroine_Character[(0x20*8) * 5], 0x20*8},	// 上	歩行1	5
	{ &heroine_Character[(0x20*8) * 6], 0x20*8},	// 上	歩行2	6
	{ &heroine_Character[(0x20*8) * 7], 0x20*8},	// 左右 歩行1	7
	{ &heroine_Character[(0x20*8) * 8], 0x20*8},	// 左右 歩行2	8

	{ &heroine_Character[(0x20*8) * 9], 0x20*8},	// 下	ﾀﾞｯｼｭ停止	0
	{ &heroine_Character[(0x20*8) * 10], 0x20*8},	// 上	ﾀﾞｯｼｭ停止	1
	{ &heroine_Character[(0x20*8) * 11], 0x20*8},	// 左右 ﾀﾞｯｼｭ停止	2
	{ &heroine_Character[(0x20*8) * 12], 0x20*8},	// 下 	ﾀﾞｯｼｭ歩行1	3
	{ &heroine_Character[(0x20*8) * 13], 0x20*8},	// 下 	ﾀﾞｯｼｭ歩行2	4
	{ &heroine_Character[(0x20*8) * 14], 0x20*8},	// 上	ﾀﾞｯｼｭ歩行1	5
	{ &heroine_Character[(0x20*8) * 15], 0x20*8},	// 上	ﾀﾞｯｼｭ歩行2	6
	{ &heroine_Character[(0x20*8) * 16], 0x20*8},	// 左右 ﾀﾞｯｼｭ歩行1	7
	{ &heroine_Character[(0x20*8) * 17], 0x20*8},	// 左右 ﾀﾞｯｼｭ歩行2	8
};

//------------------------------------------
//	女主人公自転車ﾚｰｽﾀｲﾌﾟ
//------------------------------------------
static const actAnmData c_hine0_celltrans[] =
{
	{ &c_hine0_Character[(0x20*16) * 0], 0x20*16},	// 下	停止	0
	{ &c_hine0_Character[(0x20*16) * 1], 0x20*16},	// 上	停止	1
	{ &c_hine0_Character[(0x20*16) * 2], 0x20*16},	// 左右	停止	2
	{ &c_hine0_Character[(0x20*16) * 3], 0x20*16},	// 下	歩行	3
	{ &c_hine0_Character[(0x20*16) * 4], 0x20*16},	// 下	歩行	4
	{ &c_hine0_Character[(0x20*16) * 5], 0x20*16},	// 上	歩行	5
	{ &c_hine0_Character[(0x20*16) * 6], 0x20*16},	// 上	歩行	6
	{ &c_hine0_Character[(0x20*16) * 7], 0x20*16},	// 左右	歩行	7
	{ &c_hine0_Character[(0x20*16) * 8], 0x20*16},	// 左右	歩行	8
};

//------------------------------------------
//	主人公自転車ｽﾎﾟｰﾂﾀｲﾌﾟ	32x32
//------------------------------------------
static const actAnmData c_hine1_celltrans[] =
{
	{ &c_hine1_Character[(0x20*16) * 0], 0x20*16},	// 下	停止	0
	{ &c_hine1_Character[(0x20*16) * 1], 0x20*16},	// 上	停止	1
	{ &c_hine1_Character[(0x20*16) * 2], 0x20*16},	// 左右	停止	2
	{ &c_hine1_Character[(0x20*16) * 3], 0x20*16},	// 下	歩行	3
	{ &c_hine1_Character[(0x20*16) * 4], 0x20*16},	// 下	歩行	4
	{ &c_hine1_Character[(0x20*16) * 5], 0x20*16},	// 上	歩行	5
	{ &c_hine1_Character[(0x20*16) * 6], 0x20*16},	// 上	歩行	6
	{ &c_hine1_Character[(0x20*16) * 7], 0x20*16},	// 左右	歩行	7
	{ &c_hine1_Character[(0x20*16) * 8], 0x20*16},	// 左右	歩行	8

	{ &c_hine1_Character[(0x20*16) * 9], 0x20*16},	// 下ﾌﾛﾝﾄ	0
	{ &c_hine1_Character[(0x20*16) * 10], 0x20*16},	// 下ﾌﾛﾝﾄ	1
	{ &c_hine1_Character[(0x20*16) * 11], 0x20*16},	// 下ﾘｱ		0
	{ &c_hine1_Character[(0x20*16) * 12], 0x20*16},	// 下ﾘｱ		1
	{ &c_hine1_Character[(0x20*16) * 13], 0x20*16},	// 上ﾌﾛﾝﾄ	0
	{ &c_hine1_Character[(0x20*16) * 14], 0x20*16},	// 上ﾌﾛﾝﾄ	1
	{ &c_hine1_Character[(0x20*16) * 15], 0x20*16},	// 上ﾘｱ		0
	{ &c_hine1_Character[(0x20*16) * 16], 0x20*16},	// 上ﾘｱ		1
	{ &c_hine1_Character[(0x20*16) * 17], 0x20*16},	// 左右ﾌﾛﾝﾄ	0
	{ &c_hine1_Character[(0x20*16) * 18], 0x20*16},	// 左右ﾌﾛﾝﾄ	1
	{ &c_hine1_Character[(0x20*16) * 19], 0x20*16},	// 左右ﾘｱ	0
	{ &c_hine1_Character[(0x20*16) * 20], 0x20*16},	// 左右ﾘｱ	1
	{ &c_hine1_Character[(0x20*16) * 21], 0x20*16},	// 下ｳｲﾘｰ	0
	{ &c_hine1_Character[(0x20*16) * 22], 0x20*16},	// 下ｳｲﾘｰ	1
	{ &c_hine1_Character[(0x20*16) * 23], 0x20*16},	// 上ｳｲﾘｰ	0
	{ &c_hine1_Character[(0x20*16) * 24], 0x20*16},	// 上ｳｲﾘｰ	1
	{ &c_hine1_Character[(0x20*16) * 25], 0x20*16},	// 左右ｳｲﾘｰ	0
	{ &c_hine1_Character[(0x20*16) * 26], 0x20*16},	// 左右ｳｲﾘｰ	1
};

//------------------------------------------
//	女主人公波乗り	32x32
//------------------------------------------
static const actAnmData hine_swim_celltrans[] =
{
	{ &hine_swim_Character[(0x20*16) * 0], 0x20*16},	// 下	停止	0
	{ &hine_swim_Character[(0x20*16) * 2], 0x20*16},	// 上	停止	1
	{ &hine_swim_Character[(0x20*16) * 4], 0x20*16},	// 左右	停止	2
	{ &hine_swim_Character[(0x20*16) * 0], 0x20*16},	// 下	歩行	3
	{ &hine_swim_Character[(0x20*16) * 0], 0x20*16},	// 下	歩行	4
	{ &hine_swim_Character[(0x20*16) * 2], 0x20*16},	// 上	歩行	5
	{ &hine_swim_Character[(0x20*16) * 2], 0x20*16},	// 上	歩行	6
	{ &hine_swim_Character[(0x20*16) * 4], 0x20*16},	// 左右	歩行	7
	{ &hine_swim_Character[(0x20*16) * 4], 0x20*16},	// 左右	歩行	8
//	ｼﾞｬﾝﾌﾟ用
	{ &hine_swim_Character[(0x20*16) * 1], 0x20*16},	// 下1			9
	{ &hine_swim_Character[(0x20*16) * 3], 0x20*16},	// 上1			10
	{ &hine_swim_Character[(0x20*16) * 5], 0x20*16},	// 左右1		11
};

//------------------------------------------
//	女主人公ﾀﾞｲﾋﾞﾝｸﾞ	32x32
//------------------------------------------
static const actAnmData hine_div_celltrans[] =
{
	{ &moguri_Character[(0x20*16) * 4], 0x20*16},	// 下	停止	0
	{ &moguri_Character[(0x20*16) * 5], 0x20*16},	// 上	停止	1
	{ &moguri_Character[(0x20*16) * 6], 0x20*16},	// 左右	停止	2
	{ &moguri_Character[(0x20*16) * 4], 0x20*16},	// 下	歩行	3
	{ &moguri_Character[(0x20*16) * 4], 0x20*16},	// 下	歩行	4
	{ &moguri_Character[(0x20*16) * 5], 0x20*16},	// 上	歩行	5
	{ &moguri_Character[(0x20*16) * 5], 0x20*16},	// 上	歩行	6
	{ &moguri_Character[(0x20*16) * 6], 0x20*16},	// 左右	歩行	7
	{ &moguri_Character[(0x20*16) * 6], 0x20*16},	// 左右	歩行	8
};

//------------------------------------------
//	女秘伝技発生主人公	32x32
//------------------------------------------
static const actAnmData hine_hiden_celltrans[] =
{
	{ &hine_hiden_Character[(0x20*16) * 0], 0x20*16},	// 振りかざし 0
	{ &hine_hiden_Character[(0x20*16) * 1], 0x20*16},	// 振りかざし 1
	{ &hine_hiden_Character[(0x20*16) * 2], 0x20*16},	// 振りかざし 2
	{ &hine_hiden_Character[(0x20*16) * 3], 0x20*16},	// 振りかざし 3
	{ &hine_hiden_Character[(0x20*16) * 4], 0x20*16},	// 振りかざし 4
};

//------------------------------------------
//	ｶﾒﾗﾏﾝ1
//------------------------------------------
static const actAnmData op_camera_celltrans[] =
{
	{ &op_camera_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_camera_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_camera_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_camera_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_camera_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_camera_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_camera_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_camera_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_camera_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	荷物1
//------------------------------------------
static const actAnmData baggage_celltrans[] =
{
	{ &baggage_Character[(0x20*4) * 0], 0x20*4},
};

//------------------------------------------
//	ﾛｰﾌﾟｳｪｲ
//------------------------------------------
static const actAnmData ropeway_celltrans[] =
{
	{ &ropeway_Character[(0x20*64) * 0], 0x20*64},
};

//------------------------------------------
//	研究員
//------------------------------------------
static const actAnmData op_waruken_celltrans[] =
{
	{ &op_waruken_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_waruken_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_waruken_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_waruken_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_waruken_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_waruken_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_waruken_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_waruken_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_waruken_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ﾃﾞﾎﾞﾝ
//------------------------------------------
static const actAnmData op_dbnsya_celltrans[] =
{
	{ &op_dbnsya_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_dbnsya_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_dbnsya_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_dbnsya_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_dbnsya_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_dbnsya_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_dbnsya_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_dbnsya_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_dbnsya_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ｱｸｱ団男
//------------------------------------------
static const actAnmData op_aquam_celltrans[] =
{
	{ &op_aquam_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_aquam_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_aquam_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_aquam_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_aquam_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_aquam_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_aquam_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_aquam_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_aquam_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ｱｸｱ団女
//------------------------------------------
static const actAnmData op_aquaf_celltrans[] =
{
	{ &op_aquaf_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_aquaf_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_aquaf_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_aquaf_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_aquaf_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_aquaf_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_aquaf_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_aquaf_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_aquaf_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ﾏｸﾞﾏ団男
//------------------------------------------
static const actAnmData op_magm_celltrans[] =
{
	{ &op_magm_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_magm_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_magm_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_magm_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_magm_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_magm_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_magm_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_magm_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_magm_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ﾏｸﾞﾏ団女
//------------------------------------------
static const actAnmData op_magf_celltrans[] =
{
	{ &op_magf_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_magf_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_magf_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_magf_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_magf_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_magf_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_magf_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_magf_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_magf_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ｶｹﾞﾂ
//------------------------------------------
static const actAnmData op_4kgt_celltrans[] =
{
	{ &op_4kgt_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_4kgt_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_4kgt_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_4kgt_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行1	3
	{ &op_4kgt_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行2	4
	{ &op_4kgt_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行1	5
	{ &op_4kgt_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行2	6
	{ &op_4kgt_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行1	7
	{ &op_4kgt_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ﾌﾖｳ
//------------------------------------------
static const actAnmData op_4fyu_celltrans[] =
{
	{ &op_4fyu_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_4fyu_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_4fyu_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_4fyu_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行1	3
	{ &op_4fyu_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行2	4
	{ &op_4fyu_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行1	5
	{ &op_4fyu_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行2	6
	{ &op_4fyu_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行1	7
	{ &op_4fyu_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ﾌﾟﾘﾑ
//------------------------------------------
static const actAnmData op_4prm_celltrans[] =
{
	{ &op_4prm_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_4prm_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_4prm_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_4prm_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行1	3
	{ &op_4prm_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行2	4
	{ &op_4prm_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行1	5
	{ &op_4prm_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行2	6
	{ &op_4prm_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行1	7
	{ &op_4prm_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ｹﾞﾝｼﾞ
//------------------------------------------
static const actAnmData op_4gnj_celltrans[] =
{
	{ &op_4gnj_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_4gnj_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_4gnj_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_4gnj_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行1	3
	{ &op_4gnj_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行2	4
	{ &op_4gnj_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行1	5
	{ &op_4gnj_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行2	6
	{ &op_4gnj_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行1	7
	{ &op_4gnj_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ﾂﾂｼﾞ
//------------------------------------------
static const actAnmData op_jrttj_celltrans[] =
{
	{ &op_jrttj_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_jrttj_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_jrttj_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_jrttj_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行1	3
	{ &op_jrttj_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行2	4
	{ &op_jrttj_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行1	5
	{ &op_jrttj_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行2	6
	{ &op_jrttj_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行1	7
	{ &op_jrttj_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	トウキ
//------------------------------------------
static const actAnmData op_jrtuk_celltrans[] =
{
	{ &op_jrtuk_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_jrtuk_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_jrtuk_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_jrtuk_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行1	3
	{ &op_jrtuk_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行2	4
	{ &op_jrtuk_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行1	5
	{ &op_jrtuk_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行2	6
	{ &op_jrtuk_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行1	7
	{ &op_jrtuk_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	テッセン
//------------------------------------------
static const actAnmData op_jrtsn_celltrans[] =
{
	{ &op_jrtsn_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_jrtsn_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_jrtsn_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_jrtsn_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行1	3
	{ &op_jrtsn_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行2	4
	{ &op_jrtsn_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行1	5
	{ &op_jrtsn_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行2	6
	{ &op_jrtsn_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行1	7
	{ &op_jrtsn_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	アイリ
//------------------------------------------
static const actAnmData op_jrair_celltrans[] =
{
	{ &op_jrair_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_jrair_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_jrair_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_jrair_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行1	3
	{ &op_jrair_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行2	4
	{ &op_jrair_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行1	5
	{ &op_jrair_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行2	6
	{ &op_jrair_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行1	7
	{ &op_jrair_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	センリ
//------------------------------------------
static const actAnmData op_jrsnr_celltrans[] =
{
	{ &op_jrsnr_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_jrsnr_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_jrsnr_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_jrsnr_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_jrsnr_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_jrsnr_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_jrsnr_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_jrsnr_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_jrsnr_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ナギ
//------------------------------------------
static const actAnmData op_jrnag_celltrans[] =
{
	{ &op_jrnag_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_jrnag_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_jrnag_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_jrnag_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行1	3
	{ &op_jrnag_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行2	4
	{ &op_jrnag_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行1	5
	{ &op_jrnag_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行2	6
	{ &op_jrnag_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行1	7
	{ &op_jrnag_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	フウ
//------------------------------------------
static const actAnmData op_jr2f_celltrans[] =
{
	{ &op_jr2f_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_jr2f_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_jr2f_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_jr2f_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行1	3
	{ &op_jr2f_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行2	4
	{ &op_jr2f_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行1	5
	{ &op_jr2f_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行2	6
	{ &op_jr2f_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行1	7
	{ &op_jr2f_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ラン
//------------------------------------------
static const actAnmData op_jr2r_celltrans[] =
{
	{ &op_jr2r_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_jr2r_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_jr2r_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_jr2r_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行1	3
	{ &op_jr2r_Character[(0x20*8) * 0], 0x20*8},		// 下 	歩行2	4
	{ &op_jr2r_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行1	5
	{ &op_jr2r_Character[(0x20*8) * 1], 0x20*8},		// 上	歩行2	6
	{ &op_jr2r_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行1	7
	{ &op_jr2r_Character[(0x20*8) * 2], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ミクリ
//------------------------------------------
static const actAnmData op_jrmkr_celltrans[] =
{
	{ &op_jrmkr_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_jrmkr_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_jrmkr_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_jrmkr_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_jrmkr_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_jrmkr_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_jrmkr_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_jrmkr_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_jrmkr_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ダイゴ
//------------------------------------------
static const actAnmData op_champ_celltrans[] =
{
	{ &op_champ_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_champ_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_champ_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_champ_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_champ_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_champ_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_champ_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_champ_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_champ_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ミツル
//------------------------------------------
static const actAnmData op_mitsru_celltrans[] =
{
	{ &op_mitsru_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_mitsru_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_mitsru_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_mitsru_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_mitsru_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_mitsru_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_mitsru_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_mitsru_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_mitsru_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ｻﾎﾟｰﾄｷｬﾗ
//------------------------------------------
static const actAnmData op_sup_celltrans[] =
{
	{ &op_sup_Character[(0x20*4) * 0], 0x20*4},			// 下	停止	0
	{ &op_sup_Character[(0x20*4) * 1], 0x20*4},			// 上	停止	1
	{ &op_sup_Character[(0x20*4) * 2], 0x20*4},			// 左右 停止	2
	{ &op_sup_Character[(0x20*4) * 3], 0x20*4},			// 下 	歩行1	3
	{ &op_sup_Character[(0x20*4) * 4], 0x20*4},			// 下 	歩行2	4
	{ &op_sup_Character[(0x20*4) * 5], 0x20*4},			// 上	歩行1	5
	{ &op_sup_Character[(0x20*4) * 6], 0x20*4},			// 上	歩行2	6
	{ &op_sup_Character[(0x20*4) * 7], 0x20*4},			// 左右 歩行1	7
	{ &op_sup_Character[(0x20*4) * 8], 0x20*4},			// 左右 歩行2	8
};

//------------------------------------------
//	男主人公釣り
//------------------------------------------
static const actAnmData h_fish_celltrans[] =
{
	{ &turiact1_Character[(0x20*16) * 0], 0x20*16},		// 横振り	0
	{ &turiact1_Character[(0x20*16) * 1], 0x20*16},		// 横振り	1
	{ &turiact1_Character[(0x20*16) * 2], 0x20*16},		// 横振り	2
	{ &turiact1_Character[(0x20*16) * 3], 0x20*16},		// 横振り	3
	{ &turiact1_Character[(0x20*16) * 4], 0x20*16},		// 上振り	4
	{ &turiact1_Character[(0x20*16) * 5], 0x20*16},		// 上振り	5
	{ &turiact1_Character[(0x20*16) * 6], 0x20*16},		// 上振り	6
	{ &turiact1_Character[(0x20*16) * 7], 0x20*16},		// 上振り	7
	{ &turiact1_Character[(0x20*16) * 8], 0x20*16},		// 下振り	8
	{ &turiact1_Character[(0x20*16) * 9], 0x20*16},		// 下振り	9
	{ &turiact1_Character[(0x20*16) * 10], 0x20*16},	// 下振り	10
	{ &turiact1_Character[(0x20*16) * 11], 0x20*16},	// 下振り	11
};

//------------------------------------------
//	女主人公釣り
//------------------------------------------
static const actAnmData hine_fish_celltrans[] =
{
	{ &turiactf1_Character[(0x20*16) * 0], 0x20*16},	// 横振り	0
	{ &turiactf1_Character[(0x20*16) * 1], 0x20*16},	// 横振り	1
	{ &turiactf1_Character[(0x20*16) * 2], 0x20*16},	// 横振り	2
	{ &turiactf1_Character[(0x20*16) * 3], 0x20*16},	// 横振り	3
	{ &turiactf1_Character[(0x20*16) * 4], 0x20*16},	// 上振り	4
	{ &turiactf1_Character[(0x20*16) * 5], 0x20*16},	// 上振り	5
	{ &turiactf1_Character[(0x20*16) * 6], 0x20*16},	// 上振り	6
	{ &turiactf1_Character[(0x20*16) * 7], 0x20*16},	// 上振り	7
	{ &turiactf1_Character[(0x20*16) * 8], 0x20*16},	// 下振り	8
	{ &turiactf1_Character[(0x20*16) * 9], 0x20*16},	// 下振り	9
	{ &turiactf1_Character[(0x20*16) * 10], 0x20*16},	// 下振り	10
	{ &turiactf1_Character[(0x20*16) * 11], 0x20*16},	// 下振り	11
};

//------------------------------------------
//	温泉女
//------------------------------------------
static const actAnmData op_onsen_celltrans[] =
{
	{ &op_onsen_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_onsen_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_onsen_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_onsen_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_onsen_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_onsen_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_onsen_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_onsen_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_onsen_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	高速船
//------------------------------------------
static const actAnmData ship_obj_celltrans[] =
{
	{ &ship_obj_Character[(0x20*60) * 0], 0x20*60},		// 下	停止	0
	{ &ship_obj_Character[(0x20*60) * 0], 0x20*60},		// 上	停止	1
	{ &ship_obj_Character[(0x20*60) * 0], 0x20*60},		// 左右 停止	2
	{ &ship_obj_Character[(0x20*60) * 0], 0x20*60},		// 下 	歩行1	3
	{ &ship_obj_Character[(0x20*60) * 0], 0x20*60},		// 下 	歩行2	4
	{ &ship_obj_Character[(0x20*60) * 0], 0x20*60},		// 上	歩行1	5
	{ &ship_obj_Character[(0x20*60) * 0], 0x20*60},		// 上	歩行2	6
	{ &ship_obj_Character[(0x20*60) * 0], 0x20*60},		// 左右 歩行1	7
	{ &ship_obj_Character[(0x20*60) * 0], 0x20*60},		// 左右 歩行2	8
};

//------------------------------------------
//	潜水艦
//------------------------------------------
#if (SUBMARINE_CHMODE == SUBM_CHMODE_IWA)
static const actAnmData o_subm_celltrans[] =
{
	{ &o_subm_Character[(0x20*32) * 0], 0x20*32},		// 下	停止	0
	{ &o_subm_Character[(0x20*32) * 0], 0x20*32},		// 上	停止	1
	{ &o_subm_Character[(0x20*32) * 0], 0x20*32},		// 左右 停止	2
	{ &o_subm_Character[(0x20*32) * 0], 0x20*32},		// 下 	歩行1	3
	{ &o_subm_Character[(0x20*32) * 0], 0x20*32},		// 下 	歩行2	4
	{ &o_subm_Character[(0x20*32) * 0], 0x20*32},		// 上	歩行1	5
	{ &o_subm_Character[(0x20*32) * 0], 0x20*32},		// 上	歩行2	6
	{ &o_subm_Character[(0x20*32) * 0], 0x20*32},		// 左右 歩行1	7
	{ &o_subm_Character[(0x20*32) * 0], 0x20*32},		// 左右 歩行2	8
};
#else
static const actAnmData o_subm_celltrans[] =
{
	{ &submarine_obj_Character[(0x20*44) * 0], 0x20*44},	// 下	停止	0
	{ &submarine_obj_Character[(0x20*44) * 0], 0x20*44},	// 上	停止	1
	{ &submarine_obj_Character[(0x20*44) * 0], 0x20*44},	// 左右 停止	2
	{ &submarine_obj_Character[(0x20*44) * 0], 0x20*44},	// 下 	歩行1	3
	{ &submarine_obj_Character[(0x20*44) * 0], 0x20*44},	// 下 	歩行2	4
	{ &submarine_obj_Character[(0x20*44) * 0], 0x20*44},	// 上	歩行1	5
	{ &submarine_obj_Character[(0x20*44) * 0], 0x20*44},	// 上	歩行2	6
	{ &submarine_obj_Character[(0x20*44) * 0], 0x20*44},	// 左右 歩行1	7
	{ &submarine_obj_Character[(0x20*44) * 0], 0x20*44},	// 左右 歩行2	8
};
#endif

//------------------------------------------
//	ぬいぐるみ 1
//------------------------------------------
static const actAnmData doll1_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 0], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 2
//------------------------------------------
static const actAnmData doll2_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 1], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 3
//------------------------------------------
static const actAnmData doll3_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 2], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 4
//------------------------------------------
static const actAnmData doll4_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 3], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 5
//------------------------------------------
static const actAnmData doll5_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 4], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 6
//------------------------------------------
static const actAnmData doll6_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 5], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 7
//------------------------------------------
static const actAnmData doll7_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 6], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 8
//------------------------------------------
static const actAnmData doll8_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 7], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 9
//------------------------------------------
static const actAnmData doll9_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 8], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 10
//------------------------------------------
static const actAnmData doll10_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 9], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 11
//------------------------------------------
static const actAnmData doll11_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 10], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 12
//------------------------------------------
static const actAnmData doll12_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 11], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 13
//------------------------------------------
static const actAnmData doll13_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 12], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 14
//------------------------------------------
static const actAnmData doll14_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 13], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 15
//------------------------------------------
static const actAnmData doll15_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 14], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 16
//------------------------------------------
static const actAnmData doll16_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 15], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 17
//------------------------------------------
static const actAnmData doll17_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 16], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 18
//------------------------------------------
static const actAnmData doll18_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 17], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 19
//------------------------------------------
static const actAnmData doll19_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 18], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 20
//------------------------------------------
static const actAnmData doll20_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 19], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 21
//------------------------------------------
static const actAnmData doll21_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 20], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 22
//------------------------------------------
static const actAnmData doll22_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 21], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 23
//------------------------------------------
static const actAnmData doll23_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 22], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 24
//------------------------------------------
static const actAnmData doll24_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 23], 0x20*4 },
};

//------------------------------------------
//	ぬいぐるみ 25
//------------------------------------------
static const actAnmData doll25_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 24], 0x20*4 },
};

//------------------------------------------
//	ｸｯｼｮﾝ 1
//------------------------------------------
static const actAnmData cushion1_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 25], 0x20*4 },
};

//------------------------------------------
//	ｸｯｼｮﾝ 2
//------------------------------------------
static const actAnmData cushion2_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 26], 0x20*4 },
};

//------------------------------------------
//	ｸｯｼｮﾝ 3
//------------------------------------------
static const actAnmData cushion3_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 27], 0x20*4 },
};

//------------------------------------------
//	ｸｯｼｮﾝ 4
//------------------------------------------
static const actAnmData cushion4_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 28], 0x20*4 },
};

//------------------------------------------
//	ｸｯｼｮﾝ 5
//------------------------------------------
static const actAnmData cushion5_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 29], 0x20*4 },
};

//------------------------------------------
//	ｸｯｼｮﾝ 6
//------------------------------------------
static const actAnmData cushion6_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 30], 0x20*4 },
};

//------------------------------------------
//	ｸｯｼｮﾝ 7
//------------------------------------------
static const actAnmData cushion7_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 31], 0x20*4 },
};

//------------------------------------------
//	ｸｯｼｮﾝ 8
//------------------------------------------
static const actAnmData cushion8_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 32], 0x20*4 },
};

//------------------------------------------
//	ｸｯｼｮﾝ 9
//------------------------------------------
static const actAnmData cushion9_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 33], 0x20*4 },
};

//------------------------------------------
//	ｸｯｼｮﾝ 10
//------------------------------------------
static const actAnmData cushion10_celltrans[] =
{
	{ &hob_gds16_Character[(0x20*4) * 34], 0x20*4 },
};

//------------------------------------------
//	大きいぬいぐるみ 1
//------------------------------------------
static const actAnmData bigdoll1_celltrans[] =
{
	{ &hob_gds32_Character[(0x20*16) * 0], 0x20*16 },
};

//------------------------------------------
//	大きいぬいぐるみ 2
//------------------------------------------
static const actAnmData bigdoll2_celltrans[] =
{
	{ &hob_gds32_Character[(0x20*16) * 1], 0x20*16 },
};

//------------------------------------------
//	大きいぬいぐるみ 3
//------------------------------------------
static const actAnmData bigdoll3_celltrans[] =
{
	{ &hob_gds32_Character[(0x20*16) * 2], 0x20*16 },
};

//------------------------------------------
//	大きいぬいぐるみ 4
//------------------------------------------
static const actAnmData bigdoll4_celltrans[] =
{
	{ &hob_gds32_Character[(0x20*16) * 3], 0x20*16 },
};

//------------------------------------------
//	大きいぬいぐるみ 5
//------------------------------------------
static const actAnmData bigdoll5_celltrans[] =
{
	{ &hob_gds32_Character[(0x20*16) * 4], 0x20*16 },
};

//------------------------------------------
//	大きいぬいぐるみ 6
//------------------------------------------
static const actAnmData bigdoll6_celltrans[] =
{
	{ &hob_gds32_Character[(0x20*16) * 5], 0x20*16 },
};

//------------------------------------------
//	大きいぬいぐるみ 7
//------------------------------------------
static const actAnmData bigdoll7_celltrans[] =
{
	{ &hob_gds32_Character[(0x20*16) * 6], 0x20*16 },
};

//------------------------------------------
//	大きいぬいぐるみ 8
//------------------------------------------
static const actAnmData bigdoll8_celltrans[] =
{
	{ &hob_gds32_Character[(0x20*16) * 7], 0x20*16 },
};

//------------------------------------------
//	大きいぬいぐるみ 9
//------------------------------------------
static const actAnmData bigdoll9_celltrans[] =
{
	{ &hob_gds32_Character[(0x20*16) * 8], 0x20*16 },
};

//------------------------------------------
//	大きいぬいぐるみ 10
//------------------------------------------
static const actAnmData bigdoll10_celltrans[] =
{
	{ &hob_gds32_Character[(0x20*16) * 9], 0x20*16 },
};

//------------------------------------------
//	ﾗﾃｨｵｽ
//------------------------------------------
static const actAnmData op_lati_celltrans[] =
{
	{ &op_lati_Character[(0x20*16) * 0], 0x20*16},		// 下	停止	0
	{ &op_lati_Character[(0x20*16) * 0], 0x20*16},		// 上	停止	1
	{ &op_lati_Character[(0x20*16) * 0], 0x20*16},		// 左右 停止	2
	{ &op_lati_Character[(0x20*16) * 1], 0x20*16},		// 下 	歩行1	3
	{ &op_lati_Character[(0x20*16) * 2], 0x20*16},		// 下 	歩行2	4
	{ &op_lati_Character[(0x20*16) * 1], 0x20*16},		// 上	歩行1	5
	{ &op_lati_Character[(0x20*16) * 2], 0x20*16},		// 上	歩行2	6
	{ &op_lati_Character[(0x20*16) * 1], 0x20*16},		// 左右 歩行1	7
	{ &op_lati_Character[(0x20*16) * 2], 0x20*16},		// 左右 歩行2	8
};

//------------------------------------------
//	ｱﾄﾞﾊﾞﾝｽ少年
//------------------------------------------
static const actAnmData op_gba_celltrans[] =
{
	{ &op_gba_Character[(0x20*8) * 0], 0x20*8},			// 下	停止	0
	{ &op_gba_Character[(0x20*8) * 1], 0x20*8},			// 上	停止	1
	{ &op_gba_Character[(0x20*8) * 2], 0x20*8},			// 左右 停止	2
	{ &op_gba_Character[(0x20*8) * 0], 0x20*8},			// 下 	歩行1	3
	{ &op_gba_Character[(0x20*8) * 0], 0x20*8},			// 下 	歩行2	4
	{ &op_gba_Character[(0x20*8) * 1], 0x20*8},			// 上	歩行1	5
	{ &op_gba_Character[(0x20*8) * 1], 0x20*8},			// 上	歩行2	6
	{ &op_gba_Character[(0x20*8) * 2], 0x20*8},			// 左右 歩行1	7
	{ &op_gba_Character[(0x20*8) * 2], 0x20*8},			// 左右 歩行2	8
};

//------------------------------------------
//	審査員
//------------------------------------------
static const actAnmData op_sikai_celltrans[] =
{
	{ &op_sikai_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_sikai_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_sikai_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_sikai_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_sikai_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_sikai_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_sikai_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_sikai_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_sikai_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	如雨露男主人公
//------------------------------------------
static const actAnmData joroactm_celltrans[] =
{
	{ &joroactm_Character[(0x20*16) * 0], 0x20*16},		// 下	停止	0
	{ &joroactm_Character[(0x20*16) * 2], 0x20*16},		// 上	停止	1
	{ &joroactm_Character[(0x20*16) * 4], 0x20*16},		// 左右 停止	2
	{ &joroactm_Character[(0x20*16) * 1], 0x20*16},		// 下 	歩行1	3
	{ &joroactm_Character[(0x20*16) * 1], 0x20*16},		// 下 	歩行2	4
	{ &joroactm_Character[(0x20*16) * 3], 0x20*16},		// 上	歩行1	5
	{ &joroactm_Character[(0x20*16) * 3], 0x20*16},		// 上	歩行2	6
	{ &joroactm_Character[(0x20*16) * 5], 0x20*16},		// 左右 歩行1	7
	{ &joroactm_Character[(0x20*16) * 5], 0x20*16},		// 左右 歩行2	8
};

//------------------------------------------
//	如雨露女主人公
//------------------------------------------
static const actAnmData joroactf_celltrans[] =
{
	{ &joroactf_Character[(0x20*16) * 0], 0x20*16},		// 下	停止	0
	{ &joroactf_Character[(0x20*16) * 2], 0x20*16},		// 上	停止	1
	{ &joroactf_Character[(0x20*16) * 4], 0x20*16},		// 左右 停止	2
	{ &joroactf_Character[(0x20*16) * 1], 0x20*16},		// 下 	歩行1	3
	{ &joroactf_Character[(0x20*16) * 1], 0x20*16},		// 下 	歩行2	4
	{ &joroactf_Character[(0x20*16) * 3], 0x20*16},		// 上	歩行1	5
	{ &joroactf_Character[(0x20*16) * 3], 0x20*16},		// 上	歩行2	6
	{ &joroactf_Character[(0x20*16) * 5], 0x20*16},		// 左右 歩行1	7
	{ &joroactf_Character[(0x20*16) * 5], 0x20*16},		// 左右 歩行2	8
};

//------------------------------------------
//	模様替え男主人公
//------------------------------------------
static const actAnmData moyohjikim_celltrans[] =
{
	{ &moyohjiki_Character[(0x20*8) * 0], 0x20*8},
};

//------------------------------------------
//	模様替え女主人公
//------------------------------------------
static const actAnmData moyohjikif_celltrans[] =
{
	{ &moyohjiki_Character[(0x20*8) * 1], 0x20*8},
};

//------------------------------------------
//	ｱｸｱ団ﾎﾞｽ
//------------------------------------------
static const actAnmData op_aquab_celltrans[] =
{
	{ &op_aquab_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_aquab_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_aquab_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_aquab_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_aquab_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_aquab_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_aquab_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_aquab_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_aquab_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	ﾏｸﾞﾏ団ﾎﾞｽ
//------------------------------------------
static const actAnmData op_magb_celltrans[] =
{
	{ &op_magb_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_magb_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_magb_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_magb_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_magb_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_magb_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_magb_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_magb_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_magb_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//------------------------------------------
//	カイオーガ
//------------------------------------------
static const actAnmData op_kiog_celltrans[] =
{
	{ &op_kiog_Character[(0x20*16) * 0], 0x20*16},		// 下	停止	0
	{ &op_kiog_Character[(0x20*16) * 0], 0x20*16},		// 上	停止	1
	{ &op_kiog_Character[(0x20*16) * 0], 0x20*16},		// 左右 停止	2
	{ &op_kiog_Character[(0x20*16) * 1], 0x20*16},		// 下 	歩行1	3
	{ &op_kiog_Character[(0x20*16) * 1], 0x20*16},		// 下 	歩行2	4
	{ &op_kiog_Character[(0x20*16) * 1], 0x20*16},		// 上	歩行1	5
	{ &op_kiog_Character[(0x20*16) * 1], 0x20*16},		// 上	歩行2	6
	{ &op_kiog_Character[(0x20*16) * 1], 0x20*16},		// 左右 歩行1	7
	{ &op_kiog_Character[(0x20*16) * 1], 0x20*16},		// 左右 歩行2	8
};

//------------------------------------------
//	グラードン
//------------------------------------------
static const actAnmData op_grdn_celltrans[] =
{
	{ &op_grdn_Character[(0x20*16) * 0], 0x20*16},		// 下	停止	0
	{ &op_grdn_Character[(0x20*16) * 0], 0x20*16},		// 上	停止	1
	{ &op_grdn_Character[(0x20*16) * 0], 0x20*16},		// 左右 停止	2
	{ &op_grdn_Character[(0x20*16) * 1], 0x20*16},		// 下 	歩行1	3
	{ &op_grdn_Character[(0x20*16) * 1], 0x20*16},		// 下 	歩行2	4
	{ &op_grdn_Character[(0x20*16) * 1], 0x20*16},		// 上	歩行1	5
	{ &op_grdn_Character[(0x20*16) * 1], 0x20*16},		// 上	歩行2	6
	{ &op_grdn_Character[(0x20*16) * 1], 0x20*16},		// 左右 歩行1	7
	{ &op_grdn_Character[(0x20*16) * 1], 0x20*16},		// 左右 歩行2	8
};

//------------------------------------------
//	化石
//------------------------------------------
static const actAnmData o_kaseki_celltrans[] =
{
	{ &o_kaseki_Character[(0x20*4) * 0], 0x20*4},
};

//------------------------------------------
//	伝説OBJ
//------------------------------------------
static const actAnmData op_densets_celltrans[] =
{
	{ &op_densets_Character[(0x20*16) * 0], 0x20*16},	// 下	停止	0
	{ &op_densets_Character[(0x20*16) * 0], 0x20*16},	// 上	停止	1
	{ &op_densets_Character[(0x20*16) * 0], 0x20*16},	// 左右 停止	2
	{ &op_densets_Character[(0x20*16) * 0], 0x20*16},	// 下 	歩行1	3
	{ &op_densets_Character[(0x20*16) * 0], 0x20*16},	// 下 	歩行2	4
	{ &op_densets_Character[(0x20*16) * 0], 0x20*16},	// 上	歩行1	5
	{ &op_densets_Character[(0x20*16) * 0], 0x20*16},	// 上	歩行2	6
	{ &op_densets_Character[(0x20*16) * 0], 0x20*16},	// 左右 歩行1	7
	{ &op_densets_Character[(0x20*16) * 0], 0x20*16},	// 左右 歩行2	8
};

//------------------------------------------
//	エネコ
//------------------------------------------
static const actAnmData op_eneco_celltrans[] =
{
	{ &op_eneco_Character[(0x20*4) * 0], 0x20*4},		// 下	停止	0
	{ &op_eneco_Character[(0x20*4) * 1], 0x20*4},		// 上	停止	1
	{ &op_eneco_Character[(0x20*4) * 2], 0x20*4},		// 左右 停止	2
	{ &op_eneco_Character[(0x20*4) * 0], 0x20*4},		// 下 	歩行1	3
	{ &op_eneco_Character[(0x20*4) * 0], 0x20*4},		// 下 	歩行2	4
	{ &op_eneco_Character[(0x20*4) * 1], 0x20*4},		// 上	歩行1	5
	{ &op_eneco_Character[(0x20*4) * 1], 0x20*4},		// 上	歩行2	6
	{ &op_eneco_Character[(0x20*4) * 2], 0x20*4},		// 左右 歩行1	7
	{ &op_eneco_Character[(0x20*4) * 2], 0x20*4},		// 左右 歩行2	8
};

//------------------------------------------
//	カクレオン
//------------------------------------------
static const actAnmData op_kakreon_celltrans[] =
{
	{ &op_kakreon_Character[(0x20*4) * 0], 0x20*4},		// 下	停止	0
	{ &op_kakreon_Character[(0x20*4) * 1], 0x20*4},		// 上	停止	1
	{ &op_kakreon_Character[(0x20*4) * 2], 0x20*4},		// 左右 停止	2
	{ &op_kakreon_Character[(0x20*4) * 0], 0x20*4},		// 下 	歩行1	3
	{ &op_kakreon_Character[(0x20*4) * 0], 0x20*4},		// 下 	歩行2	4
	{ &op_kakreon_Character[(0x20*4) * 1], 0x20*4},		// 上	歩行1	5
	{ &op_kakreon_Character[(0x20*4) * 1], 0x20*4},		// 上	歩行2	6
	{ &op_kakreon_Character[(0x20*4) * 2], 0x20*4},		// 左右 歩行1	7
	{ &op_kakreon_Character[(0x20*4) * 2], 0x20*4},		// 左右 歩行2	8
};

//------------------------------------------
//	タイクーン
//------------------------------------------
static const actAnmData op_tycoon_celltrans[] =
{
	{ &op_tycoon_Character[(0x20*16) * 0], 0x20*16},	// 下	停止	0
	{ &op_tycoon_Character[(0x20*16) * 0], 0x20*16},	// 上	停止	1
	{ &op_tycoon_Character[(0x20*16) * 0], 0x20*16},	// 左右 停止	2
	{ &op_tycoon_Character[(0x20*16) * 1], 0x20*16},	// 下 	歩行1	3
	{ &op_tycoon_Character[(0x20*16) * 1], 0x20*16},	// 下 	歩行2	4
	{ &op_tycoon_Character[(0x20*16) * 1], 0x20*16},	// 上	歩行1	5
	{ &op_tycoon_Character[(0x20*16) * 1], 0x20*16},	// 上	歩行2	6
	{ &op_tycoon_Character[(0x20*16) * 1], 0x20*16},	// 左右 歩行1	7
	{ &op_tycoon_Character[(0x20*16) * 1], 0x20*16},	// 左右 歩行2	8
};

//------------------------------------------
//	ジグザグマ
//------------------------------------------
static const actAnmData op_jiguma_celltrans[] =
{
	{ &op_jiguma_Character[(0x20*4) * 0], 0x20*4},		// 下	停止	0
	{ &op_jiguma_Character[(0x20*4) * 1], 0x20*4},		// 上	停止	1
	{ &op_jiguma_Character[(0x20*4) * 2], 0x20*4},		// 左右 停止	2
	{ &op_jiguma_Character[(0x20*4) * 0], 0x20*4},		// 下 	歩行1	3
	{ &op_jiguma_Character[(0x20*4) * 0], 0x20*4},		// 下 	歩行2	4
	{ &op_jiguma_Character[(0x20*4) * 1], 0x20*4},		// 上	歩行1	5
	{ &op_jiguma_Character[(0x20*4) * 1], 0x20*4},		// 上	歩行2	6
	{ &op_jiguma_Character[(0x20*4) * 2], 0x20*4},		// 左右 歩行1	7
	{ &op_jiguma_Character[(0x20*4) * 2], 0x20*4},		// 左右 歩行2	8
};

//------------------------------------------
//	ピカチュウ
//------------------------------------------
static const actAnmData op_pika_celltrans[] =
{
	{ &op_pika_Character[(0x20*4) * 0], 0x20*4},		// 下	停止	0
	{ &op_pika_Character[(0x20*4) * 1], 0x20*4},		// 上	停止	1
	{ &op_pika_Character[(0x20*4) * 2], 0x20*4},		// 左右 停止	2
	{ &op_pika_Character[(0x20*4) * 0], 0x20*4},		// 下 	歩行1	3
	{ &op_pika_Character[(0x20*4) * 0], 0x20*4},		// 下 	歩行2	4
	{ &op_pika_Character[(0x20*4) * 1], 0x20*4},		// 上	歩行1	5
	{ &op_pika_Character[(0x20*4) * 1], 0x20*4},		// 上	歩行2	6
	{ &op_pika_Character[(0x20*4) * 2], 0x20*4},		// 左右 歩行1	7
	{ &op_pika_Character[(0x20*4) * 2], 0x20*4},		// 左右 歩行2	8
};

//------------------------------------------
//	マリルリ
//------------------------------------------
static const actAnmData op_mariruri_celltrans[] =
{
	{ &op_mariruri_Character[(0x20*4) * 0], 0x20*4},	// 下	停止	0
	{ &op_mariruri_Character[(0x20*4) * 1], 0x20*4},	// 上	停止	1
	{ &op_mariruri_Character[(0x20*4) * 2], 0x20*4},	// 左右 停止	2
	{ &op_mariruri_Character[(0x20*4) * 0], 0x20*4},	// 下 	歩行1	3
	{ &op_mariruri_Character[(0x20*4) * 0], 0x20*4},	// 下 	歩行2	4
	{ &op_mariruri_Character[(0x20*4) * 1], 0x20*4},	// 上	歩行1	5
	{ &op_mariruri_Character[(0x20*4) * 1], 0x20*4},	// 上	歩行2	6
	{ &op_mariruri_Character[(0x20*4) * 2], 0x20*4},	// 左右 歩行1	7
	{ &op_mariruri_Character[(0x20*4) * 2], 0x20*4},	// 左右 歩行2	8
};

//------------------------------------------
//	キャモメ
//------------------------------------------
static const actAnmData op_camome_celltrans[] =
{
	{ &op_camome_Character[(0x20*4) * 0], 0x20*4},		// 下	停止	0
	{ &op_camome_Character[(0x20*4) * 2], 0x20*4},		// 上	停止	1
	{ &op_camome_Character[(0x20*4) * 4], 0x20*4},		// 左右 停止	2
	{ &op_camome_Character[(0x20*4) * 1], 0x20*4},		// 下 	歩行1	3
	{ &op_camome_Character[(0x20*4) * 1], 0x20*4},		// 下 	歩行2	4
	{ &op_camome_Character[(0x20*4) * 3], 0x20*4},		// 上	歩行1	5
	{ &op_camome_Character[(0x20*4) * 3], 0x20*4},		// 上	歩行2	6
	{ &op_camome_Character[(0x20*4) * 5], 0x20*4},		// 左右 歩行1	7
	{ &op_camome_Character[(0x20*4) * 5], 0x20*4},		// 左右 歩行2	8
};

//------------------------------------------
//	浮き輪坊や
//------------------------------------------
static const actAnmData op_ukib_celltrans[] =
{
	{ &op_ukib_Character[(0x20*4) * 0], 0x20*4},		// 下	停止	0
	{ &op_ukib_Character[(0x20*4) * 1], 0x20*4},		// 上	停止	1
	{ &op_ukib_Character[(0x20*4) * 2], 0x20*4},		// 左右 停止	2
	{ &op_ukib_Character[(0x20*4) * 3], 0x20*4},		// 下 	歩行1	3
	{ &op_ukib_Character[(0x20*4) * 4], 0x20*4},		// 下 	歩行2	4
	{ &op_ukib_Character[(0x20*4) * 5], 0x20*4},		// 上	歩行1	5
	{ &op_ukib_Character[(0x20*4) * 6], 0x20*4},		// 上	歩行2	6
	{ &op_ukib_Character[(0x20*4) * 7], 0x20*4},		// 左右 歩行1	7
	{ &op_ukib_Character[(0x20*4) * 8], 0x20*4},		// 左右 歩行2	8
};

//------------------------------------------
//	ルリリ
//------------------------------------------
static const actAnmData op_ruriri_celltrans[] =
{
	{ &op_ruriri_Character[(0x20*4) * 0], 0x20*4},		// 下	停止	0
	{ &op_ruriri_Character[(0x20*4) * 1], 0x20*4},		// 上	停止	1
	{ &op_ruriri_Character[(0x20*4) * 2], 0x20*4},		// 左右 停止	2
	{ &op_ruriri_Character[(0x20*4) * 0], 0x20*4},		// 下 	歩行1	3
	{ &op_ruriri_Character[(0x20*4) * 0], 0x20*4},		// 下 	歩行2	4
	{ &op_ruriri_Character[(0x20*4) * 1], 0x20*4},		// 上	歩行1	5
	{ &op_ruriri_Character[(0x20*4) * 1], 0x20*4},		// 上	歩行2	6
	{ &op_ruriri_Character[(0x20*4) * 2], 0x20*4},		// 左右 歩行1	7
	{ &op_ruriri_Character[(0x20*4) * 2], 0x20*4},		// 左右 歩行2	8
};

//------------------------------------------
//	まま
//------------------------------------------
static const actAnmData op_mama_celltrans[] =
{
	{ &op_mama_Character[(0x20*8) * 0], 0x20*8},		// 下	停止	0
	{ &op_mama_Character[(0x20*8) * 1], 0x20*8},		// 上	停止	1
	{ &op_mama_Character[(0x20*8) * 2], 0x20*8},		// 左右 停止	2
	{ &op_mama_Character[(0x20*8) * 3], 0x20*8},		// 下 	歩行1	3
	{ &op_mama_Character[(0x20*8) * 4], 0x20*8},		// 下 	歩行2	4
	{ &op_mama_Character[(0x20*8) * 5], 0x20*8},		// 上	歩行1	5
	{ &op_mama_Character[(0x20*8) * 6], 0x20*8},		// 上	歩行2	6
	{ &op_mama_Character[(0x20*8) * 7], 0x20*8},		// 左右 歩行1	7
	{ &op_mama_Character[(0x20*8) * 8], 0x20*8},		// 左右 歩行2	8
};

//======================================================================
//		ｱﾆﾒﾃﾞｰﾀﾅﾝﾊﾞ
//======================================================================
//------------------------------------------
//	固定ｱﾆﾒﾅﾝﾊﾞ
//------------------------------------------
enum										// 7 ﾊﾟﾀｰﾝ
{
	TYPE_0_STOP_D = 0,						// 00	下停止
	TYPE_0_STOP_U,							// 01	上停止
	TYPE_0_STOP_LR,							// 02	左右停止
	TYPE_0_WALK_D,							// 03	下歩行
	TYPE_0_WALK_U,							// 04	上歩行
	TYPE_0_WALK_LR0,						// 05	左右歩行0
	TYPE_0_WALK_LR1,						// 06	左右歩行1
};

enum										// 9 ﾊﾟﾀｰﾝ
{
	TYPE_1_STOP_D = 0,						// 00	下停止
	TYPE_1_STOP_U,							// 01	上停止
	TYPE_1_STOP_LR,							// 02	左右停止
	TYPE_1_WALK_D0,							// 03	下歩行0
	TYPE_1_WALK_D1,							// 04	下歩行1
	TYPE_1_WALK_U0,							// 05	上歩行0
	TYPE_1_WALK_U1,							// 06	上歩行1
	TYPE_1_WALK_LR0,						// 07	左右歩行0
	TYPE_1_WALK_LR1,						// 08	左右歩行1
};

#define	TYPE_1_ANMEND (TYPE_1_WALK_LR1+1)	// 09	固定ｱﾆﾒ終了番号

//------------------------------------------
//	ﾀﾞｯｼｭ専用ｱﾆﾒﾅﾝﾊﾞ
//------------------------------------------
enum
{
	TYPE_DASH_STOP_D = TYPE_1_ANMEND,		// 00	下停止
	TYPE_DASH_STOP_U,						// 01	上停止
	TYPE_DASH_STOP_LR,						// 02	左右停止
	TYPE_DASH_WALK_D0,						// 03	下歩行0
	TYPE_DASH_WALK_D1,						// 04	下歩行1
	TYPE_DASH_WALK_U0,						// 05	上歩行0
	TYPE_DASH_WALK_U1,						// 06	上歩行1
	TYPE_DASH_WALK_LR0,						// 07	左右歩行0
	TYPE_DASH_WALK_LR1,						// 08	左右歩行1
};

//------------------------------------------
//	波乗り専用ｱﾆﾒﾅﾝﾊﾞ
//------------------------------------------
enum
{
	TYPE_SWIM_JUMP_D = TYPE_1_ANMEND,		// 09	下ｼﾞｬﾝﾌﾟ
	TYPE_SWIM_JUMP_U,						// 0a	上ｼﾞｬﾝﾌﾟ
	TYPE_SWIM_JUMP_LR,						// 0b	左右ｼﾞｬﾝﾌﾟ
};

//------------------------------------------
//	秘伝技専用ｱﾆﾒﾅﾝﾊﾞ
//------------------------------------------
enum
{
	TYPE_HIDEN_0 = 0,						// 00	振りかざし
	TYPE_HIDEN_1,							// 01	振りかざし
	TYPE_HIDEN_2,							// 02	振りかざし
	TYPE_HIDEN_3,							// 03	振りかざし
	TYPE_HIDEN_4,							// 04	振りかざし
};

//------------------------------------------
//	自転車ｽﾎﾟｰﾂﾀｲﾌﾟｱﾆﾒﾅﾝﾊﾞ
//------------------------------------------
enum
{
	TYPE_CYCLE_S_FTUP_D0 = TYPE_1_ANMEND,
	TYPE_CYCLE_S_FTUP_D1,
	TYPE_CYCLE_S_RTUP_D0,
	TYPE_CYCLE_S_RTUP_D1,

	TYPE_CYCLE_S_FTUP_U0,
	TYPE_CYCLE_S_FTUP_U1,
	TYPE_CYCLE_S_RTUP_U0,
	TYPE_CYCLE_S_RTUP_U1,
	
	TYPE_CYCLE_S_FTUP_LR0,
	TYPE_CYCLE_S_FTUP_LR1,
	TYPE_CYCLE_S_RTUP_LR0,
	TYPE_CYCLE_S_RTUP_LR1,
	
	TYPE_CYCLE_S_WHEELIE_D0,
	TYPE_CYCLE_S_WHEELIE_D1,
	TYPE_CYCLE_S_WHEELIE_U0,
	TYPE_CYCLE_S_WHEELIE_U1,
	TYPE_CYCLE_S_WHEELIE_LR0,
	TYPE_CYCLE_S_WHEELIE_LR1,
};

//------------------------------------------
//	たね専用ｱﾆﾒﾅﾝﾊﾞ
//------------------------------------------
enum										// たね
{
	TYPE_SEED_0_0 = 0,
	TYPE_SEED_1_0,
	TYPE_SEED_1_1,
	TYPE_SEED_2_0,
	TYPE_SEED_2_1,
	TYPE_SEED_3_0,
	TYPE_SEED_3_1,
	TYPE_SEED_4_0,
	TYPE_SEED_4_1,
};

//------------------------------------------
//	お辞儀用ｱﾆﾒﾅﾝﾊﾞ
//------------------------------------------
#define	TYPE_PC_BOW		9					// PC 姉さん お辞儀

//------------------------------------------
//	岩砕きｱﾆﾒﾅﾝﾊﾞ
//------------------------------------------
enum
{
	TYPE_CRUSH_ROCK_0,
	TYPE_CRUSH_ROCK_1,
	TYPE_CRUSH_ROCK_2,
	TYPE_CRUSH_ROCK_3,
};

//------------------------------------------
//	居合切りｱﾆﾒﾅﾝﾊﾞ
//------------------------------------------
enum
{
	TYPE_CUT_TREE_0,
	TYPE_CUT_TREE_1,
	TYPE_CUT_TREE_2,
	TYPE_CUT_TREE_3,
};

//------------------------------------------
//	釣りｱﾆﾒﾅﾝﾊﾞ	
//------------------------------------------
enum
{
	TYPE_FISHING_LR_0 = 0,
	TYPE_FISHING_LR_1,
	TYPE_FISHING_LR_2,
	TYPE_FISHING_LR_3,

	TYPE_FISHING_U_0,
	TYPE_FISHING_U_1,
	TYPE_FISHING_U_2,
	TYPE_FISHING_U_3,

	TYPE_FISHING_D_0,
	TYPE_FISHING_D_1,
	TYPE_FISHING_D_2,
	TYPE_FISHING_D_3,
};

//======================================================================
//		ｱﾆﾒﾃﾞｰﾀ
//======================================================================
//------------------------------------------
//	ｱﾆﾒﾀﾞﾐｰ
//------------------------------------------
static const actAnm ObjDummyAnm[] =
{
	{0,8,0,0},
	{0,8,0,0},
	{0,8,0,0},
	{0,8,0,0},
	{ACT_ANMLOOP,0,0,0},
};

//------------------------------------------
//	16ﾄﾞｯﾄ歩行 通常ﾌｨｰﾙﾄﾞ ｱﾆﾒ その0
//------------------------------------------
static const actAnm Obj16AnmDownStopType0[]=			// 下
{
	{TYPE_0_STOP_D,16,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmUpStopType0[]=				// 上
{
	{TYPE_0_STOP_U,16,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmLeftStopType0[]=			// 左
{
	{TYPE_0_STOP_LR,16,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmRightStopType0[]=			// 右
{
	{TYPE_0_STOP_LR,16,1,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmDownWalkType0[]=			// 下歩行
{
	{TYPE_0_WALK_D,8,0,0},
	{TYPE_0_STOP_D,8,0,0},
	{TYPE_0_WALK_D,8,1,0},
	{TYPE_0_STOP_D,8,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmUpWalkType0[]=				// 上歩行
{
	{TYPE_0_WALK_U,8,0,0},
	{TYPE_0_STOP_U,8,0,0},
	{TYPE_0_WALK_U,8,1,0},
	{TYPE_0_STOP_U,8,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmLeftWalkType0[]=			// 左歩行
{
	{TYPE_0_WALK_LR0,8,0,0},
	{TYPE_0_STOP_LR,8,0,0},
	{TYPE_0_WALK_LR1,8,0,0},
	{TYPE_0_STOP_LR,8,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmRightWalkType0[]=			// 右歩行
{
	{TYPE_0_WALK_LR0,8,1,0},
	{TYPE_0_STOP_LR,8,1,0},
	{TYPE_0_WALK_LR1,8,1,0},
	{TYPE_0_STOP_LR,8,1,0},
	{ACT_ANMLOOP, 0,0,0},
};
static const actAnm Obj16AnmDownRunType0[]=				// 下走行
{
	{TYPE_0_WALK_D,4,0,0},
	{TYPE_0_STOP_D,4,0,0},
	{TYPE_0_WALK_D,4,1,0},
	{TYPE_0_STOP_D,4,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmUpRunType0[]=				// 上走行
{
	{TYPE_0_WALK_U,4,0,0},
	{TYPE_0_STOP_U,4,0,0},
	{TYPE_0_WALK_U,4,1,0},
	{TYPE_0_STOP_U,4,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmLeftRunType0[]=				// 左走行
{
	{TYPE_0_WALK_LR0,4,0,0},
	{TYPE_0_STOP_LR,4,0,0},
	{TYPE_0_WALK_LR1,4,0,0},
	{TYPE_0_STOP_LR,4,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmRightRunType0[]=			// 右走行
{
	{TYPE_0_WALK_LR0,4,1,0},
	{TYPE_0_STOP_LR,4,1,0},
	{TYPE_0_WALK_LR1,4,1,0},
	{TYPE_0_STOP_LR,4,1,0},
	{ACT_ANMLOOP, 0,0,0},
};
static const actAnm Obj16AnmDownDashType0[]=			// 下ﾀﾞｯｼｭ
{
	{TYPE_0_WALK_D,2,0,0},
	{TYPE_0_STOP_D,2,0,0},
	{TYPE_0_WALK_D,2,1,0},
	{TYPE_0_STOP_D,2,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmUpDashType0[]=				// 上ﾀﾞｯｼｭ
{
	{TYPE_0_WALK_U,2,0,0},
	{TYPE_0_STOP_U,2,0,0},
	{TYPE_0_WALK_U,2,1,0},
	{TYPE_0_STOP_U,2,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmLeftDashType0[]=			// 左ﾀﾞｯｼｭ
{
	{TYPE_0_WALK_LR0,2,0,0},
	{TYPE_0_STOP_LR,2,0,0},
	{TYPE_0_WALK_LR1,2,0,0},
	{TYPE_0_STOP_LR,2,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmRightDashType0[]=			// 右ﾀﾞｯｼｭ
{
	{TYPE_0_WALK_LR0,2,1,0},
	{TYPE_0_STOP_LR,2,1,0},
	{TYPE_0_WALK_LR1,2,1,0},
	{TYPE_0_STOP_LR,2,1,0},
	{ACT_ANMLOOP, 0,0,0},
};
static const actAnm Obj16AnmDownQuickType0[]=			// 下高速移動
{
	{TYPE_0_WALK_D,1,0,0},
	{TYPE_0_STOP_D,1,0,0},
	{TYPE_0_WALK_D,1,1,0},
	{TYPE_0_STOP_D,1,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmUpQuickType0[]=				// 上高速移動
{
	{TYPE_0_WALK_U,1,0,0},
	{TYPE_0_STOP_U,1,0,0},
	{TYPE_0_WALK_U,1,1,0},
	{TYPE_0_STOP_U,1,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmLeftQuickType0[]=			// 左高速移動
{
	{TYPE_0_WALK_LR0,1,0,0},
	{TYPE_0_STOP_LR,1,0,0},
	{TYPE_0_WALK_LR1,1,0,0},
	{TYPE_0_STOP_LR,1,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmRightQuickType0[]=			// 右高速移動
{
	{TYPE_0_WALK_LR0,1,1,0},
	{TYPE_0_STOP_LR,1,1,0},
	{TYPE_0_WALK_LR1,1,1,0},
	{TYPE_0_STOP_LR,1,1,0},
	{ACT_ANMLOOP, 0,0,0},
};

//------------------------------------------
//	16ﾄﾞｯﾄ歩行 通常ﾌｨｰﾙﾄﾞ ｱﾆﾒﾃﾞｰﾀ その１
//------------------------------------------
static const actAnm Obj16AnmDownStopType1[]=			// 下
{
	{TYPE_1_STOP_D,16,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmUpStopType1[]=				// 上
{
	{TYPE_1_STOP_U,16,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmLeftStopType1[]=			// 左
{
	{TYPE_1_STOP_LR,16,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmRightStopType1[]=			// 右
{
	{TYPE_1_STOP_LR,16,1,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmDownWalkType1[]=			// 下歩行
{
	{TYPE_1_WALK_D0,8,0,0},
	{TYPE_1_STOP_D,8,0,0},
	{TYPE_1_WALK_D1,8,0,0},
	{TYPE_1_STOP_D,8,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmUpWalkType1[]=				// 上歩行
{
	{TYPE_1_WALK_U0,8,0,0},
	{TYPE_1_STOP_U,8,0,0},
	{TYPE_1_WALK_U1,8,0,0},
	{TYPE_1_STOP_U,8,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmLeftWalkType1[]=			// 左歩行
{
	{TYPE_1_WALK_LR0,8,0,0},
	{TYPE_1_STOP_LR,8,0,0},
	{TYPE_1_WALK_LR1,8,0,0},
	{TYPE_1_STOP_LR,8,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmRightWalkType1[]=			// 右歩行
{
	{TYPE_1_WALK_LR0,8,1,0},
	{TYPE_1_STOP_LR,8,1,0},
	{TYPE_1_WALK_LR1,8,1,0},
	{TYPE_1_STOP_LR,8,1,0},
	{ACT_ANMLOOP, 0,0,0},
};
static const actAnm Obj16AnmDownRunType1[]=				// 下走行
{
	{TYPE_1_WALK_D0,4,0,0},
	{TYPE_1_STOP_D,4,0,0},
	{TYPE_1_WALK_D1,4,0,0},
	{TYPE_1_STOP_D,4,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmUpRunType1[]=				// 上走行
{
	{TYPE_1_WALK_U0,4,0,0},
	{TYPE_1_STOP_U,4,0,0},
	{TYPE_1_WALK_U1,4,0,0},
	{TYPE_1_STOP_U,4,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmLeftRunType1[]=				// 左走行
{
	{TYPE_1_WALK_LR0,4,0,0},
	{TYPE_1_STOP_LR,4,0,0},
	{TYPE_1_WALK_LR1,4,0,0},
	{TYPE_1_STOP_LR,4,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmRightRunType1[]=			// 右走行
{
	{TYPE_1_WALK_LR0,4,1,0},
	{TYPE_1_STOP_LR,4,1,0},
	{TYPE_1_WALK_LR1,4,1,0},
	{TYPE_1_STOP_LR,4,1,0},
	{ACT_ANMLOOP, 0,0,0},
};
static const actAnm Obj16AnmDownDashType1[]=			// 下ﾀﾞｯｼｭ
{
	{TYPE_1_WALK_D0,2,0,0},
	{TYPE_1_STOP_D,2,0,0},
	{TYPE_1_WALK_D1,2,0,0},
	{TYPE_1_STOP_D,2,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmUpDashType1[]=				// 上ﾀﾞｯｼｭ
{
	{TYPE_1_WALK_U0,2,0,0},
	{TYPE_1_STOP_U,2,0,0},
	{TYPE_1_WALK_U1,2,0,0},
	{TYPE_1_STOP_U,2,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmLeftDashType1[]=			// 左ﾀﾞｯｼｭ
{
	{TYPE_1_WALK_LR0,2,0,0},
	{TYPE_1_STOP_LR,2,0,0},
	{TYPE_1_WALK_LR1,2,0,0},
	{TYPE_1_STOP_LR,2,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmRightDashType1[]=			// 右ﾀﾞｯｼｭ
{
	{TYPE_1_WALK_LR0,2,1,0},
	{TYPE_1_STOP_LR,2,1,0},
	{TYPE_1_WALK_LR1,2,1,0},
	{TYPE_1_STOP_LR,2,1,0},
	{ACT_ANMLOOP, 0,0,0},
};
static const actAnm Obj16AnmDownQuickType1[]=			// 下高速移動
{
	{TYPE_1_WALK_D0,1,0,0},
	{TYPE_1_STOP_D,1,0,0},
	{TYPE_1_WALK_D1,1,0,0},
	{TYPE_1_STOP_D,1,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmUpQuickType1[]=				// 上高速移動
{
	{TYPE_1_WALK_U0,1,0,0},
	{TYPE_1_STOP_U,1,0,0},
	{TYPE_1_WALK_U1,1,0,0},
	{TYPE_1_STOP_U,1,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmLeftQuickType1[]=			// 左高速移動
{
	{TYPE_1_WALK_LR0,1,0,0},
	{TYPE_1_STOP_LR,1,0,0},
	{TYPE_1_WALK_LR1,1,0,0},
	{TYPE_1_STOP_LR,1,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmRightQuickType1[]=			// 右高速移動
{
	{TYPE_1_WALK_LR0,1,1,0},
	{TYPE_1_STOP_LR,1,1,0},
	{TYPE_1_WALK_LR1,1,1,0},
	{TYPE_1_STOP_LR,1,1,0},
	{ACT_ANMLOOP, 0,0,0},
};

//------------------------------------------
//	主人公ﾀﾞｯｼｭ
//------------------------------------------
static const actAnm Obj16AnmDownHeroDashType[]=			// 下ﾀﾞｯｼｭ
{
	{TYPE_DASH_WALK_D0,5,0,0},
	{TYPE_DASH_STOP_D,3,0,0},
	{TYPE_DASH_WALK_D1,5,0,0},
	{TYPE_DASH_STOP_D,3,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmUpHeroDashType[]=			// 上ﾀﾞｯｼｭ
{
	{TYPE_DASH_WALK_U0,5,0,0},
	{TYPE_DASH_STOP_U,3,0,0},
	{TYPE_DASH_WALK_U1,5,0,0},
	{TYPE_DASH_STOP_U,3,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmLeftHeroDashType[]=			// 左ﾀﾞｯｼｭ
{
	{TYPE_DASH_WALK_LR0,5,0,0},
	{TYPE_DASH_STOP_LR,3,0,0},
	{TYPE_DASH_WALK_LR1,5,0,0},
	{TYPE_DASH_STOP_LR,3,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm Obj16AnmRightHeroDashType[]=		// 右ﾀﾞｯｼｭ
{
	{TYPE_DASH_WALK_LR0,5,1,0},
	{TYPE_DASH_STOP_LR,3,1,0},
	{TYPE_DASH_WALK_LR1,5,1,0},
	{TYPE_DASH_STOP_LR,3,1,0},
	{ACT_ANMLOOP, 0,0,0},
};

//------------------------------------------
//	主人公秘伝ｴﾌｪｸﾄ発動
//------------------------------------------
static const actAnm ObjHeroHidenAnm[] =
{
	{TYPE_HIDEN_0,4,0,0},
	{TYPE_HIDEN_1,4,0,0},
	{TYPE_HIDEN_2,4,0,0},
	{TYPE_HIDEN_3,4,0,0},
	{TYPE_HIDEN_4,8,0,0},
	{ACT_ANMEND,0,0,0},
};

//------------------------------------------
//	主人公波乗りｼﾞｬﾝﾌﾟ
//------------------------------------------
static const actAnm ObjHeroSwimJumpDown[] =				// 下ｼﾞｬﾝﾌﾟ
{
	{TYPE_SWIM_JUMP_D,32,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm ObjHeroSwimJumpUp[] =				// 上ｼﾞｬﾝﾌﾟ
{
	{TYPE_SWIM_JUMP_U,32,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm ObjHeroSwimJumpLeft[] =				// 左ｼﾞｬﾝﾌﾟ
{
	{TYPE_SWIM_JUMP_LR,32,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm ObjHeroSwimJumpRight[] =			// 右ｼﾞｬﾝﾌﾟ
{
	{TYPE_SWIM_JUMP_LR,32,1,0},
	{ACT_ANMLOOP,0,0,0},
};

//------------------------------------------
//	自転車 Sﾀｲﾌﾟ
//------------------------------------------
static const actAnm ObjCycleS_FtUpDown[] =				// 下ﾌﾛﾝﾄｱｯﾌﾟ
{
	{TYPE_CYCLE_S_FTUP_D0, 4, 0, 0 },
	{TYPE_CYCLE_S_FTUP_D1, 4, 0, 0 },
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjCycleS_FtUpUp[] =				// 上ﾌﾛﾝﾄ
{
	{TYPE_CYCLE_S_FTUP_U0, 4, 0, 0 },
	{TYPE_CYCLE_S_FTUP_U1, 4, 0, 0 },
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjCycleS_FtUpLeft[] =				// 左ﾌﾛﾝﾄ
{
	{TYPE_CYCLE_S_FTUP_LR0, 4, 0, 0 },
	{TYPE_CYCLE_S_FTUP_LR1, 4, 0, 0 },
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjCycleS_FtUpRight[] =				// 右ﾌﾛﾝﾄ
{
	{TYPE_CYCLE_S_FTUP_LR0, 4, 1, 0 },
	{TYPE_CYCLE_S_FTUP_LR1, 4, 1, 0 },
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjCycleS_RtUpDown[] =				// 下ﾘｱ
{
	{TYPE_CYCLE_S_RTUP_D0, 4, 0, 0 },
	{TYPE_CYCLE_S_RTUP_D1, 4, 0, 0 },
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjCycleS_RtUpUp[] =				// 上ﾘｱ
{
	{TYPE_CYCLE_S_RTUP_U0, 4, 0, 0 },
	{TYPE_CYCLE_S_RTUP_U1, 4, 0, 0 },
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjCycleS_RtUpLeft[] =				// 左ﾘｱ
{
	{TYPE_CYCLE_S_RTUP_LR0, 4, 0, 0 },
	{TYPE_CYCLE_S_RTUP_LR1, 4, 0, 0 },
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjCycleS_RtUpRight[] =				// 右ﾘｱ
{
	{TYPE_CYCLE_S_RTUP_LR0, 4, 1, 0 },
	{TYPE_CYCLE_S_RTUP_LR1, 4, 1, 0 },
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjCycleS_FtDownDown[] =			// 下ﾌﾛﾝﾄﾀﾞｳﾝ
{
	{TYPE_CYCLE_S_FTUP_D0, 4, 0, 0 },
	{TYPE_1_STOP_D,4,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjCycleS_FtDownUp[] =				// 上ﾌﾛﾝﾄ
{
	{TYPE_CYCLE_S_FTUP_U0, 4, 0, 0 },
	{TYPE_1_STOP_U,4,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjCycleS_FtDownLeft[] =			// 左ﾌﾛﾝﾄ
{
	{TYPE_CYCLE_S_FTUP_LR0, 4, 0, 0 },
	{TYPE_1_STOP_LR,4,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjCycleS_FtDownRight[] =			// 右ﾌﾛﾝﾄ
{
	{TYPE_CYCLE_S_FTUP_LR0, 4, 1, 0 },
	{TYPE_1_STOP_LR,4,1,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjCycleS_RtDownDown[] =			// 下ﾘｱ
{
	{TYPE_CYCLE_S_RTUP_D0, 4, 0, 0 },
	{TYPE_1_STOP_D,4,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjCycleS_RtDownUp[] =				// 上ﾘｱ
{
	{TYPE_CYCLE_S_RTUP_U0, 4, 0, 0 },
	{TYPE_1_STOP_U,4,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjCycleS_RtDownLeft[] =			// 左ﾘｱ
{
	{TYPE_CYCLE_S_RTUP_LR0, 4, 0, 0 },
	{TYPE_1_STOP_LR,4,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjCycleS_RtDownRight[] =			// 右ﾘｱ
{
	{TYPE_CYCLE_S_RTUP_LR0, 4, 1, 0 },
	{TYPE_1_STOP_LR,4,1,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjCycleS_WheelieDown[] =			// 下ｳｲﾘｰ
{
	{TYPE_CYCLE_S_WHEELIE_D0, 4, 0, 0 },
	{TYPE_CYCLE_S_FTUP_D1, 4, 0, 0 },
	{TYPE_CYCLE_S_WHEELIE_D1, 4, 0, 0 },
	{TYPE_CYCLE_S_FTUP_D1, 4, 0, 0 },
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm ObjCycleS_WheelieUp[] =				// 上ｳｲﾘｰ
{
	{TYPE_CYCLE_S_WHEELIE_U0, 4, 0, 0 },
	{TYPE_CYCLE_S_FTUP_U1, 4, 0, 0 },
	{TYPE_CYCLE_S_WHEELIE_U1, 4, 0, 0 },
	{TYPE_CYCLE_S_FTUP_U1, 4, 0, 0 },
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm ObjCycleS_WheelieLeft[] =			// 左ｳｲﾘｰ
{
	{TYPE_CYCLE_S_WHEELIE_LR0, 4, 0, 0 },
	{TYPE_CYCLE_S_FTUP_LR1, 4, 0, 0 },
	{TYPE_CYCLE_S_WHEELIE_LR1, 4, 0, 0 },
	{TYPE_CYCLE_S_FTUP_LR1, 4, 0, 0 },
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm ObjCycleS_WheelieRight[] =			// 右ｳｲﾘｰ
{
	{TYPE_CYCLE_S_WHEELIE_LR0, 4, 1, 0 },
	{TYPE_CYCLE_S_FTUP_LR1, 4, 1, 0 },
	{TYPE_CYCLE_S_WHEELIE_LR1, 4, 1, 0 },
	{TYPE_CYCLE_S_FTUP_LR1, 4, 1, 0 },
	{ACT_ANMLOOP,0,0,0},
};
//------------------------------------------
//	たね
//------------------------------------------
static const actAnm ObjSeed_0[] =						// 土
{
	{TYPE_SEED_0_0,32,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjSeed_1[] =						// 芽
{
	{TYPE_SEED_1_0,32,0,0},
	{TYPE_SEED_1_1,32,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjSeed_2[] =						// 幹
{
	{TYPE_SEED_2_0,48,0,0},
	{TYPE_SEED_2_1,48,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjSeed_3[] =						// 花
{
	{TYPE_SEED_3_0,32,0,0},
	{TYPE_SEED_3_0,32,0,0},
	{TYPE_SEED_3_1,32,0,0},
	{TYPE_SEED_3_1,32,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjSeed_4[] =						// 種
{
	{TYPE_SEED_4_0,48,0,0},
	{TYPE_SEED_4_0,48,0,0},
	{TYPE_SEED_4_1,48,0,0},
	{TYPE_SEED_4_1,48,0,0},
	{ACT_ANMEND,0,0,0},
};
	
//------------------------------------------
//	PC お辞儀
//------------------------------------------
static const actAnm ObjAnmPcWomanBow[] =
{
	{TYPE_1_STOP_D,8,0,0},
	{TYPE_PC_BOW,32,0,0},
	{TYPE_1_STOP_D,8,0,0},
	{ACT_ANMEND,0,0,0},
};

//------------------------------------------
//	岩砕き
//------------------------------------------
static const actAnm ObjAnmCrushRock[] =
{
	{TYPE_CRUSH_ROCK_0,8,0,0},
	{TYPE_CRUSH_ROCK_1,8,0,0},
	{TYPE_CRUSH_ROCK_2,8,0,0},
	{TYPE_CRUSH_ROCK_3,8,0,0},
	{ACT_ANMEND,0,0,0},
};

//------------------------------------------
//	居合切り
//------------------------------------------
static const actAnm ObjAnmCutTree[] =
{
	{TYPE_CUT_TREE_0,6,0,0},
	{TYPE_CUT_TREE_1,6,0,0},
	{TYPE_CUT_TREE_2,6,0,0},
	{TYPE_CUT_TREE_3,6,0,0},
	{ACT_ANMEND,0,0,0},
};

//------------------------------------------
//	釣り
//------------------------------------------
static const actAnm ObjFishingDownStart[] =
{
	{TYPE_FISHING_D_0,4,0,0},
	{TYPE_FISHING_D_1,4,0,0},
	{TYPE_FISHING_D_2,4,0,0},
	{TYPE_FISHING_D_3,4,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjFishingUpStart[] =
{
	{TYPE_FISHING_U_0,4,0,0},
	{TYPE_FISHING_U_1,4,0,0},
	{TYPE_FISHING_U_2,4,0,0},
	{TYPE_FISHING_U_3,4,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjFishingLeftStart[] =
{
	{TYPE_FISHING_LR_0,4,0,0},
	{TYPE_FISHING_LR_1,4,0,0},
	{TYPE_FISHING_LR_2,4,0,0},
	{TYPE_FISHING_LR_3,4,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjFishingRightStart[] =
{
	{TYPE_FISHING_LR_0,4,1,0},
	{TYPE_FISHING_LR_1,4,1,0},
	{TYPE_FISHING_LR_2,4,1,0},
	{TYPE_FISHING_LR_3,4,1,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjFishingDownEnd[] =
{
	{TYPE_FISHING_D_3,4,0,0},
	{TYPE_FISHING_D_2,6,0,0},
	{TYPE_FISHING_D_1,6,0,0},
	{TYPE_FISHING_D_0,6,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjFishingUpEnd[] =
{
	{TYPE_FISHING_U_3,4,0,0},
	{TYPE_FISHING_U_2,6,0,0},
	{TYPE_FISHING_U_1,6,0,0},
	{TYPE_FISHING_U_0,6,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjFishingLeftEnd[] =
{
	{TYPE_FISHING_LR_3,4,0,0},
	{TYPE_FISHING_LR_2,4,0,0},
	{TYPE_FISHING_LR_1,4,0,0},
	{TYPE_FISHING_LR_0,4,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjFishingRightEnd[] =
{
	{TYPE_FISHING_LR_3,4,1,0},
	{TYPE_FISHING_LR_2,4,1,0},
	{TYPE_FISHING_LR_1,4,1,0},
	{TYPE_FISHING_LR_0,4,1,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm ObjFishingDownHit[] =
{
	{TYPE_FISHING_D_2,6,0,0},
	{TYPE_FISHING_D_3,6,0,0},
	{ACT_ANMcLOOP,1,0,0},
	{TYPE_FISHING_D_3,30,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm ObjFishingUpHit[] =
{
	{TYPE_FISHING_U_2,6,0,0},
	{TYPE_FISHING_U_3,6,0,0},
	{ACT_ANMcLOOP,1,0,0},
	{TYPE_FISHING_U_3,30,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm ObjFishingLeftHit[] =
{
	{TYPE_FISHING_LR_2,6,0,0},
	{TYPE_FISHING_LR_3,6,0,0},
	{ACT_ANMcLOOP,1,0,0},
	{TYPE_FISHING_LR_3,30,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm ObjFishingRightHit[] =
{
	{TYPE_FISHING_LR_2,6,1,0},
	{TYPE_FISHING_LR_3,6,1,0},
	{ACT_ANMcLOOP,1,0,0},
	{TYPE_FISHING_LR_3,30,1,0},
	{ACT_ANMLOOP,0,0,0},
};

//------------------------------------------
//	ｶｲｵｰｶﾞ,ｸﾞﾗｰﾄﾞﾝ 拡縮ｱﾆﾒﾃﾞｰﾀﾃｰﾌﾞﾙ
//------------------------------------------
static const actAffAnm ObjKiog_MoveStart05Tbl[] =
{
	{ 0, 0, 1, 1 },
	{ 0, 0, 0, 1 },
	{ 0, 0, 0, 1 },
	{ 0, 0, 0, 1 },
	{ ACT_AFcLOOP, 7, 0, 0 },
	{ ACT_AFLOOP, 0, 0, 0 },
};

static const actAffAnm ObjKiog_Move05Tbl[] =
{
	{ 0, 0, -1, 1 },
	{ 0, 0, 0, 1 },
	{ ACT_AFcLOOP, 15, 0, 0 },
	{ 0, 0, 1, 1 },
	{ 0, 0, 0, 1 },
	{ ACT_AFcLOOP, 15, 0, 0 },
	{ ACT_AFLOOP, 0, 0, 0 },
};

//======================================================================
//		ｱﾆﾒﾃﾞｰﾀﾃｰﾌﾞﾙ
//======================================================================
//------------------------------------------
//	ﾀﾞﾐｰ
//------------------------------------------
static const actAnm * const ObjAnmTbl_TypeDummy[] =
{
	ObjDummyAnm,
};

//------------------------------------------
//	通常ｱﾆﾒﾃﾞｰﾀﾃｰﾌﾞﾙ その0
//------------------------------------------
static const actAnm * const ObjAnmTbl_Type0[] =
{
	Obj16AnmDownStopType0,					// STOP_D_ST
	Obj16AnmUpStopType0,					// STOP_U_ST
	Obj16AnmLeftStopType0,					// STOP_L_ST
	Obj16AnmRightStopType0,					// STOP_R_ST
	Obj16AnmDownWalkType0,					// WALK_D_ST
	Obj16AnmUpWalkType0,					// WALK_U_ST
	Obj16AnmLeftWalkType0,					// WALK_L_ST
	Obj16AnmRightWalkType0,					// WALK_R_ST
	Obj16AnmDownRunType0,					// RUN_D_ST
	Obj16AnmUpRunType0,						// RUN_U_ST
	Obj16AnmLeftRunType0,					// RUN_L_ST
	Obj16AnmRightRunType0,					// RUN_R_ST
	Obj16AnmDownDashType0,					// DASH_D_ST
	Obj16AnmUpDashType0,					// DASH_U_ST
	Obj16AnmLeftDashType0,					// DASH_L_ST
	Obj16AnmRightDashType0,					// DASH_R_ST
	Obj16AnmDownQuickType0,					// QUICK_D_ST
	Obj16AnmUpQuickType0,					// QUICK_U_ST
	Obj16AnmLeftQuickType0,					// QUICK_L_ST
	Obj16AnmRightQuickType0,				// QUICK_R_ST
};

//------------------------------------------
//	通常ｱﾆﾒﾃﾞｰﾀﾃｰﾌﾞﾙ その1
//------------------------------------------
static const actAnm * const ObjAnmTbl_Type1[] =
{
	Obj16AnmDownStopType1,					// STOP_D_ST
	Obj16AnmUpStopType1,					// STOP_U_ST
	Obj16AnmLeftStopType1,					// STOP_L_ST
	Obj16AnmRightStopType1,					// STOP_R_ST
	Obj16AnmDownWalkType1,					// WALK_D_ST
	Obj16AnmUpWalkType1,					// WALK_U_ST
	Obj16AnmLeftWalkType1,					// WALK_L_ST
	Obj16AnmRightWalkType1,					// WALK_R_ST
	Obj16AnmDownRunType1,					// RUN_D_ST
	Obj16AnmUpRunType1,						// RUN_U_ST
	Obj16AnmLeftRunType1,					// RUN_L_ST
	Obj16AnmRightRunType1,					// RUN_R_ST
	Obj16AnmDownDashType1,					// DASH_D_ST
	Obj16AnmUpDashType1,					// DASH_U_ST
	Obj16AnmLeftDashType1,					// DASH_L_ST
	Obj16AnmRightDashType1,					// DASH_R_ST
	Obj16AnmDownQuickType1,					// QUICK_D_ST
	Obj16AnmUpQuickType1,					// QUICK_U_ST
	Obj16AnmLeftQuickType1,					// QUICK_L_ST
	Obj16AnmRightQuickType1,				// QUICK_R_ST
};

//------------------------------------------
//	主人公専用
//------------------------------------------
static const actAnm * const ObjAnmTbl_TypeHero[] =
{
	Obj16AnmDownStopType1,					// STOP_D_ST
	Obj16AnmUpStopType1,					// STOP_U_ST
	Obj16AnmLeftStopType1,					// STOP_L_ST
	Obj16AnmRightStopType1,					// STOP_R_ST
	Obj16AnmDownWalkType1,					// WALK_D_ST
	Obj16AnmUpWalkType1,					// WALK_U_ST
	Obj16AnmLeftWalkType1,					// WALK_L_ST
	Obj16AnmRightWalkType1,					// WALK_R_ST
	Obj16AnmDownRunType1,					// RUN_D_ST
	Obj16AnmUpRunType1,						// RUN_U_ST
	Obj16AnmLeftRunType1,					// RUN_L_ST
	Obj16AnmRightRunType1,					// RUN_R_ST
	Obj16AnmDownDashType1,					// DASH_D_ST
	Obj16AnmUpDashType1,					// DASH_U_ST
	Obj16AnmLeftDashType1,					// DASH_L_ST
	Obj16AnmRightDashType1,					// DASH_R_ST
	Obj16AnmDownQuickType1,					// QUICK_D_ST
	Obj16AnmUpQuickType1,					// QUICK_U_ST
	Obj16AnmLeftQuickType1,					// QUICK_L_ST
	Obj16AnmRightQuickType1,				// QUICK_R_ST
	
	Obj16AnmDownHeroDashType,				// HERO_DASH_D_ST
	Obj16AnmUpHeroDashType,					// HERO_DASH_U_ST
	Obj16AnmLeftHeroDashType,				// HERO_DASH_L_ST
	Obj16AnmRightHeroDashType,				// HERO_DASH_R_ST
};

//------------------------------------------
//	自転車ｱﾆﾒﾃﾞｰﾀﾃｰﾌﾞﾙ 
//------------------------------------------
static const actAnm * const ObjAnmTbl_TypeCycleS[] =
{
	Obj16AnmDownStopType1,					// STOP_D_ST
	Obj16AnmUpStopType1,					// STOP_U_ST
	Obj16AnmLeftStopType1,					// STOP_L_ST
	Obj16AnmRightStopType1,					// STOP_R_ST
	Obj16AnmDownWalkType1,					// WALK_D_ST
	Obj16AnmUpWalkType1,					// WALK_U_ST
	Obj16AnmLeftWalkType1,					// WALK_L_ST
	Obj16AnmRightWalkType1,					// WALK_R_ST
	Obj16AnmDownRunType1,					// RUN_D_ST
	Obj16AnmUpRunType1,						// RUN_U_ST
	Obj16AnmLeftRunType1,					// RUN_L_ST
	Obj16AnmRightRunType1,					// RUN_R_ST
	Obj16AnmDownDashType1,					// DASH_D_ST
	Obj16AnmUpDashType1,					// DASH_U_ST
	Obj16AnmLeftDashType1,					// DASH_L_ST
	Obj16AnmRightDashType1,					// DASH_R_ST
	Obj16AnmDownQuickType1,					// QUICK_D_ST
	Obj16AnmUpQuickType1,					// QUICK_U_ST
	Obj16AnmLeftQuickType1,					// QUICK_L_ST
	Obj16AnmRightQuickType1,				// QUICK_R_ST

	ObjCycleS_FtUpDown,						// CYCLE_FTUP_D_ST
	ObjCycleS_FtUpUp,						// CYCLE_FTUP_U_ST
	ObjCycleS_FtUpLeft,						// CYCLE_FTUP_L_ST
	ObjCycleS_FtUpRight,					// CYCLE_FTUP_R_ST
	ObjCycleS_RtUpDown,						// CYCLE_RTUP_D_ST
	ObjCycleS_RtUpUp,						// CYCLE_RTUP_U_ST
	ObjCycleS_RtUpLeft,						// CYCLE_RTUP_L_ST
	ObjCycleS_RtUpRight,					// CYCLE_RTUP_R_ST
	ObjCycleS_FtDownDown,					// CYCLE_FTDW_D_ST
	ObjCycleS_FtDownUp,						// CYCLE_FTDW_U_ST
	ObjCycleS_FtDownLeft,					// CYCLE_FTDW_L_ST
	ObjCycleS_FtDownRight,					// CYCLE_FTDW_R_ST
	ObjCycleS_RtDownDown,					// CYCLE_RTDW_D_ST
	ObjCycleS_RtDownUp,						// CYCLE_RTDW_U_ST
	ObjCycleS_RtDownLeft,					// CYCLE_RTDW_L_ST
	ObjCycleS_RtDownRight,					// CYCLE_RTDW_R_ST
	ObjCycleS_WheelieDown,					// CYCLE_WHEELIE_D_ST
	ObjCycleS_WheelieUp,					// CYCLE_WHEELIE_U_ST
	ObjCycleS_WheelieLeft,					// CYCLE_WHEELIE_L_ST
	ObjCycleS_WheelieRight,					// CYCLE_WHEELIE_R_ST
};

//------------------------------------------
//	主人公波乗りｱﾆﾒﾃﾞｰﾀﾃｰﾌﾞﾙ 
//------------------------------------------
static const actAnm * const ObjAnmTbl_TypeHeroSwim[] =
{
	Obj16AnmDownStopType1,					// STOP_D_ST
	Obj16AnmUpStopType1,					// STOP_U_ST
	Obj16AnmLeftStopType1,					// STOP_L_ST
	Obj16AnmRightStopType1,					// STOP_R_ST
	Obj16AnmDownWalkType1,					// WALK_D_ST
	Obj16AnmUpWalkType1,					// WALK_U_ST
	Obj16AnmLeftWalkType1,					// WALK_L_ST
	Obj16AnmRightWalkType1,					// WALK_R_ST
	Obj16AnmDownRunType1,					// RUN_D_ST
	Obj16AnmUpRunType1,						// RUN_U_ST
	Obj16AnmLeftRunType1,					// RUN_L_ST
	Obj16AnmRightRunType1,					// RUN_R_ST
	Obj16AnmDownDashType1,					// DASH_D_ST
	Obj16AnmUpDashType1,					// DASH_U_ST
	Obj16AnmLeftDashType1,					// DASH_L_ST
	Obj16AnmRightDashType1,					// DASH_R_ST
	Obj16AnmDownQuickType1,					// QUICK_D_ST
	Obj16AnmUpQuickType1,					// QUICK_U_ST
	Obj16AnmLeftQuickType1,					// QUICK_L_ST
	Obj16AnmRightQuickType1,				// QUICK_R_ST

	ObjHeroSwimJumpDown,					// SWIM_JUMP_D_ST
	ObjHeroSwimJumpUp,						// SWIM_JUMP_U_ST
	ObjHeroSwimJumpLeft,					// SWIM_JUMP_L_ST
	ObjHeroSwimJumpRight,					// SWIM_JUMP_R_ST
};

//------------------------------------------
//	ﾎﾟｹｾﾝ姉さん用ｱﾆﾒﾃｰﾌﾞﾙ
//------------------------------------------
static const actAnm * const ObjAnmTbl_TypePcWoman[] =
{
	Obj16AnmDownStopType1,					// STOP_D_ST
	Obj16AnmUpStopType1,					// STOP_U_ST
	Obj16AnmLeftStopType1,					// STOP_L_ST
	Obj16AnmRightStopType1,					// STOP_R_ST
	Obj16AnmDownWalkType1,					// WALK_D_ST
	Obj16AnmUpWalkType1,					// WALK_U_ST
	Obj16AnmLeftWalkType1,					// WALK_L_ST
	Obj16AnmRightWalkType1,					// WALK_R_ST
	Obj16AnmDownRunType1,					// RUN_D_ST
	Obj16AnmUpRunType1,						// RUN_U_ST
	Obj16AnmLeftRunType1,					// RUN_L_ST
	Obj16AnmRightRunType1,					// RUN_R_ST
	Obj16AnmDownDashType1,					// DASH_D_ST
	Obj16AnmUpDashType1,					// DASH_U_ST
	Obj16AnmLeftDashType1,					// DASH_L_ST
	Obj16AnmRightDashType1,					// DASH_R_ST
	Obj16AnmDownQuickType1,					// QUICK_D_ST
	Obj16AnmUpQuickType1,					// QUICK_U_ST
	Obj16AnmLeftQuickType1,					// QUICK_L_ST
	Obj16AnmRightQuickType1,				// QUICK_R_ST
	
	ObjAnmPcWomanBow,						// PC_BOW_ST
};

//------------------------------------------
//	秘伝技ｴﾌｪｸﾄ発動主人公専用ｱﾆﾒ
//------------------------------------------
static const actAnm * const ObjAnmTbl_TypeHidenHero[] =
{
	ObjHeroHidenAnm,
};

//------------------------------------------
//	たね専用ｱﾆﾒ
//------------------------------------------
static const actAnm * const ObjAnmTbl_TypeSeed[] =
{
	ObjSeed_0,
	ObjSeed_1,
	ObjSeed_2,
	ObjSeed_3,
	ObjSeed_4,
};

//------------------------------------------
//	砕ける岩専用ｱﾆﾒ
//------------------------------------------
static const actAnm * const ObjAnmTbl_TypeCrushRock[] =
{
	ObjDummyAnm,
	ObjAnmCrushRock,
};

//------------------------------------------
//	切れる木専用ｱﾆﾒ
//------------------------------------------
static const actAnm * const ObjAnmTbl_TypeCutTree[] =
{
	ObjDummyAnm,
	ObjAnmCutTree,
};


//------------------------------------------
//	釣りｱﾆﾒ
//------------------------------------------
static const actAnm * const ObjAnmTbl_TypeFishing[] =
{
	ObjFishingDownStart,								// FISH_START_D_ST
	ObjFishingUpStart,
	ObjFishingLeftStart,
	ObjFishingRightStart,
	ObjFishingDownEnd,									// FISH_END_D_ST
	ObjFishingUpEnd,
	ObjFishingLeftEnd,
	ObjFishingRightEnd,
	ObjFishingDownHit,									// FISH_HIT_D_ST
	ObjFishingUpHit,
	ObjFishingLeftHit,
	ObjFishingRightHit,
};

//------------------------------------------
//	ｶｲｵｰｶﾞ拡縮移動ｱﾆﾒ
//------------------------------------------
static const actAffAnm * const ObjAffAnmTbl_TypeKiog[] =
{
	ObjKiog_MoveStart05Tbl,
	ObjKiog_Move05Tbl,
};

//======================================================================
//		OAM ﾃﾞｰﾀ
//======================================================================
//------------------------------------------
//	8x8ｷｬﾗ OAM
//------------------------------------------
const ActOamData Oam8x8 =
{
	0,										// u32 VPos:8
	0,										// u32 AffineMode:2
	0,										// u32 ObjMode:2
	0,										// u32 Mosaic:1
	0,										// u32 ColorMode:1
	0,										// u32 Shape:2
	0,										// u32 HPos:9
	0,										// u32 AffineParamNo:5
	0,										// u32 Size:2
	0,										// u32 CharNo:10
	BGPRI2,									// u32 Priority:2
	0,										// u32 Pltt:3
	0,										// AffineWork
};

//------------------------------------------
//	16x8ｷｬﾗ OAM
//------------------------------------------
const ActOamData Oam16x8 =
{
	0,										// u32 VPos:8
	0,										// u32 AffineMode:2
	0,										// u32 ObjMode:2
	0,										// u32 Mosaic:1
	0,										// u32 ColorMode:1
	1,										// u32 Shape:2
	0,										// u32 HPos:9
	0,										// u32 AffineParamNo:5
	0,										// u32 Size:2
	0,										// u32 CharNo:10
	BGPRI2,									// u32 Priority:2
	0,										// u32 Pltt:3
	0,										// AffineWork
};

//------------------------------------------
//	16x16ｷｬﾗ OAM
//------------------------------------------
const ActOamData Oam16x16 =
{
	0,										// u32 VPos:8
	0,										// u32 AffineMode:2
	0,										// u32 ObjMode:2
	0,										// u32 Mosaic:1
	0,										// u32 ColorMode:1
	0,										// u32 Shape:2
	0,										// u32 HPos:9
	0,										// u32 AffineParamNo:5
	1,										// u32 Size:2
	0,										// u32 CharNo:10
	BGPRI2,									// u32 Priority:2
	0,										// u32 Pltt:3
	0,										// AffineWork
};

//------------------------------------------
//	32x8ｷｬﾗ OAM
//------------------------------------------
const ActOamData Oam32x8 =
{
	0,										// u32 VPos:8
	0,										// u32 AffineMode:2
	0,										// u32 ObjMode:2
	0,										// u32 Mosaic:1
	0,										// u32 ColorMode:1
	1,										// u32 Shape:2
	0,										// u32 HPos:9
	0,										// u32 AffineParamNo:5
	1,										// u32 Size:2
	0,										// u32 CharNo:10
	BGPRI2,									// u32 Priority:2
	0,										// u32 Pltt:3
	0,										// AffineWork
};

//------------------------------------------
//	64x32ｷｬﾗ OAM
//------------------------------------------
const ActOamData Oam64x32 =
{
	0,										// u32 VPos:8
	0,										// u32 AffineMode:2
	0,										// u32 ObjMode:2
	0,										// u32 Mosaic:1
	0,										// u32 ColorMode:1
	1,										// u32 Shape:2
	0,										// u32 HPos:9
	0,										// u32 AffineParamNo:5
	3,										// u32 Size:2
	0,										// u32 CharNo:10
	BGPRI2,									// u32 Priority:2
	0,										// u32 Pltt:3
	0,										// AffineWork
};

//------------------------------------------
//	16x32ｷｬﾗ OAM
//------------------------------------------
const ActOamData Oam16x32 =
{
	0,										// u32 VPos:8
	0,										// u32 AffineMode:2
	0,										// u32 ObjMode:2
	0,										// u32 Mosaic:1
	0,										// u32 ColorMode:1
	2,										// u32 Shape:2
	0,										// u32 HPos:9
	0,										// u32 AffineParamNo:5
	2,										// u32 Size:2
	0,										// u32 CharNo:10
	BGPRI2,									// u32 Priority:2
	0,										// u32 Pltt:3
	0,										// AffineWork
};

//------------------------------------------
//	32x32ｷｬﾗ OAM
//------------------------------------------
const ActOamData Oam32x32 =
{
	0,										// u32 VPos:8
	0,										// u32 AffineMode:2
	0,										// u32 ObjMode:2
	0,										// u32 Mosaic:1
	0,										// u32 ColorMode:1
	0,										// u32 Shape:2
	0,										// u32 HPos:9
	0,										// u32 AffineParamNo:5
	2,										// u32 Size:2
	0,										// u32 CharNo:10
	BGPRI2,									// u32 Priority:2
	0,										// u32 Pltt:3
	0,										// AffineWork
};

//------------------------------------------
//	64x64ｷｬﾗ OAM
//------------------------------------------
const ActOamData Oam64x64 =
{
	0,										// u32 VPos:8
	0,										// u32 AffineMode:2
	0,										// u32 ObjMode:2
	0,										// u32 Mosaic:1
	0,										// u32 ColorMode:1
	0,										// u32 Shape:2
	0,										// u32 HPos:9
	0,										// u32 AffineParamNo:5
	3,										// u32 Size:2
	0,										// u32 CharNo:10
	BGPRI2,									// u32 Priority:2
	0,										// u32 Pltt:3
	0,										// AffineWork
};

//======================================================================
//		OAM ﾊﾟｯﾄ
//======================================================================
//------------------------------------------
//	16x16 ﾌｨｰﾙﾄﾞOBJ
//------------------------------------------
static const OAMPatData Oam16x16Pat0[] =
{
	{-8,-8,0,1,0x00,BGPRI2},				// 16x16 BG Pri2
};
static const OAMPatData Oam16x16Pat1[] =
{
	{-8,-8,0,1,0x00,BGPRI1},				// 16x16 BG Pri1
};
static const OAMPatData Oam16x16Pat2[] =
{
	{-8,-8,1,0,0x00,BGPRI2},				// 16x8 上半身 BG Pri2
	{-8,0,1,0,0x02,BGPRI3},					// 16x8 下半身 BG Pri3
};
static const OAMPatData Oam16x16Pat3[] =
{
	{-8,-8,0,1,0x00,BGPRI2},				// 16x16 BG Pri2
	{-8,-8,0,1,0x00,BGPRI3},				// 16x16 BG Pri3
};
static const OAMPatData Oam16x16Pat4[] =
{
	{-8,-8,0,1,0x00,BGPRI1},				// 16x16 BG Pri1
	{-8,-8,0,1,0x00,BGPRI3},				// 16x16 BG Pri3
};
static const OAMPatSt Oam16x16PatSt[] =
{
	{ 0, NOT_OAMPAT },						// OAM ﾊﾟｯﾄ未使用
	{ 1, Oam16x16Pat0 },					// 通常
	{ 1, Oam16x16Pat1 },					// 順位高
	{ 2, Oam16x16Pat2 },					// 短い草むら
	{ 2, Oam16x16Pat3 },					// 長い草むら BGPRI2
	{ 2, Oam16x16Pat4 },					// 長い草むら BGPRI1
};

//------------------------------------------
//	16x32 ﾌｨｰﾙﾄﾞOBJ
//------------------------------------------
static const OAMPatData Oam16x32Pat0[] =
{
	{-8,-16,2,2,0x00,BGPRI2},		// 16x32 BG Pri2
};
static const OAMPatData Oam16x32Pat1[] =
{
	{-8,-16,2,2,0x00,BGPRI1},			// 16x32 BG Pri1
};
static const OAMPatData Oam16x32Pat2[] =
{
	{-8,-16,0,1,0x00,BGPRI2},		// 16x16 上半身 BG Pri2
	{-8,0,1,0,0x04,BGPRI2},		// 16x16 下半身 BG Pri2
	{-8,8,1,0,0x06,BGPRI3},			// 16x16 下半身 BG Pri3
};
static const OAMPatData Oam16x32Pat3[] =
{
	{-8,-16,0,1,0x00,BGPRI2},		// 16x16 上半身 BG Pri2
	{-8,0,0,1,0x04,BGPRI3},			// 16x16 下半身 BG Pri3
};
static const OAMPatData Oam16x32Pat4[] =
{
	{-8,-16,0,1,0x00,BGPRI1},		// 16x16 上半身 BG Pri2
	{-8,0,0,1,0x04,BGPRI3},			// 16x16 下半身 BG Pri3
};
static const OAMPatSt Oam16x32PatSt[] =
{
	{ 0, NOT_OAMPAT },						// OAM ﾊﾟｯﾄ未使用
	{ 1, Oam16x32Pat0 },					// 通常
	{ 1, Oam16x32Pat1 },					// 順位高
	{ 3, Oam16x32Pat2 },					// 短い草むら
	{ 2, Oam16x32Pat3 },					// 長い草むら BGPRI2
	{ 2, Oam16x32Pat4 },					// 長い草むら BGPRI1
};

//------------------------------------------
//	32x32 ﾌｨｰﾙﾄﾞOBJ
//------------------------------------------
static const OAMPatData Oam32x32Pat0[] =
{
	{-16,-16,0,2,0x00,BGPRI2},				// 32x32 BG Pri2
};
static const OAMPatData Oam32x32Pat1[] =
{
	{-16,-16,0,2,0x00,BGPRI1},				// 32x32 BG Pri1
};
static const OAMPatData Oam32x32Pat2[] =
{
	{-16,-16,1,2,0x00,BGPRI2},				// 32x16 上半身 BG Pri2
	{-16,0,1,1,0x08,BGPRI2},				// 32x8 下半身 BG Pri2
	{-16,8,1,1,0x0c,BGPRI3},				// 32x8 下半身 BG Pri3
};
static const OAMPatData Oam32x32Pat3[] =
{
	{-16,-16,1,2,0x00,BGPRI2},				// 16x16 上半身 BG Pri 2
	{-16,0,1,2,0x08,BGPRI3},				// 16x16 下半身 BG Pri 3
};
static const OAMPatData Oam32x32Pat4[] =
{
	{-16,-16,1,2,0x00,BGPRI1},				// 16x16 上半身 BG Pri 2
	{-16,0,1,2,0x08,BGPRI3},				// 16x16 下半身 BG Pri 3
};
static const OAMPatSt Oam32x32PatSt[] =
{
	{ 0, NOT_OAMPAT },						// OAM ﾊﾟｯﾄ未使用
	{ 1, Oam32x32Pat0 },					// 通常
	{ 1, Oam32x32Pat1 },					// 順位高
	{ 3, Oam32x32Pat2 },					// 短い草むら
	{ 2, Oam32x32Pat3 },					// 長い草むら BGPRI2
	{ 2, Oam32x32Pat4 },					// 長い草むら BGPRI1
};

//------------------------------------------
//	48x48 ﾌｨｰﾙﾄﾞOBJ
//------------------------------------------
static const OAMPatData Oam48x48Pat0[] =
{
	{-24,-24,1,1,0,BGPRI2},
	{8,-24,1,0,4,BGPRI2},
	{-24,-16,1,1,6,BGPRI2},
	{8,-16,1,0,10,BGPRI2},
	{-24,-8,1,1,12,BGPRI2},
	{8,-8,1,0,16,BGPRI2},
	{-24,0,1,1,18,BGPRI2},
	{8,0,1,0,22,BGPRI2},
	{-24,8,1,1,24,BGPRI2},
	{8,8,1,0,28,BGPRI2},
	{-24,16,1,1,30,BGPRI2},
	{8,16,1,0,34,BGPRI2},
};
static const OAMPatSt Oam48x48PatSt[] =
{
	{ 12, Oam48x48Pat0 },
	{ 12, Oam48x48Pat0 },					// 通常
	{ 12, Oam48x48Pat0 },					// 順位高
	{ 12, Oam48x48Pat0 },					// 短い草むら
	{ 12, Oam48x48Pat0 },					// 長い草むら
	{ 12, Oam48x48Pat0 },					// 長い草むら
};

//------------------------------------------
//	64x32 ﾌｨｰﾙﾄﾞOBJ
//------------------------------------------
static const OAMPatData Oam64x32Pat0[] =
{
	{-32,-16,1,3,0x00,BGPRI2},				// 64x32 BG Pri2
};
static const OAMPatData Oam64x32Pat1[] =
{
	{-32,-16,1,3,0x00,BGPRI1},				// 64x32 BG Pri1
};
static const OAMPatData Oam64x32Pat2[] =
{
	{-32,-16,1,3,0x00,BGPRI2},				// 64x32 上半身 BG Pri2
};
static const OAMPatData Oam64x32Pat3[] =
{
	{-32,-16,1,3,0x00,BGPRI2},				// 64x32 上半身 BG Pri 2
};
static const OAMPatSt Oam64x32PatSt[] =
{
	{ 0, NOT_OAMPAT },						// OAM ﾊﾟｯﾄ未使用
	{ 1, Oam64x32Pat0 },					// 通常
	{ 1, Oam64x32Pat1 },					// 順位高
	{ 1, Oam64x32Pat2 },					// 短い草むら
	{ 1, Oam64x32Pat3 },					// 長い草むら
	{ 1, Oam64x32Pat3 },					// 長い草むら
};

//------------------------------------------
//	64x64 ﾌｨｰﾙﾄﾞOBJ
//------------------------------------------
static const OAMPatData Oam64x64Pat0[] =
{
	{-32,-32,0,3,0x00,BGPRI2},				// 64x64 BG Pri2
};
static const OAMPatData Oam64x64Pat1[] =
{
	{-32,-32,0,3,0x00,BGPRI1},				// 64x64 BG Pri1
};
static const OAMPatData Oam64x64Pat2[] =
{
	{-32,-32,0,3,0x00,BGPRI2},				// 64x64 BG Pri2
};
static const OAMPatData Oam64x64Pat3[] =
{
	{-32,-32,0,3,0x00,BGPRI2},				// 64x64 BG Pri2
};
static const OAMPatSt Oam64x64PatSt[] =
{
	{ 0, NOT_OAMPAT },						// OAM ﾊﾟｯﾄ未使用
	{ 1, Oam64x64Pat0 },					// 通常
	{ 1, Oam64x64Pat1 },					// 順位高
	{ 1, Oam64x64Pat2 },					// 短い草むら
	{ 1, Oam64x64Pat3 },					// 長い草むら
	{ 1, Oam64x64Pat3 },					// 長い草むら
};

//------------------------------------------
//	96x40 ﾌｨｰﾙﾄﾞOBJ
//------------------------------------------
static const OAMPatData Oam96x40Pat0[] =
{
	{-48,-20,1,1,4*0,BGPRI2},
	{-16,-20,1,1,4*1,BGPRI2},
	{16,-20,1,1,4*2,BGPRI2},

	{-48,-12,1,1,4*3,BGPRI2},
	{-16,-12,1,1,4*4,BGPRI2},
	{16,-12,1,1,4*5,BGPRI2},

	{-48,-4,1,1,4*6,BGPRI2},
	{-16,-4,1,1,4*7,BGPRI2},
	{16,-4,1,1,4*8,BGPRI2},

	{-48,4,1,1,4*9,BGPRI2},
	{-16,4,1,1,4*10,BGPRI2},
	{16,4,1,1,4*11,BGPRI2},
	
	{-48,12,1,1,4*12,BGPRI2},
	{-16,12,1,1,4*13,BGPRI2},
	{16,12,1,1,4*14,BGPRI2},
};
static const OAMPatData Oam96x40Pat1[] =
{
	{-48,-20,1,1,4*0,BGPRI1},
	{-16,-20,1,1,4*1,BGPRI1},
	{16,-20,1,1,4*2,BGPRI1},

	{-48,-12,1,1,4*3,BGPRI1},
	{-16,-12,1,1,4*4,BGPRI1},
	{16,-12,1,1,4*5,BGPRI1},

	{-48,-4,1,1,4*6,BGPRI1},
	{-16,-4,1,1,4*7,BGPRI1},
	{16,-4,1,1,4*8,BGPRI1},

	{-48,4,1,1,4*9,BGPRI1},
	{-16,4,1,1,4*10,BGPRI1},
	{16,4,1,1,4*11,BGPRI1},
	
	{-48,12,1,1,4*12,BGPRI1},
	{-16,12,1,1,4*13,BGPRI1},
	{16,12,1,1,4*14,BGPRI1},
};	
static const OAMPatData Oam96x40Pat2[] =
{
	{-48,-20,1,1,4*0,BGPRI2},
	{-16,-20,1,1,4*1,BGPRI2},
	{16,-20,1,1,4*2,BGPRI2},

	{-48,-12,1,1,4*3,BGPRI2},
	{-16,-12,1,1,4*4,BGPRI2},
	{16,-12,1,1,4*5,BGPRI2},

	{-48,-4,1,1,4*6,BGPRI2},
	{-16,-4,1,1,4*7,BGPRI2},
	{16,-4,1,1,4*8,BGPRI2},

	{-48,4,1,1,4*9,BGPRI2},
	{-16,4,1,1,4*10,BGPRI2},
	{16,4,1,1,4*11,BGPRI2},
	
	{-48,12,1,1,4*12,BGPRI2},
	{-16,12,1,1,4*13,BGPRI2},
	{16,12,1,1,4*14,BGPRI2},
};	
static const OAMPatData Oam96x40Pat3[] =
{
	{-48,-20,1,1,4*0,BGPRI1},
	{-16,-20,1,1,4*1,BGPRI1},
	{16,-20,1,1,4*2,BGPRI1},

	{-48,-12,1,1,4*3,BGPRI1},
	{-16,-12,1,1,4*4,BGPRI1},
	{16,-12,1,1,4*5,BGPRI1},

	{-48,-4,1,1,4*6,BGPRI2},
	{-16,-4,1,1,4*7,BGPRI2},
	{16,-4,1,1,4*8,BGPRI2},

	{-48,4,1,1,4*9,BGPRI2},
	{-16,4,1,1,4*10,BGPRI2},
	{16,4,1,1,4*11,BGPRI2},
	
	{-48,12,1,1,4*12,BGPRI2},
	{-16,12,1,1,4*13,BGPRI2},
	{16,12,1,1,4*14,BGPRI2},
};	
static const OAMPatSt Oam96x40PatSt[] =
{
	{ 15, Oam96x40Pat0 },					// OAM ﾊﾟｯﾄ未使用
	{ 15, Oam96x40Pat0 },					// 通常
	{ 15, Oam96x40Pat1 },					// 順位高
	{ 15, Oam96x40Pat2 },					// 短い草むら
	{ 15, Oam96x40Pat3 },					// 長い草むら
	{ 15, Oam96x40Pat3 },					// 長い草むら
};

//----
#if (SUBMARINE_CHMODE == SUBM_CHMODE_OHM)
//------------------------------------------
//	88x32 ﾌｨｰﾙﾄﾞOBJ
//------------------------------------------
static const OAMPatData Oam88x32Pat0[] =
{
	{-48,-20,1,1,4*0,BGPRI2},
	{-16,-20,1,1,4*1,BGPRI2},
	{16,-20,1,0,4*2,BGPRI2},
	{32,-20,0,0,(4*2)+2,BGPRI2},

	{-48,-12,1,1,(4*0)+11,BGPRI2},
	{-16,-12,1,1,(4*1)+11,BGPRI2},
	{16,-12,1,0,(4*2)+11,BGPRI2},
	{32,-12,0,0,(4*2)+11+2,BGPRI2},

	{-48,-4,1,1,(4*0)+22,BGPRI2},
	{-16,-4,1,1,(4*1)+22,BGPRI2},
	{16,-4,1,0,(4*2)+22,BGPRI2},
	{32,-4,0,0,(4*2)+22+2,BGPRI2},

	{-48,4,1,1,(4*0)+33,BGPRI2},
	{-16,4,1,1,(4*1)+33,BGPRI2},
	{16,4,1,0,(4*2)+33,BGPRI2},
	{32,4,0,0,(4*2)+33+2,BGPRI2},
};
static const OAMPatData Oam88x32Pat1[] =
{
	{-48,-20,1,1,4*0,BGPRI1},
	{-16,-20,1,1,4*1,BGPRI1},
	{16,-20,1,0,4*2,BGPRI1},
	{32,-20,0,0,(4*2)+2,BGPRI1},

	{-48,-12,1,1,(4*0)+11,BGPRI1},
	{-16,-12,1,1,(4*1)+11,BGPRI1},
	{16,-12,1,0,(4*2)+11,BGPRI1},
	{32,-12,0,0,(4*2)+11+2,BGPRI1},

	{-48,-4,1,1,(4*0)+22,BGPRI1},
	{-16,-4,1,1,(4*1)+22,BGPRI1},
	{16,-4,1,0,(4*2)+22,BGPRI1},
	{32,-4,0,0,(4*2)+22+2,BGPRI1},

	{-48,4,1,1,(4*0)+33,BGPRI1},
	{-16,4,1,1,(4*1)+33,BGPRI1},
	{16,4,1,0,(4*2)+33,BGPRI1},
	{32,4,0,0,(4*2)+33+2,BGPRI1},
};
static const OAMPatData Oam88x32Pat2[] =
{
	{-48,-20,1,1,4*0,BGPRI2},
	{-16,-20,1,1,4*1,BGPRI2},
	{16,-20,1,0,4*2,BGPRI2},
	{32,-20,0,0,(4*2)+2,BGPRI2},

	{-48,-12,1,1,(4*0)+11,BGPRI2},
	{-16,-12,1,1,(4*1)+11,BGPRI2},
	{16,-12,1,0,(4*2)+11,BGPRI2},
	{32,-12,0,0,(4*2)+11+2,BGPRI2},

	{-48,-4,1,1,(4*0)+22,BGPRI2},
	{-16,-4,1,1,(4*1)+22,BGPRI2},
	{16,-4,1,0,(4*2)+22,BGPRI2},
	{32,-4,0,0,(4*2)+22+2,BGPRI2},

	{-48,4,1,1,(4*0)+33,BGPRI2},
	{-16,4,1,1,(4*1)+33,BGPRI2},
	{16,4,1,0,(4*2)+33,BGPRI2},
	{32,4,0,0,(4*2)+33+2,BGPRI2},
};
static const OAMPatData Oam88x32Pat3[] =
{
	{-48,-20,1,1,4*0,BGPRI1},
	{-16,-20,1,1,4*1,BGPRI1},
	{16,-20,1,0,4*2,BGPRI1},
	{32,-20,0,0,(4*2)+2,BGPRI1},

	{-48,-12,1,1,(4*0)+11,BGPRI1},
	{-16,-12,1,1,(4*1)+11,BGPRI1},
	{16,-12,1,0,(4*2)+11,BGPRI1},
	{32,-12,0,0,(4*2)+11+2,BGPRI1},

	{-48,-4,1,1,(4*0)+22,BGPRI2},
	{-16,-4,1,1,(4*1)+22,BGPRI2},
	{16,-4,1,0,(4*2)+22,BGPRI2},
	{32,-4,0,0,(4*2)+22+2,BGPRI2},

	{-48,4,1,1,(4*0)+33,BGPRI2},
	{-16,4,1,1,(4*1)+33,BGPRI2},
	{16,4,1,0,(4*2)+33,BGPRI2},
	{32,4,0,0,(4*2)+33+2,BGPRI2},
};
static const OAMPatSt Oam88x32PatSt[] =
{
	{ 16, Oam88x32Pat0 },					// OAM ﾊﾟｯﾄ未使用
	{ 16, Oam88x32Pat0 },					// 通常
	{ 16, Oam88x32Pat1 },					// 順位高
	{ 16, Oam88x32Pat2 },					// 短い草むら
	{ 16, Oam88x32Pat3 },					// 長い草むら
	{ 16, Oam88x32Pat3 },					// 長い草むら
};
#endif
//----

//======================================================================
//		SXY OBJ ﾍｯﾀﾞ
//======================================================================
//------------------------------------------
//	主人公
//------------------------------------------
static const SXYObjHead main_hero_Head = 
{
	ACT_TMODE,								// 転送型
	EVOBJ_HERO_PALID_0,						// ﾊﾟﾚｯﾄ ID
	EVOBJ_HERO_REF_PALID_1,					// 特殊映りこみﾊﾟﾚｯﾄID
	0x20*16,								// ｾﾙ転送最大ｻｲｽﾞ
	16,										// X ｻｲｽﾞ
	32,										// Y ｻｲｽﾞ
	MINE_OBJ_PALNO,							// OAMﾊﾟﾚｯﾄNo
	SHADE_KIND_16x8,						// 影種類
	0,										// ｾﾙﾁｪﾝｼﾞﾃﾞﾌｫﾙﾄｽｲｯﾁ
	0,										// 映りこみ位置操作ﾌﾗｸﾞ
	FOOT_KIND_NORMAL,						// 足跡種類
	&Oam16x32,								// OAM
	Oam16x32PatSt,							// OAMﾊﾟｯﾄ
	ObjAnmTbl_TypeHero,						// ｱﾆﾒｰｼｮﾝﾃｰﾌﾞﾙ
	hero_celltrans,							// ｱﾆﾒｰｼｮﾝﾄﾗﾝｽﾃﾞｰﾀ
	DummyActAffTbl,							// ｱﾌｨﾝ
};

//------------------------------------------
//	主人公自転車	ﾚｰｽﾀｲﾌﾟ
//------------------------------------------
static const SXYObjHead main_hero_c0_Head = 
{
	ACT_TMODE,
	EVOBJ_HERO_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*16,
	32,
	32,
	MINE_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_CYCLE,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	cycle_r_h_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	主人公自転車	ｽﾎﾟｰﾂﾀｲﾌﾟ
//------------------------------------------
static const SXYObjHead main_hero_c1_Head = 
{
	ACT_TMODE,
	EVOBJ_HERO_PALID_0,	
	EVOBJ_HERO_REF_PALID_1,
	0x20*16,
	32,
	32,
	MINE_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_CYCLE,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeCycleS,
	cycle_s_h_celltrans,	
	DummyActAffTbl,
};

//------------------------------------------
//	主人公波乗り
//------------------------------------------
static const SXYObjHead main_hero_swim_Head = 
{
	ACT_TMODE,
	EVOBJ_HERO_PALID_0,	
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	MINE_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	1,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeHeroSwim,
	swim_h_celltrans,	
	DummyActAffTbl,
};

//------------------------------------------
//	主人公秘伝技発動
//------------------------------------------
static const SXYObjHead main_hero_hiden_Head =
{
	ACT_TMODE,
	EVOBJ_HERO_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*16,
	32,
	32,
	MINE_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeHidenHero,
	hiden_h_celltrans,	
	DummyActAffTbl,
};

//------------------------------------------
//	太っちょ男(旧)
//------------------------------------------
static const SXYObjHead BigManHead0 = 
{
	ACT_TMODE,
	EVOBJ_BIGMAN_PALID,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_32x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type0,
	a_debu_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	男の子1
//------------------------------------------
static const SXYObjHead opp_01_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_Type1,
	opp_01_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	女の子1
//------------------------------------------
static const SXYObjHead opp_02_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_02_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	少年1
//------------------------------------------
static const SXYObjHead opp_03_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_03_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	少女1
//------------------------------------------
static const SXYObjHead opp_04_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_04_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	少年2
//------------------------------------------
static const SXYObjHead opp_05_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_05_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	少女2
//------------------------------------------
static const SXYObjHead opp_06_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_06_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	男の子2
//------------------------------------------
static const SXYObjHead opp_07_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_Type1,
	opp_07_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	女の子2
//------------------------------------------
static const SXYObjHead opp_08_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_Type1,
	opp_08_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	少年3
//------------------------------------------
static const SXYObjHead opp_09_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_09_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	少女3
//------------------------------------------
static const SXYObjHead opp_10_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_10_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	少年4
//------------------------------------------
static const SXYObjHead opp_11_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_11_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	少女4
//------------------------------------------
static const SXYObjHead opp_12_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_12_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	大男
//------------------------------------------
static const SXYObjHead opp_13_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_13_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	叔母ちゃん
//------------------------------------------
static const SXYObjHead opp_14_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_14_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	叔父さん1
//------------------------------------------
static const SXYObjHead opp_15_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_15_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	女性1
//------------------------------------------
static const SXYObjHead opp_16_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_16_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	老人1
//------------------------------------------
static const SXYObjHead opp_17_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_17_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	老婆1
//------------------------------------------
static const SXYObjHead opp_18_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_18_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｻﾗﾘｰﾏﾝ
//------------------------------------------
static const SXYObjHead opp_19_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_19_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｻﾗﾘｰｳｰﾏﾝ
//------------------------------------------
static const SXYObjHead opp_20_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_20_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	叔父さん2
//------------------------------------------
static const SXYObjHead opp_21_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_21_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	女性2
//------------------------------------------
static const SXYObjHead opp_22_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_22_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	料理人2
//------------------------------------------
static const SXYObjHead opp_23_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_23_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｳｪｰﾄﾚｽ
//------------------------------------------
static const SXYObjHead opp_24_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_24_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	老人2
//------------------------------------------
static const SXYObjHead opp_25_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_25_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	老婆2
//------------------------------------------
static const SXYObjHead opp_26_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_26_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ﾎﾞｰｲｽｶｳﾄ
//------------------------------------------
static const SXYObjHead opp_27_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_27_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｶﾞｰﾙｽｶｳﾄ
//------------------------------------------
static const SXYObjHead opp_28_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_28_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	少年5
//------------------------------------------
static const SXYObjHead opp_29_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_29_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	少女5
//------------------------------------------
static const SXYObjHead opp_30_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_30_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	小僧1
//------------------------------------------
static const SXYObjHead opp_31_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_31_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	小僧2
//------------------------------------------
static const SXYObjHead opp_32_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_32_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	少年6
//------------------------------------------
static const SXYObjHead opp_33_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_33_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	少年7
//------------------------------------------
static const SXYObjHead opp_34_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_34_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	少年8
//------------------------------------------
static const SXYObjHead opp_35_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_35_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	警備員1
//------------------------------------------
static const SXYObjHead opp_36_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_36_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ﾛｹｯﾄ団女1
//------------------------------------------
static const SXYObjHead opp_37_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_37_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	海ﾊﾟﾝ野郎1
//------------------------------------------
static const SXYObjHead opp_38_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_38_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	海ﾊﾟﾝ女郎1
//------------------------------------------
static const SXYObjHead opp_39_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_39_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	格闘家1
//------------------------------------------
static const SXYObjHead opp_40_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_40_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	女性3
//------------------------------------------
static const SXYObjHead opp_41_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_41_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	研究員男1
//------------------------------------------
static const SXYObjHead opp_42_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_42_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	少女6
//------------------------------------------
static const SXYObjHead opp_43_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_43_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	老人3
//------------------------------------------
static const SXYObjHead opp_44_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_44_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	大男2
//------------------------------------------
static const SXYObjHead opp_45_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_45_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	釣り人1
//------------------------------------------
static const SXYObjHead opp_46_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_46_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	格闘家2
//------------------------------------------
static const SXYObjHead opp_47_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_47_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｻﾗﾘｰｳｰﾏﾝ2
//------------------------------------------
static const SXYObjHead opp_48_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_48_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	うきわおじょう
//------------------------------------------
static const SXYObjHead opp_49_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_Type1,
	opp_49_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	うきわぼうや
//------------------------------------------
static const SXYObjHead opp_50_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_Type1,
	opp_50_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	山男1
//------------------------------------------
static const SXYObjHead opp_51_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_51_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	自転車男1
//------------------------------------------
static const SXYObjHead opp_52_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_CYCLE,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeCycleS,
	opp_52_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	自転車女1
//------------------------------------------
static const SXYObjHead opp_53_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_CYCLE,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeCycleS,
	opp_53_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ﾎﾟｹｾﾝ姉さん
//------------------------------------------
static const SXYObjHead op_nurse_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_TypePcWoman,
	op_nurse_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｶﾌﾟｾﾙ1
//------------------------------------------
static const SXYObjHead o_pokeb_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	o_pokeb_celltrans,									// ﾀﾞﾐｰ
	DummyActAffTbl,
};

//------------------------------------------
//	たね
//------------------------------------------
static const actAnmData seed01_celltrans[];

static const SXYObjHead SeedHead =
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	NOT_OAMPAT,
	ObjAnmTbl_TypeSeed,
	seed01_celltrans,									// ﾀﾞﾐｰ
	DummyActAffTbl,
};

//------------------------------------------
//	たね 16x16
//------------------------------------------
static const SXYObjHead Seed16x16Head =
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeSeed,
	seed01_celltrans,									// ﾀﾞﾐｰ
	DummyActAffTbl,
};

//------------------------------------------
//	たね 16x32
//------------------------------------------
static const SXYObjHead Seed16x32Head =
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_TypeSeed,
	seed01_celltrans,									// ﾀﾞﾐｰ
	DummyActAffTbl,
};

//------------------------------------------
//	オダマキ
//------------------------------------------
static const SXYObjHead op_odama_Head =
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_odama_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	若者男1
//------------------------------------------
static const SXYObjHead opp_54_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_54_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	若者男2
//------------------------------------------
static const SXYObjHead opp_55_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	opp_55_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｲﾝﾀﾋﾞｭｱｰ男1
//------------------------------------------
static const SXYObjHead op_intrvm_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_intrvm_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｲﾝﾀﾋﾞｭｱｰ女1
//------------------------------------------
static const SXYObjHead op_intrvf_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_intrvf_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	7おやじ1
//------------------------------------------
static const SXYObjHead op_7oyaji1_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_7oyaji1_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	7おやじ2
//------------------------------------------
static const SXYObjHead op_7oyaji2_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_7oyaji1_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	7おやじ3
//------------------------------------------
static const SXYObjHead op_7oyaji3_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_7oyaji1_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	7おやじ4
//------------------------------------------
static const SXYObjHead op_7oyaji4_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_7oyaji2_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	7おやじ5
//------------------------------------------
static const SXYObjHead op_7oyaji5_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_7oyaji2_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	7おやじ6
//------------------------------------------
static const SXYObjHead op_7oyaji6_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_7oyaji2_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	7おやじ7
//------------------------------------------
static const SXYObjHead op_7oyaji7_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_7oyaji2_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｸﾞｯｽﾞ1
//------------------------------------------
static const SXYObjHead hob_gds1_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	hob_gds1_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｸﾞｯｽﾞ2
//------------------------------------------
static const SXYObjHead hob_gds2_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	hob_gds2_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｸﾞｯｽﾞ3
//------------------------------------------
static const SXYObjHead hob_gds3_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	hob_gds3_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｸﾞｯｽﾞ4
//------------------------------------------
static const SXYObjHead hob_gds4_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	hob_gds4_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｸﾞｯｽﾞ5
//------------------------------------------
static const SXYObjHead hob_gds5_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	hob_gds5_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｸﾞｯｽﾞ6
//------------------------------------------
static const SXYObjHead hob_gds6_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	hob_gds6_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	木1
//------------------------------------------
static const SXYObjHead o_tachigi1_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeCutTree,
	o_tachigi1_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	店員男1
//------------------------------------------
static const SXYObjHead op_shopm_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_shopm_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	店員女1
//------------------------------------------
static const SXYObjHead op_shopf_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_shopf_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ﾎﾟｹｾﾝ姉さん2
//------------------------------------------
static const SXYObjHead op_pcgirl_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_pcgirl_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	砕ける岩
//------------------------------------------
static const SXYObjHead o_crushiw_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeCrushRock,
	o_crushiw_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	押せる岩
//------------------------------------------
static const SXYObjHead o_pushiw_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	o_pushiw_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	船1
//------------------------------------------
static const SXYObjHead o_ship1_Head = 
{	
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NOTHING,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	o_ship1_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	女主人公(ﾌﾟﾚｲﾔｰ)
//------------------------------------------
static const SXYObjHead main_hine_Head = 
{
	ACT_TMODE,
	EVOBJ_HINE_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*16,
	16,
	32,
	MINE_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_TypeHero,
	heroine_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	女主人公(ﾌﾟﾚｲﾔｰ)自転車	ﾚｰｽﾀｲﾌﾟ
//------------------------------------------
static const SXYObjHead main_hine_c0_Head =
{
	ACT_TMODE,
	EVOBJ_HINE_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*16,
	32,
	32,
	MINE_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_CYCLE,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	c_hine0_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	女主人公(ﾌﾟﾚｲﾔｰ)自転車	ｽﾎﾟｰﾂﾀｲﾌﾟ
//------------------------------------------
static const SXYObjHead main_hine_c1_Head =
{
	ACT_TMODE,
	EVOBJ_HINE_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*16,
	32,
	32,
	MINE_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_CYCLE,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeCycleS,
	c_hine1_celltrans,	
	DummyActAffTbl,
};

//------------------------------------------
//	女主人公(ﾌﾟﾚｲﾔｰ)波乗り
//------------------------------------------
static const SXYObjHead main_hine_swim_Head =
{
	ACT_TMODE,
	EVOBJ_HINE_PALID_0,	
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	MINE_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	1,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeHeroSwim,
	hine_swim_celltrans,	
	DummyActAffTbl,
};

//------------------------------------------
//	女主人公(ﾌﾟﾚｲﾔｰ)秘伝技発動
//------------------------------------------
static const SXYObjHead main_hine_hiden_Head =
{
	ACT_TMODE,
	EVOBJ_HINE_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*16,
	32,
	32,
	MINE_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeHidenHero,
	hine_hiden_celltrans,	
	DummyActAffTbl,
};

//------------------------------------------
//	ﾄﾗｯｸ1
//------------------------------------------
static const SXYObjHead truck_Head =
{
	ACT_TMODE,
	EVOBJ_TRUCK_PALID,
	NOT_SP_REF_PALID,
	0x20*36,
	48,
	48,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam32x32,
	Oam48x48PatSt,
	ObjAnmTbl_TypeDummy,
	truck_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	引越しﾎﾟｹﾓﾝ1
//------------------------------------------
static const SXYObjHead hikobj1_Head = 
{	
	ACT_TMODE,
	EVOBJ_MOVER_PALID,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	hikobj1_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	引越しﾎﾟｹﾓﾝ2
//------------------------------------------
static const SXYObjHead hikobj2_Head = 
{	
	ACT_TMODE,
	EVOBJ_MOVER_PALID,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	hikobj2_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ﾘｭｯｸ
//------------------------------------------
static const SXYObjHead opobj1_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	opobj1_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	襲うﾎﾟｹﾓﾝ
//------------------------------------------
static const SXYObjHead opobj2_Head = 
{	
	ACT_TMODE,
	EVOBJ_ATTACK_PALID,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	opobj2_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	絵描きさん1
//------------------------------------------
static const SXYObjHead op_artist_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_artist_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	主人公
//------------------------------------------
static const SXYObjHead hero_Head = 
{
	ACT_TMODE,								// 転送型
	EVOBJ_HERO_PALID_0,						// ﾊﾟﾚｯﾄ ID
	EVOBJ_HERO_REF_PALID_1,					// 特殊映りこみﾊﾟﾚｯﾄID
	0x20*8,									// ｾﾙ転送最大ｻｲｽﾞ
	16,										// X ｻｲｽﾞ
	32,										// Y ｻｲｽﾞ
	SP_OBJ_PALNO,							// OAMﾊﾟﾚｯﾄNo
	SHADE_KIND_16x8,						// 影種類
	0,										// ｾﾙﾁｪﾝｼﾞﾃﾞﾌｫﾙﾄｽｲｯﾁ
	0,										// 映りこみ位置操作ﾌﾗｸﾞ
	FOOT_KIND_NORMAL,						// 足跡種類
	&Oam16x32,								// OAM
	Oam16x32PatSt,							// OAMﾊﾟｯﾄ
	ObjAnmTbl_TypeHero,						// ｱﾆﾒｰｼｮﾝﾃｰﾌﾞﾙ
	hero_celltrans,							// ｱﾆﾒｰｼｮﾝﾄﾗﾝｽﾃﾞｰﾀ
	DummyActAffTbl,							// ｱﾌｨﾝ
};

//------------------------------------------
//	主人公自転車	ﾚｰｽﾀｲﾌﾟ
//------------------------------------------
static const SXYObjHead hero_c0_Head = 
{
	ACT_TMODE,
	EVOBJ_HERO_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*16,
	32,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_CYCLE,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	cycle_r_h_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	主人公自転車	ｽﾎﾟｰﾂﾀｲﾌﾟ
//------------------------------------------
static const SXYObjHead hero_c1_Head = 
{
	ACT_TMODE,
	EVOBJ_HERO_PALID_0,	
	EVOBJ_HERO_REF_PALID_1,
	0x20*16,
	32,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_CYCLE,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeCycleS,
	cycle_s_h_celltrans,	
	DummyActAffTbl,
};

//------------------------------------------
//	主人公波乗り
//------------------------------------------
static const SXYObjHead hero_swim_Head = 
{
	ACT_TMODE,
	EVOBJ_HERO_PALID_0,	
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	1,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeHeroSwim,
	swim_h_celltrans,	
	DummyActAffTbl,
};

//------------------------------------------
//	主人公秘伝技発動
//------------------------------------------
static const SXYObjHead hero_hiden_Head =
{
	ACT_TMODE,
	EVOBJ_HERO_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*16,
	32,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeHidenHero,
	hiden_h_celltrans,	
	DummyActAffTbl,
};

//------------------------------------------
//	女主人公
//------------------------------------------
static const SXYObjHead hine_Head = 
{
	ACT_TMODE,
	EVOBJ_HINE_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*8,
	16,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_TypeHero,
	heroine_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	女主人公(ﾌﾟﾚｲﾔｰ)自転車	ﾚｰｽﾀｲﾌﾟ
//------------------------------------------
static const SXYObjHead hine_c0_Head =
{
	ACT_TMODE,
	EVOBJ_HINE_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*16,
	32,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_CYCLE,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	c_hine0_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	女主人公自転車	ｽﾎﾟｰﾂﾀｲﾌﾟ
//------------------------------------------
static const SXYObjHead hine_c1_Head =
{
	ACT_TMODE,
	EVOBJ_HINE_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*16,
	32,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_CYCLE,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeCycleS,
	c_hine1_celltrans,	
	DummyActAffTbl,
};

//------------------------------------------
//	女主人公波乗り
//------------------------------------------
static const SXYObjHead hine_swim_Head =
{
	ACT_TMODE,
	EVOBJ_HINE_PALID_0,	
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	1,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeHeroSwim,
	hine_swim_celltrans,	
	DummyActAffTbl,
};

//------------------------------------------
//	女主人公秘伝技発動
//------------------------------------------
static const SXYObjHead hine_hiden_Head =
{
	ACT_TMODE,
	EVOBJ_HINE_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*16,
	32,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeHidenHero,
	hine_hiden_celltrans,	
	DummyActAffTbl,
};

//------------------------------------------
//	ｶﾒﾗﾏﾝ1
//------------------------------------------
static const SXYObjHead op_camera_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_camera_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	男主人公 ﾀﾞｲﾋﾞﾝｸﾞ
//------------------------------------------
static const SXYObjHead main_hero_div_Head = 
{
	ACT_TMODE,
	EVOBJ_HERO_DIVING_PALID,	
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	MINE_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	1,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	div_h_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	女主人公ﾀﾞｲﾋﾞﾝｸﾞ
//------------------------------------------
static const SXYObjHead main_hine_div_Head =
{
	ACT_TMODE,
	EVOBJ_HERO_DIVING_PALID,	
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	1,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	hine_div_celltrans,	
	DummyActAffTbl,
};

//------------------------------------------
//	荷物
//------------------------------------------
static const SXYObjHead cargo1_Head = 
{
	ACT_TMODE,
	EVOBJ_CARGO_PALID,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	SP_OBJ_PALNO,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	baggage_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ﾛｰﾌﾟｳｪｲ
//------------------------------------------
static const SXYObjHead ropeway_Head = 
{
	ACT_TMODE,
	EVOBJ_ROPEWAY_PALID,
	NOT_SP_REF_PALID,
	0x20*64,
	64,
	64,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam64x64,
	Oam64x64PatSt,
	ObjAnmTbl_TypeDummy,
	ropeway_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	研究員
//------------------------------------------
static const SXYObjHead op_waruken_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_waruken_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ﾃﾞﾎﾞﾝ
//------------------------------------------
static const SXYObjHead op_dbnsya_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_dbnsya_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｱｸｱ団男
//------------------------------------------
static const SXYObjHead op_aquam_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_aquam_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｱｸｱ団女
//------------------------------------------
static const SXYObjHead op_aquaf_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_aquaf_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ﾏｸﾞﾏ団男
//------------------------------------------
static const SXYObjHead op_magm_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_magm_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ﾏｸﾞﾏ団女
//------------------------------------------
static const SXYObjHead op_magf_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_magf_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	カゲツ
//------------------------------------------
static const SXYObjHead op_4kgt_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_4kgt_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	フヨウ
//------------------------------------------
static const SXYObjHead op_4fyu_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_4fyu_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	プリム
//------------------------------------------
static const SXYObjHead op_4prm_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_4prm_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ゲンジ
//------------------------------------------
static const SXYObjHead op_4gnj_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_4gnj_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ツツジ
//------------------------------------------
static const SXYObjHead op_jrttj_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_jrttj_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	トウキ
//------------------------------------------
static const SXYObjHead op_jrtuk_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_jrtuk_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	テッセン
//------------------------------------------
static const SXYObjHead op_jrtsn_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_jrtsn_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	アイリ
//------------------------------------------
static const SXYObjHead op_jrair_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_jrair_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	センリ
//------------------------------------------
static const SXYObjHead op_jrsnr_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_jrsnr_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ナギ
//------------------------------------------
static const SXYObjHead op_jrnag_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_jrnag_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	フウ
//------------------------------------------
static const SXYObjHead op_jr2f_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_jr2f_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ラン
//------------------------------------------
static const SXYObjHead op_jr2r_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_jr2r_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ミクリ
//------------------------------------------
static const SXYObjHead op_jrmkr_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_jrmkr_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ダイゴ
//------------------------------------------
static const SXYObjHead op_champ_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_champ_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ミツル
//------------------------------------------
static const SXYObjHead op_mitsru_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_mitsru_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｻﾎﾟｰﾄ少年
//------------------------------------------
static const SXYObjHead op_sup_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_Type1,
	op_sup_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	男主人公釣り
//------------------------------------------
static const SXYObjHead main_hero_fish_Head = 
{
	ACT_TMODE,
	EVOBJ_HERO_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*16,
	32,
	32,
	MINE_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeFishing,
	h_fish_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	女主人公釣り
//-----------------------------------------
static const SXYObjHead main_hine_fish_Head = 
{
	ACT_TMODE,
	EVOBJ_HINE_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*16,
	32,
	32,
	MINE_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeFishing,
	hine_fish_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	温泉女
//------------------------------------------
static const SXYObjHead op_onsen_Head =
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_onsen_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	高速船
//------------------------------------------
static const SXYObjHead ship_obj_Head = 
{
	ACT_TMODE,
	EVOBJ_HISHIP_PALID,
	NOT_SP_REF_PALID,
	0x20*60,
	96,
	40,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NOTHING,
	&Oam8x8,
	Oam96x40PatSt,
	ObjAnmTbl_Type1,
	ship_obj_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	潜水艦
//------------------------------------------
#if (SUBMARINE_CHMODE == SUBM_CHMODE_IWA)
static const SXYObjHead o_subm_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*32,
	64,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NOTHING,
	&Oam64x32,
	Oam64x32PatSt,
	ObjAnmTbl_Type1,
	o_subm_celltrans,
	DummyActAffTbl,
};
#else
static const SXYObjHead o_subm_Head = 
{
	ACT_TMODE,
	EVOBJ_SUBMARINE_PALID,
	NOT_SP_REF_PALID,
	0x20*44,
	88,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NOTHING,
	&Oam8x8,
	Oam88x32PatSt,
	ObjAnmTbl_Type1,
	o_subm_celltrans,
	DummyActAffTbl,
};
#endif

//------------------------------------------
//	ぬいぐるみ 1
//------------------------------------------
static const SXYObjHead doll1_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll1_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 2
//------------------------------------------
static const SXYObjHead doll2_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll2_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 3
//------------------------------------------
static const SXYObjHead doll3_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll3_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 4
//------------------------------------------
static const SXYObjHead doll4_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll4_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 5
//------------------------------------------
static const SXYObjHead doll5_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll5_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 6
//------------------------------------------
static const SXYObjHead doll6_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll6_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 7
//------------------------------------------
static const SXYObjHead doll7_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll7_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 8
//------------------------------------------
static const SXYObjHead doll8_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll8_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 9
//------------------------------------------
static const SXYObjHead doll9_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll9_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 10
//------------------------------------------
static const SXYObjHead doll10_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll10_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 11
//------------------------------------------
static const SXYObjHead doll11_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll11_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 12
//------------------------------------------
static const SXYObjHead doll12_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll12_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 13
//------------------------------------------
static const SXYObjHead doll13_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll13_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 14
//------------------------------------------
static const SXYObjHead doll14_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll14_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 15
//------------------------------------------
static const SXYObjHead doll15_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll15_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 16
//------------------------------------------
static const SXYObjHead doll16_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll16_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 17
//------------------------------------------
static const SXYObjHead doll17_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll17_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 18
//------------------------------------------
static const SXYObjHead doll18_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll18_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 19 
//------------------------------------------
static const SXYObjHead doll19_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll19_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 20
//------------------------------------------
static const SXYObjHead doll20_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll20_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 21
//------------------------------------------
static const SXYObjHead doll21_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll21_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 22
//------------------------------------------
static const SXYObjHead doll22_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll22_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 23
//------------------------------------------
static const SXYObjHead doll23_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll23_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 24
//------------------------------------------
static const SXYObjHead doll24_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll24_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ぬいぐるみ 25
//------------------------------------------
static const SXYObjHead doll25_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	doll25_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｸｯｼｮﾝ 1
//------------------------------------------
static const SXYObjHead cushion1_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	cushion1_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｸｯｼｮﾝ 2
//------------------------------------------
static const SXYObjHead cushion2_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	cushion2_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｸｯｼｮﾝ 3
//------------------------------------------
static const SXYObjHead cushion3_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	cushion3_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｸｯｼｮﾝ 4
//------------------------------------------
static const SXYObjHead cushion4_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	cushion4_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｸｯｼｮﾝ 5
//------------------------------------------
static const SXYObjHead cushion5_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	cushion5_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｸｯｼｮﾝ 6
//------------------------------------------
static const SXYObjHead cushion6_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	cushion6_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｸｯｼｮﾝ 7
//------------------------------------------
static const SXYObjHead cushion7_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	cushion7_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｸｯｼｮﾝ 8
//------------------------------------------
static const SXYObjHead cushion8_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	cushion8_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｸｯｼｮﾝ 9
//------------------------------------------
static const SXYObjHead cushion9_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	cushion9_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｸｯｼｮﾝ 10
//------------------------------------------
static const SXYObjHead cushion10_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	cushion10_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	大きいぬいぐるみ 1
//------------------------------------------
static const SXYObjHead bigdoll1_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeDummy,
	bigdoll1_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	大きいぬいぐるみ 2
//------------------------------------------
static const SXYObjHead bigdoll2_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeDummy,
	bigdoll2_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	大きいぬいぐるみ 3
//------------------------------------------
static const SXYObjHead bigdoll3_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeDummy,
	bigdoll3_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	大きいぬいぐるみ 4
//------------------------------------------
static const SXYObjHead bigdoll4_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeDummy,
	bigdoll4_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	大きいぬいぐるみ 5
//------------------------------------------
static const SXYObjHead bigdoll5_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeDummy,
	bigdoll5_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	大きいぬいぐるみ 6
//------------------------------------------
static const SXYObjHead bigdoll6_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeDummy,
	bigdoll6_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	大きいぬいぐるみ 7
//------------------------------------------
static const SXYObjHead bigdoll7_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeDummy,
	bigdoll7_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	大きいぬいぐるみ 8
//------------------------------------------
static const SXYObjHead bigdoll8_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeDummy,
	bigdoll8_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	大きいぬいぐるみ 9
//------------------------------------------
static const SXYObjHead bigdoll9_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeDummy,
	bigdoll9_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	大きいぬいぐるみ 10
//------------------------------------------
static const SXYObjHead bigdoll10_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_TypeDummy,
	bigdoll10_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ﾗﾃｨｱｽ
//------------------------------------------
static const SXYObjHead op_latias_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NOTHING,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	op_lati_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ﾗﾃｨｵｽ
//------------------------------------------
static const SXYObjHead op_latios_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NOTHING,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	op_lati_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｱﾄﾞﾊﾞﾝｽ少年
//------------------------------------------
static const SXYObjHead op_gba_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_gba_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	審査員
//------------------------------------------
static const SXYObjHead op_sikai_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_sikai_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	男主人公(ﾌﾟﾚｲﾔｰ)如雨露
//------------------------------------------
static const SXYObjHead main_hero_joro_Head =
{
	ACT_TMODE,
	EVOBJ_HERO_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*16,
	32,
	32,
	MINE_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	joroactm_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	女主人公(ﾌﾟﾚｲﾔｰ)如雨露
//------------------------------------------
static const SXYObjHead main_hine_joro_Head =
{
	ACT_TMODE,
	EVOBJ_HINE_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*16,
	32,
	32,
	MINE_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	joroactf_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	男主人公模様替え
//------------------------------------------
static const SXYObjHead hero_remodel_Head =
{
	ACT_TMODE,
	EVOBJ_HERO_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*8,
	16,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	1,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_TypeDummy,
	moyohjikim_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	女主人公模様替え
//------------------------------------------
static const SXYObjHead hine_remodel_Head =
{
	ACT_TMODE,
	EVOBJ_HINE_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*8,
	16,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	1,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_TypeDummy,
	moyohjikif_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｱｸｱ団ﾎﾞｽ
//------------------------------------------
static const SXYObjHead op_aquab_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_aquab_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ﾏｸﾞﾏ団ﾎﾞｽ
//------------------------------------------
static const SXYObjHead op_magb_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_magb_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｶｲｵｰｶﾞ
//------------------------------------------
static const SXYObjHead op_kiog_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	op_kiog_celltrans,
	ObjAffAnmTbl_TypeKiog,
};

//------------------------------------------
//	ｸﾞﾗｰﾄﾞﾝ
//------------------------------------------
static const SXYObjHead op_grdn_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	op_grdn_celltrans,
	ObjAffAnmTbl_TypeKiog,
};

//------------------------------------------
//	化石
//------------------------------------------
static const SXYObjHead o_kaseki_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_8x8,
	1,
	0,
	FOOT_KIND_NOTHING,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_TypeDummy,
	o_kaseki_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	伝説0
//------------------------------------------
static const SXYObjHead op_densets0_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	op_densets_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	伝説1
//------------------------------------------
static const SXYObjHead op_densets1_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	op_densets_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	伝説2
//------------------------------------------
static const SXYObjHead op_densets2_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	op_densets_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	エネコ
//------------------------------------------
static const SXYObjHead op_eneco_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_Type1,
	op_eneco_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	カクレオン
//------------------------------------------
static const SXYObjHead op_kakreon_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_Type1,
	op_kakreon_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ｶｲｵｰｶﾞﾓﾉｸﾛ
//------------------------------------------
static const SXYObjHead op_kiog_mc_Head = 
{
	ACT_TMODE,
	EVOBJ_KAIOGA_MC_PALID,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	op_kiog_celltrans,
	ObjAffAnmTbl_TypeKiog,
};

//------------------------------------------
//	ｸﾞﾗｰﾄﾞﾝﾓﾉｸﾛ
//------------------------------------------
static const SXYObjHead op_grdn_mc_Head =
{
	ACT_TMODE,
	EVOBJ_GURADON_MC_PALID,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	op_grdn_celltrans,
	ObjAffAnmTbl_TypeKiog,
};

//------------------------------------------
//	タイクーン
//------------------------------------------
static const SXYObjHead op_tycoon_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	NOT_SP_REF_PALID,
	0x20*16,
	32,
	32,
	OTHERS_OBJ_PALNO_2,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam32x32,
	Oam32x32PatSt,
	ObjAnmTbl_Type1,
	op_tycoon_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ジグザグマ
//------------------------------------------
static const SXYObjHead op_jiguma_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_Type1,
	op_jiguma_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ピカチュウ
//------------------------------------------
static const SXYObjHead op_pika_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_Type1,
	op_pika_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	マリルリ
//------------------------------------------
static const SXYObjHead op_mariruri_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_Type1,
	op_mariruri_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	キャモメ
//------------------------------------------
static const SXYObjHead op_camome_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_Type1,
	op_camome_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	カクレオン
//------------------------------------------
static const SXYObjHead op_kakreon_bridge_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_2,
	EVOBJ_HERO_REF_PALID_1,								// 主人公橋ﾊﾟﾚｯﾄ流用
	0x20*4,
	16,
	16,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_Type1,
	op_kakreon_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	うきわぼうや
//------------------------------------------
static const SXYObjHead op_ukib_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_1,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_1,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_Type1,
	op_ukib_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	ルリリ
//------------------------------------------
static const SXYObjHead op_ruriri_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_0,
	NOT_SP_REF_PALID,
	0x20*4,
	16,
	16,
	OTHERS_OBJ_PALNO_0,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x16,
	Oam16x16PatSt,
	ObjAnmTbl_Type1,
	op_ruriri_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	まま
//------------------------------------------
static const SXYObjHead op_mama_Head = 
{
	ACT_TMODE,
	EVOBJ_OTHERS_PALID_0_3,
	NOT_SP_REF_PALID,
	0x20*8,
	16,
	32,
	OTHERS_OBJ_PALNO_3,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_Type1,
	op_mama_celltrans,
	DummyActAffTbl,
};

//------------------------------------------
//	主人公(ｺﾝﾃｽﾄ用)
//------------------------------------------
static const SXYObjHead contest_hero_Head = 
{
	ACT_TMODE,								// 転送型
	EVOBJ_HINE_PALID_0,
	EVOBJ_HERO_REF_PALID_1,					// 特殊映りこみﾊﾟﾚｯﾄID
	0x20*8,									// ｾﾙ転送最大ｻｲｽﾞ
	16,										// X ｻｲｽﾞ
	32,										// Y ｻｲｽﾞ
	SP_OBJ_PALNO,							// OAMﾊﾟﾚｯﾄNo
	SHADE_KIND_16x8,						// 影種類
	0,										// ｾﾙﾁｪﾝｼﾞﾃﾞﾌｫﾙﾄｽｲｯﾁ
	0,										// 映りこみ位置操作ﾌﾗｸﾞ
	FOOT_KIND_NORMAL,						// 足跡種類
	&Oam16x32,								// OAM
	Oam16x32PatSt,							// OAMﾊﾟｯﾄ
	ObjAnmTbl_TypeHero,						// ｱﾆﾒｰｼｮﾝﾃｰﾌﾞﾙ
	hero_celltrans,							// ｱﾆﾒｰｼｮﾝﾄﾗﾝｽﾃﾞｰﾀ
	DummyActAffTbl,							// ｱﾌｨﾝ
};

//------------------------------------------
//	女主人公(ｺﾝﾃｽﾄ)
//------------------------------------------
static const SXYObjHead contest_hine_Head = 
{
	ACT_TMODE,
	EVOBJ_HINE_PALID_0,
	EVOBJ_HERO_REF_PALID_1,
	0x20*8,
	16,
	32,
	SP_OBJ_PALNO,
	SHADE_KIND_16x8,
	0,
	0,
	FOOT_KIND_NORMAL,
	&Oam16x32,
	Oam16x32PatSt,
	ObjAnmTbl_TypeHero,
	heroine_celltrans,
	DummyActAffTbl,
};

//======================================================================
//		ﾊﾟﾚｯﾄ
//======================================================================
const PalData EvObjPalTbl[] =
{
	{ &opp_Palette[0],				EVOBJ_OTHERS_PALID_0_0 },	
	{ &opp_Palette[16],				EVOBJ_OTHERS_PALID_0_1 },	
	{ &opp_Palette[32],				EVOBJ_OTHERS_PALID_0_2 },	
	{ &opp_Palette[48],				EVOBJ_OTHERS_PALID_0_3 },	
	{ &opp_Palette[64],				EVOBJ_OTHERS_REF_PALID_0_0 },
	{ &opp_Palette[80],				EVOBJ_OTHERS_REF_PALID_0_1 },
	{ &opp_Palette[96],				EVOBJ_OTHERS_REF_PALID_0_2 },
	{ &opp_Palette[112],			EVOBJ_OTHERS_REF_PALID_0_3 },

	{ &hero_Palette[0],				EVOBJ_HERO_PALID_0 },
	{ &hero_ref_Palette[0],			EVOBJ_HERO_REF_PALID_0 },	
	{ &hero_ref_Palette[16],		EVOBJ_HERO_REF_PALID_1 },
	{ &moguri_Palette[0],			EVOBJ_HERO_DIVING_PALID },

	{ &a_debu_Palette[0],			EVOBJ_BIGMAN_PALID },
	{ &a_debu_ref_Palette[0],		EVOBJ_BIGMAN_REF_PALID },

	{ &truck_Palette[0],			EVOBJ_TRUCK_PALID },
	{ &hikobj_Palette[0],			EVOBJ_MOVER_PALID },

	{ &opobj2_Palette[0],			EVOBJ_ATTACK_PALID },

	{ &heroine_Palette[0],			EVOBJ_HINE_PALID_0 },
	{ &heroine_Palette[16],			EVOBJ_HINE_REF_PALID_0 },

	{ &baggage_Palette[0],			EVOBJ_CARGO_PALID },
	
	{ &ropeway_Palette[0],			EVOBJ_ROPEWAY_PALID },
	
	{ &ship_obj_Palette[0],			EVOBJ_HISHIP_PALID },

	{ &op_kiog_mc_Palette[0],		EVOBJ_KAIOGA_MC_PALID },
	{ &op_kiog_mc_Palette[16],		EVOBJ_KAIOGA_MC_REF_PALID },

	{ &op_grdn_mc_Palette[0],		EVOBJ_GURADON_MC_PALID },
	{ &op_grdn_mc_Palette[16],		EVOBJ_GURADON_MC_REF_PALID },

#if (SUBMARINE_CHMODE == SUBM_CHMODE_OHM)
	{ &submarine_obj_Palette[0],	EVOBJ_SUBMARINE_PALID },
#endif

	{ OBJPAL_END, 0 }				// 終了
};

//======================================================================
//		主人公ﾊﾟﾚｯﾄ管理
//======================================================================
//------------------------------------------
//	主人公映り込みﾊﾟﾚｯﾄ
//------------------------------------------
static const u16 hero_pal_ref_st[] =
{
	EVOBJ_HERO_REF_PALID_0,							// 映り込み 0
	EVOBJ_HERO_REF_PALID_0,							// 映り込み 1
	EVOBJ_HERO_REF_PALID_0,							// 映り込み 2
	EVOBJ_HERO_REF_PALID_0,							// 映り込み 3
};

//------------------------------------------
//	女主人公映り込みﾊﾟﾚｯﾄ
//------------------------------------------
static const u16 hine_pal_ref_st[] =
{
	EVOBJ_HINE_REF_PALID_0,
	EVOBJ_HINE_REF_PALID_0,
	EVOBJ_HINE_REF_PALID_0,
	EVOBJ_HINE_REF_PALID_0,
};

//------------------------------------------
//	主人公ﾀﾞｲﾋﾞﾝｸﾞﾊﾟﾚｯﾄ
//------------------------------------------
static const u16 hero_div_pal_ref_st[] =
{
	EVOBJ_HERO_DIVING_PALID,
	EVOBJ_HERO_DIVING_PALID,
	EVOBJ_HERO_DIVING_PALID,
	EVOBJ_HERO_DIVING_PALID,
};

//------------------------------------------
//	主人公ﾊﾟﾚｯﾄﾃﾞｰﾀ
//	{ 通常, 映りこみ },
//------------------------------------------
const STDATA EvObjHeroPalStTbl[] =
{
	{ EVOBJ_HERO_PALID_0, hero_pal_ref_st },
	{ EVOBJ_HINE_PALID_0, hero_pal_ref_st },
	{ EVOBJ_HERO_DIVING_PALID, hero_div_pal_ref_st },

	{ EVOBJ_PALEND, 0 },							// 終了
};

//======================================================================
//		特殊ﾊﾟﾚｯﾄ管理
//======================================================================
//------------------------------------------
//	大男
//------------------------------------------
static const u16 debu_pal_ref_st[] =
{
	EVOBJ_BIGMAN_REF_PALID,							// 映り込み 0
	EVOBJ_BIGMAN_REF_PALID,							// 映り込み 1
	EVOBJ_BIGMAN_REF_PALID,							// 映り込み 2
	EVOBJ_BIGMAN_REF_PALID,							// 映り込み 3
};

//------------------------------------------
//	ﾄﾗｯｸ
//------------------------------------------
static const u16 truck_pal_ref_st[] =
{
	EVOBJ_TRUCK_PALID,
	EVOBJ_TRUCK_PALID,
	EVOBJ_TRUCK_PALID,
	EVOBJ_TRUCK_PALID,
};

//------------------------------------------
//	引越しﾎﾟｹﾓﾝ
//------------------------------------------
static const u16 hikobj_pal_ref_st[] =
{
	EVOBJ_MOVER_PALID,
	EVOBJ_MOVER_PALID,
	EVOBJ_MOVER_PALID,
	EVOBJ_MOVER_PALID,
};

//------------------------------------------
//	荷物
//------------------------------------------
static const u16 cargo_pal_ref_st[] =
{
	EVOBJ_CARGO_PALID,
	EVOBJ_CARGO_PALID,
	EVOBJ_CARGO_PALID,
	EVOBJ_CARGO_PALID,
};

//------------------------------------------
//	ﾛｰﾌﾟｳｪｲﾊﾟﾚｯﾄ
//------------------------------------------
static const u16 ropeway_pal_ref_st[] =
{
	EVOBJ_ROPEWAY_PALID,
	EVOBJ_ROPEWAY_PALID,
	EVOBJ_ROPEWAY_PALID,
	EVOBJ_ROPEWAY_PALID,
};

//------------------------------------------
//	高速船ﾊﾟﾚｯﾄ
//------------------------------------------
static const u16 ship_obj_pal_ref_st[] =
{
	EVOBJ_HISHIP_PALID,
	EVOBJ_HISHIP_PALID,
	EVOBJ_HISHIP_PALID,
	EVOBJ_HISHIP_PALID,
};

//------------------------------------------
//	潜水艦ﾊﾟﾚｯﾄ
//------------------------------------------
#if (SUBMARINE_CHMODE == SUBM_CHMODE_OHM)
static const u16 submarine_obj_pal_ref_st[] =
{
	EVOBJ_SUBMARINE_PALID,
	EVOBJ_SUBMARINE_PALID,
	EVOBJ_SUBMARINE_PALID,
	EVOBJ_SUBMARINE_PALID,
};
#endif

//------------------------------------------
//	ｶｲｵｰｶﾞ
//------------------------------------------
static const u16 op_kiog_mc_pal_ref_st[] =
{
	EVOBJ_KAIOGA_MC_REF_PALID,
	EVOBJ_KAIOGA_MC_REF_PALID,
	EVOBJ_KAIOGA_MC_REF_PALID,
	EVOBJ_KAIOGA_MC_REF_PALID,
};

//------------------------------------------
//	ｸﾞﾗｰﾄﾞﾝ
//------------------------------------------
static const u16 op_grdn_mc_pal_ref_st[] =
{
	EVOBJ_GURADON_MC_REF_PALID,
	EVOBJ_GURADON_MC_REF_PALID,
	EVOBJ_GURADON_MC_REF_PALID,
	EVOBJ_GURADON_MC_REF_PALID,
};

//------------------------------------------
//	ｶｸﾚｵﾝ(橋影対応型)
//------------------------------------------
static const u16 op_kakreon_bridge_pal_ref_st[] =
{
	EVOBJ_OTHERS_REF_PALID_0_2,
	EVOBJ_OTHERS_REF_PALID_0_2,
	EVOBJ_OTHERS_REF_PALID_0_2,
	EVOBJ_OTHERS_REF_PALID_0_2,
};

//------------------------------------------
//	特殊ﾊﾟﾚｯﾄｽﾃｰﾀｽﾃｰﾌﾞﾙ
//	{ 通常, 映りこみ },
//------------------------------------------			
const STDATA EvObjSpPalStTbl[] =
{
	{ EVOBJ_HERO_PALID_0, hero_pal_ref_st },
	{ EVOBJ_HINE_PALID_0, hero_pal_ref_st },
	{ EVOBJ_BIGMAN_PALID, debu_pal_ref_st },			// 大男
	{ EVOBJ_TRUCK_PALID, truck_pal_ref_st },			// ﾄﾗｯｸ
	{ EVOBJ_MOVER_PALID, hikobj_pal_ref_st },			// 引越しﾎﾟｹﾓﾝ
	{ EVOBJ_CARGO_PALID, cargo_pal_ref_st },			// 荷物
	{ EVOBJ_ROPEWAY_PALID, ropeway_pal_ref_st },		// ﾛｰﾌﾟｳｪｲ
	{ EVOBJ_HISHIP_PALID, ship_obj_pal_ref_st },		// 高速船
	{ EVOBJ_KAIOGA_MC_PALID, op_kiog_mc_pal_ref_st },
	{ EVOBJ_GURADON_MC_PALID, op_grdn_mc_pal_ref_st },
	{ EVOBJ_OTHERS_PALID_0_2, op_kakreon_bridge_pal_ref_st },

#if (SUBMARINE_CHMODE == SUBM_CHMODE_OHM)
	{ EVOBJ_SUBMARINE_PALID, submarine_obj_pal_ref_st }, // 潜水艦
#endif

	{ EVOBJ_PALEND, 0 },							// 終了
};

//======================================================================
//		常駐ﾊﾟﾚｯﾄﾃｰﾌﾞﾙ(仮)
//======================================================================
//------------------------------------------
//	通常ﾊﾟﾚｯﾄ
//------------------------------------------
static const u16 EvObjStayPalNormal[] =					// 仮常駐ﾊﾟﾚｯﾄ
{
	EVOBJ_HERO_PALID_0,
	EVOBJ_HERO_REF_PALID_0,
	EVOBJ_OTHERS_PALID_0_0,
	EVOBJ_OTHERS_PALID_0_1,
	EVOBJ_OTHERS_PALID_0_2,
	EVOBJ_OTHERS_PALID_0_3,
	EVOBJ_OTHERS_REF_PALID_0_0,
	EVOBJ_OTHERS_REF_PALID_0_1,
	EVOBJ_OTHERS_REF_PALID_0_2,
	EVOBJ_OTHERS_REF_PALID_0_3,
};

//------------------------------------------
//	火山地帯ﾊﾟﾚｯﾄ
//------------------------------------------
static const u16 EvObjStayPalVolcano[] =				// 仮常駐ﾊﾟﾚｯﾄ
{
	EVOBJ_HERO_PALID_0,
	EVOBJ_HERO_REF_PALID_0,
	EVOBJ_OTHERS_PALID_0_0,
	EVOBJ_OTHERS_PALID_0_1,
	EVOBJ_OTHERS_PALID_0_2,
	EVOBJ_OTHERS_PALID_0_3,
	EVOBJ_OTHERS_REF_PALID_0_0,
	EVOBJ_OTHERS_REF_PALID_0_1,
	EVOBJ_OTHERS_REF_PALID_0_2,
	EVOBJ_OTHERS_REF_PALID_0_3,
};

//------------------------------------------
//	氷地帯ﾊﾟﾚｯﾄ
//------------------------------------------
static const u16 EvObjStayPalIce[] =					// 仮常駐ﾊﾟﾚｯﾄ
{
	EVOBJ_HERO_PALID_0,
	EVOBJ_HERO_REF_PALID_0,
	EVOBJ_OTHERS_PALID_0_0,
	EVOBJ_OTHERS_PALID_0_1,
	EVOBJ_OTHERS_PALID_0_2,
	EVOBJ_OTHERS_PALID_0_3,
	EVOBJ_OTHERS_REF_PALID_0_0,
	EVOBJ_OTHERS_REF_PALID_0_1,
	EVOBJ_OTHERS_REF_PALID_0_2,
	EVOBJ_OTHERS_REF_PALID_0_3,
};

//------------------------------------------
//	暗闇地帯ﾊﾟﾚｯﾄ
//------------------------------------------
static const u16 EvObjStayPalDark[] =					// 仮常駐ﾊﾟﾚｯﾄ
{
	EVOBJ_HERO_PALID_0,
	EVOBJ_HERO_REF_PALID_0,
	EVOBJ_OTHERS_PALID_0_0,
	EVOBJ_OTHERS_PALID_0_1,
	EVOBJ_OTHERS_PALID_0_2,
	EVOBJ_OTHERS_PALID_0_3,
	EVOBJ_OTHERS_REF_PALID_0_0,
	EVOBJ_OTHERS_REF_PALID_0_1,
	EVOBJ_OTHERS_REF_PALID_0_2,
	EVOBJ_OTHERS_REF_PALID_0_3,
};

//------------------------------------------
//	常駐ﾊﾟﾚｯﾄﾃｰﾌﾞﾙ
//------------------------------------------
const u16 * const EvObjStayPalTbl[] =
{
	EvObjStayPalNormal,									// 通常
	EvObjStayPalVolcano,								// 溶岩
	EvObjStayPalIce,									// 氷
	EvObjStayPalDark,									// 暗い
};

//======================================================================
//		たねｸﾞﾗﾌｨｯｸﾃﾞｰﾀ
//======================================================================
//------------------------------------------
//	たね01
//------------------------------------------
static const actAnmData seed01_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed01_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed01_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed01_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed01_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed01_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed01_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed01_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_2,								// 2
	OTHERS_OBJ_PALNO_2,								// 3
	OTHERS_OBJ_PALNO_2,								// 4
};

//------------------------------------------
//	たね02
//------------------------------------------
static const actAnmData seed02_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed02_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed02_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed02_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed02_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed02_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed02_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed02_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_0,								// 2
	OTHERS_OBJ_PALNO_0,								// 3
	OTHERS_OBJ_PALNO_0,								// 4
};

//------------------------------------------
//	たね03
//------------------------------------------
static const actAnmData seed03_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed03_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed03_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed03_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed03_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed03_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed03_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed03_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_0,								// 2
	OTHERS_OBJ_PALNO_0,								// 3
	OTHERS_OBJ_PALNO_0,								// 4
};

//------------------------------------------
//	たね04
//------------------------------------------
static const actAnmData seed04_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed04_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed04_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed04_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed04_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed04_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed04_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed04_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_1,								// 2
	OTHERS_OBJ_PALNO_1,								// 3
	OTHERS_OBJ_PALNO_1,								// 4
};

//------------------------------------------
//	たね05
//------------------------------------------
static const actAnmData seed05_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed05_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed05_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed05_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed05_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed05_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed05_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed05_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_2,								// 2
	OTHERS_OBJ_PALNO_2,								// 3
	OTHERS_OBJ_PALNO_2,								// 4
};

//------------------------------------------
//	たね06
//------------------------------------------
static const actAnmData seed06_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed06_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed06_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed06_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed06_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed06_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed06_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed06_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_1,								// 2
	OTHERS_OBJ_PALNO_1,								// 3
	OTHERS_OBJ_PALNO_1,								// 4
};

//------------------------------------------
//	たね07
//------------------------------------------
static const actAnmData seed07_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed07_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed07_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed07_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed07_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed07_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed07_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed07_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_1,								// 2
	OTHERS_OBJ_PALNO_1,								// 3
	OTHERS_OBJ_PALNO_1,								// 4
};

//------------------------------------------
//	たね08
//------------------------------------------
static const actAnmData seed08_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed08_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed08_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed08_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed08_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed08_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed08_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed08_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_2,								// 2
	OTHERS_OBJ_PALNO_2,								// 3
	OTHERS_OBJ_PALNO_2,								// 4
};

//------------------------------------------
//	たね09
//------------------------------------------
static const actAnmData seed09_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed09_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed09_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed09_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed09_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed09_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed09_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed09_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_2,								// 2
	OTHERS_OBJ_PALNO_2,								// 3
	OTHERS_OBJ_PALNO_2,								// 4
};

//------------------------------------------
//	たね10
//------------------------------------------
static const actAnmData seed10_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed10_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed10_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed10_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed10_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed10_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed10_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed10_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_1,								// 2
	OTHERS_OBJ_PALNO_1,								// 3
	OTHERS_OBJ_PALNO_1,								// 4
};

//------------------------------------------
//	たね11
//------------------------------------------
static const actAnmData seed11_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed11_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed11_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed11_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed11_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed11_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed11_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed11_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_2,								// 2
	OTHERS_OBJ_PALNO_2,								// 3
	OTHERS_OBJ_PALNO_2,								// 4
};

//------------------------------------------
//	たね12
//------------------------------------------
static const actAnmData seed12_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed12_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed12_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed12_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed12_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed12_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed12_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed12_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_1,								// 2
	OTHERS_OBJ_PALNO_1,								// 3
	OTHERS_OBJ_PALNO_1,								// 4
};

//------------------------------------------
//	たね13
//------------------------------------------
static const actAnmData seed13_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed13_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed13_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed13_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed13_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed13_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed13_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed13_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_1,								// 2
	OTHERS_OBJ_PALNO_1,								// 3
	OTHERS_OBJ_PALNO_1,								// 4
};

//------------------------------------------
//	たね14
//------------------------------------------
static const actAnmData seed14_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed14_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed14_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed14_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed14_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed14_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed14_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed14_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_2,								// 2
	OTHERS_OBJ_PALNO_2,								// 3
	OTHERS_OBJ_PALNO_2,								// 4
};

//------------------------------------------
//	たね15
//------------------------------------------
static const actAnmData seed15_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed15_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed15_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed15_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed15_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed15_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed15_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed15_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_3,								// 2
	OTHERS_OBJ_PALNO_3,								// 3
	OTHERS_OBJ_PALNO_3,								// 4
};

//------------------------------------------
//	たね16
//------------------------------------------
static const actAnmData seed16_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed16_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed16_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed16_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed16_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed16_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed16_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed16_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_2,								// 2
	OTHERS_OBJ_PALNO_2,								// 3
	OTHERS_OBJ_PALNO_2,								// 4
};

//------------------------------------------
//	たね17
//------------------------------------------
static const actAnmData seed17_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed17_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed17_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed17_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed17_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed17_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed17_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed17_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_1,								// 2
	OTHERS_OBJ_PALNO_1,								// 3
	OTHERS_OBJ_PALNO_1,								// 4
};

//------------------------------------------
//	たね18
//------------------------------------------
static const actAnmData seed18_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed18_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed18_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed18_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed18_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed18_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed18_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed18_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_1,								// 2
	OTHERS_OBJ_PALNO_1,								// 3
	OTHERS_OBJ_PALNO_1,								// 4
};

//------------------------------------------
//	たね19
//------------------------------------------
static const actAnmData seed19_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed19_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed19_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed19_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed19_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed19_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed19_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed19_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_2,								// 2
	OTHERS_OBJ_PALNO_2,								// 3
	OTHERS_OBJ_PALNO_2,								// 4
};

//------------------------------------------
//	たね20
//------------------------------------------
static const actAnmData seed20_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed20_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed20_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed20_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed20_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed20_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed20_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed20_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_1,								// 2
	OTHERS_OBJ_PALNO_1,								// 3
	OTHERS_OBJ_PALNO_1,								// 4
};

//------------------------------------------
//	たね21
//------------------------------------------
static const actAnmData seed21_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed21_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed21_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed21_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed21_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed21_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed21_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed21_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_0,								// 2
	OTHERS_OBJ_PALNO_0,								// 3
	OTHERS_OBJ_PALNO_0,								// 4
};

//------------------------------------------
//	たね22
//------------------------------------------
static const actAnmData seed22_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed22_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed22_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed22_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed22_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed22_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed22_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed22_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_0,								// 2
	OTHERS_OBJ_PALNO_0,								// 3
	OTHERS_OBJ_PALNO_0,								// 4
};

//------------------------------------------
//	たね23
//------------------------------------------
static const actAnmData seed23_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed23_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed23_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed23_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed23_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed23_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed23_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed23_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_0,								// 2
	OTHERS_OBJ_PALNO_0,								// 3
	OTHERS_OBJ_PALNO_0,								// 4
};

//------------------------------------------
//	たね24
//------------------------------------------
static const actAnmData seed24_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed24_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed24_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed24_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed24_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed24_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed24_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed24_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_2,								// 2
	OTHERS_OBJ_PALNO_2,								// 3
	OTHERS_OBJ_PALNO_2,								// 4
};

//------------------------------------------
//	たね25
//------------------------------------------
static const actAnmData seed25_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed25_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed25_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed25_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed25_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed25_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed25_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed25_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_1,								// 2
	OTHERS_OBJ_PALNO_1,								// 3
	OTHERS_OBJ_PALNO_1,								// 4
};

//------------------------------------------
//	たね26
//------------------------------------------
static const actAnmData seed26_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed26_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed26_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed26_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed26_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed26_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed26_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed26_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_0,								// 2
	OTHERS_OBJ_PALNO_0,								// 3
	OTHERS_OBJ_PALNO_0,								// 4
};

//------------------------------------------
//	たね27
//------------------------------------------
static const actAnmData seed27_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed27_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed27_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed27_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed27_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed27_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed27_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed27_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_0,								// 2
	OTHERS_OBJ_PALNO_0,								// 3
	OTHERS_OBJ_PALNO_0,								// 4
};

//------------------------------------------
//	たね28
//------------------------------------------
static const actAnmData seed28_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed28_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed28_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed28_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed28_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed28_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed28_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed28_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_0,								// 2
	OTHERS_OBJ_PALNO_0,								// 3
	OTHERS_OBJ_PALNO_0,								// 4
};

//------------------------------------------
//	たね29
//------------------------------------------
static const actAnmData seed29_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed29_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed29_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed29_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed29_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed29_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed29_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed29_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_2,								// 2
	OTHERS_OBJ_PALNO_2,								// 3
	OTHERS_OBJ_PALNO_2,								// 4
};

//------------------------------------------
//	たね30
//------------------------------------------
static const actAnmData seed30_celltrans[] =
{
	{&seed00_Character[(0x20*4) * 0], 0x20*4},		// 0 盛り土
	{&seed00_Character[(0x20*4) * 1], 0x20*4},		// 1 芽
	{&seed00_Character[(0x20*4) * 2], 0x20*4},		// 1
	{&seed30_Character[(0x20*8) * 0], 0x20*8},		// 2 幹
	{&seed30_Character[(0x20*8) * 1], 0x20*8},		// 2
	{&seed30_Character[(0x20*8) * 2], 0x20*8},		// 3 花
	{&seed30_Character[(0x20*8) * 3], 0x20*8},		// 3
	{&seed30_Character[(0x20*8) * 4], 0x20*8},		// 4 種
	{&seed30_Character[(0x20*8) * 5], 0x20*8},		// 4
};

static const u8 seed30_palno[] =
{
	OTHERS_OBJ_PALNO_1,								// 0
	OTHERS_OBJ_PALNO_2,								// 1
	OTHERS_OBJ_PALNO_0,								// 2
	OTHERS_OBJ_PALNO_0,								// 3
	OTHERS_OBJ_PALNO_0,								// 4
};

//------------------------------------------
//	たね成長OBJｺｰﾄﾞ
//------------------------------------------
static const u8 seed16x16objcode_tbl[] =			// 16x16
{
	SEED16x16,										// 盛り土
	SEED16x16,										// 芽
	SEED16x16,										// 幹
	SEED16x16,										// 花
	SEED16x16,										// 種
};

static const u8 seed16x32objcode_tbl[] =			// 16x32
{
	SEED16x16,										// 盛り土
	SEED16x16,										// 芽
	SEED16x32,										// 幹
	SEED16x32,										// 花
	SEED16x32,										// 種
};

//------------------------------------------
//	たねｾﾙﾃｰﾌﾞﾙ
//------------------------------------------
#define SEED_DUMMY_CELL	(seed01_celltrans)

const actAnmData * const SeedCellTransTbl[] =
{
	seed05_celltrans,
	seed21_celltrans,
	seed01_celltrans,
	seed19_celltrans,
	seed25_celltrans,
	seed13_celltrans,
	seed22_celltrans,
	seed23_celltrans,
	seed08_celltrans,
	seed24_celltrans,									// 10
	
	seed06_celltrans,
	seed17_celltrans,
	seed07_celltrans,
	seed16_celltrans,
	seed04_celltrans,
	seed09_celltrans,
	seed09_celltrans,
	seed07_celltrans,
	seed03_celltrans,
	seed04_celltrans,									// 20

	seed18_celltrans,
	seed02_celltrans,
	seed03_celltrans,
	seed15_celltrans,
	seed10_celltrans,
	seed30_celltrans,
	seed27_celltrans,
	seed18_celltrans,
	seed11_celltrans,
	seed12_celltrans,									// 30

	seed20_celltrans,
	seed26_celltrans,
	seed11_celltrans,
	seed29_celltrans,
	seed15_celltrans,
	seed14_celltrans,
	seed15_celltrans,
	seed16_celltrans,
	seed18_celltrans,
	seed10_celltrans,									// 40

	seed28_celltrans,
	seed27_celltrans,
	seed29_celltrans,
};

//------------------------------------------
//	たねﾊﾟﾚｯﾄﾃｰﾌﾞﾙ
//------------------------------------------
#define SEED_DUMMY_PALNO (seed01_palno)

const u8 * const SeedPalNoTbl[] =
{
	seed05_palno,
	seed21_palno,
	seed01_palno,
	seed19_palno,
	seed25_palno,
	seed13_palno,
	seed22_palno,
	seed23_palno,
	seed08_palno,
	seed24_palno,										// 10
	
	seed06_palno,
	seed17_palno,
	seed07_palno,
	seed16_palno,
	seed04_palno,
	seed09_palno,
	seed09_palno,
	seed07_palno,
	seed03_palno,
	seed04_palno,										// 20

	seed18_palno,
	seed02_palno,
	seed03_palno,
	seed15_palno,
	seed10_palno,
	seed30_palno,
	seed27_palno,
	seed18_palno,
	seed11_palno,
	seed12_palno,										// 30

	seed20_palno,
	seed26_palno,
	seed11_palno,
	seed29_palno,
	seed15_palno,
	seed14_palno,
	seed15_palno,
	seed16_palno,
	seed18_palno,
	seed10_palno,										// 40

	seed28_palno,
	seed27_palno,
	seed29_palno,
};

//------------------------------------------
//	たね成長OBJｺｰﾄﾞﾃｰﾌﾞﾙ
//------------------------------------------
const u8 * const SeedObjCodeTbl[] =
{
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,

	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,

	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,

	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,								// 40

	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
	seed16x32objcode_tbl,
};

//======================================================================
//		ﾌｨｰﾙﾄﾞｴﾌｪｸﾄ用ﾊﾟﾚｯﾄ
//======================================================================
const PalData FeUsePal0 =
{ &map_eff_Palette[0], FE_Use0_PalID };

const PalData FeUsePal1 =
{ &map_eff_Palette[16], FE_Use1_PalID };

//======================================================================
//		EvObj	付属ｱｸﾀｰ
//======================================================================
//------------------------------------------
//	影
//------------------------------------------
static const actAnm shade_anm[] =
{
	{0,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const shade_anm_tbl[] =
{
	shade_anm,
};

static const actAnmData shade8x8_celltrans[] =
{
	{&shade_Character[(0x20) * 0], 0x20*1},
};

static const actAnmData shade16x8_celltrans[] =
{
	{&shade_Character[(0x20) * 1], 0x20*2},
};

static const actAnmData shade32x8_celltrans[] =
{
	{&shade_Character[(0x20) * 3], 0x20*4},
};

static const actAnmData shade64x32_celltrans[] =
{
	{&shade_Character[(0x20) * 7], 0x20*32},
};

static const actHeader Shade8x8ActHead =				// 影 8x8
{
	ACT_TMODE,
	ACT_OAMPAL,
	&Oam8x8,
	shade_anm_tbl,
	shade8x8_celltrans,
	DummyActAffTbl,
	EvActShadeMove,
};

static const actHeader Shade16x8ActHead =				// 影 16x8
{
	ACT_TMODE,
	ACT_OAMPAL,
	&Oam16x8,
	shade_anm_tbl,
	shade16x8_celltrans,
	DummyActAffTbl,
	EvActShadeMove,
};

static const actHeader Shade32x8ActHead =				// 影 32x8
{
	ACT_TMODE,
	ACT_OAMPAL,
	&Oam32x8,
	shade_anm_tbl,
	shade32x8_celltrans,
	DummyActAffTbl,
	EvActShadeMove,
};

static const actHeader Shade64x32ActHead =				// 影 64x32
{
	ACT_TMODE,
	ACT_OAMPAL,
	&Oam64x32,
	shade_anm_tbl,
	shade64x32_celltrans,
	DummyActAffTbl,
	EvActShadeMove,
};

//------------------------------------------
//	草1
//------------------------------------------
static const actAnmData grass1_celltrans[] =
{
#if 0
	{&kusa1_Character[(0x20*2) * 0], 0x20*2},			// 通常
	{&kusa1_Character[(0x20*2) * 1], 0x20*2},			// 草ゆれ1
	{&kusa1_Character[(0x20*2) * 2], 0x20*2},			// 草ゆれ2
#endif
	{&kusa11_Character[(0x20*4) * 0], 0x20*4},
	{&kusa11_Character[(0x20*4) * 1], 0x20*4},
	{&kusa11_Character[(0x20*4) * 2], 0x20*4},
	{&kusa11_Character[(0x20*4) * 3], 0x20*4},
	{&kusa11_Character[(0x20*4) * 4], 0x20*4},
};

static const actAnm grass1_anm[] =
{
	{1,10,0,0},
	{2,10,0,0},
	{3,10,0,0},
	{4,10,0,0},
	{0,10,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const grass1_anm_tbl[] =
{
	grass1_anm,
};

static const actHeader ShortGrassShakeActHead =
{
	ACT_TMODE,
	FE_Use1_PalID,
	&Oam16x16,
	grass1_anm_tbl,
	grass1_celltrans,
	DummyActAffTbl,
	FeShortGrassShakeMove,
};

//------------------------------------------
//	水溜り
//------------------------------------------
static const actAnmData mizutama16x16_celltrans[] =
{
	{&mizutama_Character[(0x20*4) * 0], 0x20*4},
	{&mizutama_Character[(0x20*4) * 1], 0x20*4},
	{&mizutama_Character[(0x20*4) * 2], 0x20*4},
	{&mizutama_Character[(0x20*4) * 3], 0x20*4},
	{&mizutama_Character[(0x20*4) * 4], 0x20*4},
};

static const actAnm mizutama_anm[] =
{
	{0,12,0,0},
	{1,9,0,0},
	{2,9,0,0},
	{3,9,0,0},
	{0,9,0,0},
	{1,9,0,0},
	{2,11,0,0},
	{4,11,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const mizutama_anm_tbl[] =
{
	mizutama_anm,
};

static const actHeader RippleActHead =
{
	ACT_TMODE,
	FE_Use1_PalID,
	&Oam16x16,
	mizutama_anm_tbl,
	mizutama16x16_celltrans,
	DummyActAffTbl,
	EvActCommonMove1,
};

//------------------------------------------
//	灰
//------------------------------------------
static const actAnmData ash16x16_celltrans[] =
{
	{&hai_ani_Character[(0x20*4) * 0], 0x20*4},
	{&hai_ani_Character[(0x20*4) * 1], 0x20*4},
	{&hai_ani_Character[(0x20*4) * 2], 0x20*4},
	{&hai_ani_Character[(0x20*4) * 3], 0x20*4},
	{&hai_ani_Character[(0x20*4) * 4], 0x20*4},
};

static const actAnm ash_anm[] =
{
	{0,12,0,0},
	{1,12,0,0},
	{2,8,0,0},
	{3,12,0,0},
	{4,12,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const ash_anm_tbl[] =
{
	ash_anm,
};

static const actHeader Ash16x16ActHead =
{
	ACT_TMODE,
	FE_Use1_PalID,
	&Oam16x16,
	ash_anm_tbl,
	ash16x16_celltrans,
	DummyActAffTbl,
	EvActAshMove,
};

//------------------------------------------
//	波乗りﾎﾟｹﾓﾝ
//------------------------------------------
static const actAnmData	swim_poke32x32_celltrans[] =
{
	{&hoeruko_Character[(0x20*16) * 0], 0x20*16},		// 下
	{&hoeruko_Character[(0x20*16) * 1], 0x20*16},		// 上
	{&hoeruko_Character[(0x20*16) * 2], 0x20*16},		// 左右
};

static const actAnm swim_poke_anm_d[] =
{
	{0,1,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm swim_poke_anm_u[] =
{
	{1,1,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm swim_poke_anm_l[] =
{
	{2,1,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm swim_poke_anm_r[] =
{
	{2,1,1,0},
	{ACT_ANMLOOP,0,0,0},
};

static const actAnm * const swim_poke_anm_tbl[] =
{
	swim_poke_anm_d,									// 下
	swim_poke_anm_u,									// 上
	swim_poke_anm_l,									// 左
	swim_poke_anm_r,									// 右
};

static const actHeader PokeSwim32x32ActHead =
{
	ACT_TMODE,
	ACT_OAMPAL,											// 主人公ﾊﾟﾚｯﾄに依存
	&Oam32x32,
	swim_poke_anm_tbl,
	swim_poke32x32_celltrans,
	DummyActAffTbl,
	EvActPokeSwimMove,
};

//------------------------------------------
//	主人公ｶｰｿﾙ
//------------------------------------------
#define EXIT_CURSOR_ANM_WAIT 32

static const actAnmData	exit_cursor16x16_celltrans[] =
{
	{&exit_cur_Character[(0x20*4) * 0], 0x20*4},
	{&exit_cur_Character[(0x20*4) * 1], 0x20*4},
	{&exit_cur_Character[(0x20*4) * 2], 0x20*4},
	{&exit_cur_Character[(0x20*4) * 3], 0x20*4},
	{&exit_cur_Character[(0x20*4) * 4], 0x20*4},
	{&exit_cur_Character[(0x20*4) * 5], 0x20*4},
	{&exit_cur_Character[(0x20*4) * 6], 0x20*4},
	{&exit_cur_Character[(0x20*4) * 7], 0x20*4},
};

static const actAnm exit_cursor_anm0[] =				// 下
{
	{3,EXIT_CURSOR_ANM_WAIT,0,0},
	{7,EXIT_CURSOR_ANM_WAIT,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm exit_cursor_anm1[] =				// 上
{
	{0,EXIT_CURSOR_ANM_WAIT,0,0},
	{4,EXIT_CURSOR_ANM_WAIT,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm exit_cursor_anm2[] =				// 左
{
	{1,EXIT_CURSOR_ANM_WAIT,0,0},
	{5,EXIT_CURSOR_ANM_WAIT,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm exit_cursor_anm3[] =				// 右
{
	{2,EXIT_CURSOR_ANM_WAIT,0,0},
	{6,EXIT_CURSOR_ANM_WAIT,0,0},
	{ACT_ANMLOOP,0,0,0},
};
static const actAnm * const exit_cursor_anm_tbl[] =
{
	exit_cursor_anm0,
	exit_cursor_anm1,
	exit_cursor_anm2,
	exit_cursor_anm3,
};

static const actHeader ExitCursor16x16ActHead =
{
	ACT_TMODE,
	ACT_OAMPAL,											// 主人公ﾊﾟﾚｯﾄに依存
	&Oam16x16,
	exit_cursor_anm_tbl,
	exit_cursor16x16_celltrans,
	DummyActAffTbl,
	&DummyActMove,
};

//------------------------------------------
//	砂埃
//------------------------------------------
static const actAnmData hokori1_celltrans[] =
{
	{&hokori1_Character[(0x20*2) * 0], 0x20*2},
	{&hokori1_Character[(0x20*2) * 1], 0x20*2},
	{&hokori1_Character[(0x20*2) * 2], 0x20*2},
};

static const actAnm hokori1_anm[] =
{
	{0,8,0,0},
	{1,8,0,0},
	{2,8,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const hokori1_anm_tbl[] =
{
	hokori1_anm,
};

static const actHeader HokoriActHead =
{
	ACT_TMODE,
	FE_Use0_PalID,
	&Oam16x8,
	hokori1_anm_tbl,
	hokori1_celltrans,
	DummyActAffTbl,
	EvActCommonMove0,
};

//------------------------------------------
//	草3
//------------------------------------------
static const actAnmData grass3_celltrans[] =
{
	{&kusa3_Character[(0x20*2) * 0], 0x20*2},
	{&kusa3_Character[(0x20*2) * 1], 0x20*2},
	{&kusa3_Character[(0x20*2) * 2], 0x20*2},
	{&kusa3_Character[(0x20*2) * 3], 0x20*2},
};

static const actAnm grass3_anm[] =
{
	{0,8,0,0},
	{1,8,0,0},
	{2,8,0,0},
	{3,8,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const grass3_anm_tbl[] =
{
	grass3_anm,
};

static const actHeader ShortGrassFallActHead =
{
	ACT_TMODE,
	FE_Use1_PalID,
	&Oam16x8,
	grass3_anm_tbl,
	grass3_celltrans,
	DummyActAffTbl,
	EvActCommonMove0,
};

//------------------------------------------
//	足跡1
//------------------------------------------
static const actAnmData ashiato1_celltrans[] =
{
	{&ashiato1_Character[(0x20*4) * 0], 0x20*4},
	{&ashiato1_Character[(0x20*4) * 1], 0x20*4},
};

static const actAnm ashiato1_anm0[] =					// 下
{
	{0,1,0,1},
	{ACT_ANMEND,0,0,0},
};

static const actAnm ashiato1_anm1[] =					// 上
{
	{0,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm ashiato1_anm2[] =					// 左
{
	{1,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm ashiato1_anm3[] =					// 右
{
	{1,1,1,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const ashiato1_anm_tbl[] =
{
	ashiato1_anm0,
	ashiato1_anm0,
	ashiato1_anm1,
	ashiato1_anm2,
	ashiato1_anm3,
};

static const actHeader FootPrintActHead =
{
	ACT_TMODE,
	FE_Use0_PalID,
	&Oam16x16,
	ashiato1_anm_tbl,
	ashiato1_celltrans,
	DummyActAffTbl,
	EvActFootPrintMove,
};

//------------------------------------------
//	足跡2
//------------------------------------------
static const actAnmData ashiato2_celltrans[] =
{
	{&ashiato2_Character[(0x20*4) * 0], 0x20*4},
	{&ashiato2_Character[(0x20*4) * 1], 0x20*4},
};

static const actAnm ashiato2_anm0[] =					// 下
{
	{0,1,0,1},
	{ACT_ANMEND,0,0,0},
};

static const actAnm ashiato2_anm1[] =					// 上
{
	{0,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm ashiato2_anm2[] =					// 左
{
	{1,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm ashiato2_anm3[] =					// 右
{
	{1,1,1,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const ashiato2_anm_tbl[] =
{
	ashiato2_anm0,
	ashiato2_anm0,
	ashiato2_anm1,
	ashiato2_anm2,
	ashiato2_anm3,
};

static const actHeader FootPrintDeepActHead =
{
	ACT_TMODE,
	FE_Use0_PalID,
	&Oam16x16,
	ashiato2_anm_tbl,
	ashiato2_celltrans,
	DummyActAffTbl,
	EvActFootPrintMove,
};

//------------------------------------------
//	足跡2
//------------------------------------------
static const actAnmData ashiato3_celltrans[] =
{
	{&ashiato3_Character[(0x20*4) * 0], 0x20*4},
	{&ashiato3_Character[(0x20*4) * 1], 0x20*4},
	{&ashiato3_Character[(0x20*4) * 2], 0x20*4},
	{&ashiato3_Character[(0x20*4) * 3], 0x20*4},
};

static const actAnm ashiato3_anm0[] =					// 下
{
	{2,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm ashiato3_anm1[] =					// 上
{
	{2,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm ashiato3_anm2[] =					// 左
{
	{1,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm ashiato3_anm3[] =					// 右
{
	{1,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm ashiato3_anm4[] =					// 上,右
{
	{0,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm ashiato3_anm5[] =					// 右,下
{
	{0,1,1,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm ashiato3_anm6[] =					// 下,左
{
	{3,1,1,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm ashiato3_anm7[] =					// 左上
{
	{3,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const ashiato3_anm_tbl[] =
{
	ashiato3_anm0,
	ashiato3_anm0,
	ashiato3_anm1,
	ashiato3_anm2,
	ashiato3_anm3,
	ashiato3_anm4,
	ashiato3_anm5,
	ashiato3_anm6,
	ashiato3_anm7,
};

static const actHeader FootPrintCycleActHead =
{
	ACT_TMODE,
	FE_Use0_PalID,
	&Oam16x16,
	ashiato3_anm_tbl,
	ashiato3_celltrans,
	DummyActAffTbl,
	EvActFootPrintMove,
};

//------------------------------------------
//	水飛沫3
//------------------------------------------
static const actAnmData shibuki3_celltrans[] =
{
	{&shibuki3_Character[(0x20*4) * 0], 0x20*4},
	{&shibuki3_Character[(0x20*4) * 1], 0x20*4},
	{&shibuki3_Character[(0x20*4) * 2], 0x20*4},
	{&shibuki3_Character[(0x20*4) * 3], 0x20*4},
};

static const actAnm shibuki3_anm[] =
{
	{0,8,0,0},
	{1,8,0,0},
	{2,8,0,0},
	{3,8,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const shibuki3_anm_tbl[] =
{
	shibuki3_anm,
};

static const actHeader SplashSeaActHead =
{
	ACT_TMODE,
	FE_Use0_PalID,
	&Oam16x16,
	shibuki3_anm_tbl,
	shibuki3_celltrans,
	DummyActAffTbl,
	EvActCommonMove0,
};

//------------------------------------------
//	水1
//------------------------------------------
static const actAnmData mizu1_celltrans[] =
{
	{&mizu1_Character[(0x20*2) * 0], 0x20*2},
	{&mizu1_Character[(0x20*2) * 1], 0x20*2},
};

static const actAnm mizu1_anm0[] =
{
	{0,4,0,0},
	{1,4,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm mizu1_anm1[] =
{
	{0,4,0,0},
	{1,4,0,0},
	{0,6,0,0},
	{1,6,0,0},
	{0,8,0,0},
	{1,8,0,0},
	{0,6,0,0},
	{1,6,0,0},
	{ACT_ANMLOOP,0,0,0},
};

static const actAnm * const mizu1_anm_tbl[] =
{
	mizu1_anm0,
	mizu1_anm1,
};

static const actHeader SplashActHead =
{
	ACT_TMODE,
	FE_Use0_PalID,
	&Oam16x8,
	mizu1_anm_tbl,
	mizu1_celltrans,
	DummyActAffTbl,
	EvActSplashMove,
};

//------------------------------------------
//	水2
//------------------------------------------
static const actAnmData mizu2_celltrans[] =
{
	{&mizu2_Character[(0x20*2) * 0], 0x20*2},
	{&mizu2_Character[(0x20*2) * 1], 0x20*2},
	{&mizu2_Character[(0x20*2) * 2], 0x20*2},
};

static const actAnm mizu2_anm[] =
{
	{0,4,0,0},
	{1,4,0,0},
	{2,4,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const mizu2_anm_tbl[] =
{
	mizu2_anm,
};

static const actHeader SplashWaterActHead =
{
	ACT_TMODE,
	FE_Use0_PalID,
	&Oam16x8,
	mizu2_anm_tbl,
	mizu2_celltrans,
	DummyActAffTbl,
	EvActCommonMove0,
};

//------------------------------------------
//	長い草揺れ
//------------------------------------------
static const actAnmData kusa4_celltrans[] =
{
	{&kusa7_Character[(0x20*4) * 0], 0x20*4},
	{&kusa7_Character[(0x20*4) * 1], 0x20*4},
	{&kusa7_Character[(0x20*4) * 2], 0x20*4},
	{&kusa7_Character[(0x20*4) * 3], 0x20*4},
};

static const actAnm kusa4_anm[] =
{
	{1,3,0,0},
	{2,3,0,0},
	{0,4,0,0},
	{3,4,0,0},
	{0,4,0,0},
	{3,4,0,0},
	{0,4,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const kusa4_anm_tbl[] =
{
	kusa4_anm,
};

static const actHeader LongGrassShakeActHead =
{
	ACT_TMODE,
	FE_Use1_PalID,
	&Oam16x16,
	kusa4_anm_tbl,
	kusa4_celltrans,
	DummyActAffTbl,
	FeLongGrassShakeMove,
};

//------------------------------------------
//	草6
//------------------------------------------
static const actAnmData kusa6_celltrans[] =
{
	{&kusa6_Character[(0x20*4) * 0], 0x20*4},
	{&kusa6_Character[(0x20*4) * 1], 0x20*4},
	{&kusa6_Character[(0x20*4) * 2], 0x20*4},
	{&kusa6_Character[(0x20*4) * 3], 0x20*4},
	{&kusa6_Character[(0x20*4) * 4], 0x20*4},
	{&kusa6_Character[(0x20*4) * 6], 0x20*4},
};

static const actAnm kusa6_anm[] =
{
	{0,4,0,0},
	{1,4,0,0},
	{2,8,0,0},
	{3,8,0,0},
	{4,8,0,0},
	{5,8,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const kusa6_anm_tbl[] =
{
	kusa6_anm,
};

static const actHeader LongGrassFallActHead =
{
	ACT_TMODE,
	FE_Use1_PalID,
	&Oam16x16,
	kusa6_anm_tbl,
	kusa6_celltrans,
	DummyActAffTbl,
	EvActCommonMove0,
};

//------------------------------------------
//	草2 短い草ｴﾝｶｳﾝﾄ
//------------------------------------------
static const actAnmData kusa2_celltrans[] =
{
	{&kusa2_Character[(0x20*4) * 0], 0x20*4},
	{&kusa2_Character[(0x20*4) * 1], 0x20*4},
	{&kusa2_Character[(0x20*4) * 2], 0x20*4},
	{&kusa2_Character[(0x20*4) * 3], 0x20*4},
	{&kusa2_Character[(0x20*4) * 4], 0x20*4},
	{&kusa2_Character[(0x20*4) * 5], 0x20*4},
	{&kusa2_Character[(0x20*4) * 6], 0x20*4},
	{&kusa2_Character[(0x20*4) * 7], 0x20*4},
	{&kusa2_Character[(0x20*4) * 8], 0x20*4},
};

static const actAnm kusa2_anm[] =
{
	{ 0, 10, 0, 0 },
	{ 1, 4, 0, 0 },
	{ 2, 4, 0, 0 },
	{ 3, 4, 0, 0 },
	{ 4, 4, 0, 0 },
	{ 5, 4, 0, 0 },
	{ 6, 4, 0, 0 },
	{ 7, 4, 0, 0 },
	{ 8, 4, 0, 0 },
	{ACT_ANMLOOP,7,0,0},
};

static const actAnm * const kusa2_anm_tbl[] =
{
	kusa2_anm,
};

static const actHeader ShortGrassEncountActHead =
{
	ACT_TMODE,
	FE_Use1_PalID,
	&Oam16x16,
	kusa2_anm_tbl,
	kusa2_celltrans,
	DummyActAffTbl,
	EvActCommonMove1,
};

//------------------------------------------
//	草5
//------------------------------------------
static const actAnmData kusa5_celltrans[] =
{
	{&kusa5_Character[(0x20*4) * 0], 0x20*4},
	{&kusa5_Character[(0x20*4) * 1], 0x20*4},
	{&kusa5_Character[(0x20*4) * 2], 0x20*4},
	{&kusa5_Character[(0x20*4) * 3], 0x20*4},
};

static const actAnm kusa5_anm[] =
{
	{0,4,0,0},
	{1,4,0,0},
	{2,4,0,0},
	{3,4,0,0},
	{2,4,0,0},
	{1,4,0,0},
	{ACT_ANMLOOP,0,0,0},
};

static const actAnm * const kusa5_anm_tbl[] =
{
	kusa5_anm,
};

static const actHeader LongGrassEncountActHead =
{
	ACT_TMODE,
	FE_Use1_PalID,
	&Oam16x16,
	kusa5_anm_tbl,
	kusa5_celltrans,
	DummyActAffTbl,
	EvActCommonMove1,
};

//------------------------------------------
//	砂3
//------------------------------------------
static const actAnmData suna3_celltrans[] =
{
	{&suna3_Character[(0x20*4) * 0], 0x20*4},
	{&suna3_Character[(0x20*4) * 1], 0x20*4},
	{&suna3_Character[(0x20*4) * 2], 0x20*4},
	{&suna3_Character[(0x20*4) * 3], 0x20*4},
};

static const actAnm suna3_anm[] =
{
	{0,4,0,0},
	{1,4,0,0},
	{2,4,0,0},
	{3,4,0,0},
	{ACT_ANMLOOP,0,0,0},
};

static const actAnm * const suna3_anm_tbl[] =
{
	suna3_anm,
};

static const actHeader SandEncountActHead =
{
	ACT_TMODE,
	FE_Use0_PalID,
	&Oam16x16,
	suna3_anm_tbl,
	suna3_celltrans,
	DummyActAffTbl,
	EvActCommonMove1,
};

//------------------------------------------
//	砂4 深い砂
//------------------------------------------
static const actAnmData suna4_celltrans[] =
{
	{&suna4_Character[(0x20*2) * 0], 0x20*2},
	{&suna4_Character[(0x20*2) * 1], 0x20*2},
	{&suna4_Character[(0x20*2) * 2], 0x20*2},
};

static const actAnm suna4_anm[] =
{
	{0,4,0,0},
	{1,4,0,0},
	{2,4,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const suna4_anm_tbl[] =
{
	suna4_anm,
};

static const actHeader DeepSandHead =
{
	ACT_TMODE,
	FE_Use0_PalID,
	&Oam16x8,
	suna4_anm_tbl,
	suna4_celltrans,
	DummyActAffTbl,
	EvActDeepSandMove,
};

//------------------------------------------
//	水3
//------------------------------------------
static const actAnmData mizu3_celltrans[] =
{
	{&mizu3_Character[(0x20*4) * 0], 0x20*4},
	{&mizu3_Character[(0x20*4) * 1], 0x20*4},
	{&mizu3_Character[(0x20*4) * 2], 0x20*4},
	{&mizu3_Character[(0x20*4) * 3], 0x20*4},
};

static const actAnm mizu3_anm[] =
{
	{0,4,0,0},
	{1,4,0,0},
	{2,4,0,0},
	{3,4,0,0},
	{2,4,0,0},
	{1,4,0,0},
	{ACT_ANMLOOP,0,0,0},
};

static const actAnm * const mizu3_anm_tbl[] =
{
	mizu3_anm,
};

static const actHeader WaterEncountActHead =
{
	ACT_TMODE,
	FE_Use0_PalID,
	&Oam16x16,
	mizu3_anm_tbl,
	mizu3_celltrans,
	DummyActAffTbl,
	EvActCommonMove1,
};

//------------------------------------------
//	映りこみ拡縮ｱｸﾀｰ
//------------------------------------------
static const actAffAnm RefAffAnm0[] =					// 通常時
{
	{ -0x100, 0x100, 128, ACT_AFSET },
	{  1, 0, 0, 4 },
	{  0, 0, 0, 8 },
	{ -1, 0, 0, 4 },
	{  0, 0, 0, 8 },
	{ -1, 0, 0, 4 },
	{  0, 0, 0, 8 },
	{  1, 0, 0, 4 },
	{  0, 0, 0, 8 },
	{ ACT_AFLOOP, 1, 0, 0 },
};

static const actAffAnm RefAffAnm1[] =					// H ﾌﾘｯﾌﾟ時
{
	{ 0x100, 0x100, 128, ACT_AFSET },
	{ -1, 0, 0, 4 },
	{  0, 0, 0, 8 },
	{  1, 0, 0, 4 },
	{  0, 0, 0, 8 },
	{  1, 0, 0, 4 },
	{  0, 0, 0, 8 },
	{ -1, 0, 0, 4 },
	{  0, 0, 0, 8 },
	{ ACT_AFLOOP, 1, 0, 0 },
};

static const actAffAnm * const RefAffAnmTbl[] =
{
	RefAffAnm0,
	RefAffAnm1,
};

static const actHeader RefAffActHead =
{
	0,
	ACT_OAMPAL,
	&DummyActOam,
	DummyActAnmTbl,
	ACT_NTRANS,
	RefAffAnmTbl,
	DummyActMove,
};

//------------------------------------------
//	種ｴﾌｪｸﾄ0
//------------------------------------------
static const actAnmData seedeff0_celltrans[] =
{
	{&seedeff0_Character[(0x20*4) * 0], 0x20*4},
	{&seedeff0_Character[(0x20*4) * 1], 0x20*4},
	{&seedeff0_Character[(0x20*4) * 2], 0x20*4},
	{&seedeff0_Character[(0x20*4) * 3], 0x20*4},
	{&seedeff0_Character[(0x20*4) * 4], 0x20*4},
	{&seedeff0_Character[(0x20*4) * 5], 0x20*4},
};

static const actAnm seedeff0_anm0[] =
{
	{0,8,0,0},
	{1,8,0,0},
	{2,8,0,0},
	{3,8,0,0},
	{4,8,0,0},
	{5,8,0,0},

	{ACT_ANMcLOOP,0,0,0},
	{0,4,0,0},
	{1,4,0,0},
	{2,4,0,0},
	{3,4,0,0},
	{4,4,0,0},
	{5,4,0,0},
	{ACT_ANMcLOOP,3,0,0},

	{0,8,0,0},
	{1,8,0,0},
	{2,8,0,0},
	{3,8,0,0},
	{4,8,0,0},
	{5,8,0,0},

	{ACT_ANMEND,0,0,0},
};

static const actAnm * const seedeff0_anm_tbl[] =
{
	seedeff0_anm0,
};

static const actHeader SeedEffectActHead =
{
	ACT_TMODE,
	ACT_OAMPAL,
	&Oam16x16,
	seedeff0_anm_tbl,
	seedeff0_celltrans,
	DummyActAffTbl,
	EvActCommonMove1,
};

//------------------------------------------
//	隠れﾄﾚｰﾅｰ木
//------------------------------------------
static const actAnmData trai_hidew_celltrans[] =
{
	{&trai_hidew_Character[(0x20*8) * 0], 0x20*8},
	{&trai_hidew_Character[(0x20*8) * 1], 0x20*8},
	{&trai_hidew_Character[(0x20*8) * 2], 0x20*8},
	{&trai_hidew_Character[(0x20*8) * 3], 0x20*8},
	{&trai_hidew_Character[(0x20*8) * 4], 0x20*8},
	{&trai_hidew_Character[(0x20*8) * 5], 0x20*8},
	{&trai_hidew_Character[(0x20*8) * 6], 0x20*8},
};

static const actAnm trai_hidew_anm0[] =
{
	{0,16,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm trai_hidew_anm1[] =
{
	{0,4,0,0},
	{1,4,0,0},
	{2,4,0,0},
	{3,4,0,0},
	{4,4,0,0},
	{5,4,0,0},
	{6,4,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const trai_hidew_anm_tbl[] =
{
	trai_hidew_anm0,
	trai_hidew_anm1,
};

static const actHeader TraiHideWActHead =
{
	ACT_TMODE,
	ACT_OAMPAL,
	&Oam16x32,
	trai_hidew_anm_tbl,
	trai_hidew_celltrans,
	DummyActAffTbl,
	EvActTrainerHideMove,
};

//------------------------------------------
//	隠れﾄﾚｰﾅｰ岩
//------------------------------------------
static const actAnmData trai_hider_celltrans[] =
{
	{&trai_hider_Character[(0x20*8) * 0], 0x20*8},
	{&trai_hider_Character[(0x20*8) * 1], 0x20*8},
	{&trai_hider_Character[(0x20*8) * 2], 0x20*8},
	{&trai_hider_Character[(0x20*8) * 3], 0x20*8},
	{&trai_hider_Character[(0x20*8) * 4], 0x20*8},
	{&trai_hider_Character[(0x20*8) * 5], 0x20*8},
	{&trai_hider_Character[(0x20*8) * 6], 0x20*8},
};

static const actAnm trai_hider_anm0[] =
{
	{0,16,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm trai_hider_anm1[] =
{
	{0,4,0,0},
	{1,4,0,0},
	{2,4,0,0},
	{3,4,0,0},
	{4,4,0,0},
	{5,4,0,0},
	{6,4,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const trai_hider_anm_tbl[] =
{
	trai_hider_anm0,
	trai_hider_anm1,
};

static const actHeader TraiHideRActHead =
{
	ACT_TMODE,
	ACT_OAMPAL,
	&Oam16x32,
	trai_hider_anm_tbl,
	trai_hider_celltrans,
	DummyActAffTbl,
	EvActTrainerHideMove,
};

//------------------------------------------
//	隠れﾄﾚｰﾅｰ砂
//------------------------------------------
static const actAnmData trai_hides_celltrans[] =
{
	{&trai_hides_Character[(0x20*8) * 0], 0x20*8},
	{&trai_hides_Character[(0x20*8) * 1], 0x20*8},
	{&trai_hides_Character[(0x20*8) * 2], 0x20*8},
	{&trai_hides_Character[(0x20*8) * 3], 0x20*8},
	{&trai_hides_Character[(0x20*8) * 4], 0x20*8},
	{&trai_hides_Character[(0x20*8) * 5], 0x20*8},
	{&trai_hides_Character[(0x20*8) * 6], 0x20*8},
};

static const actHeader TraiHideSActHead =
{
	ACT_TMODE,
	ACT_OAMPAL,
	&Oam16x32,
	trai_hidew_anm_tbl,
	trai_hides_celltrans,
	DummyActAffTbl,
	EvActTrainerHideMove,
};

//------------------------------------------
//	そらとびﾎﾟｹﾓﾝ
//------------------------------------------			
static const actAnmData	sora_poke32x32_celltrans[] =
{
	{&soratobu_Character[(0x20*16) * 0], 0x20*16},
};

static const actAnm sora_poke_anm[] =
{
	{0,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const sora_poke_anm_tbl[] =
{
	sora_poke_anm,
};

static const actHeader PokeSoraActHead =
{
	ACT_TMODE,
	ACT_OAMPAL,
	&Oam32x32,
	sora_poke_anm_tbl,
	sora_poke32x32_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

//------------------------------------------
//	小さい草
//------------------------------------------
static const actAnmData kusa_s_celltrans[] =
{
	{&kusa_s_Character[(0x20*4) * 0], 0x20*4},
	{&kusa_s_Character[(0x20*4) * 1], 0x20*4},
};

static const actAnm kusa_s_anm[] =
{
	{0,4,0,0},
	{1,4,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const kusa_s_anm_tbl[] =
{
	kusa_s_anm,
};

static const actHeader GrassSActHead =
{
	ACT_TMODE,
	FE_Use1_PalID,
	&Oam16x16,
	kusa_s_anm_tbl,
	kusa_s_celltrans,
	DummyActAffTbl,
	EvActSmallGrassMove,
};

//------------------------------------------
//	温泉
//------------------------------------------
static const actAnmData onsen_celltrans[] =
{
	{&onsen_Character[(0x20*2) * 0], 0x20*4},
};

static const actAnm onsen_anm[] =
{
	{0,4,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const onsen_anm_tbl[] =
{
	onsen_anm,
};

static const actHeader OnsenActHead =
{
	ACT_TMODE,
	FE_Use1_PalID,
	&Oam16x16,
	onsen_anm_tbl,
	onsen_celltrans,
	DummyActAffTbl,
	EvActOnsenMove,
};

//------------------------------------------
//	ｼﾞﾑ砂煙
//------------------------------------------
static const actAnmData gymsand_celltrans[] =
{
	{&gym04_1_Character[(0x20*4) * 0], 0x20*4},
	{&gym04_1_Character[(0x20*4) * 1], 0x20*4},
	{&gym04_1_Character[(0x20*4) * 2], 0x20*4},
	{&gym04_1_Character[(0x20*4) * 3], 0x20*4},
	{&gym04_1_Character[(0x20*4) * 4], 0x20*4}
};

static const actAnm gymsand_anm[] =
{
	{0,6,0,0},
	{1,6,0,0},
	{2,6,0,0},
	{3,6,0,0},
	{4,6,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const gymsand_anm_tbl[] =
{
	gymsand_anm,
};

static const actHeader GymSandActHead =
{
	ACT_TMODE,
	FE_GymSand_PalID,
	&Oam16x16,
	gymsand_anm_tbl,
	gymsand_celltrans,
	DummyActAffTbl,
	FeGymSandActMove,
};

const PalData GymSandPal =								// ｼﾞﾑ砂煙,間欠泉
{&gym_o04_Palette[0],FE_GymSand_PalID};

//------------------------------------------
//	間欠泉
//------------------------------------------
static const actAnmData gayser_celltrans[] =
{
	{&gym04_2_Character[(0x20*4) * 0], 0x20*4},
	{&gym04_2_Character[(0x20*4) * 1], 0x20*4},
	{&gym04_2_Character[(0x20*4) * 2], 0x20*4},
	{&gym04_2_Character[(0x20*4) * 3], 0x20*4},
	{&gym04_2_Character[(0x20*4) * 4], 0x20*4}
};

static const actAnm gayser_anm[] =
{
	{0,6,0,0},
	{1,6,0,0},
	{2,6,0,0},
	{3,6,0,0},
	{4,6,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const gayser_anm_tbl[] =
{
	gayser_anm,
};

static const actHeader GayserActHead =
{
	ACT_TMODE,
	FE_GymSand_PalID,
	&Oam16x16,
	gayser_anm_tbl,
	gayser_celltrans,
	DummyActAffTbl,
	FeGayserActMove,
};

//------------------------------------------
//	泡
//------------------------------------------
static const actAnmData awa_celltrans[] =
{
	{&awa_Character[(0x20*8) * 0], 0x20*8},
	{&awa_Character[(0x20*8) * 1], 0x20*8},
	{&awa_Character[(0x20*8) * 2], 0x20*8},
	{&awa_Character[(0x20*8) * 3], 0x20*8},
	{&awa_Character[(0x20*8) * 4], 0x20*8},
	{&awa_Character[(0x20*8) * 5], 0x20*8},
	{&awa_Character[(0x20*8) * 6], 0x20*8},
	{&awa_Character[(0x20*8) * 7], 0x20*8},
};

static const actAnm awa_anm[] =
{
	{0,4,0,0},
	{1,4,0,0},
	{2,4,0,0},
	{3,6,0,0},
	{4,6,0,0},
	{5,4,0,0},
	{6,4,0,0},
	{7,4,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const awa_anm_tbl[] =
{
	awa_anm,
};

static const actHeader AwaActHead =
{
	ACT_TMODE,
	FE_Use0_PalID,
	&Oam16x32,
	awa_anm_tbl,
	awa_celltrans,
	DummyActAffTbl,
	EvActAwaMove,
};

//------------------------------------------
//	星
//------------------------------------------
static const actAnmData kirari_celltrans[] =
{
	{&kirari_Character[(0x20*4) * 0], 0x20*4},
	{&kirari_Character[(0x20*4) * 1], 0x20*4},
};

static const actAnm kirari_anm[] =
{
	{0,3,0,0},
	{1,5,0,0},
	{0,5,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const kirari_anm_tbl[] =
{
	kirari_anm,
};

static const actHeader KirariActHead =
{
	ACT_TMODE,
	FE_Kirari_PalID,
	&Oam16x16,
	kirari_anm_tbl,
	kirari_celltrans,
	DummyActAffTbl,
	EvActKirariMove,
};

const PalData KirariPal =
{&kirari_Palette[0],FE_Kirari_PalID};

