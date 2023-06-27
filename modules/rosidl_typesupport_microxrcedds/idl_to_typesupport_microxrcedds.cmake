function(idl_to_typesupport_microxrcedds)
  set(single_args "TARGET")
  set(multi_args "IDL_TUPLES;OUTPUT_FILES")
  cmake_parse_arguments(IDL2X "" "${single_args}" "${multi_args}" ${ARGN})

  if(NOT DEFINED IDL2X_TARGET)
    message(FATAL_ERROR "${CMAKE_CURRENT_FUNCTION}(${ARGV0}) requires TARGET")
  endif()
  if(NOT DEFINED IDL2X_IDL_TUPLES)
    message(FATAL_ERROR "${CMAKE_CURRENT_FUNCTION}(${ARGV0}) requires IDL_TUPLES")
  endif()
  if(NOT DEFINED rosidl_typesupport_microxrcedds_c_template_dir)
    message(FATAL_ERROR "rosidl_typesupport_microxrcedds_c_template_dir must be defined")
  endif()
  if(NOT DEFINED rosidl_typesupport_microxrcedds_c)
    message(FATAL_ERROR "rosidl_typesupport_microxrcedds_c must be defined")
  endif()

  file(GLOB templates ${rosidl_typesupport_microxrcedds_c_template_dir}/*)
  rosidl_write_generator_arguments(
    ${CMAKE_CURRENT_BINARY_DIR}/${IDL2X_TARGET}_typesupport_microxrcedds_c.json
    PACKAGE_NAME ${IDL2X_TARGET}
    IDL_TUPLES ${IDL2X_IDL_TUPLES}
    #ROS_INTERFACE_DEPENDENCIES "${_dependencies}"
    OUTPUT_DIR "include/${IDL2X_TARGET}"
    TEMPLATE_DIR "${rosidl_typesupport_microxrcedds_c_template_dir}"
    TARGET_DEPENDENCIES ${templates} # this is just a workaround
  )

  set(typesupports rosidl_typesupport_microxrcedds_c)
  add_custom_command(
    OUTPUT ${IDL2X_OUTPUT_FILES}
    COMMAND ${CMAKE_COMMAND} -E env PYTHONPATH=$ENV{PYTHONPATH}
    ${rosidl_typesupport_microxrcedds_c}
    --generator-arguments-file ${CMAKE_CURRENT_BINARY_DIR}/${IDL2X_TARGET}_typesupport_microxrcedds_c.json
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    COMMENT "Generating C code for ROS interfaces (${IDL2X_TARGET}) using rosidl_typesupport_microxrcedds_c"
  )

  # Change PROJECT_NAME temporarily
  set(PROJECT_NAME ${IDL2X_TARGET})
  string(TOUPPER "${IDL2X_TARGET}" PROJECT_NAME_UPPER)
  configure_file(
    "${rosidl_typesupport_microxrcedds_c_template_dir}/rosidl_typesupport_microxrcedds_c__visibility_control.h.in"
    "include/${IDL2X_TARGET}/msg/rosidl_typesupport_microxrcedds_c__visibility_control.h"
    @ONLY
  )
endfunction()
