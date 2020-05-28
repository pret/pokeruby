//=========================================================================
//	
//	ポケモンずかんサブルーチン
//
//=========================================================================
#include "common.h"
#include "intr.h"
#include "actor.h"
#include "actanm.h"
#include "palanm.h"
#include "task.h"
#include "print.h"
#include "poketool.h"
#include "decord.h"
#include "objdata.h"
#include "menu.h"
#include "window.h"
#include "calctool.h"
#include "monsno.def"
#include "footcell.h"	//足跡データ

#define __ZTOOL_H_GLOBAL__
#include "zukan.h"

extern	const actAffAnm * const PmAffAnmTblF[];
extern const actAnm *const PokeActAnmTbl[];
extern	const actAnm *const *const TRFAnmTbl[];

/********************************************************************/
/********************************************************************/
/*																	*/
/*				図鑑データ取得(バージョン違いがあるため関数化)		*/
/*				図鑑タイプ文字列ポインタ取得						*/
/*              poke_num: 対象ﾎﾟｹﾓﾝﾅﾝﾊﾞｰ       		                */
/********************************************************************/
/********************************************************************/
u8*			ZukanPokeTypeGet(u16 poke_num)
{
	return	(u8*)zukanData[poke_num].typename;
}

u16			ZukanPokeDataGet(u16 poke_num,u8 mode)
{
	switch(mode){

	case ZDATA_TAKASA:
		return	zukanData[poke_num].takasa;
	case ZDATA_OMOSA:
		return	zukanData[poke_num].omosa;
	}
	return	1;
}

/********************************************************************/
/*                                                                  */
/*				図鑑ﾌﾗｸﾞのﾁｪｯｸ										*/
/*              poke_num: 対象ﾎﾟｹﾓﾝﾅﾝﾊﾞｰ       		                */
/*              mode 	: ﾁｪｯｸﾓｰﾄﾞ  			                    */
/*              			Z_SEE_CHK	= 認識ﾁｪｯｸ(0:未確認,1:確認)	*/
/*              			Z_GET_CHK	= 捕獲ﾁｪｯｸ(0:未捕獲,1:捕獲)	*/
/*              			Z_SEE_SET	= 認識ｾｯﾄ					*/
/*              			Z_GET_SET	= 捕獲ｾｯﾄ					*/
/********************************************************************/
s8			ZukanCheck(u16	poke_num,u8	mode)
{
	u8	byte_p,bit_p,mask;
	s8	ret_flg;

	poke_num--;
	byte_p	= poke_num / 8;
	bit_p	= (poke_num % 8);
	mask	= (0x01)<<bit_p;

	ret_flg = 0;

	switch(mode){
	case	Z_SEE_CHK:
		if(MyData.Zukan.zukan_see_flag[byte_p]&mask){
			if(((MyData.Zukan.zukan_see_flag[byte_p]&mask)==(Fld.zukan_see_flag2[byte_p]&mask))
			&&((MyData.Zukan.zukan_see_flag[byte_p]&mask)==(Fld.zukan_see_flag3[byte_p]&mask))){
				ret_flg = 1;
			 }else{
				 //一致していないので強制リセット
				MyData.Zukan.zukan_see_flag[byte_p] &= (mask^0xff);
				Fld.zukan_see_flag2[byte_p]			&= (mask^0xff);
				Fld.zukan_see_flag3[byte_p]			&= (mask^0xff);
				ret_flg = 0;
			 }
		}else{
			ret_flg = 0;
		}
		break;
	case	Z_GET_CHK:
		if(MyData.Zukan.zukan_get_flag[byte_p]&mask){
			if(((MyData.Zukan.zukan_get_flag[byte_p]&mask)
				==(MyData.Zukan.zukan_see_flag[byte_p]&mask))
			&&((MyData.Zukan.zukan_see_flag[byte_p]&mask)==(Fld.zukan_see_flag2[byte_p]&mask))
			&&((MyData.Zukan.zukan_see_flag[byte_p]&mask)==(Fld.zukan_see_flag3[byte_p]&mask))){
				ret_flg = 1;
			 }else{
				 //一致していないので強制リセット
				MyData.Zukan.zukan_get_flag[byte_p] &= (mask^0xff);
				MyData.Zukan.zukan_see_flag[byte_p] &= (mask^0xff);
				Fld.zukan_see_flag2[byte_p]			&= (mask^0xff);
				Fld.zukan_see_flag3[byte_p]			&= (mask^0xff);
				ret_flg = 0;
			 }
		}else{
			ret_flg = 0;
		}
		break;
	case	Z_SEE_SET:
		MyData.Zukan.zukan_see_flag[byte_p] |= mask;
		Fld.zukan_see_flag2[byte_p]			|= mask;
		Fld.zukan_see_flag3[byte_p]			|= mask;
		break;
	case	Z_GET_SET:
		MyData.Zukan.zukan_get_flag[byte_p] |= mask;
		break;
	}
	return ret_flg;
}

/********************************************************************/
/*                                                                  */
/*				図鑑総数のﾁｪｯｸ										*/
/*              mode 	: ﾁｪｯｸﾓｰﾄﾞ  			                    */
/*              			Z_SEE_CHK	= 認識ﾁｪｯｸ(0:未確認,1:確認)	*/
/*              			Z_GET_CHK	= 捕獲ﾁｪｯｸ(0:未捕獲,1:捕獲)	*/
/********************************************************************/
u16			ZukanTotal(u8 mode)
{
	u16	i,total_num;

	total_num = 0;

	for(i=0;i<POKE_NUM_MAX;i++){
		switch(mode){

		case	Z_SEE_CHK:
			if(ZukanCheck(i+1,Z_SEE_CHK)){
				total_num++;
			}
			break;
		case	Z_GET_CHK:
			if(ZukanCheck(i+1,Z_GET_CHK)){
				total_num++;
			}
			break;
		}
	}
	return total_num;
}

u16			ZukanHouenTotal(u8 mode)
{
	u16	i,total_num;

	total_num = 0;

	for(i=0;i<NEW_POKE_NUM_MAX;i++){
		switch(mode){

		case	Z_SEE_CHK:
			if(ZukanCheck(PokeHouenNo2ZukanNoGet(i+1),Z_SEE_CHK)){
				total_num++;
			}
			break;
		case	Z_GET_CHK:
			if(ZukanCheck(PokeHouenNo2ZukanNoGet(i+1),Z_GET_CHK)){
				total_num++;
			}
			break;
		}
	}
	return total_num;
}

u16			ZukanHyousyouCheckHouen(void)
{
	u16	i;

	for(i=0;i<NEW_POKE_NUM_MAX-2;i++){
		if(!(ZukanCheck(PokeHouenNo2ZukanNoGet(i+1),Z_GET_CHK))){
			return 0;
		}
	}
	return 1;
}

u16			ZukanHyousyouCheckZenkoku(void)
{
	u16	i;

	for(i=0;i<150;i++){
		if(!(ZukanCheck((i+1),Z_GET_CHK))){
			return 0;
		}
	}
	for(i=152;i<250;i++){
		if(!(ZukanCheck((i+1),Z_GET_CHK))){
			return 0;
		}
	}
	for(i=252;i<POKE_NUM_MAX-2;i++){
		if(!(ZukanCheck((i+1),Z_GET_CHK))){
			return 0;
		}
	}
	return 1;
}




/********************************************************************/
/*                                                                  */
/*				初期化関連											*/
/*                                                                  */
/********************************************************************/
void	ZukanScreenRegInit(u16 val)
{
	if(!(val & DISP_BG0_ON)){
    	*(vu16 *)REG_DISPCNT &= (DISP_BG0_ON^0xffff);
    	*(vu16 *)REG_BG0CNT		= 0;
    	*(vu16 *)REG_BG0HOFS	= 0;
    	*(vu16 *)REG_BG0VOFS	= 0; 
	}
	if(!(val & DISP_BG1_ON)){
    	*(vu16 *)REG_DISPCNT &= (DISP_BG1_ON^0xffff);
    	*(vu16 *)REG_BG1CNT		= 0;
    	*(vu16 *)REG_BG1HOFS	= 0;
    	*(vu16 *)REG_BG1VOFS	= 0; 
	}
	if(!(val & DISP_BG2_ON)){
    	*(vu16 *)REG_DISPCNT &= (DISP_BG2_ON^0xffff);
    	*(vu16 *)REG_BG2CNT		= 0;
    	*(vu16 *)REG_BG2HOFS	= 0;
    	*(vu16 *)REG_BG2VOFS	= 0; 
	}
	if(!(val & DISP_BG3_ON)){
    	*(vu16 *)REG_DISPCNT &= (DISP_BG3_ON^0xffff);
    	*(vu16 *)REG_BG3CNT		= 0;
    	*(vu16 *)REG_BG3HOFS	= 0;
    	*(vu16 *)REG_BG3VOFS	= 0; 
	}
	if(!(val & DISP_OBJ_ON)){
    	*(vu16 *)REG_DISPCNT &= (DISP_OBJ_ON^0xffff);
		InitActor();		// ｱｸﾀｰ 初期化
		ObjPalManInit();	// ｵﾌﾞｼﾞｪﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ初期化
		ObjPalManStart = 8;	// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬNo開始
	}
}





/********************************************************************/
/*                                                                  */
/*				表示関連											*/
/*                                                                  */
/********************************************************************/
//ポケモンナンバーの表示
void	ZukanPokeNumPut(u16 pokenum,u8 x,u8 y)
{
	u8	numstr[4];

	numstr[0] = n0_ +(pokenum/100);
	numstr[1] = n0_ +(pokenum%100/10);
	numstr[2] = n0_ +(pokenum%100%10); 
	numstr[3] = EOM_;

	NMenuMsgWrite(numstr,x,y);
}

/*==================================================================*/
u8		ZukanPokeNamePut(u16 pokenum,u8 x,u8 y)
{
	u8	i,numstr[MONS_NAME_SIZE+EOM_SIZE];

	for(i=0;i<MONS_NAME_SIZE+1;i++) numstr[i] = EOM_;

	pokenum = PokeZukanNo2MonsNoGet(pokenum);	//全国→開発ナンバー

	if(pokenum){
		i = 0;
		while((PokeNameData[pokenum][i]!=EOM_)&&(i<MONS_NAME_SIZE)){
			numstr[i] = PokeNameData[pokenum][i];
			i++;
		}
	}else{
		for(i=0;i<5;i++) numstr[i] = bou_;
	}
	NMenuMsgWrite(numstr,x,y);
	return i;
}

/*==================================================================*/
void		ZukanDataTypeNamePut(u8* name,u8 x,u8 y)
{
	u8	i,p,str[ZUKAN_TYPE_SIZE+EOM_SIZE];

	for(i=0;i<ZUKAN_TYPE_SIZE;i++)	str[i] = spc_;
	p = 0;
	while((name[p]!=spc_)&&(p<ZUKAN_TYPE_SIZE)) p++;

	for(i=0;i<p;i++)	str[i+(ZUKAN_TYPE_SIZE-p)] = name[i];
	str[ZUKAN_TYPE_SIZE] = EOM_;

	NMenuMsgWrite(str,x,y);
}

/*==================================================================*/
void		ZukanDataNumPut(u16 num,u8 x,u8 y)
{
	u8	n,str[6],f;

	f = 0;

	n = num/1000;
	if(!n){
		str[0] = spc_;
	}else{
		str[0] = n + n0_;
		f = 1;
	}
	n = (num%1000)/100;
	if((!n)&&(!f)){
		str[1] = spc_;
	}else{
		str[1] = n + n0_;
		f = 1;
	}
	str[2] = (((num%1000)%100)/10) + n0_;
	str[3] = ten_;
	str[4] = (((num%1000)%100)%10) + n0_;
	str[5] = EOM_;

	NMenuMsgWrite(str,x,y);
}

/*==================================================================*/
static	const u8 test_data[] = {
0x00,0x80,0xcc,0xde,0x9e,0x0c,0xe0,0xf8,0x00,0x01,0x33,0x7b,0x79,0x30,0x07,0x1f,
0x38,0x9c,0xfc,0x7c,0xf8,0x78,0xe0,0x00,0x1c,0x39,0x3c,0x3e,0x1f,0x1e,0x07,0x00,
};
//足跡データの転送
void	ZukanPokeFootTrans(u16 pokenum,u16 cgx_num,u16 offs)
{
	u16	i,j,rp,wp;
	u8	rdata,wdata;
	u8	decord_data[0x80];
	u8*	footdata;

	footdata = (u8*)(FootCharAdrs[PokeZukanNo2MonsNoGet(pokenum)]);
	rp = 0;
	wp = 0;

	for(i=0;i<4*8;i++){
		rdata = footdata[i];
		for(j=0;j<4;j++){
			wdata = 0;
			if(rdata&(0x01<<(j*2)))	wdata |= 0x01;
			if(rdata&(0x02<<(j*2))) wdata |= 0x10;
			decord_data[wp] = wdata;
			wp++;
		}
	}
	CpuCopy((void*)decord_data,(void*)(BG_VRAM + cgx_num * 0x4000 + offs * 0x20),0x80,16);
}

/*==================================================================*/
#define	ZFT_PX	(0x19)
#define	ZFT_PY	(0x08)
//足跡データの表示
void	ZukanPokeFootPut(u16 scr_num,u16 chr_num)
{
	*(u16*)(BG_VRAM + scr_num*0x0800 + (ZFT_PY+0)*64 + (ZFT_PX+0)*2) = 0xf000 + chr_num+0;
	*(u16*)(BG_VRAM + scr_num*0x0800 + (ZFT_PY+0)*64 + (ZFT_PX+1)*2) = 0xf000 + chr_num+1;
	*(u16*)(BG_VRAM + scr_num*0x0800 + (ZFT_PY+1)*64 + (ZFT_PX+0)*2) = 0xf000 + chr_num+2;
	*(u16*)(BG_VRAM + scr_num*0x0800 + (ZFT_PY+1)*64 + (ZFT_PX+1)*2) = 0xf000 + chr_num+3;
}




/********************************************************************/
/*                                                                  */
/*				計算関連											*/
/*                                                                  */
/********************************************************************/
u16			Z_NumIncDec(u8 mode,u16 p,u16 min,u16 max)
{
	switch(mode){
	
		case	NUM_DEC:
			if(p > min){
				p--;
			}
			break;
		case	NUM_INC:
			if(p < max){
				p++;
			}
			break;
		case	NUM_DEC_LOOP:
			if(p > min){
				p--;
			}else{
				p = max;
			}
			break;
		case	NUM_INC_LOOP:
			if(p < max){
				p++;
			}else{
				p = min;
			}
			break;
	}
	return p;
}





/********************************************************************/
/*                                                                  */
/*				OBJｾｯﾄ&動作関連										*/
/*                                                                  */
/********************************************************************/
/*==================================================================*/
/*				ﾎﾟｹﾓﾝ												*/
/*==================================================================*/
//	ポケモンアクターデータ
static	const ActOamData ZukanMonsOamData = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	0,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
	3,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	1,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};


/*==================================================================*/
/*==================================================================*/
static	const u32 ZukanDecordAdrs[]={0x2008000,0x200c000,0x2010000,0x2014000};

static	const	actAnmData actAnmTransDataTable1[] =
{
	{(void *)0x2008000+(0x20*64)* 0,0x20*64},{(void *)0x2008000+(0x20*64)* 1,0x20*64},
	{(void *)0x2008000+(0x20*64)* 2,0x20*64},{(void *)0x2008000+(0x20*64)* 3,0x20*64},
	{(void *)0x2008000+(0x20*64)* 4,0x20*64},{(void *)0x2008000+(0x20*64)* 5,0x20*64},
	{(void *)0x2008000+(0x20*64)* 6,0x20*64},{(void *)0x2008000+(0x20*64)* 7,0x20*64},
	{(void *)0x2008000+(0x20*64)* 8,0x20*64},{(void *)0x2008000+(0x20*64)* 9,0x20*64},
	{(void *)0x2008000+(0x20*64)*10,0x20*64},{(void *)0x2008000+(0x20*64)*11,0x20*64},
	{(void *)0x2008000+(0x20*64)*12,0x20*64},{(void *)0x2008000+(0x20*64)*13,0x20*64},
	{(void *)0x2008000+(0x20*64)*14,0x20*64},{(void *)0x2008000+(0x20*64)*15,0x20*64},
};

static	const	actAnmData actAnmTransDataTable2[] =
{
	{(void *)0x200c000+(0x20*64)* 0,0x20*64},{(void *)0x200c000+(0x20*64)* 1,0x20*64},
	{(void *)0x200c000+(0x20*64)* 2,0x20*64},{(void *)0x200c000+(0x20*64)* 3,0x20*64},
	{(void *)0x200c000+(0x20*64)* 4,0x20*64},{(void *)0x200c000+(0x20*64)* 5,0x20*64},
	{(void *)0x200c000+(0x20*64)* 6,0x20*64},{(void *)0x200c000+(0x20*64)* 7,0x20*64},
	{(void *)0x200c000+(0x20*64)* 8,0x20*64},{(void *)0x200c000+(0x20*64)* 9,0x20*64},
	{(void *)0x200c000+(0x20*64)*10,0x20*64},{(void *)0x200c000+(0x20*64)*11,0x20*64},
	{(void *)0x200c000+(0x20*64)*12,0x20*64},{(void *)0x200c000+(0x20*64)*13,0x20*64},
	{(void *)0x200c000+(0x20*64)*14,0x20*64},{(void *)0x200c000+(0x20*64)*15,0x20*64},
};

static	const	actAnmData actAnmTransDataTable3[] =
{
	{(void *)0x2010000+(0x20*64)* 0,0x20*64},{(void *)0x2010000+(0x20*64)* 1,0x20*64},
	{(void *)0x2010000+(0x20*64)* 2,0x20*64},{(void *)0x2010000+(0x20*64)* 3,0x20*64},
	{(void *)0x2010000+(0x20*64)* 4,0x20*64},{(void *)0x2010000+(0x20*64)* 5,0x20*64},
	{(void *)0x2010000+(0x20*64)* 6,0x20*64},{(void *)0x2010000+(0x20*64)* 7,0x20*64},
	{(void *)0x2010000+(0x20*64)* 8,0x20*64},{(void *)0x2010000+(0x20*64)* 9,0x20*64},
	{(void *)0x2010000+(0x20*64)*10,0x20*64},{(void *)0x2010000+(0x20*64)*11,0x20*64},
	{(void *)0x2010000+(0x20*64)*12,0x20*64},{(void *)0x2010000+(0x20*64)*13,0x20*64},
	{(void *)0x2010000+(0x20*64)*14,0x20*64},{(void *)0x2010000+(0x20*64)*15,0x20*64},
};

static	const	actAnmData actAnmTransDataTable4[] =
{
	{(void *)0x2014000+(0x20*64)* 0,0x20*64},{(void *)0x2014000+(0x20*64)* 1,0x20*64},
	{(void *)0x2014000+(0x20*64)* 2,0x20*64},{(void *)0x2014000+(0x20*64)* 3,0x20*64},
	{(void *)0x2014000+(0x20*64)* 4,0x20*64},{(void *)0x2014000+(0x20*64)* 5,0x20*64},
	{(void *)0x2014000+(0x20*64)* 6,0x20*64},{(void *)0x2014000+(0x20*64)* 7,0x20*64},
	{(void *)0x2014000+(0x20*64)* 8,0x20*64},{(void *)0x2014000+(0x20*64)* 9,0x20*64},
	{(void *)0x2014000+(0x20*64)*10,0x20*64},{(void *)0x2014000+(0x20*64)*11,0x20*64},
	{(void *)0x2014000+(0x20*64)*12,0x20*64},{(void *)0x2014000+(0x20*64)*13,0x20*64},
	{(void *)0x2014000+(0x20*64)*14,0x20*64},{(void *)0x2014000+(0x20*64)*15,0x20*64},
};

static	const	actAnmData* const	actAnmTransDataTableMain[] =
{
actAnmTransDataTable1, actAnmTransDataTable2, actAnmTransDataTable3, actAnmTransDataTable4,
};


/*==================================================================*/
//	PokeWait(actWork* aw)
//	アクター動作関数
/*==================================================================*/
static void		PokeWait(actWork* aw)
{
}


/*==================================================================*/
/*==================================================================*/
static	const actHeader ZukanOamHeader = {
	-1,
	0,
	&ZukanMonsOamData,
	0,
	actAnmTransDataTable1,
	DummyActAffTbl,
	PokeWait,
};


/*==================================================================*/
//	ZukanPokeActHeaderMake(u16 monsno,u8 setnum)
//	palID	: パレットＩＤ
//	setnum	: 表示データ格納位置ナンバー 
/*==================================================================*/
static	void	ZukanPokeActHeaderMake(u16 palID,u8 setnum)
{
	PokeActHeader = ZukanOamHeader;
	PokeActHeader.palNo=palID;

	PokeActHeader.anmTrans_p = actAnmTransDataTableMain[setnum];
	PokeActHeader.anmData_p = PokeActAnmTbl;
}


/*==================================================================*/
//	ZukanTrainerActHeaderMake(u16 trainerNo,u8 setnum)
//	palID	: パレットＩＤ
//	setnum	: 表示データ格納位置ナンバー 
/*==================================================================*/
static	void	ZukanTrainerActHeaderMake(u16 palID,u8 setnum)
{
	PokeActHeader = ZukanOamHeader;
	PokeActHeader.palNo=palID;

	PokeActHeader.anmTrans_p = actAnmTransDataTableMain[setnum];
	PokeActHeader.anmData_p = TRFAnmTbl[0];
}


/*==================================================================*/
/*==================================================================*/
u16			ZukanPokeActorSet(u16 pokenum,s16 x,s16 y,u16 decord_p)
{
	u8	actnum;

	pokenum = PokeZukanNo2MonsNoGet(pokenum);		//全国→開発ナンバー

	switch(pokenum){
	default:
		DecordPokeCellMake( &PM2FObjDataCell[pokenum],
							pm2fpara[pokenum].size,pm2fpara[pokenum].patcnt,
							(void *)0x2000000,(void *)ZukanDecordAdrs[decord_p],
							pokenum);
		break;
	case MONSNO_PATTIIRU:
		DecordPokeCellMakeRndFB( &PM2FObjDataCell[pokenum],
							pm2fpara[pokenum].size,pm2fpara[pokenum].patcnt,
							(void *)0x2000000,(void *)ZukanDecordAdrs[decord_p],
							pokenum,MyData.Zukan.PachiRand,POKE_FRONT);
		break;
	case MONSNO_ANNOON:
		DecordPokeCellMakeRndFB( &PM2FObjDataCell[pokenum],
							pm2fpara[pokenum].size,pm2fpara[pokenum].patcnt,
							(void *)0x2000000,(void *)ZukanDecordAdrs[decord_p],
							pokenum,MyData.Zukan.UnknownRand,POKE_FRONT);
		break;
	}
	DecordPaletteWork( (void*)PM2NObjDataPal[pokenum].pal_data,PA_OBJ0+(decord_p*16),0x20 );

	ZukanPokeActHeaderMake( decord_p,decord_p );
	actnum = AddActor( &PokeActHeader, x, y, 0 );
	ActWork[actnum].oamData.Pltt = decord_p;
	return actnum;
}

/*==================================================================*/
/*==================================================================*/
u16			ZukanTrainerActorSet(u16 trainernum,s16 x,s16 y,u16 decord_p)
{
	u8	actnum;

	DecordPokeCellMake( &TRFObjDataCell[trainernum],
						trfpara[trainernum].size,
						trfpara[trainernum].patcnt,
						(void *)0x2000000,
						(void *)ZukanDecordAdrs[0],
						trainernum);

	//モノトーン（別パレット）なのでいらない
//	DecordPalSet( (PalData*)&PM2NObjDataPal[pokenum] );

	ZukanTrainerActHeaderMake(trainernum,0);
	actnum = AddActor( &PokeActHeader, x, y, 0 );
	ActWork[actnum].oamData.Pltt = decord_p;
	return actnum;
}














