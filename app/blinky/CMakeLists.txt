cmake_minimum_required (VERSION 2.8)

set(REP_ROOT /opt/local/src/nrf52/nrf52-freertos-helloworld) # EDIT


list (APPEND CMAKE_MODULE_PATH
  "${REP_ROOT}/cmake"
  "${REP_ROOT}/cmake/modules"
  "${REP_ROOT}/cmake/platforms")


set(SDK_ROOT /opt/local/src/nrf52/sdk/nRF5_SDK_12.3.0_d7731ad) # EDIT

set(NRF_COMPONENTS_DIR ${SDK_ROOT}/components) # SETUP
set(FREERTOS_DIR ${SDK_ROOT}/external/freertos) # SETUP
set(NRF_COMPONENTS_CMAKE_DIR ${REP_ROOT}/cmake/nrf52lib/components) # DONT EDIT

set(TARGET freertosnrf52)  # EDIT

set(CMAKE_PROJECT_NAME ${TARGET}) # DONT EDIT
set(PROJECT_DIR ${REP_ROOT}/app/blinky) # EDIT
#set(PROJECT_DIR /opt/local/src/nrf52/nrf52-freertos-helloworld) # EDIT

set(LINKER_SCRIPT ../pca10040/blank/armgcc/blinky_gcc_nrf52.ld)

project ($(TARGET) C ASM) # DONT EDIT

include (CheckIncludeFiles) # DONT EDIT
include (CheckCSourceCompiles) # DONT EDIT
include (collect) # DONT EDIT
include (options) # DONT EDIT
include (depends) # DONT EDIT

foreach(_inc_path ${CMAKE_INCLUDE_PATH})
  collect (PROJECT_INC_DIRS "${_inc_path}")
endforeach()

enable_testing ()




# source file
add_executable(nrf52
  # startup
  ${NRF_COMPONENTS_DIR}/toolchain/gcc/gcc_startup_nrf52.S

  # nrf52 port

  # driver
  ${NRF_COMPONENTS_DIR}/drivers_nrf/clock/nrf_drv_clock.c
  ${NRF_COMPONENTS_DIR}/drivers_nrf/common/nrf_drv_common.c
  
  # platform
  ${NRF_COMPONENTS_DIR}/libraries/util/app_error.c
  ${NRF_COMPONENTS_DIR}/libraries/util/nrf_assert.c
  ${NRF_COMPONENTS_DIR}/libraries/util/app_error_weak.c
  ${NRF_COMPONENTS_DIR}/libraries/util/sdk_errors.c
  ${NRF_COMPONENTS_DIR}/libraries/util/app_util_platform.c
  ${NRF_COMPONENTS_DIR}/libraries/util/sdk_mapped_flags.c

  ${NRF_COMPONENTS_DIR}/boards/boards.c

  ${NRF_COMPONENTS_DIR}/toolchain/system_nrf52.c
  
  # app
  ${PROJECT_DIR}/main.c
  )

# device selection in nrf52.h

# Set device
if(NOT DEVICE)
  set(DEVICE NRF52832)
  set(DEVICEFAMILY NRF52)      
  set(BOARD BOARD_PCA10040)
  set(SOFTDEVICE S132)
  set(SOFTDEVICE_VERSION "3.0.0") # s132_nrf52_3.0.0_softdevice.hex
  set(NRF_SD_BLE_API_VERSION 3)
endif()


add_definitions(-D${DEVICEFAMILY} -D${DEVICE} -D_LITTLE_ENDIAN=1 -DNDEBUG -D__HEAP_SIZE=0 -DNRF_SD_BLE_API_VERSION=${NRF_SD_BLE_API_VERSION})




#set(CMAKE_C_FLAGS "-mcpu=cortex-m4 -mthumb -mfloat-abi=softfp -ffunction-sections -fdata-sections -fno-builtin -g -std=c99 -T ${LDSCRIPT} -L ${LDSCRIPTDIR}")

# EDIT

# include directories
# freertos

# nrf52
include_directories(${NRF_COMPONENTS_DIR}/libraries/util)
include_directories(${NRF_COMPONENTS_DIR}/libraries/timer)
include_directories(${NRF_COMPONENTS_DIR}/libraries/scheduler)

include_directories(${NRF_COMPONENTS_DIR}/device)  # nrf.h
include_directories(${NRF_COMPONENTS_DIR}/softdevice/s132/headers)  # s132
include_directories(${FREERTOS_DIR}/portable/GCC/nrf52) # nrf52
include_directories(${FREERTOS_DIR}/portable/CMSIS/nrf52) # nrf52
include_directories(${NRF_COMPONENTS_DIR}/toolchain/cmsis/include)  # CM4
include_directories(${NRF_COMPONENTS_DIR}/toolchain) # system nrf52

# peripheral
include_directories(${NRF_COMPONENTS_DIR}/drivers_nrf/hal) # nrf_rtc.h
include_directories(${NRF_COMPONENTS_DIR}/drivers_nrf/clock) # nrf_drv_clock.h
include_directories(${NRF_COMPONENTS_DIR}/drivers_nrf/common) # nrf_drv_clock.h

# log
include_directories(${NRF_COMPONENTS_DIR}/libraries/log)
include_directories(${NRF_COMPONENTS_DIR}/libraries/log/src)

# app
include_directories(${PROJECT_DIR})
#include_directories(${PROJECT_DIR}/app/blinky_freertos/pca10040/blank/config) # sdk_config.h
#include_directories(${PROJECT_DIR}/app/blinky_freertos/config/blinky_FreeRTOS_pca10040) # FreeRTOSConfig.h



# nRF components enabled here
# Check out the related component folders for options

# set(DRIVERS_NRF hal common delay config gpiote trace pstorage timer ble_flash uart clock)
# set(LIBRARIES log util trace timer scheduler button uart fifo fstorage experimental_section_vars)
# set(BLE_MODULES ble_advertising)
# set(BLE_SERVICES ble_nus)

set(DRIVERS_NRF common timer delay)
set(LIBRARIES util)
set(NRFCOMPONENTS boards)
set(BLE_MODULES ble_advertising)
set(BLE_SERVICES ble_nus)

include(${REP_ROOT}/cmake/nrf52lib/nrf52lib.cmake)

##### Outputs #####

##### Post build #####

# Add post build commands
#include(cmake/nrf52lib/post-build.cmake)

# Add JLink commands
#include(cmake/nrf52lib/jlink.cmake)
