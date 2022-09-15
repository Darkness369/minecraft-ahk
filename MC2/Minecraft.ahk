+space::
    sendInput, {t}
    sleep, 350
    sendInput, /login shinratensei199 {enter}
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
    sendInput, {w down}
    sendInput, {lbutton down}
    sleep, 7000
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
        sleep, 10000
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
    DllCall("mouse_event",uint, 1, int, -482, int, 0)
}
turnCenter(){
    DllCall("mouse_event",uint, 1, int, 0, int, -350)
}
turnDown(){
    DllCall("mouse_event",uint, 1, int, 0, int, 800)
}
turnUp(){
    DllCall("mouse_event",uint, 1, int, 0, int, -800)
}
turnRight(){
    DllCall("mouse_event",uint, 1, int, 482, int, 0)
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

^m::
    KeyWait, ctrl, D
    KeyWait, ctrl, U
    sleep, 800
    BlockInput, on
    setOnTheCorner()
    mine()
    BlockInput, off
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

^t::
    BlockInput, on
    moveDelayedFunction("w", 1500)
    BlockInput, off
return

^+r::
    reload
return

