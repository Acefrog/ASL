state("Styx2-Win64-Shipping")
	{
		bool isLoading	:	0x02C23E80, 0x28, 0x40, 0x8, 0x2A0, 0x578;
		int NewGame 	: 	0x02CF9640, 0x30, 0x3A0, 0x420, 0x3DC;
	}
	
	start
	{
		if (current.NewGame == 1117126656 && !current.isLoading)
			return true;
	}
	
	isLoading
	{
		return current.isLoading;
	}