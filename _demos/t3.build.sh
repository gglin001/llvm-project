pushd llvm
ln -s ../CMakePresets.json .
ln -s ../CMakeUserPresets.json .
popd

# cmake --preset iree_llvm -S$PWD/llvm -B$PWD/build

cmake --preset iree_llvm_allen -S$PWD/llvm -B$PWD/build

cmake --build $PWD/build --target all
