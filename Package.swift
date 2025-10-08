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
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.2.0/YieldloveAdIntegration.xcframework.zip",
            checksum: "769ef157a72b551310ac8345275e9b6c6f99740a99022c03686b45bfc550e063"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Consent",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.2.0/YieldloveAdIntegration_Consent.xcframework.zip",
            checksum: "9e50055e057dd16f675d70cd9605259c85f43cb2edacc774d4b9b55870b7d4a9"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Confiant",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.2.0/YieldloveAdIntegration_Confiant.xcframework.zip",
            checksum: "d6f96b5a822a86f2a6523e2c3ce3edd705bd5ab42e83d34a2cd4eb10a6413723"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Gravite",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.2.0/YieldloveAdIntegration_Gravite.xcframework.zip",
            checksum: "c09c2da0faa6b8ba22c5081ebf1f65aad8d1ea46c730cbea4dffe1e55579f433"
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
