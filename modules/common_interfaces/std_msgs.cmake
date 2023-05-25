set(msg_files
  msg/Empty.msg
  msg/Bool.msg
  msg/Byte.msg
  msg/Char.msg
  msg/String.msg
  msg/Int8.msg
  msg/Int16.msg
  msg/Int32.msg
  msg/Int64.msg
  msg/UInt8.msg
  msg/UInt16.msg
  msg/UInt32.msg
  msg/UInt64.msg
  msg/Float32.msg
  msg/Float64.msg
  msg/ByteMultiArray.msg
  msg/Int8MultiArray.msg
  msg/Int16MultiArray.msg
  msg/Int32MultiArray.msg
  msg/Int64MultiArray.msg
  msg/UInt8MultiArray.msg
  msg/UInt16MultiArray.msg
  msg/UInt32MultiArray.msg
  msg/UInt64MultiArray.msg
  msg/Float32MultiArray.msg
  msg/Float64MultiArray.msg
  msg/MultiArrayDimension.msg
  msg/MultiArrayLayout.msg
  msg/Header.msg
  msg/ColorRGBA.msg
)

gen_files(
  headers sources
  MSG_DIR "${ZEPHYR_CURRENT_MODULE_DIR}/std_msgs"
  MSG_FILES "${msg_files}"
)

add_custom_target(ros2_gen_std_msgs_headers
  DEPENDS ${headers}
)

zephyr_library_named(ros2_std_msgs)
add_dependencies(ros2_std_msgs ros2_gen_std_msgs_headers)
zephyr_library_include_directories(PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/include)
zephyr_library_link_libraries(
  ros2_rosidl_runtime_c
  ros2_rosidl_typesupport_c
  ros2_rosidl_typesupport_microxrcedds_c
  ros2_microcdr
  ros2_builtin_interfaces
)
zephyr_library_sources(${sources})
