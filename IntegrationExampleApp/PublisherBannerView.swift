import SwiftUI
import YieldloveAdIntegration
import GoogleMobileAds

class BannerView: UIView, YLBannerViewDelegate {
    
    @Binding var bannerViewHeight: CGFloat
    
    weak var viewController: UIViewController?
    weak var adView: GADBannerView?
    
    private var adSlotId: String?
    private var errorBannerView: ErrorBannerView?
    
    init(adSlotId: String, viewController: UIViewController, bannerViewHeight: Binding<CGFloat>) {
        self.adSlotId = adSlotId
        self.viewController = viewController
        let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        self._bannerViewHeight = bannerViewHeight
        super.init(frame: rect)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func bannerViewDidReceiveAd(_ bannerView: YLBannerView) {
        adView = bannerView.getBannerView()
        viewController?.view.addSubview(bannerView.getBannerView())
        Yieldlove.instance.resizeBanner(banner: bannerView)
        if let height = adView?.adSize.size.height {
            self.bannerViewHeight = height
        }
    }
    
    public func bannerView(_ bannerView: YLBannerView, didFailToReceiveAdWithError error: Error) {
        addErrorView(error: error)
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
        errorBannerView?.removeFromSuperview()
    }

    func addErrorView(error: Error) {
        let errorView = ErrorBannerView(error: error)
        errorView.translatesAutoresizingMaskIntoConstraints = false
        if let safeViewController = viewController {
            errorView.frame = safeViewController.view.bounds
            self.insertSubview(errorView, at: 0)
            errorBannerView = errorView
        }
    }
    
    func getGAMRequest() -> GAMRequest {
        let publishersRequest = GAMRequest()
        publishersRequest.contentURL = "http://jobs.stroeer-labs.com"
        return publishersRequest
    }
    
}


final class PublisherBannerViewVC: UIViewControllerRepresentable {
    @Binding var bannerViewHeight: CGFloat
    
    var bannerDelegate: YLBannerViewDelegate?
    var bannerView: BannerView?
    var adSlotName: String?
    var viewController: UIViewController?
    
    init(adSlotName: String?, bannerViewHeight: Binding<CGFloat>) {
        self.adSlotName = adSlotName
        self._bannerViewHeight = bannerViewHeight
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let myViewController = UIViewController()
        if let adSlotName = self.adSlotName {
            let bannerView = BannerView(adSlotId: adSlotName, viewController: myViewController, bannerViewHeight: self.$bannerViewHeight)
            self.bannerView = bannerView
            self.bannerView?.load()
        }
        viewController = myViewController
        return myViewController
    }

    func updateUIViewController(_ pageViewController: UIViewController, context: Context) {}
    
}


final class PublisherBannerView: View {
    @State private var bannerViewHeight: CGFloat = 0
    var adSlotName: String? = nil
    
    var body: some View {
        HStack {
            PublisherBannerViewVC(adSlotName: adSlotName, bannerViewHeight: self.$bannerViewHeight)
        }
        .frame(width: 320, height: self.bannerViewHeight, alignment: .center)
    }
}
