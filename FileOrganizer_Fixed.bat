@echo off
setlocal EnableExtensions
title Automatic File Organizer
color 0A

REM Organizes files in the same folder as this BAT file.
REM Does not scan subfolders. Existing files with duplicate names are skipped.

set "SOURCE=%~dp0"
set "LOG=%SOURCE%FileOrganizer_Log.txt"

echo ==========================================
echo       AUTOMATIC FILE ORGANIZER
echo ==========================================
echo.
echo Folder: "%SOURCE%"
echo.

for %%D in (Images Videos Audio Documents Design_Files Archives Installers Programs Other_Files) do (
    if not exist "%SOURCE%%%D\" md "%SOURCE%%%D"
)

for %%F in ("%SOURCE%*") do (
    if exist "%%~fF" if not exist "%%~fF\" (
        if /i not "%%~nxF"=="%~nx0" if /i not "%%~nxF"=="FileOrganizer_Log.txt" (
            call :Classify "%%~fF" "%%~xF"
        )
    )
)

echo.
echo ==========================================
echo Organization complete.
echo Check FileOrganizer_Log.txt for results.
echo ==========================================
echo.
pause
exit /b

:Classify
set "FILE=%~1"
set "EXT=%~2"
set "DEST=Other_Files"

REM Images
for %%E in (.jpg .jpeg .png .gif .bmp .webp .svg .tif .tiff .ico .heic .heif .avif) do if /i "%EXT%"=="%%E" set "DEST=Images"

REM Videos
for %%E in (.mp4 .mkv .avi .mov .wmv .flv .webm .m4v .3gp .mpeg .mpg .m4v .mts .m2ts) do if /i "%EXT%"=="%%E" set "DEST=Videos"

REM Audio
for %%E in (.mp3 .wav .aac .flac .ogg .m4a .wma .aiff .opus .mid .midi) do if /i "%EXT%"=="%%E" set "DEST=Audio"

REM Documents and spreadsheets
for %%E in (.pdf .doc .docx .txt .rtf .odt .xls .xlsx .csv .ppt .pptx .md .epub .pages .numbers .key) do if /i "%EXT%"=="%%E" set "DEST=Documents"

REM Design and creative project files
for %%E in (.psd .psb .ai .eps .indd .idml .xd .fig .sketch .afdesign .afphoto .afpub .blend .obj .fbx .stl .glb .gltf .ase .aseprite .xcf .kra .procreate) do if /i "%EXT%"=="%%E" set "DEST=Design_Files"

REM Archives
for %%E in (.zip .rar .7z .tar .gz .bz2 .xz .tgz) do if /i "%EXT%"=="%%E" set "DEST=Archives"

REM Installers
for %%E in (.exe .msi .msix .appx .appxbundle .cab .iso .img .dmg .pkg) do if /i "%EXT%"=="%%E" set "DEST=Installers"

REM Scripts and program files (not installers)
for %%E in (.bat .cmd .ps1 .py .js .ts .jsx .tsx .html .css .json .xml .yml .yaml .sql .java .c .cpp .h .cs .php .sh .jar .dll .sys .bin .apk) do if /i "%EXT%"=="%%E" set "DEST=Programs"

if not exist "%SOURCE%%DEST%\" md "%SOURCE%%DEST%"

REM Do not overwrite files with the same name.
if exist "%SOURCE%%DEST%\%~nx1" (
    echo SKIPPED - duplicate filename: "%~nx1"
    >>"%LOG%" echo SKIPPED - duplicate filename: "%~nx1" ^| Destination: "%DEST%"
    exit /b
)

move /-Y "%FILE%" "%SOURCE%%DEST%\" >nul
if errorlevel 1 (
    echo FAILED: "%~nx1"
    >>"%LOG%" echo FAILED: "%~nx1"
) else (
    echo Moved "%~nx1" ^> %DEST%
    >>"%LOG%" echo Moved "%~nx1" ^> %DEST%
)
exit /b
