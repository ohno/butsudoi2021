cd %~dp0/../
set USR_INPUT_STR=
set /P USR_INPUT_STR="commit message : "
git add .
git commit -m "%USR_INPUT_STR%"
git push
pause