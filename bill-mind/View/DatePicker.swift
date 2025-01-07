//
//  DatePicker.swift
//  bill-mind
//
//  Created by Andrew Peterson on 1/6/25.
//

import SwiftUI

struct DatePicker: View {
    @Binding var currentDate: Date
    
    @State var currentMonth: Int = 0
    
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    var body: some View {
        VStack(spacing: 35) {
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(currentDate.formatted(Date.FormatStyle().year(.defaultDigits)))
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text(currentDate.formatted(Date.FormatStyle().month(.wide)))
                        .font(.title.bold())
                }
                
                Spacer(minLength: 0)
                
                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Button {
                    withAnimation {
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            
            // Day View
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }

            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(extractDate(currentMonth: currentMonth)) { day in
                    CardView(value: day, currentDate: currentDate, bills: bills)
                        .background(
                            //TODO: Fix visual issue with capsule being too big or small on different devices
                            Capsule()
                                .fill(isSameDay(date1: day.date, date2: currentDate) ? Color.gray.opacity(0.8) : Color.white)
                                .frame(maxWidth: .infinity)
                        )
                        .onTapGesture {
                            currentDate = day.date
                        }
                }
            }
            .onChange(of: currentMonth) { oldMonth, newMonth in
                currentDate = getCurrentMonth(currentMonth: newMonth)
            }
            
            VStack(spacing: 20) {
                Text("Bills")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if let bill = bills.first(where: { bill in
                    return isSameDay(date1: bill.billDate, date2: currentDate)
                }) {
                    ForEach(bill.bill) { bill in
                        BillView(bill: bill)
                    }
                }
                else {
                    Text("No Bills Found")
                }
            }
            .padding()
            .padding(.top, 25)
        }
    }
    

}

#Preview {
    ContentView()
}
