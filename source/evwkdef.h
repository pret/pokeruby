#ifndef	__EVWKDEF_H__
#define	__EVWKDEF_H__

//====================================================================
//
//	セーブフラグ・ワーク領域定義
//
//====================================================================

// フラグ関連定義
#define	SVFLG_START			0x0000			// セーブフラグスタートナンバー
#define	SCFLG_START			0x4000			// 制御フラグスタートナンバー


#define USRFLAG_START		0
#define USRFLAG_MAX			2048				/* スクリプト定義のフラグ最大数 */
#define USRFLAG_AREA_MAX	(USRFLAG_MAX/8)

#define SYSFLAG_START		(USRFLAG_MAX)
#define	SYSFLAG_MAX			192					/* システム定義のフラグ最大数 */
#define	SYSFLAG_AREA_MAX	(SYSFLAG_MAX/8)

#define TIMEFLAG_START		(USRFLAG_MAX+SYSFLAG_MAX)
#define TIMEFLAG_MAX		64					/* 時間経過イベント用フラグ最大数*/
#define	TIMEFLAG_AREA_MAX	(TIMEFLAG_MAX/8)

#define	EVFLAG_MAX			(USRFLAG_MAX+SYSFLAG_MAX+TIMEFLAG_MAX)
#define	EVFLAG_AREA_MAX		(EVFLAG_MAX/8)

#define TRFLG_START			1280				/* トレーナーID対応フラグ開始位置 */


//セーブしないフラグ関連定義
#define	CTRLFLAG_MAX		128					/* 制御フラグ最大数 */
#define	CTRLFLAG_AREA_MAX	(CTRLFLAG_MAX/8)


//	セーブワーク関連定義
#define SYSWORK_MAX			80
#define EVWORK_AREA_MAX		256

#define	SVWK_START			0x4000					// セーブワーク定義スタートナンバー
#define	SCWK_START			0x8000					// データ交換・汎用ワーク定義スタートナンバー


#endif	/*__EVWKDEF_H__*/
