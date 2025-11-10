//===-- C standard library header assert.h --------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "__llvm-libc-common.h"
#include "llvm-libc-macros/assert-macros.h"

// This file may be usefully included multiple times to change assert()'s
// definition based on NDEBUG.

#ifndef __cplusplus
#undef static_assert
#define static_assert _Static_assert
#endif

#undef assert
#ifdef NDEBUG
#define assert(...) ((void)0)
#else

namespace uc_log {
extern void log_assert(int Line, const char* Filename, const char* Expr);
}

#define INTERNAL_assert_lambda(x)                                 \
    []() __attribute__((__noreturn__)) {                          \
        if(__builtin_is_constant_evaluated()) {                   \
            int DO_NOT_USE_see_assert[1];                         \
            DO_NOT_USE_see_assert[1] = 0;                         \
        } else {                                                  \
            uc_log::log_assert(                                   \
              __LINE__,                                           \
              __FILE_NAME__,                                      \
              #x);                                                \
            while(true) {                                         \
                asm("bkpt 5" : : :);                              \
            }                                                     \
        }                                                         \
    }                                                             \
    ()

#ifdef __cplusplus
extern "C"
#endif

#define assert(x) ((void)((__builtin_expect(!!(x), true)) || (INTERNAL_assert_lambda(x), 0)))
#endif

__BEGIN_C_DECLS

_Noreturn void __assert_fail(const char *, const char *, unsigned, const char *) __NOEXCEPT;

__END_C_DECLS
