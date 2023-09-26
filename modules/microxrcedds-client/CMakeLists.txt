if(CONFIG_MICRO_ROS)

  zephyr_library_named(ros2_microxrcedds_client)
  zephyr_library_link_libraries(ros2_microcdr)
  zephyr_library_include_directories(PUBLIC ${ZEPHYR_CURRENT_MODULE_DIR}/include)
  zephyr_library_include_directories(PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
  zephyr_library_include_directories_ifdef(CONFIG_POSIX_API ${ZEPHYR_BASE}/include/zephyr/posix)

  zephyr_library_sources(
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/session/stream/input_best_effort_stream.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/session/stream/input_reliable_stream.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/session/stream/output_best_effort_stream.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/session/stream/output_reliable_stream.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/session/stream/stream_storage.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/session/stream/stream_id.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/session/stream/seq_num.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/session/session.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/session/session_info.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/session/submessage.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/session/object_id.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/serialization/xrce_types.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/serialization/xrce_header.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/serialization/xrce_subheader.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/util/time.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/util/ping.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/session/common_create_entities.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/session/create_entities_ref.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/session/create_entities_xml.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/session/create_entities_bin.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/session/read_access.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/core/session/write_access.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/src/c/profile/transport/custom/custom_transport.c
  )

endif()
