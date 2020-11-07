//
//  AppEnvironment.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import Foundation

let calendar = Calendar.current

class AppEnvironment: ObservableObject {
    @Published var cal_type = CalType.day
    
    @Published var today = Date()
    @Published var today_info = DateInfo(date: Date())
    
    @Published var date_pick = Date()
    @Published var date_pick_info = DateInfo(date: Date())
    
    @Published var dates : [Date] = generate_dates(date: Date()).0
    @Published var dates_info : [DateInfo] = generate_dates(date: Date()).1
    
    
    func update_date(date: Date) {
        self.date_pick = date
        self.date_pick_info = DateInfo(date: date)
        
        self.dates = generate_dates(date: date).0
        self.dates_info = generate_dates(date: date).1
    }
}

func generate_dates(date: Date) -> ([Date], [DateInfo]) {
    var start_date = calendar.date(byAdding: .day, value: -7, to: date)
    let end_date = calendar.date(byAdding: .day, value: 7, to:date)
    
    var dates       : [Date]        = []
    var dates_info  : [DateInfo]    = []
    
    while(!calendar.isDate(start_date!, equalTo: end_date!, toGranularity: .day)) {
        dates.append(start_date!)
        dates_info.append(DateInfo(date: start_date!))
        
        start_date = calendar.date(byAdding: .day, value: 1, to: start_date!)
    }
    
    return (dates, dates_info)
}

func generate_dates_all() -> ([Date], [DateInfo]) {
    let start_date_components = DateComponents(year:    2020,
                                               month:   1,
                                               day:     1)
    var start_date = calendar.date(from: start_date_components)
    let end_date = calendar.date(byAdding: .year, value: 5, to: Date())
    
    var dates       : [Date]        = []
    var dates_info  : [DateInfo]    = []
    
    while(!calendar.isDate(start_date!, equalTo: end_date!, toGranularity: .day)) {
        dates.append(start_date!)
        dates_info.append(DateInfo(date: start_date!))
        
        start_date = calendar.date(byAdding: .day, value: 1, to: start_date!)
    }
    
    return (dates, dates_info)
}
