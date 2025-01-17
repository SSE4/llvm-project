; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 5
; RUN: llc < %s -mtriple=arm64-eabi -aarch64-neon-syntax=apple | FileCheck %s --check-prefixes=CHECK,CHECK-SD
; RUN: llc < %s -mtriple=arm64-eabi -aarch64-neon-syntax=apple -global-isel | FileCheck %s --check-prefixes=CHECK,CHECK-GI

define <8 x i8> @test_vclz_u8(<8 x i8> %a) nounwind readnone ssp {
; CHECK-LABEL: test_vclz_u8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    clz.8b v0, v0
; CHECK-NEXT:    ret
  %vclz.i = tail call <8 x i8> @llvm.ctlz.v8i8(<8 x i8> %a, i1 false) nounwind
  ret <8 x i8> %vclz.i
}

define <8 x i8> @test_vclz_s8(<8 x i8> %a) nounwind readnone ssp {
; CHECK-LABEL: test_vclz_s8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    clz.8b v0, v0
; CHECK-NEXT:    ret
  %vclz.i = tail call <8 x i8> @llvm.ctlz.v8i8(<8 x i8> %a, i1 false) nounwind
  ret <8 x i8> %vclz.i
}

define <4 x i16> @test_vclz_u16(<4 x i16> %a) nounwind readnone ssp {
; CHECK-LABEL: test_vclz_u16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    clz.4h v0, v0
; CHECK-NEXT:    ret
  %vclz1.i = tail call <4 x i16> @llvm.ctlz.v4i16(<4 x i16> %a, i1 false) nounwind
  ret <4 x i16> %vclz1.i
}

define <4 x i16> @test_vclz_s16(<4 x i16> %a) nounwind readnone ssp {
; CHECK-LABEL: test_vclz_s16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    clz.4h v0, v0
; CHECK-NEXT:    ret
  %vclz1.i = tail call <4 x i16> @llvm.ctlz.v4i16(<4 x i16> %a, i1 false) nounwind
  ret <4 x i16> %vclz1.i
}

define <2 x i32> @test_vclz_u32(<2 x i32> %a) nounwind readnone ssp {
; CHECK-LABEL: test_vclz_u32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    clz.2s v0, v0
; CHECK-NEXT:    ret
  %vclz1.i = tail call <2 x i32> @llvm.ctlz.v2i32(<2 x i32> %a, i1 false) nounwind
  ret <2 x i32> %vclz1.i
}

define <2 x i32> @test_vclz_s32(<2 x i32> %a) nounwind readnone ssp {
; CHECK-LABEL: test_vclz_s32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    clz.2s v0, v0
; CHECK-NEXT:    ret
  %vclz1.i = tail call <2 x i32> @llvm.ctlz.v2i32(<2 x i32> %a, i1 false) nounwind
  ret <2 x i32> %vclz1.i
}

define <1 x i64> @test_vclz_u64(<1 x i64> %a) nounwind readnone ssp {
; CHECK-SD-LABEL: test_vclz_u64:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    ushr d1, d0, #1
; CHECK-SD-NEXT:    orr.8b v0, v0, v1
; CHECK-SD-NEXT:    ushr d1, d0, #2
; CHECK-SD-NEXT:    orr.8b v0, v0, v1
; CHECK-SD-NEXT:    ushr d1, d0, #4
; CHECK-SD-NEXT:    orr.8b v0, v0, v1
; CHECK-SD-NEXT:    ushr d1, d0, #8
; CHECK-SD-NEXT:    orr.8b v0, v0, v1
; CHECK-SD-NEXT:    ushr d1, d0, #16
; CHECK-SD-NEXT:    orr.8b v0, v0, v1
; CHECK-SD-NEXT:    ushr d1, d0, #32
; CHECK-SD-NEXT:    orr.8b v0, v0, v1
; CHECK-SD-NEXT:    mvn.8b v0, v0
; CHECK-SD-NEXT:    cnt.8b v0, v0
; CHECK-SD-NEXT:    uaddlp.4h v0, v0
; CHECK-SD-NEXT:    uaddlp.2s v0, v0
; CHECK-SD-NEXT:    uaddlp.1d v0, v0
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: test_vclz_u64:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    fmov x8, d0
; CHECK-GI-NEXT:    clz x8, x8
; CHECK-GI-NEXT:    fmov d0, x8
; CHECK-GI-NEXT:    ret
  %vclz1.i = tail call <1 x i64> @llvm.ctlz.v1i64(<1 x i64> %a, i1 false) nounwind
  ret <1 x i64> %vclz1.i
}

define <1 x i64> @test_vclz_s64(<1 x i64> %a) nounwind readnone ssp {
; CHECK-SD-LABEL: test_vclz_s64:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    ushr d1, d0, #1
; CHECK-SD-NEXT:    orr.8b v0, v0, v1
; CHECK-SD-NEXT:    ushr d1, d0, #2
; CHECK-SD-NEXT:    orr.8b v0, v0, v1
; CHECK-SD-NEXT:    ushr d1, d0, #4
; CHECK-SD-NEXT:    orr.8b v0, v0, v1
; CHECK-SD-NEXT:    ushr d1, d0, #8
; CHECK-SD-NEXT:    orr.8b v0, v0, v1
; CHECK-SD-NEXT:    ushr d1, d0, #16
; CHECK-SD-NEXT:    orr.8b v0, v0, v1
; CHECK-SD-NEXT:    ushr d1, d0, #32
; CHECK-SD-NEXT:    orr.8b v0, v0, v1
; CHECK-SD-NEXT:    mvn.8b v0, v0
; CHECK-SD-NEXT:    cnt.8b v0, v0
; CHECK-SD-NEXT:    uaddlp.4h v0, v0
; CHECK-SD-NEXT:    uaddlp.2s v0, v0
; CHECK-SD-NEXT:    uaddlp.1d v0, v0
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: test_vclz_s64:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    fmov x8, d0
; CHECK-GI-NEXT:    clz x8, x8
; CHECK-GI-NEXT:    fmov d0, x8
; CHECK-GI-NEXT:    ret
  %vclz1.i = tail call <1 x i64> @llvm.ctlz.v1i64(<1 x i64> %a, i1 false) nounwind
  ret <1 x i64> %vclz1.i
}

define <16 x i8> @test_vclzq_u8(<16 x i8> %a) nounwind readnone ssp {
; CHECK-LABEL: test_vclzq_u8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    clz.16b v0, v0
; CHECK-NEXT:    ret
  %vclz.i = tail call <16 x i8> @llvm.ctlz.v16i8(<16 x i8> %a, i1 false) nounwind
  ret <16 x i8> %vclz.i
}

define <16 x i8> @test_vclzq_s8(<16 x i8> %a) nounwind readnone ssp {
; CHECK-LABEL: test_vclzq_s8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    clz.16b v0, v0
; CHECK-NEXT:    ret
  %vclz.i = tail call <16 x i8> @llvm.ctlz.v16i8(<16 x i8> %a, i1 false) nounwind
  ret <16 x i8> %vclz.i
}

define <8 x i16> @test_vclzq_u16(<8 x i16> %a) nounwind readnone ssp {
; CHECK-LABEL: test_vclzq_u16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    clz.8h v0, v0
; CHECK-NEXT:    ret
  %vclz1.i = tail call <8 x i16> @llvm.ctlz.v8i16(<8 x i16> %a, i1 false) nounwind
  ret <8 x i16> %vclz1.i
}

define <8 x i16> @test_vclzq_s16(<8 x i16> %a) nounwind readnone ssp {
; CHECK-LABEL: test_vclzq_s16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    clz.8h v0, v0
; CHECK-NEXT:    ret
  %vclz1.i = tail call <8 x i16> @llvm.ctlz.v8i16(<8 x i16> %a, i1 false) nounwind
  ret <8 x i16> %vclz1.i
}

define <4 x i32> @test_vclzq_u32(<4 x i32> %a) nounwind readnone ssp {
; CHECK-LABEL: test_vclzq_u32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    clz.4s v0, v0
; CHECK-NEXT:    ret
  %vclz1.i = tail call <4 x i32> @llvm.ctlz.v4i32(<4 x i32> %a, i1 false) nounwind
  ret <4 x i32> %vclz1.i
}

define <4 x i32> @test_vclzq_s32(<4 x i32> %a) nounwind readnone ssp {
; CHECK-LABEL: test_vclzq_s32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    clz.4s v0, v0
; CHECK-NEXT:    ret
  %vclz1.i = tail call <4 x i32> @llvm.ctlz.v4i32(<4 x i32> %a, i1 false) nounwind
  ret <4 x i32> %vclz1.i
}

define <2 x i64> @test_vclzq_u64(<2 x i64> %a) nounwind readnone ssp {
; CHECK-SD-LABEL: test_vclzq_u64:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    ushr.2d v1, v0, #1
; CHECK-SD-NEXT:    orr.16b v0, v0, v1
; CHECK-SD-NEXT:    ushr.2d v1, v0, #2
; CHECK-SD-NEXT:    orr.16b v0, v0, v1
; CHECK-SD-NEXT:    ushr.2d v1, v0, #4
; CHECK-SD-NEXT:    orr.16b v0, v0, v1
; CHECK-SD-NEXT:    ushr.2d v1, v0, #8
; CHECK-SD-NEXT:    orr.16b v0, v0, v1
; CHECK-SD-NEXT:    ushr.2d v1, v0, #16
; CHECK-SD-NEXT:    orr.16b v0, v0, v1
; CHECK-SD-NEXT:    ushr.2d v1, v0, #32
; CHECK-SD-NEXT:    orr.16b v0, v0, v1
; CHECK-SD-NEXT:    mvn.16b v0, v0
; CHECK-SD-NEXT:    cnt.16b v0, v0
; CHECK-SD-NEXT:    uaddlp.8h v0, v0
; CHECK-SD-NEXT:    uaddlp.4s v0, v0
; CHECK-SD-NEXT:    uaddlp.2d v0, v0
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: test_vclzq_u64:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    fmov x8, d0
; CHECK-GI-NEXT:    mov.d x9, v0[1]
; CHECK-GI-NEXT:    clz x8, x8
; CHECK-GI-NEXT:    mov.d v0[0], x8
; CHECK-GI-NEXT:    clz x8, x9
; CHECK-GI-NEXT:    mov.d v0[1], x8
; CHECK-GI-NEXT:    ret
  %vclz1.i = tail call <2 x i64> @llvm.ctlz.v2i64(<2 x i64> %a, i1 false) nounwind
  ret <2 x i64> %vclz1.i
}

define <2 x i64> @test_vclzq_s64(<2 x i64> %a) nounwind readnone ssp {
; CHECK-SD-LABEL: test_vclzq_s64:
; CHECK-SD:       // %bb.0:
; CHECK-SD-NEXT:    ushr.2d v1, v0, #1
; CHECK-SD-NEXT:    orr.16b v0, v0, v1
; CHECK-SD-NEXT:    ushr.2d v1, v0, #2
; CHECK-SD-NEXT:    orr.16b v0, v0, v1
; CHECK-SD-NEXT:    ushr.2d v1, v0, #4
; CHECK-SD-NEXT:    orr.16b v0, v0, v1
; CHECK-SD-NEXT:    ushr.2d v1, v0, #8
; CHECK-SD-NEXT:    orr.16b v0, v0, v1
; CHECK-SD-NEXT:    ushr.2d v1, v0, #16
; CHECK-SD-NEXT:    orr.16b v0, v0, v1
; CHECK-SD-NEXT:    ushr.2d v1, v0, #32
; CHECK-SD-NEXT:    orr.16b v0, v0, v1
; CHECK-SD-NEXT:    mvn.16b v0, v0
; CHECK-SD-NEXT:    cnt.16b v0, v0
; CHECK-SD-NEXT:    uaddlp.8h v0, v0
; CHECK-SD-NEXT:    uaddlp.4s v0, v0
; CHECK-SD-NEXT:    uaddlp.2d v0, v0
; CHECK-SD-NEXT:    ret
;
; CHECK-GI-LABEL: test_vclzq_s64:
; CHECK-GI:       // %bb.0:
; CHECK-GI-NEXT:    fmov x8, d0
; CHECK-GI-NEXT:    mov.d x9, v0[1]
; CHECK-GI-NEXT:    clz x8, x8
; CHECK-GI-NEXT:    mov.d v0[0], x8
; CHECK-GI-NEXT:    clz x8, x9
; CHECK-GI-NEXT:    mov.d v0[1], x8
; CHECK-GI-NEXT:    ret
  %vclz1.i = tail call <2 x i64> @llvm.ctlz.v2i64(<2 x i64> %a, i1 false) nounwind
  ret <2 x i64> %vclz1.i
}

declare <2 x i64> @llvm.ctlz.v2i64(<2 x i64>, i1) nounwind readnone
declare <4 x i32> @llvm.ctlz.v4i32(<4 x i32>, i1) nounwind readnone
declare <8 x i16> @llvm.ctlz.v8i16(<8 x i16>, i1) nounwind readnone
declare <16 x i8> @llvm.ctlz.v16i8(<16 x i8>, i1) nounwind readnone
declare <1 x i64> @llvm.ctlz.v1i64(<1 x i64>, i1) nounwind readnone
declare <2 x i32> @llvm.ctlz.v2i32(<2 x i32>, i1) nounwind readnone
declare <4 x i16> @llvm.ctlz.v4i16(<4 x i16>, i1) nounwind readnone
declare <8 x i8> @llvm.ctlz.v8i8(<8 x i8>, i1) nounwind readnone
