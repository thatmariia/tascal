//
//  SidebarView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 16/11/2020.
//

import Foundation
import SwiftUI


// Toggle Sidebar Function
func toggleSidebar() {
    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}


struct SidebarView: View {
    
    @EnvironmentObject var dates: DatesSettings
    
    @Environment(\.calendar) var calendar
    
    @EnvironmentObject var cal: CalendarEnvironment
    
    var body: some View {
        
        GeometryReader { geom in
            
            List {
                
                LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                    
                    ForEach(cal.months, id: \.self) { month in
                        
                        Section(header: MonthSectionView(month: month)) {
                            
                            WeekDaysRowView(wd: "M")
                            WeekDaysRowView(wd: "T")
                            WeekDaysRowView(wd: "W")
                            WeekDaysRowView(wd: "T")
                            WeekDaysRowView(wd: "F")
                            WeekDaysRowView(wd: "S")
                            WeekDaysRowView(wd: "S")
                            
                            ForEach(cal.days(for: month), id: \.self) { date in
                                
                                
                                if calendar.isDate(date, equalTo: month, toGranularity: .month) {
                                    DayButtonView(date: date, month: month, width: geom.size.width)
                                } else {
                                    DayButtonView(date: date, month: month, width: geom.size.width)
                                        .foregroundColor(Color.secondary)
                                }
                            }
                            
                        }
                        Spacer().frame(height: 20)
                        
                    }
                    
                }
            }
            .onNSView(added: { nsview in
                let root = nsview.subviews[0] as! NSScrollView
                root.hasVerticalScroller = false
                root.hasHorizontalScroller = false
            })
        }
    }
}
