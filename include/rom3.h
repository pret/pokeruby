#ifndef GUARD_ROM3_H
#define GUARD_ROM3_H

struct DisableStruct;

void sub_800B858(void);
void setup_poochyena_battle();
void sub_800B950(void);
void sub_800B9A8(void);
void sub_800BA78(void);
void sub_800BD54(void);
void sub_800BF28(void);
void dp01_prepare_buffer_wireless_probably(u8 a, u16, u8 *c);
void sub_800C1A8(u8);
void sub_800C35C(void);
void sub_800C47C(u8);
void EmitGetAttributes(u8 a, u8 b, u8 c);
void dp01_build_cmdbuf_x01_a_b_0(u8 a, u8 b, u8 c);
void dp01_build_cmdbuf_x04_4_4_4(u8 a);
void EmitSwitchInAnim(u8, u8, u8);
void EmitReturnPokeToBall(u8 a, u8 b);
void dp01_build_cmdbuf_x07_7_7_7(u8 a);
void EmitTrainerSlide(u8 a);
void dp01_build_cmdbuf_x09_9_9_9(u8 a);
void EmitFaintAnimation(u8 a);
void dp01_build_cmdbuf_x0B_B_B_B(u8 a);
void dp01_build_cmdbuf_x0C_C_C_C(u8 a);
void EmitBallThrowAnim(u8 a, u8 b);
void EmitMoveAnimation(u8 a, u16 b, u8 c, u16 d, s32 e, u8 f, struct DisableStruct *g);
void EmitPrintString(u8 a, u16 b);
void EmitPrintStringPlayerOnly(u8 a, u16 stringID);
void dp01_build_cmdbuf_x12_a_bb(u8 a, u8 b, u16 c);
void sub_800CBA4(u8 a, u8 b, u8 c, u8 *d);
void sub_800CBE0(u8 a, u8 *b);
void EmitChoosePokemon(u8 a, u8 b, u8 c, u8 d, u8 *e);
void dp01_build_cmdbuf_x17_17_17_17(u8 a);
void EmitHealthBarUpdate(u8 a, u16 b);
void EmitExpBarUpdate(u8 a, u8 b, u16 c);
void EmitStatusIconUpdate(u8 a, u32 b, u32 c);
void EmitStatusAnimation(u8 a, u8 b, u32 c);
void EmitStatusXor(u8 a, u8 b);
void dp01_build_cmdbuf_x1D_1D_numargs_varargs(u8, u16, u8 *);
void dp01_build_cmdbuf_x21_a_bb(u8 a, u8 b, u16 c);
void dp01_build_cmdbuf_x22_a_three_bytes(u8 a, u8 b, u8 *c);
void dp01_build_cmdbuf_x23_aa_0(u8 a, u16 b);
void dp01_build_cmdbuf_x24_aa_0(u8 a, u16 b);
void dp01_build_cmdbuf_x25_25_25_25(u8 a);
void dp01_build_cmdbuf_x26_a(u8 a, u8 b);
void dp01_build_cmdbuf_x27_27_27_27(u8 a);
void dp01_build_cmdbuf_x28_28_28_28(u8 a);
void EmitHitAnimation(u8 a);
void dp01_build_cmdbuf_x2A_2A_2A_2A(u8 a);
void EmitEffectivenessSound(u8 a, u16 b);
void EmitPlaySound(u8 a, u16 b);
void EmitFaintingCry(u8 a);
void EmitBattleIntroSlide(u8 a, u8 b);
void dp01_build_cmdbuf_x2F_2F_2F_2F(u8 a);
void dp01_build_cmdbuf_x30_TODO(u8 a, u8 *b, u8 c);
void dp01_build_cmdbuf_x31_31_31_31(u8 a);
void dp01_build_cmdbuf_x32_32_32_32(u8 a);
void EmitSpriteInvisibility(u8 a, u8 b);
void EmitBattleAnimation(u8 a, u8 b, u16 c);
void EmitLinkStandbyMsg(u8 a, u8 b);
void EmitResetActionMoveSelection(u8 a, u8 b);
void dp01_build_cmdbuf_x37_a(u8 a, u8 b);

#endif // GUARD_ROM3_H
