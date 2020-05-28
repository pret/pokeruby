/********************************************************************/
/*          AgbMacro.h                                              */
/*            AGB標準マクロ関数                                     */
/*                                                                  */
/*          Copyright (C) 1999-2001 NINTENDO Co.,Ltd.               */
/********************************************************************/
#ifndef _AGB_MACRO_H
#define _AGB_MACRO_H

#ifdef __cplusplus
extern "C" {
#endif

#include <AgbTypes.h>
#include <AgbSystemCall.h>


/*------------------------------------------------------------------*/
/*                      データ読み込み                              */
/*------------------------------------------------------------------*/

#define DataRead(Readp, Bit)    (*(vu##Bit *)(Readp))

/*------------------------------------------------------------------*/
/*                      データ書き込み                              */
/*------------------------------------------------------------------*/

#define DataWrite(Writep, Data, Bit)                    \
                                                        \
    *(vu##Bit *)(Writep) = (Data)

/*------------------------------------------------------------------*/
/*                      データ コピー                               */
/*------------------------------------------------------------------*/

#define DataCopy(Readp, Writep, Bit)                    \
                                                        \
    *(vu##Bit *)(Writep) = *(vu##Bit *)(Readp)


/*------------------------------------------------------------------*/
/*                  割り込みアドレス セット                         */
/*------------------------------------------------------------------*/

#define IntrAddrSet(Intrp)                              \
                                                        \
    *(vu32 *)INTR_VECTOR_BUF = (vu32 )Intrp

//・割り込み処理のアドレスをセットします。

/*------------------------------------------------------------------*/
/*                      ＤＭＡ セット                               */
/*------------------------------------------------------------------*/

//#define SIMULATOR
#ifndef SIMULATOR
#ifndef CODE32
#define DmaSet(DmaNo, Srcp, Destp, DmaCntData)          \
{                                                       \
    vu32 *(DmaCntp) = (vu32 *)REG_DMA##DmaNo;           \
    DmaCntp[0] = (vu32 )(Srcp);                         \
    DmaCntp[1] = (vu32 )(Destp);                        \
    DmaCntp[2] = (vu32 )(DmaCntData);                   \
    DmaCntp[2];                                         \
}
#else
#define DmaSet(DmaNo, Srcp, Destp, DmaCntData)                   \
{                                                                \
    vu32 *(RegBasep) = (vu32 *)REG_BASE;                         \
    RegBasep[OFFSET_REG_DMA##DmaNo##SAD/4] = (vu32 )(Srcp);      \
    RegBasep[OFFSET_REG_DMA##DmaNo##DAD/4] = (vu32 )(Destp);     \
    RegBasep[OFFSET_REG_DMA##DmaNo##CNT/4] = (vu32 )(DmaCntData);\
    RegBasep[OFFSET_REG_DMA##DmaNo##CNT/4];                      \
}
#endif
#else
#define DmaSet(DmaNo, Srcp, Destp, DmaCntData)                   \
{                                                                \
    int    i;                                                    \
    for (i=0; i<(DmaCntData & 0x1ffff); i++)                     \
        if ((DmaCntData) & DMA_SRC_FIX) {                        \
            if ((DmaCntData) & DMA_32BIT_BUS)                    \
                    ((vu32 *)(Destp))[i] = ((vu32 *)(Srcp))[0];  \
            else    ((vu16 *)(Destp))[i] = ((vu16 *)(Srcp))[0];  \
         } else {                                                \
            if ((DmaCntData) & DMA_32BIT_BUS)                    \
                ((vu32 *)(Destp))[i] = ((vu32 *)(Srcp))[i];      \
            else    ((vu16 *)(Destp))[i] = ((vu16 *)(Srcp))[i];  \
        }                                                        \
}
#endif

//・DMAコントローラにパラメータをセットします。
//・SIMULATERを定義するとCPUでシミュレートします。
//  GDBでデバッグする場合などに有効です。
//・最後にDMA起動待ちのために"LDR"命令が挿入されます。
//
//・引数：
//  DmaNo       DMA番号
//  Srcp        ソースアドレス
//  Destp       デスティネーションアドレス
//  DmaCntData  パラメータデータ
//
//※CPU内部RAM上のプログラムにてDMAを起動すると
//  その次の命令が先に実行されます。
//  よって、DMA直後に転送先をCPUにて変更しようとした場合、
//  読み込み／書き戻しの間にDMAが起動されてしまいますので、
//  DMAの転送先のデータが意図していない値になる場合があります。
//  その場合にはDmaWait()を直後に挿入して、DMAが終了したか
//  どうかをチェックすると続くコードへの影響を確実に回避できます。


/*------------------------------------------------------------------*/
/*                      ＤＭＡ クリア                               */
/*------------------------------------------------------------------*/

#define DmaClear(DmaNo, Data, Destp, Size, Bit)             \
{                                                           \
    vu##Bit Tmp = (vu##Bit )(Data);                         \
    DmaSet(DmaNo, &Tmp, Destp, (                            \
        DMA_ENABLE         | DMA_TIMMING_IMM |              \
        DMA_SRC_FIX        | DMA_DEST_INC    |              \
        DMA_##Bit##BIT_BUS | ((Size)/(Bit/8))));            \
}

#define DmaClearIf(DmaNo, Data, Destp, Size, Bit)           \
{                                                           \
    vu##Bit Tmp = (vu##Bit )(Data);                         \
    DmaSet(DmaNo, &Tmp, Destp, (                            \
        DMA_ENABLE         | DMA_TIMMING_IMM |              \
        DMA_IF_ENABLE      |                                \
        DMA_SRC_FIX        | DMA_DEST_INC    |              \
        DMA_##Bit##BIT_BUS | ((Size)/(Bit/8))));            \
}

#define DmaArrayClear(  DmaNo, Data, Destp, Bit)            \
        DmaClear(       DmaNo, Data, Destp, sizeof(Destp), Bit)

#define DmaArrayClearIf(DmaNo, Data, Destp, Bit)            \
        DmaClearIf(     DmaNo, Data, Destp, sizeof(Destp), Bit)

//・DMAでRAMクリアします。
//・クリアデータはスタックに置かれ、それをデスティネーションへコピーします。
//・DmaClearIf／DmaArrayClearIfは終了時に割り込み要求を発生します。
//・DmaArrayClear／DmaArrayClearIfはデスティネーション配列全体をクリアします。
//
//・引数：
//  DmaNo       DMA番号
//  Data        クリアデータ
//  Destp       デスティネーションアドレス
//  Size        クリアバイト数
//  Bit         転送ビット幅（16|32）
//
//
//※CPU内部RAM上のプログラムにてDMAを起動すると
//  その次の命令が先に実行されます。
//  よって、DMA直後に転送先をCPUにて変更しようとした場合、
//  読み込み／書き戻しの間にDMAが起動されてしまいますので、
//  DMAの転送先のデータが意図していない値になる場合があります。
//  その場合にはDmaWait()を直後に挿入して、DMAが終了したか
//  どうかをチェックすると続くコードへの影響を確実に回避できます。

/*------------------------------------------------------------------*/
/*                      ＤＭＡ コピー                               */
/*------------------------------------------------------------------*/

#define DmaCopy(DmaNo, Srcp, Destp, Size, Bit)              \
                                                            \
    DmaSet(DmaNo, Srcp, Destp,  (                           \
        DMA_ENABLE         | DMA_TIMMING_IMM |              \
        DMA_SRC_INC        | DMA_DEST_INC    |              \
        DMA_##Bit##BIT_BUS | ((Size)/((Bit)/8))))

#define DmaCopyIf(DmaNo, Srcp, Destp, Size, Bit)            \
                                                            \
    DmaSet(DmaNo, Srcp, Destp,  (                           \
        DMA_ENABLE         | DMA_TIMMING_IMM |              \
        DMA_IF_ENABLE      |                                \
        DMA_SRC_INC        | DMA_DEST_INC    |              \
        DMA_##Bit##BIT_BUS | ((Size)/(Bit/8))))

#define DmaArrayCopy(  DmaNo, Srcp, Destp, Bit)             \
        DmaCopy(       DmaNo, Srcp, Destp, sizeof(Srcp), Bit)

#define DmaArrayCopyIf(DmaNo, Srcp, Destp, Bit)             \
        DmaCopyIf(     DmaNo, Srcp, Destp, sizeof(Srcp), Bit)

//・DMAでコピーします。
//・DmaCopyIf／DmaArrayCopyIfは終了時に割り込み要求を発生します。
//・DmaArrayCopy／DmaArrayCopyIfはソース配列全体をコピーします。
//
//・引数：
//  DmaNo       DMA番号
//  Srcp        ソースアドレス
//  Destp       デスティネーションアドレス
//  Size        転送バイト数
//  Bit         転送ビット幅（16|32）
//
//
//※CPU内部RAM上のプログラムにてDMAを起動すると
//  その次の命令が先に実行されます。
//  よって、DMA直後に転送先をCPUにて変更しようとした場合、
//  読み込み／書き戻しの間にDMAが起動されてしまいますので、
//  DMAの転送先のデータが意図していない値になる場合があります。
//  その場合にはDmaWait()を直後に挿入して、DMAが終了したか
//  どうかをチェックすると続くコードへの影響を確実に回避できます。

/*------------------------------------------------------------------*/
/*                  ＨブランクＤＭＡ コピー                         */
/*------------------------------------------------------------------*/

#define H_DmaCopy(DmaNo, Srcp, Destp, Size, Bit)            \
                                                            \
    DmaSet(DmaNo, Srcp, Destp,  (                           \
        DMA_ENABLE         | DMA_TIMMING_H_BLANK |          \
        DMA_SRC_INC        | DMA_DEST_RELOAD     |          \
        DMA_CONTINUOUS_ON  |                                \
        DMA_##Bit##BIT_BUS | ((Size)/((Bit)/8))))

#define H_DmaCopyIf(DmaNo, Srcp, Destp, Size, Bit)          \
                                                            \
    DmaSet(DmaNo, Srcp, Destp,  (                           \
        DMA_ENABLE         | DMA_TIMMING_H_BLANK |          \
        DMA_IF_ENABLE      |                                \
        DMA_SRC_INC        | DMA_DEST_RELOAD     |          \
        DMA_CONTINUOUS_ON  |                                \
        DMA_##Bit##BIT_BUS | ((Size)/(Bit/8))))

#define H_DmaArrayCopy(  DmaNo, Srcp, Destp, Bit)           \
        H_DmaCopy(       DmaNo, Srcp, Destp, sizeof(Srcp), Bit)

#define H_DmaArrayCopyIf(DmaNo, Srcp, Destp, Bit)           \
        H_DmaCopyIf(     DmaNo, Srcp, Destp, sizeof(Srcp), Bit)

//・Hブランクに同期してDMAでコピーします。
//・H_DmaCopyIf／H_DmaArrayCopyIfは終了時に割り込み要求を発生します。
//・H_DmaArrayCopy／H_DmaArrayCopyIfはソース配列全体をコピーします。
//
//・引数：
//  DmaNo       DMA番号
//  Srcp        ソースアドレス
//  Destp       デスティネーションアドレス
//  Size        転送バイト数
//  Bit         転送ビット幅（16|32）

/*------------------------------------------------------------------*/
/*                  ＶブランクＤＭＡ コピー                         */
/*------------------------------------------------------------------*/

#define V_DmaCopy(DmaNo, Srcp, Destp, Size, Bit)            \
                                                            \
    DmaSet(DmaNo, Srcp, Destp,  (                           \
        DMA_ENABLE         | DMA_TIMMING_V_BLANK |          \
        DMA_SRC_INC        | DMA_DEST_INC        |          \
        DMA_##Bit##BIT_BUS | ((Size)/(Bit/8))))

#define V_DmaCopyIf(DmaNo, Srcp, Destp, Size, Bit)          \
                                                            \
    DmaSet(DmaNo, Srcp, Destp,  (                           \
        DMA_ENABLE         | DMA_TIMMING_V_BLANK |          \
        DMA_IF_ENABLE      |                                \
        DMA_SRC_INC        | DMA_DEST_INC        |          \
        DMA_##Bit##BIT_BUS | ((Size)/(Bit/8))))

#define V_DmaArrayCopy(  DmaNo, Srcp, Destp, Bit)           \
        V_DmaCopy(       DmaNo, Srcp, Destp, sizeof(Srcp), Bit)

#define V_DmaArrayCopyIf(DmaNo, Srcp, Destp, Bit)           \
        V_DmaCopyIf(     DmaNo, Srcp, Destp, sizeof(Srcp), Bit)

//・Vブランクに同期してDMAでコピーします。
//・V_DmaCopyIf／V_DmaArrayCopyIfは終了時に割り込み要求を発生します。
//・V_DmaArrayCopy／V_DmaArrayCopyIfはソース配列全体をコピーします。
//
//・引数：
//  DmaNo       DMA番号
//  Srcp        ソースアドレス
//  Destp       デスティネーションアドレス
//  Size        転送バイト数
//  Bit         転送ビット幅（16|32）

/*------------------------------------------------------------------*/
/*                  ＤＭＡ サウンドＦＩＦＯ転送                     */
/*------------------------------------------------------------------*/

#if 1
#define DmaSound(DmaNo, Srcp, FifoName)                             \
{                                                                   \
    u8    i;                                                        \
    *((u8 *)(REG_SOUNDCNT + 3)) |= SOUND_##FifoName##_FIFO_RESET;   \
    for (i=0; i<8; i++)                                             \
        *(u32 *)REG_FIFO_##FifoName = ((u32 *)Srcp)[i];             \
    DmaSet( DmaNo, (u32 *)Srcp + 8, REG_FIFO_##FifoName, (          \
        DMA_ENABLE         | DMA_TIMMING_SOUND |                    \
        DMA_CONTINUOUS_ON  |                                        \
        DMA_SRC_INC        | DMA_DEST_FIX      |                    \
        DMA_32BIT_BUS      | (4*4)/(32/8)))                         \
}

#define DmaSoundIf(DmaNo, Srcp, FifoName)                           \
{                                                                   \
    u8    i;                                                        \
    *((u8 *)(REG_SOUNDCNT + 3)) |= SOUND_##FifoName##_FIFO_RESET;   \
    for (i=0; i<8; i++)                                             \
        *(u32 *)REG_FIFO_##FifoName = ((u32 *)Srcp)[i];             \
    DmaSet( DmaNo, (u32 *)Srcp + 8, REG_FIFO_##FifoName, (          \
        DMA_ENABLE         | DMA_TIMMING_SOUND |                    \
        DMA_IF_ENABLE      |                                        \
        DMA_CONTINUOUS_ON  |                                        \
        DMA_SRC_INC        | DMA_DEST_FIX      |                    \
        DMA_32BIT_BUS      | (4*4)/(32/8)))                         \
}
#else
#define DmaSound(DmaNo, Srcp, FifoName)                             \
                                                                    \
    DmaSet( DmaNo, Srcp, REG_FIFO_##FifoName, (                     \
        DMA_ENABLE         | DMA_TIMMING_SOUND |                    \
        DMA_CONTINUOUS_ON  |                                        \
        DMA_SRC_INC        | DMA_DEST_FIX      |                    \
        DMA_32BIT_BUS      | (4*4)/(32/8)))

#define DmaSoundIf(DmaNo, Srcp, FifoName)                           \
                                                                    \
    DmaSet(DmaNo, Srcp, REG_FIFO_##FifoName, (                      \
        DMA_ENABLE         | DMA_TIMMING_SOUND |                    \
        DMA_IF_ENABLE      |                                        \
        DMA_CONTINUOUS_ON  |                                        \
        DMA_SRC_INC        | DMA_DEST_FIX      |                    \
        DMA_32BIT_BUS      | (4*4)/(32/8)))
#endif

//・ダイレクトサウンド用にDMAをセットします。
//・DmaSoundIfは終了時に割り込み要求を発生します。
//
//・引数：
//  DmaNo       DMA番号
//  Srcp        ソースアドレス
//  FifoName    デスティネーションアドレス


/*------------------------------------------------------------------*/
/*                      ＤＭＡ 終了待ち                             */
/*------------------------------------------------------------------*/

#define DmaWait(DmaNo)                                      \
{                                                           \
    vu32 *(DmaCntp) = (vu32 *)REG_DMA##DmaNo;               \
    while (DmaCntp[2] & DMA_ENABLE) ;                       \
}

//・DMAの終了を待ちます。
//
//・引数：
//  DmaNo       DMA番号


/*------------------------------------------------------------------*/
/*                      ＤＭＡ ストップ                             */
/*------------------------------------------------------------------*/

#define DmaStop(DmaNo)                                      \
{                                                           \
    vu16 *(DmaCntp) = (vu16 *)REG_DMA##DmaNo;               \
    DmaCntp[5] &= ~((DMA_TIMMING_MASK | DMA_CONTINUOUS_ON   \
                   | DMA_DREQ_ON) >> 16);                   \
    DmaCntp[5] &= ~( DMA_ENABLE   >> 16);                   \
    DmaCntp[5];                                             \
}

//・DMAを停止します。
//・但し、処理中にDMAの自動起動が掛かった場合は一度だけDMAが実行されます。
//・また、サウンドDMAを停止する場合は起動時に実動作と一致する
//  設定を予め行なっておいて下さい。
//
//・引数：
//  DmaNo       DMA番号


/*------------------------------------------------------------------*/
/*                      ＣＰＵ クリア                               */
/*------------------------------------------------------------------*/

#define CpuClear(Data, Destp, Size, Bit)                    \
{                                                           \
    vu##Bit Tmp = (vu##Bit )(Data);                         \
    CpuSet((u8 *)&(Tmp), (u8 *)(Destp), (                   \
        DMA_SRC_FIX        |                                \
        DMA_##Bit##BIT_BUS | ((Size)/(Bit/8) & 0x1fffff))); \
}

#define CpuArrayClear(Data, Destp, Bit)                     \
        CpuClear(     Data, Destp, sizeof(Destp), Bit)

//・CPUでRAMクリアするシステムコールを呼び出します。
//・クリアデータはスタックに置かれ、それをデスティネーションへコピーします。
//・CpuArrayClearはデスティネーション配列全体をクリアします。
//
//・引数：
//  Data        クリアデータ
//  Destp       デスティネーションアドレス
//  Size        クリアバイト数
//  Bit         転送ビット幅（16|32）

/*------------------------------------------------------------------*/
/*                      ＣＰＵ コピー                               */
/*------------------------------------------------------------------*/

#define CpuCopy(Srcp, Destp, Size, Bit)                     \
                                                            \
    CpuSet((u8 *)(Srcp), (u8 *)(Destp),  (                  \
        DMA_SRC_INC        |                                \
        DMA_##Bit##BIT_BUS | ((Size)/(Bit/8) & 0x1fffff)))

#define CpuArrayCopy(Srcp, Destp, Bit)                      \
        CpuCopy(     Srcp, Destp, sizeof(Srcp), Bit)

//・CPUでコピーするシステムコールを呼び出します。
//・CpuArrayCopyはソース配列全体をコピーします。
//
//・引数：
//  Srcp        ソースアドレス
//  Destp       デスティネーションアドレス
//  Size        転送バイト数
//  Bit         転送ビット幅（16|32）

/*------------------------------------------------------------------*/
/*                  ＣＰＵ 高速クリア(32Byte単位)                   */
/*------------------------------------------------------------------*/

#define CpuFastClear(Data, Destp, Size)                     \
{                                                           \
    vu32 Tmp = (vu32 )(Data);                               \
    CpuFastSet((u8 *)&(Tmp), (u8 *)(Destp), (               \
        DMA_SRC_FIX        | ((Size)/(32/8) & 0x1fffff)));  \
}

#define CpuFastArrayClear(Data, Destp)                      \
        CpuFastClear(     Data, Destp, sizeof(Destp))

//・CPUで高速にRAMクリアするシステムコールを呼び出します。
//・クリアデータはスタックに置かれ、それをデスティネーションへコピーします。
//・CpuFastArrayClearはデスティネーション配列全体をクリアします。
//・32bit転送で8Word（32Byte）単位でクリアします。
//
//・引数：
//  Data        クリアデータ
//  Destp       デスティネーションアドレス
//  Size        クリアバイト数

/*------------------------------------------------------------------*/
/*                  ＣＰＵ 高速コピー(32Byte単位)                   */
/*------------------------------------------------------------------*/

#define CpuFastCopy(Srcp, Destp, Size)                      \
                                                            \
    CpuFastSet((u8 *)(Srcp), (u8 *)(Destp),  (              \
        DMA_SRC_INC           | ((Size)/(32/8) & 0x1fffff)))

#define CpuFastArrayCopy(Srcp, Destp)                       \
        CpuFastCopy(     Srcp, Destp, sizeof(Srcp))

//・CPUで高速にコピーするシステムコールを呼び出します。
//・CpuFastArrayCopyはソース配列全体をコピーします。
//・32bit転送で8Word（32Byte）単位でコピーします。
//
//・引数：
//  Srcp        ソースアドレス
//  Destp       デスティネーションアドレス
//  Size        転送バイト数


#ifdef __cplusplus
}      /* extern "C" */
#endif

#endif /* _AGB_MACRO_H */
