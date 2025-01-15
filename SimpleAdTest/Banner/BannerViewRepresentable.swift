//
//  BannerViewRepresentable.swift
//  SimpleAdTest
//
//  Created by Hyungon Kim on 22/07/2024.
//

import Foundation
import SwiftUI
import YieldloveAdIntegration
import YieldloveExternalConfiguration


struct BannerViewControllerRepresentable: UIViewControllerRepresentable {

    @Binding var bannerViewHeight: CGFloat
    
    private var adSlotName: String?
    private var bannerDelegate: YLBannerViewDelegate?
    private var viewController: BannerViewController
    private let onDisappearListener: OnUIEventListener
    private let onAppearListener: OnUIEventListener
    
    init(adSlotName: String?, bannerViewHeight: Binding<CGFloat>, onDisappearListener: OnUIEventListener, onReappearListener: OnUIEventListener) {
        self.adSlotName = adSlotName
        self._bannerViewHeight = bannerViewHeight
        self.onDisappearListener = onDisappearListener
        self.onAppearListener = onReappearListener
        viewController = BannerViewController()
    }

    func makeUIViewController(context: Context) -> BannerViewController {
        return viewController
    }

    func updateUIViewController(_ bannerViewController: BannerViewController, context: Context) {
        onAppearListener.setClosure {
            self.onBannerViewAppear(bannerViewController)
        }
        onDisappearListener.setClosure(onBannerViewDisappear)
    }
    
    func onBannerViewDisappear() {
        viewController.bannerViewDelegate = nil
    }
    
    func onBannerViewAppear(_ bannerViewController: BannerViewController) {
        if let adSlotName = self.adSlotName {
            let bannerView = BannerViewDelegate(adSlotId: adSlotName, viewController: bannerViewController, bannerViewHeight: self.$bannerViewHeight)
            bannerViewController.bannerViewDelegate = bannerView
            bannerViewController.bannerViewDelegate?.load()
            onDisappearListener.setClosure(onBannerViewDisappear)
        }
    }
}

class OnUIEventListener {
    
    private var name : String
    
    init(name: String)
    {
        self.name = name
    }
    
    typealias Closure = () -> Void
    
    private var closure: Closure?
    
    func setClosure(_ closure: @escaping Closure) {
        self.closure = closure
    }
    
    func call() {
        self.closure?()
    }
    
}
