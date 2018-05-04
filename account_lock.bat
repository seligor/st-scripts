REM =================================================== 
REM === Simple SecureTower AD account lock
REM === Created by Anton Solovey @ Falcongaze LLC, 2018
REM ===================================================
 

@Title Active Directory account lock
@echo off
color f0
cls

Net user %ADUserName% /Domain /Active:no
cls
color a
@echo "==========================================================="
echo   ## The user account %ADUserName% is successfully locked ! 
@echo "==========================================================="
echo   ## Press "Enter" button to clos this command prompt. 
@echo "==========================================================="
pause