//=========================================================================
//	
//	svld_ini.h
//	セーブ関連(ポケモンＡＧＢ)
//
//=========================================================================
#undef GLOBAL
#ifdef __SVLD_INI_H_GLOBAL__
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================
#define	SVLD_ID				(0x08012025)	//ヘッダステータス定義（ゲーム認証ＩＤ）
#define	SVLD_BLOCK_COUNT	(14)		//セーブブロック数
#define	SVLD_SECTOR_COUNT	(30)		//セーブセクタ数
#define	SVLD_SECTCHECK_MAX	(1)			//セーブ判定基準（ＮＧ判定残りセクタ数）

#define	SVLD_RET_UPD_NULL	(0)		//アップロードなし
#define	SVLD_RET_UPD_OK		(1)		//アップロード結果 成功
#define	SVLD_RET_UPD_FULL	(2)		//アップロード結果 書き込み不可
#define	SVLD_RET_UPD_NG		(3)		//アップロード結果 失敗

#define	SVLD_BLOCK_SIZE		(0xf80)		//セクタ当たりのセーブデータサイズ

#define	POKEAGB_SVALL		(0)
#define	POKEAGB_SVFLD		(1)
#define	POKEAGB_SVMYD		(2)
#define	POKEAGB_SVDENDOU	(3)
#define	POKEAGB_SVCLRALL	(4)
#define	POKEAGB_SVCLRDENDOU	(5)

#define	POKEAGB_LDALL		(0)
#define	POKEAGB_LDDENDOU	(3)

GLOBAL	u8		PokeAGBSave(u8 mode);
GLOBAL	u8		PokeAGBSaveTrans(u8 mode);
GLOBAL	u8		PokeAGBSaveTransWait(void);
GLOBAL	u8		PokeAGBLoad(u8 mode);
GLOBAL	u8		UpLoadDataGet(u8* upld_p);
GLOBAL	u8		UpLoadDataSet(void);
GLOBAL	u16		SaveDataCheckInfo;
GLOBAL	u16		UpDataCheckInfo;
GLOBAL	pFunc	SvRecoverReturnProc;		// セクタ検査処理後に復帰する先の関数ポインタ
GLOBAL	u8		PokeAGBSaveSioDivInit(void);
GLOBAL	u8		PokeAGBSaveSioDiv(void);	//終了(1)動作中(0)
GLOBAL	u8		PokeAGBSaveSioDiv1(void);
GLOBAL	u8		PokeAGBSaveSioDiv2(void);
GLOBAL	u8		PokeAGBSaveFieldDivInit(void);
GLOBAL	u8		PokeAGBSaveFieldDiv(void);	//終了(1)動作中(0)

#undef GLOBAL

