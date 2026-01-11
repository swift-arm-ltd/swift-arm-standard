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

import Testing
@testable import ARM_Primitives

@Suite("CPU.ARM.Event Tests")
struct CPUEventTests {
    @Test("wait accessor pattern works")
    func waitAccessorWorks() {
        // Verify accessor pattern compiles
        let wait = CPU.ARM.Event.wait
        _ = wait

        // Note: We don't actually call wait() in tests because
        // it would block until an event is received
    }

    @Test("send accessor pattern works")
    func sendAccessorWorks() {
        // Verify accessor pattern compiles and works
        let send = CPU.ARM.Event.send

        // Send is safe to call - it just signals an event
        send()
    }

    @Test("send local works")
    func sendLocalWorks() {
        // SEVL sets the local event register
        CPU.ARM.Event.send.local()

        // This ensures the next WFE won't block
        // (We don't test WFE itself to avoid blocking)
    }

    @Test("send and wait pattern is valid")
    func sendWaitPattern() {
        // Test the typical SEVL + WFE pattern
        // SEVL ensures WFE doesn't block on first iteration
        CPU.ARM.Event.send.local()

        // In real code, you would then:
        // while !condition {
        //     CPU.ARM.Event.wait()
        // }
        // But we can't test that without risking a hang
    }
}
