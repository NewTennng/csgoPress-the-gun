if not A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}
#NoEnv
#KeyHistory 0
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
ListLines Off
SetKeyDelay,-1, -1
SetControlDelay, -1
SetMouseDelay, -1
SetWinDelay, -1
SetBatchLines -1
Process, Priority, , H
SendMode, Play

;设置
sens := 1.25	;游戏内鼠标灵敏度，请自行修改
thickness := 4			;弹道标注点的大小，不想要弹道标注改为0即可
round := 30			;准心回弹距离，40为完全回弹，20为停止在结束射击的位置，0为不回弹
speed := 2			;准心回弹速度，1为标准速度，不会产生不正常的上跳
IniRead, width, data.ini, state, width 	;读取设置中宽度，默认为1920，如果不同请在首次进入游戏后按alt键自动获取
IniRead, height, data.ini, state, height ;读取设置中高度，默认为1080，如果不同请在首次进入游戏后按alt键自动获取
offsetx := 150 			;右上角文字距离屏幕右侧的距离
pos2 := 0				;右上角文字距离屏幕上侧的距离
offsetmark := 3.1			;如果标点不正确，偏上增加该值，偏下减小改值
word := 1 			;文字提示开关，1为开启，0为关闭
sound := 1			;语音提示开关，1为开启，0为关闭
safemode := 1			;安全模式，1为开启，按主键盘1开启压枪，2-0、Q、E、G、滚轮上下均关闭压枪，与主模式兼容
automode := 0			;是否需要自动检测功能，1为需要，0为不需要（不需要的话“test”脚本就不会自动开启）

;键位绑定，可自行修改
key_change := "Numpad0" 	;步枪/冲锋枪列表切换，需要切换到对应列表然后选枪
	;步枪
key_ak47 := "Numpad1" 	;ak47的键位，默认为小键盘1
key_galil := "Numpad2" 	;galil的键位，默认为小键盘2
key_sg553 := "Numpad3" 	;sg553的键位，默认为小键盘3
key_m4a4 := "Numpad4" 	;m4a4的键位，默认为小键盘4
key_famas := "Numpad5" 	;famas的键位，默认为小键盘5
key_aug := "Numpad6" 	;aug的键位，默认为小键盘6
key_m4a1 := "Numpad7" 	;m4a1的键位，默认为小键盘7
	;冲锋枪
key_mp9 := "Numpad1" 	;mp9的键位，默认为小键盘1
key_mac10 := "Numpad2" 	;mac10的键位，默认为小键盘2
key_ump45 := "Numpad3" 	;ump45的键位，默认为小键盘3
key_mp7 := "Numpad4" 	;mp7的键位，默认为小键盘4
key_mp5sd := "Numpad5" 	;mp5sd的键位，默认为小键盘5
key_bizon := "Numpad6" 	;bizon的键位，默认为小键盘6
key_p90 := "Numpad7" 	;p90的键位，默认为小键盘7
	;其他枪
key_cz75 := "Numpad8" 	;cz75的键位，默认为小键盘8
key_m249 := "Numpad9" 	;m249的键位，默认为小键盘9
	;功能键
key_function := "XButton1" 	;压枪功能开关键，默认为鼠标后侧键
key_auto := "v" 		;自动检测模式开关，默认为v键
key_shoot := "LButton" 	;开火键，默认为鼠标左键

;没事别乱碰
state := 0
auto := 0
x := 0
y := 0
x0 := 0
y0 := 0
x1 := 0.00
y1 := 0.00
x2 := 0
y2 := 0
x3 := width - 1
y3 := 3
tsleep := 0.00
tsleep0 := 0
tsleep2 := 0
tsleep3 := 0.00
list := 0
pos1 := width - offsetx
modifier2 := offsetmark * 2.5 / sens / height * 1080
Gui, 1:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
Gui, 1:Color, 0000ff 
if automode
	Run *RunAs test.ahk
SoundPlay, %A_ScriptDir%\welcome.mp3
sleep 1500
SoundPlay, %A_ScriptDir%\author.mp3

;主程序
loop 
{
	;压枪数据点
	if GetKeyState(key_shoot)&state
	{
		;将生成的代码复制到下面////////////////////////////////////////////////////////////////////////////
		if ak47
		{
			sleepdivider := 12
			sleepsuber := 0
			begintime := SystemTime()
			loop
			{
				atime := 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := 0
				y := 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(1)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(1)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(1)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(1)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(1)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(1)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(1)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(1)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(1)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(1)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(1)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 4)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 4)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 4)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 4)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 4)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 4)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 4)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 4)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 4)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 4)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -1)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -2)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -3)
				CombinedSleep2(5)
				atime := atime + 99.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 109.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 109.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 109.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 109.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 109.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 109.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 109.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 109.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 109.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 109.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 109.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 109.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
				break

			}
		}

		if aug
		{
			sleepdivider := 4
			sleepsuber := -0.9
			begintime := SystemTime()
			loop
			{
				atime := 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := 0
				y := 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(4)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(4)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(4)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 6)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 5)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 5)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 5)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 7)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 7)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 7)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 6)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 6
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 9)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 9
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 8)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 8)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 8)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 8
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 7)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 7)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 7)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 7)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 7
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 5)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 5)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 5)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 5)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 4)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 4)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 4)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 4)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -10, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 10
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -10, "UInt", -2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 10
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -10, "UInt", -2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 10
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -3)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -3)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -3)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -4)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", -2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -2)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 96.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 106.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 106.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(18)
				atime := atime + 106.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(18)
				atime := atime + 106.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
				break

			}
		}

		if bizon
		{
			sleepdivider := 3
			sleepsuber := 0.9
			begintime := SystemTime()
			loop
			{
				atime := 20.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := 0
				y := 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(2)
				atime := atime + 20.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(2)
				atime := atime + 20.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 5)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 5)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 6
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 9)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 9
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 9)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 9
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 8)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 8
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 8)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 8)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 8)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 8
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 7)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 7)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 7)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 7
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -11, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 11
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -11, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 11
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -11, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 11
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", -3)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", -3)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -3)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -3)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", -3)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", -3)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -3)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -11, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 11
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -11, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 11
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -11, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 11
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 83.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
				break

			}
		}

		if cz75
		{
			sleepdivider := 3
			sleepsuber := -3
			begintime := SystemTime()
			loop
			{
				atime := 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := 0
				y := 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 4)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 4)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 4)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 12)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 12
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 11)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 11
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 11)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 11
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 13, "UInt", 1)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 13
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 13, "UInt", 1)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 13
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 13, "UInt", 0)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 13
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 12, "UInt", 11)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 12
				y := y - 11
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 12, "UInt", 11)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 12
				y := y - 11
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 12, "UInt", 10)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 12
				y := y - 10
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -14, "UInt", 11)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 14
				y := y - 11
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -14, "UInt", 10)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 14
				y := y - 10
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -13, "UInt", 10)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 13
				y := y - 10
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -11, "UInt", 10)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 11
				y := y - 10
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -10, "UInt", 10)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 10
				y := y - 10
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -10, "UInt", 9)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 10
				y := y - 9
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -16, "UInt", 6)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 16
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -16, "UInt", 5)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 16
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -16, "UInt", 5)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 16
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", 10)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y - 10
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", 10)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y - 10
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 11, "UInt", 9)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 11
				y := y - 9
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 10)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 10
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 10)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 10
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 10)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 10
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 7)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 7)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 6)
				CombinedSleep2(22)
				atime := atime + 90.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 6
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
				break

			}
		}

		if famas
		{
			sleepdivider := 4
			sleepsuber := -0.4
			begintime := SystemTime()
			loop
			{
				atime := 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := 0
				y := 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(3)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(3)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(3)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 6)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 6)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 5)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 5)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 7)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 7)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 7)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 6)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 6
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 6)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 6)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 6)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 5)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 4)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 4)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 4)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 4)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 4)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 4)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 87.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 87.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 87.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 87.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 0)
				CombinedSleep2(13)
				atime := atime + 80.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 0)
				CombinedSleep2(13)
				atime := atime + 80.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -1)
				CombinedSleep2(13)
				atime := atime + 80.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -1)
				CombinedSleep2(13)
				atime := atime + 80.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 84.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 84.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 84.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 84.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -2)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -2)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -2)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -2)
				CombinedSleep2(14)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -3)
				CombinedSleep2(19)
				atime := atime + 118.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -3)
				CombinedSleep2(19)
				atime := atime + 118.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -4)
				CombinedSleep2(19)
				atime := atime + 118.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -4)
				CombinedSleep2(19)
				atime := atime + 118.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
				break

			}
		}

		if galil
		{
			sleepdivider := 4
			sleepsuber := -0.8
			begintime := SystemTime()
			loop
			{
				atime := 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := 0
				y := 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(4)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(4)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(4)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 4)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 4)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 5)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 5)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 4)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 4)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 7)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 7)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 7)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 6)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 6
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 8)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 8)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 8)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 8)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 8
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 6)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 6)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 5)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 5)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 5)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 5)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 4)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 4)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -10, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 10
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -10, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 10
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -10, "UInt", -3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 10
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -4)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", -2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", -3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", -3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", -3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -11, "UInt", -2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 11
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -11, "UInt", -2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 11
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -11, "UInt", -2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 11
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -10, "UInt", -2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 10
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 0)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -4)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -4)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -5)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -5)
				CombinedSleep2(14)
				atime := atime + 86.2 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 0)
				CombinedSleep2(18)
				atime := atime + 110.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 0)
				CombinedSleep2(18)
				atime := atime + 110.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(18)
				atime := atime + 110.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(18)
				atime := atime + 110.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
				break

			}
		}

		if m4a1
		{
			sleepdivider := 4
			sleepsuber := -0.6
			begintime := SystemTime()
			loop
			{
				atime := 60.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := 0
				y := 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(7)
				atime := atime + 60.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(7)
				atime := atime + 60.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(7)
				atime := atime + 60.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 4)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 4)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 4)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 6)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 5)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 5)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 5)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 7)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 7)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 6)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 6)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 6
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 7)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 6)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 6)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 6)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 6
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 4)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 4)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 4)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -2)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", -2)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -2)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -2)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -2)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", -2)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(20)
				atime := atime + 120.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(20)
				atime := atime + 120.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(20)
				atime := atime + 120.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(20)
				atime := atime + 120.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
				break

			}
		}

		if m4a4
		{
			sleepdivider := 4
			sleepsuber := -0.5
			begintime := SystemTime()
			loop
			{
				atime := 20.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := 0
				y := 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(2)
				atime := atime + 20.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(2)
				atime := atime + 20.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(2)
				atime := atime + 20.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 8)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 7)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 7)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 7)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 7
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 9)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 9
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 8)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 8)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 8)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 8
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 8)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 8)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 7)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 7)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 7
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 4)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 4)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 4)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -3)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -3)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -3)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 98.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 98.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 98.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 98.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 98.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 98.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 98.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 98.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
				break

			}
		}

		if m249
		{
			sleepdivider := 3
			sleepsuber := -1
			begintime := SystemTime()
			loop
			{
				atime := 20.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := 0
				y := 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(3)
				atime := atime + 20.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(3)
				atime := atime + 20.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 67.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 67.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 67.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 5)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 5)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 5)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 9)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 9
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 9)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 9
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 8)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 8
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 11)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 11
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 11)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 11
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 10)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 10
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 11)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 11
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 11)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 11
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 11)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 11
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 12)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 12
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 11)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 11
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 11)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 11
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", 10)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y - 10
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", 10)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y - 10
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 11, "UInt", 9)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 11
				y := y - 9
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", 8)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 11, "UInt", 7)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 11
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 11, "UInt", 7)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 11
				y := y - 7
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y - 6
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 6
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", -3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -14, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 14
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -13, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 13
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -13, "UInt", -3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 13
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 14, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 14
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 14, "UInt", -3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 14
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 14, "UInt", -3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 14
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 11, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 11
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 12, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 12
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 12, "UInt", -3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 12
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", -4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y + 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", -5)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y + 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", -5)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y + 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -11, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 11
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -11, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 11
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -10, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 10
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -14, "UInt", -7)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 14
				y := y + 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -14, "UInt", -8)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 14
				y := y + 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -14, "UInt", -8)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 14
				y := y + 8
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -11, "UInt", -8)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 11
				y := y + 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -11, "UInt", -8)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 11
				y := y + 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -11, "UInt", -8)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 11
				y := y + 8
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -10, "UInt", -7)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 10
				y := y + 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -7)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -7)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 7
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 12, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 12
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 12, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 12
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 12, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 12
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 11, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 11
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 12, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 12
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 12, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 12
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", 5)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", 5)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 5)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -13, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 13
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -13, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 13
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -13, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 13
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 14, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 14
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 14, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 14
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 14, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 14
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", -4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y + 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", -4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y + 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 11, "UInt", -4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 11
				y := y + 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 11, "UInt", -4)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 11
				y := y + 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 77.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 3)
				CombinedSleep2(22)
				atime := atime + 100.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 3)
				CombinedSleep2(22)
				atime := atime + 100.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 2)
				CombinedSleep2(22)
				atime := atime + 100.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
				break

			}
		}

		if mac10
		{
			sleepdivider := 3
			sleepsuber := -2.2
			begintime := SystemTime()
			loop
			{
				atime := 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := 0
				y := 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 6)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 6)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 5)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 7)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 7)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 7)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 7
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 11)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 11
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 10)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 10
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 10)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 10
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 9)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 9
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 9)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 9
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 9)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 9
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 8)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 7)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 7)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 7
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 5)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 4)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 4)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 5)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 4)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 4)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 5)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 5)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 4)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 3)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -13, "UInt", -2)
				CombinedSleep2(12)
				atime := atime + 48.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 13
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -12, "UInt", -3)
				CombinedSleep2(12)
				atime := atime + 48.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 12
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -12, "UInt", -3)
				CombinedSleep2(12)
				atime := atime + 48.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 12
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -2)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -2)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 1)
				CombinedSleep2(21)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(21)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(21)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 2)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 11, "UInt", -1)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 11
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -3)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -3)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -3)
				CombinedSleep2(16)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(18)
				atime := atime + 78.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(18)
				atime := atime + 78.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(18)
				atime := atime + 78.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
				break

			}
		}

		if mp5sd
		{
			sleepdivider := 3
			sleepsuber := 0
			begintime := SystemTime()
			loop
			{
				atime := 40.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := 0
				y := 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 40.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 40.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 6
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 7)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 7)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 7)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 7
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 5)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 5)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -3)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -4)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -4)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(21)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(21)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(21)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
				break

			}
		}

		if mp7
		{
			sleepdivider := 3
			sleepsuber := 0.1
			begintime := SystemTime()
			loop
			{
				atime := 40.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := 0
				y := 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 40.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(6)
				atime := atime + 40.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 6
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 7)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 7)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 7)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 7
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 5)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 6)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 5)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 4)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -3)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -4)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -4)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", -1)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", -2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(21)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(21)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(21)
				atime := atime + 95.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
				break

			}
		}

		if mp9
		{
			sleepdivider := 3
			sleepsuber := -0.3
			begintime := SystemTime()
			loop
			{
				atime := 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := 0
				y := 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 4)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 8)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 8)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 7)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 7
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 10)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 10
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 9)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 9
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 9)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 9
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 9)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 9
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 9)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 9
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 8)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 8
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 10)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 10
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 9)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 9
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 9)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 9
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 7)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 6)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 6)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 6
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", 4)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", 4)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", 4)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 10, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 10
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 11, "UInt", -2)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 11
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 11, "UInt", -2)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 11
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 11, "UInt", -3)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 11
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 4)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 4)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 4)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 4)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -10, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 10
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -10, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 10
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -10, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 10
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 4)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 4)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 4)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 4)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -13, "UInt", -4)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 13
				y := y + 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -13, "UInt", -4)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 13
				y := y + 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -12, "UInt", -5)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 12
				y := y + 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 9, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 9
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -12, "UInt", -3)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 12
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -11, "UInt", -3)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 11
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -11, "UInt", -3)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 11
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 69.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(17)
				atime := atime + 79.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
				break

			}
		}

		if p90
		{
			sleepdivider := 3
			sleepsuber := -0.7
			begintime := SystemTime()
			loop
			{
				atime := 20.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := 0
				y := 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(3)
				atime := atime + 20.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(3)
				atime := atime + 20.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 4)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 7)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 7)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 6)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 6
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 8)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 7)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 7)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 7
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 7)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 6)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 6)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 6
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 6)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 6)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 4)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 6)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 5)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 3)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", -3)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", -2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", -2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", -2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", -2)
				CombinedSleep2(15)
				atime := atime + 68.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
				break

			}
		}

		if sg553
		{
			sleepdivider := 4
			sleepsuber := -0.9
			begintime := SystemTime()
			loop
			{
				atime := 20.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := 0
				y := 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(2)
				atime := atime + 20.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(2)
				atime := atime + 20.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(2)
				atime := atime + 20.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 3)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 4)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 4)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 4)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 3)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 7)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 7)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 7)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 7)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 7
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 9)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 9
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 8)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 8)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 8)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 8
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 9)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 9
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 9)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 9
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 8)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 8)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 8
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 9)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 9
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 8)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 8)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 8)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 8
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 3)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 3)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 3)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 5)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 4)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 4)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 4)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -3, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 3
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 0)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 0)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 0)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -1)
				CombinedSleep2(20)
				atime := atime + 117.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -1)
				CombinedSleep2(20)
				atime := atime + 117.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", -1)
				CombinedSleep2(20)
				atime := atime + 117.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -2)
				CombinedSleep2(20)
				atime := atime + 117.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -7, "UInt", -4)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 7
				y := y + 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", -5)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y + 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", -5)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y + 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", -5)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y + 5
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -3)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -3)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -3)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", -3)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 87.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 0)
				CombinedSleep2(15)
				atime := atime + 87.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 87.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", -1)
				CombinedSleep2(15)
				atime := atime + 87.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 13, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 13
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 13, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 13
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 14, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 14
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 14, "UInt", 1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 14
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 16, "UInt", -1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 16
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 16, "UInt", -1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 16
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 16, "UInt", -2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 16
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 17, "UInt", -2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 17
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 11, "UInt", -1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 11
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 11, "UInt", -1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 11
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 11, "UInt", -1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 11
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 12, "UInt", -2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 12
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 4)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 4)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 4)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 3)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 3)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 3)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 0)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", -1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", -2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", -2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", -3)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", -3)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -12, "UInt", -1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 12
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -12, "UInt", -1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 12
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -12, "UInt", -1)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 12
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -12, "UInt", -2)
				CombinedSleep2(18)
				atime := atime + 107.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 12
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
				break

			}
		}

		if ump45
		{
			sleepdivider := 3
			sleepsuber := -0.4
			begintime := SystemTime()
			loop
			{
				atime := 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := 0
				y := 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(5)
				atime := atime + 30.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 3)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 3)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 4)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 3)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 3)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 8)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 7)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 7
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 7)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 7
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 10)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 10
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 10)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 10
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 9)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 9
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 10)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 10
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 10)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 10
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -4, "UInt", 9)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 4
				y := y - 9
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 11)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 11
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 11)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 11
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 11)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 11
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 8)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 8)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 8
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", 7)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y - 7
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 5)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 5)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 5
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 4)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 4
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 6)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 6)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 6
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", 6)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y - 6
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 4)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 4
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 3)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", 3)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y - 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 2)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 2)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", 2)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 3)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", 2)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", 2)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 2)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 4, "UInt", -2)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 4
				y := y + 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", 0)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 2, "UInt", -1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 2
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 3, "UInt", -1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 3
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -6, "UInt", 2)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 6
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -5, "UInt", 2)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 5
				y := y - 2
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", 1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -8, "UInt", 1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 8
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", 0)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 0, "UInt", -1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 0
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 1, "UInt", -1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 1
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 5, "UInt", -2)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 5
				y := y + 2
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -3)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 3
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 6, "UInt", -3)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 6
				y := y + 3
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", -1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 7, "UInt", -1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 7
				y := y + 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", 8, "UInt", -1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x - 8
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", 0)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", 0)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -9, "UInt", -1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 9
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -2, "UInt", 0)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 2
				y := y - 0
				if !GetKeyState(key_shoot)
				{
					recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
					break
				}

				DllCall("mouse_event", "UInt", 1, "UInt", -1, "UInt", -1)
				CombinedSleep2(19)
				atime := atime + 88.0 / sleepdivider - sleepsuber
				CombinedSleep(atime, begintime)
				x := x + 1
				y := y + 1
				x1 := x / modifier2 + width / 2 - thickness / 2
				y1 := y / modifier2 + height / 2 - thickness / 2
				Gui, 1:Show, w%thickness% h%thickness% x%x1% y%y1% NA
				recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
				break

			}
		}


		;将生成的代码复制到上面////////////////////////////////////////////////////////////////////////////
	}
	else if auto&automode
	{
		PixelGetColor, color1, 1919, 1
		if(color1 = 0xffffff)
		{
			if !state
			{
				state := 1
				if word
				{
					Gui, 2: destroy
					Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
					Gui, 2:color, abcdefg
					Gui 2:+ lastfound
					winset, transcolor, abcdefg
					Gui, 2:Font, s20 c770077 w1000
					Gui, 2:add, text,, on
					pos := pos2 + 60
					Gui, 2:Show, x%pos1% y%pos% NA
				}
			}
		}
		else if state
		{
			state := 0
			if word
			{
				Gui, 2: destroy
				Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 2:color, abcdefg
				Gui 2:+ lastfound
				winset, transcolor, abcdefg
				Gui, 2:Font, s20 c770077 w1000
				Gui, 2:add, text,, off
				pos := pos2 + 60
				Gui, 2:Show, x%pos1% y%pos% NA
			}
		}
	}
	;压枪开关
	if GetKeyState(key_function)
	{
		if auto
		{
			auto := 0
			state := 0
			if sound
				SoundPlay, %A_ScriptDir%\modeoff.mp3
			if word
			{
				Gui, 4: destroy
				Gui, 4:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 4:color, abcdefg
				Gui 4:+ lastfound
				winset, transcolor, abcdefg
				Gui, 4:Font, s20 c770077 w1000
				Gui, 4:add, text,, Manual
				pos := pos2 + 100
				Gui, 4:Show, x%pos1% y%pos% NA
				Gui, 2: destroy
				Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 2:color, abcdefg
				Gui 2:+ lastfound
				winset, transcolor, abcdefg
				Gui, 2:Font, s20 c770077 w1000
				Gui, 2:add, text,, off
				pos := pos2 + 60
				Gui, 2:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}
		else if state
		{
			state := 0
			if sound
				SoundPlay, %A_ScriptDir%\off.mp3
			if word
			{
				Gui, 2: destroy
				Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 2:color, abcdefg
				Gui 2:+ lastfound
				winset, transcolor, abcdefg
				Gui, 2:Font, s20 c770077 w1000
				Gui, 2:add, text,, off
				pos := pos2 + 60
				Gui, 2:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}
		else
		{
			state := 1
			if sound
				SoundPlay, %A_ScriptDir%\on.mp3
			if word
			{
				Gui, 2: destroy
				Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 2:color, abcdefg
				Gui 2:+ lastfound
				winset, transcolor, abcdefg
				Gui, 2:Font, s20 c770077 w1000
				Gui, 2:add, text,, on
				pos := pos2 + 60
				Gui, 2:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}

	}
	;自动检测模式开关
	if GetKeyState(key_auto)
	{
		if auto&automode
		{
			auto := 0
			if sound
				SoundPlay, %A_ScriptDir%\modeoff.mp3
			if word
			{
				Gui, 4: destroy
				Gui, 4:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 4:color, abcdefg
				Gui 4:+ lastfound
				winset, transcolor, abcdefg
				Gui, 4:Font, s20 c770077 w1000
				Gui, 4:add, text,, Manual
				pos := pos2 + 100
				Gui, 4:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}
		else
		{
			auto := 1
			if sound
				SoundPlay, %A_ScriptDir%\modeon.mp3
			if word
			{
				Gui, 4: destroy
				Gui, 4:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 4:color, abcdefg
				Gui 4:+ lastfound
				winset, transcolor, abcdefg
				Gui, 4:Font, s20 c770077 w1000
				Gui, 4:add, text,, Auto
				pos := pos2 + 100
				Gui, 4:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}
	}
	;切换枪
	if GetKeyState(key_change)
	{
		if list
		{
			list = 0
			if sound
				SoundPlay, %A_ScriptDir%\rifle.mp3
			sleep 100
		}
		else
		{
			list = 1
			if sound
				SoundPlay, %A_ScriptDir%\submachine.mp3
			sleep 100
		}	
	}
	if list
	{
		if GetKeyState(key_mp9)
		{
			ak47 := 0
			galil := 0
			sg553 := 0
			m4a4 := 0
			m4a1 := 0
			famas := 0
			aug := 0
			mp9 := 1
			mac10 := 0
			ump45 := 0
			mp7 := 0
			mp5sd := 0
			bizon := 0
			p90 := 0
			cz75 := 0
			m249 := 0
			IniWrite, 0, data.ini, state, ak47
			IniWrite, 0, data.ini, state, galil
			IniWrite, 0, data.ini, state, sg553
			IniWrite, 0, data.ini, state, m4a4
			IniWrite, 0, data.ini, state, m4a1
			IniWrite, 0, data.ini, state, famas
			IniWrite, 0, data.ini, state, aug
			IniWrite, 1, data.ini, state, mp9
			IniWrite, 0, data.ini, state, mac10
			IniWrite, 0, data.ini, state, ump45
			IniWrite, 0, data.ini, state, mp7
			IniWrite, 0, data.ini, state, mp5sd
			IniWrite, 0, data.ini, state, bizon
			IniWrite, 0, data.ini, state, p90
			IniWrite, 0, data.ini, state, cz75
			IniWrite, 0, data.ini, state, m249
			if sound
				SoundPlay, %A_ScriptDir%\mp9.mp3
			if word
			{
				Gui, 3: destroy
				Gui, 3:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 3:color, abcdefg
				Gui 3:+ lastfound
				winset, transcolor, abcdefg
				Gui, 3:Font, s20 c770077 w1000
				Gui, 3:add, text,, MP9
				pos := pos2 + 20
				Gui, 3:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}
		else if GetKeyState(key_mac10)
		{
			ak47 := 0
			galil := 0
			sg553 := 0
			m4a4 := 0
			m4a1 := 0
			famas := 0
			aug := 0
			mp9 := 0
			mac10 := 1
			ump45 := 0
			mp7 := 0
			mp5sd := 0
			bizon := 0
			p90 := 0
			cz75 := 0
			m249 := 0
			IniWrite, 0, data.ini, state, ak47
			IniWrite, 0, data.ini, state, galil
			IniWrite, 0, data.ini, state, sg553
			IniWrite, 0, data.ini, state, m4a4
			IniWrite, 0, data.ini, state, m4a1
			IniWrite, 0, data.ini, state, famas
			IniWrite, 0, data.ini, state, aug
			IniWrite, 0, data.ini, state, mp9
			IniWrite, 1, data.ini, state, mac10
			IniWrite, 0, data.ini, state, ump45
			IniWrite, 0, data.ini, state, mp7
			IniWrite, 0, data.ini, state, mp5sd
			IniWrite, 0, data.ini, state, bizon
			IniWrite, 0, data.ini, state, p90
			IniWrite, 0, data.ini, state, cz75
			IniWrite, 0, data.ini, state, m249
			if sound
				SoundPlay, %A_ScriptDir%\mac10.mp3
			if word
			{
				Gui, 3: destroy
				Gui, 3:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 3:color, abcdefg
				Gui 3:+ lastfound
				winset, transcolor, abcdefg
				Gui, 3:Font, s20 c770077 w1000
				Gui, 3:add, text,, MAC-10
				pos := pos2 + 20
				Gui, 3:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}
		else if GetKeyState(key_ump45)
		{
			ak47 := 0
			galil := 0
			sg553 := 0
			m4a4 := 0
			m4a1 := 0
			famas := 0
			aug := 0
			mp9 := 0
			mac10 := 0
			ump45 := 1
			mp7 := 0
			mp5sd := 0
			bizon := 0
			p90 := 0
			cz75 := 0
			m249 := 0
			IniWrite, 0, data.ini, state, ak47
			IniWrite, 0, data.ini, state, galil
			IniWrite, 0, data.ini, state, sg553
			IniWrite, 0, data.ini, state, m4a4
			IniWrite, 0, data.ini, state, m4a1
			IniWrite, 0, data.ini, state, famas
			IniWrite, 0, data.ini, state, aug
			IniWrite, 0, data.ini, state, mp9
			IniWrite, 0, data.ini, state, mac10
			IniWrite, 1, data.ini, state, ump45
			IniWrite, 0, data.ini, state, mp7
			IniWrite, 0, data.ini, state, mp5sd
			IniWrite, 0, data.ini, state, bizon
			IniWrite, 0, data.ini, state, p90
			IniWrite, 0, data.ini, state, cz75
			IniWrite, 0, data.ini, state, m249
			if sound
				SoundPlay, %A_ScriptDir%\ump45.mp3
			if word
			{
				Gui, 3: destroy
				Gui, 3:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 3:color, abcdefg
				Gui 3:+ lastfound
				winset, transcolor, abcdefg
				Gui, 3:Font, s20 c770077 w1000
				Gui, 3:add, text,, UMP-45
				pos := pos2 + 20
				Gui, 3:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}
		else if GetKeyState(key_mp7)
		{
			ak47 := 0
			galil := 0
			sg553 := 0
			m4a4 := 0
			m4a1 := 0
			famas := 0
			aug := 0
			mp9 := 0
			mac10 := 0
			ump45 := 0
			mp7 := 1
			mp5sd := 0
			bizon := 0
			p90 := 0
			cz75 := 0
			m249 := 0
			IniWrite, 0, data.ini, state, ak47
			IniWrite, 0, data.ini, state, galil
			IniWrite, 0, data.ini, state, sg553
			IniWrite, 0, data.ini, state, m4a4
			IniWrite, 0, data.ini, state, m4a1
			IniWrite, 0, data.ini, state, famas
			IniWrite, 0, data.ini, state, aug
			IniWrite, 0, data.ini, state, mp9
			IniWrite, 0, data.ini, state, mac10
			IniWrite, 0, data.ini, state, ump45
			IniWrite, 1, data.ini, state, mp7
			IniWrite, 0, data.ini, state, mp5sd
			IniWrite, 0, data.ini, state, bizon
			IniWrite, 0, data.ini, state, p90
			IniWrite, 0, data.ini, state, cz75
			IniWrite, 0, data.ini, state, m249
			if sound
				SoundPlay, %A_ScriptDir%\mp7.mp3
			if word
			{
				Gui, 3: destroy
				Gui, 3:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 3:color, abcdefg
				Gui 3:+ lastfound
				winset, transcolor, abcdefg
				Gui, 3:Font, s20 c770077 w1000
				Gui, 3:add, text,, MP7
				pos := pos2 + 20
				Gui, 3:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}
		else if GetKeyState(key_mp5sd)
		{
			ak47 := 0
			galil := 0
			sg553 := 0
			m4a4 := 0
			m4a1 := 0
			famas := 0
			aug := 0
			mp9 := 0
			mac10 := 0
			ump45 := 0
			mp7 := 0
			mp5sd := 1
			bizon := 0
			p90 := 0
			cz75 := 0
			m249 := 0
			IniWrite, 0, data.ini, state, ak47
			IniWrite, 0, data.ini, state, galil
			IniWrite, 0, data.ini, state, sg553
			IniWrite, 0, data.ini, state, m4a4
			IniWrite, 0, data.ini, state, m4a1
			IniWrite, 0, data.ini, state, famas
			IniWrite, 0, data.ini, state, aug
			IniWrite, 0, data.ini, state, mp9
			IniWrite, 0, data.ini, state, mac10
			IniWrite, 0, data.ini, state, ump45
			IniWrite, 0, data.ini, state, mp7
			IniWrite, 1, data.ini, state, mp5sd
			IniWrite, 0, data.ini, state, bizon
			IniWrite, 0, data.ini, state, p90
			IniWrite, 0, data.ini, state, cz75
			IniWrite, 0, data.ini, state, m249
			if sound
				SoundPlay, %A_ScriptDir%\mp5sd.mp3
			if word
			{
				Gui, 3: destroy
				Gui, 3:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 3:color, abcdefg
				Gui 3:+ lastfound
				winset, transcolor, abcdefg
				Gui, 3:Font, s20 c770077 w1000
				Gui, 3:add, text,, MP5SD
				pos := pos2 + 20
				Gui, 3:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}
		else if GetKeyState(key_bizon)
		{
			ak47 := 0
			galil := 0
			sg553 := 0
			m4a4 := 0
			m4a1 := 0
			famas := 0
			aug := 0
			mp9 := 0
			mac10 := 0
			ump45 := 0
			mp7 := 0
			mp5sd := 0
			bizon := 1
			p90 := 0
			cz75 := 0
			m249 := 0
			IniWrite, 0, data.ini, state, ak47
			IniWrite, 0, data.ini, state, galil
			IniWrite, 0, data.ini, state, sg553
			IniWrite, 0, data.ini, state, m4a4
			IniWrite, 0, data.ini, state, m4a1
			IniWrite, 0, data.ini, state, famas
			IniWrite, 0, data.ini, state, aug
			IniWrite, 0, data.ini, state, mp9
			IniWrite, 0, data.ini, state, mac10
			IniWrite, 0, data.ini, state, ump45
			IniWrite, 0, data.ini, state, mp7
			IniWrite, 0, data.ini, state, mp5sd
			IniWrite, 1, data.ini, state, bizon
			IniWrite, 0, data.ini, state, p90
			IniWrite, 0, data.ini, state, cz75
			IniWrite, 0, data.ini, state, m249
			if sound
				SoundPlay, %A_ScriptDir%\bizon.mp3
			if word
			{
				Gui, 3: destroy
				Gui, 3:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 3:color, abcdefg
				Gui 3:+ lastfound
				winset, transcolor, abcdefg
				Gui, 3:Font, s20 c770077 w1000
				Gui, 3:add, text,, Bizon
				pos := pos2 + 20
				Gui, 3:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}
		else if GetKeyState(key_p90)
		{
			ak47 := 0
			galil := 0
			sg553 := 0
			m4a4 := 0
			m4a1 := 0
			famas := 0
			aug := 0
			mp9 := 0
			mac10 := 0
			ump45 := 0
			mp7 := 0
			mp5sd := 0
			bizon := 0
			p90 := 1
			cz75 := 0
			m249 := 0
			IniWrite, 0, data.ini, state, ak47
			IniWrite, 0, data.ini, state, galil
			IniWrite, 0, data.ini, state, sg553
			IniWrite, 0, data.ini, state, m4a4
			IniWrite, 0, data.ini, state, m4a1
			IniWrite, 0, data.ini, state, famas
			IniWrite, 0, data.ini, state, aug
			IniWrite, 0, data.ini, state, mp9
			IniWrite, 0, data.ini, state, mac10
			IniWrite, 0, data.ini, state, ump45
			IniWrite, 0, data.ini, state, mp7
			IniWrite, 0, data.ini, state, mp5sd
			IniWrite, 0, data.ini, state, bizon
			IniWrite, 1, data.ini, state, p90
			IniWrite, 0, data.ini, state, cz75
			IniWrite, 0, data.ini, state, m249
			if sound
				SoundPlay, %A_ScriptDir%\p90.mp3
			if word
			{
				Gui, 3: destroy
				Gui, 3:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 3:color, abcdefg
				Gui 3:+ lastfound
				winset, transcolor, abcdefg
				Gui, 3:Font, s20 c770077 w1000
				Gui, 3:add, text,, P90
				pos := pos2 + 20
				Gui, 3:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}
	}
	else
	{
		if GetKeyState(key_ak47)
		{
			ak47 := 1
			galil := 0
			sg553 := 0
			m4a4 := 0
			m4a1 := 0
			famas := 0
			aug := 0
			mp9 := 0
			mac10 := 0
			ump45 := 0
			mp7 := 0
			mp5sd := 0
			bizon := 0
			p90 := 0
			cz75 := 0
			m249 := 0
			IniWrite, 1, data.ini, state, ak47
			IniWrite, 0, data.ini, state, galil
			IniWrite, 0, data.ini, state, sg553
			IniWrite, 0, data.ini, state, m4a4
			IniWrite, 0, data.ini, state, m4a1
			IniWrite, 0, data.ini, state, famas
			IniWrite, 0, data.ini, state, aug
			IniWrite, 0, data.ini, state, mp9
			IniWrite, 0, data.ini, state, mac10
			IniWrite, 0, data.ini, state, ump45
			IniWrite, 0, data.ini, state, mp7
			IniWrite, 0, data.ini, state, mp5sd
			IniWrite, 0, data.ini, state, bizon
			IniWrite, 0, data.ini, state, p90
			IniWrite, 0, data.ini, state, cz75
			IniWrite, 0, data.ini, state, m249
			if sound
				SoundPlay, %A_ScriptDir%\ak47.mp3
			if word
			{
				Gui, 3: destroy
				Gui, 3:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 3:color, abcdefg
				Gui 3:+ lastfound
				winset, transcolor, abcdefg
				Gui, 3:Font, s20 c770077 w1000
				Gui, 3:add, text,, AK-47
				pos := pos2 + 20
				Gui, 3:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}
		else if GetKeyState(key_galil)
		{
			ak47 := 0
			galil := 1
			sg553 := 0
			m4a4 := 0
			m4a1 := 0
			famas := 0
			aug := 0
			mp9 := 0
			mac10 := 0
			ump45 := 0
			mp7 := 0
			mp5sd := 0
			bizon := 0
			p90 := 0
			cz75 := 0
			m249 := 0
			IniWrite, 0, data.ini, state, ak47
			IniWrite, 1, data.ini, state, galil
			IniWrite, 0, data.ini, state, sg553
			IniWrite, 0, data.ini, state, m4a4
			IniWrite, 0, data.ini, state, m4a1
			IniWrite, 0, data.ini, state, famas
			IniWrite, 0, data.ini, state, aug
			IniWrite, 0, data.ini, state, mp9
			IniWrite, 0, data.ini, state, mac10
			IniWrite, 0, data.ini, state, ump45
			IniWrite, 0, data.ini, state, mp7
			IniWrite, 0, data.ini, state, mp5sd
			IniWrite, 0, data.ini, state, bizon
			IniWrite, 0, data.ini, state, p90
			IniWrite, 0, data.ini, state, cz75
			IniWrite, 0, data.ini, state, m249
			if sound
				SoundPlay, %A_ScriptDir%\galil.mp3
			if word
			{
				Gui, 3: destroy
				Gui, 3:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 3:color, abcdefg
				Gui 3:+ lastfound
				winset, transcolor, abcdefg
				Gui, 3:Font, s20 c770077 w1000
				Gui, 3:add, text,, Galil
				pos := pos2 + 20
				Gui, 3:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}
		else if GetKeyState(key_sg553)
		{
			ak47 := 0
			galil := 0
			sg553 := 1
			m4a4 := 0
			m4a1 := 0
			famas := 0
			aug := 0
			mp9 := 0
			mac10 := 0
			ump45 := 0
			mp7 := 0
			mp5sd := 0
			bizon := 0
			p90 := 0
			cz75 := 0
			m249 := 0
			IniWrite, 0, data.ini, state, ak47
			IniWrite, 0, data.ini, state, galil
			IniWrite, 1, data.ini, state, sg553
			IniWrite, 0, data.ini, state, m4a4
			IniWrite, 0, data.ini, state, m4a1
			IniWrite, 0, data.ini, state, famas
			IniWrite, 0, data.ini, state, aug
			IniWrite, 0, data.ini, state, mp9
			IniWrite, 0, data.ini, state, mac10
			IniWrite, 0, data.ini, state, ump45
			IniWrite, 0, data.ini, state, mp7
			IniWrite, 0, data.ini, state, mp5sd
			IniWrite, 0, data.ini, state, bizon
			IniWrite, 0, data.ini, state, p90
			IniWrite, 0, data.ini, state, cz75
			IniWrite, 0, data.ini, state, m249
			if sound
				SoundPlay, %A_ScriptDir%\sg553.mp3
			if word
			{
				Gui, 3: destroy
				Gui, 3:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 3:color, abcdefg
				Gui 3:+ lastfound
				winset, transcolor, abcdefg
				Gui, 3:Font, s20 c770077 w1000
				Gui, 3:add, text,, SG553
				pos := pos2 + 20
				Gui, 3:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}
		else if GetKeyState(key_m4a4)
		{
			ak47 := 0
			galil := 0
			sg553 := 0
			m4a4 := 1
			m4a1 := 0
			famas := 0
			aug := 0
			mp9 := 0
			mac10 := 0
			ump45 := 0
			mp7 := 0
			mp5sd := 0
			bizon := 0
			p90 := 0
			cz75 := 0
			m249 := 0
			IniWrite, 0, data.ini, state, ak47
			IniWrite, 0, data.ini, state, galil
			IniWrite, 0, data.ini, state, sg553
			IniWrite, 1, data.ini, state, m4a4
			IniWrite, 0, data.ini, state, m4a1
			IniWrite, 0, data.ini, state, famas
			IniWrite, 0, data.ini, state, aug
			IniWrite, 0, data.ini, state, mp9
			IniWrite, 0, data.ini, state, mac10
			IniWrite, 0, data.ini, state, ump45
			IniWrite, 0, data.ini, state, mp7
			IniWrite, 0, data.ini, state, mp5sd
			IniWrite, 0, data.ini, state, bizon
			IniWrite, 0, data.ini, state, p90
			IniWrite, 0, data.ini, state, cz75
			IniWrite, 0, data.ini, state, m249
			if sound
				SoundPlay, %A_ScriptDir%\m4a4.mp3
			if word
			{
				Gui, 3: destroy
				Gui, 3:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 3:color, abcdefg
				Gui 3:+ lastfound
				winset, transcolor, abcdefg
				Gui, 3:Font, s20 c770077 w1000
				Gui, 3:add, text,, M4A4
				pos := pos2 + 20
				Gui, 3:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}
		else if GetKeyState(key_m4a1)
		{
			ak47 := 0
			galil := 0
			sg553 := 0
			m4a4 := 0
			m4a1 := 1
			famas := 0
			aug := 0
			mp9 := 0
			mac10 := 0
			ump45 := 0
			mp7 := 0
			mp5sd := 0
			bizon := 0
			p90 := 0
			cz75 := 0
			m249 := 0
			IniWrite, 0, data.ini, state, ak47
			IniWrite, 0, data.ini, state, galil
			IniWrite, 0, data.ini, state, sg553
			IniWrite, 0, data.ini, state, m4a4
			IniWrite, 1, data.ini, state, m4a1
			IniWrite, 0, data.ini, state, famas
			IniWrite, 0, data.ini, state, aug
			IniWrite, 0, data.ini, state, mp9
			IniWrite, 0, data.ini, state, mac10
			IniWrite, 0, data.ini, state, ump45
			IniWrite, 0, data.ini, state, mp7
			IniWrite, 0, data.ini, state, mp5sd
			IniWrite, 0, data.ini, state, bizon
			IniWrite, 0, data.ini, state, p90
			IniWrite, 0, data.ini, state, cz75
			IniWrite, 0, data.ini, state, m249
			if sound
				SoundPlay, %A_ScriptDir%\m4a1.mp3
			if word
			{
				Gui, 3: destroy
				Gui, 3:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 3:color, abcdefg
				Gui 3:+ lastfound
				winset, transcolor, abcdefg
				Gui, 3:Font, s20 c770077 w1000
				Gui, 3:add, text,, M4A1
				pos := pos2 + 20
				Gui, 3:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}
		else if GetKeyState(key_famas)
		{
			ak47 := 0
			galil := 0
			sg553 := 0
			m4a4 := 0
			m4a1 := 0
			famas := 1
			aug := 0
			mp9 := 0
			mac10 := 0
			ump45 := 0
			mp7 := 0
			mp5sd := 0
			bizon := 0
			p90 := 0
			cz75 := 0
			m249 := 0
			IniWrite, 0, data.ini, state, ak47
			IniWrite, 0, data.ini, state, galil
			IniWrite, 0, data.ini, state, sg553
			IniWrite, 0, data.ini, state, m4a4
			IniWrite, 0, data.ini, state, m4a1
			IniWrite, 1, data.ini, state, famas
			IniWrite, 0, data.ini, state, aug
			IniWrite, 0, data.ini, state, mp9
			IniWrite, 0, data.ini, state, mac10
			IniWrite, 0, data.ini, state, ump45
			IniWrite, 0, data.ini, state, mp7
			IniWrite, 0, data.ini, state, mp5sd
			IniWrite, 0, data.ini, state, bizon
			IniWrite, 0, data.ini, state, p90
			IniWrite, 0, data.ini, state, cz75
			IniWrite, 0, data.ini, state, m249
			if sound
				SoundPlay, %A_ScriptDir%\famas.mp3
			if word
			{
				Gui, 3: destroy
				Gui, 3:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 3:color, abcdefg
				Gui 3:+ lastfound
				winset, transcolor, abcdefg
				Gui, 3:Font, s20 c770077 w1000
				Gui, 3:add, text,, Famas
				pos := pos2 + 20
				Gui, 3:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}
		else if GetKeyState(key_aug)
		{
			ak47 := 0
			galil := 0
			sg553 := 0
			m4a4 := 0
			m4a1 := 0
			famas := 0
			aug := 1
			mp9 := 0
			mac10 := 0
			ump45 := 0
			mp7 := 0
			mp5sd := 0
			bizon := 0
			p90 := 0
			cz75 := 0
			m249 := 0
			IniWrite, 0, data.ini, state, ak47
			IniWrite, 0, data.ini, state, galil
			IniWrite, 0, data.ini, state, sg553
			IniWrite, 0, data.ini, state, m4a4
			IniWrite, 0, data.ini, state, m4a1
			IniWrite, 0, data.ini, state, famas
			IniWrite, 1, data.ini, state, aug
			IniWrite, 0, data.ini, state, mp9
			IniWrite, 0, data.ini, state, mac10
			IniWrite, 0, data.ini, state, ump45
			IniWrite, 0, data.ini, state, mp7
			IniWrite, 0, data.ini, state, mp5sd
			IniWrite, 0, data.ini, state, bizon
			IniWrite, 0, data.ini, state, p90
			IniWrite, 0, data.ini, state, cz75
			IniWrite, 0, data.ini, state, m249
			if sound
				SoundPlay, %A_ScriptDir%\aug.mp3
			if word
			{
				Gui, 3: destroy
				Gui, 3:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
				Gui, 3:color, abcdefg
				Gui 3:+ lastfound
				winset, transcolor, abcdefg
				Gui, 3:Font, s20 c770077 w1000
				Gui, 3:add, text,, AUG
				pos := pos2 + 20
				Gui, 3:Show, x%pos1% y%pos% NA
			}
			sleep 100
		}
	}
	if GetKeyState(key_cz75)
	{
		ak47 := 0
		galil := 0
		sg553 := 0
		m4a4 := 0
		m4a1 := 0
		famas := 0
		aug := 0
		mp9 := 0
		mac10 := 0
		ump45 := 0
		mp7 := 0
		mp5sd := 0
		bizon := 0
		p90 := 0
		cz75 := 1
		m249 := 0
		IniWrite, 0, data.ini, state, ak47
		IniWrite, 0, data.ini, state, galil
		IniWrite, 0, data.ini, state, sg553
		IniWrite, 0, data.ini, state, m4a4
		IniWrite, 0, data.ini, state, m4a1
		IniWrite, 0, data.ini, state, famas
		IniWrite, 0, data.ini, state, aug
		IniWrite, 0, data.ini, state, mp9
		IniWrite, 0, data.ini, state, mac10
		IniWrite, 0, data.ini, state, ump45
		IniWrite, 0, data.ini, state, mp7
		IniWrite, 0, data.ini, state, mp5sd
		IniWrite, 0, data.ini, state, bizon
		IniWrite, 0, data.ini, state, p90
		IniWrite, 1, data.ini, state, cz75
		IniWrite, 0, data.ini, state, m249
		if sound
			SoundPlay, %A_ScriptDir%\cz75.mp3
		if word
		{
			Gui, 3: destroy
			Gui, 3:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
			Gui, 3:color, abcdefg
			Gui 3:+ lastfound
			winset, transcolor, abcdefg
			Gui, 3:Font, s20 c770077 w1000
			Gui, 3:add, text,, CZ75
			pos := pos2 + 20
			Gui, 3:Show, x%pos1% y%pos% NA
		}
		sleep 100
	}
	if GetKeyState(key_m249)
	{
		ak47 := 0
		galil := 0
		sg553 := 0
		m4a4 := 0
		m4a1 := 0
		famas := 0
		aug := 0
		mp9 := 0
		mac10 := 0
		ump45 := 0
		mp7 := 0
		mp5sd := 0
		bizon := 0
		p90 := 0
		cz75 := 0
		m249 := 1
		IniWrite, 0, data.ini, state, ak47
		IniWrite, 0, data.ini, state, galil
		IniWrite, 0, data.ini, state, sg553
		IniWrite, 0, data.ini, state, m4a4
		IniWrite, 0, data.ini, state, m4a1
		IniWrite, 0, data.ini, state, famas
		IniWrite, 0, data.ini, state, aug
		IniWrite, 0, data.ini, state, mp9
		IniWrite, 0, data.ini, state, mac10
		IniWrite, 0, data.ini, state, ump45
		IniWrite, 0, data.ini, state, mp7
		IniWrite, 0, data.ini, state, mp5sd
		IniWrite, 0, data.ini, state, bizon
		IniWrite, 0, data.ini, state, p90
		IniWrite, 0, data.ini, state, cz75
		IniWrite, 1, data.ini, state, m249
		if sound
			SoundPlay, %A_ScriptDir%\m249.mp3
		if word
		{
			Gui, 3: destroy
			Gui, 3:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
			Gui, 3:color, abcdefg
			Gui 3:+ lastfound
			winset, transcolor, abcdefg
			Gui, 3:Font, s20 c770077 w1000
			Gui, 3:add, text,, M249
			pos := pos2 + 20
			Gui, 3:Show, x%pos1% y%pos% NA
		}
		sleep 100
	}
	CombinedSleep2(1)
}

recover(x, y, x0, y0, x1, y1, x2, y2, tsleep, tsleep0, tsleep2, tsleep3, round, speed)
{
	Gui, 1:hide
	DllCall("mouse_event", uint, 4, int, 0, int, 0, uint, 0, int, 0)
	tsleep3 := 0 
	x1 := 0
	y1 := 0
	x2 := floor(x / 40)
	y2 := floor(y / 40)
	loop %round%
	{
		tsleep := (150 + 1.1 * sqrt(x * x + y * y) ) / round / speed
		tsleep2 := floor(tsleep)
		tsleep3 := tsleep3 + tsleep - tsleep2
		if(tsleep3 >= 1)
		{
			tsleep3 := tsleep3 - 1
			tsleep0 := tsleep2 + 1
		}
		else
			tsleep0 := tsleep2
		CombinedSleep2(tsleep0)
		x1 := x1 + x / 40 - x2
		y1 := y1 + y / 40 - y2
		if (x1 >= 1)
		{
			x1 := x1 - 1
			x0 := x2 + 1
		}
		else
			x0 := x2
		if (y1 >= 1)
		{
			y1 := y1 - 1
			y0 := y2 + 1
		}
		else
			y0 := y2		
		DllCall("mouse_event", uint, 1, "UInt", x0, "UInt", y0)
		if getkeystate(key_shoot)
			break
	}
}

SystemTime() 
{	
	static freq
	if (!freq)
	DllCall("QueryPerformanceFrequency", "Int64*", freq)
	DllCall("QueryPerformanceCounter", "Int64*", tick)
	Return tick / freq * 1000
}

CombinedSleep(atime, begintime) 
{
	DllCall("QueryPerformanceFrequency", "Int64*", freq)
	t_tmp := (begintime + atime) * freq / 1000 
	While (t_current < t_tmp)
		DllCall("QueryPerformanceCounter", "Int64*", t_current)
}

CombinedSleep2(value) 
{
	DllCall("Winmm.dll\timeBeginPeriod", UInt, 1)
        	DllCall("Sleep", "UInt", value)
	DllCall("Winmm.dll\timeEndPeriod", UInt, 1)
}

~*1::
if !state&safemode
{
	state := 1
	if sound
		SoundPlay, %A_ScriptDir%\on.mp3
	if word
	{
		Gui, 2: destroy
		Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
		Gui, 2:color, abcdefg
		Gui 2:+ lastfound
		winset, transcolor, abcdefg
		Gui, 2:Font, s20 c770077 w1000
		Gui, 2:add, text,, on
		pos := pos2 + 60
		Gui, 2:Show, x%pos1% y%pos% NA
	}
	sleep 100
}
return
~*2::
if state&safemode
{
	state := 0
	if sound
		SoundPlay, %A_ScriptDir%\off.mp3
	if word
	{
		Gui, 2: destroy
		Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
		Gui, 2:color, abcdefg
		Gui 2:+ lastfound
		winset, transcolor, abcdefg
		Gui, 2:Font, s20 c770077 w1000
		Gui, 2:add, text,, off
		pos := pos2 + 60
		Gui, 2:Show, x%pos1% y%pos% NA
	}
	sleep 100
}
return
~*3::
if state&safemode
{
	state := 0
	if sound
		SoundPlay, %A_ScriptDir%\off.mp3
	if word
	{
		Gui, 2: destroy
		Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
		Gui, 2:color, abcdefg
		Gui 2:+ lastfound
		winset, transcolor, abcdefg
		Gui, 2:Font, s20 c770077 w1000
		Gui, 2:add, text,, off
		pos := pos2 + 60
		Gui, 2:Show, x%pos1% y%pos% NA
	}
	sleep 100
}
return
~*4::
if state&safemode
{
	state := 0
	if sound
		SoundPlay, %A_ScriptDir%\off.mp3
	if word
	{
		Gui, 2: destroy
		Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
		Gui, 2:color, abcdefg
		Gui 2:+ lastfound
		winset, transcolor, abcdefg
		Gui, 2:Font, s20 c770077 w1000
		Gui, 2:add, text,, off
		pos := pos2 + 60
		Gui, 2:Show, x%pos1% y%pos% NA
	}
	sleep 100
}
return
~*5::
if state&safemode
{
	state := 0
	if sound
		SoundPlay, %A_ScriptDir%\off.mp3
	if word
	{
		Gui, 2: destroy
		Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
		Gui, 2:color, abcdefg
		Gui 2:+ lastfound
		winset, transcolor, abcdefg
		Gui, 2:Font, s20 c770077 w1000
		Gui, 2:add, text,, off
		pos := pos2 + 60
		Gui, 2:Show, x%pos1% y%pos% NA
	}
	sleep 100
}
return
~*6::
if state&safemode
{
	state := 0
	if sound
		SoundPlay, %A_ScriptDir%\off.mp3
	if word
	{
		Gui, 2: destroy
		Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
		Gui, 2:color, abcdefg
		Gui 2:+ lastfound
		winset, transcolor, abcdefg
		Gui, 2:Font, s20 c770077 w1000
		Gui, 2:add, text,, off
		pos := pos2 + 60
		Gui, 2:Show, x%pos1% y%pos% NA
	}
	sleep 100
}
return
~*7::
if state&safemode
{
	state := 0
	if sound
		SoundPlay, %A_ScriptDir%\off.mp3
	if word
	{
		Gui, 2: destroy
		Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
		Gui, 2:color, abcdefg
		Gui 2:+ lastfound
		winset, transcolor, abcdefg
		Gui, 2:Font, s20 c770077 w1000
		Gui, 2:add, text,, off
		pos := pos2 + 60
		Gui, 2:Show, x%pos1% y%pos% NA
	}
	sleep 100
}
return
~*8::
if state&safemode
{
	state := 0
	if sound
		SoundPlay, %A_ScriptDir%\off.mp3
	if word
	{
		Gui, 2: destroy
		Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
		Gui, 2:color, abcdefg
		Gui 2:+ lastfound
		winset, transcolor, abcdefg
		Gui, 2:Font, s20 c770077 w1000
		Gui, 2:add, text,, off
		pos := pos2 + 60
		Gui, 2:Show, x%pos1% y%pos% NA
	}
	sleep 100
}
return
~*9::
if state&safemode
{
	state := 0
	if sound
		SoundPlay, %A_ScriptDir%\off.mp3
	if word
	{
		Gui, 2: destroy
		Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
		Gui, 2:color, abcdefg
		Gui 2:+ lastfound
		winset, transcolor, abcdefg
		Gui, 2:Font, s20 c770077 w1000
		Gui, 2:add, text,, off
		pos := pos2 + 60
		Gui, 2:Show, x%pos1% y%pos% NA
	}
	sleep 100
}
return
~*0::
if state&safemode
{
	state := 0
	if sound
		SoundPlay, %A_ScriptDir%\off.mp3
	if word
	{
		Gui, 2: destroy
		Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
		Gui, 2:color, abcdefg
		Gui 2:+ lastfound
		winset, transcolor, abcdefg
		Gui, 2:Font, s20 c770077 w1000
		Gui, 2:add, text,, off
		pos := pos2 + 60
		Gui, 2:Show, x%pos1% y%pos% NA
	}
	sleep 100
}
return
~*g::
if state&safemode
{
	state := 0
	if sound
		SoundPlay, %A_ScriptDir%\off.mp3
	if word
	{
		Gui, 2: destroy
		Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
		Gui, 2:color, abcdefg
		Gui 2:+ lastfound
		winset, transcolor, abcdefg
		Gui, 2:Font, s20 c770077 w1000
		Gui, 2:add, text,, off
		pos := pos2 + 60
		Gui, 2:Show, x%pos1% y%pos% NA
	}
	sleep 100
}
return
~*q::
if state&safemode
{
	state := 0
	if sound
		SoundPlay, %A_ScriptDir%\off.mp3
	if word
	{
		Gui, 2: destroy
		Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
		Gui, 2:color, abcdefg
		Gui 2:+ lastfound
		winset, transcolor, abcdefg
		Gui, 2:Font, s20 c770077 w1000
		Gui, 2:add, text,, off
		pos := pos2 + 60
		Gui, 2:Show, x%pos1% y%pos% NA
	}
	sleep 100
}
return
~*e::
if state&safemode
{
	state := 0
	if sound
		SoundPlay, %A_ScriptDir%\off.mp3
	if word
	{
		Gui, 2: destroy
		Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
		Gui, 2:color, abcdefg
		Gui 2:+ lastfound
		winset, transcolor, abcdefg
		Gui, 2:Font, s20 c770077 w1000
		Gui, 2:add, text,, off
		pos := pos2 + 60
		Gui, 2:Show, x%pos1% y%pos% NA
	}
	sleep 100
}
return
~*wheelup::
if state&safemode
{
	state := 0
	if sound
		SoundPlay, %A_ScriptDir%\off.mp3
	if word
	{
		Gui, 2: destroy
		Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
		Gui, 2:color, abcdefg
		Gui 2:+ lastfound
		winset, transcolor, abcdefg
		Gui, 2:Font, s20 c770077 w1000
		Gui, 2:add, text,, off
		pos := pos2 + 60
		Gui, 2:Show, x%pos1% y%pos% NA
	}
	sleep 100
}
return
~*wheeldown::
if state&safemode
{
	state := 0
	if sound
		SoundPlay, %A_ScriptDir%\off.mp3
	if word
	{
		Gui, 2: destroy
		Gui, 2:+ToolWindow -Caption +AlwaysOnTop +E0x08000000
		Gui, 2:color, abcdefg
		Gui 2:+ lastfound
		winset, transcolor, abcdefg
		Gui, 2:Font, s20 c770077 w1000
		Gui, 2:add, text,, off
		pos := pos2 + 60
		Gui, 2:Show, x%pos1% y%pos% NA
	}
	sleep 100
}
return
~*alt::
WinGetPos , X, Y, width, height, A
IniWrite, %width%, data.ini, state, width
IniWrite, %height%, data.ini, state, height
pos1 := width - offsetx
modifier2 := offsetmark * 2.5 / sens / height * 1080 
sleep 100
return