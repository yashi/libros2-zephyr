function(idl_to_typesupport)
  set(single_args "TARGET")
  set(multi_args "IDL_TUPLES;OUTPUT_FILES")
  cmake_parse_arguments(IDL2TYPESUPPORT "" "${single_args}" "${multi_args}" ${ARGN})

  if(NOT DEFINED IDL2TYPESUPPORT_TARGET)
    message(FATAL_ERROR "${CMAKE_CURRENT_FUNCTION}(${ARGV0}) requires TARGET")
  endif()
  if(NOT DEFINED IDL2TYPESUPPORT_IDL_TUPLES)
    message(FATAL_ERROR "${CMAKE_CURRENT_FUNCTION}(${ARGV0}) requires IDL_TUPLES")
  endif()

  file(GLOB templates ${rosidl_typesupport_c_template_dir}/*)
  rosidl_write_generator_arguments(
    ${CMAKE_CURRENT_BINARY_DIR}/${IDL2TYPESUPPORT_TARGET}_typesupport.json
    PACKAGE_NAME ${IDL2TYPESUPPORT_TARGET}
    IDL_TUPLES ${IDL2TYPESUPPORT_IDL_TUPLES}
    #ROS_INTERFACE_DEPENDENCIES "${_dependencies}"
    OUTPUT_DIR "include/${IDL2TYPESUPPORT_TARGET}"
    TEMPLATE_DIR "${rosidl_typesupport_c_template_dir}"
    TARGET_DEPENDENCIES ${templates} # this is just a workaround
  )

  set(typesupports rosidl_typesupport_microxrcedds_c)
  execute_process(
    COMMAND ${CMAKE_COMMAND} -E env PYTHONPATH=$ENV{PYTHONPATH}
    ${rosidl_typesupport_c}
    --generator-arguments-file ${CMAKE_CURRENT_BINARY_DIR}/${IDL2TYPESUPPORT_TARGET}_typesupport.json
    --typesupports ${typesupports}
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
  )
endfunction()
