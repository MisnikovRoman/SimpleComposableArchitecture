// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "simple-composable-architecture",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "simple-composable-architecture", targets: ["simple-composable-architecture"]),
    ],
    dependencies: [
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(name: "simple-composable-architecture", dependencies: []),
        .testTarget(name: "simple-composable-architectureTests", dependencies: ["simple-composable-architecture"]),
    ]
)
