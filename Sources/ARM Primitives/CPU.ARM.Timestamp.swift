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

extension CPU.ARM {
    /// ARM-specific timestamp variants.
    ///
    /// For portable timestamp access, use `CPU.Timestamp.read()`.
    /// This namespace provides ARM-unique variants.
    public enum Timestamp {}
}

extension CPU.ARM.Timestamp {
    /// Accessor for read operations.
    public static var read: Read { Read() }
}
