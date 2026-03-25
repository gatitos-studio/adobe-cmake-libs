cmake_minimum_required(VERSION 3.15)

# CMAKE_OSX_DEPLOYMENT_TARGET - only mac flag, no effect in win & linux
# should be used before project and it's better to set environment var: MACOSX_DEPLOYMENT_TARGET
set(CMAKE_OSX_DEPLOYMENT_TARGET "10.15" CACHE STRING "Minimum OS X deployment version")

project(adobe.cmake.libs)

set(ADOBE_SDK_PATH $ENV{ADOBE_SDK_PATH})
string(REPLACE "\\" "/" ADOBE_SDK_PATH ${ADOBE_SDK_PATH})

set(ADOBE_LIBS_PATH ${ADOBE_SDK_PATH}/libs)
set(ADOBE_CMAKE_LIBS_PATH ${ADOBE_LIBS_PATH}/adobe-cmake-libs)

set(ADOBE_CMAKE_LIB_INCLUDE
        include/AESDK.cmake
        include/PRSDK.cmake
        include/AISDK.cmake
        include/ResBuild.cmake
)

add_custom_target(adobe.cmake.libs DEPENDS ${ADOBE_CMAKE_LIB_INCLUDE})

install(DIRECTORY include DESTINATION ${ADOBE_CMAKE_LIBS_PATH})