# StroeerSDK

A Swift Package that distributes the **Yieldlove Ad Integration** SDK with the following products:

- YieldloveAdIntegration (Core)
- YieldloveAdIntegration_Consent
- YieldloveAdIntegration_Confiant

The package automatically resolves all required dependencies for the Core and Consent products.

---

# Integration

1. Open your Xcode project.
2. Select **File → Add Package Dependencies**.
3. Enter:

```
https://github.com/mbrtargeting/stroeerSDK-iOS-spm
```

4. Select the required SDK version (recommended: **Exact Version**).
5. Choose the product(s) you want to integrate.
6. Click **Add Package**.

Available products:

| Product | Includes |
|---------|----------|
| `YieldloveAdIntegration` | Core SDK |
| `YieldloveAdIntegration_Consent` | Core SDK + Consent plugin |
| `YieldloveAdIntegration_Confiant` | Core SDK + Confiant plugin |

---

# Important Linker Flag

Add the following linker flag to your application target.

```
-ObjC
```

Steps:

1. Select your app target.
2. Open **Build Settings**.
3. Search for **Other Linker Flags**.
4. Add:

```
-ObjC
```

---

# Dependencies

## Core

No additional dependencies are required.

The package automatically includes:

- Google Mobile Ads SDK (`12.14.0`)
- Prebid Mobile (`3.3.1`)

---

## Consent

No additional dependencies are required.

The package automatically includes:

- Google Mobile Ads SDK (`12.14.0`)
- Sourcepoint CMP (`7.12.10`)
- Prebid Mobile (`3.3.1`)

---

## Confiant

When using:

```
YieldloveAdIntegration_Confiant
```

the publisher must also integrate:

- **ConfiantSDK**
- **Exact version: 6.1.4**

The Confiant SDK is intentionally kept separate from this package.

---

# Example App

An ExampleApp is included in this repository demonstrating integration of the SDK.
