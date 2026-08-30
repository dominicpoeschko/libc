//===-- Definition of macros from limits.h --------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIBC_HDR_LIMITS_MACROS_H
#define LLVM_LIBC_HDR_LIMITS_MACROS_H

#ifdef LIBC_FULL_BUILD

#include "include/llvm-libc-macros/limits-macros.h"

#else // Overlay mode

#include <limits.h>

// gcc's <limits.h> defines the long long limits only for C99 and later, never for C++
// (clang's does). Without them cpp::numeric_limits<long long> has no specialisation.
#if defined(__cplusplus) && !defined(LLONG_MAX) && defined(__LONG_LONG_MAX__)
#define LLONG_MAX __LONG_LONG_MAX__
#define LLONG_MIN (-LLONG_MAX - 1LL)
#define ULLONG_MAX (LLONG_MAX * 2ULL + 1ULL)
#endif

#endif // LLVM_LIBC_FULL_BUILD

#endif // LLVM_LIBC_HDR_LIMITS_MACROS_H
