/********************************************************************/
/*			oam_act.c												*/
/*				  OAM関連ﾒｲﾝ										*/
/********************************************************************/
#include "common.h"
#include "actor.h"
#include "actanm.h"
#include  "cell_bitchk.h"

#include "d_matsu.h"
#include "print.h"


//----------------------------------------------------------
//	定数定義
//---------------------------------------------------------
#define H_OUT	(240+64)			// 画面外座標
#define V_OUT	(160)
#define CHARNO_MAX	1024			// ｷｬﾗｸﾀｰﾅﾝﾊﾞｰ(ｷｬﾗｸﾀｰﾈｰﾑ)ﾏｯｸｽ値
#define TRANS_MAX	64
#define PRI_DEBUG	1				// ﾌﾟﾗｲｵﾘﾃｨﾃﾞﾊﾞｯｸﾞ

/*==================================================================*/
/*						ｸﾞﾛｰﾊﾞﾙ変数指定 							*/
/*==================================================================*/
actWork		ActWork[ACT_BUF_MAX] = {};
u16			ActSortPriTbl[ACT_MAX] = {0};
u8	 		ActSortTbl[ACT_MAX];	// ｱｸﾀｰｿｰﾄ用ﾜｰｸ
u8			SetActorFlag;			// ｱｸﾀｰOAMｾｯﾄﾌﾗｸﾞ
u8			DMAtransCount;			// DMA転送用ｶｳﾝﾀ
dmaTransTbl DMAtransTbl[TRANS_MAX];	// DMA転送用ﾃｰﾌﾞﾙ
u8			OamWriteEd;				// 使用するOAMの範囲を限定する(0～OamWriteEd(MAX:128))
u16 		ObjDataTransSt;			// OBJｷｬﾗｸﾀﾃﾞｰﾀのVRAM転送開始位置を指定(ｷｬﾗｸﾀｰNoで)
u8			TransAreaFlag[128];		// 転送空き領域ﾁｪｯｸﾌﾗｸﾞ群(1024bit)
s16 		ActOX;					// ｸﾞﾛｰﾊﾞﾙｱｸﾀｰ補正X
s16 		ActOY;					// ｸﾞﾛｰﾊﾞﾙｱｸﾀｰ補正Y
ObjAffineDestData OBJ_AffineWork[32];

//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
void affineWorkinit(void);
void actOAMinit(u8 start, u8 end);
void SetActor(void);
void actOAMtrans(void);
void actDMAtrans(void);
void InitActor(void);
void JumpActor(void);
void SetActor(void);
u8 AddActor(const actHeader* headAdrs, s16 posX, s16 posY, u8 pri);
void DelActor(actWork *);
void actCenterCalc(actWork *,u8 shape, u8 size, u8 affine_mode );

u8 TransBitChkSet(u16 num,u8 mode);
s16 TransAreaFlagChk(u16 size);	
void dmaTransInit(void);

#if PRI_DEBUG
static void SetPriority( void );
#endif

static void SortProc(void);
static void OamProc(void);
static void AffineProc(void);

void dmaTransSet(u16 pat,u16 charno, const actAnmData *);	//,u8 mode);
void SetCoordinates(void);

const ActOamData DummyActOam;
const actAnm* const DummyActAnmTbl[];
const actAffAnm * const DummyActAffTbl[];
void DummyActMove(actWork *actst);

void InitActWork(void);
static u8 AddActorSub(u8 actno, const actHeader* headAdrs, s16 posX, s16 posY, u8 pri);

//----------------------------------------------------------
//	Dma転送ﾘｸｴｽﾄｵｰﾊﾞｰ時のｴﾗｰﾒｯｾｰｼﾞ
//----------------------------------------------------------
static const u8 dma_over_msg[] = {D__,M__,A__,spc_,O__,V__,E__,R__,CR_,
	D__,M__,A__,te_,n_,so_,u_,CR_,RI_,KU_,E_,SU_,TO_,TE_,bou_,BU_,RU_,ga_,CR_,
	O_,bou_,BA_,bou_,si_,ma_,si_,ta_,EOM_};


/*==================================================================*/
/*			ｱｸﾀｰ関係全初期化										*/
/*==================================================================*/
void InitActor(void)
{
//	ActWork = (actWork*)ACTOR_WORK_AREA;	// 外部ﾜｰｸｴﾘｱを割り当て

	actOAMinit( 0, 128 );					//ｼｽﾃﾑOAMｸﾘｱ
	InitActWork();

	dmaTransInit();							//DMA転送ﾃｰﾌﾞﾙ 初期化

	AffineWorkManInit();					// 拡縮ﾜｰｸ, ﾏﾈｰｼﾞｬ初期化
	CellManAllInit();						// ｾﾙﾏﾈｰｼﾞｬ初期化

	OamWriteEd = 64;						//使用OAM範囲限定(0～OamWriteEd(MAX:128))
	ObjDataTransSt = 0;						//OBJｷｬﾗｸﾀﾃﾞｰﾀVRAM転送開始位置指定(ｷｬﾗｸﾀNo)
	TransAreaFlagChk(0);					//転送空き領域ﾁｪｯｸﾌﾗｸﾞ(1024bit)
	ActOX = 0;								// 全ｱｸﾀ修正座標 X
	ActOY = 0;								// 全ｱｸﾀ修正座標 Y
}

/*==================================================================*/
/*						ｱｸﾀｰ処理									*/
/*==================================================================*/
void JumpActor( void )
{
	u8 num;
	actWork *act;

	for( num = 0; num < ACT_MAX; num++ )
	{
		act = &ActWork[num];

		if( act->act_sw )
		{
			act->move( act );
			
			if( act->act_sw )
			{
				ActAnm( act );
			}
		}
	}
}

//----------------------------------------------------------
//	アクターセット
//----------------------------------------------------------
void SetActor(void)
{
	u8 temp;

	SetCoordinates();				//add 01/03/14

#if PRI_DEBUG
	SetPriority();
#endif

	SortProc();						//ｱｸﾀｰﾌﾟﾗｲｵﾘﾃｨｿｰﾄ

	temp = sys.OAMTransFlag;		//add 01/04/16

	sys.OAMTransFlag = 1; 			//OAM転送 不許可
	OamProc();
	AffineProc();

#if 0
	sys.OAMTransFlag = 0; 			// OAM転送 許可
#else
	sys.OAMTransFlag = temp;		// 01/04/16
#endif

	SetActorFlag = 1;				// OAM ｾｯﾄ完了
}

//----------------------------------------------------------
//	OAMﾊﾞｯﾌｧに座標をセット
//----------------------------------------------------------
void SetCoordinates( void )
{
	u8 i;
	actWork *act;

	for( i = 0; i < ACT_MAX; i++ )
	{
		act = &ActWork[i];						// ｿｰﾄﾃｰﾌﾞﾙ

		if( act->act_sw && act->banish == 0 )	// 稼動 & 消去ﾌﾗｸﾞ
		{
			if( act->scr )						// ｽｸﾛｰﾙ依存
			{
				act->oamData.HPos = act->x + act->dx + act->cx + ActOX;
				act->oamData.VPos = act->y + act->dy + act->cy + ActOY;
			}
			else
			{									// ｽｸﾛｰﾙ依存無し
				act->oamData.HPos = act->x + act->dx + act->cx;
				act->oamData.VPos = act->y + act->dy + act->cy;
			}
		}
	}
}

//----------------------------------------------------------
//	ﾌﾟﾗｲｵﾘﾃｨｾｯﾄ
//----------------------------------------------------------
#if PRI_DEBUG
static void SetPriority( void )
{
	u16 i,pri;

	for( i = 0; i < ACT_MAX; i++ )
	{
		pri = ActWork[i].pri;
		pri |= ActWork[i].oamData.Priority << 8;
		ActSortPriTbl[i] = pri;
	}
}
#endif

/*==================================================================*/
/*						ﾌﾟﾗｲｵﾘﾃｨｰ処理								*/
/*==================================================================*/
static void SortProc( void )
{
	u8 i,j,dmy;
	u16 pri0,pri1;
	s16 y0,y1;
	actWork *act0,*act1;

	for( i = 1; i < ACT_MAX; i++ )
	{
		j = i;

		act0 = &ActWork[ActSortTbl[j-1]];
		act1 = &ActWork[ActSortTbl[j]];
		pri0 = ActSortPriTbl[ActSortTbl[j-1]];
		pri1 = ActSortPriTbl[ActSortTbl[j]];
		y0 = act0->oamData.VPos;
		y1 = act1->oamData.VPos;

		if( y0 >= 160 )										// 表示画面外
		{
			y0 -= 256;
		}

		if( y1 >= 160 )
		{
			y1 -= 256;
		}

		if( act0->oamData.AffineMode == 3 &&				// 拡大回り込み
			act0->oamData.Size == 3 &&
			(act0->oamData.Shape == 0 || act0->oamData.Shape == 2) &&
			y0 > 128 )
		{
			y0 -= 256;
		}

		if( act1->oamData.AffineMode == 3 &&
			act1->oamData.Size == 3 &&
			(act1->oamData.Shape == 0 || act1->oamData.Shape == 2) &&
			y1 > 128 )
		{
			y1 -= 256;
		}

		while( j >= 1 && ((pri0 > pri1) || (pri0 == pri1 && y0 < y1)) )
		{
			dmy = ActSortTbl[j];
			ActSortTbl[j] = ActSortTbl[j-1];
			ActSortTbl[j-1] = dmy;

			j--;
		
			act0 = &ActWork[ActSortTbl[j-1]];
			act1 = &ActWork[ActSortTbl[j]];
			pri0 = ActSortPriTbl[ActSortTbl[j-1]];
			pri1 = ActSortPriTbl[ActSortTbl[j]];
			y0 = act0->oamData.VPos;
			y1 = act1->oamData.VPos;

			if( y0 >= 160 )
			{
				y0 -= 256;
			}

			if( y1 >= 160 )
			{
				y1 -= 256;
			}

			if( act0->oamData.AffineMode == 3 &&
				act0->oamData.Size == 3 &&
				(act0->oamData.Shape == 0 || act0->oamData.Shape == 2) &&
				y0 > 128 )
			{
				y0 -= 256;
			}

			if( act1->oamData.AffineMode == 3 &&
				act1->oamData.Size == 3 &&
				(act1->oamData.Shape == 0 || act1->oamData.Shape == 2) &&
				y1 > 128 )
			{
				y1 -= 256;
			}
		}
	}
}

//----
#if 0
//----
static void SortProc(void)
{
	u8 i, j, t;
	u8 pri1, pri2;
	s16 y1, y2;

	for(i = 1; i < ACT_MAX; i++)
	{
		j = i;

		//-------------ｿｰﾄﾃﾞｰﾀ取得----------------------//
		pri1 = ActWork[ActSortTbl[j-1]].pri;
		pri2 = ActWork[ActSortTbl[j]].pri;
		y1	 = ActWork[ActSortTbl[j-1]].oamData.VPos;
		y2	 = ActWork[ActSortTbl[j]].oamData.VPos;

		// 画面上部、回り込み表示時の対処
		if(y1 > 159)
			y1 -= 256;
		if(y2 > 159)
			y2 -= 256;
		
		if(ActWork[ActSortTbl[j-1]].oamData.AffineMode == 3 && 
			ActWork[ActSortTbl[j-1]].oamData.Size == 3 &&
			(ActWork[ActSortTbl[j-1]].oamData.Shape == 0 ||
			ActWork[ActSortTbl[j-1]].oamData.Shape == 2) &&
			y1 > 128)
		{
			y1 -= 256;
		}
		
		if(ActWork[ActSortTbl[j]].oamData.AffineMode == 3 && 
			ActWork[ActSortTbl[j]].oamData.Size == 3 &&
			(ActWork[ActSortTbl[j]].oamData.Shape == 0 ||
			ActWork[ActSortTbl[j]].oamData.Shape == 2) &&
			y2 > 128)
		{
			y2 -= 256;
		}
		//------------ﾃﾞｰﾀ取得END-----------------------//

		while(j >= 1 && //(PriCheck(pri1, pri2, y1, y2)))	//a[j-1] > a[j])
				((pri1 > pri2) || (pri1 == pri2 && y1 < y2)))
		{
			t = ActSortTbl[j];
			ActSortTbl[j] = ActSortTbl[j-1];
			ActSortTbl[j-1] = t;
			j--;
			
			//-------------ｿｰﾄﾃﾞｰﾀ取得----------------------//
			pri1 = ActWork[ActSortTbl[j-1]].pri;
			pri2 = ActWork[ActSortTbl[j]].pri;
			y1	 = ActWork[ActSortTbl[j-1]].oamData.VPos;
			y2	 = ActWork[ActSortTbl[j]].oamData.VPos;

			// 画面上部、回り込み表示時の対処
			if(y1 > 159)
				y1 -= 256;
			if(y2 > 159)
				y2 -= 256;
			
			if(ActWork[ActSortTbl[j-1]].oamData.AffineMode == 3 && 
				ActWork[ActSortTbl[j-1]].oamData.Size == 3 &&
				(ActWork[ActSortTbl[j-1]].oamData.Shape == 0 ||
				ActWork[ActSortTbl[j-1]].oamData.Shape == 2) &&
				y1 > 128)
			{
				y1 -= 256;
			}
			
			if(ActWork[ActSortTbl[j]].oamData.AffineMode == 3 && 
				ActWork[ActSortTbl[j]].oamData.Size == 3 &&
				(ActWork[ActSortTbl[j]].oamData.Shape == 0 ||
				ActWork[ActSortTbl[j]].oamData.Shape == 2) &&
				y2 > 128)
			{
				y2 -= 256;
			}
			//------------ﾃﾞｰﾀ取得END-----------------------//
		}
	}
}
//----
#endif
//----

/*==================================================================*/
/*						拡大縮小回転ﾃﾞｰﾀ設定処理					*/
/*==================================================================*/
static void AffineProc(void)
{
	u8 i;
	
	for(i = 0; i < 32; i++)
	{
		sys.OAMbuf[(i << 2) + 0].AffineParam = OBJ_AffineWork[i].H_DiffX;
		sys.OAMbuf[(i << 2) + 1].AffineParam = OBJ_AffineWork[i].V_DiffX;
		sys.OAMbuf[(i << 2) + 2].AffineParam = OBJ_AffineWork[i].H_DiffY;
		sys.OAMbuf[(i << 2) + 3].AffineParam = OBJ_AffineWork[i].V_DiffY;
	}
}

/*==================================================================*/
/*						OAM設定処理 								*/
/*==================================================================*/
static void OamProc(void)
{
	u8	i,use;
	actWork	*act;

	for( i = 0, use = 0; i < ACT_MAX; i++ )
	{
		act = &(ActWork[ActSortTbl[i]]);
		
		if( act->act_sw && act->banish == 0 )
		{
			if( ActOamSet( act, &use ) )
			{
				return;
			}
		}
	}
	
	for( ; use < OamWriteEd; use++ )				// 初期化
	{
		sys.OAMbuf[use] = DummyActOam;
	}
}


/*==================================================================*/
/*						ｱｸﾀｰ追加									*/
//	戻り値: ｾｯﾄしたActWorkの配列番号 ※ｴﾗｰ時はACT_MAX
// 引数 : headAdrs:ｱｸﾀｰﾍｯﾀﾞｰｱﾄﾞﾚｽ
//        posX,posY:初期座標   pri:ｱｸﾀｰ同士のﾌﾟﾗｲｵﾘﾃｨ(OAMと関係なし)
/*==================================================================*/
const u8 ActSizeTbl[2][3][4];

u8 AddActor( const actHeader* headAdrs, s16 posX, s16 posY, u8 pri )
{
	u8 i, pos;

	for( i = 0; i < ACT_MAX; i++ )
	{
		if( ActWork[i].act_sw == 0 )				// 稼動ﾌﾗｸﾞ
		{
			pos = AddActorSub( i, headAdrs, posX, posY, pri );
			return( pos );							// ｱｸﾀｰﾜｰｸ追加ﾅﾝﾊﾞ
		}
	}

	return( ACT_MAX );								// ｾｯﾄ不可
}

//----------------------------------------------------------
//	ｱｸﾀｰﾜｰｸの空きを後ろから調べて、ｾｯﾄする
//----------------------------------------------------------
u8 AddActorBottom(const actHeader* headAdrs, s16 posX, s16 posY, u8 pri)
{
	s16 i;
	u8  pos;

	for( i = ACT_MAX-1; i > -1; i-- )
	{
		if( ActWork[i].act_sw == 0 )				// ｱｸﾀｰ稼動ﾁｪｯｸ
		{
			pos = AddActorSub( i, headAdrs, posX, posY, pri );
#if 0
			ActWork[i].move(&(ActWork[i]));			// 動作関数実行
			
			if( ActWork[i].act_sw )
			{
				ActAnm( &(ActWork[i]) );
			}
#endif
			return( pos );							// ｱｸﾀｰﾜｰｸ追加ﾅﾝﾊﾞｰ
		}
	}

	return( ACT_MAX	);								// ｾｯﾄ不可
}

//----------------------------------------------------------
//	ﾀﾞﾐｰｱｸﾀｰ登録
//	In:		move		; ｱｸﾀｰ動作関数
//----------------------------------------------------------
u8 AddDummyActor( void (*move)(actWork*) )
{
	u8 i;
	
	i = AddActor( &DummyActHeader, 0, 0, 31 );
	
	if( i == ACT_MAX )
	{
		return( i );
	}
	
	ActWork[i].banish = 1;
	ActWork[i].move = move;

	return( i );
}

//----------------------------------------------------------
//	ｱｸﾀｰﾜｰｸｾｯﾄｻﾌﾞ
//----------------------------------------------------------
static u8 AddActorSub(u8 actno, const actHeader* headAdrs, s16 posX, s16 posY, u8 pri)
{
	u8 size;
	s16 Vpos;
	actWork* act;

	act = &ActWork[actno];
	
	actWorkInit( act );

	act->act_sw  = 1;								// 稼動ﾌﾗｸﾞｾｯﾄ
	act->anm_sw  = 1;								// ｱﾆﾒ変更ﾌﾗｸﾞｾｯﾄ
	act->affine_sw = 1;								// 拡縮ｱﾆﾒﾌﾗｸﾞｾｯﾄ
	act->t_mode = 1;								// ﾊﾟﾀｰﾝ
	act->pri = pri;
	act->oamData = *(headAdrs->oamData_p);
	act->anm_tbl = headAdrs->anmData_p;
	act->aff_tbl = headAdrs->affData_p;
	act->actHead = headAdrs;
	act->move    = headAdrs->moveData_p;
	act->x = posX;
	act->y = posY;
	
	actCenterCalc( act, act->oamData.Shape,
						act->oamData.Size, act->oamData.AffineMode);

	if( headAdrs->cellNo == ACT_TMODE )				// ACT_TMODE = ｷｬﾗ転送型
	{
		act->anm_trans = headAdrs->anmTrans_p;		// ｱﾆﾒﾄﾗﾝｽﾃﾞｰﾀ
		size = (u8)(act->anm_trans[0].size >> 5);	// 転送ｻｲｽﾞ
		Vpos = TransAreaFlagChk( size );			// size分ｱﾄﾞﾚｽ(先頭ｷｬﾗｸﾀｰﾈｰﾑ)取得

		if( Vpos == -1 )
		{
			actWorkInit( act );						// 初期化
			return( ACT_MAX );						// ERROR
		}

		act->oamData.CharNo = Vpos;					// ｱｸﾀｰｷｬﾗｸﾀｰﾅﾝﾊﾞｰ
		act->t_mode = 0;							// 転送型
		act->char_num = 0;
	}
	else											// ﾊﾟﾀｰﾝ非転送型
	{
		act->char_num = CellCharNumGet( headAdrs->cellNo );
		ActCharNumSet( act );						// ﾏﾈｰｼﾞｬ, ｷｬﾗﾅﾝﾊﾞｾｯﾄ
	}

	if( (act->oamData.AffineMode & 0x01) )			// 拡縮 ON
	{
		AffineNumSet( act );						// ｱﾌｨﾝﾏﾈｰｼﾞｬ
	}

	if( headAdrs->palNo != ACT_OAMPAL )				// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬによるｾｯﾄ
	{
		act->oamData.Pltt = ObjPalNumGet( headAdrs->palNo );
	}

	return actno;									// ｱｸﾀｰﾜｰｸ追加ﾅﾝﾊﾞｰ
}

//----------------------------------------------------------
//	AddActorした瞬間に動作関数が実行されます
//----------------------------------------------------------
u8 AddActorJump(const actHeader* headAdrs, s16 posX, s16 posY, u8 pri)
{
	u8 i, pos;

	for( i = 0; i < ACT_MAX; i++ )
	{
		if( ActWork[i].act_sw == 0 )				// ｱｸﾀｰ稼動ﾁｪｯｸ
		{
			pos = AddActorSub(i, headAdrs, posX, posY, pri);
			
			if( pos == ACT_MAX )
			{
				return( pos );
			}

			ActWork[i].move( &(ActWork[i]) );		//動作関数実行

			if( ActWork[i].act_sw )
			{
				ActAnm( &(ActWork[i]) );
			}
			
			return( pos );
		}
	}

	return( ACT_MAX	);								// ｾｯﾄ不可
}

//----------------------------------------------------------
//	転送サイズ(ｷｬﾗｸﾀﾈｰﾑ)
//----------------------------------------------------------
const u8 ActSizeTbl[2][3][4] =
{
	{								// 16
		{
			1,
			4,
			16,
			64,
		},
		{
			2,
			4,
			8,
			32,
		},
		{
			2,
			4,
			8,
			32,
		},
	},
	{								// 256
		{
			1,
			4,
			16,
			64,
		},
		{
			2,
			4,
			8,
			32,
		},
		{
			2,
			4,
			8,
			32,
		},
	},
};

/*==================================================================*/
/*						ｱｸﾀｰ削除									*/
/*==================================================================*/
void DelActor( actWork *act )
{
	u16 i,size;
	
	if( act->act_sw == 0 )
	{
		return;
	}

	if( act->t_mode == 0 )				// 転送型
	{
		size = (act->anm_trans[0].size >> 5) + act->oamData.CharNo;

		for( i = act->oamData.CharNo; i < size; i++ )
		{
//			TransBitChkSet( i, 0 );						// ｷｬﾗを転送位置ﾌﾗｸﾞﾘｾｯﾄ
			TRANS_BIT_CLEAR(i);
		}
	}

	actWorkInit( act );
}

/*==================================================================*/
/*						OAMbuf初期化　								*/
/*==================================================================*/
void actOAMinit(u8 start, u8 end)
{
	u8 i;
	
	for( i = start; i < end; i++ )
	{
		*((SysOamData *)(&(sys.OAMbuf[i]))) = *((SysOamData *)(&DummyActOam));
	}
}

/*==================================================================*/
/*						OAMへの転送(VBLANK) 						*/
/*==================================================================*/
void actOAMtrans(void)
{
	if( sys.OAMTransFlag == 0 )
	{
#if DMA_CPU_SELECT
		DIV_DMAARRAYCOPY(3, sys.OAMbuf, OAM, 32);		//OAM転送
#else
		CpuArrayCopy(sys.OAMbuf, OAM, 32);			//OAM転送
#endif	
	}
}

/*==================================================================*/
/*						ｷｬﾗｸﾀｰﾃﾞｰﾀ転送ﾃｰﾌﾞﾙ初期化					*/
/*==================================================================*/
void dmaTransInit(void)
{
	u8 i;

	SetActorFlag = 0;
	DMAtransCount = 0;

	for( i = 0 ; i < TRANS_MAX; i++ )
	{
		DMAtransTbl[i].dat = 0;
		DMAtransTbl[i].dest = 0;
		DMAtransTbl[i].size = 0;
	}
}

/*==================================================================*/
/*						拡大縮小ﾜｰｸ初期化　　					   */
/*==================================================================*/
void affineWorkinit(void)
{
	u8 i;
	
	for(i = 0; i < 32; i++)
	{
		OBJ_AffineWork[i].H_DiffX = 0x100;
		OBJ_AffineWork[i].V_DiffX = 0x000;
		OBJ_AffineWork[i].H_DiffY = 0x000;
		OBJ_AffineWork[i].V_DiffY = 0x100;
	}
}

/*==================================================================*/
/*						拡大縮小ﾜｰｸ設定  　　						*/
/*==================================================================*/
void affineWorkSet(u8 num,u16 H_X,u16 V_X,u16 H_Y,u16 V_Y)
{
	OBJ_AffineWork[num].H_DiffX = H_X;
	OBJ_AffineWork[num].V_DiffX = V_X;
	OBJ_AffineWork[num].H_DiffY = H_Y;
	OBJ_AffineWork[num].V_DiffY = V_Y;
}

//----------------------------------------------------------
//	アクターワーク初期化
// 引数 : act = 初期化 ｱｸﾀｰｱﾄﾞﾚｽ
//----------------------------------------------------------
#if 1
void actWorkInit( actWork *act )
{
	*act = DummyActWork;
}
#else
void actWorkInit( actWork *act )
{
	act->oamData 	= DummyActOam;	  			// OAM基本ﾃﾞｰﾀ
	act->anm_tbl 	= DummyActAnmTbl;			// ACTOR構成ﾊﾟﾀｰﾝﾃｰﾌﾞﾙｱﾄﾞﾚｽ
	act->anm_trans  = ACT_NTRANS;				// ｱﾆﾒﾄﾗﾝｽﾃﾞｰﾀ
	act->aff_tbl	= DummyActAffTbl;			// ｱﾌｨﾝｱﾆﾒﾃｰﾌﾞﾙ
	act->actHead = &DummyActHeader;				// add 01/04/26
	
	act->move = DummyActMove;					// 動作関数
	act->x	   	= H_OUT;						// X座標
	act->y	   	= V_OUT;//160;					// Y座標
	act->dx	   	= 0;							// X座標+α
	act->dy	   	= 0;							// Y座標+α
	act->cx	   	= 0;							// X座標+中心座標取得用補正
	act->cy	   	= 0;							// Y座標+中心座標取得用補正
	act->anm_no  	= 0;						// ANMﾅﾝﾊﾞｰ
	act->anm_offs	= 0; 						// ANMｵﾌｾｯﾄ
	act->anm_wait	= 0;						// ANMｳｪｲﾄ

	act->anm_pause = 0;							// ｱﾆﾒﾎﾟｰｽﾞ(1:ON)
	act->aff_pause = 0;							// ｱﾌｨﾝｱﾆﾒﾎﾟｰｽﾞ(1:ON)
	act->anm_count = 0;							// ｱﾆﾒﾙｰﾌﾟｶｳﾝﾄ

	act->work[0] 	= 0;						// ﾜｰｸ
	act->work[1] 	= 0;
	act->work[2] 	= 0;
	act->work[3] 	= 0;
	act->work[4] 	= 0;
	act->work[5] 	= 0;
	act->work[6] 	= 0;
	act->work[7] 	= 0;

	act->Hflip	= 0;							// 横反転ﾌﾗｸﾞ(1:反転)
	act->Vflip	= 0;							// 縦反転ﾌﾗｸﾞ(1:反転)
	act->scr	= 0;							// BGｽｸﾛｰﾙ依存ﾌﾗｸﾞ(1:依存)
	act->banish	= 1;							// ｽﾌﾟﾗｲﾄ表示ﾌﾗｸﾞ(1:OFF)
	act->anm_sw	= 0;							// ｱﾆﾒ変更ﾌﾗｸﾞ
	act->anmend_sw= 0;							// ｱﾆﾒ終了ﾌﾗｸﾞ(1:終了)
	act->affend_sw= 0;							// ｱﾌｨﾝｱﾆﾒ終了ﾌﾗｸﾞ(1:終了)
	act->t_mode	= 0;							// CGX転送ﾌﾗｸﾞ(0:転送 1:ﾊﾟﾀｰﾝ)
	act->act_sw	= 0;							// ｱｸﾀｰ稼動ﾌﾗｸﾞ(1:ON)
	
	act->affine_sw = 0;							// ｱﾌｨﾝｱﾆﾒｽｲｯﾁ
	act->char_num = 0;							// ｷｬﾗﾅﾝﾊﾞｵﾌｾｯﾄ

	act->oamPat = NOT_OAMPAT;					// ﾊﾟｯﾄﾃｰﾌﾞﾙ
	act->oampat_no = 0;							// ﾊﾟｯﾄﾅﾝﾊﾞ
	act->oampat_sw = OAMPAT_OFF;				// ﾊﾟｯﾄｽｲｯﾁ
	
	act->feature_flg = 0;						//add by matsuda 2001.07.03(火)
	
	// ※ﾌﾟﾗｲｵﾘﾃｨｿｰﾄの関係で使用していないｱｸﾀｰはﾌﾟﾗｲｵﾘﾃｨｰを最低にしておくこと
	act->pri	= 15;							// ACTOR同士のﾌﾟﾗｲｵﾘﾃｨｰ(高 0～15 低)
};
#endif

//----------------------------------------------------------
//		中心座標取得用補正 計算
//	SHAPE、SIZE,倍角ﾌﾗｸﾞからX,Y座標を補正する値を取得し、ｾｯﾄする
//引数:	act = 対象となるｱｸﾀｰﾜｰｸ
//		shape = OAM_SHAPE(0～2)
//		mode2 = OAM_SIZE(0～3)
//		mode3 = OAM_Affine(0～3)	※倍角ﾌﾗｸﾞがある2ﾋﾞｯﾄのやつ
//----------------------------------------------------------
static const s8 centerTbl[3][4][2];

void actCenterCalc( actWork *act, u8 shape, u8 size, u8 affine_mode )
{
	s8 cx, cy;
	
	cx = centerTbl[shape][size][0];				// 補正値取得
	cy = centerTbl[shape][size][1];
	
	if( (affine_mode & 2) != 0)
	{
		cx = cx << 1;							// 倍角ﾌﾗｸﾞに合わせて倍補正
		cy = cy << 1;
	}
	
	act->cx = cx;
	act->cy = cy;
}

//----------------------------------------------------------
//	倍角ﾌﾗｸﾞの分もﾃｰﾌﾞﾙに配置するかは保留
//----------------------------------------------------------
static const s8 centerTbl[3][4][2] = 
{
	//shape 0
	{	//X補正 Y補正
		{-4, -4},		//size 0
		{-8, -8},		//size 1
		{-16, -16},	//size 2
		{-32, -32},	//size 3
	},
	//shape 1
	{
		{-8, -4},
		{-16, -4},
		{-16, -8},
		{-32, -16},
	},
	//shape 2
	{
		{-4, -8},
		{-4, -16},
		{-8, -16},
		{-16, -32},
	},
};


//----------------------------------------------------------
//	転送空き領域ﾁｪｯｸﾌﾗｸﾞ群 ﾁｪｯｸ (0:初期化)	※size = 0 の場合は全ﾌﾗｸﾞ初期化になる
// 引数 : size = ｷｬﾗｸﾀｰﾈｰﾑ数(ｷｬﾗｸﾀｰﾈｰﾑｻｲｽﾞ)
// 戻り値: 0 = 初期化正常終了  :  -1 = ｴﾗｰ
//		   top_adrs = size分空いている空き領域の先頭ｷｬﾗｸﾀｰﾈｰﾑ
//----------------------------------------------------------
s16 TransAreaFlagChk(u16 size)
{
	u16 i;
	u16 space_count;	//連続して続いている空き領域をｶｳﾝﾄする
	s16 top_adrs;

	if(size == 0)	//size == 0 は初期化
	{
		/*--------------------------------------------------------------
		for(i = 0;i < 128; i++)		//転送空き領域ﾁｪｯｸﾌﾗｸﾞ群(1024bit)
		{
			TransAreaFlag[i] = 0xff;
		}
		--------------------------------------------------------------*/
		for(i = ObjDataTransSt; i < CHARNO_MAX; i++)
		{
//			TransBitChkSet(i,0);
			TRANS_BIT_CLEAR(i);
		}
		return 0;
	}

	top_adrs = 0;
	space_count = 0;
	i = ObjDataTransSt;	//OAM転送開始VRAM領域指定(ｷｬﾗｸﾀｰNo)

	do
	{
		while(TRANS_BIT_CHECK(i)) //先頭空き領域検索
		{
			i++;
			if(i == CHARNO_MAX)
			{
				return -1;	//ERROR 終端まで空き領域がなかった
			}
		}

		space_count = 0;
		top_adrs = (s16)i;		//空き領域 先頭ｱﾄﾞﾚｽ(ｷｬﾗｸﾀｰﾈｰﾑ)を退避

		do	 //先頭空き領域からsize分空いているかﾁｪｯｸ
		{
			space_count++;
			if(space_count == size)
			{
				break;
			}
			
			i++;
			if(i == CHARNO_MAX)
			{
				return -1;	//ERROR Size分の空き領域を満たす前に終端に行き当たってしまった
			}
			
		}while(TRANS_BIT_CHECK(i) == 0);
		
	}while(space_count != size);

	for(i = (u16)top_adrs; i < size + top_adrs; i++)	//ﾋﾞｯﾄをsize分ｾｯﾄ
	{
		TRANS_BIT_SET(i);
	}
	return top_adrs;	//空き領域の先頭ｱﾄﾞﾚｽ(ｷｬﾗｸﾀｰﾈｰﾑ)を戻り値として返す
}

//==================================================================
// 引数 : num:対象ﾋﾞｯﾄ(0～1023)  mode : 0=Clear 1=Set 2=Check
// 戻り値 : mode Clear,Set時 = 0固定
//			mode Check時 = 0:対象ﾋﾞｯﾄは空いてる 0以外:対象ﾋﾞｯﾄはｾｯﾄされてる
//==================================================================
u8 TransBitChkSet(u16 num,u8 mode)
{
	u8 byte, bit, mask, flag;

	byte = num >> 3;								// num / 8
	bit = num & 7;									// num % 8
	flag = 0;

	if( mode == 0 )									// ｸﾘｱ
	{
		mask = (1 << bit) ^ 0xff;
		TransAreaFlag[byte] &= mask;
	}
	else if( mode == 1 )							// ｾｯﾄ
	{
		mask = 1 << bit;
		TransAreaFlag[byte] |= mask;
	}
	else											// ﾁｪｯｸ
	{
		mask = 1 << bit;
		flag = TransAreaFlag[byte] & mask;
	}
	
	return( flag );
}

//----
#if 0												// 旧
//----
u8 TransBitChkSet(u16 num,u8 mode)
{
	u8	by,bt,mask,flg;

	flg = 0;
	by = num / 8;
	bt = num % 8;

	switch(mode)
	{
		case 0:		//ｸﾘｱ
			mask = (1 << bt) ^ 0xff;
			TransAreaFlag[by] &= mask;//転送空き領域ﾁｪｯｸﾌﾗｸﾞ群(1024bit)
			flg = 0;
			break;
			
		case 1:		//ｾｯﾄ
			mask = 1 << bt;
			TransAreaFlag[by] |= mask;
			flg = 0;
			break;
			
		case 2:		//ﾁｪｯｸ
			mask = 1 << bt;
			flg = TransAreaFlag[by] & mask;
			break;
	}
	return flg;
}
//----
#endif
//----

/*==================================================================*/
/*						DUMMY設定									*/
/*==================================================================*/
/*------------------------------------------------------------------*/
/*						ｱｸﾀｰﾜｰｸ										*/
/*------------------------------------------------------------------*/
const actWork DummyActWork =
{
	{
		V_OUT,									// Vﾎﾟｼﾞｼｮﾝ
		0,										// 拡大縮小ﾓｰﾄﾞ設定(OFF)
		0,										// OBJﾓｰﾄﾞ設定(NORMAL)
		0,										// ﾓｻﾞｲｸ設定(OFF)
		0,										// ｶﾗｰﾓｰﾄﾞ設定(16色)
		0,										// OBJ形状設定(正方形)

		H_OUT,									// Hﾎﾟｼﾞｼｮﾝ
		0,										// 拡大縮小ﾊﾟﾗﾒｰﾀﾅﾝﾊﾞ設定 & H,Vﾌﾘｯﾌﾟ
		0,										// OBJサイズ設定(8x8)

		0,										// ｷｬﾗｸﾀｰﾅﾝﾊﾞ
		3,										// 表示ﾌﾟﾗｲｵﾘﾃｨｰ設定(第4優先)
		0,										// ﾊﾟﾚｯﾄﾅﾝﾊﾞ
		0,										// ｱﾌｨﾝﾊﾟﾗﾒﾀ
	},

	DummyActAnmTbl,								// ACTOR構成ﾊﾟﾀｰﾝﾃｰﾌﾞﾙｱﾄﾞﾚｽ
	ACT_NTRANS,									// ｱﾆﾒﾄﾗﾝｽﾃﾞｰﾀ
	DummyActAffTbl,								// ｱﾌｨﾝｱﾆﾒﾃｰﾌﾞﾙ
	&DummyActHeader,							// ｱｸﾀｰﾍｯﾀﾞ
	NOT_OAMPAT,									// OAMﾊﾟｯﾄﾃﾞｰﾀ

	DummyActMove,								// 動作関数
	
	H_OUT,										// X座標
	V_OUT,										// Y座標
	0,											// X座標+α
	0,											// Y座標+α
	0,											// X座標+中心座標取得用補正
	0,											// Y座標+中心座標取得用補正
	0,											// ANMﾅﾝﾊﾞｰ
	0,											// ANMｵﾌｾｯﾄ
	
	0,											// ANMｳｪｲﾄ
	0,											// ｱﾆﾒﾎﾟｰｽﾞ(1:ON)
	0,											// ｱﾌｨﾝｱﾆﾒﾎﾟｰｽﾞ(1:ON)
	0,											// ｱﾆﾒﾙｰﾌﾟｶｳﾝﾄ

	{ 0, 0, 0, 0, 0, 0, 0, 0 },					// ﾜｰｸ

	0,											// ｱｸﾀｰ稼動ﾌﾗｸﾞ(1:ON)
	0,											// BGｽｸﾛｰﾙ依存ﾌﾗｸﾞ(1:依存)
	0,											// ｽﾌﾟﾗｲﾄ表示ﾌﾗｸﾞ(1:OFF)

	0,											// 横反転ﾌﾗｸﾞ(1:反転)
	0,											// 縦反転ﾌﾗｸﾞ(1:反転)
	0,											// ｱﾆﾒ変更ﾌﾗｸﾞ
	0,											// ｱﾌｨﾝｱﾆﾒ変更ﾌﾗｸﾞ
	0,											// ｱﾆﾒ終了ﾌﾗｸﾞ(1:終了)
	0,											// ｱﾌｨﾝｱﾆﾒ終了ﾌﾗｸﾞ(1:終了)
	0,											// CGX転送ﾌﾗｸﾞ(0:転送 1:ﾊﾟﾀｰﾝ)

	0,											// ｱｸﾀｰ操作ﾌﾗｸﾞ
	0,											// ｷｬﾗﾅﾝﾊﾞｵﾌｾｯﾄ

	0,											// ﾊﾟｯﾄﾅﾝﾊﾞ
	OAMPAT_OFF,									// ﾊﾟｯﾄｽｲｯﾁ
	
	0xff										// ﾌﾟﾗｲｵﾘﾃｨ
};

/*------------------------------------------------------------------*/
/*						OAM基本ﾃﾞｰﾀ 								*/
/*------------------------------------------------------------------*/
const ActOamData DummyActOam =
{
	V_OUT,	//Vﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾓｰﾄﾞ設定(OFF)
	0,		//OBJﾓｰﾄﾞ設定(NORMAL)
	0,		//ﾓｻﾞｲｸ設定(OFF)
	0,		//ｶﾗｰﾓｰﾄﾞ設定(16色)
	0,		//OBJ形状設定(正方形)

	H_OUT,	//Hﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾊﾟﾗﾒｰﾀﾅﾝﾊﾞｰ設定 & H,Vﾌﾘｯﾌﾟ
	0,		//OBJサイズ設定(8x8)

	0,		//ｷｬﾗｸﾀｰﾅﾝﾊﾞｰ
	3,		//表示ﾌﾟﾗｲｵﾘﾃｨｰ設定(第4優先)
	0,		//ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ
	0,		//AffineParam	add 01/02/06
};

/*------------------------------------------------------------------*/
/*						ANMﾃﾞｰﾀ 									*/
/*------------------------------------------------------------------*/
static const actAnm DummyActAnm[] = 
{
	{ACT_ANMEND, 0, 0, 0},
};

/*------------------------------------------------------------------*/
/*						ANMﾃｰﾌﾞﾙ									*/
/*------------------------------------------------------------------*/
const actAnm* const DummyActAnmTbl[] = 
{
	DummyActAnm,
};

/*------------------------------------------------------------------*/
/*                      拡縮ﾃﾞｰﾀ                                    */
/*------------------------------------------------------------------*/
static	const actAffAnm DummyActAff[] = {
	{ACT_AFEND, 0, 0, 0 },
};

/*------------------------------------------------------------------*/
/*                      拡縮ﾃｰﾌﾞﾙ                                   */
/*------------------------------------------------------------------*/
const actAffAnm * const DummyActAffTbl[] = {
	DummyActAff
};

/*------------------------------------------------------------------*/
/*						MOVEﾃﾞｰﾀ									*/
/*------------------------------------------------------------------*/
void DummyActMove(actWork *actst)
{
	;
}

const actHeader DummyActHeader = 
{
	0,
	ACT_OAMPAL,
	&DummyActOam,
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	DummyActMove,
};


/*==================================================================*/
/*                      ｷｬﾗｸﾀｰﾃﾞｰﾀ転送(VBLANK)                      */
/*==================================================================*/
void actDMAtrans(void)
{
    u8 i;

	if( SetActorFlag == 0 ) return;

//	for(i=0;i<DMAtransCount;i++)	//←↓change 2001.07.25(水)
	for(i = 0; DMAtransCount > 0; DMAtransCount--,i++)
    {
#if DMA_CPU_SELECT
		DIV_DMACOPY(3,
				DMAtransTbl[i].dat,		//転送元
				DMAtransTbl[i].dest,	//転送先
				DMAtransTbl[i].size,	//サイズ
				16);					//転送ｻｲｽﾞ
#else
		 CpuCopy(DMAtransTbl[i].dat,	//転送元
 	 			  DMAtransTbl[i].dest,	//転送先
  				  DMAtransTbl[i].size,	//サイズ
  	 			  16);					//転送ｻｲｽﾞ
#endif
	}

	SetActorFlag = 0;					// OAMｾｯﾄﾌﾗｸﾞｸﾘｱ
}

/*==================================================================*/
/*                      ｷｬﾗｸﾀｰﾃﾞｰﾀ転送ﾘｸｴｽﾄ設定                     */
/*==================================================================*/
void dmaTransSet(u16 pat,u16 charno, const actAnmData *tbl)	//,u8 mode)
{
	if(DMAtransCount < TRANS_MAX)
	{
		DMAtransTbl[DMAtransCount].dat	= tbl[pat].dat; 		//ｷｬﾗｱﾄﾞﾚｽ取得
	//	DMAtransTbl[DMAtransCount].dest = OBJ_MODE0_VRAM + (charno << 5);	//変更01/04/06
		DMAtransTbl[DMAtransCount].dest = OBJ_MODE0_VRAM + (charno << 5);
		DMAtransTbl[DMAtransCount].size = tbl[pat].size;
		DMAtransCount++;
	}
#ifdef PM_DEBUG
	else
		ErrorMsgPut(dma_over_msg);
#endif
}

//=========================================================================
//	Vﾌﾞﾗﾝｸ中ﾃﾞｰﾀ転送ﾘｸｴｽﾄ			add 4/9 by matsuda
// 引数:datAdr = 転送ﾃﾞｰﾀｱﾄﾞﾚｽ
//      destAdr = 転送先ｱﾄﾞﾚｽ
//      size = 転送ﾊﾞｲﾄ数
//=========================================================================
void DmaTransReq(u8 *datAdr, u32 destAdr, u16 size)
{
	if(DMAtransCount < TRANS_MAX)
	{
		DMAtransTbl[DMAtransCount].dat	= datAdr;
		DMAtransTbl[DMAtransCount].dest = destAdr;
		DMAtransTbl[DMAtransCount].size = size;
		DMAtransCount++;
	}
#ifdef PM_DEBUG
	else
		ErrorMsgPut(dma_over_msg);
#endif
}

//=========================================================================
//	アクターワーク退避
// destAdr = 退避先のRAMｱﾄﾞﾚｽ
//=========================================================================
void PushActor(void *destAdr)
{
	u8 *dest;
	u8 *src;
	u32 i;
	
	dest = destAdr;
	src = (u8 *)&ActWork[0];

	for(i = 0; i < ACTWORK_SIZEOF_OPERA; i++)
	{
		*dest = *src;
		dest++;
		src++;
	}
}
//=========================================================================
//	アクターワーク復帰
// destAdr = PushActorで指定した退避先のｱﾄﾞﾚｽ
//=========================================================================
void PopActor(void *destAdr)
{
	u8 *dest;
	u8 *src;
	u32 i;
	
	dest = destAdr;
	src = (u8 *)&ActWork[0];
	
	for(i = 0; i < ACTWORK_SIZEOF_OPERA; i++)
	{
		*src = *dest;
		dest++;
		src++;
	}
}

//=========================================================================
//	アクターワークのみ初期化
// ※InitActorだとｾﾙﾏﾈｰｼﾞｬｰや拡縮テーブルなども初期化されるので
//   PushActor,Popで使用する場合は、このInitActWorkを使用する
//=========================================================================
void InitActWork(void)
{
	u8 i;
	
	for( i = 0; i < ACT_MAX; i++ )
	{
		actWorkInit( &(ActWork[i]) );
		ActSortTbl[i] = i;					// ｱｸﾀｰｿｰﾄ用ﾜｰｸ 初期化
	}

	actWorkInit( &ActWork[i] );				// ﾜｰｸｵｰﾊﾞｰ用対策ﾊﾞｯﾌｧ ACT_BUF_MAX ｸﾘｱ
}

//=========================================================================
//	セル、パレット、ｱﾌｨﾝﾏﾈｰｼﾞｬｰなどのｱｸﾀｰからの間接削除関数
//=========================================================================
//----------------------------------------------------------
//	CELL削除	※ただし、転送型の場合は何もしない
//----------------------------------------------------------
void CellDelActor(actWork *actst)
{
	if(actst->actHead->cellNo != ACT_TMODE)
		CellDel(actst->actHead->cellNo);
}
//----------------------------------------------------------
//	Palette削除
//----------------------------------------------------------
void PalDelActor(actWork *actst)
{
	ObjPalRegNumDel(actst->actHead->palNo);
}
//----------------------------------------------------------
//	Affineﾏﾈｰｼﾞｬｰ削除
//     ※ただし、OAMの拡縮ﾌﾗｸﾞがONになっていない場合は何もしない
//----------------------------------------------------------
void AffineDelActor(actWork *actst)
{
	if(actst->oamData.AffineMode & 1)
	{
		AffineWorkNumDel(actst->oamData.AffineParamNo);
		actst->oamData.AffineMode = 0;
	}
}

//----------------------------------------------------------
//	ｱｸﾀｰ自身も含めて全て削除
//----------------------------------------------------------
void AllDelActor(actWork *actst)
{
	CellDelActor(actst);
	PalDelActor(actst);
	AffineDelActor(actst);
	DelActor(actst);
}












