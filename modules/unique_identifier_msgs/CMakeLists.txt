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

  add_custom_target(ros2_gen_unique_identifier_msgs_headers
    DEPENDS ${output_files}
  )

  zephyr_interface_library_named(ros2_unique_identifier_msgs)
  add_dependencies(ros2_unique_identifier_msgs ros2_gen_unique_identifier_msgs_headers)
  target_include_directories(ros2_unique_identifier_msgs INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/include)

endif()
