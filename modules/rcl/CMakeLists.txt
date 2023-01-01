# FIXME: Move these options to Kconfig
option(RCL_COMMAND_LINE_ENABLED "Enable/disable the rcl_yaml_param_parser tool" OFF)
option(RCL_LOGGING_ENABLED "Enable/disable logging" OFF)


zephyr_library()
zephyr_include_directories(${ZEPHYR_CURRENT_MODULE_DIR}/rcl_action/include)
zephyr_include_directories(${ROS2_ACTION_MSGS_INCLUDE_DIR})

add_dependencies(${ZEPHYR_CURRENT_LIBRARY} ros2_action_msgs)

zephyr_library_sources(
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/client.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/common.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/context.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/domain_id.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/event.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/expand_topic_name.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/graph.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/guard_condition.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/init.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/init_options.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/lexer.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/lexer_lookahead.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/localhost.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/network_flow_endpoints.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/node.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/node_options.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/publisher.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/remap.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/node_resolve_name.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/rmw_implementation_identifier_check.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/security.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/service.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/subscription.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/time.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/timer.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/validate_enclave_name.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/validate_topic_name.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/wait.c

  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl_action/src/rcl_action/action_client.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl_action/src/rcl_action/action_server.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl_action/src/rcl_action/goal_handle.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl_action/src/rcl_action/goal_state_machine.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl_action/src/rcl_action/graph.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl_action/src/rcl_action/names.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl_action/src/rcl_action/types.c
)

zephyr_library_sources_ifdef(${RCL_COMMAND_LINE_ENABLED}
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/arguments.c
)

zephyr_library_sources_ifdef(${RCL_LOGGING_ENABLED}
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/logging_rosout.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/logging.c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rcl/src/rcl/log_level.c
)

zephyr_include_directories(${ZEPHYR_CURRENT_MODULE_DIR}/rcl/include)
