#include "global.h"
#include "battle.h"
#include "ewram.h"
#include "pokemon.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "rom3.h"
#include "constants/abilities.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/species.h"

extern u8 gActiveBattler;
extern u32 gStatuses3[BATTLE_BANKS_COUNT];

/*static*/ bool8 ShouldSwitchIfPerishSong(void)
{
    if (gStatuses3[gActiveBattler] & STATUS3_PERISH_SONG
        && gDisableStructs[gActiveBattler].perishSongTimer1 == 0)
    {
        ewram160C8arr(GetBankIdentity(gActiveBattler)) = 6; // gBattleStruct->AI_monToSwitchIntoId[GetBankIdentity(gActiveBattler)] = 6;
        Emitcmd33(1, 2, 0);
        return TRUE;
    }

    return FALSE;
}
