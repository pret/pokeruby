
//=========================================================================
//	
//=========================================================================

#ifndef FLD_TOOL_H
#define FLD_TOOL_H

#include "map.h"

#undef GLOBAL
#ifdef FLD_TOOL_H_GLOBAL
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================

typedef struct{
	u8 form;
	u8 site;
}HERO_INIT_INFO;

//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;

extern MapID BeforeMapID;

// マップ切り替えタイミングでしか有効な値を持っていないので
// アクセスする際は要注意！ できればアクセスするべきでない
extern MapID NextMapID;

//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);

//-----------------------------------------------------------------
//	SXY操作関連
//-----------------------------------------------------------------
GLOBAL void SxyObjDataSet( void );
GLOBAL void SxyObjDataRecover( void );
GLOBAL void SxyObjDataPosChange( u8 id, s16 x, s16 y );
GLOBAL void SxyObjDataSiteChange( u8 id, u8 site );

//-----------------------------------------------------------------------------
//	マップデータ設定関連
//-----------------------------------------------------------------------------
GLOBAL void SetNowMapData(void);
GLOBAL void RecoverNowMapData( void );
GLOBAL void InitNowMapVisual(void);
GLOBAL void ChangeNowMapScreen( u16 id );	//マップスクリーンを変更


//-----------------------------------------------------------------
//	マップ遷移時のデータ初期化
//	<引数>		通信モード中かどうかの指定
//-----------------------------------------------------------------
GLOBAL void FieldInitData(int is_comm_mode);

//-----------------------------------------------------------------
//	フィールドでの隣接マップ移動時の処理
//-----------------------------------------------------------------
GLOBAL void ChangeMapData(u8 div_id, u8 map_id);

//-----------------------------------------------------------------------------
//	マップ遷移関連
//-----------------------------------------------------------------------------
GLOBAL void NextMapSetDirect( s8 div_id, s8 map_id, s8 exit_id, s8 x, s8 y);
GLOBAL void NextMapSetByID(s8 div_id, s8 map_id, s8 exit_id);
GLOBAL void NextMapSetBySpID( u8 sp_id );
GLOBAL void SetSpecialMapID( u8 sp, s8 div_id, s8 map_id, s8 exit_id );
GLOBAL void SetSpecialMapDirect( u8 sp,
		s8 div_id, s8 map_id, s8 exit_id, s8 x, s8 y ); // 特殊接続指定のセット
GLOBAL void SetNextWorldPosition(void);

GLOBAL void EscapeMapSetDirect( s8 div_id, s8 map_id, s8 exit_id, s8 x, s8 y);
GLOBAL void TeleportMapSetByWarpID( u8 id );	//テレポート位置をワープＩＤでセット
GLOBAL void NextMapSetByTelMapID( void );		//テレポート位置に遷移
GLOBAL void NextMapSetByWarpID( u8 id );		//ワープＩＤの位置に遷移
GLOBAL void NextMapSetByWarpMapID( s8 div_id, s8 map_id );
												//ワープ位置に遷移（マップＩＤで指定）
GLOBAL void NextMapSetByEscMapID( void );		//あなぬけの位置に遷移
GLOBAL void SetDivingMapDirect( s8 div_id, s8 map_id, s8 exit_id, s8 x, s8 y );
												//ダイビング位置を指定
GLOBAL void NextMapSetByDivingID( void );		//ダイビング指定位置に遷移

GLOBAL u8 NextMapSetAbove( u16 x, u16 y );		//天方向のマップに遷移
GLOBAL u8 NextMapSetBelow( u16 x, u16 y );		//地方向のマップに遷移

GLOBAL void SetPitfallMapDirect( s8 div_id, s8 map_id, s8 exit_id, s8 x, s8 y );
GLOBAL void NextMapSetByPitfall( s16 x, s16 y );

//コンティニュー時の特別マップ遷移関連
GLOBAL void SetContinueMapDirect( s8 div_id, s8 map_id, s8 exit_id, s8 x, s8 y );
GLOBAL void SetContinueMapByWarpID( u8 id );
GLOBAL void SetContinueMapBySpID( u8 id );
GLOBAL void NextMapSetByContinueMapID( void );

//	NextMapID/Fld.MapIDからあなぬけ遷移先をセット
//	※次の遷移先を設定した直後に呼ぶこと
GLOBAL void NextEscapePosSet(s16 x, s16 y);

//-------------------------------------------------------------
//	自機状態の制御関連
//-------------------------------------------------------------
//自機形態情報を初期化
GLOBAL void InitHeroLastStatus(void);
//現在の自機状態情報を保存
GLOBAL void SetHeroLastStatus( void );
//マップ出現時の自機状態情報を取得
GLOBAL const HERO_INIT_INFO * GetHeroFirstStatus(void);
//マップ出現時のアトリビュートを取得
GLOBAL u16 GetFirstAttr( void );


GLOBAL int IsEnableCycleNowMap(void);	//自転車に乗れるマップかどうかのチェック


//-----------------------------------------------------------------
//	イベント構造体関連
//-----------------------------------------------------------------
GLOBAL const MapTotalData * GetTotalMapData(u16 div_id, u16 map_id);
GLOBAL const MapTotalData * GetNextMapData( void );


//-----------------------------------------------------------------
//	明るさ関連
//-----------------------------------------------------------------
GLOBAL void InitBright(void);
GLOBAL void SetBright( int r );
GLOBAL u8 GetBright(void);


#undef GLOBAL

#include "fld_bgm.h"

#endif	/*FLD_TOOL_H*/

