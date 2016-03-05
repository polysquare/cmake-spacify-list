# /SpacifyList.cmake
#
# Spacify cmake lists so that they can be printed directly into text files.
#
# See /LICENCE.md for Copyright information
include (conanbuildinfo.cmake)

include ("smspillaz/cmake-include-guard/IncludeGuard")
cmake_include_guard (SET_MODULE_PATH)

include ("smspillaz/cmake-opt-arg-parsing/OptimizedParseArguments")

# cmake_spacify_list
#
# Turn semi-colon separated list into space-separated string. Useful
# for turning list arguments into subprocess arguments.
#
# Pass NO_QUOTES to suppress quoting of each item.
#
# RETURN_SPACED: Variable to place spacified list into.
# LIST: List to spacify.
# [Optional] NO_QUOTES: Do not quote individual entries by default.
function (cmake_spacify_list RETURN_SPACED)

    cmake_parse_args_key (SPACIFY
                          "NO_QUOTES"
                          ""
                          "LIST"
                          PARSE_KEY ${ARGN})
    cmake_fetch_parsed_arg (${PARSE_KEY} SPACIFY LIST)

    set (SPACIFIED "")
    foreach (ELEMENT ${SPACIFY_LIST})

        if (SPACIFY_NO_QUOTES)

            set (SPACIFIED "${SPACIFIED}${ELEMENT} ")

        else ()

            set (SPACIFIED "${SPACIFIED}\"${ELEMENT}\" ")

        endif ()

    endforeach ()

    string (STRIP "${SPACIFIED}" SPACIFIED)
    set (${RETURN_SPACED} "${SPACIFIED}" PARENT_SCOPE)

endfunction ()
