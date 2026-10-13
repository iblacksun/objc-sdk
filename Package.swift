// swift-tools-version: 5.9
import PackageDescription

// 只包含 Foundation（存储）部分，对应 podspec 的 Foundation subspec；
// Realtime / LiveQuery / Protobuf 不包含在内。
// SwiftPM 要求公开头文件集中在一个目录里，所以 AVOS/SwiftPM/include 下放的是
// 指向各个公开头文件的软链接，原有目录结构、podspec 和 AVOS.xcodeproj 保持不变。
let package = Package(
    name: "LeanCloudObjc",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "LeanCloudObjc", targets: ["LeanCloudObjc"])
    ],
    targets: [
        .target(
            name: "LeanCloudObjc",
            path: "AVOS",
            sources: [
                "Sources/Foundation",
                "Sources/Vendor/LCNetworking"
            ],
            publicHeadersPath: "SwiftPM/include",
            cSettings: [
                .headerSearchPath("Sources/Foundation"),
                .headerSearchPath("Sources/Foundation/ACL"),
                .headerSearchPath("Sources/Foundation/Cache"),
                .headerSearchPath("Sources/Foundation/Captcha"),
                .headerSearchPath("Sources/Foundation/CloudCode"),
                .headerSearchPath("Sources/Foundation/File"),
                .headerSearchPath("Sources/Foundation/Geo"),
                .headerSearchPath("Sources/Foundation/Leaderboard"),
                .headerSearchPath("Sources/Foundation/Object"),
                .headerSearchPath("Sources/Foundation/Push"),
                .headerSearchPath("Sources/Foundation/Query"),
                .headerSearchPath("Sources/Foundation/Request"),
                .headerSearchPath("Sources/Foundation/Router"),
                .headerSearchPath("Sources/Foundation/SMS"),
                .headerSearchPath("Sources/Foundation/Search"),
                .headerSearchPath("Sources/Foundation/Status"),
                .headerSearchPath("Sources/Foundation/User"),
                .headerSearchPath("Sources/Foundation/Utils"),
                .headerSearchPath("Sources/Foundation/Vendor"),
                .headerSearchPath("Sources/Foundation/Vendor/JNKeychain"),
                .headerSearchPath("Sources/Foundation/Vendor/LCDB"),
                .headerSearchPath("Sources/Vendor/LCNetworking")
            ],
            linkerSettings: [
                .linkedLibrary("sqlite3")
            ]
        )
    ]
)
