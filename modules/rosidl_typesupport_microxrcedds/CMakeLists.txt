set(rosidl_typesupport_microxrcedds_c
  ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_typesupport_microxrcedds_c/main/rosidl_typesupport_microxrcedds_c
  PARENT_SCOPE
)
set(rosidl_typesupport_microxrcedds_c_template_dir
  ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_typesupport_microxrcedds_c/resource
  PARENT_SCOPE
)
set(PYTHONPATH_LIST
  ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_typesupport_microxrcedds_c
)
list(JOIN PYTHONPATH_LIST ":" PYTHONPATH)

if(DEFINED ENV{PYTHONPATH})
  set(ENV{PYTHONPATH} "$ENV{PYTHONPATH}:${PYTHONPATH}")
else()
  set(ENV{PYTHONPATH} "${PYTHONPATH}")
endif()

include(idl_to_typesupport_microxrcedds.cmake)

set(ROS2_ROSIDL_TYPESUPPORT_MICROXRCEDDS_C_INCLUDE_DIR
  ${ZEPHYR_CURRENT_MODULE_DIR}/rosidl_typesupport_microxrcedds_c/include
  PARENT_SCOPE
)
