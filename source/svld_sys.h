//=========================================================================
//	
//	svld_sys.h
//	セーブ関連セクタローテーション構造
//
//=========================================================================
#undef GLOBAL
#ifdef __SVLD_SYS_H_GLOBAL__
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================
#define	SVLD_HEADER_SIZE	(4+2+4+2)	//ヘッダサイズ
#define	SVLD_SECTOR_SIZE	(0x1000)	//セクタサイズ
#define	SVLD_DATA_SIZE		(SVLD_SECTOR_SIZE - SVLD_HEADER_SIZE)	//実データサイズ
#define	SVLD_SECTB_COUNT	(SVLD_SECTOR_COUNT)		//ローテーションセクタ数
#define SVLD_MIRROR_SIZE	(14)

#define	SVLD_SECTOR_DEATH	(0xff)		//セクタステータス定義（書き込み不可）
#define	SVLD_SECTOR_LIVE	(0xfe)		//セクタステータス定義（書き込み可）

#define	SVLD_RET_NG			(0xff)		//セーブ結果（書き込み出来なかった）
#define	SVLD_RET_NULL		(0x0)		//セーブ結果（バックアップなし）
#define	SVLD_RET_OK			(0x1)		//セーブ結果（正常に終了）
#define	SVLD_RET_DESTROY	(0x2)		//セーブ結果（完全破壊：復帰不可能）
#define	SVLD_RET_FULL		(0x3)		//セーブ結果（これ以上書き込み出来ない）
#define	SVLD_RET_HARDERROR	(0x4)		//ハードエラー（基盤なし）

#define	SVLD_MODE_SVLDSYS	(0x0000)	//モード定義（セーブシステムブロック）
#define	SVLD_MODE_ALL		(0xffff)	//モード定義（全てのブロック）

#define	SVLD_SECT_FSET		(0)			//セクタ異常判定フラグ操作モード（セット）
#define	SVLD_SECT_FCLR		(1)			//セクタ異常判定フラグ操作モード（リセット）
#define	SVLD_SECT_FCHK		(2)			//セクタ異常判定フラグ操作モード（チェック）

#define	SVLD_BYTE_WSIZE1	(SVLD_DATA_SIZE + 4)//バイト単位書き込みサイズ１（ID前まで）
#define	SVLD_BYTE_WSIZE2	(3 + 4)				//バイト単位書き込みサイズ２（ID後半より）

typedef struct {

u8		data[SVLD_DATA_SIZE];	//セーブデータ

u16		blocknum;	//ブロックナンバー
u16		sumcheck;	//サムチェックデータ
u32		save_id;	//セーブ識別データ
u32		save_count;	//セーブカウンター（履歴）

}SVLDSYS_DATA;

typedef struct {

SVLDSYS_DATA	svdata;

}SVLDSYS_WORK;

typedef struct {

u8*		dat_adr;	//データポインタ
u16		size;		//データサイズ

}SVLDSYS_BLOCK_TABLE;

typedef struct {

u8		data[SVLD_DATA_SIZE];	//セーブデータ

u16		sumcheck;	//サムチェックデータ
u32		save_id;	//セーブ識別データ

}EXTRA_DATA;

GLOBAL	SVLDSYS_WORK*	svld;

GLOBAL	void	EraseBackUpData(void);
GLOBAL	void	SaveLoadSysInit(void);
GLOBAL	u8		AGBSaveSys(u16 mode,SVLDSYS_BLOCK_TABLE* svldadr_tbl);
GLOBAL	u8		AGBLoadSys(u16 mode,SVLDSYS_BLOCK_TABLE* svldadr_tbl);
GLOBAL	u8		SaveLoadSysSet(u16 sv_blocknum,SVLDSYS_BLOCK_TABLE* svldadr_tbl);
GLOBAL	u8		SaveLoadSysGet(u16 ld_blocknum,SVLDSYS_BLOCK_TABLE* svldadr_tbl);
GLOBAL	u8		ExtraDataLoad(u8 sectnum,u8* dat_adr,u16 size);
GLOBAL	u8		ExtraDataSave(u8 sectnum,u8* dat_adr,u16 size);
GLOBAL	u8		SaveLoadSysSectFlagCont(u8 mode,u8 sector_num);
GLOBAL	u8		AGBSaveSysSioInit(SVLDSYS_BLOCK_TABLE* svldadr_tbl);
GLOBAL	u8		AGBSaveSysSioInitNoMirror(SVLDSYS_BLOCK_TABLE* svldadr_tbl);
GLOBAL	u8		AGBSaveSysSioDiv(u16 sect_max,SVLDSYS_BLOCK_TABLE* svldadr_tbl);
GLOBAL	u8		AGBSaveSysSioByte1(u16 sect_max,SVLDSYS_BLOCK_TABLE* svldadr_tbl);
GLOBAL	u8		AGBSaveSysSioByte2(u16 sect_max,SVLDSYS_BLOCK_TABLE* svldadr_tbl);
GLOBAL	u8		AGBSaveSysSioByte2Ex(u16 sect_max,SVLDSYS_BLOCK_TABLE* svldadr_tbl);
#undef GLOBAL

