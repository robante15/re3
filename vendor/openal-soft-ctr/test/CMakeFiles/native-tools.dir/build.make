# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

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
CMAKE_SOURCE_DIR = /home/aaron/re3/vendor/openal-soft-ctr

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/aaron/re3/vendor/openal-soft-ctr/test

# Utility rule file for native-tools.

# Include the progress variables for this target.
include CMakeFiles/native-tools.dir/progress.make

CMakeFiles/native-tools: native-tools/bin2h
CMakeFiles/native-tools: native-tools/bsincgen


native-tools/bin2h: ../native-tools/CMakeLists.txt
native-tools/bin2h: ../native-tools/bin2h.c
native-tools/bin2h: ../native-tools/bsincgen.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/aaron/re3/vendor/openal-soft-ctr/test/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating native-tools/bin2h, native-tools/bsincgen"
	cd /home/aaron/re3/vendor/openal-soft-ctr/test/native-tools && /usr/bin/cmake -G "Unix Makefiles" /home/aaron/re3/vendor/openal-soft-ctr/native-tools
	cd /home/aaron/re3/vendor/openal-soft-ctr/test/native-tools && /usr/bin/cmake -E remove /home/aaron/re3/vendor/openal-soft-ctr/test/native-tools/bin2h /home/aaron/re3/vendor/openal-soft-ctr/test/native-tools/bsincgen
	cd /home/aaron/re3/vendor/openal-soft-ctr/test/native-tools && /usr/bin/cmake --build . --config Release

native-tools/bsincgen: native-tools/bin2h
	@$(CMAKE_COMMAND) -E touch_nocreate native-tools/bsincgen

native-tools: CMakeFiles/native-tools
native-tools: native-tools/bin2h
native-tools: native-tools/bsincgen
native-tools: CMakeFiles/native-tools.dir/build.make

.PHONY : native-tools

# Rule to build all files generated by this target.
CMakeFiles/native-tools.dir/build: native-tools

.PHONY : CMakeFiles/native-tools.dir/build

CMakeFiles/native-tools.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/native-tools.dir/cmake_clean.cmake
.PHONY : CMakeFiles/native-tools.dir/clean

CMakeFiles/native-tools.dir/depend:
	cd /home/aaron/re3/vendor/openal-soft-ctr/test && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/aaron/re3/vendor/openal-soft-ctr /home/aaron/re3/vendor/openal-soft-ctr /home/aaron/re3/vendor/openal-soft-ctr/test /home/aaron/re3/vendor/openal-soft-ctr/test /home/aaron/re3/vendor/openal-soft-ctr/test/CMakeFiles/native-tools.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/native-tools.dir/depend

