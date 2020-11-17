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
    
    let interval = DateInterval(start:  Calendar.current.date(from: DateComponents(year: 2020, month: 1, day: 1))!,
                                end:    Calendar.current.date(from: DateComponents(year: 2021, month: 1, day: 1))!)
    let showHeaders: Bool = true
    //let content: (Date) -> DateView
    
    
    
    var body: some View {
        
        List {
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                
                ForEach(months, id: \.self) { month in
                        
                    Section(header: MonthSectionView(month: month)) {
                        
                        Text("M")
                        Text("T")
                        Text("W")
                        Text("T")
                        Text("F")
                        Text("S")
                        Text("S")
                        
                        ForEach(days(for: month), id: \.self) { date in
                            

                            if calendar.isDate(date, equalTo: month, toGranularity: .month) {
                                //Text("\(DateInfo(date: date).day)")
                                DayButtonView(date: date)
                            } else {
                                //Text("\(DateInfo(date: date).day)")
                                DayButtonView(date: date)
                                    .foregroundColor(Color.secondary)//.hidden()
                            }
                        }
                        
                    }
                    
                }
                
            }
        }
    }
    
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
}



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
