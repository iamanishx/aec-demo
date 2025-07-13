@echo off
echo Building Echo Cancellation Demo...

echo.
echo [1/4] Configuring with CMake...
cmake -B build -S . -DCMAKE_TOOLCHAIN_FILE=../vcpkg/scripts/buildsystems/vcpkg.cmake
if %ERRORLEVEL% neq 0 (
    echo ERROR: CMake configuration failed!
    pause
    exit /b 1
)

echo.
echo [2/4] Building project...
cmake --build build --config Release
if %ERRORLEVEL% neq 0 (
    echo ERROR: Build failed!
    pause
    exit /b 1
)

echo.
echo [3/4] Copying required DLLs...
copy "..\vcpkg\installed\x64-windows\bin\*.dll" ".\build\Release\" >nul
if %ERRORLEVEL% neq 0 (
    echo WARNING: Could not copy all DLLs
)

echo.
echo [4/4] Build completed successfully!
echo.
echo Executable location: .\build\Release\aec_demo.exe
echo.
echo To run: cd to this directory and run .\build\Release\aec_demo.exe
echo.
pause
