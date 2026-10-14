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
            url:"https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.6.2/YieldloveAdIntegration.xcframework.zip",
            checksum: "1640c4ba9e39825710b5ec61a7890d581898e6e1f85d09082e0de8c422080df8"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Consent",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.6.2/YieldloveAdIntegration_Consent.xcframework.zip",
            checksum: "09a642e0023ee71ed582a45e9aa6d20f8aaec17876f6b079721c8b41b35ca7cf"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Confiant",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.6.2/YieldloveAdIntegration_Confiant.xcframework.zip",
            checksum: "f1b96a6f084c5dd4980a583cf2854e6070e624886b17aadc4c0c71ee193dcf10"
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

