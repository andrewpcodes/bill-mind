//
//  Bill.swift
//  bill-mind
//
//  Created by Andrew Peterson on 1/6/25.
//

import SwiftData
import Foundation

@Model
class Bill {
    var id: UUID
    var name: String
    var amount: Decimal
    var date: Date
    var recurring: Bool
    var category: BillCategory?
    
    init(name: String, amount: Decimal, date: Date, recurring: Bool = false, category: BillCategory? = nil) {
        self.id = UUID()
        self.name = name
        self.amount = amount
        self.date = date
        self.recurring = recurring
        self.category = category
    }
    
    func isDateInCurrentMonth() -> Bool {
        let calendar = Calendar.current

        let currentMonth = calendar.component(.month, from: Date())

        let dateMonth = calendar.component(.month, from: self.date)

        return currentMonth == dateMonth
    }
}
