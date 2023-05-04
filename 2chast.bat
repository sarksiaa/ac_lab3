@echo off
echo Please enter the path to your directory. 
echo If you want to calculate multiple directories, enter their paths separated by space.
set /p directory=Input directory path: 
set total_size=0

if not exist "%directory%" (
    echo Error: Directory not found
    echo Exit code: 1
    ping 127.0.0.1 -n 2 > nul
    exit /b 1
)

for /r "%directory%" %%i in (*) do (
    attrib "%%i" | find "H" > nul && (
        set /a total_size+=%%~zi
    )
    attrib "%%i" | find "R" > nul && (
        set /a total_size+=%%~zi
    )
    attrib "%%i" | find "A" > nul && (
        set /a total_size+=%%~zi
    )
)
echo Total size: %total_size% bytes
echo Exit code: %errorlevel%
set /p =Press Enter to continue...