# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/Task_on_Loaders_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/Task_on_Loaders_autogen.dir/ParseCache.txt"
  "Task_on_Loaders_autogen"
  )
endif()
