@echo off

mkdir "Скрытая папка"
mkdir "Не скрытая папка"
attrib +h "Скрытая папка"

xcopy /? > "Не скрытая папка\copyhelp.txt"
xcopy "Не скрытая папка\copyhelp.txt" "Скрытая папка\copied_copyhelp.txt"

echo Скрипт виконано успішно!
pause