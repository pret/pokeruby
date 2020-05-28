BEGIN{
	time = strftime("%Y %m %d %H:%M")
	printf("const u8 %s[] = \"%s\";\n",string,time )
	exit
}
