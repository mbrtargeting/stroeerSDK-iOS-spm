// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "stroeerSDK",
    platforms: [.iOS(.v15)],

    products: [
        .library(
            name: "StroeerSDK",
            targets: ["StroeerSDK", "CoreSupport"]
        ),
        .library(
            name: "StroeerSDK_Consent",
            targets: [
                "StroeerSDK",
                "StroeerSDK_Consent",
                "CoreSupport",
                "ConsentSupport"
            ]
        ),
        .library(
            name: "StroeerSDK_Confiant",
            targets: [
                "StroeerSDK",
                "StroeerSDK_Confiant",
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
            name: "StroeerSDK",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/0.0.0/StroeerSDK.xcframework.zip",
            checksum: "1caa54aaf7488fd9d7178fd82e3646f7ac11758a1d3f41ef3bd840c6be9f89b9"
        ),
        .binaryTarget(
            name: "StroeerSDK_Consent",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/0.0.0/StroeerSDK_Consent.xcframework.zip",
            checksum: "5e36355251ba4b2e3b8ceaaefa3046923e746635463a601c5fddf550d1ad1a5f"
        ),
        .binaryTarget(
            name: "StroeerSDK_Confiant",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/0.0.0/StroeerSDK_Confiant.xcframework.zip",
            checksum: "c1e45fdbd08b10deff010dd8ad0a24d2688db9a270f4e94fa0b69d0f71027c3d"
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
                "StroeerSDK",
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
                "StroeerSDK",
                "StroeerSDK_Consent",
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
                "StroeerSDK",
                "StroeerSDK_Confiant",
                "CoreSupport"
            ],
            path: "Sources/Confiant",
            sources: ["Shim.swift"]
        )
    ]
)

