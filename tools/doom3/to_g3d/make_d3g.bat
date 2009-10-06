@echo off
echo.
echo make_d3g: option -r recreates some of d3g's sources from the doom3.y file
echo                  -O builds with speed-oriented optimizations
echo.
if not "%1"=="-r" goto comp
rem
echo ** Compile AYACC (.y) file to Ada sources
ayacc.exe doom3.y off off on off>ayacc.log
type ayacc.log
rem
if exist yyparse.adb del yyparse.adb
ren doom3.a yyparse.adb
shift
rem
:comp
echo.
rem
set opt_comp294572=-gnato -gnatVa -gnatec../../../obj/gnatdebg/debug.pra -aO..\..\..\obj\gnatdebg
if "%1"=="-O" set opt_comp294572=-O2 -gnatpn -funroll-loops -fpeel-loops -ftracer -funswitch-loops -aO..\..\..\obj\gnatfast
if "%1"=="-O" shift
rem
gnatmake -i -g -j2 %1 %2 %opt_comp294572% -I.. -I.. -I..\..\..\src -I..\..\..\bindings -I..\..\..\bindings\win32 -I..\..\..\src\unzip -I..\..\..\src\gl d3g -largs -lopengl32 -lglu32 -lfreeglut -L../../../obj/libwin32 ../../../obj/libwin32/glee.o
rem
set opt_comp294572=
:fin