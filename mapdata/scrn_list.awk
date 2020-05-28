BEGIN{
	SCRN_ID = "../mapdata/scrn_id.h"
	SCRN_DATA = "../mapdata/scrndata.c"

	printf("#define MAPSCRNID_NOMAP 0\n") > SCRN_ID
	printf("\n") >> SCRN_ID
	count = 1

	printf("//include map screen files\n\n") > SCRN_DATA
	TABLE = ""
	TABLE = sprintf("\nconst MapScreenData * const  MapScreenTable[] = {\n")
}

$1 ~/ENTRY/ {
	printf("#define MAPSCRNID_%s %d\n",toupper($2),count) >> SCRN_ID
	count++;

	printf("const MapScreenData %s_map_data;\n", $2) >> SCRN_DATA
	printf("#include \"../mapdata/%s_map.c\"\n\n",$2) >> SCRN_DATA
	TABLE = TABLE sprintf("\t&%s_map_data,\n",$2)
}

END{
	printf("\n") >> SCRN_ID
	printf("#define MAPSCRNID_END %s\n",count) >> SCRN_ID
	printf("\n\n") >> SCRN_ID

	printf("\n") >> SCRN_DATA
	TABLE = TABLE sprintf("};\n")
	printf("%s\n",TABLE) >> SCRN_DATA
}
