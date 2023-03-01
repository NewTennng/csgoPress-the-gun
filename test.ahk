state2 := 0
thickness := 2
width := 1920
height := 1080
x1 := width - 1
y0 := 0

if not A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

loop
{
	IniRead, ak47, data.ini, state, ak47
	IniRead, galil, data.ini, state, galil
	IniRead, sg553, data.ini, state, sg553
	IniRead, m4a4, data.ini, state, m4a4
	IniRead, m4a1, data.ini, state, m4a1
	IniRead, famas, data.ini, state, famas
	IniRead, aug, data.ini, state, aug
	IniRead, mp9, data.ini, state, mp9
	IniRead, mac10, data.ini, state, mac10
	IniRead, ump45, data.ini, state, ump45
	IniRead, mp7, data.ini, state, mp7
	IniRead, mp5sd, data.ini, state, mp5sd
	IniRead, bizon, data.ini, state, bizon
	IniRead, p90, data.ini, state, p90
	IniRead, cz75, data.ini, state, cz75
	IniRead, m249, data.ini, state, m249
	PixelGetColor, color1, 1912, 676
	if (color1 = 0xffffff)
		offset := 125
	else
	{
		PixelGetColor, color1, 1912, 759
		if (color1 = 0xffffff)
			offset := 43
		else
		{	
			PixelGetColor, color1, 1912, 628
			if (color1 = 0xffffff)
				offset := 174
			else
			{
				PixelGetColor, color1, 1912, 709
				if (color1 = 0xffffff)
					offset := 92
				else
				{
					PixelGetColor, color1, 1912, 718
					if (color1 = 0xffffff)
						offset := 82
					else if(color1 != 0xffffff)
						offset := 0
				}				
			}
		}
	}
	if ak47
	{
		x3 := 1826
		y3 := 806 - offset
	}
	else if aug
	{
		x3 := 1855
		y3 := 810 - offset
	}
	else if famas
	{
		x3 := 1856
		y3 := 801 - offset
	}
	else if galil
	{
		x3 := 1830
		y3 := 802 - offset
	}
	else if m4a1
	{
		x3 := 1826
		y3 := 810 - offset
	}
	else if m4a4
	{
		x3 := 1824
		y3 := 812 - offset
	}
	else if sg553
	{
		x3 := 1831
		y3 := 808 - offset
	}
	else if mac10
	{
		x3 := 1857
		y3 := 808 - offset
	}
	else if mp7
	{
		x3 := 1858
		y3 := 797 - offset
	}
	else if mp9
	{
		x3 := 1825
		y3 := 811 - offset
	}
	else if mp5sd
	{
		x3 := 1866
		y3 := 805 - offset
	}
	else if bizon
	{
		x3 := 1833
		y3 := 806 - offset
	}
	else if p90
	{
		x3 := 1871
		y3 := 815 - offset
	}
	else if ump45
	{
		x3 := 1802
		y3 := 807 - offset
	}
	else if cz75
	{
		x3 := 1874
		y3 := 889 - offset
	}
	else if m249
	{
		x3 := 1813
		y3 := 820 - offset
	}
	PixelGetColor, color1, %x3%, %y3%
	if(color1 = 0xffffff)
	{	
		if(state2 != 1)
		{
			state2 := 1
			Gui, 1:destroy
			Gui, 1:+ToolWindow -Caption +AlwaysOnTop +E0x20
			Gui, 1:Color, 0xffffff
			Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y0% NA
		}
	}
	else if(state2 != 0)
	{
		state2 := 0
		Gui, 1:destroy
		Gui, 1:+ToolWindow -Caption +AlwaysOnTop +E0x20
		Gui, 1:Color, 0x000000
		Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y0% NA
	}
	sleep 10
}