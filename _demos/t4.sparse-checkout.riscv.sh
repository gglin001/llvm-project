# git clone -n --depth=1 --filter=tree:0 -b main git@github.com:llvm/llvm-project.git
git clone -n --depth=1 --filter=tree:0 -b allen/develop git@github.com:gglin001/llvm-project.git

pushd llvm-project

git sparse-checkout set --no-cone \
  /cmake /llvm /mlir /lld \
  '!/llvm/test' '!/llvm/unittests' '!/llvm/docs' \
  '!/mlir/test' '!/mlir/unittests' '!/mlir/docs' \
  /_demos /.vscode '/*.*'

git sparse-checkout add --no-cone \
  '!/llvm/utils/gn' \
  '!/llvm/lib/Target' '/llvm/lib/Target/*.*' \
  '/llvm/lib/Target/RISCV' '/llvm/lib/Target/ARM' '/llvm/lib/Target/AArch64'

# git sparse-checkout set --no-cone /cmake /llvm /mlir
git sparse-checkout list
git checkout

popd
