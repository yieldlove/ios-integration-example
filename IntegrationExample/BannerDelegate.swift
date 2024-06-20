import UIKit
import YieldloveAdIntegration
import GoogleMobileAds

class BannerDelegate: NSObject, YLBannerViewDelegate {
    
    private var adSlotId: String?

    
    private let viewController: ViewController?
    
    weak var adView: GADBannerView?
    
    init(adSlotId: String, viewController: ViewController) {
        self.adSlotId = adSlotId
        self.viewController = viewController
    }

    public func bannerViewDidReceiveAd(_ ylBannerView: YLBannerView) {
        let bannerView = ylBannerView.getBannerView()
        
        // Add banner as a subview
        viewController?.view.addSubview(bannerView)
        
        // This line is needed to resize ads that may come from Prebid
        Yieldlove.instance.resizeBanner(banner: ylBannerView)
    }

    public func bannerView(_ bannerView: YLBannerView, didFailToReceiveAdWithError error: Error) {
        print("ERROR: \(error.localizedDescription)")          // Print error, that happened while loading ad
    }
    
    public func load()  {
         if let adSlot = adSlotId, let vc = viewController {
             Yieldlove.instance.bannerAd(
                adSlotId: adSlot,
                viewController: vc,
                delegate: self
             )
         }
     }
    
    func clearBanner() {
        adView?.removeFromSuperview()
        adView?.delegate = nil
    }
    
    func getGAMRequest() -> GAMRequest {
        let publishersRequest = GAMRequest()
        publishersRequest.contentURL = "http://jobs.stroeer-labs.com"
        return publishersRequest
    }
}
