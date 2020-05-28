@********************************************************************
@*          MultiSioDefine.s                                        *
@*            マルチプレイ通信ライブラリ定数（GAS用）               *
@*            （タイマー割り込み送信 ＆ 通信データ同期）            *
@*            （多重割り込み専用）                                  *
@*                                                                  *
@*          Copyright (C) 1999-2001 NINTENDO Co.,Ltd.               *
@********************************************************************


@ 下記の設定値はソフトの仕様に合わせて最適化して下さい。

MULTI_SIO_BLOCK_SIZE            =   16      @ 通信データブロックサイズ（最大24Byte）

MULTI_SIO_PLAYERS_MAX           =   4       @ 最大プレイヤー数

MULTI_SIO_SYNC_DATA             =   0xfefe  @ 同期データ（0x0000／0xffffは禁止）

@ CPU内部ワークRAMに余裕がなければコメントアウトして下さい。
MULTI_SIO_DI_FUNC_FAST:                     @ SIO割り込み禁止関数高速化フラグ（CPU内部RAM実行）


MULTI_SIO_TIMER_NO              =   3       @ タイマーＮｏ
MULTI_SIO_TIMER_INTR_FLAG       =   (TIMER0_INTR_FLAG << MULTI_SIO_TIMER_NO)
                                            @ タイマー割り込みフラグ
REG_MULTI_SIO_TIMER             =   (REG_TM0CNT + MULTI_SIO_TIMER_NO * 4)
REG_MULTI_SIO_TIMER_L           =    REG_MULTI_SIO_TIMER
REG_MULTI_SIO_TIMER_H           =   (REG_MULTI_SIO_TIMER + 2)
                                            @ タイマーレジスタ


@ マルチプレイ通信パケット構造体・オフセット

OFS_MSP_FRAME_COUNTER           =   0       @ フレームカウンタ
OFS_MSP_RECV_ERROR_FLAGS        =   1       @ 受信エラーフラグ
OFS_MSP_CHECK_SUM               =   2       @ チェックサム
OFS_MSP_DATA                    =   4       @ 通信データ
OFS_MSP_OVERRUN_CATCH           =   (OFS_MSP_DATA + MULTI_SIO_BLOCK_SIZE)
                                            @ オーバーラン保護領域

MULTI_SIO_PACKET_SIZE           =   (OFS_MSP_OVERRUN_CATCH + 4)
                                            @ 構造体サイズ


@ マルチプレイ通信ワークエリア構造体・オフセット

OFS_MS_TYPE                     =   0       @ 接続関係（親／子）
OFS_MS_STATE                    =   1       @ 通信関数の状態
OFS_MS_CONNECTED_FLAG           =   2       @ 接続履歴フラグ
OFS_MS_RECV_SUCCESS_FLAGS       =   3       @ 受信成功フラグ

OFS_MS_SYNC_SEND_FLAG           =   4       @ 送信確認フラグ
OFS_MS_SYNC_RECV_FLAG           =   5       @ 受信確認フラグ

OFS_MS_START_FLAG               =   6       @ 通信開始フラグ
OFS_MS_HARD_ERROR               =   7       @ ハードエラー

OFS_MS_SYNC_SEND_FRAME_COUNTER  =   11      @ 送信フレームカウンタ
OFS_MS_SYNC_RECV_FRAME_COUNTER  =   12      @ 受信フレームカウンタ

OFS_MS_SEND_BUF_COUNTER         =   20      @ 送信バッファカウンタ
OFS_MS_RECV_BUF_COUNTER         =   24      @ 受信バッファカウンタ

OFS_MS_NEXT_SEND_BUF_P          =   28      @ 送信バッファポインタ
OFS_MS_CURRENT_SEND_BUF_P       =   32
OFS_MS_CURRENT_RECV_BUF_P       =   36      @ 受信バッファポインタ
OFS_MS_LAST_RECV_BUF_P          =   40
OFS_MS_RECV_CHECK_BUF_P         =   44

OFS_MS_SEND_BUF                 =   48      @ 送信バッファ（ダブルバッファ）
OFS_MS_RECV_BUF                 =   (OFS_MS_SEND_BUF + MULTI_SIO_PACKET_SIZE * 2)
                                            @ 受信バッファ（トリプルバッファ）

MULTI_SIO_AREA_SIZE             =   (OFS_MS_RECV_BUF + MULTI_SIO_PACKET_SIZE * 3 * MULTI_SIO_PLAYERS_MAX)
                                            @ 構造体サイズ


    .EXTERN RecvFuncBuf                     @ CPU内部RAM実行用バッファ
    .EXTERN IntrFuncBuf


@--------------------------------------------------------------------
@-                      マルチプレイ通信初期化                      -
@--------------------------------------------------------------------

    .EXTERN MultiSioInit

@--------------------------------------------------------------------
@-                      マルチプレイ通信スタート                    -
@--------------------------------------------------------------------

    .EXTERN MultiSioStart

@--------------------------------------------------------------------
@-                      マルチプレイ通信ストップ                    -
@--------------------------------------------------------------------

    .EXTERN MultiSioStop

@--------------------------------------------------------------------
@-                      マルチプレイ通信メイン                      -
@--------------------------------------------------------------------

    .EXTERN MultiSioMain

@--------------------------------------------------------------------
@-                      マルチプレイ通信Ｖブランク割り込み          -
@--------------------------------------------------------------------

    .EXTERN MultiSioVSync

@--------------------------------------------------------------------
@-                      マルチプレイ通信割り込み                    -
@--------------------------------------------------------------------

    .EXTERN MultiSioIntr

@--------------------------------------------------------------------
@-                      受信データ チェック                         -
@--------------------------------------------------------------------

    .EXTERN MultiSioRecvDataCheck

@--------------------------------------------------------------------
@-                      送信データ セット                           -
@--------------------------------------------------------------------

    .EXTERN MultiSioSendDataSet


