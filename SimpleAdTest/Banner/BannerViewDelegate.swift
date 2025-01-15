import SwiftUI
import YieldloveAdIntegration
import GoogleMobileAds

class BannerViewDelegate: YLBannerViewDelegate {
    
    @Binding var bannerViewHeight: CGFloat
    
    private var adSlotId: String?
    
    weak var viewController: UIViewController?
    weak var adView: GADBannerView?
    
    init(adSlotId: String, viewController: UIViewController, bannerViewHeight: Binding<CGFloat>) {
        self.adSlotId = adSlotId
        self.viewController = viewController
        self._bannerViewHeight = bannerViewHeight
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func bannerViewDidReceiveAd(_ bannerView: YLBannerView) {
        adView = bannerView.getBannerView()
        print("this ad is from \(bannerView.getAdSource().description)")
        
        viewController?.view.addSubview(bannerView.getBannerView())
        Yieldlove.instance.resizeBanner(banner: bannerView) {
            if let height = self.adView?.adSize.size.height {
                self.bannerViewHeight = height
            }
        }
    }
    
    public func bannerView(_ bannerView: YLBannerView, didFailToReceiveAdWithError error: Error) {
        // should test app show an error?
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
