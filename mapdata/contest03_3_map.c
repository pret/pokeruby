//MapEditNH Ver.3.48 *.map -> C sourse Convert.
//Full Cell File Name (0-511)    : room.cell
//Part Cell File Name (512-1023) : hall.cell

#define	MapSizeX_contest03_3	1
#define	MapSizeY_contest03_3	1

const u16	contest03_3_OutRangeCell[4]={
0x0201,0x0201,0x0201,0x0201,
};

const u16	contest03_3_MapData[MapSizeX_contest03_3*MapSizeY_contest03_3]={
0x060c,
};

const MapScreenData	contest03_3_map_data =
{
	MapSizeX_contest03_3,
	MapSizeY_contest03_3,
	contest03_3_OutRangeCell,
	contest03_3_MapData,
	&room_char_data,
	&hall_char_data
};
