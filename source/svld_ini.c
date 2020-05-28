//=========================================================================
//	
//	svld_ini.ｃ
//	セーブ関連(ポケモンＡＧＢ)
//
//=========================================================================
#include "common.h"
#include "calctool.h"
#include "../library/AgbFlash1M.h"

#define __SVLD_INI_H_GLOBAL__
#include "svld_ini.h"
#include "svld_sys.h"

#include "saveload.h"
#include "pasocom.h"
#include "record.h"
#include "task.h"

//=========================================================================
//  extern変数
//=========================================================================
//=========================================================================
//  extern関数
//=========================================================================
extern	void	BuckUpRAMcheckSet(u8 mode);	//バックアップ検証プロセス
extern	u32		svld_error_sect_bit;//セクタ異常判定フラグ
//=========================================================================
//	関数プロトタイプ
//=========================================================================
//=========================================================================
//	定義
//=========================================================================
u16	SaveDataCheckInfo;
u16	UpDataCheckInfo;
pFunc SvRecoverReturnProc;		// セクタ検査処理後に復帰する先の関数ポインタ

u16	SaveTaskNo = {0};			//通信確認型セーブタスクを使用する際に参照

//=========================================================================
//	データ
//=========================================================================
//	セーブロードブロック配置テーブル
const	SVLDSYS_BLOCK_TABLE		PokeAGBsavedataAdr[]={
	/* プレーヤーデータ */
	{ (u8*)&MyData,		sizeof(MyData) },

	/* フィールドデータ */
	{ ((u8*)&Fld)+SVLD_BLOCK_SIZE*0,	SVLD_BLOCK_SIZE },
	{ ((u8*)&Fld)+SVLD_BLOCK_SIZE*1,	SVLD_BLOCK_SIZE },
	{ ((u8*)&Fld)+SVLD_BLOCK_SIZE*2,	SVLD_BLOCK_SIZE },
	{ ((u8*)&Fld)+SVLD_BLOCK_SIZE*3,	sizeof(FIELD_SAVE_DATA) % SVLD_BLOCK_SIZE },

	/* ボックスデータ */
	{ ((u8*)&BoxData)+SVLD_BLOCK_SIZE*0,	SVLD_BLOCK_SIZE },
	{ ((u8*)&BoxData)+SVLD_BLOCK_SIZE*1,	SVLD_BLOCK_SIZE },
	{ ((u8*)&BoxData)+SVLD_BLOCK_SIZE*2,	SVLD_BLOCK_SIZE },
	{ ((u8*)&BoxData)+SVLD_BLOCK_SIZE*3,	SVLD_BLOCK_SIZE },
	{ ((u8*)&BoxData)+SVLD_BLOCK_SIZE*4,	SVLD_BLOCK_SIZE },
	{ ((u8*)&BoxData)+SVLD_BLOCK_SIZE*5,	SVLD_BLOCK_SIZE },
	{ ((u8*)&BoxData)+SVLD_BLOCK_SIZE*6,	SVLD_BLOCK_SIZE },
	{ ((u8*)&BoxData)+SVLD_BLOCK_SIZE*7,	SVLD_BLOCK_SIZE },
	{ ((u8*)&BoxData)+SVLD_BLOCK_SIZE*8,	sizeof(BoxData) % SVLD_BLOCK_SIZE },
};

//	殿堂入り木の実ブロック配置テーブル
const	SVLDSYS_BLOCK_TABLE		PokeAGBexdataAdr[]={
	{ (u8*)(&(UserWork[0x01e000])),					SVLD_BLOCK_SIZE },
	{ (u8*)(&(UserWork[0x01e000+SVLD_BLOCK_SIZE])),	SVLD_BLOCK_SIZE },
};

//	アップロード設定セクタテーブル
const	u8		PokeAGBUploadSectorAdr[]={
	0x1e,0x1f,
};

//=========================================================================
//				セーブ関連（for ポケモンＡＧＢ）
//=========================================================================
u8		PokeAGBSaveMain(u8 mode)
{
	u8	i;

	switch(mode){

	case	POKEAGB_SVCLRDENDOU://殿堂データ他（固定エリア）クリア＆殿堂セーブ
		for(i=0x1c;i<0x20;i++)	EraseFlashSector(i);
	case	POKEAGB_SVDENDOU://殿堂データセーブ
		if(GetRecord( CNT_DENDOU ) < 999)	IncRecord( CNT_DENDOU ); //殿堂カウンタ増加

		for(i=0;i<2;i++)
			ExtraDataSave(0x1c+i,PokeAGBexdataAdr[i].dat_adr,PokeAGBexdataAdr[i].size);
	default:
	case	POKEAGB_SVALL://全体セーブ
		BackUpGameData();
		AGBSaveSys(SVLD_MODE_ALL,(SVLDSYS_BLOCK_TABLE*)PokeAGBsavedataAdr);
		break;
	case	POKEAGB_SVFLD://ゲーム進行データセーブ
		BackUpGameData();
		for(i=0;i<5;i++) AGBSaveSys(i,(SVLDSYS_BLOCK_TABLE*)PokeAGBsavedataAdr);
		break;
	case	POKEAGB_SVMYD://プレーヤーデータセーブ
		BackUpGameData();
		AGBSaveSys(0,(SVLDSYS_BLOCK_TABLE*)PokeAGBsavedataAdr);
		break;
	case	POKEAGB_SVCLRALL://殿堂データ他（固定エリア）クリア＆全体セーブ
		for(i=0x1c;i<0x20;i++)	EraseFlashSector(i);
		BackUpGameData();
		AGBSaveSys(SVLD_MODE_ALL,(SVLDSYS_BLOCK_TABLE*)PokeAGBsavedataAdr);
		break;
	}
	return 0;
}

//=========================================================================
u8		PokeAGBSave(u8 mode)
{
	//フラッシュが認識されていない場合はエラー
	if(SaveMemType != FLASH_1M_TYPE)	return SVLD_RET_NG;

	//セーブ実行
	PokeAGBSaveMain(mode);
	if(!svld_error_sect_bit)	return SVLD_RET_OK;//セクタ異常なし

	//セクタ検証（検証後はリセットされる）
	BuckUpRAMcheckSet(mode);	//バックアップ検証プロセスセット

	return SVLD_RET_NG;
}


//=========================================================================
//				通信確認型セーブ関連（分割全体セーブ）（for ポケモンＡＧＢ）
//=========================================================================
u8		PokeAGBSaveSioDivInit(void)
{
	//フラッシュが認識されていない場合はエラー
	if(SaveMemType != FLASH_1M_TYPE)	return 1;

	BackUpGameData();
	AGBSaveSysSioInit((SVLDSYS_BLOCK_TABLE*)PokeAGBsavedataAdr);
	return 0;
}

u8		PokeAGBSaveSioDiv(void)	//終了(1)動作中(0)
{
	u8	ret_flag;

	//セーブ実行
	ret_flag = AGBSaveSysSioDiv(SVLD_BLOCK_COUNT,(SVLDSYS_BLOCK_TABLE*)PokeAGBsavedataAdr);
	
	if(svld_error_sect_bit){
		//セクタ検証（検証後はリセットされる）
		BuckUpRAMcheckSet(POKEAGB_SVALL);	//バックアップ検証プロセスセット
	}
	if(ret_flag == SVLD_RET_NG)	return 1;
	else						return 0;
}

u8		PokeAGBSaveSioDiv1(void)
{
	AGBSaveSysSioByte1(SVLD_BLOCK_COUNT,(SVLDSYS_BLOCK_TABLE*)PokeAGBsavedataAdr);
		
	if(svld_error_sect_bit){
		//セクタ検証（検証後はリセットされる）
		BuckUpRAMcheckSet(POKEAGB_SVALL);	//バックアップ検証プロセスセット
	}
	return 0;	//特に意味なし
}

u8		PokeAGBSaveSioDiv2(void)
{
	AGBSaveSysSioByte2(SVLD_BLOCK_COUNT,(SVLDSYS_BLOCK_TABLE*)PokeAGBsavedataAdr);
		
	if(svld_error_sect_bit){
		//セクタ検証（検証後はリセットされる）
		BuckUpRAMcheckSet(POKEAGB_SVALL);	//バックアップ検証プロセスセット
	}
	return 0;	//特に意味なし
}

//=========================================================================
//				セーブ関連（分割フィールドセーブ）（for ポケモンＡＧＢ）
extern	u16	svld_div_sector_no;	//分割カウンター
#define		FIELD_BLOCK_COUNT	(5)
//=========================================================================
u8		PokeAGBSaveFieldDivInit(void)
{
	//フラッシュが認識されていない場合はエラー
	if(SaveMemType != FLASH_1M_TYPE)	return 1;

	BackUpGameData();
	AGBSaveSysSioInitNoMirror((SVLDSYS_BLOCK_TABLE*)PokeAGBsavedataAdr);

	AGBSaveSysSioByte1(svld_div_sector_no+1,(SVLDSYS_BLOCK_TABLE*)PokeAGBsavedataAdr);
	return 0;
}

u8		PokeAGBSaveFieldDiv(void)	//終了(1)動作中(0)
{
	u16	sect_b;
	u8	ret_flag;

	ret_flag = 0;

	sect_b = svld_div_sector_no;
	svld_div_sector_no++;	//分割カウンター

	if(svld_div_sector_no < FIELD_BLOCK_COUNT){
		AGBSaveSysSioByte1(svld_div_sector_no+1,(SVLDSYS_BLOCK_TABLE*)PokeAGBsavedataAdr);
		AGBSaveSysSioByte2Ex(sect_b+1,(SVLDSYS_BLOCK_TABLE*)PokeAGBsavedataAdr);
		ret_flag = 0;
	}else{
		AGBSaveSysSioByte2Ex(sect_b+1,(SVLDSYS_BLOCK_TABLE*)PokeAGBsavedataAdr);
		ret_flag = 1;
	}
	if(svld_error_sect_bit){
		//セクタ検証（検証後はリセットされる）
		BuckUpRAMcheckSet(POKEAGB_SVFLD);	//バックアップ検証プロセスセット
	}
	return ret_flag;
}


















//=========================================================================
//				ロード関連（for ポケモンＡＧＢ）
//=========================================================================
u8		PokeAGBLoad(u8 mode)
{
	u8	ret_flg;

	ret_flg = SVLD_RET_NG;
	if(SaveMemType != FLASH_1M_TYPE){
		SaveDataCheckInfo = SVLD_RET_HARDERROR;
		return	ret_flg;
	}

	switch(mode){

	default:
	case	POKEAGB_LDALL://全体ロード
		ret_flg = AGBLoadSys(SVLD_MODE_ALL,(SVLDSYS_BLOCK_TABLE*)PokeAGBsavedataAdr);
		RecoverGameData();
		SaveDataCheckInfo = ret_flg;
		SvRecoverReturnProc = NULL;		// セクタ検査処理後に復帰する先の関数ポインタ
		break;
	case	POKEAGB_LDDENDOU://殿堂データロード
		ret_flg = ExtraDataLoad(0x1c,PokeAGBexdataAdr[0].dat_adr,PokeAGBexdataAdr[0].size);
		if(ret_flg != SVLD_RET_OK)	break;
		ret_flg = ExtraDataLoad(0x1d,PokeAGBexdataAdr[1].dat_adr,PokeAGBexdataAdr[1].size);
	}
	return	ret_flg;
}





//*************************************************************************
//=========================================================================
//				外部データロード処理
//=========================================================================
typedef struct {

u8		data[SVLD_DATA_SIZE];	//セーブデータ
u32		save_id;	//セーブ識別データ

}UPLOAD_DATA;
//*************************************************************************
u8		UpLoadDataGet(u8* upld_p)
{
	u16	i;
	UPLOAD_DATA	*upld;

	upld = (UPLOAD_DATA*)upld_p;

	for(i=0;i<SVLD_SECTOR_SIZE;i++) upld_p[i] = 0;
	ReadFlash(PokeAGBUploadSectorAdr[0],0,(u8*)upld,SVLD_SECTOR_SIZE);
	if(upld->save_id != SVLD_ID)	return	SVLD_RET_UPD_NULL;
	return	SVLD_RET_UPD_OK;
}

u8		UpLoadDataSet(void)
{
	u16	i;
	u8	ret_flg;

	ret_flg = PokeAGBSave(POKEAGB_SVALL);
	for(i=0;i<2;i++){
		EraseFlashSector(PokeAGBUploadSectorAdr[i]);
	}
	if(ret_flg == SVLD_RET_NG)		return	SVLD_RET_UPD_NG;
	if(ret_flg == SVLD_RET_FULL)	return	SVLD_RET_UPD_FULL;

	PokeAGBLoad(POKEAGB_SVALL);
	return	SVLD_RET_UPD_OK;
}


//-------------------------------------------------------------------------
//			外部データ用セーブメイン（仮）
//-------------------------------------------------------------------------
u32 upload_sv_flag = 0;

u8		UpLoadDataSave(u8* dat_adr,u16 size)
{
	u16	i;
	UPLOAD_DATA	*upld;

	upld = (UPLOAD_DATA*)(UserWork + 0x00000000);	
	//セーブデータ領域クリア
	for(i=0;i<SVLD_SECTOR_SIZE;i++) ((u8*)upld)[i] = 0;
	//セーブ識別データ設定
	upld->save_id	= SVLD_ID;
	//セーブデータコピー
	for(i=0;i<size;i++) upld->data[i] = dat_adr[i];

	//セクタセーブ＆結果
	upload_sv_flag = ProgramFlashSectorEx2(
			PokeAGBUploadSectorAdr[0],(u8*)upld,SVLD_SECTOR_SIZE);
	if(upload_sv_flag){
		return	SVLD_RET_NG;
	}else{
		return	SVLD_RET_OK;
	}
}

//-------------------------------------------------------------------------
//			カードＥ用セーブメイン（仮）
//-------------------------------------------------------------------------
u8		SaveExtraSector(u8 sector_num, u8 *p)
{
	if(ProgramFlashSectorEx(sector_num,p)){
		return	SVLD_RET_NG;
	}else{
		return	SVLD_RET_OK;
	}
}

//-------------------------------------------------------------------------
//			カードＥ用ロードメイン（仮）
//-------------------------------------------------------------------------
u8		LoadExtraSector(u8 sector_num, u8 *p)
{
	ReadFlash(sector_num,0,(u8 *)p,SVLD_SECTOR_SIZE);
	return	SVLD_RET_OK;
}






