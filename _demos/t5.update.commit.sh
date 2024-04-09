LLVM_SHA="9708d0900311503aa4685d6810d8caf0412e15d7"

# git fetch origin $LLVM_SHA
git fetch shark $LLVM_SHA

git checkout -b sync $LLVM_SHA
