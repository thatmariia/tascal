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
                    ForEach(
                        Array(Dictionary(grouping:
                                            tasks.all_tasks.filter {
                                                ($0.level != -1) && ($0.txt.contains(search.search))
                                            },
                                         by: { $0.date_created })
                                .keys)
                            .sorted(by: { $0 > $1 }),
                        id: \.self
                        
                    ) { date in
                        
                        Section(header: DateHeaderView(date: CalDate(date: date, date_info: DateInfo(date: date)))) {
                            ForEach(
                                tasks.all_tasks.filter {
                                    ($0.level != -1) && ($0.txt.contains(search.search)) && ($0.date_created == date)
                                }
                            ) { task in
                                
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
}

struct SearchSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchSidebarView()
    }
}
