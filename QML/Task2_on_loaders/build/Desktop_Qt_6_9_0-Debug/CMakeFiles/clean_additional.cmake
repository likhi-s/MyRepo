# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/Task2_on_loaders_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/Task2_on_loaders_autogen.dir/ParseCache.txt"
  "Task2_on_loaders_autogen"
  )
endif()
