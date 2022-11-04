#SingleInstance Force
#Persistent
^!+j::
    count:= 10000
    c = 0
    while(c < count){
        c++
        sendInput, lorem ipsum bien largo wey
    }
return
previousTab = ""
^Lbutton::
    if(WinActive("ahk_exe brave.exe")){
        sendInput, {ctrl down}{shift down}{tab}{ctrl up}{shift up}
    }
return
^Rbutton::
    if(WinActive("ahk_exe brave.exe")){
        sendInput, {ctrl down}{tab}{ctrl up}
    }
return
PgDn & NumLock::
    sendInput, ^+{a}
    sleep, 250
    sendInput, netflix
    sleep, 300
    sendInput, {enter}
return
SetTimer, autoLoginDz, 500
ClickAndBack(){
persistSkip:
    ImageSearch, x, y, 0, 0, 1366, 768, C:\Users\facel\OneDrive\Desktop\AutoHotKey\\basescript-ahk\files\skipintro.png
    if(x>0){
        blockinput, on
        MouseGetPos, xo, yo, , , 
        mousemove, x,y,4
        click
        sleep, 10
        mousemove, xo,yo,4
        blockinput, off

    }
return
}
autoLoginRemoteDz(){
autoLoginDz:
    msgbox, hola
    ImageSearch, x, y, 0, 0, 1366, 768, C:\Users\facel\OneDrive\Desktop\AutoHotKey\basescript-ahk\files\remotelogin.png
    if(x > 0){
        ; MsgBox, [ Options, Title, Text, Timeout]  
        blockInput, on
        mousemove, 173, 210 , 0
        click
        sleep, 500
        mousemove, 250, 500 , 0
        Clipboard:= "100101011010110Password10010"
        sleep, 500
        sendInput, ^{v}
        sleep, 500
        sendInput, {enter}
        x:=0
        y:=0
        blockInput, off
        sleep, 5000
    }
return
}

^+lbutton::
    sendInput, {alt down}{left}{alt up}
return
^+Rbutton::
    sendInput, {alt down}{right}{alt up}
return
getCurrentDesktopID(){
    RegRead, cur, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\VirtualDesktops, CurrentVirtualDesktop
    RegRead, all, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops, VirtualDesktopIDs
    ix := floor(InStr(all,cur) / strlen(cur))
return ix
}

^#Lbutton::
    sendInput, {ctrl down}{Lwin down}{left}{ctrl up}{Lwin up}
return
^#Rbutton::
    sendInput, {ctrl down}{Lwin down}{right}{ctrl up}{Lwin up}
return

::comit:: 
    sendInput, git commit -a -m "
    keywait, CTRL, D
    keywait, CTRL, U
    sendInput, " {enter}
    keywait, CTRL, D
    keywait, CTRL, U
    Clipboard:= "git push"
    sendInput, ^{v} 
    sleep, 50
    sendInput, {enter}

return

:*:npmd::
    sendInput, ^{c}
    sleep, 100
    sendInput, ^{c}
    sleep, 100
    sendInput, ^{c}
    sendInput, npm run dev
    sendInput, {enter}
return
:*:npmb::
    sendInput, ^{c}
    sleep, 100
    sendInput, ^{c}
    sleep, 100
    sendInput, ^{c}
    sendInput, npm run build
    sendInput, {enter}
return
pgdn & Up::
    Run nircmd.exe changebrightness +20
    sleep, 100
    cbnss:= GetCurrentBrightNess()
    ToolTip, %cbnss%
    SetTimer, RemoveToolTip, 400, 150

return
pgdn & Left::
    Run nircmd.exe changebrightness -110
    sleep, 100
    cbnss:= GetCurrentBrightNess()
    ToolTip, %cbnss%
    SetTimer, RemoveToolTip, 400, 150
return
pgdn & Right::
    Run nircmd.exe changebrightness +110
    sleep, 100
    cbnss:= GetCurrentBrightNess()
    ToolTip, %cbnss%
    SetTimer, RemoveToolTip, 400, 150
return
pgdn & Down::
    Run nircmd.exe changebrightness -20
    sleep, 100
    cbnss:= GetCurrentBrightNess()
    ToolTip, %cbnss%
    SetTimer, RemoveToolTip, 400, 150
return

GetCurrentBrightNess()
{
    For property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightness" )
        currentBrightness := property.CurrentBrightness

return currentBrightness
}

RemoveToolTip:
    ToolTip
return
::psh::
    sendInput, passphrase{enter}
return
^+!c::
    {
        SendInput, ^c
        Sleep 100
        Run, %clipboard%
        Return
    }
^+y:: ;select a query and run this macro to search in youtube. Opens browser if is closed
    {
        SendInput, ^c
        Sleep 100
        Run, https://www.youtube.com/results?search_query=%clipboard%
        Return
    }
^+!y:: ;Copy a youtube path and run this hotkey
    {
        SendInput, ^c
        Sleep 100
        ytid:= StrSplit(clipboard, "=")
        id:= ytid[2]
        yid:= StrSplit(id, "&")
        id:= yid[1]
        Run, https://www.y2mate.com/youtube/%id%
        Return
    }

^+c:: ;select a google search and run this macro to search in
    {
        SendInput, ^c
        Sleep 100
        Run, http://www.google.com/search?q=%clipboard%
        Return
    }

:*:git clone:: ;copy a github url, go to your terminal and type git clone, then press ctrl when the repo is fully downloaded, then press contol again to get into the folder with the repo name

    { 
        url:= clipboard
        sendInput, git clone %clipboard% {enter}
        keywait, ctrl, D
        keywait, ctrl, U
        array := StrSplit(url, "/")
        fname := array.pop()
        array2 := StrSplit(fname, ".")
        fname2 := array2[1]
        Clipboard:= fname2
        keywait, ctrl, D
        keywait, ctrl, U
        sendInput, cd %clipboard% {enter}
        sleep, 800
        sendInput, code . {enter}
    }
Return

#Del::
    FileRecycleEmpty ; win + del
Return
^+!NumLock::
    run, C:\Users\facel\OneDrive\Desktop\scripts\minecraft-ahk\Minecraft.ahk
ExitApp, 0
return
::inpy:: ;autologin when proyecta page is in the screen
    sleep, 100
    sendInput, {tab 2}
    sleep, 50
    sendInput, {enter}
    sleep, 200
    sendInput, {tab 10}
    sleep, 50
    sendInput, 1118150082
    sendInput, {tab}
    sendInput, ee538c60
    sleep, 100
    sendInput, {enter}
    keywait, ctrl, D
    keywait, ctrl, U
    sendInput, {alt down}{d}{alt up}
    sleep, 50
    sendInput, https://proyecta.utch.edu.mx/salumno/informacion
    sendInput, {enter}
return

:*:ps44::
    sendInput, Password44
    sendInput, {enter}
return
:*:status::
    sendInput, git status
    sendInput, {enter}
return
^+!Lbutton:: ;draw a circle, beta
    sendInput, ^e
    sendInput, {delete}
    MouseGetPos, X, Y
    MouseMove, 326, 83, 0
    Click
    MouseMove, X, Y, 0

    ; Input my radius
    InputBox, Radius, Radius, Input Radius
    ; Draw my circle
    sleep, 100
    BlockInput, ON
    Radius= 50
    MouseGetPos, StartX, StartY
    MouseMove, 0, %Radius%, 0, R
    MouseClick, Left, , , , 0, D
    Loop 64
    {
        xVar := Radius*Sin(A_Index/10)
        yVar := Radius*Cos(A_Index/10)
        DrawX := StartX+xVar
        DrawY := StartY+yVar
        MouseMove, %DrawX%, %DrawY%, 0
        MouseMove, %DrawX%, %DrawY%, 0
    }
    MouseClick, Left, , , , 0, U
    sleep, 100
    BlockInput, ON
    r:=100, speed:=0, nLaps:=1, dir:=-1
    cont:= 0
    pi:=3.1416, n:=2*r*pi
    points := []
    t:=0
    SetMouseDelay, -1
    CoordMode, Mouse, Screen
    MouseGetPos, OX, OY
    MouseMove, OX+r*cos(t:=((A_Index)/n)), OY+dir*r*sin(t), speed
    MouseClick, Left, , , , 0, D
    while ((t<=2*pi*nLaps)) {
        cont++
        MouseMove, OX+r*cos(t:=((A_Index-1)/n)), OY+dir*r*sin(t), speed
    }
    MouseClick, Left, , , , 0, U
    sendInput, {Control Up}
    BlockInput, OFF
    MsgBox, %cont%
Return

rcontrol::
    chrome:="ahk_exe brave.exe"
    chrome_path:="C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
    if WinExist(chrome) {
        if(!WinActive(chrome)) {
            WinGet, class1, PID , A
            previousTab := "ahk_pid " class1
            WinActivate
        }else{
            if WinExist(previousTab){
                WinActivate
            }else{
                previousTab = ""
            }
        }
    }

    else{
        run %chrome_path%
    }
return
ralt::
    teams:="ahk_exe Teams.exe"
    teams_path:="C:\Users\rherrera\AppData\Local\Microsoft\Teams\Update.exe"
    if WinExist(teams) {
        if(!WinActive(teams)) {
            WinGet, class1, PID , A
            previousTab := "ahk_pid " class1
            WinActivate
        }else{
            if WinExist(previousTab){
                WinActivate
            }else{
                previousTab = ""
            }
        }
    }

    else{
        MsgBox, 1, Abriendo teams, Hola, 3
        run, C:\Users\rherrera\AppData\Local\Microsoft\Teams\current\Teams.exe
    }
return

Rwin::
    whatsapp:="ahk_exe WhatsApp.exe"
    whatsapp_path:="C:\Users\facel\AppData\Local\WhatsApp\WhatsApp.exe"
    if WinExist(whatsapp) {
        if(!WinActive(whatsapp)) {
            WinGet, class2, PID , A
            previousTab := "ahk_pid " class2
            WinActivate
        }else{
            if WinExist(previousTab){
                WinActivate
            }else{
                previousTab = ""
            }
        }
    }

    else{
        run %whatsapp_path%
    }
return
:*:111mtc::
    sendInput, 1118150082
return
^numpad6::
    while (true) {
        send, {Wheeldown}
        send, {Wheeldown}

        sleep, 900
    }
return
:*:rh111::
    sendInput, RH111815008206{#}
return
:*:rhm::
    SendInput, Ra{alt down}{Numpad1}{Numpad6}{Numpad3}{alt up}l Herrera Mac{alt down}{Numpad1}{Numpad6}{Numpad1}{alt up}as
return
:*:rh@::raul.herrera@autozone.com
:*:fd@::facelessdivine@gmail.com
:*:fdg@::facelessdivinegod@gmail.com
:*:111@::1118150082@utch.edu.mx
:*:hemr::HEMR000915HCHRCLA7
::numss::63160076053
:*:i111::11124429

:*:111u::
    sendinput, 1118150082
Return
Mbutton::
    if winactive("ahk_exe brave.exe") or winactive("ahk_exe Code.exe")or winactive("ahk_exe chrome.exe")or winactive("ahk_exe firefox.exe"){
        send, ^{w}
    }
    else if winactive("ahk_exe WindowsTerminal.exe") {
        send, ^+{w}
    }
    else if winactive("ahk_class Progman") or winactive("ahk_class WorkerW") { ;desktop, opens the file explorer
        send, #{e}
    } else {
        send, !{f4}
    }
return

:*:datetime...::
    FormatTime, TimeString, T12, Time
    FormatTime, mesCompleto, , MMMM
    FormatTime, dia2, , dd
    FormatTime, ano, , yyyy
    sendInput %mesCompleto%-%dia2%-%ano% %TimeString%

return
:*:time...::
    FormatTime, TimeString, T12, Time
    sendInput, %TimeString%
return
:*:date...::
    FormatTime, mesCompleto, , MMMM
    FormatTime, dia2, , dd
    FormatTime, ano, , yyyy
    sendInput %mesCompleto%-%dia2%-%ano%
return

:*:10010::100101011010110password10010
:*:1001p::
    sendInput, 100101011010110Password10010
    sendInput, {enter}
return
:*:dz-::DZ-ECAT2396
:*:1001m::100101011010110Password100101011010110

^+!s::
    if WinExist("ahk_exe Teams.exe") {
        if(WinActive()) {
            process, close, Teams.exe
        }
        WinActivate
    } else {
        run, C:\Users\raulh\AppData\Local\Microsoft\Teams\Update.exe --processStart "Teams.exe"
    }
return

^r::reload

^+1::
    sleep, 1000
    while (true) {
        SendInput, {Lbutton}
    }
Return
activateTeams()
{
    if WinExist("ahk_exe Teams.exe") {
        WinActivate
    } else {
        run, C:\Users\raulh\AppData\Local\Microsoft\Teams\Update.exe --processStart "Teams.exe"
    }
}

Return

