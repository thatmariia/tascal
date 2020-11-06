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
    var month_int: Int
    var month: String
    var year: Int
    var weekday_int: Int
    var weekday: String
    
    init(date: Date) {
        let components = calendar.dateComponents([.day, .weekOfYear, .month, .year, .weekday],
                                                 from: date)
        self.day            = components.day!
        self.week           = components.weekOfYear!
        self.month_int      = components.month!
        self.month          = month_map[self.month_int]!
        self.year           = components.year!
        
        let wd              = components.weekday!
        self.weekday_int    = (wd==1) ? wd : (wd-1)
        self.weekday        = weekday_map[self.weekday_int]!
    }
}

let month_map = [
    1  : "January",
    2  : "February",
    3  : "March",
    4  : "April",
    5  : "May",
    6  : "June",
    7  : "July",
    8  : "August",
    9  : "September",
    10 : "October",
    11 : "November",
    12 : "December"
]

let weekday_map = [
    1 : "Monday",
    2 : "Tuesday",
    3 : "Wednesday",
    4 : "Thursday",
    5 : "Friday",
    6 : "Saturday",
    7 : "Sunday"
]
