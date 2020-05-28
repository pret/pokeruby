#include	"common.h"
#include	"print.h"
#include	"monsno.def"

#include	"message.h"	//ヘッダの宣言と食い違いがあるとエラーになるはず

/*==================================================================*/
//	pm_str.c
/*==================================================================*/
const u8 dummy_string[] = { EOM_ };

const u8 kun_string[] = { ku_,n_,EOM_ };
const u8 chan_string[] = { ti_,yya_,n_,EOM_ };

const u8 str_ver_sapphire[] = { SA_,HU_,AA_,I_,A_,EOM_ };
const u8 str_ver_ruby[] = { RU_,BI_,bou_,EOM_ };

const u8 str_aqua[] = { A_,KU_,A_,EOM_ };
const u8 str_maguma[] = { MA_,GU_,MA_,EOM_ };
const u8 str_aogiri[] = { A_,O_,GI_,RI_,EOM_ };
const u8 str_matubusa[] = { MA_,TU_,BU_,SA_,EOM_ };
const u8 str_kaiouga[] = { KA_,I_,O_,bou_,GA_,EOM_ };
const u8 str_guradon[] = { GU_,RA_,bou_,DO_,N_,EOM_ };
const u8 str_support_male[] = { YU_,U_,KI_,EOM_ };
const u8 str_support_female[] = { HA_,RU_,KA_,EOM_ };

const u8 str_tamago[] = { TA_,MA_,GO_,EOM_ };
const u8 str_pokemon[] = { PO_,KE_,MO_,N_,EOM_ };


/*==================================================================*/
//opening.c
/*==================================================================*/
const u8	stmenu_indexstr1[] = {sa_,i_,si_,yyo_,ka_,ra_,spc_,ha_,zi_,me_,ru_,EOM_};
const u8	stmenu_indexstr2[] = {tu_,du_,ki_,ka_,ra_,spc_,ha_,zi_,me_,ru_,EOM_};
const u8	stmenu_indexstr3[] = {se_,ttu_,te_,i_,wo_,spc_,ka_,e_,ru_,EOM_};
const u8	stmenu_indexstr4[] = {hu_,si_,gi_,na_,spc_,de_,ki_,go_,to_,EOM_};

const	u8	load_upd_on_msg[]={
	ga_,i_,bu_,DE_,bou_,TA_,ni_,yo_,ri_,spc_,RE_,PO_,bou_,TO_,wo_,spc_,ko_,u_,si_,n_,si_,ma_,su_,
	CR_,
	si_,ba_,ra_,ku_,spc_,o_,ma_,ti_,ku_,da_,sa_,i_,
	EOM_
};

const	u8	load_upd_ok_msg[]={
	RE_,PO_,bou_,TO_,ga_,spc_,ko_,u_,si_,n_,sa_,re_,ma_,si_,ta_,gyoe_,
	EOM_
};

const	u8	load_upd_full_msg[]={
	RE_,PO_,bou_,TO_,ga_,spc_,ko_,u_,si_,n_,sa_,re_,ma_,si_,ta_,gyoe_,
	NORMAL_WAIT_,
	ko_,re_,i_,zi_,yyo_,u_,RE_,PO_,bou_,TO_,ga_,spc_,ka_,ki_,ki_,re_,na_,i_,no_,de_,
	NORMAL_WAIT_,
	BA_,TTU_,KU_,A_,TTU_,PU_,KA_,bou_,TO_,RI_,TTU_,ZI_,wo_,
	CR_,
	ko_,u_,ka_,n_,si_,te_,ku_,da_,sa_,i_,gyoe_,
	NORMAL_WAIT_,
	ku_,wa_,si_,ku_,ha_,spc_,ni_,n_,te_,n_,do_,u_,spc_,SA_,bou_,BI_,SU_,SE_,N_,TA_,bou_,spc_,ma_,de_,
	CR_,
	o_,to_,i_,a_,wa_,se_,spc_,ku_,da_,sa_,i_,
	EOM_
};

const	u8	load_upd_ng_msg[]={
	RE_,PO_,bou_,TO_,no_,spc_,ko_,u_,si_,n_,ha_,spc_,si_,ttu_,pa_,i_,si_,ma_,si_,ta_,gyoe_,
	NORMAL_WAIT_,
	BA_,TTU_,KU_,A_,TTU_,PU_,KA_,bou_,TO_,RI_,TTU_,ZI_,wo_,
	CR_,
	ko_,u_,ka_,n_,si_,te_,ku_,da_,sa_,i_,gyoe_,
	NORMAL_WAIT_,
	ku_,wa_,si_,ku_,ha_,spc_,ni_,n_,te_,n_,do_,u_,spc_,SA_,bou_,BI_,SU_,SE_,N_,TA_,bou_,spc_,ma_,de_,
	CR_,
	o_,to_,i_,a_,wa_,se_,spc_,ku_,da_,sa_,i_,
	EOM_
};

const	u8	load_ng_msg[]={
	RE_,PO_,bou_,TO_,ga_,spc_,se_,i_,ka_,ku_,ni_,spc_,ka_,ka_,re_,te_,i_,na_,i_,no_,de_,
	CR_,
	so_,no_,ma_,e_,no_,RE_,PO_,bou_,TO_,wo_,spc_,yo_,mi_,ma_,su_,gyoe_,
	EOM_
};

const	u8	load_destroy_msg[]={
	RE_,PO_,bou_,TO_,no_,spc_,na_,i_,yo_,u_,ga_,spc_,ki_,e_,te_,si_,ma_,ttu_,ta_,gyoe_,
	EOM_
};

const	u8	load_debug_msg[]={
	n1_,M__,SA_,BU_,ki_,ba_,n_,ga_,spc_,sa_,sa_,ttu_,te_,i_,ma_,se_,n_,gyoe_,
	EOM_
};

const	u8	rtc_ng_msg[]={
	de_,n_,ti_,gi_,re_,no_,spc_,ta_,me_,ni_,
	CR_,
	to_,ke_,i_,ga_,spc_,u_,go_,ka_,na_,ku_,na_,ri_,ma_,si_,ta_,
	NORMAL_WAIT_,
	to_,ke_,i_,ni_,spc_,ka_,n_,ke_,i_,su_,ru_,spc_,de_,ki_,go_,to_,ha_,
	spc_,o_,ki_,ma_,se_,n_,ga_,
	CR_,
	GE_,bou_,MU_,wo_,spc_,tu_,du_,ke_,te_,spc_,a_,so_,bu_,ko_,to_,ha_,spc_,de_,ki_,ma_,su_,
	EOM_
};

const	u8	HeroInfoNameMsg[] = { si_, yyu_, zi_, n_, ko_, u_, EOM_ };
const	u8	HeroInfoZukanMsg[] = { PO_, KE_, MO_, N_, zu_, ka_, n_, EOM_ }; 
const	u8	HeroInfoTimeMsg[] = { PU_, RE_, I_, zi_, ka_, n_, EOM_ };
const	u8	HeroInfoBadgeMsg[] = { mo_, ttu_, te_, i_, ru_, BA_, TTU_, ZI_, EOM_ };

const u8 sex1_msg[] = {o_,to_,ko_,EOM_};
const u8 sex2_msg[] = {o_,n_,na_,EOM_};

/*		名前	*/
#if (PM_VERSION == VERSION_SAPPHIRE)
const u8 op_name0_msg[] = {zi_,bu_,n_,de_,ki_,me_,ru_,EOM_};
const u8 op_name1_msg[] = { KA_,  I_, TO_,EOM_,EOM_,EOM_};	//01:「カイト」
const u8 op_name2_msg[] = { HI_, RO_,  A_, KI_,EOM_,EOM_};	//02:「ヒロアキ」
const u8 op_name3_msg[] = { HI_, TO_, SI_,EOM_,EOM_,EOM_};	//03:「ヒトシ」
const u8 op_name4_msg[] = { KE_,  I_,EOM_,EOM_,EOM_,EOM_};	//04:「ケイ」
const u8 op_name5_msg[] = { NA_, MI_,EOM_,EOM_,EOM_,EOM_};	//05:「ナミ」
const u8 op_name6_msg[] = {  A_,  I_, KO_,EOM_,EOM_,EOM_};	//06:「アイコ」
const u8 op_name7_msg[] = { MA_, KI_, KO_,EOM_,EOM_,EOM_};	//07:「マキコ」
const u8 op_name8_msg[] = { KI_,YYO_,  U_, KO_,EOM_,EOM_};	//08:「キョウコ」
#elif (PM_VERSION == VERSION_RUBY)
const u8 op_name0_msg[] = {zi_,bu_,n_,de_,ki_,me_,ru_,EOM_};
const u8 op_name1_msg[] = { RI_, KU_, YA_,EOM_,EOM_,EOM_};	//01:「リクヤ」
const u8 op_name2_msg[] = { HI_, RO_,  A_, KI_,EOM_,EOM_};	//02:「ヒロアキ」
const u8 op_name3_msg[] = { HI_, TO_, SI_,EOM_,EOM_,EOM_};	//03:「ヒトシ」
const u8 op_name4_msg[] = { KE_,  I_,EOM_,EOM_,EOM_,EOM_};	//04:「ケイ」
const u8 op_name5_msg[] = { MU_, TU_, MI_,EOM_,EOM_,EOM_};	//05:「ムツミ」
const u8 op_name6_msg[] = {  A_,  I_, KO_,EOM_,EOM_,EOM_};	//06:「アイコ」
const u8 op_name7_msg[] = { MA_, KI_, KO_,EOM_,EOM_,EOM_};	//07:「マキコ」
const u8 op_name8_msg[] = { KI_,YYO_,  U_, KO_,EOM_,EOM_};	//08:「キョウコ」
#endif

const	u8	msg_odamaki_01_p02_opening_test1[]={
	PO_,KE_,TTU_,TO_,MO_,N_,SU_,TA_,bou_,
	CR_,
	tenten_,tenten_,su_,na_,wa_,ti_,spc_,PO_,KE_,MO_,N_,
	EOM_,
};
const	u8	msg_odamaki_01_p02_opening_test2[]={
	NORMAL_WAIT_,
	EOM_,
};

/*==================================================================*/
//zukandat.c
/*==================================================================*/
const	u8	Z_Datainfo1str[]	= {hate_,hate_,hate_,hate_,hate_,PO_,KE_,MO_,N_,EOM_};
const	u8	Z_Datainfo2str[]	= {hate_,hate_,hate_,ten_,hate_,m__,EOM_};
const	u8	Z_Datainfo3str[]	= {hate_,hate_,hate_,ten_,hate_,k__,g__,EOM_};

const	u8	Z_DataVoiceindexstr[] = {no_,EOM_};
const	u8	Z_DataVoiceindex2str[] = {na_,ki_,go_,e_,EOM_};

const	u8	Z_DataOokisaindex1str[] = {to_,EOM_};
const	u8	Z_DataOokisaindex2str[] = {no_,spc_,o_,o_,ki_,sa_,ku_,ra_,be_,EOM_};

const u8	ZukanSampleIndex[] = {
	PO_,KE_,MO_,N_,zu_,ka_,n_,no_,spc_,to_,u_,ro_,ku_,spc_,ka_,n_,ri_,yyo_,u_,gyoe_,EOM_,
};

/*==================================================================*/
//z_sort.c
/*==================================================================*/
const u8	ZsortSearchNowText[] = {
	ke_,n_,sa_,ku_,wo_,spc_,si_,te_,i_,ma_,su_,tenten_,tenten_,EOM_,
};
const u8	ZsortSearchOkText[] = {
	ke_,n_,sa_,ku_,ga_,spc_,si_,yyu_,u_,ri_,yyo_,u_,spc_,si_,ma_,si_,ta_,gyoe_,EOM_,
};
const u8	ZsortSearchNgText[] = {
	ga_,i_,to_,u_,spc_,su_,ru_,spc_,PO_,KE_,MO_,N_,ha_,spc_,i_,ma_,se_,n_,de_,si_,ta_,
	tenten_,tenten_,EOM_,
};

const u8	ZsortMenuText0[] = {
	zi_,yyo_,u_,ke_,n_,wo_,spc_,si_,te_,i_,si_,te_,
	CR_,
	PO_,KE_,MO_,N_,no_,spc_,ke_,n_,sa_,ku_,wo_,spc_,si_,ma_,su_,EOM_,
};
const u8	ZsortMenuText1[] = {
	zu_,ka_,n_,RI_,SU_,TO_,no_,spc_,na_,ra_,bi_,wo_,spc_,ki_,ri_,ka_,e_,ma_,su_,EOM_,
};
const u8	ZsortMenuText2[] = {
	zu_,ka_,n_,ni_,spc_,mo_,do_,ri_,ma_,su_,EOM_,
};
const u8	ZsortMenuText3[] = {
	zu_,ka_,n_,MO_,bou_,DO_,wo_,spc_,si_,te_,i_,spc_,si_,ma_,su_,EOM_,
};
const u8	ZsortMenuText4[] = {
	zu_,ka_,n_,no_,spc_,na_,ra_,bi_,wo_,spc_,si_,te_,i_,spc_,si_,ma_,su_,EOM_,
};
const u8	ZsortMenuText5[] = {
	na_,ma_,e_,no_,spc_,sa_,i_,si_,yyo_,no_,spc_,mo_,zi_,wo_,spc_,si_,te_,i_,spc_,si_,ma_,su_,
	CR_,
	spc_,sura_,mi_,tu_,ke_,ta_,PO_,KE_,MO_,N_,no_,mi_,
	EOM_,
};
const u8	ZsortMenuText6[] = {
	ka_,ra_,da_,no_,spc_,i_,ro_,wo_,spc_,si_,te_,i_,spc_,si_,ma_,su_,
	CR_,
	spc_,sura_,mi_,tu_,ke_,ta_,PO_,KE_,MO_,N_,no_,mi_,
	EOM_,
};
const u8	ZsortMenuText7[] = {
	TA_,I_,PU_,wo_,spc_,si_,te_,i_,spc_,si_,ma_,su_,
	CR_,
	spc_,sura_,tu_,ka_,ma_,e_,ta_,PO_,KE_,MO_,N_,no_,mi_,
	EOM_,
};
const u8	ZsortMenuText8[] = {
	ke_,n_,sa_,ku_,sura_,ki_,ri_,ka_,e_,wo_,spc_,zi_,ttu_,ko_,u_,si_,ma_,su_,EOM_,
};

const u8	ZsortList1_1[] = {HO_,U_,E_,N_,spc_,zu_,ka_,n_,EOM_};
const u8	ZsortList1_2[] = {ze_,n_,ko_,ku_,spc_,zu_,ka_,n_,EOM_};

const u8	ZsortList2_1[] = {ba_,n_,go_,u_,spc_,zi_,yyu_,n_,EOM_};
const u8	ZsortList2_2[] = {go_,zi_,yyu_,u_,o_,n_,spc_,zi_,yyu_,n_,EOM_};
const u8	ZsortList2_3[] = {o_,mo_,i_,spc_,zi_,yyu_,n_,EOM_};
const u8	ZsortList2_4[] = {ka_,ru_,i_,spc_,zi_,yyu_,n_,EOM_};
const u8	ZsortList2_5[] = {ta_,ka_,i_,spc_,zi_,yyu_,n_,EOM_};
const u8	ZsortList2_6[] = {hi_,ku_,i_,spc_,zi_,yyu_,n_,EOM_};

const u8	ZsortList3_1[] = { a_, i_, u_, e_, o_,EOM_};
const u8	ZsortList3_2[] = {ka_,ki_,ku_,ke_,ko_,EOM_}; 
const u8	ZsortList3_3[] = {sa_,si_,su_,se_,so_,EOM_}; 
const u8	ZsortList3_4[] = {ta_,ti_,tu_,te_,to_,EOM_}; 
const u8	ZsortList3_5[] = {na_,ni_,nu_,ne_,no_,EOM_}; 
const u8	ZsortList3_6[] = {ha_,hi_,hu_,he_,ho_,EOM_}; 
const u8	ZsortList3_7[] = {ma_,mi_,mu_,me_,mo_,EOM_}; 
const u8	ZsortList3_8[] = {ra_,ri_,ru_,re_,ro_,EOM_}; 
const u8	ZsortList3_9[] = {ya_,yu_,yo_,wa_,wo_,n_,EOM_}; 

const u8	ZsortList4_1[] = {a_,ka_,EOM_}; 
const u8	ZsortList4_2[] = {a_,o_,EOM_}; 
const u8	ZsortList4_3[] = {ki_,i_,ro_,EOM_}; 
const u8	ZsortList4_4[] = {mi_,do_,ri_,EOM_}; 
const u8	ZsortList4_5[] = {ku_,ro_,EOM_};
const u8	ZsortList4_6[] = {ti_,yya_,i_,ro_,EOM_}; 
const u8	ZsortList4_7[] = {mu_,ra_,sa_,ki_,EOM_}; 
const u8	ZsortList4_8[] = {ha_,i_,i_,ro_,EOM_}; 
const u8	ZsortList4_9[] = {si_,ro_,EOM_}; 
const u8	ZsortList4_10[]= {PI_,N_,KU_,EOM_}; 

const u8	ZsortList1_1text[] = {
HO_,U_,E_,N_,ti_,ho_,u_,spc_,ba_,n_,spc_,PO_,KE_,MO_,N_,zu_,ka_,n_,EOM_,
};
const u8	ZsortList1_2text[] = {
ze_,n_,ko_,ku_,spc_,ba_,n_,spc_,PO_,KE_,MO_,N_,zu_,ka_,n_,EOM_,
};

const u8	ZsortList2_1text[] = {
PO_,KE_,MO_,N_,wo_,
CR_,
ba_,n_,go_,u_,zi_,yyu_,n_,de_,spc_,hi_,yyo_,u_,zi_,spc_,si_,ma_,su_,EOM_
};
const u8	ZsortList2_2text[] = {
mi_,tu_,ke_,ta_,PO_,KE_,MO_,N_,no_,spc_,na_,ma_,e_,wo_,
CR_,
go_,zi_,yyu_,u_,o_,n_,zi_,yyu_,n_,de_,spc_,hi_,yyo_,u_,zi_,spc_,si_,ma_,su_,EOM_
};
const u8	ZsortList2_3text[] = {
tu_,ka_,ma_,e_,ta_,PO_,KE_,MO_,N_,wo_,
CR_,
o_,mo_,i_,spc_,zi_,yyu_,n_,ba_,n_,de_,spc_,hi_,yyo_,u_,zi_,spc_,si_,ma_,su_,EOM_
};
const u8	ZsortList2_4text[] = {
tu_,ka_,ma_,e_,ta_,PO_,KE_,MO_,N_,wo_,
CR_,
ka_,ru_,i_,spc_,zi_,yyu_,n_,ba_,n_,de_,spc_,hi_,yyo_,u_,zi_,spc_,si_,ma_,su_,EOM_
};
const u8	ZsortList2_5text[] = {
tu_,ka_,ma_,e_,ta_,PO_,KE_,MO_,N_,wo_,
CR_,
si_,n_,ti_,yyo_,u_,no_,
ta_,ka_,i_,spc_,zi_,yyu_,n_,ba_,n_,de_,spc_,hi_,yyo_,u_,zi_,spc_,si_,ma_,su_,EOM_
};
const u8	ZsortList2_6text[] = {
tu_,ka_,ma_,e_,ta_,PO_,KE_,MO_,N_,wo_,
CR_,
si_,n_,ti_,yyo_,u_,no_,
hi_,ku_,i_,spc_,zi_,yyu_,n_,ba_,n_,de_,spc_,hi_,yyo_,u_,zi_,spc_,si_,ma_,su_,EOM_
};

const u8	ZsortList_Notext[] = {EOM_};
const u8	ZsortList_Non[] = {si_,te_,i_,spc_,si_,na_,i_,EOM_};
const u8	ZsortList_Non2[] ={na_,si_,EOM_};

const u8	cursor_str[] ={cursor_,EOM_};
const u8	cursorcls_str[] ={spc_,EOM_};

/*==================================================================*/
//dendou.c
/*==================================================================*/
const u8	DendouCongraStr[] = {
	de_,n_,do_,u_,i_,ri_,spc_,o_,me_,de_,to_,u_,gyoe_,EOM_
};

const u8	DendouHyoukaStr[] = {
	mi_,tu_,ke_,ta_,spc_,PO_,KE_,MO_,N_,spc_,I_MSG_,STR_TEMP_BUF0,gyoe_,
	CR_,
	tu_,ka_,ma_,e_,ta_,spc_,PO_,KE_,MO_,N_,spc_,I_MSG_,STR_TEMP_BUF1,gyoe_,
	NORMAL_WAIT_,
	O_,DA_,MA_,KI_,ha_,ka_,se_,no_,
	CR_,
	PO_,KE_,MO_,N_,zu_,ka_,n_,spc_,hi_,yyo_,u_,ka_,gyoe_,
	NORMAL_WAIT_,
	O_,DA_,MA_,KI_,kako2_,do_,re_,do_,re_,
	NORMAL_WAIT_,EOM_,
};

const u8	DendouSaveStr[] = {
	ko_,ko_,ma_,de_,no_,spc_,RE_,PO_,bou_,TO_,wo_,spc_,ka_,ki_,si_,ru_,si_,te_,i_,ma_,su_,gyoe_,
	CR_,
	de_,n_,ge_,n_,wo_,spc_,ki_,ra_,na_,i_,de_,ku_,da_,sa_,i_,
	EOM_,
};

const u8	DendouErrorStr[] = {
	de_,n_,do_,u_,i_,ri_,no_,spc_,ki_,ro_,ku_,ga_,spc_,ko_,wa_,re_,te_,i_,ma_,su_,gyoe_,
	EOM_
};

const u8	DendouInfoStr[] = {
	da_,i_,spc_,spc_,spc_,ka_,i_,spc_,de_,n_,do_,u_,i_,ri_,gyoe_,EOM_,
	EOM_,
};

const u8	DendouMineCongraStr[] = {
	RI_,bou_,GU_,spc_,TI_,YYA_,N_,PI_,O_,N_,gyoe_,spc_,o_,me_,de_,to_,u_,gyoe_,EOM_,
	EOM_,
};

const u8	NumStr[] = {N__,o__,ten_,EOM_};
const u8	LVStr[] = {L__,v__,EOM_};
const u8	IDnoStr[] = {I__,D__,N__,o__,ten_,sura_,EOM_};
const u8	NameStr[] = {na_,ma_,e_,EOM_};
const u8	IDno2Str[] = {I__,D__,N__,o__,ten_,EOM_};

/*==================================================================*/
//opselect.c
/*==================================================================*/
const u8 opball_sel_msg[] = {
	CTRL_,C_BCOL_,15,CTRL_,C_FCOL_,1,O_,DA_,MA_,KI_,ha_,ka_,se_,ga_,spc_,PI_,N_,TI_,da_,gyoe_,CR_,
	PO_,KE_,MO_,N_,wo_,spc_,da_,si_,te_,spc_,ta_,su_,ke_,te_,a_,ge_,yo_,u_,gyoe_,EOM_
};
	
const u8 opball_yesno_msg[] = {
	CTRL_,C_BCOL_,15,CTRL_,C_FCOL_,1,ko_,no_,PO_,KE_,MO_,N_,ni_,si_,ma_,su_,ka_,hate_,EOM_
};

const u8	PokemonStr[] = {PO_,KE_,MO_,N_,EOM_};

/*==================================================================*/
//report.c
/*==================================================================*/
const	u8	save_fail2_msg[] = {
	RE_,PO_,bou_,TO_,ga_,spc_,ka_,ke_,ma_,se_,n_,de_,si_,ta_,
	NORMAL_WAIT_,
	BA_,TTU_,KU_,A_,TTU_,PU_,KA_,bou_,TO_,RI_,TTU_,ZI_,wo_,
	CR_,
	ko_,u_,ka_,n_,si_,te_,ku_,da_,sa_,i_,gyoe_,
	EOM_
};

/*==================================================================*/
//  flying.c
/*==================================================================*/
const u8 SoraWoTobu_Msg0[] = { do_, ko_, he_,spc_, to_, bi_, ma_, su_, ka_,hate_,EOM_, };  // どこへ　とびますか？


/*==================================================================*/
//	汎用的に使われると思われる文字列 bag.c pokelist.c p_status.c ...
/*==================================================================*/
const u8 str_tukau[]    = { tu_,ka_,u_,EOM_ };			// つかう
const u8 str_suteru[]   = { su_,te_,ru_,EOM_ };			// すてる
const u8 str_touroku[]  = { to_,u_,ro_,ku_,EOM_ };		// とうろく
const u8 str_motaseru[] = { mo_,ta_,se_,ru_,EOM_ };		// もたせる
const u8 str_tag[]      = { TA_,GU_,wo_,mi_,ru_,EOM_ };	// タグをみる
const u8 str_kettei[]   = { ke_,ttu_,te_,i_,EOM_ };		// けってい
const u8 str_oriru[]    = { o_,ri_,ru_,EOM_ };			// おりる
const u8 str_modoru[]   = { mo_,do_,ru_,EOM_ };			// もどる
const u8 str_yameru[]   = { ya_,me_,ru_,EOM_ };			// やめる
const u8 str_dummy[]    = { EOM_ };						// ダミー
const u8 str_cancel[]   = { KI_,YYA_,N_,SE_,RU_,EOM_ };	// キャンセル
const u8 str_motimono[] = { mo_,ti_,mo_,no_,EOM_ };		// もちもの
const u8 str_mail[]	    = { ME_,bou_,RU_,EOM_ };		// メール
const u8 str_azukaru[]  = { a_,zu_,ka_,ru_,EOM_ };		// あずかる
const u8 str_azukeru[]  = { a_,zu_,ke_,ru_,EOM_ };		// あずける
const u8 str_miru[]     = { mi_,ru_,EOM_ };				// みる
const u8 str_nasi[]     = { na_,si_,EOM_ };				// なし

const u8 str_hate3[] = { hate_,hate_,hate_,EOM_ };				// ???
const u8 str_hate5[] = { hate_,hate_,hate_,hate_,hate_,EOM_ };	// ?????

const u8 str_surassyu[] = { sura_,EOM_ };						// '/'
const u8 str_bou1[]     = { bou_,EOM_ };						// '-'
const u8 str_bou2[]     = { bou_,bou_,EOM_ };					// '--'
const u8 str_bou3[]     = { bou_,bou_,bou_,EOM_ };				// '---'
const u8 str_osu[]      = { osu_,EOM_ };						// ♂
const u8 str_mesu[]     = { mesu_,EOM_ };						// ♀
const u8 str_Lv[]       = { L__,v__,EOM_ };						// Lv
const u8 str_plus[]     = { CTRL_,C_EXFONT_,Plus__,EOM_ };		// '+'
const u8 str_arrow_r[]  = { CTRL_,C_EXFONT_,ArrowR__,EOM_ };	// '→'

// まえに　もどります！
const u8 msg_menu_return[] = {
	ma_,e_,ni_,spc_,mo_,do_,ri_,ma_,su_,gyoe_,EOM_
};
// なにを　しますか？
const u8 msg_menu_nanisuru[] = { na_,ni_,wo_,spc_,si_,ma_,su_,ka_,hate_,EOM_ };


/*==================================================================*/
//	バッグ / アイテム関連
/*==================================================================*/
const u8 str_batu[] = { batu_,I_MSG_,STR_TEMP_BUF0,EOM_ };		// x ???
const u8 str_XXnomi[] = { no_,mi_,EOM_ };						// のみ（木の実）
const u8 str_coin_mai[] = { I_MSG_,STR_TEMP_BUF0,ma_,i_,EOM_ };	// @0まい

const u8 str_bag_toziru[] = { BA_,TTU_,GU_,wo_,to_,zi_,ru_,EOM_ };	// バッグをとじる

// "バッグをとじる"のメッセージ
const u8 msg_bag_close00[][9] =
{
	{ HU_,II_,bou_,RU_,DO_,he_,EOM_,EOM_,EOM_ },	// フィールド
	{ se_,n_,to_,u_,he_,EOM_,EOM_,EOM_,EOM_ },		// 戦闘
	{ PO_,KE_,MO_,N_,RI_,SU_,TO_,he_,EOM_ },		// ポケモンリスト
	{ SI_,YYO_,TTU_,PU_,he_,EOM_,EOM_,EOM_,EOM_ },	// ショップ
	{ HU_,II_,bou_,RU_,DO_,he_,EOM_,EOM_,EOM_ },	// タネ
	{ HU_,II_,bou_,RU_,DO_,he_,EOM_,EOM_,EOM_ },	// ブレンドマシーン
	{ PA_,SO_,KO_,N_,he_,EOM_,EOM_,EOM_,EOM_ },		// 道具あずかり
};
const u8 msg_bag_close01[] = { mo_,do_,ri_,ma_,su_,EOM_ };	// もどります

// どうしますか？
const u8 msg_bag_dousuru[] = { do_,u_,si_,ma_,su_,ka_,hate_,EOM_ };

// ここで　メールを　かくことは　できません！
const u8 msg_bag_sio_meil[] = {
	ko_,ko_,de_,spc_,ME_,bou_,RU_,wo_,CR_,
	ka_,ku_,ko_,to_,ha_,spc_,de_,ki_,ma_,se_,n_,gyoe_,EOM_
};

// ポケモンが　いませんよ！
const u8 msg_poke_mine_zero[] = { PO_,KE_,MO_,N_,ga_,spc_,i_,ma_,se_,n_,yo_,gyoe_,CTRL_,C_TRGWAIT_,EOM_ };

// どれと　いれかえますか？
const u8 msg_item_move[] = { do_,re_,to_,CR_,i_,re_,ka_,e_,spc_,ma_,su_,ka_,hate_,EOM_ };

// @0　を　もたせることは　できません！
const u8 msg_item_motenai[] = {
	I_MSG_,STR_TEMP_BUF0,spc_,wo_,CR_,
	mo_,ta_,se_,ru_,ko_,to_,ha_,spc_,de_,ki_,ma_,se_,n_,gyoe_,EOM_
};
// ここでは　@0　を　もたせることは　できません！
const u8 msg_item_motenai02[] = {
	ko_,ko_,de_,ha_,spc_,I_MSG_,STR_TEMP_BUF0,spc_,wo_,CR_,
	mo_,ta_,se_,ru_,ko_,to_,ha_,spc_,de_,ki_,ma_,se_,n_,gyoe_,EOM_
};

// いくつあずけますか？
const u8 msg_item_box_put00[] = { i_,ku_,tu_,spc_,a_,zu_,ke_,ma_,su_,ka_,hate_,EOM_ };
// @0を　@1コ　あずけました
const u8 msg_item_box_put01[] = {
	I_MSG_,STR_TEMP_BUF0,spc_,wo_,CR_,
	I_MSG_,STR_TEMP_BUF1,KO_,spc_,a_,zu_,ke_,ma_,si_,ta_,EOM_
};
// これいじょう　あずけられません！
const u8 msg_item_box_put02[] = {
	ko_,re_,i_,zi_,yyo_,u_,CR_,
	a_,zu_,ke_,ra_,re_,ma_,se_,n_,gyoe_,EOM_
};
// パソコンに　ひとから　あずかった　ものは　いれられません！
const u8 msg_item_box_put03[] = {
	PA_,SO_,KO_,N_,ni_,spc_,CR_,
	hi_,to_,ka_,ra_,spc_,a_,zu_,ka_,ttu_,ta_,CR_,
	mo_,no_,ha_,spc_,i_,re_,ra_,re_,ma_,se_,n_,gyoe_,EOM_
};

// これは　とても　たいせつなモノ　なので　すてられません！
const u8 msg_item_no_del[] = {
	ko_,re_,ha_,spc_,to_,te_,mo_,CR_,
	ta_,i_,se_,tu_,na_,MO_,NO_,spc_,na_,no_,de_,CR_,
	su_,te_,ra_,re_,ma_,se_,n_,gyoe_,EOM_
};
// いくつ　すてますか？
const u8 msg_item_del01[] = { i_,ku_,tu_,spc_,su_,te_,ma_,su_,ka_,hate_,EOM_ };
// @0　を　@1コ　すてました
const u8 msg_item_del02[] = {
	I_MSG_,STR_TEMP_BUF0,spc_,wo_,CR_,
	I_MSG_,STR_TEMP_BUF1,KO_,spc_,su_,te_,ma_,si_,ta_,EOM_
};
// @0　を　@1コ　すてても　よろしいですか？
const u8 msg_item_del03[] = {
	I_MSG_,STR_TEMP_BUF0,spc_,wo_,CR_,
	I_MSG_,STR_TEMP_BUF1,KO_,spc_,su_,te_,te_,mo_,CR_,
	yo_,ro_,si_,i_,de_,su_,ka_,hate_,EOM_
};

// おとうさんの　ことば……　＃！　こういうものには　つかいどきが　あるんだ！
const u8 msg_item_use_error[] = {
	o_,to_,u_,sa_,n_,no_,spc_,ko_,to_,ba_,tenten_,tenten_,CR_,
	I_MSG_,MY_NAME_BUF,gyoe_,spc_,ko_,u_,i_,u_,mo_,no_,ni_,ha_,SCROLL_WAIT_,
	tu_,ka_,i_,do_,ki_,ga_,spc_,a_,ru_,n_,da_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};
// ここでは　おりられない！
const u8 msg_cycling_road_error[] = {
	ko_,ko_,de_,ha_,spc_,o_,ri_,ra_,re_,na_,i_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};

// おっ！　マシンが　はんのう　しているぞ！　ちかくに　どうぐが　うまってる！
const u8 msg_dgm_hit[] = {
	o_,ttu_,gyoe_,CR_,
	MA_,SI_,N_,ga_,spc_,ha_,n_,no_,u_,spc_,si_,te_,i_,ru_,zo_,gyoe_,NORMAL_WAIT_,
	ti_,ka_,ku_,ni_,spc_,do_,u_,gu_,ga_,spc_,u_,ma_,ttu_,te_,ru_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};
// マシンが　あしもとで　すごく　はんのう　しているぞ！
const u8 msg_dgm_hit_point[] = {
	MA_,SI_,N_,ga_,spc_,a_,si_,mo_,to_,de_,CR_,
	su_,go_,ku_,spc_,ha_,n_,no_,u_,spc_,si_,te_,i_,ru_,zo_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};
// ……　……　ふう！　……　……　なんにも　はんのう　しない
const u8 msg_dgm_not[] = {
	tenten_,tenten_,spc_,tenten_,tenten_,spc_,hu_,u_,gyoe_,CR_,
	tenten_,tenten_,spc_,na_,n_,ni_,mo_,spc_,ha_,n_,no_,u_,spc_,si_,na_,i_,CTRL_,C_TRGWAIT_,EOM_
};

// あなたの　コイン　@0まい
const u8 msg_coincase[] = {
	a_,na_,ta_,no_,spc_,KO_,I_,N_,CR_,
	I_MSG_,STR_TEMP_BUF0,ma_,i_,CTRL_,C_TRGWAIT_,EOM_
};

// わざマシンを　きどうした！
const u8 msg_waza_machine00[] = { wa_,za_,MA_,SI_,N_,wo_,spc_,ki_,do_,u_,si_,ta_,gyoe_,EOM_ };
// ひでんマシンを　きどうした！
const u8 msg_waza_machine01[] = { hi_,de_,n_,MA_,SI_,N_,wo_,spc_,ki_,do_,u_,si_,ta_,gyoe_,EOM_ };
// なかには　@0が　きろくされていた！　@0を　ポケモンに　おぼえさせますか？
const u8 msg_waza_machine02[] = {
	na_,ka_,ni_,ha_,spc_,I_MSG_,STR_TEMP_BUF0,ga_,CR_,
	ki_,ro_,ku_,sa_,re_,te_,i_,ta_,gyoe_,NORMAL_WAIT_,
	I_MSG_,STR_TEMP_BUF0,wo_,CR_,
	PO_,KE_,MO_,N_,ni_,spc_,o_,bo_,e_,sa_,se_,ma_,su_,ka_,hate_,EOM_
};

// ＃は　@1を　つかった！
const u8 msg_item_use[] = {
	I_MSG_,MY_NAME_BUF,ha_,CR_,
	I_MSG_,STR_TEMP_BUF1,wo_,spc_,tu_,ka_,ttu_,ta_,gyoe_,CTRL_,C_TRGWAIT_,EOM_,
};
// まだ　まえに　つかった　スプレーの　こうかが　のこってます！
const u8 msg_spray_error[] = {
	ma_,da_,spc_,ma_,e_,ni_,spc_,tu_,ka_,ttu_,ta_,spc_,SU_,PU_,RE_,bou_,no_,CR_,
	ko_,u_,ka_,ga_,spc_,no_,ko_,ttu_,te_,ma_,su_,gyoe_,CTRL_,C_TRGWAIT_,EOM_,
};

// ＃は　@1を　つかった！　ポケモンと　そうぐう　しやすくなった！
const u8 msg_w_vidro[] = {
	I_MSG_,MY_NAME_BUF,ha_,CR_,
	I_MSG_,STR_TEMP_BUF1,wo_,spc_,tu_,ka_,ttu_,ta_,gyoe_,NORMAL_WAIT_,
	PO_,KE_,MO_,N_,to_,CR_,
	so_,u_,gu_,u_,spc_,si_,ya_,su_,ku_,na_,ttu_,ta_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};
// ＃は　@1を　つかった！　ポケモンと　そうぐう　しにくくなった！
const u8 msg_b_vidro[] = {
	I_MSG_,MY_NAME_BUF,ha_,CR_,
	I_MSG_,STR_TEMP_BUF1,wo_,spc_,tu_,ka_,ttu_,ta_,gyoe_,NORMAL_WAIT_,
	PO_,KE_,MO_,N_,to_,CR_,
	so_,u_,gu_,u_,spc_,si_,ni_,ku_,ku_,na_,ttu_,ta_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};

// ボックスが　いっぱい　です！
const u8 msg_pc_mons_box_max[] = {
	BO_,TTU_,KU_,SU_,ga_,spc_,i_,ttu_,pa_,i_,spc_,de_,su_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};


/*==================================================================*/
//	タグ画面関連
/*==================================================================*/
const u8 str_tag_size[]  = { o_,o_,ki_,sa_,EOM_ };	// おおきさ
const u8 str_tag_hard[]  = { ka_,ta_,sa_,EOM_ };	// かたさ
// ??.??cm
const u8 str_tag_dot[] = { I_MSG_,STR_TEMP_BUF0,ten_,I_MSG_,STR_TEMP_BUF1,c__,m__,EOM_ };

const u8 str_seed_hard01[] = { to_,te_,mo_,spc_,ya_,wa_,ra_,ka_,i_,EOM_ };		// とても　やわらかい
const u8 str_seed_hard02[] = { ya_,wa_,ra_,ka_,i_,EOM_ };						// やわらかい
const u8 str_seed_hard03[] = { ka_,ta_,i_,EOM_ };								// かたい
const u8 str_seed_hard04[] = { to_,te_,mo_,spc_,ka_,ta_,i_,EOM_ };				// とても　かたい
const u8 str_seed_hard05[] = { to_,te_,tu_,mo_,na_,ku_,spc_,ka_,ta_,i_,EOM_ };	// とてつもなく　かたい


/*==================================================================*/
//	ポロックケース関連
/*==================================================================*/
const u8 cube_name01[] = { a_,ka_,i_,PO_,RO_,TTU_,KU_,EOM_ };		// あかいポロック
const u8 cube_name02[] = { a_,o_,i_,PO_,RO_,TTU_,KU_,EOM_ };		// あおいポロック
const u8 cube_name03[] = { mo_,mo_,i_,ro_,PO_,RO_,TTU_,KU_,EOM_ };	// ももいろポロック
const u8 cube_name04[] = { mi_,do_,ri_,no_,PO_,RO_,TTU_,KU_,EOM_ };	// みどりのポロック
const u8 cube_name05[] = { ki_,i_,ro_,no_,PO_,RO_,TTU_,KU_,EOM_ };	// きいろのポロック
const u8 cube_name06[] = { mu_,ra_,sa_,ki_,PO_,RO_,TTU_,KU_,EOM_ };	// むらさきポロック
const u8 cube_name07[] = { ko_,n_,i_,ro_,PO_,RO_,TTU_,KU_,EOM_ };	// こんいろポロック
const u8 cube_name08[] = { ti_,yya_,i_,ro_,PO_,RO_,TTU_,KU_,EOM_ };	// ちゃいろポロック
const u8 cube_name09[] = { so_,ra_,i_,ro_,PO_,RO_,TTU_,KU_,EOM_ };	// そらいろポロック
const u8 cube_name10[] = { ki_,mi_,do_,ri_,PO_,RO_,TTU_,KU_,EOM_ };	// きみどりポロック
const u8 cube_name11[] = { ha_,i_,i_,ro_,PO_,RO_,TTU_,KU_,EOM_ };	// はいいろポロック
const u8 cube_name12[] = { ku_,ro_,i_,PO_,RO_,TTU_,KU_,EOM_ };		// くろいポロック
const u8 cube_name13[] = { si_,ro_,i_,PO_,RO_,TTU_,KU_,EOM_ };		// しろいポロック
const u8 cube_name14[] = { ki_,n_,i_,ro_,PO_,RO_,TTU_,KU_,EOM_ };	// きんいろポロック

const u8 str_cube_parm00[] = { ka_,ra_,i_,EOM_ };		// からい
const u8 str_cube_parm01[] = { si_,bu_,i_,EOM_ };		// しぶい
const u8 str_cube_parm02[] = { a_,ma_,i_,EOM_ };		// あまい
const u8 str_cube_parm03[] = { ni_,ga_,i_,EOM_ };		// にがい
const u8 str_cube_parm04[] = { su_,ttu_,pa_,i_,EOM_ };	// すっぱい
const u8 str_cube_parm05[] = { u_,ma_,i_,EOM_ };		// うまい
const u8 str_cube_parm06[] = { ko_,ma_,ka_,sa_,EOM_ };	// こまかさ

const u8 str_case_toziru[] = { KE_,bou_,SU_,wo_,si_,ma_,u_,EOM_ };	// ケースをしまう

// @0を　すてても　よろしいですか？
const u8 msg_cube_del00[] = {
	I_MSG_,STR_TEMP_BUF0,wo_,CR_,
	su_,te_,te_,mo_,spc_,yo_,ro_,si_,i_,de_,su_,ka_,hate_,EOM_
};
// @0を　すてました
const u8 msg_cube_del01[] = {
	I_MSG_,STR_TEMP_BUF0,wo_,CR_,
	su_,te_,ma_,si_,ta_,EOM_
};


/*==================================================================*/
//	ポロックを食べるデモ　polock_d.c
/*==================================================================*/
// @0は　@1を　たべた！
const u8 msg_polock_eat_demo00[] = {
	I_MSG_,STR_TEMP_BUF0,ha_,spc_,I_MSG_,STR_TEMP_BUF1,wo_,CR_,
	ta_,be_,ta_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};
// @0は　@1を　よろこんで　たべた！
const u8 msg_polock_eat_demo01[] = {
	I_MSG_,STR_TEMP_BUF0,ha_,spc_,I_MSG_,STR_TEMP_BUF1,wo_,CR_,
	yo_,ro_,ko_,n_,de_,spc_,ta_,be_,ta_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};
// @0は　@1を　いやそうに　たべた！
const u8 msg_polock_eat_demo02[] = {
	I_MSG_,STR_TEMP_BUF0,ha_,spc_,I_MSG_,STR_TEMP_BUF1,wo_,CR_,
	i_,ya_,so_,u_,ni_,spc_,ta_,be_,ta_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};


/*==================================================================*/
//	ショップ関連
/*==================================================================*/
const u8 str_shop_kau[]     = { ka_,i_,ni_,spc_,ki_,ta_,EOM_ };			// かいに　きた
const u8 str_shop_uru[]     = { u_,ri_,ni_,spc_,ki_,ta_,EOM_ };			// うりに　きた
const u8 str_shop_nandemo[] = { na_,n_,de_,mo_,na_,i_,de_,su_,EOM_ };	// なんでもないです

// かいものを　やめます
const u8 msg_shop_buy_end[] = { ka_,i_,mo_,no_,spc_,wo_,spc_,ya_,me_,ma_,su_,EOM_ };

// @0　を　いくつ　おかいあげに　なりますか？
const u8 msg_shop_buy00[] = {
	I_MSG_,STR_TEMP_BUF0,spc_,wo_,CR_,
	i_,ku_,tu_,spc_,o_,ka_,i_,a_,ge_,ni_,spc_,na_,ri_,ma_,su_,ka_,hate_,EOM_
};
// @0を　@1コで　@2円　おかいあげですか？
const u8 msg_shop_buy01[] = {
	I_MSG_,STR_TEMP_BUF0,wo_,spc_,I_MSG_,STR_TEMP_BUF1,KO_,de_,CR_,
	I_MSG_,STR_TEMP_BUF2,yen_,spc_,o_,ka_,i_,a_,ge_,de_,su_,ka_,hate_,EOM_
};
// @0　だね！　@1円だけど　かうかい？
const u8 msg_shop_buy02[] = {
	I_MSG_,STR_TEMP_BUF0,spc_,da_,ne_,gyoe_,CR_,
	I_MSG_,STR_TEMP_BUF1,yen_,spc_,da_,ke_,do_,spc_,ka_,u_,ka_,i_,hate_,EOM_
};
// @0　ですね！　@1円だけど　かいますか？
const u8 msg_shop_buy52[] = {
	I_MSG_,STR_TEMP_BUF0,spc_,de_,su_,ne_,gyoe_,CR_,
	I_MSG_,STR_TEMP_BUF1,yen_,spc_,da_,ke_,do_,spc_,ka_,i_,ma_,su_,ka_,hate_,EOM_
};
// はい　まいど！　ありがとう　ございます
const u8 msg_shop_buy03[] = {
	ha_,i_,spc_,ma_,i_,do_,gyoe_,CR_,a_,ri_,ga_,to_,u_,spc_,go_,za_,i_,ma_,su_,EOM_
};
// どうも　ありがとう！　じたくの　パソコンに　おくって　おきますね！
const u8 msg_shop_buy04[] = {
	do_,u_,mo_,spc_,a_,ri_,ga_,to_,u_,gyoe_,CR_,
	zi_,ta_,ku_,no_,spc_,PA_,SO_,KO_,N_,ni_,spc_,o_,ku_,ttu_,te_,spc_,o_,ki_,ma_,su_,ne_,gyoe_,EOM_
};
// どうも　ありがとう！　じたくの　パソコンに　おくって　おくね！
const u8 msg_shop_buy54[] = {
	do_,u_,mo_,spc_,a_,ri_,ga_,to_,u_,gyoe_,CR_,
	zi_,ta_,ku_,no_,spc_,PA_,SO_,KO_,N_,ni_,spc_,o_,ku_,ttu_,te_,spc_,o_,ku_,ne_,gyoe_,EOM_
};
// おかねが　たりないですよ！
const u8 msg_shop_buy05[] = {
	o_,ka_,ne_,ga_,spc_,ta_,ri_,na_,i_,de_,su_,yo_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};
// それ　いじょう　もちきれない　ですよ！
const u8 msg_shop_buy06[] = {
	so_,re_,spc_,i_,zi_,yyo_,u_,CR_,
	mo_,ti_,ki_,re_,na_,i_,spc_,de_,su_,yo_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};
// @0　を　いれる　ばしょが　いっぱいです
const u8 msg_shop_buy07[] = {
	I_MSG_,STR_TEMP_BUF0,spc_,wo_,CR_,
	i_,re_,ru_,spc_,ba_,si_,yyo_,ga_,spc_,i_,ttu_,pa_,i_,de_,su_,CTRL_,C_TRGWAIT_,EOM_
};
// そのほかに　わたしどもで　なにか　おちからに　なれることは？
const u8 msg_shop_buy08[] = {
	so_,no_,spc_,ho_,ka_,ni_,spc_,wa_,ta_,si_,do_,mo_,de_,CR_,
	na_,ni_,ka_,spc_,o_,ti_,ka_,ra_,ni_,spc_,na_,re_,ru_,ko_,to_,ha_,hate_,EOM_
};
// そのほかに　なにか　ちからに　なれることは？
const u8 msg_shop_buy58[] = {
	so_,no_,spc_,ho_,ka_,ni_,CR_,
	na_,ni_,ka_,spc_,ti_,ka_,ra_,ni_,spc_,na_,re_,ru_,ko_,to_,ha_,hate_,EOM_
};
// プレミアボール　１コ　おまけ　しておきますね！
const u8 msg_shop_buy09[] = {
	PU_,RE_,MI_,A_,BO_,bou_,RU_,spc_,n1_,KO_,CR_,
	o_,ma_,ke_,spc_,si_,te_,o_,ki_,ma_,su_,ne_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};

// @1　を　かいとるわけには　いきません！
const u8 msg_shop_sell00[] = {
	I_MSG_,STR_TEMP_BUF1,spc_,wo_,CR_,
	ka_,i_,to_,ru_,wa_,ke_,ni_,ha_,spc_,i_,ki_,ma_,se_,n_,gyoe_,CTRL_,C_TRGWAIT_,EOM_,
};
// @1　を　いくつ　うりますか？
const u8 msg_shop_sell01[] = {
	I_MSG_,STR_TEMP_BUF1,spc_,wo_,CR_,i_,ku_,tu_,spc_,u_,ri_,ma_,su_,ka_,hate_,EOM_
};

// @0円　で　ひきとらせて　いただきます　よろしいですか？
const u8 msg_shop_sell02[] = {
	I_MSG_,STR_TEMP_BUF0,yen_,spc_,de_,spc_,hi_,ki_,to_,ra_,se_,te_,spc_,i_,ta_,da_,ki_,ma_,su_,CR_,
	yo_,ro_,si_,i_,de_,su_,ka_,hate_,EOM_,
};
// @1を　わたして　@0円　うけとった！
const u8 msg_shop_sell03[] = {
	I_MSG_,STR_TEMP_BUF1,spc_,wo_,spc_,wa_,ta_,si_,te_,CR_,
	I_MSG_,STR_TEMP_BUF0,yen_,spc_,u_,ke_,to_,ttu_,ta_,gyoe_,EOM_
};

// @0円
const u8 str_yen[] = { I_MSG_,STR_TEMP_BUF0,yen_,EOM_ };


/*==================================================================*/
//	ポケモンリスト関連
/*==================================================================*/
const u8 pl_str_irekaeru[]  = { i_,re_,ka_,e_,ru_,EOM_ };				// いれかえる
const u8 pl_str_sentou[]    = { se_,n_,to_,u_,ni_,da_,su_,EOM_ };		// せんとうにだす
const u8 pl_str_narabikae[] = { na_,ra_,bi_,ka_,e_,EOM_ };				// ならびかえ
const u8 pl_str_tuyosa[]    = { tu_,yo_,sa_,wo_,mi_,ru_,EOM_ };			// つよさをみる
const u8 pl_str_waza[]      = { tu_,ka_,e_,ru_,wa_,za_,EOM_ };			// つかえるわざ
const u8 pl_str_sanka[]     = { sa_,n_,ka_,su_,ru_,EOM_ };				// さんかする
const u8 pl_str_sinai[]     = { sa_,n_,ka_,si_,na_,i_,EOM_ };			// さんかしない
const u8 pl_str_mail_get[]  = { ME_,bou_,RU_,wo_,spc_,to_,ru_,EOM_ };	// メールをとる
const u8 pl_str_mail_read[] = { ME_,bou_,RU_,wo_,spc_,yo_,mu_,EOM_ };	// メールを読む

const u8 str_tairyoku[]       = { ta_,i_,ri_,yyo_,ku_,EOM_ };	// たいりょく
const u8 str_tokusyukougeki[] = { to_,ku_,ko_,u_,EOM_ };		// とくこう
const u8 str_tokusyubougyo[]  = { to_,ku_,bo_,u_,EOM_ };		// とくぼう

// つかっても　こうかがないよ
const u8 msg_poke_use_error00[] = {
	tu_,ka_,ttu_,te_,mo_,spc_,ko_,u_,ka_,ga_,na_,i_,yo_,CTRL_,C_TRGWAIT_,EOM_
};

// そのポケモンには　つかえません
const u8 msg_poke_use_error01[] = {
	so_,no_,PO_,KE_,MO_,N_,ni_,ha_,CR_,
	tu_,ka_,e_,ma_,se_,n_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};

// @0を　もどすことが　できない！
const u8 msg_poke_chg_error00[] = {
	I_MSG_,STR_TEMP_BUF0,wo_,spc_,mo_,do_,su_,ko_,to_,ga_,CR_,
	de_,ki_,na_,i_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};
// @0は　すでに　せんとうに　でています
const u8 msg_poke_chg_error01[] = {
	I_MSG_,STR_TEMP_BUF0,ha_,spc_,su_,de_,ni_,CR_,
	se_,n_,to_,u_,ni_,spc_,de_,te_,i_,ma_,su_,CTRL_,C_TRGWAIT_,EOM_
};
// @0は　すでに　せんたく　されています
const u8 msg_poke_chg_error02[] = {
	I_MSG_,STR_TEMP_BUF0,ha_,spc_,su_,de_,ni_,CR_,
	se_,n_,ta_,ku_,spc_,sa_,re_,te_,i_,ma_,su_,CTRL_,C_TRGWAIT_,EOM_
};
// @0は　たたかうための　げんきが　のこっていません！
const u8 msg_poke_chg_error03[] = {
	I_MSG_,STR_TEMP_BUF0,ha_,spc_,ta_,ta_,ka_,u_,ta_,me_,no_,CR_,
	ge_,n_,ki_,ga_,spc_,no_,ko_,ttu_,te_,i_,ma_,se_,n_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};
// @0の　ポケモンは　じぶんの　ポケモンと　いれかえることは　できません！
const u8 msg_poke_chg_error04[] = {
	I_MSG_,STR_TEMP_BUF0,no_,spc_,PO_,KE_,MO_,N_,ha_,spc_,zi_,bu_,n_,no_,CR_,
	PO_,KE_,MO_,N_,to_,spc_,i_,re_,ka_,e_,ru_,ko_,to_,ha_,spc_,de_,ki_,ma_,se_,n_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};
// タマゴを　せんとうに　だすことは　できません！
const u8 msg_poke_chg_error05[] = {
	TA_,MA_,GO_,wo_,CR_,
	se_,n_,to_,u_,ni_,spc_,da_,su_,ko_,to_,ha_,spc_,de_,ki_,ma_,se_,n_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};

// あたらしい　バッジを　てにするまで　まだ　つかえません
const u8 msg_poke_no_badge[] = {
	a_,ta_,ra_,si_,i_,spc_,BA_,TTU_,ZI_,wo_,spc_,te_,ni_,su_,ru_,ma_,de_,CR_,
	ma_,da_,spc_,tu_,ka_,e_,ma_,se_,n_,EOM_
};

// さんか　できる　ポケモンは　３びき　まで　です！
const u8 msg_poke_in_over[] = {
	sa_,n_,ka_,spc_,de_,ki_,ru_,spc_,PO_,KE_,MO_,N_,ha_,CR_,
	n3_,bi_,ki_,spc_,ma_,de_,spc_,de_,su_,gyoe_,EOM_
};

// とった　メールを　パソコンに　てんそうしますか？
const u8 msg_poke_pc_tensou00[] = {
	to_,ttu_,ta_,spc_,ME_,bou_,RU_,wo_,spc_,PA_,SO_,KO_,N_,ni_,CR_,
	te_,n_,so_,u_,si_,ma_,su_,ka_,hate_,EOM_
};
// メールを　パソコンに　てんそうしました
const u8 msg_poke_pc_tensou01[] = {
	ME_,bou_,RU_,wo_,spc_,PA_,SO_,KO_,N_,ni_,CR_,
	te_,n_,so_,u_,si_,ma_,si_,ta_,CTRL_,C_TRGWAIT_,EOM_,
};
// パソコンの　メールボックスが　いっぱいです！
const u8 msg_poke_pc_tensou02[] = {
	PA_,SO_,KO_,N_,no_,spc_,ME_,bou_,RU_,BO_,TTU_,KU_,SU_,ga_,CR_,
	i_,ttu_,pa_,i_,de_,su_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};
// メールを　とると　メッセージが　きえてしまいますが　よろしいですか？
const u8 msg_poke_pc_tensou03[] = {
	ME_,bou_,RU_,wo_,spc_,to_,ru_,to_,spc_,ME_,TTU_,SE_,bou_,ZI_,ga_,CR_,
	ki_,e_,te_,si_,ma_,i_,ma_,su_,ga_,spc_,yo_,ro_,si_,i_,de_,su_,ka_,hate_,EOM_,
};

// メールを　はずさないと　どうぐは　もてません！
const u8 msg_poke_item00[] = {
	ME_,bou_,RU_,wo_,spc_,ha_,zu_,sa_,na_,i_,to_,CR_,
	do_,u_,gu_,ha_,spc_,mo_,te_,ma_,se_,n_,gyoe_,CTRL_,C_TRGWAIT_,EOM_,
};
// @0に　@1を　もたせた！
const u8 msg_poke_item01[] = {
	I_MSG_,STR_TEMP_BUF0,ni_,CR_,
	I_MSG_,STR_TEMP_BUF1,wo_,spc_,mo_,ta_,se_,ta_,gyoe_,CTRL_,C_TRGWAIT_,EOM_,
};
// @0は　すでに　@1を　もっています　もっている　どうぐを　とりかえますか？
const u8 msg_poke_item02[] = {
	I_MSG_,STR_TEMP_BUF0,ha_,spc_,su_,de_,ni_,CR_,
	I_MSG_,STR_TEMP_BUF1,wo_,spc_,mo_,ttu_,te_,i_,ma_,su_,NORMAL_WAIT_,
	mo_,ttu_,te_,i_,ru_,spc_,do_,u_,gu_,wo_,CR_,
	to_,ri_,ka_,e_,ma_,su_,ka_,hate_,EOM_,
};
// @0は　なにも　どうぐを　もって　いません！
const u8 msg_poke_item03[] = {
	I_MSG_,STR_TEMP_BUF0,ha_,spc_,na_,ni_,mo_,CR_,
	do_,u_,gu_,wo_,spc_,mo_,ttu_,te_,spc_,i_,ma_,se_,n_,gyoe_,CTRL_,C_TRGWAIT_,EOM_,
};
// @0から　@1を　あずかりました！
const u8 msg_poke_item04[] = {
	I_MSG_,STR_TEMP_BUF0,ka_,ra_,CR_,
	I_MSG_,STR_TEMP_BUF1,wo_,spc_,a_,zu_,ka_,ri_,ma_,si_,ta_,gyoe_,CTRL_,C_TRGWAIT_,EOM_,
};
// ポケモンから　メールを　とりました！
const u8 msg_poke_item05[] = {
	PO_,KE_,MO_,N_,ka_,ra_,spc_,ME_,bou_,RU_,wo_,CR_,
	to_,ri_,ma_,si_,ta_,gyoe_,CTRL_,C_TRGWAIT_,EOM_,
};
// @1を　あずかって　あらたに　@0を　もたせました！
const u8 msg_poke_item06[] = {
	I_MSG_,STR_TEMP_BUF1,wo_,spc_,a_,zu_,ka_,ttu_,te_,CR_,
	a_,ra_,ta_,ni_,spc_,I_MSG_,STR_TEMP_BUF0,wo_,spc_,mo_,ta_,se_,ma_,si_,ta_,gyoe_,CTRL_,C_TRGWAIT_,EOM_,
};
// すでに　どうぐを　もっているので　メールを　もたせることが　できません
const u8 msg_poke_item07[] = {
	su_,de_,ni_,spc_,do_,u_,gu_,wo_,spc_,mo_,ttu_,te_,i_,ru_,no_,de_,CR_,
	ME_,bou_,RU_,wo_,spc_,mo_,ta_,se_,ru_,ko_,to_,ga_,spc_,de_,ki_,ma_,se_,n_,CTRL_,C_TRGWAIT_,EOM_,
};
// ボックスから　メールを　うつしました
const u8 msg_poke_item08[] = {
	BO_,TTU_,KU_,SU_,ka_,ra_,spc_,ME_,bou_,RU_,wo_,spc_,u_,tu_,si_,ma_,si_,ta_,CTRL_,C_TRGWAIT_,EOM_,
};
// バッグが　いっぱいで　ポケモンの　どうぐを　うけとれません！
const u8 msg_poke_item09[] = {
	BA_,TTU_,GU_,ga_,spc_,i_,ttu_,pa_,i_,de_,CR_,
	PO_,KE_,MO_,N_,no_,spc_,do_,u_,gu_,wo_,spc_,u_,ke_,to_,re_,ma_,se_,n_,gyoe_,CTRL_,C_TRGWAIT_,EOM_,
};

// @0は　あたらしく　@1を　おぼえた！
const u8 msg_poke_waza00[] = {
	I_MSG_,STR_TEMP_BUF0,ha_,spc_,a_,ta_,ra_,si_,ku_,CR_,
	I_MSG_,STR_TEMP_BUF1,wo_,spc_,o_,bo_,e_,ta_,gyoe_,EOM_
};

// @0と　@1は　あいしょうが　わるかった！　@1は　おぼえられない！
const u8 msg_poke_waza01[] = {
	I_MSG_,STR_TEMP_BUF0,to_,spc_,I_MSG_,STR_TEMP_BUF1,ha_,CR_,
	a_,i_,si_,yyo_,u_,ga_,spc_,wa_,ru_,ka_,ttu_,ta_,gyoe_,NORMAL_WAIT_,
	I_MSG_,STR_TEMP_BUF1,ha_,spc_,o_,bo_,e_,ra_,re_,na_,i_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};

// @0は　あたらしく　@1を　おぼえたい……
// しかし　@0は　わざを　４つ　おぼえるので　せいいっぱいだ！
// @1の　かわりに　ほかの　わざを　わすれさせますか？
const u8 msg_poke_waza02[] = {
	I_MSG_,STR_TEMP_BUF0,ha_,spc_,a_,ta_,ra_,si_,ku_,CR_,
	I_MSG_,STR_TEMP_BUF1,wo_,spc_,o_,bo_,e_,ta_,i_,tenten_,tenten_,gyoe_,NORMAL_WAIT_,
	si_,ka_,si_,spc_,I_MSG_,STR_TEMP_BUF0,ha_,spc_,wa_,za_,wo_,spc_,n4_,tu_,CR_,
	o_,bo_,e_,ru_,no_,de_,spc_,se_,i_,i_,ttu_,pa_,i_,da_,gyoe_,NORMAL_WAIT_,
	I_MSG_,STR_TEMP_BUF1,no_,spc_,ka_,wa_,ri_,ni_,CR_,
	ho_,ka_,no_,spc_,wa_,za_,wo_,spc_,wa_,su_,re_,sa_,se_,ma_,su_,ka_,hate_,EOM_
};

// それでは……　@1を　おぼえるのを　あきらめますか？
const u8 msg_poke_waza03[] = {
	so_,re_,de_,ha_,tenten_,tenten_,spc_,I_MSG_,STR_TEMP_BUF1,wo_,CR_,
	o_,bo_,e_,ru_,no_,wo_,spc_,a_,ki_,ra_,me_,ma_,su_,ka_,hate_,EOM_
};

// @0は　@1を　おぼえずに　おわった！
const u8 msg_poke_waza04[] = {
	I_MSG_,STR_TEMP_BUF0,ha_,spc_,I_MSG_,STR_TEMP_BUF1,wo_,CR_,
	o_,bo_,e_,zu_,ni_,spc_,o_,wa_,ttu_,ta_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};

// どの　わざを　わすれさせたい？
const u8 msg_poke_waza05[] = {
	do_,no_,spc_,wa_,za_,wo_,CR_,
	wa_,su_,re_,sa_,se_,ta_,i_,hate_,CTRL_,C_TRGWAIT_,EOM_
};

// １　２の　……　ポカン！　@0は　@1の　つかいかたを　きれいに　わすれた！　そして……
const u8 msg_poke_waza06[] = {
	CTRL_,C_WAIT_,0x20,
	n1_,spc_,CTRL_,C_WAIT_,0xf,
	n2_,no_,spc_,CTRL_,C_WAIT_,0xf,
	tenten_,CTRL_,C_WAIT_,0xf,
	tenten_,CTRL_,C_WAIT_,0xf,
	tenten_,spc_,CTRL_,C_WAIT_,0xf,
//	CTRL_,C_MUSPLAY_,(SE_KON&0xff),((SE_KON&0xff00)>>8),PO_,KA_,N_,gyoe_,NORMAL_WAIT_,
//	C_MUSPLAYはMusicPlayをコールしているので、SEはSePlayで鳴らしたいので、
//	C_SEPLAY_というコマンドを追加
//	changed by soga 2002.09.29
	CTRL_,C_SEPLAY_,(SE_KON&0xff),((SE_KON&0xff00)>>8),PO_,KA_,N_,gyoe_,NORMAL_WAIT_,
	I_MSG_,STR_TEMP_BUF0,ha_,spc_,I_MSG_,STR_TEMP_BUF1,no_,CR_,
	tu_,ka_,i_,ka_,ta_,wo_,spc_,ki_,re_,i_,ni_,spc_,wa_,su_,re_,ta_,gyoe_,NORMAL_WAIT_,
	so_,si_,te_,tenten_,tenten_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};

// @0は　すでに　@1を　おぼえています
const u8 msg_poke_waza07[] = {
	I_MSG_,STR_TEMP_BUF0,ha_,spc_,su_,de_,ni_,CR_,
	I_MSG_,STR_TEMP_BUF1,wo_,spc_,o_,bo_,e_,te_,i_,ma_,su_,CTRL_,C_TRGWAIT_,EOM_
};

// @0の　たいりょくが　@1　かいふくした
const u8 msg_poke_rcv00[] = {
	I_MSG_,STR_TEMP_BUF0,no_,spc_,ta_,i_,ri_,yyo_,ku_,ga_,CR_,
	I_MSG_,STR_TEMP_BUF1,spc_,ka_,i_,hu_,ku_,si_,ta_,CTRL_,C_TRGWAIT_,EOM_
};

// @0の　どくは　きれい　さっぱり　なくなった！
const u8 msg_poke_rcv01[] = {
	I_MSG_,STR_TEMP_BUF0,no_,spc_,do_,ku_,ha_,CR_,
	ki_,re_,i_,spc_,sa_,ttu_,pa_,ri_,spc_,na_,ku_,na_,ttu_,ta_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};

// @0の　からだの　しびれが　とれた
const u8 msg_poke_rcv02[] = {
	I_MSG_,STR_TEMP_BUF0,no_,spc_,ka_,ra_,da_,no_,CR_,
	si_,bi_,re_,ga_,spc_,to_,re_,ta_,CTRL_,C_TRGWAIT_,EOM_
};

// @0は　めを　さました
const u8 msg_poke_rcv03[] = {
	I_MSG_,STR_TEMP_BUF0,ha_,CR_,
	me_,wo_,spc_,sa_,ma_,si_,ta_,CTRL_,C_TRGWAIT_,EOM_
};

// @0の　やけどが　なおった
const u8 msg_poke_rcv04[] = {
	I_MSG_,STR_TEMP_BUF0,no_,CR_,
	ya_,ke_,do_,ga_,spc_,na_,o_,ttu_,ta_,CTRL_,C_TRGWAIT_,EOM_
};

// @0の　からだの　こおりが　とけた
const u8 msg_poke_rcv05[] = {
	I_MSG_,STR_TEMP_BUF0,no_,spc_,ka_,ra_,da_,no_,CR_,
	ko_,o_,ri_,ga_,spc_,to_,ke_,ta_,CTRL_,C_TRGWAIT_,EOM_
};

// わざポイントが　かいふくした！
const u8 msg_poke_rcv06[] = {
	wa_,za_,PO_,I_,N_,TO_,ga_,CR_,
	ka_,i_,hu_,ku_,si_,ta_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};

// @0は　げんきを　とりもどした！
const u8 msg_poke_rcv07[] = {
	I_MSG_,STR_TEMP_BUF0,ha_,CR_,
	ge_,n_,ki_,wo_,spc_,to_,ri_,mo_,do_,si_,ta_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};

// @0は　けんこうになった！
const u8 msg_poke_rcv08[] = {
	I_MSG_,STR_TEMP_BUF0,ha_,CR_,
	ke_,n_,ko_,u_,ni_,na_,ttu_,ta_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};

// @0の　わざポイントが　ふえた！
const u8 msg_poke_rcv09[] ={
	I_MSG_,STR_TEMP_BUF0,no_,CR_,
	wa_,za_,PO_,I_,N_,TO_,ga_,spc_,hu_,e_,ta_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};

// @0の　レベルが　@1になった！
const u8 msg_poke_rcv10[] = {
	I_MSG_,STR_TEMP_BUF0,no_,CR_,
	RE_,BE_,RU_,ga_,spc_,I_MSG_,STR_TEMP_BUF1,ni_,na_,ttu_,ta_,gyoe_,EOM_
};

// @0の　@1の　きそ　ポイントが　あがった！
const u8 msg_poke_rcv11[] = {
	I_MSG_,STR_TEMP_BUF0,no_,spc_,I_MSG_,STR_TEMP_BUF1,no_,CR_,
	ki_,so_,spc_,PO_,I_,N_,TO_,ga_,spc_,a_,ga_,ttu_,ta_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};

// @0の　こんらんが　とけた
const u8 msg_konran_rcv[] = {
	I_MSG_,STR_TEMP_BUF0,no_,CR_,
	ko_,n_,ra_,n_,ga_,spc_,to_,ke_,ta_,CTRL_,C_TRGWAIT_,EOM_,
};

// @0の　メロメロが　とけた
const u8 msg_meromero_rcv[] = {
	I_MSG_,STR_TEMP_BUF0,no_,CR_,
	ME_,RO_,ME_,RO_,ga_,spc_,to_,ke_,ta_,CTRL_,C_TRGWAIT_,EOM_,
};

// ポケモンを　えらんで　ください
const u8 msg_poke_com00[] = {
	PO_,KE_,MO_,N_,wo_,spc_,e_,ra_,n_,de_,spc_,ku_,da_,sa_,i_,EOM_
};
// どこに　いどうしますか？
const u8 msg_poke_com01[] = {
	do_,ko_,ni_,spc_,i_,do_,u_,si_,ma_,su_,ka_,hate_,EOM_
};
// どのポケモンに　おしえますか？
const u8 msg_poke_com02[] = {
	do_,no_,PO_,KE_,MO_,N_,ni_,spc_,o_,si_,e_,ma_,su_,ka_,hate_,EOM_
};
// どのポケモンに　つかいますか？
const u8 msg_poke_com03[] = {
	do_,no_,PO_,KE_,MO_,N_,ni_,spc_,tu_,ka_,i_,ma_,su_,ka_,hate_,EOM_,
};
// どのポケモンに　もたせますか？
const u8 msg_poke_com04[] = {
	do_,no_,PO_,KE_,MO_,N_,ni_,spc_,mo_,ta_,se_,ma_,su_,ka_,hate_,EOM_,
};
// @0を　どうする？
const u8 msg_poke_com05[] = {
	I_MSG_,STR_TEMP_BUF0,wo_,spc_,do_,u_,su_,ru_,hate_,EOM_,
};
// めのまえに　きれるものが　ありません！
const u8 msg_poke_com06[] = {
	me_,no_,ma_,e_,ni_,spc_,ki_,re_,ru_,mo_,no_,ga_,spc_,a_,ri_,ma_,se_,n_,gyoe_,EOM_,
};
// ここでは　のることが　できません
const u8 msg_poke_com07[] = {
	ko_,ko_,de_,ha_,spc_,no_,ru_,ko_,to_,ga_,spc_,de_,ki_,ma_,se_,n_,EOM_,
};
// すでに　なみのりを　つかっています
const u8 msg_poke_com08[] = {
	su_,de_,ni_,spc_,na_,mi_,no_,ri_,wo_,spc_,tu_,ka_,ttu_,te_,i_,ma_,su_,EOM_
};
// ここでは　つかえません
const u8 msg_poke_com09[] = {
	ko_,ko_,de_,ha_,spc_,tu_,ka_,e_,ma_,se_,n_,EOM_,
};
// どのわざを　かいふくする？
const u8 msg_poke_com10[] = {
	do_,no_,wa_,za_,wo_,spc_,ka_,i_,hu_,ku_,su_,ru_,hate_,EOM_,
};
// どのわざの　ポイントを　ふやす？
const u8 msg_poke_com11[] = {
	do_,no_,wa_,za_,no_,spc_,PO_,I_,N_,TO_,wo_,hu_,ya_,su_,hate_,EOM_,
};
// もちものを　どうしますか？
const u8 msg_poke_com12[] = {
	mo_,ti_,mo_,no_,wo_,spc_,do_,u_,si_,ma_,su_,ka_,hate_,EOM_,
};
// たいせんに　だす　ポケモンが　いませんよ！
const u8 msg_poke_com13[] = {
	ta_,i_,se_,n_,ni_,spc_,da_,su_,spc_,PO_,KE_,MO_,N_,ga_,spc_,i_,ma_,se_,n_,yo_,gyoe_,EOM_,
};
// あずける　ポケモンを　えらんで　ください
const u8 msg_poke_com14[] = {
	a_,zu_,ke_,ru_,spc_,PO_,KE_,MO_,N_,wo_,spc_,e_,ra_,n_,de_,spc_,ku_,da_,sa_,i_,EOM_
};
// たいりょくが　たりません……
const u8 msg_poke_com15[] = {
	ta_,i_,ri_,yyo_,ku_,ga_,spc_,ta_,ri_,ma_,se_,n_,tenten_,tenten_,EOM_
};
// ポケモンが　３びき　そろってません！
const u8 msg_poke_com16[] = {
	PO_,KE_,MO_,N_,ga_,spc_,n3_,bi_,ki_,spc_,so_,ro_,ttu_,te_,ma_,se_,n_,gyoe_,EOM_
};
// おなじ　ポケモンが　います！
const u8 msg_poke_com17[] = {
	o_,na_,zi_,spc_,PO_,KE_,MO_,N_,ga_,spc_,i_,ma_,su_,gyoe_,EOM_
};
// どうぐが　おなじ　ポケモンが　います！
const u8 msg_poke_com18[] = {
	do_,u_,gu_,ga_,spc_,o_,na_,zi_,spc_,PO_,KE_,MO_,N_,ga_,spc_,i_,ma_,su_,gyoe_,EOM_
};
// どのポケモンに　おぼえさせますか？
const u8 msg_poke_com19[] = {
	do_,no_,PO_,KE_,MO_,N_,ni_,spc_,o_,bo_,e_,sa_,se_,ma_,su_,ka_,hate_,EOM_,
};


/*==================================================================*/
//	ポケモンステータス画面　p_status.c
/*==================================================================*/
const u8 str_pst_kougeki[]  = { ko_,u_,ge_,ki_,EOM_ };		// こうげき
const u8 str_pst_bougyo[]   = { bo_,u_,gi_,yyo_,EOM_ };		// ぼうぎょ
const u8 str_pst_tokukou[]  = { to_,ku_,ko_,u_,EOM_ };		// とくこう
const u8 str_pst_tokubou[]  = { to_,ku_,bo_,u_,EOM_ };		// とくぼう
const u8 str_pst_subayasa[] = { su_,ba_,ya_,sa_,EOM_ };		// すばやさ
const u8 str_pst_HP[]       = { H__,P__,EOM_ };				// HP
const u8 str_pst_Ato[]      = { a_,to_,EOM_ };				// あと
const u8 str_pst_Oya[]      = { o_,ya_,sura_,EOM_ };		// おや/
const u8 str_pst_Type[]     = { TA_,I_,PU_,sura_,EOM_ };	// タイプ/
const u8 str_pst_Iryoku[]   = { i_,ri_,yyo_,ku_,EOM_ };		// いりょく
const u8 str_pst_Meityuu[]  = { me_,i_,ti_,yyu_,u_,EOM_ };	// めいちゅう
const u8 str_pst_Appeal[]   = { A_,PI_,bou_,RU_,EOM_ };		// アピール
const u8 str_pst_Bougai[]   = { bo_,u_,ga_,i_,EOM_ };		// ぼうがい
const u8 str_pst_Zyoutai[]  = { zi_,yyo_,u_,ta_,i_,EOM_ };	// じょうたい
const u8 str_pst_NowExp[]   = { ge_,n_,za_,i_,no_,ke_,i_,ke_,n_,ti_,EOM_ };	// げんざいのけいけんち
const u8 str_pst_LvUp[]     = { RE_,BE_,RU_,A_,TTU_,PU_,ma_,de_,EOM_ };		// レベルアップまで
const u8 str_pst_NowRibon[] = { ge_,n_,za_,i_,spc_,n0_,n0_,ko_,EOM_ };		// げんざい　00こ

const u8 str_festa_memo[] = { I_,BE_,N_,TO_,EOM_ };		// イベント

const u8 str_pst_com00[] = { i_,re_,ka_,e_,EOM_ };						// いれかえ
const u8 str_pst_com01[] = { PO_,KE_,MO_,N_,zi_,yyo_,u_,ho_,u_,EOM_ };	// ポケモンじょうほう
const u8 str_pst_com02[] = { PO_,KE_,MO_,N_,no_,u_,ri_,yyo_,ku_,EOM_ };	// ポケモンのうりょく
const u8 str_pst_com03[] = { ta_,ta_,ka_,u_,wa_,za_,EOM_ };				// たたかうわざ
const u8 str_pst_com04[] = { KO_,N_,TE_,SU_,TO_,wa_,za_,EOM_ };			// コンテストわざ
const u8 str_pst_com05[] = { ki_,ri_,ka_,e_,EOM_ };						// きりかえ


// この　タマゴは　うまれるまで　かなり　かかりそう
const u8 msg_pst_egg00[] = {
	ko_,no_,spc_,TA_,MA_,GO_,ha_,CR_,
	u_,ma_,re_,ru_,ma_,de_,spc_,ka_,na_,ri_,spc_,ka_,ka_,ri_,so_,u_,EOM_
};
// なにが　うまれて　くるのかな？　うまれる　まで　まだまだ　かかりそう
const u8 msg_pst_egg01[] = {
	na_,ni_,ga_,spc_,u_,ma_,re_,te_,spc_,ku_,ru_,no_,ka_,na_,hate_,CR_,
	u_,ma_,re_,ru_,spc_,ma_,de_,spc_,ma_,da_,ma_,da_,spc_,ka_,ka_,ri_,so_,u_,EOM_
};
// ときどき　うごいて　いるようだ　うまれる　まで　もうちょっと　かな？
const u8 msg_pst_egg02[] = {
	to_,ki_,do_,ki_,spc_,u_,go_,i_,te_,spc_,i_,ru_,yo_,u_,da_,CR_,
	u_,ma_,re_,ru_,spc_,ma_,de_,spc_,mo_,u_,ti_,yyo_,ttu_,to_,spc_,ka_,na_,hate_,EOM_
};
// なかから　おとが　きこえてくる　もうすぐ　うまれそう！
const u8 msg_pst_egg03[] = {
	na_,ka_,ka_,ra_,spc_,o_,to_,ga_,spc_,ki_,ko_,e_,te_,ku_,ru_,CR_,
	mo_,u_,su_,gu_,spc_,u_,ma_,re_,so_,u_,gyoe_,EOM_
};

// それは　たいせつなわざです　わすれさせることは　できません！
const u8 msg_hiden_del_error[] = {
	so_,re_,ha_,spc_,ta_,i_,se_,tu_,na_,wa_,za_,de_,su_,CR_,
	wa_,su_,re_,sa_,se_,ru_,ko_,to_,ha_,spc_,de_,ki_,ma_,se_,n_,gyoe_,EOM_
};

/*==================================================================*/
//	秘密基地関連
/*==================================================================*/
const u8 str_kiti_name[] = { spc_,ki_,ti_,EOM_ };	// ～ きち

// @0　の　とうろくを　かいじょ　しても　よろしい　ですか？
const u8 msg_base_reset01[] = {
	I_MSG_,STR_TEMP_BUF0,spc_,no_,spc_,to_,u_,ro_,ku_,wo_,CR_,
	ka_,i_,zi_,yyo_,spc_,si_,te_,mo_,spc_,yo_,ro_,si_,i_,spc_,de_,su_,ka_,hate_,EOM_
};
// とうろくを　かいじょ　しました
const u8 msg_base_reset02[] = {
	to_,u_,ro_,ku_,wo_,spc_,ka_,i_,zi_,yyo_,spc_,si_,ma_,si_,ta_,CTRL_,C_TRGWAIT_,EOM_
};
// とうろく　リストは　ありません
const u8 msg_base_no_entry_list[] = {
	to_,u_,ro_,ku_,spc_,RI_,SU_,TO_,ha_,spc_,a_,ri_,ma_,se_,n_,CTRL_,C_TRGWAIT_,EOM_
};

// とうろく　かいじょ
const u8 str_baselist_kaizyo[] = { to_,u_,ro_,ku_,spc_,ka_,i_,zi_,yyo_,EOM_ };


/*==================================================================*/
//	グッズ関連　gds_main.c, gds_put.c, gds_get.c, gds_del.c
/*==================================================================*/
const u8 str_goods_menu_oku[]     = { GU_,TTU_,ZU_,wo_,spc_,o_,ku_,EOM_ };		// グッズをおく
const u8 str_goods_menu_modosu[]  = { GU_,TTU_,ZU_,wo_,spc_,mo_,do_,su_,EOM_ };	// グッズをもどす
const u8 str_goods_menu_recycle[] = { GU_,TTU_,ZU_,wo_,spc_,su_,te_,ru_,EOM_ };	// グッズをすてる


// えらんだ　グッズを　へやに　おきます！
const u8 msg_goods_menu00[] = {
	e_,ra_,n_,da_,spc_,GU_,TTU_,ZU_,wo_,spc_,he_,ya_,ni_,spc_,o_,ki_,ma_,su_,gyoe_,EOM_
};
// えらんだ　グッズを　パソコンに　もどします！
const u8 msg_goods_menu01[] = {
	e_,ra_,n_,da_,spc_,GU_,TTU_,ZU_,wo_,spc_,PA_,SO_,KO_,N_,ni_,spc_,mo_,do_,si_,ma_,su_,gyoe_,EOM_
};
// いらなくなった　グッズを　すてます！
const u8 msg_goods_menu02[] = {
	i_,ra_,na_,ku_,na_,ttu_,ta_,spc_,GU_,TTU_,ZU_,wo_,spc_,su_,te_,ma_,su_,gyoe_,EOM_
};
// グッズは　ありません！
const u8 msg_no_goods00[] = {
	GU_,TTU_,ZU_,ha_,spc_,a_,ri_,ma_,se_,n_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};

const u8 str_goods_type_tukue[]     = { tu_,ku_,e_,EOM_ };				// つくえ
const u8 str_goods_type_isu[]       = { i_,su_,EOM_ };					// いす
const u8 str_goods_type_hatiue[]    = { ha_,ti_,u_,e_,EOM_ };			// 鉢植え
const u8 str_goods_type_okimono[]   = { o_,ki_,mo_,no_,EOM_ };			// おきもの
const u8 str_goods_type_matto[]     = { MA_,TTU_,TO_,EOM_ };			// マット
const u8 str_goods_type_posuta[]    = { PO_,SU_,TA_,bou_,EOM_ };		// ポスター
const u8 str_goods_type_nuigurumi[] = { nu_,i_,gu_,ru_,mi_,EOM_ };		// ぬいぐるみ
const u8 str_goods_type_kussyon[]   = { KU_,TTU_,SI_,YYO_,N_,EOM_ };	// クッション

const u8 str_goods_tate00[] = { ki_,n_,EOM_ };	// きん
const u8 str_goods_tate01[] = { gi_,n_,EOM_ };	// ぎん

// ここに　おきますか？
const u8 msg_goods_put00[] = { ko_,ko_,ni_,spc_,o_,ki_,ma_,su_,ka_,hate_,EOM_ };
// ここには　おけません！
const u8 msg_goods_put01[] = { ko_,ko_,ni_,ha_,spc_,o_,ke_,ma_,se_,n_,gyoe_,EOM_ };
// おくのを　やめますか？
const u8 msg_goods_put02[] = { o_,ku_,no_,wo_,spc_,ya_,me_,ma_,su_,ka_,hate_,EOM_ };
// すでに　おかれて　います！
const u8 msg_goods_put03[] = { su_,de_,ni_,spc_,o_,ka_,re_,te_,spc_,i_,ma_,su_,gyoe_,EOM_ };
// これいじょう　おけません　ひみつきちに　おけるのは　@0こ　までです
const u8 msg_goods_put04[] = {
	ko_,re_,i_,zi_,yyo_,u_,spc_,o_,ke_,ma_,se_,n_,CR_,
	hi_,mi_,tu_,ki_,ti_,ni_,spc_,o_,ke_,ru_,no_,ha_,spc_,I_MSG_,STR_TEMP_BUF0,ko_,spc_,ma_,de_,de_,su_,EOM_
};
// これいじょう　おけません　へやに　おけるのは　@0こ　までです
const u8 msg_goods_put14[] = {
	ko_,re_,i_,zi_,yyo_,u_,spc_,o_,ke_,ma_,se_,n_,CR_,
	he_,ya_,ni_,spc_,o_,ke_,ru_,no_,ha_,spc_,I_MSG_,STR_TEMP_BUF0,ko_,spc_,ma_,de_,de_,su_,EOM_
};
// ここには　おけません！　つくえの　うえなどに　おいてください！
const u8 msg_goods_put05[] = {
	ko_,ko_,ni_,ha_,spc_,o_,ke_,ma_,se_,n_,gyoe_,CR_,
	tu_,ku_,e_,no_,spc_,u_,e_,na_,do_,ni_,spc_,o_,i_,te_,ku_,da_,sa_,i_,gyoe_,EOM_
};
// この　グッズは　じぶんの　へやには　おけません！
const u8 msg_goods_put06[] = {
	ko_,no_,spc_,GU_,TTU_,ZU_,ha_,CR_,
	zi_,bu_,n_,no_,spc_,he_,ya_,ni_,ha_,spc_,o_,ke_,ma_,se_,n_,gyoe_,EOM_
};

// このグッズは　おかれて　いるので　すてる　ことが　できません！
const u8 msg_goods_rec00[] = {
	ko_,no_,GU_,TTU_,ZU_,ha_,spc_,o_,ka_,re_,te_,spc_,i_,ru_,no_,de_,CR_,
	su_,te_,ru_,spc_,ko_,to_,ga_,spc_,de_,ki_,ma_,se_,n_,gyoe_,EOM_
};
// @0　は　なくなりますが　よろしい　ですか？
const u8 msg_goods_rec01[] = {
	I_MSG_,STR_TEMP_BUF0,spc_,ha_,spc_,na_,ku_,na_,ri_,ma_,su_,ga_,CR_,
	yo_,ro_,si_,i_,spc_,de_,su_,ka_,hate_,EOM_
};
// グッズを　すてました！
const u8 msg_goods_rec02[] = {
	GU_,TTU_,ZU_,wo_,spc_,su_,te_,ma_,si_,ta_,gyoe_,EOM_
};

// もどすのを　やめますか？
const u8 msg_goods_get00[] = { mo_,do_,su_,no_,wo_,spc_,ya_,me_,ma_,su_,ka_,hate_,EOM_ };
// ここに　グッズは　ありません！
const u8 msg_goods_get01[] = { ko_,ko_,ni_,spc_,GU_,TTU_,ZU_,ha_,spc_,a_,ri_,ma_,se_,n_,gyoe_,EOM_ };
// このグッズを　パソコンに　もどしますか？
const u8 msg_goods_get02[] = { ko_,no_,GU_,TTU_,ZU_,wo_,spc_,PA_,SO_,KO_,N_,ni_,spc_,mo_,do_,si_,ma_,su_,ka_,hate_,EOM_ };
// グッズを　パソコンに　もどしました！
const u8 msg_goods_get03[] = { GU_,TTU_,ZU_,wo_,spc_,PA_,SO_,KO_,N_,ni_,spc_,mo_,do_,si_,ma_,si_,ta_,gyoe_,EOM_ };
// グッズは　おかれて　いません！
const u8 msg_goods_no_put[] = {
	GU_,TTU_,ZU_,ha_,spc_,o_,ka_,re_,te_,spc_,i_,ma_,se_,n_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};


/*==================================================================*/
//	グッズ交換おやじ	oyaji03.c
/*==================================================================*/
const u8 recycle_oyaji_name01[] = { HI_,RO_,MI_,EOM_ };		// ヒロミ
const u8 recycle_oyaji_name02[] = { YU_,U_,RI_,EOM_ };		// ユウリ
const u8 recycle_oyaji_name03[] = { YO_,SI_,O_,EOM_ };		// ヨシオ
const u8 recycle_oyaji_name04[] = { SA_,DA_,HA_,RU_,EOM_ };	// サダハル


/*==================================================================*/
//	自分のPC関連　my_pc.c
/*==================================================================*/

const u8 str_pc_kiru[] = { se_,tu_,zo_,ku_,wo_,spc_,ki_,ru_,EOM_ };	// せつぞくを　きる

const u8 str_my_pc_rearg[] = { mo_,yo_,u_,ga_,e_,EOM_ };				// もようがえ

const u8 str_my_pc_item[]  = { do_,u_,gu_,spc_,a_,zu_,ka_,ri_,EOM_ };	// どうぐ　あずかり
const u8 str_my_pc_mail[]  = { ME_,bou_,RU_,BO_,TTU_,KU_,SU_,EOM_ };	// メールボックス

const u8 str_my_pc_azukeru[]  = { do_,u_,gu_,wo_,spc_,a_,zu_,ke_,ru_,EOM_ };	// どうぐを　あずける
const u8 str_my_pc_hikidasu[] = { do_,u_,gu_,wo_,spc_,hi_,ki_,da_,su_,EOM_ };	// どうぐを　ひきだす
const u8 str_my_pc_suteru[]   = { do_,u_,gu_,wo_,spc_,su_,te_,ru_,EOM_ };		// どうぐを　すてる

// パソコン　に　どうぐを　あずけます
const u8 msg_my_pc_item00[] = {
	PA_,SO_,KO_,N_,spc_,ni_,CR_,
	do_,u_,gu_,wo_,spc_,a_,zu_,ke_,ma_,su_,EOM_
};
// パソコン　から　どうぐを　ひきだします
const u8 msg_my_pc_item01[] = {
	PA_,SO_,KO_,N_,spc_,ka_,ra_,CR_,
	do_,u_,gu_,wo_,spc_,hi_,ki_,da_,si_,ma_,su_,EOM_
};
// パソコン　に　あずけている　どうぐを　すてます
const u8 msg_my_pc_item02[] = {
	PA_,SO_,KO_,N_,spc_,ni_,spc_,a_,zu_,ke_,te_,i_,ru_,CR_,
	do_,u_,gu_,wo_,spc_,su_,te_,ma_,su_,EOM_
};
// なにも　ありません！
const u8 msg_my_pc_no_item[] = { na_,ni_,mo_,spc_,a_,ri_,ma_,se_,n_,gyoe_,CTRL_,C_TRGWAIT_,EOM_ };
// これいじょう　バッグに　はいりません
const u8 msg_my_pc_no_get[] = {
	ko_,re_,i_,zi_,yyo_,u_,CR_,
	BA_,TTU_,GU_,ni_,spc_,ha_,i_,ri_,ma_,se_,n_,EOM_
};
// いくつ　ひきだしますか？
const u8 msg_my_pc_get01[] = { i_,ku_,tu_,spc_,hi_,ki_,da_,si_,ma_,su_,ka_,hate_,EOM_ };
// @0　を　@1コ　ひきだしました
const u8 msg_my_pc_get02[] = {
	I_MSG_,STR_TEMP_BUF0,spc_,wo_,CR_,
	I_MSG_,STR_TEMP_BUF1,KO_,spc_,hi_,ki_,da_,si_,ma_,si_,ta_,EOM_
};

const u8 str_my_pc_yomu[]     = { na_,i_,yo_,u_,wo_,spc_,yo_,mu_,EOM_ };			// ないようを　よむ
const u8 str_my_pc_modosu[]   = { BA_,TTU_,GU_,ni_,spc_,mo_,do_,su_,EOM_ };			// バッグに　もどす
const u8 str_my_pc_motaseru[] = { PO_,KE_,MO_,N_,ni_,spc_,mo_,ta_,se_,ru_,EOM_ };	// ポケモンに　もたせる

// メールは　１つうも　ありません
const u8 msg_my_pc_no_mail[] = {
	ME_,bou_,RU_,ha_,spc_,n1_,tu_,u_,mo_,spc_,a_,ri_,ma_,se_,n_,CTRL_,C_TRGWAIT_,EOM_
};
// @0　の　メールを　どうしますか
const u8 msg_my_pc_mail_menu[] = {
	I_MSG_,STR_TEMP_BUF0,spc_,no_,CR_,
	ME_,bou_,RU_,wo_,spc_,do_,u_,si_,ma_,su_,ka_,hate_,EOM_
};
// ないようは　きえてしまいますが　よろしいですか？
const u8 msg_my_pc_del_mail_check[] = {
	na_,i_,yo_,u_,ha_,spc_,ki_,e_,te_,si_,ma_,i_,ma_,su_,ga_,CR_,
	yo_,ro_,si_,i_,de_,su_,ka_,hate_,EOM_
};
// バッグが　いっぱいです！
const u8 msg_my_pc_bag_max[] = {
	BA_,TTU_,GU_,ga_,spc_,i_,ttu_,pa_,i_,de_,su_,gyoe_,CTRL_,C_TRGWAIT_,EOM_
};
// ないようを　けした　メールを　バッグに　いれました
const u8 msg_my_pc_del_mail[] = {
	na_,i_,yo_,u_,wo_,spc_,ke_,si_,ta_,spc_,ME_,bou_,RU_,wo_,CR_,
	BA_,TTU_,GU_,ni_,spc_,i_,re_,ma_,si_,ta_,CTRL_,C_TRGWAIT_,EOM_
};


/*==================================================================*/
//	ＴＶ企画関連　	tv_tool.c
/*==================================================================*/
//パパ
const u8 str_papa[]	= { PA_,PA_,EOM_ };
//ママ
const u8 str_mama[]	= { MA_,MA_,EOM_ };

/*==================================================================*/
//	ファン企画関連　	fan.c
/*==================================================================*/
//ミクリ(仮)
const u8 fan_leader_name01[] = { MI_,KU_,RI_,EOM_ };
const u8 fan_leader_name02[] = { DA_,I_,GO_,EOM_ };
const u8 fan_leader_name03[] = { TO_,U_,KI_,EOM_ };
const u8 fan_leader_name04[] = { NA_,GI_,EOM_ };
const u8 fan_leader_name05[] = { HU_,YO_,U_,EOM_ };
const u8 fan_leader_name06[] = { PU_,RI_,MU_,EOM_ };

/*==================================================================*/
//似顔絵表示関連　　　　con_pic.c
/*==================================================================*/
//"コンテスト　ゆうしよう"
const u8 con_reg_mes1[]={KO_,N_,TE_,SU_,TO_,spc_,yu_,u_,si_,yyo_,u_,CR_,EOM_};
//"　の　"
const u8 con_reg_mes2[]={spc_,no_,spc_,EOM_};

const u8 con_mes_kakkoyosa[]= {ka_,ttu_,ko_,yo_,sa_,spc_,EOM_};						//かっこよさ
const u8 con_mes_utsukushisa[]= {u_,tu_,ku_,si_,sa_,spc_,EOM_};						//うつくしさ
const u8 con_mes_kawaisa[]= {ka_,wa_,i_,sa_,spc_,EOM_};								//かわいさ
const u8 con_mes_kashikosa[]= {ka_,si_,ko_,sa_,spc_,EOM_};							//かしこさ
const u8 con_mes_takumashisa[]= {ta_,ku_,ma_,si_,sa_,spc_,EOM_};					//たくましさ

//美術館用の似顔絵メッセージ（01がポケモン名の前部分、02がポケモン名の後ろ部分)
//"スーパー　クールcrノンストップ　"
const u8 mus_mes_str_01_01[]= {SU_,bou_,PA_,bou_,spc_,KU_,bou_,RU_,CR_,NO_,N_,SU_,TO_,TTU_,PU_,spc_,EOM_};
//""
const u8 mus_mes_str_01_02[]= {EOM_};

//"グッドルッキン　ポケモン　"
const u8 mus_mes_str_02_01[]= {GU_,TTU_,DO_,RU_,TTU_,KI_,N_,spc_,PO_,KE_,MO_,N_,spc_,EOM_};
//""
const u8 mus_mes_str_02_02[]= {EOM_};

//"マーベラス　ワンダフルcrグレート　"
const u8 mus_mes_str_03_01[]= {MA_,bou_,BE_,RA_,SU_,spc_,WA_,N_,DA_,HU_,RU_,CR_,GU_,RE_,bou_,TO_,spc_,EOM_};
//""
const u8 mus_mes_str_03_02[]= {EOM_};

//"こんせいき　さいごの　ビーナスcrビューティー　"
const u8 mus_mes_str_04_01[]= {ko_,n_,se_,i_,ki_,spc_,sa_,i_,go_,no_,spc_,BI_,bou_,NA_,SU_,CR_,BI_,YYU_,bou_,TE_,II_,bou_,spc_,EOM_};
//""
const u8 mus_mes_str_04_02[]= {EOM_};

//""
const u8 mus_mes_str_05_01[]= {EOM_};
//"　クンの　マブシイcrキラキラ　スマイル"
const u8 mus_mes_str_05_02[]= {spc_,KU_,N_,no_,spc_,MA_,BU_,SI_,I_,CR_,KI_,RA_,KI_,RA_,spc_,SU_,MA_,I_,RU_,EOM_};

//"ポケモンセンター　のcrスーパー　アイドル　"
const u8 mus_mes_str_06_01[]= {PO_,KE_,MO_,N_,SE_,N_,TA_,bou_,spc_,no_,CR_,SU_,bou_,PA_,bou_,spc_,A_,I_,DO_,RU_,spc_,EOM_};
//""
const u8 mus_mes_str_06_02[]= {EOM_};

//"ラブリー　スウィート　"
const u8 mus_mes_str_07_01[]= {RA_,BU_,RI_,bou_,spc_,SU_,U_,II_,bou_,TO_,spc_,EOM_};
//"　ちゃん"
const u8 mus_mes_str_07_02[]= {spc_,ti_,yya_,n_,EOM_};

//"プリティー　"
const u8 mus_mes_str_08_01[]= {PU_,RI_,TE_,II_,bou_,spc_,EOM_};
//"たんのcrおすまし　ショット"
const u8 mus_mes_str_08_02[]= {ta_,n_,no_,CR_,o_,su_,ma_,si_,spc_,SI_,YYO_,TTU_,TO_,EOM_};

//"こっち　むいて！crキュート　ポケモン　"
const u8 mus_mes_str_09_01[]= {ko_,ttu_,ti_,spc_,mu_,i_,te_,gyoe_,CR_,KI_,YYU_,bou_,TO_,spc_,PO_,KE_,MO_,N_,spc_,EOM_};
//"　ちゃん"
const u8 mus_mes_str_09_02[]= {spc_,ti_,yya_,n_,EOM_};

//"かしこさ　マエストロcrワイズ　ポケモン　"
const u8 mus_mes_str_10_01[]= {ka_,si_,ko_,sa_,spc_,MA_,E_,SU_,TO_,RO_,CR_,WA_,I_,ZU_,spc_,PO_,KE_,MO_,N_,spc_,EOM_};
//""
const u8 mus_mes_str_10_02[]= {EOM_};

//"えらばれた　ポケモン…crポケモンの　なかの　ポケモン　"
const u8 mus_mes_str_11_01[]= {e_,ra_,ba_,re_,ta_,spc_,PO_,KE_,MO_,N_,tenten_,CR_,PO_,KE_,MO_,N_,no_,spc_,na_,ka_,no_,spc_,PO_,KE_,MO_,N_,spc_,EOM_};
//""
const u8 mus_mes_str_11_02[]= {EOM_};

//"エクセレント　"
const u8 mus_mes_str_12_01[]= {E_,KU_,SE_,RE_,N_,TO_,spc_,EOM_};
//"　のcrゆうがな　ひととき"
const u8 mus_mes_str_12_02[]= {spc_,no_,CR_,yu_,u_,ga_,na_,spc_,hi_,to_,to_,ki_,EOM_};

//"パワフル　マッスルcrハッスル　ポケモン"
const u8 mus_mes_str_13_01[]= {PA_,WA_,HU_,RU_,spc_,MA_,TTU_,SU_,RU_,CR_,HA_,TTU_,SU_,RU_,spc_,EOM_};
//""
const u8 mus_mes_str_13_02[]= {EOM_};

//"ストロング　ストロンガーCRストロンゲスト　ポケモン"
const u8 mus_mes_str_14_01[]= {SU_,TO_,RO_,N_,GU_,spc_,SU_,TO_,RO_,N_,GA_,bou_,CR_,SU_,TO_,RO_,N_,GE_,SU_,TO_,spc_,EOM_};
//""
const u8 mus_mes_str_14_02[]= {EOM_};

//"タフネス　マイティーcrハイパーポケモン　"
const u8 mus_mes_str_15_01[]= {TA_,HU_,NE_,SU_,spc_,MA_,I_,TE_,II_,bou_,CR_,HA_,I_,PA_,bou_,PO_,KE_,MO_,N_,spc_,EOM_};
//"！"
const u8 mus_mes_str_15_02[]= {gyoe_,EOM_};


/*==================================================================*/
//	スクリプト関連　	ev_win.c
/*==================================================================*/
//トウカ
const u8 str_touka[]	= {TO_,U_,KA_,EOM_};
//カイナ
const u8 str_kaina[]	= {KA_,I_,NA_,EOM_};
//ミシロ
const u8 str_misiro[]	= {MI_,SI_,RO_,EOM_};
//ミナモ
const u8 str_minamo[]	= {MI_,NA_,MO_,EOM_};
//ムロ
const u8 str_muro[]		= {MU_,RO_,EOM_};
//さんか　する
const u8 ev_win_msg05[]	= {sa_,n_,ka_,spc_,su_,ru_,EOM_};
//せつめいをきく
const u8 ev_win_msg06[]	= {se_,tu_,me_,i_,wo_,ki_,ku_,EOM_};
//ポケモンコンテストって？
const u8 ev_win_msg08[]	= {PO_,KE_,MO_,N_,KO_,N_,TE_,SU_,TO_,ttu_,te_,hate_,EOM_};
//コンテストの　しょるい
const u8 ev_win_msg09[]	= {KO_,N_,TE_,SU_,TO_,no_,spc_,si_,yyu_,ru_,i_,EOM_};
//ランクに　ついて
const u8 ev_win_msg10[]	= {RA_,N_,KU_,ni_,spc_,tu_,i_,te_,EOM_};
//しんさいんに　ついて
const u8 ev_win_msg11[]	= {si_,n_,sa_,i_,n_,ni_,spc_,tu_,i_,te_,EOM_};
//かっこよさコンテスト
const u8 ev_win_msg12[]	= {ka_,ttu_,ko_,yo_,sa_,KO_,N_,TE_,SU_,TO_,EOM_};
//うつくしさコンテスト
const u8 ev_win_msg13[]	= {u_,tu_,ku_,si_,sa_,KO_,N_,TE_,SU_,TO_,EOM_};
//かわいさコンテスト
const u8 ev_win_msg14[]	= {ka_,wa_,i_,sa_,KO_,N_,TE_,SU_,TO_,EOM_};
//かしこさコンテスト
const u8 ev_win_msg15[]	= {ka_,si_,ko_,sa_,KO_,N_,TE_,SU_,TO_,EOM_};
//たくましさコンテスト
const u8 ev_win_msg16[]	= {ta_,ku_,ma_,si_,sa_,KO_,N_,TE_,SU_,TO_,EOM_};
//もようがえ
const u8 str_moyougae[]	= { mo_,yo_,u_,ga_,e_,EOM_ };
//ひっこし
const u8 str_hikkosi[]	= { hi_,ttu_,ko_,si_,EOM_ };
//カウント
const u8 str_kaunto[]	= { KA_,U_,N_,TO_,EOM_ };
//とうろくリスト
const u8 str_t_list[]	= { to_,u_,ro_,ku_,spc_,RI_,SU_,TO_,EOM_ };
//とうろくせつめい
const u8 str_t_list_s[]	= { to_,u_,ro_,ku_,spc_,se_,tu_,me_,i_,EOM_ };
//マッハ
const u8 str_mahha[]	= { MA_,TTU_,HA_,EOM_ };
//ダート
const u8 str_daato[]	= { DA_,bou_,TO_,EOM_ };
//どく
const u8 str_doku[]		= { do_,ku_,EOM_ };
//まひ
const u8 str_mahi[]		= { ma_,hi_,EOM_ };
//ねむり
const u8 str_nemuri[]	= { ne_,mu_,ri_,EOM_ };
//やけど
const u8 str_yakedo[]	= { ya_,ke_,do_,EOM_ };
//こおり
const u8 str_koori[]	= { ko_,o_,ri_,EOM_ };
//よむのを　やめる
const u8 str_yomuyameru[] = { yo_,mu_,no_,wo_,spc_,ya_,me_,ru_,EOM_ };
//みました
const u8 str_mimasita[]	= { mi_,ma_,si_,ta_,EOM_ };
//これから
const u8 str_korekara[]	= { ko_,re_,ka_,ra_,EOM_ };
//はい
const u8 str_yes[]		= { ha_,i_,EOM_ };
//いいえ
const u8 str_no[]		= { i_,i_,e_,EOM_ };
//せつめい
const u8 str_explain[]	= { se_,tu_,me_,i_,EOM_ };
//シングルバトル
const u8 str_s_battle[]	= { SI_,N_,GU_,RU_,BA_,TO_,RU_,EOM_ };
//ダブルバトル
const u8 str_d_battle[]	= { DA_,BU_,RU_,BA_,TO_,RU_,EOM_ };
//マルチバトル
const u8 str_m_battle[]	= { MA_,RU_,TI_,BA_,TO_,RU_,EOM_ };
//ハギ
const u8 str_hagi[]		= { HA_,GI_,EOM_ };
//ちょうせんする
const u8 str_btmenu00[]	= { ti_,yyo_,u_,se_,n_,su_,ru_,EOM_ };
//せつめいをきく
const u8 str_btmenu01[]	= { se_,tu_,me_,i_,wo_,ki_,ku_,EOM_ };
//レベル５０
const u8 str_btlvmenu00[] = { RE_,BE_,RU_,n5_,n0_,EOM_ };
//レベル１００
const u8 str_btlvmenu01[] = { RE_,BE_,RU_,n1_,n0_,n0_,EOM_ };
//※str_quizxx_xxの内容は、最後まで変更の予定あり（内容未確定につき使い回し不可）
//ジグザグマ
const u8 str_quiz11_01[] = { ZI_,GU_,ZA_,GU_,MA_,EOM_ };
//ツチニン
const u8 str_quiz11_02[] = { TU_,TI_,NI_,N_,EOM_ };
//ポチエナ
const u8 str_quiz11_03[] = { PO_,TI_,E_,NA_,EOM_ };
//ツチニン
const u8 str_quiz12_01[] = { TU_,TI_,NI_,N_,EOM_ };
//ハスボー
const u8 str_quiz12_02[] = { HA_,SU_,BO_,bou_,EOM_ };
//ロゼリア
const u8 str_quiz12_03[] = { RO_,ZE_,RI_,A_,EOM_ };
//キノココ
const u8 str_quiz13_01[] = { KI_,NO_,KO_,KO_,EOM_ };
//ツチニン
const u8 str_quiz13_02[] = { TU_,TI_,NI_,N_,EOM_ };
//アメタマ
const u8 str_quiz13_03[] = { A_,ME_,TA_,MA_,EOM_ };
//ジュモリ
const u8 str_quiz21_01[] = { KI_,MO_,RI_,EOM_ };
//アチャモ
const u8 str_quiz21_02[] = { A_,TI_,YYA_,MO_,EOM_ };
//ミズゴロウ
const u8 str_quiz21_03[] = { MI_,ZU_,GO_,RO_,U_,EOM_ };
//タネボー
const u8 str_quiz22_01[] = { TA_,NE_,BO_,bou_,EOM_ };
//キノココ
const u8 str_quiz22_02[] = { KI_,NO_,KO_,KO_,EOM_ };
//パッチール
const u8 str_quiz22_03[] = { PA_,TTU_,TI_,bou_,RU_,EOM_ };
//キノココ
const u8 str_quiz23_01[] = { KI_,NO_,KO_,KO_,EOM_ };
//ジグザグマ
const u8 str_quiz23_02[] = { ZI_,GU_,ZA_,GU_,MA_,EOM_ };
//ケムッソ
const u8 str_quiz23_03[] = { KE_,MU_,TTU_,SO_,EOM_ };
//モンスターボール
const u8 str_quiz31_01[] = { MO_,N_,SU_,TA_,bou_,BO_,bou_,RU_,EOM_ };
//いいきずぐすり
const u8 str_quiz31_02[] = { i_,i_,ki_,zu_,gu_,su_,ri_,EOM_ };
//おなじねだん
const u8 str_quiz31_03[] = { o_,na_,zi_,ne_,da_,n_,EOM_ };
//１３５えん
const u8 str_quiz32_01[] = { n1_,n3_,n5_,e_,n_,EOM_ };
//１５５えん
const u8 str_quiz32_02[] = { n1_,n5_,n5_,e_,n_,EOM_ };
//１７５えん
const u8 str_quiz32_03[] = { n1_,n7_,n5_,e_,n_,EOM_ };
//たかくなる
const u8 str_quiz33_01[] = { ta_,ka_,ku_,na_,ru_,EOM_ };
//やすくなる
const u8 str_quiz33_02[] = { ya_,su_,ku_,na_,ru_,EOM_ };
//おなじねだん
const u8 str_quiz33_03[] = { o_,na_,zi_,ne_,da_,n_,EOM_ };
//オス
const u8 str_quiz41_01[] = { O_,SU_,EOM_ };
//メス
const u8 str_quiz41_02[] = { ME_,SU_,EOM_ };
//どっちでもない
const u8 str_quiz41_03[] = { do_,ttu_,ti_,de_,mo_,na_,i_,EOM_ };
//だんせい
const u8 str_quiz42_01[] = { da_,n_,se_,i_,EOM_ };
//じょせい
const u8 str_quiz42_02[] = { zi_,yyo_,se_,i_,EOM_ };
//おなじかず
const u8 str_quiz42_03[] = { o_,na_,zi_,ka_,zu_,EOM_ };
//だんせい
const u8 str_quiz43_01[] = { da_,n_,se_,i_,EOM_ };
//じょせい
const u8 str_quiz43_02[] = { zi_,yyo_,se_,i_,EOM_ };
//きまっていない
const u8 str_quiz43_03[] = { ki_,ma_,ttu_,te_,i_,na_,i_,EOM_ };
//６だい
const u8 str_quiz51_01[] = { n6_,da_,i_,EOM_ };
//８だい
const u8 str_quiz51_02[] = { n8_,da_,i_,EOM_ };
//１０だい
const u8 str_quiz51_03[] = { n1_,n0_,da_,i_,EOM_ };
//ひとり
const u8 str_quiz52_01[] = { hi_,to_,ri_,EOM_ };
//ふたり
const u8 str_quiz52_02[] = { hu_,ta_,ri_,EOM_ };
//さんにん
const u8 str_quiz52_03[] = { sa_,n_,ni_,n_,EOM_ };
//６つ
const u8 str_quiz53_01[] = { n6_,tu_,EOM_ };
//７つ
const u8 str_quiz53_02[] = { n7_,tu_,EOM_ };
//８つ
const u8 str_quiz53_03[] = { n8_,tu_,EOM_ };
//おいしいみず　２００円
const u8 str_VM01_01[]	 = { o_,i_,si_,i_,mi_,zu_,spc_,n2_,n0_,n0_,yen_,EOM_ };
//サイコソーダ　３００円
const u8 str_VM01_02[]	 = { SA_,I_,KO_,SO_,bou_,DA_,spc_,n3_,n0_,n0_,yen_,EOM_ };
//ミックスオレ　３５０円
const u8 str_VM01_03[]	 = { MI_,TTU_,KU_,SU_,O_,RE_,spc_,n3_,n5_,n0_,yen_,EOM_ };
//はしりかた
const u8 str_hasirikata[]	= {	ha_,si_,ri_,ka_,ta_,EOM_ };
//まがるコツ
const u8 str_magarukotsu[]	= {	ma_,ga_,ru_,KO_,TU_,EOM_ };
//すなのさか
const u8 str_sunanosaka[]	= {	su_,na_,no_,sa_,ka_,EOM_ };
//ウイリー
const u8 str_uirii[]		= {	U_,I_,RI_,bou_,EOM_ };
//ダニエル
const u8 str_danieru[]		= {	DA_,NI_,E_,RU_,EOM_ };
//ジャンプ
const u8 str_jump[]			= {	ZI_,YYA_,N_,PU_,EOM_ };
//まんぞく
const u8 str_manzoku[]		= {	ma_,n_,zo_,ku_,EOM_ };
//ふまん
const u8 str_human[]		= {	hu_,ma_,n_,EOM_ };
//しんかいのきば
const u8 str_kiba[]		= {	si_,n_,ka_,i_,no_,KI_,BA_,EOM_ };
//しんかいのうろこ
const u8 str_uroko[]	= {	si_,n_,ka_,i_,no_,U_,RO_,KO_,EOM_ };
//やめる
//const u8 str_yameru[]	= { ya_,me_,ru_,EOM_ };
//あおいビードロ
const u8 str_aoibi[]	= {	a_,o_,i_,BI_,bou_,DO_,RO_,EOM_ };
//きいろビードロ
const u8 str_kiirobi[]	= {	ki_,i_,ro_,BI_,bou_,DO_,RO_,EOM_ };
//あかいビードロ
const u8 str_akaibi[]	= {	a_,ka_,i_,BI_,bou_,DO_,RO_,EOM_ };
//しろいビードロ
const u8 str_shiroibi[]	= {	si_,ro_,i_,BI_,bou_,DO_,RO_,EOM_ };
//くろいビードロ
const u8 str_kuroibi[]	= {	ku_,ro_,i_,BI_,bou_,DO_,RO_,EOM_ };
//ガラスのいす
const u8 str_garasunoisu[]	= {	GA_,RA_,SU_,no_,i_,su_,EOM_ };
//ガラスのつくえ
const u8 str_garasunotukue[]	= {	GA_,RA_,SU_,no_,tu_,ku_,e_,EOM_ };
//キモリドール　　１０００まい
const u8 str_item_keihin01[]	= { KI_,MO_,RI_,DO_,bou_,RU_,spc_,spc_,spc_,n1_,n0_,n0_,n0_,ma_,i_,EOM_ };
//アチャモドール　　１０００まい
const u8 str_item_keihin02[]	= { A_,TI_,YYA_,MO_,DO_,bou_,RU_,spc_,spc_,n1_,n0_,n0_,n0_,ma_,i_,EOM_ };
//ミズゴロウドール　１０００まい
const u8 str_item_keihin03[]	= { MI_,ZU_,GO_,RO_,U_,DO_,bou_,RU_,spc_,n1_,n0_,n0_,n0_,ma_,i_,EOM_ };
//　５０まい　　１０００円
const u8 str_coin_50[]			= { spc_,n5_,n0_,ma_,i_,spc_,spc_,n1_,n0_,n0_,n0_,yen_,EOM_ };
//５００まい　１００００円
const u8 str_coin_500[]			= { n5_,n0_,n0_,ma_,i_,spc_,n1_,n0_,n0_,n0_,n0_,yen_,EOM_ };
//ばつぐん
const u8 str_tsuri_batugun[]	= { ba_,tu_,gu_,n_,EOM_ };
//あんまり
const u8 str_tsuri_anmari[]		= { a_,n_,ma_,ri_,EOM_ };

//トレジャーハンターアイテム１（あかいかけら）
const u8 str_hunter_item_r[] = {a_,ka_,i_,ka_,ke_,ra_,EOM_};
//トレジャーハンターアイテム２（きいろいかけら）
const u8 str_hunter_item_y[] = {ki_,i_,ro_,i_,ka_,ke_,ra_,EOM_};
//トレジャーハンターアイテム３（あおいかけら）
const u8 str_hunter_item_b[] = {a_,o_,i_,ka_,ke_,ra_,EOM_};
//トレジャーハンターアイテム４（みどりのかけら）
const u8 str_hunter_item_g[] = {mi_,do_,ri_,no_,ka_,ke_,ra_,EOM_};

//バトルタワー
const u8 str_tower[]			= {BA_,TO_,RU_,TA_,WA_,bou_,EOM_ };
//みぎ
const u8 str_right[]			= {mi_,gi_,EOM_ };
//ひだり
const u8 str_left[]				= {hi_,da_,ri_,EOM_ };

//わざマシン３２　　　１５００まい
const u8 str_waza_keihin01[]	= { wa_,za_,MA_,SI_,N_,n3_,n2_,spc_,spc_,n1_,n5_,n0_,n0_,ma_,i_,EOM_ };
//わざマシン２９　　　３５００まい
const u8 str_waza_keihin02[]	= { wa_,za_,MA_,SI_,N_,n2_,n9_,spc_,spc_,n3_,n5_,n0_,n0_,ma_,i_,EOM_ };
//わざマシン３５　　　４０００まい
const u8 str_waza_keihin03[]	= { wa_,za_,MA_,SI_,N_,n3_,n5_,spc_,spc_,n4_,n0_,n0_,n0_,ma_,i_,EOM_ };
//わざマシン２４　　　４０００まい
const u8 str_waza_keihin04[]	= { wa_,za_,MA_,SI_,N_,n2_,n4_,spc_,spc_,n4_,n0_,n0_,n0_,ma_,i_,EOM_ };
//わざマシン１３　　　４０００まい
const u8 str_waza_keihin05[]	= { wa_,za_,MA_,SI_,N_,n1_,n3_,spc_,spc_,n4_,n0_,n0_,n0_,ma_,i_,EOM_ };
//１かい
const u8 str_1kai[]				= { n1_,ka_,i_,EOM_ };
//２かい
const u8 str_2kai[]				= { n2_,ka_,i_,EOM_ };
//３かい
const u8 str_3kai[]				= { n3_,ka_,i_,EOM_ };
//４かい
const u8 str_4kai[]				= { n4_,ka_,i_,EOM_ };
//５かい
const u8 str_5kai[]				= { n5_,ka_,i_,EOM_ };
//かっこよさ
const u8 str_kakoyosa[]			= { ka_,ttu_,ko_,yo_,sa_,EOM_ };
//うつくしさ
const u8 str_utukusisa[]		= { u_,tu_,ku_,si_,sa_,EOM_ };
//かわいさ
const u8 str_kaiwasa[]			= { ka_,wa_,i_,sa_,EOM_ };
//かしこさ
const u8 str_kasikosa[]			= { ka_,si_,ko_,sa_,EOM_ };
//たくましさ
const u8 str_takumasisa[]		= { ta_,ku_,ma_,si_,sa_,EOM_ };
//ノーマル
const u8 str_nomaru[]			= { NO_,bou_,MA_,RU_,EOM_ };
//スーパー
const u8 str_suupaa[]			= { SU_,bou_,PA_,bou_,EOM_ };
//ハイパー
const u8 str_haipaa[]			= { HA_,I_,PA_,bou_,EOM_ };
//マスター
const u8 str_masutaa[]			= { MA_,SU_,TA_,bou_,EOM_ };
//かっこいい
const u8 str_kakoii[]			= { ka_,ttu_,ko_,i_,i_,EOM_ };
//うつくしい
const u8 str_utukusii[]			= { u_,tu_,ku_,si_,i_,EOM_ };
//かわいい
const u8 str_kawaii[]			= { ka_,wa_,i_,i_,EOM_ };
//かしこそうな
const u8 str_kasikosouna[]		= { ka_,si_,ko_,so_,u_,na_,EOM_ };
//たくましい
const u8 str_takumasii[]		= { ta_,ku_,ma_,si_,i_,EOM_ };
//どうぐ
const u8 str_dougu[]			= { do_,u_,gu_,EOM_ };
//たいせつなもの
const u8 str_taisetunamono[]	= { ta_,i_,se_,tu_,na_,mo_,no_,EOM_ };
//ボール
const u8 str_booru[]			= { BO_,bou_,RU_,EOM_ };
//わざマシン
const u8 str_wazamashin[]		= { wa_,za_,MA_,SI_,N_,EOM_ };
//きのみ
const u8 str_kinomi[]			= { ki_,no_,mi_,EOM_ };
//だれかのパソコン
const u8 str_paso01[]			= { da_,re_,ka_,no_,PA_,SO_,KO_,N_,EOM_ };
//マユミのパソコン
const u8 str_paso02[]			= { MA_,YU_,MI_,no_,PA_,SO_,KO_,N_,EOM_ };
//＃のパソコン
const u8 str_paso03[]			= { I_MSG_,MY_NAME_BUF,no_,PA_,SO_,KO_,N_,EOM_ };
//でんどういり
const u8 str_paso04[]			= { de_,n_,do_,u_,i_,ri_,EOM_ };
//スイッチをきる
const u8 str_paso05[]			= { SU_,I_,TTU_,TI_,wo_,ki_,ru_,EOM_ };


/*==================================================================*/
//	スクリプト関連　	scr_tool.c
/*==================================================================*/
//９９かい　いじょう
const u8 str_countover[] = { n9_,n9_,ka_,i_,spc_,i_,zi_,yyo_,u_,EOM_ };
//１ぷん　いじょう
const u8 str_timeover[] = { n1_,pu_,n_,spc_,i_,zi_,yyo_,u_,EOM_ };
//びょう
const u8 str_byou[] = { bi_,yyo_,u_,EOM_ };
//かい
const u8 str_kai[] = { ka_,i_,EOM_ };
//．
const u8 str_ten[] = { ten_,EOM_ };
//おにいちゃん
const u8 str_onityan[]	= { o_,ni_,i_,ti_,yya_,n_,EOM_ };
//おねえちゃん
const u8 str_onetyan[]	= { o_,ne_,e_,ti_,yya_,n_,EOM_ };
//むすこ
const u8 str_musuko[]	= { mu_,su_,ko_,EOM_ };
//むすめ
const u8 str_musume[]	= { mu_,su_,me_,EOM_ };
//火山灰メニュー(あおいビードロ)
const u8 msg_aoibi[]			= {	a_,o_,i_,BI_,bou_,DO_,RO_,EOM_ };
//火山灰メニュー(きいろビードロ)
const u8 msg_kiirobi[]		= {	ki_,i_,ro_,BI_,bou_,DO_,RO_,EOM_ };
//火山灰メニュー(あかいビードロ)
const u8 msg_akaibi[]		= {	a_,ka_,i_,BI_,bou_,DO_,RO_,EOM_ };
//火山灰メニュー(しろいビードロ)
const u8 msg_shiroibi[]		= {	si_,ro_,i_,BI_,bou_,DO_,RO_,EOM_ };
//火山灰メニュー(くろいビードロ)
const u8 msg_kuroibi[]		= {	ku_,ro_,i_,BI_,bou_,DO_,RO_,EOM_ };
//火山灰メニュー(きれいなイス)
const u8 msg_kireinaisu[]	= {	ki_,re_,i_,na_,I_,SU_,EOM_ };
//火山灰メニュー(きれいなつくえ)
const u8 msg_kireinatukue[]	= {	ki_,re_,i_,na_,tu_,ku_,e_,EOM_ };
//火山灰メニュー(やめる)
//const u8 msg_yameru[]		= {	ya_,me_,ru_,EOM_ };
//フロアメッセージ(１かい)
const u8 msg1F[] = { n1_,ka_,i_,EOM_ };
//フロアメッセージ(２かい)
const u8 msg2F[] = { n2_,ka_,i_,EOM_ };
//フロアメッセージ(３かい)
const u8 msg3F[] = { n3_,ka_,i_,EOM_ };
//フロアメッセージ(４かい)
const u8 msg4F[] = { n4_,ka_,i_,EOM_ };
//フロアメッセージ(５かい)
const u8 msg5F[] = { n5_,ka_,i_,EOM_ };
//フロアメッセージ(６かい)
const u8 msg6F[] = { n6_,ka_,i_,EOM_ };
//フロアメッセージ(７かい)
const u8 msg7F[] = { n7_,ka_,i_,EOM_ };
//フロアメッセージ(８かい)
const u8 msg8F[] = { n8_,ka_,i_,EOM_ };
//フロアメッセージ(９かい)
const u8 msg9F[] = { n9_,ka_,i_,EOM_ };
//フロアメッセージ(１０かい)
const u8 msg10F[] = { n1_,n0_,ka_,i_,EOM_ };
//フロアメッセージ(１１かい)
const u8 msg11F[] = { n1_,n1_,ka_,i_,EOM_ };
//フロアメッセージ(Ｂ１かい)
const u8 msgB1F[] = { BI_,n1_,ka_,i_,EOM_ };
//フロアメッセージ(Ｂ２かい)
const u8 msgB2F[] = { BI_,n2_,ka_,i_,EOM_ };
//フロアメッセージ(Ｂ３かい)
const u8 msgB3F[] = { BI_,n3_,ka_,i_,EOM_ };
//フロアメッセージ(Ｂ４かい)
const u8 msgB4F[] = { BI_,n4_,ka_,i_,EOM_ };
//フロアメッセージ(おくじょう)
const u8 msgTOP[] = { o_,ku_,zi_,yyo_,u_,EOM_ };
//げんざいのフロア
const u8 msg_genzai[] = { ge_,n_,za_,i_,no_,HU_,RO_,A_,EOM_ };


/*==================================================================*/
//	den_oyaji.c
/*==================================================================*/
const u8 msg_cancel_string[] = { ya_,me_,ru_,EOM_ };


/*==================================================================*/
//	box.c
/*==================================================================*/
// ボックス内メッセージ
const u8 BoxMsg00[]={BO_,TTU_,KU_,SU_,wo_,spc_,si_,yyu_,u_,ri_,yyo_,u_,si_,ma_,su_,ka_,hate_,spc_,EOM_};
const u8 BoxMsg01[]={ko_,no_,BO_,TTU_,KU_,SU_,wo_,spc_,do_,u_,si_,ma_,su_,ka_,hate_,EOM_};
const u8 BoxMsg02[]={do_,no_,spc_,TE_, bou_, MA_, ni_,si_,ma_,su_,ka_,hate_,EOM_};
const u8 BoxMsg03[]={do_,no_,spc_,ka_,be_,ga_,mi_,ni_,si_,ma_,su_,ka_,hate_,EOM_};
const u8 BoxMsg04[]={wo_,spc_,do_,u_,si_,ma_,su_,ka_,hate_,EOM_};
const u8 BoxMsg05[]={do_,no_,spc_,BO_,TTU_,KU_,SU_,ni_,spc_,ZI_,YYA_,N_,PU_,si_,ma_,su_,ka_,hate_,EOM_};
const u8 BoxMsg06[]={do_,no_,spc_,BO_,TTU_,KU_,SU_,ni_,spc_,a_,zu_,ke_,ma_,su_,ka_,hate_,EOM_};
const u8 BoxMsg07[]={wo_,spc_,a_,zu_,ke_,ma_,si_,ta_,EOM_,};
const u8 BoxMsg08[]={ko_ ,no_ ,BO_ ,TTU_,KU_ ,SU_ ,ha_ ,spc_,i_  ,ttu_,pa_ ,i_  ,da_ ,gyoe_, EOM_};
const u8 BoxMsg09[]={ho_,n_,to_,u_,ni_,spc_,ni_,ga_,si_,ma_,su_,ka_,hate_,EOM_};
const u8 BoxMsg10[]={wo_,spc_,so_,to_,ni_,spc_,ni_,ga_,si_,te_,a_,ge_,ta_,EOM_};
const u8 BoxMsg11[]={BA_,I_,BA_,I_,spc_,EOM_,gyoe_,EOM_};
const u8 BoxMsg12[]={MA_,bou_,KI_,N_,GU_,si_,te_,ku_,da_,sa_,i_,EOM_};
const u8 BoxMsg13[]={ta_, ta_, ka_,  u_, PO_, KE_, MO_,  N_, ga_,spc_,  i_, na_, ku_, na_, ri_, ma_, su_,gyoe_,EOM_, };  // たたかうポケモンが　いなくなります！
const u8 BoxMsg14[]={te_ ,mo_ ,ti_ ,ga_ ,spc_,i_  ,ttu_,pa_ ,i_  ,de_ ,su_ ,gyoe_, EOM_ };
const u8 BoxMsg15[]={PO_, KE_, MO_,  N_, wo_,spc_, tu_, ka_,  n_, da_, ma_, ma_, de_, su_, yo_,gyoe_,EOM_, };
const u8 BoxMsg16[]={  tu_, re_, te_,  i_, ku_,spc_, PO_, KE_, MO_,  N_, wo_,spc_,  e_, ra_,  n_, de_,gyoe_,EOM_, };
const u8 BoxMsg17[]={  TA_, MA_, GO_, wo_,spc_, ni_, ga_, su_, ko_, to_, ha_,spc_, de_, ki_, ma_, se_,  n_,gyoe_,EOM_, };  // たまごを　にがすことは　できません！
const u8 BoxMsg18[]={  BO_,TTU_, KU_, SU_, so_,  u_, sa_, wo_,spc_, tu_, du_, ke_, ma_, su_, ka_,hate_,EOM_, };  // ボックスそうさを　つづけますか？
const u8 BoxMsg19[]={  ha_, spc_, ka_, e_, ttu_, te_, ki_, ta_, gyoe_, EOM_ };  // は　かえってきた！
const u8 BoxMsg20[]={  si_, n_, pa_, i_, spc_, da_, ttu_, ta_, no_, ka_, na_, tenten_, tenten_, EOM_ };  // しんぱい　だったのかな……
const u8 BoxMsg21[]={tenten_,tenten_,tenten_,tenten_,tenten_,gyoe_,EOM_ };
const u8 BoxMsg22[]={ME_,bou_,RU_,wo_,spc_,ha_,zu_,si_,te_,spc_,ku_,da_,sa_,i_,gyoe_,EOM_}; // メールを　はずして　ください！

/*==================================================================*/
//	box2_menu.c
/*==================================================================*/
const u8 BoxMenuMsg_yameru[] =      { ya_ , me_ , ru_ , spc_, spc_, spc_, EOM_ };
const u8 BoxMenuMsg_azukeru[] =     { a_  , zu_ , ke_ , ru_ , spc_, spc_, EOM_ };
const u8 BoxMenuMsg_tureteiku[] =   { tu_ , re_ , te_ , i_  , ku_ , spc_, EOM_ };
const u8 BoxMenuMsg_irekaeru[] =    { i_  , re_ , ka_ , e_  , ru_ , spc_, EOM_ };
const u8 BoxMenuMsg_tukamu[] =      { tu_ , ka_ , mu_ , spc_, spc_, spc_, EOM_ };
const u8 BoxMenuMsg_oku[] =         { ko_ , ko_ , ni_ , o_  , ku_ , spc_, EOM_ };
const u8 BoxMenuMsg_yousu[] =       { yo_ , u_  , su_ , wo_ , mi_ , ru_ , EOM_ };
const u8 BoxMenuMsg_nigasu[] =      { ni_ , ga_ , su_ , spc_, spc_, spc_, EOM_ };
const u8 BoxMenuMsg_marking[] =     { MA_ , bou_, KI_ , N_,   GU_,  spc_, EOM_ };
const u8 BoxMenuMsg_namae[] =       { na_ , ma_ , e_  , spc_, spc_, spc_, EOM_ };
const u8 BoxMenuMsg_kirikaeru[] =   { ZI_,  YYA_, N_, PU_, EOM_ };
const u8 BoxMenuMsg_kabegami[] =    { ka_ , be_ , ga_ , mi_ , spc_, spc_, EOM_ };

const u8 BoxMenuMsg_wptheme0[] =    { hu_,  u_,  ke_,   i_,  n1_, EOM_ };
const u8 BoxMenuMsg_wptheme1[] =    { hu_,  u_,  ke_,   i_,  n2_, EOM_ };
const u8 BoxMenuMsg_wptheme2[] =    { hu_,  u_,  ke_,   i_,  n3_, EOM_ };
const u8 BoxMenuMsg_wptheme3[] =    {  E_,  TO_, SE_,  TO_,  RA_ , EOM_ };

const u8 BoxMenuMsg_wptype00[] =    { mo_,ri_,EOM_, };
const u8 BoxMenuMsg_wptype01[] =    { SI_, TE_, II_, EOM_ };
const u8 BoxMenuMsg_wptype02[] =    { sa_, ba_, ku_, EOM_ };
const u8 BoxMenuMsg_wptype03[] =    { SA_, BA_, N_, NA_,EOM_, };

const u8 BoxMenuMsg_wptype10[] =    { i_,wa_,ya_,ma_,EOM_, };
const u8 BoxMenuMsg_wptype11[] =    { ka_,za_,n_,EOM_, };
const u8 BoxMenuMsg_wptype12[] =    { yu_,ki_,ya_,ma_,EOM_, };
const u8 BoxMenuMsg_wptype13[] =    { do_,u_,ku_,tu_,EOM_, };

const u8 BoxMenuMsg_wptype20[] =    { u_,mi_,be_,EOM_, };
const u8 BoxMenuMsg_wptype21[] =    { ka_,i_,te_,i_,EOM_, };
const u8 BoxMenuMsg_wptype22[] =    { ka_,wa_,EOM_, };
const u8 BoxMenuMsg_wptype23[] =    { so_,ra_,EOM_, };

const u8 BoxMenuMsg_wptype30[] =    { mi_, zu_, ta_, ma_, EOM_ };
const u8 BoxMenuMsg_wptype31[] =    { PO_, KE_, SE_, N_,  EOM_ };
const u8 BoxMenuMsg_wptype32[] =    { ki_, ka_, i_, EOM_ };
const u8 BoxMenuMsg_wptype33[] =    { mu_,zi_,EOM_, };


/*==================================================================*/
//	boxsub.c
/*==================================================================*/
// パソコン→だれかのパソコンを選んだ時のメニュー
const u8 BoxCallMsg[] = { na_, ni_, wo_, spc_, si_, ma_, su_, ka_, hate_, EOM_ };
const u8 BoxCallMenu0[] = { PO_,KE_,MO_,N_ , wo_,spc_,tu_,re_,te_,i_ ,ku_, EOM_ };
const u8 BoxCallMenu1[] = { PO_,KE_,MO_,N_ , wo_,spc_,a_ ,zu_,ke_,ru_,spc_,EOM_ };
const u8 BoxCallMenu2[] = { BO_,TTU_,KU_,SU_,wo_,spc_,se_,i_ ,ri_,su_,ru_, EOM_ };
const u8 BoxCallMenu3[] = { sa_,yo_,u_ ,na_,ra_,EOM_ };
const u8 BoxInfoStr0[] ={  BO_,TTU_, KU_, SU_, ni_,spc_,  a_, zu_, ke_, te_,  i_, ru_,spc_, PO_, KE_, MO_,  N_, wo_,spc_,CR_, te_, mo_, ti_, ni_,spc_, ku_, wa_,  e_, ru_,spc_, ko_, to_, ga_,spc_, de_, ki_, ma_, su_,spc_,EOM_, };
const u8 BoxInfoStr1[] ={  te_, mo_, ti_, no_,spc_, PO_, KE_, MO_,  N_, wo_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,CR_,BO_,TTU_, KU_, SU_, ni_,spc_,  a_, zu_, ke_, ru_,spc_, ko_, to_, ga_,spc_, de_, ki_, ma_, su_,EOM_, };
const u8 BoxInfoStr2[] ={  BO_,TTU_, KU_, SU_, ni_,spc_,  a_, zu_, ke_, te_,  i_, ru_,spc_, PO_, KE_, MO_,  N_, ya_,spc_,CR_, te_, mo_, ti_, no_,spc_, PO_, KE_, MO_,  N_, wo_,spc_, se_,  i_, ri_,spc_, de_, ki_, ma_, su_,EOM_, };
const u8 BoxInfoStr3[] ={  hi_, to_, tu_,spc_, ma_,  e_, no_,spc_, ME_, NI_,YYU_,bou_, ni_,spc_, mo_, do_, ri_, ma_, su_,CR_, spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,EOM_, };
const u8 BoxMenuAlert0[] = {  te_, mo_, ti_, PO_, KE_, MO_,  N_, ga_,spc_, n1_, hi_,  ki_, si_, ka_,  i_, ma_, se_,  n_,gyoe_,CR_, spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,EOM_, };  // てもちポケモンが　１ひきしかいません！
const u8 BoxMenuAlert1[] = {  te_, mo_, ti_, PO_, KE_, MO_,  N_, ga_,spc_,  i_,ttu_, pa_,  i_, de_, su_,gyoe_,spc_,spc_,spc_,CR_, spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,spc_,EOM_, };  // てもちポケモンが　いっぱいです！　　　

// ボックス名のデフォルト文字列（この後ろに１、２など通し番号がつく）
const u8 BoxNameHeaderStr[] = { BO_, TTU_, KU_, SU_, EOM_, };

/*==================================================================*/
//	tnavi_bg.c
/*==================================================================*/
// ポケナビ／メニュー画面の説明テキスト
const u8 PNMenuMsg00[] = { spc_, spc_, HO_,  U_,  E_,  N_, ti_, ho_,  u_, no_,spc_, MA_,TTU_, PU_, wo_,spc_, mi_, ma_, su_,spc_,spc_,spc_, EOM_, };
const u8 PNMenuMsg01[] = { spc_, spc_,spc_, PO_, KE_, MO_,  N_, wo_,spc_, ku_, wa_, si_, ku_,spc_, si_, ra_, be_, ma_, su_,spc_,spc_,spc_, EOM_, };
const u8 PNMenuMsg02[] = { spc_,spc_, TO_, RE_,bou_, NA_,bou_, no_,spc_, zi_,yyo_,  u_, ho_,  u_, wo_,spc_, mi_, ma_, su_,spc_,spc_,spc_,EOM_, };
const u8 PNMenuMsg03[] = { spc_, spc_, te_, ni_,  i_, re_, ta_,spc_, ki_, ne_,  n_, RI_, BO_,  N_, wo_,spc_, mi_, ma_, su_,spc_,spc_,spc_, EOM_, };
const u8 PNMenuMsg04[] = { spc_, spc_,spc_,spc_,spc_, PO_, KE_, NA_, BI_, wo_,spc_, si_, ma_,  i_, ma_, su_,spc_,spc_,spc_,spc_,spc_,spc_, EOM_, };
const u8 PNMenuMsg05[] = { RI_, BO_,  N_, wo_,spc_, mo_,ttu_, te_,  i_, ru_,spc_, PO_, KE_, MO_,  N_, ga_,spc_,  i_, ma_, se_,  n_, spc_, EOM_, };
const u8 PNMenuMsg06[] = { spc_, TO_, RE_,bou_, NA_,bou_, ga_,spc_, to_,  u_, ro_, ku_,spc_, sa_, re_, te_,  i_, ma_, se_,  n_,spc_,EOM_, };
const u8 PNMenuMsg07[] = { spc_,  te_, mo_, ti_, PO_, KE_, MO_,  N_, wo_,spc_, ku_, wa_, si_, ku_,spc_, si_, ra_, be_, ma_, su_,spc_,spc_, EOM_, };
const u8 PNMenuMsg08[] = { spc_,  su_, be_, te_, no_, PO_, KE_, MO_,  N_, wo_,spc_, ku_, wa_, si_, ku_,spc_, si_, ra_, be_, ma_, su_,spc_, EOM_, };
const u8 PNMenuMsg09[] = { spc_, spc_, PO_, KE_, NA_, BI_, no_,spc_, ME_, NI_,YYU_,bou_, ni_,spc_, mo_, do_, ri_, ma_, su_,spc_,spc_,spc_, EOM_, };
const u8 PNMenuMsg10[] = { spc_, spc_, ka_,ttu_, ko_,  i_,  i_,spc_, PO_, KE_, MO_,  N_, wo_,spc_, mi_, tu_, ke_, ma_, su_,spc_,spc_,spc_, EOM_, };
const u8 PNMenuMsg11[] = { spc_, spc_,  u_, tu_, ku_, si_,  i_,spc_, PO_, KE_, MO_,  N_, wo_,spc_, mi_, tu_, ke_, ma_, su_,spc_,spc_,spc_, EOM_, };
const u8 PNMenuMsg12[] = { spc_, spc_,spc_, ka_, wa_,  i_,  i_,spc_, PO_, KE_, MO_,  N_, wo_,spc_, mi_, tu_, ke_, ma_, su_,spc_,spc_,spc_, EOM_, };
const u8 PNMenuMsg13[] = { spc_, spc_,spc_, ka_, si_, ko_,  i_,spc_, PO_, KE_, MO_,  N_, wo_,spc_, mi_, tu_, ke_, ma_, su_,spc_,spc_,spc_, EOM_, };
const u8 PNMenuMsg14[] = { spc_, spc_, ta_, ku_, ma_, si_,  i_,spc_, PO_, KE_, MO_,  N_, wo_,spc_, mi_, tu_, ke_, ma_, su_,spc_,spc_,spc_, EOM_, };
const u8 PNMenuMsg15[] = { spc_,  KO_,  N_, DE_, II_, SI_,YYO_,  N_, no_,spc_, ME_, NI_,YYU_,bou_, ni_,spc_, mo_, do_, ri_, ma_, su_,spc_, EOM_, };

// ポケナビ／トレーナーアイ画面で使用するテキスト
const u8 TrainerEyeMsg0[] = {  to_,  u_, ro_, ku_,spc_, ni_,  n_, zu_,  u_,EOM_, };  // とうろく　にんずう
const u8 TrainerEyeMsg1[] = {  ta_,  i_, se_,  n_,spc_, ka_,  i_, su_,  u_,EOM_, };  // たいせん　かいすう

const u8 TrainerEyeCaption0[] = {CTRL_,C_PAL_,5, sa_,ku_,se_,n_,EOM_};
const u8 TrainerEyeCaption1[] = {CTRL_,C_PAL_,5, mo_,ttu_,te_,ru_,spc_,PO_,KE_,MO_,N_,EOM_};
const u8 TrainerEyeCaption2[] = {CTRL_,C_PAL_,5, zi_,ko_,si_,yyo_,u_,ka_,i_,EOM_};

// ポロックをあげる画面で使用するテキスト
const u8 CubeDemoSeikakuStr[] = { se_,i_,ka_,ku_,sura_,EOM_};

/*==================================================================*/
//	tnavi_sub.c
/*==================================================================*/
const u8 PN_temoti_str[] = { te_, mo_, ti_, PO_, KE_, MO_, N_, EOM_ };
const u8 PN_rank_str[] = { ba_, n_, me_, EOM_ };
const u8 PN_ribbon_str[] = { RI_, BO_, N_, EOM_ };

/*==================================================================*/
//	kaiwa.c
/*==================================================================*/
// 各入力モードの説明・確認用文字列
const u8 KaiwaMsg_self_info1[] = {  n4_, tu_, no_,spc_, ko_, to_, ba_, wo_,spc_, ku_, mi_,  a_, wa_, se_, te_,EOM_, };  // ４つの　ことばを　くみあわせて
const u8 KaiwaMsg_self_info2[] = {  PU_, RO_, HU_, II_,bou_, RU_, wo_,spc_, tu_, ku_, ro_,  u_,gyoe_,EOM_, };  // プロフィールを　つくろう！
const u8 KaiwaMsg_battle_info1[] = {  n6_, tu_, no_,spc_, ko_, to_, ba_, de_,spc_, ME_,TTU_, SE_,bou_, ZI_, wo_,spc_, tu_, ku_, ro_,  u_,gyoe_,EOM_, };  // ６つの　ことばで　メッセージを　つくろう！
const u8 KaiwaMsg_battle_info2[] = {  n7_, mo_, zi_, no_,spc_, ko_, to_, ba_, ha_,spc_, n1_, gi_,yyo_,  u_, ni_,spc_, n2_, tu_, ma_, de_,gyoe_,EOM_, };  // ７もじの　ことばは　１ぎょうに　２つまで！
const u8 KaiwaMsg_inter_info1[] = {   i_, ma_, no_,spc_, ki_, mo_, ti_, ni_,spc_, pi_,ttu_, ta_, ri_,  a_,  u_,EOM_, };  // いまの　きもちに　ぴったりあう
const u8 KaiwaMsg_inter_info2[] = {  ko_, to_, ba_, wo_,spc_, mi_, tu_, ke_, yo_,  u_,gyoe_,EOM_, };  // ことばを　みつけよう！
const u8 KaiwaMsg_inter4_info1[] = {  n4_, tu_, no_,spc_, ko_, to_, ba_, de_,EOM_, };  // ４つの　ことばで
const u8 KaiwaMsg_mail_info1[] = {  n9_, tu_, no_,spc_, ko_, to_, ba_, wo_,spc_, ku_, mi_,  a_, wa_, se_, te_,EOM_, };  // ９つの　ことばを　くみあわせて
const u8 KaiwaMsg_mail_info2[] = {  ME_,TTU_, SE_,bou_, ZI_, wo_,spc_, tu_, ku_, ro_,  u_,gyoe_,EOM_, };  // メッセージを　つくろう！
const u8 KaiwaMsg_song_info1[] = {  ko_,to_,ba_,wo_,spc_,n1_,tu_,da_,ke_,spc_,i_,re_,ka_,e_,te_,EOM_,};  // ことばを　１つだけ　いれかえて
const u8 KaiwaMsg_song_info2[] = {  O_,YA_,ZI_,no_,u_,ta_,wo_,spc_,yo_,ku_,si_,te_,spc_,a_,ge_,yo_,u_,gyoe_,EOM_}; // おやじのうたを　よくしてあげよう！
const u8 KaiwaMsg_jiko_kakunin1[] = {  PU_, RO_, HU_, II_,bou_, RU_, ha_,EOM_, };  // プロフィールは
const u8 KaiwaMsg_begin_kakunin1[] = {  ta_,  i_, se_,  n_, ga_,spc_, ha_, zi_, ma_, ru_, to_, ki_, no_,spc_,  ki_,  mo_, ti_, ha_,EOM_, };  // たいせんが　はじまるときの　きもちは
const u8 KaiwaMsg_won_kakunin1[] = {  ta_,  i_, se_,  n_, ni_,spc_, ka_,ttu_, ta_, to_, ki_, no_,spc_,  a_,  i_, sa_, tu_, ha_,EOM_, };  // たいせんに　かったときの　あいさつは
const u8 KaiwaMsg_lost_kakunin1[] = {  ta_,  i_, se_,  n_, ni_,spc_, ma_, ke_, ta_, to_, ki_, no_,spc_,  a_,  i_, sa_, tu_, ha_,EOM_, };  // たいせんに　まけたときの　あいさつは
const u8 KaiwaMsg_inter_kakunin1[] = {  ko_, ta_,  e_, ha_,EOM_, };  // こたえは
const u8 KaiwaMsg_mail_kakunin1[] = {  ME_,bou_, RU_, ni_,spc_, no_, se_, ru_,spc_,  ME_, TTU_, SE_, bou_, ZI_, ha_, EOM_ };  // メールに　のせる　メッセージは
const u8 KaiwaMsg_hagaki_kakunin1[] = {  ha_, ga_, ki_, ni_,spc_, no_, se_, ru_,spc_,  a_,  i_, sa_, tu_, ha_,EOM_, };  // はがきに　のせる　あいさつは
const u8 KaiwaMsg_song_kakunin1[]  = {   a_, ta_, ra_, si_,  i_,spc_,  u_, ta_, ha_,EOM_, };  // あたらしい　うたは
const u8 KaiwaMsg_pop_info1[] = {  n2_, tu_, no_,spc_, ko_, to_, ba_, wo_,spc_, ku_, mi_,  a_, wa_, se_, te_,EOM_, };  // ２つの　ことばを　くみあわせて
const u8 KaiwaMsg_pop_info2[] = {  ha_, ya_, ra_, se_, ta_,  i_,spc_, ko_, to_, ba_, wo_,spc_, tu_, ku_, ro_,  u_,gyoe_,EOM_, };  // はやらせたい　ことばを　つくろう！
const u8 KaiwaMsg_pop_kakunin1[] = {  ha_, ya_, ra_, se_, ta_,  i_,spc_, ko_, to_, ba_, ha_,EOM_, };  // はやらせたい　ことばは
const u8 KaiwaMsg_kakunin2[] = {  ko_, re_, de_,spc_,  i_,  i_, de_, su_, ka_,hate_,EOM_, };  // これで　いいですか？
const u8 KaiwaMsg_nice1[] = {  n2_, tu_, no_,spc_, ko_, to_, ba_, wo_,spc_, ku_, mi_,  a_, wa_, se_, te_,EOM_, };  // ２つの　ことばを　くみあわせて
const u8 KaiwaMsg_nice2[] = {   i_,  i_,spc_, ko_, to_, ba_, wo_,spc_,  o_, si_,  e_, te_,  a_, ge_, yo_,  u_,gyoe_,EOM_, };  // いい　ことばを　おしえてあげよう！

/*==================================================================*/
//	kaiwa_bg.c
/*==================================================================*/
// 確認メッセージなど
const u8 KaiwaMsg0[] = {  he_,  n_, si_,yyu_,  u_, ti_,yyu_,  u_, no_,spc_,  ko_,  to_, ba_, wo_,EOM_, };  // へんしゅうちゅうの　ことばを
const u8 KaiwaMsg1[] = {  ze_,  n_, bu_,spc_, ke_, si_, te_, mo_,spc_,  i_,  i_, de_, su_, ka_,hate_,EOM_, };  // ぜんぶ　けしても　いいですか？
const u8 KaiwaMsg2[] = {  he_,  n_, si_,yyu_,  u_, wo_,spc_, ya_, me_, ma_, su_, ka_,hate_,EOM_, };  // へんしゅうを　やめますか？
const u8 KaiwaMsg3[] = {  he_,  n_, si_,yyu_,  u_, si_, ta_,spc_,  ko_,  to_, ba_, ha_,spc_, ho_, zo_,  n_,EOM_, };  // へんしゅうした　ことばは　ほぞん
const u8 KaiwaMsg4[] = {  sa_, re_, ma_, se_,  n_, ga_,spc_,  i_,  i_, de_, su_, ka_,hate_,EOM_, };  // されませんが　いいですか？
const u8 KaiwaMsg5[] = {  na_, ni_, ka_,spc_, ko_, to_, ba_, wo_,spc_,  i_, re_, te_, ku_, da_, sa_,  i_,gyoe_,EOM_, };  // なにか　ことばを　いれてください！
const u8 KaiwaMsg6[] = {  ko_, to_, ba_, wo_, spc_, ze_, n_, bu_, spc_, ke_, su_, ko_, to_, ha_, spc_, de_, ki_, ma_, se_, n_, gyoe_, EOM_, }; // 
const u8 KaiwaMsg7[] = {  ka_,  e_, ra_, re_, ru_,spc_, ko_, to_, ba_, ha_,spc_, n1_, tu_,spc_, ma_, de_, de_, su_,gyoe_,EOM_, };  // かえられる　ことばは　１つ　までです！
const u8 KaiwaMsg8[] = {   u_, ta_, wo_,spc_, mo_, to_, ni_,spc_, mo_, do_, si_, ma_, su_, gyoe_, EOM_, };  // うたを　もとに　もどします！
const u8 KaiwaMsg9[] = {  so_, re_, ha_,spc_, mo_,  u_,spc_, ha_, ya_,ttu_, te_,  i_, ma_, su_, gyoe_, EOM_, };
const u8 KaiwaMsg10[] = {  n2_, tu_, no_,spc_, ko_, to_, ba_, wo_,spc_, ku_, mi_,  a_, wa_, se_, te_, ku_, da_, sa_,  i_,gyoe_,EOM_, };  // ２つの　ことばを　くみあわせてください！
const u8 KaiwaMsg11[] = {  ko_, to_, ba_, wo_,spc_,  o_, si_,  e_, ru_, no_, wo_,spc_, ya_, me_, ma_, su_, ka_,hate_,EOM_, };  // ことばを　おしえるのを　やめますか？
const u8 KaiwaMsg12[] = {  ME_,bou_, RU_, wo_,spc_, mo_, ta_, se_, ru_, no_, wo_,spc_, ya_, me_, ma_, su_, ka_,hate_,EOM_, };  // メールを　もたせるのを　やめますか？

// モードごとのキャプション
const u8 KaiwaCaption_self[] = {  PU_, RO_, HU_, II_, bou_, RU_, EOM_, };  // プロフィール
const u8 KaiwaCaption_battle[] = {  ta_, i_, se_, n_, ga_, spc_, ha_, zi_, ma_,ru_,to_,ki_,EOM_ }; // たいせんが　はじまるとき
const u8 KaiwaCaption_win[] =  {  ta_, i_, se_, n_, ni_, spc_, ka_, ttu_, ta_, to_, ki_, EOM_ }; // たいせんに　かったとき
const u8 KaiwaCaption_lose[] = {  ta_, i_, se_, n_, ni_, spc_, ma_, ke_,  ta_, to_, ki_, EOM_ }; // たいせんに　まけたとき
const u8 KaiwaCaption_song[] = {   O_, YA_, ZI_, no_,  u_, ta_,EOM_, };  // オヤジのうた
const u8 KaiwaCaption_pop[] = {  ha_, ya_,ttu_, te_,  i_, ru_,spc_, mo_, no_, ha_,hate_,EOM_, };  // はやっている　ものは？
const u8 KaiwaCaption_interview[] = {  I_, N_, TA_, BI_, YYU_, bou_, EOM_ }; // インタビュー
const u8 KaiwaCaption_niceword[] = {  i_, i_, spc_, ko_, to_, ba_, EOM_ };  // いい　ことば

/*==================================================================*/
//	oyaji.c
/*==================================================================*/
// メルヘンおやじのメッセージ

const u8 MeruhenSubWord0[] = { spc_, ki_, re_,  i_,spc_, da_, yo_, ne_,bou_,EOM_, };  // きれい　だよねー
const u8 MeruhenSubWord1[] = { spc_, ka_, wa_,  i_,  i_,spc_, yo_, ne_,bou_,EOM_, };  // かわいい　よねー
const u8 MeruhenSubWord2[] = { spc_, no_,  n_, bi_, ri_,spc_, da_, yo_, ne_,bou_,EOM_, };  // のんびり　だよねー
const u8 MeruhenSubWord3[] = { spc_, po_,ttu_, ka_, po_, ka_,spc_, da_, yo_, ne_,bou_,EOM_, };  // ぽっかぽか　だよねー
const u8 MeruhenSubWord4[] = { spc_, a_, ko_, ga_, re_, ru_,spc_, yo_, ne_,bou_,EOM_, };  // あこがれる　よねー
const u8 MeruhenSubWord5[] = { spc_, DO_, KI_, DO_, KI_,spc_, su_, ru_, yo_, ne_,bou_,EOM_, };  // ドキドキ　するよねー
const u8 MeruhenSubWord6[] = { spc_, o_, mo_, si_, ro_,  i_,spc_, yo_, ne_,bou_,EOM_, };  // おもしろい　よねー
const u8 MeruhenSubWord7[] = { spc_, hu_, si_, gi_,spc_, da_, yo_, ne_,bou_,EOM_, };  // ふしぎ　だよねー
const u8 MeruhenJoinWord[] = { ttu_, te_, EOM_ };
const u8 MeruhenEndWord[] = { CR_, so_, u_, spc_, o_, mo_, wa_, na_, i_, hate_, EOM_, };
const u8 MeruhenOriginalWord0[] = {  ta_, bi_, ni_,spc_, de_, ta_,  i_, na_,bou_,CR_, do_, ko_, ka_,spc_,  i_,  i_,spc_, to_, ko_, ro_,spc_, si_, ra_, na_,  i_,hate_,EOM_, };  // たびに　でたいなー　どこか　いい　ところ　しらない？
const u8 MeruhenOriginalWord1[] = {  n1_, n2_, n0_, si_,yyo_, ku_, no_,spc_, KU_, RE_, YO_,  N_,spc_, ka_,ttu_, ta_,  n_, da_, bou_, CR_,  i_,  i_, de_, si_,yyo_,  u_,hate_,EOM_, };  // ３６しょくの　クレヨン　かったんだ　いいでしょう？
const u8 MeruhenOriginalWord2[] = {  si_,yya_, bo_,  n_, da_, ma_, ni_,spc_, no_,ttu_, te_,spc_, to_, be_, ru_, yo_,  u_, ni_,CR_, na_, ra_, na_,  i_, ka_, na_,bou_,EOM_, };  // しゃぼんだまに　のって　とべるように　ならないかなー
const u8 MeruhenOriginalWord3[] = {  su_, na_, ha_, ma_, ni_,spc_, ka_,  i_, ta_,spc_, mo_, zi_, ha_,CR_, su_, gu_, ni_,spc_, ki_,  e_, ti_,yya_,  u_, no_, ga_,spc_, ka_, na_, si_,  i_, yo_, ne_, bou_, EOM_, };  // すなはまに　かいた　もじは　すぐに　きえちゃうのが　かなしいよね
const u8 MeruhenOriginalWord4[] = {  u_, mi_, no_,spc_, so_, ko_,ttu_, te_,spc_, do_,  u_, na_,ttu_, te_, ru_, no_, ka_, na_,bou_, CR_,  i_, ti_, do_, de_,spc_,  i_,  i_, ka_, ra_,spc_, mi_, te_,spc_, mi_, ta_,  i_, na_,bou_,EOM_, };  // 　うみの　そこって　どうなってるのかなー　いちどで　いいから　みて　みたいなー
const u8 MeruhenOriginalWord5[] = {  yu_,  u_, ya_, ke_, wo_,spc_, mi_, ru_, to_, CR_,  U_, TI_, ni_,spc_, ka_,  e_, ri_, ta_, ku_,spc_, na_, ra_, na_,  i_,hate_,EOM_, };  // 　ゆうやけを　みると　ウチに　かえりたく　ならない？
const u8 MeruhenOriginalWord6[] = {  mi_, do_, ri_, no_,spc_, si_, ba_, de_,spc_, ne_, ko_, ro_, ga_, ru_, to_, CR_, ki_, mo_, ti_,  i_,  i_, yo_, ne_,bou_,EOM_, };  // 　みどりの　しばで　ねころがると　きもちいいよねー
const u8 MeruhenOriginalWord7[] = {  hi_, mi_, tu_, ki_, ti_,spc_,ttu_, te_,spc_,  i_,  i_, yo_, ne_,gyoe_, CR_, na_,  n_, ka_,spc_, wa_, ku_, wa_, ku_,spc_, si_, te_, ko_, na_,  i_,hate_,EOM_, };  // 　ひみつきち　って　いいよね！　なんか　わくわく　してこない？

/*==================================================================*/
//	flying.c
/*==================================================================*/
// 特殊な場所表示のための文字列
const u8 PokemonLeagueStr[] = { PO_,KE_,MO_,N_,spc_,RI_,bou_,GU_,EOM_};
const u8 PokemonCenterStr[] = { PO_,KE_,MO_,N_,SE_,N_,TA_,bou_,EOM_, };

/*==================================================================*/
//	cubedemo.c
/*==================================================================*/
// ポロックをあげるポケモンを選ぶ画面
const u8 PolockMsg_CheckGive[] = {  ni_,spc_, PO_, RO_,TTU_, KU_, wo_,  spc_, a_, ge_, ma_, su_, ka_,hate_,EOM_, };  // に　ポロックをあげますか？
const u8 PolockMsg_Style[] ={  ka_,ttu_, ko_, yo_, sa_, EOM_, };  // かっこよさ
const u8 PolockMsg_Beautiful[] ={   u_, tu_, ku_, si_, sa_, EOM_, };  // うつくしさ
const u8 PolockMsg_Cute[] ={  ka_, wa_,  i_, sa_, EOM_, };  // かわいさ
const u8 PolockMsg_Clever[] ={  ka_, si_, ko_, sa_, EOM_, };  // かしこさ
const u8 PolockMsg_Strong[] ={  ta_, ku_, ma_, si_, sa_, EOM_, };  // たくましさ
const u8 PolockMsg_Up[] ={   ni_, spc_, mi_, ga_, ki_, ga_, spc_, ka_, ka_, ttu_, ta_, gyoe_, EOM_ }; // に　みがきが　かかった！
const u8 PolockMsg_Unchange[] = {  na_, ni_, mo_,spc_, ka_, wa_, ra_, na_, ka_,ttu_, ta_,gyoe_,EOM_, };  // なにも　かわらなかった！
const u8 PolockMsg_Tabenai[] = { mo_, u_, spc_, ko_,re_,i_,zi_,yyo_,u_,spc_,ta_,be_,na_,i_,spc_,mi_,ta_,i_,tenten_,EOM_,};



/*==================================================================*/
//	buc_chk.c
/*==================================================================*/
const	u8	buc_chk_msg[] = {
RE_,PO_,bou_,TO_,no_,spc_,ka_,ki_,ko_,mi_,ni_,spc_,si_,ttu_,pa_,i_,si_,ma_,si_,ta_,
CR_,
BA_,TTU_,KU_,A_,TTU_,PU_,KA_,bou_,TO_,RI_,TTU_,ZI_,no_,spc_,
ke_,n_,sa_,wo_,si_,ma_,su_,
CR_,
si_,ba_,ra_,ku_,o_,ma_,ti_,ku_,da_,sa_,i_,
CTRL_,C_FCOL_,2,kako2_,n1_,hu_,n_,ho_,do_,spc_,ka_,ka_,ri_,ma_,su_,kakot2_,
EOM_,
};

const	u8	buc_chk_NG_msg[] = {
BA_,TTU_,KU_,A_,TTU_,PU_,ki_,no_,u_,no_,spc_,ko_,si_,yyo_,u_,spc_,
ma_,ta_,ha_,spc_,zi_,yyu_,mi_,yyo_,u_,ga_,
CR_,
ki_,ma_,si_,ta_,kten_,SE_,bou_,BU_,su_,ru_,ko_,to_,ha_,spc_,
de_,ki_,ma_,se_,n_,ga_,spc_,ko_,no_,ma_,ma_,
CR_,
GE_,bou_,MU_,wo_,spc_,a_,so_,bu_,ko_,to_,ha_,de_,ki_,ma_,su_,
EOM_,
};

const	u8	buc_chk_NG2_msg[] = {
CTRL_,C_FCOL_,2,kako2_,ko_,no_,ma_,ma_,spc_,bo_,u_,ke_,n_,wo_,tu_,du_,ke_,ru_,ko_,to_,ha_,
spc_,de_,ki_,ma_,se_,n_,
CR_,
TA_,I_,TO_,RU_,ni_,spc_,mo_,do_,ri_,ma_,su_,kakot2_,
EOM_,
};

const	u8	buc_chk_retry_msg[] = {
ke_,n_,sa_,ga_,spc_,si_,yyu_,u_,ri_,yyo_,u_,si_,ma_,si_,ta_,gyoe_,
CR_,
mo_,u_,i_,ti_,do_,spc_,RE_,PO_,bou_,TO_,wo_,spc_,ka_,ki_,ko_,mi_,ma_,su_,
CR_,
si_,ba_,ra_,ku_,o_,ma_,ti_,ku_,da_,sa_,i_,
EOM_,
};

const	u8	buc_chk_OKreset_msg[] = {
RE_,PO_,bou_,TO_,no_,spc_,ka_,ki_,ko_,mi_,ha_,spc_,si_,yyu_,u_,ri_,yyo_,u_,si_,ma_,si_,ta_,
CR_,
CTRL_,C_FCOL_,2,kako2_,ko_,no_,ma_,ma_,spc_,bo_,u_,ke_,n_,wo_,tu_,du_,ke_,ru_,ko_,to_,ha_,
spc_,de_,ki_,ma_,se_,n_,
CR_,
TA_,I_,TO_,RU_,ni_,spc_,mo_,do_,ri_,ma_,su_,kakot2_,
EOM_,
};

const	u8	buc_chk_OKreturn_msg[] = {
RE_,PO_,bou_,TO_,no_,spc_,ka_,ki_,ko_,mi_,ha_,spc_,si_,yyu_,u_,ri_,yyo_,u_,si_,ma_,si_,ta_,
CR_,
CTRL_,C_FCOL_,2,kako2_,A__,BO_,TA_,N_,wo_,spc_,o_,si_,te_,ku_,da_,sa_,i_,kakot2_,
EOM_,
};

/*==================================================================*/
//	townmap.c
/*==================================================================*/
const u8 ExMapName_Ship[] = {re_,n_,ra_,ku_,se_,n_,EOM_};
const u8 ExMapName_Base[] = {hi_,mi_,tu_,ki_,ti_,EOM_};
const u8 ExMapName_Azito[] = {A_,ZI_,TO_,EOM_};

/*==================================================================*/
//	ev_time.c
/*==================================================================*/
const u8 msg_gtime_ask_reset[] = {
	R__,T__,C__,wo_,spc_,RI_,SE_,TTU_,TO_,si_,ma_,su_,
	CR_,
	A__,de_,spc_,ke_,ttu_,te_,i_,spc_,B__,de_,spc_,KI_,YYA_,N_,SE_,RU_,
	EOM_
};

const u8 str_now_time[] = {
	ge_,n_,za_,i_,no_,spc_,GE_,bou_,MU_,na_,i_,spc_,zi_,ka_,n_,EOM_
};

const u8 str_before_time[] = {
	ze_,n_,ka_,i_,no_,spc_,GE_,bou_,MU_,na_,i_,spc_,zi_,ka_,n_,EOM_
};

const u8 msg_gtime_please_input[] = {
	zi_,ka_,n_,wo_,spc_,sa_,i_,se_,ttu_,te_,i_,spc_,si_,te_,ku_,da_,sa_,i_,
	EOM_
};

const u8 msg_gtime_finish_input[] = {
	zi_,ka_,n_,wo_,spc_,sa_,i_,se_,ttu_,te_,i_,spc_,si_,ma_,si_,ta_,gyoe_,
	CR_,
	RE_,PO_,bou_,TO_,wo_,spc_,ka_,i_,te_,i_,ma_,su_,spc_,o_,ma_,ti_,ku_,da_,sa_,i_,
	EOM_
};

const u8 msg_gtime_finish_report[] = {
	RE_,PO_,bou_,TO_,wo_,spc_,ka_,ki_,ko_,mi_,ma_,si_,ta_,gyoe_,
	EOM_
};

const u8 msg_gtime_fail_report[] = {
	RE_,PO_,bou_,TO_,no_,spc_,ka_,ki_,ko_,mi_,ni_,
	CR_,
	si_,ttu_,pa_,i_,spc_,si_,ma_,si_,ta_,tenten_,
	EOM_
};

const u8 msg_gtime_no_savedata[] = {
	RE_,PO_,bou_,TO_,ga_,spc_,na_,i_,no_,de_,
	CR_,
	zi_,ka_,n_,no_,spc_,se_,ttu_,te_,i_,ha_,spc_,de_,ki_,ma_,se_,n_,gyoe_,
	EOM_
};

const u8 msg_gtime_enable[] = {
	GE_,bou_,MU_,na_,i_,spc_,zi_,ka_,n_,no_,spc_,si_,yyu_,u_,se_,i_,spc_,SI_,SU_,TE_,MU_,ga_,
	CR_,
	tu_,ka_,e_,ru_,spc_,yo_,u_,ni_,spc_,na_,ri_,ma_,si_,ta_,gyoe_,
	EOM_
};

//-------------------------------------------------------------------------
//	ポケモンレポートに　かきこんでいます
//	でんげんを　きらないで　ください
//-------------------------------------------------------------------------
const u8 report_writing_msg[]={
	PO_,KE_,MO_,N_,RE_,PO_,bou_,TO_,ni_,spc_,ka_,ki_,ko_,n_,de_,i_,ma_,su_,CR_,
	de_,n_,ge_,n_,wo_,spc_,ki_,ra_,na_,i_,de_,spc_,ku_,da_,sa_,i_,EOM_,
};
