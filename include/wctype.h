//===-- Standard C header <wctype.h> --===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===---------------------------------------------------------------------===//

#ifndef _LLVM_LIBC_WCTYPE_H
#define _LLVM_LIBC_WCTYPE_H

#include "__llvm-libc-common.h"
#include "llvm-libc-types/wctype_t.h"
#include "llvm-libc-types/wint_t.h"

__BEGIN_C_DECLS

int iswalnum(wint_t) __NOEXCEPT;

int iswalpha(wint_t) __NOEXCEPT;

int iswblank(wint_t) __NOEXCEPT;

int iswcntrl(wint_t) __NOEXCEPT;

int iswctype(wint_t, wctype_t) __NOEXCEPT;

int iswdigit(wint_t) __NOEXCEPT;

int iswgraph(wint_t) __NOEXCEPT;

int iswlower(wint_t) __NOEXCEPT;

int iswprint(wint_t) __NOEXCEPT;

int iswpunct(wint_t) __NOEXCEPT;

int iswspace(wint_t) __NOEXCEPT;

int iswupper(wint_t) __NOEXCEPT;

int iswxdigit(wint_t) __NOEXCEPT;

wctype_t wctype(const char*) __NOEXCEPT;

__END_C_DECLS

#endif // _LLVM_LIBC_WCTYPE_H
