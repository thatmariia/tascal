//
//  DateButtonBoxView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct DateButtonBoxView: View {
    
    @EnvironmentObject var dates: DatesSettings
    var date: CalDate
    
    var body: some View {
        VStack {
            VStack{
                Text("\(date.date_info.weekday)")
                Text("\(date.date_info.day)")
                Text("\(date.date_info.month)")
            }
        }
        .onTapGesture {
            dates.update_date(date: date.date)
            dates.cal_type = .day
        }
    }
}

