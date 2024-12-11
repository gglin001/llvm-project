###############################################################################

rm -rf build/CMakeCache.txt
rm -rf build/CMakeFiles

cmake --preset osx_allen -S$PWD/llvm -B$PWD/build

cmake --build $PWD/build --target all
cmake --build $PWD/build --target install

###############################################################################

# optional
# pushd build
# ln -s install Release
# popd

llvm-config --libs

###############################################################################
