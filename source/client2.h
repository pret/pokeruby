
#ifndef __CLIENT2_H__
#define __CLIENT2_H__


extern void CA_PokeAppearWait(actWork *actst);
extern void CAS_TrainerSlideIn(actWork *actst);
extern void CAC_PokeAppearDifferentInit(actWork *actst, u8);
extern void ClientStatusEffSet(u8 ,u32);
extern u8 SetFightEffect(u8 client_no, u8 attack, u8 defence, u8 eff_no, u16);
extern void SetEtcEffect(u8 client_no, u8 attack, u8 defence, u8 eff_no);
extern u8 PutWazaEffectCheck(u16 wazano, u8 waza_counter);
extern u8 ClientSEWait(u8 client_no);





#endif	//__CLIENT2_H__
