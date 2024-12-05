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
        
        // Gravite Plugin
        // Enable Gravite debug mode. This will write more log to check
        GraviteLoader.shared.enableDebugMode()
        // Enable test mode for Gravite with the specified bundle ID and test account ID
        // GraviteLoader.shared.enableTestMode(bundleId: "bundleID", accountId: 1234, forceToExecute: true)
        // Initialize the GraviteLoader
        GraviteLoader.shared.initialize() { success in
            if success {
                // Initialization succeeded
                // Add any setup or actions needed after a successful initialization
            } else {
                // Initialization failed
                // Handle the failure, such as logging an error or retrying initialization
            }
        }

        // Confiant Plugin
        ConfiantLoader.shared.initialize(confiantPropertyId: "confiantpropertyID", enableReload: true) { success in
            if success {
                // Initialization succeeded - proceed with your setup
            } else {
                // Initialization failed - handle the failure appropriately
            }
        }

        loadBanner()
    }
    
    
    // Gravite
    // This is only for Gravite.
    // If you don't use this, you don't need to add following codes
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated) // Always call the superclass implementation first
        // Notify GraviteLoader that the view has appeared
        GraviteLoader.shared.viewDidAppear(viewController: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated) // Call the superclass implementation last
        // Notify GraviteLoader that the view is about to disappear
        GraviteLoader.shared.viewWillDisappear(viewController: self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        clearBanner()
    }

    func loadBanner() {
        let adSlotId = "banner"

        bannerView = BannerDelegate(adSlotId: adSlotId, viewController: self)
        bannerView?.load()
    }

    func clearBanner() {
        self.bannerView?.clearBanner()
        self.bannerView = nil
    }
    
}
