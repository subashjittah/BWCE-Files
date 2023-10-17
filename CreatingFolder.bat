@echo off
setlocal enabledelayedexpansion

rem Set source and destination paths
set "sourcePath=S:\ScriptTesting\place1"
set "destinationPath=S:\ScriptTesting\place2\Processes"

rem Loop through folders in the source path
for /D %%D in ("%sourcePath%\*") do (
    rem Extract the folder name
    set "folderName=%%~nxD"

    rem Create the destination directory
    mkdir "%destinationPath%\!folderName!"

    rem You can add additional actions related to the folder name here if needed
)

echo "Folder names copied and directories created successfully."

endlocal
