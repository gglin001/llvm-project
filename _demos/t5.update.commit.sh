# LLVM_SHA="9708d0900311503aa4685d6810d8caf0412e15d7"
# LLVM_SHA="6f1e23b47d428d792866993ed26f4173d479d43d"
LLVM_SHA="08163cd9d82690e808c28515523b5fd0923d7b38"

# git fetch origin $LLVM_SHA
# git fetch shark $LLVM_SHA
git fetch gh $LLVM_SHA

# git checkout -b sync $LLVM_SHA
git branch sync $LLVM_SHA
