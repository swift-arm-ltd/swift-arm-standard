// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-arm-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(
            name: "ARM Primitives",
            targets: ["ARM Primitives"]
        ),
    ],
    dependencies: [
        .package(path: "../swift-cpu-primitives"),
    ],
    targets: [
        .target(
            name: "CARMShim",
            dependencies: []
        ),
        .target(
            name: "ARM Primitives",
            dependencies: [
                .target(name: "CARMShim"),
                .product(name: "CPU Primitives", package: "swift-cpu-primitives"),
            ]
        ),
        .testTarget(
            name: "ARM Primitives Tests",
            dependencies: [
                "ARM Primitives",
            ],
            path: "Tests/ARM Primitives Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin].contains(target.type) {
    let settings: [SwiftSetting] = [
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .strictMemorySafety(),
    ]
    target.swiftSettings = (target.swiftSettings ?? []) + settings
}
