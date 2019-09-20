@echo off

set /A stateBefore=0
set /A state=0

:loop

ping %1 -n 1 -w 1000 -l 2000 -4 | find /i "TTL" >nul 2>&1
if errorlevel 1 (
        set /A state=0
) else (
        set /A state=1
)

if NOT %stateBefore% EQU %state% (
	if %state% EQU 1 (
		echo [%time%][%1] Host is up
	) else (
		echo [%time%][%1] Host is down
	)
)

set /A stateBefore=%state%
ping localhost -n 2 >NUL

goto loop
