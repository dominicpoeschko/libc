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
#ifndef LLVM_LIBC_GCC_COMPAT_MATH_H
#define LLVM_LIBC_GCC_COMPAT_MATH_H

__BEGIN_C_DECLS
float erfcf(float) __NOEXCEPT;
float lgammaf(float) __NOEXCEPT;
float tgammaf(float) __NOEXCEPT;
long double acosl(long double) __NOEXCEPT;
long double asinl(long double) __NOEXCEPT;
long double atanl(long double) __NOEXCEPT;
long double cosl(long double) __NOEXCEPT;
long double coshl(long double) __NOEXCEPT;
long double expl(long double) __NOEXCEPT;
long double logl(long double) __NOEXCEPT;
long double log10l(long double) __NOEXCEPT;
long double powl(long double, long double) __NOEXCEPT;
long double sinl(long double) __NOEXCEPT;
long double sinhl(long double) __NOEXCEPT;
long double tanl(long double) __NOEXCEPT;
long double tanhl(long double) __NOEXCEPT;
long double acoshl(long double) __NOEXCEPT;
long double asinhl(long double) __NOEXCEPT;
long double atanhl(long double) __NOEXCEPT;
long double cbrtl(long double) __NOEXCEPT;
long double erfl(long double) __NOEXCEPT;
long double erfcl(long double) __NOEXCEPT;
long double exp2l(long double) __NOEXCEPT;
long double expm1l(long double) __NOEXCEPT;
long double fmal(long double, long double, long double) __NOEXCEPT;
long double hypotl(long double, long double) __NOEXCEPT;
long double lgammal(long double) __NOEXCEPT;
long double log1pl(long double) __NOEXCEPT;
long double log2l(long double) __NOEXCEPT;
long double tgammal(long double) __NOEXCEPT;
__END_C_DECLS

#endif // LLVM_LIBC_GCC_COMPAT_MATH_H
