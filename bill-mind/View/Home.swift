//
//  CalendarView.swift
//  bill-mind
//
//  Created by Andrew Peterson on 1/5/25.
//

import SwiftUI

struct Home: View {
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                DatePicker(currentDate: $currentDate)
            }
        }
    }
}

#Preview {
    Home()
}
