	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CoordEventWeather_Indoor
CoordEventWeather_Indoor: @ 806936C
	push {lr}
	movs r0, 0x1
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Indoor

	thumb_func_start CoordEventWeather_Sunny
CoordEventWeather_Sunny: @ 8069378
	push {lr}
	movs r0, 0x2
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Sunny

	thumb_func_start CoordEventWeather_Rain
CoordEventWeather_Rain: @ 8069384
	push {lr}
	movs r0, 0x3
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Rain

	thumb_func_start CoordEventWeather_Snowflakes
CoordEventWeather_Snowflakes: @ 8069390
	push {lr}
	movs r0, 0x4
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Snowflakes

	thumb_func_start CoordEventWeather_Thunderstorm
CoordEventWeather_Thunderstorm: @ 806939C
	push {lr}
	movs r0, 0x5
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Thunderstorm

	thumb_func_start CoordEventWeather_Fog
CoordEventWeather_Fog: @ 80693A8
	push {lr}
	movs r0, 0x6
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Fog

	thumb_func_start CoordEventWeather_DiagonalFog
CoordEventWeather_DiagonalFog: @ 80693B4
	push {lr}
	movs r0, 0x9
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_DiagonalFog

	thumb_func_start CoordEventWeather_Snow
CoordEventWeather_Snow: @ 80693C0
	push {lr}
	movs r0, 0x7
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Snow

	thumb_func_start CoordEventWeather_Sandstorm
CoordEventWeather_Sandstorm: @ 80693CC
	push {lr}
	movs r0, 0x8
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Sandstorm

	thumb_func_start CoordEventWeather_Cloudy
CoordEventWeather_Cloudy: @ 80693D8
	push {lr}
	movs r0, 0xB
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Cloudy

	thumb_func_start CoordEventWeather_Drought
CoordEventWeather_Drought: @ 80693E4
	push {lr}
	movs r0, 0xC
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Drought

	thumb_func_start CoordEventWeather_UnderwaterFog
CoordEventWeather_UnderwaterFog: @ 80693F0
	push {lr}
	movs r0, 0x14
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_UnderwaterFog

	thumb_func_start CoordEventWeather_UnderwaterBubbles
CoordEventWeather_UnderwaterBubbles: @ 80693FC
	push {lr}
	movs r0, 0x15
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_UnderwaterBubbles

	thumb_func_start DoCoordEventWeather
DoCoordEventWeather: @ 8069408
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r2, 0
	ldr r3, _08069428 @ =gCoordEventWeatherFuncs
_08069412:
	lsls r1, r2, 3
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r4
	bne _0806942C
	adds r0, r3, 0x4
	adds r0, r1, r0
	ldr r0, [r0]
	bl _call_via_r0
	b _08069436
	.align 2, 0
_08069428: .4byte gCoordEventWeatherFuncs
_0806942C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xC
	bls _08069412
_08069436:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DoCoordEventWeather

	.align 2, 0 @ Don't pad with nop.
