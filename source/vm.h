
//=========================================================================
//	
//=========================================================================

#ifndef __VM_H
#define __VM_H

#undef GLOBAL
#ifdef __VM_H_GLOBAL
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================
//#define name value
//typedef ...

//-------------------------------------------------------------------------
// 仮想マシン構造体宣言
//-------------------------------------------------------------------------

#define VM_STACK_MAX	20	// 仮想マシンのスタックの深さ
#define	VM_REG_MAX		4	// 仮想マシンのレジスタの数

typedef struct VM_MACHINE_ST * VM_CORE_P;
typedef u8 ( * VM_CMD)(VM_CORE_P);

typedef struct VM_MACHINE_ST{
		u8	SP;							// スタックポインタ
		u8 status;						// 動作状態
		u8 cmp_flag;					// 計算結果フラグ
		u8 (*routine)(void);
		const VM_CODE * PC;				// 現在のスクリプトアドレス
		const VM_CODE * array[VM_STACK_MAX];	// スタック
		const VM_CMD * command_table;
		const VM_CMD * command_table_end;
		u32 reg[VM_REG_MAX];			// 汎用レジスタ
}VM_MACHINE;



//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;


//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);

//-------------------------------------------------------------------------
//関数プロトタイプ:仮想マシン制御用
//-------------------------------------------------------------------------

GLOBAL void VM_Init(VM_MACHINE * core, const VM_CMD * start, const VM_CMD * end );
GLOBAL u8 VM_Start(VM_MACHINE * core,const VM_CODE * start);
GLOBAL u8 VM_Control(VM_MACHINE * core);
GLOBAL void VM_SetWait( VM_MACHINE * core, u8(*func)(void) );
GLOBAL void VM_End(VM_MACHINE * core);

//-------------------------------------------------------------------------
// スタック操作
//-------------------------------------------------------------------------
GLOBAL u8 VMStackPush(VM_MACHINE * core, const VM_CODE * val);
GLOBAL const VM_CODE * VMStackPop(VM_MACHINE * core);

//-------------------------------------------------------------------------
//	分岐命令
//-------------------------------------------------------------------------
GLOBAL void VMJump( VM_MACHINE * core, VM_CODE * adrs );
GLOBAL void VMCall( VM_MACHINE * core, VM_CODE * adrs );
GLOBAL void VMRet( VM_MACHINE * core );

//-------------------------------------------------------------------------
//	データ取得
//-------------------------------------------------------------------------
//	u8サイズのデータを取得するためのマクロ
#define VMGetU8(core)	(*((core)->PC++))

GLOBAL u16 VMGetU16(VM_MACHINE * core);

GLOBAL u32 VMGetU32(VM_MACHINE * core);


#undef GLOBAL
#endif	/*__VM_H*/

