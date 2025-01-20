//
//  BillsView.swift
//  bill-mind
//
//  Created by Andrew Peterson on 1/17/25.
//

import SwiftUI

struct BillsView: View {
    var bills: [Bill]
    var currentDate: Date
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Bills")
                .font(.title2.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if bills.filter({ isSameDay(date1: $0.date, date2: currentDate)}).isEmpty {
                Text("No Bills Today")
                    .font(.callout)
            } else {
                ForEach(bills.filter({ isSameDay(date1: $0.date, date2: currentDate) })) { bill in
                    BillView(bill: bill)
                }
            }
        }
        .padding()
        .padding(.top, 25)
    }
}

#Preview {
    ContentView()
}
