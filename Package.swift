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
            checksum: "5333b079d467aeb533f2134472cbfff7905779ec5ebdbdf8d3447cb64a672e3e"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Consent",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.6.0/YieldloveAdIntegration_Consent.xcframework.zip",
            checksum: "0a6d75c481c823d5acc69797ef9ec61925d61e3bdca08ea75d4cb7dbeb606fe8"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Confiant",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.6.0/YieldloveAdIntegration_Confiant.xcframework.zip",
            checksum: "e0da8ba92107c393f88f7aab033de08214931127df4089c067df67be6c944daa"
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
