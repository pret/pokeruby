const struct Trainer gTrainers[] = {
    [TRAINER_NONE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_1,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x0,
        .partySize = 0,
        .party = {.NoItemDefaultMoves = NULL }
    },

    [TRAINER_ARCHIE_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AQUA_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_ARCHIE,
        .trainerName = _("ARCHIE"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Archie1 }
    },

    [TRAINER_GRUNT_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt1 }
    },

    [TRAINER_GRUNT_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt2 }
    },

    [TRAINER_GRUNT_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt3 }
    },

    [TRAINER_GRUNT_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt4 }
    },

    [TRAINER_GRUNT_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt5 }
    },

    [TRAINER_GRUNT_6] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt6 }
    },

    [TRAINER_GRUNT_7] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt7 }
    },

    [TRAINER_GRUNT_8] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt8 }
    },

    [TRAINER_GRUNT_9] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt9 }
    },

    [TRAINER_GRUNT_10] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt10 }
    },

    [TRAINER_GRUNT_11] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt11 }
    },

    [TRAINER_GRUNT_12] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt12 }
    },

    [TRAINER_GRUNT_13] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt13 }
    },

    [TRAINER_GRUNT_14] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt14 }
    },

    [TRAINER_GRUNT_15] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt15 }
    },

    [TRAINER_GRUNT_16] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt16 }
    },

    [TRAINER_GRUNT_17] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt17 }
    },

    [TRAINER_GRUNT_18] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt18 }
    },

    [TRAINER_GRUNT_19] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt19 }
    },

    [TRAINER_GRUNT_20] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt20 }
    },

    [TRAINER_GRUNT_21] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt21 }
    },

    [TRAINER_GRUNT_22] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt22 }
    },

    [TRAINER_GRUNT_23] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt23 }
    },

    [TRAINER_GRUNT_24] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt24 }
    },

    [TRAINER_GRUNT_25] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_F,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt25 }
    },

    [TRAINER_GRUNT_26] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_F,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt26 }
    },

    [TRAINER_GRUNT_27] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_AQUA,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_GRUNT_F,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt27 }
    },

    [TRAINER_ANONYMOUS_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AQUA_ADMIN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_ADMIN_M,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Anonymous1 }
    },

    [TRAINER_MATT_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AQUA_ADMIN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_ADMIN_M,
        .trainerName = _("MATT"),
        .items = {ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Matt1 }
    },

    [TRAINER_MATT_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AQUA_ADMIN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_ADMIN_M,
        .trainerName = _("MATT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Matt2 }
    },

    [TRAINER_SHELLY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AQUA_ADMIN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_ADMIN_F,
        .trainerName = _("SHELLY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Shelly1 }
    },

    [TRAINER_SHELLY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AQUA_ADMIN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_AQUA_ADMIN_F,
        .trainerName = _("SHELLY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Shelly2 }
    },

    [TRAINER_ARCHIE_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AQUA_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_ARCHIE,
        .trainerName = _("ARCHIE"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Archie2 }
    },

    [TRAINER_ARCHIE_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AQUA_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_AQUA,
        .trainerPic = TRAINER_PIC_ARCHIE,
        .trainerName = _("ARCHIE"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Archie3 }
    },

    [TRAINER_DAISY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AROMA_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_AROMA_LADY,
        .trainerName = _("DAISY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Daisy }
    },

    [TRAINER_ROSE_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AROMA_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_AROMA_LADY,
        .trainerName = _("ROSE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Rose1 }
    },

    [TRAINER_LILY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AROMA_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_AROMA_LADY,
        .trainerName = _("LILY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Lily }
    },

    [TRAINER_VIOLET] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AROMA_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_AROMA_LADY,
        .trainerName = _("VIOLET"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Violet }
    },

    [TRAINER_ROSE_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AROMA_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_AROMA_LADY,
        .trainerName = _("ROSE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Rose2 }
    },

    [TRAINER_ROSE_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AROMA_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_AROMA_LADY,
        .trainerName = _("ROSE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Rose3 }
    },

    [TRAINER_ROSE_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AROMA_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_AROMA_LADY,
        .trainerName = _("ROSE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Rose4 }
    },

    [TRAINER_ROSE_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_AROMA_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_AROMA_LADY,
        .trainerName = _("ROSE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Rose5 }
    },

    [TRAINER_DUSTY_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_RUIN_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_RUIN_MANIAC,
        .trainerName = _("DUSTY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Dusty1 }
    },

    [TRAINER_CHIP] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_RUIN_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_RUIN_MANIAC,
        .trainerName = _("CHIP"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemCustomMoves = gTrainerParty_Chip }
    },

    [TRAINER_FOSTER] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_RUIN_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_RUIN_MANIAC,
        .trainerName = _("FOSTER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_Foster }
    },

    [TRAINER_DUSTY_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_RUIN_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_RUIN_MANIAC,
        .trainerName = _("DUSTY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Dusty2 }
    },

    [TRAINER_DUSTY_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_RUIN_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_RUIN_MANIAC,
        .trainerName = _("DUSTY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Dusty3 }
    },

    [TRAINER_DUSTY_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_RUIN_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_RUIN_MANIAC,
        .trainerName = _("DUSTY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Dusty4 }
    },

    [TRAINER_DUSTY_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_RUIN_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_RUIN_MANIAC,
        .trainerName = _("DUSTY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Dusty5 }
    },

    [TRAINER_GABBY_AND_TY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_INTERVIEWER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTERVIEWER,
        .trainerPic = TRAINER_PIC_INTERVIEWER,
        .trainerName = _("GABBY & TY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_GabbyAndTy1 }
    },

    [TRAINER_GABBY_AND_TY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_INTERVIEWER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTERVIEWER,
        .trainerPic = TRAINER_PIC_INTERVIEWER,
        .trainerName = _("GABBY & TY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_GabbyAndTy2 }
    },

    [TRAINER_GABBY_AND_TY_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_INTERVIEWER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTERVIEWER,
        .trainerPic = TRAINER_PIC_INTERVIEWER,
        .trainerName = _("GABBY & TY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_GabbyAndTy3 }
    },

    [TRAINER_GABBY_AND_TY_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_INTERVIEWER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTERVIEWER,
        .trainerPic = TRAINER_PIC_INTERVIEWER,
        .trainerName = _("GABBY & TY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_GabbyAndTy4 }
    },

    [TRAINER_GABBY_AND_TY_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_INTERVIEWER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTERVIEWER,
        .trainerPic = TRAINER_PIC_INTERVIEWER,
        .trainerName = _("GABBY & TY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_GabbyAndTy5 }
    },

    [TRAINER_GABBY_AND_TY_6] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_INTERVIEWER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTERVIEWER,
        .trainerPic = TRAINER_PIC_INTERVIEWER,
        .trainerName = _("GABBY & TY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_GabbyAndTy6 }
    },

    [TRAINER_LOLA_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TUBER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_F,
        .trainerName = _("LOLA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Lola1 }
    },

    [TRAINER_CARMEN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TUBER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_F,
        .trainerName = _("CARMEN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Carmen }
    },

    [TRAINER_GWEN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TUBER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_F,
        .trainerName = _("GWEN "),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Gwen }
    },

    [TRAINER_LOLA_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TUBER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_F,
        .trainerName = _("LOLA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Lola2 }
    },

    [TRAINER_LOLA_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TUBER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_F,
        .trainerName = _("LOLA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Lola3 }
    },

    [TRAINER_LOLA_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TUBER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_F,
        .trainerName = _("LOLA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Lola4 }
    },

    [TRAINER_LOLA_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TUBER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_F,
        .trainerName = _("LOLA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Lola5 }
    },

    [TRAINER_RICKY_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_TUBER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_M,
        .trainerName = _("RICKY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Ricky1 }
    },

    [TRAINER_SIMON] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TUBER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_M,
        .trainerName = _("SIMON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Simon }
    },

    [TRAINER_CHARLIE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TUBER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_M,
        .trainerName = _("CHARLIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Charlie }
    },

    [TRAINER_RICKY_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_TUBER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_M,
        .trainerName = _("RICKY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Ricky2 }
    },

    [TRAINER_RICKY_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_TUBER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_M,
        .trainerName = _("RICKY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Ricky3 }
    },

    [TRAINER_RICKY_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_TUBER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_M,
        .trainerName = _("RICKY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Ricky4 }
    },

    [TRAINER_RICKY_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_TUBER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_TUBER_M,
        .trainerName = _("RICKY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Ricky5 }
    },

    [TRAINER_RANDALL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("RANDALL"),
        .items = {ITEM_X_SPEED, ITEM_X_SPEED, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Randall }
    },

    [TRAINER_PARKER] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("PARKER"),
        .items = {ITEM_GUARD_SPEC, ITEM_GUARD_SPEC, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Parker }
    },

    [TRAINER_GEORGE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("GEORGE"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_George }
    },

    [TRAINER_BERKE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("BERKE"),
        .items = {ITEM_DIRE_HIT, ITEM_DIRE_HIT, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Berke }
    },

    [TRAINER_CLYDE] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("CLYDE"),
        .items = {ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = {.NoItemCustomMoves = gTrainerParty_Clyde }
    },

    [TRAINER_VINCENT] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("VINCENT"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Vincent }
    },

    [TRAINER_LEROY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("LEROY"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Leroy }
    },

    [TRAINER_WILTON_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("WILTON"),
        .items = {ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Wilton1 }
    },

    [TRAINER_EDGAR] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("EDGAR"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Edgar }
    },

    [TRAINER_ALBERT] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("ALBERT"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Albert }
    },

    [TRAINER_SAMUEL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("SAMUEL"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Samuel }
    },

    [TRAINER_VITO] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("VITO"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Vito }
    },

    [TRAINER_OWEN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("OWEN"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Owen }
    },

    [TRAINER_WILTON_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("WILTON"),
        .items = {ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Wilton2 }
    },

    [TRAINER_WILTON_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("WILTON"),
        .items = {ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Wilton3 }
    },

    [TRAINER_WILTON_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("WILTON"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Wilton4 }
    },

    [TRAINER_WILTON_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("WILTON"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Wilton5 }
    },

    [TRAINER_WARREN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("WARREN"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Warren }
    },

    [TRAINER_MARY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("MARY"),
        .items = {ITEM_X_ACCURACY, ITEM_X_ACCURACY, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Mary }
    },

    [TRAINER_LORI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("LORI"),
        .items = {ITEM_X_DEFEND, ITEM_X_DEFEND, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Lori }
    },

    [TRAINER_JODY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("JODY"),
        .items = {ITEM_X_ATTACK, ITEM_X_ATTACK, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jody }
    },

    [TRAINER_WENDY] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("WENDY"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 3,
        .party = {.NoItemCustomMoves = gTrainerParty_Wendy }
    },

    [TRAINER_ELAINE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("ELAINE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Elaine }
    },

    [TRAINER_BROOKE_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("BROOKE"),
        .items = {ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brooke1 }
    },

    [TRAINER_JENNIFER] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("JENNIFER"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jennifer }
    },

    [TRAINER_HOPE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("HOPE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Hope }
    },

    [TRAINER_SHANNON] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("SHANNON"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Shannon }
    },

    [TRAINER_MICHELLE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("MICHELLE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Michelle }
    },

    [TRAINER_CAROLINE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("CAROLINE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Caroline }
    },

    [TRAINER_JULIE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("JULIE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Julie }
    },

    [TRAINER_BROOKE_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("BROOKE"),
        .items = {ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brooke2 }
    },

    [TRAINER_BROOKE_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("BROOKE"),
        .items = {ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brooke3 }
    },

    [TRAINER_BROOKE_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("BROOKE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brooke4 }
    },

    [TRAINER_BROOKE_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("BROOKE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brooke5 }
    },

    [TRAINER_PATRICIA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HEX_MANIAC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_HEX_MANIAC,
        .trainerName = _("PATRICIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Patricia }
    },

    [TRAINER_KINDRA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HEX_MANIAC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_HEX_MANIAC,
        .trainerName = _("KINDRA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Kindra }
    },

    [TRAINER_TAMMY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HEX_MANIAC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_HEX_MANIAC,
        .trainerName = _("TAMMY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tammy }
    },

    [TRAINER_VALERIE_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HEX_MANIAC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_HEX_MANIAC,
        .trainerName = _("VALERIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Valerie1 }
    },

    [TRAINER_TASHA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HEX_MANIAC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_HEX_MANIAC,
        .trainerName = _("TASHA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tasha }
    },

    [TRAINER_VALERIE_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HEX_MANIAC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_HEX_MANIAC,
        .trainerName = _("VALERIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Valerie2 }
    },

    [TRAINER_VALERIE_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HEX_MANIAC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_HEX_MANIAC,
        .trainerName = _("VALERIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Valerie3 }
    },

    [TRAINER_VALERIE_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HEX_MANIAC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_HEX_MANIAC,
        .trainerName = _("VALERIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Valerie4 }
    },

    [TRAINER_VALERIE_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HEX_MANIAC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_HEX_MANIAC,
        .trainerName = _("VALERIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Valerie5 }
    },

    [TRAINER_CINDY_1] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _("CINDY"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemDefaultMoves = gTrainerParty_Cindy1 }
    },

    [TRAINER_ANONYMOUS_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _(""),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Anonymous2 }
    },

    [TRAINER_BRIANNA_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _("BRIANNA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_Brianna1 }
    },

    [TRAINER_CINDY_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _("CINDY"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Cindy2 }
    },

    [TRAINER_BRIANNA_2] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _("BRIANNA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemDefaultMoves = gTrainerParty_Brianna2 }
    },

    [TRAINER_ANETTE] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _("ANETTE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemDefaultMoves = gTrainerParty_Anette }
    },

    [TRAINER_CINDY_3] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _("CINDY"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemDefaultMoves = gTrainerParty_Cindy3 }
    },

    [TRAINER_CINDY_4] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _("CINDY"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemDefaultMoves = gTrainerParty_Cindy4 }
    },

    [TRAINER_CINDY_5] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _("CINDY"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemDefaultMoves = gTrainerParty_Cindy5 }
    },

    [TRAINER_CINDY_6] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LADY,
        .trainerName = _("CINDY"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemCustomMoves = gTrainerParty_Cindy6 }
    },

    [TRAINER_MELISSA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("MELISSA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Melissa }
    },

    [TRAINER_SHEILA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("SHEILA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Sheila }
    },

    [TRAINER_SHIRLEY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("SHIRLEY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Shirley }
    },

    [TRAINER_JESSICA_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("JESSICA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_Jessica1 }
    },

    [TRAINER_CONNIE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("CONNIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Connie }
    },

    [TRAINER_BRIDGET] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("BRIDGET"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Bridget }
    },

    [TRAINER_OLIVIA] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("OLIVIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Olivia }
    },

    [TRAINER_TIFFANY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("TIFFANY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tiffany }
    },

    [TRAINER_JESSICA_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("JESSICA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_Jessica2 }
    },

    [TRAINER_JESSICA_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("JESSICA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_Jessica3 }
    },

    [TRAINER_JESSICA_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("JESSICA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_Jessica4 }
    },

    [TRAINER_JESSICA_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("JESSICA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_Jessica5 }
    },

    [TRAINER_WINSTON_1] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_RICH_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_RICH_BOY,
        .trainerName = _("WINSTON"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemDefaultMoves = gTrainerParty_Winston1 }
    },

    [TRAINER_ANONYMOUS_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_RICH_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_RICH_BOY,
        .trainerName = _(""),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Anonymous3 }
    },

    [TRAINER_GARRET] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_RICH_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_RICH_BOY,
        .trainerName = _("GARRET"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemDefaultMoves = gTrainerParty_Garret }
    },

    [TRAINER_WINSTON_2] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_RICH_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_RICH_BOY,
        .trainerName = _("WINSTON"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemDefaultMoves = gTrainerParty_Winston2 }
    },

    [TRAINER_WINSTON_3] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_RICH_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_RICH_BOY,
        .trainerName = _("WINSTON"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemDefaultMoves = gTrainerParty_Winston3 }
    },

    [TRAINER_WINSTON_4] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_RICH_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_RICH_BOY,
        .trainerName = _("WINSTON"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemDefaultMoves = gTrainerParty_Winston4 }
    },

    [TRAINER_WINSTON_5] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_RICH_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_RICH_BOY,
        .trainerName = _("WINSTON"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemCustomMoves = gTrainerParty_Winston5 }
    },

    [TRAINER_STEVE_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_POKEMANIAC,
        .trainerName = _("STEVE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Steve1 }
    },

    [TRAINER_CHRIS] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_POKEMANIAC,
        .trainerName = _("CHRIS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Chris }
    },

    [TRAINER_MARK] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_POKEMANIAC,
        .trainerName = _("MARK"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Mark }
    },

    [TRAINER_KENN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_POKEMANIAC,
        .trainerName = _("KENN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Kenn }
    },

    [TRAINER_STEVE_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_POKEMANIAC,
        .trainerName = _("STEVE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Steve2 }
    },

    [TRAINER_STEVE_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_POKEMANIAC,
        .trainerName = _("STEVE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Steve3 }
    },

    [TRAINER_STEVE_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_POKEMANIAC,
        .trainerName = _("STEVE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Steve4 }
    },

    [TRAINER_STEVE_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_POKEMANIAC,
        .trainerName = _("STEVE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Steve5 }
    },

    [TRAINER_LUIS] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("LUIS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Luis }
    },

    [TRAINER_AUSTIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("AUSTIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Austin }
    },

    [TRAINER_DOUGLAS] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("DOUGLAS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Douglas }
    },

    [TRAINER_DARRIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("DARRIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Darrin }
    },

    [TRAINER_TONY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("TONY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tony1 }
    },

    [TRAINER_JEROME] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("JEROME"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jerome }
    },

    [TRAINER_MATTHEW] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("MATTHEW"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Matthew }
    },

    [TRAINER_DAVID] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("DAVID"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_David }
    },

    [TRAINER_SPENCER] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("SPENCER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Spencer }
    },

    [TRAINER_ROLAND] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("ROLAND"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Roland }
    },

    [TRAINER_CODY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("CODY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Cody }
    },

    [TRAINER_STAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("STAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Stan }
    },

    [TRAINER_BARRY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("BARRY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Barry }
    },

    [TRAINER_DEAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("DEAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Dean }
    },

    [TRAINER_RODNEY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("RODNEY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Rodney }
    },

    [TRAINER_RICHARD] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("RICHARD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Richard }
    },

    [TRAINER_HERMAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("HERMAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Herman }
    },

    [TRAINER_ANONYMOUS_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Anonymous4 }
    },

    [TRAINER_GILBERT] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("GILBERT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Gilbert }
    },

    [TRAINER_FRANKLIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("FRANKLIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Franklin }
    },

    [TRAINER_DANNY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("DANNY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Danny }
    },

    [TRAINER_JACK] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("JACK"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jack }
    },

    [TRAINER_DUDLEY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("DUDLEY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Dudley }
    },

    [TRAINER_CHAD] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("CHAD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Chad }
    },

    [TRAINER_TONY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("TONY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tony2 }
    },

    [TRAINER_TONY_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("TONY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tony3 }
    },

    [TRAINER_TONY_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("TONY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tony4 }
    },

    [TRAINER_TONY_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("TONY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tony5 }
    },

    [TRAINER_HIDEKI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("HIDEKI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Hideki }
    },

    [TRAINER_HITOSHI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("HITOSHI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Hitoshi }
    },

    [TRAINER_KIYO] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("KIYO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Kiyo }
    },

    [TRAINER_KOICHI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("KOICHI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Koichi }
    },

    [TRAINER_NOB_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("NOB"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Nob1 }
    },

    [TRAINER_NOB_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("NOB"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Nob2 }
    },

    [TRAINER_NOB_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("NOB"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Nob3 }
    },

    [TRAINER_NOB_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("NOB"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Nob4 }
    },

    [TRAINER_NOB_5] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("NOB"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.ItemDefaultMoves = gTrainerParty_Nob5 }
    },

    [TRAINER_YUJI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("YUJI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Yuji }
    },

    [TRAINER_DAISUKE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("DAISUKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Daisuke }
    },

    [TRAINER_ATSUSHI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("ATSUSHI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Atsushi }
    },

    [TRAINER_KIRK] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("KIRK"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Kirk }
    },

    [TRAINER_SCOTT] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("SCOTT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Scott }
    },

    [TRAINER_HARVEY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("HARVEY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Harvey }
    },

    [TRAINER_SHAWN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("SHAWN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Shawn }
    },

    [TRAINER_RANDY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("RANDY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Randy }
    },

    [TRAINER_DALTON_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("DALTON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Dalton1 }
    },

    [TRAINER_DALTON_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("DALTON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Dalton2 }
    },

    [TRAINER_DALTON_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("DALTON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Dalton3 }
    },

    [TRAINER_DALTON_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("DALTON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Dalton4 }
    },

    [TRAINER_DALTON_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GUITARIST,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_GUITARIST,
        .trainerName = _("DALTON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Dalton5 }
    },

    [TRAINER_COLE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("COLE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Cole }
    },

    [TRAINER_FLINT] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("FLINT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Flint }
    },

    [TRAINER_AXLE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("AXLE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Axle }
    },

    [TRAINER_JAKE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("JAKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jake }
    },

    [TRAINER_ANDY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("ANDY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Andy }
    },

    [TRAINER_BERNIE_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("BERNIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Bernie1 }
    },

    [TRAINER_BERNIE_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("BERNIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Bernie2 }
    },

    [TRAINER_BERNIE_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("BERNIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Bernie3 }
    },

    [TRAINER_BERNIE_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("BERNIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Bernie4 }
    },

    [TRAINER_BERNIE_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_KINDLER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_KINDLER,
        .trainerName = _("BERNIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Bernie5 }
    },

    [TRAINER_DREW] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("DREW"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Drew }
    },

    [TRAINER_CLIFF] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("CLIFF"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemCustomMoves = gTrainerParty_Cliff }
    },

    [TRAINER_LARRY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("LARRY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Larry }
    },

    [TRAINER_SHANE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("SHANE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Shane }
    },

    [TRAINER_JUSTIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("JUSTIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Justin }
    },

    [TRAINER_ETHAN_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("ETHAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Ethan1 }
    },

    [TRAINER_JEFF] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("JEFF"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jeff }
    },

    [TRAINER_TRAVIS] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("TRAVIS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Travis }
    },

    [TRAINER_ETHAN_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("ETHAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Ethan2 }
    },

    [TRAINER_ETHAN_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("ETHAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Ethan3 }
    },

    [TRAINER_ETHAN_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("ETHAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Ethan4 }
    },

    [TRAINER_ETHAN_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("ETHAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Ethan5 }
    },

    [TRAINER_BRENT] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_BUG_MANIAC,
        .trainerName = _("BRENT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brent }
    },

    [TRAINER_DONALD] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_BUG_MANIAC,
        .trainerName = _("DONALD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Donald }
    },

    [TRAINER_TAYLOR] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_BUG_MANIAC,
        .trainerName = _("TAYLOR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Taylor }
    },

    [TRAINER_BRANDON_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_BUG_MANIAC,
        .trainerName = _("BRANDON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brandon1 }
    },

    [TRAINER_DEREK] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_BUG_MANIAC,
        .trainerName = _("DEREK"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Derek }
    },

    [TRAINER_BRANDON_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_BUG_MANIAC,
        .trainerName = _("BRANDON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brandon2 }
    },

    [TRAINER_BRANDON_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_BUG_MANIAC,
        .trainerName = _("BRANDON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brandon3 }
    },

    [TRAINER_BRANDON_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_BUG_MANIAC,
        .trainerName = _("BRANDON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brandon4 }
    },

    [TRAINER_BRANDON_5] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_BUG_MANIAC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_BUG_MANIAC,
        .trainerName = _("BRANDON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 5,
        .party = {.ItemDefaultMoves = gTrainerParty_Brandon5 }
    },

    [TRAINER_EDWARD] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("EDWARD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Edward }
    },

    [TRAINER_PRESTON] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("PRESTON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Preston }
    },

    [TRAINER_VIRGIL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("VIRGIL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Virgil }
    },

    [TRAINER_FRITZ] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("FRITZ"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Fritz }
    },

    [TRAINER_WILLIAM] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("WILLIAM"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_William }
    },

    [TRAINER_JOSHUA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("JOSHUA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Joshua }
    },

    [TRAINER_CAMERON_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("CAMERON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Cameron1 }
    },

    [TRAINER_CAMERON_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("CAMERON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Cameron2 }
    },

    [TRAINER_CAMERON_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("CAMERON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Cameron3 }
    },

    [TRAINER_CAMERON_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("CAMERON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Cameron4 }
    },

    [TRAINER_CAMERON_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_M,
        .trainerName = _("CAMERON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Cameron5 }
    },

    [TRAINER_JACLYN] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("JACLYN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Jaclyn }
    },

    [TRAINER_HANNAH] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("HANNAH"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Hannah }
    },

    [TRAINER_SAMANTHA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("SAMANTHA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Samantha }
    },

    [TRAINER_MAURA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("MAURA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Maura }
    },

    [TRAINER_KAYLA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("KAYLA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Kayla }
    },

    [TRAINER_ALEXIS] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("ALEXIS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Alexis }
    },

    [TRAINER_JACKI_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("JACKI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jacki1 }
    },

    [TRAINER_JACKI_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("JACKI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jacki2 }
    },

    [TRAINER_JACKI_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("JACKI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jacki3 }
    },

    [TRAINER_JACKI_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("JACKI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jacki4 }
    },

    [TRAINER_JACKI_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PSYCHIC,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_PSYCHIC_F,
        .trainerName = _("JACKI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jacki5 }
    },

    [TRAINER_WALTER_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GENTLEMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_GENTLEMAN,
        .trainerName = _("WALTER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Walter1 }
    },

    [TRAINER_TUCKER] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GENTLEMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_GENTLEMAN,
        .trainerName = _("TUCKER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tucker }
    },

    [TRAINER_THOMAS] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GENTLEMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_GENTLEMAN,
        .trainerName = _("THOMAS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Thomas }
    },

    [TRAINER_WALTER_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_GENTLEMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_GENTLEMAN,
        .trainerName = _("WALTER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Walter2 }
    },

    [TRAINER_WALTER_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_GENTLEMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_GENTLEMAN,
        .trainerName = _("WALTER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_Walter3 }
    },

    [TRAINER_WALTER_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_GENTLEMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_GENTLEMAN,
        .trainerName = _("WALTER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_Walter4 }
    },

    [TRAINER_WALTER_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_GENTLEMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_RICH,
        .trainerPic = TRAINER_PIC_GENTLEMAN,
        .trainerName = _("WALTER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemCustomMoves = gTrainerParty_Walter5 }
    },

    [TRAINER_SIDNEY] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_ELITE_FOUR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_ELITE_FOUR,
        .trainerPic = TRAINER_PIC_SIDNEY,
        .trainerName = _("SIDNEY"),
        .items = {ITEM_FULL_RESTORE, ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = {.ItemCustomMoves = gTrainerParty_Sidney }
    },

    [TRAINER_PHOEBE] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_ELITE_FOUR,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_ELITE_FOUR,
        .trainerPic = TRAINER_PIC_PHOEBE,
        .trainerName = _("PHOEBE"),
        .items = {ITEM_FULL_RESTORE, ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = {.ItemCustomMoves = gTrainerParty_Phoebe }
    },

    [TRAINER_GLACIA] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_ELITE_FOUR,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_ELITE_FOUR,
        .trainerPic = TRAINER_PIC_GLACIA,
        .trainerName = _("GLACIA"),
        .items = {ITEM_FULL_RESTORE, ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = {.ItemCustomMoves = gTrainerParty_Glacia }
    },

    [TRAINER_DRAKE] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_ELITE_FOUR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_ELITE_FOUR,
        .trainerPic = TRAINER_PIC_DRAKE,
        .trainerName = _("DRAKE"),
        .items = {ITEM_FULL_RESTORE, ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = {.ItemCustomMoves = gTrainerParty_Drake }
    },

    [TRAINER_ROXANNE] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LEADER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_ROXANNE,
        .trainerName = _("ROXANNE"),
        .items = {ITEM_POTION, ITEM_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_Roxanne }
    },

    [TRAINER_BRAWLY] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRAWLY,
        .trainerName = _("BRAWLY"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_Brawly }
    },

    [TRAINER_WATTSON] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_WATTSON,
        .trainerName = _("WATTSON"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemCustomMoves = gTrainerParty_Wattson }
    },

    [TRAINER_FLANNERY] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LEADER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_FLANNERY,
        .trainerName = _("FLANNERY"),
        .items = {ITEM_HYPER_POTION, ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemCustomMoves = gTrainerParty_Flannery }
    },

    [TRAINER_NORMAN] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_NORMAN,
        .trainerName = _("NORMAN"),
        .items = {ITEM_HYPER_POTION, ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemCustomMoves = gTrainerParty_Norman }
    },

    [TRAINER_WINONA] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LEADER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_WINONA,
        .trainerName = _("WINONA"),
        .items = {ITEM_HYPER_POTION, ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 4,
        .party = {.NoItemCustomMoves = gTrainerParty_Winona }
    },

    [TRAINER_TATE_AND_LIZA] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_TATE_AND_LIZA,
        .trainerName = _("TATE&LIZA"),
        .items = {ITEM_HYPER_POTION, ITEM_HYPER_POTION, ITEM_HYPER_POTION, ITEM_HYPER_POTION},
        .doubleBattle = TRUE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.ItemCustomMoves = gTrainerParty_TateAndLiza }
    },

    [TRAINER_WALLACE] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_WALLACE,
        .trainerName = _("WALLACE"),
        .items = {ITEM_HYPER_POTION, ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = {.NoItemCustomMoves = gTrainerParty_Wallace }
    },

    [TRAINER_JERRY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_M,
        .trainerName = _("JERRY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jerry1 }
    },

    [TRAINER_TED] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_M,
        .trainerName = _("TED"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Ted }
    },

    [TRAINER_PAUL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_M,
        .trainerName = _("PAUL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Paul }
    },

    [TRAINER_JERRY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_M,
        .trainerName = _("JERRY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jerry2 }
    },

    [TRAINER_JERRY_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_M,
        .trainerName = _("JERRY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jerry3 }
    },

    [TRAINER_JERRY_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_M,
        .trainerName = _("JERRY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jerry4 }
    },

    [TRAINER_JERRY_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_M,
        .trainerName = _("JERRY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jerry5 }
    },

    [TRAINER_KAREN_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_F,
        .trainerName = _("KAREN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Karen1 }
    },

    [TRAINER_GEORGIA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_F,
        .trainerName = _("GEORGIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Georgia }
    },

    [TRAINER_KAREN_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_F,
        .trainerName = _("KAREN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Karen2 }
    },

    [TRAINER_KAREN_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_F,
        .trainerName = _("KAREN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Karen3 }
    },

    [TRAINER_KAREN_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_F,
        .trainerName = _("KAREN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Karen4 }
    },

    [TRAINER_KAREN_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SCHOOL_KID,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_SCHOOL_KID_F,
        .trainerName = _("KAREN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Karen5 }
    },

    [TRAINER_KATE_AND_JOY] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_SR_AND_JR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_SR_AND_JR,
        .trainerName = _("KATE & JOY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_KateAndJoy }
    },

    [TRAINER_ANNA_AND_MEG_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_SR_AND_JR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_SR_AND_JR,
        .trainerName = _("ANNA & MEG"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_AnnaAndMeg1 }
    },

    [TRAINER_ANNA_AND_MEG_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_SR_AND_JR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_SR_AND_JR,
        .trainerName = _("ANNA & MEG"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_AnnaAndMeg2 }
    },

    [TRAINER_ANNA_AND_MEG_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_SR_AND_JR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_SR_AND_JR,
        .trainerName = _("ANNA & MEG"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_AnnaAndMeg3 }
    },

    [TRAINER_ANNA_AND_MEG_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_SR_AND_JR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_SR_AND_JR,
        .trainerName = _("ANNA & MEG"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_AnnaAndMeg4 }
    },

    [TRAINER_ANNA_AND_MEG_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_SR_AND_JR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_SR_AND_JR,
        .trainerName = _("ANNA & MEG"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_AnnaAndMeg5 }
    },

    [TRAINER_VICTOR] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_WINSTRATE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_M,
        .trainerName = _("VICTOR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.ItemDefaultMoves = gTrainerParty_Victor }
    },

    [TRAINER_MIGUEL_1] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_M,
        .trainerName = _("MIGUEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemDefaultMoves = gTrainerParty_Miguel1 }
    },

    [TRAINER_COLTON] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_M,
        .trainerName = _("COLTON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = {.ItemCustomMoves = gTrainerParty_Colton }
    },

    [TRAINER_MIGUEL_2] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_M,
        .trainerName = _("MIGUEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemDefaultMoves = gTrainerParty_Miguel2 }
    },

    [TRAINER_MIGUEL_3] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_M,
        .trainerName = _("MIGUEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemDefaultMoves = gTrainerParty_Miguel3 }
    },

    [TRAINER_MIGUEL_4] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_M,
        .trainerName = _("MIGUEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemDefaultMoves = gTrainerParty_Miguel4 }
    },

    [TRAINER_MIGUEL_5] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_M,
        .trainerName = _("MIGUEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemDefaultMoves = gTrainerParty_Miguel5 }
    },

    [TRAINER_VICTORIA] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_WINSTRATE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_F,
        .trainerName = _("VICTORIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x3,
        .partySize = 1,
        .party = {.ItemDefaultMoves = gTrainerParty_Victoria }
    },

    [TRAINER_VANESSA] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_F,
        .trainerName = _("VANESSA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.ItemDefaultMoves = gTrainerParty_Vanessa }
    },

    [TRAINER_MARISSA] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_F,
        .trainerName = _("MARISSA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.ItemDefaultMoves = gTrainerParty_Marissa }
    },

    [TRAINER_ISABEL_1] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_F,
        .trainerName = _("ISABEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.ItemDefaultMoves = gTrainerParty_Isabel1 }
    },

    [TRAINER_ISABEL_2] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_F,
        .trainerName = _("ISABEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.ItemDefaultMoves = gTrainerParty_Isabel2 }
    },

    [TRAINER_ISABEL_3] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_F,
        .trainerName = _("ISABEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.ItemDefaultMoves = gTrainerParty_Isabel3 }
    },

    [TRAINER_ISABEL_4] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_F,
        .trainerName = _("ISABEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.ItemDefaultMoves = gTrainerParty_Isabel4 }
    },

    [TRAINER_ISABEL_5] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_POKEFAN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_POKEFAN_F,
        .trainerName = _("ISABEL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.ItemDefaultMoves = gTrainerParty_Isabel5 }
    },

    [TRAINER_TIMOTHY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_M,
        .trainerName = _("TIMOTHY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Timothy1 }
    },

    [TRAINER_TIMOTHY_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_M,
        .trainerName = _("TIMOTHY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Timothy2 }
    },

    [TRAINER_TIMOTHY_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_M,
        .trainerName = _("TIMOTHY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Timothy3 }
    },

    [TRAINER_TIMOTHY_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_M,
        .trainerName = _("TIMOTHY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Timothy4 }
    },

    [TRAINER_TIMOTHY_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_M,
        .trainerName = _("TIMOTHY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Timothy5 }
    },

    [TRAINER_VICKY] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_WINSTRATE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_F,
        .trainerName = _("VICKY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Vicky }
    },

    [TRAINER_SHELBY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_F,
        .trainerName = _("SHELBY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Shelby1 }
    },

    [TRAINER_SHELBY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_F,
        .trainerName = _("SHELBY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Shelby2 }
    },

    [TRAINER_SHELBY_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_F,
        .trainerName = _("SHELBY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Shelby3 }
    },

    [TRAINER_SHELBY_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_F,
        .trainerName = _("SHELBY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Shelby4 }
    },

    [TRAINER_SHELBY_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_EXPERT,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_EXPERT_F,
        .trainerName = _("SHELBY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Shelby5 }
    },

    [TRAINER_CALVIN_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("CALVIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Calvin1 }
    },

    [TRAINER_BILLY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("BILLY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Billy }
    },

    [TRAINER_JOSH] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("JOSH"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemCustomMoves = gTrainerParty_Josh }
    },

    [TRAINER_TOMMY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("TOMMY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tommy }
    },

    [TRAINER_JOEY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("JOEY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Joey }
    },

    [TRAINER_BEN] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("BEN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Ben }
    },

    [TRAINER_ANONYMOUS_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Anonymous5 }
    },

    [TRAINER_KEVIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("KEVIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Kevin }
    },

    [TRAINER_NEAL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("NEAL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Neal }
    },

    [TRAINER_DILLON] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("DILLON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Dillon }
    },

    [TRAINER_CALVIN_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("CALVIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Calvin2 }
    },

    [TRAINER_CALVIN_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("CALVIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Calvin3 }
    },

    [TRAINER_CALVIN_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("CALVIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Calvin4 }
    },

    [TRAINER_CALVIN_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("CALVIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Calvin5 }
    },

    [TRAINER_EDDIE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("EDDIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Eddie }
    },

    [TRAINER_ALLEN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("ALLEN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Allen }
    },

    [TRAINER_TIMMY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNGSTER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("TIMMY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Timmy }
    },

    [TRAINER_STEVEN] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_CHAMPION,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_STEVEN,
        .trainerName = _("STEVEN"),
        .items = {ITEM_FULL_RESTORE, ITEM_FULL_RESTORE, ITEM_FULL_RESTORE, ITEM_FULL_RESTORE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 6,
        .party = {.ItemCustomMoves = gTrainerParty_Steven }
    },

    [TRAINER_ANDREW] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ANDREW"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Andrew }
    },

    [TRAINER_IVAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("IVAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Ivan }
    },

    [TRAINER_CLAUDE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("CLAUDE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Claude }
    },

    [TRAINER_ELLIOT_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ELLIOT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Elliot1 }
    },

    [TRAINER_NED] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("NED"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Ned }
    },

    [TRAINER_DALE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("DALE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Dale }
    },

    [TRAINER_NOLAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("NOLAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Nolan }
    },

    [TRAINER_BARNY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("BARNY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Barny }
    },

    [TRAINER_WADE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("WADE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Wade }
    },

    [TRAINER_CARTER] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("CARTER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Carter }
    },

    [TRAINER_ELLIOT_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ELLIOT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Elliot2 }
    },

    [TRAINER_ELLIOT_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ELLIOT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Elliot3 }
    },

    [TRAINER_ELLIOT_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ELLIOT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Elliot4 }
    },

    [TRAINER_ELLIOT_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ELLIOT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x3,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Elliot5 }
    },

    [TRAINER_RONALD] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("RONALD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = {.NoItemDefaultMoves = gTrainerParty_Ronald }
    },

    [TRAINER_JACOB] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_M,
        .trainerName = _("JACOB"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jacob }
    },

    [TRAINER_ANTHONY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_M,
        .trainerName = _("ANTHONY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Anthony }
    },

    [TRAINER_BENJAMIN_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_M,
        .trainerName = _("BENJAMIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Benjamin1 }
    },

    [TRAINER_BENJAMIN_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_M,
        .trainerName = _("BENJAMIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Benjamin2 }
    },

    [TRAINER_BENJAMIN_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_M,
        .trainerName = _("BENJAMIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Benjamin3 }
    },

    [TRAINER_BENJAMIN_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_M,
        .trainerName = _("BENJAMIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Benjamin4 }
    },

    [TRAINER_BENJAMIN_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_M,
        .trainerName = _("BENJAMIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Benjamin5 }
    },

    [TRAINER_ABIGAIL_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_F,
        .trainerName = _("ABIGAIL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Abigail1 }
    },

    [TRAINER_JASMINE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_F,
        .trainerName = _("JASMINE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jasmine }
    },

    [TRAINER_ABIGAIL_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_F,
        .trainerName = _("ABIGAIL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Abigail2 }
    },

    [TRAINER_ABIGAIL_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_F,
        .trainerName = _("ABIGAIL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Abigail3 }
    },

    [TRAINER_ABIGAIL_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_F,
        .trainerName = _("ABIGAIL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Abigail4 }
    },

    [TRAINER_ABIGAIL_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_CYCLING_TRIATHLETE_F,
        .trainerName = _("ABIGAIL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Abigail5 }
    },

    [TRAINER_DYLAN_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_M,
        .trainerName = _("DYLAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Dylan1 }
    },

    [TRAINER_DYLAN_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_M,
        .trainerName = _("DYLAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Dylan2 }
    },

    [TRAINER_DYLAN_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_M,
        .trainerName = _("DYLAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Dylan3 }
    },

    [TRAINER_DYLAN_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_M,
        .trainerName = _("DYLAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Dylan4 }
    },

    [TRAINER_DYLAN_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_M,
        .trainerName = _("DYLAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Dylan5 }
    },

    [TRAINER_MARIA_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_F,
        .trainerName = _("MARIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Maria1 }
    },

    [TRAINER_MARIA_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_F,
        .trainerName = _("MARIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Maria2 }
    },

    [TRAINER_MARIA_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_F,
        .trainerName = _("MARIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Maria3 }
    },

    [TRAINER_MARIA_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_F,
        .trainerName = _("MARIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Maria4 }
    },

    [TRAINER_MARIA_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_RUNNING_TRIATHLETE_F,
        .trainerName = _("MARIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Maria5 }
    },

    [TRAINER_CALEB] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_M,
        .trainerName = _("CALEB"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Caleb }
    },

    [TRAINER_ANONYMOUS_6] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_M,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Anonymous6 }
    },

    [TRAINER_ISAIAH_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_M,
        .trainerName = _("ISAIAH"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Isaiah1 }
    },

    [TRAINER_ANONYMOUS_7] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_M,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Anonymous7 }
    },

    [TRAINER_CHASE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_M,
        .trainerName = _("CHASE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Chase }
    },

    [TRAINER_ISAIAH_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_M,
        .trainerName = _("ISAIAH"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Isaiah2 }
    },

    [TRAINER_ISAIAH_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_M,
        .trainerName = _("ISAIAH"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Isaiah3 }
    },

    [TRAINER_ISAIAH_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_M,
        .trainerName = _("ISAIAH"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Isaiah4 }
    },

    [TRAINER_ISAIAH_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_M,
        .trainerName = _("ISAIAH"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Isaiah5 }
    },

    [TRAINER_ANONYMOUS_8] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_F,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Anonymous8 }
    },

    [TRAINER_CONNOR] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_F,
        .trainerName = _("CONNOR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Connor }
    },

    [TRAINER_ANONYMOUS_9] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_F,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Anonymous9 }
    },

    [TRAINER_KATELYN_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_F,
        .trainerName = _("KATELYN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Katelyn1 }
    },

    [TRAINER_ALLISON] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_F,
        .trainerName = _("ALLISON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Allison }
    },

    [TRAINER_KATELYN_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_F,
        .trainerName = _("KATELYN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Katelyn2 }
    },

    [TRAINER_KATELYN_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_F,
        .trainerName = _("KATELYN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Katelyn3 }
    },

    [TRAINER_KATELYN_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_F,
        .trainerName = _("KATELYN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Katelyn4 }
    },

    [TRAINER_KATELYN_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TRIATHLETE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMING_TRIATHLETE_F,
        .trainerName = _("KATELYN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Katelyn5 }
    },

    [TRAINER_NICOLAS_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_DRAGON_TAMER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_DRAGON_TAMER,
        .trainerName = _("NICOLAS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Nicolas1 }
    },

    [TRAINER_NICOLAS_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_DRAGON_TAMER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_DRAGON_TAMER,
        .trainerName = _("NICOLAS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Nicolas2 }
    },

    [TRAINER_NICOLAS_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_DRAGON_TAMER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_DRAGON_TAMER,
        .trainerName = _("NICOLAS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Nicolas3 }
    },

    [TRAINER_NICOLAS_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_DRAGON_TAMER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_DRAGON_TAMER,
        .trainerName = _("NICOLAS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Nicolas4 }
    },

    [TRAINER_NICOLAS_5] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM,
        .trainerClass = TRAINER_CLASS_DRAGON_TAMER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_DRAGON_TAMER,
        .trainerName = _("NICOLAS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.ItemDefaultMoves = gTrainerParty_Nicolas5 }
    },

    [TRAINER_AARON] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_DRAGON_TAMER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_DRAGON_TAMER,
        .trainerName = _("AARON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Aaron }
    },

    [TRAINER_PERRY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("PERRY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Perry }
    },

    [TRAINER_HUGH] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("HUGH"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Hugh }
    },

    [TRAINER_PHIL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("PHIL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Phil }
    },

    [TRAINER_JARED] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("JARED"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jared }
    },

    [TRAINER_ANONYMOUS_10] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Anonymous10 }
    },

    [TRAINER_TANNER] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("TANNER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tanner }
    },

    [TRAINER_WILL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("WILL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Will }
    },

    [TRAINER_COLIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("COLIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Colin }
    },

    [TRAINER_ROBERT_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("ROBERT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Robert1 }
    },

    [TRAINER_BENNY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("BENNY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Benny }
    },

    [TRAINER_CHESTER] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("CHESTER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Chester }
    },

    [TRAINER_ROBERT_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("ROBERT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Robert2 }
    },

    [TRAINER_ROBERT_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("ROBERT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Robert3 }
    },

    [TRAINER_ROBERT_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("ROBERT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Robert4 }
    },

    [TRAINER_ROBERT_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("ROBERT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Robert5 }
    },

    [TRAINER_ALEX] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("ALEX"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Alex }
    },

    [TRAINER_BECK] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("BECK"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Beck }
    },

    [TRAINER_YASU] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("YASU"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x3,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Yasu }
    },

    [TRAINER_TAKASHI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("TAKASHI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x3,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Takashi }
    },

    [TRAINER_MAKOTO] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("MAKOTO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x0,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Makoto }
    },

    [TRAINER_HIDEO_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("HIDEO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x0,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Hideo1 }
    },

    [TRAINER_LAO_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("LAO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x0,
        .partySize = 4,
        .party = {.NoItemCustomMoves = gTrainerParty_Lao1 }
    },

    [TRAINER_LUNG] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("LUNG"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x0,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Lung }
    },

    [TRAINER_LAO_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("LAO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x0,
        .partySize = 4,
        .party = {.NoItemCustomMoves = gTrainerParty_Lao2 }
    },

    [TRAINER_LAO_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("LAO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x0,
        .partySize = 4,
        .party = {.NoItemCustomMoves = gTrainerParty_Lao3 }
    },

    [TRAINER_LAO_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("LAO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x0,
        .partySize = 4,
        .party = {.NoItemCustomMoves = gTrainerParty_Lao4 }
    },

    [TRAINER_LAO_5] =
    {
        .partyFlags = F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("LAO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x0,
        .partySize = 4,
        .party = {.ItemCustomMoves = gTrainerParty_Lao5 }
    },

    [TRAINER_TESSA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("TESSA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tessa }
    },

    [TRAINER_LAURA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("LAURA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Laura }
    },

    [TRAINER_CYNDY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("CYNDY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Cyndy1 }
    },

    [TRAINER_CORA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("CORA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Cora }
    },

    [TRAINER_JILL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("JILL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jill }
    },

    [TRAINER_CYNDY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("CYNDY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Cyndy2 }
    },

    [TRAINER_CYNDY_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("CYNDY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Cyndy3 }
    },

    [TRAINER_CYNDY_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("CYNDY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Cyndy4 }
    },

    [TRAINER_CYNDY_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("CYNDY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Cyndy5 }
    },

    [TRAINER_MADELINE_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_PARASOL_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_PARASOL_LADY,
        .trainerName = _("MADELINE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Madeline1 }
    },

    [TRAINER_CLARISSA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PARASOL_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_PARASOL_LADY,
        .trainerName = _("CLARISSA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Clarissa }
    },

    [TRAINER_ANGELICA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PARASOL_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_PARASOL_LADY,
        .trainerName = _("ANGELICA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Angelica }
    },

    [TRAINER_MADELINE_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_PARASOL_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_PARASOL_LADY,
        .trainerName = _("MADELINE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Madeline2 }
    },

    [TRAINER_MADELINE_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_PARASOL_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_PARASOL_LADY,
        .trainerName = _("MADELINE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Madeline3 }
    },

    [TRAINER_MADELINE_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_PARASOL_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_PARASOL_LADY,
        .trainerName = _("MADELINE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_Madeline4 }
    },

    [TRAINER_MADELINE_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_PARASOL_LADY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_PARASOL_LADY,
        .trainerName = _("MADELINE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_Madeline5 }
    },

    [TRAINER_BEVERLY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("BEVERLY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Beverly }
    },

    [TRAINER_DAWN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("DAWN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Dawn }
    },

    [TRAINER_NICOLE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("NICOLE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Nicole }
    },

    [TRAINER_DENISE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("DENISE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Denise }
    },

    [TRAINER_BETH] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("BETH"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Beth }
    },

    [TRAINER_TARA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("TARA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tara }
    },

    [TRAINER_MISSY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("MISSY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Missy }
    },

    [TRAINER_ALICE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("ALICE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Alice }
    },

    [TRAINER_JENNY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("JENNY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jenny1 }
    },

    [TRAINER_GRACE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("GRACE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grace }
    },

    [TRAINER_TANYA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("TANYA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tanya }
    },

    [TRAINER_SHARON] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("SHARON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Sharon }
    },

    [TRAINER_NIKKI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("NIKKI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Nikki }
    },

    [TRAINER_BRENDA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("BRENDA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brenda }
    },

    [TRAINER_KATIE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("KATIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Katie }
    },

    [TRAINER_SUSIE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("SUSIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Susie }
    },

    [TRAINER_KARA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("KARA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Kara }
    },

    [TRAINER_DANA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("DANA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Dana }
    },

    [TRAINER_ERIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("ERIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Erin }
    },

    [TRAINER_DEBRA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("DEBRA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Debra }
    },

    [TRAINER_LINDA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("LINDA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Linda }
    },

    [TRAINER_KAYLEE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("KAYLEE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Kaylee }
    },

    [TRAINER_LAUREL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("LAUREL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Laurel }
    },

    [TRAINER_DARCY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("DARCY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Darcy }
    },

    [TRAINER_JENNY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("JENNY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jenny2 }
    },

    [TRAINER_JENNY_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("JENNY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jenny3 }
    },

    [TRAINER_JENNY_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("JENNY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jenny4 }
    },

    [TRAINER_JENNY_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("JENNY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jenny5 }
    },

    [TRAINER_HEIDI] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("HEIDI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_Heidi }
    },

    [TRAINER_BECKY] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("BECKY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Becky }
    },

    [TRAINER_CAROL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("CAROL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Carol }
    },

    [TRAINER_NANCY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("NANCY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Nancy }
    },

    [TRAINER_MARTHA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("MARTHA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Martha }
    },

    [TRAINER_DIANA_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("DIANA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Diana1 }
    },

    [TRAINER_NINA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("NINA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Nina }
    },

    [TRAINER_IRENE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("IRENE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Irene }
    },

    [TRAINER_DIANA_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("DIANA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Diana2 }
    },

    [TRAINER_DIANA_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("DIANA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Diana3 }
    },

    [TRAINER_DIANA_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("DIANA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Diana4 }
    },

    [TRAINER_DIANA_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("DIANA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Diana5 }
    },

    [TRAINER_AMY_AND_LIV_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("AMY & LIV"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_AmyAndLiv1 }
    },

    [TRAINER_AMY_AND_LIV_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("AMY & LIV"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_AmyAndLiv2 }
    },

    [TRAINER_GINA_AND_MIA_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("GINA & MIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_GinaAndMia1 }
    },

    [TRAINER_MIU_AND_YUKI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("MIU & YUKI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_MiuAndYuki }
    },

    [TRAINER_AMY_AND_LIV_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("AMY & LIV"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_AmyAndLiv3 }
    },

    [TRAINER_GINA_AND_MIA_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("GINA & MIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_GinaAndMia2 }
    },

    [TRAINER_AMY_AND_LIV_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("AMY & LIV"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_AmyAndLiv4 }
    },

    [TRAINER_AMY_AND_LIV_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("AMY & LIV"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_AmyAndLiv5 }
    },

    [TRAINER_AMY_AND_LIV_6] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("AMY & LIV"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_AmyAndLiv6 }
    },

    [TRAINER_HUEY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("HUEY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Huey }
    },

    [TRAINER_EDMOND] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("EDMOND"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Edmond }
    },

    [TRAINER_ERNEST_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("ERNEST"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Ernest1 }
    },

    [TRAINER_DWAYNE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("DWAYNE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Dwayne }
    },

    [TRAINER_PHILLIP] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("PHILLIP"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Phillip }
    },

    [TRAINER_LEONARD] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("LEONARD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Leonard }
    },

    [TRAINER_DUNCAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("DUNCAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Duncan }
    },

    [TRAINER_ERNEST_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("ERNEST"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Ernest2 }
    },

    [TRAINER_ERNEST_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("ERNEST"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Ernest3 }
    },

    [TRAINER_ERNEST_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("ERNEST"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Ernest4 }
    },

    [TRAINER_ERNEST_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SAILOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_SAILOR,
        .trainerName = _("ERNEST"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Ernest5 }
    },

    [TRAINER_ANONYMOUS_11] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Anonymous11 }
    },

    [TRAINER_ANONYMOUS_12] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Anonymous12 }
    },

    [TRAINER_ANONYMOUS_13] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Anonymous13 }
    },

    [TRAINER_SONNY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("SONNY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Sonny }
    },

    [TRAINER_DONOVAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("DONOVAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Donovan }
    },

    [TRAINER_GERALD] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("GERALD"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Gerald }
    },

    [TRAINER_KELVIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("KELVIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Kelvin }
    },

    [TRAINER_KODY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("KODY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Kody }
    },

    [TRAINER_TEVIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("TEVIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tevin }
    },

    [TRAINER_DAMON] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("DAMON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Damon }
    },

    [TRAINER_PABLO] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BOARDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_YOUNGSTER,
        .trainerName = _("PABLO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Pablo }
    },

    [TRAINER_EDWIN_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COLLECTOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_COLLECTOR,
        .trainerName = _("EDWIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Edwin1 }
    },

    [TRAINER_HECTOR_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COLLECTOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_COLLECTOR,
        .trainerName = _("HECTOR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Hector1 }
    },

    [TRAINER_HECTOR_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COLLECTOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_COLLECTOR,
        .trainerName = _("HECTOR"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Hector2 }
    },

    [TRAINER_EDWIN_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COLLECTOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_COLLECTOR,
        .trainerName = _("EDWIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Edwin2 }
    },

    [TRAINER_EDWIN_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COLLECTOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_COLLECTOR,
        .trainerName = _("EDWIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Edwin3 }
    },

    [TRAINER_EDWIN_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COLLECTOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_COLLECTOR,
        .trainerName = _("EDWIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Edwin4 }
    },

    [TRAINER_EDWIN_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COLLECTOR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_COLLECTOR,
        .trainerName = _("EDWIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Edwin5 }
    },

    [TRAINER_WALLY_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_WALLY,
        .trainerName = _("WALLY"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = {.NoItemCustomMoves = gTrainerParty_Wally1 }
    },

    [TRAINER_BRENDAN_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRENDAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brendan1 }
    },

    [TRAINER_BRENDAN_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRENDAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brendan2 }
    },

    [TRAINER_BRENDAN_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRENDAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brendan3 }
    },

    [TRAINER_BRENDAN_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRENDAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brendan4 }
    },

    [TRAINER_BRENDAN_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRENDAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brendan5 }
    },

    [TRAINER_BRENDAN_6] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRENDAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brendan6 }
    },

    [TRAINER_BRENDAN_7] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRENDAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brendan7 }
    },

    [TRAINER_BRENDAN_8] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRENDAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brendan8 }
    },

    [TRAINER_BRENDAN_9] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRENDAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brendan9 }
    },

    [TRAINER_MAY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_May1 }
    },

    [TRAINER_MAY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_May2 }
    },

    [TRAINER_MAY_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_May3 }
    },

    [TRAINER_MAY_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_May4 }
    },

    [TRAINER_MAY_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_May5 }
    },

    [TRAINER_MAY_6] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_May6 }
    },

    [TRAINER_MAY_7] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_May7 }
    },

    [TRAINER_MAY_8] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_May8 }
    },

    [TRAINER_MAY_9] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_May9 }
    },

    [TRAINER_ISAAC_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_M,
        .trainerName = _("ISAAC"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = {.NoItemDefaultMoves = gTrainerParty_Isaac1 }
    },

    [TRAINER_RILEY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_M,
        .trainerName = _("RILEY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Riley }
    },

    [TRAINER_AIDAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_M,
        .trainerName = _("AIDAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Aidan }
    },

    [TRAINER_ISAAC_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_M,
        .trainerName = _("ISAAC"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = {.NoItemDefaultMoves = gTrainerParty_Isaac2 }
    },

    [TRAINER_ISAAC_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_M,
        .trainerName = _("ISAAC"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = {.NoItemDefaultMoves = gTrainerParty_Isaac3 }
    },

    [TRAINER_ISAAC_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_M,
        .trainerName = _("ISAAC"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = {.NoItemDefaultMoves = gTrainerParty_Isaac4 }
    },

    [TRAINER_ISAAC_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_M,
        .trainerName = _("ISAAC"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = {.NoItemDefaultMoves = gTrainerParty_Isaac5 }
    },

    [TRAINER_LYDIA_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_F,
        .trainerName = _("LYDIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = {.NoItemDefaultMoves = gTrainerParty_Lydia1 }
    },

    [TRAINER_ALEXIA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_F,
        .trainerName = _("ALEXIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Alexia }
    },

    [TRAINER_DANIELLE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_F,
        .trainerName = _("DANIELLE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Danielle }
    },

    [TRAINER_LYDIA_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_F,
        .trainerName = _("LYDIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = {.NoItemDefaultMoves = gTrainerParty_Lydia2 }
    },

    [TRAINER_LYDIA_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_F,
        .trainerName = _("LYDIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = {.NoItemDefaultMoves = gTrainerParty_Lydia3 }
    },

    [TRAINER_LYDIA_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_F,
        .trainerName = _("LYDIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = {.NoItemDefaultMoves = gTrainerParty_Lydia4 }
    },

    [TRAINER_LYDIA_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_BREEDER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_POKEMON_BREEDER_F,
        .trainerName = _("LYDIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = {.NoItemDefaultMoves = gTrainerParty_Lydia5 }
    },

    [TRAINER_JACKSON_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_M,
        .trainerName = _("JACKSON"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jackson1 }
    },

    [TRAINER_CARLOS] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_M,
        .trainerName = _("CARLOS"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Carlos }
    },

    [TRAINER_SEBASTIAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_M,
        .trainerName = _("SEBASTIAN"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Sebastian }
    },

    [TRAINER_JACKSON_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_M,
        .trainerName = _("JACKSON"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jackson2 }
    },

    [TRAINER_JACKSON_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_M,
        .trainerName = _("JACKSON"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jackson3 }
    },

    [TRAINER_JACKSON_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_M,
        .trainerName = _("JACKSON"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jackson4 }
    },

    [TRAINER_JACKSON_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_M,
        .trainerName = _("JACKSON"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jackson5 }
    },

    [TRAINER_CATHERINE_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_F,
        .trainerName = _("CATHERINE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Catherine1 }
    },

    [TRAINER_JENNA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_F,
        .trainerName = _("JENNA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jenna }
    },

    [TRAINER_SOPHIA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_F,
        .trainerName = _("SOPHIA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Sophia }
    },

    [TRAINER_CATHERINE_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_F,
        .trainerName = _("CATHERINE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Catherine2 }
    },

    [TRAINER_CATHERINE_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_F,
        .trainerName = _("CATHERINE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Catherine3 }
    },

    [TRAINER_CATHERINE_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_F,
        .trainerName = _("CATHERINE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Catherine4 }
    },

    [TRAINER_CATHERINE_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_RANGER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_POKEMON_RANGER_F,
        .trainerName = _("CATHERINE"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Catherine5 }
    },

    [TRAINER_MAXIE_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAXIE,
        .trainerName = _("MAXIE"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Maxie1 }
    },

    [TRAINER_GRUNT_28] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt28 }
    },

    [TRAINER_GRUNT_29] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt29 }
    },

    [TRAINER_GRUNT_30] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt30 }
    },

    [TRAINER_GRUNT_31] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt31 }
    },

    [TRAINER_GRUNT_32] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt32 }
    },

    [TRAINER_GRUNT_33] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt33 }
    },

    [TRAINER_GRUNT_34] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt34 }
    },

    [TRAINER_GRUNT_35] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt35 }
    },

    [TRAINER_GRUNT_36] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt36 }
    },

    [TRAINER_GRUNT_37] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt37 }
    },

    [TRAINER_GRUNT_38] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt38 }
    },

    [TRAINER_GRUNT_39] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt39 }
    },

    [TRAINER_GRUNT_40] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt40 }
    },

    [TRAINER_GRUNT_41] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt41 }
    },

    [TRAINER_GRUNT_42] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt42 }
    },

    [TRAINER_GRUNT_43] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt43 }
    },

    [TRAINER_GRUNT_44] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt44 }
    },

    [TRAINER_GRUNT_45] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt45 }
    },

    [TRAINER_GRUNT_46] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt46 }
    },

    [TRAINER_GRUNT_47] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt47 }
    },

    [TRAINER_GRUNT_48] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt48 }
    },

    [TRAINER_GRUNT_49] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt49 }
    },

    [TRAINER_GRUNT_50] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt50 }
    },

    [TRAINER_GRUNT_51] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_M,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt51 }
    },

    [TRAINER_GRUNT_52] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_F,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt52 }
    },

    [TRAINER_GRUNT_53] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_F,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt53 }
    },

    [TRAINER_GRUNT_54] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TEAM_MAGMA,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_GRUNT_F,
        .trainerName = _("GRUNT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Grunt54 }
    },

    [TRAINER_ANONYMOUS_14] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_ADMIN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Anonymous14 }
    },

    [TRAINER_ANONYMOUS_15] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_ADMIN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_ADMIN_M,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Anonymous15 }
    },

    [TRAINER_TABITHA_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_ADMIN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_ADMIN_M,
        .trainerName = _("TABITHA"),
        .items = {ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tabitha1 }
    },

    [TRAINER_TABITHA_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_ADMIN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_ADMIN_M,
        .trainerName = _("TABITHA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tabitha2 }
    },

    [TRAINER_ANONYMOUS_16] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_ADMIN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_ADMIN_M,
        .trainerName = _(""),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Anonymous16 }
    },

    [TRAINER_COURTNEY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_ADMIN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_ADMIN_F,
        .trainerName = _("COURTNEY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Courtney1 }
    },

    [TRAINER_COURTNEY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_ADMIN,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAGMA_ADMIN_F,
        .trainerName = _("COURTNEY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0xb,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Courtney2 }
    },

    [TRAINER_MAXIE_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAXIE,
        .trainerName = _("MAXIE"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Maxie2 }
    },

    [TRAINER_MAXIE_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_MAGMA_LEADER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MAGMA,
        .trainerPic = TRAINER_PIC_MAXIE,
        .trainerName = _("MAXIE"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Maxie3 }
    },

    [TRAINER_TIANA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("TIANA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tiana }
    },

    [TRAINER_HALEY_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("HALEY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Haley1 }
    },

    [TRAINER_JANICE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("JANICE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Janice }
    },

    [TRAINER_VIVI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_WINSTRATE,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("VIVI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Vivi }
    },

    [TRAINER_HALEY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("HALEY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Haley2 }
    },

    [TRAINER_HALEY_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("HALEY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Haley3 }
    },

    [TRAINER_HALEY_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("HALEY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Haley4 }
    },

    [TRAINER_HALEY_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("HALEY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Haley5 }
    },

    [TRAINER_SALLY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("SALLY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Sally }
    },

    [TRAINER_ROBIN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("ROBIN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Robin }
    },

    [TRAINER_ANDREA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("ANDREA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Andrea }
    },

    [TRAINER_CRISSY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_LASS,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_LASS,
        .trainerName = _("CRISSY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Crissy }
    },

    [TRAINER_RICK] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("RICK"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Rick }
    },

    [TRAINER_LYLE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("LYLE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 6,
        .party = {.NoItemDefaultMoves = gTrainerParty_Lyle }
    },

    [TRAINER_JOSE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("JOSE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jose }
    },

    [TRAINER_DOUG] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("DOUG"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Doug }
    },

    [TRAINER_GREG] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("GREG"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Greg }
    },

    [TRAINER_KENT] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("KENT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Kent }
    },

    [TRAINER_JAMES_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("JAMES"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_James1 }
    },

    [TRAINER_JAMES_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("JAMES"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_James2 }
    },

    [TRAINER_JAMES_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("JAMES"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_James3 }
    },

    [TRAINER_JAMES_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("JAMES"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_James4 }
    },

    [TRAINER_JAMES_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BUG_CATCHER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BUG_CATCHER,
        .trainerName = _("JAMES"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_James5 }
    },

    [TRAINER_BRICE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("BRICE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brice }
    },

    [TRAINER_TRENT_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("TRENT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Trent1 }
    },

    [TRAINER_LENNY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("LENNY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Lenny }
    },

    [TRAINER_LUCAS_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("LUCAS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Lucas1 }
    },

    [TRAINER_ALAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("ALAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Alan }
    },

    [TRAINER_CLARK] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("CLARK"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Clark }
    },

    [TRAINER_ERIC] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("ERIC"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Eric }
    },

    [TRAINER_LUCAS_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("LUCAS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Lucas2 }
    },

    [TRAINER_MIKE_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("MIKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_Mike1 }
    },

    [TRAINER_MIKE_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("MIKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Mike2 }
    },

    [TRAINER_TRENT_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("TRENT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Trent2 }
    },

    [TRAINER_TRENT_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("TRENT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Trent3 }
    },

    [TRAINER_TRENT_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("TRENT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Trent4 }
    },

    [TRAINER_TRENT_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_HIKER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_HIKER,
        .trainerName = _("TRENT"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Trent5 }
    },

    [TRAINER_DEZ_AND_LUKE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNG_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_YOUNG_COUPLE,
        .trainerName = _("DEZ & LUKE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_DezAndLuke }
    },

    [TRAINER_LEA_AND_JED] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNG_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_YOUNG_COUPLE,
        .trainerName = _("LEA & JED"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_LeaAndJed }
    },

    [TRAINER_LOIS_AND_HAL_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNG_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_YOUNG_COUPLE,
        .trainerName = _("LOIS & HAL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_LoisAndHal1 }
    },

    [TRAINER_LOIS_AND_HAL_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNG_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_YOUNG_COUPLE,
        .trainerName = _("LOIS & HAL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_LoisAndHal2 }
    },

    [TRAINER_LOIS_AND_HAL_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNG_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_YOUNG_COUPLE,
        .trainerName = _("LOIS & HAL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_LoisAndHal3 }
    },

    [TRAINER_LOIS_AND_HAL_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNG_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_YOUNG_COUPLE,
        .trainerName = _("LOIS & HAL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_LoisAndHal4 }
    },

    [TRAINER_LOIS_AND_HAL_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_YOUNG_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_YOUNG_COUPLE,
        .trainerName = _("LOIS & HAL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_LoisAndHal5 }
    },

    [TRAINER_JOHANNA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BEAUTY,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_BEAUTY,
        .trainerName = _("JOHANNA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Johanna }
    },

    [TRAINER_ZANE] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("ZANE"),
        .items = {ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Zane }
    },

    [TRAINER_VIVIAN] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("VIVIAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Vivian }
    },

    [TRAINER_SADIE] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BATTLE_GIRL,
        .trainerName = _("SADIE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemCustomMoves = gTrainerParty_Sadie }
    },

    [TRAINER_HIDEO_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("HIDEO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x3,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_Hideo2 }
    },

    [TRAINER_KEIGO] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("KEIGO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x3,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_Keigo }
    },

    [TRAINER_TSUNAO] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_NINJA_BOY,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS,
        .trainerPic = TRAINER_PIC_NINJA_BOY,
        .trainerName = _("TSUNAO"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x3,
        .partySize = 3,
        .party = {.NoItemCustomMoves = gTrainerParty_Tsunao }
    },

    [TRAINER_TERRELL] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_CAMPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_CAMPER,
        .trainerName = _("TERRELL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Terrell }
    },

    [TRAINER_KYLEE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_PICNICKER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_PICNICKER,
        .trainerName = _("KYLEE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Kylee }
    },

    [TRAINER_WALLY_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_WALLY,
        .trainerName = _("WALLY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 1,
        .party = {.NoItemDefaultMoves = gTrainerParty_Wally2 }
    },

    [TRAINER_WALLY_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_WALLY,
        .trainerName = _("WALLY"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = {.NoItemCustomMoves = gTrainerParty_Wally3 }
    },

    [TRAINER_WALLY_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_WALLY,
        .trainerName = _("WALLY"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = {.NoItemCustomMoves = gTrainerParty_Wally4 }
    },

    [TRAINER_WALLY_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_WALLY,
        .trainerName = _("WALLY"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = {.NoItemCustomMoves = gTrainerParty_Wally5 }
    },

    [TRAINER_WALLY_6] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_WALLY,
        .trainerName = _("WALLY"),
        .items = {ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 5,
        .party = {.NoItemCustomMoves = gTrainerParty_Wally6 }
    },

    [TRAINER_BRENDAN_10] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRENDAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brendan10 }
    },

    [TRAINER_BRENDAN_11] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRENDAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brendan11 }
    },

    [TRAINER_BRENDAN_12] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_MALE,
        .trainerPic = TRAINER_PIC_BRENDAN,
        .trainerName = _("BRENDAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Brendan12 }
    },

    [TRAINER_MAY_10] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_May10 }
    },

    [TRAINER_MAY_11] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_May11 }
    },

    [TRAINER_MAY_12] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_POKEMON_TRAINER_3,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE,
        .trainerPic = TRAINER_PIC_MAY,
        .trainerName = _("MAY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_May12 }
    },

    [TRAINER_JONAH] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("JONAH"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Jonah }
    },

    [TRAINER_HENRY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("HENRY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Henry }
    },

    [TRAINER_ROGER] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("ROGER"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Roger }
    },

    [TRAINER_ALEXA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_F,
        .trainerName = _("ALEXA"),
        .items = {ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Alexa }
    },

    [TRAINER_RUBEN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_COOL_TRAINER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_COOL_TRAINER_M,
        .trainerName = _("RUBEN"),
        .items = {ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x7,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Ruben }
    },

    [TRAINER_KOJI] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BLACK_BELT,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_BLACK_BELT,
        .trainerName = _("KOJI"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Koji }
    },

    [TRAINER_WAYNE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("WAYNE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Wayne }
    },

    [TRAINER_BYRON] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_COOL,
        .trainerPic = TRAINER_PIC_BIRD_KEEPER,
        .trainerName = _("BYRON"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_Byron }
    },

    [TRAINER_REED] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_M,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_M,
        .trainerName = _("REED"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Reed }
    },

    [TRAINER_TISHA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SWIMMER_F,
        .encounterMusic_gender = F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SWIMMER_F,
        .trainerName = _("TISHA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 3,
        .party = {.NoItemDefaultMoves = gTrainerParty_Tisha }
    },

    [TRAINER_TORI_AND_TIA] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_TWINS,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_TWINS,
        .trainerName = _("TORI & TIA"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_ToriAndTia }
    },

    [TRAINER_KIM_AND_IRIS] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_SR_AND_JR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_SR_AND_JR,
        .trainerName = _("KIM & IRIS"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_KimAndIris }
    },

    [TRAINER_TYRA_AND_IVY] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_SR_AND_JR,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_TWINS,
        .trainerPic = TRAINER_PIC_SR_AND_JR,
        .trainerName = _("TYRA & IVY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_TyraAndIvy }
    },

    [TRAINER_MEL_AND_PAUL] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_YOUNG_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_GIRL,
        .trainerPic = TRAINER_PIC_YOUNG_COUPLE,
        .trainerName = _("MEL & PAUL"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_MelAndPaul }
    },

    [TRAINER_JOHN_AND_JAY_1] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_OLD_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_OLD_COUPLE,
        .trainerName = _("JOHN & JAY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_JohnAndJay1 }
    },

    [TRAINER_JOHN_AND_JAY_2] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_OLD_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_OLD_COUPLE,
        .trainerName = _("JOHN & JAY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_JohnAndJay2 }
    },

    [TRAINER_JOHN_AND_JAY_3] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_OLD_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_OLD_COUPLE,
        .trainerName = _("JOHN & JAY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_JohnAndJay3 }
    },

    [TRAINER_JOHN_AND_JAY_4] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_OLD_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_OLD_COUPLE,
        .trainerName = _("JOHN & JAY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0xb,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_JohnAndJay4 }
    },

    [TRAINER_JOHN_AND_JAY_5] =
    {
        .partyFlags = F_TRAINER_PARTY_CUSTOM_MOVESET,
        .trainerClass = TRAINER_CLASS_OLD_COUPLE,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_INTENSE,
        .trainerPic = TRAINER_PIC_OLD_COUPLE,
        .trainerName = _("JOHN & JAY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x7,
        .partySize = 2,
        .party = {.NoItemCustomMoves = gTrainerParty_JohnAndJay5 }
    },

    [TRAINER_RELI_AND_IAN] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SIS_AND_BRO,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SIS_AND_BRO,
        .trainerName = _("RELI & IAN"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_ReliAndIan }
    },

    [TRAINER_RITA_AND_SAM_1] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SIS_AND_BRO,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SIS_AND_BRO,
        .trainerName = _("RITA & SAM"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_RitaAndSam1 }
    },

    [TRAINER_RITA_AND_SAM_2] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SIS_AND_BRO,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SIS_AND_BRO,
        .trainerName = _("RITA & SAM"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_RitaAndSam2 }
    },

    [TRAINER_RITA_AND_SAM_3] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SIS_AND_BRO,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SIS_AND_BRO,
        .trainerName = _("RITA & SAM"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_RitaAndSam3 }
    },

    [TRAINER_RITA_AND_SAM_4] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SIS_AND_BRO,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SIS_AND_BRO,
        .trainerName = _("RITA & SAM"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_RitaAndSam4 }
    },

    [TRAINER_RITA_AND_SAM_5] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SIS_AND_BRO,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SIS_AND_BRO,
        .trainerName = _("RITA & SAM"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_RitaAndSam5 }
    },

    [TRAINER_LISA_AND_RAY] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_SIS_AND_BRO,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_SWIMMER,
        .trainerPic = TRAINER_PIC_SIS_AND_BRO,
        .trainerName = _("LISA & RAY"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = TRUE,
        .aiFlags = 0x1,
        .partySize = 2,
        .party = {.NoItemDefaultMoves = gTrainerParty_LisaAndRay }
    },

    [TRAINER_EUGENE] =
    {
        .partyFlags = 0,
        .trainerClass = TRAINER_CLASS_FISHERMAN,
        .encounterMusic_gender = TRAINER_ENCOUNTER_MUSIC_HIKER,
        .trainerPic = TRAINER_PIC_FISHERMAN,
        .trainerName = _("EUGENE"),
        .items = {ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE},
        .doubleBattle = FALSE,
        .aiFlags = 0x1,
        .partySize = 4,
        .party = {.NoItemDefaultMoves = gTrainerParty_Eugene }
    },
};
