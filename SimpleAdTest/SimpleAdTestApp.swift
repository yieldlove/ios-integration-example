//
//  SimpleAdTestApp.swift
//  SimpleAdTest
//
//  Created by Hyungon Kim on 22/07/2024.
//

import SwiftUI
import SwiftData
import YieldloveAdIntegration
import YieldloveConsent

@main
struct SimpleAdTestApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        Yieldlove.setup(appName: "appDfpTest")
        Yieldlove.instance.enableDebug(isEnabled: true)
        // Yieldlove.instance.developerModeEnabled = true

        // Confiant
        ConfiantLoader.shared.enableTestMode()
        ConfiantLoader.shared.initialize(confiantPropertyId: "", enableReload: true){ success in
            if success {
            } else {
            }
        }
        
        // Gravite
//        GraviteLoader.shared.enableDebugMode()
//        GraviteLoader.shared.setCacheSize(size: 3)
//        GraviteLoader.shared.enableDirectGraviteCall()
//        GraviteLoader.shared.enableTestMode(bundleId: nil, accountId: nil, forceToExecute: true)
//        
//        //Define a mapping table
//        let mappingTable: [String: String] = [
//            "banner": "b2",
//            "banner?large": "b3",
//            "intersitial": "int"
//        ]
//        
//        GraviteLoader.shared.setPlacementMapTable(stroeerToGravite: mappingTable)
//        GraviteLoader.shared.initialize(){ success in
//            if success {
//            } else {
//            }
//        }
        
//        let sampleTargets: [String: String] = [
//            "userAge": "25",
//            "userInterest": "sports, technology, music",
//            "userLocation": "New York"
//        ]
        
//         Yieldlove.instance.setCustomTargets(targets: sampleTargets)
        

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
