# swift-arm-standard

Use this package when you need instructions that only ARM processors have: reading the generic timer's frequency and its physical and virtual counters, and the event instructions WFE, WFI, SEV and SEVL for low-power waiting between cores. Start from `CPU.ARM.Register`, `CPU.ARM.Timestamp` or `CPU.ARM.Event`. For portable primitives such as barriers, spin hints and plain timestamp reads, use `CPU` from swift-cpu, which this package re-exports. On x86, use swift-x86-standard.

## Laws

- The package builds on every architecture. Off ARM, `CPU.ARM.Register.frequency()`, `CPU.ARM.Register.physical()`, `CPU.ARM.Register.virtual()` and `CPU.ARM.Timestamp.Read.physical()` return 0, and `CPU.ARM.Event.Wait` and `CPU.ARM.Event.Send` do nothing.
- Counter reads issue no barrier, so the processor may read the counter earlier or later than the code around the call.
- A `CPU.ARM.Counter.Frequency` or `CPU.ARM.Counter.Value` serializes as its eight raw bytes.
