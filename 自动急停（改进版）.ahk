;以下参数请自行调整
time01 := 0 ;0到time01空档，不使用急停
time02 := 530 ;time01到time02急停
speed := 1.5 ;数值越大，急停反向运动时间越短

#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0

ListLines Off
SetKeyDelay,-1, 1
SetControlDelay, -1
SetMouseDelay, -1
SetWinDelay,-1
SetBatchLines,-1
Process, Priority, , High
ScriptActive = 1
state1 = 0
state2 = 0
state3 = 0
state4 = 0
w := 0.003862

if not A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

;按下空格后后0.5秒内取消制动（滚轮上滚为wheelup，滚轮下滚为wheeldown，将space修改成对应单词即可）
~*SPACE::
If ScriptActive
{
	start:=A_TickCount
	start += 1000
	while (A_TickCount < start)
	{
		state1 = 0
		state2 = 0
		state3 = 0
		state4 = 0
		sleep 50
	}
}

~*w::
If ScriptActive	 ;当开启脚本时
{
	start := A_TickCount ;将时钟值赋给start
	if !GetKeyState("shift","p")
	{
		Send {blind}{shift up}
	}
	state2 = 0
	state3 = 0
	state4 = 0
	while (GetKeyState("w","P")) ;当按下w时
	{
		state1 := A_TickCount - start
		sleep 1
	}
}
return

~*a::
If ScriptActive
{
	start := A_TickCount
	if !GetKeyState("shift","p")
	{
		Send {blind}{shift up}
	}
	state1 = 0
	state3 = 0
	state4 = 0
	while (GetKeyState("a","P"))
	{
		state2 := A_TickCount - start
		sleep 1
	}
}
return

~*s::
If ScriptActive
{
	start := A_TickCount
	if !GetKeyState("shift","p")
	{
		Send {blind}{shift up}
	}
	state1 = 0
	state2 = 0
	state4 = 0
	while (GetKeyState("s","P"))
	{
		state3 := A_TickCount - start
		sleep 1
	}
}
return

~*d::
If ScriptActive
{
	start := A_TickCount
	if !GetKeyState("shift","p")
	{
		Send {blind}{shift up}
	}
	state1 = 0
	state2 = 0
	state3 = 0
	while (GetKeyState("d","P"))
	{	
		state4 := A_TickCount - start
		sleep 1
	}
}
return

~*w up::
If (ScriptActive = 1 && state1 != 0) ;当脚本正在运行且不为空档时
{
	if(GetKeyState("shift","P")|| GetKeyState("ctrl","P")) ;如果有shift或者ctrl处于按下状态则退出制动
		return
	start := A_TickCount ;将时钟值赋给start
	Send {blind}{s down} ;使s键按下
	Send {blind}{shift down}
	if (state1 < time01)
		start := 0
	else if (state1 < time02)
	{
		start += (22.95 - 65.61*cos(state1*w) + 266.4*sin(state1*w) + 54.41*cos(2*state1*w) + 11.39*sin(2*state1*w))  / speed
	}
	else
	{
		start += (22.95 - 65.61*cos(time02*w) + 266.4*sin(time02*w) + 54.41*cos(2*time02*w) + 11.39*sin(2*time02*w))  / speed
	}
	while (!GetKeyState("shift","P") && !GetKeyState("ctrl","P") && !GetKeyState("w","P") && !GetKeyState("a","P") && !GetKeyState("s","P") && !GetKeyState("d","P") && A_TickCount < start)
	{
	}
	If !GetKeyState("s","P")
	{
		Send {blind}{s up}
	}
	if !GetKeyState("shift","p")
	{
		Send {blind}{shift up}
	}
}
return

~*a up::
If (ScriptActive = 1 && state2 != 0)
{
	if(GetKeyState("shift","P")|| GetKeyState("ctrl","P")) 
		return
	start := A_TickCount
	Send {blind}{d down}
	Send {blind}{shift down}
	if (state2 < time01)
		start := 0
	else if (state2 < time02)
	{
		start += (22.95 - 65.61*cos(state2*w) + 266.4*sin(state2*w) + 54.41*cos(2*state2*w) + 11.39*sin(2*state2*w)) / speed
	}
	else
	{
		start += (22.95 - 65.61*cos(time02*w) + 266.4*sin(time02*w) + 54.41*cos(2*time02*w) + 11.39*sin(2*time02*w))  / speed
	}
	While (!GetKeyState("shift","P") && !GetKeyState("ctrl","P") && !GetKeyState("w","P") && !GetKeyState("a","P") && !GetKeyState("s","P") && !GetKeyState("d","P") && A_TickCount<start)
	{
	}
	If !GetKeyState("d","P")
	{
		Send {blind}{d up}
	}
	if !GetKeyState("shift","p")
	{
		Send {blind}{shift up}
	}
}
return

~*s up::
If (ScriptActive = 1 && state3 != 0)
{
	state33 = 1
	if(GetKeyState("shift","P")|| GetKeyState("ctrl","P")) 
		return
	start:=A_TickCount
	Send {blind}{w down}
	Send {blind}{shift down}
	if (state3 < time01)
		start := 0
	else if (state3 < time02)
	{
		start += (22.95 - 65.61*cos(state3*w) + 266.4*sin(state3*w) + 54.41*cos(2*state3*w) + 11.39*sin(2*state3*w)) / speed
	}
	else
	{
		start += (22.95 - 65.61*cos(time02*w) + 266.4*sin(time02*w) + 54.41*cos(2*time02*w) + 11.39*sin(2*time02*w))  / speed
	}
	while (!GetKeyState("shift","P") && !GetKeyState("ctrl","P") && !GetKeyState("w","P") && !GetKeyState("a","P") && !GetKeyState("s","P") && !GetKeyState("d","P") && A_TickCount < start)
	{
	}
	If !GetKeyState("w","P")
	{
		Send {blind}{w up}
	}
	if !GetKeyState("shift","p")
	{
		Send {blind}{shift up}
	}
}
return

~*d up::
If (ScriptActive = 1 && state4 != 0)
{
	state44 = 1
	if(GetKeyState("shift","P")|| GetKeyState("ctrl","P")) 
		return
	start:=A_TickCount
	Send {blind}{a down}
	Send {blind}{shift down}
	if (state4 < time01)
		start := 0
	else if (state4 < time02)
	{
		start += (22.95 - 65.61*cos(state4*w) + 266.4*sin(state4*w) + 54.41*cos(2*state4*w) + 11.39*sin(2*state4*w)) / speed
	}
	else
	{
		start += (22.95 - 65.61*cos(time02*w) + 266.4*sin(time02*w) + 54.41*cos(2*time02*w) + 11.39*sin(2*time02*w))  / speed
	}
	while (!GetKeyState("shift","P") && !GetKeyState("ctrl","P") && !GetKeyState("w","P") && !GetKeyState("a","P") && !GetKeyState("s","P") && !GetKeyState("d","P") && A_TickCount < start)
	{
	}
	If !GetKeyState("a","P")
	{
		Send {blind}{a up}
	}
	if !GetKeyState("shift","p")
	{
		Send {blind}{shift up}
	}
}
return

;c为开关键
~c::
If ScriptActive
{
	ScriptActive := 0
	SoundPlay, %A_ScriptDir%\off.mp3
}
else
{
	ScriptActive := 1
	SoundPlay, %A_ScriptDir%\on.mp3
}
return