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
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/Bool.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/Byte.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/ByteMultiArray.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/Char.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/ColorRGBA.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/Empty.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/Float32.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/Float32MultiArray.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/Float64.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/Float64MultiArray.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/Header.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/Int16.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/Int16MultiArray.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/Int32.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/Int32MultiArray.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/Int64.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/Int64MultiArray.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/Int8.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/Int8MultiArray.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/MultiArrayDimension.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/MultiArrayLayout.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/String.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/UInt16.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/UInt16MultiArray.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/UInt32.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/UInt32MultiArray.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/UInt64.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/UInt64MultiArray.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/UInt8.msg
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/UInt8MultiArray.msg
)

gen_files(
  TARGET ${TARGET}
  NON_IDL_TUPLES ${non_idl_tuples}
  OUTPUT_FILES ${output_files}
)

add_custom_target(ros2_common_interfaces
  DEPENDS ${output_files}
)

file(GLOB generated_files
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/*.cpp
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/detail/*.c
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/detail/microxrcedds/*.c
)
zephyr_library()
zephyr_library_sources(${generated_files})

set(ROS2_STD_MSGS_INCLUDE_DIR
  ${CMAKE_CURRENT_BINARY_DIR}/include/
)
zephyr_include_directories(${ROS2_STD_MSGS_INCLUDE_DIR})
