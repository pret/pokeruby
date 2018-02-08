#include "global.h"
#include "m4a.h"

#ifdef NONMATCHING
void CgbSound(void)
{
    s32 ch;
    struct CgbChannel *channels;
    u8 ev_add;
    u32 prev_c15;
    struct SoundInfo *soundInfo = SOUND_INFO_PTR;
    vu8 *nrx0ptr;
    vu8 *nrx1ptr;
    vu8 *nrx2ptr;
    vu8 *nrx3ptr;
    vu8 *nrx4ptr;

    if (soundInfo->c15)
        soundInfo->c15--;
    else
        soundInfo->c15 = 14;
    for (ch = 1, channels = soundInfo->cgbChans; ch <= 4; ch++, channels++)
    {
        if (channels->sf & 0xc7)
        {
            switch (ch)
            {
                case 1:
                    nrx0ptr = (vu8 *)(REG_ADDR_NR10);
                    nrx1ptr = (vu8 *)(REG_ADDR_NR11);
                    nrx2ptr = (vu8 *)(REG_ADDR_NR12);
                    nrx3ptr = (vu8 *)(REG_ADDR_NR13);
                    nrx4ptr = (vu8 *)(REG_ADDR_NR14);
                    break;
                case 2:
                    nrx0ptr = (vu8 *)(REG_ADDR_NR10+1);
                    nrx1ptr = (vu8 *)(REG_ADDR_NR21);
                    nrx2ptr = (vu8 *)(REG_ADDR_NR22);
                    nrx3ptr = (vu8 *)(REG_ADDR_NR23);
                    nrx4ptr = (vu8 *)(REG_ADDR_NR24);
                    break;
                case 3:
                    nrx0ptr = (vu8 *)(REG_ADDR_NR30);
                    nrx1ptr = (vu8 *)(REG_ADDR_NR31);
                    nrx2ptr = (vu8 *)(REG_ADDR_NR32);
                    nrx3ptr = (vu8 *)(REG_ADDR_NR33);
                    nrx4ptr = (vu8 *)(REG_ADDR_NR34);
                    break;
                default:
                    nrx0ptr = (vu8 *)(REG_ADDR_NR30+1);
                    nrx1ptr = (vu8 *)(REG_ADDR_NR41);
                    nrx2ptr = (vu8 *)(REG_ADDR_NR42);
                    nrx3ptr = (vu8 *)(REG_ADDR_NR43);
                    nrx4ptr = (vu8 *)(REG_ADDR_NR44);
                    break;
            }
            prev_c15 = soundInfo->c15;
            ev_add = *nrx2ptr;
            if (channels->sf & 0x80)
            {
                if (!(channels->sf & 0x40))
                {
                    channels->sf = 3;
                    channels->mo = 3;
                    CgbModVol(channels);
                    switch (ch)
                    {
                        case 1:
                            *nrx0ptr = channels->sw;
                            // fallthrough
                        case 2:
                            *nrx1ptr = (channels->wp << 6) + channels->le;
                            ev_add = channels->at + 8;
                            channels->n4 = channels->le ? 0x40 : 0x00;
                            break;
                        case 3:
                            if (channels->wp != channels->cp)
                            {
                                *nrx0ptr = 0x40;
                                REG_WAVE_RAM0 = ((u32 *)channels->wp)[0];
                                REG_WAVE_RAM1 = ((u32 *)channels->wp)[1];
                                REG_WAVE_RAM2 = ((u32 *)channels->wp)[2];
                                REG_WAVE_RAM3 = ((u32 *)channels->wp)[3];
                                channels->cp = channels->wp;
                            }
                            *nrx0ptr = 0;
                            *nrx1ptr = channels->le;
                            channels->n4 = channels->le ? 0xc0 : -0x80;
                            break;
                        default:
                            *nrx1ptr = channels->le;
                            *nrx3ptr = channels->wp << 3;
                            ev_add = channels->at + 8;
                            channels->n4 = channels->le ? 0x40 : 0x00;
                            break;
                    }
                    channels->d1 = channels->at;
                    if (channels->at)
                    {
                        channels->ev = 0;
                    }
                    else
                    {
                        channels->sf--;
                        channels->ec = channels->de;
                        if (channels->ec)
                        {
                            channels->mo |= 1;
                            channels->ev = channels->eg;
                            if (ch != 3)
                            {
                                ev_add = channels->de;
                            }
                        }
                        else if (channels->su == 0)
                        {
                            channels->sf &= 0xfc;
                            channels->ev = channels->echoVolume * channels->eg / 256;
                            if (channels->ev)
                            {
                                channels->sf |= 0x4;
                                channels->mo |= 1;
                                if (ch != 3)
                                {
                                    ev_add = 8;
                                }
                            }
                            else
                            {
                                CgbOscOff(ch);
                                channels->sf = 0;
                                channels->mo = 0;
                                continue;
                            }
                        }
                        else
                        {
                            channels->sf--;
                            channels->mo |= 1;
                            if (ch != 3)
                            {
                                ev_add = 8;
                            }
                            channels->ev = channels->sg;
                            channels->ec = 7;
                        }
                    }
                }
                else
                {
                    CgbOscOff(ch);
                    channels->sf = 0;
                    channels->mo = 0;
                    continue;
                }
            }
            else if (channels->sf & 0x04)
            {
                channels->echoLength--;
                if (channels->echoLength <= 0)
                {
                    CgbOscOff(ch);
                    channels->sf = 0;
                    channels->mo = 0;
                    continue;
                }
            }
            else if ((channels->sf & 0x40) && (channels->sf & 0x03))
            {
                channels->sf &= 0xfc;
                channels->ec = channels->re;
                if (channels->re)
                {
                    channels->mo |= 1;
                    if (ch != 3)
                    {
                        ev_add = channels->re;
                    }
                }
                else
                {
                    // _081DECCA
                    channels->ev = channels->echoVolume * channels->eg / 256;
                    if (channels->ev)
                    {
                        channels->sf |= 0x4;
                        channels->mo |= 1;
                        if (ch != 3)
                        {
                            ev_add = 8;
                        }
                    }
                    else
                    {
                        CgbOscOff(ch);
                        channels->sf = 0;
                        channels->mo = 0;
                        continue;
                    }
                }
            }
            {
                if (channels->ec == 0)
                {
                    if (ch == 3)
                    {
                        channels->mo |= 1;
                    }
                    CgbModVol(channels);
                    if ((channels->sf & 0x3) == 0)
                    {
                        channels->ev--;
                        if ((s8)channels->ev <= 0)
                        {
                            channels->ev = channels->echoVolume * channels->eg / 256;
                            if (channels->ev)
                            {
                                channels->sf |= 0x4;
                                channels->mo |= 1;
                                if (ch != 3)
                                {
                                    ev_add = 8;
                                }
                            }
                            else
                            {
                                CgbOscOff(ch);
                                channels->sf = 0;
                                channels->mo = 0;
                                continue;
                            }
                        }
                        else
                        {
                            channels->ec = channels->re;
                        }
                    }
                    else if ((channels->sf & 0x3) == 1)
                    {
                        channels->ev = channels->sg;
                        channels->ec = 7;
                    }
                    else if ((channels->sf & 0x3) == 2)
                    {
                        channels->ev--;
                        if (channels->ev <= channels->sg)
                        {
                            if (channels->su == 0)
                            {
                                channels->sf &= 0xfc;
                                channels->ev = channels->echoVolume * channels->eg / 256;
                                if (channels->ev)
                                {
                                    channels->sf |= 0x4;
                                    channels->mo |= 1;
                                    if (ch != 3)
                                    {
                                        ev_add = 8;
                                    }
                                }
                                else
                                {
                                    CgbOscOff(ch);
                                    channels->sf = 0;
                                    channels->mo = 0;
                                    continue;
                                }
                            }
                            else
                            {
                                channels->sf--;
                                channels->mo |= 1;
                                if (ch != 3)
                                {
                                    ev_add = 8;
                                }
                            }
                        }
                        else
                        {
                            channels->ec = channels->de;
                        }
                    }
                    else
                    {
                    _081DEC98:
                        channels->ev++;
                        if (channels->ev <= channels->eg)
                        {
                            channels->sf--;
                            channels->ec = channels->de;
                            if (channels->ec)
                            {
                                channels->mo |= 1;
                                channels->ev = channels->eg;
                                if (ch != 3)
                                {
                                    ev_add = channels->de;
                                }
                            }
                            else if (channels->su == 0)
                            {
                                channels->sf &= 0xfc;
                                channels->ev = channels->echoVolume * channels->eg / 256;
                                if (channels->ev)
                                {
                                    channels->sf |= 0x4;
                                    channels->mo |= 1;
                                    if (ch != 3)
                                    {
                                        ev_add = 8;
                                    }
                                }
                                else
                                {
                                    CgbOscOff(ch);
                                    channels->sf = 0;
                                    channels->mo = 0;
                                    continue;
                                }
                            }
                            else
                            {
                                channels->sf--;
                                channels->mo |= 1;
                                if (ch != 3)
                                {
                                    ev_add = 8;
                                }
                                channels->ev = channels->sg;
                                channels->ec = 7;
                            }
                        }
                        else
                        {
                            channels->ec = channels->at;
                        }
                    }
                }
            }
            channels->ec--;
            if (prev_c15 == 0)
            {
                prev_c15--;
                goto _081DEC98;
            }
            if (channels->mo & 0x2)
            {
                if (ch < 4 && (channels->ty & 0x08))
                {
                    if (REG_SOUNDBIAS_H < 0x40)
                    {
                        channels->fr = (channels->fr + 2) & 0x7fc;
                    }
                    else if (REG_SOUNDBIAS_H < 0x80)
                    {
                        channels->fr = (channels->fr + 1) & 0x7fe;
                    }
                }
                if (ch != 4)
                {
                    *nrx3ptr = channels->fr;
                }
                else
                {
                    *nrx3ptr = (*nrx3ptr & 0x08) | channels->fr;
                }
                channels->n4 = (channels->n4 & 0xc0) + ((channels->fr >> 8) & 0xff);
                *nrx4ptr = channels->n4;
            }
            if (channels->mo & 1)
            {
                REG_NR51 = (REG_NR51 & ~channels->panMask) | channels->pan;
                if (ch == 3)
                {
                    *nrx2ptr = gCgb3Vol[channels->ev];
                    if (channels->n4 & 0x80)
                    {
                        *nrx0ptr = 0x80;
                        *nrx4ptr = channels->n4;
                        channels->n4 &= 0x7f;
                    }
                }
                else
                {
                    ev_add &= 0xf;
                    *nrx2ptr = channels->ev + ev_add;
                    *nrx4ptr = channels->n4 | 0x80;
                    if (ch == 1 && (*nrx0ptr * 0x08))
                    {
                        *nrx4ptr = channels->n4 | 0x80;
                    }
                }
            }
            channels->mo = 0;
        }
    }
}
#else
__attribute__((naked)) void CgbSound(void)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tmov r7, r10\n"
                    "\tmov r6, r9\n"
                    "\tmov r5, r8\n"
                    "\tpush {r5-r7}\n"
                    "\tsub sp, 0x1C\n"
                    "\tldr r0, =SOUND_INFO_PTR\n"
                    "\tldr r0, [r0]\n"
                    "\tstr r0, [sp, 0x4]\n"
                    "\tldrb r0, [r0, 0xA]\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _081DEA94\n"
                    "\tsubs r0, 0x1\n"
                    "\tldr r1, [sp, 0x4]\n"
                    "\tstrb r0, [r1, 0xA]\n"
                    "\tb _081DEA9A\n"
                    "\t.pool\n"
                    "_081DEA94:\n"
                    "\tmovs r0, 0xE\n"
                    "\tldr r2, [sp, 0x4]\n"
                    "\tstrb r0, [r2, 0xA]\n"
                    "_081DEA9A:\n"
                    "\tmovs r6, 0x1\n"
                    "\tldr r0, [sp, 0x4]\n"
                    "\tldr r4, [r0, 0x1C]\n"
                    "_081DEAA0:\n"
                    "\tldrb r1, [r4]\n"
                    "\tmovs r0, 0xC7\n"
                    "\tands r0, r1\n"
                    "\tadds r2, r6, 0x1\n"
                    "\tmov r10, r2\n"
                    "\tmovs r2, 0x40\n"
                    "\tadds r2, r4\n"
                    "\tmov r9, r2\n"
                    "\tcmp r0, 0\n"
                    "\tbne _081DEAB6\n"
                    "\tb _081DEEA0\n"
                    "_081DEAB6:\n"
                    "\tcmp r6, 0x2\n"
                    "\tbeq _081DEAE8\n"
                    "\tcmp r6, 0x2\n"
                    "\tbgt _081DEAC4\n"
                    "\tcmp r6, 0x1\n"
                    "\tbeq _081DEACA\n"
                    "\tb _081DEB20\n"
                    "_081DEAC4:\n"
                    "\tcmp r6, 0x3\n"
                    "\tbeq _081DEB00\n"
                    "\tb _081DEB20\n"
                    "_081DEACA:\n"
                    "\tldr r0, =REG_NR10\n"
                    "\tstr r0, [sp, 0x8]\n"
                    "\tldr r7, =REG_NR11\n"
                    "\tldr r2, =REG_NR12\n"
                    "\tstr r2, [sp, 0xC]\n"
                    "\tadds r0, 0x4\n"
                    "\tstr r0, [sp, 0x10]\n"
                    "\tadds r2, 0x2\n"
                    "\tb _081DEB30\n"
                    "\t.pool\n"
                    "_081DEAE8:\n"
                    "\tldr r0, =REG_NR10 + 1\n"
                    "\tstr r0, [sp, 0x8]\n"
                    "\tldr r7, =REG_NR21\n"
                    "\tldr r2, =REG_NR22\n"
                    "\tb _081DEB28\n"
                    "\t.pool\n"
                    "_081DEB00:\n"
                    "\tldr r0, =REG_NR30\n"
                    "\tstr r0, [sp, 0x8]\n"
                    "\tldr r7, =REG_NR31\n"
                    "\tldr r2, =REG_NR32\n"
                    "\tstr r2, [sp, 0xC]\n"
                    "\tadds r0, 0x4\n"
                    "\tstr r0, [sp, 0x10]\n"
                    "\tadds r2, 0x2\n"
                    "\tb _081DEB30\n"
                    "\t.pool\n"
                    "_081DEB20:\n"
                    "\tldr r0, =REG_NR30 + 1\n"
                    "\tstr r0, [sp, 0x8]\n"
                    "\tldr r7, =REG_NR41\n"
                    "\tldr r2, =REG_NR42\n"
                    "_081DEB28:\n"
                    "\tstr r2, [sp, 0xC]\n"
                    "\tadds r0, 0xB\n"
                    "\tstr r0, [sp, 0x10]\n"
                    "\tadds r2, 0x4\n"
                    "_081DEB30:\n"
                    "\tstr r2, [sp, 0x14]\n"
                    "\tldr r0, [sp, 0x4]\n"
                    "\tldrb r0, [r0, 0xA]\n"
                    "\tstr r0, [sp]\n"
                    "\tldr r2, [sp, 0xC]\n"
                    "\tldrb r0, [r2]\n"
                    "\tmov r8, r0\n"
                    "\tadds r2, r1, 0\n"
                    "\tmovs r0, 0x80\n"
                    "\tands r0, r2\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _081DEC26\n"
                    "\tmovs r3, 0x40\n"
                    "\tadds r0, r3, 0\n"
                    "\tands r0, r2\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r5, r0, 24\n"
                    "\tadds r0, r6, 0x1\n"
                    "\tmov r10, r0\n"
                    "\tmovs r1, 0x40\n"
                    "\tadds r1, r4\n"
                    "\tmov r9, r1\n"
                    "\tcmp r5, 0\n"
                    "\tbne _081DEC4A\n"
                    "\tmovs r0, 0x3\n"
                    "\tstrb r0, [r4]\n"
                    "\tstrb r0, [r4, 0x1D]\n"
                    "\tadds r0, r4, 0\n"
                    "\tstr r3, [sp, 0x18]\n"
                    "\tbl CgbModVol\n"
                    "\tldr r3, [sp, 0x18]\n"
                    "\tcmp r6, 0x2\n"
                    "\tbeq _081DEB98\n"
                    "\tcmp r6, 0x2\n"
                    "\tbgt _081DEB8C\n"
                    "\tcmp r6, 0x1\n"
                    "\tbeq _081DEB92\n"
                    "\tb _081DEBEC\n"
                    "\t.pool\n"
                    "_081DEB8C:\n"
                    "\tcmp r6, 0x3\n"
                    "\tbeq _081DEBA4\n"
                    "\tb _081DEBEC\n"
                    "_081DEB92:\n"
                    "\tldrb r0, [r4, 0x1F]\n"
                    "\tldr r2, [sp, 0x8]\n"
                    "\tstrb r0, [r2]\n"
                    "_081DEB98:\n"
                    "\tldr r0, [r4, 0x24]\n"
                    "\tlsls r0, 6\n"
                    "\tldrb r1, [r4, 0x1E]\n"
                    "\tadds r0, r1, r0\n"
                    "\tstrb r0, [r7]\n"
                    "\tb _081DEBF8\n"
                    "_081DEBA4:\n"
                    "\tldr r1, [r4, 0x24]\n"
                    "\tldr r0, [r4, 0x28]\n"
                    "\tcmp r1, r0\n"
                    "\tbeq _081DEBCC\n"
                    "\tldr r2, [sp, 0x8]\n"
                    "\tstrb r3, [r2]\n"
                    "\tldr r1, =REG_WAVE_RAM\n"
                    "\tldr r2, [r4, 0x24]\n"
                    "\tldr r0, [r2]\n"
                    "\tstr r0, [r1]\n"
                    "\tadds r1, 0x4\n"
                    "\tldr r0, [r2, 0x4]\n"
                    "\tstr r0, [r1]\n"
                    "\tadds r1, 0x4\n"
                    "\tldr r0, [r2, 0x8]\n"
                    "\tstr r0, [r1]\n"
                    "\tadds r1, 0x4\n"
                    "\tldr r0, [r2, 0xC]\n"
                    "\tstr r0, [r1]\n"
                    "\tstr r2, [r4, 0x28]\n"
                    "_081DEBCC:\n"
                    "\tldr r0, [sp, 0x8]\n"
                    "\tstrb r5, [r0]\n"
                    "\tldrb r0, [r4, 0x1E]\n"
                    "\tstrb r0, [r7]\n"
                    "\tldrb r0, [r4, 0x1E]\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _081DEBE4\n"
                    "\tmovs r0, 0xC0\n"
                    "\tb _081DEC06\n"
                    "\t.pool\n"
                    "_081DEBE4:\n"
                    "\tmovs r1, 0x80\n"
                    "\tnegs r1, r1\n"
                    "\tstrb r1, [r4, 0x1A]\n"
                    "\tb _081DEC08\n"
                    "_081DEBEC:\n"
                    "\tldrb r0, [r4, 0x1E]\n"
                    "\tstrb r0, [r7]\n"
                    "\tldr r0, [r4, 0x24]\n"
                    "\tlsls r0, 3\n"
                    "\tldr r2, [sp, 0x10]\n"
                    "\tstrb r0, [r2]\n"
                    "_081DEBF8:\n"
                    "\tldrb r0, [r4, 0x4]\n"
                    "\tadds r0, 0x8\n"
                    "\tmov r8, r0\n"
                    "\tldrb r0, [r4, 0x1E]\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _081DEC06\n"
                    "\tmovs r0, 0x40\n"
                    "_081DEC06:\n"
                    "\tstrb r0, [r4, 0x1A]\n"
                    "_081DEC08:\n"
                    "\tldrb r1, [r4, 0x4]\n"
                    "\tmovs r2, 0\n"
                    "\tstrb r1, [r4, 0xB]\n"
                    "\tmovs r0, 0xFF\n"
                    "\tands r0, r1\n"
                    "\tadds r1, r6, 0x1\n"
                    "\tmov r10, r1\n"
                    "\tmovs r1, 0x40\n"
                    "\tadds r1, r4\n"
                    "\tmov r9, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbne _081DEC22\n"
                    "\tb _081DED5E\n"
                    "_081DEC22:\n"
                    "\tstrb r2, [r4, 0x9]\n"
                    "\tb _081DED8C\n"
                    "_081DEC26:\n"
                    "\tmovs r0, 0x4\n"
                    "\tands r0, r2\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _081DEC58\n"
                    "\tldrb r0, [r4, 0xD]\n"
                    "\tsubs r0, 0x1\n"
                    "\tstrb r0, [r4, 0xD]\n"
                    "\tmovs r2, 0xFF\n"
                    "\tands r0, r2\n"
                    "\tlsls r0, 24\n"
                    "\tadds r1, r6, 0x1\n"
                    "\tmov r10, r1\n"
                    "\tmovs r2, 0x40\n"
                    "\tadds r2, r4\n"
                    "\tmov r9, r2\n"
                    "\tcmp r0, 0\n"
                    "\tble _081DEC4A\n"
                    "\tb _081DED9E\n"
                    "_081DEC4A:\n"
                    "\tlsls r0, r6, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tbl CgbOscOff\n"
                    "\tmovs r0, 0\n"
                    "\tstrb r0, [r4]\n"
                    "\tb _081DEE9C\n"
                    "_081DEC58:\n"
                    "\tmovs r0, 0x40\n"
                    "\tands r0, r1\n"
                    "\tadds r2, r6, 0x1\n"
                    "\tmov r10, r2\n"
                    "\tmovs r2, 0x40\n"
                    "\tadds r2, r4\n"
                    "\tmov r9, r2\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _081DEC98\n"
                    "\tmovs r0, 0x3\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _081DEC98\n"
                    "\tmovs r0, 0xFC\n"
                    "\tands r0, r1\n"
                    "\tmovs r2, 0\n"
                    "\tstrb r0, [r4]\n"
                    "\tldrb r1, [r4, 0x7]\n"
                    "\tstrb r1, [r4, 0xB]\n"
                    "\tmovs r0, 0xFF\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _081DECCA\n"
                    "\tmovs r0, 0x1\n"
                    "\tldrb r1, [r4, 0x1D]\n"
                    "\torrs r0, r1\n"
                    "\tstrb r0, [r4, 0x1D]\n"
                    "\tcmp r6, 0x3\n"
                    "\tbeq _081DED8C\n"
                    "\tldrb r2, [r4, 0x7]\n"
                    "\tmov r8, r2\n"
                    "\tb _081DED8C\n"
                    "_081DEC98:\n"
                    "\tldrb r0, [r4, 0xB]\n"
                    "\tcmp r0, 0\n"
                    "\tbne _081DED8C\n"
                    "\tcmp r6, 0x3\n"
                    "\tbne _081DECAA\n"
                    "\tmovs r0, 0x1\n"
                    "\tldrb r1, [r4, 0x1D]\n"
                    "\torrs r0, r1\n"
                    "\tstrb r0, [r4, 0x1D]\n"
                    "_081DECAA:\n"
                    "\tadds r0, r4, 0\n"
                    "\tbl CgbModVol\n"
                    "\tmovs r0, 0x3\n"
                    "\tldrb r2, [r4]\n"
                    "\tands r0, r2\n"
                    "\tcmp r0, 0\n"
                    "\tbne _081DECFE\n"
                    "\tldrb r0, [r4, 0x9]\n"
                    "\tsubs r0, 0x1\n"
                    "\tstrb r0, [r4, 0x9]\n"
                    "\tmovs r1, 0xFF\n"
                    "\tands r0, r1\n"
                    "\tlsls r0, 24\n"
                    "\tcmp r0, 0\n"
                    "\tbgt _081DECFA\n"
                    "_081DECCA:\n"
                    "\tldrb r2, [r4, 0xC]\n"
                    "\tldrb r1, [r4, 0xA]\n"
                    "\tadds r0, r2, 0\n"
                    "\tmuls r0, r1\n"
                    "\tadds r0, 0xFF\n"
                    "\tasrs r0, 8\n"
                    "\tmovs r1, 0\n"
                    "\tstrb r0, [r4, 0x9]\n"
                    "\tlsls r0, 24\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _081DEC4A\n"
                    "\tmovs r0, 0x4\n"
                    "\tldrb r2, [r4]\n"
                    "\torrs r0, r2\n"
                    "\tstrb r0, [r4]\n"
                    "\tmovs r0, 0x1\n"
                    "\tldrb r1, [r4, 0x1D]\n"
                    "\torrs r0, r1\n"
                    "\tstrb r0, [r4, 0x1D]\n"
                    "\tcmp r6, 0x3\n"
                    "\tbeq _081DED9E\n"
                    "\tmovs r2, 0x8\n"
                    "\tmov r8, r2\n"
                    "\tb _081DED9E\n"
                    "_081DECFA:\n"
                    "\tldrb r0, [r4, 0x7]\n"
                    "\tb _081DED8A\n"
                    "_081DECFE:\n"
                    "\tcmp r0, 0x1\n"
                    "\tbne _081DED0A\n"
                    "_081DED02:\n"
                    "\tldrb r0, [r4, 0x19]\n"
                    "\tstrb r0, [r4, 0x9]\n"
                    "\tmovs r0, 0x7\n"
                    "\tb _081DED8A\n"
                    "_081DED0A:\n"
                    "\tcmp r0, 0x2\n"
                    "\tbne _081DED4E\n"
                    "\tldrb r0, [r4, 0x9]\n"
                    "\tsubs r0, 0x1\n"
                    "\tstrb r0, [r4, 0x9]\n"
                    "\tmovs r1, 0xFF\n"
                    "\tands r0, r1\n"
                    "\tlsls r0, 24\n"
                    "\tldrb r2, [r4, 0x19]\n"
                    "\tlsls r1, r2, 24\n"
                    "\tcmp r0, r1\n"
                    "\tbgt _081DED4A\n"
                    "_081DED22:\n"
                    "\tldrb r0, [r4, 0x6]\n"
                    "\tcmp r0, 0\n"
                    "\tbne _081DED32\n"
                    "\tmovs r0, 0xFC\n"
                    "\tldrb r1, [r4]\n"
                    "\tands r0, r1\n"
                    "\tstrb r0, [r4]\n"
                    "\tb _081DECCA\n"
                    "_081DED32:\n"
                    "\tldrb r0, [r4]\n"
                    "\tsubs r0, 0x1\n"
                    "\tstrb r0, [r4]\n"
                    "\tmovs r0, 0x1\n"
                    "\tldrb r2, [r4, 0x1D]\n"
                    "\torrs r0, r2\n"
                    "\tstrb r0, [r4, 0x1D]\n"
                    "\tcmp r6, 0x3\n"
                    "\tbeq _081DED02\n"
                    "\tmovs r0, 0x8\n"
                    "\tmov r8, r0\n"
                    "\tb _081DED02\n"
                    "_081DED4A:\n"
                    "\tldrb r0, [r4, 0x5]\n"
                    "\tb _081DED8A\n"
                    "_081DED4E:\n"
                    "\tldrb r0, [r4, 0x9]\n"
                    "\tadds r0, 0x1\n"
                    "\tstrb r0, [r4, 0x9]\n"
                    "\tmovs r1, 0xFF\n"
                    "\tands r0, r1\n"
                    "\tldrb r2, [r4, 0xA]\n"
                    "\tcmp r0, r2\n"
                    "\tbcc _081DED88\n"
                    "_081DED5E:\n"
                    "\tldrb r0, [r4]\n"
                    "\tsubs r0, 0x1\n"
                    "\tmovs r2, 0\n"
                    "\tstrb r0, [r4]\n"
                    "\tldrb r1, [r4, 0x5]\n"
                    "\tstrb r1, [r4, 0xB]\n"
                    "\tmovs r0, 0xFF\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _081DED22\n"
                    "\tmovs r0, 0x1\n"
                    "\tldrb r1, [r4, 0x1D]\n"
                    "\torrs r0, r1\n"
                    "\tstrb r0, [r4, 0x1D]\n"
                    "\tldrb r0, [r4, 0xA]\n"
                    "\tstrb r0, [r4, 0x9]\n"
                    "\tcmp r6, 0x3\n"
                    "\tbeq _081DED8C\n"
                    "\tldrb r2, [r4, 0x5]\n"
                    "\tmov r8, r2\n"
                    "\tb _081DED8C\n"
                    "_081DED88:\n"
                    "\tldrb r0, [r4, 0x4]\n"
                    "_081DED8A:\n"
                    "\tstrb r0, [r4, 0xB]\n"
                    "_081DED8C:\n"
                    "\tldrb r0, [r4, 0xB]\n"
                    "\tsubs r0, 0x1\n"
                    "\tstrb r0, [r4, 0xB]\n"
                    "\tldr r0, [sp]\n"
                    "\tcmp r0, 0\n"
                    "\tbne _081DED9E\n"
                    "\tsubs r0, 0x1\n"
                    "\tstr r0, [sp]\n"
                    "\tb _081DEC98\n"
                    "_081DED9E:\n"
                    "\tmovs r0, 0x2\n"
                    "\tldrb r1, [r4, 0x1D]\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _081DEE16\n"
                    "\tcmp r6, 0x3\n"
                    "\tbgt _081DEDDE\n"
                    "\tmovs r0, 0x8\n"
                    "\tldrb r2, [r4, 0x1]\n"
                    "\tands r0, r2\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _081DEDDE\n"
                    "\tldr r0, =REG_SOUNDBIAS + 1\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r0, 0x3F\n"
                    "\tbgt _081DEDD0\n"
                    "\tldr r0, [r4, 0x20]\n"
                    "\tadds r0, 0x2\n"
                    "\tldr r1, =0x000007fc\n"
                    "\tb _081DEDDA\n"
                    "\t.pool\n"
                    "_081DEDD0:\n"
                    "\tcmp r0, 0x7F\n"
                    "\tbgt _081DEDDE\n"
                    "\tldr r0, [r4, 0x20]\n"
                    "\tadds r0, 0x1\n"
                    "\tldr r1, =0x000007fe\n"
                    "_081DEDDA:\n"
                    "\tands r0, r1\n"
                    "\tstr r0, [r4, 0x20]\n"
                    "_081DEDDE:\n"
                    "\tcmp r6, 0x4\n"
                    "\tbeq _081DEDF0\n"
                    "\tldr r0, [r4, 0x20]\n"
                    "\tldr r1, [sp, 0x10]\n"
                    "\tstrb r0, [r1]\n"
                    "\tb _081DEDFE\n"
                    "\t.pool\n"
                    "_081DEDF0:\n"
                    "\tldr r2, [sp, 0x10]\n"
                    "\tldrb r0, [r2]\n"
                    "\tmovs r1, 0x8\n"
                    "\tands r1, r0\n"
                    "\tldr r0, [r4, 0x20]\n"
                    "\torrs r0, r1\n"
                    "\tstrb r0, [r2]\n"
                    "_081DEDFE:\n"
                    "\tmovs r0, 0xC0\n"
                    "\tldrb r1, [r4, 0x1A]\n"
                    "\tands r0, r1\n"
                    "\tadds r1, r4, 0\n"
                    "\tadds r1, 0x21\n"
                    "\tldrb r1, [r1]\n"
                    "\tadds r0, r1, r0\n"
                    "\tstrb r0, [r4, 0x1A]\n"
                    "\tmovs r2, 0xFF\n"
                    "\tands r0, r2\n"
                    "\tldr r1, [sp, 0x14]\n"
                    "\tstrb r0, [r1]\n"
                    "_081DEE16:\n"
                    "\tmovs r0, 0x1\n"
                    "\tldrb r2, [r4, 0x1D]\n"
                    "\tands r0, r2\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _081DEE9C\n"
                    "\tldr r1, =REG_NR51\n"
                    "\tldrb r0, [r1]\n"
                    "\tldrb r2, [r4, 0x1C]\n"
                    "\tbics r0, r2\n"
                    "\tldrb r2, [r4, 0x1B]\n"
                    "\torrs r0, r2\n"
                    "\tstrb r0, [r1]\n"
                    "\tcmp r6, 0x3\n"
                    "\tbne _081DEE68\n"
                    "\tldr r0, =gCgb3Vol\n"
                    "\tldrb r1, [r4, 0x9]\n"
                    "\tadds r0, r1, r0\n"
                    "\tldrb r0, [r0]\n"
                    "\tldr r2, [sp, 0xC]\n"
                    "\tstrb r0, [r2]\n"
                    "\tmovs r1, 0x80\n"
                    "\tadds r0, r1, 0\n"
                    "\tldrb r2, [r4, 0x1A]\n"
                    "\tands r0, r2\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _081DEE9C\n"
                    "\tldr r0, [sp, 0x8]\n"
                    "\tstrb r1, [r0]\n"
                    "\tldrb r0, [r4, 0x1A]\n"
                    "\tldr r1, [sp, 0x14]\n"
                    "\tstrb r0, [r1]\n"
                    "\tmovs r0, 0x7F\n"
                    "\tldrb r2, [r4, 0x1A]\n"
                    "\tands r0, r2\n"
                    "\tstrb r0, [r4, 0x1A]\n"
                    "\tb _081DEE9C\n"
                    "\t.pool\n"
                    "_081DEE68:\n"
                    "\tmovs r0, 0xF\n"
                    "\tmov r1, r8\n"
                    "\tands r1, r0\n"
                    "\tmov r8, r1\n"
                    "\tldrb r2, [r4, 0x9]\n"
                    "\tlsls r0, r2, 4\n"
                    "\tadd r0, r8\n"
                    "\tldr r1, [sp, 0xC]\n"
                    "\tstrb r0, [r1]\n"
                    "\tmovs r2, 0x80\n"
                    "\tldrb r0, [r4, 0x1A]\n"
                    "\torrs r0, r2\n"
                    "\tldr r1, [sp, 0x14]\n"
                    "\tstrb r0, [r1]\n"
                    "\tcmp r6, 0x1\n"
                    "\tbne _081DEE9C\n"
                    "\tldr r0, [sp, 0x8]\n"
                    "\tldrb r1, [r0]\n"
                    "\tmovs r0, 0x8\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbne _081DEE9C\n"
                    "\tldrb r0, [r4, 0x1A]\n"
                    "\torrs r0, r2\n"
                    "\tldr r1, [sp, 0x14]\n"
                    "\tstrb r0, [r1]\n"
                    "_081DEE9C:\n"
                    "\tmovs r0, 0\n"
                    "\tstrb r0, [r4, 0x1D]\n"
                    "_081DEEA0:\n"
                    "\tmov r6, r10\n"
                    "\tmov r4, r9\n"
                    "\tcmp r6, 0x4\n"
                    "\tbgt _081DEEAA\n"
                    "\tb _081DEAA0\n"
                    "_081DEEAA:\n"
                    "\tadd sp, 0x1C\n"
                    "\tpop {r3-r5}\n"
                    "\tmov r8, r3\n"
                    "\tmov r9, r4\n"
                    "\tmov r10, r5\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r0}\n"
                    "\tbx r0");
}
#endif
