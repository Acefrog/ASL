state("Styx3-Win64-Shipping")
	{
		bool isLoading		:	0x096C34C0, 0x110, 0xF6C;
		bool isLoading2		:	0x0951E720, 0x68, 0x20, 0x78, 0x28, 0x110, 0x478;
	}

	isLoading
	{
		return current.isLoading || current.isLoading2;
	}
