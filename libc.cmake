set(
  LIBC_SOURCE_FILES
  src/crt/abort.c
  src/stdlib/abs.c
  src/string/memcmp.c
  src/string/memcpy.c
  src/string/memmove.c
  src/string/memset.c
  src/string/strlen.c
  src/ctype/isspace.c
  src/ctype/isdigit.c
)

set(libc_flags
    -Wno-unsafe-buffer-usage)

list(JOIN libc_flags " " LIBC_FLAGS)

list(TRANSFORM LIBC_SOURCE_FILES PREPEND "${CMAKE_CURRENT_LIST_DIR}/")

set_source_files_properties(
  ${LIBC_SOURCE_FILES} PROPERTIES COMPILE_FLAGS "${LIBC_FLAGS}")
