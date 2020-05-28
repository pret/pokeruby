/******************************************************************************/
/*                                                                            */
/*  マップ施設名データ                                                        */
/*                                                                   taya     */
/******************************************************************************/
#include "common.h"
#include "intr.h"
#include "decord.h"
#include "ev_flag.h"
#include "map_inst.dat"

/***********************************************************************
**  プロトタイプ                                                      **
***********************************************************************/
static const PLACE * const * get_place(u8 mapno, u8 subno);

/*==============================================================
==  地域にある施設・地形の名称（文字列ポインタ）を返す
==
==  mapno  地域ナンバー
==  subno  地域サブナンバー
==  num    施設番号
==
== return: 文字列ポインタ（それ以上無ければ NULL）
==
==============================================================*/
const u8* GetAreaInstitution(u8 mapno, u8 subno, u8 num)
{
	const PLACE* const * place;

	place = get_place(mapno, subno);
	if(place == NULL){ return NULL; }

	while(1)
	{
		if(((*place)->flag == 0xffff)
		|| (EventFlagCheck((*place)->flag) == 1)
		)
		{
			if(num == 0)
			{
				break;
			}
			num--;
		}
		place++;
		if((*place) == NULL)
		{
			return NULL;
		}
	}
	return (*place)->name;
}
/*====================================================*/
/*  地域ナンバー・サブナンバーに合致する、施設名データ*/
/*  配列を返す                                        */
/*                                                    */
/*  mapno  地域ナンバー                               */
/*  subno  地域サブナンバー                           */
/*                                                    */
/* return:  文字列ポインタの配列                      */
/*        （合致するデータがなければNULL）            */
/*                                                    */
/*====================================================*/
static const PLACE * const * get_place(u8 mapno, u8 subno)
{
	u16 i;

	for(i = 0; InstitutionData[i].mapno != MAPPOS_END; i++){
		if(InstitutionData[i].mapno > mapno){ return NULL; }
		if(InstitutionData[i].mapno == mapno){ break; }
	}

	if(InstitutionData[i].mapno == MAPPOS_END){ return NULL; }

	while(InstitutionData[i].mapno == mapno){
		if(InstitutionData[i].subno ==subno){
			return InstitutionData[i].place;
		}
		i++;
	}

	return NULL;

#if 0
	for(i = 0; i < InstitutionData[i].mapno < mapno; i++){
		if(InstitutionData[i].mapno == MAPPOS_END){ return NULL; }
	}

	while(InstitutionData[i].mapno == mapno){
		if(InstitutionData[i].subno ==subno){
			return InstitutionData[i].name;
		}
		i++;
	}

	return NULL;
#endif
}
