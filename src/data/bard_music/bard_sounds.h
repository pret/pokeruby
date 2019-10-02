#ifndef GUARD_BARD_SOUNDS_TABLE_H
#define GUARD_BARD_SOUNDS_TABLE_H

#define NULL_BARD_SOUND { 0xff }

#include "pokemon.h"
#include "trainer.h"
#include "status.h"
#include "battle.h"
#include "greetings.h"
#include "people.h"
#include "voices.h"
#include "speech.h"
#include "endings.h"
#include "feelings.h"
#include "conditions.h"
#include "actions.h"
#include "lifestyle.h"
#include "hobbies.h"
#include "time.h"
#include "misc.h"
#include "adjectives.h"
#include "events.h"
#include "moves.h"
#include "trendysaying.h"
#include "pokemon_2.h"

const struct BardSound (*const gBardSoundsTable[])[6] = {
    gBardSounds_Pokemon,
    gBardSounds_Trainer,
    gBardSounds_Status,
    gBardSounds_Battle,
    gBardSounds_Greetings,
    gBardSounds_People,
    gBardSounds_Voices,
    gBardSounds_Speech,
    gBardSounds_Endings,
    gBardSounds_Feelings,
    gBardSounds_Conditions,
    gBardSounds_Actions,
    gBardSounds_Lifestyle,
    gBardSounds_Hobbies,
    gBardSounds_Time,
    gBardSounds_Misc,
    gBardSounds_Adjectives,
    gBardSounds_Events,
    gBardSounds_Moves1,
    gBardSounds_Moves2,
    gBardSounds_TrendySaying,
    gBardSounds_Pokemon2
};

#endif //GUARD_BARD_SOUNDS_TABLE_H