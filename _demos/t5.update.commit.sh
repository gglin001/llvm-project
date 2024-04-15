# LLVM_SHA="9708d0900311503aa4685d6810d8caf0412e15d7"
LLVM_SHA="6f1e23b47d428d792866993ed26f4173d479d43d"

# git fetch origin $LLVM_SHA
git fetch shark $LLVM_SHA

# git checkout -b sync $LLVM_SHA
git branch sync $LLVM_SHA
