//
//  BannerHostingController.swift
//  AdTestApp
//
//  Created by Shafee Rehman on 01/07/2025.
//


import SwiftUI
import YieldloveAdIntegration

class BannerViewController: UIViewController {
    private let adSlotId: String
    private var bannerDelegate: BannerViewDelegate?
    private var bannerHeightBinding: Binding<CGFloat>
    var onError: ((String) -> Void)?
    var isLoaded: ((Bool) -> Void)?

    init(adSlotId: String, bannerHeight: Binding<CGFloat>, isLoaded: ((Bool) -> Void)? = nil) {
        self.adSlotId = adSlotId
        self.bannerHeightBinding = bannerHeight
        self.isLoaded = isLoaded
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    public func loadBanner() {
        bannerDelegate = BannerViewDelegate(viewController: self, bannerHeight: bannerHeightBinding, onError: onError, isLoaded: isLoaded)
        Yieldlove.instance.bannerAd(adSlotId: adSlotId, viewController: self, delegate: bannerDelegate!)
    }

    deinit {
        bannerDelegate = nil
    }
}
