SetTimer, autoLoginDz, 500
Login(){
    autoLoginDz:
        passwordElmer:= "miperroesgey" ; pon tu password aqui
        ImageSearch, x, y, 0, 0, 1366, 768, ;pega la ruta de la captura de la ventana
        if(x>0){
            blockinput, on
            mousemove, 209,229,0
            sleep, 50 
            sendInput, {Lbutton}
            sleep, 50
            sendInput, %passwordElmer%
            sleep, 6000
            blockinput, off

        }
    return
}
^+!::reload