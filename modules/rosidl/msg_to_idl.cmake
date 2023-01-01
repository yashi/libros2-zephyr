function(msg_to_idl var)
  set(single_args "TARGET")
  set(multi_args "NON_IDL_TUPLES")
  cmake_parse_arguments(MSG2IDL "" "${single_args}" "${multi_args}" ${ARGN})

  if(NOT DEFINED MSG2IDL_TARGET)
    message(FATAL_ERROR "${CMAKE_CURRENT_FUNCTION}(${ARGV0}) requires TARGET")
  endif()
  if(NOT DEFINED MSG2IDL_NON_IDL_TUPLES)
    message(FATAL_ERROR "${CMAKE_CURRENT_FUNCTION}(${ARGV0}) requires NON_IDL_TUPLES")
  endif()

  rosidl_write_generator_arguments(
    ${CMAKE_CURRENT_BINARY_DIR}/${MSG2IDL_TARGET}_adapter.json
    PACKAGE_NAME ${MSG2IDL_TARGET}
    NON_IDL_TUPLES ${MSG2IDL_NON_IDL_TUPLES}
  )
  rosidl_adapt_interfaces(
    tuples
    ${CMAKE_CURRENT_BINARY_DIR}/${MSG2IDL_TARGET}_adapter.json
    TARGET ${MSG2IDL_TARGET}
  )
  set(${var} ${tuples} PARENT_SCOPE)
endfunction()
