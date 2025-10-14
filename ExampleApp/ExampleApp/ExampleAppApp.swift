//
//  ExampleAppApp.swift
//  ExampleApp
//
//  Created by Shafee Rehman on 14/10/2025.
//

import SwiftUI
import YieldloveAdIntegration

@main
struct ExampleAppApp: App {
    
    init() {
        Yieldlove.setup(appName: "appDfpTest")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
