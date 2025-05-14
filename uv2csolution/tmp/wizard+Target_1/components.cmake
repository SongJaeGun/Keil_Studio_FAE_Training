# components.cmake

# component ARM::CMSIS:CORE@6.1.0
add_library(ARM_CMSIS_CORE_6_1_0 INTERFACE)
target_include_directories(ARM_CMSIS_CORE_6_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/ARM/CMSIS/6.1.0/CMSIS/Core/Include
)
target_compile_definitions(ARM_CMSIS_CORE_6_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(ARM_CMSIS_CORE_6_1_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Device:Startup@1.2.5
add_library(Keil_Device_Startup_1_2_5 OBJECT
  "${SOLUTION_ROOT}/RTE/Device/STM32F756ZGTx/startup_stm32f756xx.s"
  "${SOLUTION_ROOT}/RTE/Device/STM32F756ZGTx/system_stm32f7xx.c"
)
target_include_directories(Keil_Device_Startup_1_2_5 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/Keil/STM32F7xx_DFP/2.16.0/Drivers/CMSIS/Device/ST/STM32F7xx/Include
)
target_compile_definitions(Keil_Device_Startup_1_2_5 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_Device_Startup_1_2_5 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
  $<$<COMPILE_LANGUAGE:ASM>:
    "SHELL:-masm=auto"
  >
)
target_link_libraries(Keil_Device_Startup_1_2_5 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)
set(COMPILE_DEFINITIONS
  __MICROLIB
  STM32F756xx
  _RTE_
)
cbuild_set_defines(AS_ARM COMPILE_DEFINITIONS)
set_source_files_properties("${CMSIS_PACK_ROOT}/Keil/STM32F7xx_DFP/2.16.0/MDK/Device/Source/ARM/STM32F74x_75x_OPT.s" PROPERTIES
  COMPILE_FLAGS "${COMPILE_DEFINITIONS}"
)
set(COMPILE_DEFINITIONS
  __MICROLIB
  STM32F756xx
  _RTE_
)
cbuild_set_defines(AS_ARM COMPILE_DEFINITIONS)
set_source_files_properties("${CMSIS_PACK_ROOT}/Keil/STM32F7xx_DFP/2.16.0/MDK/Device/Source/ARM/STM32F74x_75x_OTP.s" PROPERTIES
  COMPILE_FLAGS "${COMPILE_DEFINITIONS}"
)
set(COMPILE_DEFINITIONS
  __MICROLIB
  STM32F756xx
  _RTE_
)
cbuild_set_defines(AS_ARM COMPILE_DEFINITIONS)
set_source_files_properties("${SOLUTION_ROOT}/RTE/Device/STM32F756ZGTx/startup_stm32f756xx.s" PROPERTIES
  COMPILE_FLAGS "${COMPILE_DEFINITIONS}"
)
