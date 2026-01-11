// ===----------------------------------------------------------------------===//
//
// This source file is part of the swift-arm-primitives open source project
//
// Copyright (c) 2024-2025 Coen ten Thije Boonkkamp and the swift-arm-primitives project authors
// Licensed under Apache License v2.0
//
// See LICENSE for license information
//
// ===----------------------------------------------------------------------===//

import Testing
@testable import ARM_Primitives

@Suite("CPU.ARM.Timestamp Tests")
struct CPUTimestampTests {
    @Test("physical read returns non-zero on ARM")
    func physicalReadReturnsValue() {
        let value = CPU.ARM.Timestamp.read.physical()

        #if arch(arm64)
        #expect(value.rawValue > 0, "Physical counter should be non-zero on ARM64")
        #else
        #expect(value.rawValue == 0, "Physical counter should return 0 on non-ARM")
        #endif
    }

    @Test("physical read values increase")
    func physicalReadIncreases() {
        #if arch(arm64)
        let v1 = CPU.ARM.Timestamp.read.physical()
        let v2 = CPU.ARM.Timestamp.read.physical()

        #expect(v2.rawValue >= v1.rawValue, "Physical counter should not decrease between reads")
        #endif
    }

    @Test("accessor pattern works")
    func accessorPatternWorks() {
        // Verify the nested accessor pattern compiles and works
        let read = CPU.ARM.Timestamp.read
        let _ = read.physical()
    }

    @Test("physical matches register read")
    func physicalMatchesRegister() {
        #if arch(arm64)
        // Both should read from CNTPCT_EL0
        let timestamp = CPU.ARM.Timestamp.read.physical()
        let register = CPU.ARM.Register.physical()

        // They should be very close (within a small delta)
        // Convert to same type for comparison
        let delta = register.rawValue > timestamp.rawValue
            ? register.rawValue - timestamp.rawValue
            : timestamp.rawValue - register.rawValue
        #expect(delta < 1_000_000, "Physical counter and register read should be close")
        #endif
    }
}
