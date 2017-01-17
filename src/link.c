#include "global.h"
#include "link.h"
#include "asm.h"
#include "battle.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "rng.h"
#include "save.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "text.h"

#define SIO_MULTI_CNT ((struct SioMultiCnt *)REG_ADDR_SIOCNT)

struct BlockTransfer
{
    u16 pos;
    u16 size;
    void *src;
    bool8 active;
    u8 multiplayerId;
};

struct LinkTestBGInfo
{
    u32 screenBaseBlock;
    u32 paletteNum;
    u32 dummy_8;
    u32 dummy_C;
};

extern u8 unk_2000000[];
extern u8 unk_2004000[];
extern u16 gBattleTypeFlags;
extern u16 gScriptItemId;

extern u16 word_3004858;

extern u8 gMultiText_LinkError[];

static void InitLinkTestBG(u8, u8, u8, u8);
void InitLinkTestBG_Unused(u8, u8, u8, u8);
void LinkTestScreen();
static void InitLocalLinkPlayer(void);
static void VBlankCB_LinkTest(void);
static void InitLink(void);
static void Task_TriggerHandshake(u8);
static void TestBlockTransfer(u32, u32, u32);
static void LinkTestProcessKeyInput(void);
static void CB2_LinkTest(void);
void HandleReceiveRemoteLinkPlayer(u8);
static void ProcessRecvCmds(u8);
static void BuildSendCmd(u16);
static void sub_8007B44(void);
static void ResetBlockSend(void);
static bool8 InitBlockSend(void *, u32);
static void LinkCB_BlockSendBegin(void);
static void LinkCB_BlockSend(void);
static void LinkCB_BlockSendEnd(void);
static void sub_8007E04(void);
u32 sub_8007E40(void);
void SetBlockReceivedFlag(u8);
static u16 LinkTestCalcBlockChecksum(void *, u16);
static void PrintHexDigit(u8, u8, u8);
static void PrintHex(u32, u8, u8, u8);
static void LinkCB_RequestPlayerDataExchange(void);
static void Task_PrintTestData(u8);
bool8 sub_8008224(void);
u8 GetDummy2(void);
static void sub_8008350(void);
static void sub_800837C(void);
static void sub_80083E0(void);
static void sub_8008454(void);
static void sub_80084C8(void);
static void sub_80084F4(void);
static void CheckErrorStatus(void);
static void CB2_PrintErrorMessage(void);
static u8 IsSioMultiMaster(void);
static void DisableSerial(void);
static void EnableSerial(void);
static void CheckMasterOrSlave(void);
static void InitTimer(void);
static void EnqueueSendCmd(u16 *);
static void DequeueRecvCmds(u16[CMD_LENGTH][MAX_LINK_PLAYERS]);
static void StartTransfer(void);
static bool8 DoHandshake(void);
static void DoRecv(void);
static void DoSend(void);
static void StopTimer(void);
static void SendRecvDone(void);
void ResetSendBuffer(void);
void ResetRecvBuffer(void);

static struct BlockTransfer sBlockSend;
static struct BlockTransfer sBlockRecv[MAX_LINK_PLAYERS];
static u32 sBlockSendDelayCounter;
static u32 sDummy1;
static u8 sDummy2;
static u32 sPlayerDataExchangeStatus;
static u32 sErrorLinkStatus;
static u32 sErrorLastRecvQueueCount;
static u32 sErrorLastSendQueueCount;
static u32 sDummy3;
static u8 sLinkTestLastBlockSendPos;
static u8 sLinkTestLastBlockRecvPos[MAX_LINK_PLAYERS];
static u8 sNumVBlanksWithoutSerialIntr;
static bool8 sSendBufferEmpty;
static u16 sSendNonzeroCheck;
static u16 sRecvNonzeroCheck;
static u8 sChecksumAvailable;
static u8 sHandshakePlayerCount;

u16 word_3002910[MAX_LINK_PLAYERS];
u32 gLinkDebugValue1;
struct LinkPlayerBlock localLinkPlayerBlock;
bool8 gLinkErrorOccurred;
u32 gLinkDebugValue2;
u8 deUnkValue1;
u8 deUnkValue2;
bool8 gLinkPlayerPending[MAX_LINK_PLAYERS];
struct LinkPlayer gLinkPlayers[MAX_LINK_PLAYERS];
bool8 gBlockReceived[MAX_LINK_PLAYERS];
u16 gLinkHeldKeys;
u16 gLinkTimeOutCounter;
struct LinkPlayer localLinkPlayer;
u16 gRecvCmds[CMD_LENGTH][MAX_LINK_PLAYERS];
u32 gLinkStatus;
bool8 gLinkDummyBool;
u8 byte_3002A68;
u8 gBlockSendBuffer[BLOCK_BUFFER_SIZE];
bool8 u8_array_3002B70[MAX_LINK_PLAYERS];
u16 gLinkType;
bool8 u8_array_3002B78[MAX_LINK_PLAYERS];
u16 gBlockRecvBuffer[MAX_LINK_PLAYERS][BLOCK_BUFFER_SIZE / 2];
bool8 gSuppressLinkErrorMessage;
u8 gSavedLinkPlayerCount;
u16 gSendCmd[CMD_LENGTH];
u8 gSavedMultiplayerId;
bool8 gReceivedRemoteLinkPlayers;
struct LinkTestBGInfo gLinkTestBGInfo;
void (*gLinkCallback)(void);
struct LinkPlayer gSavedLinkPlayers[MAX_LINK_PLAYERS];
u8 gShouldAdvanceLinkState;
u16 gLinkTestBlockChecksums[MAX_LINK_PLAYERS];
u8 gBlockRequestType;
u8 gLastSendQueueCount;
struct Link gLink;
u8 gLastRecvQueueCount;
u16 gLinkSavedIme;

EWRAM_DATA bool8 gLinkTestDebugValuesEnabled = {0};
EWRAM_DATA bool8 gLinkTestDummyBool = {0};
EWRAM_DATA u32 gFiller_20238B8 = {0};
EWRAM_DATA u32 dword_20238BC = {0};
EWRAM_DATA bool8 gLinkOpen = {0};

#include "link/digit_palette.h"
#include "link/digit_tiles.h"

static const u8 sDebugMessages[7][12] =
{
    _"せつぞく　ちゅうです",
    _"せつぞく　できません",
    _"かくにん　ちゅうです",
    _"かくにん　できました",
    _"かくにん　できません",
    _"かくにん　を　かくにん",
    _"かくにん　は　しっぱい",
};

static const u8 sColorCodes[] = _"{HIGHLIGHT TRANSPARENT}{COLOR WHITE2}";

const struct BlockRequest sBlockRequestLookupTable[5] =
{
    {gBlockSendBuffer, 200},
    {gBlockSendBuffer, 200},
    {gBlockSendBuffer, 100},
    {gBlockSendBuffer, 220},
    {gBlockSendBuffer, 40},
};

static const u8 sTestString[] = _"テストな";

ALIGNED(4) static const u8 sMagic[] = "GameFreak inc.";

ALIGNED(4) static const u8 sEmptyString[] = _"";

void Task_DestroySelf(u8 taskId)
{
    DestroyTask(taskId);
}

static void InitLinkTestBG(u8 paletteNum, u8 bgNum, u8 screenBaseBlock, u8 charBaseBlock)
{
    LoadPalette(sLinkTestDigitPalette, 16 * paletteNum, 32);
    DmaCopy16(3, sLinkTestDigitTiles, BG_CHAR_ADDR(charBaseBlock), 0x220);

    gLinkTestBGInfo.screenBaseBlock = screenBaseBlock;
    gLinkTestBGInfo.paletteNum = paletteNum;

    switch (bgNum)
    {
    case 1:
        REG_BG1CNT = 1 | (screenBaseBlock << 8) | (charBaseBlock << 2);
        break;
    case 2:
        REG_BG2CNT = 1 | (screenBaseBlock << 8) | (charBaseBlock << 2);
        break;
    case 3:
        REG_BG3CNT = 1 | (screenBaseBlock << 8) | (charBaseBlock << 2);
        break;
    }
}

void InitLinkTestBG_Unused(u8 paletteNum, u8 bgNum, u8 screenBaseBlock, u8 charBaseBlock)
{
    LoadPalette(sLinkTestDigitPalette, 16 * paletteNum, 32);
    DmaCopy16(3, sLinkTestDigitTiles, BG_CHAR_ADDR(charBaseBlock), 0x220);

    gLinkTestBGInfo.screenBaseBlock = screenBaseBlock;
    gLinkTestBGInfo.paletteNum = paletteNum;

    *gBGControlRegs[bgNum] = (screenBaseBlock << 8) | (charBaseBlock << 2);
}

void LinkTestScreen(void)
{
    s32 i;
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    SetVBlankCallback(VBlankCB_LinkTest);
    SetUpWindowConfig(&gWindowConfig_81E6CE4);
    InitMenuWindow((struct WindowConfig *)&gWindowConfig_81E6CE4);
    ResetBlockSend();
    gLinkType = 0x1111;
    OpenLink();
    SeedRng(gMain.vblankCounter1);

    for (i = 0; i < 4; i++)
    {
        // Very weird code, but nothing else seems to match.
        // The following would have the same effect:
        // gSaveBlock2.playerTrainerId[i] = Random();
        u8 *trainerId = gSaveBlock2.playerTrainerId;
        s32 r;
        s32 mask = 0xFF;
        trainerId[i] = (r = Random()) & mask;
    }

    InitLinkTestBG(0, 2, 4, 0);
    REG_DISPCNT = DISPCNT_OBJ_ON | DISPCNT_BG0_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_1D_MAP;
    CreateTask(Task_DestroySelf, 0);
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    sDummy3 = 0;
    InitLocalLinkPlayer();
    CreateTask(Task_PrintTestData, 0);
    SetMainCallback2(CB2_LinkTest);
}

void sub_8007270(u8 a1)
{
    localLinkPlayer.lp_field_18 = a1;
}

static void InitLocalLinkPlayer(void)
{
    s32 i;

    localLinkPlayer.trainerId = gSaveBlock2.playerTrainerId[0]
                              | (gSaveBlock2.playerTrainerId[1] << 8)
                              | (gSaveBlock2.playerTrainerId[2] << 16)
                              | (gSaveBlock2.playerTrainerId[3] << 24);

    for (i = 0; i < (s32)sizeof(localLinkPlayer.name); i++)
        localLinkPlayer.name[i] = gSaveBlock2.playerName[i]; // UB: reads past the end of "playerName" array

    localLinkPlayer.gender = gSaveBlock2.playerGender;
    localLinkPlayer.linkType = gLinkType;
    localLinkPlayer.language = gGameLanguage;
    localLinkPlayer.version = gGameVersion + 0x4000;
    localLinkPlayer.lp_field_2 = 0;
}

static void VBlankCB_LinkTest(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void InitLink(void)
{
    s32 i;

    for (i = 0; i < CMD_LENGTH; i++)
        gSendCmd[i] = 0xEFFF;

    gLinkOpen = TRUE;
    EnableSerial();
}

static void Task_TriggerHandshake(u8 taskId)
{
    gTasks[taskId].data[0]++;

    if (gTasks[taskId].data[0] == 5)
    {
        gShouldAdvanceLinkState = 1;
        DestroyTask(taskId);
    }
}

void OpenLink(void)
{
    s32 i;

    ResetSerial();
    InitLink();

    gLinkCallback = LinkCB_RequestPlayerDataExchange;
    gLinkVSyncDisabled = FALSE;
    gLinkErrorOccurred = FALSE;
    gSuppressLinkErrorMessage = FALSE;

    ResetBlockReceivedFlags();

    sDummy1 = 0;
    byte_3002A68 = 0;
    gLinkDummyBool = FALSE;
    gReceivedRemoteLinkPlayers = FALSE;

    for (i = 0; i < 4; i++)
    {
        gLinkPlayerPending[i] = TRUE;
        u8_array_3002B78[i] = 0;
        u8_array_3002B70[i] = 0;
    }

    CreateTask(Task_TriggerHandshake, 2);
}

void CloseLink(void)
{
    gReceivedRemoteLinkPlayers = FALSE;
    gLinkOpen = FALSE;
    DisableSerial();
}

static void TestBlockTransfer(u32 a1, u32 a2, u32 a3)
{
    u8 i;
    u8 val;

    if (sLinkTestLastBlockSendPos != sBlockSend.pos)
    {
        PrintHex(sBlockSend.pos, 2, 3, 2);
        sLinkTestLastBlockSendPos = sBlockSend.pos;
    }

    for (i = 0; i < MAX_LINK_PLAYERS; i++)
    {
        if (sLinkTestLastBlockRecvPos[i] != sBlockRecv[i].pos)
        {
            PrintHex(sBlockRecv[i].pos, 2, i + 4, 2);
            sLinkTestLastBlockRecvPos[i] = sBlockRecv[i].pos;
        }
    }

    val = GetBlockReceivedStatus();

    if (val == 0xF)
    {
        for (i = 0; i < MAX_LINK_PLAYERS; i++)
        {
            if ((val >> i) & 1)
            {
                gLinkTestBlockChecksums[i] = LinkTestCalcBlockChecksum(&gBlockRecvBuffer[i], sBlockRecv[i].size);
                ResetBlockReceivedFlag(i);
                if (gLinkTestBlockChecksums[i] != 834)
                {
                    gLinkTestDebugValuesEnabled = FALSE;
                    gLinkTestDummyBool = FALSE;
                }
            }
        }
    }
}

static void LinkTestProcessKeyInput(void)
{
    if (gMain.newKeys & A_BUTTON)
        gShouldAdvanceLinkState = 1;
    if (gMain.heldKeys & B_BUTTON)
        InitBlockSend(unk_2004000, 0x2004);
    if (gMain.newKeys & L_BUTTON)
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 2);
    if (gMain.newKeys & START_BUTTON)
        SetSuppressLinkErrorMessage(TRUE);
    if (gMain.newKeys & R_BUTTON)
        sub_8125D44(1);
    if (gMain.newKeys & SELECT_BUTTON)
        sub_800832C();
    if (gLinkTestDebugValuesEnabled)
    {
        u32 vblankCounter1 = gMain.vblankCounter1;
        u8 val = gLinkVSyncDisabled;
        if (!gLinkCallback)
            val = gLinkVSyncDisabled | 0x10;
        SetLinkDebugValues(vblankCounter1, val);
    }
}

static void CB2_LinkTest(void)
{
    LinkTestProcessKeyInput();
    TestBlockTransfer(1, 1, 0);
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

u16 LinkMain2(u16 *heldKeys)
{
    u8 i;

    if (!gLinkOpen)
        return 0;

    for (i = 0; i < CMD_LENGTH; i++)
        gSendCmd[i] = 0;

    gLinkHeldKeys = *heldKeys;

    if (gLinkStatus & LINK_STAT_CONN_ESTABLISHED)
    {
        ProcessRecvCmds(SIO_MULTI_CNT->id);
        if (gLinkCallback)
            gLinkCallback();
        CheckErrorStatus();
    }

    return gLinkStatus;
}

void HandleReceiveRemoteLinkPlayer(u8 multiplayerId)
{
    u32 pendingLinkPlayerCount = 0;
    s32 i;

    gLinkPlayerPending[multiplayerId] = FALSE;

    for (i = 0; i < GetLinkPlayerCount_2(); i++)
        pendingLinkPlayerCount += gLinkPlayerPending[i];

    if (pendingLinkPlayerCount == 0 && !gReceivedRemoteLinkPlayers)
        gReceivedRemoteLinkPlayers = TRUE;
}

#ifdef NONMATCHING
static void ProcessRecvCmds(u8 unusedParam)
{
    u16 i;
    for (i = 0; i < MAX_LINK_PLAYERS; i++)
    {
        word_3002910[i] = 0;
        if (!gRecvCmds[0][i])
            continue;
        switch (gRecvCmds[0][i])
        {
        case 0x2222:
            InitLocalLinkPlayer();
            localLinkPlayerBlock.linkPlayer = localLinkPlayer;
            memcpy(localLinkPlayerBlock.magic1, sMagic, 15);
            memcpy(localLinkPlayerBlock.magic2, sMagic, 15);
            InitBlockSend(&localLinkPlayerBlock, sizeof(localLinkPlayerBlock));
            break;
        case 0x5555:
            byte_3002A68 = 1;
            break;
        case 0x5566:
            byte_3002A68 = 1;
            break;
        case 0xBBBB:
        {
            struct BlockTransfer *blockRecv = &sBlockRecv[i];
            blockRecv->pos = 0;
            blockRecv->size = gRecvCmds[1][i];
            blockRecv->multiplayerId = gRecvCmds[2][i];
            break;
        }
        case 0x8888:
            if (sBlockRecv[i].size > BLOCK_BUFFER_SIZE)
            {
                u16 *buffer = (u16 *)unk_2000000;
                u16 j;
                for (j = 0; j < CMD_LENGTH - 1; j++)
                    buffer[(sBlockRecv[i].pos / 2) + j] = gRecvCmds[j + 1][i];
            }
            else
            {
                u16 j;
                for (j = 0; j < CMD_LENGTH - 1; j++)
                    gBlockRecvBuffer[i][(sBlockRecv[i].pos / 2) + j] = gRecvCmds[j + 1][i];
            }

            sBlockRecv[i].pos += (CMD_LENGTH - 1) * 2;

            if (sBlockRecv[i].pos >= sBlockRecv[i].size)
            {
                if (gLinkPlayerPending[i] == TRUE)
                {
                    struct LinkPlayerBlock *block = (struct LinkPlayerBlock *)&gBlockRecvBuffer[i];
                    struct LinkPlayer *linkPlayer = &gLinkPlayers[i];
                    *linkPlayer = block->linkPlayer;

                    if (strcmp(block->magic1, sMagic)
                     || strcmp(block->magic2, sMagic))
                    {
                        SetMainCallback2(CB2_LinkError);
                    }
                    else
                    {
                        HandleReceiveRemoteLinkPlayer(i);
                    }

                    ConvertInternationalString(gLinkPlayers[i].name, gLinkPlayers[i].language);
                }
                else
                {
                    SetBlockReceivedFlag(i);
                }
            }
            break;
        case 0x5FFF:
            u8_array_3002B78[i] = 1;
            break;
        case 0x2FFE:
            u8_array_3002B70[i] = 1;
            break;
        case 0xAAAA:
            sub_8007E24();
            break;
        case 0xAAAB:
            sub_80516C4(i, gRecvCmds[1][i]);
            break;
        case 0xCCCC:
        {
            const u32 *addresses;
            const u32 *sizes;
            void *data;
            u16 size;

            addresses = sBlockRequestLookupTable;
            data = (void *)addresses[gRecvCmds[1][i] * 2];

            sizes = addresses + 1;
            size = sizes[gRecvCmds[1][i] * 2];

            SendBlock(0, data, size);
            break;
        }
        case 0x4444:
            word_3002910[i] = gRecvCmds[1][i];
            break;
        case 0xCAFE:
            word_3002910[i] = gRecvCmds[1][i];
            break;
        }
    }
}
#else
__attribute__((naked))
static void ProcessRecvCmds(u8 unusedParam)
{
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x4\n\
	movs r7, 0\n\
	ldr r0, _0800786C @ =gRecvCmds\n\
	adds r0, 0x8\n\
	mov r10, r0\n\
_08007824:\n\
	ldr r0, _08007870 @ =word_3002910\n\
	lsls r3, r7, 1\n\
	adds r2, r3, r0\n\
	movs r1, 0\n\
	strh r1, [r2]\n\
	ldr r4, _0800786C @ =gRecvCmds\n\
	adds r1, r3, r4\n\
	ldrh r0, [r1]\n\
	mov r8, r3\n\
	adds r5, r7, 0x1\n\
	str r5, [sp]\n\
	cmp r0, 0\n\
	bne _08007840\n\
	b _08007B54\n\
_08007840:\n\
	ldrh r1, [r1]\n\
	ldr r0, _08007874 @ =0x00005fff\n\
	cmp r1, r0\n\
	bne _0800784A\n\
	b _08007A92\n\
_0800784A:\n\
	cmp r1, r0\n\
	bgt _08007898\n\
	ldr r0, _08007878 @ =0x00004444\n\
	cmp r1, r0\n\
	bne _08007856\n\
	b _08007B4C\n\
_08007856:\n\
	cmp r1, r0\n\
	bgt _08007884\n\
	ldr r0, _0800787C @ =0x00002222\n\
	cmp r1, r0\n\
	beq _080078EC\n\
	ldr r0, _08007880 @ =0x00002ffe\n\
	cmp r1, r0\n\
	bne _08007868\n\
	b _08007A9C\n\
_08007868:\n\
	b _08007B54\n\
	.align 2, 0\n\
_0800786C: .4byte gRecvCmds\n\
_08007870: .4byte word_3002910\n\
_08007874: .4byte 0x00005fff\n\
_08007878: .4byte 0x00004444\n\
_0800787C: .4byte 0x00002222\n\
_08007880: .4byte 0x00002ffe\n\
_08007884:\n\
	ldr r0, _08007894 @ =0x00005555\n\
	cmp r1, r0\n\
	beq _0800793C\n\
	adds r0, 0x11\n\
	cmp r1, r0\n\
	beq _0800793C\n\
	b _08007B54\n\
	.align 2, 0\n\
_08007894: .4byte 0x00005555\n\
_08007898:\n\
	ldr r0, _080078B4 @ =0x0000aaab\n\
	cmp r1, r0\n\
	bne _080078A0\n\
	b _08007AB2\n\
_080078A0:\n\
	cmp r1, r0\n\
	bgt _080078C0\n\
	ldr r0, _080078B8 @ =0x00008888\n\
	cmp r1, r0\n\
	beq _08007970\n\
	ldr r0, _080078BC @ =0x0000aaaa\n\
	cmp r1, r0\n\
	bne _080078B2\n\
	b _08007AAC\n\
_080078B2:\n\
	b _08007B54\n\
	.align 2, 0\n\
_080078B4: .4byte 0x0000aaab\n\
_080078B8: .4byte 0x00008888\n\
_080078BC: .4byte 0x0000aaaa\n\
_080078C0:\n\
	ldr r0, _080078D4 @ =0x0000cafe\n\
	cmp r1, r0\n\
	bne _080078C8\n\
	b _08007B4C\n\
_080078C8:\n\
	cmp r1, r0\n\
	bgt _080078DC\n\
	ldr r0, _080078D8 @ =0x0000bbbb\n\
	cmp r1, r0\n\
	beq _08007948\n\
	b _08007B54\n\
	.align 2, 0\n\
_080078D4: .4byte 0x0000cafe\n\
_080078D8: .4byte 0x0000bbbb\n\
_080078DC:\n\
	ldr r0, _080078E8 @ =0x0000cccc\n\
	cmp r1, r0\n\
	bne _080078E4\n\
	b _08007AC2\n\
_080078E4:\n\
	b _08007B54\n\
	.align 2, 0\n\
_080078E8: .4byte 0x0000cccc\n\
_080078EC:\n\
	bl InitLocalLinkPlayer\n\
	ldr r0, _08007930 @ =localLinkPlayerBlock\n\
	adds r2, r0, 0\n\
	adds r2, 0x10\n\
	ldr r1, _08007934 @ =localLinkPlayer\n\
	ldm r1!, {r3,r4,r6}\n\
	stm r2!, {r3,r4,r6}\n\
	ldm r1!, {r3,r5,r6}\n\
	stm r2!, {r3,r5,r6}\n\
	ldr r1, [r1]\n\
	str r1, [r2]\n\
	ldr r4, _08007938 @ =0x081f4578\n\
	adds r2, r0, 0\n\
	adds r1, r4, 0\n\
	ldm r1!, {r3,r5,r6}\n\
	stm r2!, {r3,r5,r6}\n\
	ldrh r3, [r1]\n\
	strh r3, [r2]\n\
	ldrb r1, [r1, 0x2]\n\
	strb r1, [r2, 0x2]\n\
	adds r1, r0, 0\n\
	adds r1, 0x2C\n\
	ldm r4!, {r2,r5,r6}\n\
	stm r1!, {r2,r5,r6}\n\
	ldrh r2, [r4]\n\
	strh r2, [r1]\n\
	ldrb r2, [r4, 0x2]\n\
	strb r2, [r1, 0x2]\n\
	movs r1, 0x3C\n\
	bl InitBlockSend\n\
	b _08007B54\n\
	.align 2, 0\n\
_08007930: .4byte localLinkPlayerBlock\n\
_08007934: .4byte localLinkPlayer\n\
_08007938: .4byte 0x081f4578\n\
_0800793C:\n\
	ldr r1, _08007944 @ =byte_3002A68\n\
	movs r0, 0x1\n\
	strb r0, [r1]\n\
	b _08007B54\n\
	.align 2, 0\n\
_08007944: .4byte byte_3002A68\n\
_08007948:\n\
	adds r1, r3, r7\n\
	lsls r1, 2\n\
	ldr r5, _08007968 @ =0x030003f8\n\
	adds r1, r5\n\
	movs r6, 0\n\
	strh r6, [r1]\n\
	mov r2, r10\n\
	adds r0, r3, r2\n\
	ldrh r0, [r0]\n\
	strh r0, [r1, 0x2]\n\
	ldr r0, _0800796C @ =gRecvCmds\n\
	adds r0, 0x10\n\
	adds r0, r3, r0\n\
	ldrh r0, [r0]\n\
	strb r0, [r1, 0x9]\n\
	b _08007B54\n\
	.align 2, 0\n\
_08007968: .4byte 0x030003f8\n\
_0800796C: .4byte gRecvCmds\n\
_08007970:\n\
	adds r0, r3, r7\n\
	lsls r0, 2\n\
	ldr r5, _080079B0 @ =0x030003f8\n\
	adds r4, r0, r5\n\
	ldrh r1, [r4, 0x2]\n\
	movs r0, 0x80\n\
	lsls r0, 1\n\
	adds r6, r5, 0\n\
	mov r9, r6\n\
	cmp r1, r0\n\
	bls _080079BC\n\
	ldr r6, _080079B4 @ =0x02000000\n\
	movs r2, 0\n\
	adds r5, r3, 0\n\
	adds r3, r4, 0\n\
	ldr r4, _080079B8 @ =gRecvCmds\n\
_08007990:\n\
	ldrh r1, [r3]\n\
	lsrs r1, 1\n\
	adds r1, r2\n\
	lsls r1, 1\n\
	adds r1, r6\n\
	adds r2, 0x1\n\
	lsls r0, r2, 3\n\
	adds r0, r5, r0\n\
	adds r0, r4\n\
	ldrh r0, [r0]\n\
	strh r0, [r1]\n\
	lsls r2, 16\n\
	lsrs r2, 16\n\
	cmp r2, 0x6\n\
	bls _08007990\n\
	b _080079E8\n\
	.align 2, 0\n\
_080079B0: .4byte 0x030003f8\n\
_080079B4: .4byte 0x02000000\n\
_080079B8: .4byte gRecvCmds\n\
_080079BC:\n\
	movs r2, 0\n\
	ldr r0, _08007A50 @ =gBlockRecvBuffer\n\
	mov r12, r0\n\
	adds r5, r3, 0\n\
	ldr r6, _08007A54 @ =gRecvCmds\n\
	lsls r3, r7, 8\n\
_080079C8:\n\
	ldrh r1, [r4]\n\
	lsrs r1, 1\n\
	adds r1, r2\n\
	lsls r1, 1\n\
	adds r1, r3\n\
	add r1, r12\n\
	adds r2, 0x1\n\
	lsls r0, r2, 3\n\
	adds r0, r5, r0\n\
	adds r0, r6\n\
	ldrh r0, [r0]\n\
	strh r0, [r1]\n\
	lsls r2, 16\n\
	lsrs r2, 16\n\
	cmp r2, 0x6\n\
	bls _080079C8\n\
_080079E8:\n\
	mov r2, r8\n\
	adds r1, r2, r7\n\
	lsls r1, 2\n\
	add r1, r9\n\
	ldrh r0, [r1]\n\
	adds r0, 0xE\n\
	strh r0, [r1]\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	ldrh r1, [r1, 0x2]\n\
	cmp r0, r1\n\
	bcs _08007A02\n\
	b _08007B54\n\
_08007A02:\n\
	ldr r0, _08007A58 @ =gLinkPlayerPending\n\
	adds r0, r7, r0\n\
	ldrb r0, [r0]\n\
	cmp r0, 0x1\n\
	bne _08007A88\n\
	lsls r1, r7, 8\n\
	ldr r0, _08007A50 @ =gBlockRecvBuffer\n\
	adds r5, r1, r0\n\
	lsls r4, r7, 3\n\
	subs r1, r4, r7\n\
	lsls r1, 2\n\
	ldr r0, _08007A5C @ =gLinkPlayers\n\
	adds r1, r0\n\
	adds r0, r5, 0\n\
	adds r0, 0x10\n\
	ldm r0!, {r2,r3,r6}\n\
	stm r1!, {r2,r3,r6}\n\
	ldm r0!, {r2,r3,r6}\n\
	stm r1!, {r2,r3,r6}\n\
	ldr r0, [r0]\n\
	str r0, [r1]\n\
	ldr r6, _08007A60 @ =0x081f4578\n\
	adds r0, r5, 0\n\
	adds r1, r6, 0\n\
	bl strcmp\n\
	cmp r0, 0\n\
	bne _08007A48\n\
	adds r0, r5, 0\n\
	adds r0, 0x2C\n\
	adds r1, r6, 0\n\
	bl strcmp\n\
	cmp r0, 0\n\
	beq _08007A68\n\
_08007A48:\n\
	ldr r0, _08007A64 @ =CB2_LinkError\n\
	bl SetMainCallback2\n\
	b _08007A70\n\
	.align 2, 0\n\
_08007A50: .4byte gBlockRecvBuffer\n\
_08007A54: .4byte gRecvCmds\n\
_08007A58: .4byte gLinkPlayerPending\n\
_08007A5C: .4byte gLinkPlayers\n\
_08007A60: .4byte 0x081f4578\n\
_08007A64: .4byte CB2_LinkError\n\
_08007A68:\n\
	lsls r0, r7, 24\n\
	lsrs r0, 24\n\
	bl HandleReceiveRemoteLinkPlayer\n\
_08007A70:\n\
	subs r2, r4, r7\n\
	lsls r2, 2\n\
	ldr r1, _08007A84 @ =0x03002988\n\
	adds r0, r2, r1\n\
	adds r1, r2\n\
	ldrb r1, [r1, 0x12]\n\
	bl ConvertInternationalString\n\
	b _08007B54\n\
	.align 2, 0\n\
_08007A84: .4byte 0x03002988\n\
_08007A88:\n\
	lsls r0, r7, 24\n\
	lsrs r0, 24\n\
	bl SetBlockReceivedFlag\n\
	b _08007B54\n\
_08007A92:\n\
	ldr r0, _08007A98 @ =u8_array_3002B78\n\
	b _08007A9E\n\
	.align 2, 0\n\
_08007A98: .4byte u8_array_3002B78\n\
_08007A9C:\n\
	ldr r0, _08007AA8 @ =u8_array_3002B70\n\
_08007A9E:\n\
	adds r0, r7, r0\n\
	movs r1, 0x1\n\
	strb r1, [r0]\n\
	b _08007B54\n\
	.align 2, 0\n\
_08007AA8: .4byte u8_array_3002B70\n\
_08007AAC:\n\
	bl sub_8007E24\n\
	b _08007B54\n\
_08007AB2:\n\
	lsls r0, r7, 24\n\
	lsrs r0, 24\n\
	mov r4, r10\n\
	adds r1, r3, r4\n\
	ldrh r1, [r1]\n\
	bl sub_80516C4\n\
	b _08007B54\n\
_08007AC2:\n\
	ldr r4, _08007ADC @ =0x03002970\n\
	ldrb r0, [r4]\n\
	cmp r0, 0x1\n\
	bne _08007AE4\n\
	movs r0, 0x2\n\
	strb r0, [r4]\n\
	ldr r1, _08007AE0 @ =deUnkValue1\n\
	mov r5, r10\n\
	adds r0, r3, r5\n\
	ldrh r0, [r0]\n\
	strb r0, [r1]\n\
	b _08007B54\n\
	.align 2, 0\n\
_08007ADC: .4byte 0x03002970\n\
_08007AE0: .4byte deUnkValue1\n\
_08007AE4:\n\
	subs r0, 0x2\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, 0x1\n\
	bhi _08007B26\n\
	mov r6, r10\n\
	adds r0, r3, r6\n\
	ldrh r0, [r0]\n\
	lsls r0, 3\n\
	ldr r2, _08007B14 @ =0x081f4548\n\
	adds r1, r0, r2\n\
	ldr r1, [r1]\n\
	ldr r3, _08007B18 @ =0x081f454c\n\
	adds r0, r3\n\
	ldrh r2, [r0]\n\
	movs r0, 0\n\
	bl SendBlock\n\
	ldrb r0, [r4]\n\
	cmp r0, 0x2\n\
	bne _08007B1C\n\
	movs r0, 0x1\n\
	strb r0, [r4]\n\
	b _08007B54\n\
	.align 2, 0\n\
_08007B14: .4byte 0x081f4548\n\
_08007B18: .4byte 0x081f454c\n\
_08007B1C:\n\
	movs r5, 0\n\
	strb r5, [r4]\n\
	adds r6, r7, 0x1\n\
	str r6, [sp]\n\
	b _08007B54\n\
_08007B26:\n\
	mov r1, r10\n\
	adds r0, r3, r1\n\
	ldrh r0, [r0]\n\
	lsls r0, 3\n\
	ldr r2, _08007B44 @ =0x081f4548\n\
	adds r1, r0, r2\n\
	ldr r1, [r1]\n\
	ldr r3, _08007B48 @ =0x081f454c\n\
	adds r0, r3\n\
	ldrh r2, [r0]\n\
	movs r0, 0\n\
	bl SendBlock\n\
	b _08007B54\n\
	.align 2, 0\n\
_08007B44: .4byte 0x081f4548\n\
_08007B48: .4byte 0x081f454c\n\
_08007B4C:\n\
	mov r4, r10\n\
	adds r0, r3, r4\n\
	ldrh r0, [r0]\n\
	strh r0, [r2]\n\
_08007B54:\n\
	ldr r5, [sp]\n\
	lsls r0, r5, 16\n\
	lsrs r7, r0, 16\n\
	cmp r7, 0x3\n\
	bhi _08007B60\n\
	b _08007824\n\
_08007B60:\n\
	add sp, 0x4\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
    .syntax divided\n");
}
#endif

static void BuildSendCmd(u16 code)
{
    switch (code)
    {
    case 0x2222:
        gSendCmd[0] = 0x2222;
        gSendCmd[1] = gLinkType;
        break;
    case 0x2FFE:
        gSendCmd[0] = 0x2FFE;
        break;
    case 0x4444:
        gSendCmd[0] = 0x4444;
        gSendCmd[1] = gMain.heldKeys;
        break;
    case 0x5555:
        gSendCmd[0] = 0x5555;
        break;
    case 0x5566:
        gSendCmd[0] = 0x5566;
        break;
    case 0x6666:
        gSendCmd[0] = 0x6666;
        gSendCmd[1] = 0;
        break;
    case 0x7777:
    {
        u8 i;

        gSendCmd[0] = 0x7777;

        for (i = 0; i < 5; i++)
            gSendCmd[i + 1] = 0xEE;

        break;
    }
    case 0xBBBB:
        gSendCmd[0] = 0xBBBB;
        gSendCmd[1] = sBlockSend.size;
        gSendCmd[2] = sBlockSend.multiplayerId + 128;
        break;
    case 0xAAAA:
        gSendCmd[0] = 0xAAAA;
        break;
    case 0xAAAB:
        gSendCmd[0] = 0xAAAB;
        gSendCmd[1] = gScriptItemId;
        break;
    case 0xCCCC:
        gSendCmd[0] = 0xCCCC;
        gSendCmd[1] = gBlockRequestType;
        break;
    case 0x5FFF:
        gSendCmd[0] = 0x5FFF;
        break;
    case 0xCAFE:
        if (!word_3004858 || gUnknown_3001764)
            break;
        gSendCmd[0] = 0xCAFE;
        gSendCmd[1] = word_3004858;
        break;
    }
}

void sub_8007B14(void)
{
    gLinkCallback = sub_8007B44;
}

bool32 sub_8007B24(void)
{
    if (gLinkCallback == sub_8007B44)
        return TRUE;
    else
        return FALSE;
}

static void sub_8007B44(void)
{
    if (gReceivedRemoteLinkPlayers == TRUE)
        BuildSendCmd(0xCAFE);
}

void ClearLinkCallback(void)
{
    gLinkCallback = NULL;
}

void ClearLinkCallback_2(void)
{
    gLinkCallback = NULL;
}

u8 GetLinkPlayerCount(void)
{
    return EXTRACT_PLAYER_COUNT(gLinkStatus);
}

void OpenLinkTimed(void)
{
    sPlayerDataExchangeStatus = EXCHANGE_NOT_STARTED;
    gLinkTimeOutCounter = 0;
	ResetBlockSend();
    OpenLink();
}

u8 GetLinkPlayerDataExchangeStatusTimed(void)
{
    s32 i;
    s32 count = 0;
    u32 index;

    if (gReceivedRemoteLinkPlayers == TRUE)
    {
        if (GetLinkPlayerCount() == 0)
        {
            gLinkErrorOccurred = TRUE;
            CloseLink();
        }

        i = 0;
        index = 0;

        while (i < GetLinkPlayerCount())
        {
            if (gLinkPlayers[index].linkType == gLinkPlayers[0].linkType)
                ++count;
            ++index;
            ++i;
        }

        if (count == GetLinkPlayerCount())
            sPlayerDataExchangeStatus = EXCHANGE_COMPLETE;
        else
            sPlayerDataExchangeStatus = EXCHANGE_IN_PROGRESS;
    }
    else
    {
        gLinkTimeOutCounter++;
        if (gLinkTimeOutCounter > 600)
            sPlayerDataExchangeStatus = EXCHANGE_TIMED_OUT;
    }

    return sPlayerDataExchangeStatus;
}

bool8 IsLinkPlayerDataExchangeComplete(void)
{
    u8 i;
    u8 count = 0;
    u8 isComplete;

    for (i = 0; i < GetLinkPlayerCount(); i++)
        if (gLinkPlayers[i].linkType == gLinkPlayers[0].linkType)
            count++;

    if (count == GetLinkPlayerCount())
    {
        isComplete = TRUE;
        sPlayerDataExchangeStatus = EXCHANGE_COMPLETE;
    }
    else
    {
        isComplete = FALSE;
        sPlayerDataExchangeStatus = EXCHANGE_IN_PROGRESS;
    }

    return isComplete;
}

u32 GetLinkPlayerTrainerId(u8 multiplayerId)
{
    return gLinkPlayers[multiplayerId].trainerId;
}

void ResetLinkPlayers(void)
{
    s32 i;
    for (i = 0; i < 4; i++)
        memset(&gLinkPlayers[i], 0, sizeof(struct LinkPlayer));
}

static void ResetBlockSend(void)
{
    sBlockSend.active = FALSE;
    sBlockSend.pos = 0;
    sBlockSend.size = 0;
    sBlockSend.src = NULL;
}

static bool8 InitBlockSend(void *data, u32 size)
{
    if (sBlockSend.active)
    {
        return FALSE;
    }
    else
    {
        sBlockSend.multiplayerId = GetMultiplayerId();
        sBlockSend.active = TRUE;
        sBlockSend.size = size;
        sBlockSend.pos = 0;

        if (size > BLOCK_BUFFER_SIZE)
        {
            sBlockSend.src = data;
        }
        else
        {
            if (data != gBlockSendBuffer)
                memcpy(gBlockSendBuffer, data, size);
            sBlockSend.src = gBlockSendBuffer;
        }

        BuildSendCmd(0xBBBB);
        gLinkCallback = LinkCB_BlockSendBegin;
        sBlockSendDelayCounter = 0;
        return TRUE;
    }
}

static void LinkCB_BlockSendBegin(void)
{
    sBlockSendDelayCounter++;
    if (sBlockSendDelayCounter > 2)
        gLinkCallback = LinkCB_BlockSend;
}

static void LinkCB_BlockSend(void)
{
    s32 i;
    u8 *buffer = sBlockSend.src;

    gSendCmd[0] = 0x8888;

    for (i = 0; i < CMD_LENGTH - 1; i++)
    {
        s32 offset = sBlockSend.pos + 2 * i;
        gSendCmd[i + 1] = (buffer[offset + 1] << 8) | buffer[offset];
    }

    sBlockSend.pos += (CMD_LENGTH - 1) * 2;

    if (sBlockSend.size <= sBlockSend.pos)
    {
        sBlockSend.active = FALSE;
        gLinkCallback = LinkCB_BlockSendEnd;
    }
}

static void LinkCB_BlockSendEnd(void)
{
    gLinkCallback = NULL;
}

static void sub_8007E04(void)
{
    GetMultiplayerId(); // whats the point of calling this if you dont use the multiplayer ID?
    BuildSendCmd(0x4444);
    dword_20238BC++;
}

void sub_8007E24(void)
{
    dword_20238BC = 0;
    gLinkCallback = sub_8007E04;
}

u32 sub_8007E40(void)
{
    return dword_20238BC;
}

void sub_8007E4C(void)
{
    BuildSendCmd(0xAAAA);
}

u8 GetMultiplayerId(void)
{
    return SIO_MULTI_CNT->id;
}

u8 bitmask_all_link_players_but_self(void)
{
    return ((1 << GetMultiplayerId()) ^ 0xF);
}

bool8 SendBlock(u8 a1, void *a2, u16 a3)
{
    return InitBlockSend(a2, a3);
}

bool8 sub_8007E9C(u8 a1)
{
    if (!gLinkCallback)
    {
        gBlockRequestType = a1;
        BuildSendCmd(0xCCCC);
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

bool8 sub_8007ECC(void)
{
    u8 retVal = FALSE;

    if (!gLinkCallback)
        retVal = TRUE;

    return retVal;
}

u8 GetBlockReceivedStatus(void)
{
    return (gBlockReceived[3] << 3)
         | (gBlockReceived[2] << 2)
         | (gBlockReceived[1] << 1)
         | gBlockReceived[0];
}

void SetBlockReceivedFlag(u8 multiplayerId)
{
    gBlockReceived[multiplayerId] = TRUE;
}

void ResetBlockReceivedFlags(void)
{
    s32 i;
    for (i = 0; i < 4; i++)
        gBlockReceived[i] = FALSE;
}

void ResetBlockReceivedFlag(u8 multiplayerId)
{
    if (gBlockReceived[multiplayerId])
        gBlockReceived[multiplayerId] = FALSE;
}

void sub_8007F4C(void)
{
    if ((gLinkStatus & LINK_STAT_MASTER) && EXTRACT_PLAYER_COUNT(gLinkStatus) > 1)
        gShouldAdvanceLinkState = 1;
}

static u16 LinkTestCalcBlockChecksum(void *data, u16 size)
{
    u16 sum = 0;
    u16 i;

    for (i = 0; i < size / 2; i++)
        sum += ((u16 *)data)[i];

    return sum;
}

static void PrintHexDigit(u8 tileNum, u8 x, u8 y)
{
    u16 *tilemap = (u16 *)BG_SCREEN_ADDR(gLinkTestBGInfo.screenBaseBlock);
    tilemap[(32 * y) + x] = (gLinkTestBGInfo.paletteNum << 12) | (tileNum + 1);
}

static void PrintHex(u32 num, u8 x, u8 y, u8 maxDigits)
{
    u8 buffer[16];
    s32 i;

    for (i = 0; i < maxDigits; i++)
    {
        buffer[i] = num & 0xF;
        num >>= 4;
    }

    for (i = maxDigits - 1; i >= 0; i--)
    {
        PrintHexDigit(buffer[i], x, y);
        x++;
    }
}

static void LinkCB_RequestPlayerDataExchange(void)
{
    // Only one request needs to be sent, so only the master sends it.
    if (gLinkStatus & LINK_STAT_MASTER)
        BuildSendCmd(0x2222);
    gLinkCallback = NULL;
}

void Task_PrintTestData(u8 taskId)
{
    s32 i;

    PrintHex(gShouldAdvanceLinkState, 2, 1, 2);
    PrintHex(gLinkStatus, 15, 1, 8);
    PrintHex(gLink.state, 2, 10, 2);
    PrintHex(EXTRACT_PLAYER_COUNT(gLinkStatus), 15, 10, 2);
    PrintHex(GetMultiplayerId(), 15, 12, 2);
    PrintHex(gLastSendQueueCount, 25, 1, 2);
    PrintHex(gLastRecvQueueCount, 25, 2, 2);
    PrintHex(GetBlockReceivedStatus(), 15, 5, 2);
    PrintHex(gLinkDebugValue1, 2, 12, 8);
    PrintHex(gLinkDebugValue2, 2, 13, 8);
    PrintHex(GetSioMultiSI(), 25, 5, 1);
    PrintHex(IsSioMultiMaster(), 25, 6, 1);
    PrintHex(IsLinkConnectionEstablished(), 25, 7, 1);
    PrintHex(HasLinkErrorOccurred(), 25, 8, 1);

    for (i = 0; i < MAX_LINK_PLAYERS; i++)
        PrintHex(gLinkTestBlockChecksums[i], 10, 4 + i, 4);
}

void SetLinkDebugValues(u32 value1, u32 value2)
{
    gLinkDebugValue1 = value1;
    gLinkDebugValue2 = value2;
}

u8 sub_8008198(void)
{
    u8 result = 0;
    s32 i;

    for (i = 0; i < gSavedLinkPlayerCount; i++)
        result |= (1 << i);

    return result;
}

void sub_80081C8(u8 playerCount)
{
    s32 i;

    gSavedLinkPlayerCount = playerCount;
    gSavedMultiplayerId = GetMultiplayerId();

    for (i = 0; i < 4; i++)
        gSavedLinkPlayers[i] = gLinkPlayers[i];
}

u8 sub_800820C(void)
{
    return gSavedLinkPlayerCount;
}

u8 sub_8008218(void)
{
    return gSavedMultiplayerId;
}

bool8 sub_8008224(void)
{
    s32 count = 0;
    s32 i;

    for (i = 0; i < gSavedLinkPlayerCount; i++)
        if (gLinkPlayers[i].trainerId == gSavedLinkPlayers[i].trainerId)
            count++;

    if (count == gSavedLinkPlayerCount)
        return TRUE;
    else
        return FALSE;
}

void sub_800826C(void)
{
    u8 i;

    for (i = 0; i < gSavedLinkPlayerCount; i++)
    {
        if (gSavedLinkPlayers[i].trainerId != gLinkPlayers[i].trainerId
         || StringCompareWithoutExtCtrlCodes(gSavedLinkPlayers[i].name, gLinkPlayers[i].name))
        {
            gLinkErrorOccurred = TRUE;
            CloseLink();
            SetMainCallback2(CB2_LinkError);
        }
    }
}

void sub_80082EC(void)
{
    gSavedLinkPlayerCount = 0;
    gSavedMultiplayerId = 0;
}

u8 GetLinkPlayerCount_2(void)
{
    return EXTRACT_PLAYER_COUNT(gLinkStatus);
}

bool8 IsLinkMaster(void)
{
    return EXTRACT_MASTER(gLinkStatus);
}

u8 GetDummy2(void)
{
    return sDummy2;
}

void sub_800832C(void)
{
    if (!gLinkCallback)
    {
        gLinkCallback = sub_8008350;
        gLinkDummyBool = FALSE;
    }
}

static void sub_8008350(void)
{
    if (gLastRecvQueueCount == 0)
    {
        BuildSendCmd(0x5FFF);
        gLinkCallback = sub_800837C;
    }
}

static void sub_800837C(void)
{
    s32 i;
    s32 totalCount = GetLinkPlayerCount();
    s32 count = 0;

    for (i = 0; i < totalCount; i++)
        if (u8_array_3002B78[i])
            count++;

    if (count == totalCount)
    {
        gBattleTypeFlags &= ~BATTLE_TYPE_20;
        gLinkVSyncDisabled = TRUE;
        CloseLink();
        gLinkCallback = NULL;
        gLinkDummyBool = TRUE;
    }
}

static void sub_80083E0(void)
{
    s32 i;
    s32 totalCount = GetLinkPlayerCount();
    s32 count = 0;

    for (i = 0; i < totalCount; i++)
    {
        if (gLinkPlayers[i].language == 1)
            count++;
        else if (u8_array_3002B78[i])
            count++;
    }

    if (count == totalCount)
    {
        gBattleTypeFlags &= ~BATTLE_TYPE_20;
        gLinkVSyncDisabled = TRUE;
        CloseLink();
        gLinkCallback = 0;
        gLinkDummyBool = TRUE;
    }
}

static void sub_8008454(void)
{
    if (gLastRecvQueueCount == 0)
    {
        BuildSendCmd(0x5FFF);
        gLinkCallback = sub_80083E0;
    }
}

void sub_8008480(void)
{
    if (!gLinkCallback)
    {
        gLinkCallback = sub_8008454;
        gLinkDummyBool = FALSE;
    }
}

void sub_80084A4(void)
{
    if (!gLinkCallback)
        gLinkCallback = sub_80084C8;
    gLinkDummyBool = FALSE;
}

static void sub_80084C8(void)
{
    if (gLastRecvQueueCount == 0)
    {
        BuildSendCmd(0x2FFE);
        gLinkCallback = sub_80084F4;
    }
}

static void sub_80084F4(void)
{
    u8 totalCount = GetLinkPlayerCount();
    u8 count = 0;

    while (count < totalCount && u8_array_3002B70[count])
        count++;

    if (count == totalCount)
    {
        u8 i;
        for (i = 0; i < 4; i++)
            u8_array_3002B70[i] = 0;
        gLinkCallback = NULL;
    }
}

static void CheckErrorStatus(void)
{
    if (gLinkOpen)
    {
        if (gLinkStatus & LINK_STAT_ERRORS)
        {
            if (!gSuppressLinkErrorMessage)
            {
                sErrorLinkStatus = gLinkStatus;
                sErrorLastRecvQueueCount = gLastRecvQueueCount;
                sErrorLastSendQueueCount = gLastSendQueueCount;
                SetMainCallback2(CB2_LinkError);
            }
            gLinkErrorOccurred = TRUE;
            CloseLink();
        }
    }
}

void CB2_LinkError(void)
{
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetPaletteFadeControl();
    FillPalette(0, 0, 2);
    ResetTasks();
    SetVBlankCallback(VBlankCB_LinkTest);
    SetUpWindowConfig(&gWindowConfig_81E7198);
    InitMenuWindow((struct WindowConfig *)&gWindowConfig_81E7198);
    MenuZeroFillScreen();
    REG_BLDALPHA = 0;
    REG_BG0VOFS = 0;
    REG_BG0HOFS = 0;
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON;
    gSoftResetDisabled = FALSE;
    CreateTask(Task_DestroySelf, 0);
    StopMapMusic();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    SetMainCallback2(CB2_PrintErrorMessage);
}

static void CB2_PrintErrorMessage(void)
{
    u8 array[64] __attribute__((unused)); // unused

    switch (gMain.state)
    {
    case 0:
        MenuPrint_PixelCoords(gMultiText_LinkError, 20, 56, 1);
        break;
    case 30:
    case 60:
        PlaySE(SE_BOO);
        break;
    case 90:
        PlaySE(SE_BOO);
        break;
    }

    if (gMain.state != 200)
        gMain.state++;
}

u8 GetSioMultiSI(void)
{
    return (REG_SIOCNT >> SIO_MULTI_SI_SHIFT) & SIO_MULTI_SI_MASK;
}

static bool8 IsSioMultiMaster(void)
{
    bool8 isMaster = FALSE;

    if ((REG_SIOCNT & SIO_MULTI_SD) && !(REG_SIOCNT & SIO_MULTI_SI))
        isMaster = TRUE;

    return isMaster;
}

bool8 IsLinkConnectionEstablished(void)
{
    return EXTRACT_CONN_ESTABLISHED(gLinkStatus);
}

void SetSuppressLinkErrorMessage(bool8 value)
{
    gSuppressLinkErrorMessage = value;
}

bool8 HasLinkErrorOccurred(void)
{
    return gLinkErrorOccurred;
}

static void DisableSerial(void)
{
    gLinkSavedIme = REG_IME;
    REG_IME = 0;
    REG_IE &= ~(INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL);
    REG_IME = gLinkSavedIme;

    REG_SIOCNT = 0;
    REG_TM3CNT_H = 0;
    REG_IF = INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL;

    CpuFill32(0, &gLink, sizeof(gLink));
}

static void EnableSerial(void)
{
    gLinkSavedIme = REG_IME;
    REG_IME = 0;
    REG_IE &= ~(INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL);
    REG_IME = gLinkSavedIme;

    REG_RCNT = 0;

    REG_SIOCNT = SIO_MULTI_MODE;
    REG_SIOCNT |= SIO_INTR_ENABLE | SIO_115200_BPS;

    gLinkSavedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_SERIAL;
    REG_IME = gLinkSavedIme;

    REG_SIOMLT_SEND = 0;

    CpuFill32(0, &gLink, sizeof(gLink));

    sNumVBlanksWithoutSerialIntr = 0;
    sSendNonzeroCheck = 0;
    sRecvNonzeroCheck = 0;
    sChecksumAvailable = FALSE;
    sHandshakePlayerCount = 0;
    gLastSendQueueCount = 0;
    gLastRecvQueueCount = 0;
}

void ResetSerial(void)
{
    EnableSerial();
    DisableSerial();
}

u32 LinkMain1(u8 *shouldAdvanceLinkState, u16 *sendCmd, u16 recvCmds[CMD_LENGTH][MAX_LINK_PLAYERS])
{
    u32 retVal;
    u32 retVal2;

    switch (gLink.state)
    {
    case LINK_STATE_START0:
        DisableSerial();
        gLink.state = LINK_STATE_START1;
        break;
    case LINK_STATE_START1:
        if (*shouldAdvanceLinkState == 1)
        {
            EnableSerial();
            gLink.state = LINK_STATE_HANDSHAKE;
        }
        break;
    case LINK_STATE_HANDSHAKE:
        switch (*shouldAdvanceLinkState)
        {
        case 1:
            if (gLink.isMaster == 8 && gLink.playerCount > 1)
                gLink.handshakeAsMaster = TRUE;
            break;
        case 2:
            gLink.state = LINK_STATE_START0;
            REG_SIOMLT_SEND = 0;
            break;
        default:
            CheckMasterOrSlave();
            break;
        }
        break;
    case LINK_STATE_INIT_TIMER:
        InitTimer();
        gLink.state = LINK_STATE_CONN_ESTABLISHED;
    case LINK_STATE_CONN_ESTABLISHED:
        EnqueueSendCmd(sendCmd);
        DequeueRecvCmds(recvCmds);
        break;
    }

    *shouldAdvanceLinkState = 0;

    retVal = gLink.localId;
    retVal |= (gLink.playerCount << 2);

    if (gLink.isMaster == 8)
        retVal |= 0x20;

    {
        u32 receivedNothing = gLink.receivedNothing << 8;
        u32 link_field_F = gLink.link_field_F << 9;
        u32 hardwareError = gLink.hardwareError << 12;
        u32 badChecksum = gLink.badChecksum << 13;
        u32 queueFull = gLink.queueFull << 14;
        u32 val;

        if (gLink.state == LINK_STATE_CONN_ESTABLISHED)
        {
            val = 0x40;
            val |= receivedNothing;
            val |= retVal;
            val |= link_field_F;
            val |= hardwareError;
            val |= badChecksum;
            val |= queueFull;
        }
        else
        {
            val = retVal;
            val |= receivedNothing;
            val |= link_field_F;
            val |= hardwareError;
            val |= badChecksum;
            val |= queueFull;
        }

        retVal = val;
    }

    if (gLink.lag == LAG_MASTER)
        retVal |= 0x10000;

    if (gLink.localId > 3)
        retVal |= 0x20000;

    retVal2 = retVal;
    if (gLink.lag == LAG_SLAVE)
        retVal2 |= 0x40000;

    return retVal2;
}

static void CheckMasterOrSlave(void)
{
    u32 terminals = *(u32 *)REG_ADDR_SIOCNT & (SIO_MULTI_SD | SIO_MULTI_SI);

    if (terminals == SIO_MULTI_SD && !gLink.localId)
        gLink.isMaster = 8;
    else
        gLink.isMaster = 0;
}

static void InitTimer(void)
{
    if (gLink.isMaster)
    {
        REG_TM3CNT_L = 65339;
        REG_TM3CNT_H = TIMER_INTR_ENABLE | TIMER_64CLK;

        gLinkSavedIme = REG_IME;
        REG_IME = 0;
        REG_IE |= INTR_FLAG_TIMER3;
        REG_IME = gLinkSavedIme;
    }
}

static void EnqueueSendCmd(u16 *sendCmd)
{
    gLinkSavedIme = REG_IME;
    REG_IME = 0;

    if (gLink.sendQueue.count < QUEUE_CAPACITY)
    {
        u8 i;
        u8 offset = gLink.sendQueue.pos + gLink.sendQueue.count;

        if (offset >= QUEUE_CAPACITY)
            offset -= QUEUE_CAPACITY;

        for (i = 0; i < CMD_LENGTH; i++)
        {
            sSendNonzeroCheck |= *sendCmd;
            gLink.sendQueue.data[i][offset] = *sendCmd;
            *sendCmd = 0;
            sendCmd++;
        }
    }
    else
    {
        gLink.queueFull = QUEUE_FULL_SEND;
    }

    if (sSendNonzeroCheck)
    {
        gLink.sendQueue.count++;
        sSendNonzeroCheck = 0;
    }

    REG_IME = gLinkSavedIme;
    gLastSendQueueCount = gLink.sendQueue.count;
}

void DequeueRecvCmds(u16 recvCmds[CMD_LENGTH][MAX_LINK_PLAYERS])
{
    u8 i;
    u8 j;

    gLinkSavedIme = REG_IME;
    REG_IME = 0;

    if (gLink.recvQueue.count == 0)
    {
        for (i = 0; i < CMD_LENGTH; i++)
            for (j = 0; j < gLink.playerCount; j++)
                recvCmds[i][j] = 0;

        gLink.receivedNothing = TRUE;
    }
    else
    {
        for (i = 0; i < CMD_LENGTH; i++)
            for (j = 0; j < gLink.playerCount; j++)
                recvCmds[i][j] = gLink.recvQueue.data[j][i][gLink.recvQueue.pos];

        gLink.recvQueue.count--;
        gLink.recvQueue.pos++;

        if (gLink.recvQueue.pos >= QUEUE_CAPACITY)
            gLink.recvQueue.pos = 0;

        gLink.receivedNothing = FALSE;
    }

    REG_IME = gLinkSavedIme;
}

void LinkVSync(void)
{
    if (gLink.isMaster)
    {
        switch (gLink.state)
        {
        case LINK_STATE_HANDSHAKE:
            StartTransfer();
            break;
        case LINK_STATE_CONN_ESTABLISHED:
            if (gLink.serialIntrCounter > 8)
            {
                if (gLink.lag == LAG_MASTER)
                    return;
                gLink.serialIntrCounter = 0;
            }
            else if (gLink.hardwareError != TRUE)
            {
                gLink.lag = LAG_MASTER;
                return;
            }
            StartTransfer();
            break;
        }
    }
    else if (gLink.state == LINK_STATE_CONN_ESTABLISHED
          || gLink.state == LINK_STATE_HANDSHAKE)
    {
        sNumVBlanksWithoutSerialIntr++;

        if (sNumVBlanksWithoutSerialIntr > 10)
        {
            if (gLink.state == LINK_STATE_CONN_ESTABLISHED)
                gLink.lag = LAG_SLAVE;

            if (gLink.state == LINK_STATE_HANDSHAKE)
            {
                gLink.playerCount = 0;
                gLink.link_field_F = 0;
            }
        }
    }
}

void Timer3Intr(void)
{
    StopTimer();
    StartTransfer();
}

void SerialCB(void)
{
    gLink.localId = SIO_MULTI_CNT->id;

    switch (gLink.state)
    {
    case LINK_STATE_CONN_ESTABLISHED:
        gLink.hardwareError = SIO_MULTI_CNT->error;
        DoRecv();
        DoSend();
        SendRecvDone();
        break;
    case LINK_STATE_HANDSHAKE:
        if (DoHandshake())
        {
            if (gLink.isMaster)
            {
                gLink.state = LINK_STATE_INIT_TIMER;
                gLink.serialIntrCounter = 8;
            }
            else
            {
                gLink.state = LINK_STATE_CONN_ESTABLISHED;
            }
        }
        break;
    }

    gLink.serialIntrCounter++;
    sNumVBlanksWithoutSerialIntr = 0;

    if (gLink.serialIntrCounter == 8)
        gLastRecvQueueCount = gLink.recvQueue.count;
}

static void StartTransfer(void)
{
    REG_SIOCNT |= SIO_START;
}

static bool8 DoHandshake(void)
{
    u8 i;
    u8 playerCount = 0;
    u16 minRecv = 0xFFFF;

    if (gLink.handshakeAsMaster == TRUE)
        REG_SIOMLT_SEND = MASTER_HANDSHAKE;
    else
        REG_SIOMLT_SEND = SLAVE_HANDSHAKE;

    *(u64 *)&gLink.tempRecvBuffer[0] = REG_SIOMLT_RECV;
    REG_SIOMLT_RECV = 0;

    gLink.handshakeAsMaster = FALSE;

    for (i = 0; i < 4; i++)
    {
        if ((gLink.tempRecvBuffer[i] & ~0x3) == SLAVE_HANDSHAKE
         || gLink.tempRecvBuffer[i] == MASTER_HANDSHAKE)
        {
            playerCount++;

            if (minRecv > gLink.tempRecvBuffer[i] && gLink.tempRecvBuffer[i] != 0)
                minRecv = gLink.tempRecvBuffer[i];
        }
        else
        {
            if (gLink.tempRecvBuffer[i] != 0xFFFF)
                playerCount = 0;
            break;
        }
    }

    gLink.playerCount = playerCount;

    // The handshake is successful when:
    // 1. There are multiple players.
    // 2. The number of players agrees with the last attempt.
    // 3. Player no. 0 is identifying as the master.
    if (gLink.playerCount > 1
     && gLink.playerCount == sHandshakePlayerCount
     && gLink.tempRecvBuffer[0] == MASTER_HANDSHAKE)
        return TRUE;

    if (gLink.playerCount > 1)
        gLink.link_field_F = (minRecv & 3) + 1;
    else
        gLink.link_field_F = 0;

    sHandshakePlayerCount = gLink.playerCount;

    return FALSE;
}

static void DoRecv(void)
{
    u16 recvBuffer[4];
    u8 i;

    *(u64 *)&recvBuffer[0] = REG_SIOMLT_RECV;

    if (gLink.sendCmdIndex == 0)
    {
        for (i = 0; i < gLink.playerCount; i++)
            if (gLink.checksum != recvBuffer[i] && sChecksumAvailable)
                    gLink.badChecksum = TRUE;

        gLink.checksum = 0;
        sChecksumAvailable = TRUE;
    }
    else
    {
        u8 index = gLink.recvQueue.pos + gLink.recvQueue.count;

        if (index >= QUEUE_CAPACITY)
            index -= QUEUE_CAPACITY;

        if (gLink.recvQueue.count < QUEUE_CAPACITY)
        {
            for (i = 0; i < gLink.playerCount; i++)
            {
                gLink.checksum += recvBuffer[i];
                sRecvNonzeroCheck |= recvBuffer[i];
                gLink.recvQueue.data[i][gLink.recvCmdIndex][index] = recvBuffer[i];
            }
        }
        else
        {
            gLink.queueFull = QUEUE_FULL_RECV;
        }

        gLink.recvCmdIndex++;

        if (gLink.recvCmdIndex == CMD_LENGTH && sRecvNonzeroCheck)
        {
            gLink.recvQueue.count++;
            sRecvNonzeroCheck = 0;
        }
    }
}

static void DoSend(void)
{
    if (gLink.sendCmdIndex == CMD_LENGTH)
    {
        REG_SIOMLT_SEND = gLink.checksum;

        if (!sSendBufferEmpty)
        {
            gLink.sendQueue.count--;
            gLink.sendQueue.pos++;

            if (gLink.sendQueue.pos >= QUEUE_CAPACITY)
                gLink.sendQueue.pos = 0;
        }
        else
        {
            sSendBufferEmpty = FALSE;
        }
    }
    else
    {
        if (!sSendBufferEmpty && gLink.sendQueue.count == 0)
            sSendBufferEmpty = TRUE;

        if (sSendBufferEmpty)
            REG_SIOMLT_SEND = 0;
        else
            REG_SIOMLT_SEND = gLink.sendQueue.data[gLink.sendCmdIndex][gLink.sendQueue.pos];

        gLink.sendCmdIndex++;
    }
}

static void StopTimer(void)
{
    if (gLink.isMaster)
    {
        REG_TM3CNT_H &= ~TIMER_ENABLE;
        REG_TM3CNT_L = 65339;
    }
}

static void SendRecvDone(void)
{
    if (gLink.recvCmdIndex == CMD_LENGTH)
    {
        gLink.sendCmdIndex = 0;
        gLink.recvCmdIndex = 0;
    }
    else if (gLink.isMaster)
    {
        REG_TM3CNT_H |= TIMER_ENABLE;
    }
}

void ResetSendBuffer(void)
{
    u8 i;
    u8 j;

    gLink.sendQueue.count = 0;
    gLink.sendQueue.pos = 0;

    for (i = 0; i < CMD_LENGTH; i++)
        for (j = 0; j < QUEUE_CAPACITY; j++)
            gLink.sendQueue.data[i][j] = 0xEFFF;
}

void ResetRecvBuffer(void)
{
    u8 i;
    u8 j;
    u8 k;

    gLink.recvQueue.count = 0;
    gLink.recvQueue.pos = 0;

    for (i = 0; i < 4; i++)
        for (j = 0; j < CMD_LENGTH; j++)
            for (k = 0; k < QUEUE_CAPACITY; k++)
                gLink.recvQueue.data[i][j][k] = 0xEFFF;
}
