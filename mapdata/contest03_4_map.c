//MapEditNH Ver.3.48 *.map -> C sourse Convert.
//Full Cell File Name (0-511)    : room.cell
//Part Cell File Name (512-1023) : hall.cell

#define	MapSizeX_contest03_4	1
#define	MapSizeY_contest03_4	1

const u16	contest03_4_OutRangeCell[4]={
0x0201,0x0201,0x0201,0x0201,
};

const u16	contest03_4_MapData[MapSizeX_contest03_4*MapSizeY_contest03_4]={
0x060c,
};

const MapScreenData	contest03_4_map_data =
{
	MapSizeX_contest03_4,
	MapSizeY_contest03_4,
	contest03_4_OutRangeCell,
	contest03_4_MapData,
	&room_char_data,
	&hall_char_data
};
