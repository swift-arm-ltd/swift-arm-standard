extension CPU.ARM {

    public enum Event {}
}

extension CPU.ARM.Event {

    public static var wait: Wait { Wait() }

    public static var send: Send { Send() }
}
