set(msg_files
  "msg/GoalInfo.msg"
  "msg/GoalStatus.msg"
  "msg/GoalStatusArray.msg"
  "srv/CancelGoal.srv"
)

gen_files(
  headers sources
  MSG_DIR "${ZEPHYR_CURRENT_MODULE_DIR}/action_msgs"
  MSG_FILES "${msg_files}"
)

add_custom_target(ros2_gen_action_msgs_headers
  DEPENDS ${headers}
)

zephyr_library_named(ros2_action_msgs)
add_dependencies(ros2_action_msgs ros2_gen_action_msgs_headers)
zephyr_library_include_directories(PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/include)
zephyr_library_link_libraries(
  ros2_rosidl_runtime_c
  ros2_rosidl_typesupport_c
  ros2_rosidl_typesupport_microxrcedds_c
  ros2_microcdr
  ros2_unique_identifier_msgs
)
zephyr_library_sources(${sources})
