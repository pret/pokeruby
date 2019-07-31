#include "global.h"
#include "bard_music.h"
#include "easy_chat.h"

#include "data/bard_music/word_pitch.h"

static const u32 sBardSoundLengthDeltas[] = {
     9,
    22,
    15,
    16,
    39,
    21,
     9,
    30,
    24,
    15,
    25,
    12,
    22,
    45,
    24,
    15,
    40,
     9,
    21,
    42,
    18,
     9,
    22,
    15,
    27,
    48,
    18,
    27,
    33,
    24,
    25,
    39,
    19,
    16,
    54,
    18,
     9,
    45,
    15,
    12,
    39,
    23,
     5,
    45,
    12,
    21,
    48,
    12,
    21,
    69,
    18,
    15
};

#if ENGLISH
#include "data/bard_music_en.h"
#elif GERMAN
#include "data/bard_music_de.h"
#endif // ENGLISH/GERMAN

static const struct BardSound (*const gBardMusicTable[])[6] = {
    BardMusic_POKEMON,
    BardMusic_TRAINER,
    BardMusic_STATUS,
    BardMusic_BATTLE,
    BardMusic_GREETINGS,
    BardMusic_PEOPLE,
    BardMusic_VOICES,
    BardMusic_SPEECH,
    BardMusic_ENDINGS,
    BardMusic_FEELINGS,
    BardMusic_CONDITIONS,
    BardMusic_ACTIONS,
    BardMusic_LIFESTYLE,
    BardMusic_HOBBIES,
    BardMusic_TIME,
    BardMusic_MISC,
    BardMusic_ADJECTIVES,
    BardMusic_EVENTS,
    BardMusic_MOVE_1,
    BardMusic_MOVE_2,
    BardMusic_TRENDY_SAYING,
    BardMusic_POKEMON_2
};

s16 CalcWordPitch(int arg0, int songPos)
{
    return gBardSoundPitchTables[arg0][songPos];
}

#if ENGLISH
const struct BardSound *GetWordSounds(u16 group, u16 word)
{
    const struct BardSound (*sounds)[6] = gBardMusicTable[group];

    return sounds[word];
}
#elif GERMAN
const struct BardSound *GetWordSounds(u16 group, u16 word)
{
    const struct BardSound (*sounds)[6] = gBardMusicTable[group];
    u32 index = de_sub_80EB748(group, word);

    return sounds[index];
}
#endif

s32 GetWordPhonemes(struct BardSong *song, const struct BardSound *src, u16 arg2)
{
    s32 i;
    s32 j;
    s32 thirty;

    for (i = 0; i < 6; i++)
    {
        song->phonemes[i].sound = src[i].var00;
        if (src[i].var00 != 0xFF)
        {
            s32 length = src[i].var01 + sBardSoundLengthDeltas[src[i].var00];

            song->phonemes[i].length = length;
            song->phonemes[i].volume = src[i].volume;
            song->var04 += length;
        }
    }

    for (j = 0, thirty = 30; j < i; j++)
        song->phonemes[j].pitch = CalcWordPitch(thirty + arg2, j);

    song->currWord++;
    song->currPhoneme = 0;
    song->phonemeTimer = 0;
    song->state = 0;
    song->voiceInflection = 0;

    //warning: no return statement in function returning non-void
}
