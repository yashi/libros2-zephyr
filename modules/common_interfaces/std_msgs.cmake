set(TARGET std_msgs)
set(non_idl_tuples
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Bool.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Byte.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/ByteMultiArray.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Char.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/ColorRGBA.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Empty.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Float32.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Float32MultiArray.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Float64.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Float64MultiArray.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Header.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Int16.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Int16MultiArray.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Int32.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Int32MultiArray.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Int64.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Int64MultiArray.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Int8.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/Int8MultiArray.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/MultiArrayDimension.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/MultiArrayLayout.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/String.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/UInt16.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/UInt16MultiArray.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/UInt32.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/UInt32MultiArray.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/UInt64.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/UInt64MultiArray.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/UInt8.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/UInt8MultiArray.msg"
)
set(output_files
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/bool.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/byte.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/byte_multi_array.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/char.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/color_rgba.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/empty.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/float32.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/float32_multi_array.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/float64.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/float64_multi_array.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/header.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/int16.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/int16_multi_array.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/int32.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/int32_multi_array.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/int64.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/int64_multi_array.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/int8.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/int8_multi_array.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/multi_array_dimension.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/multi_array_layout.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/string.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/u_int16.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/u_int16_multi_array.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/u_int32.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/u_int32_multi_array.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/u_int64.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/u_int64_multi_array.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/u_int8.h
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/u_int8_multi_array.h
)

gen_files(
  TARGET ${TARGET}
  NON_IDL_TUPLES ${non_idl_tuples}
  OUTPUT_FILES ${output_files}
)

add_custom_target(ros2_gen_std_msgs_headers
  DEPENDS ${output_files}
)

file(GLOB generated_files
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/*.cpp
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/detail/*.c
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/detail/microxrcedds/*.c
)

zephyr_library_named(ros2_std_msgs)
add_dependencies(ros2_std_msgs ros2_gen_std_msgs_headers)
zephyr_library_include_directories(PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/include)
zephyr_library_link_libraries(
  ros2_rosidl_runtime_c
  ros2_rosidl_typesupport_microxrcedds_c
  ros2_microcdr
  ros2_builtin_interfaces
  ros2_rosidl_typesupport_c
)
zephyr_library_sources(${generated_files})
