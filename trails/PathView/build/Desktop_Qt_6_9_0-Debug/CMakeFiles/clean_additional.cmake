# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/PathView_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/PathView_autogen.dir/ParseCache.txt"
  "PathView_autogen"
  )
endif()
