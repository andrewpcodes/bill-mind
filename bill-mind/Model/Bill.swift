//
//  Bill.swift
//  bill-mind
//
//  Created by Andrew Peterson on 1/6/25.
//

import SwiftUI

struct Bill: Identifiable {
    let id: UUID
    let name: String
    let amount: Double
    let date: Date
}

struct BillMetaData: Identifiable {
    let id: UUID
    let bill: [Bill]
    let billDate: Date
}
