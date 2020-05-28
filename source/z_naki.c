//=========================================================================
//	
//	ポケモンずかん（鳴き声画面）
//	波形表示などの処理
//
//=========================================================================
#include "common.h"
#include "intr.h"
#include "task.h"
#include "palanm.h"
#include "actor.h"
#include "actanm.h"
#include "calctool.h"
#include "madefine.h"
#include "z_naki.h"
#include "decord.h"
#include "mus_tool.h"

#include "vu_meter.dat"
#include "hakei.dat"

extern	SoundArea m4a_sound;
extern	s8		DmaCount;
//extern	void	VoicePlay( u16 no, s8 pan );
//extern	u8		VoicePlayWait( void );
extern	u8		VoiceEndCheck2( void );
extern	void	VoicePlayStop2( void );

u8 HakeiInit( HakeiSet* hs, u8 bg_num );
void HakeiMain( u8 bg_num );
void HakeiStart( u16 pokemon_no);
static void HakeiVoiceStart( u16 pokemon_no );
static void HakeiAddrGet( void );
static void HakeiScroll( u8 bg_num );
static void HakeiZeroPut( void );
static void PutHakeiBuffer( u8 x_point, u8 vol );
static void HakeiDmaTrans( void );

static void HakeiScrSet( u8 bg_num,s16 val,u8 mode );
#define SCRSET_X		(0)	
#define SCRSET_Y		(1)	

#define SIZE_Y			(7)			//波形表示の縦サイズ
#define SCROLL_SPEED	(2)
#define HYOUJI			(2)			//何キャラ分の単位で波形を表示するか
#define VOL_DIV			( ( ( 255 / ( SIZE_Y * 8 ) ) + 0.5 ) * 0x100 )

u8	ZNakiInitSeq;

//波形処理用ワーク
typedef struct {
	u8	hakei_buf[ HYOUJI * 8 ];
	u8	v_play;
	u8	scroll;
	u8	before_vol;
	u16	hakei_chr_addr;
	u8	hakei_size_x;
	u16	poke_no;
	u8	play_timer;
	u8	start_wait;
}ZN_HAKEI_WORK;
static ZN_HAKEI_WORK * const hw = ( ZN_HAKEI_WORK* ) ( UserWork + 0x1c000 );

/*----------------------------------------------------------*/
/*	キャラクタ、パレットデータ								*/
/*----------------------------------------------------------*/
static const u16 hakei_Palette[16]={
//水～白
	0x0000,0x4800,0x4200,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x7e52,0x7e73,0x7eb5,0x7ef7,0x7f39,0x7f7b,0x7fbd,0x7fff,
//緑～黄～赤
//	0x0000,0x4800,0x4200,0x0000,0x0000,0x0000,0x0000,0x0000,
//	0x03e0,0x03ea,0x03f4,0x03ff,0x035f,0x023f,0x011f,0x001f,
//緑～白
//	0x0000,0x4800,0x4200,0x0000,0x0000,0x0000,0x0000,0x0000,
//	0x7fff,0x6bfa,0x5bf6,0x47f1,0x37ed,0x23e8,0x13e4,0x03e0,
};

static const u8 hakei_Character[32]={
	0x11,0x11,0x11,0x11,0x22,0x22,0x22,0x22,
	0x11,0x11,0x11,0x11,0x22,0x22,0x22,0x22,
	0x11,0x11,0x11,0x11,0x22,0x22,0x22,0x22,
	0x11,0x11,0x11,0x11,0x22,0x22,0x22,0x22,
};

/*----------------------------------------------------------*/
/*		波形の初期処理										*/
/*----------------------------------------------------------*/
/* 返り値 --> 0…初期化中									*/
/*            1…初期化終了									*/
/*----------------------------------------------------------*/
u8 HakeiInit( HakeiSet* hs, u8 bg_num )
{
	u8	i;
	u8	x, y;
	u16	chr;
	u16	scr_addr;
	u8	init_end;

	init_end = 0;
	switch( ZNakiInitSeq ){
		case 0:
			hw->hakei_chr_addr = hs->ChrAddr;
			hw->hakei_size_x = hs->XSize;
			hw->play_timer = 0;
			hw->start_wait = 0;
/*
			*(vu16 *)REG_BG3CNT = BG_COLOR_16						//16色選択
				| BG_SCREEN_SIZE_0									//スクリーンサイズ
				| BG_PRIORITY_3										//BG優先順位
				| ( hs->ScrBlock << BG_SCREEN_BASE_SHIFT )			//スクリーンベースブロック
				| ( hs->ChrAddr / 0x4000 ) << BG_CHAR_BASE_SHIFT ;	//キャラクタベースブロック
*/
			hw->v_play = 0;
			hw->before_vol = ( 0x7f << 8 ) / VOL_DIV;
			hw->scroll = 0;
//			*(vu16 *)REG_BG3VOFS = hs->YOffs * -8;
			HakeiScrSet(bg_num,hs->YOffs * -8,SCRSET_Y);

			scr_addr = hs->ScrBlock * 0x800;
			for( y = 0; y < SIZE_Y; y++ ){
				for( x = 0; x < 32; x++ ){
					DmaCopy( 3,
							 hakei_Character,
							 UserWork + ( ( y * 32 + x ) * 0x20 ),
							 0x20, 16 );
				}
			}

			ZNakiInitSeq++;
			break;
		case 1:
			scr_addr = hs->ScrBlock * 0x800;
			chr = ( hs->PalNo << 12 ) + ( ( hs->ChrAddr % 0x4000 ) / 0x20 );
			for( y = 0; y < SIZE_Y; y++ ){
				for( x = 0; x < 32; x++ )
					*(vu16*)( BG_VRAM + scr_addr + ( y * 0x40 + x * 2 ) ) = chr++;
			}

			for( i = 0; i < hw->hakei_size_x * 8; i++ )
				PutHakeiBuffer( i, 0 );

			ZNakiInitSeq++;
			break;
		case 2:
			HakeiDmaTrans();
			PaletteWorkSet( hakei_Palette, ( hs->PalNo * 16 ), 0x20 );		//波形カラー転送

			init_end = 1;
			break;
	}

	return init_end;
}

/*----------------------------------------------------------*/
/*		波形のメイン処理									*/
/*----------------------------------------------------------*/
void HakeiMain( u8 bg_num )
{
	u8	j;

	HakeiDmaTrans();
	HakeiScroll(bg_num);

	if( hw->start_wait )
		hw->start_wait--;

	if( hw->play_timer ){
		hw->play_timer--;
		if( hw->play_timer == 0 ){
			HakeiVoiceStart( hw->poke_no );
			HakeiZeroPut();
			return;
		}
	}

	if( hw->v_play == 0 ){
		HakeiZeroPut();
		return;
	}

	if( hw->v_play == 1 ){
		HakeiAddrGet();
	}else{
		if( hw->v_play > HYOUJI*4 ){
			//if( VoicePlayWait() == 1 ){
			if( VoiceEndCheck2() == 0 ){
				HakeiZeroPut();				//終了
				hw->v_play = 0;
				return;
			}else{
				HakeiAddrGet();				//ループ
				hw->v_play = 1;
			}
		}
	}

	//波形を表示
	j = ( hw->v_play - 1 ) * 2;
	PutHakeiBuffer( hw->scroll+hw->hakei_size_x*8-2, hw->hakei_buf[ j+0 ] );
	PutHakeiBuffer( hw->scroll+hw->hakei_size_x*8-1, hw->hakei_buf[ j+1 ] );

	hw->v_play++;
}

/*----------------------------------------------------------*/
/*		Ａボタンが押されたときの処理						*/
/*----------------------------------------------------------*/
void HakeiStart( u16 pokemon_no )
{
	if( !( m4a_mplay000.stat & MUSICPLAYER_STATUS_PAUSE ) )
		return;
	if( hw->play_timer )
		return;
	if( hw->start_wait )
		return;
	hw->start_wait = 4;		//連続再生を防ぐため

//	if( VoicePlayWait() == FALSE ){
	if( VoiceEndCheck2() == 1 ){
		VoicePlayStop2();
		hw->poke_no = pokemon_no;
		hw->play_timer = 2;
	}else
		HakeiVoiceStart( pokemon_no );
}

/*----------------------------------------------------------*/
static void HakeiVoiceStart( u16 pokemon_no )
{
//	VoicePlay( pokemon_no, 0 );
	VoicePlay2( pokemon_no, 0, 125, 10 );
	hw->v_play = 1;
}

/*----------------------------------------------------------*/
/*		波形データ取得										*/
/*----------------------------------------------------------*/
static void HakeiAddrGet( void )
{
	s8	*rp;					//右チャンネル用ポインタ
	s8	*lp;					//左チャンネル用ポインタ
	u8	i;

	//波形バッファのアドレス取得
	if( DmaCount <= 1 )
		rp = m4a_sound.pcmbuf;
	else
		rp = m4a_sound.pcmbuf + m4a_sound.r3[0] * ( m4a_sound.r2[1] + 1 - DmaCount );
	lp = rp + PCM_DMA_BUF;

	//波形をバッファにコピー
	for( i = 0; i < HYOUJI*8; i++ )
		hw->hakei_buf[i] = lp[i*2] *2;		//i*2、*2、は要調整
}

/*----------------------------------------------------------*/
/*		無音の時の波形を描く								*/
/*----------------------------------------------------------*/
static void HakeiZeroPut( void )
{
	PutHakeiBuffer( hw->scroll+hw->hakei_size_x*8-2, 0 );
	PutHakeiBuffer( hw->scroll+hw->hakei_size_x*8-1, 0 );
}

/*----------------------------------------------------------*/
/*		波形スクロール										*/
/*----------------------------------------------------------*/
static void HakeiScroll( u8 bg_num )
{
	u8	 y;
	u16	offs;

//	*(vu16 *)REG_BG3HOFS = hw->scroll;
	HakeiScrSet(bg_num,hw->scroll,SCRSET_X);
	hw->scroll += SCROLL_SPEED;

	//消去
	offs = ( ( hw->scroll / 8 ) + hw->hakei_size_x + 1 ) % 32;
	for( y = 0; y < SIZE_Y; y++ ){
		DmaCopy( 3,
				 hakei_Character,
				 UserWork + ( ( y * 32 + offs ) * 0x20 ),
				 0x20, 16 );
	}
}

/*----------------------------------------------------------*/
/*		波形を描く											*/
/*----------------------------------------------------------*/
static const u8 dot_data[2] = { 0xf0, 0x0f };
static const u8 color_data[2][16] = {
	{ 0x0f, 0x0e, 0x0d, 0x0c, 0x0b, 0x0a, 0x09, 0x08,
	  0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f },
	{ 0xf0, 0xe0, 0xd0, 0xc0, 0xb0, 0xa0, 0x90, 0x80,
	  0x80, 0x90, 0xa0, 0xb0, 0xc0, 0xd0, 0xe0, 0xf0 },
};
static void PutHakeiBuffer( u8 x_point, u8 vol )
{
	u8	vol_bak;
	u8	dot;
	u16	offs;

	vol = vol + 0x7f;
	vol = ( vol << 8 ) / VOL_DIV;
	if( vol > ( SIZE_Y*8-1 ) )
		vol = ( SIZE_Y*8-1 );
	vol_bak = vol;

	dot = x_point & 1;
	if( vol > hw->before_vol ){
		while( vol > hw->before_vol ){
			offs = HakeiChrOffset[ x_point % 8 ][ vol ] + ( ( x_point / 8 ) * 0x20 );
			UserWork[ offs ] &= dot_data[ dot ];
			UserWork[ offs ] |= color_data[ dot ][ ( ( vol / ((SIZE_Y*8)/15)) - 1 ) & 0x0f ];
			vol--;
		}
	}else{
		do{
			offs = HakeiChrOffset[ x_point % 8 ][ vol ] + ( ( x_point / 8 ) * 0x20 );
			UserWork[ offs ] &= dot_data[ dot ];
			UserWork[ offs ] |= color_data[ dot ][ ( ( vol / ((SIZE_Y*8)/15)) - 1 ) & 0x0f ];
			vol++;
		}while( vol < hw->before_vol );
	}
	hw->before_vol = vol_bak;
}

/*----------------------------------------------------------*/
/*			波形キャラクタ転送								*/
/*----------------------------------------------------------*/
static void HakeiDmaTrans( void )
{
	DmaCopy( 3,
			UserWork,
			( BG_VRAM + hw->hakei_chr_addr ),
			( 32 * SIZE_Y * 0x20 ),
			16 );
}

/*----------------------------------------------------------*/
/*			スクロールレジスタ設定							*/
/*----------------------------------------------------------*/
static void HakeiScrSet( u8 bg_num,s16 val,u8 mode )
{
	switch(bg_num){
	case 0:
		if(mode)	*(vu16 *)REG_BG0VOFS = val;
		else		*(vu16 *)REG_BG0HOFS = val;
		break;
	case 1:
		if(mode)	*(vu16 *)REG_BG1VOFS = val;
		else		*(vu16 *)REG_BG1HOFS = val;
		break;
	case 2:
		if(mode)	*(vu16 *)REG_BG2VOFS = val;
		else		*(vu16 *)REG_BG2HOFS = val;
		break;
	case 3:
		if(mode)	*(vu16 *)REG_BG3VOFS = val;
		else		*(vu16 *)REG_BG3HOFS = val;
		break;
	}
}


//=========================================================================
//			VUメーターの処理
//=========================================================================
//#include "vu_meter.dat"

extern void affineWorkSet(u8 num,u16 H_X,u16 V_X,u16 H_Y,u16 V_Y);

#define	CELLID_OBJ		(0x2000)
#define	PALID_OBJ		(0x2000)

#define HARI_LENGTH		( 8*( 6 /2) )	// 6 が針のキャラ数（これを変える）
#define HARI_ZERO		( 0x20 )		// ボリュームがゼロの時の針の角度
#define HARI_SPEED		( 5 )			// 針が動く早さ
#define VU_VOL_HOSEI	( 0x0d0 )		// ボリュームを何倍にするか(0x100=1.0)
//#define VU_SIZE_X		( 8 )
//#define VU_SIZE_Y		( 7 )
#define VU_SIZE_X		( 10 )
#define VU_SIZE_Y		( 8 )

u8 VuMeterInit( MeterSet* ms,u8 bg_num );
void VuMeterEnd( void );
static void HariActMoveSub( s8 vol );

static const actHeader HariActHeader;
static const CellData ObjCell[];
static const PalData ObjPal[];
//static const u16 hari_Palette[16];
//static const u8 hari_Character[2048];

//メーター処理用ワーク
typedef struct {
	s8	vu_now_theta;
	s8	vu_new_theta;
	u8	vu_speed;
	u16	vu_act;
}ZN_METER_WORK;
static ZN_METER_WORK * const mw = ( ZN_METER_WORK* )( UserWork + 0x1c800 );

/*----------------------------------------------------------*/
/*			メーターの初期処理								*/
/*----------------------------------------------------------*/
/* 返り値 --> 0…初期化中									*/
/*            1…初期化終了									*/
/*----------------------------------------------------------*/
u8 VuMeterInit( MeterSet* ms,u8 bg_num )
{
	u8	x, y;
	u32	scr_addr;
	u16	chr_offset;
	u8	init_end;

	init_end = 0;
	switch( ZNakiInitSeq ){
		case 0:
//			DmaArrayCopy( 3, meter2_Character, ( BG_VRAM + ms->ChrAddr ), 16 );
//			PaletteWorkSet( meter_Palette, ( ms->PalNo * 16 ), 0x20 );
			LZ77UnCompVram((void*)vumeter_LZ,(void*)(BG_VRAM + ms->ChrAddr));
			PaletteWorkSet( vumeter_Palette, ( ms->PalNo * 16 ), 0x20 );

			ZNakiInitSeq++;
			break;
		case 1:
			scr_addr = BG_VRAM + ( ms->ScrBlock * 0x0800 );
			chr_offset = ( ms->ChrAddr % 0x4000 ) / 0x20;
			for( y = 0; y < VU_SIZE_Y; y++ ){
				for( x = 0; x < VU_SIZE_X; x++ ){
					*(vu16*)( scr_addr + ( ( y+ms->YPos )*0x40 + ( x+ms->XPos )*2 ) )
					= ( meter_Map[ y*VU_SIZE_X+x ] | ( ms->PalNo<<12 ) ) + chr_offset;
				}
			}

			ZNakiInitSeq++;
			break;
		case 2:
			CellSets( (CellData*)ObjCell );
			ObjPalSets( (PalData*)ObjPal );

			mw->vu_act = AddActor( &HariActHeader,
//									( ms->XPos*8 )+32, ( ms->YPos*8 )+(VU_SIZE_Y*4)+24,
									( ms->XPos*8 )+32+8, ( ms->YPos*8 )+(VU_SIZE_Y*4)+24,
									1 );

			mw->vu_now_theta = HARI_ZERO;
			mw->vu_new_theta = HARI_ZERO;
			mw->vu_speed = 0;

			init_end = 1;
			break;
	}

	return init_end;
}

/*----------------------------------------------------------*/
/*			メーターの終了処理								*/
/*----------------------------------------------------------*/
void VuMeterEnd( void )
{
	ObjPalRegNumDel( ObjPalNumIdGet(ActWork[mw->vu_act].oamData.Pltt) );
	DelActor( &ActWork[ mw->vu_act ] );
}

/*----------------------------------------------------------*/
/*----------------------------------------------------------*/
static void	HariActMove( actWork* aw )
{
	ObjAffineSrcData	src;
	ObjAffineDestData	dest;
	s16	sin, cos;
	u16	i;
	s8	vol;

	ActWork[mw->vu_act].oamData.AffineMode = 1;
	ActWork[mw->vu_act].oamData.AffineParam = 0;
	switch( hw->v_play ){
		case 0:
			mw->vu_new_theta = HARI_ZERO;
			if( mw->vu_now_theta > ( HARI_ZERO-0x20 ) ){
				if( mw->vu_speed != 1 )
					mw->vu_speed -= 1;
			}else
				mw->vu_speed = HARI_SPEED;
			break;
		case 2:
			vol = 0;
			for( i = 0; i < HYOUJI*8; i++ ){
				if( vol < hw->hakei_buf[i] )
					vol = hw->hakei_buf[i];
			}
			vol = vol * VU_VOL_HOSEI / 0x100;
			HariActMoveSub( vol );
			break;
		case 6:
			vol = hw->hakei_buf[ (hw->v_play-1)*2 ] * VU_VOL_HOSEI / 0x100;
			HariActMoveSub( vol );
			break;
		default:
			break;
	}

	if( mw->vu_now_theta != mw->vu_new_theta ){
		if( mw->vu_now_theta < mw->vu_new_theta ){
			mw->vu_now_theta += mw->vu_speed;
			if( mw->vu_now_theta > mw->vu_new_theta ){
				mw->vu_now_theta = mw->vu_new_theta;
				mw->vu_new_theta = 0;
			}
		}else{
			mw->vu_now_theta -= mw->vu_speed;
			if( mw->vu_now_theta < mw->vu_new_theta ){
				mw->vu_now_theta = mw->vu_new_theta;
				mw->vu_new_theta = 0;
			}
		}
	}

	//----- OBJ拡大縮小パラメータセット -----//

	src.RatioX = 0x100;
	src.RatioY = 0x100;
	src.Theta = mw->vu_now_theta * 0x100;

	ObjAffineSet( &src, &dest, 1, 2 );
	affineWorkSet( 0, dest.H_DiffX, dest.V_DiffX, dest.H_DiffY,	dest.V_DiffY );

	sin = _Sin( ( mw->vu_now_theta + 0x7f ) & 0xff );
	cos = _Cos( ( mw->vu_now_theta + 0x7f ) & 0xff );
	aw->dx = sin * HARI_LENGTH / 0x100;
	aw->dy = cos * HARI_LENGTH / 0x100;
}

/*----------------------------------------------------------*/
static void HariActMoveSub( s8 vol )
{
	u16	theta;

	theta = ( HARI_ZERO - vol ) & 0xff;
	if( ( theta > HARI_ZERO ) && ( theta < ( 0xc0 + (0x40-HARI_ZERO) ) ) )
		theta = 0xc0 + (0x40-HARI_ZERO);
	mw->vu_new_theta = theta;
	mw->vu_speed = HARI_SPEED;
}

/*----------------------------------------------------------*/
/*----------------------------------------------------------*/
static const actAnm HariAnm[] = {{0,30,0,0},{ACT_ANMEND,0,0,0}};
static const actAnm* const HariAnmTbl[]={ HariAnm };

static const ActOamData HariOam = {
	160,	//Vﾎﾟｼﾞｼｮﾝ
	1,  	//拡大縮小ﾓｰﾄﾞ設定(ON)
	0,      //OBJﾓｰﾄﾞ設定(ノマール)
	0,		//ﾓｻﾞｲｸ設定(OFF)
	0,		//ｶﾗｰﾓｰﾄﾞ設定(16色)
	0,		//OBJ形状設定(正方形)

	0,		//Hﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾊﾟﾗﾒｰﾀﾅﾝﾊﾞｰ設定
	3,		//OBJサイズ設定(64dot)

	0x0,	//ｷｬﾗｸﾀｰﾅﾝﾊﾞｰ
	1,		//表示ﾌﾟﾗｲｵﾘﾃｨｰ設定(第2優先)
	0,		//ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ

	0,		//拡大縮小ﾊﾟﾗﾒｰﾀ
};

static const actHeader HariActHeader = {
	CELLID_OBJ,		//ｾﾙﾅﾝﾊﾞｰ(0xffffの場合はｷｬﾗ転送型)
	PALID_OBJ,		//ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ登録ﾅﾝﾊﾞ
	&HariOam,
	HariAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	HariActMove,
};


/*----------------------------------------------------------*/
static const CellData ObjCell[] = {
//	{ hari_Character, OBJ_SIZE16_64x64*1, CELLID_OBJ },
	{ vumeter2_Character, OBJ_SIZE16_64x64*1, CELLID_OBJ },
	{ CELL_END, 0, 0 }
};
static const PalData ObjPal[] = {
//	{ hari_Palette, PALID_OBJ },
	{ vumeter2_Palette, PALID_OBJ },
	{ OBJPAL_END, 0 },
};

