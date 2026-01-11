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

extension CPU.ARM.Counter {
    /// Counter frequency in Hz.
    ///
    /// Read from CNTFRQ_EL0 system register. Used to convert
    /// counter ticks to wall-clock time.
    public struct Frequency: Sendable, Hashable, RawRepresentable, Comparable, ExpressibleByIntegerLiteral {
        public var rawValue: UInt64

        @inlinable
        public init(rawValue: UInt64) {
            self.rawValue = rawValue
        }

        @inlinable
        public init(_ rawValue: UInt64) {
            self.rawValue = rawValue
        }

        @inlinable
        public init(integerLiteral value: UInt64) {
            self.rawValue = value
        }

        @inlinable
        public static func < (lhs: Self, rhs: Self) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
    }
}

// MARK: - Binary.Serializable

extension CPU.ARM.Counter.Frequency: Binary.Serializable {}
