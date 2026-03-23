state("Styx3-Win64-Shipping")
{
    bool isLoading       : 0x096C34C0, 0x110, 0xF6C; //Loading
    bool isLoading2      : 0x0951E720, 0x68, 0x20, 0x78, 0x28, 0x110, 0x478; //Loaded

	byte startFlag		:	0x0951E110, 0x50, 0x6C4; //Menu
}

startup
{
    settings.Add("start_newgame", true, "Start timer on New Game");
}

start
{
    if (settings["start_newgame"])
    {
		if (current.isLoading || current.isLoading2)
			return false;

		return current.startFlag == 1 && old.startFlag == 1;
    }
}

isLoading
{
    return current.isLoading || current.isLoading2;
}
