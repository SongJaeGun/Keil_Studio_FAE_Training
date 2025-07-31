# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "E:/sjg/ARM/FAE_Test/all_file/Keil_Studio_FAE_Training/MLApp/Tensorflow_LiteRT_HelloWorld/tmp/TFLiteRT_HelloWorld.Debug+STM32F756ZGTx")
  file(MAKE_DIRECTORY "E:/sjg/ARM/FAE_Test/all_file/Keil_Studio_FAE_Training/MLApp/Tensorflow_LiteRT_HelloWorld/tmp/TFLiteRT_HelloWorld.Debug+STM32F756ZGTx")
endif()
file(MAKE_DIRECTORY
  "E:/sjg/ARM/FAE_Test/all_file/Keil_Studio_FAE_Training/MLApp/Tensorflow_LiteRT_HelloWorld/tmp/1"
  "E:/sjg/ARM/FAE_Test/all_file/Keil_Studio_FAE_Training/MLApp/Tensorflow_LiteRT_HelloWorld/tmp/TFLiteRT_HelloWorld.Debug+STM32F756ZGTx"
  "E:/sjg/ARM/FAE_Test/all_file/Keil_Studio_FAE_Training/MLApp/Tensorflow_LiteRT_HelloWorld/tmp/TFLiteRT_HelloWorld.Debug+STM32F756ZGTx/tmp"
  "E:/sjg/ARM/FAE_Test/all_file/Keil_Studio_FAE_Training/MLApp/Tensorflow_LiteRT_HelloWorld/tmp/TFLiteRT_HelloWorld.Debug+STM32F756ZGTx/src/TFLiteRT_HelloWorld.Debug+STM32F756ZGTx-stamp"
  "E:/sjg/ARM/FAE_Test/all_file/Keil_Studio_FAE_Training/MLApp/Tensorflow_LiteRT_HelloWorld/tmp/TFLiteRT_HelloWorld.Debug+STM32F756ZGTx/src"
  "E:/sjg/ARM/FAE_Test/all_file/Keil_Studio_FAE_Training/MLApp/Tensorflow_LiteRT_HelloWorld/tmp/TFLiteRT_HelloWorld.Debug+STM32F756ZGTx/src/TFLiteRT_HelloWorld.Debug+STM32F756ZGTx-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "E:/sjg/ARM/FAE_Test/all_file/Keil_Studio_FAE_Training/MLApp/Tensorflow_LiteRT_HelloWorld/tmp/TFLiteRT_HelloWorld.Debug+STM32F756ZGTx/src/TFLiteRT_HelloWorld.Debug+STM32F756ZGTx-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "E:/sjg/ARM/FAE_Test/all_file/Keil_Studio_FAE_Training/MLApp/Tensorflow_LiteRT_HelloWorld/tmp/TFLiteRT_HelloWorld.Debug+STM32F756ZGTx/src/TFLiteRT_HelloWorld.Debug+STM32F756ZGTx-stamp${cfgdir}") # cfgdir has leading slash
endif()
