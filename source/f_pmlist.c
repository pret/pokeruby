//=========================================================================
//
//	f_pmlist.c
//	フィールドでのポケモンリスト呼び出しインターフェイス
//
//	2001.06.28
//=========================================================================
//	2001/07/04	by nakahiro

#include "common.h"
#include "print.h"
#include "pokelist.h"
#include "task.h"
#include "palanm.h"
#include "actanm.h"
#include "intr.h"
#include "menu.h"
#include "f_pmlist.h"
#include "poketool.h"
#include "weather.h"
#include "p_status.h"
#include "jiki.h"
#include "script.h"
#include "sysflag.h"
#include "fld_main.h"
#include "map.h"
//#include "wazalist.h"
#include "kaiwa.h"
#include "item.h"
#include "itemtool.h"
#include "fight.h"
#include "mail.h"
#include "wazano.def"
#include "fieldmap.h"
#include "mapparam.h"
#include "fld_tool.h"
#include "cubecase.h"
#include "mus_tool.h"
#include "ev_check.h"
#include "map_attr.h"
#include "pokeicon.h"
#include "initgame.h"
#include "my_pc.h"
#include "message.h"
#include "fld_task.h"

#include "../evdata/maparray.h"
#include "tenji.h"

//=========================================================================================
//										シンボル
//=========================================================================================
#define	MENU_SX			20
#define	MENU_SY			0//4
#define	MENU_EX			29
#define	MENU_EY			19//6 * 2 + 3
#define	TRG_WAIT		7
#define	MENU_MAX		10

// メニュー番号
enum {
	MENU_TUYOSAWOMIRU = 0,	// 00:つよさをみる
	MENU_NARABIKAE,			// 01:ならびかえ
	MENU_MOTIMONO,			// 02:もちもの
	MENU_MODORU,			// 03:もどる
	MENU_MOTASERU,			// 04:もたせる
	MENU_AZUKARU,			// 05:あずかる
	MENU_MERU_GET,			// 06:メールをとる
	MENU_MERU,				// 07:メール
	MENU_MERU_READ,			// 08:メールを読む
	MENU_YAMERU,			// 09:やめる
};

#define	WAZA_MENU_NO	10		// メニューリスト技開始位置
#define	WAZA_TBL_MAX	0xff	// 技テーブル終端

// タスクワーク番号
#define	ITEM_WORK		10
#define WAZA_MENU		11

#define MENU_MSG_LEN	8
#define ITEM_MSG_LEN	6

//=========================================================================================
//									プロトタイプ宣言
//=========================================================================================
extern void	FieldMainRecover(void);
extern void	FieldMenuRecover(void);
extern void FieldPokeListRuckInit(void);

extern u8 IaigiriCheck(void);
extern u8 IwakudakiCheck(void);
extern u8 AnawohoruCheck(void);
extern u8 FlashCheck(void);
extern u8 HimitunotikaraCheck(void);
extern u8 KairikiCheck(void);
extern u8 AmaikaoriCheck(void);
extern u8 MilkNomiCheck(void);
extern u8 TeleportCheck(void);

extern void MilkNomiInit( u8 id );

extern void MenuComSet( u8 *,u8 *, u8 );	//リスト追加

extern void MailViewInit(MAIL_DATA *,pFunc,u8);	//add matsuda 2001.12.18(火)

extern void ReturnBagInit(void);

extern void FlyingInit(void);

extern u8	ItemTypeCheck( u16 no );	// アイテムの種類を調べる

static void MakePokeMenuList(void);		//メニューリストの作成（仮）
static void FldBagPokeListItemSetCheck(u8 id);
static void FldBagPokeListItemMailInput(u8 id);
static void ReturnFldBagMailInput(void);
static void FldBagMailInputFadeWait(u8 id);
static void FldBagMailInputMsgWait(u8 id);
void ReturnFldPokeItemSetMail(void);
static void FieldPokeListMailAdd(u8 id);
static void MailMenu(u8 id);
static void MailMenuTask(u8 id);
static void MailRead(u8 id);
static void MailReadFadeOut(u8 id);
static void MailReadReturn(void);

void FieldPokeListTask(u8);
static void FieldPokeListMenu(u8);
static void FieldPokeListEnd(u8);

static void	Status(u8);			// つよさをみる
static void	Position(u8);		// ならびかえ
static void	PokeItem(u8);		// もちもの
static void	Return(u8);			// もどる
static void	Return2(u8);
static void	ReturnMenu(u8);		// やめる
static void	Extra(u8);			// 技
static void PokeMailGet(u8);	// メールをとる
static void MineItem(u8);		// もたせる
static void PokeItemGet(u8);	// あずかる

static void UseExtra(u8);			// 技を使用
static void ExtraNoBadge(u8);		// バッジが無い
void StartExtraInit(void);			// フィールドエフェクト初期設定
static void StartExtra(u8);			// フェード終了を待ってエフェクトスタート
static void ExtraErrorTask(u8);
static u8 NaminoriCheck(void);		// なみのりチェック
static u8 SorawotobuCheck(void);	// そらをとぶチェック
static u8 DivingCheck(void);		// ダイビングチェック
static u8 TakinoboriCheck(void);	// 滝登りチェック

void FieldBagPokeListTask(u8);
static void FieldPokeListReturnBag(u8);
static void FldBagPokeListItemSet(u8);
static void ReturnMailBoxInit(u8);	// メールボックスへ復帰
static void PokeAllDethRcvTask(u8);	// 全員瀕死回復用タスク

static void ReturnPokeListMenu(void);	// ポケモンリストに復帰後、メニューを開く


//=========================================================================================
//										外部変数
//=========================================================================================
extern u16 ReturnItemNo;					// バッグで選択したアイテム番号
extern u8	UseFldPokeFlg;					// つかう/もたせる/キューブ
extern void (*FieldReturnItemUse)(u8);		// フィールド復帰後の飛び先


static const MENU_ITEM	menu[] =
{
	{ pl_str_tuyosa,    Status      },	// 00:つよさをみる
	{ pl_str_narabikae, Position    },	// 01:ならびかえ
	{ str_motimono,     PokeItem    },	// 02:もちもの
	{ str_yameru,       Return      },	// 03:もどる
	{ str_motaseru,     MineItem    },	// 04:もたせる
	{ str_azukaru,      PokeItemGet },	// 05:あずかる
	{ pl_str_mail_get,  PokeMailGet },	// 06:メールをとる
	{ str_mail,         MailMenu    },	// 07:メール		add by matsuda 2001.12.18(火)
	{ pl_str_mail_read, MailRead    },	// 08:メールを読む	add by matsuda 2001.12.18(火)
	{ str_yameru,       ReturnMenu  },	// 09:やめる		add by matsuda 2001.12.18(火)

	// 技はここから下に追加、それ以外は上へ追加（ enum,defineの変更も ）
	// バッジ順
	{ WazaNameData[ WAZANO_IAIGIRI ],	 Extra },		// 10:いあいぎり
	{ WazaNameData[ WAZANO_HURASSYU ],	 Extra },		// 11:フラッシュ
	{ WazaNameData[ WAZANO_IWAKUDAKI ],  Extra },		// 12:いわくだき
	{ WazaNameData[ WAZANO_KAIRIKI ],	 Extra },		// 13:かいりき
	{ WazaNameData[ WAZANO_NAMINORI ],   Extra },		// 14:なみのり
	{ WazaNameData[ WAZANO_SORAWOTOBU ], Extra },		// 15:そらをとぶ
	{ WazaNameData[ WAZANO_DAIBINGU ],   Extra },		// 16:ダイビング
	{ WazaNameData[ WAZANO_TAKINOBORI ], Extra },		// 17:たきのぼり

	// 秘伝技以外
	{ WazaNameData[ WAZANO_TEREPOOTO ],      Extra },	// 18:テレポート
	{ WazaNameData[ WAZANO_ANAWOHORU ],      Extra },	// 19:あなをほる
	{ WazaNameData[ WAZANO_HIMITUNOTIKARA ], Extra },	// 20:ひみつのちから
	{ WazaNameData[ WAZANO_MIRUKUNOMI ],     Extra },	// 21:ミルクのみ
	{ WazaNameData[ WAZANO_TAMAGOUMI ],      Extra },	// 22:タマゴうみ
	{ WazaNameData[ WAZANO_AMAIKAORI ],      Extra },	// 23:あまいかおり
};

static const u16 waza_no_tbl[] = {
	WAZANO_IAIGIRI,			// いあいぎり
	WAZANO_HURASSYU,		// フラッシュ
	WAZANO_IWAKUDAKI,		// いわくだき
	WAZANO_KAIRIKI,			// かいりき
	WAZANO_NAMINORI,		// なみのり
	WAZANO_SORAWOTOBU,		// そらをとぶ
	WAZANO_DAIBINGU,		// ダイビング
	WAZANO_TAKINOBORI,		// たきのぼり

	WAZANO_TEREPOOTO,		// テレポート
	WAZANO_ANAWOHORU,		// あなをほる
	WAZANO_HIMITUNOTIKARA,	// ひみつのちから
	WAZANO_MIRUKUNOMI,		// ミルクのみ
	WAZANO_TAMAGOUMI,		// タマゴうみ
	WAZANO_AMAIKAORI,		// あまいかおり

	WAZA_TBL_MAX			// 終了
};

static u8 menu_pos = 0;				//カーソル位置
static u8 menu_max = 0;				//メニュー数
static u8 menu_list[MENU_MAX] = {};	//メニューリスト

static const u8 item_list[] = { MENU_MOTASERU, MENU_AZUKARU, MENU_YAMERU };
static const MenuListData Fld_MenuData = { 3, ITEM_MSG_LEN, item_list };

static const u8 mailmenu_list[] = { MENU_MERU_READ, MENU_MERU_GET, MENU_YAMERU };
static const MenuListData Mail_MenuData = { 3, 9, mailmenu_list };

u8	FPokeNo;	//選択されたポケモン

void (*ExtraInit)(void);

typedef struct {
	u8   (*check)(void);	//チェック関数
	u8	 msg;				//エラーメッセージ番号
}EXTRAFUNC;

static const EXTRAFUNC	ExtraCheck[] =
{
	{ IaigiriCheck,        IAIGIRIERROR_MSG  },	// いあいぎり
	{ FlashCheck,          WAZAERROR_MSG     },	// フラッシュ
	{ IwakudakiCheck,      WAZAERROR_MSG     },	// いわくだき
	{ KairikiCheck,        WAZAERROR_MSG     },	// かいりき
	{ NaminoriCheck,       NAMINORIERROR_MSG },	// なみのり
	{ SorawotobuCheck,     WAZAERROR_MSG     },	// そらをとぶ
	{ DivingCheck,         WAZAERROR_MSG     },	// ダイビング
	{ TakinoboriCheck,     WAZAERROR_MSG     },	// たきのぼり

	{ TeleportCheck,       WAZAERROR_MSG     },	// テレポート
	{ AnawohoruCheck,      WAZAERROR_MSG     },	// あなをほる
	{ HimitunotikaraCheck, WAZAERROR_MSG     },	// ひみつのちから
	{ MilkNomiCheck,       TAIRYOKUNAI_MSG   },	// ミルクのみ
	{ MilkNomiCheck,       TAIRYOKUNAI_MSG   },	// タマゴうみ
	{ AmaikaoriCheck,      WAZAERROR_MSG     },	// あまいかおり
};


//=========================================================================================
//							フィールドメニューからの処理
//=========================================================================================
//----------------------
//		初期設定
//----------------------
void FieldMenuPokeListInit(void)
{
	FadeData.trans_stop = 1;
	PokeListCall( FIELD_POKELIST_ID, SINGLE_LIST );
}

//-------------------------------------
//		メニューリストの作成（仮）
//-------------------------------------
static void MakePokeMenuList(void)
{
	u16	i,j;

	menu_max = 0;

	// タマゴの場合
	if( PokeParaGet( &PokeParaMine[ FPokeNo ], ID_tamago_flag ) != 0 ){
		MenuComSet( menu_list, &menu_max, MENU_TUYOSAWOMIRU );	// "つよさをみる"
		MenuComSet( menu_list, &menu_max, MENU_NARABIKAE );		// "ならびかえ"
		MenuComSet( menu_list, &menu_max, MENU_MODORU );		// "もどる"
		return;
	}
	
	// わざチェック
	for( i=0; i<4; i++ ){
		j = 0;
		while(1){
			if( waza_no_tbl[j] == WAZA_TBL_MAX )	break;
			if( PokeParaGet( &PokeParaMine[ FPokeNo ], ID_waza1+i ) == waza_no_tbl[j] ){
				MenuComSet( menu_list, &menu_max, WAZA_MENU_NO+j );
				break;
			}
			j++;
		}
	}
	
	MenuComSet( menu_list, &menu_max, MENU_TUYOSAWOMIRU );	// "つよさをみる"
//	MenuComSet( menu_list, &menu_max, MENU_TUKAERUWAZA );	// "つかえるわざ"
	if( PokeParaGet( &PokeParaMine[1], ID_monsno ) != 0 )
		MenuComSet( menu_list, &menu_max, MENU_NARABIKAE );	// "ならびかえ"
	if(MailItemNoCheck(PokeParaGet(&PokeParaMine[FPokeNo], ID_item)))
		MenuComSet(menu_list, &menu_max, MENU_MERU);		// "メール"
	else
		MenuComSet( menu_list, &menu_max, MENU_MOTIMONO );	// "もちもの"

	MenuComSet( menu_list, &menu_max, MENU_MODORU );	// "もどる"
}

//-------------------------------------
//		メニューウィンドウ作成
//-------------------------------------
void MakeMenuWindow( u8 x, u8 y, u8 w, u8 max, const MENU_ITEM *menu, const u8 *List )
{
//	PokeListWinClear2();
	PokeListWinFixMsgPut2( DOUSIMASUKA_MSG, 1 );
	NMenuWinBoxWrite( x, y, x+w, y+max*2+1 );
	NMenuFreeListWrite( x+2, y+1, max, menu, List );
}

//--------------------------------------------------
//		フィールドポケモンリストのメニュー作成
//--------------------------------------------------
static void MakeFldMenuWin( u8 init_pos )
{
	u8	y;

	y = MENU_EY-1-( menu_max << 1 );
	MakeMenuWindow( MENU_SX, y, 9, menu_max ,menu, menu_list );
	NMenuVCursorInit( MENU_SX+1, y+1, menu_max, init_pos );
}

//------------------------------
//		ポケモン選択タスク
//------------------------------
void FieldPokeListTask(u8 id)
{
	if(!(FadeData.fade_sw)){
		switch( PokeCursorSys(id) ){
		case A_BUTTON:
			SePlay(SE_SELECT);
			FPokeNo = GetNowCursorPos(id);
			PokeNickNameSet( &PokeParaMine[FPokeNo], StrTempBuffer0 );
			MakePokeMenuList();
			menu_pos = 0;
			MakeFldMenuWin(0);
			TaskTable[id].TaskAdrs = FieldPokeListMenu;
			break;

		case B_BUTTON:
			SePlay(SE_SELECT);
			PaletteFadeReq(0xffffffff,0,0,16,0);
			TaskTable[id].TaskAdrs = FieldPokeListEnd;
			break;
		}
	}
}

//------------------------------
//		メニュー選択タスク
//------------------------------
static void FieldPokeListMenu(u8 id)
{
	MENUFUNC	func;

	if( FadeData.fade_sw )	return;

	if( ( sys.Repeat & PLUS_KEY_MASK ) == U_KEY ){
		SePlay(SE_SELECT);
		menu_pos = NMenuVCursorSet(-1);
		return;
	}

	if( ( sys.Repeat & PLUS_KEY_MASK ) == D_KEY ){
		SePlay(SE_SELECT);
		menu_pos = NMenuVCursorSet(1);
		return;
	}

	if( sys.Trg & A_BUTTON ){
		SePlay(SE_SELECT);
		func = menu[ menu_list[menu_pos] ].ptr;
		func(id);
		return;
	}

	if( sys.Trg & B_BUTTON )
		Return(id);
}

//---------------------
//		終了処理
//---------------------
static void FieldPokeListEnd(u8 id)
{
	if( FadeData.fade_sw == 0 ){
		FPokeNo = 0;
		MainProcChange( FieldMenuRecover );
		DelTask(id);
	}
}

//--------------------------------------------------
//		ポケモンリストに復帰後、メニューを開く
//--------------------------------------------------
/*
static u8 GetReturnMenuPos(void)
{
	u8	i,pos;

	switch( P_LIST->menu_flg ){
	case 1:
		pos = MENU_TUYOSAWOMIRU;
		break;
	case 2:
		pos = MENU_TUKAERUWAZA;
		break;
	case 3:
		pos = MENU_MOTIMONO;
		break;
	case 4:
		pos = MENU_MERU;
		break;
	default:
		return	0;
	}

	for( i=0; i<MENU_MAX; i++ ){
		if( menu_list[i] == pos )
			break;
	}

	return	i;
}
*/

static void ReturnPokeListMenu(void)
{
	PokeNickNameSet( &PokeParaMine[FPokeNo], StrTempBuffer0 );
	MakePokeMenuList();
//	menu_pos = GetReturnMenuPos();
	menu_pos = 0;
	MakeFldMenuWin( menu_pos );
}

//-----------------------------------
//		メニュー　"つよさをみる"
//-----------------------------------
static void ReturnFieldStatus2(void)
{
	while(1){
		if( PokeListInitMain() == TRUE ){
			PokeCursorPosSet( P_LIST->task_id, PokeStatusBuf );
			PokeNowCursorMove2( P_LIST->task_id, 0 );
			FPokeNo = PokeStatusBuf;
			ReturnPokeListMenu();
			MainProcChange( PokeListMain );
			break;
		}
		if( ItemToolSioCheck() == TRUE )	break;
	}
}
static void ReturnFieldStatus(void)
{
	FadeData.trans_stop = 1;

	PokeListCallParamSet( FIELD_POKELIST_ID, DEFAULT_LIST, FieldPokeListMenu, DOUSIMASUKA_MSG );
	MainProcChange( ReturnFieldStatus2 );
}

static void StatusFade( u8 id )
{
	u8 temp;
	
	if(FadeData.fade_sw == 0){
		temp = ActWork[TaskTable[id].work[M_CURSOR] >> 8].work[0];
		DelTask(id);
		P_LIST->menu_flg = 1;
		PokeStatusCall2( PokeParaMine, temp, PokeCountMine-1, ReturnFieldStatus, LIST_ST );
	}
}

static void	Status(u8 id)
{
	PaletteFadeReq(0xffffffff,0,0,16,0);
	TaskTable[id].TaskAdrs = StatusFade;
}

//----------------------------------
//		メニュー　"ならびかえ"
//----------------------------------
void F_PokeSortSet( u8 id )
{
	ChangeTask( id, PokemonSortInit, FieldPokeListTask );
	NMenuBoxClear( MENU_SX, MENU_SY, MENU_EX, MENU_EY );
}

static void	Position( u8 id )
{
	//SePlay(SE_SELECT);
	P_CARD->UseTask = PokeCardChangeInit;
	P_LIST->work[7] = DOKONI_IDOU_MSG;
	F_PokeSortSet(id);
}

//---------------------------------
//		メニュー　"もちもの"
//---------------------------------
//メニュー選択タスク
static void ItemMenuTask(u8 id)
{
	pTaskFunc	func;

	if(sys.Trg == U_KEY){
		if(menu_pos != 0){
			menu_pos = NMenuVCursorSet(-1);
			SePlay(SE_SELECT);
		}
	}

	if(sys.Trg == D_KEY){
		if(menu_pos != 2){
			menu_pos = NMenuVCursorSet(1);
			SePlay(SE_SELECT);
		}
	}

	if(sys.Trg & A_BUTTON){
		SePlay(SE_SELECT);
		func = ListMenuCall(0,&Fld_MenuData,menu,menu_pos);
		func(id);
		return;
	}

	if(sys.Trg & B_BUTTON){
		PokeListMenuWinClear(0,&Fld_MenuData);
		ReturnMenu(id);
	}
}

static void PokeItem(u8 id)
{
	menu_pos = 0;
	//SePlay(SE_SELECT);
	NMenuBoxClear( MENU_SX, MENU_SY, MENU_EX, MENU_EY );
	PokeListMenuWindowPut( 0, &Fld_MenuData, menu, 0 );
	PokeListWinFixMsgPut2( MOTIMONO_MSG, 2 );

	TaskTable[id].TaskAdrs = ItemMenuTask;
}

//もたせる
static void EndPokeListItemAddFade(u8 id)
{
	u8 cursor, mailid;

	if(FadeData.fade_sw)
		return;
	cursor = GetNowCursorPos(id);
	mailid = PokeParaGet(&PokeParaMine[cursor], ID_mailid);
	DelTask(id);
	KaiwaInputBegin(KAIWA_MODE_MAIL, Fld.MailData[mailid].msg, ReturnFldPokeItemSetMail, KAIWA_INTERVIEWER_NOTHING);
}

static void ItemMotasetaMsgWait(u8 id)
{
	if(ListMsgStatus == 1)
		return;
	ItemIconStatusSet(id, GetNowCursorPos(id));
	PokeListWinFixMsgPut2( ERANDE_MSG, 0 );
	TaskTable[id].TaskAdrs = FieldPokeListTask;
}

static void EndPokeListItemAdd(u8 id)
{
	if(MailItemNoCheck(ReturnItemNo) && ListStatus)
	{
		PaletteFadeReq(0xffffffff,0,0,16,0);
		TaskTable[id].TaskAdrs = EndPokeListItemAddFade;
	}
	else if(0)//ListStatus)
	{
		SetMotasetaMsg( FPokeNo, ReturnItemNo, 0 );
//		PokeListScrMsgSet( msg_poke_item01, 0 );
		TaskTable[id].TaskAdrs = ItemMotasetaMsgWait;
	}
	else
	{
		NMenuBoxClear( 0, 0, 29, 19);
		PokeListWinFixMsgPut2( ERANDE_MSG, 0 );
		TaskTable[id].TaskAdrs = FieldPokeListTask;
	}
}

static void FieldPokeListItemAdd(u8 id)
{
	if(!(FadeData.fade_sw)){
		ListPokeAddItem( id, ReturnItemNo, EndPokeListItemAdd );
	}
}

// 持たせる道具がメールのとき
static void SetMailInput( u8 id )
{
	u8 cursor, mailid;

	cursor = GetNowCursorPos(id);
	mailid = PokeParaGet(&PokeParaMine[cursor], ID_mailid);
	DelTask(id);
	KaiwaInputBegin(KAIWA_MODE_MAIL, Fld.MailData[mailid].msg, ReturnFldPokeItemSetMail, KAIWA_INTERVIEWER_NOTHING);
}
static void FieldPokeListItemAdd2( u8 id )
{
	ListPokeAddItem( id, ReturnItemNo, SetMailInput );
}
static void MailAddMain(void)
{
	MainTask();
}

//----------------------------------------------------------
//	通常時のバッグ画面からの戻り先
//----------------------------------------------------------
// アイテムあり
static void ReturnFldPokeItemSet2(void)
{
	while(1){
		if( PokeListInitMain() == TRUE ){
			PokeCursorPosSet( P_LIST->task_id, FPokeNo );
			PokeNowCursorMove2( P_LIST->task_id, 0 );
			MainProcChange( PokeListMain );
			break;
		}
		if( ItemToolSioCheck() == TRUE )	break;
	}
}

// キャンセル
static void ReturnFldPokeItemSetNo(void)
{
	while(1){
		if( PokeListInitMain() == TRUE ){
			PokeCursorPosSet( P_LIST->task_id, FPokeNo );
			PokeNowCursorMove2( P_LIST->task_id, 0 );
			P_LIST->menu_flg = 3;
			ReturnPokeListMenu();
			MainProcChange( PokeListMain );
			break;
		}
		if( ItemToolSioCheck() == TRUE )	break;
	}
}

void ReturnFldPokeItemSet(void)
{
	u8	id = 0;
	u8	cursor,pokeitem;
	
	if(MailItemNoCheck(ReturnItemNo) != 0){
		id = AddTask( FieldPokeListItemAdd2, 0 );
		FadeData.trans_stop = 1;
		PokeCursorSet2( id, 0 );
//		PokeCursorSet2( id, 1 );
//		PokeCursorSet2( id, 2 );
		PokeCursorPosSet(id, FPokeNo);
		PokeNowCursorMove2( id, 0 );
		cursor = GetNowCursorPos(id);
		pokeitem = PokeParaGet(&PokeParaMine[cursor], ID_item);

		if(	pokeitem == NON_ITEM ){
			MainProcChange( MailAddMain );
			return;
		}else{
			DelTask(id);
		}
	}

	FadeData.trans_stop = 1;

	if( ReturnItemNo != 0 ){
		PokeListCallParamSet( FIELD_POKELIST_ID, DEFAULT_LIST, FieldPokeListItemAdd, MSG_NOT_PUT );
		MainProcChange( ReturnFldPokeItemSet2 );
	}else{
		PokeListCallParamSet( FIELD_POKELIST_ID, DEFAULT_LIST, FieldPokeListMenu, DOUSIMASUKA_MSG );
		MainProcChange( ReturnFldPokeItemSetNo );
	}
	
/*	
	u8	id = 0;
	u8	cursor,pokeitem;
	
	if(MailItemNoCheck(ReturnItemNo) != 0){
		id = AddTask( FieldPokeListItemAdd2, 0 );
		PokeCursorPosSet(id, FPokeNo);
		PokeNowCursorMove2( id, 0 );
		cursor = GetNowCursorPos(id);
		pokeitem = PokeParaGet(&PokeParaMine[cursor], ID_item);

		if(	pokeitem == NON_ITEM ){
			MainProcChange( MailAddMain );
			return;
		}else{
			DelTask(id);
		}
	}

	FadeData.trans_stop = 1;
	MainProcChange( ReturnFldPokeItemSet2 );
*/

}


//----------------------------------------------------------
//	バッグ画面でダイレクトでメール入力画面に行った時の戻り先
//----------------------------------------------------------
static void RF_PokeSetMailMsg(void)
{
	while(1){
		if( PokeListInitMain() == TRUE ){
			PokeCursorPosSet( P_LIST->task_id, FPokeNo );
			PokeNowCursorMove2( P_LIST->task_id, 0 );
			MainProcChange( PokeListMain );
			break;
		}
		if( ItemToolSioCheck() == TRUE )	break;
	}
}

void ReturnFldPokeItemSetMail(void)
{
	u16 itemno;
	
	FadeData.trans_stop = 1;
	if(AnswerWork == 0)
	{	//メールになにも文章が書かれなかった場合
		itemno = PokeParaGet(&PokeParaMine[FPokeNo], ID_item);
		AddItem(itemno, 1);
		itemno = 0;
		PokeParaPut(&PokeParaMine[FPokeNo], ID_item, (u8*)&itemno);
		PokeDelMail(&PokeParaMine[FPokeNo]);
		PokeListCallParamSet( FIELD_POKELIST_ID, DEFAULT_LIST, FieldPokeListTask, ERANDE_MSG );
	}else
		PokeListCallParamSet( FIELD_POKELIST_ID, DEFAULT_LIST, FieldPokeListMailAdd, MSG_NOT_PUT );

	MainProcChange( RF_PokeSetMailMsg );
}

static void FieldPokeListMailAdd(u8 id)
{
	if(FadeData.fade_sw)
		return;
	SetMotasetaMsg( FPokeNo, ReturnItemNo, 0 );
//	PokeListScrMsgSet( msg_poke_item01, 0 );
	TaskTable[id].TaskAdrs = ItemMotasetaMsgWait;
}

static void ItemFadeWait(u8 id)
{
	if(!(FadeData.fade_sw)){
		MainProcChange( FieldPokeListRuckInit );
		DelTask(id);
	}
}

static void MineItem(u8 id)
{
//	SePlay(SE_SELECT);
	ListBuffer = GetNowCursorPos(id);	//add by matsuda 2001.12.18(火)
	PaletteFadeReq(0xffffffff,0,0,16,0);
	TaskTable[id].TaskAdrs = ItemFadeWait;
}

//あずかる
static void PokeItemGet2(u8 id)
{
	Return2(id);
}

static void PokeItemGet(u8 id)
{
	NMenuBoxClear( MENU_SX, MENU_SY, MENU_EX, MENU_EY );
	PokeListWinClear2();
	ListPokeDecItem(id,PokeItemGet2);
}

//-------------------------------------
//		メニュー　"メールをとる"
//-------------------------------------
static void PokeMailGet(u8 id)
{
	NMenuBoxClear( MENU_SX, MENU_SY, MENU_EX, MENU_EY );
	PokeListWinClear2();
	ListPokeDecMail(id,PokeItemGet2);
}

//----------------------------------------------------------
//	メニュー　”メール”	add by matsuda 2001.12.18(火)
//----------------------------------------------------------
static void MailMenu(u8 id)
{
	menu_pos = 0;
	//SePlay(SE_SELECT);
	NMenuBoxClear( MENU_SX, MENU_SY, MENU_EX, MENU_EY );
	PokeListMenuWindowPut( 0, &Mail_MenuData, menu, 0 );

	TaskTable[id].TaskAdrs = MailMenuTask;
}

static void MailMenuTask(u8 id)
{
	pTaskFunc	func;

	if(sys.Repeat == U_KEY){
		SePlay(SE_SELECT);
		if(menu_pos == 0)
			menu_pos = NMenuVCursorSet(Mail_MenuData.menu_max-1);
		else
			menu_pos = NMenuVCursorSet(-1);
	}

	if(sys.Repeat == D_KEY){
		SePlay(SE_SELECT);
		if(menu_pos == Mail_MenuData.menu_max-1)
			menu_pos = NMenuVCursorSet(-(Mail_MenuData.menu_max-1));
		else
			menu_pos = NMenuVCursorSet(1);
	}

	if(sys.Trg & A_BUTTON){
		SePlay(SE_SELECT);
		func = ListMenuCall(0,&Mail_MenuData,menu,menu_pos);
		func(id);
		return;
	}

	if(sys.Trg & B_BUTTON){
		PokeListMenuWinClear(0,&Mail_MenuData);
		Return(id);
	}
}

//----------------------------------------------------------
//	メニュー　”メールをよむ”add by matsuda 2001.12.18(火)
//----------------------------------------------------------
static void MailRead(u8 id)
{
	PaletteFadeReq(0xffffffff,0,0,16,0);
	TaskTable[id].TaskAdrs = MailReadFadeOut;
}

static void MailReadFadeOut(u8 id)
{
	u8 cursor, mailid;

	if(FadeData.fade_sw)
		return;
	cursor = GetNowCursorPos(id);
	mailid = PokeParaGet(&PokeParaMine[cursor], ID_mailid);
	DelTask(id);
	MailViewInit(&Fld.MailData[mailid], MailReadReturn, 1);
}

//-- メールを見る画面からの戻り先 --//
static void MailReadReturn(void)
{
	PokeStatusBuf = FPokeNo;
	P_LIST->menu_flg = 4;
	ReturnFieldStatus();
}

//-------------------------------
//		メニュー　"もどる"
//-------------------------------
static void Return2(u8 id)
{
	menu_pos = 0;
	NMenuBoxClear( MENU_SX, MENU_SY, MENU_EX, MENU_EY );
//	PokeListWinClear2();
	PokeListWinFixMsgPut2( ERANDE_MSG, 0 );
	TaskTable[id].TaskAdrs = FieldPokeListTask;
}

static void	Return(u8 id)
{
	SePlay(SE_SELECT);
	Return2(id);
}

//-------------------------------
//		メニュー　"やめる"
//-------------------------------
static void	ReturnMenu(u8 id)
{
	SePlay(SE_SELECT);

	NMenuBoxClear( MENU_SX, MENU_SY, MENU_EX, MENU_EY );
	PokeListWinClear2();
//	PokeListWinFixMsgPut2( DOUSIMASUKA_MSG, 0 );
	MakeFldMenuWin( menu_pos );
	TaskTable[id].TaskAdrs = FieldPokeListMenu;
}

//------------------------------
//		メニュー　技関連
//------------------------------
static void	Extra(u8 id)
{
	s16 * wk = TaskTable[id].work;

	wk[WAZA_MENU] = menu_list[menu_pos] - WAZA_MENU_NO;

	// 通信中
	if( ItemToolSioCheck() == TRUE ){
		NMenuBoxClear( MENU_SX, MENU_SY, MENU_EX, MENU_EY );
//		PokeListWinClear2();

		// 「ミルクのみ」「タマゴうみ」
		if( wk[ WAZA_MENU ] == 11 || wk[ WAZA_MENU ] == 12 )
			PokeListWinFixMsgPut2( WAZAERROR_MSG, 0 );
		else
			PokeListWinFixMsgPut2( ExtraCheck[ wk[WAZA_MENU] ].msg, 0 );

		TaskTable[id].TaskAdrs = ExtraErrorTask;
		return;
	}

	// 秘伝技
	if( wk[ WAZA_MENU ] < 8 ){
		// バッジのありなし
		if( EventFlagCheck( SYS_BATCH01_GET + wk[WAZA_MENU] ) != ON ){
			NMenuBoxClear( MENU_SX, MENU_SY, MENU_EX, MENU_EY );
			PokeListWinClear2();
			PokeListScrMsgSet( msg_poke_no_badge, 1 );
			TaskTable[id].TaskAdrs = ExtraNoBadge;
			return;
		}
	}

	// それぞれのわざチェック
	if( ExtraCheck[ wk[WAZA_MENU] ].check() == TRUE ){
		menu_pos = 0;
//		ScriptParameter0 = FPokeNo;
		if( wk[WAZA_MENU] != 11 && wk[WAZA_MENU] != 12 ){
			TaskTable[id].TaskAdrs = UseExtra;
			PaletteFadeReq(0xffffffff,0,0,16,0);
		}else	MilkNomiInit(id);
	}else{
		NMenuBoxClear( MENU_SX, MENU_SY, MENU_EX, MENU_EY );
//		PokeListWinClear2();

		// 「なみのり」ですでに乗っている
		if( wk[WAZA_MENU] == 4 && CheckHeroState(MY_MV_BIT_SWIM) != 0 )
			PokeListWinFixMsgPut2( NAMINORIERROR2_MSG, 0 );
		else
			PokeListWinFixMsgPut2( ExtraCheck[ wk[WAZA_MENU] ].msg, 0 );

		TaskTable[id].TaskAdrs = ExtraErrorTask;
	}
}

// バッジが無い
static void ExtraNoBadge( u8 id )
{
	if( ListMsgStatus != 1 ){
		if( sys.Trg & A_BUTTON || sys.Trg & B_BUTTON ){
			NMenuBoxClear( 0, 14, 29, 19);
			Return(id);
		}
	}
}

//技を使用
static void UseExtra( u8 id )
{
	if( FadeData.fade_sw == 0 ){
		if( TaskTable[id].work[WAZA_MENU] != 5 )
		{
			MainProcChange( FieldMainRecover );
		}else
		{
			//点字の洞窟チェック
			if( TenjiSorawotobuChk() )
				MainProcChange( FieldMainRecover );
			else
				MainProcChange( FlyingInit );
		}

		DelTask(id);
	}
}

//フィールドエフェクト初期設定
void StartExtraInit(void)
{
//	FieldFadeControl( FIELD_BLACK_IN, 0 );
	FieldFadeBlackInSet();
	AddTask( StartExtra, 8) ;
}

//フェード終了を待ってエフェクトスタート
static void StartExtra(u8 id)
{
	if( FieldFadeinCheck() == 1 ){
		FeSetWork[0] = PokeParaGet( &PokeParaMine[ FPokeNo ], ID_monsno );
		ExtraInit();
		DelTask(id);
	}
}

//エラー終了待ち
static void ExtraErrorTask(u8 id)
{
	if( sys.Trg & A_BUTTON || sys.Trg & B_BUTTON ){
		NMenuBoxClear(1,17,28,18);
		Return(id);
	}
}


//---------------------
//		なみのり
//---------------------
//エフェクトセット
static void SetFeNaminori(void)
{
	FeSetWork[0] = FPokeNo;
	FldEffSet( FECODE_HidenPokeSwim );
//	ResetForceEvent();
}
//使用可能チェック
static u8 NaminoriCheck(void)
{
	if( CheckHeroNaminoriStart() == TRUE && CheckHeroAttrNaminoriStart() == TRUE ){
		pFieldRecoverFunc = StartExtraInit;
		ExtraInit = SetFeNaminori;
		return	TRUE;
	}
	return	FALSE;
}

//-----------------------
//		そらをとぶ
//-----------------------
//エフェクトセット
static void SetFeSorawotobu(void)
{
	FeSetWork[0] = FPokeNo;
	FldEffSet( FECODE_HidenPokeSora );
//	ResetForceEvent();
}

//使用可能チェック
static u8 SorawotobuCheck(void)
{
	//点字の洞窟チェック
	if( TenjiSorawotobuChk() )
	{
		pFieldRecoverFunc = StartExtraInit;
		ExtraInit = SetFeEvSora;
		return	TRUE;
	}

	if( MTYPE_IsEnableFlyCheck( NowMap.type ) == TRUE ){
		pFieldRecoverFunc = StartExtraInit;
		ExtraInit = SetFeSorawotobu;
		return	TRUE;
	}

	return	FALSE;
}
//キャンセル・ポケモンリストに復帰
static void ReturnFldPokeSora2(void)
{
	while(1){
		if( PokeListInitMain() == TRUE ){
			PokeCursorPosSet( P_LIST->task_id, FPokeNo );
			PokeNowCursorMove2( P_LIST->task_id, 0 );
			MainProcChange( PokeListMain );
			break;
		}
		if( ItemToolSioCheck() == TRUE )	break;
	}
}
void ReturnFldPokeSora(void)
{
	FadeData.trans_stop = 1;
	PokeListCallParamSet( FIELD_POKELIST_ID, DEFAULT_LIST, FieldPokeListTask, ERANDE_MSG );
	MainProcChange( ReturnFldPokeSora2 );
}

// ポケモンナンバーを返す
u16 GetHidenMonsNo(void)
{
	return	PokeParaGet( &PokeParaMine[ FPokeNo ], ID_monsno );
}


//-----------------------
//		ダイビング
//-----------------------
//エフェクトセット
static void SetFeDiving(void)
{
	FeSetWork[0] = FPokeNo;
	FldEffSet( FECODE_Diving );
}

// 使用可能チェック
static u8 DivingCheck(void)
{
	FeSetWork[1] = DivingMapCheck();

	if( FeSetWork[1] != 0 ){
		pFieldRecoverFunc = StartExtraInit;
		ExtraInit = SetFeDiving;
		return	TRUE;
	}
	return	FALSE;
}

//-------------------
//		滝登り
//-------------------
// エフェクトセット
static void SetFeTakinobori(void)
{
	FeSetWork[0] = FPokeNo;
	FldEffSet( FECODE_Takinobori );
}

// 使用可能チェック
static u8 TakinoboriCheck(void)
{
	s16	px,py;

	GetHeroFrontCellPos( &px, &py );

	if( ATR_IsWaterFallCheck( GetCellAttribute( px, py ) ) == TRUE &&
		CheckHeroTakinoboriStart() == TRUE )
	{
		pFieldRecoverFunc = StartExtraInit;
		ExtraInit = SetFeTakinobori;
		return	TRUE;
	}
	return	FALSE;
}

// デバッグ用
#ifdef	PM_DEBUG
void TestTakinobori(void)
{
	s16	px,py;

	GetHeroFrontCellPos( &px, &py );

	if( ATR_IsWaterFallCheck( GetCellAttribute( px, py ) ) == TRUE &&
		CheckHeroTakinoboriStart() == TRUE )
	{
		SetFeTakinobori();
		return;
	}
	ResetForceEvent();
}
#endif	PM_DEBUG

//--------------------------
//		テレポート（仮）
//--------------------------
/*
//エフェクトセット
static void SetFeTeleport(void)
{
	InitEventFlagAtTeleport();		//テレポートによるフラグ初期化
	InitHeroLastStatus();
	SetFieldFlyInStart();

	NextMapSetByTelMapID();
//	AddMapChangeWarpTask();

	MainProcChange( PokeListMain );
}
//使用可能チェック
static u8 TeleportCheck(void)
{
	if( MTYPE_IsEnableFlyCheck( NowMap.type ) == TRUE ){
		SetFeTeleport();
//		pFieldRecoverFunc = StartExtraInit;
//		ExtraInit = SetFeTeleport;
		return	TRUE;
	}

	return	FALSE;
}
*/


//=========================================================================================
//									バッグからの処理
//=========================================================================================
//--------------------------------------------------
//		技マシンの時は"つかえません"を表示する
//--------------------------------------------------
static void ListCardTukaemasenSet(void)
{
	u8	i;
	u8	machine_no;

	machine_no = ReturnItemNo - ITEM_SKILL_START;

	for( i=0; i<6; i++ ){
		if( PokeParaGet( &PokeParaMine[i], ID_monsno ) != 0 ){
			StHpAreaClear(i);
#ifdef	PM_DEBUG
			if( DebugMainFlag == 0 &&
				( PokeParaGet( &PokeParaMine[i], ID_tamago_flag ) != 0 ||
				PokeWazaMachineCheck( &PokeParaMine[i], machine_no ) == 0 ) )
			{
				ListCardMoji( i, CARD_OBOERARENAI );
			}else{
				if( TemotiNijyuuCheck( &PokeParaMine[i], GetWazaNoItem(ReturnItemNo) ) )
					ListCardMoji( i, CARD_OBOETERU );
				else
					ListCardMoji( i, CARD_OBOERARERU );
			}
#else
			if( PokeParaGet( &PokeParaMine[i], ID_tamago_flag ) != 0 ||
				PokeWazaMachineCheck( &PokeParaMine[i], machine_no ) == 0 )
			{
				ListCardMoji( i, CARD_OBOERARENAI );
			}else{
				if( TemotiNijyuuCheck( &PokeParaMine[i], GetWazaNoItem(ReturnItemNo) ) )
					ListCardMoji( i, CARD_OBOETERU );
				else
					ListCardMoji( i, CARD_OBOERARERU );
			}
#endif	PM_DEBUG
		}
	}
}

//-------------------------------
//		進化アイテムのとき
//-------------------------------
static void ListCardEvolusion(void)
{
	u8	i;

	for( i=0; i<6; i++ ){
		if( PokeParaGet( &PokeParaMine[i], ID_monsno ) != 0 &&
			( PokeParaGet( &PokeParaMine[i], ID_tamago_flag ) != 0 ||
			  PokeShinkaCheck( &PokeParaMine[i], ITEM_SHINKA_CHECK, ReturnItemNo ) == 0 ) )
		{
			StHpAreaClear(i);
			ListCardMoji( i, CARD_TUKAENAI );
		}
	}
}

//---------------------
//		初期設定
//---------------------
void FieldBagPokeListInit2(void)
{
	while(1){
		if( PokeListInitMain() == TRUE ){
			if( UseFldPokeFlg == PM_ITEM_USE_MODE ){
				switch( ItemTypeCheck( ReturnItemNo ) ){
				case SKILL_ITEM:
					ListCardTukaemasenSet();
					break;
				case EVO_ITEM:
					ListCardEvolusion();
				}
			}
			if( FPokeNo > 5 || PokeParaGet( &PokeParaMine[FPokeNo], ID_monsno ) == 0 )
				FPokeNo = 0;
			PokeCursorPosSet( P_LIST->task_id, FPokeNo );
			PokeNowCursorMove2( P_LIST->task_id, 0 );
			MainProcChange( PokeListMain );
			break;
		}
		if( ItemToolSioCheck() == TRUE )	break;
	}
}

void FieldBagPokeListInit(void)
{
	FadeData.trans_stop = 1;
	switch( UseFldPokeFlg ){
	case PM_ITEM_USE_MODE:		// つかう
		if( ItemTypeCheck( ReturnItemNo ) == SKILL_ITEM )
			PokeListCallParamSet( FIELD_POKELIST_ID, SINGLE_LIST, FieldBagPokeListTask, OBOESASEMASUKA_MSG );
		else
			PokeListCallParamSet( FIELD_POKELIST_ID, SINGLE_LIST, FieldBagPokeListTask, TUKAIMASUKA_MSG );
		break;
	case PM_ITEM_USE_ALLDETH_RCV_MODE:
		PokeListCallParamSet( FIELD_POKELIST_ID, SINGLE_LIST, PokeAllDethRcvTask, MSG_NOT_PUT );
		break;
	case PM_ITEM_PUT_MODE:		// もたせる
	case PM_ITEM_MAIL_BOX_MODE:	// メールボックスからメールをもたせる
		PokeListCallParamSet( FIELD_POKELIST_ID, SINGLE_LIST, FieldBagPokeListTask, MOTASEMASUKA_MSG );
	}
	MainProcChange( FieldBagPokeListInit2 );
}

//---------------------------------------------------
//		ポケモン選択タスク
//---------------------------------------------------
void FieldBagPokeListTask(u8 id)
{
	if( FadeData.fade_sw != 0 )	return;

	switch(PokeCursorSys(id)){
	case A_BUTTON:
		FPokeNo = GetNowCursorPos(id);
		if( PokeParaGet( &PokeParaMine[ FPokeNo ], ID_tamago_flag ) != 0 ){
			SePlay(SE_HAZURE);
			break;
		}

		PokeListWinClear2();

		// アイテムを使う
		if( UseFldPokeFlg == PM_ITEM_USE_MODE )
			PokeListItemUseFunc( id, ReturnItemNo, FldBagPokeListItemSet );
		// アイテムを持たせる
		if( UseFldPokeFlg == PM_ITEM_PUT_MODE ){
			SePlay(SE_SELECT);
			ListPokeAddItem( id, ReturnItemNo, FldBagPokeListItemSetCheck );
		}
		// メールボックスのメールを持たせる
		if( UseFldPokeFlg == PM_ITEM_MAIL_BOX_MODE ){
			SePlay(SE_SELECT);
			ListPokeAddMailBox( id, ReturnMailBoxInit );
		}

		break;

	case B_BUTTON:
		FPokeNo = GetNowCursorPos(id);
		SePlay(SE_SELECT);
		PaletteFadeReq(0xffffffff,0,0,16,0);

		if( UseFldPokeFlg == PM_ITEM_USE_MODE ||
			UseFldPokeFlg == PM_ITEM_PUT_MODE )
		{
			TaskTable[id].TaskAdrs = FieldPokeListReturnBag;
		}
		if( UseFldPokeFlg == PM_ITEM_MAIL_BOX_MODE )
			TaskTable[id].TaskAdrs = ReturnMailBoxInit;

		break;
	}
}

//---------------------------------------
//	全員瀕死回復用タスク
//---------------------------------------
static void PokeAllDethRcvTask( u8 id )
{
	if( FadeData.fade_sw != 0 )	return;

	PokeListItemUseFunc( id, ReturnItemNo, FldBagPokeListItemSet );
}

//------------------------------------------
//		持たせた後のフェードアウト設定
//------------------------------------------
static void FldBagPokeListItemSet(u8 id)
{
	PaletteFadeReq(0xffffffff,0,0,16,0);
	TaskTable[id].TaskAdrs = FieldPokeListReturnBag;
}

//---------------------------
//		バッグへ復帰
//---------------------------
static void FieldPokeListReturnBag(u8 id)
{
	if(FadeData.fade_sw == 0){
		MainProcChange( ReturnBagInit );
		DelTask(id);
	}
}

//---------------------------------
//		メールボックスへ復帰
//---------------------------------
static void ReturnMailBoxMain( u8 id )
{
	if( !(FadeData.fade_sw) ){
		MainProcChange( MyPC_MailPokeSetReturn );
		DelTask(id);
	}
}
static void ReturnMailBoxInit( u8 id )
{
	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
	TaskTable[id].TaskAdrs = ReturnMailBoxMain;
}


//----------------------------------------------------------
//	持たせたアイテムがﾒｰﾙか違うかによって処理を分ける
//									by matsuda	2001.12.18(火)
//----------------------------------------------------------
static void FldBagPokeListItemSetCheck(u8 id)
{
	if(ListStatus == 2)
	{
		PaletteFadeReq(0xffffffff,0,0,16,0);
		TaskTable[id].TaskAdrs = FldBagPokeListItemMailInput;
	}
	else
		FldBagPokeListItemSet(id);
}

//----------------------------------------------------------
//	ﾒｰﾙ入力呼び出し	by matsuda 2001.12.18(火)
//----------------------------------------------------------
static void FldBagPokeListItemMailInput(u8 id)
{
	u8 mailid;
	
	if(FadeData.fade_sw)
		return;
	FPokeNo = GetNowCursorPos(id);
	mailid = PokeParaGet(&PokeParaMine[FPokeNo], ID_mailid);
	DelTask(id);
	KaiwaInputBegin(KAIWA_MODE_MAIL, Fld.MailData[mailid].msg, ReturnFldBagMailInput, KAIWA_INTERVIEWER_NOTHING);
}

//----------------------------------------------------------
//	ﾒｰﾙ入力画面からの戻り先	by matsuda 2001.12.18(火)
//----------------------------------------------------------
static void ReturnFldBagMailInput2(void)
{
	while(1){
		if( PokeListInitMain() == TRUE ){
			PokeCursorPosSet( P_LIST->task_id, FPokeNo );
			PokeNowCursorMove2( P_LIST->task_id, 0 );
			MainProcChange( PokeListMain );
			break;
		}
		if( ItemToolSioCheck() == TRUE )	break;
	}
}

static void ReturnFldBagMailInput(void)
{
	u16 itemno;
	
	FadeData.trans_stop = 1;
	if(AnswerWork == 0)
	{	//メールになにも文章が書かれなかった場合
		itemno = PokeParaGet(&PokeParaMine[FPokeNo], ID_item);
		AddItem(itemno, 1);
		itemno = 0;
		PokeParaPut(&PokeParaMine[FPokeNo], ID_item, (u8*)&itemno);
		PokeDelMail(&PokeParaMine[FPokeNo]);
		AddTask(FieldPokeListReturnBag, 5);
	}
	else{
		PokeListCallParamSet( FIELD_POKELIST_ID, SINGLE_LIST, FldBagMailInputFadeWait, MSG_NOT_PUT );
		MainProcChange( ReturnFldBagMailInput2 );
		return;
	}
	FadeData.trans_stop = 0;
	MainProcChange( PokeListMain );
}

static void FldBagMailInputFadeWait(u8 id)
{
	if(FadeData.fade_sw)
		return;
	SetMotasetaMsg( FPokeNo, ReturnItemNo, 1 );
//	PokeListScrMsgSet( msg_poke_item01, 1 );
	TaskTable[id].TaskAdrs = FldBagMailInputMsgWait;
}

static void FldBagMailInputMsgWait(u8 id)
{
	if(ListMsgStatus == 1)
		return;
	FldBagPokeListItemSet(id);
}


//--------------------------------------------------
//		技マシン使用時に技画面からリストへ復帰
//--------------------------------------------------
extern void WazaDelSet2( u8 id );
extern void WazaAkirameSelectSeq2( u8 id );

// バッグへ
void NewWazaReturnBag( u8 id )
{
	FldBagPokeListItemSet(id);
}

void ReturnNewWazaSet2(void)
{
	while(1){
		if( PokeListInitMain() == TRUE ){
			PokeCursorPosSet( P_LIST->task_id, PokeStatusBuf );
			PokeNowCursorMove2( P_LIST->task_id, 0 );
			MainProcChange( PokeListMain );
			break;
		}
		if( ItemToolSioCheck() == TRUE )	break;
	}
}

// ここに戻る
void ReturnNewWazaSet(void)
{
	FadeData.trans_stop = 1;

	if( GetNewWazaSelectPos() != 4 ){
		PokeListCallParamSet( FIELD_POKELIST_ID, SINGLE_LIST, WazaDelSet2, MSG_NOT_PUT );
	}else{
		PokeListCallParamSet( FIELD_POKELIST_ID, SINGLE_LIST, WazaAkirameSelectSeq2, MSG_NOT_PUT );
	}

	MainProcChange( ReturnNewWazaSet2 );
}
