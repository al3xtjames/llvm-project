; RUN: llc -mtriple=aarch64-none-linux-gnu -mattr=+rcpc -verify-machineinstrs < %s | FileCheck %s

define i8 @test_load_8_rcpc(i8* %addr) {
; CHECK-LABEL: test_load_8_rcpc:
; CHECK: ldaprb w0, [x0]
  %val = load atomic i8, i8* %addr acquire, align 1
  ret i8 %val
}

define i8 @test_load_8_rcsc(i8* %addr) {
; CHECK-LABEL: test_load_8_rcsc:
; CHECK: ldarb w0, [x0]
  %val = load atomic i8, i8* %addr seq_cst, align 1
  ret i8 %val
}

define i16 @test_load_16_rcpc(i16* %addr) {
; CHECK-LABEL: test_load_16_rcpc:
; CHECK: ldaprh w0, [x0]
  %val = load atomic i16, i16* %addr acquire, align 2
  ret i16 %val
}

define i16 @test_load_16_rcsc(i16* %addr) {
; CHECK-LABEL: test_load_16_rcsc:
; CHECK: ldarh w0, [x0]
  %val = load atomic i16, i16* %addr seq_cst, align 2
  ret i16 %val
}

define i32 @test_load_32_rcpc(i32* %addr) {
; CHECK-LABEL: test_load_32_rcpc:
; CHECK: ldapr w0, [x0]
  %val = load atomic i32, i32* %addr acquire, align 4
  ret i32 %val
}

define i32 @test_load_32_rcsc(i32* %addr) {
; CHECK-LABEL: test_load_32_rcsc:
; CHECK: ldar w0, [x0]
  %val = load atomic i32, i32* %addr seq_cst, align 4
  ret i32 %val
}

define i64 @test_load_64_rcpc(i64* %addr) {
; CHECK-LABEL: test_load_64_rcpc:
; CHECK: ldapr x0, [x0]
  %val = load atomic i64, i64* %addr acquire, align 8
  ret i64 %val
}

define i64 @test_load_64_rcsc(i64* %addr) {
; CHECK-LABEL: test_load_64_rcsc:
; CHECK: ldar x0, [x0]
  %val = load atomic i64, i64* %addr seq_cst, align 8
  ret i64 %val
}
