@----------------------------------------------------
@
@	ﾌﾞﾘｰﾀﾞｰAI
@						2002.05.24(金) by matsuda
@----------------------------------------------------

	.text
	.code 32

	.include	"con_ai.h"

@======================================================
@	define宣言
@======================================================

@======================================================
@	global宣言
@======================================================

	.global		BreederAITbl

#include	"wazano.def"
#include	"con_ai.def"
#include	"agbmons.def"

@AIシーケンステーブル（とりあえず32テーブル）
BreederAITbl:
	.long		ConExpAISeq				@01エキスパートAI
	.long		ConComboAISeq			@02コンボ	
	.long		ConPtAISeq				@03ペナルティ
	.long		TensyonAISeq			@04エキサイト 
	.long		ConNomverAISeq			@05順番
	.long		ConWazaProAISeq			@06技専用	
	.long		ConBougaiAISeq			@07妨害
	.long		ConDummyAISeq			@08
	.long		ConDummyAISeq			@09
	.long		ConDummyAISeq			@10
	.long		ConDummyAISeq			@11
	.long		ConDummyAISeq			@12
	.long		ConDummyAISeq			@13
	.long		ConDummyAISeq			@14
	.long		ConDummyAISeq			@15
	.long		ConDummyAISeq			@16
	.long		ConDummyAISeq			@17
	.long		ConDummyAISeq			@18
	.long		ConDummyAISeq			@19
	.long		ConDummyAISeq			@20
	.long		ConDummyAISeq			@21
	.long		ConDummyAISeq			@22
	.long		ConDummyAISeq			@23
	.long		ConDummyAISeq			@24
	.long		ConDummyAISeq			@25
	.long		ConDummyAISeq			@26
	.long		ConDummyAISeq			@27
	.long		ConDummyAISeq			@28	
	.long		ConDummyAISeq			@29	
	.long		ConDummyAISeq			@30	
	.long		ConDummyAISeq			@31	
	.long		ConDummyAISeq			@32	

@========================================================
@	テストAI
@========================================================

TestAISeq:
	C_IFN_TURN_EQUAL		0,TestNext		//最初のﾀｰﾝでないならここの処理は飛ばす
	C_IFN_APNO_EQUAL		38,TestNext		//ボーナス技でないなら処理を飛ばす
	C_INCDEC				10				//ボーナス技に対して加算
TestNext:
	C_CALL					BougaiCheckSeq
	C_AIEND									//終了

@自分がｱﾋﾟｰﾙする順番で上の方の場合は妨害技を優先して使用する
BougaiCheckSeq:
	C_IF_ORDER_OVER			1,BougaiCheckEnd	//2,3番目の時はこのｼｰｹﾝｽは終了
	C_IFN_WAZACLASS_EQUAL	DIST1_CLASS,BougaiCheckEnd	//妨害技でないなら終了
	C_IFN_WAZACLASS_EQUAL	DIST2_CLASS,BougaiCheckEnd
	C_INCDEC				10				//妨害技に対して加算
BougaiCheckEnd:
	C_AIEND


@========================================================
@	慎重派AI:リスクの少ない堅実な行動をする
@========================================================
ConsintyouAISeq:
	C_IF_TURN_EQUAL		0,ConsintyouAISeq_01		
	C_IF_TURN_EQUAL		1,ConsintyouAISeq_02		
	C_IF_TURN_EQUAL		2,ConsintyouAISeq_03		
	C_IF_TURN_EQUAL		3,ConsintyouAISeq_04		
	C_IF_TURN_EQUAL		4,ConsintyouAISeq_05		
	C_AIEND

ConsintyouAISeq_01://１ターン目
	C_IFN_ORDER_EQUAL	0,ConsintyouAISeq_01_01	
	C_IFN_ORDER_EQUAL	1,ConsintyouAISeq_01_02	
	C_IFN_ORDER_EQUAL	2,ConsintyouAISeq_01_01	
	C_IFN_ORDER_EQUAL	3,ConsintyouAISeq_01_01
	C_AIEND

ConsintyouAISeq_01_01://１番目
	C_IF_WAZACLASS_EQUAL	BOUGYO_CLASS,ConsintyouAISeq_INCDEC1
	C_AIEND

ConsintyouAISeq_01_02://２番目
	C_IF_WAZACLASS_EQUAL	BOUGYO_CLASS,ConsintyouAISeq_INCDEC1
	C_AIEND

ConsintyouAISeq_01_03://３番目
	C_IF_WAZACLASS_EQUAL	BOUGYO_CLASS,ConsintyouAISeq_INCDEC1
	C_AIEND




ConsintyouAISeq_02://２ターン目
	C_IFN_ORDER_EQUAL	0,ConsintyouAISeq_01_01	
	C_IFN_ORDER_EQUAL	1,ConsintyouAISeq_01_01	
	C_IFN_ORDER_EQUAL	2,ConsintyouAISeq_01_01	
	C_IFN_ORDER_EQUAL	3,ConsintyouAISeq_01_01
	C_AIEND

ConsintyouAISeq_03://３ターン目
	C_IFN_ORDER_EQUAL	0,ConsintyouAISeq_01_01	
	C_IFN_ORDER_EQUAL	1,ConsintyouAISeq_01_01	
	C_IFN_ORDER_EQUAL	2,ConsintyouAISeq_01_01	
	C_IFN_ORDER_EQUAL	3,ConsintyouAISeq_01_01
	C_AIEND

ConsintyouAISeq_04://４ターン目
	C_IFN_ORDER_EQUAL	0,ConsintyouAISeq_01_01	
	C_IFN_ORDER_EQUAL	1,ConsintyouAISeq_01_01	
	C_IFN_ORDER_EQUAL	2,ConsintyouAISeq_01_01	
	C_IFN_ORDER_EQUAL	3,ConsintyouAISeq_01_01
	C_AIEND

ConsintyouAISeq_05://５ターン目
	C_IFN_ORDER_EQUAL	0,ConsintyouAISeq_01_01	
	C_IFN_ORDER_EQUAL	1,ConsintyouAISeq_01_01	
	C_IFN_ORDER_EQUAL	2,ConsintyouAISeq_01_01	
	C_IFN_ORDER_EQUAL	3,ConsintyouAISeq_01_01
	C_AIEND

ConsintyouAISeq_INCDEC1:
	C_INCDEC	10	
	C_AIEND

ConsintyouAISeq_end:
	C_AIEND


@========================================================
@	一番ＡＰ値が高いものを選択AI
@========================================================
ConHiapAISeq:
	C_IF_APTOP_EQUAL	ConHiapAISeq_01
	C_AIEND
	
ConHiapAISeq_01:
	C_INCDEC	10	//一番高いものに対して加算
	C_AIEND

@========================================================
@	ペナルティをしないAI
@========================================================

ConPtAISeq:
	C_IF_APNO_EQUAL		3,ConPtAISeq_05	//連続使用ＯＫの技
	C_IF_CONTI_EQUAL	1,ConPtAISeq_01
	C_IF_CONTI_EQUAL	2,ConPtAISeq_02
	C_IF_CONTI_EQUAL	3,ConPtAISeq_03
	C_IF_CONTI_EQUAL	4,ConPtAISeq_04
	C_AIEND

ConPtAISeq_01:
	C_INCDEC	-5
	C_AIEND
	
ConPtAISeq_02:
	C_INCDEC	-15
	C_AIEND

ConPtAISeq_03:
	C_INCDEC	-20
	C_AIEND

ConPtAISeq_04:
	C_INCDEC	-25
	C_AIEND

ConPtAISeq_05:
	C_AIEND


@========================================================
@	テンション優先AI
@========================================================
TensyonAISeq:
	C_IF_WAZATENSYON_UNDER	0,TensyonAISeq_01	//下げる技
	C_IF_WAZATENSYON_EQUAL	0,TensyonAISeq_02	//普通
	C_IF_WAZATENSYON_EQUAL	1,TensyonAISeq_03	//上がる技
	C_AIEND
	
TensyonAISeq_01:
	C_IF_TENSYON_EQUAL	4,TensyonAISeq_01_01	//テンション４なら
	C_IF_TENSYON_EQUAL	3,TensyonAISeq_01_03	//テンション３なら:0713
	C_IF_ALLWAZA_TENSYONCHECK_EQUAL	TensyonAISeq_end
	C_INCDEC	+15//0908
	C_AIEND

TensyonAISeq_01_01:
	C_IFN_ORDER_EQUAL	0,TensyonAISeq_01_02	//1番でない
	C_IF_RANDCOMPNUM_UNDER	51,TensyonAISeq_end	//80％の確立で弾く（仮）：0908
	C_INCDEC	+20
	C_AIEND

TensyonAISeq_01_02:
	C_IF_RANDCOMPNUM_UNDER	127,TensyonAISeq_end	//50％の確立で弾く（仮）
	C_INCDEC	-10
	C_AIEND

TensyonAISeq_01_03:
	C_IFN_ORDER_EQUAL	0,TensyonAISeq_01_05	//1番でない:0713
	C_IF_TURN_EQUAL	4,TensyonAISeq_01_04	//５ターン目でテンション３で１番：0726
	C_IF_RANDCOMPNUM_UNDER	51,TensyonAISeq_end	//80％の確立で弾く（仮）:0726
	C_INCDEC	10
	C_AIEND

TensyonAISeq_01_04://自分がテンションを絶対に取れない状態時。
	C_INCDEC	15
	C_AIEND

TensyonAISeq_01_05:
	C_IF_RANDCOMPNUM_UNDER	127,TensyonAISeq_end	//50％の確立で弾く（仮）:0801
	C_INCDEC	10
	C_AIEND

TensyonAISeq_02://特になし
	C_IF_RANDCOMPNUM_UNDER	127,TensyonAISeq_end	//50％の確立で弾く（仮）:0801
	C_INCDEC	10
	C_AIEND

TensyonAISeq_03:	
	C_IF_CONTI_OVER	0,TensyonAISeq_03_02	//連続使用中をはじく：0726
	C_IFN_ORDER_EQUAL	0,TensyonAISeq_03_01	//1番でない
	C_IFN_TENSYON_EQUAL	4,TensyonAISeq_03_01	//テンション４でない
	C_INCDEC	+30		//テンション４で１番目なら・・・
	C_AIEND
	
TensyonAISeq_03_01:
	C_IF_RANDCOMPNUM_UNDER	100,TensyonAISeq_end	//60％の確立で弾く（仮）
	C_INCDEC	+10
	C_AIEND

TensyonAISeq_03_02:
	C_IFN_APNO_EQUAL	3,TensyonAISeq_end	//ペナルティでエキサイトしない：0726
	C_IFN_ORDER_EQUAL	0,TensyonAISeq_03_01	//1番でない
	C_IFN_TENSYON_EQUAL	4,TensyonAISeq_03_01	//テンション４でない
	C_INCDEC	+30		//テンション４で１番目なら・・・
	C_AIEND


TensyonAISeq_end:
	C_AIEND


@========================================================
@	コンボ優先AI
@========================================================
ConComboAISeq:
	C_IF_COMBOOCCUR_EQUAL	ConComboAISeq_03	//この技でコンボ発生
	C_CALL		ConComboAISeq_01
	C_CALL		ConComboAISeq_02
	C_AIEND

ConComboAISeq_01:
	C_IFN_CONTI_EQUAL	0,ConComboAISeq_end		//連続使用
	C_IFN_COMBO1_EQUAL		ConComboAISeq_end	//コンボ１でない
	C_IF_ORDER_EQUAL	0,ConComboAISeq_04_01
	C_IF_ORDER_EQUAL	1,ConComboAISeq_04_02
	C_IF_ORDER_EQUAL	2,ConComboAISeq_04_03
	C_IF_ORDER_EQUAL	3,ConComboAISeq_04_04
	C_AIEND
	
ConComboAISeq_02:
	C_IFN_COMBO2_EQUAL		ConComboAISeq_end	//コンボ２でない
	C_INCDEC	-10
	C_AIEND

ConComboAISeq_03:
	C_INCDEC	+25
	C_AIEND


ConComboAISeq_04_01://１番目
	C_IF_TURN_EQUAL	4,ConComboAISeq_04_05	//５ターン目ならはじく
	C_IF_RANDCOMPNUM_UNDER	150,ConComboAISeq_end	//60％の確率ではじく（仮）
	C_INCDEC	+10
	C_AIEND

ConComboAISeq_04_02://２番目
	C_IF_TURN_EQUAL	4,ConComboAISeq_04_05	//５ターン目ならはじく
	C_IF_RANDCOMPNUM_UNDER	125,ConComboAISeq_end	//50％の確率ではじく（仮）
	C_INCDEC	+10
	C_AIEND

ConComboAISeq_04_03://３番目
	C_IF_TURN_EQUAL	4,ConComboAISeq_04_05	//５ターン目ならはじく
	C_IF_RANDCOMPNUM_UNDER	50,ConComboAISeq_end	//19％の確率ではじく（仮）
	C_INCDEC	+10
	C_AIEND

ConComboAISeq_04_04://４番目
	C_IF_TURN_EQUAL	4,ConComboAISeq_04_05	//５ターン目ならはじく
	C_INCDEC	+10
	C_AIEND

ConComboAISeq_04_05://５ターン目はやりずらい
	C_IF_RANDCOMPNUM_UNDER	125,ConComboAISeq_end	//50％の確率
	C_INCDEC	-15
	C_AIEND


ConComboAISeq_end:
	C_AIEND
	

@========================================================
@	技専用AI(基本はプラス)
@========================================================
ConWazaProAISeq:
	C_IF_APNO_EQUAL	39,ConWazaProAISeq_01	//ボーナス×4	
	C_IF_APNO_EQUAL	40,ConWazaProAISeq_02	//次１番の技
	C_IF_APNO_EQUAL	41,ConWazaProAISeq_03	//次４番の技
	C_IF_APNO_EQUAL	3,ConWazaProAISeq_04	//ペナルティ０	
	//C_IF_APNO_EQUAL	2,ConWazaProAISeq_05	//次のターン以降休み	
	C_IF_APNO_EQUAL	38,ConWazaProAISeq_06	//ボーナス+1	
	C_IF_APNO_EQUAL	47,ConWazaProAISeq_07	//テンション停止	
	C_IF_APNO_EQUAL	31,ConWazaProAISeq_08	//全員/2+10＝＝自分	
	C_IF_APNO_EQUAL	32,ConWazaProAISeq_09	//前の人+10＝自分	
	C_IF_APNO_EQUAL	46,ConWazaProAISeq_10	//エキサイトによって評価値が変わる	
	C_IF_APNO_EQUAL	27,ConWazaProAISeq_11	//ボーナスを消す	
	C_IF_APNO_EQUAL	16,ConWazaProAISeq_12	//コンボ妨害	
	C_IF_APNO_EQUAL	17,ConWazaProAISeq_12	//コンボ消す	
	C_IF_APNO_EQUAL	26,ConWazaProAISeq_13	//全員緊張	
	C_IF_APNO_EQUAL	18,ConWazaProAISeq_14	//次１回休み	
	C_AIEND

ConWazaProAISeq_01://0802
	C_IF_BONUS_EQUAL	3,ConWazaProAISeq_01_01
	C_IF_BONUS_EQUAL	2,ConWazaProAISeq_01_02
	C_IF_BONUS_EQUAL	1,ConWazaProAISeq_01_03
	C_IF_BONUS_EQUAL	0,ConWazaProAISeq_01_04
	
	C_AIEND


ConWazaProAISeq_01_01:
	C_INCDEC	+20
	C_AIEND

ConWazaProAISeq_01_02:
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_end	//50％の確立で弾く（仮）
	C_INCDEC	+15
	C_AIEND
	
ConWazaProAISeq_01_03:
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_end	//50％の確立で弾く（仮）
	C_INCDEC	+5
	C_AIEND

ConWazaProAISeq_01_04:
	C_INCDEC	-20
	C_AIEND

ConWazaProAISeq_02:
	C_IFN_WAZANOCHECK_EQUAL	29,ConWazaProAISeq_end	//29持ってない？
	C_IF_RANDCOMPNUM_UNDER	50,ConWazaProAISeq_end	//25％の確立で弾く（仮）
	C_INCDEC	+20
	C_AIEND

ConWazaProAISeq_03:
	C_IFN_WAZANOCHECK_EQUAL	30,ConWazaProAISeq_end	//30持ってない？
	C_IF_RANDCOMPNUM_UNDER	50,ConWazaProAISeq_end	//25％の確立で弾く（仮）
	C_INCDEC	+20
	C_AIEND

ConWazaProAISeq_04:
	C_IFN_ORDER_EQUAL	3,ConWazaProAISeq_end		//４番目なら
	C_IF_RANDCOMPNUM_UNDER	50,ConWazaProAISeq_end	//25％の確立で弾く（仮）
	C_INCDEC	+15
	C_AIEND

ConWazaProAISeq_05:
	C_IF_TURN_EQUAL	4,ConWazaProAISeq_05_01	//５ターン目なら
	C_IF_RANDCOMPNUM_UNDER	220,ConWazaProAISeq_05_02//10％の確立で弾く（仮）
	C_INCDEC	+10
	C_AIEND

ConWazaProAISeq_05_01:
	C_IF_RANDCOMPNUM_UNDER	20,ConWazaProAISeq_end	//25％の確立で弾く（仮）
	C_INCDEC	+15
	C_AIEND

ConWazaProAISeq_05_02:
	C_INCDEC	-20
	C_AIEND


ConWazaProAISeq_06:
	C_IFN_WAZANOCHECK_EQUAL	39,ConWazaProAISeq_06_02//39持ってない？
	C_IF_BONUS_EQUAL	3,ConWazaProAISeq_06_01
	C_IF_RANDCOMPNUM_UNDER	50,ConWazaProAISeq_end	//25％の確立で弾く（仮）
	C_INCDEC	+15
	C_AIEND

ConWazaProAISeq_06_01:
	C_INCDEC	-10
	C_AIEND

ConWazaProAISeq_06_02://0806
	C_IF_TURN_EQUAL	4,ConWazaProAISeq_06_04	//５ターン目なら
	C_IF_TURN_EQUAL	0,ConWazaProAISeq_06_03	//1ターン目なら
	C_IF_CONTI_EQUAL	1,ConWazaProAISeq_end	//連続使用ならはじく
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_end	//50％の確立で弾く（仮）
	C_INCDEC	10
	C_AIEND

ConWazaProAISeq_06_03://0806
	C_IF_RANDCOMPNUM_UNDER	100,ConWazaProAISeq_end	//38％の確立で弾く（仮）
	C_INCDEC	10
	C_AIEND

ConWazaProAISeq_06_04://0815
	C_INCDEC	-10
	C_AIEND


ConWazaProAISeq_07://テンション停止:0728
	C_IF_CONTI_EQUAL	1,ConWazaProAISeq_end//連続使用のとき
	C_IF_ORDER_EQUAL	0,ConWazaProAISeq_07_01//0801
	C_IF_ORDER_EQUAL	1,ConWazaProAISeq_07_01//0801
	C_IFN_TURN_EQUAL	4,ConWazaProAISeq_end//５ターン目
	C_IF_ALLWAZA_TENSYONCHECK_EQUAL	ConWazaProAISeq_end//テンションあげる技持ってない
	C_IF_TENSYON_UNDER	1,ConWazaProAISeq_end//テンションmaxになる可能性ない
	C_INCDEC	+10
	C_AIEND

ConWazaProAISeq_07_01:
	C_IF_RANDCOMPNUM_UNDER	127,ConWazaProAISeq_end	//50％の確立で弾く（仮）
	C_INCDEC	+10
	C_AIEND

ConWazaProAISeq_08:
	C_IF_ORDER_EQUAL	1,ConWazaProAISeq_08_01
	C_IF_ORDER_EQUAL	2,ConWazaProAISeq_08_02
	C_IF_ORDER_EQUAL	3,ConWazaProAISeq_08_03
	C_AIEND


ConWazaProAISeq_08_01:
	C_INCDEC	+5
	C_AIEND

ConWazaProAISeq_08_02:
	C_INCDEC	+15
	C_AIEND

ConWazaProAISeq_08_03:
	C_INCDEC	+20
	C_AIEND


ConWazaProAISeq_09:
	C_IF_ORDER_EQUAL	0,ConWazaProAISeq_09_01//0826
	C_IF_ORDER_EQUAL	1,ConWazaProAISeq_09_02//0826
	C_IF_ORDER_EQUAL	2,ConWazaProAISeq_09_03//0826
	C_IF_ORDER_EQUAL	3,ConWazaProAISeq_09_04//0826
	C_AIEND


ConWazaProAISeq_09_01:
	C_INCDEC	-10
	C_AIEND

ConWazaProAISeq_09_02:
	C_IFN_STATUS_EQUAL	0,ConWazaProAISeq_end
	C_INCDEC	+5
	C_AIEND

ConWazaProAISeq_09_03:
	C_IFN_STATUS_EQUAL	0,ConWazaProAISeq_09_03_01
	C_INCDEC	+5
	C_JUMP	ConWazaProAISeq_09_03_01
	C_AIEND

ConWazaProAISeq_09_03_01:
	C_IFN_STATUS_EQUAL	1,ConWazaProAISeq_end
	C_INCDEC	+5
	C_AIEND


ConWazaProAISeq_09_04:
	C_IFN_STATUS_EQUAL	0,ConWazaProAISeq_09_04_01
	C_INCDEC	+5
	C_JUMP	ConWazaProAISeq_09_04_01
	C_AIEND

ConWazaProAISeq_09_04_01:
	C_IFN_STATUS_EQUAL	1,ConWazaProAISeq_09_04_02
	C_INCDEC	+5
	C_JUMP	ConWazaProAISeq_09_04_02
	C_AIEND
ConWazaProAISeq_09_04_02:
	C_IFN_STATUS_EQUAL	2,ConWazaProAISeq_end
	C_INCDEC	+5
	C_AIEND

ConWazaProAISeq_10://0826
	C_IF_ORDER_EQUAL	0,ConWazaProAISeq_10_01//１番目
	C_IF_ORDER_OVER		0,ConWazaProAISeq_10_02//１番目以降なら
	C_AIEND

ConWazaProAISeq_10_01:
	C_IFN_TURN_EQUAL	0,ConWazaProAISeq_10_01_01//１ターン目なら
	C_IF_TENSYON_EQUAL	4,ConWazaProAISeq_10_01_02	//テンション４なら
	C_IF_TENSYON_EQUAL	3,ConWazaProAISeq_10_01_03	//テンション３なら
	C_AIEND

ConWazaProAISeq_10_01_01:
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_end//50%
	C_INCDEC	-15
	C_AIEND

ConWazaProAISeq_10_01_02:
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_end//50%
	C_INCDEC	+20
	C_AIEND

ConWazaProAISeq_10_01_03:
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_end//50%
	C_INCDEC	+15
	C_AIEND

ConWazaProAISeq_10_02:
	C_IF_RANDCOMPNUM_UNDER	178,ConWazaProAISeq_end//30%
	C_INCDEC	+10
	C_AIEND



ConWazaProAISeq_11://0828:前にボーナス状態がいるとき
	C_IF_ORDER_EQUAL	0,ConWazaProAISeq_end//１番目
	C_JUMP	ConWazaProAISeq_11_01
	C_AIEND

ConWazaProAISeq_11_01://0828
	C_IFN_STATUS_EQUAL	0,ConWazaProAISeq_11_01_04	//休みの場合
	C_IF_RIVALBONUS_EQUAL	0,0,ConWazaProAISeq_11_01_04	//星0
	C_IF_RIVALBONUS_EQUAL	0,1,ConWazaProAISeq_11_01_01	//星１
	C_IF_RIVALBONUS_EQUAL	0,2,ConWazaProAISeq_11_01_02	//星２
	C_IF_RIVALBONUS_EQUAL	0,3,ConWazaProAISeq_11_01_03	//星３
	C_AIEND


ConWazaProAISeq_11_01_01://0828
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_11_02//50%
	C_INCDEC	+5
	C_IF_ORDER_OVER	1,ConWazaProAISeq_11_02
	C_AIEND

ConWazaProAISeq_11_01_02://0828
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_11_02//50%
	C_INCDEC	+10
	C_IF_ORDER_OVER	1,ConWazaProAISeq_11_02
	C_AIEND

ConWazaProAISeq_11_01_03://0828
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_11_02//50%
	C_INCDEC	+15
	C_IF_ORDER_OVER	1,ConWazaProAISeq_11_02
	C_AIEND

ConWazaProAISeq_11_01_04://0828
	C_IF_ORDER_OVER	1,ConWazaProAISeq_11_02
	C_AIEND


ConWazaProAISeq_11_02://0828
	C_IFN_STATUS_EQUAL	1,ConWazaProAISeq_11_02_04//休みの場合
	C_IF_RIVALBONUS_EQUAL	1,0,ConWazaProAISeq_11_02_04	//星0
	C_IF_RIVALBONUS_EQUAL	1,1,ConWazaProAISeq_11_02_01	//星１
	C_IF_RIVALBONUS_EQUAL	1,2,ConWazaProAISeq_11_02_02	//星２
	C_IF_RIVALBONUS_EQUAL	1,3,ConWazaProAISeq_11_02_03	//星３
	C_AIEND


ConWazaProAISeq_11_02_01://0828
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_11_03//50%
	C_INCDEC	+5
	C_IF_ORDER_OVER	2,ConWazaProAISeq_11_03
	C_AIEND

ConWazaProAISeq_11_02_02://0828
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_11_03//50%
	C_INCDEC	+10
	C_IF_ORDER_OVER	2,ConWazaProAISeq_11_03
	C_AIEND

ConWazaProAISeq_11_02_03://0828
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_11_03//50%
	C_INCDEC	+15
	C_IF_ORDER_OVER	2,ConWazaProAISeq_11_03
	C_AIEND

ConWazaProAISeq_11_02_04://0828
	C_IF_ORDER_OVER	2,ConWazaProAISeq_11_03
	C_AIEND

ConWazaProAISeq_11_03://0828
	C_IFN_STATUS_EQUAL	2,ConWazaProAISeq_11_03_04//休みの場合
	C_IF_RIVALBONUS_EQUAL	2,0,ConWazaProAISeq_11_03_04	//星0
	C_IF_RIVALBONUS_EQUAL	2,1,ConWazaProAISeq_11_03_01	//星１
	C_IF_RIVALBONUS_EQUAL	2,2,ConWazaProAISeq_11_03_02	//星２
	C_IF_RIVALBONUS_EQUAL	2,3,ConWazaProAISeq_11_03_03	//星３
	C_AIEND


ConWazaProAISeq_11_03_01://0828
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_end//50%
	C_INCDEC	+5
	C_AIEND

ConWazaProAISeq_11_03_02://0828
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_end//50%
	C_INCDEC	+10
	C_AIEND

ConWazaProAISeq_11_03_03://0828
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_end//50%
	C_INCDEC	+15
	C_AIEND

ConWazaProAISeq_11_03_04://0828
	C_AIEND

//コンボを消す＆コンボをつぶすかも
ConWazaProAISeq_12://0829
	C_IF_ORDER_EQUAL	0,ConWazaProAISeq_end//１番目
	C_JUMP	ConWazaProAISeq_12_01
	C_AIEND

ConWazaProAISeq_12_01://0829
	C_IFN_STATUS_EQUAL	0,ConWazaProAISeq_12_02	//休みの場合
	C_IF_RIVALCOMBO1_EQUAL	0,1,ConWazaProAISeq_12_02//コンボ１状態
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_12_02//50%
	C_INCDEC	+2
	C_IFN_COMBOCONTI_EQUAL	0,ConWazaProAISeq_12_02//コンボ発生したことない
	C_INCDEC	+8
	C_AIEND


ConWazaProAISeq_12_02://0828
	C_IF_ORDER_EQUAL	1,ConWazaProAISeq_end//２番目
	C_IFN_STATUS_EQUAL	1,ConWazaProAISeq_12_03	//休みの場合
	C_IF_RIVALCOMBO1_EQUAL	1,1,ConWazaProAISeq_12_03//コンボ１状態
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_12_03//50%
	C_INCDEC	+2
	C_IFN_COMBOCONTI_EQUAL	1,ConWazaProAISeq_12_03//コンボ発生したことない
	C_INCDEC	+8
	C_AIEND

ConWazaProAISeq_12_03://0828
	C_IF_ORDER_EQUAL	2,ConWazaProAISeq_end//３番目
	C_IFN_STATUS_EQUAL	2,ConWazaProAISeq_end	//休みの場合
	C_IF_RIVALCOMBO1_EQUAL	2,1,ConWazaProAISeq_end//コンボ１状態
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_end//50%
	C_INCDEC	+2
	C_IFN_COMBOCONTI_EQUAL	2,ConWazaProAISeq_end//コンボ発生したことない
	C_INCDEC	+8
	C_AIEND

//緊張させる
ConWazaProAISeq_13://0829
	C_IF_ORDER_EQUAL	3,ConWazaProAISeq_end//４番目
	C_JUMP	ConWazaProAISeq_13_01
	C_AIEND

ConWazaProAISeq_13_01://0829
	C_IFN_STATUS_EQUAL	3,ConWazaProAISeq_13_02	//休みの場合
	C_IF_RIVALCOMBO1_EQUAL	3,0,ConWazaProAISeq_13_02//コンボ１状態でない
	C_INCDEC	+5
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_12_02//50%
	C_INCDEC	+5
	C_AIEND

ConWazaProAISeq_13_02://0829
	C_IF_ORDER_EQUAL	2,ConWazaProAISeq_end//３番目
	C_IFN_STATUS_EQUAL	2,ConWazaProAISeq_13_03	//休みの場合
	C_IF_RIVALCOMBO1_EQUAL	2,0,ConWazaProAISeq_13_03//コンボ１状態でない
	C_INCDEC	+5
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_12_03//50%
	C_INCDEC	+5
	C_AIEND

ConWazaProAISeq_13_03://0829
	C_IF_ORDER_EQUAL	1,ConWazaProAISeq_end//２番目
	C_IFN_STATUS_EQUAL	1,ConWazaProAISeq_end	//休みの場合
	C_IF_RIVALCOMBO1_EQUAL	1,0,ConWazaProAISeq_end//コンボ１状態でない
	C_INCDEC	+5
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_end//50%
	C_INCDEC	+5
	C_AIEND


ConWazaProAISeq_14://0901
	C_IF_TURN_EQUAL		4,ConWazaProAISeq_14_01_01//５ターン目
	C_JUMP	ConWazaProAISeq_14_01_02
	C_AIEND

ConWazaProAISeq_14_01_01://0901
	C_INCDEC	+5
	C_JUMP	ConWazaProAISeq_14_01_02
	C_AIEND

ConWazaProAISeq_14_01_02:
	C_IF_ORDER_EQUAL	0,ConWazaProAISeq_14_01//１番目
	C_IF_ORDER_EQUAL	1,ConWazaProAISeq_14_02//２番目
	C_IF_ORDER_EQUAL	2,ConWazaProAISeq_14_03//３番目
	C_IF_ORDER_EQUAL	3,ConWazaProAISeq_14_04//４番目
	C_AIEND

ConWazaProAISeq_14_01://0901
	C_INCDEC	-15
	C_AIEND

ConWazaProAISeq_14_02://0901
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_end//50%
	C_INCDEC	-10
	C_AIEND

ConWazaProAISeq_14_03://0901
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_end//50%
	C_INCDEC	+5
	C_AIEND

ConWazaProAISeq_14_04://0901
	C_IF_RANDCOMPNUM_UNDER	125,ConWazaProAISeq_end//50%
	C_INCDEC	+15
	C_AIEND

ConWazaProAISeq_end:
	C_AIEND

	
@========================================================
@	妨害専用仮AI
@========================================================
ConBougaiAISeq:
	C_IF_CONTYPE_EQUAL	DIST1_CLASS,ConBougaiAISeq_01	
	C_IF_CONTYPE_EQUAL	DIST2_CLASS,ConBougaiAISeq_01	
	C_IF_CONTYPE_EQUAL	INDIRECT_CLASS,ConBougaiAISeq_01	
	C_AIEND

ConBougaiAISeq_01:
	C_IF_RANDCOMPNUM_UNDER	125,ConBougaiAISeq_end//50%
	C_INCDEC	+10
	C_AIEND

ConBougaiAISeq_end:
	C_AIEND



@========================================================
@	エキスパートAI（お馬鹿な動作を制御）
@========================================================
ConExpAISeq:
	C_IF_APNO_EQUAL	8,ConExpAISeq_01	//前一人妨害-20*	
	C_IF_APNO_EQUAL	10,ConExpAISeq_01	//前一人妨害-40	
	C_IF_APNO_EQUAL	12,ConExpAISeq_01	//前一人妨害-60	
	C_IF_APNO_EQUAL	14,ConExpAISeq_01	//前一人妨害-乱数*
	C_IF_APNO_EQUAL	32,ConExpAISeq_01	//前一人=自分
	C_IF_APNO_EQUAL	35,ConExpAISeq_01	//前一人と同じ場合
	C_IF_APNO_EQUAL	36,ConExpAISeq_01	//前一人と違う場合
	C_IF_APNO_EQUAL	37,ConExpAISeq_01	//前一人で変化
	C_IF_APNO_EQUAL	9,ConExpAISeq_02	//前全員妨害-20*
	C_IF_APNO_EQUAL	11,ConExpAISeq_02	//前全員妨害-40
	C_IF_APNO_EQUAL	13,ConExpAISeq_02	//前全員妨害-60
	C_IF_APNO_EQUAL	15,ConExpAISeq_02	//前全員妨害-乱数*
	C_IF_APNO_EQUAL	17,ConExpAISeq_02	//前全員コンボ-40
	C_IF_APNO_EQUAL	16,ConExpAISeq_02	//前全員コンボ消去*
	C_IF_APNO_EQUAL	18,ConExpAISeq_02	//前全員-40で休み
	C_IF_APNO_EQUAL	19,ConExpAISeq_02	//同じタイプを-40
	C_IF_APNO_EQUAL	45,ConExpAISeq_02	//前全員-評価半分
	C_IF_APNO_EQUAL	20,ConExpAISeq_02	//かっこよさ-40*
	C_IF_APNO_EQUAL	21,ConExpAISeq_02	//うつくしさ-40*
	C_IF_APNO_EQUAL	22,ConExpAISeq_02	//かわいさ-40*
	C_IF_APNO_EQUAL	23,ConExpAISeq_02	//かしこさ-40*
	C_IF_APNO_EQUAL	24,ConExpAISeq_02	//たくましさ-40*
	C_IF_APNO_EQUAL	28,ConExpAISeq_02	//前全員-10or-40(ボーナス)*
	C_IF_APNO_EQUAL	27,ConExpAISeq_02	//ボーナスを消す:0826
	C_IF_APNO_EQUAL	31,ConExpAISeq_02	//前全員/2＝自分
	C_IF_APNO_EQUAL	25,ConExpAISeq_03	//後ろ一人緊張*
	C_IF_APNO_EQUAL	26,ConExpAISeq_04	//後ろ全員を必ず緊張
	C_IF_APNO_EQUAL	47,ConExpAISeq_04	//テンションをあげない
	C_IF_APNO_EQUAL	38,ConExpAISeq_05	//ボーナス+10
	C_IF_APNO_EQUAL	4,ConExpAISeq_06	//防御１回
	C_IF_APNO_EQUAL	5,ConExpAISeq_06	//完全防御
	C_IF_APNO_EQUAL	6,ConExpAISeq_06	//20以下を受けない
	C_IF_APNO_EQUAL	2,ConExpAISeq_07	//自爆
	C_AIEND

ConExpAISeq_01://前一人に対象ポケモンがいない場合
	C_IF_ORDER_EQUAL	0,ConExpAISeq_01_01
	C_IF_ORDER_EQUAL	1,ConExpAISeq_01_02
	C_IF_ORDER_EQUAL	2,ConExpAISeq_01_03
	C_IF_ORDER_EQUAL	3,ConExpAISeq_01_04
	C_AIEND

ConExpAISeq_01_01:
	C_INCDEC	-10
	C_AIEND

ConExpAISeq_01_02:
	C_IF_STATUS_EQUAL	0,ConExpAISeq_end
	C_INCDEC	-10	
	C_AIEND

ConExpAISeq_01_03:
	C_IF_STATUS_EQUAL	1,ConExpAISeq_end
	C_INCDEC	-10
	C_AIEND

ConExpAISeq_01_04:
	C_IF_STATUS_EQUAL	2,ConExpAISeq_end
	C_INCDEC	-10
	C_AIEND


ConExpAISeq_02://前に対象ポケモンがいない場合:0801
	C_IF_ORDER_EQUAL	0,ConExpAISeq_02_01
	C_IF_ORDER_EQUAL	1,ConExpAISeq_02_02
	C_IF_ORDER_EQUAL	2,ConExpAISeq_02_03
	C_IF_ORDER_EQUAL	3,ConExpAISeq_02_04
	C_AIEND

ConExpAISeq_02_01:
	C_INCDEC	-20
	C_AIEND

ConExpAISeq_02_02:
	C_IF_STATUS_EQUAL	0,ConExpAISeq_end
	C_INCDEC	-15
	C_AIEND

ConExpAISeq_02_03:
	C_IF_STATUS_EQUAL	0,ConExpAISeq_end
	C_IF_STATUS_EQUAL	1,ConExpAISeq_end
	C_INCDEC	-15
	C_AIEND

ConExpAISeq_02_04:
	C_IF_STATUS_EQUAL	0,ConExpAISeq_end
	C_IF_STATUS_EQUAL	1,ConExpAISeq_end
	C_IF_STATUS_EQUAL	2,ConExpAISeq_end
	C_INCDEC	-15
	C_AIEND

ConExpAISeq_03://後ろ一人に対象ポケモンがいない場合
	C_IF_ORDER_EQUAL	0,ConExpAISeq_03_01
	C_IF_ORDER_EQUAL	1,ConExpAISeq_03_02
	C_IF_ORDER_EQUAL	2,ConExpAISeq_03_03
	C_INCDEC	-10	//４番目
	C_AIEND

ConExpAISeq_03_01:
	C_IF_STATUS_EQUAL	1,ConExpAISeq_end
	C_INCDEC	-10
	C_AIEND

ConExpAISeq_03_02:
	C_IF_STATUS_EQUAL	2,ConExpAISeq_end
	C_INCDEC	-10
	C_AIEND

ConExpAISeq_03_03:
	C_IF_STATUS_EQUAL	3,ConExpAISeq_end
	C_INCDEC	-10
	C_AIEND


ConExpAISeq_04://後ろに対象ポケモンがいない場合
	C_IF_ORDER_EQUAL	0,ConExpAISeq_04_01
	C_IF_ORDER_EQUAL	1,ConExpAISeq_04_02
	C_IF_ORDER_EQUAL	2,ConExpAISeq_04_03
	C_INCDEC	-10	//４番目
	C_AIEND

ConExpAISeq_04_01:
	C_IF_STATUS_EQUAL	1,ConExpAISeq_end
	C_IF_STATUS_EQUAL	2,ConExpAISeq_end
	C_IF_STATUS_EQUAL	3,ConExpAISeq_end
	C_INCDEC	-10
	C_AIEND

ConExpAISeq_04_02:
	C_IF_STATUS_EQUAL	2,ConExpAISeq_end
	C_IF_STATUS_EQUAL	3,ConExpAISeq_end
	C_INCDEC	-10
	C_AIEND

ConExpAISeq_04_03:
	C_IF_STATUS_EQUAL	3,ConExpAISeq_end
	C_INCDEC	-10
	C_AIEND

ConExpAISeq_05://ボーナスが+3になっている？
	C_IF_BONUS_UNDER	3,ConExpAISeq_end
	C_INCDEC	-20
	C_AIEND

ConExpAISeq_06://後ろに対象ポケモンがいない場合の防御技
	C_IF_ORDER_EQUAL	0,ConExpAISeq_06_01
	C_IF_ORDER_EQUAL	1,ConExpAISeq_06_02
	C_IF_ORDER_EQUAL	2,ConExpAISeq_06_03
	C_INCDEC	-10	//４番目
	C_AIEND

ConExpAISeq_06_01:
	C_IF_STATUS_EQUAL	1,ConExpAISeq_end
	C_IF_STATUS_EQUAL	2,ConExpAISeq_end
	C_IF_STATUS_EQUAL	3,ConExpAISeq_end
	C_INCDEC	-10
	C_AIEND

ConExpAISeq_06_02:
	C_IF_STATUS_EQUAL	2,ConExpAISeq_end
	C_IF_STATUS_EQUAL	3,ConExpAISeq_end
	C_INCDEC	-10
	C_AIEND

ConExpAISeq_06_03:
	C_IF_STATUS_EQUAL	3,ConExpAISeq_end
	C_INCDEC	-10
	C_AIEND

ConExpAISeq_07:
	C_IF_TURN_EQUAL		0,ConExpAISeq_07_01
	C_IF_TURN_EQUAL		1,ConExpAISeq_07_02
	C_IF_TURN_EQUAL		2,ConExpAISeq_07_03
	C_IF_TURN_EQUAL		3,ConExpAISeq_07_04
	C_IF_TURN_EQUAL		4,ConExpAISeq_07_05
	C_AIEND

ConExpAISeq_07_01:
	C_IF_RANDCOMPNUM_UNDER	20,ConExpAISeq_end		//7％の確立で弾く（仮）
	C_INCDEC	-15
	C_AIEND

ConExpAISeq_07_02:
	C_IF_RANDCOMPNUM_UNDER	40,ConExpAISeq_end		//15％の確立で弾く（仮）
	C_INCDEC	-15
	C_AIEND

ConExpAISeq_07_03:
	C_IF_RANDCOMPNUM_UNDER	60,ConExpAISeq_end		//23％の確立で弾く（仮）
	C_INCDEC	-15
	C_AIEND

ConExpAISeq_07_04:
	C_IF_RANDCOMPNUM_UNDER	80,ConExpAISeq_end		//31％の確立で弾く（仮）
	C_INCDEC	-15
	C_AIEND

ConExpAISeq_07_05:
	C_IF_RANDCOMPNUM_UNDER	20,ConExpAISeq_end		//8％の確立で弾く（仮）
	C_INCDEC	+20
	C_AIEND

ConExpAISeq_end://終了
	C_AIEND

@========================================================
@	アピールする順番で有利不利が働くものAI
@========================================================
ConNomverAISeq:
	C_IF_ORDER_EQUAL	0,ConNomverAISeq_01	
	C_IF_ORDER_EQUAL	1,ConNomverAISeq_02	
	C_IF_ORDER_EQUAL	2,ConNomverAISeq_03	
	C_IF_ORDER_EQUAL	3,ConNomverAISeq_04
	C_AIEND

ConNomverAISeq_01:
	C_IF_APNO_EQUAL		29,ConNomverAISeq_01_01	//１位なら３倍	
	C_IF_APNO_EQUAL		33,ConNomverAISeq_01_02	//１位なら０
	C_IF_WAZACLASS_EQUAL	BOUGYO_CLASS,ConNomverAISeq_01_03//防御技系？:0807
	C_AIEND

ConNomverAISeq_01_01:
	C_INCDEC	+15
	C_AIEND

ConNomverAISeq_01_02:
	C_INCDEC	-15
	C_AIEND

ConNomverAISeq_01_03:
	C_IF_RANDCOMPNUM_UNDER	100,ConExpAISeq_end		//40％の確立で弾く（仮）
	C_INCDEC	10
	C_AIEND


ConNomverAISeq_02:
	C_IF_APNO_EQUAL	33,ConNomverAISeq_02_01	//２位なら20
	C_IF_WAZACLASS_EQUAL	BOUGYO_CLASS,ConNomverAISeq_02_02//防御技系？:0807
	C_AIEND

ConNomverAISeq_02_01:
	C_INCDEC	-5
	C_AIEND

ConNomverAISeq_02_02:
	C_IF_RANDCOMPNUM_UNDER	125,ConExpAISeq_end		//50％の確立で弾く（仮）
	C_INCDEC	10
	C_AIEND



ConNomverAISeq_03:
	C_IF_APNO_EQUAL	33,ConNomverAISeq_03_01	//３位なら40
	C_IF_APNO_EQUAL	31,ConNomverAISeq_03_01	//今までの合計値の半分
	C_IF_APNO_EQUAL	1,ConNomverAISeq_03_01	//妨害２倍受ける
	C_AIEND

ConNomverAISeq_03_01:
	C_INCDEC	+5
	C_AIEND


ConNomverAISeq_04:
	C_IF_APNO_EQUAL	33,ConNomverAISeq_04_01	//４位なら60
	C_IF_APNO_EQUAL	30,ConNomverAISeq_04_01	//４位なら60
	C_IF_APNO_EQUAL	31,ConNomverAISeq_04_01	//今までの合計値の半分
	C_IF_APNO_EQUAL	1,ConNomverAISeq_04_01	//妨害２倍受ける
	C_IF_APNO_EQUAL	18,ConNomverAISeq_04_04	//次１回休み：0908
	C_IF_WAZACLASS_EQUAL	BOUGYO_CLASS,ConNomverAISeq_04_02//防御技系？
	C_IF_WAZACLASS_EQUAL	DIST2_CLASS,ConNomverAISeq_04_03//全体妨害系？：0807
	C_AIEND

ConNomverAISeq_04_01:
	C_INCDEC	+15
	C_AIEND

ConNomverAISeq_04_02:
	C_INCDEC	-10
	C_AIEND

ConNomverAISeq_04_03:
	C_IF_RANDCOMPNUM_UNDER	125,ConExpAISeq_end		//50％の確立で弾く（仮）
	C_INCDEC	10
	C_AIEND

ConNomverAISeq_04_04:
	C_INCDEC	5
	C_AIEND


@========================================================
@	ダミーAI
@========================================================
ConDummyAISeq:
	C_AIEND

