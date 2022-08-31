rem REPOS-PATH (the path to this repository)
set REPOS=%1
::set REPOS='D:\csvn\data\repositories\M23!'

set LANG=zh_TW,utf-8
 
rem REV (the number of the revision just committed)
set REV=%2
::set REV='47'
 
set HOOK_DIR=D:\csvn\data\repositories\M468\hooks
set SVNLOOK_BIN=D:\csvn\bin\svnlook.exe 
set PYTHON_BIN=D:\csvn\Python38\python.exe
::set PYTHON_BIN=C:\csvn\Python25\python.exe

::echo [SVN Notice] Run Bat file result! %REPOS% %REV% >D:\csvn\data\repositories\Test01\hooks\out.txt
%PYTHON_BIN% %HOOK_DIR%\sendEmail.py %REPOS% %REV%


