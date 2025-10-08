# StroeerSDK

A Package that distributes the **Yieldlove Ad Integration** Core and optional plugins (Consent, Confiant, Gravite).  

- For integration details, see the plugin-specific docs as needed.

---

### Integration Steps


- Open your Xcode project, navigate the File tab within the macOS bar, and click on “Add Package Dependencies”.

- In the URL field, enter: https://github.com/mbrtargeting/stroeerSDK-iOS-spm and select stroeersdk-ios-spm.

- Set the dependency rule to "Exact Version" and specify the desired version.

- Click Next and wait for the package to finish fetching.

- When prompted, select Add to Target and choose the YieldloveAdIntegration dependencies for the libraries you want to include. Then click "Add Package".
  
<img width="750" height="530" alt="Screenshot 2025-10-08 at 4 56 23 PM" src="https://github.com/user-attachments/assets/7f85ba33-7a2e-40ce-9665-a9197da8a606" />

## Important Note

**You must add `-ObjC`** to your app target’s linker flags:

1. Open your Xcode project.
2. Select your app **target** → **Build Settings**.
3. Search for **Other Linker Flags**.
4. Add **`-ObjC`**.

### Confiant plugin
The **Confiant SDK is intentionally not bundled** with the plugin and **must be added by the publisher** at the app level.

### Gravite Plugin – Dependency Guidance
For projects using the Gravite plugin, do not add the following AATKit modules to your app:

- AATKit-Prebid

- AATKit-Default

- AATKit-SourcePointCMP

These modules are not supported in our Gravite integration and may cause duplicate linking, unexpected behavior, or conflicts with our SDK’s dependency graph.
