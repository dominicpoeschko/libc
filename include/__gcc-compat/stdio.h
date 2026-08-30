//===-- gcc compatibility declarations for the vendored libc++ ------------===//
//
// libc++ imports the C library into namespace std with
// `using ::name _LIBCPP_USING_IF_EXISTS;`. clang's using_if_exists attribute
// makes a missing name a no-op; gcc has no such attribute, so every name
// libc++ mentions must exist. Declarations only - nothing here is defined,
// so an actual call fails at link. Included from the end of the matching
// llvm-libc header, gcc C++ only.
//
//===----------------------------------------------------------------------===//
#ifndef LLVM_LIBC_GCC_COMPAT_STDIO_H
#define LLVM_LIBC_GCC_COMPAT_STDIO_H

#include "../llvm-libc-types/FILE.h"
#include <stddef.h>
typedef struct {
  long long __pos;   // never read: libc++ only needs the name to exist
} fpos_t;
__BEGIN_C_DECLS
int fclose(FILE *) __NOEXCEPT;
int fflush(FILE *) __NOEXCEPT;
void setbuf(FILE *__restrict, char *__restrict) __NOEXCEPT;
int setvbuf(FILE *__restrict, char *__restrict, int, size_t) __NOEXCEPT;
int getc(FILE *) __NOEXCEPT;
int ungetc(int, FILE *) __NOEXCEPT;
int fgetpos(FILE *__restrict, fpos_t *__restrict) __NOEXCEPT;
int fseek(FILE *, long, int) __NOEXCEPT;
int fsetpos(FILE *, const fpos_t *) __NOEXCEPT;
long ftell(FILE *) __NOEXCEPT;
void rewind(FILE *) __NOEXCEPT;
void clearerr(FILE *) __NOEXCEPT;
void perror(const char *) __NOEXCEPT;
FILE *fopen(const char *__restrict, const char *__restrict) __NOEXCEPT;
FILE *freopen(const char *__restrict, const char *__restrict, FILE *__restrict) __NOEXCEPT;
int rename(const char *, const char *) __NOEXCEPT;
FILE *tmpfile(void) __NOEXCEPT;
char *tmpnam(char *) __NOEXCEPT;
__END_C_DECLS

#endif // LLVM_LIBC_GCC_COMPAT_STDIO_H
