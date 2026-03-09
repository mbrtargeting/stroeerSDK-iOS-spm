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
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.4.1/YieldloveAdIntegration.xcframework.zip",
            checksum: "aaf672bf46ae8d60b078e1325a18e25aa023e8ffb30ebbe4305e6dd9c3814f52"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Consent",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.4.1/YieldloveAdIntegration_Consent.xcframework.zip",
            checksum: "5a639512762cfbc37df11e1878911ddf375742b915a7a2a4909455b1a5fb839a"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Confiant",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.4.1/YieldloveAdIntegration_Confiant.xcframework.zip",
            checksum: "7f50f7bf3a29d8b541d8833ba8349ac5ef2d35df5c2e8eb404db3b5c9410cbfb"
        ),
        .binaryTarget(
            name: "YieldloveAdIntegration_Gravite",
            url: "https://github.com/mbrtargeting/stroeerSDK-iOS-spm/releases/download/10.4.1/YieldloveAdIntegration_Gravite.xcframework.zip",
            checksum: "7e3e5f5c46d9f20c7c373c8a4fa7c27ee9d7f9607d28119207888d8f34f2ffb9"
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
