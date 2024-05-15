# git sparse-checkout set --no-cone \
#   '/*' \
#   '!/clang/docs' '!/clang/www' '!/llvm/docs' \
#   '!/clang/test' '!/llvm/test' '!/mlir/test'

git sparse-checkout set --no-cone \
  /cmake /compiler-rt /libc /runtimes /llvm/cmake \
  /_demos /.clangd /.vscode /.clang-format /.clang-tidy

# for more libs
git sparse-checkout add --no-cone \
  /libcxx /libcxxabi /libunwind

###############################################################################

# cmake --preset llvm_runtimes -S$PWD/runtimes -B$PWD/build_runtimes
cmake --preset llvm_runtimes_allen -S$PWD/runtimes -B$PWD/build_runtimes

cmake --build $PWD/build_runtimes --target all
cmake --build $PWD/build_runtimes --target install

###############################################################################
