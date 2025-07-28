cmake_minimum_required(VERSION 3.27)
include(ExternalProject)
	
project("Network" NONE)

# Roots
include("roots.cmake")

# Context specific lists
set(CONTEXTS
  "HTTP_Server.Debug+STM32F756ZGTx"
)
list(LENGTH CONTEXTS CONTEXTS_LENGTH)
math(EXPR CONTEXTS_LENGTH "${CONTEXTS_LENGTH}-1")

set(DIRS
  "${CMAKE_CURRENT_SOURCE_DIR}/HTTP_Server.Debug+STM32F756ZGTx"
)

set(OUTPUTS_1
  "${SOLUTION_ROOT}/out/HTTP_Server/STM32F756ZGTx/Debug/HTTP_Server.axf"
)

set(ARGS
  "-DSOLUTION_ROOT=${SOLUTION_ROOT}"
  "-DCMSIS_PACK_ROOT=${CMSIS_PACK_ROOT}"
  "-DCMSIS_COMPILER_ROOT=${CMSIS_COMPILER_ROOT}"
)

# Compilation database
add_custom_target(database)

# Iterate over contexts
foreach(INDEX RANGE ${CONTEXTS_LENGTH})

  math(EXPR N "${INDEX}+1")
  list(GET CONTEXTS ${INDEX} CONTEXT)
  list(GET DIRS ${INDEX} DIR)

  # Create external project, set configure and build steps
  ExternalProject_Add(${CONTEXT}
    PREFIX                ${DIR}
    SOURCE_DIR            ${DIR}
    BINARY_DIR            ${N}
    INSTALL_COMMAND       ""
    TEST_COMMAND          ""
    CONFIGURE_COMMAND     ${CMAKE_COMMAND} -G Ninja -S <SOURCE_DIR> -B <BINARY_DIR> ${ARGS} 
    BUILD_COMMAND         ${CMAKE_COMMAND} -E echo "Building CMake target '${CONTEXT}'"
    COMMAND               ${CMAKE_COMMAND} --build <BINARY_DIR>
    BUILD_ALWAYS          TRUE
    BUILD_BYPRODUCTS      ${OUTPUTS_${N}}
    LOG_CONFIGURE         ON
    LOG_OUTPUT_ON_FAILURE ON
    USES_TERMINAL_BUILD   ON
  )

  # Executes command step
  ExternalProject_Add_Step(${CONTEXT} executes
    DEPENDEES         build
  )

  ExternalProject_Add_StepTargets(${CONTEXT} build configure executes)

  # Debug
  message(VERBOSE "Configure Context: ${CMAKE_COMMAND} -G Ninja -S ${DIR} -B ${N}")

  # Database generation step
  ExternalProject_Add_Step(${CONTEXT} database
    COMMAND           ${CMAKE_COMMAND} --build <BINARY_DIR> --target database
    ALWAYS            TRUE
    LOG               TRUE
    USES_TERMINAL     ON
    DEPENDEES         configure
  )
  ExternalProject_Add_StepTargets(${CONTEXT} database)
  add_dependencies(database ${CONTEXT}-database)

endforeach()

# Execute: HTTP_Server.Debug+STM32F756ZGTx-Run_FCARM
set(INPUT
  ${SOLUTION_ROOT}/HTTP_Server/FCARM
  ${SOLUTION_ROOT}/HTTP_Server/Web
)
list(GET INPUT 0 INPUT_0)
list(GET INPUT 1 INPUT_1)
set(OUTPUT
  ${SOLUTION_ROOT}/HTTP_Server/Web.c
)
add_custom_target(HTTP_Server.Debug+STM32F756ZGTx-Run_FCARM ALL
  COMMAND ${CMAKE_COMMAND} -E echo "Executing: HTTP_Server.Debug+STM32F756ZGTx-Run_FCARM"
  COMMAND ${CMAKE_COMMAND} -G Ninja -S "${INPUT_0}" -B ${CMAKE_BINARY_DIR}/FCARM/HTTP_Server.Debug+STM32F756ZGTx -DINPUT_DIRECTORY="${INPUT_1}" -DOUTPUT="${OUTPUT}" && ${CMAKE_COMMAND} --build ${CMAKE_BINARY_DIR}/FCARM/HTTP_Server.Debug+STM32F756ZGTx -- --quiet
  BYPRODUCTS ${OUTPUT}
)

# Build dependencies
add_dependencies(HTTP_Server.Debug+STM32F756ZGTx-build
  HTTP_Server.Debug+STM32F756ZGTx-Run_FCARM
)
