 //
//  InterstitialViewController.swift
//  AdTestApp
//
//  Created by Shafee Rehman on 01/07/2025.
//

import SwiftUI
import YieldloveAdIntegration

class InterstitialViewController: UIViewController {
    var adSlotId: String
    var delegate: InterstitialViewDelegate?
    var onError: ((String) -> Void)?
    var isLoaded: ((Bool) -> Void)?
    
    init(adSlotId: String) {
        self.adSlotId = adSlotId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadInterstitialAd() {
        self.delegate = InterstitialViewDelegate(viewController: self, errorCallback: onError, isLoaded: isLoaded)
        Yieldlove.instance.interstitialAd(adSlotId: adSlotId, interstitialDelegate: delegate, viewController: self)
    }
    
    deinit {
        delegate = nil
    }
}
