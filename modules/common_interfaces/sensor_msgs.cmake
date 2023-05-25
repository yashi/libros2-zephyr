set(msg_files
  msg/BatteryState.msg
  msg/CameraInfo.msg
  msg/ChannelFloat32.msg
  msg/CompressedImage.msg
  msg/FluidPressure.msg
  msg/Illuminance.msg
  msg/Image.msg
  msg/Imu.msg
  msg/JointState.msg
  msg/Joy.msg
  msg/JoyFeedback.msg
  msg/JoyFeedbackArray.msg
  msg/LaserEcho.msg
  msg/LaserScan.msg
  msg/MagneticField.msg
  msg/MultiDOFJointState.msg
  msg/MultiEchoLaserScan.msg
  msg/NavSatFix.msg
  msg/NavSatStatus.msg
  msg/PointCloud.msg
  msg/PointCloud2.msg
  msg/PointField.msg
  msg/Range.msg
  msg/RegionOfInterest.msg
  msg/RelativeHumidity.msg
  msg/Temperature.msg
  msg/TimeReference.msg
)

gen_files(
  headers sources
  MSG_DIR "${ZEPHYR_CURRENT_MODULE_DIR}/sensor_msgs"
  MSG_FILES "${msg_files}"
)

add_custom_target(ros2_gen_sensor_msgs_headers
  DEPENDS ${headers} ros2_std_msgs ros2_geometry_msgs
)

zephyr_library_named(ros2_sensor_msgs)
add_dependencies(ros2_sensor_msgs ros2_gen_sensor_msgs_headers)
zephyr_library_include_directories(PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/include)
zephyr_library_link_libraries(
  ros2_rosidl_runtime_c
  ros2_rosidl_typesupport_c
  ros2_rosidl_typesupport_microxrcedds_c
  ros2_microcdr
  ros2_builtin_interfaces
)
zephyr_library_sources(${sources})
