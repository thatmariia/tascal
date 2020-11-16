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
    
    @ObservedObject var delegate = TasksEnvironment()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: true){
            Spacer().frame(height: 2)
            
            VStack{
                
                //TODO:: adjust nr of bins according to the width of the window
                LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3)
                          , content: {
                            AddTaskFieldView()
                            ForEach(tasks.all_tasks.filter { $0.level == -1 }) { task in
                                TaskView(task: task,
                                         txt: task.txt,
                                         time: String(task.time))
                            }
                          })
            }
            
        }
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

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
