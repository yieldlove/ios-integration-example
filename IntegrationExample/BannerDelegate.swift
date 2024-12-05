import UIKit
import YieldloveAdIntegration
import GoogleMobileAds

class BannerDelegate: NSObject, YLBannerViewDelegate {
    
    private var adSlotId: String
    
    private weak var viewController: ViewController?
    private weak var adView : GADBannerView?
    
    init(adSlotId: String, viewController: ViewController) {
        self.adSlotId = adSlotId
        self.viewController = viewController
    }

    public func bannerViewDidReceiveAd(_ ylBannerView: YLBannerView) {
        self.adView = ylBannerView.getBannerView()
        
        // Add banner as a subview
        if let adView = self.adView
        {
            viewController?.view.addSubview(adView)
            
            // This line is needed to resize ads that may come from Prebid
            Yieldlove.instance.resizeBanner(banner: ylBannerView)
        }
    }

    public func bannerView(_ bannerView: YLBannerView, didFailToReceiveAdWithError error: Error) {
        print("ERROR: \(error.localizedDescription)")          // Print error, that happened while loading ad
    }
    
    
    public func load()  {
         Yieldlove.instance.bannerAd(
            adSlotId: adSlotId,
            viewController: viewController!,
            delegate: self
         )
     }
    
    public func clearBanner()
    {
        adView?.removeFromSuperview();
        adView?.delegate = nil
        adView?.rootViewController = nil
        adView = nil
    }
    
    
    func getGAMRequest() -> GAMRequest {
        let publishersRequest = GAMRequest()
        publishersRequest.contentURL = "http://jobs.stroeer-labs.com"
        return publishersRequest
    }
    
}
