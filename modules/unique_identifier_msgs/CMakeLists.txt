if(CONFIG_MICRO_ROS)

  set(non_idl_tuples
    "${ZEPHYR_CURRENT_MODULE_DIR}:msg/UUID.msg"
  )
  set(output_files
    ${CMAKE_CURRENT_BINARY_DIR}/include/unique_identifier_msgs/msg/uuid.h
  )

  gen_files(
    TARGET unique_identifier_msgs
    NON_IDL_TUPLES ${non_idl_tuples}
    OUTPUT_FILES ${output_files}
  )

  add_custom_target(ros2_unique_identifier_msgs
    DEPENDS ${output_files}
  )

  set(ROS2_UNIQUE_IDENTIFIER_MSGS_INCLUDE_DIR
    ${CMAKE_CURRENT_BINARY_DIR}/include
    PARENT_SCOPE
  )

endif()
