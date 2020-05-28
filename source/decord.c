#include "common.h"
#include "actanm.h"
#include "poketool.h"
#include "decord.h"
//#include "pokegra.h"
#include "..\graphic\pokegra.h"		//change 2001.07.04(水) by matsuda
#include "monsno.def"
#include "objdata.h"
#include "bss.h"
#include "client_t.h"
#include "pm2fenum.h"
#include "pm2benum.h"

u8 UserWork[0x20000]={};

//----------------------------------------------------------
//		プロトタイプ宣言
//----------------------------------------------------------

void	DecordWram(void *,void *);
void	DecordVram(void *,void *);
void	DecordCellSet(CellData *);
void	DecordCellSetAdrs(CellData *,void *);
void	DecordPalSet(PalData *);
void	DecordPalSetAdrs(PalData *,void *);
void	DecordPokeCellMake(CellData *,int,int,void *,void *,int);
void	DecordPokeCellMakeBuchi(CellData *,int,int,void *,void *,int,u32);
void	DecordPokeCellMakeRndFB(CellData *,int,int,void *,void *,int,u32,u8);
//void	DecordPokeCellSet(CellData *,int,int);

//----------------------------------------------------------
//		展開->WorkRam
//----------------------------------------------------------

void	DecordWram(void *SrcAdrs,void *DestAdrs)
{
		
		LZ77UnCompWram(SrcAdrs,DestAdrs);
}

//----------------------------------------------------------
//		展開->WorkRam->Vram
//----------------------------------------------------------

void	DecordVram(void *SrcAdrs,void *DestAdrs)
{
		LZ77UnCompVram(SrcAdrs,DestAdrs);
}

//----------------------------------------------------------
//		展開->WorkRam->CellSet
//----------------------------------------------------------

void	DecordCellSet(CellData *cell)
{
	CellData ArcCell;

	LZ77UnCompWram((void *)cell->ch_data,(void *)(0x02000000));

	ArcCell.ch_data=(void *)(0x02000000);
	ArcCell.size=cell->size;
	ArcCell.act_num=cell->act_num;
	CellSet(&ArcCell);
}

void	DecordCellSetAdrs(CellData *cell,void *adrs)
{
	CellData ArcCell;

	LZ77UnCompWram((void *)cell->ch_data,adrs);

	ArcCell.ch_data=adrs;
	ArcCell.size=cell->size;
	ArcCell.act_num=cell->act_num;
	CellSet(&ArcCell);
}

//----------------------------------------------------------
//		展開->WorkRam->PalSet
//----------------------------------------------------------

void	DecordPalSet(PalData *pal)
{
	PalData ArcPal;

	LZ77UnCompWram((void *)pal->pal_data,(void *)(0x02000000));

	ArcPal.pal_data=(void *)(0x02000000);
	ArcPal.reg_num=pal->reg_num;
	ObjPalSet(&ArcPal);
}

void	DecordPalSetAdrs(PalData *pal,void *adrs)
{
	PalData ArcPal;

	LZ77UnCompWram((void *)pal->pal_data,adrs);

	ArcPal.pal_data=adrs;
	ArcPal.reg_num=pal->reg_num;
	ObjPalSet(&ArcPal);
}

//----------------------------------------------------------
//		展開->WorkRam->WorkRam->CellSet(ポケモンデータ）
//----------------------------------------------------------

void	DecordPokeCellMake(CellData *cell,int size,int patcnt,void *adr1,void *adr2,int pokeno)
{
//	int	i,j,k,t;
//	u8	*adr11,*adr22,sita;


#if 1
	if(pokeno>MONSNO_END)
		LZ77UnCompWram((void*)PM2FObjDataCell[0].ch_data,adr2);
	else
		LZ77UnCompWram((void *)cell->ch_data,adr2);
#else
	LZ77UnCompWram((void *)cell->ch_data,adr1);
	adr11=adr1;
	adr22=adr2;
	

	if( (size)&0x01 )	//size % 2    奇数-------------------------
	{
		//下の段の高さ求めるsize3=5 size5=6 size7=7
		sita=(size >> 1)+4;			//size/2

		for(t=0;t<patcnt;t++)	
		{
			//上と下の横一列空白作成（1キャラの半分単位）
			for(j=0;j<8-size;j++)		
			{
				for(k=0;k<8;k++)
				{				
					for(i=0;i<0x10;i++)		//1キャラの半分分
					{
						if( !((j)&0x01) )	//j % 2
						{
							*( adr22+i+(k << 5)+( (j >> 1) << 8 ) )=0;	
							*( adr22+i+((sita << 8)+0x10)+(k << 5)+( (j>>1) << 8 ) )=0;
						}else	
						{
							*( adr22+i+(k << 5)+0x10+( (j >> 1) << 8 ) )=0;	
							*( adr22+i+(sita << 8)+(k << 5)+0x100+( (j >> 1) << 8 ) )=0;
						}
					}
				}
			}


			//縦列空白作成（上みたいにやると文が長いので）
			//横0,1と6,7を縦8キャラ分やる
			for(j=0;j<2;j++)	
			{
				for(i=0;i<8;i++)		
				{				
					for(k=0;k<0x20;k++)	
					{				
						*( adr22+k+(i << 8)+(j << 5) )=0;			
						*( adr22+0xc0+k+(i << 8)+(j << 5) )=0;	
					}
				}
			}

			if( size == 5 )
				adr22+=0x120;		//(0x20*8+0x20)

			for(j=0;j<size;j++)			
			{
				for(k=0;k<size;k++)		
				{				
					for(i=0;i<4;i++)
					{				
						*(adr22+0x12+(i << 2))=*(adr11+(i << 2));
						*(adr22+0x13+(i << 2))=*(adr11+1+(i << 2));

						*(adr22+0x10+0x20+(i << 2))=*(adr11+0x02+(i << 2));
						*(adr22+0x11+0x20+(i << 2))=*(adr11+0x03+(i << 2));

						*(adr22+0x2+0x100+(i << 2))=*(adr11+0x10+(i << 2));
						*(adr22+0x3+0x100+(i << 2))=*(adr11+0x11+(i << 2));

						*(adr22+0x120+(i << 2))=*(adr11+0x12+(i << 2));
						*(adr22+1+0x120+(i << 2))=*(adr11+0x13+(i << 2));
					}		

					adr11+=0x20;
					adr22+=0x20;
				}

				if( size == 7 )
					adr22+=0x20;		//size=7
				else if( size == 5 )
					adr22+=0x60;		//size=5  0x20*3
			}

			//アニメーションするので、sizeによってアドレスを調整
			if( size == 7 )
				adr22+=0x100;			//size=7
			else if( size == 5 )
				adr22+=0x1e0;			//size=5  (0x100*2-0x20)
		}

	}else		//偶数------------------------------------------
	{
		for(i=0;i<patcnt;i++)			
		{
			if( size == 6 )
			{
				for(k=0;k<0x100;k++)		//横一列分 0x20*8
				{				
					*adr22=0;				
					adr22++;
				}
			}

			for(j=0;j<size;j++)			
			{			
				if( size == 6 )		
				{
					for(k=0;k<0x20;k++)
					{
						*adr22=0;
						adr22++;
					}
				}

				for(k=0;k<0x20*size;k++)	
				{				
					*adr22=*adr11;
					adr11++;
					adr22++;
				}

				if( size == 6 )		
				{
					for(k=0;k<0x20;k++)
					{
						*adr22=0;
						adr22++;
					}
				}
			}

			if( size == 6 )				
			{
				for(k=0;k<0x100;k++)	
				{				
					*adr22=0;	
					adr22++;
				}
			}
		}
	}

//	}			//暫定
#endif
}

# if 0
void	DecordPokeCellMakeBuchi(CellData *cell,int size,int patcnt,void *adr1,void *adr2,int pokeno,u32 rnd)
{
//	int	i,j,k,t;
//	u8	*adr11,*adr22,sita;
	u16	annon_rnd;

#if 1
	if(pokeno==MONSNO_ANNOON){
		annon_rnd=(((rnd&0x03000000)>>18)|((rnd&0x030000)>>12)|((rnd&0x0300)>>6)|(rnd&0x03))/10;
		if(annon_rnd==0)
			annon_rnd+=CELLID_pm3f_una;
		else
			annon_rnd+=(CELLID_pm3f_unb-1);
		if(((u32)adr2==DecordAdrs[BSS_CLIENT_MINE])||
		   ((u32)adr2==DecordAdrs[BSS_CLIENT_MINE2]))
			LZ77UnCompWram((void*)PM2BObjDataCell[annon_rnd].ch_data,adr2);
		else
			LZ77UnCompWram((void*)PM2FObjDataCell[annon_rnd].ch_data,adr2);
	}
	else
		LZ77UnCompWram((void *)cell->ch_data,adr2);
#else
	LZ77UnCompWram((void *)cell->ch_data,adr1);

	adr11=adr1;
	adr22=adr2;
	

	if( (size)&0x01 )	//size % 2    奇数-------------------------
	{
		//下の段の高さ求めるsize3=5 size5=6 size7=7
		sita=(size >> 1)+4;			//size/2

		for(t=0;t<patcnt;t++)	
		{
			//上と下の横一列空白作成（1キャラの半分単位）
			for(j=0;j<8-size;j++)		
			{
				for(k=0;k<8;k++)
				{				
					for(i=0;i<0x10;i++)		//1キャラの半分分
					{
						if( !((j)&0x01) )	//j % 2
						{
							*( adr22+i+(k << 5)+( (j >> 1) << 8 ) )=0;	
							*( adr22+i+((sita << 8)+0x10)+(k << 5)+( (j>>1) << 8 ) )=0;
						}else	
						{
							*( adr22+i+(k << 5)+0x10+( (j >> 1) << 8 ) )=0;	
							*( adr22+i+(sita << 8)+(k << 5)+0x100+( (j >> 1) << 8 ) )=0;
						}
					}
				}
			}


			//縦列空白作成（上みたいにやると文が長いので）
			//横0,1と6,7を縦8キャラ分やる
			for(j=0;j<2;j++)	
			{
				for(i=0;i<8;i++)		
				{				
					for(k=0;k<0x20;k++)	
					{				
						*( adr22+k+(i << 8)+(j << 5) )=0;			
						*( adr22+0xc0+k+(i << 8)+(j << 5) )=0;	
					}
				}
			}

			if( size == 5 )
				adr22+=0x120;		//(0x20*8+0x20)

			for(j=0;j<size;j++)			
			{
				for(k=0;k<size;k++)		
				{				
					for(i=0;i<4;i++)
					{				
						*(adr22+0x12+(i << 2))=*(adr11+(i << 2));
						*(adr22+0x13+(i << 2))=*(adr11+1+(i << 2));

						*(adr22+0x10+0x20+(i << 2))=*(adr11+0x02+(i << 2));
						*(adr22+0x11+0x20+(i << 2))=*(adr11+0x03+(i << 2));

						*(adr22+0x2+0x100+(i << 2))=*(adr11+0x10+(i << 2));
						*(adr22+0x3+0x100+(i << 2))=*(adr11+0x11+(i << 2));

						*(adr22+0x120+(i << 2))=*(adr11+0x12+(i << 2));
						*(adr22+1+0x120+(i << 2))=*(adr11+0x13+(i << 2));
					}		

					adr11+=0x20;
					adr22+=0x20;
				}

				if( size == 7 )
					adr22+=0x20;		//size=7
				else if( size == 5 )
					adr22+=0x60;		//size=5  0x20*3
			}

			//アニメーションするので、sizeによってアドレスを調整
			if( size == 7 )
				adr22+=0x100;			//size=7
			else if( size == 5 )
				adr22+=0x1e0;			//size=5  (0x100*2-0x20)
		}

	}else		//偶数------------------------------------------
	{
		for(i=0;i<patcnt;i++)			
		{
			if( size == 6 )
			{
				for(k=0;k<0x100;k++)		//横一列分 0x20*8
				{				
					*adr22=0;				
					adr22++;
				}
			}

			for(j=0;j<size;j++)			
			{			
				if( size == 6 )		
				{
					for(k=0;k<0x20;k++)
					{
						*adr22=0;
						adr22++;
					}
				}

				for(k=0;k<0x20*size;k++)	
				{				
					*adr22=*adr11;
					adr11++;
					adr22++;
				}

				if( size == 6 )		
				{
					for(k=0;k<0x20;k++)
					{
						*adr22=0;
						adr22++;
					}
				}
			}

			if( size == 6 )				
			{
				for(k=0;k<0x100;k++)	
				{				
					*adr22=0;	
					adr22++;
				}
			}
		}
	}

//	}			//暫定
#endif
	PokeBuchiMake(pokeno,rnd,adr2);
}
#endif

void	DecordPokeCellMakeBuchi(CellData *cell,int size,int patcnt,void *adr1,void *adr2,int pokeno,u32 rnd)
{
	u8	dir;

	if(((u32)adr2==DecordAdrs[BSS_CLIENT_MINE])||
	   ((u32)adr2==DecordAdrs[BSS_CLIENT_MINE2]))
		dir=POKE_BACK;
	else
		dir=POKE_FRONT;
	DecordPokeCellMakeRndFB(cell,size,patcnt,adr1,adr2,pokeno,rnd,dir);
}

void	DecordPokeCellMakeRndFB(CellData *cell,int size,int patcnt,void *adr1,void *adr2,int pokeno,u32 rnd,u8 dir)
{
	u16	annon_rnd;

	if(pokeno==MONSNO_ANNOON){
		annon_rnd=(((rnd&0x03000000)>>18)|((rnd&0x030000)>>12)|((rnd&0x0300)>>6)|(rnd&0x03))%28;
		if(annon_rnd==0)
			annon_rnd+=CELLID_pm3f_una;
		else
			annon_rnd+=(CELLID_pm3f_unb-1);
		if(dir==POKE_BACK)
			LZ77UnCompWram((void*)PM2BObjDataCell[annon_rnd].ch_data,adr2);
		else
			LZ77UnCompWram((void*)PM2FObjDataCell[annon_rnd].ch_data,adr2);
	}
	else if(pokeno>MONSNO_END)
		LZ77UnCompWram((void*)PM2FObjDataCell[0].ch_data,adr2);
	else
		LZ77UnCompWram((void *)cell->ch_data,adr2);

	PokeBuchiMakeFB(pokeno,rnd,adr2,dir);
}

#if 0
//----------------------------------------------------------
//		展開->WorkRam->WorkRam->CellSet(ポケモンデータ）
//----------------------------------------------------------

void	DecordPokeCellSet(CellData *cell,int size,int patcnt)
{
	CellData ArcCell;

	DecordPokeCellMake(cell,size,patcnt,(void *)0x02000000,(void *)0x2010000,0);

	ArcCell.ch_data=(void *)(0x02010000);
	ArcCell.size=cell->size;
	ArcCell.act_num=cell->act_num;
	CellSet(&ArcCell);
}
#endif

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝﾃﾞｰﾀをWramに展開
//							2002.04.06(土) by matsuda
//----------------------------------------------------------
void	DecordPoke(CellData *cell, void *adr1,void *adr2)
{
#if 0
//================================================
//通信が重いことによる暫定対応
	LZ77UnCompWram((void *)cell->ch_data,adr2);
	return;
//================================================
#endif

	LZ77UnCompWram((void *)cell->ch_data,adr1);
}

//----------------------------------------------------------
//	Wramに展開されているﾎﾟｹﾓﾝﾃﾞｰﾀを8x8に収まるように位置調整
//----------------------------------------------------------
void PokeCellMake(int size,int patcnt,void *adr1,void *adr2)
{
	int	i,j,k,t;
	u8	*adr11,*adr22,sita;

	adr11=adr1;
	adr22=adr2;
	

	if( (size)&0x01 )	//size % 2    奇数-------------------------
	{
		//下の段の高さ求めるsize3=5 size5=6 size7=7
		sita=(size >> 1)+4;			//size/2

		for(t=0;t<patcnt;t++)	
		{
			//上と下の横一列空白作成（1キャラの半分単位）
			for(j=0;j<8-size;j++)		
			{
				for(k=0;k<8;k++)
				{				
					for(i=0;i<0x10;i++)		//1キャラの半分分
					{
						if( !((j)&0x01) )	//j % 2
						{
							*( adr22+i+(k << 5)+( (j >> 1) << 8 ) )=0;	
							*( adr22+i+((sita << 8)+0x10)+(k << 5)+( (j>>1) << 8 ) )=0;
						}else	
						{
							*( adr22+i+(k << 5)+0x10+( (j >> 1) << 8 ) )=0;	
							*( adr22+i+(sita << 8)+(k << 5)+0x100+( (j >> 1) << 8 ) )=0;
						}
					}
				}
			}


			//縦列空白作成（上みたいにやると文が長いので）
			//横0,1と6,7を縦8キャラ分やる
			for(j=0;j<2;j++)	
			{
				for(i=0;i<8;i++)		
				{				
					for(k=0;k<0x20;k++)	
					{				
						*( adr22+k+(i << 8)+(j << 5) )=0;			
						*( adr22+0xc0+k+(i << 8)+(j << 5) )=0;	
					}
				}
			}

			if( size == 5 )
				adr22+=0x120;		//(0x20*8+0x20)

			for(j=0;j<size;j++)			
			{
				for(k=0;k<size;k++)		
				{				
					for(i=0;i<4;i++)
					{				
						*(adr22+0x12+(i << 2))=*(adr11+(i << 2));
						*(adr22+0x13+(i << 2))=*(adr11+1+(i << 2));

						*(adr22+0x10+0x20+(i << 2))=*(adr11+0x02+(i << 2));
						*(adr22+0x11+0x20+(i << 2))=*(adr11+0x03+(i << 2));

						*(adr22+0x2+0x100+(i << 2))=*(adr11+0x10+(i << 2));
						*(adr22+0x3+0x100+(i << 2))=*(adr11+0x11+(i << 2));

						*(adr22+0x120+(i << 2))=*(adr11+0x12+(i << 2));
						*(adr22+1+0x120+(i << 2))=*(adr11+0x13+(i << 2));
					}		

					adr11+=0x20;
					adr22+=0x20;
				}

				if( size == 7 )
					adr22+=0x20;		//size=7
				else if( size == 5 )
					adr22+=0x60;		//size=5  0x20*3
			}

			//アニメーションするので、sizeによってアドレスを調整
			if( size == 7 )
				adr22+=0x100;			//size=7
			else if( size == 5 )
				adr22+=0x1e0;			//size=5  (0x100*2-0x20)
		}

	}else		//偶数------------------------------------------
	{
		for(i=0;i<patcnt;i++)			
		{
			if( size == 6 )
			{
				for(k=0;k<0x100;k++)		//横一列分 0x20*8
				{				
					*adr22=0;				
					adr22++;
				}
			}

			for(j=0;j<size;j++)			
			{			
				if( size == 6 )		
				{
					for(k=0;k<0x20;k++)
					{
						*adr22=0;
						adr22++;
					}
				}

				for(k=0;k<0x20*size;k++)	
				{				
					*adr22=*adr11;
					adr11++;
					adr22++;
				}

				if( size == 6 )		
				{
					for(k=0;k<0x20;k++)
					{
						*adr22=0;
						adr22++;
					}
				}
			}

			if( size == 6 )				
			{
				for(k=0;k<0x100;k++)	
				{				
					*adr22=0;	
					adr22++;
				}
			}
		}
	}

//	}			//暫定

}


