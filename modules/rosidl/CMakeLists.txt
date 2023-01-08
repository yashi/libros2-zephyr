if(CONFIG_MICRO_ROS)

  zephyr_interface_library_named(ros2_rosidl_typesupport_interface)
  target_include_directories(ros2_rosidl_typesupport_interface
    INTERFACE ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_typesupport_interface/include)

  zephyr_library_named(ros2_rosidl_runtime_c)
  zephyr_library_include_directories(PUBLIC ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_runtime_c/include)
  zephyr_library_link_libraries(
    ros2_rcutils
    ros2_rosidl_typesupport_interface)
  zephyr_library_sources(
    ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_runtime_c/src/message_type_support.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_runtime_c/src/primitives_sequence_functions.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_runtime_c/src/sequence_bound.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_runtime_c/src/service_type_support.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_runtime_c/src/string_functions.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_runtime_c/src/u16string_functions.c
  )

  set(rosidl_generator_c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_generator_c/bin/rosidl_generator_c
    PARENT_SCOPE
  )

  set(rosidl_generator_c_template_dir
    ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_generator_c/resource
    PARENT_SCOPE
  )

  set(PYTHONPATH_LIST
    ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_cmake
    ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_generator_c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_parser
  )
  list(JOIN PYTHONPATH_LIST ":" PYTHONPATH)

  if(DEFINED ENV{PYTHONPATH})
    set(ENV{PYTHONPATH} "$ENV{PYTHONPATH}:${PYTHONPATH}")
  else()
    set(ENV{PYTHONPATH} "${PYTHONPATH}")
  endif()

  include(${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_cmake/cmake/rosidl_write_generator_arguments.cmake)
  include(${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_adapter/cmake/rosidl_adapt_interfaces.cmake)
  include(msg_to_idl.cmake)
  include(idl_to_files.cmake)
  include(gen_files.cmake)

endif()
