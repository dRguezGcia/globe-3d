@echo off

if "%1"=="" goto syntaxe

if not exist %1.proc unzip %1.zip %1.proc
if not exist %1.proc echo Processed map file "%1.proc" not found!
if not exist %1.proc goto syntaxe

call make_d3g

echo ** Build and save objects, BSP, etc. from %1.proc into %1.zip

if     "%2"=="" d3g -j -a %1.proc -c0
if not "%2"=="" d3g -j -a %1.proc %2 %3 %4 %5 %6 %7 %8


echo ** Make / update %1.zip file with the stuff

copy %1.zip %1.old.zip

zip %1.zip %1*.g3d %1.bsp
del *.g3d
del *.bsp

echo ** Add textures to %1.zip...

md tmp
cd tmp
del *.bmp
del *.tga

echo   ** Put: Original textures
7zip_210 e -y -i@..\%1_textures_unzip_list.txt c:\temp\pak004.pk4

echo   ** Put: Modified textures, e.g. stored as BMP's with palette
7zip_210 e -y -i@..\%1_textures_unzip_list.txt ..\palettex.zip

echo   ** Put: Already stored textures
unzip -o ..\%1.zip *.tga *.bmp

echo   ** Some diffuse images don't have the "_d"
call ..\%1_textures_add_tex_suffix1

echo   ** Put: Fake images for missing textures
call ..\%1_textures_copy_fakes

echo   ** Do some filtering
call ..\%1_textures_add_tex_suffix2

echo   ** Store all these pictures
zip ..\%1.zip *.bmp *.tga

cd..

echo ** Display!

echo GLOBE_3D_Demo.exe -load=%1 >%1.bat

start %1

goto fin

:syntaxe
echo Syntax: procpack mylevel
echo.
echo processes mylevel.proc and creates or completes mylevel.zip
echo.
pause

:fin
