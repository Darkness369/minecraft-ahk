^xbutton2::
    loop, 2
    {
        command("sellall")
        sleep, 250
    }
return
; ^Rbutton::
;     sendInput, {3}
;     sleep, 300
;     sendInput, {rbutton down}
;     sleep, 2000
;     sendInput, {rbutton up}
; return
; Rbutton::
; sendInput, {z}
;sleep, 50
;     loop, 200
;{
;     sleep, 61
;     sendInput, {Rbutton}
; sendInput, {z}
; }
; sleep, 60
;return
Rcontrol::
    sendInput, {t}
    sleep, 200
    clipboard:= "/msg P0tatin " 
    sendInput, ^{v}
return
^+space::
    sendInput, {t}
    sleep, 350
    sendInput, /login Password44 {enter}
    keywait, Rbutton, D
    keywait, Rbutton, U
    sleep, 500
    mousemove, 685, 258 , 0
    click
return
openCraftingTable(){
    sendInput, {t}
    sleep, 150
    Clipboard:= "/craft"
    sendInput, ^{v} {enter}
}
command(command){
    sendInput, {t}
    sleep, 150
    Clipboard:= "/"
    Clipboard.= command
    sendInput, ^{v} {enter}
    sleep, 320
}
drop(array){
    BlockInput, on
    command("disposal")
    sleep, 320
    For Key,v in array{
        loop, 5
        {

            putStone:
                ImageSearch, x, y, 0, 380, 1366, 768, images\%v%top.png
                if(x>0){
                    mousemove, x, y , 0
                    sendInput, {shift down}{lbutton}{shift up}
                    sleep, 50
                    Goto, putStone
                }
            }
        }
        sleep, 40
        sendInput, {e}
        sleep, 100
        BlockInput, off
    }
    putInTheBack(b,tobackpack){
        BlockInput, on
        beginBackpack:
            cont:=0
            command("mochila")
            constantBackpack:=540
            bk:=40
            cordx:=constantBackpack+(bk*b)
            mousemove, %cordx%, 300, 0
            sleep, 5
            click
            sleep, 320
            For Key, mineral in tobackpack
            {
                putBlocks:
                    cont++
                    if(cont > 20){
                        cont:=0
                        sleep, 100
                        sendInput, {esc}
                        sleep, 800
                        goto, beginBackpack
                    }
                    ban1:=false
                    ban2:=false
                    ImageSearch, x, y, 0, 380, 1366, 768, images\%mineral%blocktop.png
                    if(x>0){
                        ban1:=true
                        mousemove, x+4, y+4 , 0
                        sendInput, {shift down}{lbutton}{shift up}
                        sleep, 60
                        if(ban1){
                            goto, putBlocks
                        }
                    }
                    else{
                        ban1:=false
                        ImageSearch, x2, y2, 0, 380, 1366, 768, images\%mineral%.png
                        if(x2>0){
                            ban2:=true
                            mousemove, x2+4, y2+4 , 0
                            sendInput, {shift down}{lbutton}{shift up}
                            sleep, 60
                            if(ban2){
                                goto, putBlocks
                            }
                        } 
                        else{
                            ban2:=false
                        }
                        sleep, 10
                    }
                }
                sleep, 40
                sendInput, {e}
                sleep, 100
                BlockInput, off
            }
            closeMenu(){
                sendInput, {e}
                sleep, 200
            }
            unCraftEveryBlock(minerals,m){
                openCraftingTable()
                sleep, 400
                For Key, element in minerals
                { 
                uncraft:
                    sleep, 200
                    ImageSearch, x, y, 0, 0, 700, 768, images\uncraft%element%.png
                    if(x>0){
                        mousemove, x+2,y+2,0
                        sendInput, {shift down}{lbutton}{shift up}
                        mousemove, 1100,300,0
                        mousemove, 926, 291,0
                        sendInput, {shift down}{lbutton}{shift up}
                        mousemove, 1100,300,0
                        sleep, 50
                        sendInput, {e}
                        sleep, 700
                        sendInput, {Rbutton}
                        sleep, 100
                        if(m == 1 ){

                            sendInput, {ctrl down}{w down}
                            sleep, 600
                            sendInput, {w up}{s down}
                            sleep, 600
                            sendInput, {ctrl up}{s up}
                        }

                        openCraftingTable()
                        sleep, 400
                        Goto, uncraft
                    }
                }
                sleep, 30
                sendInput, {e}
            }
            craftEveryBlock(minerals){
                BlockInput, on
                openCraftingTable()
                sleep, 350
                mousemove, 339, 344 , 0
                click
                loop, 2 
                {

                    For Key, element in minerals
                    {
                        cont=0
                        ; cont2=0
                        findblock:
                            sleep, 200
                            ImageSearch, x, y, 0, 0, 1366, 768, images\%element%block.png
                            if(x>0){
                                cont++
                                mousemove, x+2,y+2,0
                                sendInput, {shift down}{lbutton}{shift up}
                                mousemove, 1100,300,0
                                ImageSearch, x2, y2, 0, 0, 1366, 768, images\emptycraft.png
                                mousemove, 926, 291,0
                                if(cont !=10){
                                    sendInput, {shift down}{lbutton}{shift up}
                                    mousemove, 1100,300,0
                                    sleep, 50

                                }
                                else{
                                    cont=0
                                    if(x2<0){
                                        dropq:
                                            loop, 10
                                            {
                                                mousemove, 926, 291,0
                                                sendInput, {q}
                                                sleep, 60
                                            }
                                            mousemove, 1100,300,0
                                            sleep, 100
                                            ImageSearch, x2, y2, 0, 0, 1366, 768, images\emptycraft.png
                                            if(x2<0){
                                                sleep, 40
                                                Goto, dropq
                                            }
                                        }
                                        else{
                                            mousemove, 1100,300,0
                                            sleep, 500
                                            sendInput, {e}
                                            sleep, 100
                                            drop(["redstone","stone"])
                                            sleep, 400
                                            sendInput, {e}
                                            sleep, 450
                                            openCraftingTable()

                                        }
                                    }

                                    ; drop(["redstone", "stone"])
                                    ; sleep, 300
                                    Goto, findblock
                                }
                            }
                        }
                        sleep, 40
                        sendInput, {e}
                        sleep, 500
                        drop(["redstone"])
                        sleep, 100
                        BlockInput, off
                    }
                    findElement(){
                        ; minevip()
                        ; drop(["stone"])
                        ; putInTheBack()
                        ; craftEveryBlock(["gold","emerald","iron","diamond"])
                    }
                    minevip(){
                        ; sendInput, {ctrl down}
                        ; sendInput, {shift down}
                        ; findElement()
                        sendInput, {w down}
                        sleep, 3000
                        turnDown()
                        turnDown()
                        moveMouse(0,-1500)
                        sendInput, {w up}
                        sendInput, {lbutton down}
                        sendInput, {w down}
                        loop, 16
                        {
                            sendInput, {w down} 
                            sleep, 400
                            sendInput, {lbutton down}
                            c:=0
                            c2:=0
                            step = 40
                            step2= 60
                            index = 
                            if(mod(A_Index, 4)==0){
                                step*=-1
                            }
                            loop, 114 
                            {
                                if(mod(A_Index, 50)==0){
                                    step2*=-1
                                }

                                DllCall("mouse_event",uint, 1, int, step, int,step2)
                                sleep, 1
                                c+= step
                            }
                            sendInput, {w up}
                            Random, rand , 100,1000
                            sleep, %rand%
                            sendInput, {w down}
                            turnRight()
                            if(mod(A_Index, 5)== 0){
                                sendInput, {lbutton up}
                                sendInput, {w up} 
                                findElement()
                            }
                        }
                        sendInput, {lbutton up}
                        sendInput, {w up}
                        Random, rand , 3000, 600000
                        sleep, %rand%
                    }
                    ^+f::
                        minevip()
                        ; findElement()
                    return
                    gotoSellAll(){
                        blockinput, on
                        command("home xp")
                        sleep, 4300
                        turnLeftC()
                        dropBackPack([1,1,1,1,0])
                        sleep, 1500
                        command("home mine")
                        sleep, 4300
                    }
                    gotoSellAllReal(){
                        blockinput, on
                        command("warp vip")
                        sleep, 5000
                        sendinput, {ctrl down}{d down}{w down}
                        sleep, 7500
                        sendinput, {d up}{w down}
                        sleep, 2000
                        sendInput, {w up}
                        sleep, 300
                        sendInput, {a up}{w down}
                        sleep, 400
                        sendInput, {w up}{ctrl up}
                        sleep, 20
                        turnLeftC()
                        moveMouse(0, 550)
                        ; sleep, 30
                        ; sendInput, {rbutton}
                        ; sleep, 100
                        ; moveMouse(-1140,0)
                        ; blockinput, off
                        ; sendInput, {d down}
                        ; sleep, 900
                        ; sendInput, {d up}
                        ; sendInput, {ctrl down}{w down}
                        ; sleep, 3000
                        ; sendInput, {ctrl up}{w up}
                        ; moveMouse(1140,0)
                        ; sendInput, {lbutton down}
                    }
                    dropBackPack(b){
                        l:=b.Length()
                        while(A_Index<=l){
                            i:=A_Index
                            ban:=false
                            while(b[i]!="0" and ban==false)
                            {
                                command("mochila")
                                constantBackpack:=540
                                bk:=40
                                cordx:=constantBackpack+(bk*i)
                                mousemove, %cordx%, 300, 0
                                sleep, 5
                                click
                                sleep, 320
                                c = 35
                                startx = 546
                                starty = 204 
                                speed = 1
                                sendInput, {ctrl down}
                                sendInput, {shift down}
                                loop, 6
                                {
                                    f:=false
                                    index= %A_Index%
                                    loop, 9{
                                        mousemove, startx, starty , speed
                                        sendInput, {lbutton}
                                        if(mod(index,2)!=0){
                                            if(A_Index !=9){
                                                startx+=c
                                            }
                                        }
                                        else{
                                            if(A_Index !=9){
                                                startx-=c
                                            }
                                        }
                                    }
                                    starty+=c
                                }
                                exitBackPack:
                                    sleep, 50
                                    sendInput, {shift up}
                                    sendInput, {ctrl up}
                                    sendInput, {esc}
                                    sleep, 100
                                    sendInput, {rbutton}
                                    sleep, 700
                                    ban:=true
                                }
                            }
                        }
                        ^+!v::
                            craftAndSell(0)
                            BlockInput, off
                        return
                        ^+v::
                            ; InputBox, m, Cual mochila deseas vaciar, elije 1 o 2, , 300, 300, X, Y, Locale, Timeout, 0
                            Gui, Font,s14, MS Sans Serif
                            Gui, Add, Text, vTextTest w450 h50, Which backpacks do you want to sell?
                            Gui, Add, CheckBox, vBp1 h50 X50 y40 , Backpack 1
                            Gui, Add, CheckBox, vBp2 h50 x250 y40 , Backpack 2
                            Gui, Add, CheckBox, vBp3 h50 X50 y80 Checked , Backpack 3
                            Gui, Add, CheckBox, vBp4 h50 x250 y80 Checked , Backpack 4
                            Gui, Add, CheckBox, vBp5 h50 x150 yp40 Checked , Backpack 5
                            Gui, Add, Button, Default w80, OK
                            Gui, show
                        return
                        bpArray:=[0,0,0,0,0]
                        sleep, 10
                        ButtonOK:
                            Gui, Submit
                            bpArray:= [Bp1,Bp2,Bp3,Bp4,Bp5]
                            ; for i, e in bpArray
                            ; {
                            ;     msgbox, %e%
                            ; }
                            ; sleep, 500
                            ; sendInput, {esc 1}
                            sleep, 500
                            dropBackPack(bpArray)
                            Gui, destroy
                        return
                        sortItemsAndSell(){
                            sleep, 100
                            putInTheBack(1,["diamond"])
                            if(!ironbackpack){
                                putInTheBack(4,["iron"])
                                sleep, 100
                                putInTheBack(3,["gold"])
                                sleep, 100
                            }else{
                                sleep, 100
                                putInTheBack(5,["iron"])
                                sleep, 100
                                putInTheBack(2,["gold"])
                            }

                            sleep, 100
                            putInTheBack(2,["emerald"])
                            ; sleep, 100
                            ; putInTheBack(1,["diamond"])
                            ironbackpack:=!ironbackpack
                            sleep, 50
                            command("sellall")
                        }
                        XButton2::
                            sortItemsAndSell()
                            sleep, 50
                            sendInput, {lbutton down}
                        return
ironbackpack:=false
                        automaticMode(){
				ironbackpack:=false
                            sortItemsAndSell()
                            gotoSellAll()
                            sleep, 3000
                            command("home mine2")
                            sleep, 4400
                            orientedToMine()
                            sendInput, {1}
                            sendInput, {lbutton down}
                            sendInput, {w down}
                            bandera:=false
                            while(true){
                                sleep, 50
                                c+=10
                                c3:=0
                                c2:=0
                                step = 14
                                step2= 17
                                ; loop, 5
                                ; {
                                loop, 400
                                {
                                    if(mod(A_Index, 100)==0){
                                        step2*=-1
                                    }
                                    DllCall("mouse_event",uint, 1, int, step, int,step2)
                                    sleep, 5
                                    c3+= step
                                }
                                ; }
                                if(mod(c,30)==0){

                                    sendInput, {Lbutton up}
                                    sendInput, {a up}
                                    sendInput, {s up}
                                    sendInput, {d up}
                                    sendInput, {w up}
                                    sleep, 100
                                    sortItemsAndSell()
                                    sleep, 100
                                    orientedToMine()
                                    sleep, 100
                                    sendInput, {rbutton}
                                    sleep, 100
                                    sendInput, {Lbutton down}
                                    sendInput, {w down}

                                }
                                if(mod(c,40)==0){
                                    sendInput, {a up}
                                    sendInput, {s up}
                                    sendInput, {d up}
                                    sendInput, {w up}
                                    sleep, 200
                                    ; sortItemsAndSell()
                                    if(!bandera){
                                        command("home mine")
                                    }
                                    else{
                                        command("home mine2")
                                    }
                                    bandera:=!bandera
                                    sleep, 8000
                                    if(bandera){
                                        command("home mine")
                                    }
                                    else{
                                        command("home mine2")
                                    }
                                    sleep, 4400
                                    orientedToMine()
                                    sendInput, {lbutton down}
                                    sendInput, {w down}
                                    sleep, 100
                                    orientedToMine()
                                }
                                if(mod(c,250)==0){
                                    sendInput, {a up}
                                    sendInput, {s up}
                                    sendInput, {d up}
                                    sendInput, {w up}
                                    sendInput, {lbutton up}
                                    sortItemsAndSell()
                                    sleep, 100
                                    loop, 2 {
                                        gotoSellAll()
sleep, 8000
                                    }
                                    sleep, 10000
                                    sendInput, {lbutton down}
                                    sendInput, {w down}
                                    sleep, 500
                                    if(bandera){
                                        command("home mine")
                                    }
                                    else{
                                        command("home mine2")
                                    }
                                    sleep, 4400
                                    orientedToMine()
                                    c=0
                                    sleep, 4400
sendInput, {w down}
sendInput, {lbutton down}
                                }
                            }
                        }
                        orientedToMine(){
                            sleep, 20
                            turnLeftC()
                            sleep, 20
                            moveMouse(0, 3500)
                            sleep, 20
                            moveMouse(0, -2150)
                            ; moveMouse(0, -2744)
                            sleep, 20
                        }
                        manualMode(){
                            drop(["stone", "redstone"])
                            craftEveryBlock(["lapizlazuli","iron","gold", "coal", "emerald", "diamond"])
                            putInTheBack(1, ["lapizlazuli","coal"])
                            putInTheBack(2, ["emerald","iron","diamond", "gold"])
                            sleep, 100
                            c:=0
                            s=1
                            b=1
                            ; gotoSellAll()
                            sendInput, {lbutton down}
                            sendInput, {w down}
                            sendInput, {1}
                            turnRight()
                            moveMouse(-599, 0)
                            while(true){
                                sleep, 50
                                c+=1
                                c3:=0
                                c2:=0
                                ; reconnect()
                                if(mod(c,20*10)==0){
                                    sendInput, {lbutton up}
                                    drop(["stone", "redstone"])
                                    sleep, 40
                                    sendInput, {lbutton down}
                                    sendInput, {a up}
                                    sendInput, {s up}
                                    sendInput, {d up}
                                    sendInput, {w down}
                                }
                                if(mod(c,70*10)==0){
                                    sendInput, {lbutton up}
                                    drop(["stone", "redstone"])
                                    craftEveryBlock(["lapizlazuli","iron","gold", "coal", "emerald", "diamond"])
                                    ; putInTheBack(1, ["lapizlazuli","coal"])
                                    ; putInTheBack(2, ["emerald","iron","diamond", "gold"]) 
                                    sleep, 40
                                    sendInput, {lbutton down}
                                    sendInput, {a up}
                                    sendInput, {s up}
                                    sendInput, {d up}
                                    sendInput, {w down}

                                }
                                if(mod(c,180*10)==0){
                                    sendInput, {lbutton up}
                                    sendInput, {w up}
                                    sendInput, {a up}
                                    sendInput, {s up}
                                    sendInput, {d up}
                                    drop(["stone", "redstone"])
                                    craftEveryBlock(["lapizlazuli","iron","gold", "coal", "emerald", "diamond"])
                                    putInTheBack(1, ["lapizlazuli","coal"])
                                    putInTheBack(2, ["emerald","iron","diamond", "gold"]) 
                                    ; sleep, 300
                                    ; gotoSellAll()
                                    sleep, 300
                                    ; sleep, 300000
                                    sendInput, {lbutton down}
                                    sendInput, {w down}

                                }
                                if(mod(c,600*10)==0){
                                    craftAndSell(1)
                                    sleep, 100
                                    gotoSellAll()
                                    sleep, 500
                                    sendInput, {lbutton down}
                                    sendInput, {a up}
                                    sendInput, {s up}
                                    sendInput, {d up}
                                    sendInput, {w down}

                                }
                            }
                        }
                        XButton1::
                            InputBox, x, Select mode, Manual= 1 automaticMode = 2, , 100, 150, X, Y, Locale, Timeout, 2
                            sleep, 400
                            if(x==1){
                                manualMode()
                            }
                            else{
                                automaticMode()
                            }
                        return
                        craftAndSell(d){
                            b=2
                            sendInput, {lbutton up}
                            sendInput, {w up}
                            drop(["stone", "redstone"])
                            craftEveryBlock(["lapizlazuli","iron","gold", "coal", "emerald", "diamond"])
                            ; putInTheBack(1, ["lapizlazuli","coal"])
                            putInTheBack(b, ["emerald","iron","diamond", "gold"]) 
                            sleep, 100
                            sendInput, {lbutton up}
                            sendInput, {w up}
                            sendInput, {a up}
                            sendInput, {s up}
                            sendInput, {d up}
                            sleep, 500
                            if(d==1){
                                gotoSellAllReal()
                            }
                            sleep, 1500
                            dropBackPack(1)
                            sleep, 500
                            unCraftEveryBlock(["coal", "lapizlazuli"], b)
                            sleep, 500
                            sendinput, {rbutton}
                            sleep, 500
                            dropBackPack(b)
                            sleep, 500
                            sendinput, {rbutton}
                            sleep, 500
                        }
                        !space::
                            sendInput, {t}
                            sleep, 350
                            sendInput, /register Password44 Password44 {enter}
                        return

                        turnLef(){
                            DllCall("mouse_event",uint, 1, int, -100, int, 0)
                            sleep, 200
                        }
                        turnLeftDown(){
                            DllCall("mouse_event",uint, 1, int, -500, int, 320)
                            sleep, 400
                        }
                        turnCente(){
                            DllCall("mouse_event",uint, 1, int, 0, int, -480)
                        }
                        turnDow(){
                            DllCall("mouse_event",uint, 1, int, 0, int, 800)
                        }
                        turnU(){
                            DllCall("mouse_event",uint, 1, int, 0, int, -800)
                        }
                        turnRigh(){
                            DllCall("mouse_event",uint, 1, int, 500, int, 0)
                        }
                        turnRig(){
                            DllCall("mouse_event",uint, 1, int, 100, int, 0)
                        }
                        moveMouse(x, y){
                            DllCall("mouse_event",uint, 1, int, x, int, y)
                        }
                        moveDelayedFunction(key, delay){
                            sendInput, {%key% down}
                            sleep, delay
                            sendInput, {%key% up}
                            sleep, 200
                        }
                        setOnMove(){
                            sendInput, {d down}
                            sleep, 2000
                            sendInput, {d up}
                            sendInput, {w down}
                            sleep, 1000
                            sendInput, {w up}
                        }
                        setOnCraft(){
                            sleep, 200
                            sendInput, {e}
                            sleep, 400
                            ;sendInput, {e}
                            ;sleep, 200
                            loop, 8 
                            {
                                mouseMove 412, 297, 0
                                sendInput, +{lbutton}
                                sleep, 300
                                mouseMove 982, 280, 0
                                sleep, 300
                                sendInput, +{lbutton} 
                            }
                            sleep, 200
                            sendInput, {e}
                            sleep, 500

                        }
                        setOnClickMove(){
                            sendInput, {rbutton}
                            sleep, 100
                            mouseMove 541, 206, 0
                            sleep 200
                            sendInput, {lbutton}
                            sleep, 150
                            sendInput, {shift down}
                            mouseMove 575, 208, 0
                            send, {lbutton 2}
                            sleep, 200 
                            sendInput, {shift up}
                            sleep, 200
                            sendInput, {esc}
                            sleep, 550

                        }
                        setOnClickGuardar(){
                            sleep, 400
                            sendInput, {rbutton}
                            sleep, 400
                            mouseMove 683, 561, 0
                            sendInput, {lbutton}
                            sleep, 150
                            sendInput, {shift down} 
                            mouseMove 825, 564, 0
                            sendInput, {lbutton 2}
                            sleep 500
                            sendInput, {shift up}
                            sendInput, {lbutton}
                            sleep, 200
                            sendInput, {shift down}
                            sendInput, {lbutton}
                            sendInput, {shift up}
                            sleep, 100
                            sendInput, {e}
                            sleep, 150
                        }

                        setOnTheCorner(){
                            sendInput, {ctrl down}
                            sendInput, {w down}
                            sendInput, {d down}
                            sleep, 3500
                            sendInput, {w up}
                            sendInput, {d up}
                            sendInput, {s down}
                            sleep, 2000
                            sendInput, {s up}
                            sendInput, {ctrl up}
                        }
                        mineForward(){
                            sendInput, {lbutton down}
                            sendInput, {w down}
                            sleep, 1100
                            sendInput, {w up}
                            sendInput, {lbutton up}

                        }

                        mine(){
                            turnDown()
                            moveDelayedFunction("lbutton", 11000)
                            turnCenter()
                            mineForward()
                            turnLeft()
                            loop, 9
                            {
                                sendInput, {a down}
                                sendInput, {lbutton down}
                                sleep, 15000
                                sendInput, {lbutton up}
                                sendInput, {a up}
                                sendInput, {w down}
                                sleep, 500
                                sendInput, {w up}
                                sendInput, {d down}
                                sendInput, {lbutton down}
                                sleep, 10000
                                sendInput, {lbutton up}
                                sendInput, {d up}
                            }
                        }

                        turnLeft(){
                            DllCall("mouse_event",uint, 1, int, -2280, int, 0)
                            sleep, 100
                        }
                        turnCenter(){
                            DllCall("mouse_event",uint, 1, int, 0, int, -1500)
                            sleep, 100
                        }
                        turnDown(){
                            DllCall("mouse_event",uint, 1, int, 0, int, 4500)
                            sleep, 100
                        }
                        turnUp(){
                            DllCall("mouse_event",uint, 1, int, 0, int, -800)
                            sleep, 100
                        }
                        turnRight(){
                            DllCall("mouse_event",uint, 1, int, 2280, int, 0)
                            sleep, 100
                        }
                        clickAndCraft(){
                            setOnClickMove()
                            setOnCraft()
                        }
                        setCenterAndRight(){
                            turnCente()
                            turnRigh()
                            turnRig()
                        }
                        turnLeftC(){
                            DllCall("mouse_event",uint, 1, int, -3, int, 0)
                        }
                        ^l::
                            turnLeftC()
                        return
                        mineForward4(n){
                            loop, %n%
                            {
                                mineForward()
                            }
                        }
                        putTorch(){
                            sendInput, {7}
                            moveMouse(-1200, 0 )
                            sleep, 30+20
                            sendInput, {rbutton down}
                            sleep, 50+20
                            sendInput, {rbutton up}
                            ; sleep, 10
                            sendInput, {1}
                            ; sleep, 10
                            moveMouse(1200, 0 )
                        }
                        autoStrippedMinning(){
                            c=10
                            f:=False

                            while(!f){
                                turnDown()
                                sleep, 100
                                sendInput, {1}
                                moveMouse(0, -1400)
                                mineForward4(6)
                                moveMouse(0, -800)
                                turnRight()
                                mineForward4(4)
                                putTorch()
                                moveMouse(-4558, 0)
                                mineForward4(4)
                                putTorch()
                                turnRight()
                                if(Mod(c, 2) == 0 or Mod(c, 3)== 0){
                                    turnLeftC() 
                                }
                                c--
                                if(c==0){
                                    f:=True
                                }
                            }
                            turnDown()
                            sleep, 100
                            clipboard:= "/home mine"
                            sendInput, {t}
                            sleep, 200
                            sendInput, ^{v} {enter}
                            msgbox, ,fin :3,,2
                            ; moveMouse(0,-500)

                            ; sendInput, {ctrl down}
                            ; sendInput, {lbutton down}

                        }
                        ^m::
                            ; moveMouse(0,0)
                            ; sleep, 1000
                            ; KeyWait, ctrl, D
                            ; KeyWait, ctrl, U
                            ; sleep, 800
                            ; BlockInput, on
                            ; setOnTheCorner()
                            ; mine()
                            ; BlockInput, off
                            ; turnRight()
                            autoStrippedMinning()
                        return
                        sellAll(){
                            sendInput, {t}
                            sleep, 300
                            Clipboard:= /sellall
                            sendInput, ^{v}{enter}
                        }

                        ^n::
                            BlockInput, on
                            Msgbox, "hola, desconecta el mouse"
                            turnDow()
                            sleep, 400
                            setCenterAndRight()
                            moveDelayedFunction("lbutton", 2000)
                            sleep, 500
                            turnLef()
                            setOnMove()
                            turnLeftDown()
                            clickAndCraft()
                            moveDelayedFunction("a", 1200)
                            setOnClickGuardar()
                            moveDelayedFunction("d", 700)
                            clickAndCraft()
                            moveDelayedFunction("a", 1200)
                            setOnClickGuardar()
                            moveDelayedFunction("d", 500)
                            clickAndCraft()
                            moveDelayedFunction("a", 1200)
                            setOnClickGuardar()
                            moveDelayedFunction("w", 1500)
                            BlockInput, off
                        return

                        ^r::
                            reload
                            sendInput, {w up}
                            sendInput, {lbutton up}
                            sendInput, {shift up}
                            sendInput, {ctrl up}
                        return
                        ^numpad2::
                            sleep, 400
                            mousemove, 1230, 603, 0
                            click
                            sleep, 100
                            mousemove, 1218, 618 , 0
                            click
                            sleep, 50
                            click
                            sleep, 50
                            sendInput, ^{v}{tab}
                            sleep, 200
                            Clipboard:= "100101011010110password10010"
                            sendInput, ^{v}
                            mousemove, 1297, 700 , 0
                            sleep, 500
                            click
                            KeyWait, ctrl, D
                            KeyWait, ctrl, U
                            sleep, 500
                            click
                        return
                        ^numpad3::
                            sleep, 400
                            username:= "facelessdivine@gmail.com"
                            clipboard:= username 
                            mousemove, 1230, 603, 0
                            click
                            sleep, 100
                            mousemove, 1212, 634, 0
                            click
                            sleep, 50
                            click
                            sleep, 50
                            sendInput, ^{v}{tab}
                            sleep, 200
                            Clipboard:= "100101011010110password10010"
                            sendInput, ^{v}
                            mousemove, 1297, 700 , 0
                            sleep, 500
                            click
                            sleep, 500
                            click
                        return