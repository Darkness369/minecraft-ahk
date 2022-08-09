@echo off
setlocal EnableDelayedExpansion
set "elem[1]=png"
set "elem[2]=jpg"
set "elem[3]=jpeg"
set "elem[4]=jfif"
set "elem[5]=webp"
set "elem[6]=gif"
set "elem[7]=mp4"
set "elem[8]=m4a"
set "elem[9]=mkv"
set "elem[10]=mp3"
set "elem[11]=fig"
set "elem[12]=js"
set "elem[13]=ahk"
set "elem[14]=py"
set "elem[15]=sql"
set "elem[16]=rar"
set "elem[17]=zip"
set "elem[18]=7z"
set "elem[19]=doc"
set "elem[20]=docx"
set "elem[21]=pptx"
set "elem[22]=xlsx"
set "elem[23]=pdf"
set "elem[24]=xls"
set "elem[25]=txt"
set "elem[26]=exe"
set "elem[27]=msi"
set "elem[28]=jar"
set "elem[29]=bak"
set "elem[30]=iso"
set "lst[0]=Photos"
set "lst[1]=Videos"
set "lst[2]=Music"
set "lst[3]=Code"
set "lst[4]=Rar"
set "lst[5]=Documents"
set "lst[6]=Programs"
set "lst[7]=Other"

if not exist Archivos (mkdir Archivos)
for /L %%i in (0,1,29) do (
    if exist *.!elem[%%i]! (
cd Archivos
if not exist !elem[%%i]! (mkdir !elem[%%i]!)
cd ..
forfiles /M *.!elem[%%i]! /C "cmd /c move @file Archivos/!elem[%%i]!"
FORFILES  /C "cmd /c if @isdir==TRUE (if not @file==\"Archivos\" (if not @fname==\"Code\" (if not @fname==\"AutoHotKey\" (move @file C:\Users\facel\OneDrive\Desktop\Archivos\Other))))"
    )
)
cd Archivos
for /L %%i in (0,1,7) do (
    if not exist !lst[%%i]! (
        mkdir !lst[%%i]!
    )
)
if exist png (robocopy png Photos /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist jpg (robocopy jpg Photos /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist jpeg (robocopy jpeg Photos /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist jfif (robocopy jfif Photos /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist webp (robocopy webp Photos /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist gif (robocopy gif Videos /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist mp4 (robocopy mp4 Videos /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist m4a (robocopy m4a Videos /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist mkv (robocopy mkv Videos /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist mp3 (robocopy mp3 Music /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist fig (robocopy fig Code /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist js (robocopy js Code /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist ahk (robocopy ahk Code /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist py (robocopy py Code /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist sql (robocopy sql Code /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist rar (robocopy rar Rar /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist zip (robocopy zip Rar /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist 7z (robocopy 7z Rar /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist doc (robocopy doc Documents /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist docx (robocopy docx Documents /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist pptx (robocopy pptx Documents /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist xlsx (robocopy xlsx Documents /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist pdf (robocopy pdf Documents /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist xls (robocopy xls Documents /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist txt (robocopy txt Documents /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist exe (robocopy exe Programs /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist msi (robocopy msi Programs /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist jar (robocopy jar Programs /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist bak (robocopy bak Other /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)
if exist iso (robocopy iso Other /E /MOVE /NFL /NDL /NJH /NJS /nc /ns /np)