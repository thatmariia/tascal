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
        .onDrop(of: [String(kUTTypeURL)], delegate: delegate)
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
