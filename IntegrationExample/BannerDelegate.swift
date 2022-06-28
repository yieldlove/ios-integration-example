import UIKit
import YieldloveAdIntegration

class BannerDelegate: NSObject, YLBannerViewDelegate {
    
    private let viewController: ViewController
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }

    public func bannerViewDidReceiveAd(_ ylBannerView: YLBannerView) {
        let bannerView = ylBannerView.getBannerView()
        bannerView.center = viewController.view.center         // OPTIONAL: Center the banner in the app view
        viewController.view.addSubview(bannerView)             // Add banner as a subview
        Yieldlove.instance.resizeBanner(banner: ylBannerView)  // This line is needed to resize ads that may come from Prebid
    }

    public func bannerView(_ bannerView: YLBannerView, didFailToReceiveAdWithError error: Error) {
        print("ERROR: \(error.localizedDescription)")          // Print error, that happened while loading ad
    }
    
    // Other BannerDelegate lifecycle methods ...

}
