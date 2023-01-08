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

add_custom_target(ros2_gen_action_msgs_headers
  DEPENDS ${output_files}
)

zephyr_interface_library_named(ros2_action_msgs)
add_dependencies(ros2_action_msgs ros2_gen_action_msgs_headers)
target_include_directories(ros2_action_msgs INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/include)
