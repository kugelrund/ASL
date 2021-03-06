
state("DarkSoulsII", "1.2")
{
	int Loading : 0xFF9290, 0x108, 0xf8, 0x4, 0x1c0;
}

state("DarkSoulsII", "JP1.2")
{
	int Loading : 0xFF9290, 0x108, 0xf8, 0x4, 0x1c0;
}

state("DarkSoulsII", "1.11")
{
	int Loading : 0x114A58C, 0x300, 0x65c, 0x64, 0x9c;
}

state("DarkSoulsII", "JP1.11")
{
	int Loading : 0x114A58C, 0x300, 0x65c, 0x64, 0x9c;
}

state("DarkSoulsII", "SOTFS")
{
	int Loading : 0x160D688, 0x1d8, 0x580, 0x5e0;
}

state("DarkSoulsII", "JPSOTFS")
{
	int Loading : 0x160D688, 0x1d8, 0x580, 0x5e0;
}

init
{
	int moduleSize = modules.First().ModuleMemorySize;
	switch (moduleSize) {
		case 34299904:
       		version = "SOTFS";
			break;
		case 34361344:
			version = "JPSOTFS";
			break;
		case 33902592:
       		version = "1.11";
			break;
		case 33927168:
			version = "JP1.11";
			break;
        case 20176896:
			version = "1.2";
			break;
        default:
            version = "JP1.2";
            break;
	}
	print(modules.First().ModuleMemorySize.ToString());
}

isLoading
{
	if (version == "1.11" || version =="JP1.11") {
		return current.Loading == 0;
	} else {
		return current.Loading == 1;
	}
}