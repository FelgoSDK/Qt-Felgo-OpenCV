cmake_minimum_required(VERSION 3.16)

project(FelgoCV VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(WIN32)
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        set(OpenCV_DIR ${CMAKE_CURRENT_SOURCE_DIR}/vendor/opencv/windows/mingw)
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
        #To Do : MSVC2019
    endif()
elseif(ANDROID)
    if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
        if(CMAKE_ANDROID_ARCH_ABI STREQUAL "x86")
            set(OpenCV_DIR ${CMAKE_CURRENT_SOURCE_DIR}/vendor/opencv/android/clang_x86/sdk/native/jni)
        elseif(CMAKE_ANDROID_ARCH_ABI STREQUAL "x86_64")
            set(OpenCV_DIR ${CMAKE_CURRENT_SOURCE_DIR}/vendor/opencv/android/clang_x86_64/sdk/native/jni)
        elseif(CMAKE_ANDROID_ARCH_ABI STREQUAL "armeabi-v7a")
            message("armeabi-v7a")
            set(OpenCV_DIR ${CMAKE_CURRENT_SOURCE_DIR}/vendor/opencv/android/clang_armeabi_v7a/sdk/native/jni)
        elseif(CMAKE_ANDROID_ARCH_ABI STREQUAL "arm64-v8a")
            message("arm64-v8a")
            set(OpenCV_DIR ${CMAKE_CURRENT_SOURCE_DIR}/vendor/opencv/android/clang_arm64_v8a/sdk/native/jni)
        endif()
    endif()
 elseif(UNIX AND NOT APPLE)
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set(OpenCV_DIR ${CMAKE_CURRENT_SOURCE_DIR}/vendor/opencv/linux/gcc/lib/cmake/opencv4)
    endif()
elseif(APPLE)
    if(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
      set(OpenCV_DIR ${CMAKE_CURRENT_SOURCE_DIR}/vendor/opencv/macx/lib/cmake/opencv4)
    endif()
endif()

find_package(Felgo REQUIRED)

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
set(PRODUCT_IDENTIFIER "com.yourcompany.wizardEVAP.FelgoCV")
set(PRODUCT_VERSION_NAME "1.0.0")
set(PRODUCT_VERSION_CODE 1)

# Set either "test" or "publish" stage:
set(PRODUCT_STAGE "test")

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
set(PRODUCT_LICENSE_KEY "")

set(FELGO_PLUGINS
)

# Find all QML/JS files for the QML compiler:
file(GLOB_RECURSE QmlFiles RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} qml/*.qml qml/*.js)

# Find all non-QML/JS files in the qml and assets folder to add as resources:
file(GLOB_RECURSE AssetsFiles RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} assets/* qml/*)
list(REMOVE_ITEM AssetsFiles ${QmlFiles})

qt_add_executable(appFelgoCV
    main.cpp
    ${QmlFiles}
    ${AssetsFiles}
)

felgo_configure_executable(appFelgoCV)

# Deploy resources to build folder/package directly
# comment for publishing
deploy_resources("${QmlFiles};${AssetsFiles}")

# Add QML files and resources to QML module to included them via QRC automatically:
qt_add_qml_module(appFelgoCV
    URI FelgoCV
    VERSION 1.0
# uncomment for publishing:
#    QML_FILES ${QmlFiles}
#    RESOURCES ${AssetsFiles}
    NO_RESOURCE_TARGET_PATH
    SOURCES
        ocvdecoder.h ocvdecoder.cpp
)

# NOTE: for PUBLISHING, perform the following steps:
# 1. comment the deploy_resources line above, to avoid shipping your qml files with the application (instead they get compiled to the app binary)
# 2. uncomment the QML_FILES and RESOURCES above; this compiles your qml files and js files to the app binary and protects your source code
# 3. change the setMainQmlFile() call in main.cpp to the one starting with "qrc:/" - this loads the qml files from the resources
# for more details see the "Deployment Guides" in the Felgo Documentation

# during development, use the deploy_resources because you then get shorter compilation times (the qml files do not need to be compiled to the binary but are just copied)
# also, for quickest deployment on Desktop disable the "Shadow Build" option in Projects/Builds - you can then select "Run Without Deployment" from the Build menu in Qt Creator if you only changed QML files; this speeds up application start, because your app is not copied & re-compiled but just re-interpreted

target_compile_definitions(appFelgoCV
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)


# Add plist file on MacOS to add e.g. camera usage description:
if(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
  set_target_properties(appFelgoCV PROPERTIES MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_SOURCE_DIR}/macx/Project-Info.plist")
  target_sources(appFelgoCV PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/macx/Project-Info.plist")
endif()


if(IOS)
  target_include_directories(appFelgoCV PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/vendor/opencv/ios/include/opencv4)
  file(GLOB_RECURSE OpenCV_LIBS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} vendor/opencv/ios/lib/lib*.a)
  list(TRANSFORM OpenCV_LIBS PREPEND ${CMAKE_CURRENT_SOURCE_DIR}/)
else()
  find_package(OpenCV REQUIRED)
endif()

target_link_libraries(appFelgoCV PRIVATE ${OpenCV_LIBS})
target_link_libraries(appFelgoCV PRIVATE Felgo)

# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
#find_package(FelgoLive REQUIRED)
#target_link_libraries(appFelgoCV PRIVATE FelgoLive)
