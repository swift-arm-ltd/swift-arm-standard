// ===----------------------------------------------------------------------===//
//
// This source file is part of the swift-arm-standard open source project
//
// Copyright (c) 2024-2025 Coen ten Thije Boonkkamp and the swift-arm-standard project authors
// Licensed under Apache License v2.0
//
// See LICENSE for license information
//
// ===----------------------------------------------------------------------===//

import Testing

@testable import ARM_Standard

extension CPU.ARM.Counter.Frequency {
    @Suite struct Test {
        @Test func `preserves its raw frequency`() {
            let frequency = CPU.ARM.Counter.Frequency(24_000_000)

            #expect(frequency.rawValue == 24_000_000)
        }
    }
}
