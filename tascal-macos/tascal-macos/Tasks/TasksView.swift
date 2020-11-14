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
                
                if tasks.all_tasks.count > 0 {
                    LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3)
                              , content: {
                                AddTaskFieldView()
                                ForEach(tasks.all_tasks) { task in
                                    TaskView(task: task,
                                             txt: task.txt,
                                             time: String(task.time))
                                }
                              })
                } else {
                    AddTaskFieldView()
                }
            }
            
        }
        .onAppear(perform: {
            CloudKitHelper.fetch { (result) in
                switch result {
                case .success(let task):
                    self.tasks.all_tasks.append(task)
                    print("Successfully fetched item")
                // TODO:: sort tasks.all_tasks desc by creation date
                case .failure(let err):
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
