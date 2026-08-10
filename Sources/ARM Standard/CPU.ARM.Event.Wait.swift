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
    /// Wait operation accessor.
    public struct Wait: Sendable {
        @usableFromInline
        internal init() {}
    }
}

extension CPU.ARM.Event.Wait {
    /// Wait for event (WFE).
    ///
    /// Puts the processor into a low-power state until an event is
    /// signaled via SEV/SEVL or the event register is set. Used for
    /// power-efficient spin-wait loops.
    ///
    /// The event can come from:
    /// - Another core executing SEV
    /// - This core executing SEVL
    /// - An interrupt
    /// - A debug event
    /// - An exclusive access clearing
    ///
    /// ARM-unique. No-op on non-ARM platforms.
    @inline(always)
    public func callAsFunction() {
        swift_arm_event_wait_v1()
    }

    /// Wait for interrupt (WFI).
    ///
    /// Puts the processor into a low-power state until an interrupt
    /// is pending. This is a deeper sleep than WFE and is typically
    /// used in idle loops.
    ///
    /// ARM-unique. No-op on non-ARM platforms.
    @inline(always)
    public func interrupt() {
        swift_arm_event_wait_interrupt_v1()
    }
}
