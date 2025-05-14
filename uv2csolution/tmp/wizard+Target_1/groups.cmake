# groups.cmake

# group Application
add_library(Group_Application OBJECT
  "${SOLUTION_ROOT}/main.c"
  "${SOLUTION_ROOT}/hal.c"
)
target_include_directories(Group_Application PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${SOLUTION_ROOT}/.
)
target_compile_definitions(Group_Application PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_Application_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_Application_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_Application PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_Application PUBLIC
  Group_Application_ABSTRACTIONS
)

# group Mongoose
add_library(Group_Mongoose OBJECT
  "${SOLUTION_ROOT}/mongoose/mongoose_impl.c"
  "${SOLUTION_ROOT}/mongoose/mongoose_fs.c"
  "${SOLUTION_ROOT}/mongoose/mongoose_glue.c"
  "${SOLUTION_ROOT}/mongoose/mongoose.c"
)
target_include_directories(Group_Mongoose PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${SOLUTION_ROOT}/mongoose
)
target_compile_definitions(Group_Mongoose PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_Mongoose_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_Mongoose_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_Mongoose PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_Mongoose PUBLIC
  Group_Mongoose_ABSTRACTIONS
)
