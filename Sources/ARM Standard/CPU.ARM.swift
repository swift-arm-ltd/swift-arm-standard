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

/// ARM/ARM64 ISA-unique primitives.
///
/// Operations in this namespace have no x86 equivalent.
/// For portable operations, use `CPU.*` directly.
@_exported public import CPU_Primitives

extension CPU {
    /// ARM/ARM64 architecture-unique primitives.
    public enum ARM {}
}
