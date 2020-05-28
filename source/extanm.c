//=========================================================================
//
//		アクター外アニメ関数
//											2001.07.04(水)	by matsuda
//=========================================================================

#include "common.h"
#include "actor.h"
#include "actanm.h"
#include "madefine.h"
#include "extanm.h"

//=========================================================================
//	定数
//=========================================================================


//=========================================================================
//	データ
//=========================================================================
//----------------------------------------------------------
//	oamの形状とｻｲｽﾞから絵のﾊﾞｲﾄｻｲｽﾞを出す
//   CharByteSizeTbl[shape][size]
//----------------------------------------------------------
static const u16 CharByteSizeTbl[3][4] = 
{
	//shape 0
	{
		OBJ_SIZE16_8x8,		//size 0
		OBJ_SIZE16_16x16,	//size 1
		OBJ_SIZE16_32x32,	//size 2
		OBJ_SIZE16_64x64,	//size 3
	},
	//shape 1
	{
		OBJ_SIZE16_16x8,	//size 0
		OBJ_SIZE16_32x8,	//size 1
		OBJ_SIZE16_32x16,	//size 2
		OBJ_SIZE16_64x32,	//size 3
	},
	//shape 2
	{
		OBJ_SIZE16_8x16,	//size 0
		OBJ_SIZE16_8x32,	//size 1
		OBJ_SIZE16_16x32,	//size 2
		OBJ_SIZE16_32x64,	//size 3
	},
};


//=========================================================================
//	プログラム
//=========================================================================
/*
	u8 		anm_no;							// ｱﾆﾒﾅﾝﾊﾞ
	u8 		anm_offs;						// ｱﾆﾒﾅﾝﾊﾞｵﾌｾｯﾄ

	u8 		anm_wait:6;						// ｱﾆﾒｳｪｲﾄ
	u8		anm_pause:1;					// ｱﾆﾒﾎﾟｰｽﾞ
	u8		aff_pause:1;					// ｱﾌｨﾝｱﾆﾒﾎﾟｰｽﾞ
	u8		anm_count;						// ｱﾆﾒﾙｰﾌﾟ
	u16		char_num;						// ｵﾌｾｯﾄｷｬﾗﾅﾝﾊﾞ

*/
//----------------------------------------------------------
//	アニメ実行	アニメさせる場合は動作関数の中で呼び続けてください
//　戻り値: 0=wait中	1=1ﾊﾟﾀｰﾝにｱﾆﾒが切り替わった  2=2ﾊﾟﾀｰﾝｱﾆﾒに切り替わった 3=同上
//----------------------------------------------------------
//ExteriorAnm
extern u8 pokeic2_Character[];
u8 ExtAnm(actWork *Xreg)
{
	u16 offset_size;
	u8 *data_adr;
	u8 change_flg = 0;
	
	if(Xreg->anm_wait == 0)
	{
		switch(Xreg->anm_tbl[Xreg->anm_no][Xreg->anm_offs].pat)
		{
			case ACT_ANMEND:
				break;
				
			case ACT_ANMLOOP:
				Xreg->anm_offs = 0;
				break;
			
			default:
				offset_size = CharByteSizeTbl[Xreg->oamData.Shape][Xreg->oamData.Size];
				data_adr = ((u8*)Xreg->anm_trans) + 
					offset_size * Xreg->anm_tbl[Xreg->anm_no][Xreg->anm_offs].pat;
				DmaTransReq(data_adr, (Xreg->oamData.CharNo << 5) + OBJ_MODE0_VRAM, offset_size);
			
				Xreg->anm_wait = Xreg->anm_tbl[Xreg->anm_no][Xreg->anm_offs].wait;
				Xreg->anm_offs++;
				change_flg = Xreg->anm_offs;
		}
	}
	else
		Xreg->anm_wait--;
	
	return change_flg;
}


//----------------------------------------------------------
//	ExtAnmを使用する場合は、この関数でAddActorする
//----------------------------------------------------------
u8 ExtAddActor(ExtActHeader *eah, s16 x, s16 y, u8 pri)
{
	u8 actno;
	actAnmData TempTransTbl ={		//AddActorした時に領域を確保するため
		0, 	CharByteSizeTbl[eah->oamData->Shape][eah->oamData->Size]//一時的にﾃｰﾌﾞﾙを作成
	};
	actHeader acth = 	//ﾎﾟｹﾓﾝｱｲｺﾝ用のﾍｯﾀﾞｰをRAM上に形成
	{
		ACT_TMODE,
		eah->pal_id,
		eah->oamData,
		eah->anm_tbl,
		&TempTransTbl,
		eah->aff_tbl,
		eah->move,
	};
	actno = AddActor(&acth, x, y, pri);
	
//	ActWork[actno].feature_flg = 1;		//ｵﾘｼﾞﾅﾙｱﾆﾒﾙｰﾁﾝを使用する印
	ActWork[actno].anm_pause = 1;
	ActWork[actno].anm_sw = 0;			//ｱﾆﾒ変更ﾌﾗｸﾞOFF
	ActWork[actno].anm_trans = (void*)eah->DataAdrs;
//	ActWork[actno].char_num = ActWork[actno].oamData.CharNo;

	return actno;
}

//----------------------------------------------------------
//	ExtAnmを使用しているｱｸﾀｰをDelする
//----------------------------------------------------------
void ExtDelActor(actWork *Xreg)
{
	actAnmData TempTransTbl ={		//AddActorした時に確保した領域を開放するため
		0, 	CharByteSizeTbl[Xreg->oamData.Shape][Xreg->oamData.Size]//一時的にﾃｰﾌﾞﾙを作成
	};
	
	Xreg->anm_trans = &TempTransTbl;
	DelActor(Xreg);
}

//----------------------------------------------------------
//	アニメテーブルを変更
//----------------------------------------------------------
void ExtAnmChg(actWork *xreg, u8 anmNo)
{
	xreg->anm_no = anmNo;
	xreg->anm_wait = 0;
	xreg->anm_offs = 0;
}

