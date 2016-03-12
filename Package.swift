import PackageDescription

let package = Package(
    name: "FountainKit",
    targets: [
        Target(name: "FountainKitTests", dependencies: [.Target(name: "FountainKit")])
    ]
)
