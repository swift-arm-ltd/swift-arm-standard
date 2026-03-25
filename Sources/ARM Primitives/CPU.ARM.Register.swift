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

public import CARMShim

extension CPU.ARM {
    /// System register operations via MRS instruction.
    ///
    /// ARM-unique. x86 uses CPUID for similar purposes.
    public enum Register {}
}

extension CPU.ARM.Register {
    /// Read counter frequency register (CNTFRQ_EL0).
    ///
    /// Returns the frequency of the system counter in Hz.
    /// This value is set by firmware and is typically constant
    /// (e.g., 24MHz on Apple Silicon).
    ///
    /// ARM-unique. Returns 0 on non-ARM platforms.
    @inline(always)
    public static func frequency() -> CPU.ARM.Counter.Frequency {
        .init(swift_arm_register_read_v1(System.frequency.rawValue))
    }

    /// Read physical counter register (CNTPCT_EL0).
    ///
    /// Returns the physical counter value. Unlike the virtual counter,
    /// this is not affected by hypervisor offsets.
    ///
    /// ARM-unique. Returns 0 on non-ARM platforms.
    @inline(always)
    public static func physical() -> CPU.ARM.Counter.Value {
        .init(swift_arm_register_read_v1(System.physical.rawValue))
    }

    /// Read virtual counter register (CNTVCT_EL0).
    ///
    /// Returns the virtual counter value. This may include an offset
    /// applied by the hypervisor.
    ///
    /// ARM-unique. Returns 0 on non-ARM platforms.
    @inline(always)
    public static func virtual() -> CPU.ARM.Counter.Value {
        .init(swift_arm_register_read_v1(System.virtual.rawValue))
    }
}
