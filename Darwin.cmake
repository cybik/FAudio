list(APPEND FAUDIO_PUBLIC_H
    "${CMAKE_CURRENT_LIST_DIR}/include/F3DAudio.h"
    "${CMAKE_CURRENT_LIST_DIR}/include/FACT.h"
    "${CMAKE_CURRENT_LIST_DIR}/include/FACT3D.h"
    "${CMAKE_CURRENT_LIST_DIR}/include/FAPO.h"
    "${CMAKE_CURRENT_LIST_DIR}/include/FAPOFX.h"
    "${CMAKE_CURRENT_LIST_DIR}/include/FAPOBase.h"
    "${CMAKE_CURRENT_LIST_DIR}/include/FAudio.h"
    "${CMAKE_CURRENT_LIST_DIR}/include/FAudioFX.h"
    "${CMAKE_CURRENT_LIST_DIR}/src/stb.h"
    "${CMAKE_CURRENT_LIST_DIR}/src/stb_vorbis.h"
)

function(RegisterAsFramework libname)
    set(FWK_VERSION_TAG "1.0.0")
    set_target_properties(
        ${libname}
        PROPERTIES
            FRAMEWORK TRUE
            FRAMEWORK_VERSION ${FWK_VERSION_TAG}
            MACOSX_FRAMEWORK_INFO_PLIST "${CMAKE_CURRENT_LIST_DIR}/osx/Info.plist.in"
                MACOSX_FRAMEWORK_BUNDLE_VERSION "${FWK_VERSION_TAG}"
                MACOSX_FRAMEWORK_IDENTIFIER "com.cybik.faudio_fork"
                MACOSX_FRAMEWORK_SHORT_VERSION_STRING "${FWK_VERSION_TAG}"
            PUBLIC_HEADER "${FAUDIO_PUBLIC_H}"
    )
endfunction()