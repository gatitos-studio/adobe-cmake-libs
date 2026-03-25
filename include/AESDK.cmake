cmake_minimum_required(VERSION 3.15)

macro(Find_AE_SDK)
    if(NOT DEFINED ENV{AE_SDK_BASE_PATH})
        message(FATAL_ERROR "env variable AE_SDK_BASE_PATH not defined")
    endif()

    if (NOT DEFINED AE_SDK_PATH)
        set(AE_SDK_PATH $ENV{AE_SDK_BASE_PATH})
        string(REPLACE "\\" "/" AE_SDK_PATH ${AE_SDK_PATH})
    endif()

    if (NOT DEFINED AE_SDK_INCLUDE)
        set(AE_SDK_INCLUDE
                ${AE_SDK_PATH}/Examples/Headers
                ${AE_SDK_PATH}/Examples/Headers/SP
                ${AE_SDK_PATH}/Examples/Resources,
                ${AE_SDK_PATH}/Examples/Util)
    endif()

    if (NOT DEFINED AE_SDK_SRC_C)
        set(AE_SDK_SRC_C ${AE_SDK_PATH}/Examples/Util/AEFX_SuiteHelper.c)
    endif()

    if (NOT DEFINED AE_SDK_SRC_CPP)
        set(AE_SDK_SRC_CPP
                ${AE_SDK_PATH}/Examples/Util/AEGP_SuiteHandler.cpp
                ${AE_SDK_PATH}/Examples/Util/AEGP_Utils.cpp
                ${AE_SDK_PATH}/Examples/Util/MissingSuiteError.cpp
                ${AE_SDK_PATH}/Examples/Util/Smart_Utils.cpp)
    endif()

    if (NOT DEFINED AE_SDK_SRC_CPP)
        set(AE_SDK_SRC_SRC ${AE_SDK_SRC_C} ${AE_SDK_SRC_CPP})
    endif()
endmacro()
