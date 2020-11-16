//
//  DateButtonBoxView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import Foundation
import SwiftUI

struct DateButtonBoxView: View {
    
    @EnvironmentObject var dates: DatesSettings
    var date: CalDate
    
    var body: some View {
        HStack{
            Spacer()
            Text("\(date.date_info.weekday + " " + String(date.date_info.day))")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .modifier(DateFrameViewModifier(is_today:
                                                calendar.isDate(date.date, inSameDayAs: dates.today.date)))
            Spacer()
        }
    }
}

