//
//  bill_mindApp.swift
//  bill-mind
//
//  Created by Andrew Peterson on 1/5/25.
//

import SwiftUI
import SwiftData

@main
struct bill_mindApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Bill.self)
    }
}
