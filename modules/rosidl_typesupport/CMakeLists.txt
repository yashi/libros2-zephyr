if(CONFIG_MICRO_ROS)

  set(rosidl_typesupport_c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_typesupport_c/bin/rosidl_typesupport_c
    PARENT_SCOPE
  )

  set(rosidl_typesupport_c_template_dir
    ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_typesupport_c/resource
    PARENT_SCOPE
  )

  set(PYTHONPATH_LIST
    ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_typesupport_c
  )
  list(JOIN PYTHONPATH_LIST ":" PYTHONPATH)

  if(DEFINED ENV{PYTHONPATH})
    set(ENV{PYTHONPATH} "$ENV{PYTHONPATH}:${PYTHONPATH}")
  else()
    set(ENV{PYTHONPATH} "${PYTHONPATH}")
  endif()

  include(idl_to_typesupport.cmake)

  zephyr_library()
  zephyr_include_directories(${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_typesupport_c/include)

  zephyr_library_sources(
    ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_typesupport_c/src/identifier.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_typesupport_c/src/message_type_support_dispatch.cpp
    ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_typesupport_c/src/service_type_support_dispatch.cpp
  )

  zephyr_library_compile_definitions(ROSIDL_TYPESUPPORT_STATIC_TYPESUPPORT)

endif()
