# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /opt/local/src/nrf52/nrf52-freertos-helloworld/app/helloworld

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /opt/local/src/nrf52/nrf52-freertos-helloworld/app/helloworld/build

# Utility rule file for softdevice-bin.

# Include the progress variables for this target.
include CMakeFiles/softdevice-bin.dir/progress.make

CMakeFiles/softdevice-bin:
	arm-none-eabi-objcopy -I ihex -O binary /opt/local/src/nrf52/sdk/nRF5_SDK_12.3.0_d7731ad/components/softdevice/s132/hex/s132_nrf52_3.0.0_softdevice.hex s132_nrf52_3.0.0_softdevice.bin

softdevice-bin: CMakeFiles/softdevice-bin
softdevice-bin: CMakeFiles/softdevice-bin.dir/build.make

.PHONY : softdevice-bin

# Rule to build all files generated by this target.
CMakeFiles/softdevice-bin.dir/build: softdevice-bin

.PHONY : CMakeFiles/softdevice-bin.dir/build

CMakeFiles/softdevice-bin.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/softdevice-bin.dir/cmake_clean.cmake
.PHONY : CMakeFiles/softdevice-bin.dir/clean

CMakeFiles/softdevice-bin.dir/depend:
	cd /opt/local/src/nrf52/nrf52-freertos-helloworld/app/helloworld/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /opt/local/src/nrf52/nrf52-freertos-helloworld/app/helloworld /opt/local/src/nrf52/nrf52-freertos-helloworld/app/helloworld /opt/local/src/nrf52/nrf52-freertos-helloworld/app/helloworld/build /opt/local/src/nrf52/nrf52-freertos-helloworld/app/helloworld/build /opt/local/src/nrf52/nrf52-freertos-helloworld/app/helloworld/build/CMakeFiles/softdevice-bin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/softdevice-bin.dir/depend
