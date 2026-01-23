import SwiftUI
import YieldloveAdIntegration
import GoogleMobileAds

class BannerViewDelegate: YLBannerViewDelegate {
    var viewController: UIViewController
    var onAdSize: ((CGSize) -> Void)?
    
    init(viewController: UIViewController, onAdSize: ((CGSize) -> Void)? = nil) {
        self.viewController = viewController
        self.onAdSize = onAdSize
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bannerViewDidReceiveAd(_ bannerView: YLBannerView) {
        viewController.view.addSubview(bannerView)

        Yieldlove.instance.resizeBanner(banner: bannerView) {
            bannerView.layoutIfNeeded()
            let size = bannerView.getBannerSize()
            self.onAdSize?(size)
        }
    }
    
    public func bannerView(_ bannerView: YLBannerView, didFailToReceiveAdWithError error: Error) {
        // should test app show an error?
    }
}
