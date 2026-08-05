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
            exact: "12.14.0"
        ),
        .package(
            url: "https://github.com/SourcePointUSA/ios-cmp-app.git",
            exact: "7.12.10"
        )
    ],

    targets: [
        .binaryTarget(
            name: "YieldloveAdIntegration",
            url:"https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.6.0/YieldloveAdIntegration.xcframework.zip",
            checksum: "82b5b6d9052964d09e5ff409297df302d39bfba05512f7f53d6c25b030390678"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Consent",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.6.0/YieldloveAdIntegration_Consent.xcframework.zip",
            checksum: "31f3d1bdf4f56b863bc06541923d243e9713220c645db7456ec7198b31611037"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Confiant",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.6.0/YieldloveAdIntegration_Confiant.xcframework.zip",
            checksum: "8df791e84bf243cf8fe66c0da0f564c9e249dffb3d4f9c272c5bcb7b2a80a28b"
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
            sources: [
                "Shim.swift",
                "YieldloveSPMResourceBundleProvider.swift"
            ],
            resources: [
                .copy("YieldloveAdIntegration.bundle")
            ]
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
