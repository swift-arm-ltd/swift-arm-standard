# swift-arm-standard

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Typed Swift access to ARM architecture system registers and privileged instructions, such as `MRS` system-register reads and the generic timer counters.

## Installation

Add the package to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/swift-arm-ltd/swift-arm-standard.git", branch: "main")
]
```

Add the product to a target that needs it:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "ARM Standard", package: "swift-arm-standard")
    ]
)
```

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
