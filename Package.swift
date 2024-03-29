// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift_mpi",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "swift_mpi",
            targets: ["swift_mpi"]),
        .library(
            name: "libopenmpi_sys",
            targets: ["libopenmpi_sys"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .systemLibrary(
            name: "libopenmpi",
            pkgConfig: "ompi-c",
            providers: [
                .apt(["libopenmpi-dev"]),
            ]
        ),
        .target(
            name: "libopenmpi_sys",
            dependencies: ["libopenmpi"]
        ),
        .target(
            name: "swift_mpi",
            dependencies: ["libopenmpi", "libopenmpi_sys"]
        ),
        .testTarget(
            name: "swift_mpiTests",
            dependencies: ["swift_mpi"]
        ),
    ]
)
