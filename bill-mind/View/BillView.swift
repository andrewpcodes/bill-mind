//
//  BillView.swift
//  bill-mind
//
//  Created by Andrew Peterson on 1/6/25.
//

import SwiftUI

//TODO: Add a way to add a bill
//TODO: Add a way to remove a bill

@ViewBuilder
func BillView(bill: Bill) -> some View {
    VStack(alignment: .leading, spacing: 10) {
        Text(formateDate(date: bill.date))
        HStack {
            Text(bill.name)
                .font(.title2.bold())
            Spacer()
            Text((bill.amount), format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
        }
    }
    .padding(.vertical, 10)
    .padding(.horizontal)
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(
        Color.pink.opacity(0.8).cornerRadius(10)
    )
}

func formateDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d"
    return dateFormatter.string(from: date)
}

#Preview {
    BillView(bill: Bill.init(id: UUID(), name: "Test Bill", amount: 10.99, date: Date()))
}
