// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "stroeerSDK",
    platforms: [.iOS(.v15)],

    products: [
        .library(
            name: "YieldloveAdIntegration",
            targets: ["YieldloveAdIntegration", "CoreSupport"]
        ),
        .library(
            name: "YieldloveAdIntegration_Consent",
            targets: ["YieldloveAdIntegration_Consent", "ConsentSupport"]
        ),
        .library(
            name: "YieldloveAdIntegration_Confiant",
            targets: ["YieldloveAdIntegration_Confiant", "ConfiantSupport"]
        ),
        .library(
            name: "YieldloveAdIntegration_Gravite",
            targets: ["YieldloveAdIntegration_Gravite", "GraviteSupport"]
        )
    ],

    dependencies: [
        .package(url: "https://github.com/AddApptr/AATKitSPM.git", exact: "3.12.7"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "12.2.0"),
        .package(url: "https://github.com/mxcl/PromiseKit.git", exact: "8.2.0"),
        .package(url: "https://github.com/SourcePointUSA/ios-cmp-app.git", exact: "7.7.7")
    ],

    targets: [
        // ---- Remote binary XCFrameworks (fill URLs; checksums as provided) ----
        .binaryTarget(
            name: "YieldloveAdIntegration",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.2.1/YieldloveAdIntegration.xcframework.zip",
            checksum: "b5b892dad22664a5cf7364b4da12b939322c1ce8524043844022253576bc35d8"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Consent",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.2.1/YieldloveAdIntegration_Consent.xcframework.zip",
            checksum: "5b1fb8e4a428c177f46177770d39048615c9d7a8f2ab8bbe18e450aa417f69e1"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Confiant",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.2.1/YieldloveAdIntegration_Confiant.xcframework.zip",
            checksum: "3e0752f8c21079ef50e1be774f726c17442d0257f1b3eda5442fbeb0ce4454f0"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Gravite",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.2.1/YieldloveAdIntegration_Gravite.xcframework.zip",
            checksum: "0bce6aa08bd5b974cf47473542483d7c518a18c2267cf4299ffb856ea3c0893b"
        ),
        .binaryTarget(
            name: "OMSDK_Prebidorg",
            path: "Frameworks/OMSDK_Prebidorg.xcframework"
        ),
        .binaryTarget(
            name: "XCPrebidMobile",
            path: "Frameworks/XCPrebidMobile.xcframework"
        ),
        
        .target(
            name: "CoreSupport",
            dependencies: [
                "YieldloveAdIntegration",
                "OMSDK_Prebidorg",
                "XCPrebidMobile",
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                .product(name: "PromiseKit", package: "PromiseKit")
            ],
            path: "Sources/Core",
            sources: ["Shim.swift"]
        ),

        .target(
            name: "ConsentSupport",
            dependencies: [
                "YieldloveAdIntegration_Consent",
                "YieldloveAdIntegration",
                .product(name: "ConsentViewController", package: "ios-cmp-app"),
            ],
            path: "Sources/Consent",
            sources: ["Shim.swift"]
        ),

        .target(
            name: "ConfiantSupport",
            dependencies: [
                "YieldloveAdIntegration_Confiant",
                "YieldloveAdIntegration"
            ],
            path: "Sources/Confiant",
            sources: ["Shim.swift"]
        ),

        .target(
            name: "GraviteSupport",
            dependencies: [
                "YieldloveAdIntegration_Gravite",
                "YieldloveAdIntegration",
                .product(name: "AATKit-Core", package: "AATKitSPM"),
            ],
            path: "Sources/Gravite",
            sources: ["Shim.swift"]
        )
    ]
)
