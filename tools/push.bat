cd ./..
rem
set USR_INPUT_STR=
rem
set /P USR_INPUT_STR="commit message : "
rem
git add .
git commit -m "%USR_INPUT_STR%"
git push
pause