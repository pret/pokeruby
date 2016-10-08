#include "gba/m4a_internal.h"

extern const u8 gCgb3Vol[];

void CgbModVol(struct CgbChannel *chan);

void CgbSound(void)
{
    struct SoundInfo *soundInfo = SOUND_INFO_PTR;
    struct CgbChannel *chan;
    int chanNum;
    u32 c15;
    
    if(soundInfo->c15)
        soundInfo->c15--;
    else
        soundInfo->c15 = 14;
    
    for(chanNum = 1, chan = soundInfo->cgbChans; chanNum <= 4; chanNum++, chan++)
    { 
        vu8 *_r2;
        vu8 *_r7;
        vu8 *_s8;
        vu8 *_s12;
        vu8 *_s16;
        u32 r8;
        
        if(chan->sf & SOUND_CHANNEL_SF_ON)
        {
            switch(chanNum)
            {
                case 1:
                    _s8 = (vu8 *)REG_ADDR_NR10;
                    _r7 = (vu8 *)REG_ADDR_NR11;
                    _s12 = (vu8 *)REG_ADDR_NR12;
                    _s16 = (vu8 *)REG_ADDR_NR13;
                    _r2 = (vu8 *)REG_ADDR_NR14;
                    break;
                case 2:
                    _s8 = (vu8 *)REG_ADDR_NR10 + 1;
                    _r7 = (vu8 *)REG_ADDR_NR21;
                    _s12 = (vu8 *)REG_ADDR_NR22;
                    _s16 = (vu8 *)REG_ADDR_NR23;
                    _r2 = (vu8 *)REG_ADDR_NR24;
                    break;
                case 3:
                    _s8 = (vu8 *)REG_ADDR_NR30;
                    _r7 = (vu8 *)REG_ADDR_NR31;
                    _s12 = (vu8 *)REG_ADDR_NR32;
                    _s16 = (vu8 *)REG_ADDR_NR33;
                    _r2 = (vu8 *)REG_ADDR_NR34;
                    break;
                default:
                    _s8 = (vu8 *)REG_ADDR_NR30 + 1;
                    _r7 = (vu8 *)REG_ADDR_NR41;
                    _s12 = (vu8 *)REG_ADDR_NR42;
                    _s16 = (vu8 *)REG_ADDR_NR43;
                    _r2 = (vu8 *)REG_ADDR_NR44;
                    break;
            }
            //_081DEB30
            c15 = soundInfo->c15;
            r8 = *_s12;
            
            if(chan->sf & SOUND_CHANNEL_SF_START)
            {
                u8 stop = (u32)(chan->sf) & SOUND_CHANNEL_SF_STOP;
                
                if(stop)
                    goto _081DEC4A;
                
                chan->sf = 3;
                chan->mo = 3;
                CgbModVol(chan);
                switch(chanNum)
                {
                    case 1:
                        *_s8 = chan->sw;
                    case 2:
                        *_r7 = ((u32)chan->wp << 6) + (chan->le);
                        r8 = chan->at + 8;
                        if(chan->le)
                            chan->n4 = 0x40;
                        else
                            chan->n4 = 0;
                        break;
                    case 3:
                        if(chan->wp != chan->cp)
                        {
                            *_s8 = 0x40;
                            REG_WAVE_RAM0 = chan->wp[0];
                            REG_WAVE_RAM1 = chan->wp[1];
                            REG_WAVE_RAM2 = chan->wp[2];
                            REG_WAVE_RAM3 = chan->wp[3];
                            chan->cp = chan->wp;
                        }
                        *_s8 = stop;
                        *_r7 = chan->le;
                        if(chan->le)
                            chan->n4 = 0xC0;
                        else
                        {
                            //Stupid compiler! Negating -0x80 produces the same 8-bit result.
                            register u32 n asm("r1") = -0x80;
                            chan->n4 = n;
                        }
                        break;
                    default:
                        *_r7 = chan->le;
                        *_s16 = (u32)chan->wp * 8;
                        r8 = chan->at + 8;
                        if(chan->le)
                            chan->n4 = 0x40;
                        else
                            chan->n4 = 0;
                        //break;
                }
                if(((chan->ec = chan->at)) == 0)
                    goto _081DED5E;
                else
                {
                    chan->ev = 0;
                    goto _081DED8C;
                }
            }
            
            if(chan->sf & 0x4)
            {
                if(--(s8)chan->echoLength > 0)
                    goto _081DED9E;
              _081DEC4A:
                CgbOscOff(chanNum);
                chan->sf = 0;
                goto _081DEE9C;
            }
            
          _081DEC58:
            //_081DEC58
            if((chan->sf & SOUND_CHANNEL_SF_STOP) && (chan->sf & 0x3))
            {
                chan->sf &= SOUND_CHANNEL_SF_ON;
                if((chan->ec = chan->re) == 0)
                    goto _081DECAA;
                chan->mo |= 1;
                if(chanNum == 3)
                    r8 = chan->re;
                goto end;
            }
            //_081DEC98
            
            
          _081DEC98:

            if(chan->ec == 0)
            {
                if(chanNum == 3)
                    chan->mo |= 1;
              _081DECAA:
                CgbModVol(chan);
                if((chan->sf & 3) == 0)
                {
                    if(--(s8)chan->ev > 0)
                        goto _081DECFA;
                  _081DECCA:
                    chan->ev = (chan->eg * chan->echoVolume + 255) / 256;  //round up
                    if(chan->ev == 0)
                        goto _081DEC4A;     //branch up
                    chan->sf |= 4;
                    chan->mo |= 1;
                    if(chanNum != 3)
                        r8 = 2;
                    goto _081DED9E;
                  _081DECFA:
                    chan->ec = chan->re;
                }
                //_081DECFE
                else if((chan->sf & 3) == 1)
                {
                  _081DED02:
                    chan->ev = chan->sg;
                    chan->ec = 7;
                }
                //_081DED0A
                else if((chan->sf & 3) == 2)
                {
                    if((s8)--chan->ev <= (s8)chan->sg)
                    {
                      _081DED22:
                        if(chan->su == 0)
                        {
                            chan->sf &= 0xFC;
                            goto _081DECCA;
                        }
                        //_081DED32
                        chan->sf--;
                        chan->mo |= 1;
                        if(chanNum != 3)
                            r8 = 8;
                        goto _081DED02;
                    }
                    //_081DED4A
                    chan->ec = chan->de;
                }
                //_081DED4E
                else
                {
                    if(++chan->ev < chan->eg)
                    {
                        chan->ec = chan->at;
                        goto end;   //goto _081DED88
                    }
                  _081DED5E:
                    chan->sf--;
                    //chan->ec = chan->de;
                    if((chan->ec = chan->de) == 0)
                        goto _081DED22;
                    chan->mo |= 1;
                    chan->ev = chan->eg;
                    if(chanNum != 3)
                        r8 = chan->de;
                }
            }
            
          end:
          _081DED8C:
            chan->ec--;
            if(c15 == 0)
            {
                c15--;
                goto _081DEC98;     //loop back
            }
          
          _081DED9E:
            //_081DED9E
            if(chan->mo & 2)
            {
                if(chanNum <= 3 && (chan->ty & 8))
                {
                    int regSoundBiasH = REG_SOUNDBIAS_H;
                    
                    if(regSoundBiasH <= 0x3F)
                        chan->fr = (chan->fr + 2) & 0x000007fc;
                    else if(regSoundBiasH <= 0x7F)
                        chan->fr = (chan->fr + 1) & 0x000007fe;
                    //_081DEDDA
                }
                
                //_081DEDDE
                if(chanNum != 4)
                    *_s16 = chan->fr;
                else
                    *_s16 = (*_s16 & 8) | chan->fr;
                
                //_081DEDFE
                
                //Why are we accessing offset 0x21 of this struct?
                *_r2 = (chan->n4 = (chan->n4 & 0xC0) + ((u8 *)chan)[0x21]);
                
            }
            //_081DEE16
            if(chan->mo & 1)
            {
                u8 val = (REG_NR51 & ~chan->panMask) | chan->pan;
                
                REG_NR51 = val;
                if(chanNum == 3)
                {
                    *_s12 = gCgb3Vol[chan->ev];
                    if(chan->n4 & 0x80)
                    {
                        *_s8 = 0x80;
                        *_r2 = chan->n4;
                        chan->n4 &= 0x7F;
                    }
                }
                else
                {
                    //_081DEE68
                    *_s12 = (r8 & 0xF) + (chan->ev << 4);
                    *_r2 = chan->n4 | 0x80;
                    if(chanNum == 1 && (*_s8 & 8) == 0)
                        *_r2 = chan->n4 | 0x80;
                }
            }
            //_081DEE9C
            _081DEE9C:
            chan->mo = 0;
        }
        //_081DEEA0
    }
    //_081DEEAA
}