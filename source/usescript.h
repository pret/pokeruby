#ifndef	USESCRIPT_H
#define	USESCRIPT_H

//　Cソースとの共有ヘッダファイル
#include "vmstat.h"
#include "version.h"				// バージョン指定ファイル

#include "fntequ.h"					// MSG用定義
#include "fnt_tenji.h"				// 点字用定義
#include "i_msg.ndw"				// MSGバッファ定義
#include "sxytype.h"				// 
#include "evobjdef.h"				// OBJアニメ用定義

#include "../data/itemsym.h"		// どうぐＩＤ定義
#include "../data/gds_sym.h"		// グッズＩＤ定義
#include "../snd_file/mus_def.h"	// 音楽ID用定義
#include "../evdata/maparray.h"		// 接続用マップID定義
#include "../evdata/sxysym.h"		// SXYシンボル定義
#include "../mapdata/scrn_id.h"		// マップスクリーンシンボル定義

#include "syswork.h"				// セーブワーク定義(プログラマ管理、システム用）
#include "sysflag.h"				// セーブフラグ定義(プログラマ管理、システム用）
#include "../script/savework.h"		// セーブワーク定義(スクリプトスタッフ管理)
#include "../script/saveflag.h"		// セーブフラグ定義(スクリプトスタッフ管理)
#include "../script/ballflag.h"		// セーブフラグ定義(スクリプトスタッフ管理・アイテムボール)

#include "../data/trainer.def"		// トレーナーＩＤ定義（仮）
#include "../data/warpsym.h"		// ワープ座標指定シンボル定義

#include "../sxydata/seed_def.h"	// きのみＩＤ定義

#include "ev_win.h"					// ウィンドウ種別用定義
#include "seed.h"					// たねイベント用定義
#include "conscr.h"					// コンテスト用定義
#include "ev_comm.h"				// 通信受付用定義
#include "tv_def.h"					// ＴＶ用定義
#include "cm.h"						// ＣＭ用定義
#include "kaiwa_mode.h"				// 簡易会話入力
#include "fan.h"					// ファン人物定義
#include "pocketno.h"				// ポケットナンバー定義
#include "oyaji.h"					// おやじタイプ定義
#include "scr_tool.h"				// スクリプト関連定義

#include "monsno.def"				// ポケモンナンバーの定義
#include "wazano.def"				// 技ナンバーの定義
#include "fld_eff.h"				// フィールドエフェクトの定義
#include "weather.h"				// 天候の定義
#include "wea_ctrl.h"				// 天候の定義
#include "blend_m.h"				// タネブレンダーの定義
#include "ev_sub.h"					// POSイベント/TASK設定関連の定義
#include "server.def"				// 戦闘関連の定義
#include "b_tower.def"				// バトルタワーの定義
#include "record.h"					// でんせつ記録の定義

	.TEXT
	.CODE 32

// Cプリプロセッサでマクロ置換がすべて行われるように
// Cソース形式のincludeを使用している

#include	"ev_cmd.s"	//スクリプトコード定義テーブル
#include 	"ev_work.s"	//スクリプト用ワーク定義テーブル
#include 	"ev_call.s"	//スクリプトからのプログラム呼び出し定義テーブル
#include	"scr_tbl.s"	//共通スクリプトのＩＤ呼び出し用定義テーブル

#endif
