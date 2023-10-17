@echo off
setlocal enabledelayedexpansion

set "sourceFolder=S:\ScriptTesting\TestEAR2\UnifiedBillInquiry\Processes"
set "destinationRoot=S:\ScriptTesting\place2\schemas\"

if not exist "%destinationRoot%" mkdir "%destinationRoot%"

:: Copy .xsd files from the source folder to the destination
for /r "%sourceFolder%" %%F in (*.xsd) do (
    set "relativePath=%%~dpF"
    set "relativePath=!relativePath:%sourceFolder%\=!"
    set "destinationPath=%destinationRoot%!relativePath!"

    rem Create folder if not exist
    if not exist "!destinationPath!" mkdir "!destinationPath!"

    rem Copy the file
    copy "%%F" "!destinationPath!"
)

echo Files copied successfully.

:: Additional functionality
call :AdditionalFunctionality "NewSourceFolder1" "Another\Destination\Folder1"
call :AdditionalFunctionality "NewSourceFolder2" "Another\Destination\Folder2"

pause
goto :eof

:AdditionalFunctionality
set "newSourceFolder=S:\ScriptTesting\place2\schemas\*\starter\"
set "newSourceFolder1=S:\ScriptTesting\place2\schemas\*\schemas\"
set "newDestinationFolder=S:\ScriptTesting\place2\schemas\*\"

:: Move .xsd files from the new source folder to another destination
for /r "!newSourceFolder!" %%F in (*.xsd) do (
    move "%%F" "%destinationRoot%"
)

echo Files moved from %newSourceFolder% to %destinationRoot% successfully.

:: Delete empty folders
for /d %%D in ("%newSourceFolder%") do (
    rd "%%D" 2>nul
)

goto :eof
