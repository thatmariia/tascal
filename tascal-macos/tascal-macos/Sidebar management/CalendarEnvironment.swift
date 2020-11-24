//
//  CalendarEnvironment.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 19/11/2020.
//

import Foundation


class CalendarEnvironment : ObservableObject {
    
    @Published var day: Date = Calendar.current.date(from:
                                                        DateComponents(year: DateInfo(date: Date()).year,
                                                                       month: DateInfo(date: Date()).month_int,
                                                                       day: 1))!
    
    @Published var months: [Date] = calendar.generateDates(
        inside: DateInterval(start: Calendar.current.date(from:
                                                            DateComponents(year: DateInfo(date: Date()).year,
                                                                           month: DateInfo(date: Date()).month_int,
                                                                           day: 1))!,
                             
                             end: calendar.date(byAdding: .month, value: 1, to:
                                                    Calendar.current.date(from:
                                                                            DateComponents(year: DateInfo(date: Date()).year,
                                                                                           month: DateInfo(date: Date()).month_int,
                                                                                           day: 1))!)!
                             ),
                             
                             matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
        )
    
    func update_to_today() {
        let next_day = Calendar.current.date(from:
                                            DateComponents(year: DateInfo(date: Date()).year,
                                                           month: DateInfo(date: Date()).month_int,
                                                           day: 1))!
        
        let next_next_day = calendar.date(byAdding: .month, value: 1, to: next_day)!
        
        let interval = DateInterval(start: next_day,
                                    end: next_next_day)
        
        self.day = next_day
        
        self.months = calendar.generateDates(
            inside: interval,
            matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
        )
        
    }
    
    func update(right: Bool) {
        let nr_months = right ? 1 : -1
        
        let next_day = calendar.date(byAdding: .month, value: nr_months, to: self.day)!
        let next_next_day = calendar.date(byAdding: .month, value: 1, to: next_day)!
        
        let interval = DateInterval(start: next_day,
                                    end: next_next_day)
        self.day = next_day
        
        self.months = calendar.generateDates(
            inside: interval,
            matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
        )
    }
    
    
    
    func days(for month: Date) -> [Date] {
        guard
            let monthInterval = calendar.dateInterval(of: .month, for: month),
            let monthFirstWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.start),
            let monthLastWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.end)
        else { return [] }
        return calendar.generateDates(
            inside: DateInterval(start: monthFirstWeek.start, end: monthLastWeek.end),
            matching: DateComponents(hour: 0, minute: 0, second: 0)
        )
    }
    
}

extension Calendar {
    func generateDates(
        inside interval: DateInterval,
        matching components: DateComponents
    ) -> [Date] {
        var dates: [Date] = []
        dates.append(interval.start)
        
        enumerateDates(
            startingAfter: interval.start,
            matching: components,
            matchingPolicy: .nextTime
        ) { date, _, stop in
            if let date = date {
                if date < interval.end {
                    dates.append(date)
                } else {
                    stop = true
                }
            }
        }
        
        return dates
    }
}
