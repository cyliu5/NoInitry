@echo off
::
:: Stops commits that have empty log messages.
::
set SVN_BINDIR="D:\csvn\bin\svnlook.exe"
setlocal

rem Subversion sends through the path to the repository and transaction id
set REPOS=%1
set TXN=%2

rem check for an empty log message
%SVN_BINDIR% log %REPOS% -t %TXN% | findstr ".........." > nul
if %errorlevel% gtr 0 goto :err_msg

rem ignore space
%SVN_BINDIR% log %REPOS% -t %TXN% | findstr /ic:"          " > nul
if %errorlevel% gtr 0 goto :success

:err_msg
echo. 1>&2
::echo "[SVN 警示] 註解不可空白 & 不能少於10字符. 中止上傳!" 1>&2
::echo "[SVN 警示] 請填註解. 就能上傳!" 1>&2

echo "[SVN Notice] Your commit log is empty or too short." 1>&2
echo "[SVN Notice] Cannot commit successfully!" 1>&2
echo "[SVN Notice] Please add commit log then try committing again!" 1>&2

goto :err_exit

:err_exit
exit 1

:success
exit 0
