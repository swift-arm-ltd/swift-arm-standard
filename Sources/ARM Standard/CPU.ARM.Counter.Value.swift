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
    /// Counter tick value.
    ///
    /// Raw tick count from physical or virtual counter.
    /// Combine with `Frequency` to convert to wall-clock time.
    ///
    /// ## No Comparable Conformance
    ///
    /// Counter values do not conform to `Comparable` because ordering
    /// is only meaningful under specific conditions (same counter source,
    /// no wraparound). Compare raw values explicitly when ordering semantics
    /// are known to be valid.
    public struct Value: Sendable, Hashable, RawRepresentable, ExpressibleByIntegerLiteral {
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
    }
}

// MARK: - Binary.Serializable

extension CPU.ARM.Counter.Value: Binary.Serializable {}
