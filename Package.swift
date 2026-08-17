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
            targets: [
                "YieldloveAdIntegration",
                "YieldloveAdIntegration_Consent",
                "CoreSupport",
                "ConsentSupport"
            ]
        ),
        .library(
            name: "YieldloveAdIntegration_Confiant",
            targets: [
                "YieldloveAdIntegration",
                "YieldloveAdIntegration_Confiant",
                "CoreSupport",
                "ConfiantSupport"
            ]
        )
    ],

    dependencies: [
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            exact: "13.7.0"
        ),
        .package(
            url: "https://github.com/SourcePointUSA/ios-cmp-app.git",
            exact: "7.12.10"
        )
    ],

    targets: [
        .binaryTarget(
            name: "YieldloveAdIntegration",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/1.2.7/YieldloveAdIntegration.xcframework.zip",
            checksum: "5705f41c5e413417b15848ac712e11707656ea2235499dcf4997693055ada262"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Consent",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/1.2.7/YieldloveAdIntegration_Consent.xcframework.zip",
            checksum: "201a902153c26a219a063462e7a2ddfad436eea70a1bc6e6f09b43e0699a1c36"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Confiant",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/1.2.7/YieldloveAdIntegration_Confiant.xcframework.zip",
            checksum: "3e9ad73417dac258ee36ac6679b4ab1ca788a77be52dae6ea7601bf9f800acb3"
        ),
        .binaryTarget(
            name: "XCPrebidMobile",
            path: "Frameworks/XCPrebidMobile.xcframework"
        ),
        .binaryTarget(
            name: "OMSDK_Prebidorg",
            path: "Frameworks/OMSDK_Prebidorg.xcframework"
        ),
        
        .target(
            name: "CoreSupport",
            dependencies: [
                "YieldloveAdIntegration",
                "XCPrebidMobile",
                "OMSDK_Prebidorg",
                .product(
                    name: "GoogleMobileAds",
                    package: "swift-package-manager-google-mobile-ads"
                )
            ],
            path: "Sources/Core",
            sources: ["Shim.swift"]
        ),

        .target(
            name: "ConsentSupport",
            dependencies: [
                "YieldloveAdIntegration",
                "YieldloveAdIntegration_Consent",
                "CoreSupport",
                .product(
                    name: "ConsentViewController",
                    package: "ios-cmp-app"
                )
            ],
            path: "Sources/Consent",
            sources: ["Shim.swift"]
        ),

        .target(
            name: "ConfiantSupport",
            dependencies: [
                "YieldloveAdIntegration",
                "YieldloveAdIntegration_Confiant",
                "CoreSupport"
            ],
            path: "Sources/Confiant",
            sources: ["Shim.swift"]
        )
    ]
)
