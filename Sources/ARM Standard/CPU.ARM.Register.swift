public import ARM_Shims

extension CPU.ARM {

    public enum Register {}
}

extension CPU.ARM.Register {

    @inline(always)
    public static func frequency() -> CPU.ARM.Counter.Frequency {
        .init(swift_arm_register_read_v1(System.frequency.rawValue))
    }

    @inline(always)
    public static func physical() -> CPU.ARM.Counter.Value {
        .init(swift_arm_register_read_v1(System.physical.rawValue))
    }

    @inline(always)
    public static func virtual() -> CPU.ARM.Counter.Value {
        .init(swift_arm_register_read_v1(System.virtual.rawValue))
    }
}
