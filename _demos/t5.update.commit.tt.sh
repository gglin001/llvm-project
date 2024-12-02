LLVM_SHA="86b69c31642e98f8357df62c09d118ad1da4e16a"

# git fetch origin $LLVM_SHA
# git fetch shark $LLVM_SHA
git fetch gh $LLVM_SHA

# git checkout -b sync $LLVM_SHA
git branch sync $LLVM_SHA
