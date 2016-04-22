	.align 2
	.global gExperienceTables
gExperienceTables: @ 81FDF78
	.include "data/experience_tables/medium_fast_growth_rate.s"
	.include "data/experience_tables/erratic_growth_rate.s"
	.include "data/experience_tables/fluctuating_growth_rate.s"
	.include "data/experience_tables/medium_slow_growth_rate.s"
	.include "data/experience_tables/fast_growth_rate.s"
	.include "data/experience_tables/slow_growth_rate.s"
@ TODO: find out if these copies are used
	.include "data/experience_tables/medium_fast_growth_rate.s"
	.include "data/experience_tables/medium_fast_growth_rate.s"
