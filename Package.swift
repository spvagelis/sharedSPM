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
    dependencies: [.package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.8.0"),
                  ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "sharedSPM",
            dependencies: [
                .target(name: "shared"),
                .product(name: "CocoaLumberjack", package: "CocoaLumberjack")
            ]
        ),
        .testTarget(
            name: "sharedSPMTests",
            dependencies: ["sharedSPM"]),
        .binaryTarget(name: "shared",
                      url: "https://github.com/spvagelis/sharedSPM/releases/download/1.0.1/shared.xcframework.zip",
                      checksum: "4cf6cc8e4e637a19726f2ec2a460033ba15c64ca748b19c6c930b4cd52c94e2e")
    ]
)

