//
//  InterstitialViewRepresentable.swift
//  SimpleAdTest
//
//  Created by Hyungon Kim on 29/07/2024.
//

import Foundation

import SwiftUI
import CoreData

import YieldloveAdIntegration
import GoogleMobileAds

struct InterstitialViewRepresentable: UIViewControllerRepresentable {
    
    var activeConfig: NSManagedObject?
    private var adSlotName: String
    
    init(adSlotName: String) {
        self.adSlotName = adSlotName
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = InterstitialViewController()
        let interstitialView = InterstitialView(adSlotId: adSlotName, viewController: viewController)
        interstitialView.load()
        return viewController
    }
    
    func updateUIViewController(_ pageViewController: UIViewController, context: Context) {
        // noop
    }
}

