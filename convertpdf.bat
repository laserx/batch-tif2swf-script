@echo off
set path=%%path%%;D:\Program Files\NConvert-win64
call :treeProcess
goto :eof

:treeProcess
for /D %%d in (*) do (
    cd %%d
    call :treeProcess
    cd ..
)
for %%f in (*.tif) do (
  echo CONVERTING %%%f%~dpf%%f
  nconvert -overwrite 40 -text_color 40 0 0 -text_flag top-right -text_pos -20 20 -text_rotation 0 -text "test" -dither -grey 16 -out pdf -c 3 -o ".\pdf\%%.pdf" "%%f"
  )
exit /b