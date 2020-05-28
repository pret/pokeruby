#ifndef POKEMON_ONLY
#define POKEMON_ONLY
#endif

//------------------------------------------------------------//
//           pok_mksLib.h ( m4aLib.h ) ver1.06a.006           //
//                                                            //
//          Copyright (C) 1999-2002 NINTENDO Co.,Ltd.         //
//          Copyright (C) 2001-2002 POKEMON Co.,Ltd.          //
//------------------------------------------------------------//

#ifndef _M4A_LIB_H
#define _M4A_LIB_H

#define _M4A_LIB_VER 106

#include <AgbSound.h>


//ＣＧＢ仮想チャンネルの構造
typedef struct {
    u8 ch1[64];
    u8 ch2[64];
    u8 ch3[64];
    u8 ch4[64];
} CgbChannels;

//ミュージックプレイヤー・テーブルの構造
typedef struct {
    MusicPlayerArea *ma;
    MusicPlayerTrack *ta;
    u16 tn, pf;
} MPlayTable;

//ソング・テーブルの構造
typedef struct {
    SongHeader *so;
    u16 ms, me;
} SongTable;


#define CGB1_P12 ((WaveData *)0)
#define CGB1_P25 ((WaveData *)1)
#define CGB1_P50 ((WaveData *)2)
#define CGB1_P75 ((WaveData *)3)
#define CGB2_P12 CGB1_P12
#define CGB2_P25 CGB1_P25
#define CGB2_P50 CGB1_P50
#define CGB2_P75 CGB1_P75
#define CGB4_C15 ((WaveData *)0)
#define CGB4_C07 ((WaveData *)1)


extern const u8 __sound_mode_i[];
#define sound_mode_i ((u32)__sound_mode_i)
extern const u8 __total_mplay_n[];
#define total_mplay_n ((u16)__total_mplay_n)
extern const u8 __total_song_n[];
#define total_song_n ((u16)__total_song_n)

extern SoundArea m4a_sound;
extern const MPlayTable mplay_table[];
extern const SongTable song_table[];
extern u8 m4a_memacc_area[];


extern void m4aSoundInit(void);

#define m4aSoundMode(P1) SoundMode_rev01(P1)
extern void SoundMode_rev01(u32 mode);

extern void m4aSoundMain(void);

#define m4aSoundVSync() SoundVSync_rev01()
extern void SoundVSync_rev01(void);

#define m4aSoundVSyncOff() SoundVSyncOff_rev01()
extern void SoundVSyncOff_rev01(void);

#define m4aSoundVSyncOn() SoundVSyncOn_rev01()
extern void SoundVSyncOn_rev01(void);

#define m4aMPlayStart(P1,P2) MPlayStart_rev01(P1,P2)
extern void MPlayStart_rev01(MusicPlayerArea *ma, SongHeader *so);

extern void m4aSongNumStart(u16 n);

extern void m4aSongNumStartOrChange(u16 n);

extern void m4aSongNumStartOrContinue(u16 n);

extern void m4aMPlayImmInit(MusicPlayerArea *ma);

#define m4aMPlayStop(P1) MPlayStop_rev01(P1)
extern void MPlayStop_rev01(MusicPlayerArea *ma);

extern void m4aSongNumStop(u16 n);

extern void m4aMPlayAllStop(void);

extern void m4aMPlayContinue(MusicPlayerArea *ma);

extern void m4aSongNumContinue(u16 n);

extern void m4aMPlayAllContinue(void);

extern void m4aMPlayFadeOut(MusicPlayerArea *ma, u16 sp);

extern void m4aMPlayFadeOutPause(MusicPlayerArea *ma, u16 sp);

extern void m4aMPlayFadeInContinue(MusicPlayerArea *ma, u16 sp);

#define m4aMPlayTempoControl(P1,P2) MPlayTempoControl(P1,P2)
extern void MPlayTempoControl(MusicPlayerArea *ma, u16 te);

#define m4aMPlayVolumeControl(P1,P2,P3) MPlayVolumeControl(P1,P2,P3)
extern void MPlayVolumeControl(MusicPlayerArea *ma, u16 tb, u16 vo);

#define m4aMPlayPitchControl(P1,P2,P3) MPlayPitchControl(P1,P2,P3)
extern void MPlayPitchControl(MusicPlayerArea *ma, u16 tb, s16 pi);

#define m4aMPlayPampotControl(P1,P2,P3) MPlayPanpotControl(P1,P2,P3)
#define m4aMPlayPanpotControl(P1,P2,P3) MPlayPanpotControl(P1,P2,P3)
extern void MPlayPanpotControl(MusicPlayerArea *ma, u16 tb, s8 pa);

#define m4aMPlayModDepthSet(P1,P2,P3) MPlayModDepthSet(P1,P2,P3)
extern void MPlayModDepthSet(MusicPlayerArea *ma, u16 tb, u8 md);

#define m4aMPlayLFOSpeedSet(P1,P2,P3) MPlayLFOSpeedSet(P1,P2,P3)
extern void MPlayLFOSpeedSet(MusicPlayerArea *ma, u16 tb, u8 ls);

#ifdef POKEMON_ONLY

extern MusicPlayerArea *pokVoiceStart(ToneData *to);

extern void pokVoiceVolume(u8 vo);

extern void pokVoicePanpot(s8 pa);

extern void pokVoicePitch(s16 pi);

extern void pokVoiceLength(u16 le);

extern void pokVoiceRelease(u8 re);

extern void pokVoiceProgress(u32 pr);

extern int pokVoiceCheck(MusicPlayerArea *ma);

extern void pokVoiceChorus(s8 dp);

extern void pokStereoMono(int st);

extern void pokVoicePriority(u8 pr);

#endif //POKEMON_ONLY


#endif // _M4A_LIB_H

// MusicPlayers
extern MusicPlayerArea m4a_mplay000;
extern MusicPlayerArea m4a_mplay001;
extern MusicPlayerArea m4a_mplay002;
extern MusicPlayerArea m4a_mplay003;

// Song files
extern SongHeader dummy;
extern SongHeader se_kaifuku;
extern SongHeader se_pc_login;
extern SongHeader se_pc_off;
extern SongHeader se_pc_on;
extern SongHeader se_select;
extern SongHeader se_win_open;
extern SongHeader se_wall_hit;
extern SongHeader se_door;
extern SongHeader se_kaidan;
extern SongHeader se_dansa;
extern SongHeader se_jitensya;
extern SongHeader se_kouka_l;
extern SongHeader se_kouka_m;
extern SongHeader se_kouka_h;
extern SongHeader se_bowa2;
extern SongHeader se_poke_dead;
extern SongHeader se_nigeru;
extern SongHeader se_jido_doa;
extern SongHeader se_naminori;
extern SongHeader se_ban;
extern SongHeader se_pin;
extern SongHeader se_boo;
extern SongHeader se_bowa;
extern SongHeader se_jyuni;
extern SongHeader se_a;
extern SongHeader se_i;
extern SongHeader se_u;
extern SongHeader se_e;
extern SongHeader se_o;
extern SongHeader se_n;
extern SongHeader se_seikai;
extern SongHeader se_hazure;
extern SongHeader se_exp;
extern SongHeader se_jite_pyoko;
extern SongHeader se_mu_pachi;
extern SongHeader se_tk_kasya;
extern SongHeader se_fu_zaku;
extern SongHeader se_fu_zaku2;
extern SongHeader se_fu_zuzuzu;
extern SongHeader se_ru_gashin;
extern SongHeader se_ru_gasyan;
extern SongHeader se_ru_bari;
extern SongHeader se_ru_hyuu;
extern SongHeader se_ki_gasyan;
extern SongHeader se_tk_warpin;
extern SongHeader se_tk_warpout;
extern SongHeader se_tu_saa;
extern SongHeader se_hi_turun;
extern SongHeader se_track_move;
extern SongHeader se_track_stop;
extern SongHeader se_track_haiki;
extern SongHeader se_track_door;
extern SongHeader se_moter;
extern SongHeader se_card;
extern SongHeader se_save;
extern SongHeader se_kon;
extern SongHeader se_kon2;
extern SongHeader se_kon3;
extern SongHeader se_kon4;
extern SongHeader se_suikomu;
extern SongHeader se_nageru;
extern SongHeader se_toy_c;
extern SongHeader se_toy_d;
extern SongHeader se_toy_e;
extern SongHeader se_toy_f;
extern SongHeader se_toy_g;
extern SongHeader se_toy_a;
extern SongHeader se_toy_b;
extern SongHeader se_toy_c1;
extern SongHeader se_mizu;
extern SongHeader se_hashi;
extern SongHeader se_daugi;
extern SongHeader se_pinpon;
extern SongHeader se_fuusen1;
extern SongHeader se_fuusen2;
extern SongHeader se_fuusen3;
extern SongHeader se_toy_kabe;
extern SongHeader se_toy_dango;
extern SongHeader se_doku;
extern SongHeader se_esuka;
extern SongHeader se_t_ame;
extern SongHeader se_t_ame_e;
extern SongHeader se_t_ooame;
extern SongHeader se_t_ooame_e;
extern SongHeader se_t_koame;
extern SongHeader se_t_koame_e;
extern SongHeader se_t_kami;
extern SongHeader se_t_kami2;
extern SongHeader se_elebeta;
extern SongHeader se_hinsi;
extern SongHeader se_expmax;
extern SongHeader se_tamakoro;
extern SongHeader se_tamakoro_e;
extern SongHeader se_basabasa;
extern SongHeader se_regi;
extern SongHeader se_c_gaji;
extern SongHeader se_c_maku_u;
extern SongHeader se_c_maku_d;
extern SongHeader se_c_pasi;
extern SongHeader se_c_syu;
extern SongHeader se_c_pikon;
extern SongHeader se_reapoke;
extern SongHeader se_op_basyu;
extern SongHeader se_bt_start;
extern SongHeader se_dendou;
extern SongHeader se_jihanki;
extern SongHeader se_tama;
extern SongHeader se_z_scroll;
extern SongHeader se_z_page;
extern SongHeader se_pn_on;
extern SongHeader se_pn_off;
extern SongHeader se_z_search;
extern SongHeader se_tamago;
extern SongHeader se_tb_start;
extern SongHeader se_tb_kon;
extern SongHeader se_tb_kara;
extern SongHeader se_bidoro;
extern SongHeader se_w085;
extern SongHeader se_w085b;
extern SongHeader se_w231;
extern SongHeader se_w171;
extern SongHeader se_w233;
extern SongHeader se_w233b;
extern SongHeader se_w145;
extern SongHeader se_w145b;
extern SongHeader se_w145c;
extern SongHeader se_w240;
extern SongHeader se_w015;
extern SongHeader se_w081;
extern SongHeader se_w081b;
extern SongHeader se_w088;
extern SongHeader se_w016;
extern SongHeader se_w016b;
extern SongHeader se_w003;
extern SongHeader se_w104;
extern SongHeader se_w013;
extern SongHeader se_w196;
extern SongHeader se_w086;
extern SongHeader se_w004;
extern SongHeader se_w025;
extern SongHeader se_w025b;
extern SongHeader se_w152;
extern SongHeader se_w026;
extern SongHeader se_w172;
extern SongHeader se_w172b;
extern SongHeader se_w053;
extern SongHeader se_w007;
extern SongHeader se_w092;
extern SongHeader se_w221;
extern SongHeader se_w221b;
extern SongHeader se_w052;
extern SongHeader se_w036;
extern SongHeader se_w059;
extern SongHeader se_w059b;
extern SongHeader se_w010;
extern SongHeader se_w011;
extern SongHeader se_w017;
extern SongHeader se_w019;
extern SongHeader se_w028;
extern SongHeader se_w013b;
extern SongHeader se_w044;
extern SongHeader se_w029;
extern SongHeader se_w057;
extern SongHeader se_w056;
extern SongHeader se_w250;
extern SongHeader se_w030;
extern SongHeader se_w039;
extern SongHeader se_w054;
extern SongHeader se_w077;
extern SongHeader se_w020;
extern SongHeader se_w082;
extern SongHeader se_w047;
extern SongHeader se_w195;
extern SongHeader se_w006;
extern SongHeader se_w091;
extern SongHeader se_w146;
extern SongHeader se_w120;
extern SongHeader se_w153;
extern SongHeader se_w071b;
extern SongHeader se_w071;
extern SongHeader se_w103;
extern SongHeader se_w062;
extern SongHeader se_w062b;
extern SongHeader se_w048;
extern SongHeader se_w187;
extern SongHeader se_w118;
extern SongHeader se_w155;
extern SongHeader se_w122;
extern SongHeader se_w060;
extern SongHeader se_w185;
extern SongHeader se_w014;
extern SongHeader se_w043;
extern SongHeader se_w207;
extern SongHeader se_w207b;
extern SongHeader se_w215;
extern SongHeader se_w109;
extern SongHeader se_w173;
extern SongHeader se_w280;
extern SongHeader se_w202;
extern SongHeader se_w060b;
extern SongHeader se_w076;
extern SongHeader se_w080;
extern SongHeader se_w100;
extern SongHeader se_w107;
extern SongHeader se_w166;
extern SongHeader se_w129;
extern SongHeader se_w115;
extern SongHeader se_w112;
extern SongHeader se_w197;
extern SongHeader se_w199;
extern SongHeader se_w236;
extern SongHeader se_w204;
extern SongHeader se_w268;
extern SongHeader se_w070;
extern SongHeader se_w063;
extern SongHeader se_w127;
extern SongHeader se_w179;
extern SongHeader se_w151;
extern SongHeader se_w201;
extern SongHeader se_w161;
extern SongHeader se_w161b;
extern SongHeader se_w227;
extern SongHeader se_w227b;
extern SongHeader se_w226;
extern SongHeader se_w208;
extern SongHeader se_w213;
extern SongHeader se_w213b;
extern SongHeader se_w234;
extern SongHeader se_w260;
extern SongHeader se_w328;
extern SongHeader se_w320;
extern SongHeader se_w255;
extern SongHeader se_w291;
extern SongHeader se_w089;
extern SongHeader se_w239;
extern SongHeader se_w230;
extern SongHeader se_w281;
extern SongHeader se_w327;
extern SongHeader se_w287;
extern SongHeader se_w257;
extern SongHeader se_w253;
extern SongHeader se_w258;
extern SongHeader se_w322;
extern SongHeader se_w298;
extern SongHeader se_w287b;
extern SongHeader se_w114;
extern SongHeader se_w063b;
extern SongHeader tetsuji;
extern SongHeader field13;
extern SongHeader kachi22;
extern SongHeader kachi2;
extern SongHeader kachi3;
extern SongHeader kachi5;
extern SongHeader pcc;
extern SongHeader nibi;
extern SongHeader suikun;
extern SongHeader dooro1;
extern SongHeader dooro_x1;
extern SongHeader dooro_x3;
extern SongHeader machi_s2;
extern SongHeader machi_s4;
extern SongHeader gim;
extern SongHeader naminori;
extern SongHeader dan01;
extern SongHeader fanfa1;
extern SongHeader me_asa;
extern SongHeader me_bachi;
extern SongHeader fanfa4;
extern SongHeader fanfa5;
extern SongHeader me_waza;
extern SongHeader bijyutu;
extern SongHeader dooro_x4;
extern SongHeader fune_kan;
extern SongHeader me_shinka;
extern SongHeader shinka;
extern SongHeader me_wasure;
extern SongHeader syoujoeye;
extern SongHeader boyeye;
extern SongHeader dan02;
extern SongHeader machi_s3;
extern SongHeader odamaki;
extern SongHeader b_tower;
extern SongHeader swimeye;
extern SongHeader dan03;
extern SongHeader me_kinomi;
extern SongHeader me_tama;
extern SongHeader me_b_big;
extern SongHeader me_b_small;
extern SongHeader me_zannen;
extern SongHeader bd_time;
extern SongHeader test1;
extern SongHeader test2;
extern SongHeader test3;
extern SongHeader test4;
extern SongHeader test;
extern SongHeader gomachi0;
extern SongHeader gotown;
extern SongHeader pokecen;
extern SongHeader nextroad;
extern SongHeader granroad;
extern SongHeader cycling;
extern SongHeader friendly;
extern SongHeader mishiro;
extern SongHeader tozan;
extern SongHeader girleye;
extern SongHeader minamo;
extern SongHeader ashroad;
extern SongHeader event0;
extern SongHeader deepdeep;
extern SongHeader kachi1;
extern SongHeader title3;
extern SongHeader demo1;
extern SongHeader girl_sup;
extern SongHeader hageshii;
extern SongHeader kakkoii;
extern SongHeader kazanbai;
extern SongHeader aqa_0;
extern SongHeader tsuretek;
extern SongHeader boy_sup;
extern SongHeader rainbow;
extern SongHeader ayasii;
extern SongHeader kachi4;
extern SongHeader ropeway;
extern SongHeader casino;
extern SongHeader hightown;
extern SongHeader safari;
extern SongHeader c_road;
extern SongHeader ajito;
extern SongHeader m_boat;
extern SongHeader m_dungon;
extern SongHeader finecity;
extern SongHeader machupi;
extern SongHeader p_school;
extern SongHeader dendou;
extern SongHeader tonekusa;
extern SongHeader maborosi;
extern SongHeader con_fan;
extern SongHeader contest0;
extern SongHeader mgm0;
extern SongHeader t_battle;
extern SongHeader ooame;
extern SongHeader hideri;
extern SongHeader runecity;
extern SongHeader con_k;
extern SongHeader eikou_r;
extern SongHeader karakuri;
extern SongHeader hutago;
extern SongHeader sitennou;
extern SongHeader yama_eye;
extern SongHeader conlobby;
extern SongHeader inter_v;
extern SongHeader daigo;
extern SongHeader thankfor;
extern SongHeader end;
extern SongHeader battle27;
extern SongHeader battle31;
extern SongHeader battle20;
extern SongHeader battle32;
extern SongHeader battle33;
extern SongHeader battle36;
extern SongHeader battle34;
extern SongHeader battle35;
extern SongHeader battle38;
extern SongHeader battle30;
