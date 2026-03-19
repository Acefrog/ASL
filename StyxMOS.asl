state("StyxGame")
{
	bool isLoading : 0x037EF280, 0xE98;
}

isLoading
{
	return current.isLoading;
}