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
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/0.0.5/StroeerSDK.xcframework.zip",
            checksum: "c651319ce4c283072d744d459feabe503fbec297ede24251d867b93818f7cde2"
        ),
        .binaryTarget(
            name: "StroeerSDK_Consent",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/0.0.5/StroeerSDK_Consent.xcframework.zip",
            checksum: "22cebebd921ac1954126c3023738e52321bcd132ae8c402e94b7f6885b4620a8"
        ),
        .binaryTarget(
            name: "StroeerSDK_Confiant",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/0.0.5/StroeerSDK_Confiant.xcframework.zip",
            checksum: "ef64b0a0cd89a8c69709502362ed37488c31894dad5a06bf8b78b1cd4f4ff7d2"
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

