function(gen_files headers sources)
  set(single_args "MSG_DIR")
  set(multi_args "MSG_FILES")
  cmake_parse_arguments(GENFILES "" "${single_args}" "${multi_args}" ${ARGN})

  if(NOT DEFINED GENFILES_MSG_DIR)
    message(FATAL_ERROR "${CMAKE_CURRENT_FUNCTION}(${ARGV0}) requires MSG_DIR")
  endif()
  if(NOT DEFINED GENFILES_MSG_FILES)
    message(FATAL_ERROR "${CMAKE_CURRENT_FUNCTION}(${ARGV0}) requires MSG_FILES")
  endif()

  # get the caller file name and use it as target
  cmake_path(GET CMAKE_CURRENT_LIST_FILE STEM target)

  list(TRANSFORM GENFILES_MSG_FILES
    PREPEND "${GENFILES_MSG_DIR}:"
    OUTPUT_VARIABLE non_idl_tuples)

  set(output_files "")
  set(output_typesupport "")
  set(output_typesupport_microxrcedds "")
  foreach(msg ${GENFILES_MSG_FILES})
    string_camel_case_to_lower_case_underscore(${msg} msg_lower)
    cmake_path(GET msg_lower STEM stem)
    cmake_path(GET msg_lower PARENT_PATH parent_path)
    # generated by idl_to_files
    list(APPEND output_files "${CMAKE_CURRENT_BINARY_DIR}/include/${target}/${parent_path}/${stem}.h")
    list(APPEND output_files "${CMAKE_CURRENT_BINARY_DIR}/include/${target}/${parent_path}/detail/${stem}__functions.h")
    list(APPEND output_files "${CMAKE_CURRENT_BINARY_DIR}/include/${target}/${parent_path}/detail/${stem}__functions.c")
    list(APPEND output_files "${CMAKE_CURRENT_BINARY_DIR}/include/${target}/${parent_path}/detail/${stem}__struct.h")
    list(APPEND output_files "${CMAKE_CURRENT_BINARY_DIR}/include/${target}/${parent_path}/detail/${stem}__type_support.h")
    # generated by idl_to_typesupport
    list(APPEND output_typesupport "${CMAKE_CURRENT_BINARY_DIR}/include/${target}/${parent_path}/${stem}__type_support.cpp")
    # generated by idl_to_typesupport_microxrcedds
    list(APPEND output_typesupport_microxrcedds "${CMAKE_CURRENT_BINARY_DIR}/include/${target}/${parent_path}/detail/${stem}__rosidl_typesupport_microxrcedds_c.h")
    list(APPEND output_typesupport_microxrcedds "${CMAKE_CURRENT_BINARY_DIR}/include/${target}/${parent_path}/detail/microxrcedds/${stem}__type_support_c.c")
  endforeach()

  msg_to_idl(
    idl_tuples
    TARGET ${target}
    NON_IDL_TUPLES ${non_idl_tuples}
  )

  idl_to_files(
    TARGET ${target}
    IDL_TUPLES ${idl_tuples}
    OUTPUT_FILES ${output_files}
  )

  idl_to_typesupport(
    TARGET ${target}
    IDL_TUPLES ${idl_tuples}
    OUTPUT_FILES ${output_typesupport}
  )

  idl_to_typesupport_microxrcedds(
    TARGET ${target}
    IDL_TUPLES ${idl_tuples}
    OUTPUT_FILES ${output_typesupport_microxrcedds}
  )

  list(APPEND output
    ${output_files}
    ${output_typesupport}
    ${output_typesupport_microxrcedds}
  )

  set(header ${output} PARENT_SCOPE)
  list(FILTER headers INCLUDE REGEX "\\.h$")

  set(sources ${output} PARENT_SCOPE)
  list(FILTER headers INCLUDE REGEX "\\.(c|cpp)$")
endfunction()
