; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -gvn -S | FileCheck %s

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

declare void @use(i32*)

define dso_local void @_Z2axv(i32** %arg, i1 %arg1, i1 %arg2, i1 %arg3) local_unnamed_addr {
; CHECK-LABEL: @_Z2axv(
; CHECK-NEXT:  bb:
; CHECK-NEXT:    br label [[BB9:%.*]]
; CHECK:       bb6:
; CHECK-NEXT:    br label [[BB9]]
; CHECK:       bb9:
; CHECK-NEXT:    br i1 [[ARG1:%.*]], label [[BB6:%.*]], label [[BB10:%.*]]
; CHECK:       bb10:
; CHECK-NEXT:    [[I11:%.*]] = tail call i32* @zzz()
; CHECK-NEXT:    br i1 [[ARG2:%.*]], label [[BB12:%.*]], label [[BB15:%.*]]
; CHECK:       bb12:
; CHECK-NEXT:    br label [[BB13:%.*]]
; CHECK:       bb13:
; CHECK-NEXT:    br i1 [[ARG3:%.*]], label [[BB14:%.*]], label [[BB13]]
; CHECK:       bb14:
; CHECK-NEXT:    br label [[BB15]]
; CHECK:       bb15:
; CHECK-NEXT:    br label [[BB6]]
;
bb:
  %i = load i32*, i32** %arg, align 8
  %i4 = getelementptr inbounds i32, i32* %i, i64 0
  br label %bb5

bb5:                                              ; preds = %bb
  br label %bb9

bb6:                                              ; preds = %bb15, %bb9
  %i7 = load i32*, i32** %arg, align 8
  %i8 = getelementptr inbounds i32, i32* %i7, i64 0
  br label %bb9

bb9:                                              ; preds = %bb6, %bb5
  br i1 %arg1, label %bb6, label %bb10

bb10:                                             ; preds = %bb9
  %i11 = tail call i32* @zzz()
  br i1 %arg2, label %bb12, label %bb15

bb12:                                             ; preds = %bb10
  br label %bb13

bb13:                                             ; preds = %bb13, %bb12
  br i1 %arg3, label %bb14, label %bb13

bb14:                                             ; preds = %bb13
  br label %bb15

bb15:                                             ; preds = %bb14, %bb10
  br label %bb6
}

declare dso_local i32* @zzz() local_unnamed_addr
