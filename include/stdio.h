//===-- Standard C header <stdio.h> --===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===---------------------------------------------------------------------===//

#ifndef _LLVM_LIBC_STDIO_H
#define _LLVM_LIBC_STDIO_H

#include "__llvm-libc-common.h"
#include "llvm-libc-macros/_LIBC_MODULAR_FORMAT_PRINTF.h"
#include "llvm-libc-macros/file-seek-macros.h"
#include "llvm-libc-macros/null-macro.h"
#include "llvm-libc-macros/stdio-macros.h"
#include "llvm-libc-types/FILE.h"
#include "llvm-libc-types/cookie_io_functions_t.h"
#include "llvm-libc-types/errno_t.h"
#include "llvm-libc-types/off_t.h"
#include "llvm-libc-types/rsize_t.h"
#include "llvm-libc-types/size_t.h"
#include <stdarg.h>

#define stderr stderr

#define stdin stdin

#define stdout stdout

__BEGIN_C_DECLS

_LIBC_MODULAR_FORMAT_PRINTF(__asprintf_modular, 2, 3) int asprintf(char **__restrict, const char *__restrict, ...) __NOEXCEPT;

int feof(FILE *) __NOEXCEPT;

int ferror(FILE *) __NOEXCEPT;

int fflush(FILE *) __NOEXCEPT;

int fgetc(FILE *) __NOEXCEPT;

char *fgets(char *__restrict, int, FILE *__restrict) __NOEXCEPT;

int fprintf(FILE *__restrict, const char *__restrict, ...) __NOEXCEPT;

int fputc(int, FILE *) __NOEXCEPT;

int fputs(const char *__restrict, FILE *__restrict) __NOEXCEPT;

size_t fread(void *__restrict, size_t, size_t, FILE *__restrict) __NOEXCEPT;

int fscanf(FILE *__restrict, const char *__restrict, ...) __NOEXCEPT;

size_t fwrite(const void *__restrict, size_t, size_t, FILE *__restrict) __NOEXCEPT;

int getc(FILE *) __NOEXCEPT;

int getchar(void) __NOEXCEPT;

_LIBC_MODULAR_FORMAT_PRINTF(__printf_modular, 1, 2) int printf(const char *__restrict, ...) __NOEXCEPT;

int putc(int, FILE *) __NOEXCEPT;

int putchar(int) __NOEXCEPT;

int puts(const char *) __NOEXCEPT;

int remove(const char *) __NOEXCEPT;

int scanf(const char *__restrict, ...) __NOEXCEPT;

_LIBC_MODULAR_FORMAT_PRINTF(__snprintf_modular, 3, 4) int snprintf(char *__restrict, size_t, const char *__restrict, ...) __NOEXCEPT;

_LIBC_MODULAR_FORMAT_PRINTF(__sprintf_modular, 2, 3) int sprintf(char *__restrict, const char *__restrict, ...) __NOEXCEPT;

int sscanf(const char *__restrict, const char *__restrict, ...) __NOEXCEPT;

int ungetc(int, FILE *) __NOEXCEPT;

_LIBC_MODULAR_FORMAT_PRINTF(__vasprintf_modular, 2, 0) int vasprintf(char **__restrict, const char *__restrict, va_list) __NOEXCEPT;

int vfprintf(FILE *__restrict, const char *__restrict, va_list) __NOEXCEPT;

int vfscanf(FILE *__restrict, const char *__restrict, va_list) __NOEXCEPT;

_LIBC_MODULAR_FORMAT_PRINTF(__vprintf_modular, 1, 0) int vprintf(const char *__restrict, va_list) __NOEXCEPT;

int vscanf(const char *__restrict, va_list) __NOEXCEPT;

_LIBC_MODULAR_FORMAT_PRINTF(__vsnprintf_modular, 3, 0) int vsnprintf(char *__restrict, size_t, const char *__restrict, va_list) __NOEXCEPT;

_LIBC_MODULAR_FORMAT_PRINTF(__vsprintf_modular, 2, 0) int vsprintf(char *__restrict, const char *__restrict, va_list) __NOEXCEPT;

int vsscanf(const char *__restrict, const char *__restrict, va_list) __NOEXCEPT;

extern FILE * stderr;
extern FILE * stdin;
extern FILE * stdout;

__END_C_DECLS

#if defined(__cplusplus) && !defined(__clang__)
#include "__gcc-compat/stdio.h"
#endif

#endif // _LLVM_LIBC_STDIO_H
