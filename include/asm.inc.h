// asm/rom3.o
void sub_800C35C(void);

// asm/rom_800D42C.o
void sub_800E7C4(void);
u8 b_first_side(u8, u8, u8);
void sub_80157C4(u8 index);
u8 sub_8015A98(u8, u8, u8);
u8 sub_8018324(u8, u8, u8, u8, u16);
void sub_8032AA8(u8 index, int i);

// src/pokemon_3.o
u16 SpeciesToNationalPokedexNum(u16);

// asm/pokemon_3.o
void DrawSpindaSpots(u16, u32, void *, u8);
u8 sub_803FC58(u16);
void AdjustFriendship(struct Pokemon *, u8);
void sub_80408BC();
void current_map_music_set__default_for_battle(u16);

// asm/util.o
void StoreWordInTwoHalfwords(u16 *, u32);
void LoadWordFromTwoHalfwords(u16 *, u32 *);

// asm/daycare.o
u8 daycare_count_pokemon(u8 *);
void sub_8041324(struct BoxPokemon *, void *);
void sub_8041790(int i);
u16 sub_8041870(u16);
void sub_8041940(void);
void sub_8041950(void);
u8 daycare_relationship_score_from_savegame(void);

// asm/pokeball.o
void CreatePokeballSprite(u8 r0, u8 r1, u8 r2, u8 r3, u8 s1, u8 s2, u8 s3, u16 s4);

// asm/berry_blender.o
void sub_80516C4(u8, u16);

// src/field_door.o
void FieldSetDoorOpened(u32, u32);
void FieldSetDoorClosed(u32, u32);
s8 FieldAnimateDoorClose(u32, u32);
s8 FieldAnimateDoorOpen(u32, u32);
bool8 FieldIsDoorAnimationRunning(void);
u32 sub_8058790(u32 x, u32 y);

// asm/field_map_obj.o
void sub_805AA98();
u8 sub_805AB54(void);
u8 GetFieldObjectIdByLocalIdAndMap(u8, u8, u8);
bool8 TryGetFieldObjectIdByLocalIdAndMap(u8, u8, u8, u8 *);
u8 GetFieldObjectIdByXY(s16, s16);
void RemoveFieldObjectByLocalIdAndMap(u8, u8, u8);
u8 SpawnSpecialFieldObject(struct UnknownStruct_FPA *);
u8 show_sprite(u8, u8, u8);
u8 AddPseudoFieldObject(u8 val, void (*player)(struct Sprite *), int i, int i1, int i2);
u8 sub_805B410(u8, u8, s16, s16, u8, u8);
void sub_805B55C(int i, int i1);
void sub_805B710(int i, int i1);
void sub_805B980(struct MapObject *, u8);
void FieldObjectTurn(struct MapObject *, u8);
void FieldObjectTurnByLocalIdAndMap(u8, u8, u8, u8);
struct MapObjectGraphicsInfo *GetFieldObjectGraphicsInfo(u8);
void npc_by_local_id_and_map_set_field_1_bit_x20(u8, u8, u8, u8);
void FieldObjectGetLocalIdAndMap(struct MapObject *, u8 *, u8 *, u8 *);
void sub_805BCF0(u8, u8, u8, u8);
void sub_805BD48(u8, u8, u8);
void sub_805BD90(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y);
void gpu_pal_allocator_reset__manage_upper_four(void);
void npc_coords_shift(struct MapObject *pObject, s16 x, s16 y);
void sub_805C0F8(u8, u8, u8, s16, s16);
void npc_coords_shift_still(struct MapObject *pObject);
u8 GetFieldObjectIdByXYZ(u16, u16, int);
void UpdateFieldObjectsForCameraUpdate(s16, s16);
u8 AddCameraObject(u8);
u8 * GetFieldObjectScriptPointerByFieldObjectId(u8);
u8 FieldObjectGetBerryTreeId(u8);
void sub_805C754(struct MapObject *pObject);
void sub_805C774(struct MapObject *,			 u8 );
void sub_805C78C(u8, u8, u8);
void sub_805C7C4(int i);
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
u8 FieldObjectFaceOppositeDirection(void *, u8);
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

// src/field_map_obj_helpers.o
bool8 FreezeMapObject(struct MapObject *);
void FreezeMapObjects(void);
void FreezeMapObjectsExceptOne(u8);
void UnfreezeMapObjects(void);
void sub_806487C(struct Sprite *sprite, bool8 invisible);
void sub_8064990(u8, u8);

// asm/field_control_avatar.o
void FieldClearPlayerInput(struct FieldInput *pStruct);
void FieldGetPlayerInput(struct FieldInput *pStruct, u16 keys, u16 heldKeys);
int sub_8068024(struct FieldInput *pStruct);
u8 *sub_80682A8(struct MapPosition *, u8, u8);
void overworld_poison_timer_set(void);
void prev_quest_postbuffer_cursor_backup_reset(void);
u8 *sub_8068E24(struct MapPosition *);
u8 *GetFieldObjectScriptPointerForComparison();

// asm/field_tasks.o
void SetUpFieldTasks();
void ActivatePerStepCallback(u8);
void ResetFieldTasksArgs(void);

// asm/clock.o
void DoTimeBasedEvents(void);

// asm/reset_rtc_screen.o
void CB2_InitResetRtcScreen(void);

// asm/party_menu.o
void GetMonNickname(struct Pokemon *mon, u8 *nickname);
bool8 pokemon_has_move(struct Pokemon *, u16);

// asm/rom_8077ABC.o
u8 battle_side_get_owner(u8);
u8 battle_get_per_side_status(u8);
u8 battle_get_side_with_given_state(u8);
bool8 IsDoubleBattle();

// asm/weather.o
void SetWeather(u32);

// asm/rom_8080874.o
void pal_fill_black();
void sub_8080990(void);
void sub_80809B0(void);
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
void sub_8081594(u8);
void sub_80815E0(u8 val);

// asm/cable_club.o
u8 sub_8083664(void);
void sub_8083A84(TaskFunc);
s32 sub_8083BF4(u8 id);

// src/fldeff_emotion.o
void sub_8084894(struct Sprite *sprite, u16 a2, u8 a3);
void objc_exclamation_mark_probably(struct Sprite *sprite);

// asm/rom_80859BC.o
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
void sub_808AB90(void);

// asm/pokemon_storage_system.o
void sub_80961D8(void);

// asm/pokemon_icon.o
u8 sub_809D3A4(u16 arg0, void (*)(struct Sprite *), int, u8 arg3, u32 arg4);
u16 sub_809D4A8(u16);
void sub_809D510(struct Sprite *);
void sub_809D580(u16);
void sub_809D608(u16);

// asm/pokemon_summary_screen.o
u8 pokemon_ailments_get_primary(u32);

// asm/script_movement.o
bool8 exec_movement(u8, u8, u8, u8 *);
bool8 sub_80A212C(u8, u8, u8);
void sub_80A2178(void);

// asm/mail_data.o
void sub_80A2B18(void);
u16 sub_80A2D64(u16, u8 *);

// asm/map_name_popup.o
void ShowMapNamePopup(void);
void HideMapNamePopup();

// asm/item_menu.o
void sub_80A3684(void);
void sub_80A3714(void);
void sub_80A53F8(void);
void sub_80A5B40(void);
void sub_80A68CC();
u8 sub_80A7D8C(u8 berry, int i, int i1);
void sub_80A7DD4(void);
u8 sub_80A7E5C(u8);

// src/matsuda_debug_menu.o
void sub_80AA280(u8);
void sub_80AA5E8(u8);
void sub_80AA658(u8);

// asm/contest.o
void sub_80AB1B0(void);
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

// src/script_menu.o
bool8 sub_80B5054(u8, u8, u8, u8);
bool8 sub_80B50B0(u8, u8, u8, u8, u8);
bool8 Multichoice(u8, u8, u8, u8);
bool8 yes_no_box(u8, u8);
bool8 sub_80B5578(u8, u8, u8, u8, u8);
bool8 sub_80B58C4(u16, u8, u8);
void *picbox_close(void);

// asm/naming_screen.o
void DoNamingScreen(u8 r0, u8 *r1, u16 r2, u16 r3, u32 s0, MainCallback s4);

// asm/secret_base.o
void sub_80BB5B4(void);
u8 sub_80BBB24(void);
void sub_80BBCCC(u8);
u8 *sub_80BCCE8(void);
void sub_80BD674(void *, u32, u8);

// asm/tv.o
void sub_80BD7A8(void);
void UpdateTVScreensOnMap(u32, u32);
void sub_80BDAB4(void);
u8 sub_80BDEAC(u8 *);
void sub_80BE160(TVShow *);
void sub_80BE8EC(u16);
void UpdateMassOutbreakTimeLeft(u16);
void sub_80BE97C(u8);
void sub_80BEA50(u16);
void sub_80BEA5C(u16);
bool8 GetPriceReduction(u8);
void sub_80BEE84(u16);
u8 sub_80BF0B8(u32);
void sub_80BF478(void);
u16 sub_80BF674(u16 species);
s8 sub_80BF720(TVShow *);
u8 sub_80BF77C(u32);
void sub_80BFD44(void *, u32, u8);
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

// asm/script_pokemon_util_80C4BF0.o
u8 sub_80C4D50(void);
void ShowContestWinner(void);
void HealPlayerParty();
u8 ScriptGiveMon(u16, u8, u16, u32, u32, u8);
u8 ScriptGiveEgg(u16);
void ScriptWildBattle(u16, u8, u16);
void ScriptSetMonMoveSlot(u8, u16, u8);

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

// asm/bike.o
void MovePlayerOnBike(u8, u16, u16);
void sub_80E5B38(u16 i, u16 c);
u8 IsRunningDisallowed(u8);
bool8 player_should_look_direction_be_enforced_upon_movement(void);
void BikeClearState(int i, int i1);
void sub_80E6010(u8 i);
s16 GetPlayerSpeedToUse(void);
void sub_80E6084();

// asm/easy_chat.o
void sub_80E6764(void);
void sub_80EB3FC(u8 *, u16);
u8 ConvertEasyChatWordsToString(u8 *dst, u16 *words, u16, u16);
u16 sub_80EB72C(u16);

// asm/pokenav.o
void sub_80EBA5C(void);

// asm/mauville_old_man.o
void sub_80F7AA4(void);
void sub_80F7F30(void);

// asm/menu_helpers.o
bool8 sub_80F9344(void);
void sub_80F9368(void);
void sub_80F9438(void);

// asm/script_pokemon_util_80F99CC.o
void sub_80F99CC(void);

// src/dewford_trend.o
void sub_80FA17C(void);
void sub_80FA4E4(void *, u32, u8);

// asm/region_map.o
void sub_80FBFB4(u8 *str, u8 region, u8);
void CopyMapName();
u8 *CopyLocationName(u8 *dest, u8 location);

// asm/slot_machine.o
void PlaySlotMachine(u8, void *);

// asm/contest_painting.o
void sub_8106630(u32);

// asm/rom6.o
bool8 npc_before_player_of_type(u8);
u8 oei_task_add(void);

// asm/pokeblock.o
void sub_810C994(void);
void sub_810CA6C(s32);
s16 sub_810CAE4(u8, struct Pokeblock *);

// asm/rom_810CBB4.o
void sub_810CC80(void);
u8 sub_810D32C(void);
void ResetCyclingRoadChallengeData(void);
bool32 sub_810D9B0(u16);
u8 sub_810D9EC(s8 *, s8 *, s16 *, s16 *);
void ScriptAddElevatorMenuItem(u8, u8, u8, u8);
void ScriptShowElevatorMenu(void);
u8 GetLeadMonIndex(void);
void sub_810FA54(void);

// asm/battle_records.o
void InitLinkBattleRecords(void);

// asm/battle_transition.o
void sub_811AABC(u8);
void sub_811AAD8(u8);
u8 sub_811AAE8(void);

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

// asm/rom_81258BC.o
void sub_8132670(void);
void sub_8133F80(void);
u8 sub_8133FE4(u8);
u8 IsThereStorageSpaceForDecoration(u8);
u8 sub_8134074(u8);
s8 sub_81340A8(u8);
void sub_81341F8(void);
void sub_813420C(void);
void mapnumbers_history_shift_sav1_0_2_4_out(void);
void sub_8134348(void);
void sub_8134394();
u8 sub_81344CC(void);
void sub_8134AC0(void *);

// src/player_pc.o
void NewGameInitPCItems(void);

// src/intro.o
void sub_813CE30(u16, u16, u16, u16);

// asm/braille_puzzles.o
bool8 ShouldDoBrailleStrengthEffect(void);
void DoBrailleStrengthEffect(void);

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

// asm/name_string_util.o
void SanitizeNameString(u8*);

// src/agb_flash.o
u16 ReadFlashId(void);
u16 SetFlashTimerIntr(u8 timerNum, void (**intrFunc)(void));
void ReadFlash(u16 sectorNum, u32 offset, u8 *dest, u32 size);
u32 ProgramFlashSectorAndVerify();
u32 ProgramFlashSectorAndVerifyNBytes(u16 sectorNum, u8 *src, u32 n);
u16 IdentifyFlash(void);
