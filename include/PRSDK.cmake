cmake_minimum_required(VERSION 3.15)

macro(Find_PR_SDK)
    if(NOT DEFINED ENV{PR_SDK_BASE_PATH})
        message(FATAL_ERROR "env variable PR_SDK_BASE_PATH not defined")
    endif()

    if (NOT DEFINED PR_SDK_PATH)
        set(PR_SDK_PATH $ENV{PR_SDK_BASE_PATH})
        string(REPLACE "\\" "/" PR_SDK_PATH ${PR_SDK_PATH})
    endif()

    if (NOT DEFINED PR_SDK_INCLUDE)
        set(PR_SDK_INCLUDE
                ${PR_SDK_PATH}/Examples/Headers
                ${PR_SDK_PATH}/Examples/Headers/SP
                ${PR_SDK_PATH}/Examples/Util
                ${PR_SDK_PATH}/Examples/Projects/GPUVideoFilter/Utils
                )
    endif()
endmacro()