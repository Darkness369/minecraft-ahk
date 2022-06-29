previousTab = ""
CapsLock::
sendInput, ^{c}
sleep, 800
keywait, CapsLock, D
keywait, CapsLock, U
sendInput, ^{v}
return
numlock::
 WinGet re4_pid, Pid, A
 process close, %re4_pid%
return
:*:pdfcolab::
keywait, CTRL, D
keywait, CTRL, U
sendInput, {alt down}{numpad3}{numpad3}{alt up}
sendInput, sudo apt-get update
sendInput,  {ctrl down}{enter}{ctrl up}
keywait, CTRL, D
keywait, CTRL, U
sendInput, {alt down}{numpad3}{numpad3}{alt up}
sendInput, sudo apt-get install texlive-xetex texlive-fonts-recommended texlive-plain-generic
sendInput,  {ctrl down}{enter}{ctrl up}
keywait, CTRL, D
keywait, CTRL, U
sendInput, {alt down}{numpad3}{numpad3}{alt up}
Clipwait
keywait, CTRL, D
keywait, CTRL, U
sendInput,  jupyter nbconvert --to pdf %clipboard%
sendInput,  {ctrl down}{enter}{ctrl up}
return
:*:rimraf::
sendInput, {home}
sleep, 200 
sendinput, rimraf .\**\
return
:*:guudmail::
run, "https://guud.com.mx:2096/cpsess9695194462/3rdparty/roundcube/?_task=mail&_mbox=INBOX"
return
:*:guudclickup::
run, "https://app.clickup.com/6966894/v/l/6-163193463-1"
return
:*:npm  ::
sendInput, ^{c}
sleep, 100
sendInput, ^{c}
sleep, 100
sendInput, ^{c}
sleep, 20
sendInput, cls & npm start {enter}
return
::comit:: 
sendInput, git commit -a -m "
keywait, CTRL, D
keywait, CTRL, U
sendInput, " {enter}
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


pgdn & Up::
    Run nircmd.exe changebrightness +20
    cbnss:= GetCurrentBrightNess()
    ToolTip, %cbnss%
    SetTimer, RemoveToolTip, 400, 150
    
return

pgdn & Down::
    Run nircmd.exe changebrightness -20
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
^+y::
    {
        SendInput, ^c
        Sleep 100
        Run, https://www.youtube.com/results?search_query=%clipboard%
    Return
}
^+!y::
    {
        SendInput, ^c
        Sleep 100
        ytid:= StrSplit(clipboard, "=")
        id:= ytid[2]
        Run, https://www.y2mate.com/youtube/%id%
    Return
}
^+!z::
    {
        id:= "https://us05web.zoom.us/j/88390008320?pwd=YzNaZXpCWmhXb1Rkb2Y2UmhIVi9oUT09"
        Run, %id%
    Return
}
^+!x::
    {
        id:= "https://itesm.zoom.us/j/5173749162"
        Run, %id%
    Return
}

^+c::
    {
        SendInput, ^c
        Sleep 100
        Run, http://www.google.com/search?q=%clipboard%
    Return
}

:*:git clone::
    {   
        
        url:= clipboard
	  clipboard:=""
        clipwait
        keywait, appsKey, D
        keywait, appsKey, U
        sendInput, git clone %url% -b %clipboard%
        array :=  StrSplit(url, "/")
        fname := array.pop()
        array2 :=  StrSplit(fname, ".")
        fname2 := array2[1]
        Clipboard:= fname2
        keywait, appsKey, D
        keywait, appsKey, U
        sleep, 100
        sendInput, cd %clipboard%  
        sleep, 200
        sendInput, {enter}
        Clipboard:= "npm install"
	  sendInput, %clipboard%{enter}
    }
Return
:*:get clone::
    {   
    sendInput, %Clipboard%{enter}
    array :=  StrSplit(Clipboard, "/")
    fname := array.pop()
    array2 :=  StrSplit(fname, ".")
    fname2 := array2[1]
    Clipboard:= fname2
    keywait, appsKey, D
    keywait, appsKey, U
    sleep, 100
    sendInput, cd %Clipboard% & npm install 
    sleep, 200
    sendInput, {enter} 
    }
Return

#Del::
    FileRecycleEmpty ; win + del
Return
^+!NumLock::
    run, C:\Users\facel\OneDrive\Desktop\scripts\minecraft-ahk\Minecraft.ahk
    ExitApp, 0
return
::inpy::
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


:*:psql1::
    sendInput, psql -U postgres
    sendInput, {enter}
    sleep, 10
    sendInput, Password44
    sendInput, {enter}
return

return

:*:ps44::
    sendInput, Password44
    sendInput, {enter}
return
:*:status::
    sendInput, git status
    sendInput, {enter}
return
^+!Lbutton::
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
    ; r is radius of circle, nLaps is number of laps to turn, can be -1 for keep on going until lbutton is released.
    ; Set direction via, dir. dir:=1 is clockwise, dir:=-1 is counter-clockwise
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
    brave:="ahk_exe chrome.exe"
    brave_path:="C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
    if WinExist(brave) {
        if(!WinActive(brave)) {
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
        run %brave_path%
    }
return

Rwin::
    whatsapp:="ahk_exe WhatsApp.exe"
    whatsapp_path:="C:\Users\facel\AppData\Local\WhatsApp\WhatsApp.exe"
    if WinExist(whatsapp) {
        if(!WinActive(whatsapp)) {
            WinGet, class1, ProcessName, A
            class1 := "ahk_exe " class1
            previousTab = class1
            WinActivate
        }else{
            if WinExist(previousTab){
                if(WinActive(!previousTab)){
                    WinActivate
                }
            }
        }
    } else {
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
:*:rh@::raul.herrera4@hotmail.com
:*:rh111::
    sendInput, RH111815008206{#}
return
:*:rhm::
    SendInput, Ra{alt down}{Numpad1}{Numpad6}{Numpad3}{alt up}l Herrera Mac{alt down}{Numpad1}{Numpad6}{Numpad1}{alt up}as
return
:*:rhg@::rherrera@guud.com.mx
::sshbp::
    sendInput, ssh ubuntu@3.17.13.180 -i "C:\Users\facel\Desktop\guudbpkey.pem"
    sleep, 50
    sendInput, {enter}
return
::sshgcc::
    sendInput, ssh ubuntu@18.232.139.2 -i "C:\Users\facel\Desktop\GUUD GCC Key.pem"
    sleep, 50
    sendInput, {enter}
return
:*:rhgp::Raul2024**
:*:bpw::@A..e..3
:*:fd@::facelessdivine@gmail.com
:*:111@::1118150082@utch.edu.mx
:*:hemr::HEMR000915HCHRCLA7
::numss::63160076053
:*:111u::
    sendinput, 1118150082
Return
Mbutton::
    if winactive("ahk_exe brave.exe") or winactive("ahk_exe opera.exe") or winactive("ahk_exe Code.exe")or winactive("ahk_exe chrome.exe"){
        send, ^{w}
    }else if winactive("ahk_exe javaw.exe") {
        send, {z}
    }
    else if winactive("ahk_exe WindowsTerminal.exe") {
        send, ^+{w}
    }
    else if winactive("ahk_class Progman") or winactive("ahk_class WorkerW") {
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
:*:1001p::100101011010110Password10010
:*:1001m::100101011010110Password100101011010110
^+!1::
    sleep, 1000
    KeyWait, Control, D
    KeyWait, Control, U
    WinGet, class1, ProcessName, A
    
    class1 := "ahk_exe " class1
    MsgBox, 0, Data, Clase 1 guardada, 1
    
    KeyWait, Control, D
    KeyWait, Control, U
    WinGet, class2, ProcessName, A
    class2 := "ahk_exe " class2
    MsgBox, 0, Data, Clase 2 guardada, 1
    while (True) {
        KeyWait, Alt, D
        KeyWait, Alt, U
        if winactive(class1) {
            if WinExist(class2) {
                WinActivate
            }
        } else {
            if WinExist(class1) {
                WinActivate
            }
        }
    }
    
Return
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

^+!9::
    MsgBox, 0, búsqueda persistente Microsoft Teams, Enabled, 2
    sleep, 400
    while (true) {
        ImageSearch, x, y, 0, 0, 1366, 768, C:\Users\raulh\Pictures\unirse.png
        if(x > 0) {
            a:=True
            x+=15
            y+=15
            Mousemove, x, y
            Click, Left
            while (!b) {
                ImageSearch, x2, y2, 0, 0, 1366, 768, C:\Users\raulh\Pictures\unirteahora.png
                if(x2 > 0) {
                    b:= True
                    x2+=15
                    y2+=15
                    Mousemove, x2, y2
                    Click, Left
                }
                sleep, 100
            }
            
        }
    }
Return
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

