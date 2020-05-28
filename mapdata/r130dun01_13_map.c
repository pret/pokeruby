//MapEditNH Ver.3.50 *.map -> C sourse Convert.
//Full Cell File Name (0-511)    : field.cell
//Part Cell File Name (512-1023) : cave.cell

#define	MapSizeX_r130dun01_13	1
#define	MapSizeY_r130dun01_13	1

const u16	r130dun01_13_OutRangeCell[4]={
0x0213,0x0213,0x0213,0x0213,
};

const u16	r130dun01_13_MapData[MapSizeX_r130dun01_13*MapSizeY_r130dun01_13]={
0x0606,
};

const MapScreenData	r130dun01_13_map_data =
{
	MapSizeX_r130dun01_13,
	MapSizeY_r130dun01_13,
	r130dun01_13_OutRangeCell,
	r130dun01_13_MapData,
	&field_char_data,
	&cave_char_data
};
