static const u8 yesno[]={ha_,i_,spc_,CR_,i_,i_,e_,EOM_,};
static const u8 yajirushi[]={cursor_,EOM_,};
static const u8 blank[]={spc_,EOM_};


static const u8 endwait_msg[]={
	si_,yyu_,u_,ri_,yyo_,u_,ma_,ti_,de_,su_,spc_,spc_,spc_,EOM_,
};
static const u8 sioend_msg[]={
	a_,i_,te_,ga_,mi_,tu_,ka_,ra_,na_,i_,yo_,u_,de_,su_,CR_,
	mo_,u_,i_,ti_,do_,ya_,ri_,na_,o_,si_,te_,ku_,da_,sa_,i_,NORMAL_WAIT_,EOM_,
};

static const u8 title_msg[]={
	ki_,no_,mi_,BU_,RE_,N_,DA_,bou_,wo_,spc_,ki_,do_,u_,si_,ma_,su_,NORMAL_WAIT_,
	BA_,TTU_,GU_,ka_,ra_,spc_,ki_,no_,mi_,BU_,RE_,N_,DA_,bou_,ni_,spc_,i_,re_,ru_,CR_,
	ki_,no_,mi_,wo_,spc_,e_,ra_,n_,de_,ku_,da_,sa_,i_,NORMAL_WAIT_,EOM_,
};


static const u8 cube_msg[][5]={				//キューブの名前の冠の文字列
	{KA_,TTU_,KO_,I_,EOM_,},
	{KA_,WA_,I_,I_,EOM_,},
	{U_,TU_,KU_,SI_,EOM_,},
	{KA_,SI_,KO_,I_,EOM_,},
	{TA_,KU_,MA_,SI_,EOM_,},
};

static const u8 normalwait_msg[]={
	NORMAL_WAIT_,EOM_,
};
#ifdef DEBUG_PARAMETA
static const u8 end_msg[]={
	spc_,ga_,de_,ki_,ta_,gyoe_,EOM_,
};
#else
static const u8 end_msg[]={
	spc_,ga_,de_,ki_,ta_,gyoe_,EOM_,
};
#endif

static const u8 testplayer[4][10]={
	{te_,tu_,zi_,EOM_,},
	{a_,ki_,to_,EOM_,},
	{SI_,GE_,RU_,EOM_,},
	{YO_,SI_,NO_,RI_,EOM_,}
};

static const u8 ok_msg[][6]={
	{n2_,P__,o__,k__,EOM_},
	{n3_,P__,o__,k__,EOM_},
	{n4_,P__,o__,k__,EOM_},
};
#if 0
static const u8 ok_msg[][6]={
	{EOM_},
	{EOM_},
	{EOM_},
};
#endif

static const u8 player_name[][4]={
	{n1_,P__,EOM_},
	{n2_,P__,EOM_},
	{n3_,P__,EOM_},
	{n4_,P__,EOM_},
};

static const u8 npc_name[][6]={
	{o_,zi_,sa_,n_,EOM_},
	{o_,to_,ko_,no_,ko_,EOM_},
	{o_,n_,na_,no_,ko_,EOM_},
};

static const u8 colorchange_msg[]={CTRL_,C_FCOL_,COL_RED,EOM_};

//static const u8 start_msg[]={ EOM_,};
static const u8 start_msg[]={ A__,BO_,TA_,N_,de_,spc_,SU_,TA_,bou_,TO_,si_,ma_,su_,EOM_,};
static const u8 wait_msg[]={si_,yyo_,u_,si_,yyo_,u_,o_,ma_,ti_,ku_,da_,sa_,i_,EOM_,};
//static const u8 wait_msg[]={EOM_,};
static const u8 taiki_msg[]={tu_,u_,si_,n_,ta_,i_,ki_,ti_,yyu_,u_,de_,su_,EOM_,};
static const u8 retry_msg[]={mo_,u_,i_,ti_,do_,spc_,ki_,no_,mi_,wo_,spc_,ma_,ze_,ma_,su_,ka_,hate_,CR_,
							spc_,spc_,spc_,spc_,EOM_,};
static const u8 noseed_msg[]={ki_,no_,mi_,BU_,RE_,N_,DA_,bou_,ni_,spc_,i_,re_,ru_,spc_,ki_,no_,mi_,ga_,CR_,
							na_,i_,no_,de_,spc_,ko_,re_,i_,zi_,yyo_,u_,spc_,de_,ki_,ma_,se_,n_,NORMAL_WAIT_,EOM_,};
static const u8 fullcube_msg[]={PO_,RO_,TTU_,KU_,KE_,bou_,SU_,ga_,spc_,i_,ttu_,pa_,i_,no_,spc_,yo_,u_,de_,su_,NORMAL_WAIT_,EOM_,};

static const u8 sio_noseed_msg[]={ha_,spc_,ki_,no_,mi_,BU_,RE_,N_,DA_,bou_,ni_,CR_,
							i_,re_,ru_,spc_,ki_,no_,mi_,ga_,na_,i_,yo_,u_,de_,su_,EOM_,};
static const u8 sio_fullcube_msg[]={ha_,spc_,PO_,RO_,TTU_,KU_,KE_,bou_,SU_,ga_,CR_,
								i_,ttu_,pa_,i_,no_,spc_,yo_,u_,de_,su_,NORMAL_WAIT_,EOM_,};

static const u8 resultmsg0[]={	ma_,ze_,ta_,ke_,ttu_,ka_,EOM_,		};
static const u8 resultmsg1[]={	i_,re_,ta_,spc_,ta_,ne_,EOM_,	};
static const u8 nomimsg[] = { no_,mi_,EOM_,};
static const u8 resultmsg2[]={	zi_,ka_,n_,EOM_,				};
static const u8 hunmsg[]={hu_,n_,EOM_};
static const u8 byoumsg[] = {bi_,yyo_,u_,EOM_};
static const u8 resultmsg3[]={	sa_,i_,ko_,u_,so_,ku_,do_,EOM_,	};
static const u8 kmmsg[]={r__,p__,m__,EOM_};
static const u8 konmamsg[]={ten_,EOM_};
static const u8 crmsg[]={CR_,EOM_};
static const u8 spcmsg[]={spc_,EOM_};

static const u8 rankingmsg[]={RA_,N_,KI_,N_,GU_,EOM_};

static const u8 level_msg[]={RE_,BE_,RU_,EOM_};
static const u8 nameraka_msg[]={de_,spc_,na_,me_,ra_,ka_,sa_,ha_,EOM_,};
static const u8 comentend_msg[] = {da_,EOM_};