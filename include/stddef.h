//===-- C standard library header stddef.h --------------------------------===//
//
// Kvasir: llvm-libc takes stddef.h from the compiler, but the Kvasir toolchains
// build with -nostdinc (gcc, arm_gcc.cmake) or put this directory ahead of the
// compiler's resource headers (clang, arm_clang.cmake), so this file stands in
// for the compiler's. Everything comes from compiler builtins, so it is right
// for any target and for gcc and clang alike.
//
// It follows the compiler headers' protocol: with a __need_* macro defined it
// provides only that piece (llvm-libc's null-macro.h and offsetof-macro.h ask
// this way), otherwise the whole header.
//
// max_align_t must have the alignment of the most aligned scalar type: the
// heap (llvm-libc Block::MIN_ALIGN) aligns every malloc() and operator new to
// it. A plain `typedef int max_align_t` stood here until 2026-09-25 and made
// every heap block 4-aligned on ARM, where long long and double need 8.
//
//===----------------------------------------------------------------------===//

#if !defined(__need_ptrdiff_t) && !defined(__need_size_t) &&                   \
    !defined(__need_wchar_t) && !defined(__need_NULL) &&                       \
    !defined(__need_offsetof) && !defined(__need_max_align_t) &&               \
    !defined(__need_nullptr_t) && !defined(__need_unreachable)
#define __need_ptrdiff_t
#define __need_size_t
#define __need_wchar_t
#define __need_NULL
#define __need_offsetof
#define __need_max_align_t
#define __need_nullptr_t
#define __need_unreachable
#endif

#ifdef __need_ptrdiff_t
#ifndef __KVASIR_STDDEF_PTRDIFF_T
#define __KVASIR_STDDEF_PTRDIFF_T
typedef __PTRDIFF_TYPE__ ptrdiff_t;
#endif
#undef __need_ptrdiff_t
#endif

#ifdef __need_size_t
#ifndef __KVASIR_STDDEF_SIZE_T
#define __KVASIR_STDDEF_SIZE_T
typedef __SIZE_TYPE__ size_t;
#endif
#undef __need_size_t
#endif

#ifdef __need_wchar_t
// A keyword in C++.
#if !defined(__cplusplus) && !defined(__KVASIR_STDDEF_WCHAR_T)
#define __KVASIR_STDDEF_WCHAR_T
typedef __WCHAR_TYPE__ wchar_t;
#endif
#undef __need_wchar_t
#endif

#ifdef __need_NULL
#undef NULL
#ifdef __cplusplus
#define NULL __null
#else
#define NULL ((void *)0)
#endif
#undef __need_NULL
#endif

#ifdef __need_offsetof
#undef offsetof
#define offsetof(type, member) __builtin_offsetof(type, member)
#undef __need_offsetof
#endif

#ifdef __need_max_align_t
// Guarded by the names clang's and gcc's own headers use, so either of those
// and this one can meet in one translation unit.
#if !defined(__CLANG_MAX_ALIGN_T_DEFINED) && !defined(_GCC_MAX_ALIGN_T)
#define __CLANG_MAX_ALIGN_T_DEFINED
#define _GCC_MAX_ALIGN_T
typedef struct {
  long long __kvasir_max_align_ll
      __attribute__((__aligned__(__alignof__(long long))));
  long double __kvasir_max_align_ld
      __attribute__((__aligned__(__alignof__(long double))));
} max_align_t;
#endif
#undef __need_max_align_t
#endif

#ifdef __need_nullptr_t
// C23; libc++'s stddef.h wrapper supplies it for C++.
#if !defined(__cplusplus) && defined(__STDC_VERSION__) &&                      \
    __STDC_VERSION__ >= 202311L && !defined(__KVASIR_STDDEF_NULLPTR_T)
#define __KVASIR_STDDEF_NULLPTR_T
typedef typeof(nullptr) nullptr_t;
#endif
#undef __need_nullptr_t
#endif

#ifdef __need_unreachable
// C23; C++ has std::unreachable in <utility>.
#if !defined(__cplusplus) && defined(__STDC_VERSION__) &&                      \
    __STDC_VERSION__ >= 202311L && !defined(unreachable)
#define unreachable() __builtin_unreachable()
#endif
#undef __need_unreachable
#endif
