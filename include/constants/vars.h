#ifndef GUARD_CONSTANTS_VARS_H
#define GUARD_CONSTANTS_VARS_H

#define VAR_0x3F20                 0x3F20

// temporary vars
// The first 0x10 vars are are temporary--they are cleared every time a map is loaded.
#define VAR_TEMP_0                 0x4000
#define VAR_TEMP_1                 0x4001
#define VAR_TEMP_2                 0x4002
#define VAR_TEMP_3                 0x4003
#define VAR_TEMP_4                 0x4004
#define VAR_TEMP_5                 0x4005
#define VAR_TEMP_6                 0x4006
#define VAR_TEMP_7                 0x4007
#define VAR_TEMP_8                 0x4008
#define VAR_TEMP_9                 0x4009
#define VAR_TEMP_A                 0x400A
#define VAR_TEMP_B                 0x400B
#define VAR_TEMP_C                 0x400C
#define VAR_TEMP_D                 0x400D
#define VAR_TEMP_E                 0x400E
#define VAR_TEMP_F                 0x400F

// object gfx id vars
// These 0x10 vars are used to dynamically control a map object's sprite.
// For example, the rival's sprite id is dynamically set based on the player's gender.
// See VarGetFieldObjectGraphicsId().
#define VAR_OBJ_GFX_ID_0           0x4010
#define VAR_OBJ_GFX_ID_1           0x4011
#define VAR_OBJ_GFX_ID_2           0x4012
#define VAR_OBJ_GFX_ID_3           0x4013
#define VAR_OBJ_GFX_ID_4           0x4014
#define VAR_OBJ_GFX_ID_5           0x4015
#define VAR_OBJ_GFX_ID_6           0x4016
#define VAR_OBJ_GFX_ID_7           0x4017
#define VAR_OBJ_GFX_ID_8           0x4018
#define VAR_OBJ_GFX_ID_9           0x4019
#define VAR_OBJ_GFX_ID_A           0x401A
#define VAR_OBJ_GFX_ID_B           0x401B
#define VAR_OBJ_GFX_ID_C           0x401C
#define VAR_OBJ_GFX_ID_D           0x401D
#define VAR_OBJ_GFX_ID_E           0x401E
#define VAR_OBJ_GFX_ID_F           0x401F

#define VAR_RECYCLE_GOODS          0x4020
#define VAR_REPEL_STEP_COUNT       0x4021
#define VAR_ICE_STEP_COUNT         0x4022
#define VAR_FIRST_POKE             0x4023
#define VAR_MIRAGE_RND_H           0x4024
#define VAR_MIRAGE_RND_L           0x4025
#define VAR_SECRET_BASE_MAP        0x4026

#define VAR_HAPPINESS_STEP_COUNTER 0x402A
#define VAR_POISON_STEP_COUNTER    0x402B
#define VAR_RESET_RTC_ENABLE       0x402C

#define VAR_DAYS                   0x4040

#define VAR_DEPT_STORE_FLOOR       0x4043
#define VAR_POKELOT_PRIZE          0x4045
#define VAR_NATIONAL_DEX           0x4046
#define VAR_SHROOMISH_SIZE_RECORD  0x4047
#define VAR_ASH_GATHER_COUNT       0x4048
#define VAR_BIRCH_STATE            0x4049
#define VAR_CRUISE_STEP_COUNT      0x404A
#define VAR_POKELOT_RND1           0x404B
#define VAR_POKELOT_RND2           0x404C

#define VAR_BARBOACH_SIZE_RECORD   0x404F

#define VAR_0x4054                 0x4054

#define VAR_0x4089                 0x4089
#define VAR_0x4095                 0x4095
#define VAR_0x4097                 0x4097
#define VAR_0x409a                 0x409a
#define VAR_WEATHER_INSTITUTE_CLEARED 0x040B3
#define VAR_PORTHOLE               0x40B4

#define VAR_0x40BC                 0x40BC
#define VAR_0x40C2                 0x40C2

#endif // GUARD_CONSTANTS_VARS_H
