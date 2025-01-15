//
//  InterstitialView.swift
//  SimpleAdTest
//
//  Created by Hyungon Kim on 22/07/2024.
//

import Foundation
import SwiftUI

struct InterstitialViewUI : View
{
    var body: some View {
        InterstitialViewRepresentable(adSlotName: "interstitial")
    }
}

#Preview {
    InterstitialViewUI()
        .modelContainer(for: Item.self, inMemory: true)
}
