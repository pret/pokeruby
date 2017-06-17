#ifndef GUARD_ROM3_H
#define GUARD_ROM3_H

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
void dp01_build_cmdbuf_x00_a_b_0(u8 a, u8 b, u8 c);
void dp01_build_cmdbuf_x04_4_4_4(u8 a);
void sub_800C704(u8, u8, u8);
void dp01_build_cmdbuf_x07_7_7_7(u8 a);
void dp01_build_cmdbuf_x12_a_bb(u8 a, u8 b, u16 c);
void dp01_build_cmdbuf_x1D_1D_numargs_varargs(u8, u16, u8 *);
void dp01_build_cmdbuf_x2E_a(u8 a, u8 b);
void dp01_build_cmdbuf_x2F_2F_2F_2F(u8 a);
void dp01_build_cmdbuf_x30_TODO(u8 a, u8 *b, u8 c);

#endif // GUARD_ROM3_H
