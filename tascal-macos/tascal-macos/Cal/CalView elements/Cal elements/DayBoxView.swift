//
//  DayBoxView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct DayBoxView: View {
    
    @EnvironmentObject var tasks: TasksEnvironment
    @EnvironmentObject var task_types: TaskTypesSettings
    
    var date: CalDate
    
    
    var body: some View {
        
        VStack {
            DateButtonBoxView(date: date)
            
            List{
                ForEach(0..<task_types.types.count) { i in
                    Section(header: TaskLevelTxtView(i: i)) {
                        TaskList(tasks: tasks.all_tasks
                                    .filter {
                                        calendar.isDate($0.date_distributed, inSameDayAs: date.date) && ($0.level == i)
                                    }
                                    .sorted(by: {
                                        $0.is_completed < $1.is_completed
                                    }))
                    }
                }
            }
            .listRowBackground(Color.clear)
            .onNSView(added: { nsview in
                let root = nsview.subviews[0] as! NSScrollView
                root.hasVerticalScroller = false
                root.hasHorizontalScroller = false
            })
            
            Spacer()
        }
        .modifier(DayBoxViewModifier())
        
        
    }
    
    fileprivate func TaskList(tasks: [Task]) -> some View {
        return VStack{
            ForEach(tasks) { task in
                CalTaskView(task: task,
                            txt:  task.txt,
                            time: String(task.time))
                
            }
        }
    }
}
