#include "global.h"
#include "bard_music.h"
#include "easy_chat.h"

#include "data/bard_music/word_pitch.h"
#include "data/bard_music/length_table.h"
#include "data/bard_music/bard_sounds.h"

s16 CalcWordPitch(int arg0, int songPos)
{
    return gBardSoundPitchTables[arg0][songPos];
}

#if ENGLISH
const struct BardSound *GetWordSounds(u16 group, u16 word)
{
    const struct BardSound (*sounds)[6] = gBardSoundsTable[group];

    return sounds[word];
}
#elif GERMAN
const struct BardSound *GetWordSounds(u16 group, u16 word)
{
    const struct BardSound (*sounds)[6] = gBardSoundsTable[group];
    u32 index = de_sub_80EB748(group, word);

    return sounds[index];
}
#endif

s32 GetWordPhonemes(struct BardSong *song, const struct BardSound *src, u16 word)
{
    s32 i;
    s32 j;
    s32 thirty;

    for (i = 0; i < 6; i++)
    {
        song->phonemes[i].sound = src[i].var00;
        if (src[i].var00 != 0xFF)
        {
            s32 length = src[i].var01 + gBardSoundLengthTable[src[i].var00];

            song->phonemes[i].length = length;
            song->phonemes[i].volume = src[i].volume;
            song->var04 += length;
        }
    }

    for (j = 0, thirty = 30; j < i; j++)
        song->phonemes[j].pitch = CalcWordPitch(thirty + word, j);

    song->currWord++;
    song->currPhoneme = 0;
    song->phonemeTimer = 0;
    song->state = 0;
    song->voiceInflection = 0;

    //warning: no return statement in function returning non-void
}
