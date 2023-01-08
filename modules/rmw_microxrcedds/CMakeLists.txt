if(CONFIG_MICRO_ROS)

  # FIXME: Move to Kconfig
  # --- RMW CONFIGURATION ---
  set(RMW_UXRCE_TRANSPORT "udp" CACHE STRING "Sets Micro XRCE-DDS transport to use. (udp | tcp | serial | custom)")
  set(RMW_UXRCE_IPV "ipv4" CACHE STRING "Sets Micro XRCE-DDS IP version to use. (ipv4 | ipv6)")
  set(RMW_UXRCE_CREATION_MODE "bin" CACHE STRING "Sets creation mode in Micro XRCE-DDS. (bin | refs)")
  set(RMW_UXRCE_MAX_HISTORY "8" CACHE STRING
    "This value sets the number of history slots available for RMW subscriptions, requests and replies")
  set(RMW_UXRCE_MAX_SESSIONS "1" CACHE STRING "This value sets the maximum number of Micro XRCE-DDS sessions.")
  set(RMW_UXRCE_MAX_NODES "4" CACHE STRING "This value sets the maximum number of nodes.")
  set(RMW_UXRCE_MAX_PUBLISHERS "4" CACHE STRING "This value sets the maximum number of publishers for an application.")
  set(RMW_UXRCE_MAX_SUBSCRIPTIONS "4" CACHE STRING "This value sets the maximum number of subscriptions for an application.")
  set(RMW_UXRCE_MAX_SERVICES "4" CACHE STRING "This value sets the maximum number of services for an application.")
  set(RMW_UXRCE_MAX_CLIENTS "4" CACHE STRING "This value sets the maximum number of clients for an application.")
  set(RMW_UXRCE_MAX_WAIT_SETS "4" CACHE STRING "This value sets the maximum number of wait sets for an application.")
  set(RMW_UXRCE_MAX_GUARD_CONDITION "4" CACHE STRING "This value sets the maximum number of guard conditions for an application.")
  set(RMW_UXRCE_MAX_TOPICS "-1" CACHE STRING
    "This value sets the maximum number of topics for an application.
  If set to -1 RMW_UXRCE_MAX_TOPICS = RMW_UXRCE_MAX_PUBLISHERS + RMW_UXRCE_MAX_SUBSCRIPTIONS + RMW_UXRCE_MAX_NODES.")
  option(RMW_UXRCE_ALLOW_DYNAMIC_ALLOCATIONS "Enables increasing static pools with dynamic allocation when needed." OFF)
  set(RMW_UXRCE_NODE_NAME_MAX_LENGTH "60" CACHE STRING "This value sets the maximum number of characters for a node name.")
  set(RMW_UXRCE_TOPIC_NAME_MAX_LENGTH "60" CACHE STRING "This value sets the maximum number of characters for a topic name.")
  set(RMW_UXRCE_TYPE_NAME_MAX_LENGTH "100" CACHE STRING "This value sets the maximum number of characters for a type name.")
  set(RMW_UXRCE_REF_BUFFER_LENGTH "100" CACHE STRING "This value sets the maximum number of characters for a reference buffer.")
  set(RMW_UXRCE_PUBLISH_RELIABLE_TIMEOUT "1000" CACHE STRING
    "This value sets the default time to wait for a publication in a reliable mode in milliseconds.")

  set(RMW_UXRCE_ENTITY_CREATION_DESTROY_TIMEOUT "1000" CACHE STRING
    "This value sets the default maximum time to wait for an XRCE entity creation and destroy in milliseconds.
  If set to 0 best effort is used.")
  set(RMW_UXRCE_ENTITY_CREATION_TIMEOUT "" CACHE STRING
    "This value sets the maximum time to wait for an XRCE entity creation in milliseconds.
  If set to 0 best effort is used.")
  set(RMW_UXRCE_ENTITY_DESTROY_TIMEOUT "" CACHE STRING
    "This value sets the maximum time to wait for an XRCE entity destroy in milliseconds.
  If set to 0 best effort is used.")

  if(RMW_UXRCE_ENTITY_CREATION_TIMEOUT STREQUAL "")
    set(RMW_UXRCE_ENTITY_CREATION_TIMEOUT ${RMW_UXRCE_ENTITY_CREATION_DESTROY_TIMEOUT})
  endif()

  if(RMW_UXRCE_ENTITY_DESTROY_TIMEOUT STREQUAL "")
    set(RMW_UXRCE_ENTITY_DESTROY_TIMEOUT ${RMW_UXRCE_ENTITY_CREATION_DESTROY_TIMEOUT})
  endif()

  set(RMW_UXRCE_STREAM_HISTORY "4" CACHE STRING "This value sets the number of MTUs to buffer, both input and output.")
  set(RMW_UXRCE_STREAM_HISTORY_INPUT "" CACHE STRING
    "This value sets the number of MTUs to input buffer. It will be ignored if RMW_UXRCE_STREAM_HISTORY_OUTPUT is blank.")
  set(RMW_UXRCE_STREAM_HISTORY_OUTPUT "" CACHE STRING
    "This value sets the number of MTUs to output buffer. It will be ignored if RMW_UXRCE_STREAM_HISTORY_INPUT is blank.")

  if(RMW_UXRCE_STREAM_HISTORY_INPUT STREQUAL "" OR RMW_UXRCE_STREAM_HISTORY_OUTPUT STREQUAL "")
    unset(RMW_UXRCE_STREAM_HISTORY_INPUT)
    unset(RMW_UXRCE_STREAM_HISTORY_OUTPUT)
  else()
    unset(RMW_UXRCE_STREAM_HISTORY)
  endif()

  # Transport handle define macros.
  set(RMW_UXRCE_TRANSPORT_CUSTOM ON)
  set(RMW_UXRCE_TRANSPORT_UDP OFF)
  set(RMW_UXRCE_TRANSPORT_IPV4 OFF)

  configure_file(
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/config.h.in
    ${CMAKE_CURRENT_BINARY_DIR}/include/rmw_microxrcedds_c/config.h
  )

  zephyr_library_named(ros2_rmw_microxrcedds_c)
  zephyr_library_include_directories(${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src)
  zephyr_library_include_directories(PUBLIC ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/include)
  zephyr_library_include_directories(PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/include)

  zephyr_library_compile_definitions(HAVE_C_TYPESUPPORT)

  zephyr_library_link_libraries(
    ros2_rcutils
    ros2_rosidl_runtime_c
    ros2_microxrcedds_client
    ros2_microcdr
    ros2_rmw
    ros2_rosidl_typesupport_microxrcedds_c
  )

  zephyr_library_sources(
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/identifiers.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/memory.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_client.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_compare_gids_equal.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_count.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_event.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_get_gid_for_publisher.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_get_implementation_identifier.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_get_serialization_format.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_get_topic_endpoint_info.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_get_endpoint_network_flow.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_qos_profile_check_compatible.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_guard_condition.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_init.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_logging.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_microxrcedds_topic.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_node.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_node_info_and_types.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_node_names.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_publish.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_publisher.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_request.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_response.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_serialize.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_service.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_service_names_and_types.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_service_server_is_available.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_subscription.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_take.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_topic_names_and_types.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_trigger_guard_condition.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_wait.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_wait_set.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/types.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/utils.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/callbacks.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_event_callbacks.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_uxrce_transports.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_microros/continous_serialization.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_microros/init_options.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_microros/time_sync.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_microros/ping.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_microros/timing.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src/rmw_microros/custom_transport.c
  )

endif()
