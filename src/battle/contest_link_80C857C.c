#include "global.h"
#include "ewram.h"
#include "random.h"
#include "task.h"
#include "contest.h"
#include "text.h"
#include "string_util.h"
#include "link.h"

static void sub_80C8644(u8 taskId);
static void sub_80C8660(u8 taskId);
#if GERMAN
void de_sub_80C9274(bool32 arg0);
void de_sub_80C9294(bool32 arg0);
#endif

void sub_80C857C(const void *data, u16 size)
{
    memcpy(eContestLinkSendBuffer, data, size);
    SendBlock(bitmask_all_link_players_but_self(), eContestLinkSendBuffer, size);
}

bool8 sub_80C85AC(u8 who)
{
    u8 flag = 1 << who;
    if (!(GetBlockReceivedStatus() & flag))
        return FALSE;
    ResetBlockReceivedFlag(flag);
    return TRUE;
}

bool8 sub_80C85D8(void)
{
    int i;

    for (i = 0; i < MAX_LINK_PLAYERS; i++)
    {
        if (!((GetBlockReceivedStatus() >> i) & 1))
            return FALSE;
    }
    ResetBlockReceivedFlags();
    return TRUE;
}

void sub_80C8604(u8 taskId)
{
#if ENGLISH
    u8 i;

    for (i = 0; i < 4; i++)
        gBlockRecvBuffer[i][0] = 0xff;
#endif
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].func = sub_80C8644;
}

static void sub_80C8644(u8 taskId)
{
    gTasks[taskId].func = sub_80C8660;
}

static void sub_80C8660(u8 taskId)
{
    if (gReceivedRemoteLinkPlayers)
    {
        gContestPlayerMonIndex = GetMultiplayerId();
        if (GetLinkPlayerCount() == MAX_LINK_PLAYERS)
        {
            gIsLinkContest = TRUE;
            SwitchTaskToFollowupFunc(taskId);
        }
    }
}

#ifdef NONMATCHING
u8 sub_80C86A0(const u8 *string)
{
    u8 language = GAME_LANGUAGE;
    if (string[0] == EXT_CTRL_CODE_BEGIN && string[1] == 0x15)
        return language;
    if (StringLength(string) > 5)
        return language;
    for (; *string != EOS; string++)
    {
        if (!((*string >= CHAR_A && *string <= CHAR_z) ||
            (*string >= CHAR_0 + 0 && *string <= CHAR_0 + 9) ||
            *string == CHAR_SPACE ||
            *string == CHAR_PERIOD ||
            *string == CHAR_COMMA ||
            *string == 0xAB ||
            *string == CHAR_QUESTION_MARK ||
            *string == CHAR_MALE ||
            *string == CHAR_FEMALE ||
            *string == CHAR_SLASH ||
            *string == CHAR_HYPHEN ||
            *string == CHAR_ELLIPSIS ||
            *string == 0xB1 ||
            *string == 0xB2 ||
            *string == 0xB3 ||
            *string == 0xB1
        ))
        {
            language = LANGUAGE_JAPANESE;
            break;
        }
    }
    return language;
}
#else
__attribute__((naked)) u8 sub_80C86A0(const u8 *string)
{
    asm_unified("\tpush {r4,r5,lr}\n"
                    "\tadds r4, r0, 0\n"
                    ".ifdef ENGLISH\n"
                    "\tmovs r5, 0x2\n"
                    ".else\n"
                    "\tmovs r5, 0x5\n"
                    ".endif\n"
                    "\tldrb r0, [r4]\n"
                    "\tcmp r0, 0xFC\n"
                    "\tbne _080C86B6\n"
                    "\tldrb r0, [r4, 0x1]\n"
                    "\tcmp r0, 0x15\n"
                    "\tbne _080C86B6\n"
                    ".ifdef ENGLISH\n"
                    "\tmovs r0, 0x2\n"
                    ".else\n"
                    "\tmovs r0, 0x5\n"
                    ".endif\n"
                    "\tb _080C872C\n"
                    "_080C86B6:\n"
                    "\tadds r0, r4, 0\n"
                    "\tbl StringLength\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tcmp r0, 0x5\n"
                    "\tbhi _080C872A\n"
                    "\tldrb r0, [r4]\n"
                    "\tcmp r0, 0xFF\n"
                    "\tbeq _080C872A\n"
                    "_080C86CA:\n"
                    "\tldrb r1, [r4]\n"
                    "\tadds r0, r1, 0\n"
                    "\tadds r0, 0x45\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tcmp r0, 0x33\n"
                    "\tbls _080C871E\n"
                    "\tadds r0, r1, 0\n"
                    "\tadds r0, 0x5F\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tcmp r0, 0x9\n"
                    "\tbls _080C871E\n"
                    "\tadds r0, r1, 0\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _080C871E\n"
                    "\tcmp r0, 0xAD\n"
                    "\tbeq _080C871E\n"
                    "\tcmp r0, 0xB8\n"
                    "\tbeq _080C871E\n"
                    "\tcmp r0, 0xAB\n"
                    "\tbeq _080C871E\n"
                    "\tcmp r0, 0xAC\n"
                    "\tbeq _080C871E\n"
                    "\tcmp r0, 0xB5\n"
                    "\tbeq _080C871E\n"
                    "\tcmp r0, 0xB6\n"
                    "\tbeq _080C871E\n"
                    "\tcmp r0, 0xBA\n"
                    "\tbeq _080C871E\n"
                    "\tcmp r0, 0xAE\n"
                    "\tbeq _080C871E\n"
                    "\tcmp r0, 0xB0\n"
                    "\tbeq _080C871E\n"
                    "\tcmp r0, 0xB1\n"
                    "\tbeq _080C871E\n"
                    "\tcmp r0, 0xB2\n"
                    "\tbeq _080C871E\n"
                    "\tcmp r0, 0xB3\n"
                    "\tbeq _080C871E\n"
                    "\tcmp r0, 0xB1\n"
                    "\tbne _080C8728\n"
                    "_080C871E:\n"
                    "\tadds r4, 0x1\n"
                    "\tldrb r0, [r4]\n"
                    "\tcmp r0, 0xFF\n"
                    "\tbne _080C86CA\n"
                    "\tb _080C872A\n"
                    "_080C8728:\n"
                    "\tmovs r5, 0x1\n"
                    "_080C872A:\n"
                    "\tadds r0, r5, 0\n"
                    "_080C872C:\n"
                    "\tpop {r4,r5}\n"
                    "\tpop {r1}\n"
                    "\tbx r1");
}
#endif

void sub_80C8734(u8 taskId)
{
    int i;
    u8 *name;

    switch (gTasks[taskId].data[0]) {
#if ENGLISH
        default:
            gTasks[taskId].data[0] = 0;
            SwitchTaskToFollowupFunc(taskId);
            break;
#elif GERMAN
            case 8:
#endif
        case 0:
            if (GetMultiplayerId() == 0) {
                if (sub_8007ECC()) {
#if GERMAN
                    if (gTasks[taskId].data[0] == 0)
                    {
                        gTasks[taskId].data[0] = 3;
                    }
                    else
                    {
#endif
                    memcpy(gBlockSendBuffer, gContestMons + gContestPlayerMonIndex, sizeof(struct ContestPokemon));
#if GERMAN
                    de_sub_80C9274(FALSE);
#endif
                    sub_8007E9C(2);
#if ENGLISH
                    gTasks[taskId].data[0]++;
#elif GERMAN
                    gTasks[taskId].data[0] = 1;
                }
#endif
                }
            }
            else
            {
                memcpy(gBlockSendBuffer, gContestMons + gContestPlayerMonIndex, sizeof(struct ContestPokemon));
#if GERMAN
                de_sub_80C9294(FALSE);
#endif
                gTasks[taskId].data[0]++;
            }
            break;
        case 1:
            if (sub_80C85D8())
            {
                for (i = 0; i < MAX_LINK_PLAYERS; i++)
                {
                    memcpy(gContestMons + i, gBlockRecvBuffer[i], sizeof(struct ContestPokemon));
                    name = gContestMons[i].nickname;
                    if (gLinkPlayers[i].language == LANGUAGE_JAPANESE)
                    {
                        ConvertInternationalString(name, sub_80C86A0(name));
                    }
                    else if (name[10] == EXT_CTRL_CODE_BEGIN)
                    {
                        ConvertInternationalString(name, LANGUAGE_JAPANESE);
                    } else
                    {
                        name[5] = name[10];
                        name[10] = EOS;
                    }
                    name = gContestMons[i].trainerName;
                    if (gLinkPlayers[i].language == LANGUAGE_JAPANESE)
                    {
                        name[7] = EOS;
                        name[6] = name[4];
                        name[5] = name[3];
                        name[4] = name[2];
                        name[3] = name[1];
                        name[2] = name[0];
                        name[1] = 0x15;
                        name[0] = EXT_CTRL_CODE_BEGIN;
                    }
                    else
                    {
                        name[5] = name[7];
                        name[7] = EOS;
                    }
                }
                gTasks[taskId].data[0]++;
            }
            break;
#if GERMAN
        case 2:
            gTasks[taskId].data[0] = 0;
            SwitchTaskToFollowupFunc(taskId);
            break;
        default:
            gTasks[taskId].data[0]++;
            break;
#endif
    }
}

void sub_80C88AC(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
        default:
            gTasks[taskId].data[0] = 0;
            SwitchTaskToFollowupFunc(taskId);
            break;
        case 0:
            if (GetMultiplayerId() == 0)
            {
                if (sub_8007ECC())
                {
                    sub_80C857C(&gRngValue, sizeof(u32));
                    gTasks[taskId].data[0]++;
                }
            }
            else
            {
                gTasks[taskId].data[0]++;
            }
            break;
        case 1:
            if (sub_80C85AC(0))
            {
                memcpy(&gRngValue, gBlockRecvBuffer[0], sizeof(u32));
                memcpy(&gContestRngValue, gBlockRecvBuffer[0], sizeof(u32));
                gTasks[taskId].data[0]++;
            }
            break;
    }
}

void sub_80C8938(u8 taskId)
{
    int i;

    switch (gTasks[taskId].data[0])
    {
#if ENGLISH
        default:
            gTasks[taskId].data[0] = 0;
            SwitchTaskToFollowupFunc(taskId);
            break;
#elif GERMAN
        case 8:
#endif
        case 0:
            gBlockSendBuffer[0] = gTasks[taskId].data[9];
            if (GetMultiplayerId() == 0)
            {
                if (sub_8007ECC())
                {
#if GERMAN
                    if (gTasks[taskId].data[0] == 0)
                    {
                        gTasks[taskId].data[0] = 3;
                    }
                    else
                    {
                        de_sub_80C9274(TRUE);
#endif
                    sub_8007E9C(2);
#if ENGLISH
                    gTasks[taskId].data[0]++;
#elif GERMAN
                        gTasks[taskId].data[0] = 1;
                    }
#endif
                }
            }
            else
            {
#if GERMAN
                de_sub_80C9294(TRUE);
#endif
                gTasks[taskId].data[0]++;
            }
            break;
        case 1:
            if (sub_80C85D8())
            {
                for (i = 0; i < MAX_LINK_PLAYERS; i++)
                {
                    gTasks[taskId].data[i + 1] = gBlockRecvBuffer[i][0];
                }
                gTasks[taskId].data[0]++;
            }
            break;
#if GERMAN
        case 2:
            gTasks[taskId].data[0] = 0;
            SwitchTaskToFollowupFunc(taskId);
            break;
        default:
            gTasks[taskId].data[0]++;
            break;
#endif
    }
}

void sub_80C89DC(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
        default:
            gTasks[taskId].data[0] = 0;
            SwitchTaskToFollowupFunc(taskId);
            break;
        case 0:
            if (sub_8007ECC())
            {
                sub_80C857C(&gContestPlayerMonIndex, sizeof(u8));
                gTasks[taskId].data[0]++;
            }
            break;
        case 1:
            if (sub_80C85D8())
            {
                gTasks[taskId].data[0]++;
            }
            break;
    }
}

void sub_80C8A38(u8 taskId)
{
    int i;

    switch (gTasks[taskId].data[0])
    {
        default:
            gTasks[taskId].data[0] = 0;
            SwitchTaskToFollowupFunc(taskId);
            break;
        case 0:
            if (sub_8007ECC())
            {
                sub_80C857C(&sContestantStatus[gContestPlayerMonIndex].currMove, sizeof(u16));
                gTasks[taskId].data[0]++;
            }
            break;
        case 1:
            if (sub_80C85D8())
            {
                for (i = 0; i < MAX_LINK_PLAYERS; i++)
                {
                    *&sContestantStatus[i].currMove = gBlockRecvBuffer[i][0];
                }
                gTasks[taskId].data[0]++;
            }
            break;
    }
}

void sub_80C8AD0(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
        case 0:
            if (sub_8007ECC())
            {
                sub_80C857C(gUnknown_02038678, sizeof gUnknown_02038678);
                gTasks[taskId].data[0]++;
            }
            break;
        case 1:
            if (sub_80C85D8())
            {
                memcpy(gUnknown_02038678, gBlockRecvBuffer[gUnknown_0203869B], sizeof gUnknown_02038678);
                gTasks[taskId].data[0]++;
            }
            break;
        case 2:
        case 5:
        case 8:
        case 11:
            if (gTasks[taskId].data[1]++ > 10)
            {
                gTasks[taskId].data[1] = 0;
                gTasks[taskId].data[0]++;
            }
            break;
        case 3:
            if (sub_8007ECC())
            {
                sub_80C857C(gUnknown_02038680, sizeof gUnknown_02038680);
                gTasks[taskId].data[0]++;
            }
            break;
        case 4:
            if (sub_80C85D8())
            {
                memcpy(gUnknown_02038680, gBlockRecvBuffer[gUnknown_0203869B], sizeof gUnknown_02038680);
                gTasks[taskId].data[0]++;
            }
            break;
        case 6:
            if (sub_8007ECC())
            {
                sub_80C857C(gUnknown_02038688, sizeof gUnknown_02038688);
                gTasks[taskId].data[0]++;
            }
            break;
        case 7:
            if (sub_80C85D8())
            {
                memcpy(gUnknown_02038688, gBlockRecvBuffer[gUnknown_0203869B], sizeof gUnknown_02038688);
                gTasks[taskId].data[0]++;
            }
            break;
        case 9:
            if (sub_8007ECC())
            {
                sub_80C857C(gContestFinalStandings, sizeof gContestFinalStandings);
                gTasks[taskId].data[0]++;
            }
            break;
        case 10:
            if (sub_80C85D8())
            {
                memcpy(gContestFinalStandings, gBlockRecvBuffer[gUnknown_0203869B], sizeof gContestFinalStandings);
                gTasks[taskId].data[0]++;
            }
            break;
        default:
            gTasks[taskId].data[0] = 0;
            SwitchTaskToFollowupFunc(taskId);
            break;
    }
}

void sub_80C8C80(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
        case 0:
            if (sub_8007ECC())
            {
                sub_80C857C(sContestantStatus, 4 * sizeof(struct ContestantStatus));
                gTasks[taskId].data[0]++;
            }
            break;
        case 1:
            if (sub_80C85D8())
            {
                memcpy(sContestantStatus, gBlockRecvBuffer[gUnknown_0203869B], 4 * sizeof(struct ContestantStatus));
                gTasks[taskId].data[0]++;
            }
            break;
        case 2:
        case 5:
        case 8:
        case 11:
            if (gTasks[taskId].data[1]++ > 10)
            {
                gTasks[taskId].data[1] = 0;
                gTasks[taskId].data[0]++;
            }
            break;
        case 3:
            if (sub_8007ECC())
            {
                sub_80C857C(&shared192D0, sizeof shared192D0);
                gTasks[taskId].data[0]++;
            }
            break;
        case 4:
            if (sub_80C85D8())
            {
                memcpy(&shared192D0, gBlockRecvBuffer[gUnknown_0203869B], sizeof shared192D0);
                gTasks[taskId].data[0]++;
            }
            break;
        case 6:
            if (sub_8007ECC())
            {
                sub_80C857C(&shared19328, sizeof shared19328);
                gTasks[taskId].data[0]++;
            }
            break;
        case 7:
            if (sub_80C85D8())
            {
                memcpy(&shared19328, gBlockRecvBuffer[gUnknown_0203869B], sizeof shared19328);
                gTasks[taskId].data[0]++;
            }
            break;
        case 9:
            if (sub_8007ECC())
            {
                sub_80C857C(gUnknown_02038696, sizeof gUnknown_02038696);
                gTasks[taskId].data[0]++;
            }
            break;
        case 10:
            if (sub_80C85D8())
            {
                memcpy(gUnknown_02038696, gBlockRecvBuffer[gUnknown_0203869B], sizeof gUnknown_02038696);
                gTasks[taskId].data[0]++;
            }
            break;
        default:
            gTasks[taskId].data[0] = 0;
            SwitchTaskToFollowupFunc(taskId);
            break;
    }
}

void sub_80C8E1C(u8 taskId)
{
    int i;

    switch (gTasks[taskId].data[0])
    {
#if ENGLISH
        default:
            gTasks[taskId].data[0] = 0;
            SwitchTaskToFollowupFunc(taskId);
            break;
#elif GERMAN
        case 8:
#endif
        case 0:
            gBlockSendBuffer[0] = 0x64;
            if (GetMultiplayerId() == 0)
            {
                if (sub_8007ECC())
                {
#if GERMAN
                    if (gTasks[taskId].data[0] == 0)
                    {
                        gTasks[taskId].data[0] = 3;
                    }
                    else
                    {
                        de_sub_80C9274(FALSE);
#endif
                    sub_8007E9C(2);
#if ENGLISH
                    gTasks[taskId].data[0]++;
#elif GERMAN
                    gTasks[taskId].data[0] = 1;
                    }
#endif
                }
            }
            else
            {
#if GERMAN
                de_sub_80C9294(FALSE);
#endif
                gTasks[taskId].data[0]++;
            }
            break;
        case 1:
            if (sub_80C85D8())
            {
                for (i = 0; i < MAX_LINK_PLAYERS; i++)
                {
                    gTasks[taskId].data[5 + i] = gBlockRecvBuffer[i][0];
                }
                gTasks[taskId].data[0]++;
            }
            break;
#if GERMAN
        case 2:
            gTasks[taskId].data[0] = 0;
            SwitchTaskToFollowupFunc(taskId);
            break;
        default:
            gTasks[taskId].data[0]++;
            break;
#endif
    }
}

void sub_80C8EBC(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
        default:
            gTasks[taskId].data[0] = 0;
            SwitchTaskToFollowupFunc(taskId);
            break;
        case 0:
            if (sub_8007ECC())
            {
                sub_80C857C(gUnknown_02038670, sizeof gUnknown_02038670);
                gTasks[taskId].data[0]++;
            }
            break;
        case 1:
            if (sub_80C85D8())
            {
                memcpy(gUnknown_02038670, gBlockRecvBuffer[gUnknown_0203869B], sizeof gUnknown_02038670);
                gTasks[taskId].data[0]++;
            }
            break;
    }
}

void sub_80C8F34(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
        default:
            gTasks[taskId].data[0] = 0;
            SwitchTaskToFollowupFunc(taskId);
            break;
        case 0:
            if (sub_8007ECC())
            {
                sub_80C857C(gUnknown_02038696, sizeof gUnknown_02038696);
                gTasks[taskId].data[0]++;
            }
            break;
        case 1:
            if (sub_80C85D8())
            {
                memcpy(gUnknown_02038696, gBlockRecvBuffer[gUnknown_0203869B], sizeof gUnknown_02038696);
                gTasks[taskId].data[0]++;
            }
            break;
    }
}

#if GERMAN

void de_sub_80C9274(bool32 arg0)
{
    if (deUnkValue2 == 1)
    {
        if (arg0)
            deUnkValue2 = 3;
        else
            deUnkValue2 = 2;
    }
}

void de_sub_80C9294(bool32 arg0)
{
    if (deUnkValue2 == 1)
    {
        if (arg0)
            deUnkValue2 = 3;
        else
            deUnkValue2 = 2;
    }
    else if (deUnkValue2 == 2)
    {
        SendBlock(0, sBlockRequestLookupTable[deUnkValue1].address, sBlockRequestLookupTable[deUnkValue1].size);
        if (arg0)
            deUnkValue2 = 0;
        else
            deUnkValue2 = 1;
    }
}

#endif
