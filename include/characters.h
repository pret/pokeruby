#ifndef GUARD_CHARACTERS_H
#define GUARD_CHARACTERS_H

#define CHAR_SPACE          0x00
#define CHAR_LV             0x34
#define CHAR_SONG_WORD_SEPARATOR 0x37  // separates words in the bard song. Not sure if it's used for anything else
#define CHAR_0              0xA1
#define CHAR_EXCL_MARK      0xAB
#define CHAR_QUESTION_MARK  0xAC
#define CHAR_PERIOD         0xAD
#define CHAR_HYPHEN         0xAE
#define CHAR_ELLIPSIS       0xB0
#define CHAR_DBL_QUOT_LEFT  0xB1
#define CHAR_DBL_QUOT_RIGHT 0xB2
#define CHAR_SGL_QUOT_LEFT  0xB3
#define CHAR_SGL_QUOT_RIGHT 0xB4
#define CHAR_MALE           0xB5
#define CHAR_FEMALE         0xB6
#define CHAR_CURRENCY       0xB7
#define CHAR_COMMA          0xB8
#define CHAR_MULT_SIGN      0xB9
#define CHAR_SLASH          0xBA
#define CHAR_A              0xBB
#define CHAR_B              0xBC
#define CHAR_C              0xBD
#define CHAR_D              0xBE
#define CHAR_E              0xBF
#define CHAR_F              0xC0
#define CHAR_G              0xC1
#define CHAR_H              0xC2
#define CHAR_I              0xC3
#define CHAR_J              0xC4
#define CHAR_K              0xC5
#define CHAR_L              0xC6
#define CHAR_M              0xC7
#define CHAR_N              0xC8
#define CHAR_O              0xC9
#define CHAR_P              0xCA
#define CHAR_Q              0xCB
#define CHAR_R              0xCC
#define CHAR_S              0xCD
#define CHAR_T              0xCE
#define CHAR_U              0xCF
#define CHAR_V              0xD0
#define CHAR_W              0xD1
#define CHAR_X              0xD2
#define CHAR_Y              0xD3
#define CHAR_Z              0xD4
#define CHAR_a              0xD5
#define CHAR_b              0xD6
#define CHAR_c              0xD7
#define CHAR_d              0xD8
#define CHAR_e              0xD9
#define CHAR_f              0xDA
#define CHAR_g              0xDB
#define CHAR_h              0xDC
#define CHAR_i              0xDD
#define CHAR_j              0xDE
#define CHAR_k              0xDF
#define CHAR_l              0xE0
#define CHAR_m              0xE1
#define CHAR_n              0xE2
#define CHAR_o              0xE3
#define CHAR_p              0xE4
#define CHAR_q              0xE5
#define CHAR_r              0xE6
#define CHAR_s              0xE7
#define CHAR_t              0xE8
#define CHAR_u              0xE9
#define CHAR_v              0xEA
#define CHAR_w              0xEB
#define CHAR_x              0xEC
#define CHAR_y              0xED
#define CHAR_z              0xEE
#define CHAR_COLON          0xF0
#define CHAR_PROMPT_SCROLL  0xFA // waits for button press and scrolls dialog
#define CHAR_PROMPT_CLEAR   0xFB // waits for button press and clears dialog
#define EXT_CTRL_CODE_BEGIN 0xFC // extended control code
#define PLACEHOLDER_BEGIN   0xFD // string placeholder
#define CHAR_NEWLINE        0xFE
#define EOS                 0xFF // end of string

#define TEXT_COLOR_TRANSPARENT 0x00
#define TEXT_COLOR_DARK_GREY   0x01
#define TEXT_COLOR_RED         0x02
#define TEXT_COLOR_GREEN       0x03
#define TEXT_COLOR_BLUE        0x04
#define TEXT_COLOR_YELLOW      0x05
#define TEXT_COLOR_CYAN        0x06
#define TEXT_COLOR_MAGENTA     0x07
#define TEXT_COLOR_LIGHT_GREY  0x08
#define TEXT_COLOR_BLACK       0x09
#define TEXT_COLOR_BLACK2      0x0A
#define TEXT_COLOR_SILVER      0x0B
#define TEXT_COLOR_WHITE       0x0C
#define TEXT_COLOR_SKY_BLUE    0x0D
#define TEXT_COLOR_LIGHT_BLUE  0x0E
#define TEXT_COLOR_WHITE2      0x0F

#define EXT_CTRL_CODE_COLOR                  0x01
#define EXT_CTRL_CODE_HIGHLIGHT              0x02
#define EXT_CTRL_CODE_SHADOW                 0x03
#define EXT_CTRL_CODE_COLOR_HIGHLIGHT_SHADOW 0x04
#define EXT_CTRL_CODE_PALETTE                0x05
#define EXT_CTRL_CODE_SIZE                   0x06
#define EXT_CTRL_CODE_RESET_SIZE             0x07
#define EXT_CTRL_CODE_PAUSE                  0x08
#define EXT_CTRL_CODE_PAUSE_UNTIL_PRESS      0x09
#define EXT_CTRL_CODE_WAIT_SE                0x0A
#define EXT_CTRL_CODE_PLAY_BGM               0x0B
#define EXT_CTRL_CODE_ESCAPE                 0x0C
#define EXT_CTRL_CODE_SHIFT_TEXT             0x0D // nop
#define EXT_CTRL_CODE_SHIFT_DOWN             0x0E
#define EXT_CTRL_CODE_FILL_WINDOW            0x0F
#define EXT_CTRL_CODE_PLAY_SE                0x10
#define EXT_CTRL_CODE_CLEAR                  0x11
#define EXT_CTRL_CODE_SKIP                   0x12
#define EXT_CTRL_CODE_CLEAR_TO               0x13
#define EXT_CTRL_CODE_MIN_LETTER_SPACING     0x14
#define EXT_CTRL_CODE_JPN                    0x15
#define EXT_CTRL_CODE_ENG                    0x16

// Note that while all dot combinations are represented in
// the Braille font, they are not all meaningful characters.
// Only those that have direct single-character translations are listed.
#define BRAILLE_CHAR_SPACE           0x00
#define BRAILLE_CHAR_A               0x01
//
#define BRAILLE_CHAR_C               0x03
#define BRAILLE_CHAR_COMMA           0x04
#define BRAILLE_CHAR_B               0x05
#define BRAILLE_CHAR_I               0x06
#define BRAILLE_CHAR_F               0x07
//
#define BRAILLE_CHAR_E               0x09
//
#define BRAILLE_CHAR_D               0x0B
#define BRAILLE_CHAR_COLON           0x0C
#define BRAILLE_CHAR_H               0x0D
#define BRAILLE_CHAR_J               0x0E
#define BRAILLE_CHAR_G               0x0F
#define BRAILLE_CHAR_APOSTROPHE      0x10
#define BRAILLE_CHAR_K               0x11
#define BRAILLE_CHAR_SLASH           0x12
#define BRAILLE_CHAR_M               0x13
#define BRAILLE_CHAR_SEMICOLON       0x14
#define BRAILLE_CHAR_L               0x15
#define BRAILLE_CHAR_S               0x16
#define BRAILLE_CHAR_P               0x17
//
#define BRAILLE_CHAR_O               0x19
//
#define BRAILLE_CHAR_N               0x1B
#define BRAILLE_CHAR_EXCL_MARK       0x1C
#define BRAILLE_CHAR_R               0x1D
#define BRAILLE_CHAR_T               0x1E
#define BRAILLE_CHAR_Q               0x1F
//
#define BRAILLE_CHAR_PERIOD          0x2C
//
#define BRAILLE_CHAR_W               0x2E
//
#define BRAILLE_CHAR_HYPHEN          0x30
#define BRAILLE_CHAR_U               0x31
//
#define BRAILLE_CHAR_X               0x33
#define BRAILLE_CHAR_QUESTION_MARK   0x34 // Also double quote left
#define BRAILLE_CHAR_V               0x35
//
#define BRAILLE_CHAR_DBL_QUOTE_RIGHT 0x38
#define BRAILLE_CHAR_Z               0x39
#define BRAILLE_CHAR_NUMBER          0x3A
#define BRAILLE_CHAR_Y               0x3B
#define BRAILLE_CHAR_PAREN           0x3C
//
#define NUM_BRAILLE_CHARS            0x40

// Digits must be preceded by BRAILLE_CHAR_NUMBER
#define BRAILLE_CHAR_1 BRAILLE_CHAR_A
#define BRAILLE_CHAR_2 BRAILLE_CHAR_B
#define BRAILLE_CHAR_3 BRAILLE_CHAR_C
#define BRAILLE_CHAR_4 BRAILLE_CHAR_D
#define BRAILLE_CHAR_5 BRAILLE_CHAR_E
#define BRAILLE_CHAR_6 BRAILLE_CHAR_F
#define BRAILLE_CHAR_7 BRAILLE_CHAR_G
#define BRAILLE_CHAR_8 BRAILLE_CHAR_H
#define BRAILLE_CHAR_9 BRAILLE_CHAR_I
#define BRAILLE_CHAR_0 BRAILLE_CHAR_J

#endif // GUARD_CHARACTERS_H
