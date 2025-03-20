//
//  InterstitialViewController.swift
//  SimpleAdTest
//
//  Created by Hyungon Kim on 01/08/2024.
//

import Foundation
import UIKit
import YieldloveAdIntegration

class InterstitialViewController : UIViewController{
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        GraviteLoader.shared.viewDidAppear(viewController: self)
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        GraviteLoader.shared.viewWillDisappear(viewController: self)
    }
}


extension InterstitialViewController : ConsentDelegate {
    /// called when there's a consent Message to be shown or before the PM is shown
    func onSPUIReady(){
        
    }

    /// called when the consent ui is closed
    func onSPUIFinished(){
        
    }

    /// called when we finish getting the consent profile from SourcePoint's endpoints
    func onConsentReady(consents: SPUserData){
        
    }

    /// the `onError` function can be called at any moment during the SDKs lifecycle
    func onError(error: YieldloveConsentError){
        
    }
    
    /// called when the user takes an action in the SP UI
    func onAction(action: SPAction) {
        
    }
}
