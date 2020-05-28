//====================================================================
//
//						ＴＶ企画	01/11/29 nohara							
//
//						関数群
//
/*	
					＜データ追加したとき＞
					・LetterTypeSelectChk()に追加する


*/
//====================================================================
#include "common.h"
#include "intr.h"
#include "calctool.h"				//pp_rand
#include "script.h"					//ScriptParameter
#include "poketool.h"				//PokeNameData
#include "conscr.h"					//NORMAL_RANK
#include "ev_win.h"					//NORMAL
#include "item.h"					//ItemData
#include "kaiwa.h"					//KaiwaCopyWord
#include "kaiwa_com.h"				//KAIWA_CODE_BLANK
#include "tv_def.h"					//TVのdefine群
#include "letter.h"					//LetterNameDataSet
#include "zukan.h"					//Z_SEE_CHK
#include "sysflag.h"				//SYS_TV_HOME
#include "syswork.h"				//LOCALWORK3
#include "fld_tool.h"				//↓をインクルードする時に必要
#include "../evdata/maparray.h"		//接続用マップID定義
#include "message.h"				//メッセージファイル
#include "fld_main.h"
#include "pm_str.h"
#include "scr_tool.h"				//GetTemotiBtlPokeNum
#include "..\sxydata\park_battle01.sym"	//INTERVW1_01_PARK_BATTLE01
#include "..\script\savework.h"		//WK_SCENE_BATTLE_TOWER


//====================================================================
//							extern宣言
//====================================================================
//fd_shop.c
extern MINEITEM TVItemData[];		//買い物したものが入る


//====================================================================
//						プロトタイプ宣言
//====================================================================
void TVContestRankGet(u8,u8);		//コンテストランク名セット
void TVContestTypeGet(u8,u8);		//コンテストタイプ名セット
void ScrTVContestTypeGet();			//スクリプトからセットする
void SetNumSelectBuf(u8,int);		//渡された値を指定したbufにセット
void SetTotalMoneySelectBuf(u8,TV_Sec_Shop_Work*);//渡されたＴＶデータの合計金額セット
u8 TVSecDataTypeChk(u8);			//自分が作成した同じdatatypeが存在するか(秘密型のみ)
void TVShopDataSort();				//買い物をしたデータを数が多い順にソートする
void LetterTypeSelectChk();			//手紙型のデータ作成	発生チェック
void TVLetterDataTypeChk(u8);		//(手紙型のみ)
void ScrInterViewTypeChk();			//インタビューチェック
void ScrLetterPokeTypeChk();		//ポケモンアンケートチェック
void ScrLetterRecentlyTypeChk();	//さいきんのできごとチェック
void ScrLetterClubTypeChk();		//大好きクラブインタビューチェック
void ScrLetterGymTypeChk();			//ジムリーダー戦後のインタビューチェック
void ScrLetterNameTypeChk();		//姓名判断氏チェック
void ScrLetterConTypeChk();			//コンテストチェック
void ScrLetterTowerTypeChk();		//バトルタワーチェック
void TVDataClear(TV_EVENT *,u8);	//指定した場所のTVデータを削除
void TVDataSort(TV_EVENT *);		//空きがあればTVデータを前につめる
u16 SetRndChoicePokeSelectBuf(u8,u16);//ポケモンの名前を指定したbufにセット
u16 RndChoicePoke(u16);				//指定したポケモンナンバー以外を取得
void ScrTVDataHimselfAkiChk();		//自分データの空いてる場所があるか	
s8 TVDataHimselfAkiChk(TV_EVENT *);	//自分TVデータの空いている場所をかえす
s8 TVDataPartnerAkiChk(TV_EVENT *);	//相手TVデータの空いている場所をかえす
u8 TopPokeNickNameChk(u8);			//ポケモンにニックネームが付いているか
u8 ScrTopPokeNickNameChk();			//先頭ポケモンにニックネームが付いているか
u8 TVRndChk(u16);					//乱数取得で発生するか
void GetLetterRndKaiwaWord(TV_Letter_Work*);//簡易会話文章からランダムで1ワードを取得
u8 GetPokeNickNameBit(TV_Name_Work*);//秘密型姓名判断氏３ビット取得
void SetMojiNoSelectBuf(u8,u8,u8,u16,u16,TV_Name_Work*);//指定した文字数目を代入する
u16 GetNumKeta(int);				//桁数取得
void ScrTrainerIDCmp();				//トレーナーID比較
u8 TVDataCopyTypeGet(u8);			//通信タイプ取得
u8 ScrTVDataTypeChk();				//指定したＴＶデータがすでにあるか
u32 GetMyDataID();					//IDを取得する
u8 TVMyHomeChk();					//自宅ＴＶが見れるかチェック
void ScrNickNameChangeRecover();	//NameIn後の復帰処理
void TVBattleTowerInterViewClear();	//バトルタワーのインタビュアー削除、シーンクリア


//====================================================================
//								変数
//====================================================================
//scrcmd.cにあるものと内容同じ
u8 * const tempbuf_list[] =
{
	StrTempBuffer0,
	StrTempBuffer1,
	StrTempBuffer2,
};


//====================================================================
//
//								関数
//
//====================================================================

//--------------------------------------------------------------------
//						コンテストランク名セット
//--------------------------------------------------------------------
void TVContestRankGet(u8 buf, u8 rank)
{
	switch( rank )
	{
		case NORMAL_RANK:
			PM_strcpy( tempbuf_list[buf], msg_data_buf[NORMAL] );
			break;
		case SUPER_RANK:
			PM_strcpy( tempbuf_list[buf], msg_data_buf[SUPER] );
			break;
		case HYPER_RANK:
			PM_strcpy( tempbuf_list[buf], msg_data_buf[HYPER] );
			break;
		case MASTER_RANK:
			PM_strcpy( tempbuf_list[buf], msg_data_buf[MASTER] );
			break;
	};
}

//--------------------------------------------------------------------
//						コンテストタイプ名セット
//--------------------------------------------------------------------
void TVContestTypeGet(u8 buf, u8 type)
{
	switch( type )
	{
		case STYLE_CONTEST:
			PM_strcpy( tempbuf_list[buf], msg_data_buf[KAKKOYOSA] );
			break;
		case BEAUTIFUL_CONTEST:
			PM_strcpy( tempbuf_list[buf], msg_data_buf[UTSUKUSHISA] );
			break;
		case CUTE_CONTEST:
			PM_strcpy( tempbuf_list[buf], msg_data_buf[KAWAISA] );
			break;
		case CLEVER_CONTEST:
			PM_strcpy( tempbuf_list[buf], msg_data_buf[KASHIKOSA] );
			break;
		case STRONG_CONTEST:
			PM_strcpy( tempbuf_list[buf], msg_data_buf[TAKUMASHISA] );
			break;
	};
}

//--------------------------------------------------------------------
//					コンテストタイプ名セット(スクリプトから)
//--------------------------------------------------------------------
void ScrTVContestTypeGet()
{
	TV_Con_Work *p;
	p = (TV_Con_Work *)&Fld.tv_event[ScriptParameter0];
	TVContestTypeGet(1, p->type);
}

//--------------------------------------------------------------------
//					渡された値を指定したbufにセットする
//--------------------------------------------------------------------
void SetNumSelectBuf(u8 buf, int num)
{
	u16 keta = 0;
	keta = GetNumKeta(num);
	PM_NumMsgSet( tempbuf_list[buf], num, NUM_MODE_LEFT, keta);
}

//--------------------------------------------------------------------
//					渡された値の桁数を取得する
//--------------------------------------------------------------------
u16 GetNumKeta(int num)
{
	if( num / 10 == 0 )	return 1;
	else if( num / 100 == 0 ) return 2;
	else if( num / 1000 == 0 ) return 3;
	else if( num / 10000 == 0 ) return 4;
	else if( num / 100000 == 0 ) return 5;
	else if( num / 1000000 == 0 ) return 6;
	else if( num / 10000000 == 0 ) return 7;
	else if( num / 100000000 == 0 ) return 8;

	return 1;	//当てはまらなかったら１桁を返す
}

//--------------------------------------------------------------------
//	渡されたＴＶデータの場所の合計金額を指定したbufにセットする
//--------------------------------------------------------------------
void SetTotalMoneySelectBuf(u8 buf, TV_Sec_Shop_Work * p)
{
	u8 i;
	int max;
	max=0;

	for( i=0; i < 3 ;i++)
	{
		if( p->itemno[i] != 0 )
			max += (int)( ItemPriceGet( p->itemno[i] ) * p->num[i] );
	}

	//大安売りフラグを見る
	if( p->bargain_flag == 1 )
		SetNumSelectBuf( buf, (max >> 1) );
	else	
		SetNumSelectBuf( buf, max );
}
			
//--------------------------------------------------------------------
//			自分が作成した同じdatatypeが存在するか(秘密型のみ)
//
//	戻り値		0=存在しない
//				1=存在する
//--------------------------------------------------------------------
u8 TVSecDataTypeChk(u8 type)
{
	u8 i;
	u32 id;
	TV_Sec_Shop_Work *p;
	p = (TV_Sec_Shop_Work *)&Fld.tv_event[0];

	//IDを取得する
	id = GetMyDataID();

	for(i=TVDATA_HIMSELF_MAX; i < TVDATA_MAX ;i++)
	{
		if( (p+i)->datatype == type )
		{
			if( ((id)&0xff) == (p+i)->trainer_id[0] &&
				(((id)>>8)&0xff) == (p+i)->trainer_id[1] )
			{
				return 1;	//自分作成データが存在する
			}
		}
	}

	return 0;	//自分作成データが存在しない
}

//--------------------------------------------------------------------
//				買い物をしたデータを数が多い順にソートする
//--------------------------------------------------------------------
void TVShopDataSort()
{
	u16 item,num;
	u8  i,j;

	for( i=0; i < 2; i++ )
	{
		for( j=i+1; j < 3; j++ )
		{
			if( TVItemData[i].no < TVItemData[j].no )
			{
				item = TVItemData[i].item;
				num = TVItemData[i].no;

				TVItemData[i].item = TVItemData[j].item;
				TVItemData[i].no = TVItemData[j].no;

				TVItemData[j].item = item;
				TVItemData[j].no = num;
			}
		}
	}
}

//--------------------------------------------------------------------
//							(手紙型のみ)
//			同じdatatype存在しなかったら		0
//			同じdatatype存在したら				1
//			同じdatatype(見れない状態)存在したら削除してソートする	0
//
//	AnswerWorkに代入	0=手紙作れる
//						1=手紙作れない
//--------------------------------------------------------------------
void TVLetterDataTypeChk(u8 type)
{
	u8 i;

	for(i=0; i < TVDATA_HIMSELF_MAX ;i++)
	{
		//同じ手紙データが存在する
		if( Fld.tv_event[i].datatype == type )
		{
			if(	Fld.tv_event[i].watch_flag == TV_WATCH_FLAG_ON )
			{
				//見ていないデータだったら作らない
				AnswerWork = 1;
				return;
			}else
			{
				//見ているデータだったら削除してそこに作るようにする
				TVDataClear(Fld.tv_event,i);
				TVDataSort(Fld.tv_event);
				ScrTVDataHimselfAkiChk();
				return;
			}
		}
	}

	//同じ手紙データが存在しなくて、空きがあるか調べる
	ScrTVDataHimselfAkiChk();

	return;
}

//--------------------------------------------------------------------
//				手紙型のデータ作成	発生チェック
//
//			ScriptParameter1 = datatypeを見て処理を分ける
//--------------------------------------------------------------------
void LetterTypeSelectChk()
{
	AnswerWork = 0;

	switch( ScriptParameter1 )
	{
		case TV_POKEMON_TYPE1:
			ScrLetterPokeTypeChk();
			break;
		case TV_RECENTLY_TYPE1:
			ScrLetterRecentlyTypeChk();
			break;
		case TV_CLUB_TYPE1:
			ScrLetterClubTypeChk();
			break;
		case TV_GYMLEADER_TYPE1:
			ScrLetterGymTypeChk();
			break;
		case TV_NAME_TYPE1:
			ScrLetterNameTypeChk();
			break;
		case TV_CONTEST_TYPE1:
			ScrLetterConTypeChk();
			break;
		case TV_TOWER_TYPE1:
			ScrLetterTowerTypeChk();
			break;
	};
}

//--------------------------------------------------------------------
//		スクリプトから呼ばれる(手紙ポケモンアンケートチェック)
//
//			TVLetterDataTypeChk(TV_POKEMON_TYPE1);
//			ScrTVDataHimselfAkiChk();
//--------------------------------------------------------------------
void ScrLetterPokeTypeChk()
{
	TV_Letter_Work *p;

	TVLetterDataTypeChk(TV_POKEMON_TYPE1);
	if( AnswerWork == 0 ) 
	{
		PM_strcpy( StrTempBuffer0, 
				PokeNameData[PokeParaGet(&PokeParaMine[GetTemotiBtlPokeNum()],ID_monsno,0)] );

		//change 02/09/19
		//KaiwaTVWorkInit(KAIWA_MODE_HAGAKI,tv_akino);
		p = (TV_Letter_Work *)&Fld.tv_event[tv_akino];
		KaiwaWorkInit( (u16 *)&p->easytalk[0], 6 );
	}
}

//--------------------------------------------------------------------
//		スクリプトから呼ばれる(手紙さいきんのできごとチェック)
//
//			TVLetterDataTypeChk(TV_RECENTLY_TYPE1);
//			ScrTVDataHimselfAkiChk();
//--------------------------------------------------------------------
void ScrLetterRecentlyTypeChk()
{
	TV_Letter_Work *p;

	TVLetterDataTypeChk(TV_RECENTLY_TYPE1);
	if( AnswerWork == 0 ) 
	{
		//change 02/09/19
		//KaiwaTVWorkInit(KAIWA_MODE_HAGAKI,tv_akino);
		p = (TV_Letter_Work *)&Fld.tv_event[tv_akino];
		KaiwaWorkInit( (u16 *)&p->easytalk[0], 6 );
	}
}

//--------------------------------------------------------------------
//	スクリプトから呼ばれる(手紙大好きクラブインタビューチェック)
//
//			TVLetterDataTypeChk(TV_CLUB_TYPE1);
//			ScrTVDataHimselfAkiChk();
//--------------------------------------------------------------------
void ScrLetterClubTypeChk()
{
	TV_Club_Work *p;

	TVLetterDataTypeChk(TV_CLUB_TYPE1);

	if( AnswerWork == 0 )
	{
		PM_strcpy( StrTempBuffer0, 
				PokeNameData[PokeParaGet(&PokeParaMine[GetTemotiBtlPokeNum()],ID_monsno,0)] );
		PokeParaGet( &PokeParaMine[GetTemotiBtlPokeNum()], ID_nickname, StrTempBuffer1 );
		NickNameCutOff( StrTempBuffer1 );

		//change 02/09/19
		//KaiwaTVWorkInit(KAIWA_MODE_INTERVIEW,tv_akino);
		p = (TV_Club_Work *)&Fld.tv_event[tv_akino];
		KaiwaWorkInit( (u16 *)&p->easytalk_no[0], 2 );
	}
}

//--------------------------------------------------------------------
//	スクリプトから呼ばれる(手紙ジムリーダー戦後のインタビューチェック)
//--------------------------------------------------------------------
void ScrLetterGymTypeChk()
{
	AnswerWork = 1;
	return;
}

//--------------------------------------------------------------------
//			スクリプトから呼ばれる(手紙姓名判断氏)
//
//			TVLetterDataTypeChk(TV_NAME_TYPE1);
//			ScrTVDataHimselfAkiChk();
//--------------------------------------------------------------------
void ScrLetterNameTypeChk()
{
	TVLetterDataTypeChk(TV_NAME_TYPE1);
}

//--------------------------------------------------------------------
//			スクリプトから呼ばれる(手紙コンテスト)
//
//			TVLetterDataTypeChk(TV_CONTEST_TYPE1);
//			ScrTVDataHimselfAkiChk();
//--------------------------------------------------------------------
void ScrLetterConTypeChk()
{
	TV_Con_Work *p;

	TVLetterDataTypeChk(TV_CONTEST_TYPE1);

	if( AnswerWork == 0 ) 
	{
		//change 02/09/19
		//KaiwaTVWorkInit(KAIWA_MODE_HAGAKI,tv_akino);
		p = (TV_Con_Work *)&Fld.tv_event[tv_akino];
		KaiwaWorkInit( (u16 *)&p->easytalk_no[0], 2 );
	}
}

//--------------------------------------------------------------------
//			スクリプトから呼ばれる(手紙バトルタワー)
//
//			TVLetterDataTypeChk(TV_TOWER_TYPE1);
//			ScrTVDataHimselfAkiChk();
//--------------------------------------------------------------------
void ScrLetterTowerTypeChk()
{
	TV_Tower_Work *p;

	TVLetterDataTypeChk(TV_TOWER_TYPE1);

	if( AnswerWork == 0 ) 
	{
		//change 02/09/19
		//KaiwaTVWorkInit(KAIWA_MODE_HAGAKI,tv_akino);
		p = (TV_Tower_Work *)&Fld.tv_event[tv_akino];
		KaiwaWorkInit( (u16 *)&p->easytalk_no, 1 );
	}
}

//--------------------------------------------------------------------
//		指定した手持ちポケモンにニックネームが付いているか
//
//	戻り値	0=付いてない
//			1=付いてる
//--------------------------------------------------------------------
u8 TopPokeNickNameChk(u8 no)
{
	//StrTempBuffer0に格納する
	PokeParaGet( &PokeParaMine[no], ID_nickname, StrTempBuffer0 );

	if( PM_strcmp( (u8 *)PokeNameData[PokeParaGet( &PokeParaMine[no], ID_monsno, 0 )],
				StrTempBuffer0 ) == 0 )
	{
		return 0;
	}

	return 1;
}

//--------------------------------------------------------------------
//			手持ち先頭ポケモンにニックネームが付いているか
//
//	戻り値	0=付いてない
//			1=付いてる
//--------------------------------------------------------------------
u8 ScrTopPokeNickNameChk()
{
	return TopPokeNickNameChk( GetTemotiBtlPokeNum() );
}

//--------------------------------------------------------------------
//					指定した場所のTVデータを削除
//--------------------------------------------------------------------
void TVDataClear(TV_EVENT *p, u8 no)
{
	u8		i;

	p[no].datatype		= TV_NODATA_TYPE1;
	p[no].watch_flag	= TV_WATCH_FLAG_OFF;

	for( i=0; i < 34 ;i++ )
		p[no].dmy[i] = 0;

	return;
}

//--------------------------------------------------------------------
//				空きがあればTVデータを前につめる(ソート)
//	TVを見たときに一番上のデータ以外がtime_count=0になっているときある
//	スクリプトでTV(BG)見たときに放送したらこれを呼ぶようにする
//--------------------------------------------------------------------
void TVDataSort(TV_EVENT *p)
{
	u8 i,j;

	//自分TVデータ
	for(i=0; i < TVDATA_HIMSELF_MAX-1 ;i++)
	{
		if( p[i].datatype == TV_NODATA_TYPE1 )	
		{
			for(j=i+1; j < TVDATA_HIMSELF_MAX ;j++)
			{
				if( p[j].datatype != TV_NODATA_TYPE1 )	
				{
					p[i]=p[j];
					TVDataClear(p,j);
					break;
				}
			}
		}
	}

	//相手TVデータ
	//初めのfor文で、TVDATA_MAX-1をしていないので、
	//要素数23のデータが空いていたらそこにつめようとするが
	//次のfor文でTV_DATA_MAXより小さかったらで、
	//23+1(i+1)でTV_DATA_MAXと等しくなるので大丈夫！(処理に入らない)
	for(i=TVDATA_HIMSELF_MAX; i < TVDATA_MAX ;i++)
	{
		if( p[i].datatype == TV_NODATA_TYPE1 )	
		{
			for(j=i+1; j < TVDATA_MAX ;j++)
			{
				if( p[j].datatype != TV_NODATA_TYPE1 )	
				{
					p[i]=p[j];
					TVDataClear(Fld.tv_event,j);
					break;
				}
			}
		}
	}

	return;
}

//--------------------------------------------------------------------
//					指定したポケモンナンバー以外の
//	  ランダムで取得したポケモンの名前を指定したbufにセットする
//--------------------------------------------------------------------
u16 SetRndChoicePokeSelectBuf(u8 buf, u16 pokeno)
{
	u16 ans;
	ans = RndChoicePoke(pokeno);
	PM_strcpy(tempbuf_list[buf], PokeNameData[ans] );
	return ans;
}

//--------------------------------------------------------------------
//					指定したポケモンナンバー以外の
//					ランダムなポケモンナンバーを取得する
//--------------------------------------------------------------------
u16 RndChoicePoke(u16 pokeno)
{
	u16 ans,hozon,z_pokeno=0;

	ans=(pp_rand() % KAIHATSU_NUM_MAX)+1;		//1-411
	hozon = ans;							//


	while(1)
	{
		//全国ポケモンナンバー
		z_pokeno = PokeMonsNo2ZukanNoGet( ans );

		if( ZukanCheck( z_pokeno, Z_SEE_CHK ) == 1 )
		{
			if( ans != pokeno )	break;
		}

		if( ans == 1 )	ans = KAIHATSU_NUM_MAX;
		else	ans--;

		//ポケモンナンバーを一周見たら終了
		if( ans == hozon )	
		{
			ans = pokeno;	//絶対にポチエナを見ているのでここにくることはない
			break;
		}
	};

	return ans;
}

//--------------------------------------------------------------------
//					自分データに空きがあるかチェック
//
//	tv_akinoに代入
//	(ScriptParameter2にtv_akinoを代入している)
//
//	AnswerWorkに結果が入る	0=ある
//							1=ない
//--------------------------------------------------------------------
void ScrTVDataHimselfAkiChk()
{	
	tv_akino = TVDataHimselfAkiChk((TV_EVENT *)Fld.tv_event);
	ScriptParameter2 = tv_akino;		//簡易会話用
	if( tv_akino == -1 )	
	{
		AnswerWork = 1;
		return;
	}

	AnswerWork = 0;
	return;
}

//--------------------------------------------------------------------
//				自分TVデータの空いている場所をかえす
//
//	戻り値		空きがあった	0～TVDATA_HIMSELF_MAXの数字
//				空きがなかった  -1
//--------------------------------------------------------------------
s8 TVDataHimselfAkiChk(TV_EVENT *p)
{
	u8 i;

	for(i=0; i < TVDATA_HIMSELF_MAX ;i++)
	{
		if( (p+i)->datatype == TV_NODATA_TYPE1 )	
			return i;
	}

	return -1;	//空きがない
}

//--------------------------------------------------------------------
//				相手TVデータの空いている場所をかえす
//
//	戻り値		空きがあった	TVDATA_HIMSELF_MAX～TVDATA_MAXの数字
//				空きがなかった  -1
//--------------------------------------------------------------------
s8 TVDataPartnerAkiChk(TV_EVENT *p)
{
	s8 i;

	for(i=TVDATA_HIMSELF_MAX; i < TVDATA_MAX ;i++)
	{
		if( (p+i)->datatype == TV_NODATA_TYPE1 )	
			return i;
	}

	return -1;	//空きがない
}

//--------------------------------------------------------------------
//					乱数を取得して渡された値との比較
//
//	戻り値		発生する	0
//				発生しない	1
//--------------------------------------------------------------------
u8 TVRndChk(u16 num)
{
	if( pp_rand() <= num )	return 0;
	else	return 1;
}

//--------------------------------------------------------------------
//			簡易会話文章の中からランダムで1ワードを取得する
//--------------------------------------------------------------------
void GetLetterRndKaiwaWord(TV_Letter_Work * p)
{
	u8 rnd;
	rnd = ( pp_rand() % 6 );

	while(1)
	{
		if( rnd == 6 )	rnd = 0;
		if( p->easytalk[rnd] != KAIWA_CODE_BLANK )	break;
		rnd++;
	}

	KaiwaCopyWord( StrTempBuffer2, p->easytalk[rnd] );
	return;
}

#define MOJI_BUF_MAX (MONS_NAME_SIZE+EOM_SIZE)
//--------------------------------------------------------------------
//					ポケモンのニックネームデータの
//					合計データの下位３ビットを返す
//--------------------------------------------------------------------
u8 GetPokeNickNameBit(TV_Name_Work *p)
{
	u16 max = 0;
	u8 i = 0;

	while( i < MOJI_BUF_MAX )
	{
		if( p->nickname[i]  == EOM_ )
		{
			break;
		}else
		{
			max+=p->nickname[i];	
		}

		i++;
	}

	return (max & 0x7);
}

//--------------------------------------------------------------------
//				指定したbufに指定した文字数目を代入する
//				
//	buf		StrTempBufferの何番目か
//	moijno	何文字目か
//	sw		0=頭から	1=後ろから	2=頭からmojino分	3=後ろからmojino分
//	work1	0=主人公の名前	1=ニックネーム	2=ポケモンの種類
//	work2	ポケモンナンバー(work1=2の時のみ必要)
//
//--------------------------------------------------------------------
void SetMojiNoSelectBuf(u8 buf, u8 mojino, u8 sw, u16 work1, u16 work2, TV_Name_Work * p )
{
	u8 setbuf[3],i;
	u16 max = 0;

	for( i=0; i < 3 ;i++ )
		setbuf[i] = EOM_;

	if( work1 == TV_NAME_MY )
	{
		max = PM_strlen( (const u8 *)p->player_name );

		if( sw == TV_NAME_NTOP )
		{
			setbuf[0] = p->player_name[mojino];
		}else if( sw == TV_NAME_NLAST )
		{
			setbuf[0] = p->player_name[max - mojino];
		}else if( sw == TV_NAME_TOP )
		{
			setbuf[0] = p->player_name[mojino];
			setbuf[1] = p->player_name[mojino+1];
		}else
		{
			setbuf[0] = p->player_name[max - (mojino+2)];
			setbuf[1] = p->player_name[max - (mojino+1)];
		}
	}else if( work1 == TV_NAME_NICK )
	{
		max = PM_strlen( (const u8 *)p->nickname );

		if( sw == TV_NAME_NTOP )
		{
			setbuf[0] = p->nickname[mojino];
		}else if( sw == TV_NAME_NLAST )
		{
			setbuf[0] = p->nickname[max - mojino];
		}else if( sw == TV_NAME_TOP )
		{
			setbuf[0] = p->nickname[mojino];
			setbuf[1] = p->nickname[mojino+1];
		}else
		{
			setbuf[0] = p->nickname[max - (mojino+2)];
			setbuf[1] = p->nickname[max - (mojino+1)];
		}
	}else
	{
		max = PM_strlen( (const u8 *)PokeNameData[work2] );

		if( sw == TV_NAME_NTOP )
		{
			setbuf[0] = PokeNameData[work2][mojino];
		}else if( sw == TV_NAME_NLAST )
		{
			setbuf[0] = PokeNameData[work2][max - mojino];
		}else if( sw == TV_NAME_TOP )
		{
			setbuf[0] = PokeNameData[work2][mojino];
			setbuf[1] = PokeNameData[work2][mojino+1];
		}else
		{
			setbuf[0] = PokeNameData[work2][max - (mojino+2)];
			setbuf[1] = PokeNameData[work2][max - (mojino+1)];
		}
	}

	PM_strcpy( tempbuf_list[buf], setbuf );
}

//--------------------------------------------------------------------
//					指定したＴＶデータがすでにあるか	
//					
//							未使用！！！
//--------------------------------------------------------------------
u8 ScrTVDataTypeChk()
{
	u8 i;
	
	for( i=0; i < TVDATA_HIMSELF_MAX ;i++ )
	{
		if( Fld.tv_event[i].datatype == ScriptParameter0 )
			return TRUE;
	}

	return FALSE;
}


/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/


//====================================================================
//
//							姓名判断氏
//
//====================================================================
u8 ScrNickNameChangeChk();
void ScrNickNameChange();
void ScrSetMyPokeNick();

//--------------------------------------------------------------------
//						ニックネームを変更したか
//
//	戻り値	0=してない
//			1=した
//--------------------------------------------------------------------
u8 ScrNickNameChangeChk()
{
	//StrTempBuffer0に格納する
	PokeParaGet( &PokeParaMine[ScriptParameter0], ID_nickname, StrTempBuffer0 );

	if( PM_strcmp( (u8 *)StrTempBuffer2, StrTempBuffer0 ) == 0 )
	{
		return 0;
	}

	//TVデータ作成
	LetterNameDataSet();
	return 1;
}

//--------------------------------------------------------------------
//							NameIn呼び出し
//
//					StrTempBuffer2に代入している
//--------------------------------------------------------------------
void ScrNickNameChange()
{
	//変更する前のニックネームをStrTempBuffer2に格納する
	PokeParaGet( &PokeParaMine[ScriptParameter0], ID_nickname, StrTempBuffer2 );

	//StrTempBuffer1に格納する
	PokeParaGet( &PokeParaMine[ScriptParameter0], ID_nickname, StrTempBuffer1 );

	NameIn( NAMEIN_POKE_NICK,
			StrTempBuffer1,
			PokeParaGet( &PokeParaMine[ScriptParameter0], ID_monsno, 0 ),
			PokeSexGet(&PokeParaMine[ScriptParameter0]),
			PokeParaGet( &PokeParaMine[ScriptParameter0], ID_personal_rnd, 0 ),
			ScrNickNameChangeRecover);
}

//--------------------------------------------------------------------
//							ニックネームセット
//--------------------------------------------------------------------
void ScrNickNameChangeRecover()
{
	PokeParaPut( &PokeParaMine[ScriptParameter0], ID_nickname, StrTempBuffer1 );
	FieldScriptRecover();
}

//--------------------------------------------------------------------
//						bufにニックネームセット
//--------------------------------------------------------------------
void ScrSetMyPokeNick()
{
	PokeParaGet( &PokeParaMine[ScriptParameter0], ID_nickname, StrTempBuffer0 );
	NickNameCutOff( StrTempBuffer0 );
}

//--------------------------------------------------------------------
//						トレーナーID比較
//
//	同じ	AnswerWork = 0
//	違う	AnswerWork = 1
//--------------------------------------------------------------------
void ScrTrainerIDCmp()
{
	u32 id;

	id = GetMyDataID();

	if( id == PokeParaGet( &PokeParaMine[ScriptParameter0], ID_id_no, 0) )
		AnswerWork = 0;
	else
		AnswerWork = 1;

}

//--------------------------------------------------------------------
//						通信タイプ取得
//
//	引数	データタイプ
//	戻り値	通信タイプ
//--------------------------------------------------------------------
u8 TVDataCopyTypeGet(u8 type)
{
	if( type == TV_NODATA_TYPE1 ) return NOCOPY_TYPE1;
	if( LETTER_TYPE_START <= type && type < LETTER_TYPE_MAX ) return CUT_TYPE1;
	if( SEC_TYPE_START <= type && type < SEC_TYPE_MAX ) return CUT_TYPE2;
	if( TIME_TYPE_START <= type && type < TIME_TYPE_MAX ) return CUT_TIME_TYPE;

	return NOCOPY_TYPE1;
}

//--------------------------------------------------------------------
//							IDを取得する	
//
//				id[0]|id[1]<<8|id[2]|<<16|id[3]<<24
//--------------------------------------------------------------------
u32 GetMyDataID()
{
	return ( MyData.ID[3] << 24 | MyData.ID[2] << 16 | MyData.ID[1] << 8 | MyData.ID[0] );
}

//--------------------------------------------------------------------
//							自宅のＴＶチェック
//
//	戻り値	0 = 自宅ＴＶを見れない
//			1 = 自宅ＴＶを見れる
//			2 = 自宅ＴＶを光らせない
//--------------------------------------------------------------------
u8 TVMyHomeChk()
{
	//ミシロタウンじゃなかったら
	if( Fld.MapID.div_id != T101 )	return FALSE;

	//自宅じゃなかったら
	if( MyData.my_sex == MALE )	//男
	{
		if( Fld.MapID.map_id != T101_R0101 )
			return FALSE;
	}else
	{
		if(	Fld.MapID.map_id != T101_R0201 )
			return FALSE;
	}

	//移動ポケモンニュースを流れていたら
	if( EventFlagCheck( SYS_MOVE_POKE_NEWS ) == TRUE )	return TRUE;

	//自宅ＴＶフラグがたっていたら
	if( EventFlagCheck( SYS_TV_HOME ) == TRUE )	
	{
		//ＴＶが光らないで「ピアノの上で・・・」
		return 2;
	}

	//SYS_TV_HOMEがたっていない状態でＴＶ放送をフリーで見ることはない！！
	//ここにくるのは強制イベント時(父がＴＶに出ている)ＴＶを光らせる時
	//強制イベント終了後はSYS_TV_HOMEがたつのでこの処理には入らない
	return TRUE;
}

//--------------------------------------------------------------------
//				TV放送がない時の「パパママ」セット
//
//				LOCALWORK3使用中(値が変更してもよい)
//				= 0まだランダム求めていない
//				= 1になっていたらママ
//				= 2になっていたらパパ
//				= 以外 % 2 + 1で1,2を求める
//--------------------------------------------------------------------
void TVNoDataMsgSet()
{
	u16 ans;

	//ミシロタウンだったら
	if( Fld.MapID.div_id == T101 )
	{
		//自宅だったら「ママ」にする
		if( MyData.my_sex == MALE )	//男
		{
			if( Fld.MapID.map_id == T101_R0101 )
			{
				PM_strcpy( StrTempBuffer0, str_mama );
				SetEventWorkValue(LOCALWORK3,1);
			}
		}else
		{
			if( Fld.MapID.map_id == T101_R0201 )
			{
				PM_strcpy( StrTempBuffer0, str_mama );
				SetEventWorkValue(LOCALWORK3,1);
			}
		}
	}


	//前回のランダムを引き継ぐ(厳密にではなく)
	if( GetEventWorkValue(LOCALWORK3) == 1 )				//ママ
	{
		PM_strcpy( StrTempBuffer0, str_mama );
		return;

	}else if( GetEventWorkValue(LOCALWORK3) == 2 )			//パパ
	{
		PM_strcpy( StrTempBuffer0, str_papa );
		return;

	}else if( GetEventWorkValue(LOCALWORK3) > 2 )			//以外
	{
		if( (GetEventWorkValue(LOCALWORK3) % 2 + 1) == 1 )
			PM_strcpy( StrTempBuffer0, str_mama );			//ママ
		else
			PM_strcpy( StrTempBuffer0, str_papa );			//パパ

		return;
	}


	//ランダムで「パパママ」をセットする
	ans = (pp_rand() % 2);

	if( ans )	
	{
		PM_strcpy( StrTempBuffer0, str_mama );		//ママ
		SetEventWorkValue(LOCALWORK3,1);
	}else
	{
		PM_strcpy( StrTempBuffer0, str_papa );			//パパ
		SetEventWorkValue(LOCALWORK3,2);
	}

	return;
}

//--------------------------------------------------------------------
//	バトルタワーで不正な終了をした時にインタビュアーを削除する	
//	シーンを０にクリアする
//--------------------------------------------------------------------
void TVBattleTowerInterViewClear();
void TVBattleTowerInterViewClear()
{
	SetEventWorkValue( WK_SCENE_BATTLE_TOWER, 0 );
	EvObjDelId( INTERVW1_01_PARK_BATTLE01, (u8)Fld.MapID.map_id, (u8)Fld.MapID.div_id );
	return;
}


