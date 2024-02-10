import PackageDescription

let package = Package(
    name: "Toasty",
    products: [
        .library(
            name: "Toasty",
            targets: ["Toasty"]),
    ],
    targets: [
        .target(
            name: "Toasty"),
        .testTarget(
            name: "ToastyTests",
            dependencies: ["Toasty"]),
    ]
)
