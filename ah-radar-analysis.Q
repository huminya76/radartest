[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=98df6bb0-90be-4019-a597-7d12da872630
Description=ah-radar分析
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
//各个子项目数量
Dim num(9), line(9), l_num
num(0) = 5  //num_资产安全 
num(1) = 11 //num_边界安全 
num(2) = 10 //num_网内攻击 
num(3) = 8  //num_异常访问 
num(4) = 5  //num_安全隐患 
num(5) = 5  //num_违规行为 
num(6) = 9  //num_信令安全 
num(7) = 2  //num_专题分析 
num(8) = 9  //num_会话明细 
//分析图标的坐标
x_分析 = 32
y_分析 = 345
//第一个子项目收起来后的坐标-资产安全
x_资产安全 = 51
y_资产安全 = 375
//第一个子项目的第一个选项坐标
x_1 = 99  //资产变更x
y_1 = 440 //资产变更y
For all = 1 to 9999
    //在首页打开分析页面
    TracePrint "在首页打开分析页面第" & all & "次：：" & Now
    MoveTo 948, 140
    LeftClick 1
    Delay 3000
    //在分析页面点资产安全5个页面
    //TracePrint "在分析页面点资产安全5个页面" & Now
    For j = 0 to 8   //j为子项目行数，最大9行
        //先将页面的各个选项收起来
        MoveTo 1850, 260
        LeftClick 1
        Delay 1000 
        //移动到第j+1个子项目
        xx = x_资产安全
        yy = y_资产安全 + j * 50
        MoveTo xx, yy
        LeftClick 1
        Delay 3000
        //计算每个子项目的项目行数，按每行6个：num \ 6 + 1
        line(j) = num(j) \ 6 + 1
        //TracePrint "line(" & j & ")== " & line(j)
        For k = 1 To line(j)
            xxx = x_1
            yyy = yy + 88 * k   //子项目内的行距
            If k = line(j) Then  //最后一行
                l_num = num(j) Mod 6
            Else 
                l_num = 6
            End If
            //TracePrint "num== "& num(j) & " and " & "l_num== " & l_num
            For i = 0 to l_num - 1   //i为列数，最大6列
                MoveTo xxx + i * 274, yyy
                Delay 1000
                LeftClick 1
                Delay 5000
                //返回分析页面
                MoveTo 928, 140
                LeftClick 1
                Delay 3000
                //截图保存
                tt = Plugin.GetSysInfo.GetDateTime               
                picName = "D:\jietu\PIC" & tt & ".jpg"                
                TracePrint picName
                Call Plugin.Pic.PrintScreen(0, 0, 1920, 1080, picName)
                Delay 1000
            Next    	
        Next 
      Next
    //按F5刷新页面，恢复页面默认
    KeyPress "F5", 1
	Delay 10 * 1000
Next 