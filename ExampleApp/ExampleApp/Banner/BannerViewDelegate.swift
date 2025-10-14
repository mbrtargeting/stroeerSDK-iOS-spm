//
//  SimpleBannerDelegate.swift
//  AdTestApp
//
//  Created by Shafee Rehman on 01/07/2025.
//


import SwiftUI
import YieldloveAdIntegration

class BannerViewDelegate: YLBannerViewDelegate {
    weak var viewController: UIViewController?
    private var bannerHeight: Binding<CGFloat>
    var onError: ((String) -> Void)?
    var isLoaded: ((Bool) -> Void)?

    init(viewController: UIViewController, bannerHeight: Binding<CGFloat>, onError: ((String) -> Void)?, isLoaded: ((Bool) -> Void)? = nil) {
        self.viewController = viewController
        self.bannerHeight = bannerHeight
        self.onError = onError
        self.isLoaded = isLoaded
    }

    func bannerViewDidReceiveAd(_ bannerView: YLBannerView) {
        if let adContainer = viewController?.view {
            adContainer.addSubview(bannerView)
        }
        
        DispatchQueue.main.async {
            self.bannerHeight.wrappedValue = bannerView.frame.height
            self.isLoaded?(true)
        }
    }
    
    func bannerView(_ bannerView: YLBannerView, didFailToReceiveAdWithError error: Error) {
        let message = "Failed to load ad: \(error)"
        DispatchQueue.main.async {
            self.onError?(message)
            self.bannerHeight.wrappedValue = 0
            self.isLoaded?(true)
        }
    }
}
