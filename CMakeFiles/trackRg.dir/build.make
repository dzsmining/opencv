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
CMAKE_COMMAND = /Applications/CMake.app/Contents/bin/cmake

# The command to remove a file.
RM = /Applications/CMake.app/Contents/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/Ava3/Desktop/opencv

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/Ava3/Desktop/opencv

# Include any dependencies generated for this target.
include CMakeFiles/trackRg.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/trackRg.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/trackRg.dir/flags.make

CMakeFiles/trackRg.dir/trackRGB.cpp.o: CMakeFiles/trackRg.dir/flags.make
CMakeFiles/trackRg.dir/trackRGB.cpp.o: trackRGB.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/Ava3/Desktop/opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/trackRg.dir/trackRGB.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/trackRg.dir/trackRGB.cpp.o -c /Users/Ava3/Desktop/opencv/trackRGB.cpp

CMakeFiles/trackRg.dir/trackRGB.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/trackRg.dir/trackRGB.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/Ava3/Desktop/opencv/trackRGB.cpp > CMakeFiles/trackRg.dir/trackRGB.cpp.i

CMakeFiles/trackRg.dir/trackRGB.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/trackRg.dir/trackRGB.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/Ava3/Desktop/opencv/trackRGB.cpp -o CMakeFiles/trackRg.dir/trackRGB.cpp.s

CMakeFiles/trackRg.dir/trackRGB.cpp.o.requires:

.PHONY : CMakeFiles/trackRg.dir/trackRGB.cpp.o.requires

CMakeFiles/trackRg.dir/trackRGB.cpp.o.provides: CMakeFiles/trackRg.dir/trackRGB.cpp.o.requires
	$(MAKE) -f CMakeFiles/trackRg.dir/build.make CMakeFiles/trackRg.dir/trackRGB.cpp.o.provides.build
.PHONY : CMakeFiles/trackRg.dir/trackRGB.cpp.o.provides

CMakeFiles/trackRg.dir/trackRGB.cpp.o.provides.build: CMakeFiles/trackRg.dir/trackRGB.cpp.o


# Object files for target trackRg
trackRg_OBJECTS = \
"CMakeFiles/trackRg.dir/trackRGB.cpp.o"

# External object files for target trackRg
trackRg_EXTERNAL_OBJECTS =

trackRg: CMakeFiles/trackRg.dir/trackRGB.cpp.o
trackRg: CMakeFiles/trackRg.dir/build.make
trackRg: /usr/local/lib/libopencv_videostab.3.1.0.dylib
trackRg: /usr/local/lib/libopencv_superres.3.1.0.dylib
trackRg: /usr/local/lib/libopencv_stitching.3.1.0.dylib
trackRg: /usr/local/lib/libopencv_shape.3.1.0.dylib
trackRg: /usr/local/lib/libopencv_photo.3.1.0.dylib
trackRg: /usr/local/lib/libopencv_objdetect.3.1.0.dylib
trackRg: /usr/local/lib/libopencv_calib3d.3.1.0.dylib
trackRg: /usr/local/lib/libopencv_features2d.3.1.0.dylib
trackRg: /usr/local/lib/libopencv_ml.3.1.0.dylib
trackRg: /usr/local/lib/libopencv_highgui.3.1.0.dylib
trackRg: /usr/local/lib/libopencv_videoio.3.1.0.dylib
trackRg: /usr/local/lib/libopencv_imgcodecs.3.1.0.dylib
trackRg: /usr/local/lib/libopencv_flann.3.1.0.dylib
trackRg: /usr/local/lib/libopencv_video.3.1.0.dylib
trackRg: /usr/local/lib/libopencv_imgproc.3.1.0.dylib
trackRg: /usr/local/lib/libopencv_core.3.1.0.dylib
trackRg: CMakeFiles/trackRg.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/Ava3/Desktop/opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable trackRg"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/trackRg.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/trackRg.dir/build: trackRg

.PHONY : CMakeFiles/trackRg.dir/build

CMakeFiles/trackRg.dir/requires: CMakeFiles/trackRg.dir/trackRGB.cpp.o.requires

.PHONY : CMakeFiles/trackRg.dir/requires

CMakeFiles/trackRg.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/trackRg.dir/cmake_clean.cmake
.PHONY : CMakeFiles/trackRg.dir/clean

CMakeFiles/trackRg.dir/depend:
	cd /Users/Ava3/Desktop/opencv && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/Ava3/Desktop/opencv /Users/Ava3/Desktop/opencv /Users/Ava3/Desktop/opencv /Users/Ava3/Desktop/opencv /Users/Ava3/Desktop/opencv/CMakeFiles/trackRg.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/trackRg.dir/depend

