#include "global.h"
#include "bard_music.h"
#include "constants/easy_chat.h"

struct BardSound
{
    /*0x00*/ u8 var00;
    /*0x01*/ s8 var01;
    /*0x02*/ u16 var02;
    /*0x04*/ u16 volume;
    /*0x06*/ u16 var06;
};

extern const struct BardSound (*const gBardMusicTable[])[][6];
extern s16 *gUnknown_08417068[];
extern u32 gUnknown_084170F4[];

static s16 CalcWordPitch(u32 arg0, u32 songPos)
{
    return gUnknown_08417068[arg0][songPos];
}

#if ENGLISH
const struct BardSound *GetWordSounds(u16 group, u16 word)
{
    const struct BardSound (*sounds)[][6] = gBardMusicTable[group];

    return (*sounds)[word];
}
#elif GERMAN
const struct BardSound *GetWordSounds(u16 group, u16 word)
{
    const struct BardSound (*sounds)[][6] = gBardMusicTable[group];
    u32 index = de_sub_80EB748(group, word);

    return (*sounds)[index];
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
            s32 length = src[i].var01 + gUnknown_084170F4[src[i].var00];

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
