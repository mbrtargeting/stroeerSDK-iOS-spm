//
//  InterstitialViewDelegate.swift
//  AdTestApp
//
//  Created by Shafee Rehman on 01/07/2025.
//

import SwiftUI
import YieldloveAdIntegration

class InterstitialViewDelegate: YLInterstitialAdDelegate {
    weak var viewController: UIViewController?
    var isLoaded: ((Bool) -> Void)?
    var errorCallback: ((String) -> Void)?
    
    init(viewController: UIViewController, errorCallback: ((String) -> Void)? = nil, isLoaded: ((Bool) -> Void)? = nil) {
        self.viewController = viewController
        self.errorCallback = errorCallback
        self.isLoaded = isLoaded
    }
    
    func onAdLoaded(interstitial: YLInterstitialAd) {
        if let viewController = viewController {
            interstitial.show(viewController: viewController)
            self.isLoaded?(true)
        }
    }
    
    func onAdFailedToLoad(interstitial: YLInterstitialAd?, error: any Error) {
        let message = "Failed to load interstitial ad: \(error.localizedDescription)"
        DispatchQueue.main.async {
            self.errorCallback?(message)
            self.isLoaded?(true)
        }
    }
}
