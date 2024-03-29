function(idl_to_files)
  set(single_args "TARGET")
  set(multi_args "IDL_TUPLES;OUTPUT_FILES")
  cmake_parse_arguments(IDL2X "" "${single_args}" "${multi_args}" ${ARGN})

  if(NOT DEFINED IDL2X_TARGET)
    message(FATAL_ERROR "${CMAKE_CURRENT_FUNCTION}(${ARGV0}) requires TARGET")
  endif()
  if(NOT DEFINED IDL2X_IDL_TUPLES)
    message(FATAL_ERROR "${CMAKE_CURRENT_FUNCTION}(${ARGV0}) requires IDL_TUPLES")
  endif()
  if(NOT DEFINED IDL2X_OUTPUT_FILES)
    message(FATAL_ERROR "${CMAKE_CURRENT_FUNCTION}(${ARGV0}) requires OUTPUT_FILES")
  endif()

  file(GLOB templates ${rosidl_generator_c_template_dir}/*)
  rosidl_write_generator_arguments(
    ${CMAKE_CURRENT_BINARY_DIR}/${IDL2X_TARGET}_generator.json
    PACKAGE_NAME ${IDL2X_TARGET}
    IDL_TUPLES ${IDL2X_IDL_TUPLES}
    #ROS_INTERFACE_DEPENDENCIES "${_dependencies}"
    OUTPUT_DIR "include/${IDL2X_TARGET}"
    TEMPLATE_DIR "${rosidl_generator_c_template_dir}"
    TARGET_DEPENDENCIES ${templates} # this is just a workaround
  )

  # Generating header files at configuration time is easier for
  # application developers; no need to worry about header file
  # dependencies.
  # FIXME: dependencies to the input files are not set.
  add_custom_command(
    OUTPUT ${IDL2X_OUTPUT_FILES}
    COMMAND ${CMAKE_COMMAND} -E env PYTHONPATH=$ENV{PYTHONPATH}
    ${rosidl_generator_c}
    --generator-arguments-file ${CMAKE_CURRENT_BINARY_DIR}/${IDL2X_TARGET}_generator.json
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    COMMENT "Generating C code for ROS interfaces (${IDL2X_TARGET}) using rosidl_generator_c"
  )

  # Change PROJECT_NAME temporarily
  set(PROJECT_NAME ${IDL2X_TARGET})
  string(TOUPPER "${IDL2X_TARGET}" PROJECT_NAME_UPPER)
  configure_file(
    "${rosidl_generator_c_template_dir}/rosidl_generator_c__visibility_control.h.in"
    "include/${IDL2X_TARGET}/msg/rosidl_generator_c__visibility_control.h"
    @ONLY
  )
endfunction()
