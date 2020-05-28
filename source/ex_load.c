//=========================================================================
//	
//
//		外部データ処理システム
//
//
//=========================================================================

#include "common.h"

#define	__EX_LOAD_H_GLOBAL__
#include "ex_load.h"

#include "vm.h"
#include "svld_ini.h"

#include "script.h"
#include "print.h"
#include "message.h"
#include "ev_check.h"
#include "seed.h"
#include "pokescr.h"
#include "kaiwa.h"
#include "poketool.h"
#include "box2.h"
#include "monsno.def"
#include "item.h"
#include "zukan.h"
#include "initgame.h"
#include "b_tower.h"
#include "saveload.h"
#include "calctool.h"
#include "syswork.h"

#include "ex_cmd.h"

//=========================================================================
//	定義
//=========================================================================
//#define name value

//typedef ...


//=========================================================================
//	変数
//=========================================================================
//外部データロード時のメッセージデータ
extern const u8 msg_exdata_ramseed_get_first[];
extern const u8 msg_exdata_ramseed_get[];
extern const u8 msg_exdata_ramseed_get_already[];
extern const u8 msg_exdata_ribbon_set[];
extern const u8 msg_exdata_zenkoku_zukan[];
extern const u8 msg_exdata_kaiwa_word[];
extern const u8 msg_exdata_pokemon_get[];
extern const u8 msg_exdata_pokemon_full[];
extern const u8 msg_exdata_trainer_get[];
extern const u8 msg_exdata_btower_data_get[];
extern const u8 msg_exdata_vercheck_error[];



//	外部データ用仮想マシンコマンドテーブル
extern const VM_CMD	ExtraDataCommandStart[];
extern const VM_CMD	ExtraDataCommandEnd[];

//	外部データ用仮想マシンワーク
static VM_MACHINE vm_extra ={};

enum{
	REG_LOAD_ADRS	= 0,
	REG_MAKE_ADRS	= 1,
	REG_RESULT		= 2,
	REG_ID_OK		= 3,
};


//=========================================================================
//	関数
//=========================================================================

#define	GET_REAL_ADRS(core,adrs)	\
	( adrs - (core)->reg[REG_MAKE_ADRS] + (core)->reg[REG_LOAD_ADRS] )

//-------------------------------------------------------------------------
//	認証ＩＤのチェック
//
//	<引数>		area		外部データ地域コード
//				langarea	外部データ言語コード
//				gen			外部データ世代コード
//				ver			外部データバージョンコード
//
//	<戻り値>	TRUE		ＯＫ
//				FALSE		ＮＧ
//-------------------------------------------------------------------------
static int verify_exdata_id(u16 area, u32 langarea, u16 gen, u32 ver)
{
	if ((area & EXDATA_AREA_VALUE) == 0)
		return FALSE;
	if ((langarea & EXDATA_LANGAREA_VALUE) == 0)
		return FALSE;
	if ((gen & EXDATA_GEN_VALUE) == 0)
		return FALSE;
	if ((ver & EXDATA_VER_VALUE) == 0)
		return FALSE;

	return TRUE;
}

//-------------------------------------------------------------------------
//	エラーのセット
//-------------------------------------------------------------------------
static void set_exdata_id_error(void)
{
	PM_MsgExpand( MsgExpandBuffer, msg_exdata_vercheck_error );
	SetExtraDataError(EXRUN_RET_ERROR_MSG_END);
}

//-------------------------------------------------------------------------
//	外部データ実行初期化
//	<引数>			core	仮想マシン構造体へのポインタ
//					ex_data	実行データのアドレス
//-------------------------------------------------------------------------
static void run_exdata_init(VM_MACHINE *core, const u8 * ex_data)
{
	VM_Init( core, ExtraDataCommandStart, ExtraDataCommandEnd );
	VM_Start( core, ex_data );
	core->reg[REG_LOAD_ADRS] = (u32)ex_data;
	core->reg[REG_MAKE_ADRS] = 0;
	core->reg[REG_RESULT] = EXRUN_RET_NORMAL_END;
	core->reg[REG_ID_OK] = FALSE;
}

//-------------------------------------------------------------------------
//	外部データ実行メイン部分
//	<引数>			仮想マシン構造体へのポインタ
//	<戻り値>		TRUE	実行中
//					FALSE	実行終了
//-------------------------------------------------------------------------
static int run_exdata_main(VM_MACHINE * core)
{
	//実行終了か
	if (VM_Control(core) == FALSE)
		return FALSE;

	//認証失敗か
	if (core->reg[REG_ID_OK] == FALSE)
		return FALSE;

	//継続実行中
	return TRUE;
}

//-------------------------------------------------------------------------
//外部追加データ処理
//	※外部から追加されたアドレスを解釈、処理する
//	<引数>
//		ex_data			外部データアドレス
//	<戻り値>
//		EXRUN_RET_～	※定義を参照
//-------------------------------------------------------------------------
int RunExtraData( const u8 * ex_data )
{
	run_exdata_init(&vm_extra, ex_data);

	while (1) {
		if (run_exdata_main(&vm_extra) == FALSE)
			return vm_extra.reg[REG_RESULT];
	}
}

//-------------------------------------------------------------------------
//	外部データエラーコードセット
//	<引数>	エラーコード
//			※EXRUN_RET_～の定義を参照
//-------------------------------------------------------------------------
void SetExtraDataError( u32 error )
{
	vm_extra.reg[REG_RESULT] = error;
}

//=========================================================================
//=========================================================================
//-------------------------------------------------------------------------
//	チェックサムの算出ルーチン
//	<引数>		adrs	開始アドレス
//				size	データサイズ
//	<戻り値>	算出した値
//-------------------------------------------------------------------------
static u32 calc_check_sum(const u8 * adrs, u32 size)
{
	u32 sum, ofs;

	sum = 0;
	for (ofs = 0; ofs < size; ofs ++) 
		sum += adrs[ofs];
	return sum;
}

static u32 get_u32(const u8 * adrs)
{
	return adrs[0] | (adrs[1]<<8) | (adrs[2]<<16) | (adrs[3]<<24);
}

static void set_u32(u8 * adrs, u32 value)
{
	adrs[0] = value & 0xff;
	adrs[1] = (value >> 8) & 0xff;
	adrs[2] = (value >> 16) & 0xff;
	adrs[3] = (value >> 24) & 0xff;
}

//-------------------------------------------------------------------------
//	チェックサムの埋め込み処理
//	<引数>	adrs		RAM上の外部データアドレス
//			real_adrs	サンプルデータの存在するロムアドレス
//
//	※通常、チェックデータがある外部データは先頭から下記のような
//	　構造になっている
//
//   0 .byte	EX_CMD_START
//   1 .word	data start adrs
//   5 .2byte	area ID
//   7 .4byte	language area ID
//  11 .2byte	generation ID
//  13 .4byte	version ID
//  17 .byte	EX_CMD_CHECKSUM
//  18 .4byte	check sum value
//  22 .4byte	check start address
//  26 .4byte	check end address
//-------------------------------------------------------------------------

static int set_check_sum(u8 * adrs, const u8 * real_adrs)
{
	u32 start,end;
	u32 sum;

	//EX_CMD_STARTの存在チェック
	if (adrs[0] != 0x01)
		return FALSE;

	//EX_CMD_CHECKSUMの存在チェック
	if (adrs[17] != 0x0f)
		return FALSE;

	//サムチェック埋め込み個所が０以外の場合､失敗する
	if (get_u32(&adrs[18]) != 0)
		return FALSE;

	start = get_u32(&adrs[22]) - (u32)real_adrs + (u32)adrs;
	end = get_u32(&adrs[26]) - (u32)real_adrs + (u32)adrs;
	sum = calc_check_sum((const u8*)start, end - start);
	set_u32(&adrs[18], sum);
	return TRUE;
}

//-------------------------------------------------------------------------
//	ＣＲＣの埋め込み処理
//	<引数>	adrs		RAM上の外部データアドレス
//			real_adrs	サンプルデータの存在するロムアドレス
//
//	※先頭の命令としてチェックコマンドがくると想定しているのは
//	　チェックサムの場合と同じ
//-------------------------------------------------------------------------
static int set_check_crc(u8 * adrs, const u8 * real_adrs)
{
	u32 start,end;
	u32 crc;

	//EX_CMD_STARTの存在チェック
	if (adrs[0] != 0x01)
		return FALSE;

	//EX_CMD_CHECKSUMの存在チェック
	if (adrs[17] != 0x10)
		return FALSE;

	//サムチェック埋め込み個所が０以外の場合､失敗する
	if (get_u32(&adrs[18]) != 0)
		return FALSE;

	start = get_u32(&adrs[22]) - (u32)real_adrs + (u32)adrs;
	end = get_u32(&adrs[26]) - (u32)real_adrs + (u32)adrs;
	crc = calc_crc((const u8*)start, end - start);
	set_u32(&adrs[18], crc);
	return TRUE;
}

//=========================================================================
//
//	配布アイテムデータ関連
//
//	※Fld.ExtraItem.itemは配列で用意しているが
//	　実際に使うのは一つだけ。セーブデータがずれないように
//	　そのままになっている
//=========================================================================

static u32 calc_exitem_checksum( void )
{
	u32 i;
	u32 sum = 0;
	u8 * p = (u8 *)&(Fld.ExtraItem.item[0]);
	for ( i=0; i<sizeof(Fld.ExtraItem.item[0])*EX_ITEM_MAX; i++ ) {
		sum += p[i];
	}
	return sum;
}

//-------------------------------------------------------------------------
//	配布アイテムの存在チェック
//-------------------------------------------------------------------------
int CheckExItemExists( void )
{
	EXTRA_ITEM * item = &Fld.ExtraItem.item[0];
	u32 sum = calc_exitem_checksum();
	if ( item->type == 0 || item->count == 0 || item->number == 0 ) return FALSE;
	if ( sum == 0 || sum != Fld.ExtraItem.checksum ) return FALSE;
	return TRUE;
}

//-------------------------------------------------------------------------
//	配布アイテムの消去
//-------------------------------------------------------------------------
void ClearExItem( void )
{
	CpuClear( 0, &(Fld.ExtraItem), sizeof(Fld.ExtraItem), 16 );
}

//-------------------------------------------------------------------------
//	配布アイテムの設定
//	<引数>	type		配布種別（今のところ１種類のみ）
//			count		配布上限
//			number		配布アイテムナンバー
//-------------------------------------------------------------------------
void SetExItem( u8 type, u8 count, u16 number )
{
	if ( type == 0 || count == 0 || number == 0 ) {
		ClearExItem();
		return;
	}
	Fld.ExtraItem.item[0].type = type;
	Fld.ExtraItem.item[0].count = count;
	Fld.ExtraItem.item[0].number = number;
	Fld.ExtraItem.checksum = calc_exitem_checksum();
}

//-------------------------------------------------------------------------
//	配布アイテム取得
//	<戻り値>		アイテムナンバー
//					０のとき、存在しない
//	※自動的に配布回数をカウントダウンする
//-------------------------------------------------------------------------
u16 GetExItem( void )
{
	u16 number;
	EXTRA_ITEM * item = &Fld.ExtraItem.item[0];

	if ( CheckExItemExists() == FALSE ) {
		ClearExItem();
		return 0;
	}

	number = item->number;
	(item->count)--;
	if ( item->count == 0 ) {
		ClearExItem();
	} else {
		Fld.ExtraItem.checksum = calc_exitem_checksum();
	}
	return number;
}


//=========================================================================
//
//	外部データコマンド
//
//=========================================================================
//-------------------------------------------------------------------------
//	外部データコマンド：外部データ処理終了
//-------------------------------------------------------------------------
u8 ExCmdEnd( VM_MACHINE * core )
{
	VM_End(core);
	return 1;
}

//-------------------------------------------------------------------------
//	外部データコマンド：外部データ処理開始
//	※先頭に必ず必要
//-------------------------------------------------------------------------
u8 ExCmdSetStart( VM_MACHINE * core )
{
	u16 area_id, gen_id;
	u32 langarea_id, ver_id;
	
	//開始基準アドレスをロード
	core->reg[REG_MAKE_ADRS] = VMGetU32(core);

	//認証ＩＤをチェック
	area_id = VMGetU16(core);
	langarea_id = VMGetU32(core);
	gen_id = VMGetU16(core);
	ver_id = VMGetU32(core);

	if (verify_exdata_id(area_id, langarea_id, gen_id, ver_id) == TRUE) {
		core->reg[REG_ID_OK] = TRUE;
	} else {
		set_exdata_id_error();
	}

	return 1;
}

//-------------------------------------------------------------------------
//	外部データコマンド：何もしない
//-------------------------------------------------------------------------
u8 ExCmdNop( VM_MACHINE * core )
{
	return 0;
}

//-------------------------------------------------------------------------
//	外部データコマンド：終了結果コードのセット
//-------------------------------------------------------------------------
u8 ExCmdSetResult( VM_MACHINE * core )
{
	u8 res = VMGetU8(core);
	core->reg[REG_RESULT] = res;
	return 0;
}

//-------------------------------------------------------------------------
//	外部データコマンド：メッセージ生成
//-------------------------------------------------------------------------
u8 ExCmdSetMessage( VM_MACHINE * core )
{
	const u8 * msg;
	u8 flag;
	flag = VMGetU8(core);
	msg = (const u8*)GET_REAL_ADRS( core, VMGetU32(core) );
	if ( flag == 0xff || flag == core->reg[REG_RESULT] ) {
		PM_MsgExpand( MsgExpandBuffer, msg );
	}
	return 0;
}

//-------------------------------------------------------------------------
//	外部データコマンド：スクリプトを直接実行する
//-------------------------------------------------------------------------
u8 ExCmdDoScriptDirect( VM_MACHINE * core )
{
	u32 script_adrs;

	script_adrs = GET_REAL_ADRS( core, VMGetU32(core) );
	DoSpecialScript( (const VM_CODE *)script_adrs );
	return 0;
}

//-------------------------------------------------------------------------
//	外部データコマンド：ＲＡＭ木の実のデータをセットする
//-------------------------------------------------------------------------

u8 ExCmdSetSeed( VM_MACHINE * core )
{
	const u8 * start_adrs;
	int exist_flag;

	exist_flag = CheckRamSeedExist();
	start_adrs = (const u8 *)GET_REAL_ADRS( core, VMGetU32(core) );
	PM_strncpy(StrTempBuffer0, Fld.RamSeed.param.name, SEED_NAME_SIZE+EOM_SIZE);
	LoadRamSeed( start_adrs );
	PM_strncpy(StrTempBuffer1, Fld.RamSeed.param.name, SEED_NAME_SIZE+EOM_SIZE);

	if (exist_flag == FALSE) {
		//初めてRAM木の実を取得する場合
		PM_MsgExpand( MsgExpandBuffer, msg_exdata_ramseed_get_first );
		core->reg[REG_RESULT] = EXRUN_RET_NORMAL_MSG_END;

	} else if ( PM_strcmp( StrTempBuffer0, StrTempBuffer1 ) != 0 ) {
		//違うRAM木の実を取得した場合
		PM_MsgExpand( MsgExpandBuffer, msg_exdata_ramseed_get );
		core->reg[REG_RESULT] = EXRUN_RET_NORMAL_MSG_END;

	} else {
		//同じRAM木の実を取得した場合
		PM_MsgExpand( MsgExpandBuffer, msg_exdata_ramseed_get_already );
		core->reg[REG_RESULT] = EXRUN_RET_NORMAL_MSG_END;

	}
	if (CheckRamSeedExist() == TRUE) {
		SetEventWorkValue(WK_RAM_SEED_GET, 1);
	} else {
		core->reg[REG_RESULT] = EXRUN_RET_ERROR_END;
	}

	return 0;
}

//-------------------------------------------------------------------------
//	外部データコマンド：ポケモンにリボンをセットする
//-------------------------------------------------------------------------

u8 ExCmdSetRibbon( VM_MACHINE * core )
{
	u8 pos,type;
	pos = VMGetU8(core);
	type = VMGetU8(core);
	TemotiExtraRibbonSet(pos,type);

	PM_MsgExpand( MsgExpandBuffer, msg_exdata_ribbon_set );
	core->reg[REG_RESULT] = EXRUN_RET_NORMAL_MSG_END;
	return 0;
}


//-------------------------------------------------------------------------
//	外部データコマンド：外部スクリプトをセットする
//-------------------------------------------------------------------------
u8 ExCmdSetScript( VM_MACHINE * core )
{
	u32 start_adrs,end_adrs,size;
	u8 div,map,obj;

	div = VMGetU8(core);
	map = VMGetU8(core);
	obj = VMGetU8(core);
	start_adrs = GET_REAL_ADRS( core, VMGetU32(core) );
	end_adrs = GET_REAL_ADRS( core, VMGetU32(core) );
	size = end_adrs - start_adrs;

	SetExScript( (const u8*)start_adrs, size, div, map, obj );
	return 0;
}

//-------------------------------------------------------------------------
//	外部データコマンド：全国ずかんモードを有効にする
//-------------------------------------------------------------------------

u8 ExCmdSetSpecialZukan( VM_MACHINE * core )
{
	ZukanSpecialFlagSet();
	PM_MsgExpand( MsgExpandBuffer, msg_exdata_zenkoku_zukan );
	core->reg[REG_RESULT] = EXRUN_RET_NORMAL_MSG_END;
	return 0;
}

//-------------------------------------------------------------------------
//	外部データコマンド：簡易会話隠し単語フラグのセット
//-------------------------------------------------------------------------
u8 ExCmdSetKaiwaWord( VM_MACHINE * core )
{
	u8 word_no;
	word_no = VMGetU8(core);
	NowWordFlagSet( word_no );
	PM_MsgExpand( MsgExpandBuffer, msg_exdata_kaiwa_word );
	core->reg[REG_RESULT] = EXRUN_RET_NORMAL_MSG_END;
	return 0;
}

//-------------------------------------------------------------------------
//	外部データコマンド：配布アイテムデータをセット
//-------------------------------------------------------------------------
u8 ExCmdSetDistributeItem( VM_MACHINE * core )
{
	u8 type,count;
	u16 item_no;
	type = VMGetU8(core);
	count = VMGetU8(core);
	item_no = VMGetU16(core);
	SetExItem( type, count, item_no );
	return 0;
}

//-------------------------------------------------------------------------
//	外部データコマンド：ポケモンデータをセット
//-------------------------------------------------------------------------

u8 ExCmdSetPokemon( VM_MACHINE * core )
{
	u32 poke_adrs,mail_adrs;
	MAIL_DATA mail;
	u16 monsno;
	PokemonParam poke;

	poke_adrs = GET_REAL_ADRS( core, VMGetU32(core) );
	mail_adrs = poke_adrs + sizeof(PokemonParam);

	memcpy( (void*)&poke, (void*)poke_adrs, sizeof(PokemonParam) );
	monsno = PokeParaGet(&poke, ID_monsno_egg);

	if ( monsno == MONSNO_TAMAGO ) {
		PM_strncpy(StrTempBuffer0, str_tamago, MONS_NAME_SIZE+EOM_SIZE);
	} else {
		PM_strncpy(StrTempBuffer0, str_pokemon, MONS_NAME_SIZE+EOM_SIZE);
	}

	if ( PokeCountMine == TEMOTI_POKEMAX ) {
		PM_MsgExpand( MsgExpandBuffer, msg_exdata_pokemon_full );
		core->reg[REG_RESULT] = EXRUN_RET_ERROR_MSG_END;
		return 0;
	}

	memcpy( (void*)(&PokeParaMine[5]), (void*)poke_adrs, sizeof(PokemonParam) );
	memcpy( (void*)&mail,(void*)mail_adrs, sizeof(MAIL_DATA) );

	if ( monsno != MONSNO_TAMAGO ) {
		u16 zukanno = PokeMonsNo2ZukanNoGet(monsno);		//図鑑ＮＯへ変換
		ZukanCheck(zukanno,Z_SEE_SET);						//図鑑見たフラグセット
		ZukanCheck(zukanno,Z_GET_SET);						//図鑑ゲットフラグセット
	}

	if ( MailItemNoCheck(PokeParaGet(&PokeParaMine[5],ID_item)) ) {
		PokeAddWrittenMail( &PokeParaMine[5], &mail );
	}

	BoxTumeMineData();
	PokeCountMineGet();
	PM_MsgExpand( MsgExpandBuffer, msg_exdata_pokemon_get );
	core->reg[REG_RESULT] = EXRUN_RET_NORMAL_MSG_END;
	return 0;
}


//-------------------------------------------------------------------------
//	外部データコマンド：トレーナー対戦データをセット
//-------------------------------------------------------------------------

u8 ExCmdSetBattleTrainer( VM_MACHINE * core )
{
	u32 adrs;
	adrs = GET_REAL_ADRS( core, VMGetU32(core) );
	memcpy ( (void*)&(MyData.BattleTowerWork.SBTT_CardE),
			(void*)adrs, sizeof(StockBattleCardETrainer) );
	BattleCardECheckSumCheck();
	PM_MsgExpand( MsgExpandBuffer, msg_exdata_trainer_get );
	core->reg[REG_RESULT] = EXRUN_RET_NORMAL_MSG_END;
	return 0;
}


//-------------------------------------------------------------------------
//	外部データコマンド：時間再設定を許可
//-------------------------------------------------------------------------
u8 ExCmdSetGameTimeReset( VM_MACHINE * core )
{
	GameTimeSpecialFlagSet();

	PM_MsgExpand(MsgExpandBuffer, msg_gtime_enable);
	core->reg[REG_RESULT] = EXRUN_RET_NORMAL_MSG_END;

	return 0;
}

//-------------------------------------------------------------------------
//	外部データコマンド：チェックサム検査
//-------------------------------------------------------------------------
u8 ExCmdCheckSum( VM_MACHINE * core )
{
	u32 start, end, value;

	value = VMGetU32(core);
	start = GET_REAL_ADRS(core, VMGetU32(core));
	end = GET_REAL_ADRS(core, VMGetU32(core));

	if (value != calc_check_sum((const u8*)start, end - start)) {
		core->reg[REG_ID_OK] = FALSE;
		core->reg[REG_RESULT] = EXRUN_RET_ERROR_END;
	}
	return 1;
}

//-------------------------------------------------------------------------
//	外部データコマンド：CRC検査
//-------------------------------------------------------------------------
u8 ExCmdCheckCRC( VM_MACHINE * core )
{
	u32 start, end, value;

	value = VMGetU32(core);
	start = GET_REAL_ADRS(core, VMGetU32(core));
	end = GET_REAL_ADRS(core, VMGetU32(core));

	if (value != calc_crc((const u8*)start, end - start)) {
		core->reg[REG_ID_OK] = FALSE;
		core->reg[REG_RESULT] = EXRUN_RET_ERROR_END;
	}
	return 1;
}


#ifdef	PM_DEBUG


extern const u8 ExtraDataStartMugenTicketScript[];
extern const u8 ExtraDataEndMugenTicketScript[];


extern const u8 ExtraDataStartSamplePokeData[];
extern const u8 ExtraDataEndSamplePokeData[];

extern const u8 ExtraDataStartSampleRibbon[];
extern const u8 ExtraDataEndSampleRibbon[];

extern const u8 sample_ram_seed_data[];
extern const u8 SampleExtraSeedDataStart[];
extern const u8 SampleExtraSeedDataEnd[];

extern const u8 ExtraDataStartSampleZukan[];
extern const u8 ExtraDataEndSampleZukan[];

extern const u8 ExtraDataStartSampleWord[];
extern const u8 ExtraDataEndSampleWord[];

extern const u8 ExtraDataStartSamplePokeData2[];
extern const u8 ExtraDataEndSamplePokeData2[];
extern const u8 test_exdata_pokemon[];
extern const u8 test_exdata_mail[];

extern const u8 ExtraDataStartRtcReset[];
extern const u8 ExtraDataEndRtcReset[];

extern const u8 ExtraDataStartSampleSeedScript[];
extern const u8 ExtraDataEndSampleSeedScript[];

extern const u8 ExtraDataStartSampleGoods[];
extern const u8 ExtraDataEndSampleGoods[];

//対戦トレーナーデータサンプル
extern const u8 ExtraDataStartSampleTrainer[];
extern const u8 test_exdata_trainer[];
extern const u8 ExtraDataEndSampleTrainer[];

extern const u8 ExtraDataStartDistributeItems[];
extern const u8 ExtraDataEndDistributeItems[];
extern const u8 check_start_dist_item[];

//=========================================================================
//
//
//		デバッグ用外部データ生成
//
//
//	外部追加データのサンプル生成用プログラムは、すべて下記の関数仕様になっている
//
//	<引数>		dst		生成データを配置するアドレス
//	<戻り値>	生成したデータのサイズ
//=========================================================================

//-------------------------------------------------------------------------
//	外部スクリプト：むげんのチケットイベント
//-------------------------------------------------------------------------
static u32 DebugMakeExtraTicketScriptData(u8 * dst)
{
	u32 size;
	size = ExtraDataEndMugenTicketScript - ExtraDataStartMugenTicketScript;
	memcpy(dst, ExtraDataStartMugenTicketScript, size);
	set_check_crc(dst, ExtraDataStartMugenTicketScript);

	return size;
}

//-------------------------------------------------------------------------
//	外部スクリプト：リボン追加サンプル
//-------------------------------------------------------------------------
static u32 DebugMakeExtraRibbonData(u8 * dst)
{
	u32 size;
	size = ExtraDataEndSampleRibbon - ExtraDataStartSampleRibbon;
	memcpy(dst, ExtraDataStartSampleRibbon, size);
	set_check_crc(dst, ExtraDataStartSampleRibbon);
	return size;
}

//-------------------------------------------------------------------------
//	外部スクリプト：簡易会話単語追加サンプル
//-------------------------------------------------------------------------
static u32 DebugMakeExtraWordData(u8 * dst)
{
	u32 size;
	size = ExtraDataEndSampleWord - ExtraDataStartSampleWord;
	memcpy(dst, ExtraDataStartSampleWord, size);
	set_check_crc(dst, ExtraDataStartSampleWord);
	return size;
}

//-------------------------------------------------------------------------
//	外部スクリプト：ずかん全国モードサンプル
//-------------------------------------------------------------------------
static u32 DebugMakeExtraZukanData(u8 * dst)
{
	u32 size;
	size = ExtraDataEndSampleZukan - ExtraDataStartSampleZukan;
	memcpy(dst, ExtraDataStartSampleZukan, size);
	set_check_crc(dst, ExtraDataStartSampleZukan);
	return size;
}

//-------------------------------------------------------------------------
//	外部スクリプト：ＲＴＣ再設定データサンプル
//-------------------------------------------------------------------------
u32 DebugMakeExtraRtcResetData(u8 * dst)
{
	u32 size;
	size = ExtraDataEndRtcReset - ExtraDataStartRtcReset;
	memcpy(dst, ExtraDataStartRtcReset, size);
	return size;
}
//-------------------------------------------------------------------------
//	外部スクリプト：きのみをパパからもらうスクリプトサンプル
//-------------------------------------------------------------------------
u32 DebugMakeExtraItemScriptData(u8 * dst)
{
	u32 size;
	size = ExtraDataEndSampleSeedScript - ExtraDataStartSampleSeedScript;
	memcpy(dst, ExtraDataStartSampleSeedScript, size);
	set_check_sum(dst, ExtraDataStartSampleSeedScript);
	return size;
}
//-------------------------------------------------------------------------
//	外部スクリプト：グッズを加えるサンプル
//-------------------------------------------------------------------------
u32 DebugMakeExtraGoodsAddData(u8 * dst)
{
	u32 size;
	size = ExtraDataEndSampleGoods - ExtraDataEndSampleGoods;
	memcpy(dst, ExtraDataStartSampleGoods, size);
	set_check_crc(dst, ExtraDataStartSampleGoods);
	return size;
}

//-------------------------------------------------------------------------
//	外部スクリプト：配布サンプル
//-------------------------------------------------------------------------
u32 DebugMakeExtraDistItemData(u8 * dst, u16 itemno)
{
	u32 size;
	u8 * item_pos;
	size = ExtraDataEndDistributeItems - ExtraDataStartDistributeItems;
	memcpy(dst, ExtraDataStartDistributeItems, size);
	item_pos = check_start_dist_item - ExtraDataStartDistributeItems + dst;
	item_pos += 3;
	item_pos[0] = itemno & 0xff;
	item_pos[1] = (itemno >> 8) & 0xff;
	
	set_check_crc(dst, ExtraDataStartDistributeItems);

	return size;
}

u32 DebugMakeExtraDistKizugusuriData(u8 * dst)
{
	return DebugMakeExtraDistItemData(dst, ITEM_KIZUGUSURI);
}
u32 DebugMakeExtraDistMonsterBallData(u8 * dst)
{
	return DebugMakeExtraDistItemData(dst, ITEM_MONSUTAABOORU);
}
u32 DebugMakeExtraDistKurabonoData(u8 * dst)
{
	return DebugMakeExtraDistItemData(dst, ITEM_KURABONOMI);
}
u32 DebugMakeExtraDistWazaMachineData(u8 * dst)
{
	return DebugMakeExtraDistItemData(dst, ITEM_WAZAMASIN01);
}

//=========================================================================
//	外部スクリプトサンプル:タネをくわえる
//=========================================================================
static const u8 str_sample_ramseed[] = { GA_,I_,BU_,EOM_ };

static u32 DebugMakeExtraSeedData(u8 * dst)
{
	int i;
	u32 size;
	u8 * seed;
	u8 * src;

	src = (u8 *)&Fld.RamSeed;
	(u32)seed = (u32)sample_ram_seed_data - (u32)SampleExtraSeedDataStart + (u32)dst;
	size = (u32)SampleExtraSeedDataEnd - (u32)SampleExtraSeedDataStart;

	DebugMakeDmyRamSeed(str_sample_ramseed, 0, 0);
	for ( i=0; i<0x1000; i++ ) dst[i] = 0;
	for ( i=0; i<size; i++ ) dst[i] = SampleExtraSeedDataStart[i];
	for ( i=0; i<sizeof(RAM_SEED); i++ ) seed[i] = src[i];
	InitRamSeed();

	set_check_sum(dst, SampleExtraSeedDataStart);
	return size;
}

//=========================================================================
//	外部スクリプトサンプル：ポケモンをセットする
//=========================================================================
//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
//	７文字分の親の名前
static const u8 str_sample_english[] = { E__,N__,G__,L__,I__,S__,H__,EOM_ };
//	10文字分のポケモンの名前
static const u8 str_sample_tournament[] = { T__,O__,U__,R__,N__,A__,M__,E__,N__,T__,EOM_ };

static const u32 id_sample_oya = 9999;

static const u8 str_sample_oyaname[] = { KA_,bou_,DO_,I_,bou_,EOM_ };
static const u8 str_sample_pokename[] = { PO_,KE_,KO_,TTU_,KO_,EOM_ };
//-------------------------------------------------------------------------
//ポケモン生成
//-------------------------------------------------------------------------
void DebugMakePokeData( PokemonParam * pp, u16 monsno, u8 level, u16 itemno )
{
	u32 buf;

	PokeParaInit(pp);
	PokeParaSet(pp, monsno, level, POW_RND, RND_NO_SET, 0, ID_SET, id_sample_oya);
//	PokeParaPut(pp, ID_oyaname, str_sample_oyaname);
//	PokeParaPut(pp, ID_nickname, str_sample_pokename);
	PokeParaPut(pp, ID_oyaname, str_sample_english);
	PokeParaPut(pp, ID_nickname, str_sample_tournament);
	buf = itemno;
	PokeParaPut(pp, ID_item, (u8*)&buf);
}

//-------------------------------------------------------------------------
//メール生成
//-------------------------------------------------------------------------
void DebugMakeMailData( PokemonParam * pp, MAIL_DATA * mail )
{
	u8 buf[PERSON_NAME_SIZE+EOM_SIZE];
	u16 itemno;
	u32 id;
	int i;

	MailDataInit( mail );

	itemno = PokeParaGet(pp,ID_item);
	if ( MailItemNoCheck(itemno) == 0 ) return;

	for(i=0;i<MAIL_MSG_LEN;i++) mail->msg[i] = i+1;
	PokeParaGet(pp, ID_oyaname, buf );
	PM_strncpy(mail->writer_name, buf, PERSON_NAME_SIZE+EOM_SIZE);
	id = PokeParaGet(pp, ID_id_no);
	ID_Set( id, mail->writer_id );
	mail->hold_monsno = MailHoldMonsNoMake(PokeParaGet(pp,ID_monsno),
			PokeParaGet(pp,ID_personal_rnd));
	mail->design_no = itemno;
}


//-------------------------------------------------------------------------
//	外部スクリプトサンプル：タマゴを追加する
//-------------------------------------------------------------------------
u32 DebugMakeExtraEggData( u8 * dst )
{
	const u8 * start = ExtraDataStartSamplePokeData2;
	const u8 * end = ExtraDataEndSamplePokeData2;
	u32 size;
	u8 * pokedata;
	u8 * maildata;
	PokemonParam * pp = PokeParaEnemy;
	MAIL_DATA dummy_mail;
	u8 buf[MONS_NAME_SIZE+EOM_SIZE];

	size = (u32)end - (u32)start;
	memcpy( dst, start, size );

	DebugMakePokeData( pp, MONSNO_PIKATYUU, 5, 0 );
	buf[0] = 1;
	PokeParaPut(pp, ID_tamago_flag, buf);
	buf[0] = 3;
	PokeParaPut(pp, ID_friend, buf );
	buf[0] = POS_EVENTHAIHU;
	PokeParaPut(pp, ID_get_place, buf );
	PM_strncpy(buf, str_tamago, MONS_NAME_SIZE+EOM_SIZE);
	PokeParaPut(pp, ID_nickname, buf );

	(u32)pokedata = (u32)test_exdata_pokemon - (u32)start + (u32)dst;
	memcpy( (void*)pokedata, (void*)pp, sizeof(PokemonParam) );

	(u32)maildata = (u32)test_exdata_mail - (u32)start + (u32)dst;
	memcpy( (void*)maildata, (void*)&dummy_mail, sizeof(MAIL_DATA) );

	return size;
}

//-------------------------------------------------------------------------
//	外部スクリプトサンプル：ポケモンをセットする
//-------------------------------------------------------------------------
u32 DebugMakeExtraPokeData( u8 * dst )
{
	const u8 * start = ExtraDataStartSamplePokeData2;
	const u8 * end = ExtraDataEndSamplePokeData2;
	u32 size;
	u8 * pokedata;
	u8 * maildata;
	PokemonParam * pp = PokeParaEnemy;
	MAIL_DATA dummy_mail;

	size = (u32)end - (u32)start;
	memcpy( dst, start, size );

	DebugMakePokeData(pp, MONSNO_ANNOON, 21, ITEM_DORIIMUMEERU);
//	DebugMakePokeData( pp, MONSNO_KINOKOKO, 31, ITEM_UDDHIMEERU );
	DebugMakeMailData( pp, &dummy_mail );

	(u32)pokedata = (u32)test_exdata_pokemon - (u32)start + (u32)dst;
	memcpy( (void*)pokedata, (void*)pp, sizeof(PokemonParam) );

	(u32)maildata = (u32)test_exdata_mail - (u32)start + (u32)dst;
	memcpy( (void*)maildata, (void*)&dummy_mail, sizeof(MAIL_DATA) );

	set_check_crc(dst, start);

	return size;

}

//=========================================================================
//	外部データサンプル：対戦トレーナー
//=========================================================================

extern void BattleCardEDataMake(StockBattleCardETrainer * SBTT_CardE,
		const u8 * name, u32 id);


//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
static void debug_make_triple_poke(void)
{
	PokemonParam * p;

	p = PokeParaMine;
	DebugMakePokeData(p+0, MONSNO_RIZAADO,	50, ITEM_SENSEINOTUME);
	DebugMakePokeData(p+1, MONSNO_KAMEERU, 50, ITEM_KIAINOHATIMAKI);
	DebugMakePokeData(p+2, MONSNO_HUSIGISOU, 50, ITEM_RAMUNOMI);
}

//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
u32 DebugMakeExtraTrainerData( u8 * dst )
{
	u32 size,tr_adrs;
	const u8 * start = ExtraDataStartSampleTrainer;
	const u8 * end = ExtraDataEndSampleTrainer;
	StockBattleCardETrainer SBTT;

	size = (u32)end - (u32)start;
	memcpy( dst, start, size );
	
	BackUpPokeParaMine();
	debug_make_triple_poke();
	BattleCardEDataMake(&SBTT, str_sample_oyaname, id_sample_oya);
	RecoverPokeParaMine();

	tr_adrs = (u32)test_exdata_trainer - (u32)start + (u32) dst;
	memcpy( (void*)tr_adrs, (void*)&SBTT, sizeof(SBTT) );

	return size;
}

//=========================================================================
//
//	『カードｅのふり』用データ
//
//=========================================================================
const u8 str_exdata_ticket[] = { TI_,KE_,TTU_,TO_,EOM_ };
const u8 str_exdata_poke[] = { PO_,KE_,MO_,N_,EOM_ };
const u8 str_exdata_ribbon[] = { RI_,BO_,N_,EOM_ };
const u8 str_exdata_zukan[] = { zu_,ka_,n_,EOM_ };
const u8 str_exdata_word[] = { ka_,n_,i_,ka_,i_,wa_,EOM_ };
const u8 str_exdata_egg[] = { TA_,MA_,GO_,EOM_ };
const u8 str_exdata_seed[] = { NA_,ZO_,no_,mi_,EOM_ };
const u8 str_exdata_trainer[] = { TO_,RE_,bou_,NA_,bou_,EOM_ };
const u8 str_exdata_rtc[] = { zi_,ka_,n_,SE_,TTU_,TO_,EOM_ };
const u8 str_exdata_item[] = { do_,u_,gu_,EOM_ };
const u8 str_exdata_goods[] = { GU_,TTU_,ZU_,EOM_ };
const u8 str_exdata_kizugusuri[] = { ki_,zu_,gu_,su_,ri_,EOM_ };
const u8 str_exdata_monsterball[] = { M__,BO_,bou_,RU_,EOM_ };
const u8 str_exdata_kurabo[] = { KU_,RA_,BO_,EOM_ };
const u8 str_exdata_waza01[] = { MA_,SI_,N_,n0_,n1_,EOM_ };

const EX_SAMPLE_DATA  ExDataMaker[] = {
	{ str_exdata_ticket,	DebugMakeExtraTicketScriptData,},
	{ str_exdata_poke,		DebugMakeExtraPokeData,},
	{ str_exdata_ribbon,	DebugMakeExtraRibbonData,},
	{ str_exdata_zukan,		DebugMakeExtraZukanData,},
	{ str_exdata_word,		DebugMakeExtraWordData,},
	{ str_exdata_egg,		DebugMakeExtraEggData,},
	{ str_exdata_seed,		DebugMakeExtraSeedData,},
	{ str_exdata_trainer,	DebugMakeExtraTrainerData,},
	{ str_exdata_rtc,		DebugMakeExtraRtcResetData, },
	{ str_exdata_item,		DebugMakeExtraItemScriptData, },
	{ str_exdata_goods,		DebugMakeExtraGoodsAddData },
	{ str_exdata_kizugusuri,DebugMakeExtraDistKizugusuriData },
	{ str_exdata_monsterball,DebugMakeExtraDistMonsterBallData },
	{ str_exdata_kurabo,	DebugMakeExtraDistKurabonoData },
	{ str_exdata_waza01,	DebugMakeExtraDistWazaMachineData },
};

const u8 SizeOfExDataMaker = NELEMS(ExDataMaker);


const u8* const ExDataAdrs[][2]={
	{ ExtraDataStartMugenTicketScript,	ExtraDataEndMugenTicketScript	},
	{ ExtraDataStartSamplePokeData,		ExtraDataEndSamplePokeData		},
	{ ExtraDataStartSampleRibbon,		ExtraDataEndSampleRibbon		},
	{ ExtraDataStartSampleZukan,		ExtraDataEndSampleZukan			},
	{ ExtraDataStartSampleWord,			ExtraDataEndSampleWord			},
};


#endif	PM_DEBUG

