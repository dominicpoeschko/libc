// Kvasir's, not upstream's (llvm_port/kvasir/libc/owned.txt).
//
// memcpy, memmove and memset for Thumb-2 cores (ARMv7-M, ARMv7E-M, ARMv8-M.main: Cortex-M3/M4/M7/
// M33), with the AEABI entry points __aeabi_memcpy/4/8, __aeabi_memmove/4/8, __aeabi_memset/4/8
// and __aeabi_memclr/4/8.
//
// Why assembly, when llvm-libc's C++ is decent on these cores: compiler-rt's __aeabi_mem* are
// forwarders that reach memcpy with one more jump (+2..+5 cycles on every copy a hosted build
// emits), the C++ memmove copies an overlapping range byte by byte (5 cycles a byte), and a
// small copy spends most of its cycles in the prologue. Here: a copy under 16 bytes is a few
// overlapping unaligned loads and stores - everything loaded before anything is stored, so the
// same code serves memmove; from 16 bytes the destination is brought to a word boundary and
// the rest goes in 64-byte runs of single LDR/STR pairs (one cycle each on these cores, which
// is why LDM/STM and the registers they would need are not used - measured: llvm-libc's loop
// of that shape beat an LDM/STM one by 10 %); an overlapping memmove runs the same loops
// backwards; memset stores 64 bytes a turn the same way. Unaligned word access is what the
// architecture allows (SCTLR.UNALIGN_TRP is 0 and Kvasir never sets it).
//
// As llvm-libc built with LIBC_ADD_NULL_CHECKS: a null pointer with a size other than 0 traps.
//
// Checked and measured on the device against every size and alignment.

        .syntax unified
        .arch   armv7-m
        .thumb

// ---------------------------------------------------------------------------------------------
// void* memcpy(void* dst, const void* src, size_t n)
// ---------------------------------------------------------------------------------------------
        .section .text.memcpy, "ax", %progbits
        .p2align 2
        .global memcpy
        .global __aeabi_memcpy
        .global __aeabi_memcpy4
        .global __aeabi_memcpy8
        .type   memcpy, %function
        .type   __aeabi_memcpy, %function
        .type   __aeabi_memcpy4, %function
        .type   __aeabi_memcpy8, %function
        .thumb_func
__aeabi_memcpy:
        .thumb_func
__aeabi_memcpy4:
        .thumb_func
__aeabi_memcpy8:
        .thumb_func
memcpy:
        cmp     r2, #0
        beq     .Lcpy_return
        cmp     r0, #0
        beq     .Lcpy_trap
        cmp     r1, #0
        beq     .Lcpy_trap
        // memmove comes in here when a forward copy is safe (another section, so a hidden global)
        .global __kvasir_memcpy_checked
        .hidden __kvasir_memcpy_checked
        .type   __kvasir_memcpy_checked, %function
        .thumb_func
__kvasir_memcpy_checked:
        cmp     r2, #16
        blo     __kvasir_memcpy_small
        // 16 bytes or more. No register is saved but the return value: on these cores a run of
        // single LDR/STR pairs costs a cycle each, LDM/STM a cycle a register plus one, so the
        // multi-register forms would only pay for the pushes they need. The destination is
        // brought to a word boundary first; the source may stay unaligned, LDR takes it.
        push    {r0}
        rsb     r12, r0, #0
        ands    r12, r12, #3            // bytes to the boundary: bit 0 one byte, bit 1 two
        beq     .Lcpy_aligned
        sub     r2, r2, r12
        lsls    r3, r12, #31            // N = bit 0, C = bit 1
        itt     mi
        ldrbmi  r3, [r1], #1
        strbmi  r3, [r0], #1
        itt     cs
        ldrhcs  r3, [r1], #2
        strhcs  r3, [r0], #2
        // r0 on a word boundary, r2 >= 13
.Lcpy_aligned:
        lsrs    r12, r2, #6
        beq     .Lcpy_below64
.Lcpy_64:
        ldr     r3, [r1, #0]
        str     r3, [r0, #0]
        ldr     r3, [r1, #4]
        str     r3, [r0, #4]
        ldr     r3, [r1, #8]
        str     r3, [r0, #8]
        ldr     r3, [r1, #12]
        str     r3, [r0, #12]
        ldr     r3, [r1, #16]
        str     r3, [r0, #16]
        ldr     r3, [r1, #20]
        str     r3, [r0, #20]
        ldr     r3, [r1, #24]
        str     r3, [r0, #24]
        ldr     r3, [r1, #28]
        str     r3, [r0, #28]
        ldr     r3, [r1, #32]
        str     r3, [r0, #32]
        ldr     r3, [r1, #36]
        str     r3, [r0, #36]
        ldr     r3, [r1, #40]
        str     r3, [r0, #40]
        ldr     r3, [r1, #44]
        str     r3, [r0, #44]
        ldr     r3, [r1, #48]
        str     r3, [r0, #48]
        ldr     r3, [r1, #52]
        str     r3, [r0, #52]
        ldr     r3, [r1, #56]
        str     r3, [r0, #56]
        ldr     r3, [r1, #60]
        str     r3, [r0, #60]
        add     r1, r1, #64
        add     r0, r0, #64
        subs    r12, r12, #1
        bne     .Lcpy_64
.Lcpy_below64:
        ands    r12, r2, #48
        beq     .Lcpy_below16
.Lcpy_16:
        ldr     r3, [r1, #0]
        str     r3, [r0, #0]
        ldr     r3, [r1, #4]
        str     r3, [r0, #4]
        ldr     r3, [r1, #8]
        str     r3, [r0, #8]
        ldr     r3, [r1, #12]
        str     r3, [r0, #12]
        add     r1, r1, #16
        add     r0, r0, #16
        subs    r12, r12, #16
        bne     .Lcpy_16
.Lcpy_below16:
        ands    r12, r2, #12
        beq     .Lcpy_below4
.Lcpy_4:
        ldr     r3, [r1], #4
        str     r3, [r0], #4
        subs    r12, r12, #4
        bne     .Lcpy_4
.Lcpy_below4:
        lsls    r12, r2, #31            // N = bit 0, C = bit 1; ascending: the halfword first
        itt     cs
        ldrhcs  r3, [r1], #2
        strhcs  r3, [r0], #2
        itt     mi
        ldrbmi  r3, [r1]
        strbmi  r3, [r0]
        pop     {r0}
.Lcpy_return:
        bx      lr

        // 1..15 bytes: two overlapping pieces, both loaded before either is stored - so this
        // serves an overlapping memmove in either direction as well. r0 comes back as it was.
        .global __kvasir_memcpy_small
        .hidden __kvasir_memcpy_small
        .type   __kvasir_memcpy_small, %function
        .thumb_func
__kvasir_memcpy_small:
        cmp     r2, #8
        blo     .Lcpy_small_below8
        push    {r4, r5}
        ldr     r3, [r1]
        ldr     r12, [r1, #4]
        add     r1, r1, r2
        ldr     r4, [r1, #-8]
        ldr     r5, [r1, #-4]
        str     r3, [r0]
        str     r12, [r0, #4]
        add     r0, r0, r2
        str     r4, [r0, #-8]
        str     r5, [r0, #-4]
        sub     r0, r0, r2
        pop     {r4, r5}
        bx      lr
.Lcpy_small_below8:
        cmp     r2, #4
        blo     .Lcpy_small_below4
        ldr     r3, [r1]
        add     r1, r1, r2
        ldr     r12, [r1, #-4]
        str     r3, [r0]
        add     r0, r0, r2
        str     r12, [r0, #-4]
        sub     r0, r0, r2
        bx      lr
.Lcpy_small_below4:
        cmp     r2, #2
        blo     .Lcpy_small_1
        ldrh    r3, [r1]
        add     r1, r1, r2
        ldrb    r12, [r1, #-1]
        strh    r3, [r0]
        add     r0, r0, r2
        strb    r12, [r0, #-1]
        sub     r0, r0, r2
        bx      lr
.Lcpy_small_1:
        ldrb    r3, [r1]
        strb    r3, [r0]
        bx      lr

.Lcpy_trap:
        udf     #0xfe
        .size   memcpy, . - memcpy
        .size   __aeabi_memcpy, . - __aeabi_memcpy
        .size   __aeabi_memcpy4, . - __aeabi_memcpy4
        .size   __aeabi_memcpy8, . - __aeabi_memcpy8

// ---------------------------------------------------------------------------------------------
// void* memmove(void* dst, const void* src, size_t n)
// ---------------------------------------------------------------------------------------------
        .section .text.memmove, "ax", %progbits
        .p2align 2
        .global memmove
        .global __aeabi_memmove
        .global __aeabi_memmove4
        .global __aeabi_memmove8
        .type   memmove, %function
        .type   __aeabi_memmove, %function
        .type   __aeabi_memmove4, %function
        .type   __aeabi_memmove8, %function
        .thumb_func
__aeabi_memmove:
        .thumb_func
__aeabi_memmove4:
        .thumb_func
__aeabi_memmove8:
        .thumb_func
memmove:
        cmp     r2, #0
        beq     .Lmove_return
        cmp     r0, #0
        beq     .Lmove_trap
        cmp     r1, #0
        beq     .Lmove_trap
        // a forward copy is safe unless the destination starts inside the source: dst - src < n
        sub     r3, r0, r1
        cmp     r3, r2
        bhs     __kvasir_memcpy_checked
        cmp     r2, #16
        blo     __kvasir_memcpy_small
        // backwards, from the end of both: the same loops with negative offsets, the
        // destination's end brought to a word boundary first
        push    {r0}
        add     r0, r0, r2
        add     r1, r1, r2
        ands    r12, r0, #3             // bytes above the last boundary
        beq     .Lmove_aligned
        sub     r2, r2, r12
        lsls    r3, r12, #31            // N = bit 0, C = bit 1
        itt     mi
        ldrbmi  r3, [r1, #-1]!
        strbmi  r3, [r0, #-1]!
        itt     cs
        ldrhcs  r3, [r1, #-2]!
        strhcs  r3, [r0, #-2]!
.Lmove_aligned:
        // no 64-byte run here: an overlapping move of that size is rare, and its 16-byte run is
        // already five times the old byte loop
.Lmove_below64:
        bics    r12, r2, #15
        beq     .Lmove_below16
.Lmove_16:
        ldr     r3, [r1, #-4]
        str     r3, [r0, #-4]
        ldr     r3, [r1, #-8]
        str     r3, [r0, #-8]
        ldr     r3, [r1, #-12]
        str     r3, [r0, #-12]
        ldr     r3, [r1, #-16]
        str     r3, [r0, #-16]
        sub     r1, r1, #16
        sub     r0, r0, #16
        subs    r12, r12, #16
        bne     .Lmove_16
.Lmove_below16:
        ands    r12, r2, #12
        beq     .Lmove_below4
.Lmove_4:
        ldr     r3, [r1, #-4]!
        str     r3, [r0, #-4]!
        subs    r12, r12, #4
        bne     .Lmove_4
.Lmove_below4:
        lsls    r12, r2, #31            // descending: the halfword (the upper two) first
        itt     cs
        ldrhcs  r3, [r1, #-2]!
        strhcs  r3, [r0, #-2]!
        itt     mi
        ldrbmi  r3, [r1, #-1]
        strbmi  r3, [r0, #-1]
        pop     {r0}
.Lmove_return:
        bx      lr

.Lmove_trap:
        udf     #0xfe
        .size   memmove, . - memmove
        .size   __aeabi_memmove, . - __aeabi_memmove
        .size   __aeabi_memmove4, . - __aeabi_memmove4
        .size   __aeabi_memmove8, . - __aeabi_memmove8

// ---------------------------------------------------------------------------------------------
// void* memset(void* dst, int value, size_t n)
// void __aeabi_memset(void* dst, size_t n, int value)      (the AEABI's own argument order)
// void __aeabi_memclr(void* dst, size_t n)
// ---------------------------------------------------------------------------------------------
        .section .text.memset, "ax", %progbits
        .p2align 2
        .global memset
        .global __aeabi_memset
        .global __aeabi_memset4
        .global __aeabi_memset8
        .global __aeabi_memclr
        .global __aeabi_memclr4
        .global __aeabi_memclr8
        .type   memset, %function
        .type   __aeabi_memset, %function
        .type   __aeabi_memset4, %function
        .type   __aeabi_memset8, %function
        .type   __aeabi_memclr, %function
        .type   __aeabi_memclr4, %function
        .type   __aeabi_memclr8, %function
        .thumb_func
__aeabi_memset:
        .thumb_func
__aeabi_memset4:
        .thumb_func
__aeabi_memset8:
        mov     r3, r1                  // into memset's order: value in r1, n in r2
        mov     r1, r2
        mov     r2, r3
        b       memset
        .thumb_func
__aeabi_memclr:
        .thumb_func
__aeabi_memclr4:
        .thumb_func
__aeabi_memclr8:
        mov     r2, r1
        movs    r1, #0
        .thumb_func
memset:
        cmp     r2, #0
        beq     .Lset_return
        cmp     r0, #0
        beq     .Lset_trap
        uxtb    r1, r1                  // the value's low byte in all four bytes
        orr     r1, r1, r1, lsl #8
        orr     r1, r1, r1, lsl #16
        cmp     r2, #16
        blo     .Lset_small
        mov     r12, r0
        rsb     r3, r0, #0
        ands    r3, r3, #3              // bytes to the boundary: bit 0 one byte, bit 1 two
        beq     .Lset_aligned
        sub     r2, r2, r3
        lsls    r3, r3, #31             // N = bit 0, C = bit 1
        it      mi
        strbmi  r1, [r0], #1
        it      cs
        strhcs  r1, [r0], #2
.Lset_aligned:
        lsrs    r3, r2, #6
        beq     .Lset_below64
.Lset_64:
        str     r1, [r0, #0]
        str     r1, [r0, #4]
        str     r1, [r0, #8]
        str     r1, [r0, #12]
        str     r1, [r0, #16]
        str     r1, [r0, #20]
        str     r1, [r0, #24]
        str     r1, [r0, #28]
        str     r1, [r0, #32]
        str     r1, [r0, #36]
        str     r1, [r0, #40]
        str     r1, [r0, #44]
        str     r1, [r0, #48]
        str     r1, [r0, #52]
        str     r1, [r0, #56]
        str     r1, [r0, #60]
        add     r0, r0, #64
        subs    r3, r3, #1
        bne     .Lset_64
.Lset_below64:
        ands    r3, r2, #48
        beq     .Lset_below16
.Lset_16:
        str     r1, [r0, #0]
        str     r1, [r0, #4]
        str     r1, [r0, #8]
        str     r1, [r0, #12]
        add     r0, r0, #16
        subs    r3, r3, #16
        bne     .Lset_16
.Lset_below16:
        ands    r3, r2, #12
        beq     .Lset_below4
.Lset_4:
        str     r1, [r0], #4
        subs    r3, r3, #4
        bne     .Lset_4
.Lset_below4:
        lsls    r3, r2, #31             // N = bit 0, C = bit 1
        it      cs
        strhcs  r1, [r0], #2
        it      mi
        strbmi  r1, [r0]
        mov     r0, r12
.Lset_return:
        bx      lr

        // 1..15 bytes: two overlapping unaligned stores; r0 comes back as it was
.Lset_small:
        cmp     r2, #8
        blo     .Lset_small_below8
        str     r1, [r0]
        str     r1, [r0, #4]
        add     r0, r0, r2
        str     r1, [r0, #-8]
        str     r1, [r0, #-4]
        sub     r0, r0, r2
        bx      lr
.Lset_small_below8:
        cmp     r2, #4
        blo     .Lset_small_below4
        str     r1, [r0]
        add     r0, r0, r2
        str     r1, [r0, #-4]
        sub     r0, r0, r2
        bx      lr
.Lset_small_below4:
        cmp     r2, #2
        blo     .Lset_small_1
        strh    r1, [r0]
        add     r0, r0, r2
        strb    r1, [r0, #-1]
        sub     r0, r0, r2
        bx      lr
.Lset_small_1:
        strb    r1, [r0]
        bx      lr

.Lset_trap:
        udf     #0xfe
        .size   memset, . - memset
        .size   __aeabi_memset, . - __aeabi_memset
        .size   __aeabi_memset4, . - __aeabi_memset4
        .size   __aeabi_memset8, . - __aeabi_memset8
        .size   __aeabi_memclr, . - __aeabi_memclr
        .size   __aeabi_memclr4, . - __aeabi_memclr4
        .size   __aeabi_memclr8, . - __aeabi_memclr8
