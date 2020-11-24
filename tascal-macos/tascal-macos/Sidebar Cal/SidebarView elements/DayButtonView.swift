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
    var month: Date
    var width : CGFloat
    
    var body: some View {
        
        
        Button(action: {
            dates.update_date(date: date)
        }, label: {
            HStack{
                Text("\(DateInfo(date: date).day)")
                    .font(.footnote)
                    //.font(.system(size: width/20)) //.fontWeight(.bold)
                    .foregroundColor(fg_color())
            }
        })
        .buttonStyle(PlainButtonStyle())
    }
    
    fileprivate func fg_color() -> Color {
        if calendar.isDate(date, equalTo: Date(), toGranularity: .day) && calendar.isDate(date, equalTo: month, toGranularity: .month) {
            return Color.accentColor
        }
        if !calendar.isDate(date, equalTo: month, toGranularity: .month) {
            return Color.secondary
        }
        return Color.primary
    }
}
