//
//  GADBannerViewRepresentable.swift
//  AdTestApp
//
//  Created by Shafee Rehman on 01/07/2025.
//

import SwiftUI
import YieldloveAdIntegration

struct BannerViewRepresentable: UIViewControllerRepresentable {
    let adSlotId: String
    @Binding var bannerHeight: CGFloat
    var errorCallback: ((String) -> Void)? = nil
    var isLoaded: ((Bool) -> Void)? = nil

    func makeUIViewController(context: Context) -> BannerViewController {
        let vc = BannerViewController(adSlotId: adSlotId, bannerHeight: $bannerHeight, isLoaded: isLoaded)
        vc.onError = errorCallback
        vc.loadBanner()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: BannerViewController, context: Context) {}
}
