sens := 2.5		;游戏内鼠标灵敏度，请修改成自己的值

name := "ak47"
length := 30
multiple := 6
sleepdivider := 6
sleepsuber := -0.1
file := name ".csv"
data := []
data2 := []
readdata(data, length, file, sens)
calculate(data, data2, multiple, length)
writecode(data2, multiple, length, name, sleepdivider, sleepsuber)

name := "aug"
length := 30
multiple := 4
sleepdivider := 4
sleepsuber := -0.9
file := name ".csv"
data := []
data2 := []
readdata(data, length, file, sens)
calculate(data, data2, multiple, length)
writecode(data2, multiple, length, name, sleepdivider, sleepsuber)

name := "bizon"
length := 64
multiple := 3
sleepdivider := 3
sleepsuber := 0.9
file := name ".csv"
data := []
data2 := []
readdata(data, length, file, sens)
calculate(data, data2, multiple, length)
writecode(data2, multiple, length, name, sleepdivider, sleepsuber)

name := "cz75"
length := 12
multiple := 3
sleepdivider := 3
sleepsuber := -3
file := name ".csv"
data := []
data2 := []
readdata(data, length, file, sens)
calculate(data, data2, multiple, length)
writecode(data2, multiple, length, name, sleepdivider, sleepsuber)

name := "famas"
length := 25
multiple := 4
sleepdivider := 4
sleepsuber := -0.4
file := name ".csv"
data := []
data2 := []
readdata(data, length, file, sens)
calculate(data, data2, multiple, length)
writecode(data2, multiple, length, name, sleepdivider, sleepsuber)

name := "galil"
length := 35
multiple := 4
sleepdivider := 4
sleepsuber := -0.8
file := name ".csv"
data := []
data2 := []
readdata(data, length, file, sens)
calculate(data, data2, multiple, length)
writecode(data2, multiple, length, name, sleepdivider, sleepsuber)

name := "m4a1"
length := 25
multiple := 4
sleepdivider := 4
sleepsuber := -0.6
file := name ".csv"
data := []
data2 := []
readdata(data, length, file, sens)
calculate(data, data2, multiple, length)
writecode(data2, multiple, length, name, sleepdivider, sleepsuber)

name := "m4a4"
length := 30
multiple := 4
sleepdivider := 4
sleepsuber := -0.5
file := name ".csv"
data := []
data2 := []
readdata(data, length, file, sens)
calculate(data, data2, multiple, length)
writecode(data2, multiple, length, name, sleepdivider, sleepsuber)

name := "m249"
length := 100
multiple := 3
sleepdivider := 3
sleepsuber := -1
file := name ".csv"
data := []
data2 := []
readdata(data, length, file, sens)
calculate(data, data2, multiple, length)
writecode(data2, multiple, length, name, sleepdivider, sleepsuber)

name := "mac10"
length := 30
multiple := 3
sleepdivider := 3
sleepsuber := -2.2
file := name ".csv"
data := []
data2 := []
readdata(data, length, file, sens)
calculate(data, data2, multiple, length)
writecode(data2, multiple, length, name, sleepdivider, sleepsuber)

name := "mp5sd"
length := 30
multiple := 3
sleepdivider := 3
sleepsuber := 0
file := name ".csv"
data := []
data2 := []
readdata(data, length, file, sens)
calculate(data, data2, multiple, length)
writecode(data2, multiple, length, name, sleepdivider, sleepsuber)

name := "mp7"
length := 30
multiple := 3
sleepdivider := 3
sleepsuber := 0.1
file := name ".csv"
data := []
data2 := []
readdata(data, length, file, sens)
calculate(data, data2, multiple, length)
writecode(data2, multiple, length, name, sleepdivider, sleepsuber)

name := "mp9"
length := 30
multiple := 3
sleepdivider := 3
sleepsuber := -0.3
file := name ".csv"
data := []
data2 := []
readdata(data, length, file, sens)
calculate(data, data2, multiple, length)
writecode(data2, multiple, length, name, sleepdivider, sleepsuber)

name := "p90"
length := 50
multiple := 3
sleepdivider := 3
sleepsuber := -0.7
file := name ".csv"
data := []
data2 := []
readdata(data, length, file, sens)
calculate(data, data2, multiple, length)
writecode(data2, multiple, length, name, sleepdivider, sleepsuber)

name := "sg553"
length := 30
multiple := 4
sleepdivider := 4
sleepsuber := -0.9
file := name ".csv"
data := []
data2 := []
readdata(data, length, file, sens)
calculate(data, data2, multiple, length)
writecode(data2, multiple, length, name, sleepdivider, sleepsuber)

name := "ump45"
length := 25
multiple := 3
sleepdivider := 3
sleepsuber := -0.4
file := name ".csv"
data := []
data2 := []
readdata(data, length, file, sens)
calculate(data, data2, multiple, length)
writecode(data2, multiple, length, name, sleepdivider, sleepsuber)

msgbox 完成

readdata(data, length, file, sens)
{
	i := 1
	while(i <= length)
	{
		FileReadLine, temp, %file%, i
    		if ErrorLevel
		{
       			msgbox 出错
			break
		}
		temp2 := []
		temp2 := StrSplit(temp, ",")
		data[i,1] := temp2[1] *2.5 / sens
		data[i,2] := temp2[2] *2.5 / sens
		data[i,3] := round(temp2[3], 1)
		i := i + 1
	}
}

writecode(data, multiple, length, name, sleepdivider, sleepsuber)
{
	text := "		if "name
	FileAppend , %text%`n, code2.txt, UTF-8
	text := "		{"
	FileAppend , %text%`n, code2.txt, UTF-8
	text := "			sleepdivider := "
	FileAppend , %text%%sleepdivider%`n, code2.txt, UTF-8
	text := "			sleepsuber := "
	FileAppend , %text%%sleepsuber%`n, code2.txt, UTF-8
	text := "			begintime := SystemTime()"
	FileAppend , %text%`n, code2.txt, UTF-8
	text := "			loop"
	FileAppend , %text%`n, code2.txt, UTF-8
	text := "			{"
	FileAppend , %text%`n, code2.txt, UTF-8
	i := 1
	while(i <= length*multiple)
	{
		if(i == 1)
		{
			text := "				atime := "data[i,3]" / sleepdivider - sleepsuber"
			FileAppend , %text%`n, code2.txt, UTF-8
			text := "				CombinedSleep(atime, begintime)"
			FileAppend , %text%`n, code2.txt, UTF-8
			text := "				x := 0"
			FileAppend , %text%`n, code2.txt, UTF-8
			text := "				y := 0"
			FileAppend , %text%`n, code2.txt, UTF-8
		}
		else
		{
			if(i <= multiple)
				temp := floor((data[i,3] / sleepdivider - sleepsuber) / 2)
			else
				temp := floor((data[i,3] / sleepdivider - sleepsuber) / 3 * 2)
			text := "				CombinedSleep2(" temp ")"
			FileAppend , %text%`n, code.txt, UTF-8
			text := "				atime := atime + "data[i,3]" / sleepdivider - sleepsuber"
			FileAppend , %text%`n, code2.txt, UTF-8
			text := "				CombinedSleep(atime, begintime)"
			FileAppend , %text%`n, code2.txt, UTF-8
			if(data[i,1]>0)
			{
				flag := "-"
				b1 := abs(data[i,1])
			}
			else
			{
				flag := "+"
				b1 := abs(data[i,1])
			}
			text := "				"
			FileAppend , %text%x := x %flag% %b1%`n, code2.txt, UTF-8
			if(data[i,2]>0)
			{
				flag := "+"
				b2 := abs(data[i,2])
			}
			else
			{
				flag := "-"
				b2 := abs(data[i,2])
			}
			text := "				"
			FileAppend , %text%y := y %flag% %b2%`n, code2.txt, UTF-8
		}
		text := "				"
		if(i > multiple && mod(i, multiple) == 0)
		{
			FileAppend , %text%x1 := x / modifier2 + width / 2 - thickness / 2`n, code2.txt, UTF-8
			FileAppend , %text%y1 := y / modifier2 + height / 2 - thickness / 2`n, code2.txt, UTF-8
			text := "				Gui, 1:+ToolWindow -Caption +AlwaysOnTop +E0x08000000"
			FileAppend , %text%`n, code2.txt, UTF-8
			text := "				Gui, 1:Color, 0000ff"
			FileAppend , %text%`n, code2.txt, UTF-8
			text := "				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA"
			FileAppend , %text%`n, code2.txt, UTF-8
		}
		if(i < length * multiple)
		{
			text := "				if !GetKeyState(key_shoot)"
			FileAppend , %text%`n, code2.txt, UTF-8
			text := "				{"
			FileAppend , %text%`n, code2.txt, UTF-8
			text := "					Gui, 1:destroy"
			FileAppend , %text%`n, code2.txt, UTF-8
			text := "					break"
			FileAppend , %text%`n, code2.txt, UTF-8
			text := "				}"
			FileAppend , %text%`n, code2.txt, UTF-8
		}
		else
		{
			text := "				Gui, 1:destroy"
			FileAppend , %text%`n, code2.txt, UTF-8
			text := "				sleep 1000"
			FileAppend , %text%`n, code2.txt, UTF-8
			text := "				break"
			FileAppend , %text%`n, code2.txt, UTF-8
		}
		if i != length * multiple
			FileAppend , `n, code2.txt, UTF-8
		i := i + 1
	}
	text := "			}"
	FileAppend , %text%`n, code2.txt, UTF-8
	text := "		}"
	FileAppend , %text%`n, code2.txt, UTF-8
	FileAppend , `n, code2.txt, UTF-8
}

calculate(term1, term2, multiple, length)
{
	sumx := 0
	sumy := 0
	sumxo := 0
	sumyo := 0
	i := 1
	while(i <= length)
	{
		ii := 1
		while(ii <= multiple)
		{
			term2[multiple * i + ii - multiple,1] := Floor(term1[i,1] / multiple)
			term2[multiple * i + ii - multiple,2] := Floor(term1[i,2] / multiple)
       	 		term2[multiple * i + ii - multiple,3] := term1[i,3]
        			sumx := sumx + term2[multiple * i + ii - multiple,1]
        			sumy := sumy + term2[multiple * i + ii - multiple,2]
			ii := ii + 1
		}
		
    		sumxo := sumxo + term1[i,1]
    		sumyo := sumyo + term1[i,2]
    		gap1 := Round(sumxo - sumx)
    		gap2 := Round(sumyo - sumy)
		iii := 1
   		if(gap1 > 0)
		{
       	 		while(iii <= gap1)
			{
            				term2[multiple * i - iii + 1,1] := term2[multiple * i - iii + 1,1] + 1
            				sumx := sumx + 1
				iii := iii + 1
        			}
    		}
		iii := 1
   		if(gap2 > 0)
		{
       	 		while(iii <= gap2)
			{
            				term2[multiple * i - iii + 1,2] := term2[multiple * i - iii + 1,2] + 1
            				sumy := sumy + 1
				iii := iii + 1
        			}
    		}
		i := i + 1
	}
}
