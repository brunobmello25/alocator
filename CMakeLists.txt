cmake_minimum_required(VERSION 3.10)
project(alocator C)

# 1) set the C standard
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

# 2) turn on your warning flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -g")

# 3) let CMake know where your headers live
include_directories(${CMAKE_SOURCE_DIR}/include)

# 4) gather all your .c files under src/
file(GLOB PROJECT_SOURCES "${CMAKE_SOURCE_DIR}/src/*.c")

# 5) declare your executable
add_executable(alocator ${PROJECT_SOURCES})

# 6) Make sure <unistd.h> exposes sbrk()
#    On glibc ≥2.19 prefer _DEFAULT_SOURCE
#    On older glibc you might need _BSD_SOURCE
#    On macOS you would use _DARWIN_C_SOURCE instead

if(APPLE)
  target_compile_definitions(alocator PRIVATE _DARWIN_C_SOURCE)
else()
  target_compile_definitions(alocator PRIVATE _DEFAULT_SOURCE)
endif()
