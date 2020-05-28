/********************************************************************/
/*          AgbSound.h                                              */
/*            AGB標準サウンドドライバ用宣言                         */
/*                                                                  */
/*          Copyright (C) 1999-2001 NINTENDO Co.,Ltd.               */
/*          Programed by SMASH Co.,Ltd.                             */
/********************************************************************/
#ifndef _AGB_SOUND_H
#define _AGB_SOUND_H

#ifdef __cplusplus
extern "C" {
#endif

#include <AgbTypes.h>


//波形データの構造
typedef struct {
    u16 type;   //タイプ
    u16 stat;   //ステータス
    u32 freq;   //周波数計算値
    u32 loop;   //ループ開始位置
    u32 size;   //サンプリング数
    s8 data[1]; //サンプリングデータ配列
} WaveData;

#define WAVE_STAT_LOOP  0xc000


//音色データの構造
typedef struct {
    u8 typ;         //タイプ
    u8 key;         //オリジナルキー
    u8 len;         //音の長さ（互換サウンド）
    u8 p_s;         //パンポット or スイープ（互換サウンド１）
    WaveData *wav;  //波形データのアドレス
    u8 att;         //アタック
    u8 dec;         //ディケイ
    u8 sus;         //サスティン
    u8 rel;         //リリース
} ToneData;

#define TONEDATA_TYP_RHY    0x80
#define TONEDATA_TYP_SPL    0x40
#define TONEDATA_TYP_FIX    0x08
#define TONEDATA_TYP_CGB    0x07

#define TONEDATA_P_S_PAN    0xc0
#define TONEDATA_P_S_PAM    TONEDATA_P_S_PAN

typedef struct { u32 typ; ToneData *ta; u8 *st; } SplitTone;
typedef union { ToneData t; SplitTone s; } ToneDataArr;

#define RHYTHM_TONE(TA)     {TONEDATA_TYP_RHY,0,0,0,(WaveData *)(TA)}
#define SPLIT_TONE(TA,ST)   (ToneDataArr)(SplitTone)\
                {TONEDATA_TYP_SPL, (ToneData *)(TA), (u8 *)(ST)}
#define RHY_SPL_TONE(TA,ST) (ToneDataArr)(SplitTone)\
                {TONEDATA_TYP_RHY|TONEDATA_TYP_SPL, (ToneData *)(TA), (u8 *)(ST)}


//仮想チャンネルの構造
typedef struct {
    u8 sf;          //ステータス
    u8 ty;          //タイプ
    u8 rv;          //右音量
    u8 lv;          //左音量
    u8 at;          //アタック
    u8 de;          //ディケイ
    u8 su;          //サスティン
    u8 re;          //リリース
    u8 r1[24];      // (reserved)
    u32 fr;         //周波数計算値
    WaveData *wp;   //波形ポインタ
    u32 r3[6];      // (reserved)
} SoundChannel;

#define MAX_DIRECTSOUND_CHANNEL 12
#define SOUND_CHANNEL_SF_START  0x80
#define SOUND_CHANNEL_SF_STOP   0x40
#define SOUND_CHANNEL_SF_LOOP   0x10
#define SOUND_CHANNEL_SF_IEC    0x04
#define SOUND_CHANNEL_SF_ENV    0x03
#define SOUND_CHANNEL_SF_ON     (SOUND_CHANNEL_SF_START|SOUND_CHANNEL_SF_STOP\
                                |SOUND_CHANNEL_SF_IEC|SOUND_CHANNEL_SF_ENV)

#define SOUND_CHANNEL_TY_FIX    TONEDATA_TYP_FIX
#define SOUND_CHANNEL_TY_CGB    TONEDATA_TYP_CGB


//ダイレクトサウンド転送バッファのサイズ
#define PCM_DMA_BUF 1584


//サウンド・ワークエリアの構造
typedef struct {
    u32 r1;     // (reserved)
    vu8 DmaCount;
    u8 reverb;  //ダイレクトサウンド・リバーブ値
    u8 maxchn;  //ダイレクトサウンド・同時発音数
    u8 masvol;  //ダイレクトサウンド・マスターボリューム
    u8 freq;    //ダイレクトサウンド・再生周波数番号(1=5734Hz ～ 12=42048Hz)
    u8 mode;    //サウンドドライバ・動作モード
    u8 r2[6];   // (reserved)
    u32 r3[16]; // (reserved)
    SoundChannel vchn[MAX_DIRECTSOUND_CHANNEL];
#ifndef ONLY_DMA1_SOUND
    s8 pcmbuf[PCM_DMA_BUF*2];
#else
    s8 pcmbuf[PCM_DMA_BUF];
#endif
} SoundArea;

#define SOUND_MODE_REVERB_VAL   0x0000007f
#define SOUND_MODE_REVERB_SET   0x00000080
#define SOUND_MODE_MAXCHN       0x00000f00
#define SOUND_MODE_MAXCHN_SHIFT 8
#define SOUND_MODE_MASVOL       0x0000f000
#define SOUND_MODE_MASVOL_SHIFT 12
#define SOUND_MODE_FREQ_05734   0x00010000
#define SOUND_MODE_FREQ_07884   0x00020000
#define SOUND_MODE_FREQ_10512   0x00030000
#define SOUND_MODE_FREQ_13379   0x00040000
#define SOUND_MODE_FREQ_15768   0x00050000
#define SOUND_MODE_FREQ_18157   0x00060000
#define SOUND_MODE_FREQ_21024   0x00070000
#define SOUND_MODE_FREQ_26758   0x00080000
#define SOUND_MODE_FREQ_31536   0x00090000
#define SOUND_MODE_FREQ_36314   0x000a0000
#define SOUND_MODE_FREQ_40137   0x000b0000
#define SOUND_MODE_FREQ_42048   0x000c0000
#define SOUND_MODE_FREQ_SHIFT   16
#define SOUND_MODE_DA_BIT_9     0x00800000
#define SOUND_MODE_DA_BIT_8     0x00900000
#define SOUND_MODE_DA_BIT_7     0x00a00000
#define SOUND_MODE_DA_BIT_6     0x00b00000
#define SOUND_MODE_DA_BIT_SHIFT 20


//ソングデータの構造
typedef struct {
    u8 trks;            //トラック数
    u8 blks;            //ブロック数
    u8 prio;            //プライオリティ
    u8 rvrb;            //リバーブ
    ToneData *tone;     //音色テーブル
    u8 *part[1];
} SongHeader;


//ミュージックプレイヤー・ワークエリアの構造
typedef struct {
    SongHeader *song;   //現在のソングポインタ
    u32 stat;           //ステータス
    u8 mtrk;            //トラック数
    u8 prio;            //現在のプライオリティ
    u8 d1[2];
    u32 clock;          //演奏開始からの通算クロック
    u8 d2[48];
} MusicPlayerArea;

//ミュージックプレイヤーの各トラックの構造
typedef struct {
    u8 d[80];
} MusicPlayerTrack;

#define MAX_MUSICPLAYER_TRACK       16
#define MUSICPLAYER_STATUS_TRACK    0x0000ffff
#define MUSICPLAYER_STATUS_PAUSE    0x80000000


#ifdef __cplusplus
}      /* extern "C" */
#endif

#endif // _AGB_SOUND_H
