// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Toasty",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Toasty",
            targets: ["Toasty"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.7.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Toasty",
            dependencies: ["SnapKit"]
        ),
        .testTarget(
            name: "ToastyTests",
            dependencies: ["Toasty"]),
    ]
)
