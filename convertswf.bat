@echo off
set path=%%path%%;D:\Program Files (x86)\SWFTools
call :treeProcess
goto :eof

:treeProcess
for /D %%d in (*) do (
    cd %%d
    call :treeProcess
    cd ..
)
for %%f in (*.pdf) do (
  echo CONVERTING %%%f%~dpf%%f
  pdf2swf "%%f" -o "..\swf\%%%f%~nf.swf" -T 9 -f
  )
exit /b