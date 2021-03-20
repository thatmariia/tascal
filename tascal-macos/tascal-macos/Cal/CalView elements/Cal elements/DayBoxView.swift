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
                ForEach(task_types.types) { type in
                    Section(header: TaskLevelTxtView(type: type)) {
                        TaskList(tasks: tasks.all_tasks
                                    .filter {
                                        calendar.isDate($0.date_distributed, inSameDayAs: date.date) && ($0.level == type.level)
                                    }
                                    .sorted(by: {
                                        if $0.is_completed == $1.is_completed {
                                            if $0.is_completed == 0 {
                                                return $0.date_distributed > $1.date_distributed
                                            }
                                            return $0.date_completed > $0.date_completed
                                        }
                                        return $0.is_completed < $1.is_completed
                                    }))
                        
                            
                    }
                    .animation(.easeInOut)
                    // MARK: - on drop
                    .onDrop(of: NSString.readableTypeIdentifiersForItemProvider, isTargeted: nil, perform: { (ips) -> Bool in
                        
                        // TODO:: what if multiple?
                        guard let ip = ips.first else { return false }
                        
                        ip.loadObject(ofClass: NSString.self) { reading, _ in
                            
                            guard let s = reading as? NSString else { return }
                            
                            DispatchQueue.main.async {
                                
                                var task: Task?
                                
                                for t in tasks.all_tasks {
                                    if (t.record_id?.recordName == s as String) {
                                        task = t
                                        break
                                    }
                                }
                                if (task == nil) { return }
                                task!.level = type.level
                                task?.date_distributed = Date()
                                
                                tasks.update_task(updated_task: task!)
                            }
                        }
                        
                        return true
                    })
                }
            }
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
