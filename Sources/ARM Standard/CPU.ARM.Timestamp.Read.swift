public import ARM_Shims

extension CPU.ARM.Timestamp {

    public struct Read: Sendable {
        @usableFromInline
        internal init() {}
    }
}

extension CPU.ARM.Timestamp.Read {

    @inline(always)
    public func physical() -> CPU.Timestamp {
        .init(swift_arm_timestamp_physical_v1())
    }
}
