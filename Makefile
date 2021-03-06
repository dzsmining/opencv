# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


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
CMAKE_COMMAND = /Applications/CMake.app/Contents/bin/cmake

# The command to remove a file.
RM = /Applications/CMake.app/Contents/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/Ava3/Desktop/opencv

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/Ava3/Desktop/opencv

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake cache editor..."
	/Applications/CMake.app/Contents/bin/ccmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/Applications/CMake.app/Contents/bin/cmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/Ava3/Desktop/opencv/CMakeFiles /Users/Ava3/Desktop/opencv/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/Ava3/Desktop/opencv/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named track

# Build rule for target.
track: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 track
.PHONY : track

# fast build rule for target.
track/fast:
	$(MAKE) -f CMakeFiles/track.dir/build.make CMakeFiles/track.dir/build
.PHONY : track/fast

#=============================================================================
# Target rules for targets named trackRg

# Build rule for target.
trackRg: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 trackRg
.PHONY : trackRg

# fast build rule for target.
trackRg/fast:
	$(MAKE) -f CMakeFiles/trackRg.dir/build.make CMakeFiles/trackRg.dir/build
.PHONY : trackRg/fast

track.o: track.cpp.o

.PHONY : track.o

# target to build an object file
track.cpp.o:
	$(MAKE) -f CMakeFiles/track.dir/build.make CMakeFiles/track.dir/track.cpp.o
.PHONY : track.cpp.o

track.i: track.cpp.i

.PHONY : track.i

# target to preprocess a source file
track.cpp.i:
	$(MAKE) -f CMakeFiles/track.dir/build.make CMakeFiles/track.dir/track.cpp.i
.PHONY : track.cpp.i

track.s: track.cpp.s

.PHONY : track.s

# target to generate assembly for a file
track.cpp.s:
	$(MAKE) -f CMakeFiles/track.dir/build.make CMakeFiles/track.dir/track.cpp.s
.PHONY : track.cpp.s

trackRGB.o: trackRGB.cpp.o

.PHONY : trackRGB.o

# target to build an object file
trackRGB.cpp.o:
	$(MAKE) -f CMakeFiles/trackRg.dir/build.make CMakeFiles/trackRg.dir/trackRGB.cpp.o
.PHONY : trackRGB.cpp.o

trackRGB.i: trackRGB.cpp.i

.PHONY : trackRGB.i

# target to preprocess a source file
trackRGB.cpp.i:
	$(MAKE) -f CMakeFiles/trackRg.dir/build.make CMakeFiles/trackRg.dir/trackRGB.cpp.i
.PHONY : trackRGB.cpp.i

trackRGB.s: trackRGB.cpp.s

.PHONY : trackRGB.s

# target to generate assembly for a file
trackRGB.cpp.s:
	$(MAKE) -f CMakeFiles/trackRg.dir/build.make CMakeFiles/trackRg.dir/trackRGB.cpp.s
.PHONY : trackRGB.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... track"
	@echo "... trackRg"
	@echo "... track.o"
	@echo "... track.i"
	@echo "... track.s"
	@echo "... trackRGB.o"
	@echo "... trackRGB.i"
	@echo "... trackRGB.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

