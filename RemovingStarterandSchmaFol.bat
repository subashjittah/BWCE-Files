@echo off
setlocal

rem Set the source paths for the .xsd files
set "source1=S:\ScriptTesting\place2\Schemas\*\Schemas"
set "source2=S:\ScriptTesting\place2\Schemas\*\starter"

rem Set the destination path
set "destination=S:\ScriptTesting\place2\Schemas\"

rem Check if the destination folder exists, create it if not
if not exist "%destination%" mkdir "%destination%"

rem Move .xsd files from the first source directory
for %%I in ("%source1%\*.xsd") do (
    move /y "%%I" "%destination%"
    if %errorlevel% neq 0 (
        echo Error moving .xsd file "%%I" to "%destination%".
        goto :cleanup
    )
)

rem Move .xsd files from the second source directory
for %%J in ("%source2%\*.xsd") do (
    move /y "%%J" "%destination%"
    if %errorlevel% neq 0 (
        echo Error moving .xsd file "%%J" to "%destination%".
        goto :cleanup
    )
)

echo Files moved successfully!

rem Check if the destination folder is not empty before attempting to delete
if exist "%destination%\*.xsd" (
    rem Check if the source files are empty and delete them
    for %%K in ("%source1%\*.xsd" "%source2%\*.xsd") do (
        del "%%K" 2>nul
    )
    echo Source files checked and empty files deleted.
) else (
    echo Destination folder is empty. No source files checked for deletion.
)

:cleanup
endlocal
