@ Dummy values used when the RTC is in an invalid state.
@ 2000 Jan 1 00:00:00
	.align 2
	.global gRtcDummy
gRtcDummy: @ 81E7610
	.byte 0
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0

	.align 2
	.global gNumDaysInMonths
gNumDaysInMonths: @ 81E761C
	.4byte 31
	.4byte 28
	.4byte 31
	.4byte 30
	.4byte 31
	.4byte 30
	.4byte 31
	.4byte 31
	.4byte 30
	.4byte 31
	.4byte 30
	.4byte 31
