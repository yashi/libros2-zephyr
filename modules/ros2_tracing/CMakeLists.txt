if(CONFIG_MICRO_ROS)

  option(TRACETOOLS_DISABLED "Explicitly disable support for tracing" ON)

  configure_file(
    ${ZEPHYR_CURRENT_MODULE_DIR}/tracetools/include/tracetools/config.h.in
    ${CMAKE_CURRENT_BINARY_DIR}/tracetools/include/tracetools/config.h
  )

  zephyr_library_named(ros2_tracetools)
  zephyr_library_include_directories(PUBLIC ${ZEPHYR_CURRENT_MODULE_DIR}/tracetools/include)
  zephyr_library_include_directories(PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/tracetools/include)


  zephyr_library_sources(
    ${ZEPHYR_CURRENT_MODULE_DIR}/tracetools/src/tracetools.c
  )

endif()
