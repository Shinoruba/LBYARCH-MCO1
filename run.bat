@echo off
nasm -f win64 asm_rgb.asm -o asm_rgb.o
if %errorlevel% neq 0 (
    echo NASM compilation failed
    pause
    exit /b %errorlevel%
)

gcc -std=c99 -o c_rgb c_rgb.c asm_rgb.o
if %errorlevel% neq 0 (
    echo GCC compilxation failed
    pause
    exit /b %errorlevel%
)

c_rgb.exe
if %errorlevel% neq 0 (
    echo Execution failed
    pause
    exit /b %errorlevel%
)

pause