cmake_minimum_required(VERSION 2.8)
project( track )
find_package( OpenCV )
include_directories( ${OpenCV_INCLUDE_DIRS} )
add_executable( track track.cpp )
target_link_libraries( track ${OpenCV_LIBS} )


cmake_minimum_required(VERSION 2.8)
project( trackRg )
find_package( OpenCV )
include_directories( ${OpenCV_INCLUDE_DIRS} )
add_executable( trackRg trackRGB.cpp )
target_link_libraries( trackRg ${OpenCV_LIBS} )
