# File Organizer for Windows

A lightweight Windows Batch Script (`.bat`) that automatically sorts files into folders based on their file extensions. Keep your Downloads folder tidy without manually moving every file.

## Features

- Automatically sorts files by extension.
- Creates category folders if they do not already exist.
- Supports images, videos, audio, documents, design files, archives, installers, programs, and other files.
- Skips files when a file with the same name already exists in the destination folder.
- Writes move results and errors to `FileOrganizer_Log.txt`.
- Requires no additional software.

## Categories

| Folder | Examples |
| --- | --- |
| `Images` | JPG, JPEG, PNG, GIF, BMP, WEBP, SVG, HEIC |
| `Videos` | MP4, MKV, AVI, MOV, WMV, WEBM, M4V |
| `Audio` | MP3, WAV, AAC, FLAC, OGG, M4A |
| `Documents` | PDF, DOCX, TXT, XLSX, PPTX, CSV, Markdown |
| `Design_Files` | PSD, PSB, AI, EPS, INDD, FIG, BLEND, XCF |
| `Archives` | ZIP, RAR, 7Z, TAR, GZ |
| `Installers` | EXE, MSI, MSIX, ISO, IMG, APK packages may be categorized as programs |
| `Programs` | BAT, CMD, PS1, PY, JS, HTML, CSS, JSON, source and program files |
| `Other_Files` | File types not recognized by the script |

The exact destination depends on the file extensions listed in the batch script.

## How to Use

1. Download or copy `FileOrganizer_Fixed.bat`.
2. Place it in the folder you want to organize (for example, your `Downloads` folder).
3. Double-click the `.bat` file.
4. Let the script finish, then review the new category folders.
5. Check `FileOrganizer_Log.txt` if you want to review moved, skipped, or failed files.

## Important Notes

- The script organizes files in the folder where it is placed; it does **not** scan existing subfolders.
- Files are **moved**, not copied.
- If the destination folder already contains a file with the same name, the script skips that file rather than overwriting it.
- Review the categories and back up important files before running the script.
- Only run batch scripts you understand and trust.

## Project File

- `FileOrganizer_Fixed.bat` — the Windows batch script that organizes files.

## Developer
Genie James Arsenal
