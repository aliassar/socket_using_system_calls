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
include CMakeFiles/file_test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/file_test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/file_test.dir/flags.make

CMakeFiles/file_test.dir/file_test.c.o: CMakeFiles/file_test.dir/flags.make
CMakeFiles/file_test.dir/file_test.c.o: ../file_test.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Assar/CLionProjects/OS1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/file_test.dir/file_test.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/file_test.dir/file_test.c.o   -c /mnt/c/Users/Assar/CLionProjects/OS1/file_test.c

CMakeFiles/file_test.dir/file_test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/file_test.dir/file_test.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/c/Users/Assar/CLionProjects/OS1/file_test.c > CMakeFiles/file_test.dir/file_test.c.i

CMakeFiles/file_test.dir/file_test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/file_test.dir/file_test.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/c/Users/Assar/CLionProjects/OS1/file_test.c -o CMakeFiles/file_test.dir/file_test.c.s

CMakeFiles/file_test.dir/file_test.c.o.requires:

.PHONY : CMakeFiles/file_test.dir/file_test.c.o.requires

CMakeFiles/file_test.dir/file_test.c.o.provides: CMakeFiles/file_test.dir/file_test.c.o.requires
	$(MAKE) -f CMakeFiles/file_test.dir/build.make CMakeFiles/file_test.dir/file_test.c.o.provides.build
.PHONY : CMakeFiles/file_test.dir/file_test.c.o.provides

CMakeFiles/file_test.dir/file_test.c.o.provides.build: CMakeFiles/file_test.dir/file_test.c.o


# Object files for target file_test
file_test_OBJECTS = \
"CMakeFiles/file_test.dir/file_test.c.o"

# External object files for target file_test
file_test_EXTERNAL_OBJECTS =

file_test: CMakeFiles/file_test.dir/file_test.c.o
file_test: CMakeFiles/file_test.dir/build.make
file_test: CMakeFiles/file_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Users/Assar/CLionProjects/OS1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable file_test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/file_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/file_test.dir/build: file_test

.PHONY : CMakeFiles/file_test.dir/build

CMakeFiles/file_test.dir/requires: CMakeFiles/file_test.dir/file_test.c.o.requires

.PHONY : CMakeFiles/file_test.dir/requires

CMakeFiles/file_test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/file_test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/file_test.dir/clean

CMakeFiles/file_test.dir/depend:
	cd /mnt/c/Users/Assar/CLionProjects/OS1/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/Assar/CLionProjects/OS1 /mnt/c/Users/Assar/CLionProjects/OS1 /mnt/c/Users/Assar/CLionProjects/OS1/cmake-build-debug /mnt/c/Users/Assar/CLionProjects/OS1/cmake-build-debug /mnt/c/Users/Assar/CLionProjects/OS1/cmake-build-debug/CMakeFiles/file_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/file_test.dir/depend

