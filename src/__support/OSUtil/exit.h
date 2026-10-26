//===------------ Implementation of an exit function ------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIBC_SRC___SUPPORT_OSUTIL_EXIT_H
#define LLVM_LIBC_SRC___SUPPORT_OSUTIL_EXIT_H

#include "src/__support/macros/config.h"

namespace LIBC_NAMESPACE_DECL {
namespace internal {

// Kvasir: inline, for the baremetal target only Kvasir builds. The vendor's
// __llvm_libc_exit is then called from the caller's own code (a LIBC_ASSERT)
// and its return address names that site, not this function.
extern "C" [[noreturn]] void __llvm_libc_exit(int status);

[[noreturn, gnu::always_inline]] inline void exit(int status) {
  __llvm_libc_exit(status);
}

} // namespace internal
} // namespace LIBC_NAMESPACE_DECL

#endif // LLVM_LIBC_SRC___SUPPORT_OSUTIL_EXIT_H
