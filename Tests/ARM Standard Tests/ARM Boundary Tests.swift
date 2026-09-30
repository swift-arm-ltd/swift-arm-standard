import Binary
import Testing

@testable import ARM_Standard

@Suite
struct `ARM counter boundaries` {
    @Test
    func `frequencies order across the full range`() {
        let zero: CPU.ARM.Counter.Frequency = 0
        let maximum = CPU.ARM.Counter.Frequency(UInt64.max)
        #expect(zero < maximum)
        #expect(!(maximum < maximum))
        #expect(maximum.rawValue == UInt64.max)
    }

    @Test
    func `raw and literal construction agree`() {
        let literal: CPU.ARM.Counter.Value = 42
        #expect(literal == CPU.ARM.Counter.Value(rawValue: 42))
        #expect(literal == CPU.ARM.Counter.Value(42))
    }

    @Test
    func `system registers are distinct`() {
        let registers: Set<CPU.ARM.Register.System> = [.frequency, .physical, .virtual]
        #expect(registers.count == 3)
    }

    @Test
    func `a counter serializes to its eight raw bytes`() {
        #expect(CPU.ARM.Counter.Frequency(0).bytes.count == 8)
        #expect(CPU.ARM.Counter.Value(UInt64.max).bytes.count == 8)
        #expect(CPU.ARM.Counter.Frequency(1).bytes != CPU.ARM.Counter.Frequency(256).bytes)
        #expect(CPU.ARM.Counter.Frequency(7).bytes == CPU.ARM.Counter.Frequency(7).bytes)
    }
}
