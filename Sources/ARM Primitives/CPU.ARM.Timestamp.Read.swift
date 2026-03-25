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

internal import CARMShim

extension CPU.ARM.Timestamp {
    /// Timestamp read operation accessor.
    public struct Read: Sendable {
        @usableFromInline
        internal init() {}
    }
}

extension CPU.ARM.Timestamp.Read {
    /// Read physical counter (CNTPCT_EL0).
    ///
    /// Unlike the virtual counter (used by portable `CPU.Timestamp.read()`),
    /// the physical counter is not affected by hypervisor offsets.
    ///
    /// This is useful when you need timestamps that are consistent
    /// across virtual machine migrations or when measuring at the
    /// hardware level.
    ///
    /// ARM-unique. Returns 0 on non-ARM platforms.
    @inline(always)
    public func physical() -> CPU.Timestamp {
        .init(swift_arm_timestamp_physical_v1())
    }
}
