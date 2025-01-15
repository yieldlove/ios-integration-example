//
//  BannerView.swift
//  SimpleAdTest
//
//  Created by Hyungon Kim on 22/07/2024.
//

import Foundation
import SwiftUI

struct BannerViewUI : View
{
    @State private var bannerViewHeight1: CGFloat = 250
    @State private var bannerViewHeight2: CGFloat = 250
    
    // var adSlotName: String? = nil
    var onDisappearListener1 = OnUIEventListener(name: "Disappear")
    var onReappearListener1 = OnUIEventListener(name: "Appear")
    var onDisappearListener2 = OnUIEventListener(name: "Disappear")
    var onReappearListener2 = OnUIEventListener(name: "Appear")
    @State private var refreshView = [false, false]
    
    var body: some View {
        VStack {
            BannerViewControllerRepresentable(adSlotName: "banner", bannerViewHeight: $bannerViewHeight1, onDisappearListener: onDisappearListener1, onReappearListener: onReappearListener1)
                .onAppear {
                    onReappearListener1.call()
                }
                .onDisappear {
                    onDisappearListener1.call()
                }
                .frame(width: 320, height: self.bannerViewHeight1, alignment: .center)
                .id(refreshView[0])
            
            BannerViewControllerRepresentable(adSlotName: "banner", bannerViewHeight: $bannerViewHeight2, onDisappearListener: onDisappearListener2, onReappearListener: onReappearListener2)
                .onAppear {
                    onReappearListener2.call()
                }
                .onDisappear {
                    onDisappearListener2.call()
                }
                .frame(width: 320, height: self.bannerViewHeight2, alignment: .center)
                .id(refreshView[1])
        }
    }
}

#Preview {
    BannerViewUI()
        .modelContainer(for: Item.self, inMemory: true)
}
