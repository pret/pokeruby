/********************************************************************/
/*          AgbMultiBoot.h                                          */
/*            AGBマルチプレイブート・ライブラリ用宣言               */
/*                                                                  */
/*          Copyright (C) 2000-2001 NINTENDO Co.,Ltd.               */
/********************************************************************/
#ifndef _AGB_MULTIBOOT_H
#define _AGB_MULTIBOOT_H

#ifdef __cplusplus
extern "C" {
#endif

#include <AgbTypes.h>


/* 以下の定数は変更しないでください */
#define MULTIBOOT_NCHILD 3              // 子機の最大個数
#define MULTIBOOT_HEADER_SIZE 0xc0      // ヘッダサイズ
#define MULTIBOOT_SEND_SIZE_MIN 0x100   // 最小送信サイズ
#define MULTIBOOT_SEND_SIZE_MAX 0x40000 // 最大送信サイズ

// マルチプレイブート・パラメータ構造体
typedef struct {
  u32 system_work[5];   // システムコール内で書き換えられる。ライブラリでも使用
  u8 handshake_data;    // クライアントからのハンドシェイク用データ
  u8 padding;
  u16 handshake_timeout;   // ハンドシェイク時間切れチェック用カウンタ
  u8 probe_count;       // 0 でなければ client 認識中 あるいは ブートプログラム転送中
  u8 client_data[MULTIBOOT_NCHILD]; // クライアントからのハンドシェイク用データ
  u8 palette_data;      // クライアントの、ロード中パレット点滅パラメタ
  u8 response_bit;      // 子機が接続されている可能性が高い場合、4P-2P: d3-d1 が 1 になる
  u8 client_bit;        // クライアントと判定された子機は、 4P-2P: d3-d1 が 1 になる
  u8 reserved1;         // 予約
  u8 *boot_srcp;        // ブートプログラム開始 (ヘッダの後を指す)
  u8 *boot_endp;        // ブートプログラム 終了ポインタ
  u8 *masterp;          // マスタが参照して出力するヘッダへのポインタ
  u8 *reserved2[MULTIBOOT_NCHILD]; // 予約
  u32 system_work2[4];  // システムコール内で書き換えられる
  u8 sendflag;          // SC7=1 にして送信中なら 0 でない
  u8 probe_target_bit;  // client 認識対象になっているなら 4P-2P: d3-d1 が 1
  u8 check_wait;        // client 認識を行うまでの待ちフレーム
  u8 server_type;       // client 認識方法 0=低速認識 1=高速認識
} MultiBootParam;

/* エラーコード
 * MultiBootMain() が返す値が、0でないときは、以下の何らかのエラー。
 * ただし、すべてのエラーコードの種類に応じた、個別のエラーメッセージを
 * 用意する必要はない。
 * 「通信エラー、接続を確認してください、スタートボタンでリトライ」
 * 「電源を切って、接続を確認し、もう一度電源を入れ直してください」
 * 「子機が接続されていません」
 * 「子機が認識できません」
 * など、プレイヤーが理解しやすいメッセージで良いと思われる。
 * NO_PROBE_TARGET: client 認識中にすべてのマシンが異常なデータを
 * 返してきて、認識対象がなくなった
 * NO_DLREADY: client がダウンロード準備可能という返事をしなかった。
 * BOOT_FAILURE: MultiBoot() システムコールがエラーを返してきた。
 * HANDSHAKE_FAILURE: 子機がブート直後に行うべき、親機とのハンドシェイクに失敗した。
 *   (子機は無限ループ状態になっている可能性があるので、電源の入れ直しを要求する)
 */
#define MULTIBOOT_ERROR_04                0x04
#define MULTIBOOT_ERROR_08                0x08
#define MULTIBOOT_ERROR_0c                0x0c
#define MULTIBOOT_ERROR_40                0x40
#define MULTIBOOT_ERROR_44                0x44
#define MULTIBOOT_ERROR_48                0x48
#define MULTIBOOT_ERROR_4c                0x4c
#define MULTIBOOT_ERROR_80                0x80
#define MULTIBOOT_ERROR_84                0x84
#define MULTIBOOT_ERROR_88                0x88
#define MULTIBOOT_ERROR_8c                0x8c
#define MULTIBOOT_ERROR_NO_PROBE_TARGET   0x50
#define MULTIBOOT_ERROR_NO_DLREADY        0x60
#define MULTIBOOT_ERROR_BOOT_FAILURE      0x70
#define MULTIBOOT_ERROR_HANDSHAKE_FAILURE 0x71

/* エラー後、あるいは 0xffff 以外の値が返ってきて、接続チェックを
 * やり直すまでのチャタリング回避ウエイト (フレーム)
 * クライアントのタイムアウトが 約 11 フレームあるので、それより
 * 十分長い値にしておく。
 * 通常、この期間は MASTER_INFO を送出するが、システムコールが
 * エラーになったときは、この期間、何も送信しないで待つ。
 * それから、この同じ期間 MASTER_INFO を送出する。
 */
#define MULTIBOOT_CONNECTION_CHECK_WAIT 15

/* 子機の認識方法
 * MultiBootParam 構造体のメンバ server_type に設定する値
 * MULTIBOOT_SERVER_TYPE_NORMAL: 低速認識モード
 *   MultiBootMain() 関数は一回の呼び出しで 2 バイトの通信。
 *   そのため MultiBootMain() 関数から短時間で帰ってくる。
 * MULTIBOOT_SERVER_TYPE_QUICK: 高速認識モード
 *   MultiBootMain() 関数内で、出来るだけ多く連続通信。
 *   そのため MultiBootMain() 関数から、数十フレーム帰ってこない可能性がある。
 *   その間、サウンドや表示処理などが出来なくても問題がないか、
 *   サウンドや表示処理をタイマー等の割込み処理で行っている場合、使用可能。
 */
#define MULTIBOOT_SERVER_TYPE_NORMAL 0
#define MULTIBOOT_SERVER_TYPE_QUICK  1

/* 子機の最終起動確認のタイムアウト 400 フレーム */
#define MULTIBOOT_HANDSHAKE_TIMEOUT 400

#ifdef __cplusplus
}      /* extern "C" */
#endif

#endif    /* _AGB_MULTIBOOT_H */
/* End of AgbMultiBoot.h */
