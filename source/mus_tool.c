//=========================================================================
//	
//	サウンドツール関連
//
//	2001	GAME FREAK Inc.
//	2001.10.26	by tama 青木さんにもらったソースを元に仮作成
//=========================================================================

#include "common.h"
#include "task.h"
#include "poketool.h"		//add by soga 2002.07.11
#include "server.h"			//add by matsuda 2002.09.30(月)
#include "fight.h"

#define	MUS_TOOL_H_GLOBAL
#include "mus_tool.h"


//==============================================================
//
//==============================================================
enum{
	MMSTAT_INIT = 0,
	MMSTAT_PLAYSTART,
	MMSTAT_PLAY,
	MMSTAT_FADEIN,
	MMSTAT_FADEIN2,
	MMSTAT_FADEOUT,
	MMSTAT_FADENEXT,
	MMSTAT_FADENEXTFADE,
};

static u16 NowMusicNo;		//現在のＢＧＭナンバー
static u16 NextMusicNo;		//次のＢＧＭナンバー
static u8 MusicStatus;		//演奏状態
static u8 MusicFadeCount;	//フェードタイミング

u8 BGMStopFlag;		//BGMのオンオフフラグ

//==============================================================
//
//==============================================================
//----------------------------------------------
//----------------------------------------------
void BGM_SystemInit( void )
{
	BGMStopFlag = 0;
	BGM_Init();
}

//----------------------------------------------
//	ＢＧＭメイン（メインループ内におく）
//----------------------------------------------
void BGM_Main( void )
{
	switch( MusicStatus ) {

	case MMSTAT_INIT:
		/* 初期化直後 */
		break;

	case MMSTAT_PLAYSTART:
		/* BGMセット処理 */
		MusicStatus = MMSTAT_PLAY;
		MusicPlay( NowMusicNo );
		break;

	case MMSTAT_PLAY:
		/* 演奏中、何もしない */
		break;

	case MMSTAT_FADEOUT:
		/* フェードアウト処理 */
		if( MusicFadeOutEndWait() == FALSE ) break;
		NextMusicNo = 0;
		MusicStatus = MMSTAT_INIT;
		break;

	case MMSTAT_FADENEXT:
		/* フェードアウト→ＢＧＭセット処理 */
		if( MusicFadeOutEndWait() == FALSE ) break;
		if( JingleWait() == 0) break;

		NowMusicNo = NextMusicNo;
		NextMusicNo = 0;
		MusicStatus = MMSTAT_PLAY;
		MusicPlay( NowMusicNo );
		break;

	case MMSTAT_FADENEXTFADE:
		/* フェードアウト→ＢＧＭフェードイン */
		if( MusicFadeOutEndWait() == FALSE ) break;
		if( JingleWait() == 0) break;

		MusicFadeInPlay( NextMusicNo, MusicFadeCount );

		NowMusicNo = NextMusicNo;
		NextMusicNo = 0;
		MusicStatus = MMSTAT_PLAY;
		MusicFadeCount = 0;
		break;
	}
}

//----------------------------------------------
//	ＢＧＭ初期化
//----------------------------------------------
void BGM_Init( void )
{
	NowMusicNo = 0;
	NextMusicNo = 0;
	MusicStatus = MMSTAT_INIT;
	MusicFadeCount = 0;
}

//----------------------------------------------
//	現在のＢＧＭ取得
//	<戻り値>	現在のＢＧＭ番号
//----------------------------------------------
u16 BGM_GetNowNo( void )
{
	return NowMusicNo;
}

//----------------------------------------------
//	ＢＧＭセット
//	<引数>	music	ＢＧＭの番号
//----------------------------------------------
void BGM_PlaySet( u16 music )
{
	NowMusicNo = music;
	NextMusicNo = 0;
	MusicStatus = MMSTAT_PLAYSTART;
}

//----------------------------------------------
//	ＢＧＭをストップ
//----------------------------------------------
void BGM_PlayStop( void )
{
	NowMusicNo = 0;
	NextMusicNo = 0;
	MusicStatus = MMSTAT_PLAYSTART;
}

//----------------------------------------------
//	ＢＧＭフェードアウトセット
//	<引数> sec		フェード終了までの時間（指定値×16 / 60 秒 )
//----------------------------------------------
void BGM_FadeOutSet( u8 sec )
{
	if ( BGM_FadeOutCheck() ) {
		MusicFadeOutEnd( sec );
	}
	NowMusicNo = 0;
	NextMusicNo = 0;
	MusicStatus = MMSTAT_FADEOUT;
}

//----------------------------------------------
//	ＢＧＭフェードアウト→次のＢＧＭセット
//	<引数>	music	ＢＧＭの番号
//			sec		フェード終了までの時間（指定値×16 / 60 秒 )
//	※この命令を使用するとBGM_Main内でJingleWait->CheckTaskを
//	　呼ぶ。ジングル鳴らしっぱなし&タスクが回らない状況があると
//	　ハングアップするので注意！
//----------------------------------------------
void BGM_FadeNextSet( u16 music ,u8 sec )
{
	BGM_FadeOutSet( sec );

	NowMusicNo = 0;
	NextMusicNo = music;
	MusicStatus = MMSTAT_FADENEXT;
}

//----------------------------------------------
//	ＢＧＭフェードアウト→次のＢＧＭフェードインセット
//	<引数>	music	ＢＧＭの番号
//			sec_out		フェード終了までの時間（指定値×16 / 60 秒 )
//			sec_in		フェードインの時間（指定値×16 / 60 秒 )
//	※この命令を使用するとBGM_Main内でJingleWait->CheckTaskを
//	　呼ぶ。ジングル鳴らしっぱなし&タスクが回らない状況があると
//	　ハングアップするので注意！
//----------------------------------------------
void BGM_FadeNextFadeSet( u16 music ,u8 sec_out, u8 sec_in )
{
	BGM_FadeOutSet( sec_out );

	NowMusicNo = 0;
	NextMusicNo = music;
	MusicStatus = MMSTAT_FADENEXTFADE;
	MusicFadeCount = sec_in;
}

//----------------------------------------------
//	ＢＧＭフェードインセット
//	<引数>	music	ＢＧＭの番号
//			sec		フェードインの時間（指定値×16 / 60 秒 )
//----------------------------------------------
void BGM_FadeInPlaySet( u16 music, u8 sec )
{
	MusicFadeInPlay( music, sec );

	NowMusicNo = music;
	NextMusicNo = 0;
	MusicStatus = MMSTAT_PLAY;
	MusicFadeCount = 0;
}

//----------------------------------------------
//	ＢＧＭフェードアウト中かどうかのチェック
//	<戻り値>	TRUE	フェードアウト中でない
//				FALSE	フェードアウト中
//----------------------------------------------
u8 BGM_FadeOutCheck( void )
{
	if( MusicStatus == MMSTAT_FADENEXT ) return FALSE;
	if( MusicStatus == MMSTAT_FADEOUT ) return FALSE;
	if( MusicStatus == MMSTAT_FADENEXTFADE ) return FALSE;
	return TRUE;
}




//==================================================================
//
//	変数定義など
//
//==================================================================
static u16 me_timer;

typedef struct {
	u16 MusicNo;	/* 曲番号 */
	u16 wait;		/* ウェイト */
}ME_TABLE;

//----------------------------------------------
//	ジングル登録テーブル
//----------------------------------------------
static const ME_TABLE	MeTable[] =
{
	{ MUS_FANFA1,	 80 },		/* アイテムをもらったとき */
	{ MUS_FANFA4,	160 },		/* アイテムをもらったとき */
	{ MUS_FANFA5,	220 },		/* ポケモン進化後 */
	{ MUS_ME_WAZA,	220 },		/* 技マシンゲット後 */
	{ MUS_ME_ASA,	160	},		/* PCでポケモン回復時 */
	{ MUS_ME_BACHI,	340	},		/* ジムバッチゲット時 */
	{ MUS_ME_WASURE, 180 },		/* 技忘れ */
	{ MUS_ME_KINOMI, 120 },		/* きのみをゲット */
	{ MUS_ME_TAMA, 710 },		/* カイオーガのイベント用 */
	{ MUS_ME_B_BIG, 250 },		/* ミニゲーム大正解 */
	{ MUS_ME_B_SMALL, 150 },	/* ミニゲーム正解 */
	{ MUS_ME_ZANNEN, 160 },		/* ミニゲーム残念 */

//	{ MUS_FANFA1,	120 },		/* アイテムをもらったとき */
//	{ MUS_FANFA4,	120 },		/* アイテムをもらったとき */
//	{ MUS_FANFA5,	120 },		/* ポケモン進化後 */
//	{ MUS_ME_WAZA,	120 },		/* 技マシンゲット後 */
//	{ MUS_ME_ASA,	120	},		/* PCでポケモン回復時 */
//	{ MUS_ME_BACHI,	120	},		/* ジムバッチゲット時 */
};

#define	ME_TABLE_MAX	NELEMS(MeTable)


//==================================================================
//
//	ミュージックエフェクト処理
//
//	original by aoki
//==================================================================
/*----------------------------------------------*/
/*		ミュージックエフェクト・リクエスト		*/
/*----------------------------------------------*/
// MePlay( u8 me_num, u8 mode );
// me_num … ＭＥナンバー
void MePlay( u8 me_num )
{
	u16	play_num;

	m4aMPlayStop( &m4a_mplay000 );
	play_num = MeTable[ me_num ].MusicNo;
	me_timer = MeTable[ me_num ].wait;
	m4aSongNumStart( play_num );
}

/*----------------------------------------------*/
/*		ミュージックエフェクト終了待ち			*/
/*		※事前に必ずMePlay()を呼ぶ！			*/
/*----------------------------------------------*/
// mode … 0=MePlayで一時停止したＢＧＭを再開
//         1=MePlayで一時停止したＢＧＭを再開しない
// return … 0=ＭＥ演奏中 1=ＭＥ演奏終了
u8 MeWait( u8 mode )
{
	if( me_timer ){
		me_timer--;
		return 0;
	}

	if( mode == 0 ){
		m4aMPlayContinue( &m4a_mplay000 );
	}else
		m4aSongNumStart( 0 );
	return 1;
}

/*----------------------------------------------*/
/*	ＭＥを止める								*/
/*----------------------------------------------*/
void MeStop( u8 me_num )
{
	m4aSongNumStop( MeTable[ me_num ].MusicNo );
}


//==================================================================
//
//	簡単ジングル処理
//
//==================================================================
static void add_me_wait_task(void);
static void me_wait_task(u8 no);

//----------------------------------------------
//簡単ジングル開始
//----------------------------------------------
void JinglePlay( u16 music )
{
	unsigned int i;
	for( i=0; i<ME_TABLE_MAX; i++ )
	{
		if( MeTable[i].MusicNo == music )
		{
			MePlay(i);
			add_me_wait_task();
			return;
		}
	}
	MePlay(0);	//登録されていない場合はとりあえず
	add_me_wait_task();
}

//----------------------------------------------
//簡単ジングル待ち
//<戻り値>	0	演奏中
//			1	終了
//----------------------------------------------
u8 JingleWait(void)
{
	if( CheckTask(me_wait_task) == TRUE )return FALSE;
	return TRUE;
//	return MeWait(0);
}

//----------------------------------------------
//----------------------------------------------
static void me_wait_task(u8 no)
{
	if( me_timer )
	{
		me_timer --;
		return;
	}else{
	//	if( !BGMStopFlag )
			m4aMPlayContinue( &m4a_mplay000 );
		DelTask(no);
	};
}

void add_me_wait_task(void)
{
	if( CheckTask(me_wait_task) == TRUE )return;
	AddTask( me_wait_task, 80 );
}


//==================================================================
//
//	ＢＧＭフェード
//
//==================================================================

//----------------------------------------------
//	BGMフェードインセット
//	※曲がなっていない状態からいきなりフェードインする
//	<引数>		music	指定曲ナンバー
//				sec		フェードタイミング
//----------------------------------------------
void MusicFadeInPlay( u16 music, u8 sec )
{
//	if ( BGMStopFlag != 0 ) return;
	if (BGMStopFlag != 0) music = MUS_DUMMY;
	m4aSongNumStart( music );
	m4aMPlayImmInit( &m4a_mplay000 );
	m4aMPlayVolumeControl( &m4a_mplay000, 0xffff, 0 );
	m4aSongNumStop( music );
	m4aMPlayFadeInContinue(&m4a_mplay000, sec );
}

//----------------------------------------------
//	BGMフェードアウトセット
//	※終了ではなく、内部的にはポーズ状態になっている
//	<引数>		sec		フェードタイミング
//----------------------------------------------
void MusicFadeOutPause( u8 sec )
{
	m4aMPlayFadeOutPause( &m4a_mplay000, sec );
}

//----------------------------------------------
//	ＢＧＭフェードアウト→ポーズ　待ち
//	<戻り値>	TRUE	終了
//				FALSE	フェード中
//----------------------------------------------
u8 MusicFadeOutPauseWait(void)
{
	// ポーズ状態になっている
	if( m4a_mplay000.stat & MUSICPLAYER_STATUS_PAUSE ) return TRUE;
	// 演奏曲がない
	if( ( m4a_mplay000.stat & MUSICPLAYER_STATUS_TRACK ) == 0 ) return TRUE;

	return FALSE;
}

//----------------------------------------------
//	ＢＧＭフェードインセット
//	※MusicFadeOutPauseでフェードアウト→ポーズ状態に
//	　なっている曲をもう一度フェードインで再開する
//	<引数>		sec		フェードタイミング
//----------------------------------------------
void MusicFadeInContinue( u8 sec )
{
	m4aMPlayFadeInContinue( &m4a_mplay000, sec );
}

//----------------------------------------------
//	ＢＧＭフェードアウトセット
//	※フェードアウト後、終了させる
//	<引数>		sec		フェードタイミング
//----------------------------------------------
void MusicFadeOutEnd( u8 sec )
{
	m4aMPlayFadeOut( &m4a_mplay000, sec );
}

//----------------------------------------------
//	ＢＧＭフェードアウト終了待ち
//	<戻り値>	TRUE	終了
//				FALSE	フェード中
//----------------------------------------------
u8 MusicFadeOutEndWait(void)
{
	// 演奏曲がない
	if( ( m4a_mplay000.stat & MUSICPLAYER_STATUS_TRACK ) == 0 ) return TRUE;

	return FALSE;
}

//==================================================================
//
//	鳴き声再生関連
//
//==================================================================

extern	ToneData	voicegroup200[];
extern	ToneData	voicegroup201[];
extern	ToneData	voicegroup202[];
extern	ToneData	voicegroup203[];
extern	ToneData	voicegroup204[];
extern	ToneData	voicegroup205[];
extern	ToneData	voicegroup206[];
extern	ToneData	voicegroup207[];

static void vp_wait_task( u8 no );
static void add_vp_wait_task( void );

MusicPlayerArea*	vp_end = 0;
u8	vp_timer = 0;

//----------------------------------------------
//簡単鳴き声再生
//----------------------------------------------
#define VOICE_MASTER_VOL	125
#define VOICE_SMALL_VOL		80
#define VOICE_PRI_HI		10

//----------------------------------------------
//どこでも使う用
void VoicePlay( u16 no, s8 pan )
{
	m4aMPlayVolumeControl( &m4a_mplay000, 0xffff, 256/3 );
	VoicePlaySub( no, pan, VOICE_MASTER_VOL, VOICE_PRI_HI, 0 );
	vp_timer = 2;			//波形の再生終了判定漏れを防ぐため
	add_vp_wait_task();
}

//----------------------------------------------
//フィールド上でランダムで鳴る鳴き声用
void VoicePlay2( u16 no, s8 pan, s8 vol, u8 pri )
{
	VoicePlaySub( no, pan, vol, pri, 0 );
}

//----------------------------------------------
//戦闘用
void VoicePlay3( u16 no, s8 pan, u8 ptn )
{
	if( ptn == 1 ){
		VoicePlaySub( no, pan, VOICE_MASTER_VOL, VOICE_PRI_HI, ptn );
	}else{
		m4aMPlayVolumeControl( &m4a_mplay000, 0xffff, 256/3 );
		VoicePlaySub( no, pan, VOICE_MASTER_VOL, VOICE_PRI_HI, ptn );
		vp_timer = 2;			//波形の再生終了判定漏れを防ぐため
		add_vp_wait_task();
	}
}

//add by matsuda 2002.09.30(月)
void VoicePlay4( u16 no, s8 pan, u8 ptn )
{
	if( ptn == 1 ){
		VoicePlaySub( no, pan, VOICE_MASTER_VOL, VOICE_PRI_HI, ptn );
	}else{
		if((FightType&FIGHT_TYPE_4_2vs2) == 0)
			m4aMPlayVolumeControl( &m4a_mplay000, 0xffff, 256/3 );
		VoicePlaySub( no, pan, VOICE_MASTER_VOL, VOICE_PRI_HI, ptn );
//		vp_timer = 2;			//波形の再生終了判定漏れを防ぐため
//		add_vp_wait_task();
	}
}

//----------------------------------------------
//フィールド上のイベント用
void VoicePlayEvent( u16 no, u8 ptn )
{
	m4aMPlayVolumeControl( &m4a_mplay000, 0xffff, 256/3 );
	VoicePlaySub( no, 0, VOICE_MASTER_VOL, VOICE_PRI_HI, ptn );
	vp_timer = 2;			//波形の再生終了判定漏れを防ぐため
	add_vp_wait_task();
}

//----------------------------------------------
void VoicePlaySub( u16 no, s8 pan, s8 vol, u8 pri, u8 ptn )
//ptn = 0 通常再生
//    = 1 再生時間短縮（２ｖｓ２バトルでポケモン登場時）
//    = 2 怒ったポケモン（フィールドイベント）、技効果音・ほえる
//    = 3 技効果音・とおぼえ用
//    = 4 技効果音・ハイパーボイス用
//    = 5 ポケモンがやられた時

{
	u8	bank;
	u8	num;
	u8	reverse;		//逆再生判定用
	u8	release;		//キーオフ後のリリース指定用
	u16	play_length;	//再生時間指定用
	u16	pitch;
	s8	chorus;

	no -= 1;
	reverse = 0;
	release = 0;
	play_length = 140;
	pitch = 15360;
	chorus = 0;

	switch( ptn ){
		//通常再生
		case 0:
		//	play_length = 140;
		//	release = 0;
			break;
		//時間短縮再生
		case 1:
			play_length = 20;
			release = 225;
			break;
		//怒ったポケモン
		case 2:
			play_length = 30;
			release = 225;
			pitch = 15600;
			chorus = 20;
			vol = VOICE_SMALL_VOL;
			break;
		//技効果音・とおぼえ用
		case 3:
			play_length = 50;
			release = 200;
			pitch = 14800;
			break;
		//技効果音・ハイパーボイス用
		case 4:
			play_length = 20;
			release = 220;
			pitch = 15800;
			break;
		//ポケモンがやられた時
		case 5:
		//	play_length = 50;
			release = 200;
			pitch = 14500;
			break;
	}

	pokVoiceVolume( vol );				//初期音量設定 (0～127)
	pokVoicePanpot( pan );				//初期パンポット指定 (-127～127)
	pokVoicePitch( pitch );				//初期ピッチ指定 (256=半音)
	pokVoiceLength( play_length );		//再生時間指定 (60=1秒)
	pokVoiceProgress( 0 );				//波形再生開始位置指定 (0～nバイト)
	pokVoiceRelease( release );			//波形再生の減衰割合指定
	pokVoiceChorus( chorus );			//コーラス指定
	pokVoicePriority( pri );			//プライオリティー指定

	no=PokeMonsNo2VoiceNoGet(no);		//ポケモンナンバーから鳴き声ナンバーを取得
										//add by soga 2002.07.11

	num = no % 128;
	bank = no / 128;
	switch( bank ){
		case 0:
			if( reverse )
				vp_end = pokVoiceStart( &voicegroup204[ num ] );		//波形を逆再生
			else
				vp_end = pokVoiceStart( &voicegroup200[ num ] );		//波形を直接再生
			break;
		case 1:
			if( reverse )
				vp_end = pokVoiceStart( &voicegroup205[ num ] );		//波形を逆再生
			else
				vp_end = pokVoiceStart( &voicegroup201[ num ] );		//波形を直接再生
			break;
		case 2:
			if( reverse )
				vp_end = pokVoiceStart( &voicegroup206[ num ] );		//波形を逆再生
			else
				vp_end = pokVoiceStart( &voicegroup202[ num ] );		//波形を直接再生
			break;
		case 3:
			if( reverse )
				vp_end = pokVoiceStart( &voicegroup207[ num ] );		//波形を逆再生
			else
				vp_end = pokVoiceStart( &voicegroup203[ num ] );		//波形を直接再生
			break;
	}
}

extern	void	ImmSngClear(void);
//----------------------------------------------
//簡単鳴き声再生終了待ち
//<戻り値>	0	演奏中
//			1	終了
//----------------------------------------------
u8 VoicePlayWait( void )
{
	if( CheckTask( vp_wait_task ) == TRUE )
		return FALSE;
	ImmSngClear();
	return TRUE;
}

//----------------------------------------------
//鳴き声強制停止
//----------------------------------------------
void VoicePlayStop( void )
{
	m4aMPlayStop( vp_end );
	ImmSngClear();
}

void VoicePlayStop2( void )	//図鑑専用
{
	m4aMPlayStop( vp_end );
}

//----------------------------------------------
//鳴き声の再生終了を調べる
//----------------------------------------------
//返り値
// 0…終了している
// 1…再生中
u8 VoiceEndCheck( void )
{
	if( pokVoiceCheck( vp_end ) )
		return 1;
	ImmSngClear();
	return 0;
}

u8 VoiceEndCheck2( void )	//図鑑専用
{
	if( pokVoiceCheck( vp_end ) )
		return 1;
	return 0;
}

//----------------------------------------------
//----------------------------------------------
static void vp_wait_task( u8 no )
{
	if( vp_timer ){
		vp_timer--;
		return;
	}
	if( pokVoiceCheck( vp_end ) == 0 ){
		m4aMPlayVolumeControl( &m4a_mplay000, 0xffff, 256 );
		DelTask(no);
	}
}

static void add_vp_wait_task( void )
{
	if( CheckTask( vp_wait_task ) == TRUE )
		return;
	AddTask( vp_wait_task, 80 );
}

//==================================================================
//
//	BGM再生、SE再生
//
//==================================================================
//----------------------------------------------
//BGM再生
//----------------------------------------------
void MusicPlay( u16 no )
{
//	if ( BGMStopFlag != 0 ) return;
	if (BGMStopFlag != 0) no = MUS_DUMMY;
	m4aSongNumStart( no );
}

//----------------------------------------------
//SE再生
//----------------------------------------------
void SePlay( u16 no )
{
	m4aSongNumStart( no );
}

//----------------------------------------------
//SE再生（パン付き）
//----------------------------------------------
void SePlayPan( u16 no, s8 pan )
{
	m4aSongNumStart( no );
	m4aMPlayImmInit( &m4a_mplay001 );
	m4aMPlayImmInit( &m4a_mplay002 );
	m4aMPlayPanpotControl( &m4a_mplay001, 0xffff, pan );
	m4aMPlayPanpotControl( &m4a_mplay002, 0xffff, pan );
}

//----------------------------------------------
//SE再生（チャンネル1のみのパンつき）
//----------------------------------------------
void SePlayPanCh1( u16 no, s8 pan )
{
	m4aSongNumStart( no );
	m4aMPlayImmInit( &m4a_mplay001 );
	m4aMPlayPanpotControl( &m4a_mplay001, 0xffff, pan );
}

//----------------------------------------------
//SE再生（チャンネル２のみのパンつき）
//----------------------------------------------
void SePlayPanCh2( u16 no, s8 pan )
{
	m4aSongNumStart( no );
	m4aMPlayImmInit( &m4a_mplay002 );
	m4aMPlayPanpotControl( &m4a_mplay002, 0xffff, pan );
}

//----------------------------------------------
//SEのパンのみ変更（SE再生中のみ有効）
//----------------------------------------------
void SePan( s8 pan )
{
	m4aMPlayPanpotControl( &m4a_mplay001, 0xffff, pan );
	m4aMPlayPanpotControl( &m4a_mplay002, 0xffff, pan );
}

//----------------------------------------------
//SEの再生終了を調べる
//----------------------------------------------
//返り値
// 0…終了している
// 1…再生中
u8 SeEndCheck( void )
{
	// ポーズ状態になっている
	if( ( m4a_mplay001.stat & MUSICPLAYER_STATUS_PAUSE ) &&
		( m4a_mplay002.stat & MUSICPLAYER_STATUS_PAUSE ) )
		 return 0;
	// 演奏曲がない
	if( ( ( m4a_mplay001.stat & MUSICPLAYER_STATUS_TRACK ) == 0 ) &&
		( ( m4a_mplay002.stat & MUSICPLAYER_STATUS_TRACK ) == 0 ) )
		return 0;

	return 1;
}

//-- add 2002.09.30(月) by matsuda --//
u8 MusEndCheck( void )
{
	// ポーズ状態になっている
	if( m4a_mplay000.stat & MUSICPLAYER_STATUS_PAUSE )
		 return 0;
	// 演奏曲がない
	if( ( m4a_mplay000.stat & MUSICPLAYER_STATUS_TRACK ) == 0 )
		return 0;

	return 1;
}

//----------------------------------------------
//SEの再生終了を調べる ( music_player_ 3 限定 ）
//----------------------------------------------
//返り値
// 0…終了している
// 1…再生中
u8 SeEndCheckPlayer003( void )
{
	// ポーズ状態になっている
	if( m4a_mplay003.stat & MUSICPLAYER_STATUS_PAUSE )
		 return 0;
	// 演奏曲がない
	if( ( m4a_mplay003.stat & MUSICPLAYER_STATUS_TRACK ) == 0 )
		return 0;

	return 1;
}

