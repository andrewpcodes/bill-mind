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
            
            // Dates
            
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(extractDate(currentMonth: currentMonth)) { day in
                    CardView(value: day, currentDate: currentDate, bills: [Bill(id: UUID(), name: "Test", amount: 1.0, date: Date())])
                        .background(
                            Capsule()
                                .fill(isSameDay(date1: day.date, date2: currentDate) ? Color.gray.opacity(0.8) : Color.white)
                                .padding(.horizontal)
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
        }
    }
    

}

#Preview {
    ContentView()
}
