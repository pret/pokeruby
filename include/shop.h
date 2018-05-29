#ifndef GUARD_SHOP_H
#define GUARD_SHOP_H

enum
{
    MART_TYPE_0, // normal mart
    MART_TYPE_1,
    MART_TYPE_2,
};

// shop view window NPC info enum
enum
{
    EVENT_OBJ_ID,
    X_COORD,
    Y_COORD,
    ANIM_NUM
};

// shop options
enum
{
    SHOP_BUY,
    SHOP_SELL,
    SHOP_EXIT
};

struct MartInfo
{
    /* 0x0 */ void (* callback) (void);
    /* 0x4 */ const u16 *itemList;
    /* 0x8 */ u8 itemCount; // how many unique items are there for sale?
    /* 0x9 */ u8 cursor; // this shows the on-screen true index of the cursor and not the current item selected.
    /* 0xA */ u8 numChoices; // how many options does the mart have? can be either 2 or 1 (BUY/SELL vs BUY)
    /* 0xB */ u8 choicesAbove; // when your cursor is far down, there are choices that have scrolled up past the top. this is the count of that.
    /* 0xC */ u8 martType; // 0-2. 0 is normal mart while 1-2 seem to be decor shops or non-stackable purchases in general.
    /* 0xD */ u8 curItemCount; // if you are selling an item, this is the count of the current item stack you have.
};

void Shop_CreatePokemartMenu(u16 *);
void Shop_CreateDecorationShop1Menu(u16 *);
void Shop_CreateDecorationShop2Menu(u16 *);
void Shop_RunExitSellMenuTask(u8 taskId);

#endif // GUARD_SHOP_H
