# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_SOURCE_DIR = /mnt/c/Users/Assar/CLionProjects/OS1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Users/Assar/CLionProjects/OS1/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/testff.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/testff.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/testff.dir/flags.make

CMakeFiles/testff.dir/test.c.o: CMakeFiles/testff.dir/flags.make
CMakeFiles/testff.dir/test.c.o: ../test.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Assar/CLionProjects/OS1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/testff.dir/test.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/testff.dir/test.c.o   -c /mnt/c/Users/Assar/CLionProjects/OS1/test.c

CMakeFiles/testff.dir/test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/testff.dir/test.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/c/Users/Assar/CLionProjects/OS1/test.c > CMakeFiles/testff.dir/test.c.i

CMakeFiles/testff.dir/test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/testff.dir/test.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/c/Users/Assar/CLionProjects/OS1/test.c -o CMakeFiles/testff.dir/test.c.s

CMakeFiles/testff.dir/test.c.o.requires:

.PHONY : CMakeFiles/testff.dir/test.c.o.requires

CMakeFiles/testff.dir/test.c.o.provides: CMakeFiles/testff.dir/test.c.o.requires
	$(MAKE) -f CMakeFiles/testff.dir/build.make CMakeFiles/testff.dir/test.c.o.provides.build
.PHONY : CMakeFiles/testff.dir/test.c.o.provides

CMakeFiles/testff.dir/test.c.o.provides.build: CMakeFiles/testff.dir/test.c.o


# Object files for target testff
testff_OBJECTS = \
"CMakeFiles/testff.dir/test.c.o"

# External object files for target testff
testff_EXTERNAL_OBJECTS =

testff: CMakeFiles/testff.dir/test.c.o
testff: CMakeFiles/testff.dir/build.make
testff: CMakeFiles/testff.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Users/Assar/CLionProjects/OS1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable testff"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testff.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/testff.dir/build: testff

.PHONY : CMakeFiles/testff.dir/build

CMakeFiles/testff.dir/requires: CMakeFiles/testff.dir/test.c.o.requires

.PHONY : CMakeFiles/testff.dir/requires

CMakeFiles/testff.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/testff.dir/cmake_clean.cmake
.PHONY : CMakeFiles/testff.dir/clean

CMakeFiles/testff.dir/depend:
	cd /mnt/c/Users/Assar/CLionProjects/OS1/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/Assar/CLionProjects/OS1 /mnt/c/Users/Assar/CLionProjects/OS1 /mnt/c/Users/Assar/CLionProjects/OS1/cmake-build-debug /mnt/c/Users/Assar/CLionProjects/OS1/cmake-build-debug /mnt/c/Users/Assar/CLionProjects/OS1/cmake-build-debug/CMakeFiles/testff.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/testff.dir/depend

