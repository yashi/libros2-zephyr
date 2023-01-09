if(CONFIG_MICRO_ROS)

  zephyr_library_named(ros2_microxrcedds_client)
  zephyr_library_include_directories(PUBLIC ${ZEPHYR_CURRENT_MODULE_DIR}/include)
  zephyr_library_include_directories(PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/include)
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

  set(PROJECT_VERSION_MAJOR 2)
  set(PROJECT_VERSION_MINOR 2)
  set(PROJECT_VERSION_PATCH 0)
  set(PROJECT_VERSION 2.2.0)
  # these must be moved to Kconfig
  option(UCLIENT_PROFILE_DISCOVERY "Enable discovery profile." OFF)
  option(UCLIENT_PROFILE_UDP "Enable UDP transport." OFF)
  option(UCLIENT_PROFILE_TCP "Enable TCP transport." OFF)
  option(UCLIENT_PROFILE_CAN "Enable CAN FD transport." OFF)
  option(UCLIENT_PROFILE_SERIAL "Enable Serial transport." OFF)
  option(UCLIENT_PROFILE_STREAM_FRAMING "Enable stream framing protocol." OFF)
  option(UCLIENT_PROFILE_CUSTOM_TRANSPORT "Enable Custom transport." ON)

  set(UCLIENT_MAX_OUTPUT_BEST_EFFORT_STREAMS 1 CACHE STRING "Set the maximum number of output best-effort streams for session.")
  set(UCLIENT_MAX_OUTPUT_RELIABLE_STREAMS 1 CACHE STRING "Set the maximum number of output reliable streams for session.")
  set(UCLIENT_MAX_INPUT_BEST_EFFORT_STREAMS 1 CACHE STRING "Set the maximum number of input best-effort streams for session.")
  set(UCLIENT_MAX_INPUT_RELIABLE_STREAMS 1 CACHE STRING "Set the maximum number of input reliable streams for session.")
  set(UCLIENT_MAX_SESSION_CONNECTION_ATTEMPTS 10 CACHE STRING "Set the number of connection attemps.")
  set(UCLIENT_MIN_SESSION_CONNECTION_INTERVAL 1000 CACHE STRING "Set the connection interval in milliseconds.")
  set(UCLIENT_MIN_HEARTBEAT_TIME_INTERVAL 100 CACHE STRING "Set the time interval between heartbeats in milliseconds.")
  set(UCLIENT_UDP_TRANSPORT_MTU 512 CACHE STRING "Set the UDP transport MTU.")
  set(UCLIENT_TCP_TRANSPORT_MTU 512 CACHE STRING "Set the TCP transport MTU.")
  set(UCLIENT_SERIAL_TRANSPORT_MTU 512 CACHE STRING "Set the Serial transport MTU.")
  set(UCLIENT_CUSTOM_TRANSPORT_MTU 512 CACHE STRING "Set the Custom transport MTU.")

  set(UCLIENT_PLATFORM_ZEPHYR ON)

  configure_file(${ZEPHYR_CURRENT_MODULE_DIR}/include/uxr/client/config.h.in
    ${CMAKE_CURRENT_BINARY_DIR}/include/uxr/client/config.h
  )

  zephyr_library_link_libraries(ros2_microcdr)

endif()
