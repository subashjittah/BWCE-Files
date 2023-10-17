@echo off
setlocal enabledelayedexpansion

set "sourceFolder=S:\ScriptTesting\TestEAR2\UnifiedBillInquiry\Processes"
set "destinationRoot=S:\ScriptTesting\place2\Processes\"

if not exist "%destinationRoot%" mkdir "%destinationRoot%"

for /r "%sourceFolder%" %%F in (*.bwp) do (
    set "sourcePath=%%~dpF"
    set "relativePath=!sourcePath:%sourceFolder%\=!"
    set "destinationPath=%destinationRoot%!relativePath!"

    rem Create folder if not exist
    if not exist "!destinationPath!" mkdir "!destinationPath!"

    rem Copy the file
    copy "%%F" "!destinationPath!"
)

echo Files copied successfully.
pause
