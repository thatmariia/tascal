//
//  MonthSectionView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 17/11/2020.
//

import SwiftUI

struct MonthSectionView: View {
    
    @EnvironmentObject var cal: CalendarEnvironment
    
    var month: Date
    
    var s: CGFloat = 7

    var body: some View {
        
        HStack {
            
            Text(month_map[calendar.component(.month, from: month)]! + " '" + String(calendar.component(.year, from: month)%100))
                .font(.headline)
                .foregroundColor(fg_color())
            Spacer()
            
            Button(action: {
                cal.update(right: false)
            }, label: {
                Image(systemName: "arrowtriangle.left.fill")
                    .resizable()
                    .frame(width: s, height: s)
            })
            
            Button(action: {
                cal.update_to_today()
            }, label: {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: s, height: s)
            })
            
            Button(action: {
                cal.update(right: true)
            }, label: {
                Image(systemName: "arrowtriangle.right.fill")
                    .resizable()
                    .frame(width: s, height: s)
            })
            
        }.buttonStyle(PlainButtonStyle())
    }
    
    fileprivate func fg_color() -> Color {
        if calendar.isDate(month, equalTo: Date(), toGranularity: .month) {
            return Color.accentColor
        }
        return Color.primary
    }
}
