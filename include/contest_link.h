#ifndef GUARD_CONTEST_LINK_H
#define GUARD_CONTEST_LINK_H

void sub_80C8734(u8);
void Task_LinkContest_CommunicateRng(u8);
void sub_80C89DC(u8);
void Task_LinkContest_CommunicateLeaderIds(u8);
void Task_LinkContest_CommunicateRound1Points(u8);
void Task_LinkContest_CommunicateTurnOrder(u8);
u8 GetStringLanguage(const u8 *string);
void Task_LinkContest_Init(u8 taskId);
void Task_LinkContest_CommunicateCategory(u8 taskId);

#endif // GUARD_CONTEST_LINK_H
