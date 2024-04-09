# git clone -n --depth=1 --filter=tree:0 -b main git@github.com:llvm/llvm-project.git
git clone -n --depth=1 --filter=tree:0 -b allen/develop git@github.com:gglin001/llvm-project.git

pushd llvm-project
git sparse-checkout set --no-cone \
  /clang /cmake /libunwind /lld /llvm /mlir /CMakePresets.json \
  /_demos /clang-tools-extra

# git sparse-checkout set --no-cone /cmake /llvm /mlir
git sparse-checkout list
git checkout
popd
