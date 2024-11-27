//
//  TranslateMeApp.swift
//  TranslateMe
//
//  Created by Jose Folgar on 3/31/24.
//

import SwiftUI
import FirebaseCore

@main
struct TranslateMeApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
