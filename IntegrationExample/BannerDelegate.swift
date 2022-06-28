import UIKit
import YieldloveAdIntegration

class BannerDelegate: NSObject, YLBannerViewDelegate {
    
    private let viewController: ViewController
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }

    public func bannerViewDidReceiveAd(_ ylBannerView: YLBannerView) {
        let bannerView = ylBannerView.getBannerView()
        
        // OPTIONAL: Center the banner in the app view
        bannerView.center = viewController.view.center
        
        // Add banner as a subview
        viewController.view.addSubview(bannerView)
        
        // This line is needed to resize ads that may come from Prebid
        Yieldlove.instance.resizeBanner(banner: ylBannerView)
    }

    public func bannerView(_ bannerView: YLBannerView, didFailToReceiveAdWithError error: Error) {
        print("ERROR: \(error.localizedDescription)")          // Print error, that happened while loading ad
    }
    
    // Other BannerDelegate lifecycle methods ...

}
