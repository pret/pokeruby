//====================================================================
//
//
//					通信時のＴＶデータ混ぜる処理	01/12/12 nohara
//
//
/*
						＜datatypeを追加した時＞
						・TVDataZukanCheckに追加する


*/
//====================================================================
#include "common.h"
#include "intr.h"
#include "pokesio.h"				//GetSioConnectId
#include "tv_def.h"					//TVのdefine群
#include "tv_tool.h"				//関数群
#include "cm.h"						//CMDATA_MAX
#include "zukan.h"					//Z_SEE_CHK
#include "poketool.h"				//PokeMonsNo2ZukanNoGet
#include "ev_flag.h"				//EventFlagCheck
#include "sysflag.h"				//SYS_GAME_CLEAR


//====================================================================
//						プロトタイプ宣言
//====================================================================
void TVDataMixer(void *,u32,u8);
void TVDataMixerMain(TV_EVENT *,TV_EVENT *,TV_EVENT *,TV_EVENT *);
static u8 TVDataCopyChk(TV_EVENT **,TV_EVENT **,u8);
static u8 TVDataLetterTypeCopy(TV_Letter_Work *,TV_Letter_Work *,u8);
static u8 TVDataSecretTypeCopy(TV_Sec_Btl_Work *,TV_Sec_Btl_Work *,u8);
static u8 TVDataTimeTypeCopy(TV_Generating_Work *,TV_Generating_Work *,u8);
static s8 MixTVCopyTypeChk(TV_EVENT *);
static void	TVDataVerCheck(u8);
static void	TVDataZukanCheck();
static void	TVDataZukanSet(u16,u8);
static void	CMDataVerCheck();
static void	TVDataGameClearCheck();
static void	CMDataGameClearCheck();
void TVDataHimselfLetterWatchFlagOff();
static void	TVDataAkiKakuho();

//====================================================================
//							変数
//====================================================================
static s8 mix_akino;		//通信で送られてきたデータのコピーする場所

#define MIX_TV_DATA_SIZE    (sizeof(Fld.tv_event))            // 通信時のデータサイズ
#define MIX_TV_TMP_BUFFER   (TV_EVENT*)(&(UserWork[0x7000]))  // 通信時に全データをコピーしておく一時バッファ


//====================================================================
//							関数
//====================================================================

//--------------------------------------------------------------------
//
//						始めに呼ばれる
//
//				送られてきたデータの順番を合わせる
//
//--------------------------------------------------------------------
void TVDataMixer( void *data, u32 size, u8 my_id )
{
	TV_EVENT *from_p;
	u8 i;

	for(i = 0; i < 4; i++){
		memcpy((u8*)MIX_TV_TMP_BUFFER+i*MIX_TV_DATA_SIZE, (u8*)data+i*size, MIX_TV_DATA_SIZE);
	}

	from_p = (TV_EVENT*)MIX_TV_TMP_BUFFER;

	//順番を整える
	switch( my_id )
	{
		case 0:
			TVDataMixerMain( (TV_EVENT *)Fld.tv_event,
					(TV_EVENT *)(from_p+TV_WORK_MAX), 
					(TV_EVENT *)(from_p+TV_WORK_MAX*2),
					(TV_EVENT *)(from_p+TV_WORK_MAX*3) );
			break;
		case 1:
			TVDataMixerMain( (TV_EVENT *)from_p,
					(TV_EVENT *)Fld.tv_event,
					(TV_EVENT *)(from_p+TV_WORK_MAX*2),
					(TV_EVENT *)(from_p+TV_WORK_MAX*3) );
			break;
		case 2:
			TVDataMixerMain( (TV_EVENT *)from_p,
					(TV_EVENT *)(from_p+TV_WORK_MAX),
					(TV_EVENT *)Fld.tv_event,
					(TV_EVENT *)(from_p+TV_WORK_MAX*3) );
			break;
		case 3:
			TVDataMixerMain( (TV_EVENT *)from_p,
					(TV_EVENT *)(from_p+TV_WORK_MAX),
					(TV_EVENT *)(from_p+TV_WORK_MAX*2),
					(TV_EVENT *)Fld.tv_event );
			break;
	};

	//混ぜる処理が終了したらソートをかける
	TVDataSort(Fld.tv_event);

	//相手データの総数を見て、相手データに５つ分の空きを作る
	TVDataAkiKakuho();
	
	//シャッフルする
	//TVDataShuffle();

	//TVDataAkiKakuhoが終了したらソートをかける
	TVDataSort(Fld.tv_event);

	//図鑑に載っているかチェック
	TVDataZukanCheck();

	//ゲームクリアしているかのチェック
	TVDataGameClearCheck();
}

//--------------------------------------------------------------------
//
//							メイン
//
//--------------------------------------------------------------------
void TVDataMixerMain( TV_EVENT *agb1, TV_EVENT *agb2, TV_EVENT *agb3, TV_EVENT *agb4 )
{
	TV_EVENT **p_list[4];
	u8 i,j,ans;
	static u8 num,end_chk = 0;

	p_list[0] = &agb1;
	p_list[1] = &agb2;
	p_list[2] = &agb3;
	p_list[3] = &agb4;

	//通信人数を取得
	num = GetConnectSioMenberNum();

	while(1)
	{
		//人数分
		for( j=0; j < num ;j++ )
		{
			if(j == 0)	end_chk = 0;		//終了カウンタークリア

			//渡せるデータの場所を調べる
			mix_akino = MixTVCopyTypeChk(*p_list[j]);
			if( mix_akino == -1 )
			{
				end_chk++;
				if( end_chk == num ) return;
			}else
			{
				for( i=0; i < (num-1) ;i++ )
				{
					tv_akino = TVDataPartnerAkiChk(*p_list[(j+i+1)%num]);
					if( tv_akino != -1 )
					{
						ans = TVDataCopyChk( p_list[(j+i+1)%num], p_list[j], ((j+i+1)%num) );
	
						//コピー出来たらbreakする
						if( ans == 1 ) break;
					}
				}

				//誰もコピーしなかった場合は削除する
				if( i == (num-1) ) 
				{
					TVDataClear(*p_list[j],(u8)mix_akino);
				}
			}
		}
	}

	return;
}

//--------------------------------------------------------------------
//
//					通信タイプを見て処理を分ける
//
//--------------------------------------------------------------------
static u8 TVDataCopyChk(TV_EVENT **p, TV_EVENT **pp, u8 id)
{
	u8 ans,type;
	TV_EVENT *to_p;
	TV_EVENT *from_p;
	to_p = *p;
	from_p = *pp;
	ans = 0;


	type = TVDataCopyTypeGet( from_p[mix_akino].datatype );
	switch( type )
	{
		//(手紙型)カット＆ペーストする
		case CUT_TYPE1:
			ans =TVDataLetterTypeCopy( (TV_Letter_Work *)(to_p)+tv_akino,
					(TV_Letter_Work *)(from_p)+mix_akino, id );
			break;

		//(秘密型)カット＆ペーストする
		case CUT_TYPE2:
			ans =TVDataSecretTypeCopy( (TV_Sec_Btl_Work *)(to_p)+tv_akino,
					(TV_Sec_Btl_Work *)(from_p)+mix_akino, id );
			break;

		//(時間型)カット＆ペーストする
		case CUT_TIME_TYPE:
			ans =TVDataTimeTypeCopy( (TV_Generating_Work *)(to_p)+tv_akino,
					(TV_Generating_Work *)(from_p)+mix_akino, id );
			break;

		//(レア型)絶対にコピーする
		case RARE_TYPE1:
			//ans = ???;
			break;
	};

	if( ans == 1 )
	{
		TVDataClear((TV_EVENT *)from_p,(u8)mix_akino);
		return 1;
	}

	return 0;
}

//--------------------------------------------------------------------
//							手紙型
//
//				コピーする必要があるかチェックして
//				相手のカセットのTVデータをコピーする
//
//	戻り値	0 = データをコピーしなかった
//			1 = データをコピーした
//--------------------------------------------------------------------
static u8 TVDataLetterTypeCopy(TV_Letter_Work *p, TV_Letter_Work *pp, u8 id)
{
	u32	get_id;

	get_id = GetSioTrainerId(id);

	//前のトレーナーIDと同じか
	if( ((get_id)&0xff) == pp->before_id[0] &&
		 (((get_id)>>8)&0xff) == pp->before_id[1] ) return 0;

	//前のトレーナーIDにデータIDをコピーして、
	//データIDに今のROMのトレーナーIDを代入する
	pp->before_id[0] = pp->data_id[0];
	pp->before_id[1] = pp->data_id[1];
	pp->data_id[0] = (get_id & 0xff);
	pp->data_id[1] = ((get_id >> 8 )& 0xff);

	*(p)=*(pp);			//データをコピーする
	p->watch_flag = TV_WATCH_FLAG_ON;	//見れる状態にする

	return 1;
}


//--------------------------------------------------------------------
//							秘密型
//
//				コピーする必要があるかチェックして
//				相手のカセットのTVデータをコピーする
//
//	戻り値	0 = データをコピーしなかった
//			1 = データをコピーした
//--------------------------------------------------------------------
static u8 TVDataSecretTypeCopy(TV_Sec_Btl_Work *p, TV_Sec_Btl_Work *pp, u8 id)
{
	u32	get_id;

	get_id = GetSioTrainerId(id);

	//前のトレーナーIDと同じか
	if( ((get_id)&0xff) == pp->before_id[0] &&
		 (((get_id)>>8)&0xff) == pp->before_id[1] ) return 0;

	//製作者IDが同じか
	if( ((get_id)&0xff) == pp->trainer_id[0] &&
		 (((get_id)>>8)&0xff) == pp->trainer_id[1] ) return 0;

	//前のトレーナーIDにデータIDをコピーして、
	//データIDに今のROMのトレーナーIDを代入する
	pp->before_id[0] = pp->data_id[0];
	pp->before_id[1] = pp->data_id[1];
	pp->data_id[0] = (get_id & 0xff);
	pp->data_id[1] = ((get_id >> 8 )& 0xff);

	*(p)=*(pp);				//データをコピーする
	p->watch_flag = TV_WATCH_FLAG_ON;	//見れる状態にする
	return 1;
}
//--------------------------------------------------------------------
//							時間型
//
//				コピーする必要があるかチェックして
//				相手のカセットのTVデータをコピーする
//
//	戻り値	0 = データをコピーしなかった
//			1 = データをコピーした
//--------------------------------------------------------------------
static u8 TVDataTimeTypeCopy(TV_Generating_Work *p, TV_Generating_Work *pp, u8 id)
{
	u32	get_id;

	get_id = GetSioTrainerId(id);

	//前のトレーナーIDと同じか
	if( ((get_id)&0xff) == pp->before_id[0] &&
		 (((get_id)>>8)&0xff) == pp->before_id[1] ) return 0;

	//前のトレーナーIDにデータIDをコピーして、
	//データIDに今のROMのトレーナーIDを代入する
	pp->before_id[0] = pp->data_id[0];
	pp->before_id[1] = pp->data_id[1];
	pp->data_id[0] = (u8)((get_id)&0xff);
	pp->data_id[1] = (u8)(((get_id)>>8)&0xff);


	*(p)=*(pp);			//データをコピーする
	p->watch_flag = TV_WATCH_FLAG_ON;			//見れる状態にする
	p->time_count = GENERATING_INCUBATION_TIME;	//潜伏日数をセットする

	return 1;
}

//--------------------------------------------------------------------
//					渡すデータの場所を返す
//
//	戻り値		あった	0～TVDATA_MAXの数字
//				なかった  -1
//--------------------------------------------------------------------
static s8 MixTVCopyTypeChk(TV_EVENT *p)
{
	u8 i;

	for(i=0; i < TVDATA_MAX ;i++)
	{
		if( (p+i)->watch_flag == TV_WATCH_FLAG_OFF )
		{
			if( TV_TYPE_START <= (p+i)->datatype &&
					(p+i)->datatype < TV_TYPE_END )
				return i;
		}
	}

	return -1;			
}

//--------------------------------------------------------------------
//図鑑を見てまだ見てないポケモンデータだったらＴＶを見た状態にする
//--------------------------------------------------------------------
static void	TVDataZukanCheck()
{
	u16 i,pokeno;

	//TVデータ
	for(i=0; i < TVDATA_MAX ;i++)
	{
		switch( Fld.tv_event[i].datatype )	
		{
			case TV_NODATA_TYPE1:
			case TV_SHOP_TYPE1:
			case TV_GENERATING_TYPE1:
			case TV_RECENTLY_TYPE1:
				break;
			case TV_POKEMON_TYPE1:
				pokeno = ((TV_Letter_Work*)(&(Fld.tv_event[i])))->inside_data;
				TVDataZukanSet( pokeno, i );
				break;
			case TV_CLUB_TYPE1:
				pokeno = ((TV_Club_Work*)(&(Fld.tv_event[i])))->pokeno;
				TVDataZukanSet( pokeno, i );
				break;
			case TV_GYMLEADER_TYPE1:
				pokeno = ((TV_GYM_Work*)(&(Fld.tv_event[i])))->pokeno;
				TVDataZukanSet( pokeno, i );
				break;
			case TV_NAME_TYPE1:
				pokeno = ((TV_Name_Work*)(&(Fld.tv_event[i])))->pokeno;
				TVDataZukanSet( pokeno, i );

				pokeno = ((TV_Name_Work*)(&(Fld.tv_event[i])))->r_pokeno;
				TVDataZukanSet( pokeno, i );
				break;
			case TV_CONTEST_TYPE1:
				pokeno = ((TV_Con_Work*)(&(Fld.tv_event[i])))->pokeno;
				TVDataZukanSet( pokeno, i );
				break;
			case TV_TOWER_TYPE1:
				pokeno = ((TV_Tower_Work*)(&(Fld.tv_event[i])))->pokeno;
				TVDataZukanSet( pokeno, i );

				pokeno = ((TV_Tower_Work*)(&(Fld.tv_event[i])))->enemy_pokeno;
				TVDataZukanSet( pokeno, i );
				break;
			case TV_GETPOKE_TYPE1:
				pokeno = ((TV_Sec_Btl_Work*)(&(Fld.tv_event[i])))->get_pokeno;
				TVDataZukanSet( pokeno, i );
				break;
			case TV_FAILED_TYPE1:
				pokeno = ((TV_Sec_Get_Failed_Work*)(&(Fld.tv_event[i])))->pokeno;
				TVDataZukanSet( pokeno, i );

				pokeno = ((TV_Sec_Get_Failed_Work*)(&(Fld.tv_event[i])))->failed_pokeno;
				TVDataZukanSet( pokeno, i );
				break;
			case TV_FISHING_TYPE1:
				pokeno = ((TV_Sec_Fishing_Work*)(&(Fld.tv_event[i])))->pokeno;
				TVDataZukanSet( pokeno, i );
				break;
			case TV_ONEDAY_TYPE1:
				pokeno = ((TV_Sec_OneDay_Work*)(&(Fld.tv_event[i])))->pokeno;
				TVDataZukanSet( pokeno, i );

				pokeno = ((TV_Sec_OneDay_Work*)(&(Fld.tv_event[i])))->get_pokeno;
				TVDataZukanSet( pokeno, i );
				break;
			default:
				TVDataVerCheck( (u8)i );
				break;
		}
	}

	return;
}

//--------------------------------------------------------------------
//		ROMにないデータタイプだった場合は、ＴＶを見た状態にする
//--------------------------------------------------------------------
static void	TVDataVerCheck(u8 no)
{
	Fld.tv_event[no].watch_flag = TV_WATCH_FLAG_OFF;
	return;
}

//--------------------------------------------------------------------
//			図鑑チェックをして、watch_flagを見れない状態にする
//--------------------------------------------------------------------
static void	TVDataZukanSet(u16 pokeno, u8 no)
{
	s8 ans = 0;
	u16 z_pokeno = 0;

	//ポケモンナンバーを全国にする
	z_pokeno = PokeMonsNo2ZukanNoGet( pokeno );
	ans = ZukanCheck( z_pokeno, Z_SEE_CHK );
	if( ans == 0 )	Fld.tv_event[no].watch_flag = TV_WATCH_FLAG_OFF;
	return;
}

//--------------------------------------------------------------------
//	ゲームクリアしていなかったらwatch_flagを見れない状態にする
//--------------------------------------------------------------------
static void	TVDataGameClearCheck()
{
	u16 i;

	//ゲームクリアしていたら
	if( EventFlagCheck( SYS_GAME_CLEAR ) == TRUE ) return;

	//TVデータ
	for(i=0; i < TVDATA_MAX ;i++)
	{
		switch( Fld.tv_event[i].datatype )	
		{
			case TV_TOWER_TYPE1:
				Fld.tv_event[i].watch_flag = TV_WATCH_FLAG_OFF;
				break;
			case TV_GENERATING_TYPE1:
				Fld.tv_event[i].watch_flag = TV_WATCH_FLAG_OFF;
				break;
		}
	}

	return;
}

//--------------------------------------------------------------------
//			自分のＴＶデータの自分データにある手紙型は
//			全て見た状態(通信出来る状態)にする
//--------------------------------------------------------------------
void TVDataHimselfLetterWatchFlagOff()
{
	u8 i,type;

	for( i=0; i < TVDATA_HIMSELF_MAX ;i++ )
	{
		type = TVDataCopyTypeGet( Fld.tv_event[i].datatype );

		//手紙型だったら
		if( type == CUT_TYPE1 )	
			Fld.tv_event[i].watch_flag = TV_WATCH_FLAG_OFF;
	}

	return;
}

//--------------------------------------------------------------------
//		相手データの総数を見て、相手データに５つ分の空きを作る
//--------------------------------------------------------------------
#define	AKI_KAKUHO_SIZE		TVDATA_HIMSELF_MAX
static void TVDataAkiKakuho()
{
	s8 i,count = 0;

	for( i=TVDATA_HIMSELF_MAX; i < TVDATA_MAX ;i++ )
	{
		if( Fld.tv_event[i].datatype == TV_NODATA_TYPE1 )
			count++;
	}

	for (i=0; i < AKI_KAKUHO_SIZE - count; i++ ) {
		TVDataClear( Fld.tv_event, i+TVDATA_HIMSELF_MAX );
	}

	return;
}


/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/


void CMDataMixer(void *,u32,u8);
static u8 CMDataInterViewTypeCopy(TV_CM *,TV_CM *,s8);
void CMDataMixerMain(TV_CM *,TV_CM *,TV_CM *,TV_CM *);
static void CMDataCopyChk(TV_CM **,TV_CM **);
static s8 MixCMCopyTypeChk(TV_CM *,u8);

#define MIX_CM_DATA_SIZE    (sizeof(Fld.tv_cm))            // 通信時のデータサイズ
#define MIX_CM_TMP_BUFFER   (TV_CM*)(&(UserWork[0x7000]))  // 通信時に全データをコピーしておく一時バッファ
//--------------------------------------------------------------------
//			送られてきたデータと自分のデータをミックスする
//--------------------------------------------------------------------
void CMDataMixer( void * data, u32 size, u8 my_id )
{
	TV_CM *from_p;
	u8 i;

	for(i = 0; i < 4; i++){
		memcpy((u8*)MIX_CM_TMP_BUFFER+i*MIX_CM_DATA_SIZE, (u8*)data+i*size, MIX_CM_DATA_SIZE);
	}

	from_p = (TV_CM*)MIX_CM_TMP_BUFFER;

	//順番を整える
	switch( my_id )
	{
		case 0:
			CMDataMixerMain( Fld.tv_cm,
					(TV_CM *)(from_p+CMDATA_MAX), 
					(TV_CM *)(from_p+CMDATA_MAX*2),
					(TV_CM *)(from_p+CMDATA_MAX*3) );
			break;
		case 1:
			CMDataMixerMain( (TV_CM *)from_p,
					Fld.tv_cm,
					(TV_CM *)(from_p+CMDATA_MAX*2),
					(TV_CM *)(from_p+CMDATA_MAX*3) );
			break;
		case 2:
			CMDataMixerMain( (TV_CM *)from_p,
					(TV_CM *)(from_p+CMDATA_MAX),
					Fld.tv_cm,
					(TV_CM *)(from_p+CMDATA_MAX*3) );
			break;
		case 3:
			CMDataMixerMain( (TV_CM *)from_p,
					(TV_CM *)(from_p+CMDATA_MAX),
					(TV_CM *)(from_p+CMDATA_MAX*2),
					Fld.tv_cm );
			break;
	};

	CMDataVerCheck();					//verチェック
	CMDataGameClearCheck();				//ゲームクリアしてるかチェック
}

//--------------------------------------------------------------------
//
//							メイン
//
//--------------------------------------------------------------------
void CMDataMixerMain( TV_CM *agb1, TV_CM *agb2, TV_CM *agb3, TV_CM *agb4 )
{
	TV_CM **p_list[4];
	u8 i,j,k;
	static u8 num;

	p_list[0] = &agb1;
	p_list[1] = &agb2;
	p_list[2] = &agb3;
	p_list[3] = &agb4;

	//通信人数を取得
	num = GetConnectSioMenberNum();

	for(  k=0; k < CMDATA_MAX ;k++ )
	{
		for( j=0; j < num ;j++ )
		{
			//渡せるデータの場所を調べる
			mix_akino = MixCMCopyTypeChk(*p_list[j],k);
			if( mix_akino != -1 )
			{
				for( i=0; i < (num-1) ;i++ )
				{
					tv_akino = CMDataAkiChk((TV_CM *)*p_list[(j+i+1)%num]);
					if( tv_akino != -1 )
					{
						CMDataCopyChk( p_list[(j+i+1)%num], p_list[j] );
					}
				}
			}
		}
	}

	return;
}

//--------------------------------------------------------------------
//
//					通信タイプを見て処理を分ける
//					CMはコピーしか存在しない
//
//--------------------------------------------------------------------
static void CMDataCopyChk(TV_CM **p, TV_CM **pp)
{
	TV_CM *to_p;
	TV_CM *from_p;
	to_p = *p;
	from_p = *pp;

	CMDataInterViewTypeCopy( (TV_CM *)(to_p),(TV_CM *)(from_p)+mix_akino,tv_akino );

	return;
}

//--------------------------------------------------------------------
//						インタビュー型(CM)
//
//				コピーする必要があるかチェックして
//				相手のカセットのTVデータをコピーする
//
//	戻り値	0 = データをコピーしなかった
//			1 = データをコピーした
//--------------------------------------------------------------------
static u8 CMDataInterViewTypeCopy(TV_CM *p, TV_CM *pp, s8 no)
{
	u8 i;

	if( pp->datatype == CM_NODATA_TYPE )	return 0;

	//自分のCMデータに同じdatatypeのものがあるか
	for( i=0; i < CMDATA_MAX ;i++ )
	{
		if( p[i].datatype == pp->datatype )	return 0;
	}

	//データをコピーする
	p[no].datatype = pp->datatype;
	p[no].watch_flag = TV_WATCH_FLAG_ON;	//見れる状態にする
	p[no].time_count = pp->time_count;

	return 1;
}

//--------------------------------------------------------------------
//			指定した場所のデータがCM_NODATA_TYPEではないか
//
//	戻り値		CM_NODATA_TYPE						-1
//				それ以外は渡された場所を返す		no
//--------------------------------------------------------------------
static s8 MixCMCopyTypeChk(TV_CM *p, u8 no)
{
	if( p[no].datatype == CM_NODATA_TYPE )	return -1;
	else return (s8)no;
}

//--------------------------------------------------------------------
//			ROMにないデータタイプだった場合は、ＣＭを削除する
//--------------------------------------------------------------------
static void	CMDataVerCheck()
{
	u8 i;

	for( i=0; i < CMDATA_MAX ;i++ )
	{
		if( Fld.tv_cm[i].datatype >= CM_DATATYPE_MAX )
			CMDataClear(i);
	}

	CMDataSort();

	return;
}

//--------------------------------------------------------------------
//					ゲームクリアしているかチェック
//--------------------------------------------------------------------
static void	CMDataGameClearCheck()
{
	u8 i;

	if( EventFlagCheck( SYS_GAME_CLEAR ) == TRUE ) return;

	for( i=0; i < CMDATA_MAX ;i++ )
	{
		Fld.tv_cm[i].watch_flag = TV_WATCH_FLAG_OFF;
	}

	return;
}


