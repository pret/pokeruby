#include "global.h"
#include "bard_music.h"
#include "easy_chat.h"

struct BardSound
{
    /*0x00*/ u8 var00;
    /*0x01*/ s8 var01;
    /*0x02*/ u16 var02;
    /*0x04*/ u16 volume;
    /*0x06*/ u16 var06;
};

static const s16 Unknown_8416F08[] = {-768, 6144};
static const s16 Unknown_8416F0C[] = {2304, 6144};
static const s16 Unknown_8416F10[] = {256, 6144};
static const s16 Unknown_8416F14[] = {1024, 6144};
static const s16 Unknown_8416F18[] = {2816, 6144};
static const s16 Unknown_8416F1C[] = {-768, -256, 6144};
static const s16 Unknown_8416F22[] = {-768, 512, 6144};
static const s16 Unknown_8416F28[] = {512, 1024, 6144};
static const s16 Unknown_8416F2E[] = {1536, 2048, 6144};
static const s16 Unknown_8416F34[] = {2304, 2048, 6144};
static const s16 Unknown_8416F3A[] = {-768, -256, -768, 6144};
static const s16 Unknown_8416F42[] = {1024, -768, 1024, 6144};
static const s16 Unknown_8416F4A[] = {2304, 2048, 1536, 6144};
static const s16 Unknown_8416F52[] = {256, 512, 1024, 6144};
static const s16 Unknown_8416F5A[] = {1536, 4096, 3328, 6144};
static const s16 Unknown_8416F62[] = {1024, 2304, 1024, 2304, 6144};
static const s16 Unknown_8416F6C[] = {2304, 1024, 3328, 1024, 6144};
static const s16 Unknown_8416F76[] = {256, 512, 1024, 1536, 6144};
static const s16 Unknown_8416F80[] = {2048, 1536, 1024, 512, 6144};
static const s16 Unknown_8416F8A[] = {3840, 3328, 2816, 2560, 6144};
static const s16 Unknown_8416F94[] = {-768, -256, 256, 512, 1024, 6144};
static const s16 Unknown_8416FA0[] = {2304, 2048, 1536, 1024, 512, 6144};
static const s16 Unknown_8416FAC[] = {256, 1024, 2304, 1024, 256, 6144};
static const s16 Unknown_8416FB8[] = {2304, 1024, 2304, 1024, -768, 6144};
static const s16 Unknown_8416FC4[] = {2816, 2048, 1024, 1024, 1536, 6144};
static const s16 Unknown_8416FD0[] = {-768, -256, 256, 512, 1024, 1536, 6144};
static const s16 Unknown_8416FDE[] = {2048, 1536, 1024, 512, 256, -256, 6144};
static const s16 Unknown_8416FEC[] = {256, 512, 1024, 256, 512, 4096, 6144};
static const s16 Unknown_8416FFA[] = {1024, -768, 2304, 1024, 2304, 1024, 6144};
static const s16 Unknown_8417008[] = {2048, 2304, 2048, 2304, 2048, 2304, 6144};
static const s16 Unknown_8417016[] = {512, 256, 512, 256, 512, 1024, 512, 6144};
static const s16 Unknown_8417026[] = {256, 256, -256, -256, -768, 1024, -768, 6144};
static const s16 Unknown_8417036[] = {2048, 2304, 2816, 3328, 3584, 3328, 2816, 6144};
static const s16 Unknown_8417046[] = {2048, 1536, 1024, 512, 3328, 2816, 2304, 6144};
static const s16 Unknown_8417056[] = {768, 1024, 1536, 2048, 1792, 2048, 1024, 6144};

static const s16 *const sWordPitches[] = {
    Unknown_8416F08,
    Unknown_8416F0C,
    Unknown_8416F10,
    Unknown_8416F14,
    Unknown_8416F18,
    Unknown_8416F1C,
    Unknown_8416F22,
    Unknown_8416F28,
    Unknown_8416F2E,
    Unknown_8416F34,
    Unknown_8416F3A,
    Unknown_8416F42,
    Unknown_8416F4A,
    Unknown_8416F52,
    Unknown_8416F5A,
    Unknown_8416F62,
    Unknown_8416F6C,
    Unknown_8416F76,
    Unknown_8416F80,
    Unknown_8416F8A,
    Unknown_8416F94,
    Unknown_8416FA0,
    Unknown_8416FAC,
    Unknown_8416FB8,
    Unknown_8416FC4,
    Unknown_8416FD0,
    Unknown_8416FDE,
    Unknown_8416FEC,
    Unknown_8416FFA,
    Unknown_8417008,
    Unknown_8417016,
    Unknown_8417026,
    Unknown_8417036,
    Unknown_8417046,
    Unknown_8417056
};

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

static s16 CalcWordPitch(u32 arg0, u32 songPos)
{
    return sWordPitches[arg0][songPos];
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
