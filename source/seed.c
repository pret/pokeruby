//=========================================================================
//	
//	seed.c
//		きのみのシステム
//
//
//	2001.09.26	GAME FREAK Inc.
//
//=========================================================================

#include "common.h"
#include "map.h"
#include "../evdata/maparray.h"
#include "print.h"
#include "task.h"
#include "script.h"
#include "item.h"
#include "item_def.h"
#include "calctool.h"
#include "fieldmap.h"		//GetNowMapPos
#include "ev_check.h"

#define SEED_H_GLOBAL
#include "seed.h"


extern u8 TargetObjNo;
extern u16 ReturnItemNo;

//	木の実のタグ定義ファイル
#include "../data/tane_tag.dat"

//	木の実データファイル
#include "../data/tane_tbl.dat"

//=========================================================================
//	定義
//=========================================================================
enum {
		//成長を繰り返す最大数
		SEED_ROUND_MAX		=	10,

		//実がなった状態での成長時間係数
		//実がなった状態では他の状態の4倍長く存在する予定
		FRUIT_TIME_RATE		=	4,

		//成長を繰り返して消えるまでの長さ
		//最初の土の中+（芽+茎+花+実) * SEED_ROUND_MAX;
		LIFE_TIME_LEN		=	1+(1+1+1+FRUIT_TIME_RATE) * SEED_ROUND_MAX,
};


//=========================================================================
//	変数
//=========================================================================

//	木の実初期化用データ
static const SEEDBED SeedBedInitializer =
{
	0,				//u8	type;		種類()
	0,				//u8	growth:7;	成長段階
	0,				//u8	hook:1;		成長抑止フラグ
	0,				//u16	time;		育つ速度(分単位）
	0,				//u8	fruit_count;きのみのできた個数
	0,				//u8	seeds:4;	きのみができた回数
	0,0,0,0			//u8	w_?_bit;	水やりビット
};


//=========================================================================
//=========================================================================
//-------------------------------------------------------------------------
//	外部追加するきのみ用ラム初期化処理
//-------------------------------------------------------------------------
void InitRamSeed( void )
{
	CpuClear( 0, &Fld.RamSeed, sizeof(Fld.RamSeed), 16);
}

//-------------------------------------------------------------------------
//	ＲＡＭ木の実ロード
//	<引数>	データアドレス
//-------------------------------------------------------------------------
void LoadRamSeed( const u8 * src )
{
	int i;
	u8 * dst = (u8 *)&Fld.RamSeed;

	for ( i=0; i<sizeof(RAM_SEED); i++ ) dst[i] = src[i];

	Fld.RamSeed.param.tag1 = Fld.RamSeed.tag1;
	Fld.RamSeed.param.tag2 = Fld.RamSeed.tag2;
}

//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
u32 CalcRamSeedCheckSum( RAM_SEED * ram )
{
	u8 * c;
	u32 i,sum;

	// tag1, 2はアドレスに依存しているので一時的にクリア
	const u8 *tag1, *tag2;
	tag1 = Fld.RamSeed.param.tag1;
	tag2 = Fld.RamSeed.param.tag2;
	Fld.RamSeed.param.tag1 = NULL;
	Fld.RamSeed.param.tag2 = NULL;

	c = (u8*)ram;
	sum = 0;
	for ( i=0; i<sizeof(RAM_SEED)-4; i++ ) sum += c[i];

	// tag1, 2を元に戻す
	Fld.RamSeed.param.tag1 = tag1;
	Fld.RamSeed.param.tag2 = tag2;

	return sum;
}


#ifdef	PM_DEBUG
//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
extern const u8 kurabo_Character[];
extern const u16 kurabo_Palette[];
extern const u8 debug_ram_item[];	// 2002/07/19 by nakahiro
static const u8 debug_ram_tag1[] = { so_,to_,ka_,ra_,spc_,ki_,ta_,spc_,ki_,no_,mi_,EOM_ };
static const u8 debug_ram_tag2[] = { ta_,da_,i_,ma_,spc_,ka_,i_,ha_,tu_,ti_,yyu_,u_,EOM_ };

void DebugMakeDmyRamSeed(const u8 * name, u8 equip, u8 power)
{
	int i;
	Fld.RamSeed.param = SeedParameter[0];
	PM_strcpy( Fld.RamSeed.param.name, name );
	PM_strcpy( Fld.RamSeed.tag1, debug_ram_tag1 );
	PM_strcpy( Fld.RamSeed.tag2, debug_ram_tag2 );
	Fld.RamSeed.param.tag1 = Fld.RamSeed.tag1;
	Fld.RamSeed.param.tag2 = Fld.RamSeed.tag2;
	for ( i=0; i<0x20*36; i++ ) {
		Fld.RamSeed.cgx[i] = kurabo_Character[i];
	}
	for ( i=0; i<16; i++ ) {
		Fld.RamSeed.pal[i] = kurabo_Palette[i];
	}
	for ( i=0; i<18; i++ ) {
		Fld.RamSeed.item_param[i] = debug_ram_item[i];
	}
	Fld.RamSeed.item_equip = equip;
	Fld.RamSeed.item_power = power;

	Fld.RamSeed.checksum = CalcRamSeedCheckSum(&Fld.RamSeed);
}

void DebugChangeDmyRamSeedTaste(u8 karai, u8 sibui, u8 amai, u8 nigai, u8 suppai, u8 umai)
{
	Fld.RamSeed.param.karai = karai;
	Fld.RamSeed.param.sibui = sibui;
	Fld.RamSeed.param.amai = amai;
	Fld.RamSeed.param.nigai = nigai;
	Fld.RamSeed.param.suppai = suppai;
	Fld.RamSeed.param.umai = umai;

	Fld.RamSeed.checksum = CalcRamSeedCheckSum(&Fld.RamSeed);
}

#endif	PM_DEBUG

//-------------------------------------------------------------------------
//	ＲＡＭ木の実の存在チェック
//	<戻り値>	TRUE	存在する
//				FALSE	存在しない
//-------------------------------------------------------------------------
int CheckRamSeedExist( void )
{
	/*　とりあえずのチェック */
	if ( Fld.RamSeed.param.speed == 0 ) return FALSE;
	if ( Fld.RamSeed.param.f_max == 0 ) return FALSE;
	if ( CalcRamSeedCheckSum(&Fld.RamSeed) != Fld.RamSeed.checksum ) return FALSE;
	return TRUE;
}

//-------------------------------------------------------------------------
//	木の実データ取得
//	<引数>	木の実の種類ＩＤ（１～４３）
//	<戻り値>	SEED_PARAM構造体へのポインタ
//-------------------------------------------------------------------------
const SEED_PARAM * GetSeedParam( u8 no )
{
	if ( no == SEED_TYPE_MAX && CheckRamSeedExist() ) {
		return (const SEED_PARAM *)&Fld.RamSeed;
	}
	if ( no > SEED_TYPE_MAX || no == 0 ) no = 1;
	return &(SeedParameter[no-1]);
}

//=========================================================================
//=========================================================================

//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
SEEDBED * GetSeedData( u8 no )
{
	return &Fld.SeedBed[no];
}

//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
static u16 get_grow_speed( u8 type );
static u8 CountSeedWater( u8 no );

static u8 count_water_flag( SEEDBED * s );
static u8 count_fruits( SEEDBED * s );

//-------------------------------------------------------------------------
//	水やりフラグセット
//-------------------------------------------------------------------------
u8 SeedWaterSet( void )
{
	u8 no;
	SEEDBED * s;

	no = EvObjNoEvWorkGet( TargetObjNo );
	s = GetSeedData(no);

	switch ( s->growth ) {
	case SEEDSTAT_UNDERGROUND:
		s->w_ug_bit = 1; break;
	case SEEDSTAT_HUTABA:
		s->w_hutaba_bit = 1; break;
	case SEEDSTAT_MIKI:
		s->w_miki_bit = 1; break;
	case SEEDSTAT_FLOWER:
		s->w_hana_bit = 1; break;
	default:
		return FALSE;
	}
	return TRUE;
}

//-------------------------------------------------------------------------
//
//	目の前にきのみを植えられるかどうかのチェック
//-------------------------------------------------------------------------
extern const VM_CODE * FrontObjCheck(void);
extern const VM_CODE seed_script[];
extern const VM_CODE seed_set_script[];

u8 SeedSetEnableCheck( void )
{
	const VM_CODE * ret;

	ret = FrontObjCheck();
	if( ret != seed_script )return FALSE;
	if( GetSeedGrowth( EvObjNoEvWorkGet( TargetObjNo ) ) != SEEDSTAT_NOTHING )
		return FALSE;

	return TRUE;
}

//-------------------------------------------------------------------------
//	みずやりができるかどうかのチェック
//	※チェックといっしょに水やりフラグのセットも行う
//-------------------------------------------------------------------------
u8 ZyouroUseEnableCheck( void )
{
	const VM_CODE * ret;

	ret = FrontObjCheck();
	if( ret != seed_script )return FALSE;

	return SeedWaterSet();
}

//-------------------------------------------------------------------------
//
//	苗床データの初期化
//
//-------------------------------------------------------------------------
void SeedBedInit( void )
{
	int i;
	for( i=0 ; i<SEEDBED_MAX ; i++ )
	{
		Fld.SeedBed[i] = SeedBedInitializer;
	};
};

//-------------------------------------------------------------------------
//	きのみを育てる
//-------------------------------------------------------------------------
static int SeedGrowth( SEEDBED *s )
{
	if ( s->hook == 1 ) return FALSE;

	switch ( s->growth ) {

	case SEEDSTAT_NOTHING:		// 植えていない
		return FALSE;

	case SEEDSTAT_UNDERGROUND:	// 植えた直後
	case SEEDSTAT_HUTABA:		// 双葉、発芽直後
	case SEEDSTAT_MIKI:			// 幹、成長後
		s->growth ++;
		break;

	case SEEDSTAT_FLOWER:		// 花
		s->fruit_count = count_fruits( s );
		s->growth ++;
		break;

	case SEEDSTAT_FRUIT:		// 実がなった状態
		s->w_ug_bit = 0;
		s->w_hutaba_bit = 0;
		s->w_miki_bit = 0;
		s->w_hana_bit = 0;
		s->fruit_count = 0;
		s->growth = SEEDSTAT_HUTABA;
		s->seeds ++;
		if ( s->seeds == SEED_ROUND_MAX ) *s = SeedBedInitializer;
		break;
	}

	return TRUE;
}

//-------------------------------------------------------------------------
//	きのみの成長を反映
//	<引数>		進行した時間
//-------------------------------------------------------------------------
void EverySeedGrowth( s32 number )
{
	int i;
	s32 count;
	SEEDBED * s;

	for ( i=0 ; i<SEEDBED_MAX ; i++ ) {
		s = &(Fld.SeedBed[i]);
		if( s->type == 0 )continue;
		if( s->growth == SEEDSTAT_NOTHING )continue;
		if( s->hook == 1 )continue;
		if (number >= get_grow_speed(s->type) * LIFE_TIME_LEN) {
			//寿命以上の時間が経過した場合は初期化する
			*s = SeedBedInitializer;
			continue;
		}

		count = number;

		while ( count != 0 ) {
			if ( s->time > count ) {
				s->time -= count;
				count = 0;
				break;
			} else {
				count -= s->time;
				s->time = get_grow_speed( s->type );
				if ( SeedGrowth(s) == FALSE ) break;
				if ( s->growth == SEEDSTAT_FRUIT ) s->time *= FRUIT_TIME_RATE;
			}
		}
	}
}

//-------------------------------------------------------------------------
//	苗床にセットする
//	<引数>	bed_no		苗床の位置ID
//			type		きのみの種類
//			growth		成長段階
//-------------------------------------------------------------------------
void SeedBedSet( u8 bed_no, u8 type, u8 growth, u8 flag )
{
	SEEDBED * s;

	s = GetSeedData(bed_no);
	*s = SeedBedInitializer;
	s->type = type;
	s->time = get_grow_speed( type );
	s->growth = growth;
	if ( growth == SEEDSTAT_FRUIT ) {
		s->fruit_count = count_fruits( s );
		s->time *= FRUIT_TIME_RATE;
	}
	if ( flag == FALSE ) s->hook = 1;
}

//-------------------------------------------------------------------------
//
//	苗床をクリア
//
//-------------------------------------------------------------------------
void SeedBedClear( u8 bed_no )
{
	Fld.SeedBed[bed_no] = SeedBedInitializer;
}

//-------------------------------------------------------------------------
//	きのみの種類を取得
//
//	戻り値		1-SEED_TYPE_MAX	種類コード
//				0				きのみが植えられていない
//-------------------------------------------------------------------------
u8 GetSeedType( u8 bed_no )
{
	return Fld.SeedBed[bed_no].type;
}

//-------------------------------------------------------------------------
//	きのみの成長段階を取得
//
//	戻り値は上の定義を参照
//-------------------------------------------------------------------------
u8 GetSeedGrowth( u8 bed_no )
{
	return Fld.SeedBed[bed_no].growth;
}

//-------------------------------------------------------------------------
//	アイテムナンバーに対応したきのみのタイプナンバーを返す
//-------------------------------------------------------------------------
u8 GetSeedIdByItemNo( u16 item )
{
	if( item <= SEED_START_NO || item > SEED_START_NO + SEED_TYPE_MAX )return 1;
	return item - SEED_START_NO;
}

//-------------------------------------------------------------------------
//	きのみのタイプナンバーに対応したアイテムナンバーを返す
//-------------------------------------------------------------------------
u16 GetItemNoBySeedId( u16 seed )
{
	if( seed <= 0 || seed > SEED_TYPE_MAX )return SEED_START_NO + 1;
	return SEED_START_NO + seed;
}

//-------------------------------------------------------------------------
//	きのみの名前をバッファにコピー
//	<引数>	type		きのみのタイプ指定
//			buf			コピーするバッファ
//	※バッファは最低でもSEED_NAME_SIZE+EOM_SIZEの長さが必要
//-------------------------------------------------------------------------
void SetSeedName( u8 type, u8 * buf )
{
	const SEED_PARAM * param = GetSeedParam(type);
	memcpy( buf, param->name, SEED_NAME_SIZE );
	buf[SEED_NAME_SIZE] = EOM_;
}

//-------------------------------------------------------------------------
//	成長抑止フラグのクリア
//-------------------------------------------------------------------------
void clear_seed_hook_bit( u8 no )
{
	SEEDBED * s = GetSeedData(no);
	s->hook = 0;
}


//-------------------------------------------------------------------------
//	水やり回数のカウント
//-------------------------------------------------------------------------
static u8 count_water_flag( SEEDBED * s )
{
	u8 cnt = 0;
	if( s->w_ug_bit )cnt ++;
	if( s->w_hutaba_bit )cnt++;
	if( s->w_miki_bit )cnt++;
	if( s->w_hana_bit )cnt++;
	return cnt;
}

u8 CountSeedWater( u8 no )
{
	SEEDBED * s = GetSeedData(no);
	return count_water_flag(s);
}

//-------------------------------------------------------------------------
//	実のなる数の算出
//	※実際はこれにランダムが絡む
//-------------------------------------------------------------------------
static u8 calc_fruits(u16 max, u16 min, u8 count)
{
	u32 width, st, end;
	u32 add, total;

	if (count == 0) return min;			//一度も水をやっていない→最小の数

	width = max - min;
	st = width * ( count - 1 );
	end = width * count;
	add = st + pp_rand() % (end - st + 1 );

	//SEEDWATER_MAX進数で1桁落とすときに、"四捨五入"している
	//１０進数ならば add % 10 >= 5という式なので､つまり
	// total = add / 10 + (add%10 >= 5? 1: 0)
	// ということ！
	if (add % SEEDWATER_MAX >= (SEEDWATER_MAX/2)) {
		total = add / SEEDWATER_MAX + 1;
	} else {
		total = add / SEEDWATER_MAX;
	}

	total += min;

	return total;
}

static u8 count_fruits( SEEDBED * s )
{
	u16 t;
	u16 min,max;
	const SEED_PARAM * param;

	param = GetSeedParam(s->type);
	min = param->f_min;
	max = param->f_max;

	t = count_water_flag( s );

	return calc_fruits(max, min, t);
}

u8 get_seed_fruit( u8 no )
{
	return Fld.SeedBed[no].fruit_count;
}

//-------------------------------------------------------------------------
//
//	成長速度の計算
//
//-------------------------------------------------------------------------
u16 get_grow_speed( u8 type )
{
	const SEED_PARAM * param = GetSeedParam(type);
	return param->speed * 60;
}



//=========================================================================
//
//	スクリプトから呼ばれる関数
//
//=========================================================================
//-------------------------------------------------------------------------
//	スクリプト用にきのみ関連のデータをセット
//-------------------------------------------------------------------------
void SeedScriptParam( void )
{
	u8 type,no;

	no = EvObjNoEvWorkGet( TargetObjNo );
	type = GetSeedType( no );
	clear_seed_hook_bit( no );			//話し掛けたら成長抑止はなくなる

	if ( EvObjSeedEffectCheck( TargetObjID, Fld.MapID.map_id, Fld.MapID.div_id ) ) {
		ScriptParameter0 = SEEDSTAT_CHANGE;
	} else {
		ScriptParameter0 = GetSeedGrowth( no );
	}

	ScriptParameter1 = CountSeedWater( no );

	ScriptParameter2 = get_seed_fruit( no );

	SetSeedName( type, StrTempBuffer0 );
}

//-------------------------------------------------------------------------
//	きのみを選択
//-------------------------------------------------------------------------
extern void FieldSeedBagInit(void);

void SeedChoice( void )
{
	MainProcChange( FieldSeedBagInit );
}

//-------------------------------------------------------------------------
//	きのみを植える
//-------------------------------------------------------------------------
void SeedSet( void )
{
	u8 no;
	u8 type;
	type = GetSeedIdByItemNo( ReturnItemNo );
	no = EvObjNoEvWorkGet( TargetObjNo );
	SeedBedSet( no, type, SEEDSTAT_UNDERGROUND, TRUE );
	SeedScriptParam();
}

//-------------------------------------------------------------------------
//	きのみをとる
//-------------------------------------------------------------------------
void SeedGet( void )
{
	u8 no,type;

	no = EvObjNoEvWorkGet( TargetObjNo );
	type = GetSeedType(no);

	ScriptParameter0 = AddItem( GetItemNoBySeedId(type), get_seed_fruit(no) );
}

//-------------------------------------------------------------------------
//	きのみをとったあとの処理
//-------------------------------------------------------------------------
void SeedClear( void )
{
	u8 no;
	no = EvObjNoEvWorkGet( TargetObjNo );
	SeedBedClear( no );

	//キラキラなしで消す処理
	EvObjSeedEffectOff(TargetObjID, Fld.MapID.map_id, Fld.MapID.div_id);
}

//-------------------------------------------------------------------------
//	きのみがポケットにあるかどうかのチェック
//-------------------------------------------------------------------------
u8 SeedPocketCheck( void )
{
	return PocketCheck( SEED_POCKET );
}

//-------------------------------------------------------------------------
//	木の実の情報を表示する
//-------------------------------------------------------------------------
#ifdef	PM_DEBUG
static void debug_strcat_number( const u8 *msg, int num, u8 keta )
{
	PM_strcat( MsgExpandBuffer, msg );
	PM_NumMsgSet( StrTempBuffer0, num, NUM_MODE_ZERO, keta );
	PM_strcat( MsgExpandBuffer, StrTempBuffer0 );
}

const u8 * DebugFrontSeedCheck( void )
{
	int i, no;
	SEEDBED * s;
	static const u8 msg_pos[] = {P__,O__,S__,colon_,EOM_};
	static const u8 msg_type[] = {CR_,T__,Y__,P__,E__,colon_,EOM_};
	static const u8 msg_growth[] = { CR_,G__,R__,O__,W__,colon_,EOM_};
	static const u8 msg_time[] = { CR_,T__,I__,M__,E__,colon_,EOM_};
	static const u8 msg_fruit[] = { CR_,F__,C__,N__,T__,colon_,EOM_};
	static const u8 msg_seeds[] = { CR_,S__,C__,N__,T__,colon_,EOM_};
	static const u8 msg_hook[] = { CR_,H__,O__,O__,K__,colon_,EOM_};
	static const u8 msg_bit[] = { CR_,W__,B__,I__,T__,colon_,EOM_};
	static const u8 msg_dummy[] = {EOM_};

	if( FrontObjCheck() != seed_script )return NULL;

	no = EvObjNoEvWorkGet( TargetObjNo );
	s = GetSeedData(no);

	for(i=0;i<500;i++) MsgExpandBuffer[i] = EOM_;
	debug_strcat_number( msg_pos, no, 3);
	debug_strcat_number( msg_type, s->type, 2 );
	debug_strcat_number( msg_growth, s->growth, 2 );
	debug_strcat_number( msg_time, s->time, 5 );
	debug_strcat_number( msg_fruit, s->fruit_count, 2 );
	debug_strcat_number( msg_seeds, s->seeds, 3 );
	debug_strcat_number( msg_hook, s->hook, 1);
	debug_strcat_number( msg_bit, s->w_ug_bit, 1 );
	debug_strcat_number( msg_dummy, s->w_hutaba_bit, 1);
	debug_strcat_number( msg_dummy, s->w_miki_bit, 1);
	debug_strcat_number( msg_dummy, s->w_hana_bit, 1);
	return MsgExpandBuffer;
}
#endif	PM_DEBUG

//=========================================================================
//
//
//
//=========================================================================
//-------------------------------------------------------------------------
//	画面内のきのみチェック
//	※画面内に入ったらきのみを成長するようにする
//-------------------------------------------------------------------------
void CheckSeedInScreen( void )
{
	int i;
	s16 max_x,max_y,min_x,min_y;
	s16 x,y;

	GetNowMapPos( &x, &y );
	min_x = x;
	min_y = y + 3;
	max_x = x + SCR_CELL_X - 1;
	max_y = min_y + 9 - 1;

	for ( i=0; i< EV_OBJ_MAX; i++ ) {
		if ( EvObj[i].sw == 1 && EvObj[i].mv_code == MV_SEED ) {
			x = EvObj[i].gx;
			y = EvObj[i].gy;
			if ( min_x <= x && x <= max_x && min_y <= y && y <= max_y ) {
				//成長抑止をはずす
				clear_seed_hook_bit( EvObj[i].ev_work );
			}
		}
	}
}


