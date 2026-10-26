//===-------- Baremetal implementation of an exit function ------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "src/__support/OSUtil/exit.h"
#include "src/__support/macros/config.h"

// Kvasir: internal::exit is inline in exit.h; __llvm_libc_exit, which it calls,
// is the vendor's (Kvasir_SDK StartUp.hpp).
