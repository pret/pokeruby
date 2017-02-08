#include "global.h"
#include "battle.h"
#include "link.h"
#include "text.h"

extern u16 gBattleTypeFlags;
extern u8 gUnknown_02024D26;

extern struct Window gUnknown_03004210;

extern u8 BattleText_Win[];
extern u8 BattleText_Loss[];
extern u8 BattleText_Tie[];

#define LEFT_MESSAGE_X 6
#define RIGHT_MESSAGE_X 21
#define CENTER_MESSAGE_X 13
#define MESSAGE_Y 2

#define PRINT_MESSAGE(text, tileDataStartOffset, x)                             \
{                                                                               \
    InitWindow(&gUnknown_03004210, text, tileDataStartOffset, x, MESSAGE_Y);    \
    sub_8002F44(&gUnknown_03004210);                                            \
}

#define PRINT_MESSAGE_LEFT(text, tileDataStartOffset)       PRINT_MESSAGE(text, tileDataStartOffset, LEFT_MESSAGE_X)
#define PRINT_MESSAGE_RIGHT(text, tileDataStartOffset)      PRINT_MESSAGE(text, tileDataStartOffset, RIGHT_MESSAGE_X)

void sub_800DC24(void)
{

    if (gUnknown_02024D26 == 3)
    {
        PRINT_MESSAGE(BattleText_Tie, 160, CENTER_MESSAGE_X);
        return;
    }

    if (gBattleTypeFlags & BATTLE_TYPE_40)
    {
        // Double battle?

        if (gUnknown_02024D26 == 1)
        {

            // lp_field_18 = player position?
            switch (gLinkPlayers[BATTLE_STRUCT->linkPlayerIndex].lp_field_18)
            {
            case 0:
            case 2: PRINT_MESSAGE_LEFT(BattleText_Win, 160);
                PRINT_MESSAGE_RIGHT(BattleText_Loss, 168);
                return;

            case 1:
            case 3: PRINT_MESSAGE_RIGHT(BattleText_Win, 160)
                PRINT_MESSAGE_LEFT(BattleText_Loss, 168)
                return;
            }
        }
        else
        {

            switch (gLinkPlayers[BATTLE_STRUCT->linkPlayerIndex].lp_field_18)
            {
            case 1:
            case 3: PRINT_MESSAGE_LEFT(BattleText_Win, 160);
                PRINT_MESSAGE_RIGHT(BattleText_Loss, 168);
                return;

            case 0:
            case 2: PRINT_MESSAGE_RIGHT(BattleText_Win, 160);
                PRINT_MESSAGE_LEFT(BattleText_Loss, 168);
                return;
            }
        }

        return;
    }


    if (gUnknown_02024D26 == 1)
    {
        if (gLinkPlayers[BATTLE_STRUCT->linkPlayerIndex].lp_field_18 != 0)
        {
            PRINT_MESSAGE_RIGHT(BattleText_Win, 160);
            PRINT_MESSAGE_LEFT(BattleText_Loss, 168);
        }
        else
        {
            PRINT_MESSAGE_LEFT(BattleText_Win, 160);
            PRINT_MESSAGE_RIGHT(BattleText_Loss, 168);
        }
    }
    else
    {
        if (gLinkPlayers[BATTLE_STRUCT->linkPlayerIndex].lp_field_18 != 0)
        {
            PRINT_MESSAGE_LEFT(BattleText_Win, 160);
            PRINT_MESSAGE_RIGHT(BattleText_Loss, 168);
        }
        else
        {
            PRINT_MESSAGE_RIGHT(BattleText_Win, 160);
            PRINT_MESSAGE_LEFT(BattleText_Loss, 168);
        }
    }
}
