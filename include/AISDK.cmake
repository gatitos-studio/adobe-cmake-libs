cmake_minimum_required(VERSION 3.15)

# Поиск SDK для Adobe Illustrator #
# По умолчанию ищем в env(ADOBE_SDK_PATH)/
macro(Find_AI_SDK)
    if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        set(MACOS TRUE)
    else ()
        set(WINDOWS TRUE)
    endif ()

    if (NOT DEFINED ENV{ADOBE_SDK_PATH})
        message(FATAL_ERROR "env variable ADOBE_SDK_PATH not defined")
    endif ()

    if (NOT DEFINED AI_SDK_BASE_PATH)
        set(AI_SDK_BASE_PATH $ENV{ADOBE_SDK_PATH}/ai)
        string(REPLACE "\\" "/" AI_SDK_BASE_PATH ${AI_SDK_BASE_PATH})
    endif ()

    # --- SDK 2022 --- #
    if (NOT DEFINED AI_SDK_2022_PATH)
        set(AI_SDK_2022_PATH ${AI_SDK_BASE_PATH}/AI_2022_SDK)
        string(REPLACE "\\" "/" AI_SDK_2022_PATH ${AI_SDK_2022_PATH})
    endif ()

    if (NOT DEFINED AI_SDK_2022_INCLUDE)
        set(AI_SDK_2022_INCLUDE ${AI_SDK_2022_PATH}/samplecode/common/includes
                ${AI_SDK_2022_PATH}/illustratorapi/adm
                ${AI_SDK_2022_PATH}/illustratorapi/ate
                ${AI_SDK_2022_PATH}/illustratorapi/pica_sp
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/actions
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/legacy
        )
    endif ()

    if (NOT DEFINED AI_SDK_2022_CPP)
        set(AI_SDK_2022_CPP
                ${AI_SDK_2022_PATH}/samplecode/common/source/AppContext.cpp
                ${AI_SDK_2022_PATH}/samplecode/common/source/ArtMatcher.cpp
                ${AI_SDK_2022_PATH}/samplecode/common/source/FlashUIController.cpp
                ${AI_SDK_2022_PATH}/samplecode/common/source/HtmlUIController.cpp
                ${AI_SDK_2022_PATH}/samplecode/common/source/IllustratorSDK.cpp
                ${AI_SDK_2022_PATH}/samplecode/common/source/Main.cpp
                ${AI_SDK_2022_PATH}/samplecode/common/source/Plugin.cpp
                ${AI_SDK_2022_PATH}/samplecode/common/source/SDKAboutPluginsHelper.cpp
                ${AI_SDK_2022_PATH}/samplecode/common/source/SDKErrors.cpp
                ${AI_SDK_2022_PATH}/samplecode/common/source/SDKPlugPlug.cpp
                ${AI_SDK_2022_PATH}/samplecode/common/source/Suites.cpp

                ${AI_SDK_2022_PATH}/illustratorapi/ate/IThrowException.cpp
                ${AI_SDK_2022_PATH}/illustratorapi/ate/IText.cpp

                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/AIAssert.cpp
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/ASMemory.cpp
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/IAIArtboards.cpp
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/IAIArtMatcher.cpp
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/IAIArtSet.cpp
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/IAIAutoBuffer.cpp
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/IAICharacterEncoding.cpp
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/IAIColorSpace.cpp
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/IAIDataFilter.cpp
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/IAIDictionary.cpp
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/IAIDocumentUtils.cpp
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/IAIFilePath.cpp
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/IAIGlobalUnicodeString.cpp
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/IAIRefAutoSuite.cpp
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/IAIRepeat.cpp
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/IAIStringFormatUtils.cpp
                ${AI_SDK_2022_PATH}/illustratorapi/illustrator/IAIUnicodeString.cpp
        )
    endif ()

    if (NOT DEFINED AI_SDK_2022_SRC)
        set(AI_SDK_2022_SRC ${AI_SDK_2022_CPP})
    endif ()
    # <-- SDK 2022 --> #

    # --- SDK DEFAULT --- #
    if (NOT DEFINED AI_SDK_PATH)
        set(AI_SDK_PATH ${AI_SDK_2022_PATH})
    endif ()

    if (NOT DEFINED AI_SDK_INCLUDE)
        set(AI_SDK_INCLUDE ${AI_SDK_2022_INCLUDE})
    endif ()

    if (NOT DEFINED AI_SDK_SRC)
        set(AI_SDK_SRC ${AI_SDK_2022_SRC})
    endif ()
    # <-- SDK DEFAULT --> #
endmacro()
