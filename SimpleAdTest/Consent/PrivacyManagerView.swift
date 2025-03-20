//
//  PrivacyManagerView.swift
//  SimpleAdTest
//
//  Created by Hyungon Kim on 22/07/2024.
//

import Foundation
import SwiftUI
import YieldloveAdIntegration

struct PrivacyManagerView : UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        return DedicatedPrivacyManagerViewController()
    }
    
    func updateUIViewController(_ pageViewController: UIViewController, context: Context) {
    }
}


class DedicatedPrivacyManagerViewController: UIViewController, ConsentDelegate {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        YLConsent.instance.showPrivacyManager(viewController: self, delegate: self)
    }

    func consentUIDidDisappear() {
        print("PM Disappear")
    }

    func onConsentReady(consents: SPUserData) {
        print("PM Ready - description: \(consents.description)")
    }

    func onError(error: YieldloveConsentError) {
        print("PM Error: \(error)")
    }
    
    func onAction(action: SPAction) {
        print("PM Action: \(action.type)")
    }

}
