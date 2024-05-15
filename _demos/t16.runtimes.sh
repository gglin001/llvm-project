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

cmake --preset iree_llvm_libc_hdrgen -S$PWD/llvm -B$PWD/build_libc_hdrgen

cmake --build $PWD/build_libc_hdrgen --target libc-hdrgen

###############################################################################

cmake --preset llvm_runtimes -S$PWD/runtimes -B$PWD/build_runtimes

cmake --build $PWD/build_runtimes --target install

###############################################################################
