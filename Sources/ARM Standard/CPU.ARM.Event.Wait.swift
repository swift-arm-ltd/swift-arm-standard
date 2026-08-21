public import ARM_Shims

extension CPU.ARM.Event {

    public struct Wait: Sendable {
        @usableFromInline
        internal init() {}
    }
}

extension CPU.ARM.Event.Wait {

    @inline(always)
    public func callAsFunction() {
        swift_arm_event_wait_v1()
    }

    @inline(always)
    public func interrupt() {
        swift_arm_event_wait_interrupt_v1()
    }
}
