# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_SOURCE_DIR = /home/cam/workspace/openfast/reg_tests/r-test/glue-codes/openfast/5MW_Baseline/ServoData/DISCON_OC3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cam/workspace/openfast/reg_tests/r-test/glue-codes/openfast/5MW_Baseline/ServoData/DISCON_OC3/build

# Include any dependencies generated for this target.
include CMakeFiles/DISCON_OC3Hywind.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/DISCON_OC3Hywind.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/DISCON_OC3Hywind.dir/flags.make

CMakeFiles/DISCON_OC3Hywind.dir/DISCON_OC3Hywind.F90.o: CMakeFiles/DISCON_OC3Hywind.dir/flags.make
CMakeFiles/DISCON_OC3Hywind.dir/DISCON_OC3Hywind.F90.o: ../DISCON_OC3Hywind.F90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cam/workspace/openfast/reg_tests/r-test/glue-codes/openfast/5MW_Baseline/ServoData/DISCON_OC3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building Fortran object CMakeFiles/DISCON_OC3Hywind.dir/DISCON_OC3Hywind.F90.o"
	/usr/bin/gfortran-10 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/cam/workspace/openfast/reg_tests/r-test/glue-codes/openfast/5MW_Baseline/ServoData/DISCON_OC3/DISCON_OC3Hywind.F90 -o CMakeFiles/DISCON_OC3Hywind.dir/DISCON_OC3Hywind.F90.o

CMakeFiles/DISCON_OC3Hywind.dir/DISCON_OC3Hywind.F90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/DISCON_OC3Hywind.dir/DISCON_OC3Hywind.F90.i"
	/usr/bin/gfortran-10 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/cam/workspace/openfast/reg_tests/r-test/glue-codes/openfast/5MW_Baseline/ServoData/DISCON_OC3/DISCON_OC3Hywind.F90 > CMakeFiles/DISCON_OC3Hywind.dir/DISCON_OC3Hywind.F90.i

CMakeFiles/DISCON_OC3Hywind.dir/DISCON_OC3Hywind.F90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/DISCON_OC3Hywind.dir/DISCON_OC3Hywind.F90.s"
	/usr/bin/gfortran-10 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/cam/workspace/openfast/reg_tests/r-test/glue-codes/openfast/5MW_Baseline/ServoData/DISCON_OC3/DISCON_OC3Hywind.F90 -o CMakeFiles/DISCON_OC3Hywind.dir/DISCON_OC3Hywind.F90.s

# Object files for target DISCON_OC3Hywind
DISCON_OC3Hywind_OBJECTS = \
"CMakeFiles/DISCON_OC3Hywind.dir/DISCON_OC3Hywind.F90.o"

# External object files for target DISCON_OC3Hywind
DISCON_OC3Hywind_EXTERNAL_OBJECTS =

DISCON_OC3Hywind.dll: CMakeFiles/DISCON_OC3Hywind.dir/DISCON_OC3Hywind.F90.o
DISCON_OC3Hywind.dll: CMakeFiles/DISCON_OC3Hywind.dir/build.make
DISCON_OC3Hywind.dll: CMakeFiles/DISCON_OC3Hywind.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cam/workspace/openfast/reg_tests/r-test/glue-codes/openfast/5MW_Baseline/ServoData/DISCON_OC3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking Fortran shared library DISCON_OC3Hywind.dll"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/DISCON_OC3Hywind.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/DISCON_OC3Hywind.dir/build: DISCON_OC3Hywind.dll

.PHONY : CMakeFiles/DISCON_OC3Hywind.dir/build

CMakeFiles/DISCON_OC3Hywind.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/DISCON_OC3Hywind.dir/cmake_clean.cmake
.PHONY : CMakeFiles/DISCON_OC3Hywind.dir/clean

CMakeFiles/DISCON_OC3Hywind.dir/depend:
	cd /home/cam/workspace/openfast/reg_tests/r-test/glue-codes/openfast/5MW_Baseline/ServoData/DISCON_OC3/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cam/workspace/openfast/reg_tests/r-test/glue-codes/openfast/5MW_Baseline/ServoData/DISCON_OC3 /home/cam/workspace/openfast/reg_tests/r-test/glue-codes/openfast/5MW_Baseline/ServoData/DISCON_OC3 /home/cam/workspace/openfast/reg_tests/r-test/glue-codes/openfast/5MW_Baseline/ServoData/DISCON_OC3/build /home/cam/workspace/openfast/reg_tests/r-test/glue-codes/openfast/5MW_Baseline/ServoData/DISCON_OC3/build /home/cam/workspace/openfast/reg_tests/r-test/glue-codes/openfast/5MW_Baseline/ServoData/DISCON_OC3/build/CMakeFiles/DISCON_OC3Hywind.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/DISCON_OC3Hywind.dir/depend
