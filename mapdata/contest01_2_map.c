//MapEditNH Ver.3.48 *.map -> C sourse Convert.
//Full Cell File Name (0-511)    : room.cell
//Part Cell File Name (512-1023) : hall.cell

#define	MapSizeX_contest01_2	1
#define	MapSizeY_contest01_2	1

const u16	contest01_2_OutRangeCell[4]={
0x0201,0x0201,0x0201,0x0201,
};

const u16	contest01_2_MapData[MapSizeX_contest01_2*MapSizeY_contest01_2]={
0x065b,
};

const MapScreenData	contest01_2_map_data =
{
	MapSizeX_contest01_2,
	MapSizeY_contest01_2,
	contest01_2_OutRangeCell,
	contest01_2_MapData,
	&room_char_data,
	&hall_char_data
};
