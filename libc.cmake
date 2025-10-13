set(LIBC_SOURCE_FILES
    src/string/memcpy.cpp
    src/string/memmove.cpp
    src/string/memset.cpp
    src/string/strlen.cpp
    src/math/generic/sinf.cpp
    src/math/generic/fmodf.cpp
    src/math/generic/fmaf.cpp
    src/math/generic/fma.cpp)

set(libc_flags -DLIBC_COPT_PUBLIC_PACKAGING)

list(JOIN libc_flags " " LIBC_FLAGS)

list(TRANSFORM LIBC_SOURCE_FILES PREPEND "${CMAKE_CURRENT_LIST_DIR}/")

set_source_files_properties(${LIBC_SOURCE_FILES} PROPERTIES COMPILE_FLAGS "${LIBC_FLAGS}")
