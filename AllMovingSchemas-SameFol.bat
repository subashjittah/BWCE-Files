@echo off
setlocal enabledelayedexpansion

set "sourceFolder=S:\ScriptTesting\TestEAR2\UnifiedBillInquiry\Processes"
set "destinationRoot=S:\ScriptTesting\place2\Schemas\"

if not exist "%destinationRoot%" mkdir "%destinationRoot%"

for /r "%sourceFolder%" %%F in (*.xsd) do (
    rem Copy the file directly to the main destination folder
    copy "%%F" "%destinationRoot%"
)

echo Files copied successfully.
pause

