//
//  InterstitialView.swift
//  SimpleAdTest
//
//  Created by Hyungon Kim on 22/07/2024.
//

import Foundation
import SwiftUI

struct InterstitialView : View
{
    var body: some View {
        Button(action:{
            
        }){
            Text("Interstitial Refresh").font(.title).padding([.top])
        }
        
    }
}

#Preview {
    InterstitialView()
        .modelContainer(for: Item.self, inMemory: true)
}
