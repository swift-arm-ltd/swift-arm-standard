// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-arm-standard",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "ARM Standard",
            targets: ["ARM Standard"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swift-atoms/swift-cpu.git", branch: "main", traits: ["BinarySerializer"])
    ],
    targets: [
        .target(
            name: "ARM Shims",
            dependencies: []
        ),
        .target(
            name: "ARM Standard",
            dependencies: [
                .target(name: "ARM Shims"),
                .product(name: "CPU", package: "swift-cpu"),
            ]
        ),
        .testTarget(
            name: "ARM Standard Tests",
            dependencies: [
                "ARM Standard"
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
