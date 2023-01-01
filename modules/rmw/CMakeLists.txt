zephyr_library()
zephyr_include_directories(${ZEPHYR_CURRENT_MODULE_DIR}/rmw/include)
zephyr_include_directories(${ZEPHYR_RCUTILS_MODULE_DIR}/include)

add_dependencies(${ZEPHYR_CURRENT_LIBRARY} ros2_rutils)

zephyr_library_sources(
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/allocators.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/convert_rcutils_ret_to_rmw_ret.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/event.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/init.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/init_options.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/message_sequence.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/names_and_types.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/network_flow_endpoint_array.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/network_flow_endpoint.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/publisher_options.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/qos_string_conversions.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/sanity_checks.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/security_options.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/subscription_content_filter_options.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/subscription_options.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/time.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/topic_endpoint_info_array.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/topic_endpoint_info.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/types.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/validate_full_topic_name.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/validate_namespace.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rmw/src/validate_node_name.c
)
