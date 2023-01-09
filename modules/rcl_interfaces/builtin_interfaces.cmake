set(msg_files
  "msg/Duration.msg"
  "msg/Time.msg"
)
list(TRANSFORM msg_files
  PREPEND "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:"
  OUTPUT_VARIABLE non_idl_tuples)

gen_files(
  headers sources
  MSG_DIR "${ZEPHYR_CURRENT_MODULE_DIR}/builtin_interfaces"
  MSG_FILES "${msg_files}"
)

add_custom_target(ros2_gen_builtin_interfaces_headers
  DEPENDS ${output_files}
)

zephyr_library_named(ros2_builtin_interfaces)
add_dependencies(ros2_builtin_interfaces ros2_gen_builtin_interfaces_headers)
zephyr_library_include_directories(PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/include)
zephyr_library_link_libraries(
  ros2_rosidl_runtime_c
  ros2_rosidl_typesupport_c
  ros2_rosidl_typesupport_microxrcedds_c
  ros2_microcdr
)
zephyr_library_sources(${sources})
