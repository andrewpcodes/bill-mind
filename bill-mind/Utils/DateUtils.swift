//
//  DateUtils.swift
//  bill-mind
//
//  Created by Andrew Peterson on 1/6/25.
//

import Foundation

extension Date {
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}

func extractDate(currentMonth: Int) -> [DateValue] {
    let calendar = Calendar.current

    let currentMonth = getCurrentMonth(currentMonth: currentMonth)
    
    var days = currentMonth.getAllDates().compactMap { date -> DateValue in
        let day = calendar.component(.day, from: date)
        
        return DateValue(day: day, date: date)
    }
    
    let firstWeekDay = calendar.component(.weekday, from: days.first?.date ?? Date())
    
    for _ in 0..<(firstWeekDay - 1)  {
        days.insert(DateValue(day: -1, date: Date()), at: 0)
    }
    
    return days
}

func getCurrentMonth(currentMonth: Int) -> Date {
    let calendar = Calendar.current

    guard let currentMonth = calendar.date(byAdding: .month, value: currentMonth, to: Date()) else {
        return Date()
    }
    
    return currentMonth
}

func isSameDay(date1: Date, date2: Date) -> Bool {
    let calendar = Calendar.current

    return calendar.isDate(date1, inSameDayAs: date2)
}
