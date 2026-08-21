extension CPU.ARM.Register {

    public struct System: RawRepresentable, Sendable, Hashable {
        public let rawValue: Int32

        public init(rawValue: Int32) {
            self.rawValue = rawValue
        }
    }
}

extension CPU.ARM.Register.System {

    public static let frequency = Self(rawValue: 0)

    public static let physical = Self(rawValue: 1)

    public static let virtual = Self(rawValue: 2)
}
