cmake_minimum_required(VERSION 3.10)
project(Calculator)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Sources
set(SRC_DIR src)
set(SOURCES ${SRC_DIR}/main.cpp ${SRC_DIR}/calculator.cpp)
set(HEADERS ${SRC_DIR}/calculator.h)

# Create library
add_library(calculator STATIC ${SRC_DIR}/calculator.cpp)

# Create executable
add_executable(calculator_app ${SRC_DIR}/main.cpp)
target_link_libraries(calculator_app PRIVATE calculator)
