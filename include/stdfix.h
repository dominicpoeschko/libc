//===-- C standard library header stdfix.h --------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIBC_STDFIX_H
#define LLVM_LIBC_STDFIX_H

#include "__llvm-libc-common.h"
#include "llvm-libc-macros/stdfix-macros.h"

// From ISO/IEC TR 18037:2008 standard:
// https://www.iso.org/standard/51126.html
// https://standards.iso.org/ittf/PubliclyAvailableStandards/c051126_ISO_IEC_TR_18037_2008.zip

#include <llvm-libc-types/stdfix-types.h>

__BEGIN_C_DECLS

#ifdef LIBC_COMPILER_HAS_FIXED_POINT
short accum abshk(short accum) __NOEXCEPT;

short fract abshr(short fract) __NOEXCEPT;

accum absk(accum) __NOEXCEPT;

long accum abslk(long accum) __NOEXCEPT;

long fract abslr(long fract) __NOEXCEPT;

fract absr(fract) __NOEXCEPT;

short accum exphk(short accum) __NOEXCEPT;

accum expk(accum) __NOEXCEPT;

short accum hkbits(int_hk_t) __NOEXCEPT;

short fract hrbits(int_hr_t) __NOEXCEPT;

accum kbits(int_k_t) __NOEXCEPT;

long accum lkbits(uint_ulr_t) __NOEXCEPT;

long fract lrbits(int_lr_t) __NOEXCEPT;

fract rbits(int_r_t) __NOEXCEPT;

short accum roundhk(short accum, int) __NOEXCEPT;

short fract roundhr(short fract, int) __NOEXCEPT;

accum roundk(accum, int) __NOEXCEPT;

long accum roundlk(long accum, int) __NOEXCEPT;

long fract roundlr(long fract, int) __NOEXCEPT;

fract roundr(fract, int) __NOEXCEPT;

unsigned short accum rounduhk(unsigned short accum, int) __NOEXCEPT;

unsigned short fract rounduhr(unsigned short fract, int) __NOEXCEPT;

unsigned accum rounduk(unsigned accum, int) __NOEXCEPT;

unsigned long accum roundulk(unsigned long accum, int) __NOEXCEPT;

unsigned long fract roundulr(unsigned long fract, int) __NOEXCEPT;

unsigned fract roundur(unsigned fract, int) __NOEXCEPT;

unsigned short accum sqrtuhk(unsigned short accum) __NOEXCEPT;

unsigned short fract sqrtuhr(unsigned short fract) __NOEXCEPT;

unsigned accum sqrtuk(unsigned accum) __NOEXCEPT;

unsigned long fract sqrtulr(unsigned long fract) __NOEXCEPT;

unsigned fract sqrtur(unsigned fract) __NOEXCEPT;

unsigned short accum uhkbits(uint_uhk_t) __NOEXCEPT;

unsigned short accum uhksqrtus(unsigned short) __NOEXCEPT;

unsigned short fract uhrbits(uint_uhr_t) __NOEXCEPT;

unsigned accum ukbits(uint_uk_t) __NOEXCEPT;

unsigned accum uksqrtui(unsigned int) __NOEXCEPT;

unsigned long accum ulkbits(uint_ulk_t) __NOEXCEPT;

unsigned long fract ulrbits(uint_ulr_t) __NOEXCEPT;

unsigned fract urbits(uint_ur_t) __NOEXCEPT;
#endif // LIBC_COMPILER_HAS_FIXED_POINT

__END_C_DECLS

#endif // LLVM_LIBC_STDFIX_H
