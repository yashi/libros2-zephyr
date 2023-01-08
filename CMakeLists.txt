if(CONFIG_MICRO_ROS)
  zephyr_interface_library_named(ros2)
  target_link_libraries(ros2 INTERFACE
    ros2_std_msgs
    ros2_action_msgs
    ros2_builtin_interfaces
    ros2_unique_identifier_msgs
    ros2_rcl
    ros2_rclc
    ros2_rmw_microxrcedds_c
  )
endif()
