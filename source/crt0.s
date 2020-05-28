@********************************************************************
@*          crt0.s                                                  *
@*            スタートアップルーチン（GAS用）                       *
@*                                                                  *
@*          Copyright (C) 1999-2000 NINTENDO Co.,Ltd.               *
@********************************************************************
#include		"version.h"
    .INCLUDE    "AgbDefine.s"
    .INCLUDE    "AgbMemoryMap.s"
    .INCLUDE    "AgbSyscallDefine.s"
    .INCLUDE    "AgbMacro.s"
    .TEXT

    .INCLUDE    "MultiSioDefine.s"

    .GLOBAL     _start
_start:
@    .INCLUDE    "rom_h.s"
#include		"rom_h.s"

@--------------------------------------------------------------------
@-                          リセット                                -
@--------------------------------------------------------------------
    .EXTERN     AgbMain
    .GLOBAL     start_vector
    .CODE 32
start_vector:
        mov     r0, #PSR_IRQ_MODE       @ IRQモードへ切り換え
        msr     cpsr, r0
        ldr     sp, sp_irq              @ SP_irq のセット
        mov     r0, #PSR_SYS_MODE       @ システムモードへ切り換え
        msr     cpsr, r0
        ldr     sp, sp_usr              @ SP_usr のセット
        ldr     r1, =INTR_VECTOR_BUF    @ 割り込みアドレスのセット
        adr     r0, intr_main
        str     r0, [r1]
        ldr     r1, =AgbMain            @ スタート ＆ 16bitコードへの切換
        mov     lr, pc
        bx      r1
        b       start_vector            @ リセット

    .ALIGN
sp_usr: .word   WRAM_END - 0x1a0		@changed by tama 2001/01/25
sp_irq: .word   WRAM_END - 0x60


@--------------------------------------------------------------------
@-          割り込み分岐処理（テーブル引き）32Bit            23-61c -
@--------------------------------------------------------------------
    .EXTERN     IntrTable
    .GLOBAL     intr_main
    .ALIGN
    .CODE 32
intr_main:
        mov     r3, #REG_BASE           @ IE/IF 読み込み
        add     r3, r3, #OFFSET_REG_IE  @ r3: REG_IE
        ldr     r2, [r3]
        ldrh    r1, [r3, #REG_IME - REG_IE]
		
        mrs     r0, spsr                @ レジスタ退避（IRQモード）
        stmfd   sp!, {r0-r3, lr}        @ {spsr, IME, IF|IE, REG_IE, lr}

        mov     r0, #1                  @ IME = 1（IME = 0 実行中に割り込みが発生した場合にも
                                        @          多重割り込みを許可するため）
        strh    r0, [r3, #REG_IME - REG_IE]

        and     r1, r2, r2, lsr #16     @ IE/IF チェック
        mov     r12, #0


        ands    r0, r1, #SIO_INTR_FLAG
        bne     jump_intr                    @ シリアル通信 割り込み
        add     r12,r12, #4                  

        ands    r0, r1, #MULTI_SIO_TIMER_INTR_FLAG
        bne     jump_intr                    @ マルチプレイ通信用タイマー 割り込み
        add     r12,r12, #4                  

        ands    r0, r1, #H_BLANK_INTR_FLAG   @ Hブランク 割り込み
        bne     jump_intr
        add     r12, r12, #4

        ands    r0, r1, #V_BLANK_INTR_FLAG   @ Vブランク 割り込み
        bne     jump_intr
        add     r12, r12, #4

        ands    r0, r1, #V_COUNT_INTR_FLAG   @ Vカウンタ 割り込み
        bne     jump_intr
        add     r12, r12, #4
        ands    r0, r1, #TIMER0_INTR_FLAG    @ タイマー0 割り込み
        bne     jump_intr
        add     r12, r12, #4
        ands    r0, r1, #TIMER1_INTR_FLAG    @ タイマー1 割り込み
        bne     jump_intr
        add     r12, r12, #4
        ands    r0, r1, #TIMER2_INTR_FLAG    @ タイマー2 割り込み
        bne     jump_intr
        add     r12, r12, #4
@        ands    r0, r1, #TIMER3_INTR_FLAG    @ タイマー3 割り込み
@       bne     jump_intr
@        add     r12, r12, #4
@        ands    r0, r1, #SIO_INTR_FLAG       @ シリアル通信 割り込み
@        bne     jump_intr
@        add     r12, r12, #4
        ands    r0, r1, #DMA0_INTR_FLAG      @ DMA0 割り込み
        bne     jump_intr
        add     r12, r12, #4
        ands    r0, r1, #DMA1_INTR_FLAG      @ DMA1 割り込み
        bne     jump_intr
        add     r12, r12, #4
        ands    r0, r1, #DMA2_INTR_FLAG      @ DMA2 割り込み
        bne     jump_intr
        add     r12, r12, #4
        ands    r0, r1, #DMA3_INTR_FLAG      @ DMA3 割り込み
        bne     jump_intr
        add     r12, r12, #4
        ands    r0, r1, #KEY_INTR_FLAG       @ キー 割り込み
        bne     jump_intr
        add     r12, r12, #4
        ands    r0, r1, #CASSETTE_INTR_FLAG  @ カセット 割り込み
        strneb  r0, [r3, #REG_SOUNDCNT_X - REG_IE]  @ サウンド停止
loop:	bne		loop
jump_intr:
        strh    r0, [r3, #2]                    @ IF クリア         22c
        ldr     r1, =H_BLANK_INTR_FLAG| SIO_INTR_FLAG | MULTI_SIO_TIMER_INTR_FLAG       @ IE セット <- 多重割り込み選択
		bic		r2, r2, r0							@同一割り込みが多重に掛からないようにする
		and		r1, r1, r2							@IE にセットさせていた割り込みのみ多重割り込みを許可
        strh    r1, [r3]
        mrs     r3, cpsr                            @ 多重割り込み 許可 ＆ システムモードへ切換
        bic     r3, r3, #PSR_CPU_MODE_MASK | PSR_IRQ_DISABLE | PSR_FIQ_DISABLE
        orr     r3, r3, #PSR_SYS_MODE
        msr     cpsr, r3
@---------------------------------------------------------------------システムモード
        ldr     r1, =IntrTable                      @ ユーザIRQ処理へジャンプ
        add     r1, r1, r12
        ldr     r0, [r1]

        stmfd   sp!, {lr}                           @ レジスタ退避（システムモード）
        adr     lr, intr_return                     @ リターンアドレスのセット
        bx      r0
intr_return:
        ldmfd   sp!, {lr}                           @ レジスタ復帰（システムモード）

        mrs     r3, cpsr                            @ 多重割り込み 不許可 ＆ IRQモードへ切換
        bic     r3, r3, #PSR_CPU_MODE_MASK | PSR_IRQ_DISABLE | PSR_FIQ_DISABLE
        orr     r3, r3, #PSR_IRQ_MODE      | PSR_IRQ_DISABLE
        msr     cpsr, r3
@---------------------------------------------------------------------IRQモード
        ldmfd   sp!, {r0-r3, lr}                    @ レジスタ復帰（IRQモード）
        strh    r2,  [r3]                       @ {spsr, IME, IF|IE, REG_IE, lr}
        strh    r1,  [r3, #REG_IME - REG_IE]
        msr     spsr, r0
        bx      lr                              @ 割り込み前へ復帰


@   .ORG    0x200


    .END

