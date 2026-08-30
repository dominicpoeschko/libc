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
#ifndef LLVM_LIBC_GCC_COMPAT_STDLIB_H
#define LLVM_LIBC_GCC_COMPAT_STDLIB_H

#include <stddef.h>
__BEGIN_C_DECLS
char *getenv(const char *) __NOEXCEPT;
int system(const char *) __NOEXCEPT;
int mblen(const char *, size_t) __NOEXCEPT;
int at_quick_exit(void (*)(void)) __NOEXCEPT;
_Noreturn void quick_exit(int) __NOEXCEPT;
__END_C_DECLS

#endif // LLVM_LIBC_GCC_COMPAT_STDLIB_H
