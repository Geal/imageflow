cmd.exe /c "win_verify_tools.bat"

mkdir build
cd build

REM set CONAN_ARCH=x86
set CONAN_ARCH=x86_64
conan install --scope build_tests=True -o shared=True --build missing -s build_type=Release -s arch=%CONAN_ARCH%  -u ../
conan build ../
cd ..

echo Clearing cached C component
conan remove imageflow/* -f
