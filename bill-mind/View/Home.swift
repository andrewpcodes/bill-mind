//
//  CalendarView.swift
//  bill-mind
//
//  Created by Andrew Peterson on 1/5/25.
//

import SwiftUI
import SwiftData

struct Home: View {
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    DatePicker()
                }
                .padding(.vertical)
            }
            .modelContext(modelContext)
    }
}

#Preview {
    ContentView()
}
