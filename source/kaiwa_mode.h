/***********************************************************************
**	簡易会話の入力モード
***********************************************************************/
#ifndef _KAIWA_MODE_H_
#define _KAIWA_MODE_H_

#define	KAIWA_MODE_SELF            0    // 自己紹介
#define	KAIWA_MODE_BATTLE_START    1    // 対戦開始
#define	KAIWA_MODE_BATTLE_WON      2    // 対戦勝ち
#define	KAIWA_MODE_BATTLE_LOST     3    // 対戦負け
#define	KAIWA_MODE_MAIL            4    // メール
#define	KAIWA_MODE_HAGAKI          5    // はがき
#define	KAIWA_MODE_SONG            6    // 替え歌
#define	KAIWA_MODE_INTERVIEW       7    // インタビュー
#define KAIWA_MODE_GYMREADER       8    // ジムリーダー戦後
#define KAIWA_MODE_POPULAR         9    // 流行
#define KAIWA_MODE_FIELDBATTLE    10    // フィールド戦闘後
#define KAIWA_MODE_CONTEST        11    // コンテスト後
#define KAIWA_MODE_TOWER          12    // バトルタワーインタビュー
#define KAIWA_MODE_NICEWORD       13    // いいことば

#define	KAIWA_MODE_MAX            14    // モードマックス

//--------------------------------------
// インタビュアーの画像タイプ
//--------------------------------------
#define KAIWA_INTERVIEWER_MAN      (0)
#define KAIWA_INTERVIEWER_WOMAN    (1)
#define KAIWA_INTERVIEWER_DAISUKI  (2)

#define KAIWA_INTERVIEWER_NOTHING  (3)  // インタビュアーなし


//--------------------------------------
// 無効な会話コード
//--------------------------------------
#define KAIWA_CODE_BLANK   (0xffff)  // 無効なコード

#endif
