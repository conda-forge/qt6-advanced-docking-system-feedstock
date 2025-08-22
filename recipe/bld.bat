mkdir build
cd build

cmake -LAH -G"NMake Makefiles"                               ^
    %CMAKE_ARGS%                                             ^
    -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%"                   ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%"                ^
    -DCMAKE_BUILD_TYPE=Release                               ^
    -DBUILD_STATIC=OFF                                       ^
    -DBUILD_EXAMPLES=OFF                                     ^
    -DADS_VERSION=%PKG_VERSION%                              ^
    ..
if errorlevel 1 exit 1

cmake --build . --target install
if errorlevel 1 exit 1 

rmdir /S /Q %LIBRARY_PREFIX%\share\ads\license
if errorlevel 1 exit 1 
