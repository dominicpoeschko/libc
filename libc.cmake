set(
  LIBC_SOURCE_FILES
  src/string/memcpy.cpp
)

set(libc_flags
    -Wno-unsafe-buffer-usage
    -DLIBC_COPT_PUBLIC_PACKAGING
)

list(JOIN libc_flags " " LIBC_FLAGS)

list(TRANSFORM LIBC_SOURCE_FILES PREPEND "${CMAKE_CURRENT_LIST_DIR}/")

set_source_files_properties(
  ${LIBC_SOURCE_FILES} PROPERTIES COMPILE_FLAGS "${LIBC_FLAGS}")
