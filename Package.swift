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
            url:"https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.5.2/YieldloveAdIntegration.xcframework.zip",
            checksum: "10415dfeaa8f13f92d3241d5e64520440a7c8f4648e042ea9fd12df20461976f"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Consent",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.5.2/YieldloveAdIntegration_Consent.xcframework.zip",
            checksum: "37566b0def85517fa068dc341b1ffffbaa1a3b86e7d6183caf9366e16e001373"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Confiant",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.5.2/YieldloveAdIntegration_Confiant.xcframework.zip",
            checksum: "3c105c6b690593383f53164a649c8d7ce982ef8791037a90d2f4f6c11b1fb3c3"
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
