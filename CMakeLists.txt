cmake_minimum_required(VERSION 3.16)

# Name of the triplet to use.
# This triplet is from the VCPKG_OVERLAY_TRIPLETS directory.
if (NOT DEFINED VCPKG_TARGET_TRIPLET)
    set(VCPKG_TARGET_TRIPLET
            "x64-linux-boufallo"
            CACHE STRING "VCPKG Target Triplet to use")
endif ()

# Path to the custom triplet.
# The triplet is located in the project directory "cmake/triplets".
# The triplet sets the Boufallo CMake toolchain file.
# Which means, using this triplet also forces CMake to use the RISC-V compiler.
set(VCPKG_OVERLAY_TRIPLETS
        "${CMAKE_CURRENT_LIST_DIR}/cmake/triplets"
        CACHE STRING "VCPKG triplets location")

# Name of the project
project(example)

# Find CLI11 and spdlog libraries.
# The libraries must be present in the vcpkg.json file located in the root project folder.
find_package(CLI11 CONFIG REQUIRED)
find_package(spdlog CONFIG REQUIRED)

# Find all files in the src directory
file(GLOB_RECURSE SOURCE_FILES CONFIGURE_DEPENDS
        ${CMAKE_CURRENT_LIST_DIR}/src/*.cpp
        ${CMAKE_CURRENT_LIST_DIR}/src/*.hpp
        ${CMAKE_CURRENT_LIST_DIR}/src/*.c
        ${CMAKE_CURRENT_LIST_DIR}/src/*.h)

# Create an executable
add_executable(${PROJECT_NAME} ${SOURCE_FILES})

# Link the libraries to the executable
target_link_libraries(${PROJECT_NAME} PRIVATE CLI11::CLI11 spdlog::spdlog)
