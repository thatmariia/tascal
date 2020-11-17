//
//  SearchSidebarView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 16/11/2020.
//

import SwiftUI

struct SearchSidebarView: View {
    
    @EnvironmentObject var tasks: TasksEnvironment
    @EnvironmentObject var search: AppEnvironment
    
    var body: some View {
        
        VStack {
            
            List {
                ForEach(grouped_dates(), id: \.self) { date in
                    
                    Section(header: DateHeaderView(date: CalDate(date: date, date_info: DateInfo(date: date)))) {
                        
                        ForEach(tasks_on_date(date: date)) { task in
                            
                            FoundTaskView(task: task)
                        }
                    }
                }
            }
            Spacer()
        }
    }
    
    fileprivate func tasks_on_date(date: Date) -> [Task] {
        let t = tasks.all_tasks.filter {
            ($0.level != -1) && ($0.txt.contains(search.search)) && calendar.isDate($0.date_distributed, equalTo: date, toGranularity: .day)
        }
        return t
        
    }
    
    
    fileprivate func grouped_dates() -> [Date] {
        
        let grouped_dict = Dictionary(grouping:
                                    tasks.all_tasks.filter {
                                        ($0.level != -1) && ($0.txt.contains(search.search))
                                    }) { (dc) -> DateComponents in
            let date = Calendar.current.dateComponents([.day, .year, .month], from: (dc.date_distributed))
            return date
        }
        
        let grouped_components = Array(grouped_dict.keys)
            
        let sorted_components = grouped_components.sorted(by: {
            calendar.date(from: DateComponents(year: $0.year, month: $0.month, day: $0.day))! > calendar.date(from: DateComponents(year: $1.year, month: $1.month, day: $1.day))!
        })
        
        let dates = sorted_components.map {
            calendar.date(from: DateComponents(year: $0.year, month: $0.month, day: $0.day))!
            
        }

        return dates
    }
}
