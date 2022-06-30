import UIKit
import GoogleMobileAds

class ViewController: UIViewController {
   
    var bannerView: GAMBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize banner ad
        bannerView = GAMBannerView(adSize: GADAdSizeBanner)
        bannerView.adUnitID = "/6499/example/banner"
        bannerView.rootViewController = self
        bannerView.center = self.view.center
        
        addBannerViewToView(bannerView)
    }
    
    func addBannerViewToView(_ bannerView: GAMBannerView) {
        view.addSubview(bannerView)
        setTimer()
    }
    
    func setTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            print("Banner Load")
            self.bannerView.load(GAMRequest())
        }
        timer.fire()
    }

}
