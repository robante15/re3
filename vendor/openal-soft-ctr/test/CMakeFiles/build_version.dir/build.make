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

# Utility rule file for build_version.

# Include the progress variables for this target.
include CMakeFiles/build_version.dir/progress.make

CMakeFiles/build_version:
	cd /home/aaron/re3/vendor/openal-soft-ctr && /usr/bin/cmake -D GIT_EXECUTABLE=/usr/bin/git -D LIB_VERSION=1.20.0 -D LIB_VERSION_NUM=1,20,0,0 -D SRC=/home/aaron/re3/vendor/openal-soft-ctr/version.h.in -D DST=/home/aaron/re3/vendor/openal-soft-ctr/test/version.h -P /home/aaron/re3/vendor/openal-soft-ctr/version.cmake

build_version: CMakeFiles/build_version
build_version: CMakeFiles/build_version.dir/build.make

.PHONY : build_version

# Rule to build all files generated by this target.
CMakeFiles/build_version.dir/build: build_version

.PHONY : CMakeFiles/build_version.dir/build

CMakeFiles/build_version.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/build_version.dir/cmake_clean.cmake
.PHONY : CMakeFiles/build_version.dir/clean

CMakeFiles/build_version.dir/depend:
	cd /home/aaron/re3/vendor/openal-soft-ctr/test && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/aaron/re3/vendor/openal-soft-ctr /home/aaron/re3/vendor/openal-soft-ctr /home/aaron/re3/vendor/openal-soft-ctr/test /home/aaron/re3/vendor/openal-soft-ctr/test /home/aaron/re3/vendor/openal-soft-ctr/test/CMakeFiles/build_version.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/build_version.dir/depend

