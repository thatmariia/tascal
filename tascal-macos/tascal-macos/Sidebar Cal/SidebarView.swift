//
//  SidebarView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 16/11/2020.
//

import Foundation
import SwiftUI


/*struct SidebarView: View {
 var body: some View {
 NavigationView {
 List {
 //Caption
 Text("Services")
 //Navigation links
 //Replace "ContentView" with your destination
 Text("More")
 Divider()
 }
 .listStyle(SidebarListStyle())
 
 .navigationTitle("Explore")
 //Set Sidebar Width (and height)
 .frame(minWidth: 150, idealWidth: 250, maxWidth: 300)
 .toolbar{
 //Toggle Sidebar Button
 ToolbarItem(placement: .navigation){
 Button(action: toggleSidebar, label: {
 Image(systemName: "sidebar.left")
 })
 }
 }
 //Default View on Mac
 ContentView()
 }
 }
 }*/

// Toggle Sidebar Function
func toggleSidebar() {
    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}


struct SidebarView: View {
    
    @EnvironmentObject var dates: DatesSettings
    
    @Environment(\.calendar) var calendar
    
    @EnvironmentObject var cal: CalendarEnvironment
    
    /*var interval = DateInterval(start: Calendar.current.date(from:
                                                                DateComponents(year: 2020,
                                                                               month: 1,
                                                                               day: 1))!,
                                end: Calendar.current.date(from:
                                                            DateComponents(year: DateInfo(date: Date()).year+2,
                                                                           month: DateInfo(date: Date()).month_int,
                                                                           day: 1))!)*/

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
        //.frame(width: 175)
        }
    }
    
    /*
    private var months: [Date] {
        calendar.generateDates(
            inside: interval,
            matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
        )
    }
    
    
    private func days(for month: Date) -> [Date] {
        guard
            let monthInterval = calendar.dateInterval(of: .month, for: month),
            let monthFirstWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.start),
            let monthLastWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.end)
        else { return [] }
        return calendar.generateDates(
            inside: DateInterval(start: monthFirstWeek.start, end: monthLastWeek.end),
            matching: DateComponents(hour: 0, minute: 0, second: 0)
        )
    }
 */
}


/*
extension Calendar {
    func generateDates(
        inside interval: DateInterval,
        matching components: DateComponents
    ) -> [Date] {
        var dates: [Date] = []
        dates.append(interval.start)
        
        enumerateDates(
            startingAfter: interval.start,
            matching: components,
            matchingPolicy: .nextTime
        ) { date, _, stop in
            if let date = date {
                if date < interval.end {
                    dates.append(date)
                } else {
                    stop = true
                }
            }
        }
        
        return dates
    }
}
 */
