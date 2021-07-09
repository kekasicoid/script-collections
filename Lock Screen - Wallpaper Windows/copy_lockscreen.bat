@echo off
setlocal enableextensions

echo ====================================================
echo ==   Website : https://kekasi.co.id               ==
echo ==   Youtube : https://kekasi.link/kekasigensub   ==
echo ====================================================

echo.
echo Hai %USERNAME%   
echo Mohon tunggu...
echo. 
echo Hapus File %cd%\edit\*
@RD /S /Q "%cd%\edit\" 

REM mengambil drive path lokasi windows di install  
set lsPath=%windir%\Users\%USERNAME%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assetss
set lsPath=%lsPath:\WINDOWS=%    
set lsParent=%lsPath:Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assetss=Microsoft.Windows.ContentDeliveryManager_*%  
echo.
if exist %lsPath% (
    echo Lokasi Folder Lock Screen : Ditemukan
    echo %lsPath%

) else (
    echo Mencari Folder Lock Screen...
    echo.
    for /d %%G in (%lsParent%) do (
        echo Lokasi Folder Lock Screen : Ditemukan   
        echo %%G\LocalState\Assets
        set lsPath=%%G\LocalState\Assets
        goto :break
    )
    echo Arditya Kekasi
)
:break   
echo.  
echo Menduplikat data...
xcopy /s "%lsPath%\*.*" "%cd%\edit\" /h /i /c /r /y /q
cd "edit"
ren *.* *.jpg 

echo.
echo Membuka Folder Lock Screen 
timeout 2 /nobreak 
%SystemRoot%\explorer.exe "..\edit\"

echo. 
echo Membuka Folder Wallpaper
timeout 2 /nobreak 
%SystemRoot%\explorer.exe "%windir%\Web"
timeout 5 /nobreak 
start "" https://kekasi.co.id
pause