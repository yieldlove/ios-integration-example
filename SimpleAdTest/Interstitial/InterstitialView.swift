//
//  InterstitialView.swift
//  SimpleAdTest
//
//  Created by Hyungon Kim on 29/07/2024.
//
import YieldloveAdIntegration
import GoogleMobileAds

class InterstitialView: NSObject, YLInterstitialAdDelegate {
    
    private var adSlotId: String?
    weak var viewController: UIViewController?
    weak var interstitial: GAMInterstitialAd?
    
    init(adSlotId: String, viewController: UIViewController) {
        self.adSlotId = adSlotId
        self.viewController = viewController
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func load()  {
         if let adSlot = adSlotId {
            let gamRequest = GAMRequest()
            gamRequest.contentURL = "www.example.com"
            Yieldlove.instance.interstitialAd(
                adSlotId: adSlot,
                interstitialDelegate:  self,
                viewController: viewController!,
                request: gamRequest)
         }
     }
    
    public func onAdLoaded(interstitial: YLInterstitialAd) {
        print("interstitial ad is from \(interstitial.getAdSource().description)")
        if(viewController != nil)
        {
            interstitial.show(viewController: viewController!)
        }
            
    }
    
    public func onAdFailedToLoad(interstitial: YLInterstitialAd?, error: any Error) {
        print("interstitial ad failed to load with error: \(error.localizedDescription)")
    }
}

