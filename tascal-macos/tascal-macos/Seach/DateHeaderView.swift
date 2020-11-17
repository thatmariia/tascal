//
//  DateHeaderView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 16/11/2020.
//

import SwiftUI

struct DateHeaderView: View {
    
    var date: CalDate
    
    
    var body: some View {
        let d : String = date.date_info.weekday + ", " + date.date_info.month + " " + String(date.date_info.day) + ", " + String(date.date_info.year)
        return Text(d)
            .foregroundColor(calendar.isDate(date.date, equalTo: Date(), toGranularity: .day) ? Color.accentColor : Color.secondary)
    }
}
