function(gen_files)
  set(single_args "TARGET")
  set(multi_args "NON_IDL_TUPLES;OUTPUT_FILES;OUTPUT_TYPESUPPORT;OUTPUT_TYPESUPPORT_MICROXRCEDDS")
  cmake_parse_arguments(GENFILES "" "${single_args}" "${multi_args}" ${ARGN})

  if(NOT DEFINED GENFILES_TARGET)
    message(FATAL_ERROR "${CMAKE_CURRENT_FUNCTION}(${ARGV0}) requires TARGET")
  endif()
  if(NOT DEFINED GENFILES_NON_IDL_TUPLES)
    message(FATAL_ERROR "${CMAKE_CURRENT_FUNCTION}(${ARGV0}) requires NON_IDL_TUPLES")
  endif()
  if(NOT DEFINED GENFILES_OUTPUT_FILES)
    message(FATAL_ERROR "${CMAKE_CURRENT_FUNCTION}(${ARGV0}) requires OUTPUT_FILES")
  endif()

  msg_to_idl(
    idl_tuples
    TARGET ${GENFILES_TARGET}
    NON_IDL_TUPLES ${GENFILES_NON_IDL_TUPLES}
  )

  idl_to_files(
    TARGET ${GENFILES_TARGET}
    IDL_TUPLES ${idl_tuples}
    OUTPUT_FILES ${GENFILES_OUTPUT_FILES}
  )

  idl_to_typesupport(
    TARGET ${GENFILES_TARGET}
    IDL_TUPLES ${idl_tuples}
    OUTPUT_FILES ${GENFILES_OUTPUT_TYPESUPPORT}
  )

  idl_to_typesupport_microxrcedds(
    TARGET ${GENFILES_TARGET}
    IDL_TUPLES ${idl_tuples}
    OUTPUT_FILES ${GENFILES_OUTPUT_TYPESUPPORT_MICROXRCEDDS}
  )
endfunction()
