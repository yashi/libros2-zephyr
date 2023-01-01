set(TARGET action_msgs)
set(non_idl_tuples
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/GoalInfo.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/GoalStatus.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:msg/GoalStatusArray.msg"
  "${ZEPHYR_CURRENT_MODULE_DIR}/${TARGET}:srv/CancelGoal.srv"
)
set(output_files
  ${CMAKE_CURRENT_BINARY_DIR}/include/${TARGET}/msg/goal_info.h
)

gen_files(
  TARGET ${TARGET}
  NON_IDL_TUPLES ${non_idl_tuples}
  OUTPUT_FILES ${output_files}
)

add_custom_target(ros2_${TARGET}
  DEPENDS ${output_files}
)
add_dependencies(ros2_${TARGET}
  ros2_builtin_interfaces
  ros2_unique_identifier_msgs
)
set(ROS2_ACTION_MSGS_INCLUDE_DIR
  ${CMAKE_CURRENT_BINARY_DIR}/include/
  ${ROS2_UNIQUE_IDENTIFIER_MSGS_INCLUDE_DIR}
  PARENT_SCOPE
)
