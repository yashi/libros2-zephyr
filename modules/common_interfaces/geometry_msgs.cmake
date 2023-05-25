set(msg_files
  msg/Accel.msg
  msg/AccelStamped.msg
  msg/AccelWithCovariance.msg
  msg/AccelWithCovarianceStamped.msg
  msg/Inertia.msg
  msg/InertiaStamped.msg
  msg/Point.msg
  msg/Point32.msg
  msg/PointStamped.msg
  msg/Polygon.msg
  msg/PolygonStamped.msg
  msg/Pose.msg
  msg/Pose2D.msg
  msg/PoseArray.msg
  msg/PoseStamped.msg
  msg/PoseWithCovariance.msg
  msg/PoseWithCovarianceStamped.msg
  msg/Quaternion.msg
  msg/QuaternionStamped.msg
  msg/Transform.msg
  msg/TransformStamped.msg
  msg/Twist.msg
  msg/TwistStamped.msg
  msg/TwistWithCovariance.msg
  msg/TwistWithCovarianceStamped.msg
  msg/Vector3.msg
  msg/Vector3Stamped.msg
  msg/Wrench.msg
  msg/WrenchStamped.msg
)

gen_files(
  headers sources
  MSG_DIR "${ZEPHYR_CURRENT_MODULE_DIR}/geometry_msgs"
  MSG_FILES "${msg_files}"
)

add_custom_target(ros2_gen_geometry_msgs_headers
  DEPENDS ${headers} ros2_std_msgs
)

zephyr_library_named(ros2_geometry_msgs)
add_dependencies(ros2_geometry_msgs ros2_gen_geometry_msgs_headers)
zephyr_library_include_directories(PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/include)
zephyr_library_link_libraries(
  ros2_rosidl_runtime_c
  ros2_rosidl_typesupport_c
  ros2_rosidl_typesupport_microxrcedds_c
  ros2_microcdr
  ros2_builtin_interfaces
)
zephyr_library_sources(${sources})
