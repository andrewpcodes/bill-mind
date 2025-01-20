//
//  DatePicker.swift
//  bill-mind
//
//  Created by Andrew Peterson on 1/6/25.
//

import SwiftData
import SwiftUI

// TODO: Rewrite this to leverage SwiftData.
// TODO: This should use SwiftData filtering instead of the whole lazy loading all the days in a month.
// TODO: Restructure the data objects so we dont need two. I think this cal all be done with one object just dith repeating and startDate fields.

struct DatePicker: View {
    @State var currentDate: Date = Date()
    @Query(sort: \Bill.date) var bills: [Bill]
    @State var currentMonth: Int = 0

    let columns = Array(repeating: GridItem(.flexible()), count: 7)

    var body: some View {
        VStack(spacing: 35) {
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(
                        currentDate.formatted(
                            Date.FormatStyle().year(.defaultDigits))
                    )
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
                                .fill(
                                    isSameDay(
                                        date1: day.date, date2: currentDate)
                                        ? Color.gray.opacity(0.8) : Color.white
                                )
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
            BillsView(bills: bills, currentDate: currentDate)
        }
    }
}

#Preview {
    DatePicker()
}
