//
//  TasksView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct TasksView: View {
    
    //TODO:: why when I add a new one it doesnt appear immediately?
    
    @EnvironmentObject var tasks: TasksEnvironment
    
    var bins = 3
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: true){
            Spacer().frame(height: 2)
            
            VStack{
                
                Text("\(tasks.all_tasks.count)")
                if tasks.all_tasks.count > 2 {
                    Text("\(tasks.all_tasks[0].txt)")
                    Text("\(tasks.all_tasks[1].txt)")
                    Text("\(tasks.all_tasks[2].txt)")
                    
                }
                
                LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3)
                          , content: {
                            ForEach(0..<tasks.all_tasks.count+1) { i in
                                if (i == 0) {
                                    AddTaskFieldView()
                                } else if (tasks.all_tasks[i-1].level == -1) {
                                    TaskView(task:  tasks.all_tasks[i-1],
                                             txt:   tasks.all_tasks[i-1].txt,
                                             time:  String(tasks.all_tasks[i-1].time))
                                } else {
                                    Text("\(tasks.all_tasks.count)")
                                }
                            }
                          })
            }
            
        }
        .onAppear(perform: {
            CloudKitHelper.fetch { (result) in
                switch result {
                case .success(let task):
                    self.tasks.all_tasks.append(task)
                    print("Successfully fetched item")
                    print("***")
                    print(self.tasks.all_tasks)
                // TODO:: sort tasks.all_tasks desc by creation date
                case .failure(let err):
                    print("Trying to fetch tasks - fail")
                    print(err.localizedDescription)
                }
            }
        })
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
