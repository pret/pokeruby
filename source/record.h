#ifndef __RECORD_H__
#define __RECORD_H__

//=========================================================================
//	
//
//	ゲーム内出来事いろいろカウントシステム
//
//
//	2001.11.19	GAME FREAK Inc.
//=========================================================================

#undef GLOBAL
#ifdef __RECORD_H_GLOBAL__
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================
//#define name value

//typedef ...

// ランキング用カウンタ定義
#define	CNT_REPORT				0			//	レポートをかいた回数
#define	SV_TOTAL_TIME			1			//※クリアまでの時間
#define	CNT_TREND				2			//	流行をつくった回数（ムロタウンで入力する）
#define	CNT_NUTS				3			//	きのみをうえた回数
#define	CNT_BICYCLE_TRADE		4			//	自転車を交換した回数
#define	CNT_WALK				5			//※歩数
#define	CNT_INTERVIEW			6			//	インタビューに答えた回数
#define	CNT_BATTLE				7			//※戦闘回数
#define	CNT_WILD_BATTLE			8			//※戦闘回数（対　野生のポケモン）
#define	CNT_TRAINER_BATTLE		9			//	戦闘回数（対CPUのみ、対戦・タワーなどは除く）
#define	CNT_DENDOU				10			//※殿堂入りの回数
#define	CNT_CATCH_POKE			11			//	ポケモンを捕まえた回数
#define	CNT_TURI				12			//	ポケモンをつった回数
#define	CNT_TAMAGO				13			//	タマゴが孵った回数
#define	CNT_SHINKA				14			//	ポケモンが進化した回数(通信進化含む）
#define	CNT_KAIFUKU_PC			15			//	ＰＣで回復した回数
#define	CNT_KAIFUKU_HOME		16			//	自分の家で回復した回数
#define	CNT_SAFARI				17			//	サファリゾーンに入った回数
#define	CNT_HIDEN_IAIGIRI		18			//	フィールドで「いあいぎり」を使った回数
#define	CNT_HIDEN_IWAKUDAKI		19			//	フィールドで「いわくだき」をした回数
#define	CNT_AGITTRANS			20			//	秘密基地を引っ越した回数
#define	CNT_COMM_TRADE			21			//※通信交換をした回数
#define	CNT_COMM_TAISEN			22			//※通信対戦をした回数
#define	CNT_KACHI				23			//※通信対戦での勝ち数
#define	CNT_MAKE				24			//※通信対戦での負け数
#define	CNT_HIKIWAKE			25			//※通信対戦での引き分けの数
#define	CNT_WAZA_HANERU			26			//	戦闘で「はねる」をつかった回数
#define	CNT_WAZA_WARUAGAKI		27			//	戦闘で「わるあがき」した回数
#define	CNT_SLOT				28			//	スロットをおおあたりさせた回数
#define	CNT_ROULETTE			29			//	ルーレットを連続であてた回数
#define	CNT_TOWER_BATTLE		30			//	バトルタワーにいどんだ回数
#define	CNT_TOWER_KACHI			31			//※バトルタワーでの勝ち数
#define	CNT_TOWER_RENSHOU		32			//※バトルタワーでの連勝数
#define	CNT_MAKE_CUBE			33			//	キューブを作った回数(通信ふくむ）
#define	CNT_COMM_CUBE_MAKE		34			//※通信でキューブをつくった回数
#define	CNT_COMM_CONTEST_WIN	35			//※ケーブルコンテストでの優勝回数
#define	CNT_CONTEST				36			//	コンテストに参加した回数（通信含まない）
#define	CNT_CONTEST_WIN			37			//	コンテストでの優勝回数（通信含まない）
#define CNT_SHOPPING			38			//	買い物をした回数
#define	CNT_DOWSING				39			//	ダウジングマシンをつかった回数
#define	CNT_RAIN				40			//	雨に降られた回数
#define	CNT_POKEDEX				41			//	ずかんをみた回数
#define	CNT_RIBBON				42			//	リボンをもらった回数
#define	CNT_JUMP				43			//	段差を飛び降りた回数
#define	CNT_TV_WATCH			44			//	テレビをみた回数
#define	CNT_CLOCK_WATCH			45			//	時計をみた回数
#define	CNT_POKE_LOTO			46			//	ポケモンくじがあたった回数
#define	CNT_SODATEYA			47			//	育て屋に預けた回数
#define	CNT_ROPEWAY				48			//	ロープウェイにのった回数
#define	CNT_ONSEN				49			//	温泉に入った回数

#define	CNT_END					50			//


//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;

//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);

#ifndef	ASM_CPP		/*以下は非アセンブラでのみ有効*/
GLOBAL void RecordInit( void );
GLOBAL void IncRecord( u8 id );
GLOBAL u32 GetRecord( u8 id );
GLOBAL void SetRecord( u8 id, u32 value );
//#define IncRecord(id)	( Fld.Record[(id)] == 0xffffffff ? 0 : Fld.Record[(id)]++ )
//#define	GetRecord(id)	( Fld.Record[(id)] )
#endif	/*ASM_CPP*/


#undef GLOBAL
#endif	/*__RECORD_H__*/

