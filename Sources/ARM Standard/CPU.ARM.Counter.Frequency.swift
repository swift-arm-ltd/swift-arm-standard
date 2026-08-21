extension CPU.ARM.Counter {

    public struct Frequency: Sendable, Hashable, RawRepresentable, Comparable,
        ExpressibleByIntegerLiteral
    {
        public var rawValue: UInt64

        @inlinable
        public init(rawValue: UInt64) {
            self.rawValue = rawValue
        }

        @inlinable
        public init(_ rawValue: UInt64) {
            self.rawValue = rawValue
        }

        @inlinable
        public init(integerLiteral value: UInt64) {
            self.rawValue = value
        }
    }
}

extension CPU.ARM.Counter.Frequency {
    @inlinable
    public static func < (lhs: Self, rhs: Self) -> Bool {

        lhs.rawValue < rhs.rawValue
    }
}

extension CPU.ARM.Counter.Frequency: Binary.Serializable {}
