state("jk2sp")
{
	bool isLoading : "jk2sp.exe", 0xEC34A4;
}

start
{
}

reset
{
}

split
{
}

isLoading
{
	return current.isLoading;
}