import UIKit
import YieldloveAdIntegration

class ViewController: UIViewController {
   
    var bannerView : BannerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Test configuration
        let appName = "mps_motorradonline"
        let adSlotId = "b1"
        
        // Setup Yieldlove (this should be done only once)
        Yieldlove.setup(appName: appName)
        Yieldlove.instance.developerModeEnabled = true
        Yieldlove.instance.enableDebug(isEnabled: true)
        
        bannerView = BannerDelegate(adSlotId: adSlotId, viewController: self)
        bannerView?.load()
                
    }

}
