if(CONFIG_MICRO_ROS)
  zephyr_library_named(ros2_rmw_microxrcedds_c)
  zephyr_library_include_directories(${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/src)
  zephyr_library_include_directories(PUBLIC ${ZEPHYR_CURRENT_MODULE_DIR}/rmw_microxrcedds_c/include)
  zephyr_library_include_directories(PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

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
