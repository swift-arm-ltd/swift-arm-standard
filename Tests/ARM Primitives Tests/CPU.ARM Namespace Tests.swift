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

@Suite("CPU.ARM Namespace Tests")
struct CPUARMNamespaceTests {
    @Test("CPU.ARM namespace exists")
    func namespaceExists() {
        typealias ARM = CPU.ARM
        #expect(Bool(true))
    }

    @Test("CPU.ARM.Register namespace exists")
    func registerNamespaceExists() {
        typealias Register = CPU.ARM.Register
        #expect(Bool(true))
    }

    @Test("CPU.ARM.Event namespace exists")
    func eventNamespaceExists() {
        typealias Event = CPU.ARM.Event
        #expect(Bool(true))
    }

    @Test("CPU.ARM.Timestamp namespace exists")
    func timestampNamespaceExists() {
        typealias Timestamp = CPU.ARM.Timestamp
        #expect(Bool(true))
    }

    @Test("CPU.ARM.Vector reserved namespace exists")
    func vectorNamespaceExists() {
        typealias Vector = CPU.ARM.Vector
        #expect(Bool(true))
    }

    @Test("CPU.ARM.Crypto reserved namespace exists")
    func cryptoNamespaceExists() {
        typealias Crypto = CPU.ARM.Crypto
        #expect(Bool(true))
    }

    @Test("CPU.ARM.Counter namespace exists")
    func counterNamespaceExists() {
        typealias Counter = CPU.ARM.Counter
        typealias Frequency = CPU.ARM.Counter.Frequency
        typealias Value = CPU.ARM.Counter.Value
        #expect(Bool(true))
    }

    @Test("Re-exported CPU primitives are accessible")
    func reExportedPrimitivesAccessible() {
        // Verify CPU primitives from swift-cpu-primitives are accessible
        typealias Spin = CPU.Spin
        typealias Barrier = CPU.Barrier
        typealias Cache = CPU.Cache
        typealias Timestamp = CPU.Timestamp
        typealias Integrity = CPU.Integrity

        // Also test that we can call them
        CPU.Spin.hint()
        CPU.Barrier.compiler()
        let _ = CPU.Timestamp.read()

        #expect(Bool(true))
    }
}
