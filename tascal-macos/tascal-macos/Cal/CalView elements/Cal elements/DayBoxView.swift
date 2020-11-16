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
                                task!.level = i
                                task?.date_distributed = date.date
                                
                                CloudKitHelper.modify(task: task!) { (result) in
                                    switch result {
                                    case .success(let item):
                                        for i in 0..<tasks.all_tasks.count {
                                            let currentItem = tasks.all_tasks[i]
                                            if currentItem.record_id == item.record_id {
                                                tasks.all_tasks[i] = item
                                            }
                                        }
                                        print("Successfully modified item")
                                    case .failure(let err):
                                        print(err.localizedDescription)
                                    }
                                }
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
