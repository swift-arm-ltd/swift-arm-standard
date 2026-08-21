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
