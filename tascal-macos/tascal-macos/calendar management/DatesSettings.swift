//
//  Dates.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import Foundation
import SwiftUI

class DatesSettings: ObservableObject {
    //TODO:: remember last setting before app closed
    @Published var cal_type = CalType.year
    
    @Published var today    = CalDate(date: Date(), date_info: DateInfo(date: Date()))
    
    // 1 day
    @Published var day      = CalDate(date: Date(), date_info: DateInfo(date: Date()))
    
    // 3 days
    @Published var days     = generate_dates(start_date: Date(), days: 3)
    
    // 1 week
    @Published var week     = generate_dates(start_date: Date(), days: 7)
    
    // 1 year
    @Published var year     = generate_dates(start_date: Date(), years: 1)
    
    func update_date(date: Date) {
        self.day          = CalDate(date: date, date_info: DateInfo(date: date))
        self.days         = generate_dates(start_date: date, days: 3)
        self.week         = generate_dates(start_date: date, days: 7)
        self.year         = generate_dates(start_date: date, years: 1)
    }
    
    func drag_update(on direction: MoveCommandDirection, with cal_type: CalType) {
        
        switch cal_type {
        case .day:
            if (direction == .right) {
                self.update_date(date: calendar.date(byAdding: .day, value:  1, to: day.date)!)
            } else {
                self.update_date(date: calendar.date(byAdding: .day, value: -1, to: day.date)!)
            }
        case .days:
            if (direction == .right) {
                self.update_date(date: calendar.date(byAdding: .day, value:  3, to: day.date)!)
            } else {
                self.update_date(date: calendar.date(byAdding: .day, value: -3, to: day.date)!)
            }
        case .week:
            if (direction == .left) {
                self.update_date(date: calendar.date(byAdding: .day, value:  7, to: day.date)!)
            } else {
                self.update_date(date: calendar.date(byAdding: .day, value: -7, to: day.date)!)
            }
        case .year:
            if (direction == .left) {
                self.update_date(date: calendar.date(byAdding: .year, value:  1, to: day.date)!)
            } else {
                self.update_date(date: calendar.date(byAdding: .year, value: -1, to: day.date)!)
            }
        }
    }
}

func generate_dates(start_date: Date, days: Int = 0, months: Int = 0, years: Int = 0) -> [CalDate] {
    var end_date    = calendar.date(byAdding: .day, value: days, to: start_date)
    end_date        = calendar.date(byAdding: .month, value: months, to: end_date!)
    end_date        = calendar.date(byAdding: .year, value: years, to: end_date!)
    
    var dates: [CalDate] = []
    
    var curr_date = start_date
    while(!calendar.isDate(curr_date, equalTo: end_date!, toGranularity: .day)) {
        let date = curr_date
        let date_info = DateInfo(date: curr_date)
        dates.append(CalDate(date: date, date_info: date_info))
        
        curr_date = calendar.date(byAdding: .day, value: 1, to: curr_date)!
    }
    return dates
}
