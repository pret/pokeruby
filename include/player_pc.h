#ifndef GUARD_PLAYER_PC_H
#define GUARD_PLAYER_PC_H

// local task defines
#define PAGE_INDEX data[0]
#define ITEMS_ABOVE_TOP data[1]
#define NUM_ITEMS data[2]
#define NUM_QUANTITY_ROLLER data[3]
#define NUM_PAGE_ITEMS data[4]
// not used
#define CURRENT_ITEM_STORAGE_MENU data[6]
// not used
#define SWAP_ITEM_INDEX data[8]
#define SWITCH_MODE_ACTIVE data[9]

// this is potentially an ewram access occuring in high ewram. TODO: investigate this further.
#define NEW_GAME_PC_ITEMS(i, type) ((u16)((u16 *)gNewGamePCItems + type)[i * 2])

// defined and used in the above macro
enum
{
    PC_ITEM_ID,
    PC_QUANTITY
};

// player PC menu options
enum
{
    PLAYERPC_MENU_ITEMSTORAGE,
    PLAYERPC_MENU_MAILBOX,
    PLAYERPC_MENU_DECORATION,
    PLAYERPC_MENU_TURNOFF
};

// item storage menus
enum
{
    ITEMPC_MENU_WITHDRAW,
    ITEMPC_MENU_DEPOSIT,
    ITEMPC_MENU_TOSS,
    ITEMPC_MENU_EXIT
};

// mailbox mail options
enum
{
    MAILBOX_READ,
    MAILBOX_MOVE_TO_BAG,
    MAILBOX_GIVE,
    MAILBOX_CANCEL,
};

// special item description handlers
enum
{
    ITEMPC_SWITCH_WHICH_ITEM = 0xFFF7,
    ITEMPC_OKAY_TO_THROW_AWAY,
    ITEMPC_TOO_IMPORTANT,
    ITEMPC_NO_MORE_ROOM,
    ITEMPC_THREW_AWAY_ITEM,
    ITEMPC_HOW_MANY_TO_TOSS,
    ITEMPC_WITHDREW_THING,
    ITEMPC_HOW_MANY_TO_WITHDRAW,
    ITEMPC_GO_BACK_TO_PREV
};

struct MailboxStruct
{
 /*0x00*/ u8 cursorPos;
 /*0x01*/ u8 pageItems; // number of items (not including Cancel) on the current page.
 /*0x02*/ u8 itemsAbove; // number of items above the top item on the page.
 /*0x03*/ u8 count; // total number of items in mailbox storage.
};

extern struct MailboxStruct gMailboxInfo;

void ReshowPlayerPC(u8 var);
void NewGameInitPCItems(void);
void BedroomPC(void);
void PlayerPC(void);
void ItemStorage_ReturnToMenuAfterDeposit(void);
void Mailbox_ReturnToMailListAfterDeposit(void);

void sub_813A240(u8);
void sub_813A280(u8);
void sub_813A468(u8);
void sub_813A4B4(u8);
void HandleQuantityRolling(u8);
void sub_813A6FC(u8);
void sub_813A794(u8);
void sub_813A8F0(u8);
void sub_813A984(u8);
void sub_813A9EC(u8);
void sub_813AA30(u8, u8);
void sub_813ABE8(u8);
void sub_813AD58(u16);
void sub_813AE0C(u8);
void sub_813AE6C(u8, u8);
u8 sub_813AF3C(void);
void sub_813AF78(void);
void sub_813B108(u8);
void sub_813B174(u8);

#endif // GUARD_PLAYER_PC_H
