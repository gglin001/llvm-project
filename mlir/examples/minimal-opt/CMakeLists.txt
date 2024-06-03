# set_property(GLOBAL PROPERTY GLOBAL_DEPENDS_DEBUG_MODE 1)
get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)

message("dialect_libs raw: ${dialect_libs}")
list(FILTER dialect_libs INCLUDE REGEX ".*Dialect")
list(FILTER dialect_libs EXCLUDE REGEX ".*OpenMP")
list(FILTER dialect_libs EXCLUDE REGEX "MLIRTransformDialectTransforms")
list(FILTER dialect_libs EXCLUDE REGEX "MLIRTransformDialectIRDLExtension")
list(FILTER dialect_libs EXCLUDE REGEX "MLIRTransformDialectUtils")
# list(FILTER dialect_libs EXCLUDE REGEX "MLIRTransformDialect")
message("dialect_libs filtered: ${dialect_libs}")

set(LLVM_LINK_COMPONENTS
  Support
  )


set(LIBS
  MLIRParser
  MLIRSupport
  MLIRIR
  ${dialect_libs}
)

add_mlir_tool(mlir-cat
  mlir-cat.cpp
  PARTIAL_SOURCES_INTENDED

  DEPENDS
  ${LIBS}
  )
target_link_libraries(mlir-cat PRIVATE ${LIBS})
llvm_update_compile_flags(mlir-cat)
mlir_check_all_link_libraries(mlir-cat)

list(APPEND LIBS
  MLIROptLib
  MLIRPass
  ${dialect_libs}
  # MLIRFuncDialect
  # MLIRArithDialect
)
add_mlir_tool(mlir-minimal-opt
  mlir-minimal-opt.cpp
  PARTIAL_SOURCES_INTENDED

  DEPENDS
  ${LIBS}
  )
target_link_libraries(mlir-minimal-opt PRIVATE ${LIBS})
llvm_update_compile_flags(mlir-minimal-opt)
mlir_check_all_link_libraries(mlir-minimal-opt)


list(APPEND LIBS
  MLIROptLib
  MLIRPass
  MLIRTransforms
)
add_mlir_tool(mlir-minimal-opt-canonicalize
  mlir-minimal-opt-canonicalize.cpp
  PARTIAL_SOURCES_INTENDED

  DEPENDS
  ${LIBS}
  )
target_link_libraries(mlir-minimal-opt-canonicalize PRIVATE ${LIBS})
llvm_update_compile_flags(mlir-minimal-opt-canonicalize)
mlir_check_all_link_libraries(mlir-minimal-opt-canonicalize)

