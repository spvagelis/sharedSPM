// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "sharedSPM",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "sharedSPM",
            type: .dynamic,
            targets: ["sharedSPM"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "sharedSPM",
            dependencies: [
                .target(name: "shared")
            ],
            publicHeadersPath: ""
        ),
        .testTarget(
            name: "sharedSPMTests",
            dependencies: ["sharedSPM"]),
        .binaryTarget(name: "shared",
                      url: "https://github.com/spvagelis/sharedSPM/releases/download/1.0.0/shared.xcframework.zip",
                      checksum: "3d0dd29752e41387d552edbd61c5e2d0737552210b6edc1a80d6df51d4b4f510")
    ]
)
