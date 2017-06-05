// src/rom3.o
void sub_800C35C(void);

struct UnkStruct8060024 {
    u8 outsideMovementRect:1;
    u8 tileIsImpassable:1;
    u8 elevationMismatch:1;
    u8 pathBlockedByObject:1;
    u8 pad_04:4;
};

// asm/battle_2.o
void sub_800E7C4(void);
u8 b_first_side(u8, u8, u8);
void sub_80157C4(u8 index);

// asm/battle_3.o
u8 sub_8015A98(u8, u8, u8);
u8 sub_8018324(u8, u8, u8, u8, u16);

// asm/battle_5.o
void sub_802C098();
void sub_802E3E4(u8, int);
void nullsub_8(u8);

// asm/battle_7.o
void sub_8032AA8(u8 index, int i);

// src/pokemon_3.o
u16 SpeciesToNationalPokedexNum(u16);
void DrawSpindaSpots(u16, u32, u8 *, u8);
u8 sub_803FC58(u16);
void AdjustFriendship(struct Pokemon *, u8);
void sub_80408BC();
void current_map_music_set__default_for_battle(u16);

// src/util.o
void StoreWordInTwoHalfwords(u16 *, u32);
void LoadWordFromTwoHalfwords(u16 *, u32 *);

// src/daycare.o
u8 Daycare_CountPokemon(struct BoxPokemon *);

// asm/daycare.o
void sub_8041324(struct BoxPokemon *, struct RecordMixing_UnknownStruct *);
void sub_8041790(int i);
u16 sub_8041870(u16);
void sub_8041940(void);
void sub_8041950(void);
u8 daycare_relationship_score_from_savegame(void);

// asm/pokeball.o
void CreatePokeballSprite(u8 r0, u8 r1, u8 r2, u8 r3, u8 s1, u8 s2, u8 s3, u16 s4);

// asm/berry_blender.o
void sub_80516C4(u8, u16);

// src/field_map_obj.o
void sub_805AA98();
u8 sub_805AB54(void);
u8 GetFieldObjectIdByLocalIdAndMap(u8, u8, u8);
bool8 TryGetFieldObjectIdByLocalIdAndMap(u8, u8, u8, u8 *);
u8 GetFieldObjectIdByXY(s16, s16);
void RemoveFieldObjectByLocalIdAndMap(u8, u8, u8);
u8 SpawnSpecialFieldObject(struct MapObjectTemplate *);
u8 show_sprite(u8, u8, u8);
u8 AddPseudoFieldObject(u16 graphicsId, void (*callback)(struct Sprite *), s16 c, s16 d, u8 subpriority);
u8 sub_805B410(u8, u8, s16, s16, u8, u8);
void sub_805B55C(s16 a, s16 b);
void sub_805B710(u16 i, u16 i1);
void sub_805B980(struct MapObject *, u8);
void FieldObjectTurn(struct MapObject *, u8);
void FieldObjectTurnByLocalIdAndMap(u8, u8, u8, u8);
const struct MapObjectGraphicsInfo *GetFieldObjectGraphicsInfo(u8);
void npc_by_local_id_and_map_set_field_1_bit_x20(u8, u8, u8, u8);
void FieldObjectGetLocalIdAndMap(struct MapObject *, u8 *, u8 *, u8 *);
void sub_805BCF0(u8, u8, u8, u8);
void sub_805BD48(u8, u8, u8);
void sub_805BD90(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y);
void gpu_pal_allocator_reset__manage_upper_four(void);
void npc_coords_shift(struct MapObject *pObject, s16 x, s16 y);
void sub_805C0F8(u8, u8, u8, s16, s16);
void npc_coords_shift_still(struct MapObject *pObject);
u8 GetFieldObjectIdByXYZ(u16, u16, u8);
void UpdateFieldObjectsForCameraUpdate(s16, s16);
u8 AddCameraObject(u8);
u8 * GetFieldObjectScriptPointerByFieldObjectId(u8);
u8 FieldObjectGetBerryTreeId(u8);
void sub_805C754(struct MapObject *pObject);
void sub_805C774(struct MapObject *, u8);
void sub_805C78C(u8, u8, u8);
void sub_805C7C4(u8 i);

// asm/field_map_obj.o
u8 FieldObjectDirectionToImageAnimId(u8);
u8 get_go_image_anim_num(u8 unk_19);
u8 sub_805FD98(u8);
u8 sub_805FDE8(u8);
u8 sub_805FDF8(u8);
u8 sub_805FE08(u8);
void npc_set_running_behaviour_etc(struct MapObject *, u8);
u8 npc_running_behaviour_by_direction(u8);
u8 npc_block_way(struct MapObject *, s16, s16, u8);
u8 sub_8060024(struct MapObject *, s16, s16, u8);
u8 sub_8060234(u8, u8, u8);
void sub_8060288(u8, u8, u8);
void sub_80603CC(s16 x, s16 y, s16 *pInt, s16 *pInt1);
void FieldObjectMoveDestCoords(struct MapObject *pObject, u8 unk_19, s16 *pInt, s16 *pInt1);
bool8 FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(struct MapObject *);
bool8 FieldObjectSetSpecialAnim(struct MapObject *, u8);
void FieldObjectForceSetSpecialAnim(struct MapObject *pObject, u8 a);
void FieldObjectClearAnimIfSpecialAnimActive(struct MapObject *);
void FieldObjectClearAnim(struct MapObject *);
bool8 FieldObjectCheckIfSpecialAnimFinishedOrInactive(struct MapObject *);
u8 FieldObjectClearAnimIfSpecialAnimFinished(struct MapObject *);
u8 FieldObjectGetSpecialAnim(struct MapObject *);
u8 GetFaceDirectionAnimId(u8);
u8 GetSimpleGoAnimId(u8);
u8 GetGoSpeed0AnimId(u8 a);
u8 sub_8060744(u8 a);
u8 d2s_08064034(u8 a);
u8 sub_806079C(u8 a);
u8 sub_80607F4(u8 a);
u8 GetJumpLedgeAnimId(u8 a);
u8 sub_806084C(u8);
u8 sub_8060878(u8);
u8 sub_80608D0(u8);
u8 GetStepInPlaceDelay32AnimId(u8 a);
u8 GetStepInPlaceDelay16AnimId(u8);
u8 GetStepInPlaceDelay8AnimId(u8 a);
u8 GetStepInPlaceDelay4AnimId(u8 a);
u8 FieldObjectFaceOppositeDirection(struct MapObject *, u8);
u8 sub_80609D8(u8);
u8 sub_8060A04(u8);
u8 sub_8060A30(u8);
u8 sub_8060A5C(u8);
u8 sub_8060A88(u8);
u8 sub_8060AB4(u8);
u8 sub_8060AE0(u8);
u8 sub_8060B0C(u8);
u8 sub_8060B38(u8);
u8 sub_8060B64(u8);
u8 GetOppositeDirection(u8);

// asm/field_ground_effect.o
u8 GetLedgeJumpDirection(s16, s16, u8);
u8 ZCoordToPriority(u8);
void FieldObjectUpdateZCoord(struct MapObject *pObject);
void SetObjectSubpriorityByZCoord(u8, struct Sprite *, u8);

// asm/field_tasks.o
void SetUpFieldTasks();
void ActivatePerStepCallback(u8);
void ResetFieldTasksArgs(void);

// asm/reset_rtc_screen.o
void CB2_InitResetRtcScreen(void);

// asm/party_menu.o
void sub_806CB74(u8 taskId);
void sub_806CCE4(void);
void sub_806CD44(u8 taskId);
void sub_806D538();
void sub_806D5A4(void);
void GetMonNickname(struct Pokemon *mon, u8 *nickname);
bool8 pokemon_has_move(struct Pokemon *, u16);
void sub_806FA18(u8 taskId);

// src/party_menu.o
u8 sub_806E834(const u8 *message, u8 arg1);

// src/rom_8077ABC.o
u8 battle_side_get_owner(u8);
u8 battle_get_per_side_status(u8);
u8 battle_get_side_with_given_state(u8);
bool8 IsDoubleBattle();

// asm/field_weather.o
void SetWeather(u32);

// src/field_fadetransition.o
void pal_fill_black();
void sub_8080990(void);
void sub_80809B0(void);

// asm/field_fadetransition.o
void sub_8080A3C(void);
void sub_8080AC4(void);
void mapldr_default();
void sub_8080B60(void);
void atk17_seteffectuser(void);
void sub_8080E44(void);
void sub_8080E88(void);
void sp13E_warp_to_last_warp(void);
void sub_8080EF0(void);
void sp13F_fall_to_last_warp(void);
void sub_8080F68(void);
void sub_8080F9C(void);

// asm/rom_8080874.o
void sub_8081594(u8);
void sub_80815E0(u8 val);

// asm/cable_club.o
u8 sub_8083664(void);
void sub_8083A84(TaskFunc);
s32 sub_8083BF4(u8 id);

// asm/field_effect.o
u8 CreateTrainerSprite_BirchSpeech(u8, u16, u16, u8, void *);
void LoadTrainerGfx_TrainerCard(u8 gender, int, void *);
u8 CreateBirchSprite(u8, u8, u8);

// asm/unknown_task.o
void remove_some_task(void);
void dp12_8087EA4(void);
void sub_80895F8(u32 i, u32 i1, u32 i2);
void sub_8089668(void);
void sub_8089944(int i, int i1, int i2, int i3, int i4, int i5, int i6);

// asm/pokemon_menu.o
void sub_8089A70(void);
void sub_808A004();
void sub_808AB90(void);

// asm/rom_8094928.o
u8 pokemon_order_func(u8);

// asm/pokemon_storage_system.o
void ResetPokemonStorageSystem(void);

// asm/pokemon_icon.o
u8 sub_809D3A4(u16 arg0, void (*)(struct Sprite *), int, u8 arg3, u32 arg4);
u16 sub_809D4A8(u16);
void sub_809D510(struct Sprite *);
void sub_809D580(u16);
void sub_809D608(u16);

// asm/pokemon_summary_screen.o
u8 pokemon_ailments_get_primary(u32);

// src/script_movement.o
bool8 exec_movement(u8, u8, u8, u8 *);
bool8 sub_80A212C(u8, u8, u8);
void sub_80A2178(void);

// asm/mail_data.o
void ClearMailData(void);
u16 MailSpeciesToSpecies(u16, u8 *);

// src/map_name_popup.o
void ShowMapNamePopup(void);
void HideMapNamePopup();

// asm/item_menu.o
void sub_80A3684(void);
void ClearBag(void);
void sub_80A53F8(void);
void sub_80A5B40(void);
void sub_80A68CC();
u8 sub_80A7D8C(u8 berry, int i, int i1);
void sub_80A7DD4(void);
u8 sub_80A7E5C(u8);

// asm/contest.o
void ResetLinkContestBoolean(void);
void sub_80AE098(u8);
void sub_80AE398(u8, u8);
u32 sub_80AE770(u8, u8);
void sub_80AE82C(u8);
void sub_80AF668(void);
void sub_80B0F28(u8);
void sub_80B2D1C(void);

// asm/shop.o
void CreatePokemartMenu(void *);
void CreateDecorationShop1Menu(void *);
void CreateDecorationShop2Menu(void *);

// asm/secret_base.o
void ResetSecretBases(void);
u8 sub_80BBB24(void);
void sub_80BBCCC(u8);
u8 *sub_80BCCE8(void);
void sub_80BD674(void *, u32, u8);

// asm/tv.o
void ClearTVShowData(void);
void UpdateTVScreensOnMap(int, int);
void ResetGabbyAndTy(void);
u8 sub_80BDEAC(u8 *);
void sub_80BE160(TVShow *);
void sub_80BE8EC(u16);
void UpdateMassOutbreakTimeLeft(u16);
void sub_80BE97C(u8);
void sub_80BEA50(u16);
void sub_80BEA5C(u16);
bool8 GetPriceReduction(u8);
void sub_80BEE84(u16);
size_t sub_80BF0B8(int);
void sub_80BF478(void);
u16 sub_80BF674(u16 species);
s8 sub_80BF720(TVShow *);
bool8 sub_80BF77C(u16);
void sub_80BFD44(u8 *, u32, u8);
void sub_80C0514(void *, u32, u8);

// src/tv.o
void StartMassOutbreak(void);
void TVShowDone(void);

// asm/contest_link_80C2020.o
void sub_80C2358(void);
void sub_80C48C8(void);
void sub_80C4940(void);
void sub_80C4980(u8);
u8 sub_80C4B34(u8 *);

// asm/fldeff_80C5CD4.o
void DoFieldPoisonEffect(void);
bool32 FieldPoisonEffectIsRunning(void);
void CreateRecordMixingSprite(void);
void DestroyRecordMixingSprite(void);

// asm/rotating_gate.o
void RotatingGatePuzzleCameraUpdate(s16, s16);
void sub_80C8080();
u32 CheckForRotatingGatePuzzleCollision(u8, s16, s16);

// asm/contest_link_80C857C.o
void sub_80C8734(u8);
void sub_80C88AC(u8);
void sub_80C8E1C(u8);
void sub_80C8EBC(u8);
void sub_80C8F34(u8);

// asm/easy_chat.o
void InitEasyChatPhrases(void);
u8* sub_80EB3FC(u8 *, u16);
u8 *ConvertEasyChatWordsToString(u8 *dst, u16 *words, u16, u16);

// asm/pokenav.o
void sub_80EBA5C(void);

// src/mauville_old_man.o
void SetMauvilleOldMan(void);

// asm/mauville_old_man.o
void sub_80F7F30(void);

// asm/menu_helpers.o
bool8 sub_80F9344(void);
void sub_80F9368(void);
void sub_80F9438(void);

// asm/region_map.o
void sub_80FBFB4(u8 *str, u8 region, u8);
void CopyMapName();
u8 *CopyLocationName(u8 *dest, u8 location);

// asm/slot_machine.o
void PlaySlotMachine(u8, void *);

// asm/pokeblock.o
void ClearPokeblocks(void);
void sub_810CA6C(s32);
s16 sub_810CAE4(u8, struct Pokeblock *);

// asm/fldeff_flash.o
void sub_810CC80(void);

// src/time_events.o
u8 IsMirageIslandPresent(void);

// asm/field_specials.o
void ResetCyclingRoadChallengeData(void);
bool32 CountSSTidalStep(u16);
u8 GetSSTidalLocation(s8 *, s8 *, s16 *, s16 *);
void ScriptAddElevatorMenuItem(u8, u8, u8, u8);
void ScriptShowElevatorMenu(void);
u8 GetLeadMonIndex(void);
void ResetFanClub(void);

// asm/battle_records.o
void InitLinkBattleRecords(void);

// asm/pokedex_cry_screen.o
u8 sub_8119E3C(struct CryRelatedStruct *, u8);
void sub_8119F88(u8 a);
void sub_811A050(u16 species);
u8 ShowPokedexCryScreen(struct CryRelatedStruct *, u8);
void DestroyCryMeterNeedleSprite();

// asm/battle_transition.o
void sub_811AABC(u8);
void sub_811AAD8(u8);
u8 sub_811AAE8(void);

// asm/battle_message.o
void get_battle_strings_(u8 *);
void sub_8120FFC(const u8 *, u8 *);

// src/mystery_event_script.o
u32 sub_812613C(u8 *);
void sub_8126160(u8);

// asm/mystery_event_script.o
u16 sub_8126338(void);

// asm/field_effect_helpers.o
u8 sub_8126B54(void);
void objid_set_invisible(u8);
void sub_8126BC4(u8 unk_1B, u8 r6, s16 x, s16 y);
void sub_8127ED0(u8, u8);
void sub_8127F28(u8, u8, s16);
u8 sub_8128124(u8 id);

// asm/learn_move.o
void sub_8132670(void);

// asm/decoration_inventory.o
void ClearDecorationInventories(void);
u8 sub_8133FE4(u8);
u8 IsThereStorageSpaceForDecoration(u8);
u8 sub_8134074(u8);
s8 sub_81340A8(u8);

// asm/battle_tower.o
void sub_8134AC0(void *);

// src/player_pc.o
void NewGameInitPCItems(void);

// asm/hall_of_fame.o
void sub_8143648(u16 paletteTag, u8 arg1);

// src/diploma.o
void sub_8145D88(void);

// asm/intro_credits_graphics.o
void load_intro_part2_graphics(/*TODO: arg types*/);
void sub_8148C78(/*TODO: arg types*/);
void sub_8148CB0(u8);
void sub_8148E90(u8);
u8 sub_8148EC0(/*TODO: arg types*/);
void sub_8149020(/*TODO: arg types*/);
u8 intro_create_brendan_sprite(/*TODO: arg types*/);
u8 intro_create_may_sprite(/*TODO: arg types*/);
u8 intro_create_latios_sprite(/*TODO: arg types*/);
u8 intro_create_latias_sprite(/*TODO: arg types*/);
