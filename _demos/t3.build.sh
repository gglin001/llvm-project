# pushd llvm
# ln -s ../CMakePresets.json .
# ln -s ../CMakeUserPresets.json .
# popd

# building with cmake-tools in vscode

# or
# cmake --preset iree_llvm -S$PWD/llvm -B$PWD/build
cmake --preset iree_llvm_allen -S$PWD/llvm -B$PWD/build
cmake --build $PWD/build --target all
cmake --build $PWD/build --target install

###############################################################################

pushd build
ln -s install Release
popd

llvm-config --libs

###############################################################################
