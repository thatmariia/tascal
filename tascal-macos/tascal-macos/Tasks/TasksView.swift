//
//  TasksView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI
import UniformTypeIdentifiers

struct TasksView: View {
    
    @EnvironmentObject var tasks: TasksEnvironment
    @EnvironmentObject var search: AppEnvironment
    
    @ObservedObject var delegate = TasksEnvironment()
    
    var body: some View {
        
        GeometryReader { geom in
            ScrollView(.vertical, showsIndicators: false){
                Spacer().frame(height: 2)
                
                VStack{
                    
                    LazyVGrid(columns: Array(repeating: .init(.flexible()), count: bins(width: geom.size.width))
                              , content: {
                                AddTaskFieldView()
                                ForEach(get_tasks()) { task in
                                    TaskView(task: task,
                                             txt: task.txt,
                                             time: String(task.time))
                                }
                              })
                }
                
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
                        task!.level = -1
                        task!.is_completed = 0
                        
                        tasks.update_task(updated_task: task!)
                    }
                }
                
                return true
            })
        }
    }
    
    fileprivate func get_tasks() -> [Task]{
        if search.search.isEmpty {
            return tasks.all_tasks
                .filter {
                    $0.level == -1
                }
                .sorted(by: {
                    $0.date_created > $1.date_created
                })
        } else {
            return tasks.all_tasks
                        .filter {
                            $0.level == -1
                        }
                        .filter {
                            $0.txt.contains(search.search)
                        }
                        .sorted(by: {
                            $0.date_created > $1.date_created
                        })
        }
    }
    
    fileprivate func bins(width: CGFloat) -> Int {
        if width < 450 { return 1 }
        if width < 800 { return 2 }
        return 3
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
