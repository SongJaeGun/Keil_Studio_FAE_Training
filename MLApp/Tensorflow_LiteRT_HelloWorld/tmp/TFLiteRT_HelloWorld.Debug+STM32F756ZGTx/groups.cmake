# groups.cmake

# group Example Source
add_library(Group_Example_Source OBJECT
  "${SOLUTION_ROOT}/Source/hello_world_test.cpp"
)
target_include_directories(Group_Example_Source PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_Example_Source PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_Example_Source_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_Example_Source_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_Example_Source PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_Example_Source PUBLIC
  Group_Example_Source_ABSTRACTIONS
)

# group Board
add_library(Group_Board OBJECT
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/retarget_stdio.c"
)
target_include_directories(Group_Board PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG"
)
target_compile_definitions(Group_Board PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_Board_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_Board_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_Board PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_Board PUBLIC
  Group_Board_ABSTRACTIONS
)

# group CubeMX
add_library(Group_CubeMX OBJECT
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/MDK-ARM/startup_stm32f756xx.s"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Src/main.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Src/stm32f7xx_it.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Src/stm32f7xx_hal_msp.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Src/stm32f7xx_hal_timebase_tim.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Src/system_stm32f7xx.c"
)
target_include_directories(Group_CubeMX PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_CubeMX PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_CubeMX_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_CubeMX_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_CubeMX PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_CubeMX PUBLIC
  Group_CubeMX_ABSTRACTIONS
)
set(COMPILE_DEFINITIONS
  STM32F756xx
  _RTE_
)
cbuild_set_defines(AS_ARM COMPILE_DEFINITIONS)
set_source_files_properties("${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/MDK-ARM/startup_stm32f756xx.s" PROPERTIES
  COMPILE_FLAGS "${COMPILE_DEFINITIONS}"
)

# group STM32 HAL Driver
add_library(Group_STM32_HAL_Driver OBJECT
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_cortex.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_rcc.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_rcc_ex.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_flash.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_flash_ex.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_gpio.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dma.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dma_ex.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_pwr.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_pwr_ex.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_i2c.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_i2c_ex.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_exti.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_eth.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_tim.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_tim_ex.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_uart.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_uart_ex.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_pcd.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_pcd_ex.c"
  "${SOLUTION_ROOT}/Board/NUCLEO-F756ZG/CubeMX/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_usb.c"
)
target_include_directories(Group_STM32_HAL_Driver PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_STM32_HAL_Driver PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_STM32_HAL_Driver_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_STM32_HAL_Driver_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_STM32_HAL_Driver PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_STM32_HAL_Driver PUBLIC
  Group_STM32_HAL_Driver_ABSTRACTIONS
)

# group Model
add_library(Group_Model OBJECT
  "${SOLUTION_ROOT}/Model/model_int8.c"
  "${SOLUTION_ROOT}/Model/model_float.c"
)
target_include_directories(Group_Model PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_Model PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_Model_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_Model_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_Model PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_Model PUBLIC
  Group_Model_ABSTRACTIONS
)
