// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "ShroomKit",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "ShroomKit", targets: ["ShroomKit"])
    ],
    targets: [
        .target(name: "ShroomKit"),
        .testTarget(name: "ShroomKitTests", dependencies: ["ShroomKit"])
    ]
)
