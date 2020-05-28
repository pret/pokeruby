//=========================================================================
//
//		ポケモンアイコン
//														by matsuda
//=========================================================================

#include "common.h"
#include "actor.h"
#include "actanm.h"
#include "pokeicon.h"
#include "extanm.h"
#include "madefine.h"
#include "decord.h"
#include "monsno.def"
#include "pm2fenum.h"

//=========================================================================
//	定数
//=========================================================================
#define ICON_PAL_MAX	6

//ﾃﾞﾊﾞｯｸ用
#define NEW_POKE		1		//0:いっぱいｱｲｺﾝがあるやつ、 1:ﾃｽﾄ更新用

#if (NEW_POKE == 0)
	#define POKE_GRA_MAX 40		//用意されているポケモンの絵
#else
	#define POKE_GRA_MAX 15
#endif

#define HATENA_ICON_NO	260		//「？」ｱｲｺﾝのﾃｰﾌﾞﾙNo

//=========================================================================
//	プロトタイプ宣言
//=========================================================================
void PokeIconDmmyMove(actWork *Xreg);
//static u8 PokeGraAruNasiCheck(u16 pokeno);
u32 GetPokeIconCharAdrs(u16 pokeno, u32 rnd);
u16 GetAnnoonNo(u32 personal_rnd);
void PokeIconPaletteDel(u16 chrid);
void PokeIconPaletteSetCharID(u16 chrid);
u8 PokeIconSetCharID(u16 chrid, pActFunc move, s16 x, s16 y, u8 pri);

//=========================================================================
//	データ
//=========================================================================
//-- New 2002.04.25(木) --//
#include "..\scaddata\p_icon.acl"

#include "pokeicon.dat"

const PalData PokeIconPalData[] = 
{
/*
#if (NEW_POKE == 0)
	{&pokeicon_Palette[16*0], PALID_POKEICON_0},
	{&pokeicon_Palette[16*1], PALID_POKEICON_1},
	{&pokeicon_Palette[16*2], PALID_POKEICON_2},
	{&pokeicon_Palette[16*3], PALID_POKEICON_3},
	{&pokeicon_Palette[16*4], PALID_POKEICON_4},
	{&pokeicon_Palette[16*5], PALID_POKEICON_5},
#else
	{&p_icon_1_Palette[16*0], PALID_POKEICON_0},
	{&p_icon_1_Palette[16*1], PALID_POKEICON_1},
	{&p_icon_1_Palette[16*2], PALID_POKEICON_2},
	{&p_icon_1_Palette[16*3], PALID_POKEICON_3},
	{&p_icon_1_Palette[16*4], PALID_POKEICON_4},
	{&p_icon_1_Palette[16*5], PALID_POKEICON_5},
#endif
*/
	{&p_icon_Palette[16*0],	PALID_POKEICON_0},
	{&p_icon_Palette[16*1],	PALID_POKEICON_1},
	{&p_icon_Palette[16*2],	PALID_POKEICON_2},
	{&p_icon_Palette[16*3],	PALID_POKEICON_3},
	{&p_icon_Palette[16*4],	PALID_POKEICON_4},
	{&p_icon_Palette[16*5],	PALID_POKEICON_5},
};

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
static const ActOamData PokeIconOamDat = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	0,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
	2,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	1,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
static const actAnm PokeIcon_anm0[] =	//HP満タン
{
	{0, 6, 0, 0},		//ｱﾆﾒﾊﾟﾀｰﾝ、 ｳｪｲﾄ、Hflip、Vflip
	{1, 6, 0, 0},		//ｱﾆﾒﾊﾟﾀｰﾝ、 ｳｪｲﾄ、Hflip、Vflip
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm PokeIcon_anm1[] =	//緑ｹﾞｰｼﾞ
{
	{0, 8, 0, 0},		//ｱﾆﾒﾊﾟﾀｰﾝ、 ｳｪｲﾄ、Hflip、Vflip
	{1, 8, 0, 0},		//ｱﾆﾒﾊﾟﾀｰﾝ、 ｳｪｲﾄ、Hflip、Vflip
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm PokeIcon_anm2[] =	//黄色ｹﾞｰｼﾞ
{
	{0, 14, 0, 0},		//ｱﾆﾒﾊﾟﾀｰﾝ、 ｳｪｲﾄ、Hflip、Vflip
	{1, 14, 0, 0},		//ｱﾆﾒﾊﾟﾀｰﾝ、 ｳｪｲﾄ、Hflip、Vflip
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm PokeIcon_anm3[] =	//赤色ｹﾞｰｼﾞ
{
	{0, 22, 0, 0},		//ｱﾆﾒﾊﾟﾀｰﾝ、 ｳｪｲﾄ、Hflip、Vflip
	{1, 22, 0, 0},		//ｱﾆﾒﾊﾟﾀｰﾝ、 ｳｪｲﾄ、Hflip、Vflip
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm PokeIcon_anm4[] =	//気絶
{
	{0, 29, 0, 0},		//ｱﾆﾒﾊﾟﾀｰﾝ、 ｳｪｲﾄ、Hflip、Vflip
	{0, 29, 0, 0},		//ｱﾆﾒﾊﾟﾀｰﾝ、 ｳｪｲﾄ、Hflip、Vflip
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm * const PokeIconAnmTbl[] = 
{
	PokeIcon_anm0,
	PokeIcon_anm1,
	PokeIcon_anm2,
	PokeIcon_anm3,
	PokeIcon_anm4,
};

//add nohara 01/07/26
static const actAffAnm PokeIcon_aff_anm0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0, 0, 0, 10 },					// 何もしない
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};
static const actAffAnm PokeIcon_aff_anm1[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	//{ -1, -1, 0, 255 },				// 
	{ -2, -2, 0, 122 },					// 小さくなる
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};
static const	actAffAnm * const PokeIcon_aff_tbl[] = {
	PokeIcon_aff_anm0,
	PokeIcon_aff_anm1,
};

//=========================================================================
//	プログラム
//=========================================================================

//----------------------------------------------------------
//	ポケモンのアイコンをセットする
// 引数: pokeno = ｾｯﾄするﾎﾟｹﾓﾝの開発ﾅﾝﾊﾞｰ
// 戻り値: ｾｯﾄしたｱｲｺﾝのactno
//----------------------------------------------------------
u8 PokeIconSet(u16 pokeno, pActFunc move, s16 x, s16 y, u8 pri)
{
	u8 actno;
	ExtActHeader acth = 
	{
		(ActOamData*)&PokeIconOamDat,
	/*
	#if (NEW_POKE == 0)
		(u8 *)&pokeic2_Character[
			(pokeno > POKE_GRA_MAX ? (0) : (pokeno-1)) * OBJ_SIZE16_32x32],
	#else
		(u8 *)&p_icon_1_Character[(pokeno-1) * OBJ_SIZE16_32x32],
	#endif
	*/
		(u8*)IconCharAdrs[pokeno],
		PokeIconAnmTbl,
		//DummyActAffTbl,
		PokeIcon_aff_tbl,	//add nohara 01/07/26
		move,
//		PokeIconPalData[
//			(pokeno > POKE_GRA_MAX ? (1) : (PokeIconPalette[pokeno-1]))].reg_num,
		PALID_POKEICON_0 + IconPalAtr[pokeno],
	};
	
	//-- ﾃﾞﾊﾞｯｸ用 --//
//	if(PokeGraAruNasiCheck(pokeno) == 0)
//		acth.DataAdrs = (void*)quesicon_Character;
	
	actno = ExtAddActor(&acth, x, y, pri);
	ExtAnm(&ActWork[actno]);		//初回のｱﾆﾒ絵転送
	return actno;
}

#if 0
//-- ﾃﾞﾊﾞｯｸ用ルーチン --//
static const u16 AruPokemon[] = 
{1,2,3,6,9,12,15, 0xffff}; 
static u8 PokeGraAruNasiCheck(u16 pokeno)
{
	u16 i;
	
	for(i = 0; ; i++)
	{
		if(AruPokemon[i] == pokeno)
			return 1;
		if(AruPokemon[i] == 0xffff)
			return 0;
	}
}
#endif

//----------------------------------------------------------
//	ポケモンのアイコンをセットする(アンノーン対応ﾊﾞｰｼﾞｮﾝ)
// 引数: pokeno = ｾｯﾄするﾎﾟｹﾓﾝの開発ﾅﾝﾊﾞｰ
// 戻り値: ｾｯﾄしたｱｲｺﾝのactno
//----------------------------------------------------------
u8 PokeIconSet2(u16 pokeno, pActFunc move, s16 x, s16 y, u8 pri, u32 rnd)
{
	u8 actno;
	ExtActHeader acth = 
	{
		(ActOamData*)&PokeIconOamDat,
		(u8*)GetPokeIconCharAdrs(pokeno,rnd),
		PokeIconAnmTbl,
		PokeIcon_aff_tbl,	//add nohara 01/07/26
		move,
		PALID_POKEICON_0 + IconPalAtr[pokeno],
	};

	if(pokeno > MONSNO_END)	//未知のMonsNoﾁｪｯｸ
		acth.pal_id = PALID_POKEICON_0 + 0;	//0番のﾊﾟﾚｯﾄを指定
	
	actno = ExtAddActor(&acth, x, y, pri);
	ExtAnm(&ActWork[actno]);		//初回のｱﾆﾒ絵転送
	return actno;
}

//----------------------------------------------------------
//	ポケモンのアイコンをセットする(アンノーン対応ﾊﾞｰｼﾞｮﾝ)
//	ﾎﾟｹﾓﾝNoではなく、アイコンのｷｬﾗIDを指定してｾｯﾄする
// 引数: chrid = ｾｯﾄするﾎﾟｹﾓﾝｱｲｺﾝのｷｬﾗID
// 戻り値: ｾｯﾄしたｱｲｺﾝのactno
//----------------------------------------------------------
u8 PokeIconSetCharID(u16 chrid, pActFunc move, s16 x, s16 y, u8 pri)
{
	u8 actno;
	ExtActHeader acth = 
	{
		(ActOamData*)&PokeIconOamDat,
		(u8*)IconCharAdrs[chrid],
		PokeIconAnmTbl,
		PokeIcon_aff_tbl,	//add nohara 01/07/26
		move,
		PALID_POKEICON_0 + IconPalAtr[chrid],
	};

	actno = ExtAddActor(&acth, x, y, pri);
	ExtAnm(&ActWork[actno]);		//初回のｱﾆﾒ絵転送
	return actno;
}

//----------------------------------------------------------
//	ポケモンアイコンのｷｬﾗﾃｰﾌﾞﾙの添え字を取得
//----------------------------------------------------------
u16 GetPokeIconCharID(u16 pokeno, u32 rnd)
{
	u16	annon_rnd, adrs_no;
	
	if(pokeno==MONSNO_ANNOON){
		annon_rnd = GetAnnoonNo(rnd);
		if(annon_rnd==0)
			annon_rnd+=CELLID_pm3f_una;
		else
			annon_rnd+=(CELLID_pm3f_unb-1);
		adrs_no = annon_rnd;
	}
	else{
		if(pokeno > MONSNO_END)	//未知のMonsNoﾁｪｯｸ
			adrs_no = HATENA_ICON_NO;	//「？」のキャラ
		else
			adrs_no = pokeno;
	}
	return adrs_no;
}

//-- アンノーンのアルファベット番号を取得 --//
u16 GetAnnoonNo(u32 personal_rnd)
{
	u16 annon_rnd;
	
	annon_rnd=(((personal_rnd&0x03000000)>>18)|((personal_rnd&0x030000)>>12)|((personal_rnd&0x0300)>>6)|(personal_rnd&0x03)) % ANNOON_IDMAX;
	return annon_rnd;
}

//----------------------------------------------------------
//	メールのhold_monsnoをｱｲｺﾝのｷｬﾗIDに変換する(ｱﾝﾉｰﾝ処理込み)
//----------------------------------------------------------
u16 MailHoldMonsNo_IconCharIDConv(u16 hold_monsno)
{
	u16 monsno, annon_id;
	u16 chrid;
	
	monsno = GetMailHoldMonsNo(hold_monsno, &annon_id);
	if(monsno == MONSNO_ANNOON){
		if(annon_id == 0)
			annon_id += CELLID_pm3f_una;
		else
			annon_id += (CELLID_pm3f_unb-1);
		chrid = annon_id;
	}
	else{
		//chrid = hold_monsno;
		chrid = GetPokeIconCharID(hold_monsno, 0);	//ｱﾝﾉｰﾝではないので個性乱数は不要
	}
	return chrid;
}

//----------------------------------------------------------
//	ポケモンｱｲｺﾝのキャラｱﾄﾞﾚｽを取得
//----------------------------------------------------------
u32 GetPokeIconCharAdrs(u16 pokeno, u32 rnd)
{
	u16 chrid;
	
	chrid = GetPokeIconCharID(pokeno, rnd);
	return IconCharAdrs[chrid];
}

//----------------------------------------------------------
//	ポケモンのアイコンのアクターをDelする
//----------------------------------------------------------
void PokeIconDel(actWork *Xreg)
{
	ExtDelActor(Xreg);
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝｱｲｺﾝで使用するﾊﾟﾚｯﾄを全てｾｯﾄ
//----------------------------------------------------------
void PokeIconPaletteAllSet(void)
{
	u8 i;
	
	for(i = 0; i < ICON_PAL_MAX; i++)
		ObjPalSet((PalData*)&PokeIconPalData[i]);
}

//----------------------------------------------------------
//	指定ﾎﾟｹﾓﾝのｱｲｺﾝのﾊﾟﾚｯﾄをｾｯﾄ
// pokeno = 開発ﾅﾝﾊﾞｰ
//----------------------------------------------------------
void PokeIconPaletteSet(u16 pokeno)
{
	u8 tblno;

	if(pokeno > MONSNO_END)	//未知のMonsNoﾁｪｯｸ
		pokeno = HATENA_ICON_NO;	//「？」のキャラ
	
	tblno = IconPalAtr[pokeno];
	if(ObjPalNumGet(PokeIconPalData[tblno].reg_num) == 0xff)	//二重登録ﾁｪｯｸ
		ObjPalSet((PalData*)&PokeIconPalData[tblno]);
}

//----------------------------------------------------------
//	指定ﾎﾟｹﾓﾝのｱｲｺﾝのﾊﾟﾚｯﾄをｾｯﾄ
// chrid = ｱｲｺﾝのｷｬﾗID
//----------------------------------------------------------
void PokeIconPaletteSetCharID(u16 chrid)
{
	u8 tblno;
	
	tblno = IconPalAtr[chrid];
	if(ObjPalNumGet(PokeIconPalData[tblno].reg_num) == 0xff)	//二重登録ﾁｪｯｸ
		ObjPalSet((PalData*)&PokeIconPalData[tblno]);
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝｱｲｺﾝで使用するﾊﾟﾚｯﾄを全てDel
//----------------------------------------------------------
void PokeIconPaletteAllDel(void)
{
	u8 i;
	
	for(i = 0; i < ICON_PAL_MAX; i++)
		ObjPalRegNumDel(PokeIconPalData[i].reg_num);
}

//----------------------------------------------------------
//	指定ﾎﾟｹﾓﾝのｱｲｺﾝのﾊﾟﾚｯﾄをDelする
// pokeno = 開発ﾅﾝﾊﾞｰ
//----------------------------------------------------------
void PokeIconPaletteDel(u16 pokeno)
{
	u8 tblno;

	if(pokeno > MONSNO_END)	//未知のMonsNoﾁｪｯｸ
		pokeno = HATENA_ICON_NO;	//「？」のキャラ

	tblno = IconPalAtr[pokeno];
	ObjPalRegNumDel(PokeIconPalData[tblno].reg_num);
}

//----------------------------------------------------------
//	指定ﾎﾟｹﾓﾝのｱｲｺﾝのﾊﾟﾚｯﾄをDelする
// chrid = ｱｲｺﾝのｷｬﾗID
//----------------------------------------------------------
void PokeIconPaletteDelCharID(u16 chrid)
{
	u8 tblno;
	tblno = IconPalAtr[chrid];
	ObjPalRegNumDel(PokeIconPalData[tblno].reg_num);
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝｱｲｺﾝ用ﾀﾞﾐｰMove関数
//----------------------------------------------------------
void PokeIconDmmyMove(actWork *Xreg)
{
	ExtAnm(Xreg);
}


