public import ARM_Shims

extension CPU.ARM.Event {

    public struct Send: Sendable {
        @usableFromInline
        internal init() {}
    }
}

extension CPU.ARM.Event.Send {

    @inline(always)
    public func callAsFunction() {
        swift_arm_event_send_v1()
    }

    @inline(always)
    public func local() {
        swift_arm_event_send_local_v1()
    }
}
