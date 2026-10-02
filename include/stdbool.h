//===-- stdbool.h for Kvasir's llvm-libc ----------------------------------===//
//
// A compiler-level header llvm-libc leaves to the compiler. gcc builds compile with -nostdinc
// (arm_gcc.cmake), so its own stdbool.h is out of reach; libc++ no longer ships one.
//
//===----------------------------------------------------------------------===//
#ifndef _STDBOOL_H
#define _STDBOOL_H

#if !defined(__cplusplus) && (!defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L)
#define bool _Bool
#define true 1
#define false 0
#endif

#define __bool_true_false_are_defined 1

#endif // _STDBOOL_H
