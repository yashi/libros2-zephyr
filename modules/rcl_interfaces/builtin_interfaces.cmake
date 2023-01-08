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

add_custom_target(ros2_gen_builtin_interfaces_headers
  DEPENDS ${output_files}
)

zephyr_interface_library_named(ros2_builtin_interfaces)
add_dependencies(ros2_builtin_interfaces ros2_gen_builtin_interfaces_headers)
target_include_directories(ros2_builtin_interfaces INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/include)
