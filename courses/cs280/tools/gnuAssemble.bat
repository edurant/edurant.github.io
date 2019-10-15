@echo off

REM Filename:	gnuAssemble.bat
REM Author:	chambers@msoe.edu <Scott Chamberlain>
REM Date:	2 Feb. 2006
REM Provides:	A Batch script to assemble the first parameter assembly file to a binary for the 68HC11 set to the assigned x file.

REM Revised 16 Mar. 2006 by durant@msoe.edu <Dr. Durant>: small documentation updates and an echo tweak

SET XPATH=C:\data\msoe\cs280
SET XFILE=fox11w.x

set PATH="c:\usr\m6811-elf\bin";%PATH%

echo on

as -o "%~dpn1.o" "%~dpnx1"
ld -T "%XPATH%\%XFILE%" -o "%~dpn1.elf" "%~dpn1.o"
objcopy -O srec "%~dpn1.elf" "%~dpn1.s19"
objdump -d "%~dpn1.elf" > "%~dpn1.rst"
