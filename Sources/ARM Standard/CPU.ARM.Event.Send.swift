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

public import ARM_Shims

extension CPU.ARM.Event {
    /// Send operation accessor.
    public struct Send: Sendable {
        @usableFromInline
        internal init() {}
    }
}

extension CPU.ARM.Event.Send {
    /// Send event (SEV).
    ///
    /// Signals an event to all cores in the system. Any core waiting
    /// in WFE will be woken up.
    ///
    /// ARM-unique. No-op on non-ARM platforms.
    @inline(always)
    public func callAsFunction() {
        swift_arm_event_send_v1()
    }

    /// Send event local (SEVL).
    ///
    /// Sets the local event register without signaling other cores.
    /// This ensures the next WFE on this core will not wait.
    ///
    /// Useful for ensuring the first iteration of a WFE loop does
    /// not block if the condition might already be satisfied.
    ///
    /// ARM-unique (ARMv8+). Falls back to SEV on ARM32.
    /// No-op on non-ARM platforms.
    @inline(always)
    public func local() {
        swift_arm_event_send_local_v1()
    }
}
