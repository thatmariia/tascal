//
//  Dates.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import Foundation
import SwiftUI

class DatesSettings: ObservableObject {
    @Published var cal_type = CalType.day
    
    @Published var today            = Date()
    @Published var today_info       = DateInfo(date: Date())
    
    // 1 day
    @Published var date_pick        = Date()
    @Published var date_pick_info   = DateInfo(date: Date())
    
    // 3 days
    @Published var days_dates       = generate_dates(start_date: Date(), days: 3).0
    @Published var days_dates_info  = generate_dates(start_date: Date(), days: 3).1
    
    // 1 week
    @Published var week_dates       = generate_dates(start_date: Date(), days: 7).0
    @Published var week_dates_info  = generate_dates(start_date: Date(), days: 7).1
    
    // 1 year
    @Published var year_dates       = generate_dates(start_date: Date(), years: 1).0
    @Published var year_dates_info  = generate_dates(start_date: Date(), years: 1).1
    
    func update_date(date: Date) {
        self.date_pick          = date
        self.date_pick_info     = DateInfo(date: date)
        
        self.days_dates         = generate_dates(start_date: date, days: 3).0
        self.days_dates_info    = generate_dates(start_date: date, days: 3).1
        
        self.week_dates         = generate_dates(start_date: date, days: 7).0
        self.week_dates_info    = generate_dates(start_date: date, days: 7).1
        
        self.year_dates         = generate_dates(start_date: date, years: 1).0
        self.year_dates_info    = generate_dates(start_date: date, years: 1).1
    }
    
    func drag_update(on value: DragGesture.Value, with cal_type: CalType) {
        
        switch cal_type {
        case .day:
            if (value.startLocation.x > value.predictedEndLocation.x) {
                self.update_date(date: calendar.date(byAdding: .day, value:  1, to: date_pick)!)
            } else {
                self.update_date(date: calendar.date(byAdding: .day, value: -1, to: date_pick)!)
            }
        case .days:
            if (value.startLocation.x > value.predictedEndLocation.x) {
                self.update_date(date: calendar.date(byAdding: .day, value:  3, to: date_pick)!)
            } else {
                self.update_date(date: calendar.date(byAdding: .day, value: -3, to: date_pick)!)
            }
        case .week:
            if (value.startLocation.x > value.predictedEndLocation.x) {
                self.update_date(date: calendar.date(byAdding: .day, value:  7, to: date_pick)!)
            } else {
                self.update_date(date: calendar.date(byAdding: .day, value: -7, to: date_pick)!)
            }
        case .year:
            if (value.startLocation.x > value.predictedEndLocation.x) {
                self.update_date(date: calendar.date(byAdding: .year, value:  1, to: date_pick)!)
            } else {
                self.update_date(date: calendar.date(byAdding: .year, value: -1, to: date_pick)!)
            }
        }
    }
}

func generate_dates(start_date: Date, days: Int = 0, months: Int = 0, years: Int = 0) -> ([Date], [DateInfo]) {
    var end_date    = calendar.date(byAdding: .day, value: days, to: start_date)
    end_date        = calendar.date(byAdding: .month, value: months, to: end_date!)
    end_date        = calendar.date(byAdding: .year, value: years, to: end_date!)
    
    var dates       : [Date]        = []
    var dates_info  : [DateInfo]    = []
    
    var curr_date = start_date
    while(!calendar.isDate(curr_date, equalTo: end_date!, toGranularity: .day)) {
        dates.append(curr_date)
        dates_info.append(DateInfo(date: curr_date))
        
        curr_date = calendar.date(byAdding: .day, value: 1, to: curr_date)!
    }
    print(dates)
    return (dates, dates_info)
}
