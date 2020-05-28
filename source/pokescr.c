//=========================================================================
//
//		ポケモン関連スクリプト関数
//			※全てスクリプト/イベントから呼ばれる事が前提
//														by matsuda
//=========================================================================

#include "common.h"
#include "poketool.h"
#include "param.h"
#include "menu.h"
#include "task.h"
#include "palanm.h"
#include "script.h"
#include "fight.h"
#include "zukan.h"
#include "pokelist.h"
#include "fld_talk.h"
#include "p_status.h"
#include "monsno.def"
#include "syswork.h"
#include "fld_main.h"
#include "saveload.h"
#include "ev_flag.h"
#include "sysflag.h"
#include "sodateya.h"
#include "seed.h"
#include "../data/itemsym.h"

#define __POKESCR_H_GLOBAL__
#include "pokescr.h"

//----------------------------------------------------------
//	データ
//----------------------------------------------------------
extern const	WazaTblDat	WTD[];


//=========================================================================
// 手持ちﾎﾟｹﾓﾝ全回復
//=========================================================================
void PokeAllKaifuku(void)
{
	u8 i, k;
	u8 buff[4];
	u16 max;
	u16 wazano;
	u8 pp_count;
	
	for(i = 0; i < PokeCountMine; i++)
	{
		//HP
		max = PokeParaGet(&PokeParaMine[i], ID_hpmax);
		buff[0] = 0xff & max;
		buff[1] = max >> 8;
		PokeParaPut(&PokeParaMine[i], ID_hp, buff);
		//PP
		pp_count = PokeParaGet(&PokeParaMine[i], ID_pp_count);
		for(k = 0; k < 4; k++){
			wazano = PokeParaGet(&PokeParaMine[i], ID_waza1+k);
			buff[0] = PPMaxGet(wazano, pp_count, k);
			PokeParaPut(&PokeParaMine[i], ID_pp1+k, buff);
		}
		//Condition
		buff[0] = 0;
		buff[1] = 0;
		buff[2] = 0;
		buff[3] = 0;
		PokeParaPut(&PokeParaMine[i], ID_condition, buff);
	}
}

//=========================================================================
//	手持ちにポケモンを加える。手持ちがいっぱいならﾊﾟｿｺﾝに転送
//	戻り値:	0 = 手持ちに加わった	1 = ﾊﾟｿｺﾝに加わった		2 = どちらもいっぱいだった
//=========================================================================
u8 TemotiPokeAdd(u16 monsno, u8 lv, u16 itemno, 
		u8 *pokename_adrs, u8 *oyaname_adrs, u8 name_sw)
{
	u8 ret;
	u8 buff[2];
	PokemonParam TempPoke;
	u16 zukanno;
	
	PokeParaSet(&TempPoke, monsno, lv, POW_RND, RND_NO_SET, 0,ID_NO_SET,0);
	buff[0] = itemno & 0x00ff;
	buff[1] = itemno >> 8;
	PokeParaPut(&TempPoke, ID_item, buff);
	ret = AddPokemon(&TempPoke);
	zukanno = PokeMonsNo2ZukanNoGet(monsno);
	switch(ret)
	{
		case 0:
		case 1:
			ZukanCheck( zukanno, Z_SEE_SET );
			ZukanCheck( zukanno, Z_GET_SET );
			break;
		default:
	}
	return ret;
}

//=========================================================================
//	手持ちにタマゴを加える。手持ちがいっぱいならﾊﾟｿｺﾝに転送
//	戻り値:	0 = 手持ちに加わった	1 = ﾊﾟｿｺﾝに加わった		2 = どちらもいっぱいだった
//=========================================================================
u8 TemotiTamagoAdd(u16 monsno)
{
	u8 ret,flag;
	PokemonParam TempPoke;
	
	//PokeParaSet(&TempPoke, monsno, lv, POW_RND, RND_NO_SET, 0,ID_NO_SET,0);
	PokemonTamagoSet(&TempPoke, monsno, 1);
	flag = 1;
	PokeParaPut(&TempPoke,ID_tamago_flag,(u8*)&flag);					//タマゴフラグセット


	ret = AddPokemon(&TempPoke);
	return ret;
}

//=========================================================================
//	２対２対戦可能かどうかのチェック
//=========================================================================
void AnswerPoke2vs2Check(void)
{
	switch( Poke2vs2Check() )
	{
	case POKE2VS2_OK:
		AnswerWork = 0;
		break;
	case POKE2VS2_ONE:
		AnswerWork = 1;
		break;
	case POKE2VS2_NOTWO:
		AnswerWork = 2;
		break;
	}
}
//=========================================================================
//	手持ちポケモンのどうぐチェック
//=========================================================================
static u8 CheckAllMineEquipItem(u16 itemno)
{
	int i;
	u16 res;
	for (i=0; i<TEMOTI_POKEMAX; i++) {
		res = PokeParaGet(&PokeParaMine[i], ID_monsno_egg);
		if (res == 0 || res == MONSNO_TAMAGO)
			continue;
		if (PokeParaGet(&PokeParaMine[i], ID_item) == itemno)
			return TRUE;
	}
	return FALSE;
}

u8 ScrCheckTradeDisableItem(void)
{
	u8 seed_id, res;

	res = CheckAllMineEquipItem(ITEM_NAZONOMI);
	if (res == TRUE) {
		seed_id = GetSeedIdByItemNo(ITEM_NAZONOMI);
		SetSeedName(seed_id, StrTempBuffer0);
	}
	return res;
}


//=========================================================================
//	野生ポケモンセット
//=========================================================================
void ScrEncountPokeSet( u16 pokeno, u8 level, u16 itemno )
{

	PokeParaEnemyInit();
	PokeParaSet( &PokeParaEnemy[0], pokeno, level, POW_RND ,RND_NO_SET ,0,ID_NO_SET,0);
	if ( itemno != 0 ) {
		u8 buff[2];
		buff[0] = itemno & 0x00ff;
		buff[1] = itemno >> 8;
		PokeParaPut(&PokeParaEnemy[0], ID_item, buff);
	}
}

//=========================================================================
//	手持ちポケモンのわざを置き換える
//=========================================================================
void TemotiPokeWazaChange( u8 pos, u16 wazano, u8 waza_pos )
{
	if ( pos > TEMOTI_POKEMAX ) pos = PokeCountMine - 1;
	PokeWazaSetPos( &PokeParaMine[pos], wazano, waza_pos );
}


//=========================================================================
//	選択結果によって手持ちポケモンを並び替える
//	※マルチバトルのポケモン選択用、SelectPoke[3]を参照して
//	　PokeParaMine/PokeCountMineを直接書き換える
//=========================================================================
extern u8 SelectPoke[3];
extern void MultiBtlSelectPokeInit(void);
extern void BtlTowerSelectPokeInit(void);

static void SelectBattleTowerMonsEnd( void );
static void SelectMultiBattleMonsEnd( void );

//-------------------------------------------------------------
//マルチバトルの対戦参加ポケモンを選択する
//-------------------------------------------------------------
void SelectBattleMonsStart( void )
{
	sys.pReturnProc = SelectMultiBattleMonsEnd;
	MultiBtlSelectPokeInit();
}

static void SelectMultiBattleMonsEnd( void )
{
	if ( SelectPoke[0] == 0 ) {
		AnswerWork = 0;				//キャンセル
	} else {
		AnswerWork = 1;				//決定
	}
	MainProcChange( FieldScriptRecover );
}

//-------------------------------------------------------------
//バトルタワーの対戦参加ポケモンを選択する
//-------------------------------------------------------------
void SelectBattleTowerMonsStart( void )
{
	sys.pReturnProc = SelectBattleTowerMonsEnd;
	BtlTowerSelectPokeInit();
}

static void SelectBattleTowerMonsEnd( void )
{
	if ( SelectPoke[0] == 0 ) {
		RecoverPokeParaMine();		//ポケモンデータ復帰処理
		AnswerWork = 0;				//キャンセル
	} else {
		SortSelectPokemon();		//ポケモンデータ並び替え
		AnswerWork = 1;				//決定
	}
	MainProcChange( FieldScriptRecover );
}


//-------------------------------------------------------------
//	選択内容にあわせて手持ちのポケモンを並び替える
//-------------------------------------------------------------
void SortSelectPokemon( void )
{
	int i;
	PokemonParam pm_temp[3];

	CpuArrayClear(0,pm_temp,32);

	for ( i=0;i<3;i++ ) {
		if ( SelectPoke[i] != 0 ) {
			pm_temp[i] = PokeParaMine[SelectPoke[i]-1];
		}
	}

	CpuClear( 0, PokeParaMine, sizeof(PokemonParam)*TEMOTI_POKEMAX, 32 );
	for ( i=0; i<3; i++ ) {
		PokeParaMine[i] = pm_temp[i];
	}
	PokeCountMineGet();

}



//=========================================================================
//=========================================================================

extern void SetFieldPoisonEffect( void );

extern const VM_CODE msg_poison_dead[];

static int is_exist_mons_check(PokemonParam * pp)
{
	u16 res;

	res = PokeParaGet(pp, ID_monsno_egg);
	if (res == 0 || res == MONSNO_TAMAGO)
		return FALSE;
	else
		return TRUE;
}

static int all_dead_check( void )
{
	int i;
	PokemonParam * pp = PokeParaMine;

	for ( i=0; i<TEMOTI_POKEMAX; i++, pp++ ) {
		if (is_exist_mons_check(pp) == FALSE) continue;
		if (PokeParaGet(pp,ID_hp) != 0) return FALSE;
	}
	return TRUE;
}

static void poison_dead_set( u8 id )
{
	PokemonParam * pp = &PokeParaMine[id];

	u32 clear = 0;
	FriendCalc(pp, FRIEND_DOKU_HINSHI );
	PokeParaPut(pp,ID_condition,(u8*)&clear);
	PokeParaGet(pp,ID_nickname,StrTempBuffer0);
	NickNameCutOff( StrTempBuffer0 );
}

static int poison_dead_check( u8 id )
{
	PokemonParam * pp = &PokeParaMine[id];
	
	if (is_exist_mons_check(pp) == FALSE) return FALSE;
	if (PokeParaGet(pp, ID_hp) != 0) return FALSE;
//	if (GetPokeCondition(pp) != ST_POISON) return FALSE;
	if (GetPokeConditionParam(PokeParaGet(pp, ID_condition)) != ST_POISON)
		return FALSE;

	return TRUE;
}

static void poison_dead_task( u8 no )
{
	s16 * wk = TaskTable[no].work;

	switch ( wk[0] ) {

	case 0:
		while( wk[1]<TEMOTI_POKEMAX ) {
			if ( poison_dead_check(wk[1]) ) {
				poison_dead_set( wk[1] );
				FieldMsgSet( msg_poison_dead );
				wk[0]++;
				return;
			}
			wk[1]++;
		}
		wk[0] = 2;
		break;

	case 1:
		if ( FieldMsgWait() == FALSE ) break;
		wk[0] --;
		break;

	case 2:
		if ( all_dead_check() ) {
			AnswerWork = 1;
		} else {
			AnswerWork = 0;
		}
		ContinueFieldScript();
		DelTask(no);
		break;
	}
}

//----------------------------------------------------------
//	毒瀕死メッセージの表示＆全滅チェック
//----------------------------------------------------------
void PoisonDead( void )
{
	AddTask( poison_dead_task, 80 );
	StopFieldScript();
}

//----------------------------------------------------------
//	毒ダメージの反映、死亡チェック
//----------------------------------------------------------
int PoisonDeadCheck( void )
{
	int i;
	int poison_flag,dead_flag;
	PokemonParam * pp = PokeParaMine;

	poison_flag = 0;
	dead_flag = 0;

	for ( i=0; i<TEMOTI_POKEMAX; i++ ) {
		if ( PokeParaGet(pp, ID_poke_exist_flag) != 0
	//			&& GetPokeCondition(pp) == ST_POISON ) {
				&& GetPokeConditionParam(PokeParaGet(pp, ID_condition)) == ST_POISON) {
			u32 hp;
			hp = PokeParaGet(pp,ID_hp);
			if ( hp > 0 ) hp --;
			if ( hp == 0 ) dead_flag ++;
			PokeParaPut(pp,ID_hp,(u8*)&hp);
			poison_flag ++;
		}
		pp++;
	}
	if ( dead_flag || poison_flag ) SetFieldPoisonEffect();
	if ( dead_flag ) return 2;
	if ( poison_flag ) return 1;
	return 0;
}


//====================================================================
//
//		おおきさオヤジ
//
//====================================================================

enum {
	//最初の記録の基準となる個体値
	SIZE_OYAJI_DEFAULT_RECORD	=	0x8100,
};

typedef struct MONS_SCALE_ST {
	u16	T1;		//基準
	u8	T2;		//個体値補正係数
	u16	T3;		//個体値基準
} MONS_SCALE;

static const MONS_SCALE mons_scale[] =
{
	{	 290,	  1,	    0 },	// 0
	{	 300,	  1,	   10 },	// 1
	{	 400,	  2,	  110 },	// 2
	{	 500,	  4,	  310 },	// 3
	{	 600,	 20,	  710 },	// 4
	{	 700,	 50,	 2710 },	// 5
	{	 800,	100,	 7710 },	// 6
	{	 900,	150,	17710 },	// 7
	{	1000,	150,	32710 },	// 8
	{	1100,	100,	47710 },	// 9
	{	1200,	 50,	57710 },	// 10
	{	1300,	 20,	62710 },	// 11
	{	1400,	  5,	64710 },	// 12
	{	1500,	  2,	65210 },	// 13
	{	1600,	  1,	65410 },	// 14
	{	1700,	  1,	65510 },	// 15
};

const u8 msg_default_size_oya[] = { KO_,U_,ZI_,EOM_ };

//----------------------------------------------------------
//	個体値の算出
//	<引数>	pp		ポケモン構造体へのポインタ
//	<戻り値>		個体値
//----------------------------------------------------------
static int calc_size_value( PokemonParam * pp )
{
	u16 personal_rnd;
	u16 hp_rnd,pow_rnd,def_rnd;
	u16 agi_rnd,spepow_rnd,spedef_rnd;
	u16 value_A,value_B;

	personal_rnd = PokeParaGet(pp,ID_personal_rnd) & 0xffff;
	hp_rnd = PokeParaGet(pp,ID_hp_rnd) &0x0f;
	pow_rnd = PokeParaGet(pp,ID_pow_rnd) & 0x0f;
	def_rnd = PokeParaGet(pp,ID_def_rnd) & 0x0f;
	agi_rnd = PokeParaGet(pp,ID_agi_rnd) & 0x0f;
	spepow_rnd = PokeParaGet(pp,ID_spepow_rnd) & 0x0f;
	spedef_rnd = PokeParaGet(pp,ID_spedef_rnd) & 0x0f;

	value_A = ((pow_rnd^def_rnd)*hp_rnd) ^ (personal_rnd&0xff) ;
	value_B = ((spepow_rnd^spedef_rnd)*agi_rnd) ^ (personal_rnd>>8) ;

	return value_A * 256 + value_B;
}

//----------------------------------------------------------
//	使用テーブル決定
//----------------------------------------------------------
static u8 get_size_level( u16 value )
{
	u8 level;

	for (level = 1; level < NELEMS(mons_scale) - 1; level ++) {
		if (value < mons_scale[level].T3) return level - 1;
	}
	return level;
}

//----------------------------------------------------------
//	大きさ算出
//	<引数>	monsno		ポケモンナンバー
//			value		個体値
//	<戻り値>			大きさの値
//----------------------------------------------------------
static u32 get_mons_size(u16 monsno, u16 value)
{
	u64 T1, T2, T3;
	u32 zukan_size;		//大きさ係数
	u64 size;
	u8 level;			//使用テーブル指定

	//ZukanPokeDataGetで取得できるのは図鑑での大きさ（メートル単位）×１０の値
	zukan_size = ZukanPokeDataGet(PokeMonsNo2ZukanNoGet(monsno), ZDATA_TAKASA);

	level = get_size_level(value);
	T1 = mons_scale[level].T1;
	T2 = mons_scale[level].T2;
	T3 = mons_scale[level].T3;

	size = T1 + (value - T3) / T2 ;

	/* 大きさ係数の単位 を変換 */
	return zukan_size * size / 10;
}

//----------------------------------------------------------
//	おおきさ文字列をセット
//	<引数>	str		セットするバッファアドレス
//			size	大きさの値
//----------------------------------------------------------
static void set_mons_size_string( u8 * str, u32 size )
{
	u8 str_ten[] = { ten_,EOM_ };

	str = PM_NumMsgSet(str, size / 10, NUM_MODE_LEFT, 8);
	str = PM_strcat(str, str_ten);
	str = PM_NumMsgSet(str, size % 10, NUM_MODE_LEFT, 1);
}


//----------------------------------------------------------
//	おおきさ記録チェック
//	<引数>	monsno		ポケモンナンバー
//			record		記録達成個体値の保存ワーク
//
//			AnswerWork	選んだポケモンの位置
//						(=0xffの場合はキャンセルした）
//
//	<戻り値>
//			0		キャンセル
//			1		ポケモンが違う
//			2		記録でない
//			3		新記録達成！
//
//	※@1(StrTempBuffer1)へ選んだものの大きさをセット
//----------------------------------------------------------
static u8 size_oyaji_check(u16 monsno, u16 * record)
{
	PokemonParam * pp;
	vu16 value;
	u32 now_size;
	u32 record_size;

	if (AnswerWork == 0xff) {
		//ポケモン選択でキャンセルした
		return 0;
	}

	pp = &PokeParaMine[AnswerWork];

	if (PokeParaGet(pp, ID_tamago_flag) == 1) {
		//選択したのがタマゴ
		return 1;
	}
	if (PokeParaGet(pp, ID_monsno) != monsno) {
		//選択したポケモンが違う
		return 1;
	}

	value = calc_size_value(pp);
	now_size = get_mons_size(monsno, value);
	record_size = get_mons_size(monsno, *record);

	set_mons_size_string(StrTempBuffer1, now_size);

	if (now_size <= record_size) {
		//記録更新していない
		return 2;
	} else {
		//記録更新した！
		*record = value;
		return 3;
	}
}

//----------------------------------------------------------
//	おおきさオヤジのMSG用ワークセット
//	<引数>	monsno		ポケモンナンバー
//			record		記録達成個体値の保存ワーク
//
//	<セットされる値>
//		STR_TEMP_BUF0	ポケモン名
//		STR_TEMP_BUF1	記録保持者の名前
//		STR_TEMP_BUF2	記録の数値
//----------------------------------------------------------
static void size_oyaji_info_set(u16 monsno, u16 * record)
{

	u32 size;

	size = get_mons_size(monsno, *record);
	set_mons_size_string(StrTempBuffer2, size);

	PM_strcpy(StrTempBuffer0, PokeNameData[monsno]);

	if (*record == SIZE_OYAJI_DEFAULT_RECORD) {
		//デフォルトのレコードのまま、デフォルトの記録保持者
		PM_strcpy( StrTempBuffer1, msg_default_size_oya );
	} else {
		//更新された記録なので自分の名前
		PM_strcpy( StrTempBuffer1, MyData.my_name );
	}
}

//----------------------------------------------------------
//	おおきさオヤジの記録初期化
//----------------------------------------------------------
void KinokokoSizeOyajiRecordInit( void )
{
	SetEventWorkValue(WK_SIZE_KINOKOKO_OYAJI_RECORD, SIZE_OYAJI_DEFAULT_RECORD);
}

//----------------------------------------------------------
//	おおきさオヤジのMSG用ワークセット（キノココ用）
//----------------------------------------------------------
void KinokokoSizeOyajiRecordInfoSet( void )
{
	u16 * record;

	record = GetEventWorkAdrs(WK_SIZE_KINOKOKO_OYAJI_RECORD);
	size_oyaji_info_set(MONSNO_KINOKOKO, record);
}

//----------------------------------------------------------
//		キノココの大きさチェック
//<入力>
//	AnswerWork	選択したポケモンの位置
//
//<戻り値>
//	AnswerWork	0		キャンセル
//				1		ポケモンが違う
//				2		記録でない
//				3		新記録達成！
//
//	※：@1(StrTempBuffer1)へ選んだものの大きさをセット
//----------------------------------------------------------
void KinokokoSizeOyajiCheck( void )
{
	u16 * record;

	record = GetEventWorkAdrs(WK_SIZE_KINOKOKO_OYAJI_RECORD);
	AnswerWork = size_oyaji_check(MONSNO_KINOKOKO, record);
}


//----------------------------------------------------------
//	おおきさオヤジの記録初期化
//----------------------------------------------------------
void NamazoSizeOyajiRecordInit( void )
{
	SetEventWorkValue(WK_SIZE_NAMAZO_OYAJI_RECORD, SIZE_OYAJI_DEFAULT_RECORD);
}

//----------------------------------------------------------
//	おおきさオヤジのMSG用ワークセット（ナマゾ用）
//----------------------------------------------------------
void NamazoSizeOyajiRecordInfoSet( void )
{
	u16 * record;

	record = GetEventWorkAdrs(WK_SIZE_NAMAZO_OYAJI_RECORD);
	size_oyaji_info_set(MONSNO_DOZYOTTI, record);
}

//----------------------------------------------------------
//	ナマゾの大きさチェック
//<入力>
//	AnswerWork	選択したポケモンの位置
//
//<戻り値>
//	AnswerWork	0		キャンセル
//				1		ポケモンが違う
//				2		記録でない
//				3		新記録達成！
//
//	※：@1(StrTempBuffer1)へ選んだものの大きさをセット
//----------------------------------------------------------
void NamazoSizeOyajiCheck( void )
{
	u16 * record;
	record = GetEventWorkAdrs(WK_SIZE_NAMAZO_OYAJI_RECORD);
	AnswerWork = size_oyaji_check(MONSNO_DOZYOTTI, record);
}




//====================================================================
//
//		外部リボンを手持ちポケモンにセット
//
//	<引数>	pos		リボン指定（0～6）
//			type	リボンの種類
//====================================================================
void TemotiExtraRibbonSet( u8 pos, u8 type )
{
	int i;
	u8 flag = 0;
	u8 one_work[1] ={ 1 };
	const u8 id_list[] = {
		ID_marine_ribbon,
		ID_land_ribbon,
		ID_sky_ribbon,
		ID_country_ribbon,
		ID_national_ribbon,
		ID_earth_ribbon,
		ID_world_ribbon,
	};

	if ( pos >= EXTRA_RIBBON_MAX ) return;
	if ( type > 64 ) return;

	Fld.ExRibbonNo[pos] = type;

	for ( i=0; i<TEMOTI_POKEMAX; i++ ) {
		if ( PokeParaGet( &PokeParaMine[i], ID_monsno ) == 0 ) continue;
		if ( PokeParaGet( &PokeParaMine[i], ID_egg_exist_flag ) ) continue;
		PokeParaPut( &PokeParaMine[i], id_list[pos], one_work );
		flag = 1;
	}
	if ( flag ) {
		//リボンをもらったらフラグをオンにする
		EventFlagSet( SYS_RIBBON_GET );
	}
}




//====================================================================
//====================================================================

#if 0
static int CheckPokeType( PokemonParam * pp, u8 type )
{
	u16 no = PokeParaGet( pp, ID_monsno );

	if( PPD[no].type1 == type || PPD[no].type2 == type ) {
		return TRUE;
	} else {
		return FALSE;
	}
}
#endif
