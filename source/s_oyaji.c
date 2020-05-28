//=========================================================================
//
//	シンガーソングおやじ関連
//
//=========================================================================
#include "common.h"
#include "task.h"

void SongOyajiInit( s16* work, u16 tango, u16 melody );
void SongOyajiPlay( s16* work, u8 code );
void SongOyajiPicthChange( s16* work );

#define	C3___	((256* 0)-(256*3))
#define CS3__	((256* 1)-(256*3))
#define D3___	((256* 2)-(256*3))
#define DS3__	((256* 3)-(256*3))
#define E3___	((256* 4)-(256*3))
#define F3___	((256* 5)-(256*3))
#define FS3__	((256* 6)-(256*3))
#define G3___	((256* 7)-(256*3))
#define GS3__	((256* 8)-(256*3))
#define A3___	((256* 9)-(256*3))
#define AS3__	((256*10)-(256*3))
#define B3___	((256*11)-(256*3))
#define C4___	((256*12)-(256*3))
#define CS4__	((256*13)-(256*3))
#define D4___	((256*14)-(256*3))
#define DS4__	((256*15)-(256*3))
#define E4___	((256*16)-(256*3))
#define F4___	((256*17)-(256*3))
#define FS4__	((256*18)-(256*3))
#define G4___	((256*19)-(256*3))
#define GS4__	((256*20)-(256*3))
#define A4___	((256*21)-(256*3))
#define AS4__	((256*22)-(256*3))
#define B4___	((256*23)-(256*3))

#define END__	(256*24)

#define OYJ_VOLUME_S	(0.75*256)
#define OYJ_NOBASU		-1
#define OYJ_KILL		-2

enum{
	OYJ_VOLUME = 10,
	OYJ_COUNT,
	OYJ_TANGO,
	OYJ_MELODY,
	OYJ_FLAG,
};

//ソングデータ（１文字）
static const s16 SongOyaji101[] = { C3___, END__, };
static const s16 SongOyaji102[] = { C4___, END__, };
static const s16 SongOyaji103[] = { E3___, END__, };
static const s16 SongOyaji104[] = { G3___, END__, };
static const s16 SongOyaji105[] = { D4___, END__, };

//ソングデータ（２文字）
static const s16 SongOyaji201[] = { C3___, D3___, END__, };
static const s16 SongOyaji202[] = { C3___, F3___, END__, };
static const s16 SongOyaji203[] = { F3___, G3___, END__, };
static const s16 SongOyaji204[] = { A3___, B3___, END__, };
static const s16 SongOyaji205[] = { C4___, B3___, END__, };

//ソングデータ（３文字）
static const s16 SongOyaji301[] = { C3___, D3___, C3___, END__, };
static const s16 SongOyaji302[] = { G3___, C3___, G3___, END__, };
static const s16 SongOyaji303[] = { C4___, B3___, A3___, END__, };
static const s16 SongOyaji304[] = { E3___, F3___, G3___, END__, };
static const s16 SongOyaji305[] = { A3___, G4___, E4___, END__, };

//ソングデータ（４文字）
static const s16 SongOyaji401[] = { G3___, C4___, G3___, C4___, END__, };
static const s16 SongOyaji402[] = { C4___, G3___, E4___, G3___, END__, };
static const s16 SongOyaji403[] = { E3___, F3___, G3___, A3___, END__, };
static const s16 SongOyaji404[] = { B3___, A3___, G3___, F3___, END__, };
static const s16 SongOyaji405[] = { FS4__, E4___, D4___, CS4__, END__, };

//ソングデータ（５文字）
static const s16 SongOyaji501[] = { C3___, D3___, E3___, F3___, G3___, END__, };
static const s16 SongOyaji502[] = { C4___, B3___, A3___, G3___, F3___, END__, };
static const s16 SongOyaji503[] = { E3___, G3___, C4___, G3___, E3___, END__, };
static const s16 SongOyaji504[] = { C4___, G3___, C4___, G3___, C3___, END__, };
static const s16 SongOyaji505[] = { D4___, B3___, G3___, G3___, A3___, END__, };

//ソングデータ（６文字）
static const s16 SongOyaji601[] = { C3___, D3___, E3___, F3___, G3___, A3___, END__, };
static const s16 SongOyaji602[] = { B3___, A3___, G3___, F3___, E3___, D3___, END__, };
static const s16 SongOyaji603[] = { E3___, F3___, G3___, E3___, F3___, G4___, END__, };
static const s16 SongOyaji604[] = { G3___, C3___, C4___, G3___, C4___, G3___, END__, };
static const s16 SongOyaji605[] = { B3___, C4___, B3___, C4___, B3___, C4___, END__, };

//ソングデータ（７文字）
static const s16 SongOyaji701[] = { F3___, E3___, F3___, E3___, F3___, G3___, F3___, END__, };
static const s16 SongOyaji702[] = { E3___, E3___, D3___, D3___, C3___, G3___, C3___, END__, };
static const s16 SongOyaji703[] = { B3___, C4___, D4___, E4___, F4___, E4___, D4___, END__, };
static const s16 SongOyaji704[] = { B3___, A3___, G3___, F3___, E4___, D4___, C4___, END__, };
static const s16 SongOyaji705[] = { FS3__, G3___, A3___, B3___, AS3__, B3___, G3___, END__, };

static const s16* const SongOyajiData[]={
	SongOyaji101, SongOyaji102, SongOyaji103, SongOyaji104, SongOyaji105,
	SongOyaji201, SongOyaji202, SongOyaji203, SongOyaji204, SongOyaji205,
	SongOyaji301, SongOyaji302, SongOyaji303, SongOyaji304, SongOyaji305,
	SongOyaji401, SongOyaji402, SongOyaji403, SongOyaji404, SongOyaji405,
	SongOyaji501, SongOyaji502, SongOyaji503, SongOyaji504, SongOyaji505,
	SongOyaji601, SongOyaji602, SongOyaji603, SongOyaji604, SongOyaji605,
	SongOyaji701, SongOyaji702, SongOyaji703, SongOyaji704, SongOyaji705,
};

//あいうえおデータ
static const s16 SongOyajiVoiceData[] = {
	//se code, volume
	OYJ_KILL,	1*256,		/* "　" */
	SE_A,		1*256,		/* "あ" */
	SE_I,		1*256,		/* "い" */
	SE_U,		1*256,		/* "う" */
	SE_E,		1*256,		/* "え" */
	SE_O,		1*256,		/* "お" */
	SE_A,		1*256,		/* "か" */
	SE_I,		1*256,		/* "き" */
	SE_U,		1*256,		/* "く" */
	SE_E,		1*256,		/* "け" */
	SE_O,		1*256,		/* "こ" */
	SE_A,		1*256,		/* "さ" */
	SE_I,		1*256,		/* "し" */
	SE_U,		1*256,		/* "す" */
	SE_E,		1*256,		/* "せ" */
	SE_O,		1*256,		/* "そ" */
	SE_A,		1*256,		/* "た" */
	SE_I,		1*256,		/* "ち" */
	SE_U,		1*256,		/* "つ" */
	SE_E,		1*256,		/* "て" */
	SE_O,		1*256,		/* "と" */
	SE_A,		1*256,		/* "な" */
	SE_I,		1*256,		/* "に" */
	SE_U,		1*256,		/* "ぬ" */
	SE_E,		1*256,		/* "ね" */
	SE_O,		1*256,		/* "の" */
	SE_A,		1*256,		/* "は" */
	SE_I,		1*256,		/* "ひ" */
	SE_U,		1*256,		/* "ふ" */
	SE_E,		1*256,		/* "へ" */
	SE_O,		1*256,		/* "ほ" */
	SE_A,		1*256,		/* "ま" */
	SE_I,		1*256,		/* "み" */
	SE_U,		1*256,		/* "む" */
	SE_E,		1*256,		/* "め" */
	SE_O,		1*256,		/* "も" */
	SE_A,		1*256,		/* "や" */
	SE_U,		1*256,		/* "ゆ" */
	SE_O,		1*256,		/* "よ" */
	SE_A,		1*256,		/* "ら" */
	SE_I,		1*256,		/* "り" */
	SE_U,		1*256,		/* "る" */
	SE_E,		1*256,		/* "れ" */
	SE_O,		1*256,		/* "ろ" */
	SE_A,		1*256,		/* "わ" */
	SE_O,		1*256,		/* "を" */
	SE_N,		1*256,		/* "ん" */

	SE_A,		OYJ_VOLUME_S,	/* "ぁ" */
	SE_I,		OYJ_VOLUME_S,	/* "ぃ" */
	SE_U,		OYJ_VOLUME_S,	/* "ぅ" */
	SE_E,		OYJ_VOLUME_S,	/* "ぇ" */
	SE_O,		OYJ_VOLUME_S,	/* "ぉ" */
	SE_A,		OYJ_VOLUME_S,	/* "ゃ" */
	SE_U,		OYJ_VOLUME_S,	/* "ゅ" */
	SE_O,		OYJ_VOLUME_S,	/* "ょ" */

//	OYJ_NOBASU,	OYJ_VOLUME_S,	/* "ぁ" */
//	OYJ_NOBASU,	OYJ_VOLUME_S,	/* "ぃ" */
//	OYJ_NOBASU,	OYJ_VOLUME_S,	/* "ぅ" */
//	OYJ_NOBASU,	OYJ_VOLUME_S,	/* "ぇ" */
//	OYJ_NOBASU,	OYJ_VOLUME_S,	/* "ぉ" */
//	OYJ_NOBASU,	OYJ_VOLUME_S,	/* "ゃ" */
//	OYJ_NOBASU,	OYJ_VOLUME_S,	/* "ゅ" */
//	OYJ_NOBASU,	OYJ_VOLUME_S,	/* "ょ" */

	SE_A,		1*256,		/* "が" */
	SE_I,		1*256,		/* "ぎ" */
	SE_U,		1*256,		/* "ぐ" */
	SE_E,		1*256,		/* "げ" */
	SE_O,		1*256,		/* "ご" */
	SE_A,		1*256,		/* "ざ" */
	SE_I,		1*256,		/* "じ" */
	SE_U,		1*256,		/* "ず" */
	SE_E,		1*256,		/* "ぜ" */
	SE_O,		1*256,		/* "ぞ" */
	SE_A,		1*256,		/* "だ" */
	SE_I,		1*256,		/* "ぢ" */
	SE_U,		1*256,		/* "づ" */
	SE_E,		1*256,		/* "で" */
	SE_O,		1*256,		/* "ど" */
	SE_A,		1*256,		/* "ば" */
	SE_I,		1*256,		/* "び" */
	SE_U,		1*256,		/* "ぶ" */
	SE_E,		1*256,		/* "べ" */
	SE_O,		1*256,		/* "ぼ" */
	SE_A,		1*256,		/* "ぱ" */
	SE_I,		1*256,		/* "ぴ" */
	SE_U,		1*256,		/* "ぷ" */
	SE_E,		1*256,		/* "ぺ" */
	SE_O,		1*256,		/* "ぽ" */
	OYJ_KILL,	1*256,		/* "っ" */
	SE_A,		1*256,		/* "ア" */
	SE_I,		1*256,		/* "イ" */
	SE_U,		1*256,		/* "ウ" */
	SE_E,		1*256,		/* "エ" */
	SE_O,		1*256,		/* "オ" */
	SE_A,		1*256,		/* "カ" */
	SE_I,		1*256,		/* "キ" */
	SE_U,		1*256,		/* "ク" */
	SE_E,		1*256,		/* "ケ" */
	SE_O,		1*256,		/* "コ" */
	SE_A,		1*256,		/* "サ" */
	SE_I,		1*256,		/* "シ" */
	SE_U,		1*256,		/* "ス" */
	SE_E,		1*256,		/* "セ" */
	SE_O,		1*256,		/* "ソ" */
	SE_A,		1*256,		/* "タ" */
	SE_I,		1*256,		/* "チ" */
	SE_U,		1*256,		/* "ツ" */
	SE_E,		1*256,		/* "テ" */
	SE_O,		1*256,		/* "ト" */
	SE_A,		1*256,		/* "ナ" */
	SE_I,		1*256,		/* "ニ" */
	SE_U,		1*256,		/* "ヌ" */
	SE_E,		1*256,		/* "ネ" */
	SE_O,		1*256,		/* "ノ" */
	SE_A,		1*256,		/* "ハ" */
	SE_I,		1*256,		/* "ヒ" */
	SE_U,		1*256,		/* "フ" */
	SE_E,		1*256,		/* "ヘ" */
	SE_O,		1*256,		/* "ホ" */
	SE_A,		1*256,		/* "マ" */
	SE_I,		1*256,		/* "ミ" */
	SE_U,		1*256,		/* "ム" */
	SE_E,		1*256,		/* "メ" */
	SE_O,		1*256,		/* "モ" */
	SE_A,		1*256,		/* "ヤ" */
	SE_U,		1*256,		/* "ユ" */
	SE_O,		1*256,		/* "ヨ" */
	SE_A,		1*256,		/* "ラ" */
	SE_I,		1*256,		/* "リ" */
	SE_U,		1*256,		/* "ル" */
	SE_E,		1*256,		/* "レ" */
	SE_O,		1*256,		/* "ロ" */
	SE_A,		1*256,		/* "ワ" */
	SE_O,		1*256,		/* "ヲ" */
	SE_N,		1*256,		/* "ン" */

	SE_A,		OYJ_VOLUME_S,		/* "ァ" */
	SE_I,		OYJ_VOLUME_S,		/* "ィ" */
	SE_U,		OYJ_VOLUME_S,		/* "ゥ" */
	SE_E,		OYJ_VOLUME_S,		/* "ェ" */
	SE_O,		OYJ_VOLUME_S,		/* "ォ" */
	SE_A,		OYJ_VOLUME_S,		/* "ャ" */
	SE_U,		OYJ_VOLUME_S,		/* "ュ" */
	SE_O,		OYJ_VOLUME_S,		/* "ョ" */

//	OYJ_NOBASU,	OYJ_VOLUME_S,		/* "ァ" */
//	OYJ_NOBASU,	OYJ_VOLUME_S,		/* "ィ" */
//	OYJ_NOBASU,	OYJ_VOLUME_S,		/* "ゥ" */
//	OYJ_NOBASU,	OYJ_VOLUME_S,		/* "ェ" */
//	OYJ_NOBASU,	OYJ_VOLUME_S,		/* "ォ" */
//	OYJ_NOBASU,	OYJ_VOLUME_S,		/* "ャ" */
//	OYJ_NOBASU,	OYJ_VOLUME_S,		/* "ュ" */
//	OYJ_NOBASU,	OYJ_VOLUME_S,		/* "ョ" */

	SE_A,		1*256,		/* "ガ" */
	SE_I,		1*256,		/* "ギ" */
	SE_U,		1*256,		/* "グ" */
	SE_E,		1*256,		/* "ゲ" */
	SE_O,		1*256,		/* "ゴ" */
	SE_A,		1*256,		/* "ザ" */
	SE_I,		1*256,		/* "ジ" */
	SE_U,		1*256,		/* "ズ" */
	SE_E,		1*256,		/* "ゼ" */
	SE_O,		1*256,		/* "ゾ" */
	SE_A,		1*256,		/* "ダ" */
	SE_I,		1*256,		/* "ヂ" */
	SE_U,		1*256,		/* "ヅ" */
	SE_E,		1*256,		/* "デ" */
	SE_O,		1*256,		/* "ド" */
	SE_A,		1*256,		/* "バ" */
	SE_I,		1*256,		/* "ビ" */
	SE_U,		1*256,		/* "ブ" */
	SE_E,		1*256,		/* "ベ" */
	SE_O,		1*256,		/* "ボ" */
	SE_A,		1*256,		/* "パ" */
	SE_I,		1*256,		/* "ピ" */
	SE_U,		1*256,		/* "プ" */
	SE_E,		1*256,		/* "ペ" */
	SE_O,		1*256,		/* "ポ" */
	OYJ_KILL,	1*256,		/* "ッ" */
	SE_E,		1*256,		/* "０" */
	SE_I,		1*256,		/* "１" */
	SE_I,		1*256,		/* "２" */
	SE_A,		1*256,		/* "３" */
	SE_I,		1*256,		/* "４" */
	SE_O,		1*256,		/* "５" */
	SE_O,		1*256,		/* "６" */
	SE_A,		1*256,		/* "７" */
	SE_A,		1*256,		/* "８" */
	SE_U,		1*256,		/* "９" */
	OYJ_KILL,	1*256,		/* "！" */
	OYJ_KILL,	1*256,		/* "？" */
	OYJ_KILL,	1*256,		/* "。" */
	OYJ_NOBASU,	1*256,		/* "ー" */
	OYJ_KILL,	1*256,		/* "・" */
	0,			1*256,		/* "…" */
	OYJ_KILL,	1*256,		/* "『" */
	OYJ_KILL,	1*256,		/* "』" */
	OYJ_KILL,	1*256,		/* "「" */
	OYJ_KILL,	1*256,		/* "」" */
	OYJ_KILL,	1*256,		/* "♂" */
	OYJ_KILL,	1*256,		/* "♀" */
	SE_A,		1*256,		/* "円" */
	OYJ_KILL,	1*256,		/* "．" */
	OYJ_KILL,	1*256,		/* "×" */
	OYJ_KILL,	1*256,		/* "／" */
	SE_E,		1*256,		/* "Ａ" */
	SE_I,		1*256,		/* "Ｂ" */
	SE_I,		1*256,		/* "Ｃ" */
	SE_I,		1*256,		/* "Ｄ" */
	SE_I,		1*256,		/* "Ｅ" */
	SE_E,		1*256,		/* "Ｆ" */
	SE_I,		1*256,		/* "Ｇ" */
	SE_E,		1*256,		/* "Ｈ" */
	SE_A,		1*256,		/* "Ｉ" */
	SE_E,		1*256,		/* "Ｊ" */
	SE_E,		1*256,		/* "Ｋ" */
	SE_E,		1*256,		/* "Ｌ" */
	SE_E,		1*256,		/* "Ｍ" */
	SE_E,		1*256,		/* "Ｎ" */
	SE_O,		1*256,		/* "Ｏ" */
	SE_I,		1*256,		/* "Ｐ" */
	SE_U,		1*256,		/* "Ｑ" */
	SE_A,		1*256,		/* "Ｒ" */
	SE_E,		1*256,		/* "Ｓ" */
	SE_I,		1*256,		/* "Ｔ" */
	SE_U,		1*256,		/* "Ｕ" */
	SE_U,		1*256,		/* "Ｖ" */
	SE_A,		1*256,		/* "Ｗ" */
	SE_E,		1*256,		/* "Ｘ" */
	SE_A,		1*256,		/* "Ｙ" */
	SE_E,		1*256,		/* "Ｚ" */
	SE_E,		1*256,		/* "ａ" */
	SE_I,		1*256,		/* "ｂ" */
	SE_I,		1*256,		/* "ｃ" */
	SE_I,		1*256,		/* "ｄ" */
	SE_I,		1*256,		/* "ｅ" */
	SE_E,		1*256,		/* "ｆ" */
	SE_I,		1*256,		/* "ｇ" */
	SE_E,		1*256,		/* "ｈ" */
	SE_A,		1*256,		/* "ｉ" */
	SE_E,		1*256,		/* "ｊ" */
	SE_E,		1*256,		/* "ｋ" */
	SE_E,		1*256,		/* "ｌ" */
	SE_E,		1*256,		/* "ｍ" */
	SE_E,		1*256,		/* "ｎ" */
	SE_O,		1*256,		/* "ｏ" */
	SE_I,		1*256,		/* "ｐ" */
	SE_U,		1*256,		/* "ｑ" */
	SE_A,		1*256,		/* "ｒ" */
	SE_E,		1*256,		/* "ｓ" */
	SE_I,		1*256,		/* "ｔ" */
	SE_U,		1*256,		/* "ｕ" */
	SE_U,		1*256,		/* "ｖ" */
	SE_A,		1*256,		/* "ｗ" */
	SE_E,		1*256,		/* "ｘ" */
	SE_A,		1*256,		/* "ｙ" */
	SE_E,		1*256,		/* "ｚ" */
	OYJ_KILL,	1*256,		/*カーソル */
};

void SongOyajiInit( s16* work, u16 tango, u16 melody )
{
	work[ OYJ_COUNT ] = 0;
	work[ OYJ_TANGO ] = tango-1;
	work[ OYJ_MELODY ] = melody;
	work[ OYJ_FLAG ] = 0;
}

void SongOyajiPlay( s16* work, u8 code )
{
	s16	se_no;

	work[ OYJ_VOLUME ] = SongOyajiVoiceData[ code*2+1 ];

	se_no = SongOyajiVoiceData[ code*2 ];

	switch( se_no ){
		case OYJ_KILL:
			m4aMPlayStop( &m4a_mplay001 );
			work[ OYJ_FLAG ]++;
			break;
		case OYJ_NOBASU:
		case 0:
			work[ OYJ_FLAG ]++;
			break;
		default:
			m4aSongNumStart( se_no );
			break;
	};
}

void SongOyajiPicthChange( s16* work )
{
	s16*	oyaji_addr;

	if( work[ OYJ_FLAG ] ){
		work[ OYJ_FLAG ] = 0;
	}else{
		m4aMPlayVolumeControl( &m4a_mplay001, 0xffff, (u16)work[ OYJ_VOLUME ] );
		oyaji_addr = (s16*)SongOyajiData[ work[OYJ_TANGO] * 5 + work[OYJ_MELODY] ];
		m4aMPlayPitchControl( &m4a_mplay001, 0xffff, oyaji_addr[ work[OYJ_COUNT] ] );
	}
	work[ OYJ_COUNT ]++;
}

