//=========================================================================
//
//	pm_str.c
//
//	ポケモンＡＧＢ用メッセージ文字列関連
//
//=========================================================================


#include "common.h"
#include "print.h"
#include "fnt_tenji.h"
#include "message.h"

#define PM_STR_H_GLOBAL
#include "pm_str.h"

//#define PM_VERSION	VERSION_SAPPHIRE


//=========================================================================
//
//=========================================================================
extern const u8 * GetIndirectString( int i );

u8 StrTempBuffer0[STR_TEMP_BUF_LEN] ={};
u8 StrTempBuffer1[STR_TEMP_BUF_LEN] ={};
u8 StrTempBuffer2[STR_TEMP_BUF_LEN] ={};

u8 MsgExpandBuffer[MSG_EXPAND_BUF_LEN] ={};

//=========================================================================
//
//=========================================================================

u8 NumBuffer0[10];


static const u8 n_ch[] = {n0_,n1_,n2_,n3_,n4_,n5_,n6_,n7_,n8_,n9_,A__,B__,C__,D__,E__,F__};

static const int n_max[] = 
{
	1,
	10,
	100,
	1000,
	10000,
	100000,
	1000000,
	10000000,
	100000000,
	1000000000,
};

//=========================================================================
//
//=========================================================================

//u8 * PM_strncpy(u8 * to_str, const u8 * from_str, u16 n);
//u8 * PM_strncat(u8 * to_str, const u8 * from_str, u16 n);
//u8 * PM_StrToDecimal(int num, u8 * buf, u16 sw);

//=========================================================================
//
//=========================================================================

//-------------------------------------------------------------------------
//	ポケモン名のバッファ間コピー
//	※国別バージョンによって最大文字数制限が違う
//	<引数>	to_str		コピー先バッファ
//			from_str	コピー元バッファ
//	<戻り値>
//			コピー先バッファのEOM_を書き込んだアドレス
//-------------------------------------------------------------------------
u8 * NickNameCopy( u8 * to_str, const u8 * from_str )
{
	u8 i,max;
#if	( PM_LANG== LANG_JAPAN )
	max = 5;
#else
	max = MONS_NAME_SIZE;
#endif
	for ( i=0; i<max; i++ ) {
		to_str[i] = from_str[i];
		if ( from_str[i] == EOM_ ) return to_str + i;
	}
	to_str[i] = EOM_;
	return to_str + i;
}

//-------------------------------------------------------------------------
//	ポケモン名の終端チェック処理
//	※日本版の場合、6文字以上ある場合はEOM_で削除する
//	<引数>	s		名前が入っているバッファ
//	<戻り値>		EOM_アドレス
//-------------------------------------------------------------------------
u8 * NickNameCutOff( u8 * s )
{
	u8 i,max;
#if	( PM_LANG== LANG_JAPAN )
	max = 5;
#else
	max = MONS_NAME_SIZE;
#endif
	for ( i=0; i<max; i++ ) {
		if ( s[i] == EOM_ ) return s + i;
	}
	s[i] = EOM_;
	return s + i;
}

//-------------------------------------------------------------------------
//	親名のコピー
//	※国が違っても最大文字数制限は同じ
//	<引数>	to_str		コピー先バッファ
//			from_str	コピー元バッファ
//	<戻り値>
//			コピー先バッファのEOM_を書き込んだアドレス
//-------------------------------------------------------------------------
u8 * OyaNameCopy( u8 * to_str, const u8 * from_str )
{
	int i;
	for ( i=0; i<PERSON_NAME_SIZE+EOM_SIZE; i++ ) {
		to_str[i] = from_str[i];
		if ( to_str[i] == EOM_ ) {
			return to_str + i;
		}
	}
	to_str[i] = EOM_;
	return to_str + i;
}

//-------------------------------------------------------------------------
// PM_strcpy
// 文字列コピー
//
//	<入力パラメータ>
// 	to_str		コピー先バッファ
// 	from_str	文字列データ
//
// 	<返値>
// 	バッファにコピーしたデータ最後のEOM_へのポインタを返す
// 	データがない(文字列データ先頭がEOM_だった)場合、
// 	EOM_をバッファ先頭に書きこみ、そこへのポインタを返す
//-------------------------------------------------------------------------
u8 * PM_strcpy(u8 * to_str, const u8 * from_str)
{
		while(*from_str != EOM_)
		{
				*to_str = * from_str;
				to_str++; from_str++;
		};
		*to_str = EOM_;
		return to_str;
};

//-------------------------------------------------------------------------
// PM_strcat
// 文字列連結
//
//	<入力パラメータ>
//	to_str		連結されるデータ（ram上にあること！！）
//	from_str	連結するデータ
//
// 	<返値>
//	連結後のバッファ上のデータ末のEOM_へのポインタを返す
//-------------------------------------------------------------------------
u8 * PM_strcat(u8 * to_str, const u8 * from_str)
{
		while(*to_str != EOM_)to_str++;
		return PM_strcpy(to_str, from_str);
};


//-------------------------------------------------------------------------
// PM_strncpy
// 文字列コピー		2002/05/15 by nakahiro
//
//	<入力パラメータ>
// 	to_str		コピー先バッファ
// 	from_str	文字列データ
//	len			コピーバイト数
//
// 	<返値>
//	「コピー先バッファ + コピーバイト数」へのポインタ
//-------------------------------------------------------------------------
u8 * PM_strncpy( u8 * to_str, const u8 * from_str, u8 len )
{
	u16	i;

	for( i=0; i<len; i++ ){
		to_str[i] = from_str[i];
	}
	return &to_str[len];
};

//-------------------------------------------------------------------------
// PM_strncat
// 文字列連結		2002/05/15 by nakahiro
//
//	<入力パラメータ>
//	to_str		連結されるデータ（ram上にあること！！）
//	from_str	連結するデータ
//	len			連結するバイト数
//
// 	<返値>
//	連結後のバッファ上のデータ末へのポインタを返す
//-------------------------------------------------------------------------
u8 * PM_strncat( u8 * to_str, const u8 * from_str, u8 len )
{
		while(*to_str != EOM_)to_str++;
		return PM_strncpy( to_str, from_str, len );
};


//-------------------------------------------------------------------------
// PM_strlen
// 文字列長取得
//
//	<入力パラメータ>
//	s		対象文字列へのポインタ
//
//	<返値>
//	対象文字列の長さ（EOM_までの文字数）を返す
//-------------------------------------------------------------------------
u16 PM_strlen(const u8 * s)
{
		u16 len = 0;
		while(s[len] != EOM_)
		{
				len++;
		};
		return len;
};

//-------------------------------------------------------------------------
//	文字列比較
//	※Ｃ標準関数と違い長さの比較はしていない
//
//	<入力パラメータ>
//	s,t		対象文字列へのポインタ
//
//	<返値>
//	一致した時０、それ以外の場合非０の値を返す
//-------------------------------------------------------------------------
int PM_strcmp(const u8 *s, const u8 *t)
{
	while ( *s == *t ) {
		if ( *s == EOM_ ) return 0;
		s++;t++;
	}
	return *s - *t;
}

//-------------------------------------------------------------------------
//	文字列比較
//	※Ｃ標準関数と違い長さの比較はしていない
//
//	<入力パラメータ>
//	s,t		対象文字列へのポインタ
//	n		比較する最大の文字数
//
//	<返値>
//	一致した時０、それ以外の場合非０の値を返す
//-------------------------------------------------------------------------
int PM_strncmp(const u8 *s, const u8 *t, int n )
{
	while ( *s == *t ) {
		if ( *s == EOM_ ) return 0;
		s++;t++;
		n --;
		if ( n == 0 ) return 0;
	}
	return *s - *t;
}

//-------------------------------------------------------------------------
// PM_NumMsgSet
// 数値→文字列変換
//
//	<入力パラメータ>
//	buf		文字列を書きこむバッファのポインタ
//	num		文字列に変換したい数値
//	type	形式指定
//			== NUM_MODE_LEFT		 左詰
//			== NUM_MODE_SPACE		 右詰、足りない部分は空白
//			== NUM_MODE_ZERO		 右詰、足りない部分は数字のゼロ
//	keta	表示桁数
//
//	<返値>
//	数値の後ろに書きこんだEOM_へのポインタを返す
//-------------------------------------------------------------------------

#if 1
#define NUM_STR(n)	( n>=10 ? hate_ : n_ch[n] )
#define HEX_STR(n)	( n>=16 ? hate_ : n_ch[n] )
#else
u8 NUM_STR(u8 n)
{
		if(n >= 10)return hate_;
		return n_ch[n];
};
#endif

enum{
		STAT_NO_VAL,
		STAT_NEED_NUMBER,
		STAT_NEED_SPACE,
};


u8 * PM_NumMsgSet(u8 * buf, int num, NUM_MODE_TYPE type, u8 keta)
{
	int	i,max;
	u8 flag;
	u16	num_i;
	int num_f;

	max = n_max[keta-1];

	flag = STAT_NO_VAL;
	if(type == NUM_MODE_SPACE) { flag = STAT_NEED_SPACE ; }
	if(type == NUM_MODE_ZERO) { flag = STAT_NEED_NUMBER ; }

	for(i=max;i>0;i/=10){
		num_i=num/i;
		num_f = num - ( i * num_i );
	//	num_f=num%i;
		if(flag == STAT_NEED_NUMBER)
		{
				*(buf++) = NUM_STR(num_i);
		}
		else if( num_i != 0 || i==1)
		{
				flag = STAT_NEED_NUMBER;
				*(buf++) = NUM_STR(num_i);
		}
		else if(flag == STAT_NEED_SPACE)
		{
				*(buf++) = spc_;
		};
		num=num_f;
	//	num -= i * num_i;
	}
	*buf = EOM_;
	return buf;
};

u8 * PM_HexNumMsgSet(u8 * buf, int num, NUM_MODE_TYPE type, u8 keta)
{
	int	i,max;
	u8 flag;
	u32	num_i,num_f;
	u8 n;

	max = 1;
	for(n=1;n<keta;n++) { max *= 16; }

	flag = STAT_NO_VAL;
	if(type == NUM_MODE_SPACE) { flag = STAT_NEED_SPACE ; }
	if(type == NUM_MODE_ZERO) { flag = STAT_NEED_NUMBER ; }

	for(i=max;i>0;i/=16){
		num_i=num/i;
		num_f=num%i;
		if(flag == STAT_NEED_NUMBER)
		{
				*(buf++) = HEX_STR(num_i);
		}
		else if( num_i != 0 || i==1)
		{
				flag = STAT_NEED_NUMBER;
				*(buf++) = HEX_STR(num_i);
		}
		else if(flag == STAT_NEED_SPACE)
		{
				*(buf++) = spc_;
		};
		num=num_f;
	//	num -= i * num_i;
	}
	*buf = EOM_;
	return buf;
};




//=================================================================
// PM_MsgExpand
// メッセージ展開ルーチン
// 	I_MSG_で参照される部分メッセージを含んだメッセージを展開する
//
//	<入力パラメータ>
//	buf		メッセージを展開するバッファへのポインタ
//	data	展開する元データへのポインタ
//
//	<返値>
//	展開後のメッセージデータ末のEOM_へのポインタを返す
//=================================================================

u8 * PM_MsgExpand(u8 * buf, const u8 * data)
{
	u8 c = 0;

	while ( TRUE ) {

		c = *data;
		data++;
		switch ( c ) {
		case EOM_:
			*buf = EOM_;
			return buf;

		case I_MSG_:
			buf = PM_MsgExpand( buf, GetIndirectString(*(data++)) );
			break;

		case CTRL_:
			*(buf++) = c;
			c = *data; data++;
			*(buf++) = c;
			switch ( c ) {
			/*パラメータなし*/
			case C_FNML_:
			case C_TRGWAIT_:
			case C_CLR_:
				break;
			/*パラメータ3つ*/
			case C_ACOL_:
				*(buf++) = *(data++);
				*(buf++) = *(data++);
				*(buf++) = *(data++);
				break;
			/*通常はパラメータ1つ*/
			default:
				*(buf++) = *(data++);
				break;
			}
			break;

		case CR_:
		case SCROLL_WAIT_:
		case NORMAL_WAIT_:
		default:
			*buf = c;
			buf++;

		}
	}
	return NULL;
}

//=================================================================
//	点字データ展開ルーチン
//		※点字データにヘッダを付加、一文字ずつ間を空ける
//	<引数>	buf		展開先バッファ
//			data	読み込みデータ
//	<戻り値>		最後のEOM_を書き込んだバッファのアドレス
//
//	点字1文字は2X2キャラで構成される。
//	このルーチンで通常の点字1文字は左半分＋右半分にコンバートされる
//	左半分と右半分の8X16サイズ文字として登録されている。
//
//=================================================================
u8 * PM_TenjiExpand( u8 * buf, const u8 * data )
{
	u8 c;
	const u8 header[] = { CTRL_,C_FCHG_,FONTTENJITYPE,EOM_ };
	const u8 cr_line[] = { CR_,CTRL_,C_YCHG_,2,EOM_ };

	buf = PM_strcpy( buf, header );
	c = 0;

	while (TRUE) {

		c = *data;	data++;

		switch (c) {

		case EOM_:
			*buf = c;
			return buf;

		case CR_:
			buf = PM_strcpy( buf, cr_line );
			break;

		default:
			*buf = c;			//左半分
			buf ++;
			*buf = c + 0x40;	//右半分、点字は全部で64==0x40種類
			buf ++;
			break;
		}
	}
}


//=========================================================================
//
// 参照バッファ呼び出し
//
//	※I_MSG_コードの展開用
//=========================================================================

//-------------------------------------------------------------------------
//	文字列取得用ルーチン
//-------------------------------------------------------------------------
static const u8 * Get_NumBuffer(void)
{
	return NumBuffer0;
}

static const u8 * Get_my_name(void)
{
	return MyData.my_name;
}

static const u8 * Get_StrTemp0(void)
{
	return StrTempBuffer0;
}

static const u8 * Get_StrTemp1(void)
{
	return StrTempBuffer1;
}

static const u8 * Get_StrTemp2(void)
{
	return StrTempBuffer2;
}

static const u8 * Get_MyNameSuffix(void)
{
	if ( MyData.my_sex == MALE ) {
		return kun_string;
	} else {
		return chan_string;
	};
}

static const u8 * Get_SupportCharacterName( void )
{
	if ( MyData.my_sex == MALE ) {
		return str_support_female;
	} else {
		return str_support_male;
	}
}

static const u8 * Get_VersionString( void )
{
#if ( PM_VERSION == VERSION_SAPPHIRE )
	return str_ver_sapphire;
#elif ( PM_VERSION == VERSION_RUBY )
	return str_ver_ruby;
#endif
}

static const u8 * Get_EnemyGroupName( void )
{
#if ( PM_VERSION == VERSION_SAPPHIRE )
	return str_aqua;
#elif ( PM_VERSION == VERSION_RUBY )
	return str_maguma;
#endif
}

static const u8 * Get_FriendlyGroupName( void )
{
#if ( PM_VERSION == VERSION_SAPPHIRE )
	return str_maguma;
#elif ( PM_VERSION == VERSION_RUBY )
	return str_aqua;
#endif
}

static const u8 * Get_EnemyLeaderName( void )
{
#if ( PM_VERSION == VERSION_SAPPHIRE )
	return str_aogiri;
#elif ( PM_VERSION == VERSION_RUBY )
	return str_matubusa;
#endif
}

static const u8 * Get_FriendlyLeaderName( void )
{
#if ( PM_VERSION == VERSION_SAPPHIRE )
	return str_matubusa;
#elif ( PM_VERSION == VERSION_RUBY )
	return str_aogiri;
#endif
}

static const u8 * Get_MainKeyPokemonName( void )
{
#if ( PM_VERSION == VERSION_SAPPHIRE )
	return str_kaiouga;
#elif ( PM_VERSION == VERSION_RUBY )
	return str_guradon;
#endif
}

static const u8 * Get_SubKeyPokemonName( void )
{
#if ( PM_VERSION == VERSION_SAPPHIRE )
	return str_guradon;
#elif ( PM_VERSION == VERSION_RUBY )
	return str_kaiouga;
#endif
}


// バッファ定義テーブル
#include "i_msg.tbl"


//-------------------------------------------------------------------------
//	文字列取得関数
//-------------------------------------------------------------------------
const u8 * GetIndirectString( int i )
{
	if ( i >= NELEMS(GetStrFuncList) ) return dummy_string;
	return (GetStrFuncList[i])();
}



/*======================================================================
==	文字列バッファを指定文字コードでクリア
==	to     文字列バッファ
==	code   文字コード
==	len    クリアする文字数
==
==	return : EOM_ アドレス                                       TAYA
======================================================================*/
u8* PM_strclear(u8 *to, u8 code, u16 len)
{
	u16 i;
	for(i = 0; i < len; i++){
		*to++ = code;
	}
	*to = EOM_;
	return to;
}
/*======================================================================
==	文字列コピー後、指定文字数に満たない分だけ、指定文字コードでクリア
==	to     コピー先文字列バッファ
==	from   コピー元文字列
==	code   クリア文字コード
==	len    クリアする文字数
==
==	return : EOM_ アドレス                                        TAYA
======================================================================*/
u8* PM_strcpy_clear(u8 *to, const u8 *from, u8 code, u16 len)
{
	while(*from != EOM_){
		*to++ = *from++;
		if(len){ len--; }
	}
	while(len--){
		*to++ = code;
	}
	*to = EOM_;
	return to;
}
/*======================================================================
==	文字列バッファをEOM_コードでクリア
==	to     文字列バッファ
==	len    クリアする文字数
==
==	return : クリア終端のEOM_ アドレス
======================================================================*/
u8* PM_strclearEOM_(u8 *to, u16 len)
{
	return PM_strclear(to, EOM_, len);
}

