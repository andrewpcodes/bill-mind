//
//  EditBillView.swift
//  bill-mind
//
//  Created by Andrew Peterson on 1/8/25.
//

import SwiftUI

struct EditBillView: View {
    @Binding var bill: Bill
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $bill.name)
                    .textContentType(.name)
            }
        }
        .navigationTitle("Edit Bill")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    EditBillView()
//}
