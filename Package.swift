// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "HotKey",
    products: [
        .library(name: "HotKey", targets: ["HotKey"])
    ],
    targets: [
        .target(name: "HotKey"),
        .testTarget(name: "HotKeyTests", dependencies: ["HotKey"])
    ]
)
