cmake_minimum_required(VERSION 3.15)

# Поиск SDK для Adobe Illustrator #
# По умолчанию ищем в env(ADOBE_SDK_PATH)/
macro(Find_AI_SDK)
    if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        set(SDK_MACOS TRUE)
    else()
        set(SDK_WINDOWS TRUE)
    endif()

    if(NOT DEFINED ENV{ADOBE_SDK_PATH})
        message(FATAL_ERROR "env variable ADOBE_SDK_PATH not defined")
    endif()

    if(NOT DEFINED AI_SDK_BASE_PATH)
        set(AI_SDK_BASE_PATH $ENV{ADOBE_SDK_PATH}/ai)
        string(REPLACE "\\" "/" AI_SDK_BASE_PATH ${AI_SDK_BASE_PATH})
    endif()

    # SDK 2022 #
    if(NOT DEFINED AI_SDK_2022_PATH)
        set(AI_SDK_2022_PATH ${AI_SDK_BASE_PATH}/AI_2022_SDK)
        string(REPLACE "\\" "/" AI_SDK_2022_PATH ${AI_SDK_2022_PATH})
    endif()

    # SDK DEFAULT #
    if(NOT DEFINED AI_SDK_PATH)
        set(AI_SDK_PATH ${AI_SDK_2022_PATH})
    endif()
endmacro()
