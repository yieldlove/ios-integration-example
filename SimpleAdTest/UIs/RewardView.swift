//
//  Reward.swift
//  SimpleAdTest
//
//  Created by Hyungon Kim on 22/07/2024.
//

import Foundation
import SwiftUI

struct RewardView : View
{
    var body: some View {
        Button(action:{
            
        }){
            Text("Reward Refresh").font(.title).padding([.top])
        }
        
    }
}

#Preview {
    InterstitialViewUI()
        .modelContainer(for: Item.self, inMemory: true)
}
