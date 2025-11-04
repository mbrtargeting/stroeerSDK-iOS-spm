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
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.2.2/YieldloveAdIntegration.xcframework.zip",
            checksum: "064d75b5acb3d86d7cdc2be39ad485d9647330635a873c8464b96578cb2c6035"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Consent",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.2.2/YieldloveAdIntegration_Consent.xcframework.zip",
            checksum: "39c1ea3618289899cb25c7b2f1d539bc322f509aa583ff2a787605a93e4c7441"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Confiant",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.2.2/YieldloveAdIntegration_Confiant.xcframework.zip",
            checksum: "2a2ad5b5e10e39c4755f6fa9722b326ba900536910e035c381a259fdebaa34b9"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Gravite",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.2.2/YieldloveAdIntegration_Gravite.xcframework.zip",
            checksum: "cc1772b1132f168339fdefe3e0b282ad7cbc93c163061249dcfd2a98555b89d4"
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
