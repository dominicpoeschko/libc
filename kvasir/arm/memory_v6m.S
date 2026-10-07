// Kvasir's, not upstream's (llvm_port/kvasir/libc/owned.txt).
//
// memcpy, memmove and memset for ARMv6-M (Cortex-M0+), with the AEABI entry points
// __aeabi_memcpy/4/8, __aeabi_memmove/4/8, __aeabi_memset/4/8 and __aeabi_memclr/4/8.
//
// Why assembly: Thumb-1 has LDM/STM and no unaligned access, and the C++ of llvm-libc compiles
// to pairs of ldr/str with a byte loop for every pair of pointers that are not aligned alike
// and for every overlapping memmove. Here: 32 bytes a turn with LDM/STM for aligned pointers,
// a shifted word copy for a source that is not aligned like the destination (3 cycles a byte
// instead of 5.3), a backward word copy for an overlapping memmove (1.3 cycles a byte instead
// of 7), and STM of one value for memset (0.5 instead of 1.4). The 4/8 entries skip the
// alignment work: the caller - the compiler, for a copy of known alignment - has promised it.
//
// As llvm-libc built with LIBC_ADD_NULL_CHECKS: a null pointer with a size other than 0 traps.
//
// The shifted copy reads the whole aligned word around the first and the last source byte: up
// to 3 bytes outside the source, never outside the aligned words the source lies in.
//
// Checked on the device by test_examples 110_memory_check, measured by 108_runtime_cost.

        .syntax unified
        .arch   armv6-m
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
__aeabi_memcpy4:
        .thumb_func
__aeabi_memcpy8:
        cmp     r2, #0
        beq     .Lcpy_return
        cmp     r0, #0
        beq     .Lcpy_trap
        cmp     r1, #0
        beq     .Lcpy_trap
        cmp     r2, #8
        blo     .Lcpy_short_entry
        mov     r12, r0
        push    {r4, r5, r6, r7, lr}
        b       .Lcpy_aligned

        .thumb_func
memcpy:
        .thumb_func
__aeabi_memcpy:
        cmp     r2, #0
        beq     .Lcpy_return
        cmp     r0, #0
        beq     .Lcpy_trap
        cmp     r1, #0
        beq     .Lcpy_trap
        // memmove comes in here when a forward copy is safe
        .global __kvasir_memcpy_checked
        .hidden __kvasir_memcpy_checked
        .type   __kvasir_memcpy_checked, %function
        .thumb_func
__kvasir_memcpy_checked:
        cmp     r2, #8
        bhs     .Lcpy_long
        // 1..7 bytes, first to last: memmove sends every copy here whose destination lies below
        // its source, and such a copy must not write a byte before it has read it. Both
        // pointers at the end, the index from -n up to 0.
.Lcpy_short_entry:
        mov     r12, r0
        adds    r0, r2
        adds    r1, r2
        rsbs    r2, r2, #0
.Lcpy_short:
        ldrb    r3, [r1, r2]
        strb    r3, [r0, r2]
        adds    r2, #1
        bne     .Lcpy_short
        mov     r0, r12
.Lcpy_return:
        bx      lr

.Lcpy_trap:
        udf     #0xfe

.Lcpy_long:
        mov     r12, r0
        push    {r4, r5, r6, r7, lr}
        // bytes until the destination is on a word boundary (at most 3: 5 or more are left)
.Lcpy_head:
        lsls    r3, r0, #30
        beq     .Lcpy_dst_aligned
        ldrb    r3, [r1]
        strb    r3, [r0]
        adds    r1, #1
        adds    r0, #1
        subs    r2, #1
        b       .Lcpy_head
.Lcpy_dst_aligned:
        lsls    r3, r1, #30
        bne     .Lcpy_shifted

        // both on a word boundary, r2 bytes left (any number)
.Lcpy_aligned:
        subs    r2, #32
        blo     .Lcpy_below32
.Lcpy_32:
        ldmia   r1!, {r3, r4, r5, r6}
        stmia   r0!, {r3, r4, r5, r6}
        ldmia   r1!, {r3, r4, r5, r6}
        stmia   r0!, {r3, r4, r5, r6}
        subs    r2, #32
        bhs     .Lcpy_32
.Lcpy_below32:
        adds    r2, #32                 // 0..31 left
        cmp     r2, #16
        blo     .Lcpy_below16
        ldmia   r1!, {r3, r4, r5, r6}
        stmia   r0!, {r3, r4, r5, r6}
        subs    r2, #16
.Lcpy_below16:
        cmp     r2, #4
        blo     .Lcpy_tail
.Lcpy_4:
        ldmia   r1!, {r3}
        stmia   r0!, {r3}
        subs    r2, #4
        cmp     r2, #4
        bhs     .Lcpy_4
        // 0..3 bytes, first to last as above
.Lcpy_tail:
        cmp     r2, #0
        beq     .Lcpy_done
        adds    r0, r2
        adds    r1, r2
        rsbs    r2, r2, #0
.Lcpy_tail_byte:
        ldrb    r3, [r1, r2]
        strb    r3, [r0, r2]
        adds    r2, #1
        bne     .Lcpy_tail_byte
.Lcpy_done:
        mov     r0, r12
        pop     {r4, r5, r6, r7, pc}

        // The destination is on a word boundary, the source k = 1..3 bytes past one. Each
        // destination word is the upper 4 - k bytes of one source word and the lower k of the
        // next: r3 the current source word, r4 = 8k, r5 = 32 - 8k.
.Lcpy_shifted:
        movs    r4, #3
        ands    r4, r1                  // k
        subs    r1, r4                  // the source's word
        lsls    r4, #3
        movs    r5, #32
        subs    r5, r4
        ldmia   r1!, {r3}
        subs    r2, #4
        blo     .Lcpy_shifted_done
.Lcpy_shifted_word:
        lsrs    r3, r4
        ldmia   r1!, {r6}
        movs    r7, r6
        lsls    r7, r5
        orrs    r3, r7
        stmia   r0!, {r3}
        movs    r3, r6
        subs    r2, #4
        bhs     .Lcpy_shifted_word
.Lcpy_shifted_done:
        adds    r2, #4                  // 0..3 left
        subs    r1, #4                  // back to the first byte not copied yet
        lsrs    r4, #3
        adds    r1, r4
        b       .Lcpy_tail
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
memmove:
        .thumb_func
__aeabi_memmove:
        .thumb_func
__aeabi_memmove4:
        .thumb_func
__aeabi_memmove8:
        cmp     r2, #0
        beq     .Lmove_return
        cmp     r0, #0
        beq     .Lmove_trap
        cmp     r1, #0
        beq     .Lmove_trap
        // forward (memcpy, which copies first to last throughout) is right unless the destination
        // starts inside the source: dst - src < n
        subs    r3, r0, r1
        cmp     r3, r2
        blo     .Lmove_backward
        ldr     r3, =__kvasir_memcpy_checked
        bx      r3

.Lmove_trap:
        udf     #0xfe

.Lmove_backward:
        // last byte first. Words only if both pointers are aligned alike and it is worth it.
        cmp     r2, #8
        blo     .Lmove_bytes
        movs    r3, r0
        eors    r3, r1
        lsls    r3, #30
        bne     .Lmove_bytes
        mov     r12, r0
        push    {r4, lr}
        adds    r0, r2                  // one past the end of both
        adds    r1, r2
        // bytes until the ends are on a word boundary (at most 3)
.Lmove_end:
        lsls    r3, r0, #30
        beq     .Lmove_end_aligned
        subs    r1, #1
        subs    r0, #1
        ldrb    r3, [r1]
        strb    r3, [r0]
        subs    r2, #1
        b       .Lmove_end
.Lmove_end_aligned:
        subs    r2, #16
        blo     .Lmove_below16
.Lmove_16:
        subs    r1, #16
        subs    r0, #16
        ldr     r3, [r1, #12]
        ldr     r4, [r1, #8]
        str     r3, [r0, #12]
        str     r4, [r0, #8]
        ldr     r3, [r1, #4]
        ldr     r4, [r1]
        str     r3, [r0, #4]
        str     r4, [r0]
        subs    r2, #16
        bhs     .Lmove_16
.Lmove_below16:
        adds    r2, #16                 // 0..15 left
        cmp     r2, #4
        blo     .Lmove_start
.Lmove_4:
        subs    r1, #4
        subs    r0, #4
        ldr     r3, [r1]
        str     r3, [r0]
        subs    r2, #4
        cmp     r2, #4
        bhs     .Lmove_4
        // 0..3 bytes at the start: r0 and r1 are r2 bytes past it
.Lmove_start:
        subs    r0, r2
        subs    r1, r2
        cmp     r2, #0
        beq     .Lmove_done
.Lmove_start_byte:
        subs    r2, #1
        ldrb    r3, [r1, r2]
        strb    r3, [r0, r2]
        bne     .Lmove_start_byte
.Lmove_done:
        mov     r0, r12
        pop     {r4, pc}

        // r2 bytes, last first; r0 stays the return value
.Lmove_bytes:
        subs    r2, #1
        ldrb    r3, [r1, r2]
        strb    r3, [r0, r2]
        bne     .Lmove_bytes
.Lmove_return:
        bx      lr
        .pool
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
        // The AEABI entries take (dst, n, value): they get their own short loop and prologue in
        // that order instead of three moves into memset's, so a hosted build's aligned fill
        // (__aeabi_memset8, what clang emits for std::memset on a word-aligned object) costs
        // exactly what a memset call costs. The 4/8 entries promise an aligned pointer; the
        // prologue's one alignment test sees that at once.
        .thumb_func
__aeabi_memclr:
        .thumb_func
__aeabi_memclr4:
        .thumb_func
__aeabi_memclr8:
        movs    r2, #0
        .thumb_func
__aeabi_memset:
        .thumb_func
__aeabi_memset4:
        .thumb_func
__aeabi_memset8:
        cmp     r1, #0
        beq     .Lset_return
        cmp     r0, #0
        beq     .Lset_trap
        cmp     r1, #8
        bhs     .Lset_long_aeabi
.Lset_short_aeabi:
        subs    r1, #1
        strb    r2, [r0, r1]
        bne     .Lset_short_aeabi
        bx      lr

        .thumb_func
memset:
        cmp     r2, #0
        beq     .Lset_return
        cmp     r0, #0
        beq     .Lset_trap
        cmp     r2, #8
        bhs     .Lset_long
        // 1..7 bytes; r0 stays the return value
.Lset_short:
        subs    r2, #1
        strb    r1, [r0, r2]
        bne     .Lset_short
.Lset_return:
        bx      lr

.Lset_trap:
        udf     #0xfe

.Lset_long:
        mov     r12, r0
        uxtb    r1, r1
        lsls    r3, r1, #8
        orrs    r1, r3
        lsls    r3, r1, #16
        orrs    r1, r3
        // bytes until the destination is on a word boundary (at most 3)
.Lset_head:
        lsls    r3, r0, #30
        beq     .Lset_aligned
        strb    r1, [r0]
        adds    r0, #1
        subs    r2, #1
        b       .Lset_head
        // the AEABI order (r1 n, r2 value) into memset's (r1 the word, r2 n), the value's low
        // byte in all four bytes; an unaligned destination joins memset's head loop
.Lset_long_aeabi:
        mov     r12, r0
        uxtb    r3, r2
        movs    r2, r1
        lsls    r1, r3, #8
        orrs    r1, r3
        lsls    r3, r1, #16
        orrs    r1, r3
        lsls    r3, r0, #30
        bne     .Lset_head
        // r0 on a word boundary, r1 the word, r2 bytes left (any number), r12 the return value
.Lset_aligned:
        movs    r3, r1
        subs    r2, #32
        blo     .Lset_below32
.Lset_32:
        stmia   r0!, {r1, r3}
        stmia   r0!, {r1, r3}
        stmia   r0!, {r1, r3}
        stmia   r0!, {r1, r3}
        subs    r2, #32
        bhs     .Lset_32
.Lset_below32:
        adds    r2, #32                 // 0..31 left
        cmp     r2, #8
        blo     .Lset_below8
.Lset_8:
        stmia   r0!, {r1, r3}
        subs    r2, #8
        cmp     r2, #8
        bhs     .Lset_8
.Lset_below8:
        cmp     r2, #4
        blo     .Lset_tail
        stmia   r0!, {r1}
        subs    r2, #4
.Lset_tail:
        cmp     r2, #0
        beq     .Lset_done
.Lset_tail_byte:
        subs    r2, #1
        strb    r1, [r0, r2]
        bne     .Lset_tail_byte
.Lset_done:
        mov     r0, r12
        bx      lr
        .size   memset, . - memset
        .size   __aeabi_memset, . - __aeabi_memset
        .size   __aeabi_memset4, . - __aeabi_memset4
        .size   __aeabi_memset8, . - __aeabi_memset8
        .size   __aeabi_memclr, . - __aeabi_memclr
        .size   __aeabi_memclr4, . - __aeabi_memclr4
        .size   __aeabi_memclr8, . - __aeabi_memclr8
