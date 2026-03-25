cmake_minimum_required(VERSION 3.15)

function(res_build ResPath ResName RES_RESULT)
    set(RES_R ${ResPath})

    if (NOT DEFINED ResName)
        set(ResName res)
    endif()

    if (MSVC)
        string(REPLACE "/" "\\" RES_R ${RES_R})

        set(RES_RR ${CMAKE_CURRENT_BINARY_DIR}/${ResName}.rr)
        string(REPLACE "/" "\\" RES_RR ${RES_RR})

        set(RES_RC ${CMAKE_CURRENT_BINARY_DIR}/${ResName}.rc)
        string(REPLACE "/" "\\" RES_RC ${RES_RC})

        add_custom_command(
                OUTPUT ${RES_RC}
                COMMAND cl /D PRWIN_ENV /I "$ENV{AE_SDK_BASE_PATH}\\Examples\\Headers" /I "$ENV{AE_SDK_BASE_PATH}\\Examples\\Resources" /EP "${RES_R}" > "${RES_RR}" && "$ENV{AE_SDK_BASE_PATH}\\Examples\\Resources\\PiPLTool" "${RES_RR}" "${RES_RC}"
                MAIN_DEPENDENCY ${RES_R}
                VERBATIM
        )

        set(RES ${RES_RC})
    else()
        set(RES_RSRC ${CMAKE_CURRENT_BINARY_DIR}/${ResName}.rsrc)

        add_custom_command(
                OUTPUT ${RES_RSRC}
                COMMAND Rez ${RES_R} -useDF -o ${RES_RSRC} -i ${AE_SDK_PATH}/Examples/Headers -i ${AE_SDK_PATH}/Examples/Headers/SP -i ${AE_SDK_PATH}/Examples/Resources -i ${AE_SDK_PATH}/Examples/Util
                MAIN_DEPENDENCY ${RES_R}
                VERBATIM
        )

        set(RES ${RES_RSRC})
    endif()

    set(RES_RESULT ${RES} PARENT_SCOPE)
endfunction()