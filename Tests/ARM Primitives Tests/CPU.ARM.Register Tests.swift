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

@Suite("CPU.ARM.Register Tests")
struct CPURegisterTests {
    @Test("frequency returns value on ARM")
    func readFrequency() {
        let value = CPU.ARM.Register.frequency()

        #if arch(arm64)
        // Frequency should be non-zero on ARM64
        #expect(value > 0, "Counter frequency should be non-zero on ARM64")
        // Typical values are in the tens of MHz range (e.g., 24MHz on Apple Silicon)
        #expect(value < 10_000_000_000, "Frequency should be reasonable")
        #else
        #expect(value == 0, "Register read should return 0 on non-ARM")
        #endif
    }

    @Test("physical counter returns value on ARM")
    func readPhysical() {
        let value = CPU.ARM.Register.physical()

        #if arch(arm64)
        #expect(value.rawValue > 0, "Physical counter should be non-zero on ARM64")
        #else
        #expect(value.rawValue == 0, "Register read should return 0 on non-ARM")
        #endif
    }

    @Test("virtual counter returns value on ARM")
    func readVirtual() {
        let value = CPU.ARM.Register.virtual()

        #if arch(arm64)
        #expect(value.rawValue > 0, "Virtual counter should be non-zero on ARM64")
        #else
        #expect(value.rawValue == 0, "Register read should return 0 on non-ARM")
        #endif
    }

    @Test("counter values increase")
    func countersIncrease() {
        #if arch(arm64)
        let v1 = CPU.ARM.Register.virtual()
        let v2 = CPU.ARM.Register.virtual()

        #expect(v2.rawValue >= v1.rawValue, "Counter should not decrease between reads")
        #endif
    }
}
