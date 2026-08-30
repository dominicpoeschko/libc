//===-- gcc compatibility declarations for the vendored libc++ ------------===//
//
// libc++ imports the C library into namespace std with
// `using ::name _LIBCPP_USING_IF_EXISTS;`. clang's using_if_exists attribute
// makes a missing name a no-op; gcc has no such attribute, so every name
// libc++ mentions must exist. Declarations only - nothing here is defined,
// so an actual call fails at link. Included from the end of the matching
// llvm-libc header, gcc C++ only.
//
//===----------------------------------------------------------------------===//
#ifndef LLVM_LIBC_GCC_COMPAT_TIME_H
#define LLVM_LIBC_GCC_COMPAT_TIME_H

#include "../llvm-libc-types/time_t.h"
__BEGIN_C_DECLS
time_t time(time_t *) __NOEXCEPT;
__END_C_DECLS

#endif // LLVM_LIBC_GCC_COMPAT_TIME_H
