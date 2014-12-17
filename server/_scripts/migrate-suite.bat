@echo off
setlocal
call exports.bat
call exports-ant.bat
pushd ant

set migratepath=""

if "%1"=="-?" goto help
if "%1"=="-h" goto help
if "%1"=="-help" goto help
if "%1"=="--help" goto help
if "!%1"=="!" goto help
if "%1"=="-target" set migratepath=%2

:kdb
call ant -f aecopyfiles.xml -Dae.source.location="%AE_HOME%"  -Dbatchmode="y" -Dkdb.invertselect="n" -Dae.copycontents="n" -Dkdb.num="1" -Dkdb.delete="n" -Dkdb.bkupdir="%migratepath%"
goto end

 
REM ============================================
REM HELP AND ERROR MESSAGES
REM ============================================

REM ===================
REM HELP
:help
echo Usage: migrate-suite [option] [argument]
echo.
echo Description: run this script to migrate the newest kdbs from one system to another.  
echo.
echo Option:
echo.
echo   -target: specify the full path to the new Appian Home directory
echo.
echo Examples:
echo.
echo  migrate-suite -target C:\Appian
echo  Will migrate the most recent kdbs to C:\Appian
goto end

:end
popd