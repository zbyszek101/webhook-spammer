@echo off
mode con: cols=100 lines=40
setlocal enabledelayedexpansion

set /p webhookUrl=webhook url: 
set /p botName=bot name: 
set /p message=message: 

set count=0
goto a

:a
for /L %%i in (1,1,10) do (
    curl -H "Content-Type: application/json" -X POST -d "{\"content\":\"%message%\", \"username\":\"%botName%\"}" %webhookUrl% >nul
    set /a count+=1
    echo Messages sent: !count! - "%message%" by "%botName%"
)

timeout /t 1 /nobreak >nul

goto a
