//
//  Contants.swift
//  bill-mind
//
//  Created by Andrew Peterson on 1/6/25.
//

import Foundation

let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

var bills: [BillMetaData] = [
    BillMetaData(id: UUID(), bill: [
        Bill(id: UUID(), name: "Bill 1", amount: 10.99, date: Date()),
        Bill(id: UUID(), name: "Bill 1", amount: 10.99, date: Date()),
        Bill(id: UUID(), name: "Bill 1", amount: 10.99, date: Date()),
        Bill(id: UUID(), name: "Bill 1", amount: 10.99, date: Date()),
        Bill(id: UUID(), name: "Bill 1", amount: 10.99, date: Date()),
        Bill(id: UUID(), name: "Bill 1", amount: 10.99, date: Date()),
        Bill(id: UUID(), name: "Bill 1", amount: 10.99, date: Date()),
        Bill(id: UUID(), name: "Bill 1", amount: 10.99, date: Date()),
    ], billDate: Date()),
]
