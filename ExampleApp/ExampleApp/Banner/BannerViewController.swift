//
//  BannerViewController.swift
//  SimpleAdTest
//
//  Created by Hyungon Kim on 22/07/2024.
//

import Foundation
import UIKit
import YieldloveAdIntegration

class BannerViewController: UIViewController {
    var slotId: String = ""
    var onAdSize: ((CGSize) -> Void)?
    var bannerViewDelegate: BannerViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bannerViewDelegate = BannerViewDelegate(viewController: self, onAdSize: onAdSize)
        Yieldlove.instance.bannerAd(
            adSlotId: slotId,
            viewController: self,
            delegate: bannerViewDelegate!
        )
    }
}
