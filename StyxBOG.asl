state("Styx3-Win64-Shipping")
{
	bool menu			:	0x09662438, 0x38, 0x3B0; 		//0 = Menu, 2 = In-game.
	bool isLoading		:	0x09681CA8, 0x50, 0x46c; 		//Game Loading.
	bool pressAnyKey	:	0x07F12DC8, 0x18; 				//Game Loaded, Press Any Key.
	byte credits		:	0x07FD65D8, 0x1E0;				//Credits.
	
	int act				: 	0x096BD590, 0x18, 0x0, 0x5aC;	//Current Act.
	int act1 			: 	0x096BEC18, 0x18, 0x100, 0xE8;
	int act2 			: 	0x096BD590, 0x18, 0x58, 0x1C0;
	int act3 			: 	0x096BD5B0, 0x18, 0x58, 0x298;
	int act4 			: 	0x096BEC18, 0x18, 0x100, 0x370;
	int act5 			: 	0x096BE978, 0x18, 0x150, 0x448;
}

startup
{
    settings.Add("start_newgame", true, "Start timer on New Game");
	settings.Add("reset", true, "Reset timer on Main Menu (Toggle off if buggy)");
}

start
{    
	if (settings["start_newgame"])
    {
		return old.pressAnyKey && !current.pressAnyKey && current.menu;
	}
}

isLoading
{
    return current.isLoading || current.pressAnyKey;
}

split
{
	return
	(
		(
			(current.act1 > old.act1) ||
			(current.act2 > old.act2) ||
			(current.act3 > old.act3) ||
			(current.act4 > old.act4) ||
			(current.act5 > old.act5)
		)
			|| (current.act > old.act)
			|| (current.credits == 1 && old.credits != 1)
	)
	&& !(old.act == 5 && current.act == 6);
}

reset
{
	if (settings["reset"])
    {
		return !current.menu && !current.isLoading && !current.pressAnyKey;
	}
}
