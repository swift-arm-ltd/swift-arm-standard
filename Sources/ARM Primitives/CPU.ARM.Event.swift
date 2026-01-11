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
    /// Event signaling primitives.
    ///
    /// ARM-unique. x86 has no equivalent event wait/signal mechanism.
    /// These instructions are used for low-power spin-wait loops and
    /// inter-core synchronization.
    public enum Event {}
}

extension CPU.ARM.Event {
    /// Accessor for wait operations.
    public static var wait: Wait { Wait() }

    /// Accessor for send operations.
    public static var send: Send { Send() }
}
