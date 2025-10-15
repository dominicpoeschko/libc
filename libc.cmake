set(LIBC_SOURCE_FILES
    # src/__support/CPP/new.cpp
    # src/__support/File/dir.cpp
    # src/__support/File/file.cpp
    # src/__support/File/linux/dir.cpp
    # src/__support/File/linux/file.cpp
    # src/__support/File/linux/stderr.cpp
    # src/__support/File/linux/stdin.cpp
    # src/__support/File/linux/stdout.cpp
    # src/__support/GPU/allocator.cpp
    # src/__support/OSUtil/baremetal/exit.cpp
    # src/__support/OSUtil/baremetal/io.cpp
    # src/__support/OSUtil/gpu/exit.cpp
    # src/__support/OSUtil/gpu/io.cpp
    # src/__support/OSUtil/linux/exit.cpp
    # src/__support/OSUtil/linux/fcntl.cpp
    # src/__support/OSUtil/linux/vdso.cpp
    # src/__support/OSUtil/uefi/exit.cpp
    # src/__support/OSUtil/uefi/io.cpp
    # src/__support/OSUtil/windows/exit.cpp
    # src/__support/OSUtil/windows/io.cpp
    # src/__support/RPC/rpc_client.cpp
    # src/__support/StringUtil/error_to_string.cpp
    # src/__support/StringUtil/signal_to_string.cpp
    # src/__support/freelist.cpp
    # src/__support/freelist_heap.cpp
    # src/__support/freetrie.cpp
    # src/__support/threads/fork_callbacks.cpp
    # src/__support/threads/linux/CndVar.cpp
    # src/__support/threads/linux/callonce.cpp
    # src/__support/threads/linux/thread.cpp
    # src/__support/threads/thread.cpp
    # src/__support/time/gpu/clock_gettime.cpp
    # src/__support/time/gpu/time_utils.cpp
    # src/__support/time/linux/clock_gettime.cpp
    # src/__support/time/windows/clock_gettime.cpp
    # src/__support/wchar/character_converter.cpp
    # src/__support/wchar/mbrtowc.cpp
    # src/__support/wchar/wcrtomb.cpp
    # src/arpa/inet/htonl.cpp
    # src/arpa/inet/htons.cpp
    # src/arpa/inet/ntohl.cpp
    # src/arpa/inet/ntohs.cpp
    # src/assert/generic/__assert_fail.cpp
    # src/assert/gpu/__assert_fail.cpp
    # src/compiler/generic/__stack_chk_fail.cpp
    # src/complex/generic/cimag.cpp
    # src/complex/generic/cimagf.cpp
    # src/complex/generic/cimagf128.cpp
    # src/complex/generic/cimagf16.cpp
    # src/complex/generic/cimagl.cpp
    # src/complex/generic/conj.cpp
    # src/complex/generic/conjf.cpp
    # src/complex/generic/conjf128.cpp
    # src/complex/generic/conjf16.cpp
    # src/complex/generic/conjl.cpp
    # src/complex/generic/cproj.cpp
    # src/complex/generic/cprojf.cpp
    # src/complex/generic/cprojf128.cpp
    # src/complex/generic/cprojf16.cpp
    # src/complex/generic/cprojl.cpp
    # src/complex/generic/creal.cpp
    # src/complex/generic/crealf.cpp
    # src/complex/generic/crealf128.cpp
    # src/complex/generic/crealf16.cpp
    # src/complex/generic/creall.cpp
    src/ctype/isalnum.cpp
    # src/ctype/isalnum_l.cpp
    src/ctype/isalpha.cpp
    # src/ctype/isalpha_l.cpp
    src/ctype/isascii.cpp
    src/ctype/isblank.cpp
    # src/ctype/isblank_l.cpp
    src/ctype/iscntrl.cpp
    # src/ctype/iscntrl_l.cpp
    src/ctype/isdigit.cpp
    # src/ctype/isdigit_l.cpp
    src/ctype/isgraph.cpp
    # src/ctype/isgraph_l.cpp
    src/ctype/islower.cpp
    # src/ctype/islower_l.cpp
    src/ctype/isprint.cpp
    # src/ctype/isprint_l.cpp
    src/ctype/ispunct.cpp
    # src/ctype/ispunct_l.cpp
    src/ctype/isspace.cpp
    # src/ctype/isspace_l.cpp
    src/ctype/isupper.cpp
    # src/ctype/isupper_l.cpp
    src/ctype/isxdigit.cpp
    # src/ctype/isxdigit_l.cpp
    src/ctype/toascii.cpp
    src/ctype/tolower.cpp
    # src/ctype/tolower_l.cpp
    src/ctype/toupper.cpp
    # src/ctype/toupper_l.cpp
    # src/dirent/closedir.cpp
    # src/dirent/dirfd.cpp
    # src/dirent/opendir.cpp
    # src/dirent/readdir.cpp
    # src/dlfcn/dlclose.cpp
    # src/dlfcn/dlerror.cpp
    # src/dlfcn/dlopen.cpp
    # src/dlfcn/dlsym.cpp
    # src/errno/libc_errno.cpp
    # src/fcntl/linux/creat.cpp
    # src/fcntl/linux/fcntl.cpp
    # src/fcntl/linux/open.cpp
    # src/fcntl/linux/openat.cpp
    # src/fenv/feclearexcept.cpp
    # src/fenv/fedisableexcept.cpp
    # src/fenv/feenableexcept.cpp
    # src/fenv/fegetenv.cpp
    # src/fenv/fegetexcept.cpp
    # src/fenv/fegetexceptflag.cpp
    # src/fenv/fegetround.cpp
    # src/fenv/feholdexcept.cpp
    # src/fenv/feraiseexcept.cpp
    # src/fenv/fesetenv.cpp
    # src/fenv/fesetexcept.cpp
    # src/fenv/fesetexceptflag.cpp
    # src/fenv/fesetround.cpp
    # src/fenv/fetestexcept.cpp
    # src/fenv/fetestexceptflag.cpp
    # src/fenv/feupdateenv.cpp
    src/inttypes/imaxabs.cpp
    src/inttypes/imaxdiv.cpp
    src/inttypes/strtoimax.cpp
    src/inttypes/strtoumax.cpp
    # src/link/dl_iterate_phdr.cpp
    # src/locale/duplocale.cpp
    # src/locale/freelocale.cpp
    # src/locale/locale.cpp
    # src/locale/localeconv.cpp
    # src/locale/newlocale.cpp
    # src/locale/setlocale.cpp
    # src/locale/uselocale.cpp
    # src/math/amdgpu/ceil.cpp
    # src/math/amdgpu/ceilf.cpp
    # src/math/amdgpu/copysign.cpp
    # src/math/amdgpu/copysignf.cpp
    # src/math/amdgpu/fabs.cpp
    # src/math/amdgpu/fabsf.cpp
    # src/math/amdgpu/floor.cpp
    # src/math/amdgpu/floorf.cpp
    # src/math/amdgpu/fma.cpp
    # src/math/amdgpu/fmaf.cpp
    # src/math/amdgpu/fmax.cpp
    # src/math/amdgpu/fmaxf.cpp
    # src/math/amdgpu/fmin.cpp
    # src/math/amdgpu/fminf.cpp
    # src/math/amdgpu/fmod.cpp
    # src/math/amdgpu/fmodf.cpp
    # src/math/amdgpu/frexp.cpp
    # src/math/amdgpu/frexpf.cpp
    # src/math/amdgpu/ldexp.cpp
    # src/math/amdgpu/ldexpf.cpp
    # src/math/amdgpu/lgamma.cpp
    # src/math/amdgpu/lgamma_r.cpp
    # src/math/amdgpu/llrint.cpp
    # src/math/amdgpu/llrintf.cpp
    # src/math/amdgpu/lrint.cpp
    # src/math/amdgpu/lrintf.cpp
    # src/math/amdgpu/nearbyint.cpp
    # src/math/amdgpu/nearbyintf.cpp
    # src/math/amdgpu/remainder.cpp
    # src/math/amdgpu/remainderf.cpp
    # src/math/amdgpu/rint.cpp
    # src/math/amdgpu/rintf.cpp
    # src/math/amdgpu/round.cpp
    # src/math/amdgpu/roundf.cpp
    # src/math/amdgpu/scalbn.cpp
    # src/math/amdgpu/scalbnf.cpp
    # src/math/amdgpu/sqrt.cpp
    # src/math/amdgpu/sqrtf.cpp
    # src/math/amdgpu/tgamma.cpp
    # src/math/amdgpu/tgammaf.cpp
    # src/math/amdgpu/trunc.cpp
    # src/math/amdgpu/truncf.cpp
    src/math/generic/acos.cpp
    src/math/generic/acosf.cpp
    # src/math/generic/acosf16.cpp
    src/math/generic/acoshf.cpp
    # src/math/generic/acoshf16.cpp
    # src/math/generic/acospif16.cpp
    src/math/generic/asin.cpp
    src/math/generic/asinf.cpp
    # src/math/generic/asinf16.cpp
    src/math/generic/asinhf.cpp
    # src/math/generic/asinhf16.cpp
    src/math/generic/atan.cpp
    src/math/generic/atan2.cpp
    src/math/generic/atan2f.cpp
    # src/math/generic/atan2f128.cpp
    # src/math/generic/atan2l.cpp
    src/math/generic/atanf.cpp
    # src/math/generic/atanf16.cpp
    src/math/generic/atanhf.cpp
    # src/math/generic/atanhf16.cpp
    src/math/generic/canonicalize.cpp
    src/math/generic/canonicalizef.cpp
    # src/math/generic/canonicalizef128.cpp
    # src/math/generic/canonicalizef16.cpp
    # src/math/generic/canonicalizel.cpp
    src/math/generic/cbrt.cpp
    src/math/generic/cbrtf.cpp
    src/math/generic/ceil.cpp
    src/math/generic/ceilf.cpp
    # src/math/generic/ceilf128.cpp
    # src/math/generic/ceilf16.cpp
    # src/math/generic/ceill.cpp
    src/math/generic/common_constants.cpp
    src/math/generic/copysign.cpp
    src/math/generic/copysignf.cpp
    # src/math/generic/copysignf128.cpp
    # src/math/generic/copysignf16.cpp
    # src/math/generic/copysignl.cpp
    src/math/generic/cos.cpp
    src/math/generic/cosf.cpp
    # src/math/generic/cosf16.cpp
    src/math/generic/coshf.cpp
    # src/math/generic/coshf16.cpp
    src/math/generic/cospif.cpp
    # src/math/generic/cospif16.cpp
    # src/math/generic/daddf128.cpp
    src/math/generic/daddl.cpp
    # src/math/generic/ddivf128.cpp
    src/math/generic/ddivl.cpp
    # src/math/generic/dfmaf128.cpp
    src/math/generic/dfmal.cpp
    # src/math/generic/dmulf128.cpp
    src/math/generic/dmull.cpp
    # src/math/generic/dsqrtf128.cpp
    # src/math/generic/dsqrtl.cpp
    # src/math/generic/dsubf128.cpp
    # src/math/generic/dsubl.cpp
    # src/math/generic/erff.cpp
    src/math/generic/exp.cpp
    src/math/generic/exp10.cpp
    src/math/generic/exp10f.cpp
    # src/math/generic/exp10f16.cpp
    src/math/generic/exp10m1f.cpp
    # src/math/generic/exp10m1f16.cpp
    src/math/generic/exp2.cpp
    src/math/generic/exp2f.cpp
    # src/math/generic/exp2f16.cpp
    # src/math/generic/exp2m1f.cpp
    # src/math/generic/exp2m1f16.cpp
    src/math/generic/expf.cpp
    # src/math/generic/expf16.cpp
    src/math/generic/explogxf.cpp
    src/math/generic/expm1.cpp
    src/math/generic/expm1f.cpp
    # src/math/generic/expm1f16.cpp
    # src/math/generic/f16add.cpp
    # src/math/generic/f16addf.cpp
    # src/math/generic/f16addf128.cpp
    # src/math/generic/f16addl.cpp
    # src/math/generic/f16div.cpp
    # src/math/generic/f16divf.cpp
    # src/math/generic/f16divf128.cpp
    # src/math/generic/f16divl.cpp
    # src/math/generic/f16fma.cpp
    # src/math/generic/f16fmaf.cpp
    # src/math/generic/f16fmaf128.cpp
    # src/math/generic/f16fmal.cpp
    # src/math/generic/f16mul.cpp
    # src/math/generic/f16mulf.cpp
    # src/math/generic/f16mulf128.cpp
    # src/math/generic/f16mull.cpp
    # src/math/generic/f16sqrt.cpp
    # src/math/generic/f16sqrtf.cpp
    # src/math/generic/f16sqrtf128.cpp
    # src/math/generic/f16sqrtl.cpp
    # src/math/generic/f16sub.cpp
    # src/math/generic/f16subf.cpp
    # src/math/generic/f16subf128.cpp
    # src/math/generic/f16subl.cpp
    src/math/generic/fabs.cpp
    src/math/generic/fabsf.cpp
    # src/math/generic/fabsf128.cpp
    # src/math/generic/fabsf16.cpp
    # src/math/generic/fabsl.cpp
    src/math/generic/fadd.cpp
    # src/math/generic/faddf128.cpp
    # src/math/generic/faddl.cpp
    src/math/generic/fdim.cpp
    src/math/generic/fdimf.cpp
    # src/math/generic/fdimf128.cpp
    # src/math/generic/fdimf16.cpp
    # src/math/generic/fdiml.cpp
    src/math/generic/fdiv.cpp
    # src/math/generic/fdivf128.cpp
    # src/math/generic/fdivl.cpp
    src/math/generic/ffma.cpp
    # src/math/generic/ffmaf128.cpp
    src/math/generic/ffmal.cpp
    src/math/generic/floor.cpp
    src/math/generic/floorf.cpp
    # src/math/generic/floorf128.cpp
    # src/math/generic/floorf16.cpp
    # src/math/generic/floorl.cpp
    src/math/generic/fma.cpp
    src/math/generic/fmaf.cpp
    # src/math/generic/fmaf16.cpp
    src/math/generic/fmax.cpp
    src/math/generic/fmaxf.cpp
    # src/math/generic/fmaxf128.cpp
    # src/math/generic/fmaxf16.cpp
    src/math/generic/fmaximum.cpp
    src/math/generic/fmaximum_mag.cpp
    src/math/generic/fmaximum_mag_num.cpp
    src/math/generic/fmaximum_mag_numf.cpp
    # src/math/generic/fmaximum_mag_numf128.cpp
    # src/math/generic/fmaximum_mag_numf16.cpp
    # src/math/generic/fmaximum_mag_numl.cpp
    src/math/generic/fmaximum_magf.cpp
    # src/math/generic/fmaximum_magf128.cpp
    # src/math/generic/fmaximum_magf16.cpp
    # src/math/generic/fmaximum_magl.cpp
    src/math/generic/fmaximum_num.cpp
    src/math/generic/fmaximum_numf.cpp
    # src/math/generic/fmaximum_numf128.cpp
    # src/math/generic/fmaximum_numf16.cpp
    # src/math/generic/fmaximum_numl.cpp
    src/math/generic/fmaximumf.cpp
    # src/math/generic/fmaximumf128.cpp
    # src/math/generic/fmaximumf16.cpp
    # src/math/generic/fmaximuml.cpp
    # src/math/generic/fmaxl.cpp
    src/math/generic/fmin.cpp
    src/math/generic/fminf.cpp
    # src/math/generic/fminf128.cpp
    # src/math/generic/fminf16.cpp
    src/math/generic/fminimum.cpp
    src/math/generic/fminimum_mag.cpp
    src/math/generic/fminimum_mag_num.cpp
    src/math/generic/fminimum_mag_numf.cpp
    # src/math/generic/fminimum_mag_numf128.cpp
    # src/math/generic/fminimum_mag_numf16.cpp
    # src/math/generic/fminimum_mag_numl.cpp
    src/math/generic/fminimum_magf.cpp
    # src/math/generic/fminimum_magf128.cpp
    # src/math/generic/fminimum_magf16.cpp
    # src/math/generic/fminimum_magl.cpp
    src/math/generic/fminimum_num.cpp
    src/math/generic/fminimum_numf.cpp
    # src/math/generic/fminimum_numf128.cpp
    # src/math/generic/fminimum_numf16.cpp
    # src/math/generic/fminimum_numl.cpp
    src/math/generic/fminimumf.cpp
    # src/math/generic/fminimumf128.cpp
    # src/math/generic/fminimumf16.cpp
    src/math/generic/fminimuml.cpp
    # src/math/generic/fminl.cpp
    src/math/generic/fmod.cpp
    src/math/generic/fmodf.cpp
    # src/math/generic/fmodf128.cpp
    # src/math/generic/fmodf16.cpp
    # src/math/generic/fmodl.cpp
    src/math/generic/fmul.cpp
    # src/math/generic/fmulf128.cpp
    # src/math/generic/fmull.cpp
    src/math/generic/frexp.cpp
    src/math/generic/frexpf.cpp
    # src/math/generic/frexpf128.cpp
    # src/math/generic/frexpf16.cpp
    # src/math/generic/frexpl.cpp
    src/math/generic/fromfp.cpp
    src/math/generic/fromfpf.cpp
    # src/math/generic/fromfpf128.cpp
    # src/math/generic/fromfpf16.cpp
    # src/math/generic/fromfpl.cpp
    # src/math/generic/fromfpx.cpp
    # src/math/generic/fromfpxf.cpp
    # src/math/generic/fromfpxf128.cpp
    # src/math/generic/fromfpxf16.cpp
    # src/math/generic/fromfpxl.cpp
    src/math/generic/fsqrt.cpp
    # src/math/generic/fsqrtf128.cpp
    # src/math/generic/fsqrtl.cpp
    src/math/generic/fsub.cpp
    # src/math/generic/fsubf128.cpp
    # src/math/generic/fsubl.cpp
    src/math/generic/getpayload.cpp
    src/math/generic/getpayloadf.cpp
    # src/math/generic/getpayloadf128.cpp
    # src/math/generic/getpayloadf16.cpp
    # src/math/generic/getpayloadl.cpp
    src/math/generic/hypot.cpp
    src/math/generic/hypotf.cpp
    # src/math/generic/hypotf16.cpp
    src/math/generic/ilogb.cpp
    src/math/generic/ilogbf.cpp
    # src/math/generic/ilogbf128.cpp
    # src/math/generic/ilogbf16.cpp
    # src/math/generic/ilogbl.cpp
    src/math/generic/inv_trigf_utils.cpp
    src/math/generic/iscanonical.cpp
    src/math/generic/iscanonicalf.cpp
    # src/math/generic/iscanonicalf128.cpp
    # src/math/generic/iscanonicalf16.cpp
    # src/math/generic/iscanonicall.cpp
    src/math/generic/isnan.cpp
    src/math/generic/isnanf.cpp
    # src/math/generic/isnanl.cpp
    src/math/generic/issignaling.cpp
    src/math/generic/issignalingf.cpp
    # src/math/generic/issignalingf128.cpp
    # src/math/generic/issignalingf16.cpp
    # src/math/generic/issignalingl.cpp
    src/math/generic/ldexp.cpp
    src/math/generic/ldexpf.cpp
    # src/math/generic/ldexpf128.cpp
    # src/math/generic/ldexpf16.cpp
    # src/math/generic/ldexpl.cpp
    src/math/generic/llogb.cpp
    src/math/generic/llogbf.cpp
    # src/math/generic/llogbf128.cpp
    # src/math/generic/llogbf16.cpp
    # src/math/generic/llogbl.cpp
    src/math/generic/llrint.cpp
    src/math/generic/llrintf.cpp
    # src/math/generic/llrintf128.cpp
    # src/math/generic/llrintf16.cpp
    # src/math/generic/llrintl.cpp
    src/math/generic/llround.cpp
    src/math/generic/llroundf.cpp
    # src/math/generic/llroundf128.cpp
    # src/math/generic/llroundf16.cpp
    # src/math/generic/llroundl.cpp
    src/math/generic/log.cpp
    src/math/generic/log10.cpp
    src/math/generic/log10f.cpp
    # src/math/generic/log10f16.cpp
    src/math/generic/log1p.cpp
    src/math/generic/log1pf.cpp
    src/math/generic/log2.cpp
    src/math/generic/log2f.cpp
    # src/math/generic/log2f16.cpp
    src/math/generic/logb.cpp
    src/math/generic/logbf.cpp
    # src/math/generic/logbf128.cpp
    # src/math/generic/logbf16.cpp
    # src/math/generic/logbl.cpp
    src/math/generic/logf.cpp
    # src/math/generic/logf16.cpp
    src/math/generic/lrint.cpp
    src/math/generic/lrintf.cpp
    # src/math/generic/lrintf128.cpp
    # src/math/generic/lrintf16.cpp
    # src/math/generic/lrintl.cpp
    src/math/generic/lround.cpp
    src/math/generic/lroundf.cpp
    # src/math/generic/lroundf128.cpp
    # src/math/generic/lroundf16.cpp
    # src/math/generic/lroundl.cpp
    src/math/generic/modf.cpp
    src/math/generic/modff.cpp
    # src/math/generic/modff128.cpp
    # src/math/generic/modff16.cpp
    # src/math/generic/modfl.cpp
    src/math/generic/nan.cpp
    src/math/generic/nanf.cpp
    # src/math/generic/nanf128.cpp
    # src/math/generic/nanf16.cpp
    # src/math/generic/nanl.cpp
    src/math/generic/nearbyint.cpp
    src/math/generic/nearbyintf.cpp
    # src/math/generic/nearbyintf128.cpp
    # src/math/generic/nearbyintf16.cpp
    # src/math/generic/nearbyintl.cpp
    src/math/generic/nextafter.cpp
    src/math/generic/nextafterf.cpp
    # src/math/generic/nextafterf128.cpp
    # src/math/generic/nextafterf16.cpp
    # src/math/generic/nextafterl.cpp
    src/math/generic/nextdown.cpp
    src/math/generic/nextdownf.cpp
    # src/math/generic/nextdownf128.cpp
    # src/math/generic/nextdownf16.cpp
    # src/math/generic/nextdownl.cpp
    src/math/generic/nexttoward.cpp
    src/math/generic/nexttowardf.cpp
    # src/math/generic/nexttowardf16.cpp
    # src/math/generic/nexttowardl.cpp
    src/math/generic/nextup.cpp
    src/math/generic/nextupf.cpp
    # src/math/generic/nextupf128.cpp
    # src/math/generic/nextupf16.cpp
    # src/math/generic/nextupl.cpp
    src/math/generic/pow.cpp
    src/math/generic/powf.cpp
    src/math/generic/remainder.cpp
    src/math/generic/remainderf.cpp
    # src/math/generic/remainderf128.cpp
    # src/math/generic/remainderf16.cpp
    # src/math/generic/remainderl.cpp
    src/math/generic/remquo.cpp
    src/math/generic/remquof.cpp
    # src/math/generic/remquof128.cpp
    # src/math/generic/remquof16.cpp
    # src/math/generic/remquol.cpp
    src/math/generic/rint.cpp
    src/math/generic/rintf.cpp
    # src/math/generic/rintf128.cpp
    # src/math/generic/rintf16.cpp
    # src/math/generic/rintl.cpp
    src/math/generic/round.cpp
    src/math/generic/roundeven.cpp
    src/math/generic/roundevenf.cpp
    # src/math/generic/roundevenf128.cpp
    # src/math/generic/roundevenf16.cpp
    # src/math/generic/roundevenl.cpp
    src/math/generic/roundf.cpp
    # src/math/generic/roundf128.cpp
    # src/math/generic/roundf16.cpp
    # src/math/generic/roundl.cpp
    src/math/generic/scalbln.cpp
    src/math/generic/scalblnf.cpp
    # src/math/generic/scalblnf128.cpp
    # src/math/generic/scalblnf16.cpp
    # src/math/generic/scalblnl.cpp
    src/math/generic/scalbn.cpp
    src/math/generic/scalbnf.cpp
    # src/math/generic/scalbnf128.cpp
    # src/math/generic/scalbnf16.cpp
    # src/math/generic/scalbnl.cpp
    src/math/generic/setpayload.cpp
    src/math/generic/setpayloadf.cpp
    # src/math/generic/setpayloadf128.cpp
    # src/math/generic/setpayloadf16.cpp
    # src/math/generic/setpayloadl.cpp
    src/math/generic/setpayloadsig.cpp
    src/math/generic/setpayloadsigf.cpp
    # src/math/generic/setpayloadsigf128.cpp
    # src/math/generic/setpayloadsigf16.cpp
    # src/math/generic/setpayloadsigl.cpp
    src/math/generic/sin.cpp
    src/math/generic/sincos.cpp
    src/math/generic/sincosf.cpp
    src/math/generic/sinf.cpp
    # src/math/generic/sinf16.cpp
    src/math/generic/sinhf.cpp
    # src/math/generic/sinhf16.cpp
    src/math/generic/sinpif.cpp
    # src/math/generic/sinpif16.cpp
    src/math/generic/sqrt.cpp
    src/math/generic/sqrtf.cpp
    # src/math/generic/sqrtf128.cpp
    # src/math/generic/sqrtf16.cpp
    # src/math/generic/sqrtl.cpp
    src/math/generic/tan.cpp
    src/math/generic/tanf.cpp
    # src/math/generic/tanf16.cpp
    src/math/generic/tanhf.cpp
    # src/math/generic/tanhf16.cpp
    # src/math/generic/tanpif.cpp
    # src/math/generic/tanpif16.cpp
    src/math/generic/totalorder.cpp
    src/math/generic/totalorderf.cpp
    # src/math/generic/totalorderf128.cpp
    # src/math/generic/totalorderf16.cpp
    # src/math/generic/totalorderl.cpp
    src/math/generic/totalordermag.cpp
    src/math/generic/totalordermagf.cpp
    # src/math/generic/totalordermagf128.cpp
    # src/math/generic/totalordermagf16.cpp
    # src/math/generic/totalordermagl.cpp
    src/math/generic/trunc.cpp
    src/math/generic/truncf.cpp
    # src/math/generic/truncf128.cpp
    # src/math/generic/truncf16.cpp
    # src/math/generic/truncl.cpp
    src/math/generic/ufromfp.cpp
    src/math/generic/ufromfpf.cpp
    # src/math/generic/ufromfpf128.cpp
    # src/math/generic/ufromfpf16.cpp
    # src/math/generic/ufromfpl.cpp
    # src/math/generic/ufromfpx.cpp
    # src/math/generic/ufromfpxf.cpp
    # src/math/generic/ufromfpxf128.cpp
    # src/math/generic/ufromfpxf16.cpp
    # src/math/generic/ufromfpxl.cpp
    # src/math/nvptx/ceil.cpp
    # src/math/nvptx/ceilf.cpp
    # src/math/nvptx/copysign.cpp
    # src/math/nvptx/copysignf.cpp
    # src/math/nvptx/fabs.cpp
    # src/math/nvptx/fabsf.cpp
    # src/math/nvptx/floor.cpp
    # src/math/nvptx/floorf.cpp
    # src/math/nvptx/fma.cpp
    # src/math/nvptx/fmaf.cpp
    # src/math/nvptx/fmax.cpp
    # src/math/nvptx/fmaxf.cpp
    # src/math/nvptx/fmin.cpp
    # src/math/nvptx/fminf.cpp
    # src/math/nvptx/fmod.cpp
    # src/math/nvptx/fmodf.cpp
    # src/math/nvptx/lgamma.cpp
    # src/math/nvptx/lgamma_r.cpp
    # src/math/nvptx/llrint.cpp
    # src/math/nvptx/llrintf.cpp
    # src/math/nvptx/lrint.cpp
    # src/math/nvptx/nearbyint.cpp
    # src/math/nvptx/nearbyintf.cpp
    # src/math/nvptx/remainder.cpp
    # src/math/nvptx/remainderf.cpp
    # src/math/nvptx/rint.cpp
    # src/math/nvptx/rintf.cpp
    # src/math/nvptx/round.cpp
    # src/math/nvptx/roundf.cpp
    # src/math/nvptx/sqrt.cpp
    # src/math/nvptx/sqrtf.cpp
    # src/math/nvptx/tgamma.cpp
    # src/math/nvptx/tgammaf.cpp
    # src/math/nvptx/trunc.cpp
    # src/math/nvptx/truncf.cpp
    # src/poll/linux/poll.cpp
    # src/pthread/pthread_atfork.cpp
    # src/pthread/pthread_attr_destroy.cpp
    # src/pthread/pthread_attr_getdetachstate.cpp
    # src/pthread/pthread_attr_getguardsize.cpp
    # src/pthread/pthread_attr_getstack.cpp
    # src/pthread/pthread_attr_getstacksize.cpp
    # src/pthread/pthread_attr_init.cpp
    # src/pthread/pthread_attr_setdetachstate.cpp
    # src/pthread/pthread_attr_setguardsize.cpp
    # src/pthread/pthread_attr_setstack.cpp
    # src/pthread/pthread_attr_setstacksize.cpp
    # src/pthread/pthread_condattr_destroy.cpp
    # src/pthread/pthread_condattr_getclock.cpp
    # src/pthread/pthread_condattr_getpshared.cpp
    # src/pthread/pthread_condattr_init.cpp
    # src/pthread/pthread_condattr_setclock.cpp
    # src/pthread/pthread_condattr_setpshared.cpp
    # src/pthread/pthread_create.cpp
    # src/pthread/pthread_detach.cpp
    # src/pthread/pthread_equal.cpp
    # src/pthread/pthread_exit.cpp
    # src/pthread/pthread_getname_np.cpp
    # src/pthread/pthread_getspecific.cpp
    # src/pthread/pthread_join.cpp
    # src/pthread/pthread_key_create.cpp
    # src/pthread/pthread_key_delete.cpp
    # src/pthread/pthread_mutex_destroy.cpp
    # src/pthread/pthread_mutex_init.cpp
    # src/pthread/pthread_mutex_lock.cpp
    # src/pthread/pthread_mutex_unlock.cpp
    # src/pthread/pthread_mutexattr_destroy.cpp
    # src/pthread/pthread_mutexattr_getpshared.cpp
    # src/pthread/pthread_mutexattr_getrobust.cpp
    # src/pthread/pthread_mutexattr_gettype.cpp
    # src/pthread/pthread_mutexattr_init.cpp
    # src/pthread/pthread_mutexattr_setpshared.cpp
    # src/pthread/pthread_mutexattr_setrobust.cpp
    # src/pthread/pthread_mutexattr_settype.cpp
    # src/pthread/pthread_once.cpp
    # src/pthread/pthread_rwlock_clockrdlock.cpp
    # src/pthread/pthread_rwlock_clockwrlock.cpp
    # src/pthread/pthread_rwlock_destroy.cpp
    # src/pthread/pthread_rwlock_init.cpp
    # src/pthread/pthread_rwlock_rdlock.cpp
    # src/pthread/pthread_rwlock_timedrdlock.cpp
    # src/pthread/pthread_rwlock_timedwrlock.cpp
    # src/pthread/pthread_rwlock_tryrdlock.cpp
    # src/pthread/pthread_rwlock_trywrlock.cpp
    # src/pthread/pthread_rwlock_unlock.cpp
    # src/pthread/pthread_rwlock_wrlock.cpp
    # src/pthread/pthread_rwlockattr_destroy.cpp
    # src/pthread/pthread_rwlockattr_getkind_np.cpp
    # src/pthread/pthread_rwlockattr_getpshared.cpp
    # src/pthread/pthread_rwlockattr_init.cpp
    # src/pthread/pthread_rwlockattr_setkind_np.cpp
    # src/pthread/pthread_rwlockattr_setpshared.cpp
    # src/pthread/pthread_self.cpp
    # src/pthread/pthread_setname_np.cpp
    # src/pthread/pthread_setspecific.cpp
    # src/pthread/pthread_spin_destroy.cpp
    # src/pthread/pthread_spin_init.cpp
    # src/pthread/pthread_spin_lock.cpp
    # src/pthread/pthread_spin_trylock.cpp
    # src/pthread/pthread_spin_unlock.cpp
    # src/sched/linux/sched_get_priority_max.cpp
    # src/sched/linux/sched_get_priority_min.cpp
    # src/sched/linux/sched_getaffinity.cpp
    # src/sched/linux/sched_getcpucount.cpp
    # src/sched/linux/sched_getcpuisset.cpp
    # src/sched/linux/sched_getparam.cpp
    # src/sched/linux/sched_getscheduler.cpp
    # src/sched/linux/sched_rr_get_interval.cpp
    # src/sched/linux/sched_setaffinity.cpp
    # src/sched/linux/sched_setcpuset.cpp
    # src/sched/linux/sched_setcpuzero.cpp
    # src/sched/linux/sched_setparam.cpp
    # src/sched/linux/sched_setscheduler.cpp
    # src/sched/linux/sched_yield.cpp
    # src/search/hcreate.cpp
    # src/search/hcreate_r.cpp
    # src/search/hdestroy.cpp
    # src/search/hdestroy_r.cpp
    # src/search/hsearch.cpp
    # src/search/hsearch/global.cpp
    # src/search/hsearch_r.cpp
    # src/search/insque.cpp
    # src/search/lfind.cpp
    # src/search/lsearch.cpp
    # src/search/remque.cpp
    # src/setjmp/aarch64/longjmp.cpp
    # src/setjmp/aarch64/setjmp.cpp
    # src/setjmp/aarch64/sigsetjmp.cpp
    # src/setjmp/arm/longjmp.cpp
    # src/setjmp/arm/setjmp.cpp
    # src/setjmp/arm/sigsetjmp.cpp
    # src/setjmp/darwin/sigsetjmp_epilogue.cpp
    # src/setjmp/linux/sigsetjmp_epilogue.cpp
    # src/setjmp/riscv/longjmp.cpp
    # src/setjmp/riscv/setjmp.cpp
    # src/setjmp/riscv/sigsetjmp.cpp
    # src/setjmp/siglongjmp.cpp
    # src/setjmp/x86_64/longjmp.cpp
    # src/setjmp/x86_64/setjmp.cpp
    # src/setjmp/x86_64/sigsetjmp.cpp
    # src/signal/linux/__restore.cpp
    # src/signal/linux/kill.cpp
    # src/signal/linux/raise.cpp
    # src/signal/linux/sigaction.cpp
    # src/signal/linux/sigaddset.cpp
    # src/signal/linux/sigaltstack.cpp
    # src/signal/linux/sigdelset.cpp
    # src/signal/linux/sigemptyset.cpp
    # src/signal/linux/sigfillset.cpp
    # src/signal/linux/signal.cpp
    # src/signal/linux/sigprocmask.cpp
    # src/spawn/linux/posix_spawn.cpp
    # src/spawn/posix_spawn_file_actions_addclose.cpp
    # src/spawn/posix_spawn_file_actions_adddup2.cpp
    # src/spawn/posix_spawn_file_actions_addopen.cpp
    # src/spawn/posix_spawn_file_actions_destroy.cpp
    # src/spawn/posix_spawn_file_actions_init.cpp
    # src/stdbit/stdc_bit_ceil_uc.cpp
    # src/stdbit/stdc_bit_ceil_ui.cpp
    # src/stdbit/stdc_bit_ceil_ul.cpp
    # src/stdbit/stdc_bit_ceil_ull.cpp
    # src/stdbit/stdc_bit_ceil_us.cpp
    # src/stdbit/stdc_bit_floor_uc.cpp
    # src/stdbit/stdc_bit_floor_ui.cpp
    # src/stdbit/stdc_bit_floor_ul.cpp
    # src/stdbit/stdc_bit_floor_ull.cpp
    # src/stdbit/stdc_bit_floor_us.cpp
    # src/stdbit/stdc_bit_width_uc.cpp
    # src/stdbit/stdc_bit_width_ui.cpp
    # src/stdbit/stdc_bit_width_ul.cpp
    # src/stdbit/stdc_bit_width_ull.cpp
    # src/stdbit/stdc_bit_width_us.cpp
    # src/stdbit/stdc_count_ones_uc.cpp
    # src/stdbit/stdc_count_ones_ui.cpp
    # src/stdbit/stdc_count_ones_ul.cpp
    # src/stdbit/stdc_count_ones_ull.cpp
    # src/stdbit/stdc_count_ones_us.cpp
    # src/stdbit/stdc_count_zeros_uc.cpp
    # src/stdbit/stdc_count_zeros_ui.cpp
    # src/stdbit/stdc_count_zeros_ul.cpp
    # src/stdbit/stdc_count_zeros_ull.cpp
    # src/stdbit/stdc_count_zeros_us.cpp
    # src/stdbit/stdc_first_leading_one_uc.cpp
    # src/stdbit/stdc_first_leading_one_ui.cpp
    # src/stdbit/stdc_first_leading_one_ul.cpp
    # src/stdbit/stdc_first_leading_one_ull.cpp
    # src/stdbit/stdc_first_leading_one_us.cpp
    # src/stdbit/stdc_first_leading_zero_uc.cpp
    # src/stdbit/stdc_first_leading_zero_ui.cpp
    # src/stdbit/stdc_first_leading_zero_ul.cpp
    # src/stdbit/stdc_first_leading_zero_ull.cpp
    # src/stdbit/stdc_first_leading_zero_us.cpp
    # src/stdbit/stdc_first_trailing_one_uc.cpp
    # src/stdbit/stdc_first_trailing_one_ui.cpp
    # src/stdbit/stdc_first_trailing_one_ul.cpp
    # src/stdbit/stdc_first_trailing_one_ull.cpp
    # src/stdbit/stdc_first_trailing_one_us.cpp
    # src/stdbit/stdc_first_trailing_zero_uc.cpp
    # src/stdbit/stdc_first_trailing_zero_ui.cpp
    # src/stdbit/stdc_first_trailing_zero_ul.cpp
    # src/stdbit/stdc_first_trailing_zero_ull.cpp
    # src/stdbit/stdc_first_trailing_zero_us.cpp
    # src/stdbit/stdc_has_single_bit_uc.cpp
    # src/stdbit/stdc_has_single_bit_ui.cpp
    # src/stdbit/stdc_has_single_bit_ul.cpp
    # src/stdbit/stdc_has_single_bit_ull.cpp
    # src/stdbit/stdc_has_single_bit_us.cpp
    # src/stdbit/stdc_leading_ones_uc.cpp
    # src/stdbit/stdc_leading_ones_ui.cpp
    # src/stdbit/stdc_leading_ones_ul.cpp
    # src/stdbit/stdc_leading_ones_ull.cpp
    # src/stdbit/stdc_leading_ones_us.cpp
    # src/stdbit/stdc_leading_zeros_uc.cpp
    # src/stdbit/stdc_leading_zeros_ui.cpp
    # src/stdbit/stdc_leading_zeros_ul.cpp
    # src/stdbit/stdc_leading_zeros_ull.cpp
    # src/stdbit/stdc_leading_zeros_us.cpp
    # src/stdbit/stdc_trailing_ones_uc.cpp
    # src/stdbit/stdc_trailing_ones_ui.cpp
    # src/stdbit/stdc_trailing_ones_ul.cpp
    # src/stdbit/stdc_trailing_ones_ull.cpp
    # src/stdbit/stdc_trailing_ones_us.cpp
    # src/stdbit/stdc_trailing_zeros_uc.cpp
    # src/stdbit/stdc_trailing_zeros_ui.cpp
    # src/stdbit/stdc_trailing_zeros_ul.cpp
    # src/stdbit/stdc_trailing_zeros_ull.cpp
    # src/stdbit/stdc_trailing_zeros_us.cpp
    # src/stdfix/abshk.cpp
    # src/stdfix/abshr.cpp
    # src/stdfix/absk.cpp
    # src/stdfix/abslk.cpp
    # src/stdfix/abslr.cpp
    # src/stdfix/absr.cpp
    # src/stdfix/bitshk.cpp
    # src/stdfix/bitshr.cpp
    # src/stdfix/bitsk.cpp
    # src/stdfix/bitslk.cpp
    # src/stdfix/bitslr.cpp
    # src/stdfix/bitsr.cpp
    # src/stdfix/bitsuhk.cpp
    # src/stdfix/bitsuhr.cpp
    # src/stdfix/bitsuk.cpp
    # src/stdfix/bitsulk.cpp
    # src/stdfix/bitsulr.cpp
    # src/stdfix/bitsur.cpp
    # src/stdfix/bitusk.cpp
    # src/stdfix/countlshk.cpp
    # src/stdfix/countlshr.cpp
    # src/stdfix/countlsk.cpp
    # src/stdfix/countlslk.cpp
    # src/stdfix/countlslr.cpp
    # src/stdfix/countlsr.cpp
    # src/stdfix/countlsuhk.cpp
    # src/stdfix/countlsuhr.cpp
    # src/stdfix/countlsuk.cpp
    # src/stdfix/countlsulk.cpp
    # src/stdfix/countlsulr.cpp
    # src/stdfix/countlsur.cpp
    # src/stdfix/exphk.cpp
    # src/stdfix/expk.cpp
    # src/stdfix/hkbits.cpp
    # src/stdfix/hrbits.cpp
    # src/stdfix/idivk.cpp
    # src/stdfix/idivlk.cpp
    # src/stdfix/idivlr.cpp
    # src/stdfix/idivr.cpp
    # src/stdfix/idivuk.cpp
    # src/stdfix/idivulk.cpp
    # src/stdfix/idivulr.cpp
    # src/stdfix/idivur.cpp
    # src/stdfix/kbits.cpp
    # src/stdfix/lkbits.cpp
    # src/stdfix/lrbits.cpp
    # src/stdfix/rbits.cpp
    # src/stdfix/roundhk.cpp
    # src/stdfix/roundhr.cpp
    # src/stdfix/roundk.cpp
    # src/stdfix/roundlk.cpp
    # src/stdfix/roundlr.cpp
    # src/stdfix/roundr.cpp
    # src/stdfix/rounduhk.cpp
    # src/stdfix/rounduhr.cpp
    # src/stdfix/rounduk.cpp
    # src/stdfix/roundulk.cpp
    # src/stdfix/roundulr.cpp
    # src/stdfix/roundur.cpp
    # src/stdfix/sqrtuhk.cpp
    # src/stdfix/sqrtuhr.cpp
    # src/stdfix/sqrtuk.cpp
    # src/stdfix/sqrtulr.cpp
    # src/stdfix/sqrtur.cpp
    # src/stdfix/uhkbits.cpp
    # src/stdfix/uhksqrtus.cpp
    # src/stdfix/uhrbits.cpp
    # src/stdfix/ukbits.cpp
    # src/stdfix/uksqrtui.cpp
    # src/stdfix/ulkbits.cpp
    # src/stdfix/ulrbits.cpp
    # src/stdfix/urbits.cpp
    # src/stdio/asprintf.cpp
    # src/stdio/baremetal/getchar.cpp
    # src/stdio/baremetal/printf.cpp
    # src/stdio/baremetal/putchar.cpp
    # src/stdio/baremetal/puts.cpp
    # src/stdio/baremetal/remove.cpp
    # src/stdio/baremetal/scanf.cpp
    # src/stdio/baremetal/vprintf.cpp
    # src/stdio/baremetal/vscanf.cpp
    # src/stdio/flockfile.cpp
    # src/stdio/fopencookie.cpp
    # src/stdio/funlockfile.cpp
    # src/stdio/generic/clearerr.cpp
    # src/stdio/generic/clearerr_unlocked.cpp
    # src/stdio/generic/fclose.cpp
    # src/stdio/generic/feof.cpp
    # src/stdio/generic/feof_unlocked.cpp
    # src/stdio/generic/ferror.cpp
    # src/stdio/generic/ferror_unlocked.cpp
    # src/stdio/generic/fflush.cpp
    # src/stdio/generic/fgetc.cpp
    # src/stdio/generic/fgetc_unlocked.cpp
    # src/stdio/generic/fgets.cpp
    # src/stdio/generic/fileno.cpp
    # src/stdio/generic/fopen.cpp
    # src/stdio/generic/fprintf.cpp
    # src/stdio/generic/fputc.cpp
    # src/stdio/generic/fputs.cpp
    # src/stdio/generic/fread.cpp
    # src/stdio/generic/fread_unlocked.cpp
    # src/stdio/generic/fscanf.cpp
    # src/stdio/generic/fseek.cpp
    # src/stdio/generic/fseeko.cpp
    # src/stdio/generic/ftell.cpp
    # src/stdio/generic/ftello.cpp
    # src/stdio/generic/fwrite.cpp
    # src/stdio/generic/fwrite_unlocked.cpp
    # src/stdio/generic/getc.cpp
    # src/stdio/generic/getc_unlocked.cpp
    # src/stdio/generic/getchar.cpp
    # src/stdio/generic/getchar_unlocked.cpp
    # src/stdio/generic/perror.cpp
    # src/stdio/generic/printf.cpp
    # src/stdio/generic/putc.cpp
    # src/stdio/generic/putchar.cpp
    # src/stdio/generic/puts.cpp
    # src/stdio/generic/scanf.cpp
    # src/stdio/generic/stderr.cpp
    # src/stdio/generic/stdin.cpp
    # src/stdio/generic/stdout.cpp
    # src/stdio/generic/ungetc.cpp
    # src/stdio/generic/vfprintf.cpp
    # src/stdio/generic/vfscanf.cpp
    # src/stdio/generic/vprintf.cpp
    # src/stdio/generic/vscanf.cpp
    # src/stdio/gpu/clearerr.cpp
    # src/stdio/gpu/fclose.cpp
    # src/stdio/gpu/feof.cpp
    # src/stdio/gpu/ferror.cpp
    # src/stdio/gpu/fflush.cpp
    # src/stdio/gpu/fgetc.cpp
    # src/stdio/gpu/fgets.cpp
    # src/stdio/gpu/fopen.cpp
    # src/stdio/gpu/fprintf.cpp
    # src/stdio/gpu/fputc.cpp
    # src/stdio/gpu/fputs.cpp
    # src/stdio/gpu/fread.cpp
    # src/stdio/gpu/fseek.cpp
    # src/stdio/gpu/ftell.cpp
    # src/stdio/gpu/fwrite.cpp
    # src/stdio/gpu/getc.cpp
    # src/stdio/gpu/getchar.cpp
    # src/stdio/gpu/printf.cpp
    # src/stdio/gpu/putc.cpp
    # src/stdio/gpu/putchar.cpp
    # src/stdio/gpu/puts.cpp
    # src/stdio/gpu/remove.cpp
    # src/stdio/gpu/rename.cpp
    # src/stdio/gpu/stderr.cpp
    # src/stdio/gpu/stdin.cpp
    # src/stdio/gpu/stdout.cpp
    # src/stdio/gpu/ungetc.cpp
    # src/stdio/gpu/vfprintf.cpp
    # src/stdio/gpu/vprintf.cpp
    # src/stdio/linux/fdopen.cpp
    # src/stdio/linux/remove.cpp
    # src/stdio/linux/rename.cpp
    # src/stdio/setbuf.cpp
    # src/stdio/setvbuf.cpp
    # src/stdio/snprintf.cpp
    # src/stdio/sprintf.cpp
    # src/stdio/sscanf.cpp
    # src/stdio/vasprintf.cpp
    # src/stdio/vsnprintf.cpp
    # src/stdio/vsprintf.cpp
    # src/stdio/vsscanf.cpp
    # src/stdlib/_Exit.cpp
    # src/stdlib/a64l.cpp
    # src/stdlib/abs.cpp
    # src/stdlib/at_quick_exit.cpp
    # src/stdlib/atexit.cpp
    # src/stdlib/atof.cpp
    # src/stdlib/atoi.cpp
    # src/stdlib/atol.cpp
    # src/stdlib/atoll.cpp
    # src/stdlib/baremetal/abort.cpp
    # src/stdlib/baremetal/aligned_alloc.cpp
    # src/stdlib/baremetal/calloc.cpp
    # src/stdlib/baremetal/free.cpp
    # src/stdlib/baremetal/malloc.cpp
    # src/stdlib/baremetal/realloc.cpp
    # src/stdlib/bsearch.cpp
    # src/stdlib/div.cpp
    # src/stdlib/exit.cpp
    # src/stdlib/getenv.cpp
    # src/stdlib/gpu/abort.cpp
    # src/stdlib/gpu/aligned_alloc.cpp
    # src/stdlib/gpu/calloc.cpp
    # src/stdlib/gpu/free.cpp
    # src/stdlib/gpu/malloc.cpp
    # src/stdlib/gpu/realloc.cpp
    # src/stdlib/gpu/system.cpp
    # src/stdlib/l64a.cpp
    # src/stdlib/labs.cpp
    # src/stdlib/ldiv.cpp
    # src/stdlib/linux/abort.cpp
    # src/stdlib/llabs.cpp
    # src/stdlib/lldiv.cpp
    # src/stdlib/memalignment.cpp
    # src/stdlib/qsort.cpp
    # src/stdlib/qsort_r.cpp
    # src/stdlib/quick_exit.cpp
    # src/stdlib/rand.cpp
    # src/stdlib/rand_util.cpp
    # src/stdlib/srand.cpp
    # src/stdlib/strfromd.cpp
    # src/stdlib/strfromf.cpp
    # src/stdlib/strfroml.cpp
    # src/stdlib/strtod.cpp
    # src/stdlib/strtod_l.cpp
    # src/stdlib/strtof.cpp
    # src/stdlib/strtof_l.cpp
    # src/stdlib/strtol.cpp
    # src/stdlib/strtol_l.cpp
    # src/stdlib/strtold.cpp
    # src/stdlib/strtold_l.cpp
    # src/stdlib/strtoll.cpp
    # src/stdlib/strtoll_l.cpp
    # src/stdlib/strtoul.cpp
    # src/stdlib/strtoul_l.cpp
    # src/stdlib/strtoull.cpp
    # src/stdlib/strtoull_l.cpp
    src/string/memccpy.cpp
    src/string/memchr.cpp
    src/string/memcmp.cpp
    src/string/memcpy.cpp
    src/string/memmem.cpp
    src/string/memmove.cpp
    src/string/mempcpy.cpp
    src/string/memrchr.cpp
    src/string/memset.cpp
    src/string/memset_explicit.cpp
    src/string/stpcpy.cpp
    src/string/stpncpy.cpp
    src/string/strcasestr.cpp
    src/string/strcat.cpp
    src/string/strchr.cpp
    src/string/strchrnul.cpp
    src/string/strcmp.cpp
    src/string/strcoll.cpp
    src/string/strcoll_l.cpp
    src/string/strcpy.cpp
    src/string/strcspn.cpp
    src/string/strdup.cpp
    # src/string/strerror.cpp
    # src/string/strerror_r.cpp
    src/string/strlcat.cpp
    src/string/strlcpy.cpp
    src/string/strlen.cpp
    src/string/strncat.cpp
    src/string/strncmp.cpp
    src/string/strncpy.cpp
    src/string/strndup.cpp
    src/string/strnlen.cpp
    src/string/strpbrk.cpp
    src/string/strrchr.cpp
    src/string/strsep.cpp
    src/string/strsignal.cpp
    src/string/strspn.cpp
    src/string/strstr.cpp
    src/string/strtok.cpp
    src/string/strtok_r.cpp
    src/string/strxfrm.cpp
    src/string/strxfrm_l.cpp
    src/strings/bcmp.cpp
    src/strings/bcopy.cpp
    src/strings/bzero.cpp
    src/strings/ffs.cpp
    src/strings/ffsl.cpp
    src/strings/ffsll.cpp
    src/strings/index.cpp
    src/strings/rindex.cpp
    src/strings/strcasecmp.cpp
    # src/strings/strcasecmp_l.cpp
    src/strings/strncasecmp.cpp
    # src/strings/strncasecmp_l.cpp
    # src/sys/auxv/linux/getauxval.cpp
    # src/sys/epoll/linux/epoll_create.cpp
    # src/sys/epoll/linux/epoll_create1.cpp
    # src/sys/epoll/linux/epoll_ctl.cpp
    # src/sys/epoll/linux/epoll_pwait.cpp
    # src/sys/epoll/linux/epoll_pwait2.cpp
    # src/sys/epoll/linux/epoll_wait.cpp
    # src/sys/ioctl/linux/ioctl.cpp
    # src/sys/mman/linux/madvise.cpp
    # src/sys/mman/linux/mincore.cpp
    # src/sys/mman/linux/mlock.cpp
    # src/sys/mman/linux/mlock2.cpp
    # src/sys/mman/linux/mlockall.cpp
    # src/sys/mman/linux/mmap.cpp
    # src/sys/mman/linux/mprotect.cpp
    # src/sys/mman/linux/mremap.cpp
    # src/sys/mman/linux/msync.cpp
    # src/sys/mman/linux/munlock.cpp
    # src/sys/mman/linux/munlockall.cpp
    # src/sys/mman/linux/munmap.cpp
    # src/sys/mman/linux/posix_madvise.cpp
    # src/sys/mman/linux/remap_file_pages.cpp
    # src/sys/mman/linux/shm_open.cpp
    # src/sys/mman/linux/shm_unlink.cpp
    # src/sys/prctl/linux/prctl.cpp
    # src/sys/random/linux/getrandom.cpp
    # src/sys/resource/linux/getrlimit.cpp
    # src/sys/resource/linux/setrlimit.cpp
    # src/sys/select/linux/select.cpp
    # src/sys/sendfile/linux/sendfile.cpp
    # src/sys/socket/linux/bind.cpp
    # src/sys/socket/linux/recv.cpp
    # src/sys/socket/linux/recvfrom.cpp
    # src/sys/socket/linux/recvmsg.cpp
    # src/sys/socket/linux/send.cpp
    # src/sys/socket/linux/sendmsg.cpp
    # src/sys/socket/linux/sendto.cpp
    # src/sys/socket/linux/socket.cpp
    # src/sys/socket/linux/socketpair.cpp
    # src/sys/stat/linux/chmod.cpp
    # src/sys/stat/linux/fchmod.cpp
    # src/sys/stat/linux/fchmodat.cpp
    # src/sys/stat/linux/fstat.cpp
    # src/sys/stat/linux/lstat.cpp
    # src/sys/stat/linux/mkdir.cpp
    # src/sys/stat/linux/mkdirat.cpp
    # src/sys/stat/linux/stat.cpp
    # src/sys/statvfs/linux/fstatvfs.cpp
    # src/sys/statvfs/linux/statvfs.cpp
    # src/sys/time/linux/getitimer.cpp
    # src/sys/time/linux/setitimer.cpp
    # src/sys/time/linux/utimes.cpp
    # src/sys/uio/linux/readv.cpp
    # src/sys/uio/linux/writev.cpp
    # src/sys/utsname/linux/uname.cpp
    # src/sys/wait/linux/wait.cpp
    # src/sys/wait/linux/wait4.cpp
    # src/sys/wait/linux/waitpid.cpp
    # src/termios/linux/cfgetispeed.cpp
    # src/termios/linux/cfgetospeed.cpp
    # src/termios/linux/cfsetispeed.cpp
    # src/termios/linux/cfsetospeed.cpp
    # src/termios/linux/tcdrain.cpp
    # src/termios/linux/tcflow.cpp
    # src/termios/linux/tcflush.cpp
    # src/termios/linux/tcgetattr.cpp
    # src/termios/linux/tcgetsid.cpp
    # src/termios/linux/tcsendbreak.cpp
    # src/termios/linux/tcsetattr.cpp
    # src/threads/call_once.cpp
    # src/threads/linux/cnd_broadcast.cpp
    # src/threads/linux/cnd_destroy.cpp
    # src/threads/linux/cnd_init.cpp
    # src/threads/linux/cnd_signal.cpp
    # src/threads/linux/cnd_wait.cpp
    # src/threads/mtx_destroy.cpp
    # src/threads/mtx_init.cpp
    # src/threads/mtx_lock.cpp
    # src/threads/mtx_unlock.cpp
    # src/threads/thrd_create.cpp
    # src/threads/thrd_current.cpp
    # src/threads/thrd_detach.cpp
    # src/threads/thrd_equal.cpp
    # src/threads/thrd_exit.cpp
    # src/threads/thrd_join.cpp
    # src/threads/tss_create.cpp
    # src/threads/tss_delete.cpp
    # src/threads/tss_get.cpp
    # src/threads/tss_set.cpp
    # src/time/asctime.cpp
    # src/time/asctime_r.cpp
    # src/time/baremetal/clock.cpp
    # src/time/baremetal/timespec_get.cpp
    # src/time/ctime.cpp
    # src/time/ctime_r.cpp
    # src/time/difftime.cpp
    # src/time/gmtime.cpp
    # src/time/gmtime_r.cpp
    # src/time/gpu/clock.cpp
    # src/time/gpu/clock_gettime.cpp
    # src/time/gpu/nanosleep.cpp
    # src/time/gpu/timespec_get.cpp
    # src/time/linux/clock.cpp
    # src/time/linux/clock_gettime.cpp
    # src/time/linux/gettimeofday.cpp
    # src/time/linux/nanosleep.cpp
    # src/time/linux/timespec_get.cpp
    # src/time/mktime.cpp
    # src/time/strftime.cpp
    # src/time/strftime_l.cpp
    # src/time/time.cpp
    # src/time/time_utils.cpp
    # src/time/windows/clock_getres.cpp
    # src/unistd/_exit.cpp
    # src/unistd/environ.cpp
    # src/unistd/getopt.cpp
    # src/unistd/gettid.cpp
    # src/unistd/linux/access.cpp
    # src/unistd/linux/chdir.cpp
    # src/unistd/linux/close.cpp
    # src/unistd/linux/dup.cpp
    # src/unistd/linux/dup2.cpp
    # src/unistd/linux/dup3.cpp
    # src/unistd/linux/execv.cpp
    # src/unistd/linux/execve.cpp
    # src/unistd/linux/fchdir.cpp
    # src/unistd/linux/fork.cpp
    # src/unistd/linux/fpathconf.cpp
    # src/unistd/linux/fsync.cpp
    # src/unistd/linux/ftruncate.cpp
    # src/unistd/linux/getcwd.cpp
    # src/unistd/linux/getentropy.cpp
    # src/unistd/linux/geteuid.cpp
    # src/unistd/linux/getpid.cpp
    # src/unistd/linux/getppid.cpp
    # src/unistd/linux/getsid.cpp
    # src/unistd/linux/getuid.cpp
    # src/unistd/linux/isatty.cpp
    # src/unistd/linux/link.cpp
    # src/unistd/linux/linkat.cpp
    # src/unistd/linux/lseek.cpp
    # src/unistd/linux/pathconf.cpp
    # src/unistd/linux/pathconf_utils.cpp
    # src/unistd/linux/pipe.cpp
    # src/unistd/linux/pipe2.cpp
    # src/unistd/linux/pread.cpp
    # src/unistd/linux/pwrite.cpp
    # src/unistd/linux/read.cpp
    # src/unistd/linux/readlink.cpp
    # src/unistd/linux/readlinkat.cpp
    # src/unistd/linux/rmdir.cpp
    # src/unistd/linux/setsid.cpp
    # src/unistd/linux/symlink.cpp
    # src/unistd/linux/symlinkat.cpp
    # src/unistd/linux/syscall.cpp
    # src/unistd/linux/sysconf.cpp
    # src/unistd/linux/truncate.cpp
    # src/unistd/linux/unlink.cpp
    # src/unistd/linux/unlinkat.cpp
    # src/unistd/linux/write.cpp
    # src/unistd/swab.cpp
    # src/unistd/windows/getentropy.cpp
    # src/wchar/btowc.cpp
    # src/wchar/mbrtowc.cpp
    # src/wchar/mbtowc.cpp
    # src/wchar/wcpcpy.cpp
    # src/wchar/wcpncpy.cpp
    # src/wchar/wcrtomb.cpp
    # src/wchar/wcscat.cpp
    # src/wchar/wcschr.cpp
    # src/wchar/wcscmp.cpp
    # src/wchar/wcscpy.cpp
    # src/wchar/wcscspn.cpp
    # src/wchar/wcslcat.cpp
    # src/wchar/wcslcpy.cpp
    # src/wchar/wcslen.cpp
    # src/wchar/wcsncat.cpp
    # src/wchar/wcsncmp.cpp
    # src/wchar/wcsncpy.cpp
    # src/wchar/wcsnlen.cpp
    # src/wchar/wcspbrk.cpp
    # src/wchar/wcsrchr.cpp
    # src/wchar/wcsspn.cpp
    # src/wchar/wcsstr.cpp
    # src/wchar/wcstok.cpp
    # src/wchar/wcstol.cpp
    # src/wchar/wcstoll.cpp
    # src/wchar/wcstoul.cpp
    # src/wchar/wcstoull.cpp
    # src/wchar/wctob.cpp
    # src/wchar/wctomb.cpp
    # src/wchar/wmemchr.cpp
    # src/wchar/wmemcmp.cpp
    # src/wchar/wmemcpy.cpp
    # src/wchar/wmemmove.cpp
    # src/wchar/wmempcpy.cpp
    # src/wchar/wmemset.cpp
)

set(libc_flags -DLIBC_COPT_PUBLIC_PACKAGING -Wno-sign-conversion -Wno-shadow -Wno-double-promotion)

list(JOIN libc_flags " " LIBC_FLAGS)

list(TRANSFORM LIBC_SOURCE_FILES PREPEND "${CMAKE_CURRENT_LIST_DIR}/")

set_source_files_properties(${LIBC_SOURCE_FILES} PROPERTIES COMPILE_FLAGS "${LIBC_FLAGS}")
