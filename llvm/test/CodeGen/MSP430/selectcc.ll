; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=msp430-- < %s | FileCheck %s

define i16 @select_to_shifts_i16(i16 %a, i16 %b) {
; CHECK-LABEL: select_to_shifts_i16:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    mov.b r12, r12
; CHECK-NEXT:    swpb r12
; CHECK-NEXT:    add r12, r12
; CHECK-NEXT:    add r12, r12
; CHECK-NEXT:    add r12, r12
; CHECK-NEXT:    add r12, r12
; CHECK-NEXT:    add r12, r12
; CHECK-NEXT:    add r12, r12
; CHECK-NEXT:    swpb r12
; CHECK-NEXT:    sxt r12
; CHECK-NEXT:    rra r12
; CHECK-NEXT:    rra r12
; CHECK-NEXT:    rra r12
; CHECK-NEXT:    rra r12
; CHECK-NEXT:    rra r12
; CHECK-NEXT:    rra r12
; CHECK-NEXT:    rra r12
; CHECK-NEXT:    and r13, r12
; CHECK-NEXT:    ret
  %and = and i16 %a, 2
  %tobool = icmp eq i16 %and, 0
  %select = select i1 %tobool, i16 0, i16 %b
  ret i16 %select
}

define i32 @select_to_shifts_i32(i32 %a, i32 %b) {
; CHECK-LABEL: select_to_shifts_i32:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    mov r12, r13
; CHECK-NEXT:    mov.b r13, r13
; CHECK-NEXT:    swpb r13
; CHECK-NEXT:    add r13, r13
; CHECK-NEXT:    add r13, r13
; CHECK-NEXT:    add r13, r13
; CHECK-NEXT:    add r13, r13
; CHECK-NEXT:    add r13, r13
; CHECK-NEXT:    add r13, r13
; CHECK-NEXT:    swpb r13
; CHECK-NEXT:    sxt r13
; CHECK-NEXT:    rra r13
; CHECK-NEXT:    rra r13
; CHECK-NEXT:    rra r13
; CHECK-NEXT:    rra r13
; CHECK-NEXT:    rra r13
; CHECK-NEXT:    rra r13
; CHECK-NEXT:    rra r13
; CHECK-NEXT:    and r13, r14
; CHECK-NEXT:    and r15, r13
; CHECK-NEXT:    mov r14, r12
; CHECK-NEXT:    ret
  %and = and i32 %a, 2
  %tobool = icmp eq i32 %and, 0
  %select = select i1 %tobool, i32 0, i32 %b
  ret i32 %select
}
