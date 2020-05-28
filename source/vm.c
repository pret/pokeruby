//=========================================================================
//
//
// 仮想インタープリタマシン　メイン部分
//
//	※スクリプトコマンド実行に使用される
//
//
//	2001.11.7 by tama	script.c からコア部分のみ切り離した
//
//=========================================================================

#include "common.h"

#define __VM_H_GLOBAL
#include "vm.h"



//=========================================================================
//	定義
//=========================================================================
// 仮想マシンの動作状態定義
enum{
	VMSTAT_READY,		// 停止(動作終了）
	VMSTAT_RUN,			// 動作中
	VMSTAT_WAIT,		// 待ち状態（チェックルーチン呼び出し）
};

const u32 ScriptBreakPoint = 0;

//=========================================================================
//
//
// 仮想マシン用関数
//
//
//=========================================================================

//-------------------------------------------------------------------------
// 仮想マシン初期化
//	<引数>	core		仮想マシン制御構造体へのポインタ
//			start		命令テーブル開始アドレス
//			end			命令テーブル終了アドレス
//-------------------------------------------------------------------------

void VM_Init(VM_MACHINE * core, const VM_CMD * start, const VM_CMD * end )
{
	int i;

	core->status = VMSTAT_READY;
	core->PC = NULL;
	core->SP = 0;
	core->routine = NULL;
	core->command_table = start;
	core->command_table_end = end;
	for( i=0; i<VM_REG_MAX; i++ ){ core->reg[i] = 0; }

	for( i=0; i<VM_STACK_MAX; i++ ){ core->array[i]=NULL; }
}


//-------------------------------------------------------------------------
//　仮想マシンにコードを設定
//	<引数>	core		仮想マシン制御構造体へのポインタ
//			start		実行コードの開始アドレス
//-------------------------------------------------------------------------
u8 VM_Start(VM_MACHINE * core, const VM_CODE * start)
{
	core->PC = start;
	core->status = VMSTAT_RUN;
	return TRUE;
}

//-------------------------------------------------------------------------
//	仮想マシンをウェイト状態に設定
//	<引数>	core		仮想マシン制御構造体へのポインタ
//			func		ウェイト関数
//	※TRUEが返ってくるまでウェイト関数を毎回呼びだす
//-------------------------------------------------------------------------
void VM_SetWait( VM_MACHINE * core, u8(*func)(void) )
{
	core->status = VMSTAT_WAIT;
	core->routine = func;
}

//-------------------------------------------------------------------------
//	仮想マシン実行終了
//	<引数>	core		仮想マシン制御構造体へのポインタ
//-------------------------------------------------------------------------
void VM_End(VM_MACHINE * core)
{
	core->status = VMSTAT_READY;
	core->PC = NULL;
}

//-------------------------------------------------------------------------
//　仮想マシン制御メイン
//	<引数>	core		仮想マシン制御構造体へのポインタ
//	<戻り値>
//		TRUE			実行中
//		FALSE			停止中・実行終了
//-------------------------------------------------------------------------


u8 VM_Control(VM_MACHINE * core)
{
	u8 code,ret;

	if ( core->status == VMSTAT_READY ) return FALSE;

	switch ( core->status ) {

		case VMSTAT_READY:
			return FALSE;

		case VMSTAT_WAIT:
			if ( core->routine != NULL ) {
				if ( core->routine() == TRUE ) {
					core->status = VMSTAT_RUN;
				}
				return TRUE;
			}
			core->status = VMSTAT_RUN;
			/* FALL THROUGH */

		case VMSTAT_RUN:
			while ( TRUE ) {
				if ( core->PC == NULL ) {
					core->status = VMSTAT_READY;
					return FALSE;
				}
				if ( core->PC == (VM_CODE *)ScriptBreakPoint ) {
					while( TRUE ) {
						Halt();
					}
				}

				code = VMGetU8(core);
				if ( &(core->command_table[code]) >= core->command_table_end ) {
					core->status = VMSTAT_READY;
					return FALSE;
				}
				ret = core->command_table[code](core);
				if ( ret == 1 ){
					break;
				}
			}
	}
	return TRUE;
}


//=========================================================================
// 仮想マシン制御用サブルーチン
//=========================================================================

//-------------------------------------------------------------------------
// 仮想マシンスタックプッシュ
//-------------------------------------------------------------------------
u8 VMStackPush(VM_MACHINE * core, const VM_CODE * val)
{
	if(core->SP + 1 >= VM_STACK_MAX)return 1;
	core->array[core->SP] = val;
	core->SP ++;
	return 0;
}

//-------------------------------------------------------------------------
// 仮想マシンスタックポップ
//-------------------------------------------------------------------------
const VM_CODE * VMStackPop(VM_MACHINE * core)
{
	if(core->SP == 0)return NULL;
	core->SP --;
	return core->array[core->SP];
}

//-------------------------------------------------------------------------
//	仮想マシンジャンプ命令
//-------------------------------------------------------------------------
void VMJump( VM_MACHINE * core, VM_CODE * adrs )
{
	core->PC = adrs;
}

//-------------------------------------------------------------------------
//	仮想マシンコール命令
//-------------------------------------------------------------------------
void VMCall( VM_MACHINE * core, VM_CODE * adrs )
{
	VMStackPush(core,core->PC);
	core->PC = adrs;
}

//-------------------------------------------------------------------------
//	仮想マシンリターン命令
//-------------------------------------------------------------------------
void VMRet( VM_MACHINE * core )
{
	core->PC = VMStackPop(core);
}


//-------------------------------------------------------------------------
//	PCのアドレスから16bit(2byte)データ取得
// 
//-------------------------------------------------------------------------
u16 VMGetU16(VM_MACHINE * core)
{
	u16 val;
	val = (u16)VMGetU8(core);
	val += (u16)VMGetU8(core) << 8;
	return val;
}

//-------------------------------------------------------------------------
//	PCのアドレスから32bit(4byte)データ取得
// 
//-------------------------------------------------------------------------
u32 VMGetU32(VM_MACHINE * core)
{
	u32 val;
	u8 a,b,c,d;
	a = VMGetU8(core);
	b = VMGetU8(core);
	c = VMGetU8(core);
	d = VMGetU8(core);
	val = 0;
	val += (u32)d;
	val <<= 8;
	val += (u32)c;
	val <<= 8;
	val += (u32)b;
	val <<= 8;
	val += (u32)a;
	return val;
}

