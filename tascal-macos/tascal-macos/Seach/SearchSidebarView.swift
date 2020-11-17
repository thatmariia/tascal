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
                            
                            VStack {
                                HStack {
                                    Text(task.txt)
                                    Spacer()
                                }
                                Divider()
                            }
                        }
                    }
                }
            }
            Spacer()
        }
    }
    
    fileprivate func tasks_on_date(date: Date) -> [Task] {
        let t = tasks.all_tasks.filter {
            ($0.level != -1) && ($0.txt.contains(search.search)) && ($0.date_created == date)
        }
        return t
        
    }
    
    
    fileprivate func grouped_dates() -> [Date] {
        let d = Array(Dictionary(grouping:
                                    tasks.all_tasks.filter {
                                        ($0.level != -1) && ($0.txt.contains(search.search))
                                    },
                                 by: { $0.date_created })
                        .keys)
            .sorted(by: { $0 > $1 })
        print("* * * d = ", d)
        return d
    }
}

struct SearchSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchSidebarView()
    }
}
