//
//  DateInfo.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import Foundation

class DateInfo {
    
    var day: Int
    var week: Int
    var month: Int
    var year: Int
    var weekday: Int
    
    init(date: Date) {
        let components = calendar.dateComponents([.day, .weekOfYear, .month, .year, .weekday],
                                                 from: date)
        self.day        = components.day!
        self.week       = components.weekOfYear!
        self.month      = components.month!
        self.year       = components.year!
        
        let wd = components.weekday!
        self.weekday    = (wd==1) ? wd : (wd-1)
    }
}
