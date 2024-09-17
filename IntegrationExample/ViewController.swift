import UIKit
import YieldloveAdIntegration

class ViewController: UIViewController {
    var bannerView : BannerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Test configuration
        let appName = "appDfpTest"
        // Setup Yieldlove (this should be done only once)
        Yieldlove.setup(appName: appName)
        // Yieldlove.instance.developerModeEnabled = true
        Yieldlove.instance.enableDebug(isEnabled: true)
        loadBanner()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        clearBanner()
    }

    func loadBanner() {
        let adSlotId = "b1"

        bannerView = BannerDelegate(adSlotId: adSlotId, viewController: self)
        bannerView?.load()
    }

    func clearBanner() {
        self.bannerView?.clearBanner()
        self.bannerView = nil
    }
}
