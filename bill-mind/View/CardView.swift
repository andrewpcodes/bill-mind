//
//  CardView.swift
//  bill-mind
//
//  Created by Andrew Peterson on 1/6/25.
//

import SwiftUI

@ViewBuilder
func CardView(value: DateValue, currentDate: Date, bills: [BillMetaData]) -> some View {
    VStack {
        if value.day != -1 {
            if let bill = bills.first(where: { bill in
                return isSameDay(date1: bill.billDate, date2: value.date)
            }) {
                Text("\(value.day)")
                    .font(.title3.bold())
                    .foregroundColor(isSameDay(date1: bill.billDate, date2: currentDate) ? .white : .black)
                    .frame(maxWidth: .infinity)
                Spacer()
                Circle()
                    .fill(isSameDay(date1: bill.billDate, date2: value.date) ? .red : .white)
                    .frame(width: 8, height: 8)
            } else {
                Text("\(value.day)")
                    .font(.title3.bold())
                    .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                    .frame(maxWidth: .infinity)
                Spacer()
            }
        }
    }
    .padding(.vertical, 8)
    .frame(height: 60, alignment: .top)
}

#Preview {
    ContentView()
}
