if(CONFIG_MICRO_ROS)

  zephyr_library_named(ros2_rclc)
  zephyr_library_include_directories(PUBLIC ${ZEPHYR_CURRENT_MODULE_DIR}/rclc/include)

  if(CONFIG_POSIX_API)
    zephyr_library_include_directories(${ZEPHYR_BASE}/include/zephyr/posix)
  endif()

  zephyr_library_sources(
    ${ZEPHYR_CURRENT_MODULE_DIR}/rclc/src/rclc/init.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rclc/src/rclc/publisher.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rclc/src/rclc/subscription.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rclc/src/rclc/client.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rclc/src/rclc/service.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rclc/src/rclc/timer.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rclc/src/rclc/action_client.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rclc/src/rclc/action_server.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rclc/src/rclc/action_goal_handle.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rclc/src/rclc/node.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rclc/src/rclc/executor_handle.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rclc/src/rclc/executor.c
    ${ZEPHYR_CURRENT_MODULE_DIR}/rclc/src/rclc/sleep_zephyr.c
  )

  zephyr_library_compile_definitions(_DEFAULT_SOURCE)

  zephyr_library_link_libraries(
    ros2_action_msgs
    ros2_builtin_interfaces
    ros2_unique_identifier_msgs
    ros2_rcl
    ros2_rcl_action
    ros2_rcutils
  )

endif()
