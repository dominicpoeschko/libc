//===-- Standard C header <inttypes.h> --===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===---------------------------------------------------------------------===//

#ifndef _LLVM_LIBC_INTTYPES_H
#define _LLVM_LIBC_INTTYPES_H

#include "__llvm-libc-common.h"
#include "llvm-libc-macros/inttypes-macros.h"
#include "llvm-libc-types/imaxdiv_t.h"
#include <stdint.h>

__BEGIN_C_DECLS

intmax_t imaxabs(intmax_t) __NOEXCEPT;

imaxdiv_t imaxdiv(intmax_t, intmax_t) __NOEXCEPT;

intmax_t strtoimax(const char *__restrict, char * *__restrict, int) __NOEXCEPT;

uintmax_t strtoumax(const char *__restrict, char * *__restrict, int) __NOEXCEPT;

__END_C_DECLS

#if defined(__cplusplus) && !defined(__clang__)
#include "__gcc-compat/inttypes.h"
#endif

#endif // _LLVM_LIBC_INTTYPES_H
