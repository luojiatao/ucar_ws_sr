# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "sr_pkg: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(sr_pkg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/luo/ucar_ws_sr/src/sr_pkg/srv/get_pose.srv" NAME_WE)
add_custom_target(_sr_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sr_pkg" "/home/luo/ucar_ws_sr/src/sr_pkg/srv/get_pose.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(sr_pkg
  "/home/luo/ucar_ws_sr/src/sr_pkg/srv/get_pose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sr_pkg
)

### Generating Module File
_generate_module_cpp(sr_pkg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sr_pkg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(sr_pkg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(sr_pkg_generate_messages sr_pkg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/luo/ucar_ws_sr/src/sr_pkg/srv/get_pose.srv" NAME_WE)
add_dependencies(sr_pkg_generate_messages_cpp _sr_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sr_pkg_gencpp)
add_dependencies(sr_pkg_gencpp sr_pkg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sr_pkg_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(sr_pkg
  "/home/luo/ucar_ws_sr/src/sr_pkg/srv/get_pose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sr_pkg
)

### Generating Module File
_generate_module_eus(sr_pkg
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sr_pkg
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(sr_pkg_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(sr_pkg_generate_messages sr_pkg_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/luo/ucar_ws_sr/src/sr_pkg/srv/get_pose.srv" NAME_WE)
add_dependencies(sr_pkg_generate_messages_eus _sr_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sr_pkg_geneus)
add_dependencies(sr_pkg_geneus sr_pkg_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sr_pkg_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(sr_pkg
  "/home/luo/ucar_ws_sr/src/sr_pkg/srv/get_pose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sr_pkg
)

### Generating Module File
_generate_module_lisp(sr_pkg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sr_pkg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(sr_pkg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(sr_pkg_generate_messages sr_pkg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/luo/ucar_ws_sr/src/sr_pkg/srv/get_pose.srv" NAME_WE)
add_dependencies(sr_pkg_generate_messages_lisp _sr_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sr_pkg_genlisp)
add_dependencies(sr_pkg_genlisp sr_pkg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sr_pkg_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(sr_pkg
  "/home/luo/ucar_ws_sr/src/sr_pkg/srv/get_pose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sr_pkg
)

### Generating Module File
_generate_module_nodejs(sr_pkg
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sr_pkg
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(sr_pkg_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(sr_pkg_generate_messages sr_pkg_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/luo/ucar_ws_sr/src/sr_pkg/srv/get_pose.srv" NAME_WE)
add_dependencies(sr_pkg_generate_messages_nodejs _sr_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sr_pkg_gennodejs)
add_dependencies(sr_pkg_gennodejs sr_pkg_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sr_pkg_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(sr_pkg
  "/home/luo/ucar_ws_sr/src/sr_pkg/srv/get_pose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_pkg
)

### Generating Module File
_generate_module_py(sr_pkg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_pkg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(sr_pkg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(sr_pkg_generate_messages sr_pkg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/luo/ucar_ws_sr/src/sr_pkg/srv/get_pose.srv" NAME_WE)
add_dependencies(sr_pkg_generate_messages_py _sr_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sr_pkg_genpy)
add_dependencies(sr_pkg_genpy sr_pkg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sr_pkg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sr_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sr_pkg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(sr_pkg_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sr_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sr_pkg
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(sr_pkg_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sr_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sr_pkg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(sr_pkg_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sr_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sr_pkg
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(sr_pkg_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_pkg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_pkg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_pkg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(sr_pkg_generate_messages_py std_msgs_generate_messages_py)
endif()
