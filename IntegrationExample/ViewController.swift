import UIKit
import YieldloveAdIntegration

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Test configuration
        let appName = "appDfpTestMonitoring2"
        let adSlotId = "b2"
        
        // Setup Yieldlove (this should be done only once)
        Yieldlove.setup(appName: appName)
        
        // Initialize banner ad
        let delegate = BannerDelegate(viewController: self)
        Yieldlove.instance.bannerAd(adSlotId: adSlotId, viewController: self, delegate: delegate)
    }

}
