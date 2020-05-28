#ifndef __SCR_TOOL_H__
#define __SCR_TOOL_H__

//=========================================================================
//	
//=========================================================================

#undef GLOBAL
#ifdef __SCR_TOOL_H_GLOBAL__
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================
//#define name value

//typedef ...

#define	MSG_1F	0			//１階
#define	MSG_2F	1
#define	MSG_3F	2
#define	MSG_4F	3
#define	MSG_5F	4
#define	MSG_6F	5
#define	MSG_7F	6
#define	MSG_8F	7
#define	MSG_9F	8
#define	MSG_10F	9
#define	MSG_11F	10
#define	MSG_B1F	11			//地下１階
#define	MSG_B2F	12
#define	MSG_B3F	13
#define	MSG_B4F	14
#define	MSG_TOP	15			//屋上
#define	MSG_DMY	16			//ダミー


#define BICYCLE_COLLISION_MAX	100


//高速船内のシーン定義（WK_SCENE_SP_SHIP01に代入される）
#define	SHIPSCENE_TAKEOFF_KAINA		1	//カイナからアクア号乗船直後
#define	SHIPSCENE_DEMO_RIGHT		2	//デモ中（カイナ→キナギ）
#define	SHIPSCENE_FREE_KAINA		3	//デモ終了後、フリー状態
#define	SHIPSCENE_ARRIVE_MINAMO		4	//ミナモ到着後

#define	SHIPSCENE_TAKEOFF_MINAMO	5	//ミナモからアクア号乗船直後
#define	SHIPSCENE_FREE_MINAMO		6	//フリー状態
#define	SHIPSCENE_DEMO_LEFT			7	//デモ中（キナギ→カイナ）
#define	SHIPSCENE_ARRIVE_KAINA		8	//カイナ到着後

#define	SHIPSCENE_END_DEMO_RIGHT	9	//デモ終了（カイナ→キナギ）
#define	SHIPSCENE_END_DEMO_LEFT		10	//デモ終了（キナギ→カイナ）

//船の移動カウント
#define	SHIPMOVE_R134	60
#define	SHIPMOVE_R133	80
#define	SHIPMOVE_R132	65
#define	SHIPMOVE_MAX	(SHIPMOVE_R132+SHIPMOVE_R133+SHIPMOVE_R134)

//高速船内でのワールドマップ上の位置（シーンから変換）
#define	SHIPPOS_DEMO			0
#define	SHIPPOS_KAINA_STOP		1
#define	SHIPPOS_MINAMO_STOP		2
#define	SHIPPOS_R124			3
#define	SHIPPOS_R131			4

//パソコンのタイプの定義
#define PASO_POKEMON_CENTER		0		//ポケセン
#define PASO_MY_HOME_BOY		1		//主人公(男)
#define PASO_MY_HOME_GIRL		2		//主人公(女)

#define	DMY_OBJ_ID		0x7f			//ダミースクロールOBJID

//効果音定義
#define SE_GYOE_MARK	SE_PIN			//「！」の効果音
#define MUS_ITEM_RETURN	MUS_ME_WAZA		//アイテムを渡す時の効果音

#ifndef	ASM_CPP		/* これで囲んでいる個所はアセンブラでは解釈されない */


//=========================================================================
//	変数
//=========================================================================

//サイクリングロードのイベント関連
//
extern u8 bicycle_collision_flag;
extern u8 bicycle_collision_count;
extern u32 bicycle_start_time;

//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);
GLOBAL u8 SetBlendCommName();
GLOBAL void SetBlendCommOBJ();

//--------------------------------------------------------------------
//マボロシジマ出現制御関連
//--------------------------------------------------------------------
GLOBAL void MaboroshiCycle_Init( void );
GLOBAL void MaboroshiCycle_Update( u16 diff );
GLOBAL u8 Maboroshi_Check( void );

//--------------------------------------------------------------------
//図鑑評価システム関連
//--------------------------------------------------------------------
GLOBAL void ZukanHyouka_Init( void );
GLOBAL void ZukanHyouka_Update( u16 diff );

//--------------------------------------------------------------------
//サイクリングロードのイベント関連
//--------------------------------------------------------------------
GLOBAL void CyclingRoadEventInit( void );
GLOBAL void CyclingRoadEventStart( void );

//--------------------------------------------------------------------
//アクア号のデモ関連
//--------------------------------------------------------------------
GLOBAL void ShipStepCountStart( void );
GLOBAL void ShipStepCountEnd( void );
GLOBAL int ShipStepCountCheck( u16 value );

//--------------------------------------------------------------------
//	高速船の地図上の位置算出
//	<引数>	デモ中の位置を返すためのワーク
//			（戻り値がSHIPPOS_DEMO以外の時には値は入らない）
//			div_id,map_id		マップ指定ID
//			xpos,ypos			座標
//	<戻り値>
//			ヘッダのMAPPOS_～を参照
//--------------------------------------------------------------------
GLOBAL u8 GetShipWorldPos(u8 * div_id, u8 * map_id, s16 * xpos, s16 * ypos );

//--------------------------------------------------------------------
//パソコンアニメ
//--------------------------------------------------------------------
GLOBAL void PasoAnimeTaskAdd();

//--------------------------------------------------------------------
//図鑑評価メッセージ
//--------------------------------------------------------------------
GLOBAL const u8 * const GetZukanHyoukaMsg(u16);	//取得
GLOBAL void SetZukanHyoukaMsg();				//表示

//--------------------------------------------------------------------
//カラクリ屋敷の特殊隠しアイテム制御
//--------------------------------------------------------------------
GLOBAL void KarakuriHideItemOn(void);
GLOBAL void KarakuriHideItemOff(void);

//--------------------------------------------------------------------
//殿堂入り復帰処理
//--------------------------------------------------------------------
GLOBAL void ScriptDendouRecover();

//--------------------------------------------------------------------
//浅瀬の洞窟日にち処理
//--------------------------------------------------------------------
GLOBAL void Asase_Update(u16);

//--------------------------------------------------------------------
//手持ちの先頭からタマゴではない場所を返す
//--------------------------------------------------------------------
extern u8 GetTemotiBtlPokeNum();

//--------------------------------------------------------------------
//スロットの当たり台取得
//--------------------------------------------------------------------
extern u16 ScrSlotAtariGet();

#endif

#undef GLOBAL
#endif	/*__SCR_TOOL_H__*/

