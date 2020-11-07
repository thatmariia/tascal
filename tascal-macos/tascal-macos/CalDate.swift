//
//  CalDate.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import Foundation

class CalDate : Identifiable {
    let id = UUID()
    
    var date        : Date
    var date_info   : DateInfo
    
    init(date: Date, date_info: DateInfo) {
        self.date       = date
        self.date_info  = date_info
    }
}
