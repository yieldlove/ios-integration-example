//
//  ContentView.swift
//  SimpleAdTest
//
//  Created by Hyungon Kim on 22/07/2024.
//

import SwiftUI
import SwiftData
import YieldloveConsent

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    @State private var showingSheet = [false, false, false,false]
    
    var body: some View {
        
        NavigationView{
            VStack{
                Text("Advertisement Test")
                    .font(.title).padding([.top], 50)
                       
                Button(action: {
                    if let viewController = UIApplication.shared.windows.first?.rootViewController {
                        YLConsent.instance.collect(viewController: viewController, delegate: ConsentHandler())
                    }
                }) {
                    Text("Consent").font(.title).padding([.top], 50)
                }
                
                NavigationLink(destination: BannerViewUI()) {
                    Text("Banner").font(.title).padding([.top], 50)
                }
                NavigationLink(destination: InterstitialViewUI()) {
                    Text("Interstitial").font(.title).padding([.top], 50)
                }
//                NavigationLink(destination: RewardView()) {
//                    Text("Reward").font(.title).padding([.top], 50)
//                }
                NavigationLink(destination: PrivacyManagerView()) {
                    Text("Privacy Manager").font(.title).padding([.top], 50)
                }
            }
        }
//        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
//            YLConsent.requestTrackingPermission()
//        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

class ConsentHandler : ConsentDelegate {
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
