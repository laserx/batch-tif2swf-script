@echo off
call :treeProcess
goto :eof

:treeProcess
for /D %%d in (*) do (
    cd %%d
    call :treeProcess
    mkdir pdf swf
    echo create folder successed!
    cd ..
)