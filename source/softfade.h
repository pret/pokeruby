
#ifndef	__SOFTFADE_H__
#define	__SOFTFADE_H__


//;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//	フェード関係マクロ
//;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//----------------------------------------------------------
// 指定されたﾊﾟﾚｯﾄのVRAM上のｱﾄﾞﾚｽから赤、緑、青の色を取り出す
//	col_adr = 取り出すﾊﾟﾚｯﾄのVRAM上のｱﾄﾞﾚｽ
//----------------------------------------------------------
#define RED_DATA(color) 	((u8)(color & 31))
#define GREEN_DATA(color)	((u8)((color & 0x3E0) >> 5))
#define BLUE_DATA(color)	((u8)((color & 0x7C00) >> 10))

//----------------------------------------------------------
// col_dest = セットする場所(u16)
// col = セットするﾃﾞｰﾀ
//----------------------------------------------------------
#define RED_SET(col_dest, col)		\
{									\
	col_dest &= 0x7FE0;				\
	col_dest |= (u16)col;			\
}

#define GREEN_SET(col_dest, col)	\
{									\
	col_dest &= 0x7C1F;				\
	col_dest |= ((u16)col << 5);	\
}

#define BLUE_SET(col_dest, col)		\
{									\
	col_dest &= 0x03FF;				\
	col_dest |= ((u16)col << 10);	\
}

//----------------------------------------------------------
//		フェード計算
// before_color = 元の色
// after_color = 変更後の色
// evy = 係数(変更の度合い。0～16)
//----------------------------------------------------------
#define FADE_CHENJI(before_color, after_color, evy)			\
	(before_color+((after_color - before_color) * evy >> 4))
	//(before_color+(after_color - before_color) * evy/16)



#endif	//__SOFTFADE_H__

