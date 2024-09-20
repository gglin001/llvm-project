###############################################################################

# git sparse-checkout set --no-cone \
#   '/*' \
#   '!/clang/docs' '!/clang/www' '!/llvm/docs' \
#   '!/clang/test' '!/llvm/test' '!/mlir/test'

# or

git sparse-checkout set --no-cone \
  /cmake /compiler-rt /libc /runtimes \
  /llvm '!/llvm/test' '!/llvm/docs' \
  /_demos /.clangd /.vscode /.clang-format /.clang-tidy

# # for more libs
# git sparse-checkout add --no-cone \
#   /libcxx /libcxxabi /libunwind

# git sparse-checkout add --no-cone \
#   /clang '!/clang/test' /lld

###############################################################################

ln -s _demos/t16.cmake_presets/llvm_CMakePresets.json llvm/CMakePresets.json
ln -s _demos/t16.cmake_presets/runtimes_CMakePresets.json runtimes/CMakePresets.json

###############################################################################

cmake --preset iree_llvm_libc_hdrgen -S$PWD/llvm -B$PWD/build_libc_hdrgen

cmake --build $PWD/build_libc_hdrgen --target libc-hdrgen

###############################################################################

# cmake --preset llvm_libc -S$PWD/runtimes -B$PWD/build_libc
cmake --preset llvm_libc_riscv -S$PWD/runtimes -B$PWD/build_libc

cmake --build $PWD/build_libc --target install

###############################################################################
