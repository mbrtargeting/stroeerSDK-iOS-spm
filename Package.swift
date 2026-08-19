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
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/0.0.1/StroeerSDK.xcframework.zip",
            checksum: "80d4aab5ab00ca0f4e5d9536584e2e24d292d84586cb1aeb61b75cb57759a12c"
        ),
        .binaryTarget(
            name: "StroeerSDK_Consent",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/0.0.1/StroeerSDK_Consent.xcframework.zip",
            checksum: "bd98fdad23fcc3a0ce6b2277a405ec5c3639da4ca5023d92e5706bc793e09050"
        ),
        .binaryTarget(
            name: "StroeerSDK_Confiant",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/0.0.1/StroeerSDK_Confiant.xcframework.zip",
            checksum: "dd5031d282c3cc3fb356a1e060524dbe0079aaf7b5c485bd8175f1caadb3b7ff"
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

