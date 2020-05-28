/********************************************************************/
/*        ポケモン通信用変数定義	                                */
/**/
/**/
/*											by Akito Mori			*/
/********************************************************************/


extern u16 RecvPoolBuf[MULTI_SIO_PLAYERS_MAX][SPLITDATA_POOL_SIZE/2];	
extern u16 RecvPoolBuf2[MULTI_SIO_PLAYERS_MAX][SPLITDATA_POOL_SIZE/2];	
extern u8  pokemon_sio_flag;
extern u16 PokemonSioNinshouNo;
extern u8  Signal;
extern u32 SioFlags;
extern SIOTRAINER_INFO	SioTrainerInfo[4];

#if 0
extern u16 RecvPoolBuf[MULTI_SIO_PLAYERS_MAX][SPLITDATA_POOL_SIZE/2];
extern u16 RecvPoolBuf2[MULTI_SIO_PLAYERS_MAX][SPLITDATA_POOL_SIZE/2];
extern u8  pokemon_sio_flag;
extern u16 PokemonSioNinshouNo;
#endif