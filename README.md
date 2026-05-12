# StroeerSDK

A Swift Package that distributes the **Yieldlove Ad Integration** Core SDK and optional plugins:

- Consent
- Confiant
- Gravite

For integration details, refer to the plugin-specific documentation where applicable.

---

## Integration Steps

1. Open your Xcode project.
2. From the macOS menu bar, select **File** → **Add Package Dependencies**.
3. In the package URL field, enter:

   `https://github.com/mbrtargeting/stroeerSDK-iOS-spm`

4. Select `stroeersdk-ios-spm`.
5. Set the dependency rule to **Exact Version** and enter the required SDK version.
6. Click **Next** and wait for the package to finish fetching.
7. When prompted, select **Add to Target** and choose the `YieldloveAdIntegration` libraries you want to include.
8. Click **Add Package**.

<img width="750" height="530" alt="Screenshot 2025-10-08 at 4 56 23 PM" src="https://github.com/user-attachments/assets/7f85ba33-7a2e-40ce-9665-a9197da8a606" />

---

## Important Linker Flag

You must add `-ObjC` to your app target’s linker flags.

### Add `-ObjC`

1. Open your Xcode project.
2. Select your app target.
3. Open **Build Settings**.
4. Search for **Other Linker Flags**.
5. Add:

   `-ObjC`

---

## Google Mobile Ads SDK Requirement

The **Google Mobile Ads SDK is not bundled automatically** through this package.  
Publishers must add it manually at the app level.

Required package:

- `https://github.com/googleads/swift-package-manager-google-mobile-ads.git`

### Required Version

Choose the Google Mobile Ads SDK version based on the StroeerSDK products included in your app:

| Integration | Required Google Mobile Ads SDK version |
|---|---|
| Core only | Exact `12.11.0` |
| Core + Consent | Exact `12.11.0` |
| Core + Confiant | Exact `12.11.0` |
| Core + Consent + Confiant | Exact `12.11.0` |
| Any integration that includes Gravite | Exact `12.2.0` |

### Important

If your app uses:

- `YieldloveAdIntegration_Gravite`

you must use:

- **Google Mobile Ads SDK exact version `12.2.0`**

For all integrations **without Gravite**, use:

- **Google Mobile Ads SDK exact version `12.11.0`**

Do not add multiple versions of the Google Mobile Ads SDK to the same project.

---

## Core SDK

If you only use the core SDK, add:

- `YieldloveAdIntegration`

You must also add the Google Mobile Ads SDK at the publisher app level:

- `https://github.com/googleads/swift-package-manager-google-mobile-ads.git`
- Exact version: `12.11.0`

No additional publisher-managed plugin dependency is required for the core product.

---

## Consent Plugin

If you use:

- `YieldloveAdIntegration_Consent`

you must also add the following dependencies at the **publisher app level**.

### Required Dependencies

#### Google Mobile Ads SDK

- `https://github.com/googleads/swift-package-manager-google-mobile-ads.git`
- Exact version: `12.11.0`

#### SourcePoint CMP

- `https://github.com/SourcePointUSA/ios-cmp-app.git`
- Version: `7.12.9`

### Important

The Consent dependency is **not bundled automatically** through this package.  
Publishers using `YieldloveAdIntegration_Consent` must add `ios-cmp-app` themselves.

---

## Confiant Plugin

If you use:

- `YieldloveAdIntegration_Confiant`

you must also add the Google Mobile Ads SDK at the **publisher app level**:

- `https://github.com/googleads/swift-package-manager-google-mobile-ads.git`
- Exact version: `12.11.0`

The Confiant SDK is intentionally **not bundled** with the plugin and must be added by the publisher at the app level, if required by the integration.
- Exact version: `6.1.3`
---

## Gravite Plugin

If you use:

- `YieldloveAdIntegration_Gravite`

you must also add the following dependencies at the **publisher app level**.

### Required Dependencies

#### Google Mobile Ads SDK

- `https://github.com/googleads/swift-package-manager-google-mobile-ads.git`
- Exact version: `12.2.0`

#### AATKit

- `https://github.com/AddApptr/AATKitSPM.git`
- Version: `3.12.7`

### Important

The AATKit dependency is **not bundled automatically** through this package.  
Publishers using `YieldloveAdIntegration_Gravite` must add `AATKitSPM` themselves.

Any app that includes the Gravite plugin must use:

- **Google Mobile Ads SDK exact version `12.2.0`**

This applies even when Gravite is used together with Consent and/or Confiant.

### Dependency Guidance

For projects using the Gravite plugin, do **not** add the following AATKit modules to your app:

- `AATKit-Prebid`
- `AATKit-Default`
- `AATKit-SourcePointCMP`

These modules are not supported in our Gravite integration and may cause duplicate linking, unexpected behavior, or conflicts with the SDK setup.

---

## Example App

An `ExampleApp` project is included in this repository to demonstrate how to integrate and use the SDK in a real Swift project.
