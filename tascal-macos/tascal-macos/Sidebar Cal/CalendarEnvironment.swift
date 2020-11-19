//
//  CalendarEnvironment.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 19/11/2020.
//

import Foundation

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

class CalendarEnvironment : ObservableObject {
    
/*    var interval = DateInterval(start: Calendar.current.date(from:
                                                                DateComponents(year: 2020,
                                                                               month: 1,
                                                                               day: 1))!,
                                end: Calendar.current.date(from:
                                                            DateComponents(year: DateInfo(date: Date()).year+2,
                                                                           month: DateInfo(date: Date()).month_int,
                                                                           day: 1))!)*/
    
    @Published var months: [Date] = calendar.generateDates(
            inside: DateInterval(start: Calendar.current.date(from:
                                                                DateComponents(year: 2020,
                                                                               month: 1,
                                                                               day: 1))!,
                                 end: Calendar.current.date(from:
                                                                DateComponents(year: DateInfo(date: Date()).year+1,
                                                                               month: DateInfo(date: Date()).month_int,
                                                                               day: 1))!),
            matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
        )
    
    
    
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
