:*:10010::100101011010110password10010
#InstallMouseHook
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
^+XButton1::
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
^+a::
    while(True){
        MsgBox,0,CONNECTION, The connection to the server has been restared > %connection% times
        sleep, 500
    }
Return

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
                sleep, 5
                
            }
        Return
        case 2:
            while(True){
                ; click, Right
                fishingFarm()
                
                ; click, left
                ; CheckConnection()
            }
        Return
        case 3:
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
    ^+!l::
        send, {t}
        sleep, 200
        SendInput, /execute in overworld run tp P0tato__ -252 138 13 90 19
        send, {Enter}
    Return
    ^+!o::
        send, {t}
        sleep, 200
        SendInput, /tp P0tato__ facelessdivine
        send, {Enter}
    Return
    ^+!p::
        send, {t}
        sleep, 200
        SendInput, /tp facelessdivine P0tato__
        send, {Enter}
    Return
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
    
    tpinterface(){
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
        
        op = -1
        InputBox, op , Introducir, 1./ Insert `n`n 2./ Delete `n`n 3./ exit `n`n 4./ Query, , 300, 275, X, Y, , ,4
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
                    InputBox, index , Selecciona una opcion del menu, %strMenu%, , 350,120+40*cnames.Length() , X, Y, , , 
                    var:= coords[index]
                    var2:= dimensions[index]
                    c:= StrReplace(var, "."," ")
                    d:= StrReplace(var2, "."," ")
                    Clipboard:= "/execute in " d " run tp facelessdivine "c
                    sleep,50
                    send, {Esc}
                    sleep, 110
                    send, {t}
                    sleep, 40
                    SendInput, %Clipboard%
                    send, {Enter}
                }
                else{
                    MsgBox, 0, Warn, No hay dato guardados,2
                }
                ; tpinterface()
            Return
            Default:
                tpinterface()
            }
            
            Return 
        }
        