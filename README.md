# StroeerSDK

A Package that distributes the **Yieldlove Ad Integration** Core and optional plugins (Consent, Confiant, Gravite).  

- For integration details, see the plugin-specific docs as needed.

---

## Important Note

**You must add `-ObjC`** to your app target’s linker flags:

1. Open your Xcode project.
2. Select your app **target** → **Build Settings**.
3. Search for **Other Linker Flags**.
4. Add **`-ObjC`**.

---

### Confiant plugin
- The **Confiant SDK is intentionally not bundled** with the plugin and **must be added by the publisher** at the app level.
