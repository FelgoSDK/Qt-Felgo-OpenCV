#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "opencv_core" for configuration "Release"
set_property(TARGET opencv_core APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(opencv_core PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libopencv_core.so.4.8.0"
  IMPORTED_SONAME_RELEASE "libopencv_core.so.408"
  )

list(APPEND _cmake_import_check_targets opencv_core )
list(APPEND _cmake_import_check_files_for_opencv_core "${_IMPORT_PREFIX}/lib/libopencv_core.so.4.8.0" )

# Import target "opencv_flann" for configuration "Release"
set_property(TARGET opencv_flann APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(opencv_flann PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libopencv_flann.so.4.8.0"
  IMPORTED_SONAME_RELEASE "libopencv_flann.so.408"
  )

list(APPEND _cmake_import_check_targets opencv_flann )
list(APPEND _cmake_import_check_files_for_opencv_flann "${_IMPORT_PREFIX}/lib/libopencv_flann.so.4.8.0" )

# Import target "opencv_imgproc" for configuration "Release"
set_property(TARGET opencv_imgproc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(opencv_imgproc PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libopencv_imgproc.so.4.8.0"
  IMPORTED_SONAME_RELEASE "libopencv_imgproc.so.408"
  )

list(APPEND _cmake_import_check_targets opencv_imgproc )
list(APPEND _cmake_import_check_files_for_opencv_imgproc "${_IMPORT_PREFIX}/lib/libopencv_imgproc.so.4.8.0" )

# Import target "opencv_ml" for configuration "Release"
set_property(TARGET opencv_ml APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(opencv_ml PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libopencv_ml.so.4.8.0"
  IMPORTED_SONAME_RELEASE "libopencv_ml.so.408"
  )

list(APPEND _cmake_import_check_targets opencv_ml )
list(APPEND _cmake_import_check_files_for_opencv_ml "${_IMPORT_PREFIX}/lib/libopencv_ml.so.4.8.0" )

# Import target "opencv_photo" for configuration "Release"
set_property(TARGET opencv_photo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(opencv_photo PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libopencv_photo.so.4.8.0"
  IMPORTED_SONAME_RELEASE "libopencv_photo.so.408"
  )

list(APPEND _cmake_import_check_targets opencv_photo )
list(APPEND _cmake_import_check_files_for_opencv_photo "${_IMPORT_PREFIX}/lib/libopencv_photo.so.4.8.0" )

# Import target "opencv_dnn" for configuration "Release"
set_property(TARGET opencv_dnn APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(opencv_dnn PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libopencv_dnn.so.4.8.0"
  IMPORTED_SONAME_RELEASE "libopencv_dnn.so.408"
  )

list(APPEND _cmake_import_check_targets opencv_dnn )
list(APPEND _cmake_import_check_files_for_opencv_dnn "${_IMPORT_PREFIX}/lib/libopencv_dnn.so.4.8.0" )

# Import target "opencv_features2d" for configuration "Release"
set_property(TARGET opencv_features2d APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(opencv_features2d PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libopencv_features2d.so.4.8.0"
  IMPORTED_SONAME_RELEASE "libopencv_features2d.so.408"
  )

list(APPEND _cmake_import_check_targets opencv_features2d )
list(APPEND _cmake_import_check_files_for_opencv_features2d "${_IMPORT_PREFIX}/lib/libopencv_features2d.so.4.8.0" )

# Import target "opencv_imgcodecs" for configuration "Release"
set_property(TARGET opencv_imgcodecs APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(opencv_imgcodecs PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libopencv_imgcodecs.so.4.8.0"
  IMPORTED_SONAME_RELEASE "libopencv_imgcodecs.so.408"
  )

list(APPEND _cmake_import_check_targets opencv_imgcodecs )
list(APPEND _cmake_import_check_files_for_opencv_imgcodecs "${_IMPORT_PREFIX}/lib/libopencv_imgcodecs.so.4.8.0" )

# Import target "opencv_videoio" for configuration "Release"
set_property(TARGET opencv_videoio APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(opencv_videoio PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libopencv_videoio.so.4.8.0"
  IMPORTED_SONAME_RELEASE "libopencv_videoio.so.408"
  )

list(APPEND _cmake_import_check_targets opencv_videoio )
list(APPEND _cmake_import_check_files_for_opencv_videoio "${_IMPORT_PREFIX}/lib/libopencv_videoio.so.4.8.0" )

# Import target "opencv_calib3d" for configuration "Release"
set_property(TARGET opencv_calib3d APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(opencv_calib3d PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libopencv_calib3d.so.4.8.0"
  IMPORTED_SONAME_RELEASE "libopencv_calib3d.so.408"
  )

list(APPEND _cmake_import_check_targets opencv_calib3d )
list(APPEND _cmake_import_check_files_for_opencv_calib3d "${_IMPORT_PREFIX}/lib/libopencv_calib3d.so.4.8.0" )

# Import target "opencv_highgui" for configuration "Release"
set_property(TARGET opencv_highgui APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(opencv_highgui PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "Qt6::Core;Qt6::Gui;Qt6::Widgets;Qt6::Test;Qt6::Concurrent"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libopencv_highgui.so.4.8.0"
  IMPORTED_SONAME_RELEASE "libopencv_highgui.so.408"
  )

list(APPEND _cmake_import_check_targets opencv_highgui )
list(APPEND _cmake_import_check_files_for_opencv_highgui "${_IMPORT_PREFIX}/lib/libopencv_highgui.so.4.8.0" )

# Import target "opencv_objdetect" for configuration "Release"
set_property(TARGET opencv_objdetect APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(opencv_objdetect PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libopencv_objdetect.so.4.8.0"
  IMPORTED_SONAME_RELEASE "libopencv_objdetect.so.408"
  )

list(APPEND _cmake_import_check_targets opencv_objdetect )
list(APPEND _cmake_import_check_files_for_opencv_objdetect "${_IMPORT_PREFIX}/lib/libopencv_objdetect.so.4.8.0" )

# Import target "opencv_stitching" for configuration "Release"
set_property(TARGET opencv_stitching APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(opencv_stitching PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libopencv_stitching.so.4.8.0"
  IMPORTED_SONAME_RELEASE "libopencv_stitching.so.408"
  )

list(APPEND _cmake_import_check_targets opencv_stitching )
list(APPEND _cmake_import_check_files_for_opencv_stitching "${_IMPORT_PREFIX}/lib/libopencv_stitching.so.4.8.0" )

# Import target "opencv_video" for configuration "Release"
set_property(TARGET opencv_video APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(opencv_video PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libopencv_video.so.4.8.0"
  IMPORTED_SONAME_RELEASE "libopencv_video.so.408"
  )

list(APPEND _cmake_import_check_targets opencv_video )
list(APPEND _cmake_import_check_files_for_opencv_video "${_IMPORT_PREFIX}/lib/libopencv_video.so.4.8.0" )

# Import target "opencv_gapi" for configuration "Release"
set_property(TARGET opencv_gapi APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(opencv_gapi PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libopencv_gapi.so.4.8.0"
  IMPORTED_SONAME_RELEASE "libopencv_gapi.so.408"
  )

list(APPEND _cmake_import_check_targets opencv_gapi )
list(APPEND _cmake_import_check_files_for_opencv_gapi "${_IMPORT_PREFIX}/lib/libopencv_gapi.so.4.8.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
