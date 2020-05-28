/************************************************************************/
/*      evobjdef.h                                                      */
/*		ﾌｨｰﾙﾄﾞ OBJ *.c *.s 共通参照                                     */
/************************************************************************/
#ifndef	EVOBJDEF_H
#define	EVOBJDEF_H

/*------------------------------------------*/
/*  特殊 OBJ ID                             */
/*------------------------------------------*/
#define EV_OBJ_SPID             0xff            /* 自機 */

/*------------------------------------------*/
/*  向き                                    */
/*------------------------------------------*/
#define SITE_N                  0x00            /* 方向無し */
#define SITE_D                  0x01            /* 下       */
#define SITE_U                  0x02            /* 上       */
#define SITE_L                  0x03            /* 左       */
#define SITE_R                  0x04            /* 右       */
#define SITE_DL                 0x05            /* 左下     */
#define SITE_DR                 0x06            /* 左上     */
#define SITE_UL                 0x07            /* 右上     */
#define SITE_UR                 0x08            /* 右下     */

/*------------------------------------------*/
/*  ｱﾆﾒｰｼｮﾝｺﾏﾝﾄﾞｺｰﾄﾞ                        */
/*------------------------------------------*/
#define AC_SITE_D               0x00            /* 000 下方向に向き変更         */
#define AC_SITE_U               0x01            /* 001 上方向に向き変更         */
#define AC_SITE_L               0x02            /* 002 左方向に向き変更         */
#define AC_SITE_R               0x03            /* 003 右方向に向き変更         */
#define AC_WALK_D_05            0x04            /* 004 下へ移動(0.5ﾄﾞｯﾄ)        */
#define AC_WALK_U_05            0x05            /* 005 上へ移動                 */
#define AC_WALK_L_05            0x06            /* 006 左へ移動                 */
#define AC_WALK_R_05            0x07            /* 007 右へ移動                 */
#define AC_WALK_D_1             0x08            /* 008 下へ移動(1ﾄﾞｯﾄ)          */
#define AC_WALK_U_1             0x09            /* 009 上へ移動                 */
#define AC_WALK_L_1             0x0a            /* 010 左へ移動                 */
#define AC_WALK_R_1             0x0b            /* 011 右へ移動                 */
#define AC_JUMP_D_2             0x0c            /* 012 下へｼﾞｬﾝﾌﾟ(2ｾﾙ)          */
#define AC_JUMP_U_2             0x0d            /* 013 上へｼﾞｬﾝﾌﾟ               */
#define AC_JUMP_L_2             0x0e            /* 014 左へｼﾞｬﾝﾌﾟ               */
#define AC_JUMP_R_2             0x0f            /* 015 右へｼﾞｬﾝﾌﾟ               */
#define AC_WAIT_1               0x10            /* 016 1ｶｳﾝﾄｳｪｲﾄ                */
#define AC_WAIT_2               0x11            /* 017 2ｶｳﾝﾄｳｪｲﾄ                */
#define AC_WAIT_4               0x12            /* 018 4ｶｳﾝﾄｳｪｲﾄ                */
#define AC_WAIT_8               0x13            /* 019 8ｶｳﾝﾄｳｪｲﾄ                */
#define AC_WAIT_16              0x14            /* 020 16ｶｳﾝﾄｳｪｲﾄ               */
#define AC_WALK_D_2             0x15            /* 021 下へ走行移動(2ﾄﾞｯﾄ)      */
#define AC_WALK_U_2             0x16            /* 022 上へ走行移動             */
#define AC_WALK_L_2             0x17            /* 023 左へ走行移動             */
#define AC_WALK_R_2             0x18            /* 024 右へ走行移動             */
#define AC_STAY_WALK_D_05       0x19            /* 025 下その場歩き(0.5ﾄﾞｯﾄ)    */
#define AC_STAY_WALK_U_05       0x1a            /* 026 上その場歩き             */
#define AC_STAY_WALK_L_05       0x1b            /* 027 左その場歩き             */
#define AC_STAY_WALK_R_05       0x1c            /* 028 右その場歩き             */
#define AC_STAY_WALK_D_1        0x1d            /* 029 下その場歩き(1ﾄﾞｯﾄ)      */
#define AC_STAY_WALK_U_1        0x1e            /* 030 上その場歩き             */
#define AC_STAY_WALK_L_1        0x1f            /* 031 左その場歩き             */
#define AC_STAY_WALK_R_1        0x20            /* 032 右その場歩き             */
#define AC_STAY_WALK_D_2        0x21            /* 033 下その場歩き(2ﾄﾞｯﾄ)      */
#define AC_STAY_WALK_U_2        0x22            /* 034 上その場歩き             */
#define AC_STAY_WALK_L_2        0x23            /* 035 左その場歩き             */
#define AC_STAY_WALK_R_2        0x24            /* 036 右その場歩き             */
#define AC_STAY_WALK_D_4        0x25            /* 037 下その場歩き(4ﾄﾞｯﾄ)      */
#define AC_STAY_WALK_U_4        0x26            /* 038 上その場歩き             */
#define AC_STAY_WALK_L_4        0x27            /* 039 左その場歩き             */
#define AC_STAY_WALK_R_4        0x28            /* 040 右その場歩き             */
#define AC_WALK_D_3             0x29            /* 041 下へ走行移動(3ﾄﾞｯﾄ)      */
#define AC_WALK_U_3             0x2a            /* 042 上へ走行移動             */
#define AC_WALK_L_3             0x2b            /* 043 左へ走行移動             */
#define AC_WALK_R_3             0x2c            /* 044 右へ走行移動             */
#define AC_WALK_D_4             0x2d            /* 045 下へ走行移動(4ﾄﾞｯﾄ)      */
#define AC_WALK_U_4             0x2e            /* 046 上へ走行移動             */
#define AC_WALK_L_4             0x2f            /* 047 左へ走行移動             */
#define AC_WALK_R_4             0x30            /* 048 右へ走行移動             */
#define AC_WALK_D_8             0x31            /* 049 下へ走行移動(8ﾄﾞｯﾄ)      */
#define AC_WALK_U_8             0x32            /* 050 上へ走行移動             */
#define AC_WALK_L_8             0x33            /* 051 左へ走行移動             */
#define AC_WALK_R_8             0x34            /* 052 右へ走行移動             */
#define AC_DASH_D_2             0x35            /* 053 下へ走行移動(2ﾄﾞｯﾄ,専用) */
#define AC_DASH_U_2             0x36            /* 054 上へ走行移動             */
#define AC_DASH_L_2             0x37            /* 055 左へ走行移動             */
#define AC_DASH_R_2             0x38            /* 056 右へ走行移動             */
#define AC_ANM_END_WAIT         0x39            /* 057 ｾﾙｱﾆﾒ終了待ち            */
#define AC_SWIM_JUMP_D          0x3a            /* 058 下波乗りｼﾞｬﾝﾌﾟ(専用)     */
#define AC_SWIM_JUMP_U          0x3b            /* 059 上波乗りｼﾞｬﾝﾌﾟ(専用)     */
#define AC_SWIM_JUMP_L          0x3c            /* 060 左波乗りｼﾞｬﾝﾌﾟ(専用)     */
#define AC_SWIM_JUMP_R          0x3d            /* 061 右波乗りｼﾞｬﾝﾌﾟ(専用)     */
#define AC_TURN_HERO_SITE       0x3e            /* 062 主人公位置振り向き       */
#define AC_TURN_REV_HERO_SITE   0x3f            /* 063 主人公位置逆方向振り向き */
#define AC_SITE_PAUSE_ON        0x40            /* 064 方向固定                 */
#define AC_SITE_PAUSE_OFF       0x41            /* 065 方向固定解除             */
#define AC_JUMP_D_1             0x42            /* 066 下へｼﾞｬﾝﾌﾟ(1ｾﾙ)          */
#define AC_JUMP_U_1             0x43            /* 067 上へｼﾞｬﾝﾌﾟ               */
#define AC_JUMP_L_1             0x44            /* 068 左へｼﾞｬﾝﾌﾟ               */
#define AC_JUMP_R_1             0x45            /* 069 右へｼﾞｬﾝﾌﾟ               */
#define AC_STAY_JUMP_D          0x46            /* 070 下その場ｼﾞｬﾝﾌﾟ           */
#define AC_STAY_JUMP_U          0x47            /* 071 上その場ｼﾞｬﾝﾌﾟ           */
#define AC_STAY_JUMP_L          0x48            /* 072 左その場ｼﾞｬﾝﾌﾟ           */
#define AC_STAY_JUMP_R          0x49            /* 073 右その場ｼﾞｬﾝﾌﾟ           */
#define AC_STAY_TURN_JUMP_D     0x4a            /* 074 下その場ｼﾞｬﾝﾌﾟ振り返り   */
#define AC_STAY_TURN_JUMP_U     0x4b            /* 075 上その場ｼﾞｬﾝﾌﾟ振り返り   */
#define AC_STAY_TURN_JUMP_L     0x4c            /* 076 左その場ｼﾞｬﾝﾌﾟ振り返り   */
#define AC_STAY_TURN_JUMP_R     0x4d            /* 077 右その場ｼﾞｬﾝﾌﾟ振り返り   */
#define AC_DEFAULT_SITE         0x4e            /* 078 基本方向に変更           */
#define AC_PC_BOW               0x4f            /* 079 PCお辞儀(専用)           */
#define AC_UNDER_EFFECT_ON      0x50            /* 080 足元ｴﾌｪｸﾄｱﾘ              */
#define AC_UNDER_EFFECT_OFF     0x51            /* 081 足元ｴﾌｪｸﾄ無し            */
#define AC_ANM_CHG_HOLD_ON      0x52            /* 082 ｱﾆﾒｰｼｮﾝ固定化            */
#define AC_ANM_CHG_HOLD_OFF     0x53            /* 083 ｱﾆﾒｰｼｮﾝ固定解除          */
#define AC_VANISH_ON            0x54            /* 084 OBJ 非表示               */
#define AC_VANISH_OFF           0x55            /* 085 OBJ 表示                 */
#define AC_MARK_GYOE            0x56            /* 086 頭上に ! ﾏｰｸ             */
#define AC_MARK_HATENA          0x57            /* 087 頭上に ? ﾏｰｸ             */
#define AC_MARK_HEART           0x58            /* 088 頭上に ﾊｰﾄ ﾏｰｸ           */
#define AC_HIDE_PULLOFF         0x59            /* 089 隠れ蓑めくり             */
#define AC_ROCK_CRUSH           0x5a            /* 090 岩砕き(専用)             */
#define AC_TREE_CUT             0x5b            /* 091 居合切り(専用)           */
#define AC_PRI_HOLD_SW_ON       0x5c            /* 092 表示ﾌﾟﾗｲｵﾘﾃｨ固定         */
#define AC_PRI_HOLD_SW_OFF      0x5d            /* 093 表示ﾌﾟﾗｲｵﾘﾃｨ固定解除     */
#define AC_AFFUSE_ON            0x5e            /* 094 拡縮使用 ON              */
#define AC_AFFUSE_OFF           0x5f            /* 095 拡縮使用 OFF             */
#define AC_KIOG_WALK_S_D_05     0x60            /* 096 下ｶｲｵｰｶﾞ移動開始(専用)   */
#define AC_KIOG_WALK_D_05       0x61            /* 097 下ｶｲｵｰｶﾞ移動(専用)       */
#define AC_MTB_FTUP_SITE_D      0x62            /* 098 下ﾌﾛﾝﾄﾀｲﾔｱｯﾌﾟ停止(専用)  */
#define AC_MTB_FTUP_SITE_U      0x63            /* 099 上ﾌﾛﾝﾄﾀｲﾔｱｯﾌﾟ停止(専用)  */
#define AC_MTB_FTUP_SITE_L      0x64            /* 100 左ﾌﾛﾝﾄﾀｲﾔｱｯﾌﾟ停止(専用)  */
#define AC_MTB_FTUP_SITE_R      0x65            /* 101 右ﾌﾛﾝﾄﾀｲﾔｱｯﾌﾟ停止(専用)  */
#define AC_MTB_FTUP_D           0x66            /* 102 下ﾌﾛﾝﾄﾀｲﾔｱｯﾌﾟ(専用)      */
#define AC_MTB_FTUP_U           0x67            /* 103 上ﾌﾛﾝﾄﾀｲﾔｱｯﾌﾟ(専用)      */
#define AC_MTB_FTUP_L           0x68            /* 104 左ﾌﾛﾝﾄﾀｲﾔｱｯﾌﾟ(専用)      */
#define AC_MTB_FTUP_R           0x69            /* 105 右ﾌﾛﾝﾄﾀｲﾔｱｯﾌﾟ(専用)      */
#define AC_MTB_FTDOWN_D         0x6a            /* 106 下ﾌﾛﾝﾄﾀｲﾔﾀﾞｳﾝ(専用)      */
#define AC_MTB_FTDOWN_U         0x6b            /* 107 上ﾌﾛﾝﾄﾀｲﾔﾀﾞｳﾝ(専用)      */
#define AC_MTB_FTDOWN_L         0x6c            /* 108 左ﾌﾛﾝﾄﾀｲﾔﾀﾞｳﾝ(専用)      */
#define AC_MTB_FTDOWN_R         0x6d            /* 109 右ﾌﾛﾝﾄﾀｲﾔﾀﾞｳﾝ(専用)      */
#define AC_MTB_DANIEL_D         0x6e            /* 110 下ﾀﾞﾆｴﾙ(専用)            */
#define AC_MTB_DANIEL_U         0x6f            /* 111 上ﾀﾞﾆｴﾙ(専用)            */
#define AC_MTB_DANIEL_L         0x70            /* 112 左ﾀﾞﾆｴﾙ(専用)            */
#define AC_MTB_DANIEL_R         0x71            /* 113 右ﾀﾞﾆｴﾙ(専用)            */
#define AC_MTB_DANIEL_D_1       0x72            /* 114 下ﾀﾞﾆｴﾙ移動(1ｾﾙ,専用)    */
#define AC_MTB_DANIEL_U_1       0x73            /* 115 上ﾀﾞﾆｴﾙ移動(1ｾﾙ,専用)    */
#define AC_MTB_DANIEL_L_1       0x74            /* 116 左ﾀﾞﾆｴﾙ移動(1ｾﾙ,専用)    */
#define AC_MTB_DANIEL_R_1       0x75            /* 117 右ﾀﾞﾆｴﾙ移動(1ｾﾙ,専用)    */
#define AC_MTB_DANIEL_D_2       0x76            /* 118 下ﾀﾞﾆｴﾙ移動(2ｾﾙ,専用)    */
#define AC_MTB_DANIEL_U_2       0x77            /* 119 上ﾀﾞﾆｴﾙ移動(2ｾﾙ,専用)    */
#define AC_MTB_DANIEL_L_2       0x78            /* 120 左ﾀﾞﾆｴﾙ移動(2ｾﾙ,専用)    */
#define AC_MTB_DANIEL_R_2       0x79            /* 121 右ﾀﾞﾆｴﾙ移動(2ｾﾙ,専用)    */
#define AC_MTB_WHEELIE_D        0x7a            /* 122 下その場ｳｲﾘｰ(専用)       */
#define AC_MTB_WHEELIE_U        0x7b            /* 123 上その場ｳｲﾘｰ(専用)       */
#define AC_MTB_WHEELIE_L        0x7c            /* 124 左その場ｳｲﾘｰ(専用)       */
#define AC_MTB_WHEELIE_R        0x7d            /* 125 右その場ｳｲﾘｰ(専用)       */
#define AC_MTB_WHEELIE_S_D_2    0x7e            /* 126 下ｳｲﾘｰ開始(2ﾄﾞｯﾄ,専用)   */
#define AC_MTB_WHEELIE_S_U_2    0x7f            /* 127 上ｳｲﾘｰ開始(2ﾄﾞｯﾄ,専用)   */
#define AC_MTB_WHEELIE_S_L_2    0x80            /* 128 左ｳｲﾘｰ開始(2ﾄﾞｯﾄ,専用)   */
#define AC_MTB_WHEELIE_S_R_2    0x81            /* 129 右ｳｲﾘｰ開始(2ﾄﾞｯﾄ,専用)   */
#define AC_MTB_WHEELIE_D_2      0x82            /* 130 下ｳｲﾘｰ移動(2ﾄﾞｯﾄ,専用)   */
#define AC_MTB_WHEELIE_U_2      0x83            /* 131 上ｳｲﾘｰ移動(2ﾄﾞｯﾄ,専用)   */
#define AC_MTB_WHEELIE_L_2      0x84            /* 132 左ｳｲﾘｰ移動(2ﾄﾞｯﾄ,専用)   */
#define AC_MTB_WHEELIE_R_2      0x85            /* 133 右ｳｲﾘｰ移動(2ﾄﾞｯﾄ,専用)   */
#define AC_MTB_WHEELIE_E_D_2    0x86            /* 134 下ｳｲﾘｰ終了(2ﾄﾞｯﾄ,専用)   */
#define AC_MTB_WHEELIE_E_U_2    0x87            /* 135 上ｳｲﾘｰ終了(2ﾄﾞｯﾄ,専用)   */
#define AC_MTB_WHEELIE_E_L_2    0x88            /* 136 左ｳｲﾘｰ終了(2ﾄﾞｯﾄ,専用)   */
#define AC_MTB_WHEELIE_E_R_2    0x89            /* 137 右ｳｲﾘｰ終了(2ﾄﾞｯﾄ,専用)   */

#define ACMD_END                0xfe            /* 254 ｺﾏﾝﾄﾞ終了                */
#define NOT_ACMD                0xff            /* 255 非ｱﾆﾒｰｼｮﾝｺｰﾄﾞ            */

#define AC_STOP_WALK_D AC_STAY_WALK_D_1         /* 旧ｺｰﾄﾞ                       */
#define AC_STOP_WALK_U AC_STAY_WALK_U_1         /* 旧ｺｰﾄﾞ                       */
#define AC_STOP_WALK_L AC_STAY_WALK_L_1         /* 旧ｺｰﾄﾞ                       */
#define AC_STOP_WALK_R AC_STAY_WALK_R_1         /* 旧ｺｰﾄﾞ                       */
#define AC_WALK_TURN_D AC_STAY_WALK_D_4         /* 旧ｺｰﾄﾞ                       */
#define AC_WALK_TURN_U AC_STAY_WALK_U_4         /* 旧ｺｰﾄﾞ                       */
#define AC_WALK_TURN_L AC_STAY_WALK_L_4         /* 旧ｺｰﾄﾞ                       */
#define AC_WALK_TURN_R AC_STAY_WALK_R_4         /* 旧ｺｰﾄﾞ                       */

/*------------------------------------------*/
/*  OBJ ｷｬﾗｸﾀｰｺｰﾄﾞ                          */
/*------------------------------------------*/
#define MAINHERO                0x00            /* 000 主人公                   */
#define MAINHEROCYCLER          0x01            /* 001 自転車主人公 ﾚｰｽﾀｲﾌﾟ     */
#define MAINHEROSWIM            0x02            /* 002 波乗り主人公             */
#define MAINHEROHIDEN           0x03            /* 003 秘伝技主人公             */
#define BIGMAN0                 0x04            /* 004 大男                     */
#define BOYA1                   0x05            /* 005 坊や                     */
#define OJYOU1                  0x06            /* 006 お嬢                     */
#define BOY1                    0x07            /* 007 少年                     */
#define GIRL1                   0x08            /* 008 少女                     */
#define BOY2                    0x09            /* 009 少年                     */
#define GIRL2                   0x0a            /* 010 少女                     */
#define BOYA2                   0x0b            /* 011 坊や                     */
#define OJYOU2                  0x0c            /* 012 お嬢                     */
#define BOY3                    0x0d            /* 013 少年                     */
#define GIRL3                   0x0e            /* 014 少女                     */
#define BOY4                    0x0f            /* 015 少年                     */
#define GIRL4                   0x10            /* 016 少女                     */
#define BIGMAN1                 0x11            /* 017 大男                     */
#define MIDDLEW1                0x12            /* 018 おばさん                 */
#define MIDDLEM1                0x13            /* 019 おじさん                 */
#define WOMAN1                  0x14            /* 020 女性                     */
#define OLDMAN1                 0x15            /* 021 老人                     */
#define OLDWOMAN1               0x16            /* 022 老婆                     */
#define WORKERM1                0x17            /* 023 ｻﾗﾘｰﾏﾝ                   */
#define WORKERW1                0x18            /* 024 ｻﾗﾘｰｳｰﾏﾝ                 */
#define MIDDLEM2                0x19            /* 025 おじさん                 */
#define WOMAN2                  0x1a            /* 026 女性                     */
#define COOK1                   0x1b            /* 027 料理人                   */
#define WAITRESS1               0x1c            /* 028 ｳｪｲﾄﾚｽ                   */
#define OLDMAN2                 0x1d            /* 029 老人                     */
#define OLDWOMAN2               0x1e            /* 030 老婆                     */
#define BOYSCOUT1               0x1f            /* 031 ﾎﾞｰｲｽｶｳﾄ                 */
#define GIRLSCOUT1              0x20            /* 032 ｶﾞｰﾙｽｶｳﾄ                 */
#define TRAINERM1               0x21            /* 033 ﾄﾚｰﾅｰ男                  */
#define TRAINERW1               0x22            /* 034 ﾄﾚｰﾅｰ女                  */
#define CAPBOY1                 0x23            /* 035 帽子少年                 */
#define CAPBOY2                 0x24            /* 036 帽子少年                 */
#define BOY5                    0x25            /* 037 少年                     */
#define SCHOOLM1                0x26            /* 038 男子学生                 */
#define FREAK1                  0x27            /* 039 ﾏﾆｱ                      */
#define OCCULT1                 0x28            /* 040 ｵｶﾙﾄﾏﾆｱ                  */
#define EVILW1                  0x29            /* 041 悪者女                   */
#define SWIMERM1                0x2a            /* 042 海ﾊﾟﾝ野郎                */
#define SWIMERW1                0x2b            /* 043 海ﾊﾟﾝ女郎                */
#define FIGHTER1                0x2c            /* 044 格闘家                   */
#define WORKERW2                0x2d            /* 045 ｻﾗﾘｰｳｰﾏﾝ                 */
#define STUDYM1                 0x2e            /* 046 研究員                   */
#define SCHOOLW1                0x2f            /* 047 女子学生                 */
#define GENTLEM1                0x30            /* 048 老紳士                   */
#define SEAMAN1                 0x31            /* 049 船乗り                   */
#define FISHING1                0x32            /* 050 釣り人                   */
#define SPORTSM1                0x33            /* 051 ｽﾎﾟｰﾂﾏﾝ                  */
#define SPORTSW1                0x34            /* 052 ｽﾎﾟｰﾂｳｰﾏﾝ                */
#define BEACHGIRL1              0x35            /* 053 浮き輪お嬢               */
#define BEACHBOY1               0x36            /* 054 浮き輪坊や               */
#define HILL1                   0x37            /* 055 山男                     */
#define CYCLEM1                 0x38            /* 056 自転車男                 */
#define CYCLEW1                 0x39            /* 057 自転車女                 */
#define PCWOMAN1                0x3a            /* 058 ﾎﾟｹｾﾝ姉さん              */
#define CAPSULE1                0x3b            /* 059 ｱｲﾃﾑ1                    */
#define SEED                    0x3c            /* 060 種                       */
#define SEED16x16               0x3d            /* 061 種16x16                  */
#define SEED16x32               0x3e            /* 062 種16x32                  */
#define MAINHEROCYCLES          0x3f            /* 063 自転車主人公 ｽﾎﾟｰﾂﾀｲﾌﾟ   */
#define ODAMAKI                 0x40            /* 064 ｵﾀﾞﾏｷ                    */
#define YOUNGM1                 0x41            /* 065 青年男性                 */
#define YOUNGM2                 0x42            /* 066 青年男性                 */
#define INTERVM1                0x43            /* 067 ｲﾝﾀﾋﾞｭｱ男                */
#define INTERVW1                0x44            /* 068 ｲﾝﾀﾋﾞｭｱ女                */
#define OYAJI1                  0x45            /* 069 おやじ1                  */
#define OYAJI2                  0x46            /* 070 おやじ2                  */
#define OYAJI3                  0x47            /* 071 おやじ3                  */
#define OYAJI4                  0x48            /* 072 おやじ4                  */
#define OYAJI5                  0x49            /* 073 おやじ5                  */
#define OYAJI6                  0x4a            /* 074 おやじ6                  */
#define OYAJI7                  0x4b            /* 075 おやじ7                  */
#define GOODS1                  0x4c            /* 076 ｸﾞｯｽﾞ1 ﾈｲﾃｨ              */
#define GOODS2                  0x4d            /* 077 ｸﾞｯｽﾞ2 ｺｲﾙ               */
#define GOODS3                  0x4e            /* 078 ｸﾞｯｽﾞ3 ｾﾞﾆｶﾞﾒ            */
#define GOODS4                  0x4f            /* 079 ｸﾞｯｽﾞ4 ｳﾊﾟｰ              */
#define GOODS5                  0x50            /* 080 ｸﾞｯｽﾞ5 ﾋﾟｶﾁｭｳ            */
#define GOODS6                  0x51            /* 081 ｸﾞｯｽﾞ6 ﾎﾟﾘｺﾞﾝ            */
#define TREE1                   0x52            /* 082 木                       */
#define SHOPM1                  0x53            /* 083 店員男                   */
#define SHOPW1                  0x54            /* 084 店員女                   */
#define PCWOMAN2                0x55            /* 085 ﾎﾟｹｾﾝ姉さん              */
#define CRUSHROCK1              0x56            /* 086 砕ける岩                 */
#define PUSHROCK1               0x57            /* 087 押せる岩                 */
#define SHIP1                   0x58            /* 088 船                       */
#define MAINHEROINE             0x59            /* 089 女主人公                 */
#define MAINHINECYCLER          0x5a            /* 090 女主人公自転車 ﾚｰｽﾀｲﾌﾟ   */
#define MAINHINECYCLES          0x5b            /* 091 女主人公自転車 ｽﾎﾟｰﾂﾀｲﾌﾟ */
#define MAINHINESWIM            0x5c            /* 092 女主人公波乗り           */
#define MAINHINEHIDEN           0x5d            /* 093 女主人公秘伝技           */
#define TRUCK1                  0x5e            /* 094 ﾄﾗｯｸ                     */
#define MOVER1                  0x5f            /* 095 引越しﾎﾟｹﾓﾝ              */
#define MOVER2                  0x60            /* 096 引越しﾎﾟｹﾓﾝ              */
#define RUCK1                   0x61            /* 097 ﾘｭｯｸｻｯｸ                  */
#define ATTACK1                 0x62            /* 098 襲うﾎﾟｹﾓﾝ                */
#define ARTIST1                 0x63            /* 099 絵描きさん               */
#define HERO                    0x64            /* 100 男主人公                 */
#define HEROCYCLER              0x65            /* 101 自転車主人公 ﾚｰｽﾀｲﾌﾟ     */
#define HEROCYCLES              0x66            /* 102 自転車主人公 ﾚｰｽﾀｲﾌﾟ     */
#define HEROSWIM                0x67            /* 103 波乗り主人公             */
#define HEROHIDEN               0x68            /* 104 秘伝技主人公             */
#define HEROINE                 0x69            /* 105 女主人公                 */
#define HINECYCLER              0x6a            /* 106 女主人公自転車 ﾚｰｽﾀｲﾌﾟ   */
#define HINECYCLES              0x6b            /* 107 女主人公自転車 ｽﾎﾟｰﾂﾀｲﾌﾟ */
#define HINESWIM                0x6c            /* 108 女主人公波乗り           */
#define HINEHIDEN               0x6d            /* 109 女主人公秘伝技           */
#define CAMERA1                 0x6e            /* 110 ｶﾒﾗﾏﾝ                    */
#define MAINHERODIV             0x6f            /* 111 男主人公ﾀﾞｲﾋﾞﾝｸﾞ         */
#define MAINHINEDIV             0x70            /* 112 女主人公ﾀﾞｲﾋﾞﾝｸﾞ         */
#define CARGO1                  0x71            /* 113 荷物                     */
#define ROPEWAY1                0x72            /* 114 ﾛｰﾌﾟｳｪｲ                  */
#define STUDYM2                 0x73            /* 115 研究員                   */
#define DEVON1                  0x74            /* 116 ﾃﾞﾎﾞﾝ                    */
#define AQUALM1                 0x75            /* 117 ｱｸｱ団                    */
#define AQUALF1                 0x76            /* 118 ｱｸｱ団                    */
#define MAGMAM1                 0x77            /* 119 ﾏｸﾞﾏ団                   */
#define MAGMAF1                 0x78            /* 120 ﾏｸﾞﾏ団                   */
#define KAGETSU                 0x79            /* 121 カゲツ                   */
#define FUYOU                   0x7a            /* 122 フヨウ                   */
#define PURIMU                  0x7b            /* 123 プリム                   */
#define GENJI                   0x7c            /* 124 ゲンジ                   */
#define TSUTSUJI                0x7d            /* 125 ツツジ                   */
#define TOUKI                   0x7e            /* 126 トウキ                   */
#define TETTSUSEN               0x7f            /* 127 テッセン                 */
#define AIRI                    0x80            /* 128 アイリ                   */
#define SENRI                   0x81            /* 129 センリ                   */
#define NAGI                    0x82            /* 130 ナギ                     */
#define FUU                     0x83            /* 131 フウ                     */
#define RUN                     0x84            /* 132 ラン                     */
#define MIKURI                  0x85            /* 133 ミクリ                   */
#define DAIGO                   0x86            /* 134 ダイゴ                   */
#define MITSURU                 0x87            /* 135 ミツル                   */
#define SUPPORTM1               0x88            /* 136 サポート                 */
#define MAINHEROFISH            0x89            /* 137 主人公釣り               */
#define MAINHINEFISH            0x8a            /* 138 主人公釣り               */
#define ONSENW1                 0x8b            /* 139 温泉老婆                 */
#define HISHIP1                 0x8c            /* 140 高速艇                   */
#define SUBMARINE1              0x8d            /* 141 潜水艦                   */
#define DOLL1                   0x8e            /* 142 ぬいぐるみ               */
#define DOLL2                   0x8f            /* 143 ぬいぐるみ               */
#define DOLL3                   0x90            /* 144 ぬいぐるみ               */
#define DOLL4                   0x91            /* 145 ぬいぐるみ               */
#define DOLL5                   0x92            /* 146 ぬいぐるみ               */
#define DOLL6                   0x93            /* 147 ぬいぐるみ               */
#define DOLL7                   0x94            /* 148 ぬいぐるみ               */
#define DOLL8                   0x95            /* 149 ぬいぐるみ               */
#define DOLL9                   0x96            /* 150 ぬいぐるみ               */
#define DOLL10                  0x97            /* 151 ぬいぐるみ               */
#define DOLL11                  0x98            /* 152 ぬいぐるみ               */
#define DOLL12                  0x99            /* 153 ぬいぐるみ               */
#define DOLL13                  0x9a            /* 154 ぬいぐるみ               */
#define DOLL14                  0x9b            /* 155 ぬいぐるみ               */
#define DOLL15                  0x9c            /* 156 ぬいぐるみ               */
#define DOLL16                  0x9d            /* 157 ぬいぐるみ               */
#define DOLL17                  0x9e            /* 158 ぬいぐるみ               */
#define DOLL18                  0x9f            /* 159 ぬいぐるみ               */
#define DOLL19                  0xa0            /* 160 ぬいぐるみ               */
#define DOLL20                  0xa1            /* 161 ぬいぐるみ               */
#define DOLL21                  0xa2            /* 162 ぬいぐるみ               */
#define DOLL22                  0xa3            /* 163 ぬいぐるみ               */
#define DOLL23                  0xa4            /* 164 ぬいぐるみ               */
#define DOLL24                  0xa5            /* 165 ぬいぐるみ               */
#define DOLL25                  0xa6            /* 166 ぬいぐるみ               */
#define CUSHION1                0xa7            /* 167 ｸｯｼｮﾝ                    */
#define CUSHION2                0xa8            /* 168 ｸｯｼｮﾝ                    */
#define CUSHION3                0xa9            /* 169 ｸｯｼｮﾝ                    */
#define CUSHION4                0xaa            /* 170 ｸｯｼｮﾝ                    */
#define CUSHION5                0xab            /* 171 ｸｯｼｮﾝ                    */
#define CUSHION6                0xac            /* 172 ｸｯｼｮﾝ                    */
#define CUSHION7                0xad            /* 173 ｸｯｼｮﾝ                    */
#define CUSHION8                0xae            /* 174 ｸｯｼｮﾝ                    */
#define CUSHION9                0xaf            /* 175 ｸｯｼｮﾝ                    */
#define CUSHION10               0xb0            /* 176 ｸｯｼｮﾝ                    */
#define BIGDOLL1                0xb1            /* 177 大きなぬいぐるみ         */
#define BIGDOLL2                0xb2            /* 178 大きなぬいぐるみ         */
#define BIGDOLL3                0xb3            /* 179 大きなぬいぐるみ         */
#define BIGDOLL4                0xb4            /* 180 大きなぬいぐるみ         */
#define BIGDOLL5                0xb5            /* 181 大きなぬいぐるみ         */
#define BIGDOLL6                0xb6            /* 182 大きなぬいぐるみ         */
#define BIGDOLL7                0xb7            /* 183 大きなぬいぐるみ         */
#define BIGDOLL8                0xb8            /* 184 大きなぬいぐるみ         */
#define BIGDOLL9                0xb9            /* 185 大きなぬいぐるみ         */
#define BIGDOLL10               0xba            /* 186 大きなぬいぐるみ         */
#define RATIASU                 0xbb            /* 187 ﾗﾃｨｱｽ                    */
#define RATIOSU                 0xbc            /* 188 ﾗﾃｨｵｽ                    */
#define AGBOY1                  0xbd            /* 189 AGB少年                  */
#define JUDGEM1                 0xbe            /* 190 審査員                   */
#define MAINHEROJORRO           0xbf            /* 191 主人公如雨露             */
#define MAINHINEJORRO           0xc0            /* 192 主人公如雨露             */
#define HEROREMODEL             0xc1            /* 193 主人公模様替え           */
#define HINEREMODEL             0xc2            /* 194 女主人公模様替え         */
#define AQUABOSS                0xc3            /* 195 ｱｸｱ団ﾎﾞｽ                 */
#define MAGMABOSS               0xc4            /* 196 ﾏｸﾞﾏ団ﾎﾞｽ                */
#define KAIOGA                  0xc5            /* 197 ｶｲｵｰｶﾞ                   */
#define GURADON                 0xc6            /* 198 ｸﾞﾗｰﾄﾞﾝ                  */
#define FOSSIL1                 0xc7            /* 199 化石                     */
#define LEGEND1                 0xc8            /* 200 伝説                     */
#define LEGEND2                 0xc9            /* 201 伝説                     */
#define LEGEND3                 0xca            /* 202 伝説                     */
#define ENECO                   0xcb            /* 203 エネコ                   */
#define KAKUREON                0xcc            /* 204 ｶｸﾚｵﾝ                    */
#define KAIOGAMC                0xcd            /* 205 ｶｲｵｰｶﾞﾓﾉｸﾛ               */
#define GURADONMC               0xce            /* 206 ｸﾞﾗｰﾄﾞﾝﾓﾉｸﾛ              */
#define TYCOON                  0xcf            /* 207 タイクーン               */
#define JIGUMA                  0xd0            /* 208 ジグザグマ               */
#define PIKACHUU                0xd1            /* 209 ピカチュウ               */
#define MARIRURI                0xd2            /* 210 マリルリ                 */
#define CAMOME                  0xd3            /* 211 キャモメ                 */
#define KAKUREONB               0xd4            /* 212 ｶｸﾚｵﾝ橋                  */
#define BEACHBOY2               0xd5            /* 213 浮き輪坊や2              */
#define RURIRI                  0xd6            /* 214 ルリリ                   */
#define MYMAM                   0xd7            /* 215 ママ                     */
#define CTHERO                  0xd8            /* 216 男主人公ｺﾝﾃｽﾄ用          */
#define CTHINE                  0xd9            /* 217 女主人公ｺﾝﾃｽﾄ用          */
#define EVOBJCODEMAX            0xda            /* 218 OBJｺｰﾄﾞ最大              */

#define WKOBJCODE1              0xf0            /* 240 ﾜｰｸ1参照OBJｺｰﾄﾞ          */
#define WKOBJCODE2              0xf1            /* 241 ﾜｰｸ2参照OBJｺｰﾄﾞ          */
#define WKOBJCODE3              0xf2            /* 242 ﾜｰｸ3参照OBJｺｰﾄﾞ          */
#define WKOBJCODE4              0xf3            /* 243 ﾜｰｸ4参照OBJｺｰﾄﾞ          */
#define WKOBJCODE5              0xf4            /* 244 ﾜｰｸ5参照OBJｺｰﾄﾞ          */
#define WKOBJCODE6              0xf5            /* 245 ﾜｰｸ6参照OBJｺｰﾄﾞ          */
#define WKOBJCODE7              0xf6            /* 246 ﾜｰｸ7参照OBJｺｰﾄﾞ          */
#define WKOBJCODE8              0xf7            /* 247 ﾜｰｸ8参照OBJｺｰﾄﾞ          */
#define WKOBJCODE9              0xf8            /* 248 ﾜｰｸ9参照OBJｺｰﾄﾞ          */
#define WKOBJCODE10             0xf9            /* 249 ﾜｰｸ10参照OBJｺｰﾄﾞ         */
#define WKOBJCODE11             0xfa            /* 250 ﾜｰｸ11参照OBJｺｰﾄﾞ         */
#define WKOBJCODE12             0xfb            /* 251 ﾜｰｸ12参照OBJｺｰﾄﾞ         */
#define WKOBJCODE13             0xfc            /* 252 ﾜｰｸ13参照OBJｺｰﾄﾞ         */
#define WKOBJCODE14             0xfd            /* 253 ﾜｰｸ14参照OBJｺｰﾄﾞ         */
#define WKOBJCODE15             0xfe            /* 254 ﾜｰｸ15参照OBJｺｰﾄﾞ         */
#define WKOBJCODE16             0xff            /* 255 ﾜｰｸ16参照OBJｺｰﾄﾞ         */

#define EVILM1 (OCCULT1) /* 置き換え */

/*------------------------------------------*/
/*  OBJ 動作ｺｰﾄﾞ                            */
/*------------------------------------------*/
#define MV_DMY                  0x00            /* 000 移動無し                 */
#define MV_OFF                  0x01            /* 001 ﾗﾝﾀﾞﾑ 方向               */
#define MV_ON                   0x02            /* 002 ﾗﾝﾀﾞﾑ 移動               */
#define MV_VON                  0x03            /* 003 ﾗﾝﾀﾞﾑ 垂直               */
#define MV_VOND                 0x04            /* 004 ﾗﾝﾀﾞﾑ 垂直初期方向下     */
#define MV_HON                  0x05            /* 005 ﾗﾝﾀﾞﾑ 水平               */
#define MV_HONR                 0x06            /* 006 ﾗﾝﾀﾞﾑ 水平初期方向右     */
#define MV_UP                   0x07            /* 007 上固定                   */
#define MV_DOWN                 0x08            /* 008 下固定                   */
#define MV_LEFT                 0x09            /* 009 左固定                   */
#define MV_RIGHT                0x0a            /* 010 右固定                   */
#define MV_HERO                 0x0b            /* 011 自機専用                 */
#define MV_SEED                 0x0c            /* 012 たね専用                 */
#define MV_V                    0x0d            /* 013 ﾗﾝﾀﾞﾑ 垂直方向           */
#define MV_H                    0x0e            /* 014 ﾗﾝﾀﾞﾑ 水平方向           */
#define MV_UL                   0x0f            /* 015 ﾗﾝﾀﾞﾑ上左方向            */
#define MV_UR                   0x10            /* 016 ﾗﾝﾀﾞﾑ上右方向            */
#define MV_DL                   0x11            /* 017 ﾗﾝﾀﾞﾑ下左方向            */
#define MV_DR                   0x12            /* 018 ﾗﾝﾀﾞﾑ下右方向            */
#define MV_LV                   0x13            /* 019 ﾗﾝﾀﾞﾑ上下左方向          */
#define MV_RV                   0x14            /* 020 ﾗﾝﾀﾞﾑ上下右方向          */
#define MV_UH                   0x15            /* 021 ﾗﾝﾀﾞﾑ左右上方向          */
#define MV_DH                   0x16            /* 022 ﾗﾝﾀﾞﾑ左右下方向          */
#define MV_SPINL                0x17            /* 023 方向回転左               */
#define MV_SPINR                0x18            /* 024 方向回転右               */
#define MV_RTU                  0x19            /* 025 ﾙｰﾄ2 上                  */
#define MV_RTD                  0x1a            /* 026 ﾙｰﾄ2 下                  */
#define MV_RTL                  0x1b            /* 027 ﾙｰﾄ2 左                  */
#define MV_RTR                  0x1c            /* 028 ﾙｰﾄ2 右                  */
#define MV_RTURLD               0x1d            /* 029 ﾙｰﾄ3 上右左下            */
#define MV_RTRLDU               0x1e            /* 030 ﾙｰﾄ3 右左下上            */
#define MV_RTDURL               0x1f            /* 031 ﾙｰﾄ3 下上右左            */
#define MV_RTLDUR               0x20            /* 032 ﾙｰﾄ3 左下上右            */
#define MV_RTULRD               0x21            /* 033 ﾙｰﾄ3 上左右下            */
#define MV_RTLRDU               0x22            /* 034 ﾙｰﾄ3 左右下上            */
#define MV_RTDULR               0x23            /* 035 ﾙｰﾄ3 下上左右            */
#define MV_RTRDUL               0x24            /* 036 ﾙｰﾄ3 右下上左            */
#define MV_RTLUDR               0x25            /* 037 ﾙｰﾄ3 左上下右            */
#define MV_RTUDRL               0x26            /* 038 ﾙｰﾄ3 上下右左            */
#define MV_RTRLUD               0x27            /* 039 ﾙｰﾄ3 右左上下            */
#define MV_RTDRLU               0x28            /* 040 ﾙｰﾄ3 下右左上            */
#define MV_RTRUDL               0x29            /* 041 ﾙｰﾄ3 右上下左            */
#define MV_RTUDLR               0x2a            /* 042 ﾙｰﾄ3 上下左右            */
#define MV_RTLRUD               0x2b            /* 043 ﾙｰﾄ3 左右上下            */
#define MV_RTDLRU               0x2c            /* 044 ﾙｰﾄ3 下左右上            */
#define MV_RTUL                 0x2d            /* 045 ﾙｰﾄ4 上左                */
#define MV_RTDR                 0x2e            /* 046 ﾙｰﾄ4 下右                */
#define MV_RTLD                 0x2f            /* 047 ﾙｰﾄ4 左下                */
#define MV_RTRU                 0x30            /* 048 ﾙｰﾄ4 右上                */
#define MV_RTUR                 0x31            /* 049 ﾙｰﾄ4 上右                */
#define MV_RTDL                 0x32            /* 050 ﾙｰﾄ4 下左                */
#define MV_RTLU                 0x33            /* 051 ﾙｰﾄ4 左上                */
#define MV_RTRD                 0x34            /* 052 ﾙｰﾄ4 右下                */
#define MV_COPYU                0x35            /* 053 ものまね上               */
#define MV_COPYD                0x36            /* 054 ものまね下               */
#define MV_COPYL                0x37            /* 055 ものまね右               */
#define MV_COPYR                0x38            /* 056 ものまね左               */
#define MV_HIDEW                0x39            /* 057 隠れ蓑木                 */
#define MV_HIDER                0x3a            /* 058 隠れ蓑岩                 */
#define MV_COPYGRASSU           0x3b            /* 059 ものまね草上             */
#define MV_COPYGRASSD           0x3c            /* 060 ものまね草下             */
#define MV_COPYGRASSL           0x3d            /* 061 ものまね草左             */
#define MV_COPYGRASSR           0x3e            /* 062 ものまね草右             */
#define MV_HIDES                0x3f            /* 063 隠れ蓑砂                 */
#define MV_STAYWALK1D           0x40            /* 064 その場歩き下1ﾄﾞｯﾄ        */
#define MV_STAYWALK1U           0x41            /* 065 その場歩き上1ﾄﾞｯﾄ        */
#define MV_STAYWALK1L           0x42            /* 066 その場歩き左1ﾄﾞｯﾄ        */
#define MV_STAYWALK1R           0x43            /* 067 その場歩き右1ﾄﾞｯﾄ        */
#define MV_STAYWALK2D           0x44            /* 068 その場歩き下2ﾄﾞｯﾄ        */
#define MV_STAYWALK2U           0x45            /* 069 その場歩き上2ﾄﾞｯﾄ        */
#define MV_STAYWALK2L           0x46            /* 070 その場歩き左2ﾄﾞｯﾄ        */
#define MV_STAYWALK2R           0x47            /* 071 その場歩き右2ﾄﾞｯﾄ        */
#define MV_STAYWALK4D           0x48            /* 072 その場歩き下4ﾄﾞｯﾄ        */
#define MV_STAYWALK4U           0x49            /* 073 その場歩き上4ﾄﾞｯﾄ        */
#define MV_STAYWALK4L           0x4a            /* 074 その場歩き左4ﾄﾞｯﾄ        */
#define MV_STAYWALK4R           0x4b            /* 075 その場歩き右4ﾄﾞｯﾄ        */
#define MV_VANISH               0x4c            /* 076 透明                     */

#define	MV_COPY (MV_COPYU)           /* 旧 */
#define	MV_COPYGRASS (MV_COPYGRASSU) /* 旧 */

#endif		/* EVOBJDEF_H */