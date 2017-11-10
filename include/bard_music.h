#ifndef GUARD_BARD_MUSIC_H
#define GUARD_BARD_MUSIC_H

struct BardSound;

struct BardPhoneme
{
    /*0x00*/ u16 sound;
    /*0x02*/ u16 length;
    /*0x04*/ s16 pitch;
    /*0x06*/ u16 volume;
};

struct BardSong
{
    /*0x00*/ u8 currWord;
    /*0x01*/ u8 currPhoneme;
    /*0x02*/ u8 phonemeTimer;
    /*0x03*/ u8 state;
    /*0x04*/ s16 var04;
    /*0x06*/ u16 volume;
    /*0x08*/ s16 pitch;
    /*0x0A*/ s16 voiceInflection;
    /*0x0C*/ u16 lyrics[6];
    /*0x18*/ struct BardPhoneme phonemes[6];
};

const struct BardSound *GetWordSounds(u16 arg0, u16 arg1);
s32 GetWordPhonemes(struct BardSong *dest, const struct BardSound *src, u16 arg2);

#endif  // GUARD_BARD_MUSIC_H
