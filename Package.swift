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
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.3.1/YieldloveAdIntegration.xcframework.zip",
            checksum: "7375d5a07656108f7accc0a8890acbb61d523395dcdeee5aafcc0e2386badd86"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Consent",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.3.1/YieldloveAdIntegration_Consent.xcframework.zip",
            checksum: "3f9a577ec3a106170a6ec434f98b75b129ef8cd2d04551208b93f1c3719b997f"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Confiant",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.3.1/YieldloveAdIntegration_Confiant.xcframework.zip",
            checksum: "095fcb275cc6903783626140b8b852d0c3f6d825d6c4de9a403cbfec10555a6d"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Gravite",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.3.1/YieldloveAdIntegration_Gravite.xcframework.zip",
            checksum: "2e05ba7ed90801b6af10fa695b8583297a8faf8061bc2fb0d4cc34f9f592829b"
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
