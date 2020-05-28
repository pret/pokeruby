//===============================================================
//
//	外部追加データ
//
//===============================================================

#include "AgbDefine.s"

#include "usescript.h"		// スクリプトコマンドヘッダ
#include "ex_load.h"

	.ALIGN
	.SET	EX_CMD_S_GLOBAL,TRUE
#include "ex_cmd.h"			// 外部データ用コマンド定義



@----------------------------------------------------------
@
@----------------------------------------------------------
	.ALIGN
	.section	.rodata


@----------------------------------------------------------
@	外部データ取得時のメッセージデータ
@----------------------------------------------------------
#include "../script/exdata.mes"



#ifdef	PM_DEBUG
@----------------------------------------------------------
@	外部データ・むげんのチケット
@----------------------------------------------------------
_EXTRA_DATA_START_LABEL	ExtraDataStartMugenTicketScript
	_EXTRA_DATA_MINE_VALUE

	_EXTRA_CHECK_CRC		0,check_start_mugen_ticket,check_end_mugen_ticket
check_start_mugen_ticket:

//とりあえずデータを反映
	_EXTRA_SET_SCROBJ		C101,C101_R0201,PAPA_01_C101_R0201
	_EXTRA_SET_SCRADRS		mugen_ticket_script_start,mugen_ticket_script_end
	_EXTRA_SET_DISTITEM		1,5,ITEM_MUGENNOTIKETTO

//判定スクリプトを動作させる
	_EXTRA_DO_SCRIPT		mugen_check_script_start

	_EXTRA_DATA_END

msg_mugen_ticket_get:
	.byte	TO_,U_,KA_,ZI_,MU_,no_,spc_,PA_,PA_,ni_
	.byte	CR_
	.byte	a_,i_,ni_,spc_,i_,ttu_,te_,ne_
	.byte	EOM_

/* スクリプトデータ開始 */
mugen_ticket_script_start:
	_INIT_RELATIVE_ADRS		mugen_ticket_script_start

	@すでにむげんのチケットを持っているか？
	_CHECK_ITEM			ITEM_MUGENNOTIKETTO,1
	_IFVAL_JUMPR		ANSWORK,EQ,TRUE,ev_mugen_already_get
	_CHECK_BOX_ITEM		ITEM_MUGENNOTIKETTO,1
	_IFVAL_JUMPR		ANSWORK,EQ,TRUE,ev_mugen_already_get
	@南の孤島で戦ったことがあるか？
	_IF_FLAGON_JUMPR	FE_KOKORO_BATTLE,ev_mugen_already_get

	_TALK_OBJ_START

	_TALKMSG_REL		exmsg_senri_01_p01_kokoro01
	_TALK_WAIT
	_AB_KEYWAIT

	@バッグに空きはあるか？
	_ADD_ITEM_CHK		ITEM_MUGENNOTIKETTO,1
	_IFVAL_JUMPR		ANSWORK,EQ,FALSE,ev_mugen_bag_full

	_ITEM_EVENT			ITEM_MUGENNOTIKETTO,1
	_FLAG_SET			SYS_KOKORO_EVENT			@南の孤島イベント許可！

	_TALKMSG_REL		exmsg_senri_01_p02_kokoro01
	_TALK_WAIT
	_AB_KEYWAIT
	_TALK_OBJ_END

ev_mugen_already_get:
	_CLEAR_EX_SCRIPT			@外部スクリプト消去＆終了！

ev_mugen_bag_full:
	_TALKMSG_REL		exmsg_senri_01_p03_kokoro01
	_TALK_WAIT
	_AB_KEYWAIT
	_TALK_OBJ_END
	_END

// ●センリ
// ●「むげんのチケット」入手時
// ■□□□□□□□□□□□□□□□□□□□□■
exmsg_senri_01_p01_kokoro01:
	.byte	PA_,PA_,kako2_,I_MSG_,MY_NAME_BUF,gyoe_,spc_,yo_,ku_,spc_,ki_,ta_,na_,gyoe_
	.byte	CR_
	.byte	I_MSG_,MY_NAME_BUF,a_,te_,no_,spc_,te_,ga_,mi_,ga_,spc_,to_,do_,ke_,ra_,re_,ta_,zo_
	.byte	EOM_

// ■□□□□□□□□□□□□□□□□□□□□■
// ●アイテム「むげんのチケット」入手
// ●続けて……
// ■□□□□□□□□□□□□□□□□□□□□■
exmsg_senri_01_p02_kokoro01:
	.byte	PA_,PA_,kako2_,wa_,ta_,si_,mo_,spc_,mi_,ta_,ko_,to_,no_,na_,i_
	.byte	CR_
	.byte	hu_,ne_,no_,spc_,TI_,KE_,TTU_,TO_,spc_,da_,na_,tenten_,tenten_
	.byte	SCROLL_WAIT_
	.byte	MI_,NA_,MO_,ni_,spc_,i_,ttu_,te_,mi_,ru_,to_,spc_,i_,i_,da_,ro_,u_
	.byte	EOM_

exmsg_senri_01_p03_kokoro01:
	.byte	PA_,PA_,kako2_,si_,ka_,si_,spc_,I_MSG_,MY_NAME_BUF
	.byte	CR_
	.byte	ta_,i_,se_,tu_,na_,mo_,no_,ga_,spc_,i_,ttu_,pa_,i_,spc_,da_,na_
	.byte	NORMAL_WAIT_
	.byte	PA_,SO_,KO_,N_,ni_,spc_,a_,zu_,ke_,te_,ka_,ra_,spc_,ma_,ta_,ki_,na_,sa_,i_
	.byte	EOM_

mugen_ticket_script_end:
/* スクリプトデータ終了 */

/* むげんのチケットイベントを反映させるかどうかのチェックスクリプト */
mugen_check_script_start:
	_INIT_RELATIVE_ADRS		mugen_check_script_start

	@すでにむげんのチケットを持っているか？
	_CHECK_ITEM				ITEM_MUGENNOTIKETTO,1
	_IFVAL_JUMPR			ANSWORK,EQ,TRUE,mugen_result_already
	_CHECK_BOX_ITEM			ITEM_MUGENNOTIKETTO,1
	_IFVAL_JUMPR			ANSWORK,EQ,TRUE,mugen_result_already
	@南の孤島で戦ったことがあるか？
	_IF_FLAGON_JUMPR		FE_KOKORO_BATTLE,mugen_result_already

	@バッグに空きはあるか？
	_ADD_ITEM_CHK			ITEM_MUGENNOTIKETTO,1
	_IFVAL_JUMPR			ANSWORK,EQ,FALSE,mugen_result_bag_full

	_EXPAND_MSG_REL			msg_mugen_ticket_get
	_SET_EXDATA_ERROR	EXRUN_RET_NORMAL_MSG_END
	_END

mugen_result_already:
	_EXPAND_MSG_REL			exmsg_mugen_result_already
	_SET_EXDATA_ERROR	EXRUN_RET_ERROR_MSG_END
	_END

mugen_result_bag_full:
	_EXPAND_MSG_REL			exmsg_mugen_result_bag_full
	_SET_EXDATA_ERROR	EXRUN_RET_ERROR_MSG_END
	_END

exmsg_mugen_result_already:
	.byte	ko_,no_,spc_,de_,ki_,go_,to_,ha_,spc_,i_,ti_,do_,spc_,si_,ka_
	.byte	CR_
	.byte	a_,so_,bu_,spc_,ko_,to_,ga_,spc_,de_,ki_,ma_,se_,n_,gyoe_
	.byte	EOM_

exmsg_mugen_result_bag_full:
	.byte	ta_,i_,se_,tu_,na_,mo_,no_,PO_,KE_,TTU_,TO_,ga_
	.byte	CR_
	.byte	i_,ttu_,pa_,i_,spc_,de_,su_,gyoe_
	.byte	EOM_

mugen_check_script_end:

/*	チェックスクリプト終了 */

check_end_mugen_ticket:

_EXTRA_DATA_END_LABEL	ExtraDataEndMugenTicketScript








//===============================================================
//
//		外部データサンプル（デバッグ用）
//
//===============================================================

@----------------------------------------------------------
@	外部データサンプル・ラム木の実
@----------------------------------------------------------
_EXTRA_DATA_START_LABEL	SampleExtraSeedDataStart
	_EXTRA_DATA_MINE_VALUE

	_EXTRA_CHECKSUM			0, check_ramseed_start, check_ramseed_end
check_ramseed_start:
	_EXTRA_SET_RAM_SEED		sample_ram_seed_data
	_EXTRA_DATA_END

_EXTRA_LABEL	sample_ram_seed_data
	.space	0x0530,0

check_ramseed_end:
_EXTRA_DATA_END_LABEL	SampleExtraSeedDataEnd




@----------------------------------------------------------
@	外部データサンプル・ポケモンを手持ちに加える
@----------------------------------------------------------
_EXTRA_DATA_START_LABEL	ExtraDataStartSamplePokeData
	_EXTRA_DATA_MINE_VALUE

	_EXTRA_DO_SCRIPT		test_poke_script_start
	_EXTRA_SET_NORMAL_MSG	msg_pokedata_script_success
	_EXTRA_SET_ERROR_MSG	msg_pokedata_script_error

	_EXTRA_DATA_END

test_poke_script_start:
	_INIT_RELATIVE_ADRS		test_pokedata_script
	_GET_TEMOTI_NUM
	_IFVAL_JUMPR		ANSWORK,EQ,6,error_test_pokedata_script
	_ADD_POKEMON		MONSNO_RABUKASU,15,ITEM_KINOMIZYUUSU,0,0,0
	_SET_EXDATA_ERROR	EXRUN_RET_NORMAL_MSG_END
	_END

error_test_pokedata_script:
	_SET_EXDATA_ERROR	EXRUN_RET_ERROR_MSG_END
	_END
test_poke_script_end:

msg_pokedata_script_success:
	.byte	te_,mo_,ti_,ni_,spc_,PO_,KE_,MO_,N_,ga_
	.byte	CR_
	.byte	i_,ttu_,pi_,ki_,spc_,ku_,wa_,wa_,ttu_,ta_,gyoe_
	.byte	EOM_

msg_pokedata_script_error:
	.byte	te_,mo_,ti_,ga_,spc_,i_,ttu_,pa_,i_,spc_,de_,su_
	.byte	CR_
	.byte	PO_,KE_,MO_,N_,wo_,spc_,mo_,ra_,e_,ma_,se_,n_,de_,si_,ta_
	.byte	EOM_

_EXTRA_DATA_END_LABEL	ExtraDataEndSamplePokeData

@----------------------------------------------------------
@	外部データサンプル・リボンを追加する
@----------------------------------------------------------
_EXTRA_DATA_START_LABEL	ExtraDataStartSampleRibbon
	_EXTRA_DATA_MINE_VALUE

	_EXTRA_CHECK_CRC	0, check_ribbon_sample_start, ExtraDataEndSampleRibbon
check_ribbon_sample_start:
	_EXTRA_SET_RIBBON	0,1
	_EXTRA_DATA_END

_EXTRA_DATA_END_LABEL	ExtraDataEndSampleRibbon

@----------------------------------------------------------
@	外部データサンプル・ぜんこくずかんモードオン
@----------------------------------------------------------
_EXTRA_DATA_START_LABEL	ExtraDataStartSampleZukan
	_EXTRA_DATA_MINE_VALUE

	_EXTRA_CHECK_CRC	0, check_zukan_sample_start, check_zukan_sample_end
check_zukan_sample_start:

	_EXTRA_SET_SPECIAL_ZUKAN
	_EXTRA_DATA_END

check_zukan_sample_end:
_EXTRA_DATA_END_LABEL	ExtraDataEndSampleZukan


@----------------------------------------------------------
@	外部データサンプル・簡易会話フラグセット
@----------------------------------------------------------
_EXTRA_DATA_START_LABEL	ExtraDataStartSampleWord
	_EXTRA_DATA_MINE_VALUE

	_EXTRA_CHECK_CRC		0, check_kaiwaword_start, check_kaiwaword_end
check_kaiwaword_start:
	_EXTRA_SET_KAIWA_WORD	1
	_EXTRA_DATA_END
check_kaiwaword_end:

_EXTRA_DATA_END_LABEL	ExtraDataEndSampleWord


@----------------------------------------------------------
@	外部データサンプル・ポケモンデータ追加
@----------------------------------------------------------
_EXTRA_DATA_START_LABEL	ExtraDataStartSamplePokeData2
	_EXTRA_DATA_MINE_VALUE

	_EXTRA_CHECK_CRC		0, check_pokemon_start, check_pokemon_end
check_pokemon_start:
	_EXTRA_SET_POKEMON		test_exdata_pokemon
	_EXTRA_DATA_END

_EXTRA_LABEL	test_exdata_pokemon
	.space	100,0		@ポケモンデータはちょうど100バイト
_EXTRA_LABEL	test_exdata_mail
	.space	0x24,0		@メールのデータサイズ
	
check_pokemon_end:
_EXTRA_DATA_END_LABEL	ExtraDataEndSamplePokeData2

@----------------------------------------------------------
@	外部データサンプル・対戦トレーナーデータ追加
@----------------------------------------------------------
_EXTRA_DATA_START_LABEL	ExtraDataStartSampleTrainer
	_EXTRA_DATA_MINE_VALUE

	_EXTRA_SET_BATTLETRAINER	test_exdata_trainer
	_EXTRA_DATA_END

_EXTRA_LABEL	test_exdata_trainer
	.space	0x0100,0	@StockBattleCardETrainerのおおきさ
//	.space	0x00bc,0	@StockBattleCardETrainerのおおきさ

_EXTRA_DATA_END_LABEL	ExtraDataEndSampleTrainer

@----------------------------------------------------------
@	外部データサンプル・時間再設定を許可
@----------------------------------------------------------

_EXTRA_DATA_START_LABEL	ExtraDataStartRtcReset

	_EXTRA_DATA_MINE_VALUE

	_EXTRA_SET_RTCRESET_ENABLE
	_EXTRA_DATA_END

_EXTRA_DATA_END_LABEL	ExtraDataEndRtcReset


@----------------------------------------------------------
@	外部データ・きのみもらう
@----------------------------------------------------------
_EXTRA_DATA_START_LABEL	ExtraDataStartSampleSeedScript
	_EXTRA_DATA_MINE_VALUE

	_EXTRA_CHECKSUM			0, check_start_seed_sample,check_end_seed_sample
check_start_seed_sample:

	_EXTRA_SET_SCROBJ		C101,C101_R0201,PAPA_01_C101_R0201
	_EXTRA_SET_SCRADRS		seed_get_script_start,seed_get_script_end

	_EXTRA_SET_MESSAGE		msg_ex_seed_get
	_EXTRA_SET_RESULT		EXRUN_RET_NORMAL_MSG_END
	_EXTRA_DATA_END

msg_ex_seed_get:
	.byte	TO_,U_,KA_,ZI_,MU_,no_,spc_,PA_,PA_,ni_
	.byte	CR_
	.byte	a_,i_,ni_,spc_,i_,ttu_,te_,ne_
	.byte	EOM_


/* スクリプトデータ開始 */
// きのみはすべての種類をもてるようにエリアが確保されて
//いるのでどうぐをもらえなかったときの処理が必要ない

seed_get_script_start:
	_INIT_RELATIVE_ADRS		seed_get_script_start

	_CHECK_ITEM			ITEM_RYUGANOMI,1
	_IFVAL_JUMPR		ANSWORK,EQ,TRUE,ev_ex_seed_already_get
	_CHECK_BOX_ITEM		ITEM_RYUGANOMI,1
	_IFVAL_JUMPR		ANSWORK,EQ,TRUE,ev_ex_seed_already_get

	_TALK_OBJ_START
	_TALKMSG_REL		exmsg_senri_01_p01_exseed01
	_TALK_WAIT
	_AB_KEYWAIT
	_ITEM_EVENT			ITEM_RYUGANOMI,1
	_TALK_OBJ_END

	_CLEAR_EX_SCRIPT			@外部スクリプト消去

ev_ex_seed_already_get:
	_CHANGE_SCRIPT				@通常時のイベントに分岐

// ●センリ
// ●アイテム「～のみ」入手時
// ■□□□□□□□□□□□□□□□□□□□□■
exmsg_senri_01_p01_exseed01:
	.byte	PA_,PA_,kako2_,ya_,a_,spc_,I_MSG_,MY_NAME_BUF,gyoe_
	.byte	NORMAL_WAIT_
	.byte	me_,zu_,ra_,si_,i_,spc_,ki_,no_,mi_,wo_,spc_,te_,ni_,spc_,i_,re_,ta_,ka_,ra_
	.byte	CR_
	.byte	PU_,RE_,ZE_,N_,TO_,spc_,su_,ru_,yo_,gyoe_
	.byte	EOM_


seed_get_script_end:
/* スクリプトデータ終了 */

check_end_seed_sample:

_EXTRA_DATA_END_LABEL	ExtraDataEndSampleSeedScript


@----------------------------------------------------------
@	外部データ・グッズをもらう
@----------------------------------------------------------
_EXTRA_DATA_START_LABEL	ExtraDataStartSampleGoods
	_EXTRA_DATA_MINE_VALUE

	_EXTRA_CHECK_CRC		0, check_start_goods_sample,check_end_goods_sample
check_start_goods_sample:
	_EXTRA_DO_SCRIPT		exdata_goods_add_script
	_EXTRA_DATA_END

exdata_goods_add_script:
	_INIT_RELATIVE_ADRS		exdata_goods_add_script
	_GET_GOODSNAME			0, GOODS_REZISUTIRUDOORU
	_ADD_GOODS				GOODS_REZISUTIRUDOORU
	_IFVAL_JUMPR			ANSWORK,EQ,FALSE,exdata_goods_full

	_EXPAND_MSG_REL			exmsg_goods_get
	_SET_EXDATA_ERROR		EXRUN_RET_NORMAL_MSG_END
	_END

exdata_goods_full:
	_EXPAND_MSG_REL			exmsg_goods_full
	_SET_EXDATA_ERROR		EXRUN_RET_ERROR_MSG_END
	_END

exmsg_goods_get:
	.byte		I_MSG_,STR_TEMP_BUF0,ga_,spc_,o_,ku_,ra_,re_,te_,spc_,ki_,ta_,gyoe_
	.byte		EOM_
exmsg_goods_full:
	.byte		I_MSG_,STR_TEMP_BUF0,wo_,spc_,i_,re_,ru_
	.byte		CR_
	.byte		ba_,si_,yyo_,ga_,spc_,a_,i_,te_,spc_,i_,na_,ka_,ttu_,ta_,tenten_
	.byte		EOM_

check_end_goods_sample:
_EXTRA_DATA_END_LABEL	ExtraDataEndSampleGoods

@----------------------------------------------------------
@	外部データ・きずぐすり再配布
@----------------------------------------------------------
	.GLOBAL	check_start_dist_item

_EXTRA_DATA_START_LABEL	ExtraDataStartDistributeItems
	_EXTRA_DATA_MINE_VALUE

	_EXTRA_CHECK_CRC		0, check_start_dist_item,check_end_dist_item
check_start_dist_item:

	_EXTRA_SET_DISTITEM		1,3,ITEM_KIZUGUSURI
	_EXTRA_DATA_END

check_end_dist_item:

_EXTRA_DATA_END_LABEL	ExtraDataEndDistributeItems

#endif	PM_DEBUG

