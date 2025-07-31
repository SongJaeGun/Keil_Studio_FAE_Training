cmake_minimum_required(VERSION 3.27)

# Roots
include("../roots.cmake")

set(CONTEXT TFLiteRT_HelloWorld.Debug+STM32F756ZGTx)
set(TARGET ${CONTEXT})
set(OUT_DIR "${SOLUTION_ROOT}/out/TFLiteRT_HelloWorld/STM32F756ZGTx/Debug")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(HEX_FILE "TFLiteRT_HelloWorld.hex")
set(LD_SCRIPT "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/RTE/Device/STM32F756ZGTx/ac6_linker_script.sct.src")
set(LD_REGIONS "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/RTE/Device/STM32F756ZGTx/regions_NUCLEO-F756ZG.h")
set(LD_SCRIPT_PP "${CMAKE_CURRENT_BINARY_DIR}/ac6_linker_script.sct")

# Processor Options
set(CPU Cortex-M7)
set(FPU SP_FPU)
set(BYTE_ORDER Little-endian)

# Toolchain config map
include("toolchain.cmake")

# Setup project
project(${CONTEXT} LANGUAGES CXX C ASM)

# Compilation database
add_custom_target(database
  COMMAND ${CMAKE_COMMAND} -E make_directory "${OUT_DIR}"
  COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json" "${OUT_DIR}"
)
set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})
set(CMAKE_C_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES})

# Setup context
add_executable(${CONTEXT})
set_target_properties(${CONTEXT} PROPERTIES PREFIX "" SUFFIX ".axf" OUTPUT_NAME "TFLiteRT_HelloWorld")
set_target_properties(${CONTEXT} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${OUT_DIR})
add_library(${CONTEXT}_GLOBAL INTERFACE)

# Includes
target_include_directories(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:C,CXX>:
    "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Inc"
    "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Inc/Legacy"
    "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/CMSIS/Device/ST/STM32F7xx/Include"
    "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Inc"
    "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/MX_Device"
  >
  "${SOLUTION_ROOT}/RTE/_Debug_STM32F756ZGTx"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Compiler/2.1.0/include"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-DSP/1.16.2/Include"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-DSP/1.16.2/PrivateInclude"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Driver_STM32/1.2.0/Drivers"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-NN/7.0.0/Include"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.2.0/CMSIS/Core/Include"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.2.0/CMSIS/Driver/Include"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.2.0/CMSIS/Driver/VIO/Include"
  "${CMSIS_PACK_ROOT}/tensorflow/flatbuffers/1.25.2/src/include"
  "${CMSIS_PACK_ROOT}/tensorflow/gemmlowp/1.25.2/src"
  "${CMSIS_PACK_ROOT}/tensorflow/kissfft/1.25.2/src"
  "${CMSIS_PACK_ROOT}/tensorflow/kissfft/1.25.2/src/tools"
  "${CMSIS_PACK_ROOT}/tensorflow/ruy/1.25.2/src"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/compiler/mlir/lite/core/api"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/compiler/mlir/lite/core/c"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/compiler/mlir/lite/kernels/internal"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/compiler/mlir/lite/schema"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/lite"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/lite/c"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/lite/core"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/lite/core/api"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/lite/core/c"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/lite/kernels"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/lite/kernels/internal"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/lite/kernels/internal/optimized"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/lite/kernels/internal/reference"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/lite/kernels/internal/reference/integer_ops"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/lite/micro"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/lite/micro/arena_allocator"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/lite/micro/cortex_m_generic"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/lite/micro/kernels"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/lite/micro/memory_planner"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/lite/micro/testing"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/lite/micro/tflite_bridge"
  "${CMSIS_PACK_ROOT}/tensorflow/tensorflow-lite-micro/1.25.2/tensorflow/lite/schema"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG"
)

# Defines
target_compile_definitions(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:C,CXX>:
    CMSIS_target_header=\"NUCLEO-F756ZG.h\"
    TF_LITE_STATIC_MEMORY=1
    USE_HAL_DRIVER
    STM32F756xx
    STM32F756xx
    _RTE_
  >
)

# Compile options
target_compile_options(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:ASM>:
    "SHELL:${ASM_CPU}"
    "SHELL:${ASM_FLAGS}"
    "SHELL:${ASM_BYTE_ORDER}"
    "SHELL:-gdwarf-5"
    "SHELL:-masm=auto"
  >
  $<$<COMPILE_LANGUAGE:C>:
    "SHELL:${CC_CPU}"
    "SHELL:${CC_FLAGS}"
    "SHELL:${CC_BYTE_ORDER}"
    "SHELL:-gdwarf-5"
    "SHELL:-std=gnu11"
    "SHELL:-Wno-macro-redefined"
    "SHELL:-Wno-pragma-pack"
    "SHELL:-Wno-parentheses-equality"
    "SHELL:-Wno-license-management"
  >
  $<$<COMPILE_LANGUAGE:C,CXX>:
    "SHELL:${_PI}\"${SOLUTION_ROOT}/RTE/_Debug_STM32F756ZGTx/Pre_Include_Global.h\""
  >
  $<$<COMPILE_LANGUAGE:CXX>:
    "SHELL:${CXX_CPU}"
    "SHELL:${CXX_FLAGS}"
    "SHELL:${CXX_BYTE_ORDER}"
    "SHELL:-gdwarf-5"
    "SHELL:-std=c++17"
    "SHELL:-fno-exceptions"
    "SHELL:-fno-rtti"
    "SHELL:-ffp-mode=full"
    "SHELL:-Wno-macro-redefined"
    "SHELL:-Wno-pragma-pack"
    "SHELL:-Wno-parentheses-equality"
    "SHELL:-Wno-license-management"
  >
)

# Compile Options Abstractions
add_library(${CONTEXT}_ABSTRACTIONS INTERFACE)
cbuild_set_options_flags(CXX "debug" "on" "" "" CXX_OPTIONS_FLAGS_${CONTEXT})
cbuild_set_options_flags(CC "debug" "on" "" "" CC_OPTIONS_FLAGS_${CONTEXT})
cbuild_set_options_flags(ASM "debug" "on" "" "" ASM_OPTIONS_FLAGS_${CONTEXT})
target_compile_options(${CONTEXT}_ABSTRACTIONS INTERFACE
  $<$<COMPILE_LANGUAGE:CXX>:
    "SHELL:${CXX_OPTIONS_FLAGS_${CONTEXT}}"
  >
  $<$<COMPILE_LANGUAGE:C>:
    "SHELL:${CC_OPTIONS_FLAGS_${CONTEXT}}"
  >
  $<$<COMPILE_LANGUAGE:ASM>:
    "SHELL:${ASM_OPTIONS_FLAGS_${CONTEXT}}"
  >
)

# Add groups and components
include("groups.cmake")
include("components.cmake")

target_link_libraries(${CONTEXT} PUBLIC
  Group_Example_Source
  Group_Board
  Group_CubeMX
  Group_STM32_HAL_Driver
  Group_Model
  ARM_CMSIS-Compiler_CORE_1_1_0
  ARM_CMSIS-Compiler_STDERR_Custom_1_1_0
  ARM_CMSIS-Compiler_STDIN_Custom_1_1_0
  ARM_CMSIS-Compiler_STDOUT_Custom_1_1_0
  ARM_CMSIS_CORE_6_1_1
  ARM_CMSIS_DSP_Source_1_17_0
  ARM_CMSIS_NN_Lib_0_0_0
  Keil_CMSIS_Driver_Ethernet_MAC_3_1_0
  Keil_CMSIS_Driver_Ethernet_PHY_LAN8742A_1_3_0
  Keil_CMSIS_Driver_GPIO_1_2_0
  Keil_CMSIS_Driver_I2C_3_0_0
  Keil_CMSIS_Driver_USART_3_0_0
  Keil_CMSIS_Driver_USB_Device_3_1_0
  Keil_CMSIS_Driver_VIO_Board_1_0_1
  Keil_Device_CubeMX_1_0_0
  tensorflow_Data_Exchange_Serialization_flatbuffers_tensorflow_1_25_2
  tensorflow_Data_Processing_Math_gemmlowp_fixed-point_tensorflow_1_25_2
  tensorflow_Data_Processing_Math_kissfft_tensorflow_1_25_2
  tensorflow_Data_Processing_Math_ruy_tensorflow_1_25_2
  tensorflow_Machine_Learning_TensorFlow_Kernel_Utils_1_25_2
  tensorflow_Machine_Learning_TensorFlow_Kernel_CMSIS-NN_1_25_2
  tensorflow_Machine_Learning_TensorFlow_Testing_1_25_2
)

# Linker options
target_link_options(${CONTEXT} PUBLIC
  "SHELL:${LD_CPU}"
  "SHELL:${_LS}\"${LD_SCRIPT_PP}\""
  "SHELL:--entry=Reset_Handler"
  "SHELL:--map"
  "SHELL:--info summarysizes"
  "SHELL:--summary_stderr"
  "SHELL:--diag_suppress=L6314W"
)
set_target_properties(${CONTEXT} PROPERTIES LINK_DEPENDS ${LD_SCRIPT})

# Linker script pre-processing
add_custom_command(TARGET ${CONTEXT} PRE_LINK COMMAND ${CPP} ARGS ${CPP_ARGS_LD_SCRIPT} BYPRODUCTS ${LD_SCRIPT_PP})

# Hex Conversion
 add_custom_command(TARGET ${CONTEXT} POST_BUILD COMMAND ${CMAKE_OBJCOPY} ${ELF2HEX})
