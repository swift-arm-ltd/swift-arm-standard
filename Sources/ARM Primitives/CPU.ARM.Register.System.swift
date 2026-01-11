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

extension CPU.ARM.Register {
    /// System register identifiers.
    ///
    /// These correspond to ARM system registers accessible via MRS.
    public struct System: RawRepresentable, Sendable, Hashable {
        public let rawValue: Int32

        public init(rawValue: Int32) {
            self.rawValue = rawValue
        }
    }
}

extension CPU.ARM.Register.System {
    /// Counter frequency register (CNTFRQ_EL0).
    ///
    /// Returns the frequency of the system counter in Hz.
    /// This value is set by firmware and is typically constant.
    public static let frequency = Self(rawValue: 0)

    /// Physical counter register (CNTPCT_EL0).
    ///
    /// Returns the physical counter value. Unlike the virtual counter,
    /// this is not affected by hypervisor offsets.
    public static let physical = Self(rawValue: 1)

    /// Virtual counter register (CNTVCT_EL0).
    ///
    /// Returns the virtual counter value. This may include an offset
    /// applied by the hypervisor.
    public static let virtual = Self(rawValue: 2)
}
