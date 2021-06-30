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
// The actual data starts at 0x02014000
#define eMultiTxBuffer                  (*(union MultiBuffers *)gSharedMem)
#define gBattleStruct                   ((struct BattleStruct *)     (gSharedMem + 0x0))
// This macro ensures that any changes to the battle struct
// definition will not horribly break things in battle.
#define BSTRUCT_OFF(member)             (offsetof(struct BattleStruct, member) + ((u8 *)gBattleStruct - gSharedMem))
#define BCOMM(buff, member, blockOff, i)  (gSharedMem[BSTRUCT_OFF(buff) + offsetof(struct LinkBattleCommunicationHeader, member) + blockOff + i])

// battle_transition.c
#define TRANSITION_STRUCT               (*(struct TransitionData *)   (gSharedMem + 0xC000))
#define eTransitionMugshotDecompBuff    (&gSharedMem[0xC03C])

#define ewram16400                      (gSharedMem + 0x16400)

// gBattleResources
#define AI_THINKING_STRUCT              ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))
#define AI_BATTLE_HISTORY               ((struct BattleHistory *) (gSharedMem + 0x16A00))
#define AI_STACK                        ((struct AI_Stack *)         (gSharedMem + 0x16C00))
#define eSecretBaseRecord               ((struct SecretBaseRecord *)(gSharedMem + 0x17000))
#define eBattleFlagsArr                 (*(struct ResourceFlags *)(gSharedMem + 0x17100))
#define B_BATTLESCRIPTS_STACK           ((struct BattleScriptsStack *)     (gSharedMem + 0x17110))
#define B_FUNCTION_STACK                ((struct BattleCallbacksStack *)        (gSharedMem + 0x17140))
#define gBattleResources_statsBeforeLvlUp ((struct StatsArray *)(gSharedMem + 0x17180))
#define gBattleSpriteInfo               ((struct BattleSpriteInfo *)    (gSharedMem + 0x17800))
#define ewram17810                      ((struct Struct2017810 *)    (gSharedMem + 0x17810))
#define ewram17840                      (*(struct Struct2017840 *)   (gSharedMem + 0x17840))
#define ewram17850                      ((struct UnknownStruct5 *)(gSharedMem + 0x17850))

#define eBattleAnimPalBackup_Battle     ((u16 *)(gSharedMem + 0x18000)) // also: shop.c, battle_anim.c

// Contest
#define eBattleAnimPalBackup_Contest    ((u16 *)(gSharedMem + 0x14800))
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

// Non-battle allocations
#define namingScreenData                (*(struct NamingScreenData *)(gSharedMem + 0x0))
#define eSaveSection                    (struct SaveSector *)(gSharedMem + 0x0)
#define eSlotMachine                    ((struct SlotMachineEwramStruct *)(gSharedMem + 0x0))
#define ePokemonStorageSystem           (*(struct PokemonStorageSystemData *)(gSharedMem + 0))

#define ewramSavedItemsPocket           ((struct ItemSlot *)(gSharedMem + 0x1E000))  // saved items pocket (for Wally battle)
#define ewramSavedPokeballsPocket       ((struct ItemSlot *)(gSharedMem + 0x1F000))  // saved Pokeballs pocket (for Wally battle)

// party_menu.c
#define ePartyMenu                      (*(struct Unk2001000 *)(gSharedMem + 0x1000))
#define eMoveTutorMenu                  (struct MoveTutorMenu *)(gSharedMem + 0x17000)
#define ePartyMenu2                     (*(struct Unk201B000 *)(gSharedMem + 0x1B000))
#define gPartyMenu                      (*(struct PartyMenu *)(gSharedMem + 0x1C000))

// player_pc.c, party_menu.c
#define eMailboxInfo                    (*(struct MailboxStruct *)(gSharedMem + 0x1FE00))

// item_menu.c
#define ewramBerryPic                   (gSharedMem + 0x0)
#define ewramBerryPicTemp               (gSharedMem + 0x1000)

// record_mixing.c
#define eRecordMixTvShows               ((union TVShow (*)[TV_SHOWS_COUNT])(gSharedMem + 0x7000))
#define eRecordMixPokeNews              ((struct PokeNews (*)[POKE_NEWS_COUNT])(gSharedMem + 0x7000)) // same addr as above
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

#define ewram_2010000                   (*(struct TradeEwramStruct *)(gSharedMem + 0x10000))
#define eBerryBlenderGfxBuffer          (&gSharedMem[0x10000])
#define eSlotMachineGfxBuffer           (void *)(gSharedMem + 0x10000) // slot machine
#define eSlotMachineReelTimeGfxBuffer   (&gSharedMem[0x13200])
#define sEvoInfo                        ((*(struct EvoInfo*)(gSharedMem + 0x14800)))

// roulette_gfx.c
#define ewram17000                      (&gSharedMem[0x17000])
#define ewram17E00                      ((u16 *)(gSharedMem + 0x17E00))
#define ewram18000                      ((u16 *)(gSharedMem + 0x18000)) // also: shop.c, battle_anim.c

#define eCableCar1                      ((struct CableCarEwramStruct1 *)(gSharedMem + 0x17000))
#define eCableCar2                      ((struct CableCarEwramStruct2 *)(gSharedMem + 0x19000))

#define eBerryBlenderData               (struct BerryBlenderData*)(&gSharedMem[0x18000])
#define eEggHatchData                   (struct EggHatchData*)(&gSharedMem[0x18000])

// pokemon_summary_screen.c
#define pssData                         (*(struct PokemonSummaryScreenStruct *)(gSharedMem + 0x18000))
#define ewram1A000                      (&gSharedMem[0x1A000])

// roulette.c
#define ewram18800                      ((u16 *)(gSharedMem + 0x18800))
#define eRoulette                       ((struct Roulette *)(gSharedMem + 0x19000))

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
