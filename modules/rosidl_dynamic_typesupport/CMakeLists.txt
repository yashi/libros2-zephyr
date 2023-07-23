if(CONFIG_MICRO_ROS)

  zephyr_library_named(ros2_rosidl_dynamic_typesupport)
  zephyr_library_include_directories(PUBLIC ${ZEPHYR_CURRENT_MODULE_DIR}/include)
  zephyr_library_link_libraries(
    ros2_rcutils
    ros2_rosidl_runtime_c
  )

  zephyr_library_sources(
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/api/serialization_support.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/api/dynamic_data.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/api/dynamic_type.c

    ${ZEPHYR_CURRENT_MODULE_DIR}/src/identifier.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/dynamic_message_type_support_struct.c
  )

  zephyr_library_compile_definitions(ROSIDL_TYPESUPPORT_STATIC_TYPESUPPORT)

endif()
