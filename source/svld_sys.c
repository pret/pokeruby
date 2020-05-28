//=========================================================================
//	
//	svld_sys.ｃ
//	セーブ関連セクタローテーション構造
//
//=========================================================================
#include "common.h"
#include "intr.h"
#include "saveload.h"
#include "intr.h"
#include "../library/AgbFlash1M.h"

#include "svld_ini.h"
#define __SVLD_SYS_H_GLOBAL__
#include "svld_sys.h"





//=========================================================================
//  extern変数
//=========================================================================
//=========================================================================
//  extern関数
//=========================================================================
//=========================================================================
//	関数プロトタイプ
//=========================================================================
static	u16		SumCheckCalc(u32* dat_adr,u16 size);
static	u8		SaveSector(u8 sector_num,u8* data);
static	u8		LoadSector(u8 sector_num,u8* data);
static	u16		LoadStatusCheck(SVLDSYS_BLOCK_TABLE* svldadr_tbl);

//=========================================================================
//	定義
//=========================================================================
SVLDSYS_WORK*	svld;						//各プロジェクトでワークエリアを管理する
//履歴カウンター
u32	svld_main_counter;
//書き込みスタート位置
u16	svld_sector_start;
//セクタ異常判定フラグ
u32	svld_error_sect_bit;
//履歴カウンターバックアップ
u32	svld_main_counter_backup;
//書き込みスタート位置バックアップ
u16	svld_sector_start_backup;
//分割セーブ用カウンター
u16	svld_div_sector_no;

//*************************************************************************
//=========================================================================
//				ＦＬＡＳＨ＿ＲＡＭ初期化
//=========================================================================
//*************************************************************************
void	EraseBackUpData(void)
{
	u16	i;

	for(i=0;i<32;i++) EraseFlashSector(i);
}

//*************************************************************************
//=========================================================================
//				基本初期化（ゲームスタート時、データロード前）
//=========================================================================
//*************************************************************************
void	SaveLoadSysInit(void)
{
	svld_main_counter	= 0;
	svld_sector_start	= 0;
	svld_error_sect_bit	= 0;
}

//*************************************************************************
//=========================================================================
//				セクタ異常判定ビット操作
//=========================================================================
//*************************************************************************
u8		SaveLoadSysSectFlagCont(u8 mode,u8 sector_num)
{
	u8	ret_flag;

	ret_flag = 0;

	switch(mode){
	case SVLD_SECT_FSET:
		svld_error_sect_bit	|= (0x00000001 << sector_num);
		break;
	case SVLD_SECT_FCLR:
		svld_error_sect_bit	&= ((0x00000001 << sector_num)^0xffffffff);
		break;
	case SVLD_SECT_FCHK:
		if(svld_error_sect_bit & (0x00000001 << sector_num)){
			ret_flag = 1;
		}
		break;
	}
	return ret_flag;
}

//*************************************************************************
//=========================================================================
//				メイン
//=========================================================================
//*************************************************************************
//*************************************************************************
//=========================================================================
//				セーブ
//=========================================================================
//*************************************************************************
u8		AGBSaveSys(u16 mode,SVLDSYS_BLOCK_TABLE* svldadr_tbl)
{
	u16	i;
	u8	ret_flg;

	//システムワークポインタ設定
	svld = (SVLDSYS_WORK*)(UserWork + 0x00000000);	

	switch(mode){

	default:
		//各ブロック単体のセーブ（セクタ＆ミラー移動なし）mode = ブロックナンバー
		ret_flg = SaveLoadSysSet(mode,svldadr_tbl);
		break;
	case	SVLD_MODE_ALL:
		//全ブロックのセーブ（セクタ＆ミラー移動）
		svld_sector_start_backup = svld_sector_start;	//バックアップ
		svld_main_counter_backup = svld_main_counter;	//バックアップ

		svld_sector_start++;
		svld_sector_start %= SVLD_MIRROR_SIZE;	//セクタ移動
		svld_main_counter++;				//ミラー移動

		ret_flg = SVLD_RET_OK;

		for(i=0;i<SVLD_BLOCK_COUNT;i++){
			SaveLoadSysSet(i,svldadr_tbl);
		}
		if(svld_error_sect_bit){
			ret_flg = SVLD_RET_NG;
			svld_sector_start = svld_sector_start_backup;	//バックアップ戻す
			svld_main_counter = svld_main_counter_backup;	//バックアップ戻す
		}
		break;
	}
	return	ret_flg;
}

//-------------------------------------------------------------------------
//				セーブセクタ設定＆セーブ実行
//-------------------------------------------------------------------------
u8		SaveLoadSysSet(u16 sv_blocknum,SVLDSYS_BLOCK_TABLE* svldadr_tbl)
{
	u16	i,p,sumcheck,size;
	u8*	svdat_adr;

	//書き込みセクタ設定
	p = svld_sector_start + sv_blocknum;
	p %= SVLD_MIRROR_SIZE;
	p += (svld_main_counter & 0x00000001) * SVLD_MIRROR_SIZE;

	svdat_adr	= svldadr_tbl[sv_blocknum].dat_adr;
	size		= svldadr_tbl[sv_blocknum].size;

	//セーブデータ領域クリア
	for(i=0;i<SVLD_SECTOR_SIZE;i++) ((u8*)svld)[i] = 0;
	//ブロックナンバー設定
	svld->svdata.blocknum	= sv_blocknum;	
	//セーブ識別データ設定
	svld->svdata.save_id	= SVLD_ID;
	//セーブカウンター（履歴）更新
	svld->svdata.save_count = svld_main_counter;
	//セーブデータコピー
	for(i=0;i<size;i++) svld->svdata.data[i] = svdat_adr[i];
	//サムチェック設定
	sumcheck = SumCheckCalc((u32*)svdat_adr,size);
	svld->svdata.sumcheck	= sumcheck;

	//セクタセーブ＆結果
	return	SaveSector(p,(u8*)(&svld->svdata));
}

//-------------------------------------------------------------------------
//			セクタ指定セーブ
//-------------------------------------------------------------------------
u8		ExtraDataSave(u8 sectnum,u8* dat_adr,u16 size)
{
	u16	i,sumcheck;
	EXTRA_DATA	*ex_svld;

	ex_svld = (EXTRA_DATA*)(UserWork + 0x00000000);	
	//セーブデータ領域クリア
	for(i=0;i<SVLD_SECTOR_SIZE;i++) ((u8*)ex_svld)[i] = 0;
	//セーブ識別データ設定
	ex_svld->save_id	= SVLD_ID;
	//セーブデータコピー
	for(i=0;i<size;i++) ex_svld->data[i] = dat_adr[i];
	//サムチェック設定
	sumcheck = SumCheckCalc((u32*)dat_adr,size);
	ex_svld->sumcheck	= sumcheck;

	//セクタセーブ＆結果
	return	SaveSector(sectnum,(u8*)ex_svld);
}

//-------------------------------------------------------------------------
//				セーブメイン
//-------------------------------------------------------------------------
static	u8		SaveSector(u8 sector_num,u8* data)
{
	if(ProgramFlashSectorEx(sector_num,data)){
		SaveLoadSysSectFlagCont(SVLD_SECT_FSET,sector_num);
		return	SVLD_RET_NG;
	}else{
		SaveLoadSysSectFlagCont(SVLD_SECT_FCLR,sector_num);
		return	SVLD_RET_OK;
	}
}










//*************************************************************************
//=========================================================================
//				通信時同期分割セーブ（全体のみ）
//=========================================================================
u8		SaveLoadSysSetByte(u16 sv_blocknum,SVLDSYS_BLOCK_TABLE* svldadr_tbl);
//*************************************************************************
u8		AGBSaveSysSioInit(SVLDSYS_BLOCK_TABLE* svldadr_tbl)
{
	//システムワークポインタ設定
	svld = (SVLDSYS_WORK*)(UserWork + 0x00000000);	

	//全ブロックのセーブ（セクタ＆ミラー移動）
	svld_sector_start_backup = svld_sector_start;	//バックアップ
	svld_main_counter_backup = svld_main_counter;	//バックアップ

	svld_sector_start++;
	svld_sector_start %= SVLD_MIRROR_SIZE;	//セクタ移動
	svld_main_counter++;				//ミラー移動

	svld_div_sector_no = 0;
	svld_error_sect_bit= 0;
	return	0;
}

u8		AGBSaveSysSioInitNoMirror(SVLDSYS_BLOCK_TABLE* svldadr_tbl)
{
	//システムワークポインタ設定
	svld = (SVLDSYS_WORK*)(UserWork + 0x00000000);	

	svld_sector_start_backup = svld_sector_start;	//バックアップ
	svld_main_counter_backup = svld_main_counter;	//バックアップ
	svld_div_sector_no = 0;
	svld_error_sect_bit= 0;
	return	0;
}

//-------------------------------------------------------------------------
//				分割セーブ実行
//-------------------------------------------------------------------------
u8		AGBSaveSysSioDiv(u16 sect_max,SVLDSYS_BLOCK_TABLE* svldadr_tbl)
{
	u8	ret_flg;

//	if(svld_div_sector_no < (SVLD_BLOCK_COUNT-1)){
	if(svld_div_sector_no < (sect_max-1)){
		ret_flg = SVLD_RET_OK;

		SaveLoadSysSet(svld_div_sector_no,svldadr_tbl);
		svld_div_sector_no++;
	
		if(svld_error_sect_bit){
			ret_flg = SVLD_RET_NG;	//中断
			svld_sector_start = svld_sector_start_backup;	//バックアップ戻す
			svld_main_counter = svld_main_counter_backup;	//バックアップ戻す
		}
	}else{
		ret_flg = SVLD_RET_NG;	//終了
	}
	return	ret_flg;
}

//-------------------------------------------------------------------------
//		最終セクタ前半	
//-------------------------------------------------------------------------
u8		AGBSaveSysSioByte1(u16 sect_max,SVLDSYS_BLOCK_TABLE* svldadr_tbl)
{
	u8	ret_flg;

	ret_flg = SVLD_RET_OK;
//	SaveLoadSysSetByte(SVLD_BLOCK_COUNT-1,svldadr_tbl);	//最後の１セクタのセーブ
	SaveLoadSysSetByte(sect_max-1,svldadr_tbl);	//最後の１セクタのセーブ
	if(svld_error_sect_bit){
		ret_flg = SVLD_RET_NG;
		svld_sector_start = svld_sector_start_backup;	//バックアップ戻す
		svld_main_counter = svld_main_counter_backup;	//バックアップ戻す
	}
	return	ret_flg;
}

//-------------------------------------------------------------------------
//				セーブセクタ設定＆セーブ実行（ＩＤ部を除くバイト単位書き込み）
//-------------------------------------------------------------------------
u8		SaveLoadSysSetByte(u16 sv_blocknum,SVLDSYS_BLOCK_TABLE* svldadr_tbl)
{
	u16	i,p,sumcheck,size,f;
	u8*	svdat_adr;

	//書き込みセクタ設定
	p = svld_sector_start + sv_blocknum;
	p %= SVLD_MIRROR_SIZE;
	p += (svld_main_counter & 0x00000001) * SVLD_MIRROR_SIZE;

	svdat_adr	= svldadr_tbl[sv_blocknum].dat_adr;
	size		= svldadr_tbl[sv_blocknum].size;

	//セーブデータ領域クリア
	for(i=0;i<SVLD_SECTOR_SIZE;i++) ((u8*)svld)[i] = 0;
	//ブロックナンバー設定
	svld->svdata.blocknum	= sv_blocknum;	
	//セーブ識別データ設定
	svld->svdata.save_id	= SVLD_ID;
	//セーブカウンター（履歴）更新
	svld->svdata.save_count = svld_main_counter;
	//セーブデータコピー
	for(i=0;i<size;i++) svld->svdata.data[i] = svdat_adr[i];
	//サムチェック設定
	sumcheck = SumCheckCalc((u32*)svdat_adr,size);
	svld->svdata.sumcheck	= sumcheck;

	//セクタ消去
	EraseFlashSector(p);

	//セクタ書き込み前半
	f = SVLD_RET_OK;
	for(i=0;i<SVLD_BYTE_WSIZE1;i++){
		if(ProgramFlashByte(p,i,((u8*)svld)[i])){
			f = SVLD_RET_NG;
			break;
		}
	}
	if(f == SVLD_RET_NG){
		SaveLoadSysSectFlagCont(SVLD_SECT_FSET,p);
		return	SVLD_RET_NG;
	}

	//セクタ書き込み後半
	f = SVLD_RET_OK;
	for(i=0;i<SVLD_BYTE_WSIZE2;i++){
		if(ProgramFlashByte(p,(i+SVLD_BYTE_WSIZE1+1),((u8*)svld)[i+SVLD_BYTE_WSIZE1+1])){
			f = SVLD_RET_NG;
			break;
		}
	}
	if(f == SVLD_RET_NG){
		SaveLoadSysSectFlagCont(SVLD_SECT_FSET,p);
		return	SVLD_RET_NG;
	}else{
		SaveLoadSysSectFlagCont(SVLD_SECT_FCLR,p);
		return	SVLD_RET_OK;
	}
}

//-------------------------------------------------------------------------
//		最終セクタ後半	
//-------------------------------------------------------------------------
u8		AGBSaveSysSioByte2(u16 sect_max,SVLDSYS_BLOCK_TABLE* svldadr_tbl)
{
	u16	p;
	
	//書き込みセクタ設定
//	p = svld_sector_start + SVLD_BLOCK_COUNT-1;
	p = svld_sector_start + sect_max-1;
	p %= SVLD_MIRROR_SIZE;
	p += (svld_main_counter & 0x00000001) * SVLD_MIRROR_SIZE;

	//セクタ書き込みＩＤ（1byte分だけ）
	if(ProgramFlashByte(p,SVLD_BYTE_WSIZE1,((u8*)svld)[SVLD_BYTE_WSIZE1])){
		SaveLoadSysSectFlagCont(SVLD_SECT_FSET,p);
		svld_sector_start = svld_sector_start_backup;	//バックアップ戻す
		svld_main_counter = svld_main_counter_backup;	//バックアップ戻す
		return	SVLD_RET_NG;
	}else{
		SaveLoadSysSectFlagCont(SVLD_SECT_FCLR,p);
		return	SVLD_RET_OK;
	}
}

//-------------------------------------------------------------------------
//		最終セクタ後半(認証ＩＤ決めうち版)	
//-------------------------------------------------------------------------
u8		AGBSaveSysSioByte2Ex(u16 sect_max,SVLDSYS_BLOCK_TABLE* svldadr_tbl)
{
	u16	p;
	
	//書き込みセクタ設定
	p = svld_sector_start + sect_max-1;
	p %= SVLD_MIRROR_SIZE;
	p += (svld_main_counter & 0x00000001) * SVLD_MIRROR_SIZE;

	//セクタ書き込みＩＤ（1byte分だけ）
	if(ProgramFlashByte(p,SVLD_BYTE_WSIZE1,(u8)(SVLD_ID & 0xff))){
		SaveLoadSysSectFlagCont(SVLD_SECT_FSET,p);
		svld_sector_start = svld_sector_start_backup;	//バックアップ戻す
		svld_main_counter = svld_main_counter_backup;	//バックアップ戻す
		return	SVLD_RET_NG;
	}else{
		SaveLoadSysSectFlagCont(SVLD_SECT_FCLR,p);
		return	SVLD_RET_OK;
	}
}






















//*************************************************************************
//=========================================================================
//				ロード
//=========================================================================
//*************************************************************************
u8		AGBLoadSys(u16 mode,SVLDSYS_BLOCK_TABLE* svldadr_tbl)
{
	u8	ret_flag;

	//システムワークポインタ設定
	svld = (SVLDSYS_WORK*)(UserWork + 0x00000000);	

	switch(mode){

	default:
		//各ブロック単体のロード mode = ブロックナンバー
//		ret_flag = SaveLoadSysGet(mode,svldadr_tbl);
		ret_flag = SVLD_RET_NG;
		break;
	case	SVLD_MODE_ALL:
		//最新データ判別＆履歴カウンタ取得
		ret_flag = LoadStatusCheck(svldadr_tbl);
		if((ret_flag == SVLD_RET_NULL)&&(ret_flag == SVLD_RET_DESTROY)){
			//セーブデータが存在していない、または復帰不可能なので初期化して終了
			SaveLoadSysInit();
			break;
		}
		//全ブロックのロード
		SaveLoadSysGet(mode,svldadr_tbl);
		break;
	}
	return	ret_flag;
}

//-------------------------------------------------------------------------
//				ロード実行
//-------------------------------------------------------------------------
u8		SaveLoadSysGet(u16 ld_blocknum,SVLDSYS_BLOCK_TABLE* svldadr_tbl)
{
	u16	i,j,p,blocknum,sumcheck;

	//読み込みセクタ設定
	p = (svld_main_counter & 0x00000001) * SVLD_MIRROR_SIZE;

	for(i=0;i<SVLD_MIRROR_SIZE;i++){
		LoadSector(i+p,(u8 *)(&svld->svdata));

		//書き込みスタート位置設定（次回セーブ用）
		if(!(blocknum = svld->svdata.blocknum))	svld_sector_start = i;

		//ＩＤ確認＆サムチェック確認
		sumcheck = SumCheckCalc((u32*)svld->svdata.data,svldadr_tbl[blocknum].size);
		if((svld->svdata.save_id == SVLD_ID)&&(svld->svdata.sumcheck == sumcheck)){
			//ロードデータ配置
			for(j=0;j<(svldadr_tbl[blocknum].size);j++){
				svldadr_tbl[blocknum].dat_adr[j] = svld->svdata.data[j];
			}
		}
	}
	return	SVLD_RET_OK;	//ロード正常完了
}

//-------------------------------------------------------------------------
//				最新データ判別＆履歴カウンタ取得＆整合チェック
//-------------------------------------------------------------------------
static	u16		LoadStatusCheck(SVLDSYS_BLOCK_TABLE* svldadr_tbl)
{
	u16	i,f1,f2,sumcheck,null_f;
	u32	counter1,counter2;
	u32	block_flag;

	counter1 = 0;
	counter2 = 0;

	//ミラー１状態取得
	block_flag = 0;
	null_f = 0;
	for(i=0;i<SVLD_MIRROR_SIZE;i++){
		LoadSector(i,(u8 *)(&svld->svdata));
		//ＩＤ確認
		if(svld->svdata.save_id == SVLD_ID){
			null_f = 1;
			//サムチェック確認
			sumcheck = 
				SumCheckCalc((u32*)svld->svdata.data,svldadr_tbl[svld->svdata.blocknum].size);
			if(svld->svdata.sumcheck == sumcheck){
				counter1 = svld->svdata.save_count;
				block_flag |= (0x00000001 << svld->svdata.blocknum);	//ブロック補完情報
			}
		}
	}
	//ミラー１補完情報確認
	if(null_f){
		if(block_flag == ((0xffffffff << SVLD_BLOCK_COUNT)^0xffffffff)){
			f1 = SVLD_RET_OK;
		}else{
			f1 = SVLD_RET_NG;
		}
	}else{
		f1 = SVLD_RET_NULL;
	}

	//ミラー２状態取得
	block_flag = 0;
	null_f = 0;
	for(i=0;i<SVLD_MIRROR_SIZE;i++){
		LoadSector(i+SVLD_MIRROR_SIZE,(u8 *)(&svld->svdata));
		//ＩＤ確認
		if(svld->svdata.save_id == SVLD_ID){
			null_f = 1;
			//サムチェック確認
			sumcheck = 
				SumCheckCalc((u32*)svld->svdata.data,svldadr_tbl[svld->svdata.blocknum].size);
			if(svld->svdata.sumcheck == sumcheck){
				counter2 = svld->svdata.save_count;
				block_flag |= (0x00000001 << svld->svdata.blocknum);	//ブロック補完情報
			}
		}
	}
	//ミラー２補完情報確認
	if(null_f){
		if(block_flag == ((0xffffffff << SVLD_BLOCK_COUNT)^0xffffffff)){
			f2 = SVLD_RET_OK;
		}else{
			f2 = SVLD_RET_NG;
		}
	}else{
		f2 = SVLD_RET_NULL;
	}

	//状態判別
	if((f1 == SVLD_RET_OK)&&(f2 == SVLD_RET_OK)){
		if(((counter1 == 0xffffffff)&&(counter2 == 0x00000000))
			||((counter1 == 0x00000000)&&(counter2 == 0xffffffff))){
			//履歴カンスト処理（ないと思うが念のため）
			if((counter1+1) < (counter2+1)){
				svld_main_counter	= counter2;
			}else{
				svld_main_counter	= counter1;
			}
		}else{
			if(counter1 < counter2){
				svld_main_counter	= counter2;
			}else{
				svld_main_counter	= counter1;
			}
		}
		return	SVLD_RET_OK;//ミラー１：生存、ミラー２：生存
	}
	if((f1 == SVLD_RET_OK)&&(f2 != SVLD_RET_OK)){
		svld_main_counter	= counter1;
		if(f2 == SVLD_RET_NG){
			return	SVLD_RET_NG;//ミラー１：生存、ミラー２：死亡（警告）
		}else{
			return	SVLD_RET_OK;//ミラー１：生存、ミラー２：初期（ありえないが一応）
		}
	}
	if((f2 == SVLD_RET_OK)&&(f1 != SVLD_RET_OK)){
		svld_main_counter	= counter2;
		if(f1 == SVLD_RET_NG){
			return	SVLD_RET_NG;//ミラー１：死亡、ミラー２：生存（警告）
		}else{
			return	SVLD_RET_OK;//ミラー１：初期、ミラー２：生存（最初はこれ）
		}
	}
	if((f1 == SVLD_RET_NULL)&&(f2 == SVLD_RET_NULL)){
		svld_main_counter	= 0;
		svld_sector_start	= 0;
		return	SVLD_RET_NULL;//ミラー１：初期、ミラー２：初期
	}
	//その他（ありえないが念のため）
	//ミラー１：死亡、ミラー２：死亡
	//ミラー１：初期、ミラー２：死亡
	//ミラー１：死亡、ミラー２：初期（初期不良であるかも？）
	svld_main_counter	= 0;
	svld_sector_start	= 0;
	return	SVLD_RET_DESTROY;
}

//-------------------------------------------------------------------------
//			セクタ指定ロード
//-------------------------------------------------------------------------
u8		ExtraDataLoad(u8 sectnum,u8* dat_adr,u16 size)
{
	u16	i,sumcheck;
	EXTRA_DATA	*ex_svld;

	ex_svld = (EXTRA_DATA*)(UserWork + 0x00000000);	
	LoadSector(sectnum,(u8 *)ex_svld);

	//ＩＤ確認
	if(ex_svld->save_id == SVLD_ID){
		//サムチェック確認
		sumcheck = SumCheckCalc((u32*)ex_svld->data,size);
		if(ex_svld->sumcheck == sumcheck){
			//ロードデータ配置
			for(i=0;i<size;i++){
				dat_adr[i] = ex_svld->data[i];
			}
			return	SVLD_RET_OK;	//正常終了
		}
		return	SVLD_RET_DESTROY;	//サムチェックエラー（復帰不可）
	}
	return	SVLD_RET_NULL;			//ＩＤエラー（データなし）
}

//-------------------------------------------------------------------------
//				ロードメイン
//-------------------------------------------------------------------------
static	u8		LoadSector(u8 sector_num,u8* data)
{
	ReadFlash(sector_num,0,data,SVLD_SECTOR_SIZE);
	return	SVLD_RET_OK;
}





//*************************************************************************
//=========================================================================
//				サブルーチン
//=========================================================================
//*************************************************************************
static	u16		SumCheckCalc(u32* dat_adr,u16 size)
{
	u16	i;
	u32	sumcheck;

	sumcheck = 0;
	for(i=0;i<(size/4);i++){
		sumcheck += *dat_adr;
		dat_adr++;
	}
	return	(u16)(((sumcheck >> 16) & 0xffff) + (sumcheck & 0xffff));
}





#ifdef PM_DEBUG
extern	const	SVLDSYS_BLOCK_TABLE		PokeAGBsavedataAdr[];
extern	const	SVLDSYS_BLOCK_TABLE		PokeAGBexdataAdr[];
//*************************************************************************
//=========================================================================
//				ロードデータコンバート
//=========================================================================
//*************************************************************************
void	LoadDataConv(void)
{
	u16	i,sumcheck;
	SVLDSYS_WORK*	Dsvld1;
	EXTRA_DATA*		Dsvld2;
	const	SVLDSYS_BLOCK_TABLE* Dsvld1Tbl;
	const	SVLDSYS_BLOCK_TABLE* Dsvld2Tbl;

	Dsvld1		= (SVLDSYS_WORK*)(UserWork + 0x00000000);	
	Dsvld1Tbl	= PokeAGBsavedataAdr;

	for(i=0;i<28;i++){
		LoadSector(i,(u8 *)(&Dsvld1->svdata));
		sumcheck = 
			SumCheckCalc((u32*)Dsvld1->svdata.data,Dsvld1Tbl[Dsvld1->svdata.blocknum].size);
		Dsvld1->svdata.sumcheck = sumcheck;
		ProgramFlashSectorEx(i,(u8 *)(&Dsvld1->svdata));
	}

	Dsvld2		= (EXTRA_DATA*)(UserWork + 0x00000000);	
	Dsvld2Tbl	= PokeAGBexdataAdr;
	for(i=0;i<2;i++){
		LoadSector(i+28,(u8 *)Dsvld2);
		sumcheck = 
			SumCheckCalc((u32*)Dsvld2->data,Dsvld2Tbl[i].size);
		Dsvld2->sumcheck = sumcheck;
		ProgramFlashSectorEx(i+28,(u8 *)Dsvld2);
	}
}


#endif
