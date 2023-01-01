set(TARGET builtin_interfaces)
set(non_idl_tuples
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Duration.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Time.msg"
)
set(output_files
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/duration.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/time.h
)

gen_files(
  TARGET ${TARGET}
  NON_IDL_TUPLES ${non_idl_tuples}
  OUTPUT_FILES ${output_files}
)

add_custom_target(ros2_builtin_interfaces
  DEPENDS ${output_files}
)
