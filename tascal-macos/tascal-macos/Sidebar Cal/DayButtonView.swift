//
//  DayButtonView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 17/11/2020.
//

import SwiftUI

struct DayButtonView: View {
    
    @EnvironmentObject var dates: DatesSettings
    
    //var in_month : Bool
    var date: Date
    
    var body: some View {
        
        Button(action: {
            dates.update_date(date: date)
        }, label: {
            ZStack{
            Text("\(DateInfo(date: date).day)")
            }
                //.foregroundColor(in_month ? Color.primary : Color.secondary)
                .cornerRadius(10)
            .foregroundColor(calendar.isDate(date, equalTo: Date(), toGranularity: .day) ? Color.accentColor : Color.clear)
        })
        .buttonStyle(PlainButtonStyle())
        
    }
}
