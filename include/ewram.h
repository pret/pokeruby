#ifndef GUARD_EWRAM_H
#define GUARD_EWRAM_H

extern u8 gSharedMem[];
#define ewram_addr EWRAM // used in gSharedMem addr hacks

// Note: we have duplicate ewram labels because its clear some memory
// regions overlap others but have different definitions. Until some
// dupes can be determined to be the same, they will be deliberate
// seperated.
#define gDecompressionBuffer            (gSharedMem + 0x1E000)

// battle_interface.c
#define eBattleInterfaceGfxBuffer       ((u8 *)EWRAM)

// region_map.c, field_region_map.c
#define eRegionMapState                 (*(struct RegionMapState *)gSharedMem)

// field_weather.c
#define eDroughtPaletteData             (*(struct WeatherPaletteData *)gSharedMem)

// battle etc.
// This overlaps with so many things it's not even funny
// The actual data starts at 0x02016000
#define gBattleStruct                   ((struct BattleStruct *)     (gSharedMem + 0x0))
#define namingScreenData                (*(struct NamingScreenData *)(gSharedMem + 0x0))
#define ewramBerryPic                   (gSharedMem + 0x0)
#define eMatsudaDebugVar                (gSharedMem[0x0])
#define eSaveSection                    (struct SaveSector *)(gSharedMem + 0x0)
#define eSlotMachine                    ((struct SlotMachineEwramStruct *)(gSharedMem + 0x0))
#define ePokemonStorageSystem           (*(struct PokemonStorageSystemData *)(gSharedMem + 0))
#define ePartyMenu                      (*(struct Unk2001000 *)(gSharedMem + 0x1000))
#define ewramBerryPicTemp               (gSharedMem + 0x1000)
#define gUnknown_02007000               (*(ewramStruct_02007000 *)(gSharedMem + 0x7000))

// record_mixing.c
#define eLinkedDewfordTrendsBuffer      ((struct EasyChatPair *)(gSharedMem + 0x7800))
#define eSavedDewfordTrendsBuffer       ((struct EasyChatPair *)(gSharedMem + 0x7900))
#define eReceivedRecords                (*(struct PlayerRecords *)(gSharedMem + 0x08000))
#define eSentRecord                     (*(struct PlayerRecords *)(gSharedMem + 0x18000))

// pokedex.c
#define ePokedexGraphicsBuffer          ((void *)&gSharedMem[0x8000])
#define ePokedexView1                   (struct PokedexView *)(gSharedMem + 0x18000)
#define ePokedexView2                   (struct PokedexView *)(gSharedMem + 0x18800)
#define ePokedexView3                   (struct PokedexView *)(gSharedMem + 0x19000)
#define ePokedexView4                   (struct PokedexView *)(gSharedMem + 0x19800)

// pokedex_cry_screen.c
#define sCryWaveformWindowTiledata      (&gSharedMem[0])
#define ePokedexCryScreen               (*(struct PokedexCryScreen *)(gSharedMem + 0x1C000))
#define ePokedexCryScreen2              (*(struct PokedexCryMeterNeedle *)(gSharedMem + 0x1C800))

#define ewram9000_hack                  (void *)(ewram_addr + 0x9000) // TODO: Fix this.
#define TRANSITION_STRUCT               (*(struct TransitionData *)   (gSharedMem + 0xC000))
#define ewramC03C                       (&gSharedMem[0xC03C])
#define ewram_2010000                   (*(struct TradeEwramStruct *)(gSharedMem + 0x10000))
#define ewram10000                      (&gSharedMem[0x10000])
#define eSlotMachineGfxBuffer                    (void *)(gSharedMem + 0x10000) // slot machine
#define ewram11000                      (&gSharedMem[0x11000])
#define ewram13000                      (&gSharedMem[0x13000])
#define eSlotMachineReelTimeGfxBuffer                      (&gSharedMem[0x13200])
#define EWRAM_14000                     ((u8 *)(gSharedMem + 0x14000))
#define ewram14000arr(i, data)          (gSharedMem[0x14000 + i + data])
#define ewram14004arr(i, data)          (gSharedMem[0x14004 + i + data])
#define ewram14008arr(i, data)          (gSharedMem[0x14008 + data + i])
#define EWRAM_14800                     ((u16 *)(gSharedMem + 0x14800))
#define sEvoInfo                        ((*(struct EvoInfo*)(gSharedMem + 0x14800)))
#define EWRAM_15000                     ((u8 *)(gSharedMem + 0x15000))
#define ewram15000arr(i, data)          (gSharedMem[0x15000 + data + i])

// Contest
#define eUnzippedContestAudience_Gfx    (&gSharedMem[0x15800]) // overlaps other contest vars
#define eCurContestWinnerSaveIdx        (gSharedMem[0x15DDE])
#define eCurContestWinnerIsForArtist    (gSharedMem[0x15DDF])
#define eCurContestWinner               ((*(struct ContestWinner*)(gSharedMem + 0x15DE0)))
#define eContestPaintingBuffers         ((*(struct ContestPaintingBuffers*)(gSharedMem + 0x15E00)))
#define eEnableContestDebugging         (gSharedMem[0x18000])
#define eContestTempSave                (*(struct ContestTempSave *)(gSharedMem + 0x18004))
#define sContest                        (*(struct Contest *)(gSharedMem + 0x19204))
#define sContestantStatus               ((struct ContestantStatus *)(gSharedMem + 0x19260))
#define eContestAppealResults           (*(struct ContestAppealMoveResults *)(gSharedMem + 0x192D0))
#define eContestAI                      ((struct ContestAIInfo *)(gSharedMem + 0x192E4))
#define eContestExcitement              (*(struct ContestExcitement *)(gSharedMem + 0x19328))
#define eContestGfxState                ((struct ContestGfxState *)(gSharedMem + 0x19338))
#define gContestResources__moveAnim     (*(struct ContestMoveAnim *)(gSharedMem + 0x19348))

// Battle Struct
// For matching purposes, the struct is placed at 0x02000000 and
// there's a ton of filler.
#define ewram16003                      (gSharedMem[0x16003])
#define ewram16004arr(i, battler)       (gSharedMem[0x16004 + i + battler * 2])
#define ewram16010arr(battler)          (gSharedMem[0x16010 + battler])
#define eDynamicMoveType                (gSharedMem[0x1601C])
#define eFocusPunchBattler              (gSharedMem[0x1601D])
#define eDmgMultiplier                  (gSharedMem[0x1601F])
#define ewram16020                      ((u8 *)(gSharedMem + 0x16020))
#define ewram16020arr(i)                (gSharedMem[0x16020 + i])
#define ewram16058                      (gSharedMem[0x16058])
#define ewram16060(battler)             (gSharedMem[0x16060 + battler])
#define BATTLE_PARTY_ID(battler)        (gSharedMem[0x16064 + battler])
#define ewram16064arr(battler)          (gSharedMem[0x16064 + battler])
#define ewram16068arr(i)                (gSharedMem[0x16068 + i])
#define UNK_201606C_ARRAY               (gSharedMem + 0x1606C) // lazy define but whatever.
#define ewram1606Carr(i, a)             (gSharedMem[0x1606C + i + a * 3])
#define ewram16088                      (gSharedMem[0x16088])
#define ewram16089                      (gSharedMem[0x16089])

#define ewram1608Carr(battler)          (gSharedMem[0x1608C + battler])
#define ewram16094arr(battler)          (gSharedMem[0x16094 + battler])
#define EWRAM_1609D                     (gSharedMem[0x1609D])
#define ewram160A8                      (gSharedMem[0x160A8])
#define ewram160A9                      (gSharedMem[0x160A9])
#define ewram160AA                      (gSharedMem[0x160AA])
#define ewram160AB                      (gSharedMem[0x160AB])
#define eLastTakenMove_flat(i)          (gSharedMem[0x160AC + i])
#define eLastTakenMove_2d(i, battler)   (gSharedMem[0x160AC + i + battler * 2])
#define eHpOnSwitchout(battler)         (gSharedMem[0x160BC + battler * 2])
#define ewram160C8arr(battler)          (gSharedMem[0x160C8 + (battler / 2)])
#define ewram160CCarr(i)                (gSharedMem[0x160CC + i])
#define USED_HELD_ITEM(battler)         ((((u16*)(&gSharedMem[0x160CC + battler * 2]))))
#define USED_HELD_ITEMS(battler)        (*(u16 *)&gSharedMem[0x160CC + 2 * (battler)])
#define ewram160D4(battler)             (gSharedMem[0x160D4 + (battler / 2) * 2])
#define ewram160D8(battler)             (gSharedMem[0x160D8 + (battler / 2)])
#define ewram160DA(battler)             (gSharedMem[0x160DA + (battler >> 1)])
#define ewram160DD                      (gSharedMem[0x160DD])
#define ewram160E0(i)                   (gSharedMem[0x160E0 + i])
#define CHOICED_MOVE(battler)           (((u16*)(&gSharedMem[0x160E8 + battler * 2])))
#define ewram160E8arr(i)                (gSharedMem[0x160E8 + i])
#define ewram160E8arr2(i, battler)      (gSharedMem[0x160E8 + i + battler * 2])
#define ewram160F0                      ((u8 *)(gSharedMem + 0x160F0))
#define ewram160F0arr(i)                (gSharedMem[0x160F0 + i])
#define ewram160FB                      (gSharedMem[0x160FB])
#define ewram16100                      ((u8 *)(gSharedMem + 0x16100))
#define ewram16100arr(i)                (gSharedMem[0x16100 + i])
#define ewram16100arr2(i, battler)      (gSharedMem[0x16100 + i + battler * 4])
#define ewram16108arr(i)                (gSharedMem[0x16108 + i])
#define ewram16400                      (gSharedMem + 0x16400)
#define AI_ARRAY_160CC(i)               (gSharedMem[0x160CC + i * 2])
#define ewram16800                      (&gSharedMem[0x16800])

// gBattleResources
#define AI_THINKING_STRUCT              ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))
#define AI_BATTLE_HISTORY               ((struct BattleHistory *) (gSharedMem + 0x16A00))
#define AI_STACK                        ((struct AI_Stack *)         (gSharedMem + 0x16C00))
#define eSecretBaseRecord               ((struct SecretBaseRecord *)(gSharedMem + 0x17000))
#define eBattleFlagsArr                 (*(struct ResourceFlags *)(gSharedMem + 0x17100))
#define B_BATTLESCRIPTS_STACK           ((struct BattleScriptsStack *)     (gSharedMem + 0x17110))
#define B_FUNCTION_STACK                ((struct BattleCallbacksStack *)        (gSharedMem + 0x17140))
#define gBattleResources_statsBeforeLvlUp ((struct StatsArray *)(gSharedMem + 0x17180))

// roulette_gfx.c
#define ewram17000                      (&gSharedMem[0x17000])
#define ewram17E00                      ((u16 *)(gSharedMem + 0x17E00))
#define ewram18000                      ((u16 *)(gSharedMem + 0x18000)) // also: shop.c, battle_anim.c

#define eMoveTutorMenu                  (struct MoveTutorMenu *)(gSharedMem + 0x17000)
#define eCableCar1                      ((struct CableCarEwramStruct1 *)(gSharedMem + 0x17000))
#define gBattleSpriteInfo               ((struct BattleSpriteInfo *)    (gSharedMem + 0x17800))
#define ewram17810                      ((struct Struct2017810 *)    (gSharedMem + 0x17810))
#define ewram17840                      (*(struct Struct2017840 *)   (gSharedMem + 0x17840))
#define ewram17850                      ((struct UnknownStruct5 *)(gSharedMem + 0x17850))
#define eBerryBlenderData               (struct BerryBlenderData*)(&gSharedMem[0x18000])
#define eEggHatchData                   (struct EggHatchData*)(&gSharedMem[0x18000])
#define pssData                         (*(struct PokemonSummaryScreenStruct *)(gSharedMem + 0x18000))

// roulette.c
#define ewram18800                      ((u16 *)(gSharedMem + 0x18800))
#define eRoulette                       ((struct Roulette *)(gSharedMem + 0x19000))

#define eCableCar2                      ((struct CableCarEwramStruct2 *)(gSharedMem + 0x19000))
#define ewram1A000                      (&gSharedMem[0x1A000])
#define ePartyMenu2                     (*(struct Unk201B000 *)(gSharedMem + 0x1B000))
#define gPartyMenu                      (*(struct PartyMenu *)(gSharedMem + 0x1C000))
#define sCreditsData                    (*(struct CreditsData *)(gSharedMem + 0x1C000))

// hall_of_fame.c
#define eHofGfxPtr                      (gSharedMem + 0x8000)
#define eHofMonPtr                      (struct HallofFameMons*)(&gSharedMem[0x1C000])
#define eHOFPCScreenEffect              (*(struct PCScreenEffectStruct *)(gSharedMem + 0x1c000))

#define eMultiBattleSetupPartySendBuffer \
    ((struct Pokemon *)(gSharedMem + 0x1D000))

// pokeblock_feed.c
#define ePokeblockFeedMonAnimX          ((s16 *)(gSharedMem + 0x1D000))
#define ePokeblockFeedMonAnimY          ((s16 *)(gSharedMem + 0x1D400))

// decoration.c
#define sDecorationContext              (*(struct DecoPCPointers *)(gSharedMem + 0x1f000))

#define ewramSavedItemsPocket           ((struct ItemSlot *)(gSharedMem + 0x1E000))  // saved items pocket (for Wally battle)
#define ewramSavedPokeballsPocket       ((struct ItemSlot *)(gSharedMem + 0x1F000))  // saved Pokeballs pocket (for Wally battle)

// player_pc.c, party_menu.c
#define eMailboxInfo                    (*(struct MailboxStruct *)(gSharedMem + 0x1FE00))

#define eCutGrassSpriteArray            (gSharedMem + 0x1FFF0) // 8 sprite IDs

// reshow_battle_screen.c
#define gHelperState                    (gSharedMem[0x1FFFE])
#define gReshowState                    (gSharedMem[0x1FFFF])

// item_menu.c
#define ewramBagSetupStep               (gSharedMem[0x1FFFF])

// pokeblock_feed.c
#define ePokeblockSpriteId              (gSharedMem[0x1FFFC])
#define ePokeblockFeedCaseSpriteId      (gSharedMem[0x1FFFD])
#define ePokeblockMonSpriteId           (gSharedMem[0x1FFFE])

// pokeblock.c
#define ePokeblockCaseSpriteId          (gSharedMem[0x1FFFE])
#define ePokeblockGfxState              (gSharedMem[0x1FFFF])

#endif
