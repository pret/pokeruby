#ifndef __PKJB_DOWNLOADER_H__
#define __PKJB_DOWNLOADER_H__

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
  vu8  timeout_counter;
  vu8  frame_counter;
  vu8  decode_mode;
  vu8  vcount_bak;

  vu8  keya[4];
  vu8  keyb[4];
  vu8  keyc[4];

  vu16 boot_key;
  vu16 dl_count;

  vu32 decode_key;
  vu32 decode_work_crc;
  vu32 decode_result_crc;
  vu32 decode_bufp;
  vu32 dl_bufp;
  vu32 joyint_vector;

} PKJBDownParam;


extern void PKJBDownInit(PKJBDownParam *paramp);
// PK-JOYブート ダウンローダの初期化を行います。
// REG_IME 以外のレジスタを変更し、「JOYバス通信割り込み可能」な状態に
// します。既に REG_IME = 1 になっていれば、呼出し後すぐにJOYバス
// 通信割り込みが発生する可能性があります。

extern void PKJBDownMainFrame(PKJBDownParam *paramp);
// PK-JOYブート ダウンローダ メインルーチン
// 毎ゲームフレームに1回呼んでください。
// 「ゲームフレーム」は、処理落ちして2-3ビデオフレームごとになってもかまいません。

extern void PKJBDownStop(void);
// PK-JOYブート ダウンローダを停止し、汎用通信モードにします。
// SIO割り込みも禁止します。REG_IME の状態は保持します。
// GCからはGBAケーブルがつながっていても認識されなくなります。
// この後、PKJBDownMainFrame() を呼ぶことはできません。
// (ダウンローダが再開してしまいます)
// PKJBDownInit() を呼んでから PKJBDownMainFrame() を呼ぶことは可能です。

extern void PKJBDownTryBoot(PKJBDownParam *paramp);
// PK-JOYブート ダウンロードが完了していればブートします。
// 完了していなければ何もしません。
// つまり、ブートしても良いタイミングに限り呼んでください。
// ブートする前に、内部で REG_IME だけ 0 にリセットします。

extern void PKJBDownJoyIntr(PKJBDownParam *paramp);
// PK-JOYブート JOYバス通信割り込みルーチン本体です。

#define PKJBDownCheckDLStart(paramp) ((paramp)->decode_mode)
// 0 でなければ、GCからダウンロードを始めています。(完了したかもしれません)

#ifdef __cplusplus
}
#endif

#endif  // __PKJB_DOWNLOADER_H__
