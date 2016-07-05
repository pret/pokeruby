gRibbonDescriptionPart1_Champion:
	.string "CHAMPION-beating, HALL$"

gRibbonDescriptionPart2_Champion:
	.string "OF FAME Member RIBBON$"

gRibbonDescriptionPart1_CoolContest:
	.string "COOL CONTEST$"

gRibbonDescriptionPart1_BeautyContest:
	.string "BEAUTY CONTEST$"

gRibbonDescriptionPart1_CuteContest:
	.string "CUTE CONTEST$"

gRibbonDescriptionPart1_SmartContest:
	.string "SMART CONTEST$"

gRibbonDescriptionPart1_ToughContest:
	.string "TOUGH CONTEST$"

gRibbonDescriptionPart2_NormalRank:
	.string "Normal Rank winner!$"

gRibbonDescriptionPart2_SuperRank:
	.string "Super Rank winner!$"

gRibbonDescriptionPart2_HyperRank:
	.string "Hyper Rank winner!$"

gRibbonDescriptionPart2_MasterRank:
	.string "Master Rank winner!$"

gRibbonDescriptionPart1_Winning:
	.string "RIBBON for clearing LV50$"

gRibbonDescriptionPart2_Winning:
	.string "at the BATTLE TOWER.$"

gRibbonDescriptionPart1_Victory:
	.string "Won for clearing LV100$"

gRibbonDescriptionPart2_Victory:
	.string "at the BATTLE TOWER.$"

gRibbonDescriptionPart1_Artist:
	.string "RIBBON for being chosen$"

gRibbonDescriptionPart2_Artist:
	.string "as a super sketch model.$"

gRibbonDescriptionPart1_Effort:
	.string "RIBBON awarded for$"

gRibbonDescriptionPart2_Effort:
	.string "being a hard worker.$"

	.align 2
gRibbonDescriptions:: @ 83E113C
	.4byte gRibbonDescriptionPart1_Champion,      gRibbonDescriptionPart2_Champion
	.4byte gRibbonDescriptionPart1_CoolContest,   gRibbonDescriptionPart2_NormalRank
	.4byte gRibbonDescriptionPart1_CoolContest,   gRibbonDescriptionPart2_SuperRank
	.4byte gRibbonDescriptionPart1_CoolContest,   gRibbonDescriptionPart2_HyperRank
	.4byte gRibbonDescriptionPart1_CoolContest,   gRibbonDescriptionPart2_MasterRank
	.4byte gRibbonDescriptionPart1_BeautyContest, gRibbonDescriptionPart2_NormalRank
	.4byte gRibbonDescriptionPart1_BeautyContest, gRibbonDescriptionPart2_SuperRank
	.4byte gRibbonDescriptionPart1_BeautyContest, gRibbonDescriptionPart2_HyperRank
	.4byte gRibbonDescriptionPart1_BeautyContest, gRibbonDescriptionPart2_MasterRank
	.4byte gRibbonDescriptionPart1_CuteContest,   gRibbonDescriptionPart2_NormalRank
	.4byte gRibbonDescriptionPart1_CuteContest,   gRibbonDescriptionPart2_SuperRank
	.4byte gRibbonDescriptionPart1_CuteContest,   gRibbonDescriptionPart2_HyperRank
	.4byte gRibbonDescriptionPart1_CuteContest,   gRibbonDescriptionPart2_MasterRank
	.4byte gRibbonDescriptionPart1_SmartContest,  gRibbonDescriptionPart2_NormalRank
	.4byte gRibbonDescriptionPart1_SmartContest,  gRibbonDescriptionPart2_SuperRank
	.4byte gRibbonDescriptionPart1_SmartContest,  gRibbonDescriptionPart2_HyperRank
	.4byte gRibbonDescriptionPart1_SmartContest,  gRibbonDescriptionPart2_MasterRank
	.4byte gRibbonDescriptionPart1_ToughContest,  gRibbonDescriptionPart2_NormalRank
	.4byte gRibbonDescriptionPart1_ToughContest,  gRibbonDescriptionPart2_SuperRank
	.4byte gRibbonDescriptionPart1_ToughContest,  gRibbonDescriptionPart2_HyperRank
	.4byte gRibbonDescriptionPart1_ToughContest,  gRibbonDescriptionPart2_MasterRank
	.4byte gRibbonDescriptionPart1_Winning,       gRibbonDescriptionPart2_Winning
	.4byte gRibbonDescriptionPart1_Victory,       gRibbonDescriptionPart2_Victory
	.4byte gRibbonDescriptionPart1_Artist,        gRibbonDescriptionPart2_Artist
	.4byte gRibbonDescriptionPart1_Effort,        gRibbonDescriptionPart2_Effort
