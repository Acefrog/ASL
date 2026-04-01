state("Styx3-Win64-Shipping")
{
    bool isLoading		: 0x0971E8D0, 0x110, 0xEF4;
	bool isAnyKey		: 0x0931B350, 0x68;
    int CurrentAct		: 0x09718680, 0x18, 0x34;
    int QuartzA1 		: 0x09718680, 0x18, 0x58, 0xE8;
    int QuartzA2 		: 0x09718680, 0x18, 0x58, 0x1C0;
    int QuartzA3 		: 0x09718680, 0x18, 0x58, 0x298;
    int QuartzA4 		: 0x09718680, 0x18, 0x58, 0x360;
    int QuartzA5 		: 0x09718680, 0x18, 0x58, 0x448;
}

isLoading
{
    return current.isLoading || current. isAnyKey;
}

split
{
    return 
	(
		current.CurrentAct > old.CurrentAct ||
		current.QuartzA1 > old.QuartzA1 ||
		current.QuartzA2 > old.QuartzA2 ||
		current.QuartzA3 > old.QuartzA3 ||
		current.QuartzA4 > old.QuartzA4 ||
		current.QuartzA5 > old.QuartzA5
	)
	&& !(old.CurrentAct == 5 && current.CurrentAct == 6);
}
