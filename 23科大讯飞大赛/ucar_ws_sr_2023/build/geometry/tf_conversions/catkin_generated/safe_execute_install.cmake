execute_process(COMMAND "/home/luo/ucar_ws_sr/build/geometry/tf_conversions/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/luo/ucar_ws_sr/build/geometry/tf_conversions/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
