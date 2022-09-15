^+!NumLock::
    run, C:\Users\facel\OneDrive\Desktop\scripts\minecraft-ahk\basescript.ahk
ExitApp, 0
return
::rmm::
    sleep, 400
    usernames:= ["1","Daniela777","FireStorm","Storm_Shadow","StarBreaker","WorldInFire","TheSevenFold", "Luis_CR", "WorldWideFuck"]
    for index, elemento in usernames{
        sendInput, {t}
        sleep, 300
        sendInput, /ps add %elemento% {enter}
        sleep, 5000
    }
return
; :*:dl::
; sortItems()
; return
^numpad3::
    sendInput, {Rbutton down}
    while(true){
        sendInput, {Lbutton}
        sleep, 155
    }
return
:*:mision::
    sleep, 100
    sendInput, {t}
    sleep, 120
    sendInput, /mision
    sendInput, {enter}
    sleep, 800
    mousemove, 692, 339 , 0
    sleep, 100
    sendInput, {lbutton}
return
^numpad4::
    while(true){
        ; sendInput, {shift down}
        Keywait, Rbutton, D
        Keywait, Rbutton, U
        ; sendInput, {z}
        loop, 3
        {
            send, {rbutton}
            sleep, 2
        }

    }
Return
^numpad8::
    voteSites := ["http://topminecraftservers.org/vote/21165","https://topg.org/minecraft-servers/server-631211","https://minecraftservers.org/server/627843","https://minecraft-mp.com/server/296226/vote/","https://servidoresdeminecraft.es/server/status/QKMQu04z/supercraft.es","https://www.40servidoresmc.es/supercraft-votar"]
    SendInput, {Ctrl down}{shift down}{n}{Ctrl up}{shift up}
    sleep, 2000
    sendInput, !{d}
    for index, element in voteSites ; Enumeration is the recommended approach in most cases.
    {
        clipboard := element
        sendInput, ^{v}
        sendInput, {enter}
        if (index == 0){
            sendInput, ^{v}
            sendInput, {enter}

        }
        sleep, 1000
        if(A_Index != 6){
            sendInput, ^{t}
        }
        sleep, 1000
    }
    ; sendInput, ^{w}
    clipboard := global username
return
^numpad9::
    keywait, Rbutton, D
    keywait, Rbutton, U
    sleep, 150
    c = 35
    startx = 835
    starty = 335
    speed = 1
    blockinput, on
    sendInput, {ctrl down}
    loop, 9{
        mousemove, startx, starty , speed
        sendInput, {q}
        if(A_Index ==9){
            startx+=c
        }
        startx-=c
    }
    starty-=c
    mousemove, startx, starty , speed
    sendInput, {q}
    loop, 9{
        mousemove, startx, starty , speed
        sendInput, {q}
        if(A_Index ==9){
            startx-=c
        }
        startx+=c
    }
    starty-=c
    mousemove, startx, starty , speed
    sendInput, {q}
    loop, 9{
        mousemove, startx, starty , speed
        sendInput, {q}
        startx-=c
    }
    sleep, 50
    blockinput, off
    sendInput, {ctrl up}
    sendInput, {esc}
Return
Rcontrol & Space::
    sendInput, {t}
    sleep, 120
    sendInput, /msg P0tato {space}
return
^numpad1::
    sleep, 250
    InputBox, c2 ,Cerrar?, , , 200, 200, X, Y, Font, 
    sleep, 1200
    if(c2 == 1){
        WinGet mc_pid, PID, A
        process close, %mc_pid% 
        ; msgbox
    }
    mc:="ahk_exe javaw.exe"
    if WinExist(mc) {
        if(!WinActive(mc)) {
            WinActivate
        }
    }
    Keywait, ctrl, D
    Keywait, ctrl, U
    mousemove, 1198, 706 ,0 ;Desconectarse
    click, left
    sleep, 150
    mousemove, 1234, 608 ,0 ;combo box cuentas
    click
    mousemove, 1194, 635 ,0 ;click a Launcherfenix
    click
    sleep, 100
    mousemove, 1233, 629 ,0 ;Click al input de email
    click
    sleep, 100
    sendInput, facelessdivine@gmail.com
    sendInput,{tab}
    sleep, 100
    sendInput, 100101011010110password10010
    sleep, 100
    mousemove, 1285, 701 , 0 ;click en conectarse
    click
    sleep, 900
    click ;Iniciar juego
    global username = facelessdivine
Return

^numpad2::
    r = 0
    InputBox, r , Title,1-Obtener lista de usuarios en la base de datos 2-Crear un usuario nuevo, ,450,350, X, Y, Font,
    usuario :=""
    Switch, r{
    case 1:
        Array := getList()
        Str := ""
        For Index, Value In Array
        {
            Str .= Value . " -----------> "
            Str .= Index . "|"
        }
        Str := StrReplace(Str, "|", "`n")
        InputBox, user , Title,%Str%, ,450,700, X, Y, Font,
        if(user >=1){
            usuario := Array[user]
            global username = usuario
        }
        else{
            return
        }
    case 2:
        usuario := getNewUser()
        global username = usuario
    Default:
    return
}

sleep, 300
d = 0
InputBox,d ,Cerrar?, , , 200, 200, X, Y, Font, 
sleep, 800
if(d == 1){
    WinGet mc_pid, PID, A
    process close, %mc_pid% 
}
mc:="ahk_exe javaw.exe"
if WinExist(mc) {
    if(!WinActive(mc)) {
        WinActivate
    }
}
Keywait, ctrl, D
Keywait, ctrl, U
mousemove, 1198, 706 ,0 ;Desconectarse
click, left
sleep, 150
mousemove, 1234, 608 ,0 ;combo box cuentas
click
mousemove, 1185, 621 ,0 ;selecciona noPremium
click
mousemove, 1233, 629 ,0 ;Click al input de email
click, left
sendInput, %usuario%
sleep, 50
mousemove, 1285, 701 , 0 ;click en conectarse
click
sleep, 600
click ;Iniciar juego
Return
f1::
    sendInput, {t}
    sleep, 120
    sendInput, /login Password44 {enter}
    sleep, 2350
    sendInput, {rbutton}
    sendInput, {rbutton}
    sleep, 800
    mousemove, 617, 258 ,0
    click
    sleep, 200
    mousemove, 770, 307 ,0
    sleep, 100
    click
return
f2::
    sendInput, {t}
    sleep, 120
    sendInput, /register Password44 {enter}
return
^+!5::
    sleep, 1000
    sendInput, {shift down}
    sleep, 400
    sendInput, {s down}
    sendInput, {Rbutton down}
    while(true)
    {
        sendInput, {z}
        sleep, 1000
    }
return
^+!4::
    ; sleep, 5
    ; sendInput, {esc}
    sleep, 100
    send, {t}
    sleep, 50
    sendinput, /spawn
    sleep, 50
    send, {enter}
return
^+!7::
    ; sleep, 5
    ; sendInput, {esc}
    sleep, 100
    send, {t}
    sleep, 50
    sendinput, /back
    sleep, 50
    send, {enter}
return
:*:10010::100101011010110password10010
#InstallMouseHook
^+!l::
    sleep, 100
    while(true){
        sendInput, {2}
        sleep, 50
        sendInput, {Lbutton down}
        sleep, 500
        sendInput, {Lbutton up}
        sleep, 150
        sendInput, {1}
        sleep, 100
        sendInput, {Rbutton}
        sendInput, {d down}
        sleep, 200
        sendInput, {d up}
        keywait, ctrl, D
        keywait, ctrl, U
        sendInput, {Rbutton}
        sleep,400
        mousemove, 578, 275 ,0
        keywait, ctrl, D
        keywait, ctrl, U
        mousemove, 587, 315 ,0
        keywait, ctrl, D
        keywait, ctrl, U
        sendInput, {esc}
        sendInput, {a down}
        sleep, 240
        sendInput, {a up}
    }

return

^+a::
    Keywait, Rbutton, D
    Keywait, Rbutton, U
    sleep, 500
    Mousemove, 764, 410 , 0
    sendInput, {lbutton}
    mousemove, 742, 304 , 0
    sleep, 5
    sendInput, {Rbutton down}
    mousemove, 749, 343 ,2
    mousemove, 815, 345 ,2
    mousemove, 816, 307 ,2
    sendInput, {Rbutton up}
    mousemove, 932, 300, 3
    sendInput, +{Lbutton}
    Mousemove, 764, 410 , 0
    click
    send, {esc}
return

^+w::
    sleep, 1000
    sendInput, {w down}
    sendInput, {Lcontrol down}
    sendInput, {Lbutton down}
    ; send, {c down}
return
Mbutton::
    if winactive("ahk_exe brave.exe"){
        send, ^{w}
    }else if winactive("ahk_exe javaw.exe"){
        send, {z}	
    }else {
        send, !{f4}
    }
return
^+!0::
    send, {t}

    sleep, 40
    sendinput, /execute in overworld run tp facelessdivine -256 71 -2
    sleep, 40
    send, {enter}
return

^2::
    Click
    KeyWait, LButton, D
    KeyWait, LButton, U
    mousemove, 122, 0, 0, R
    sleep, 200
    click
    send, {space}
    mousemove, 0, 0, 0

return

^1::
    send, {esc}
    sleep, 1000
    mousemove, 610, 831 , 0
    click
    sleep, 3000
    mousemove, 550, 290 , 0
    click
    sleep, 2000
    mousemove, 779, 553, 0
    click
    sleep, 3000
    mousemove, 1176, 770 ,0
    sleep, 400
    click
    mousemove, 0, 0, 0
return

^numpad0::
    send, {shift Down}
    ; mousemove, 800, 455 , 0
    mousemove, 840, 455 , 0
    Click
    mousemove, 1214, 455 , 0
    send, {shift Up}
    sleep, 100
    send, +{LButton}

Return
^numpad5::
    InputBox, cant , Cantidad de bloques, Introduce la cantidad de lineas de bloques detras de ti, , Width, Height, X, Y, Locale, Timeout,1
    sleep, 500
    send, {Esc}
    sleep, 200
    send, {shift Down}
    send, {w down}
    send, {a down}
    sleep,2000
    send, {w up}
    send, {a up}
    loop, %cant%{

        mine01()
        mine03()

    }

Return
mine04(){
    send, {lbutton down}
    send, {a Down}
    sleep,25000
    send, {a up}
    send, {lbutton up}
Return
}

mine01(){
    mine02()
    send, {Lbutton Down}
    send, {d Down}
    sleep,25000
    send, {d up}
    send, {Lbutton up}
Return
}
mine03(){
    send, {a Down}
    sleep,630
    send, {a up}
    send, {s Down}
    sleep, 1030
    send, {s up}
    ; MsgBox, [ Options, Title, Text, Timeout]
    send, {lbutton Down}
    sleep, 100
    send, {lbutton up}
    send, {w Down}
    sleep, 400
    send, {w up}
    mine04()

Return
}
mine02(){
    send, {d Down}
    sleep,630
    send, {d up}
    send, {s Down}
    sleep, 980
    send, {s up}
    send, {lbutton Down}
    sleep, 100
    send, {lbutton up}
    send, {w Down}
    sleep, 300
    send, {w up}
Return
}
^+!3::
    tpinterface()
Return

join(Array){

    Str := ""
    For Index, Value In Array
        Str .= "," . Value
    Str := LTrim(Str, ",") 
return Str
}
;Tecla de pánico
^+!1::
    send, t
    sleep, 50
    sendInput, /execute in overworld run tp facelessdivine -130 79 -222 0 0
    send, {Enter}
Return
^+!r::
    ; sendInput, {ctrl down}
    ; sendInput, {ctrl up}
    ; sleep, 30
    ; ; sendInput, {rbutton up}
    ; sendInput, {lbutton down}
    ; sendInput, {lbutton up}
    ; ; sendInput, {shift up}
    Reload
Return
SwitchItem()
{
    InputBox, f, Item Quick Switcher, Prompt,, 100, 100, X, Y, , 15, 
    InputBox, s, Item Quick Switcher, Prompt,, 100, 100, X, Y, , 15, 
    sleep, 100
    send, {Esc}
    var = %f%
    while(true){
        send, {%var%}
        KeyWait, alt,D 
        if(var==f){
            var=%s%
        }
        else{
            var=%f%
        }
    }
}
^+XButton2::
    sleep, 100
    send, {ctrl Down}
    send, {w Down}
    while(true){
        send, {Space Down}
        sleep, 35
        send, {space Up}
        sleep, 30
        if GetKeyState("XButton2", "P"){
            send, {ctrl up}
            send, {w up}
            send, {shift Down}
            Break
        }
    }
Return
^+!2::
    ; c =1 
    ; a = 0
    connection = 0
    InputBox, res ,, Interfaz de script para AFK (1=left click 2=right click 3=left by Seconds 4= Fishing afk), , , 400, 600, X, Y, , 
    send, {Esc}
    Switch res
    {
    case 1:
        while(True){
            click
            sleep, 150

        }
    Return
case 2:
    while(True){
        sendInput, {shift down}
        ;                 sleep, 100
        sendInput, {Rbutton}

        sleep, 10
        sendInput, {z}
        sleep, 300
        ; Keywait, Rbutton, D
        ; Keywait, Rbutton, U
        ; sendInput, {rbutton 3}

        ;fishingFarm()

        ; click, left
        ; CheckConnection()
    }
Return
case 3:
    sleep, 100
    sendInput, {esc}
    sleep, 100

    while(true){
        sendInput, {Lbutton}
        sendInput, {Rbutton down}
        sleep, 700
    }
    InputBox, secs , Cantidad de segundos, , , 250, 150, X, Y, , , 
    sleep, 100
    send, {Esc}
    secs*=1000
    sgs:=0
    m:=0
    v:=0
    sleep, 500
    name:= ""
    p :=False
    ; Gui, Color, White
    ; Gui, Add, Progress, vMyProgress w275
    ; Gui, Font, s9, Verdana
    ; Gui, Add, Text, vMyText wp  ; wp means "use width of previous".
    ; Gui, +AlwaysOnTop
    ; Gui, +Disabled
    ; Gui, Show, xCenter y21 NA w290, Hi`,` Im a Muffin :D
    sleep, 500
    sgs =%secs%
    v=%sgs%
    secs/=100
    while(true){
        BlockInput, On
        sleep, 50
        if not WinActive("ahk_exe javaw.exe"){
            WinGet, name, ProcessName, A
            WinActivate, ahk_exe javaw.exe
            p:=True
            sleep, 50
            Send, {Esc}
            sleep, 50
        }
        ; CheckConnection()
        ; loop, 2{
        Click, left
        sleep, 50
        ; }
        if(p){
            WinActivate, ahk_exe %name%
            p:=False
        }
        ; sleep, %secs%
        ; send, {Space}
        sleep, 20
        BlockInput,off
        Loop, 100
        {
            ; m=%sgs%
            ; m/=1000
            ; GuiControl,, Myprogress, %A_Index%
            ; if(m < 10){
            ; GuiControl,, MyText, Tiempo restante 0%m%s   Progreso %A_Index% `%`
            ; }
            ; Else{
            ; GuiControl,, MyText, Tiempo restante %m%s   Progreso %A_Index% `%`
            ; }
            sleep, %secs%
            ; sgs-=%secs%
            ; if (A_Index == 100)
            ; Break
        }
        ; send, {Space}
        ; sleep, %secs%
        ; sgs=%v%
        ; if(CheckConnection()){
        ;     connection++
        ; }
        ; GuiControl,, Myprogress, 0
        ; GuiControl,, MyText, Progreso 0 `%`
    }
    sleep, 200
    send, {Esc}
Return
case 4:
    itemkey = 1
    a:= False
    time = 0
    send, {%itemkey%}
    sleep, 300
    while(True){
        while(time < 1200000){
            ImageSearch, x, y, 0, 0, 1366, 768, C:\Users\raulh\Pictures\backtogame.png
            if(x>0){
                send, {esc}
            }
            click, Right
            sleep, 200
            time+=230
        }
        itemkey++
        time = 0
        sleep, 400
        send, {%itemkey%}
        sleep, 150
    }
return
case 6:
    send, {shift Down}
    while(True){
        Keywait, RButton, D
        Keywait, RButton, U
        click, Right
        click, Right
        ; click, Right
        sleep, 100
        send, {z}
        ; send, {shift up}
        ; sleep, 650
        ; click, left
        ;sleep, 15
    }
Return
case 7:
    while(True){
        click, Right
        sleep, 3
    }
Return
case 8:
    ; while(True){
    ; send, {Lbutton Down}
    ; sleep, 3
    ; }

    ; x:=39
    ; y:=71
    ; z:=3
    ; pos:= "0 90"
    ; sleep, 200
    ; send, {1}
    ; sleep, 500
    ; loop, 2{
    ;     x:=39
    ;     loop, 2{
    ;         send, {t}
    ;         sleep, 200
    ;         sendInput, /execute in the_end run tp facelessdivine %x% %y% %z% %pos%
    ;         send, {Enter}
    ;         sleep, 500
    ;         send, {Lbutton Down}
    ;         sleep, 2500*30
    ;         send, {Lbutton Up}
    ;         sleep, 500
    ;         x++
    ;     }
    ; repairTool() ; reparar herramienta
    ;     z--
    ; }
    while(true){
        turnMinecartsSugarCaneFarmOn()
        ; sleep, 10000
        sleep, 2000
        turnSugarCaneFarmOn()
        sleep, 33000
        turnMinecartsSugarCaneFarmOn()
        sleep,4000
        fishingFarm()
    }

Return
case 9:
    InputBox, n , cantidad de vueltas a granja de mobs, ,, 200,200, X, Y, Font,
    mobsfarm(n,false)
return
case 10:
    InputBox, n , Vueltas, This is a mesage, HIDE, 400, 200, X, Y, Font, 
    sleep, 100
    sendInput, {esc}
    sleep, 1000
    sleep, 100
    sendInput, {t}
    sleep, 150
    sendInput, /homes farm
    sendInput, {enter}
    sleep, 1201
    c=0
    contador:=0
    cantidad = 62
    item = 1
    while(true){
        contador++
        sendInput, {1}
        sleep, 400
        sendInput, {rbutton down}
        sleep, 2000
        sendInput, {rbutton up}
        sendInput, {2}
        sendInput, {ctrl down}
        sendInput, {w down}
        sleep, 15000
        sendInput, {w up}
        sendInput, {ctrl up}
        sendInput, {t}
        sleep, 150
        sendInput, /homes farm
        sendInput, {enter}
        sleep, 150
        ; sleep, 100
        if(contador == cantidad){

            sendInput, {ctrl up}
            sendInput, {rbutton up}
            sleep, 2300
            ; MsgBox, title, , Revisa las botas, 15
            mobsfarm(100,true) 
            sleep, 200
            growPlants(31)
            ; sleep, 200
            plant(31)
            sleep, 500
            contador = 0
            c++
            if(c==n){
                MsgBox, 4,, Would you like to close?, 30
                IfMsgBox Yes
                {
                    WinGet mc_pid, PID, A
                    process close, %mc_pid%
                }
                IfMsgBox No
                {
                    sendInput, {t}
                    sleep, 150
                    sendInput, /homes farm
                    sendInput, {enter}
                    return
                }
                IfMsgBox Timeout
                {
                    WinGet mc_pid, PID, A
                    process close, %mc_pid%
                }
            } 
        }
    }
Return 
case 11:
    InputBox, l ,plant,, HIDE, Width, Height, 400, 150, Font, 
    sleep, 100
    sendInput, {esc}
    sleep, 1000
    plant(l) 
return
case 13: 
    InputBox, l , growPlants,, HIDE, Width, Height, 400, 150, Font, 
    sleep, 100
    sendInput, {esc}
    sleep, 1000
    growPlants(l)
return
case 14: 
    InputBox, lines , lineas a arar, , , 200, 200, X, Y, Font, 
    sleep, 100
    sendInput, {esc}
    sleep, 100
    slip = 538
    ; slip2 = 458
    slip2 = 438
    loop, %lines%{
        sendInput, {1}
        sleep, 10
        sendInput, {ctrl down}
        ; sendInput, {rbutton down}
        sendInput, {w down}
        ; sleep, 7970
        ; loop, 490{
        loop, 130{
            sendInput, {rbutton}
            ; sendInput, {z}
            ; sleep, 16
            sleep, 70
        }
        sendInput, {w up}
        ; sendInput, {rbutton up}
        sendInput, {ctrl up}

        sendInput, {8}
        ; sleep, 80
        sendInput, {rbutton down }
        sleep, 2000
        sendInput, {rbutton up}
        sleep, 50
        sendInput, {shift down}
        if(A_Index == 1){
            sendInput, {a down}
            sleep, %slip%
            sendInput, {a up}
        }
        else{
            sendInput, {a down}
            sleep, %slip2%
            sendInput, {a up}
        }
        sleep, 100
        sendInput, {shift up}
        sendInput, {1}
        ; sendInput, {rbutton down}
        sendInput, {s down}
        ; sleep, 10350
        ; loop, 390{
        loop, 162{
            sendInput, {rbutton}
            ; sendInput, {z}
            ; sleep, 21
            sleep, 71

        }
        sendInput, {s up}
        ; sendInput, {rbutton up}
        sendInput, {ctrl up}
        sleep, 100
        sendInput, {shift down}
        sendInput, {a down}
        sleep, %slip2%
        sendInput, {a up}
        sleep, 800
        sendInput, {shift up}
        sendInput, {8}
        ; sleep, 100
        sendInput, {rbutton down }
        sleep, 2000
        sendInput, {rbutton up}
        sleep, 10
        ; sendInput, {z}
        sendInput, {1}
    }
return
}

repairTool(){
    send, {t}
    sleep, 200
    sendInput, /execute in the_end run tp facelessdivine 35 2 300 0 0
    send, {Enter}
    sleep, 2000
    send, {f}
    sleep, 500
    send, {2}
    sleep, 1000
    loop, 300{
        click
        sleep, 1000
    }
    sleep, 200
    send, {1}
    sleep, 500
    send, {f}
    sleep, 100
    send, {t}
    sleep, 200
    sendInput, /clear facelessdivine ender_pearl
    send, {Enter}
Return 
}
fishingFarm(){
    BlockInput, on
    send, {t}
    sleep, 100
    sendInput, /execute in overworld run tp facelessdivine -252 138 13 90 19
    sleep, 40
    send, {Enter}
    sleep, 1000
    send, {8}
    sleep, 500
    loop,777{
        click, Right
        sleep, 2000
    }
    sleep, 100
Return
}
turnMinecartsSugarCaneFarmOn(){
    sleep, 2000
    send, {1}
    sleep,200
    BlockInput, on
    send, {t}
    sleep, 100
    sendInput, /execute in overworld run tp facelessdivine -240 56 33 -180 10
    sleep, 120
    send, {Enter}
    sleep, 440
    click, right
    sleep, 250
    send, {t}
    sleep, 100
    sendInput, /execute in overworld run tp facelessdivine -227 56 33 -180 10
    sleep, 120
    send, {Enter}
    sleep, 440
    click, right
    sleep, 250
    send, {t}
    sleep, 100
    sendInput, /execute in overworld run tp facelessdivine -226 56 33 -180 10
    sleep, 120
    send, {Enter}
    sleep, 440
    click, right
    sleep, 250
    send, {t}
    sleep, 100
    sendInput, /execute in overworld run tp facelessdivine -213 56 33 -180 10
    sleep, 120
    send, {Enter}
    sleep, 440
    click, right
    sleep, 250
    send, {t}
    sleep, 100
    sendInput, /execute in overworld run tp facelessdivine -212 56 33 -180 10
    sleep, 120
    send, {Enter}
    sleep, 440
    click, right
    sleep, 250
    sleep, 300
    BlockInput, off
}
turnSugarCaneFarmOn(){
    send, {t}
    sleep, 100
    sendInput, /execute in minecraft:overworld run tp facelessdivine -203 62 23 90 37
    sleep, 40
    send, {Enter}
    sleep, 3000
    click, right
    sleep, 1500
    click, right
    sleep, 1000
    send, {t}
    sleep, 100
    sendInput, /execute in minecraft:overworld run tp facelessdivine -205 62 17 75 0
    sleep, 40
    send, {Enter}
    blockinput, off
}
; ^+!l::
;     send, {t}
;     sleep, 200
;     SendInput, /execute in overworld run tp P0tato__ -252 138 13 90 19
;     send, {Enter}
; Return
; ^+!o::
;     send, {t}
;     sleep, 200
;     SendInput, /tp P0tato__ facelessdivine
;     send, {Enter}
; Return
; ^+!p::
;     send, {t}
;     sleep, 200
;     SendInput, /tp facelessdivine P0tato__
;     send, {Enter}
; Return
^!2::
    while(true)
    {
        send, {7}
        click, right
        sleep, 400
        send, {1}
        click, Left
        sleep, 400
    }
return 
^!1::
    if (WinActive("ahk_exe javaw.exe")){
        SwitchItem()
    }
Return

tpinterface(op:=0){
    cnames:=[]
    coords:=[]
    dimensions:=[]
    fileRead, cords, C:/files/cords.txt
    fileRead, names, C:/files/names.txt
    fileRead, dimensionss, C:/files/dims.txt
    ; msgbox, %cords%
    ; msgbox, %names%
    cnames := StrSplit(names, ",")
    coords := StrSplit(cords, ",")
    dimensions := StrSplit(dimensionss, ",")
    if(op==0){
        InputBox, op , Introducir, 1./ Insert `n`n 2./ Delete `n`n 3./ exit `n`n 4./ Query, , 300, 275, X, Y, , ,4
    }
    Switch op{
    case 1:
        InputBox, cname , Nombre de la coordenada, , , 400, 200, X, Y, , ,
        InputBox, dim , Dimension `n`n 1.- Overworld `n`n 2.- Nether `n`n 3.-End, , , 400, 200, X, Y, , ,
        if(dim==1){
            dim:="overworld"
        }
        else if(dim==2){
            dim:="the_nether"
        }
        else if (dim==3){
            dim:="the_end"
        }
        InputBox, ccord , coordenada, , , 400, 200, X, Y, , ,
        cnames.Push(cname)
        coords.Push(ccord)
        dimensions.Push(dim)
        cf := FileOpen("C:/files/cords.txt", "w")
        cf.write(StrReplace(join(coords), A_Space, "."))
        cf.Close()
        nf := FileOpen("C:/files/names.txt", "w")
        nf.write(StrReplace(join(cnames), A_Space, "."))
        nf.Close()
        df := FileOpen("C:/files/dims.txt", "w")
        df.write(StrReplace(join(dimensions), A_Space, "."))
        df.Close()
        msgbox, Coordenada guardada con éxito
        tpinterface()
    Return
case 2:
    if(cnames.Length() > 0){
        strMenu = Menu `n
        for i,e in cnames{
            element:=StrReplace(e,"."," ")
            value=%i% >> %element% 
            strMenu .= "|" . value
        }
        strMenu := StrReplace(strMenu, "|","`n`n")
        InputBox, index , Selecciona una opcion del menu, %strMenu%, , 350,120+40*cnames.Length() , X, Y, , , 
        cnames.RemoveAt(index)
        coords.RemoveAt(index)
        dimensions.RemoveAt(index)
        cf := FileOpen("C:/files/cords.txt", "w")
        cf.write(StrReplace(join(coords), A_Space, ""))
        cf.Close()
        nf := FileOpen("C:/files/names.txt", "w")
        nf.write(StrReplace(join(cnames), A_Space, ""))
        nf.Close()
        df := FileOpen("C:/files/dims.txt", "w")
        df.write(StrReplace(join(dimensions), A_Space, "."))
        df.Close()
    }
    else{
        MsgBox, 0, Warn, No hay dato guardados,2
    }
    tpinterface()
Return
case 3:
    mousemove, 1100, -746 , 0
    Click
    ; send, {Esc}

Return
case 4:
    strMenu = Menu `n
    for i,e in cnames{
        element:=StrReplace(e,"."," ")
        value=%i% >> %element% 
        strMenu .= "|" . value
    }
    strMenu := StrReplace(strMenu, "|","`n`n")
    if(cnames.Length() > 0){
        InputBox, index , Selecciona una opcion del menu, %strMenu%, , 350,300+40*cnames.Length() , X, Y, , , 
        if(index > cnames.Length()){
            msgbox, Opcion invalida
            tpinterface(4)
        }
        var:= coords[index]
        var2:= dimensions[index]
        var3:= cnames[index]
        c:= StrReplace(var, "."," ")
        d:= StrReplace(var2, "."," ")
        n:= StrReplace(var3, "."," ")
        ; Clipboard:= ">>> " d " >>> "c
        Clipboard:= ">>> " n " >>> "c
        ; sleep,50
        ; send, {Esc}
        sleep, 110
        send, {t}
        sleep, 40
        SendInput, %Clipboard%
        send, {Enter}
    }
    else{
        MsgBox, 0, Warn, No hay dato guardados,2
        tpinterface()
    }
    op:=0
Return
Default:
    tpinterface()
}

Return 
}
mobsfarm(number, bol){
    contador:=0
    contador2:=0
    tele = 25
    if(!bol){
        sleep, 100
        sendInput, {esc}
        sleep, 150
    }
    ;            sendInput, {t}
    ;           sleep, 150
    ;          sendInput, /homes x ;granja de experiencia mobs para reparar las botas
    ;         sendInput, {enter}
    sleep, 1200
    while(true){
        sleep, 200
        sendInput, {2}
        contador++
        ; contador2++
        ; sendInput, {shift down}
        loop ,10 {
            sendInput, {lbutton}
            sleep, 900
        }
        ; sendInput, {shift up}
        sendInput, {1}
        sendInput, {Rbutton down}
        sleep, 2100
        sendInput, {Rbutton up}
        sendInput, {2}
        if(contador == number){
            sendInput, {ctrl up}
            sleep, 100
            if(bol){
                deleteInventory()
            }
            sleep, 200
            sendInput, {t}
            sleep, 150
            sendInput, /homes farm
            sendInput, {enter}
            sleep, 2100
            break
        }
        ; if(contador2 == tele){
        ;     sendInput, {ctrl up}
        ;     sleep, 100
        ;     sendInput, {t}
        ;     sleep, 150
        ;     sendInput, /homes x
        ;     sendInput, {enter}
        ;     sleep, 2100
        ;     contador2 = 0
        ; }
    }

} 
fillInventory(){
    x = 547
    y = 216
    mousemove, x,y , 0
    sleep, 200
    sendInput, {lbutton}
    x+=35
    mousemove, x, y, 0
    sleep, 150
    sendInput, {shift down}
    sendInput, {lbutton}
    sleep, 60
    sendInput, {lbutton}
    sleep, 60
    sendInput, {lbutton}
    sleep, 200
    sendInput, {shift up}
    sleep, 100
    sendInput, {lbutton}
    sleep, 150
    sendInput, {e}
    sleep, 500

}
fillSecondaryHand(){
    sendInput, {4}
    sleep, 115
    sendInput, {e}
    sleep, 400
    mousemove,811, 519 , 0
    sleep, 150 
    sendInput, {Lbutton 3}
    sleep, 300
    sendInput, {e}
    sleep, 400
    sendInput, {f}
    sleep, 300
    sendInput, {rbutton}
    sleep, 100
    sendInput, {z}
    sleep, 300
}

eat(){
    sendInput, {1}
    sleep, 200
    sendInput, {shift down}
    sendInput, {rbutton down }
    sleep, 2000
    sendInput, {rbutton up}
    sleep, 50
    sendInput, {shift up}
    sleep, 50
}

teleportHomes(home)
{
    sendInput, {t}
    sleep, 150
    sendInput, /homes %home%
    sendInput, {enter}
    sleep, 2000
}

dumpInventory(){
    sendInput, {rbutton}
    sleep, 500
    x = 657
    y = 572 
    mousemove, x,y , 0
    sleep, 200
    sendInput, {lbutton}
    x+=35
    mousemove, x, y, 0
    sleep, 150
    sendInput, {shift down}
    sendInput, {lbutton}
    sleep, 60
    sendInput, {lbutton}
    sleep, 60
    sendInput, {lbutton}
    sleep, 200
    sendInput, {shift up}
    sleep, 100
    sendInput, {lbutton}
    sleep, 1001
    sendInput, {e}
    sleep, 500

}
plant(lines)
{
    ; InputBox, lines , lineas  a Plantar, , , 400, 200, X, Y, Font, 
    ; sleep, 100
    ; sendInput, {esc}
    sleep, 100
    slip = 510
    ; lines = 15
    slip2 = 440
    teleportHomes("c")
    sendInput, {9}
    sleep, 600
    sendInput, {f}
    sleep, 600
    loop, %lines%{
        sleep, 50
        if(mod(A_Index, 3) == 0 or A_Index == 1){
            sortItems()
            fillSecondaryHand()
        }
        sendInput, {ctrl down}
        sendInput, {w down}
        loop, 145{
            sendInput, {z}
            sendInput, {rbutton}
            sendInput, {z}
            sleep, 70
        }
        sendInput, {w up}
        sendInput, {ctrl up}
        sleep, 400
        if(mod(A_Index, 5) == 0){
            fillInventory()
        }
        sleep, 200
        sendInput, {shift down}
        eat()
        sleep, 50
        sendInput, {shift down}
        if(A_Index == 1){
            sendInput, {a down}
            sleep, %slip%
            sendInput, {a up}
        }
        else{
            sendInput, {a down}
            sleep, %slip2%
            sendInput, {a up}
        }
        sleep, 50
        if(mod(A_Index, 5) == 0){
            sendInput, {s down}
            sleep, %slip2%
            sleep, 40
            sendInput, {s up}
        }
        sendInput, {shift up}
        sleep, 50
        sendInput, {z}
        sendInput, {s down}
        loop, 140{
            sendInput, {z}
            sendInput, {rbutton}
            sendInput, {z}
            sleep, 71

        }
        sendInput, {s up}
        sendInput, {ctrl up}
        sleep, 100
        sendInput, {shift down}
        sendInput, {a down}
        sleep, %slip2%
        sendInput, {a up}
        sleep, 200
        eat()
        sleep, 400
    } 
    sendInput, {9}
    sleep, 300
    sendInput, {f}
    sleep, 100

}
growPlants(lines){
    ; InputBox, lines , lineas  a Cultivar, , , 400, 200, X, Y, Font, 
    ; sleep, 100
    ; sendInput, {esc}
    sleep, 100
    slip = 510
    ; lines = 15
    slip2 = 440
    ; slip2 = 454
    teleportHomes("c")
    ; sendInput, {9}
    ; sleep, 300
    ; sendInput, {f}
    sleep, 100
    sendInput, {3}
    sleep, 100
    loop, %lines%{
        sendInput, {ctrl down}
        sendInput, {w down}
        loop, 262{
            sendInput, {lbutton}
            sleep, 22
        }
        sendInput, {w up}
        sendInput, {ctrl up}
        sleep, 400
        if(mod(A_Index, 5) == 0){
            dumpInventory()
        }
        sleep, 200
        sendInput, {shift down}
        eat()
        sleep, 100
        sendInput, {3}
        sleep, 50
        sendInput, {shift down}
        if(A_Index == 1){
            sendInput, {a down}
            sleep, %slip%
            sendInput, {a up}
        }
        else{
            sendInput, {a down}
            sleep, %slip2%
            sendInput, {a up}
        }
        sleep, 50
        sendInput, {shift up}
        sleep, 50
        sendInput, {s down}
        loop, 330{
            sendInput, {lbutton}
            sleep, 27
        }
        sendInput, {s up}
        sendInput, {ctrl up}
        sleep, 100
        sendInput, {shift down}
        sendInput, {a down}
        sleep, %slip2%
        sendInput, {a up}
        sleep, 200
        eat()
        sleep, 100
        sendInput, {3}
        sleep, 100
    } 
}
deleteInventory(){
    sendInput, {e}
    sleep, 500
    c = 35 
    startx = 986
    starty = 515
    speed = 2
    blockinput, on
    sendInput, {ctrl down}
    loop, 6{
        mousemove, startx, starty , speed
        sendInput, {q}
        if(A_Index == 6){
            startx+=c
        }
        startx-=c
    }
    startx+=c*5
    starty-=c
    loop, 9{
        mousemove, startx, starty , speed
        sendInput, {q}
        if(A_Index == 9){
            startx+=c
        }
        startx-=c
    }
    starty-=c
    mousemove, startx, starty , speed
    sendInput, {q}
    loop, 9{
        mousemove, startx, starty , speed
        sendInput, {q}
        if(A_Index ==9){
            startx-=c
        }
        startx+=c
    }
    starty-=c
    mousemove, startx, starty , speed
    sendInput, {q}
    loop, 9{
        mousemove, startx, starty , speed
        sendInput, {q}
        startx-=c
    }
    sleep, 50
    blockinput, off
    sendInput, {ctrl up}
    sendInput, {e}
    sleep, 500
}
sortItems(){
    sendInput, {e}
    sleep, 500
    c = 35 
    startx = 986
    starty = 473
    speed = 5
    sendInput, {shift down}
    loop, 9{
        mousemove, startx, starty , speed
        sendInput, {Lbutton}
        if(A_Index == 9){
            startx+=c
        }
        startx-=c
    }
    starty-=c
    mousemove, startx, starty , speed
    sendInput, {Lbutton}
    loop, 9{
        mousemove, startx, starty , speed
        sendInput, {Lbutton}
        if(A_Index ==9){
            startx-=c
        }
        startx+=c
    }
    starty-=c
    mousemove, startx, starty , speed
    sendInput, {Lbutton}
    loop, 9{
        mousemove, startx, starty , speed
        sendInput, {Lbutton}
        startx-=c
    }
    sleep, 50
    blockinput, off
    sendInput, {shift up}
    sendInput, {e}
    sleep, 500
}

Jxon_Load(jsontxt){

    newStr := StrReplace( StrReplace( StrReplace( StrReplace( StrReplace( StrReplace(StrReplace(StrReplace(StrReplace(StrReplace(jsontxt, "{", ""), "}", ""), """" "username" """" , "") , "[","" ),"]","" ) , """", ""), A_Space, "" ) , "id:", ""), ",:", "|"), ",", ":")
    StringLen, n,newStr
    newStr :=SubStr(newStr, 2,n)
return newStr
}
Jxon_Load2(jsontxt){
    newStr := StrReplace( StrReplace( StrReplace( StrReplace(StrReplace(StrReplace(StrReplace(StrReplace(StrReplace(jsontxt, "{", ""), "}", ""), """" "username" """" , "") , "[","" ),"]","" ) , """", ""), A_Space, "" ) , ":", ""), ".", "")
    StringLen, n,newStr
    newStr :=SubStr(newStr, 2,n)
return newStr
}
Dict(dictName,key) {
    keyPos := InStr(dictName,key)
    dictStr2 := SubStr(dictName,keyPos)
    IfInString , dictStr2 , | 
    {
        endPos := InStr(dictStr2, "|")
    }else{
        endPos := StrLen(dictStr2)+1
    }
    startPos := StrLen(key)+2
    returnValue := SubStr(dictStr2,startPos,(endPos-startPos))
return returnValue
}
getList(){
    req := ComObjCreate("Msxml2.XMLHTTP")
    req.open("GET", "http://127.0.0.1:5000/list", true)
    req.send()
    sleep, 500
    Array := Jxon_Load2(req.responseText)
    ; msgbox, %Array%
    new_array := []
    for a, b in StrSplit(Array, ",",".")
        new_array.Insert(b)
return new_array
}
getNewUser(){
    req := ComObjCreate("Msxml2.XMLHTTP")
    req.open("GET", "http://127.0.0.1:5000/user", true)
    req.send()
    sleep, 1500
    new_user := Jxon_Load2(req.responseText)
return new_user
}