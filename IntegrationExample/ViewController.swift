import UIKit
import YieldloveAdIntegration

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let delegate = BannerDelegate(viewController: self)     // Instanciate banner delegate
        Yieldlove.setup(appName: "appDfpTestMonitoring2")       // Setup Yieldlove with your appName
        Yieldlove.instance.bannerAd(adSlotId: "b2", viewController: self, delegate: delegate) // Request banner with your adSlotId
    }

}
