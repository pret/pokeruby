#ifndef	__MEMTOOL_H__
#define	__MEMTOOL_H__

//=======================================================================
//
//	ＤＭＡ転送を分割するためのマクロ
//
//=======================================================================

/* 一度に転送できるバイト数の上限 */
#define DMA_MAX_SIZE	0x1000

/* マクロ本体 */

#define DIV_DMACOPY( DmaNo_param, src_param, dst_param, size_param, bit_param ) \
{																				\
	u32 src_macro,dst_macro,size_macro;											\
	src_macro = (u32)(src_param);												\
	dst_macro = (u32)(dst_param);												\
	size_macro = (u32)(size_param);												\
																				\
	while ( TRUE ) {															\
		if ( size_macro <= DMA_MAX_SIZE ) {										\
			DmaCopy(DmaNo_param,src_macro,dst_macro,size_macro,bit_param);		\
			break;																\
		} else {																\
			DmaCopy(DmaNo_param,src_macro,dst_macro,DMA_MAX_SIZE,bit_param);	\
			src_macro += DMA_MAX_SIZE;											\
			dst_macro += DMA_MAX_SIZE;											\
			size_macro -= DMA_MAX_SIZE;											\
		}																		\
	}																			\
}

#define DIV_DMAARRAYCOPY(DmaNo_param,src_param,dst_param,bit_param) \
	DIV_DMACOPY(DmaNo_param,src_param,dst_param,sizeof(src_param),bit_param)

#define DIV_DMACLEAR( DmaNo_param, dt_param, dst_param, size_param, bit_param )	\
{																				\
	u32 dst_macro,size_macro;													\
	dst_macro = (u32)(dst_param);												\
	size_macro = (u32)(size_param);												\
																				\
	while ( TRUE ) {															\
		if ( size_macro <= DMA_MAX_SIZE ) {										\
			DmaClear(DmaNo_param,dt_param,dst_macro,size_macro,bit_param);		\
			break;																\
		} else {																\
			DmaClear(DmaNo_param,dt_param,dst_macro,DMA_MAX_SIZE,bit_param);	\
			dst_macro += DMA_MAX_SIZE;											\
			size_macro -= DMA_MAX_SIZE;											\
		}																		\
	}																			\
}

#define DIV_DMAARRAYCLEAR(DmaNo_param,dt_param,dst_param,bit_param) \
	DIV_DMACLEAR(DmaNo_param,dt_param,dst_param,sizeof(dst_param),bit_param)

#endif /*	__MEMTOOL_H__ */
