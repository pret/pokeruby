
@======================================================
@	
@======================================================

	.text
	.code 32

@======================================================
@	extern宣言
@======================================================

@======================================================
@	AIの動作シーケンス命令macro
@======================================================

	.MACRO	INIT_CMD
DEF_CMD_COUNT	=	0
	.ENDM

	.MACRO	DEF_CMD	symname
\symname	=	DEF_CMD_COUNT
DEF_CMD_COUNT 	=	(DEF_CMD_COUNT + 1)
	.ENDM

	INIT_CMD
	DEF_CMD	AI_C_INCDEC
	DEF_CMD	AI_C_LD_TURN
	DEF_CMD	AI_C_IF_TURN_UNDER
	DEF_CMD	AI_C_IF_TURN_OVER
	DEF_CMD	AI_C_IF_TURN_EQUAL
	DEF_CMD	AI_C_IFN_TURN_EQUAL
	DEF_CMD	AI_C_LD_TENSYON
	DEF_CMD	AI_C_IF_TENSYON_UNDER
	DEF_CMD	AI_C_IF_TENSYON_OVER
	DEF_CMD	AI_C_IF_TENSYON_EQUAL
	DEF_CMD	AI_C_IFN_TENSYON_EQUAL
	DEF_CMD	AI_C_LD_ORDER
	DEF_CMD	AI_C_IF_ORDER_UNDER
	DEF_CMD	AI_C_IF_ORDER_OVER
	DEF_CMD	AI_C_IF_ORDER_EQUAL
	DEF_CMD	AI_C_IFN_ORDER_EQUAL
	DEF_CMD	AI_C_LD_ORDER
	DEF_CMD	AI_C_IF_BONUS_UNDER
	DEF_CMD	AI_C_IF_BONUS_OVER
	DEF_CMD	AI_C_IF_BONUS_EQUAL
	DEF_CMD	AI_C_IFN_BONUS_EQUAL
	DEF_CMD	AI_C_LD_AP
	DEF_CMD	AI_C_IF_AP_UNDER
	DEF_CMD	AI_C_IF_AP_OVER
	DEF_CMD	AI_C_IF_AP_EQUAL
	DEF_CMD	AI_C_IFN_AP_EQUAL
	DEF_CMD	AI_C_LD_BP
	DEF_CMD	AI_C_IF_BP_UNDER
	DEF_CMD	AI_C_IF_BP_OVER
	DEF_CMD	AI_C_IF_BP_EQUAL
	DEF_CMD	AI_C_IFN_BP_EQUAL
	DEF_CMD	AI_C_LD_CONTYPE
	DEF_CMD	AI_C_IF_CONTYPE_EQUAL
	DEF_CMD	AI_C_IFN_CONTYPE_EQUAL
	DEF_CMD	AI_C_LD_WAZATENSYON
	DEF_CMD	AI_C_IF_WAZATENSYON_UNDER
	DEF_CMD	AI_C_IF_WAZATENSYON_OVER
	DEF_CMD	AI_C_IF_WAZATENSYON_EQUAL
	DEF_CMD	AI_C_IFN_WAZATENSYON_EQUAL
	DEF_CMD	AI_C_LD_APNO
	DEF_CMD	AI_C_IF_APNO_EQUAL
	DEF_CMD	AI_C_IFN_APNO_EQUAL
	DEF_CMD	AI_C_LD_WAZACLASS
	DEF_CMD	AI_C_IF_WAZACLASS_EQUAL
	DEF_CMD	AI_C_IFN_WAZACLASS_EQUAL
	DEF_CMD	AI_C_LD_APTOP
	DEF_CMD	AI_C_IF_APTOP_EQUAL
	DEF_CMD	AI_C_LD_BOUGAITOP
	DEF_CMD	AI_C_IF_BOUGAITOP_EQUAL
	DEF_CMD	AI_C_LD_WAZAAP
	DEF_CMD	AI_C_IF_WAZAAP_UNDER
	DEF_CMD	AI_C_IF_WAZAAP_OVER
	DEF_CMD	AI_C_IF_WAZAAP_EQUAL
	DEF_CMD	AI_C_IFN_WAZAAP_EQUAL
	DEF_CMD	AI_C_LD_BOUGAI
	DEF_CMD	AI_C_IF_BOUGAI_UNDER
	DEF_CMD	AI_C_IF_BOUGAI_OVER
	DEF_CMD	AI_C_IF_BOUGAI_EQUAL
	DEF_CMD	AI_C_IFN_BOUGAI_EQUAL
	DEF_CMD	AI_C_LD_CONTI
	DEF_CMD	AI_C_IF_CONTI_UNDER
	DEF_CMD	AI_C_IF_CONTI_OVER
	DEF_CMD	AI_C_IF_CONTI_EQUAL
	DEF_CMD	AI_C_IFN_CONTI_EQUAL
	DEF_CMD	AI_C_LD_COMBO1
	DEF_CMD	AI_C_IF_COMBO1_EQUAL
	DEF_CMD	AI_C_IFN_COMBO1_EQUAL
	DEF_CMD	AI_C_LD_COMBO2
	DEF_CMD	AI_C_IF_COMBO2_EQUAL
	DEF_CMD	AI_C_IFN_COMBO2_EQUAL
	DEF_CMD	AI_C_LD_COMBOOCCUR
	DEF_CMD	AI_C_IF_COMBOOCCUR_EQUAL
	DEF_CMD	AI_C_IFN_COMBOOCCUR_EQUAL
	DEF_CMD	AI_C_LD_RIVALBONUS
	DEF_CMD	AI_C_IF_RIVALBONUS_UNDER
	DEF_CMD	AI_C_IF_RIVALBONUS_OVER
	DEF_CMD	AI_C_IF_RIVALBONUS_EQUAL
	DEF_CMD	AI_C_IFN_RIVALBONUS_EQUAL
	DEF_CMD	AI_C_LD_RIVALCOMBO1
	DEF_CMD	AI_C_IF_RIVALCOMBO1_UNDER
	DEF_CMD	AI_C_IF_RIVALCOMBO1_OVER
	DEF_CMD	AI_C_IF_RIVALCOMBO1_EQUAL
	DEF_CMD	AI_C_IFN_RIVALCOMBO1_EQUAL
	DEF_CMD	AI_C_LD_STATUS
	DEF_CMD	AI_C_IF_STATUS_EQUAL
	DEF_CMD	AI_C_IFN_STATUS_EQUAL
	DEF_CMD	AI_C_LD_COMBOCONTI
	DEF_CMD	AI_C_IF_COMBOCONTI_EQUAL
	DEF_CMD	AI_C_IFN_COMBOCONTI_EQUAL
	DEF_CMD	AI_C_LD_APCOMP
	DEF_CMD	AI_C_IF_APCOMP_UNDER
	DEF_CMD	AI_C_IF_APCOMP_OVER
	DEF_CMD	AI_C_IF_APCOMP_EQUAL
	DEF_CMD	AI_C_IFN_APCOMP_EQUAL
	DEF_CMD	AI_C_LD_BPCOMP
	DEF_CMD	AI_C_IF_BPCOMP_UNDER
	DEF_CMD	AI_C_IF_BPCOMP_OVER
	DEF_CMD	AI_C_IF_BPCOMP_EQUAL
	DEF_CMD	AI_C_IFN_BPCOMP_EQUAL
	DEF_CMD	AI_C_LD_APNOHISTORY
	DEF_CMD	AI_C_IF_APNOHISTORY_UNDER
	DEF_CMD	AI_C_IF_APNOHISTORY_OVER
	DEF_CMD	AI_C_IF_APNOHISTORY_EQUAL
	DEF_CMD	AI_C_IFN_APNOHISTORY_EQUAL
	DEF_CMD	AI_C_LD_TENSYONHISTORY
	DEF_CMD	AI_C_IF_TENSYONHISTORY_UNDER
	DEF_CMD	AI_C_IF_TENSYONHISTORY_OVER
	DEF_CMD	AI_C_IF_TENSYONHISTORY_EQUAL
	DEF_CMD	AI_C_IFN_TENSYONHISTORY_EQUAL
	DEF_CMD	AI_C_LD_CLASSHISTORY
	DEF_CMD	AI_C_IF_CLASSHISTORY_EQUAL
	DEF_CMD	AI_C_IFN_CLASSHISTORY_EQUAL
	DEF_CMD	AI_C_LDWK_RESURT
	DEF_CMD	AI_C_LDWK_NUM
	DEF_CMD	AI_C_ADDSUBLDWK_NUM
	DEF_CMD	AI_C_ADDSUBLDWK_WK
	DEF_CMD	AI_C_LDWK_WK
	DEF_CMD	AI_C_IF_WKCOMPNUM_UNDER
	DEF_CMD	AI_C_IF_WKCOMPNUM_OVER
	DEF_CMD	AI_C_IF_WKCOMPNUM_EQUAL
	DEF_CMD	AI_C_IFN_WKCOMPNUM_EQUAL
	DEF_CMD	AI_C_IF_WKCOMPWK_UNDER
	DEF_CMD	AI_C_IF_WKCOMPWK_OVER
	DEF_CMD	AI_C_IF_WKCOMPWK_EQUAL
	DEF_CMD	AI_C_IFN_WKCOMPWK_EQUAL
	DEF_CMD	AI_C_IF_RANDCOMPNUM_UNDER
	DEF_CMD	AI_C_IF_RANDCOMPNUM_OVER
	DEF_CMD	AI_C_JUMP
	DEF_CMD	AI_C_CALL
	DEF_CMD	AI_C_AIEND
	DEF_CMD	AI_C_LD_ALLWAZA_TENSYONCHECK
	DEF_CMD AI_C_IF_ALLWAZA_TENSYONCHECK_EQUAL
	DEF_CMD AI_C_IFN_ALLWAZA_TENSYONCHECK_EQUAL
	DEF_CMD	AI_C_LD_WAZANOCHECK
	DEF_CMD	AI_C_IF_WAZANOCHECK_EQUAL
	DEF_CMD	AI_C_IFN_WAZANOCHECK_EQUAL


@------------------------------------------------------------
@
@	サーチしている技に対してポイント加減算
@
@	value:加減算する値(s8)
@
@------------------------------------------------------------

	.macro		C_INCDEC				value
	.byte		AI_C_INCDEC
	.byte		\value
	.endm


@------------------------------------------------------------
@
@	現在のターン数で分岐
@
@	value:比較する値(u8:0～4)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_TURN
	.byte		AI_C_LD_TURN
	.endm

	.macro		C_IF_TURN_UNDER		value,adrs
	.byte		AI_C_IF_TURN_UNDER
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_TURN_OVER		value,adrs
	.byte		AI_C_IF_TURN_OVER
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_TURN_EQUAL		value,adrs
	.byte		AI_C_IF_TURN_EQUAL
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IFN_TURN_EQUAL	value,adrs
	.byte		AI_C_IFN_TURN_EQUAL
	.byte		\value
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	現在の場のテンションで分岐
@
@	value:比較する値(s8)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_TENSYON
	.byte		AI_C_LD_TENSYON
	.endm

	.macro		C_IF_TENSYON_UNDER		value,adrs
	.byte		AI_C_IF_TENSYON_UNDER
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_TENSYON_OVER		value,adrs
	.byte		AI_C_IF_TENSYON_OVER
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_TENSYON_EQUAL		value,adrs
	.byte		AI_C_IF_TENSYON_EQUAL
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IFN_TENSYON_EQUAL		value,adrs
	.byte		AI_C_IFN_TENSYON_EQUAL
	.byte		\value
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	自分のアピールする順番で分岐
@
@	value:比較する値(u8)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_ORDER
	.byte		AI_C_LD_ORDER
	.endm

	.macro		C_IF_ORDER_UNDER		value,adrs
	.byte		AI_C_IF_ORDER_UNDER
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_ORDER_OVER		value,adrs
	.byte		AI_C_IF_ORDER_OVER
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_ORDER_EQUAL		value,adrs
	.byte		AI_C_IF_ORDER_EQUAL
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IFN_ORDER_EQUAL		value,adrs
	.byte		AI_C_IFN_ORDER_EQUAL
	.byte		\value
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	自分のボーナス状態で分岐
@
@	value:比較する値(u8)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_BONUS
	.byte		AI_C_LD_BONUS
	.endm

	.macro		C_IF_BONUS_UNDER		value,adrs
	.byte		AI_C_IF_BONUS_UNDER
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_BONUS_OVER		value,adrs
	.byte		AI_C_IF_BONUS_OVER
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_BONUS_EQUAL		value,adrs
	.byte		AI_C_IF_BONUS_EQUAL
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IFN_BONUS_EQUAL		value,adrs
	.byte		AI_C_IFN_BONUS_EQUAL
	.byte		\value
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	自分のAP値を取得して分岐
@
@	value:比較する値(s16)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_AP
	.byte		AI_C_LD_AP
	.endm

	.macro		C_IF_AP_UNDER		value,adrs
	.byte		AI_C_IF_AP_UNDER
	.short		\value
	.long		\adrs
	.endm

	.macro		C_IF_AP_OVER		value,adrs
	.byte		AI_C_IF_AP_OVER
	.short		\value
	.long		\adrs
	.endm

	.macro		C_IF_AP_EQUAL		value,adrs
	.byte		AI_C_IF_AP_EQUAL
	.short		\value
	.long		\adrs
	.endm

	.macro		C_IFN_AP_EQUAL		value,adrs
	.byte		AI_C_IFN_AP_EQUAL
	.short		\value
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	自分のBP値で分岐
@
@	value:比較する値(s16)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_BP
	.byte		AI_C_LD_BP
	.endm

	.macro		C_IF_BP_UNDER		value,adrs
	.byte		AI_C_IF_BP_UNDER
	.short		\value
	.long		\adrs
	.endm

	.macro		C_IF_BP_OVER		value,adrs
	.byte		AI_C_IF_BP_OVER
	.short		\value
	.long		\adrs
	.endm

	.macro		C_IF_BP_EQUAL		value,adrs
	.byte		AI_C_IF_BP_EQUAL
	.short		\value
	.long		\adrs
	.endm

	.macro		C_IFN_BP_EQUAL		value,adrs
	.byte		AI_C_IFN_BP_EQUAL
	.short		\value
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	出場しているコンテストタイプで分岐
@
@	value:比較するｺﾝﾃｽﾄﾀｲﾌﾟ(u8)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_CONTYPE
	.byte		AI_C_LD_CONTYPE
	.endm

	.macro		C_IF_CONTYPE_EQUAL		value,adrs
	.byte		AI_C_IF_CONTYPE_EQUAL
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IFN_CONTYPE_EQUAL		value,adrs
	.byte		AI_C_IFN_CONTYPE_EQUAL
	.byte		\value
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	サーチしている技を出した時に変化するテンション値で分岐
@
@	value:比較するｺﾝﾃｽﾄﾀｲﾌﾟ(s8)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_WAZATENSYON
	.byte		AI_C_LD_WAZATENSYON
	.endm

	.macro		C_IF_WAZATENSYON_UNDER		value,adrs
	.byte		AI_C_IF_WAZATENSYON_UNDER
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_WAZATENSYON_OVER		value,adrs
	.byte		AI_C_IF_WAZATENSYON_OVER
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_WAZATENSYON_EQUAL		value,adrs
	.byte		AI_C_IF_WAZATENSYON_EQUAL
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IFN_WAZATENSYON_EQUAL		value,adrs
	.byte		AI_C_IFN_WAZATENSYON_EQUAL
	.byte		\value
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	サーチしている技のアピールNoを取得して分岐
@
@	value:比較する値(u8)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_APNO
	.byte		AI_C_LD_APNO
	.endm

	.macro		C_IF_APNO_EQUAL		value,adrs
	.byte		AI_C_IF_APNO_EQUAL
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IFN_APNO_EQUAL		value,adrs
	.byte		AI_C_IFN_APNO_EQUAL
	.byte		\value
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	サーチしている技のアピール分類を取得して分岐
@
@	value:比較する値(u8)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_WAZACLASS
	.byte		AI_C_LD_WAZACLASS
	.endm

	.macro		C_IF_WAZACLASS_EQUAL		value,adrs
	.byte		AI_C_IF_WAZACLASS_EQUAL
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IFN_WAZACLASS_EQUAL		value,adrs
	.byte		AI_C_IFN_WAZACLASS_EQUAL
	.byte		\value
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	サーチしている技が持っている技の中で一番AP値が高いかどうかチェック分岐
@
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_APTOP
	.byte		AI_C_LD_APTOP
	.endm

	.macro		C_IF_APTOP_EQUAL		adrs
	.byte		AI_C_IF_APTOP_EQUAL
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	サーチしている技が持っている技の中で一番妨害値が高いかどうかチェック分岐
@
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_BOUGAITOP
	.byte		AI_C_LD_BOUGAITOP
	.endm

	.macro		C_IF_BOUGAITOP_EQUAL		value,adrs
	.byte		AI_C_IF_BOUGAITOP_EQUAL
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	サーチしている技のアピール値を取得して分岐
@
@	value:比較する値(s8)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_WAZAAP
	.byte		AI_C_LD_WAZAAP
	.endm

	.macro		C_IF_WAZAAP_UNDER		value,adrs
	.byte		AI_C_IF_WAZAAP_UNDER
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_WAZAAP_OVER		value,adrs
	.byte		AI_C_IF_WAZAAP_OVER
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_WAZAAP_EQUAL		value,adrs
	.byte		AI_C_IF_WAZAAP_EQUAL
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IFN_WAZAAP_EQUAL		value,adrs
	.byte		AI_C_IFN_WAZAAP_EQUAL
	.byte		\value
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	サーチしている技の妨害値を取得して分岐
@
@	value:比較する値(s8)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_BOUGAI
	.byte		AI_C_LD_BOUGAI
	.endm

	.macro		C_IF_BOUGAI_UNDER		value,adrs
	.byte		AI_C_IF_BOUGAI_UNDER
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_BOUGAI_OVER		value,adrs
	.byte		AI_C_IF_BOUGAI_OVER
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_BOUGAI_EQUAL		value,adrs
	.byte		AI_C_IF_BOUGAI_EQUAL
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IFN_BOUGAI_EQUAL		value,adrs
	.byte		AI_C_IFN_BOUGAI_EQUAL
	.byte		\value
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	サーチしている技の連続使用回数を取得して分岐
@
@	value:比較する値(u8)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_CONTI
	.byte		AI_C_LD_CONTI
	.endm

	.macro		C_IF_CONTI_UNDER		value,adrs
	.byte		AI_C_IF_CONTI_UNDER
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_CONTI_OVER		value,adrs
	.byte		AI_C_IF_CONTI_OVER
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_CONTI_EQUAL		value,adrs
	.byte		AI_C_IF_CONTI_EQUAL
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IFN_CONTI_EQUAL		value,adrs
	.byte		AI_C_IFN_CONTI_EQUAL
	.byte		\value
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	サーチしている技と他の持ち技を比較してｺﾝﾎﾞ出来るかどうかﾁｪｯｸする分岐1
@
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_COMBO1
	.byte		AI_C_LD_COMBO1
	.endm

	.macro		C_IF_COMBO1_EQUAL		adrs
	.byte		AI_C_IF_COMBO1_EQUAL
	.long		\adrs
	.endm

	.macro		C_IFN_COMBO1_EQUAL		adrs
	.byte		AI_C_IFN_COMBO1_EQUAL
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	サーチしている技と他の持ち技を比較してｺﾝﾎﾞ出来るかどうかﾁｪｯｸする分岐2
@
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_COMBO2
	.byte		AI_C_LD_COMBO2
	.endm

	.macro		C_IF_COMBO2_EQUAL		adrs
	.byte		AI_C_IF_COMBO2_EQUAL
	.long		\adrs
	.endm

	.macro		C_IFN_COMBO2_EQUAL		adrs
	.byte		AI_C_IFN_COMBO2_EQUAL
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	サーチしている技でｺﾝﾎﾞが発生するかで分岐
@
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_COMBOOCCUR
	.byte		AI_C_LD_COMBOOCCUR
	.endm

	.macro		C_IF_COMBOOCCUR_EQUAL		adrs
	.byte		AI_C_IF_COMBOOCCUR_EQUAL
	.long		\adrs
	.endm

	.macro		C_IFN_COMBOOCCUR_EQUAL		adrs
	.byte		AI_C_IFN_COMBOOCCUR_EQUAL
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	各ポケモンのボーナス状態をチェック
@
@	appealno:アピール番号(u8)
@	value:比較する値(u8)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_RIVALBONUS
	.byte		AI_C_LD_RIVALBONUS
	.byte		\appealno
	.endm

	.macro		C_IF_RIVALBONUS_UNDER		appealno,value,adrs
	.byte		AI_C_IF_RIVALBONUS_UNDER
	.byte		\appealno
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_RIVALBONUS_OVER		appealno,value,adrs
	.byte		AI_C_IF_RIVALBONUS_OVER
	.byte		\appealno
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_RIVALBONUS_EQUAL		appealno,value,adrs
	.byte		AI_C_IF_RIVALBONUS_EQUAL
	.byte		\appealno
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IFN_RIVALBONUS_EQUAL		appealno,value,adrs
	.byte		AI_C_IFN_RIVALBONUS_EQUAL
	.byte		\appealno
	.byte		\value
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	各ポケモンのコンボ1状態をチェック
@
@	appealno:アピール番号(u8)
@	value:比較する値(u8)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_RIVALCOMBO1
	.byte		AI_C_LD_RIVALCOMBO1
	.byte		\appealno
	.endm

	.macro		C_IF_RIVALCOMBO1_UNDER		appealno,value,adrs
	.byte		AI_C_IF_RIVALCOMBO1_UNDER
	.byte		\appealno
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_RIVALCOMBO1_OVER		appealno,value,adrs
	.byte		AI_C_IF_RIVALCOMBO1_OVER
	.byte		\appealno
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IF_RIVALCOMBO1_EQUAL		appealno,value,adrs
	.byte		AI_C_IF_RIVALCOMBO1_EQUAL
	.byte		\appealno
	.byte		\value
	.long		\adrs
	.endm

	.macro		C_IFN_RIVALCOMBO1_EQUAL		appealno,value,adrs
	.byte		AI_C_IFN_RIVALCOMBO1_EQUAL
	.byte		\appealno
	.byte		\value
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	各ポケモンの状態をチェック
@	参加できる状態＝１	参加できない状態(休み)＝０
@
@	appealno:アピール番号(u8)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_STATUS
	.byte		AI_C_LD_STATUS
	.byte		\appealno
	.endm

	@@-- 参加できるならジャンプ --@@
	.macro		C_IF_STATUS_EQUAL		appealno,adrs
	.byte		AI_C_IF_STATUS_EQUAL
	.byte		\appealno
	.long		\adrs
	.endm

	@@-- 参加できないならジャンプ --@@
	.macro		C_IFN_STATUS_EQUAL		appealno,adrs
	.byte		AI_C_IFN_STATUS_EQUAL
	.byte		\appealno
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	各ポケモンのコンボ発生チェック
@
@	appealno:アピール番号(u8)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_COMBOCONTI
	.byte		AI_C_LD_COMBOCONTI
	.byte		\appealno
	.endm

	@@-- 発生したことがある --@@
	.macro		C_IF_COMBOCONTI_EQUAL		appealno,adrs
	.byte		AI_C_IF_COMBOCONTI_EQUAL
	.byte		\appealno
	.long		\adrs
	.endm

	@@-- 発生したことがない --@@
	.macro		C_IFN_COMBOCONTI_EQUAL		appealno,adrs
	.byte		AI_C_IFN_COMBOCONTI_EQUAL
	.byte		\appealno
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	各ポケモンの現在のAP値と自分のAP値を比較分岐
@
@	appealno:アピール番号(u8)
@	adrs:飛び先
@
@------------------------------------------------------------

	@@-- 自分のAP値の方が大きければマイナスで結果が入る --@@
	.macro		C_LD_APCOMP
	.byte		AI_C_LD_APCOMP
	.byte		\appealno
	.endm

	@@-- 自分の方が大きければジャンプ --@@
	.macro		C_IF_APCOMP_UNDER		appealno,adrs
	.byte		AI_C_IF_APCOMP_UNDER
	.byte		\appealno
	.long		\adrs
	.endm

	@@-- 自分の方が低ければジャンプ --@@
	.macro		C_IF_APCOMP_OVER		appealno,adrs
	.byte		AI_C_IF_APCOMP_OVER
	.byte		\appealno
	.long		\adrs
	.endm

	.macro		C_IF_APCOMP_EQUAL		appealno,adrs
	.byte		AI_C_IF_APCOMP_EQUAL
	.byte		\appealno
	.long		\adrs
	.endm

	.macro		C_IFN_APCOMP_EQUAL		appealno,adrs
	.byte		AI_C_IFN_APCOMP_EQUAL
	.byte		\appealno
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	各ポケモンの現在のBP値と自分のBP値を比較分岐
@
@	appealno:アピール番号(u8)
@	adrs:飛び先
@
@------------------------------------------------------------

	@@-- 自分のAP値の方が大きければマイナスで結果が入る --@@
	.macro		C_LD_BPCOMP
	.byte		AI_C_LD_BPCOMP
	.endm

	@@-- 自分の方が大きければジャンプ --@@
	.macro		C_IF_BPCOMP_UNDER		appealno,adrs
	.byte		AI_C_IF_BPCOMP_UNDER
	.byte		\appealno
	.long		\adrs
	.endm

	@@-- 自分の方が低ければジャンプ --@@
	.macro		C_IF_BPCOMP_OVER		appealno,adrs
	.byte		AI_C_IF_BPCOMP_OVER
	.byte		\appealno
	.long		\adrs
	.endm

	.macro		C_IF_BPCOMP_EQUAL		appealno,adrs
	.byte		AI_C_IF_BPCOMP_EQUAL
	.byte		\appealno
	.long		\adrs
	.endm

	.macro		C_IFN_BPCOMP_EQUAL		appealno,adrs
	.byte		AI_C_IFN_BPCOMP_EQUAL
	.byte		\appealno
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	各ポケモンの前のターンまでの技から、アピールNoを取得して分岐
@
@	appealno:アピール番号(u8)
@	turn:何ターン目のデータを見るか(u8)
@	apno:比較するAPNo(u8)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_APNOHISTORY			appealno,turn
	.byte		AI_C_LD_APNOHISTORY
	.byte		\appealno
	.byte		\turn
	.endm

	.macro		C_IF_APNOHISTORY_UNDER		appealno,turn,apno,adrs
	.byte		AI_C_IF_APNOHISTORY_UNDER
	.byte		\appealno
	.byte		\turn
	.byte		\apno
	.long		\adrs
	.endm

	.macro		C_IF_APNOHISTORY_OVER		appealno,turn,apno,adrs
	.byte		AI_C_IF_APNOHISTORY_OVER
	.byte		\appealno
	.byte		\turn
	.byte		\apno
	.long		\adrs
	.endm

	.macro		C_IF_APNOHISTORY_EQUAL		appealno,turn,apno,adrs
	.byte		AI_C_IF_APNOHISTORY_EQUAL
	.byte		\appealno
	.byte		\turn
	.byte		\apno
	.long		\adrs
	.endm

	.macro		C_IFN_APNOHISTORY_EQUAL		appealno,turn,apno,adrs
	.byte		AI_C_IFN_APNOHISTORY_EQUAL
	.byte		\appealno
	.byte		\turn
	.byte		\apno
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	各ポケモンの前のターンまでの技から、ｱﾋﾟｰﾙﾀｲﾌﾟで変化したﾃﾝｼｮﾝ値を取得して分岐
@
@	appealno:アピール番号(u8)
@	turn:何ターン目のデータを見るか(u8)
@	tensyon:比較するAPNo(u8)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_TENSYONHISTORY			appealno,turn
	.byte		AI_C_LD_TENSYONHISTORY
	.byte		\appealno
	.byte		\turn
	.endm

	.macro		C_IF_TENSYONHISTORY_UNDER		appealno,turn,tensyon,adrs
	.byte		AI_C_IF_TENSYONHISTORY_UNDER
	.byte		\appealno
	.byte		\turn
	.byte		\tensyon
	.long		\adrs
	.endm

	.macro		C_IF_TENSYONHISTORY_OVER		appealno,turn,tensyon,adrs
	.byte		AI_C_IF_TENSYONHISTORY_OVER
	.byte		\appealno
	.byte		\turn
	.byte		\tensyon
	.long		\adrs
	.endm

	.macro		C_IF_TENSYONHISTORY_EQUAL		appealno,turn,tensyon,adrs
	.byte		AI_C_IF_TENSYONHISTORY_EQUAL
	.byte		\appealno
	.byte		\turn
	.byte		\tensyon
	.long		\adrs
	.endm

	.macro		C_IFN_TENSYONHISTORY_EQUAL		appealno,turn,tensyon,adrs
	.byte		AI_C_IFN_TENSYONHISTORY_EQUAL
	.byte		\appealno
	.byte		\turn
	.byte		\tensyon
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	各ポケモンの前のターンまでの技から、アピール分類を取得して分岐
@
@	appealno:アピール番号(u8)
@	turn:何ターン目のデータを見るか(u8)
@	class:比較するAPNo(u8)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_CLASSHISTORY			appealno,turn
	.byte		AI_C_LD_CLASSHISTORY
	.byte		\appealno
	.byte		\turn
	.endm

	.macro		C_IF_CLASSHISTORY_UNDER		appealno,turn,class,adrs
	.byte		AI_C_IF_CLASSHISTORY_UNDER
	.byte		\appealno
	.byte		\turn
	.byte		\class
	.long		\adrs
	.endm

	.macro		C_IF_CLASSHISTORY_OVER		appealno,turn,class,adrs
	.byte		AI_C_IF_CLASSHISTORY_OVER
	.byte		\appealno
	.byte		\turn
	.byte		\class
	.long		\adrs
	.endm

	.macro		C_IF_CLASSHISTORY_EQUAL		appealno,turn,class,adrs
	.byte		AI_C_IF_CLASSHISTORY_EQUAL
	.byte		\appealno
	.byte		\turn
	.byte		\class
	.long		\adrs
	.endm

	.macro		C_IFN_CLASSHISTORY_EQUAL		appealno,turn,class,adrs
	.byte		AI_C_IFN_CLASSHISTORY_EQUAL
	.byte		\appealno
	.byte		\turn
	.byte		\class
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	結果をワークに代入する
@
@	work:代入先のワーク
@
@------------------------------------------------------------

	.macro		C_LDWK_RESULT		work
	.byte		AI_C_LDWK_RESULT
	.byte		\work
	.endm


@------------------------------------------------------------
@
@	ワークに値を代入する
@
@	work:代入先のワーク
@	value:代入する値(s16)
@
@------------------------------------------------------------

	.macro		C_LDWK_NUM		work,value
	.byte		AI_C_LDWK_NUM
	.byte		\work
	.short		\value
	.endm


@------------------------------------------------------------
@
@	ワークに値を加減算する
@
@	work:加減算先のワーク
@	value:加減算する値(s16)
@
@------------------------------------------------------------

	.macro		C_ADDSUBLDWK_NUM		work,value
	.byte		AI_C_ADDSUBLDWK_NUM
	.byte		\work
	.short		\value
	.endm


@------------------------------------------------------------
@
@	ワークAとワークBを加減算してワークAに代入する
@
@	workA:ワークA
@	workB:ワークB
@
@------------------------------------------------------------

	.macro		C_ADDSUBLDWK_WK		work,work
	.byte		AI_C_ADDSUBLDWK_WK
	.byte		\workA
	.byte		\workB
	.endm


@------------------------------------------------------------
@
@	ワークAにワークBを代入する
@
@	workA:ワークA
@	workB:ワークB
@
@------------------------------------------------------------

	.macro		C_LDWK_WK		workA,workB
	.byte		AI_C_LDWK_WK
	.byte		\workA
	.byte		\workB
	.endm


@------------------------------------------------------------
@
@	ワークと値を比較して分岐
@
@	work:比較するワーク
@	value:比較する値(s16)
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_IF_WKCOMPNUM_UNDER		work,value,adrs
	.byte		AI_C_IF_WKCOMPNUM_UNDER
	.byte		\work
	.short		\value
	.long		\adrs
	.endm

	.macro		C_IF_WKCOMPNUM_OVER			work,value,adrs
	.byte		AI_C_IF_WKCOMPNUM_OVER
	.byte		\work
	.short		\value
	.long		\adrs
	.endm

	.macro		C_IF_WKCOMPNUM_EQUAL		work,value,adrs
	.byte		AI_C_IF_WKCOMPNUM_EQUAL
	.byte		\work
	.short		\value
	.long		\adrs
	.endm

	.macro		C_IFN_WKCOMPNUM_EQUAL		work,value,adrs
	.byte		AI_C_IFN_WKCOMPNUM_EQUAL
	.byte		\work
	.short		\value
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	ワークとワークを比較して分岐
@
@	workA:比較するワーク
@	workB:比較するワーク
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_IF_WKCOMPWK_UNDER		workA,workB,adrs
	.byte		AI_C_IF_WKCOMPWK_UNDER
	.byte		\workA
	.byte		\workB
	.long		\adrs
	.endm

	.macro		C_IF_WKCOMPWK_OVER			workA,workB,adrs
	.byte		AI_C_IF_WKCOMPWK_OVER
	.byte		\workA
	.byte		\workB
	.long		\adrs
	.endm

	.macro		C_IF_WKCOMPWK_EQUAL		workA,workB,adrs
	.byte		AI_C_IF_WKCOMPWK_EQUAL
	.byte		\workA
	.byte		\workB
	.long		\adrs
	.endm

	.macro		C_IFN_WKCOMPWK_EQUAL		workA,workB,adrs
	.byte		AI_C_IFN_WKCOMPWK_EQUAL
	.byte		\workA
	.byte		\workB
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	ランダム値を取得して分岐
@	0～255の範囲でランダム値を取得して、値と比較し分岐
@
@	value:比較する値(u8)
@	adrs:飛び先
@
@------------------------------------------------------------

	@@-- ランダム値の方が低ければ分岐 --@@
	.macro		C_IF_RANDCOMPNUM_UNDER		value,adrs
	.byte		AI_C_IF_RANDCOMPNUM_UNDER
	.byte		\value
	.long		\adrs
	.endm

	@@-- ランダム値の方が高ければ分岐 --@@
	.macro		C_IF_RANDCOMPNUM_OVER		value,adrs
	.byte		AI_C_IF_RANDCOMPNUM_OVER
	.byte		\value
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	無条件でジャンプする
@
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_JUMP			adrs
	.byte		AI_C_JUMP
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	サブルーチン呼び出し
@
@	adrs:呼び出し先
@
@------------------------------------------------------------

	.macro		C_CALL			adrs
	.byte		AI_C_CALL
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	終了コード & サブルーチン終端コード
@
@------------------------------------------------------------

	.macro		C_AIEND
	.byte		AI_C_AIEND
	.endm


@------------------------------------------------------------
@
@	手持ちの技の中にﾃﾝｼｮﾝを上げる技があるか調べて分岐
@
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_ALLWAZA_TENSYONCHECK
	.byte		AI_C_LD_ALLWAZA_TENSYONCHECK
	.endm

	@@-- 手持ちの技にﾃﾝｼｮﾝをあげる技があるなら分岐 --@@
	.macro		C_IF_ALLWAZA_TENSYONCHECK_EQUAL		adrs
	.byte		AI_C_IF_ALLWAZA_TENSYONCHECK_EQUAL
	.long		\adrs
	.endm

	@@-- 手持ちの技にﾃﾝｼｮﾝをあげる技がないなら分岐 --@@
	.macro		C_IFN_ALLWAZA_TENSYONCHECK_EQUAL		adrs
	.byte		AI_C_IFN_ALLWAZA_TENSYONCHECK_EQUAL
	.long		\adrs
	.endm


@------------------------------------------------------------
@
@	技Noを渡して手持ちの技の中にあるかどうかで分岐
@
@	wazano:サーチする技No
@	adrs:飛び先
@
@------------------------------------------------------------

	.macro		C_LD_WAZANOCHECK			wazano
	.byte		AI_C_LD_WAZANOCHECK
	.short		\wazano
	.endm

	@@-- 手持ちの技に指定した技があるなら分岐 --@@
	.macro		C_IF_WAZANOCHECK_EQUAL		wazano,adrs
	.byte		AI_C_IF_WAZANOCHECK_EQUAL
	.short		\wazano
	.long		\adrs
	.endm

	@@-- 手持ちの技に指定した技がないなら分岐 --@@
	.macro		C_IFN_WAZANOCHECK_EQUAL		wazano,adrs
	.byte		AI_C_IFN_WAZANOCHECK_EQUAL
	.short		\wazano
	.long		\adrs
	.endm

