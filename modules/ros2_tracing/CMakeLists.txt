option(TRACETOOLS_DISABLED "Explicitly disable support for tracing" ON)

configure_file(
  ${ZEPHYR_CURRENT_MODULE_DIR}/tracetools/include/tracetools/config.h.in
  ${CMAKE_CURRENT_BINARY_DIR}/tracetools/include/tracetools/config.h
)

zephyr_library()
zephyr_include_directories(${ZEPHYR_CURRENT_MODULE_DIR}/tracetools/include)
zephyr_include_directories(${CMAKE_CURRENT_BINARY_DIR}/tracetools/include)


zephyr_library_sources(
  ${ZEPHYR_CURRENT_MODULE_DIR}/tracetools/src/tracetools.c
)
