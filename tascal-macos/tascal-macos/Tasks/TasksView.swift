//
//  TasksView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct TasksView: View {
    
    //TODO:: why when I add a new one it doesnt appear immediately?
    
    var bins = 3

    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.date_created, ascending: false)]) var all_tasks: FetchedResults<Task>
    
    var tasks: [Task] {
        all_tasks.filter{ $0.level == -1 }
    }
    
    var body: some View {

        ScrollView(.vertical, showsIndicators: true){
            Spacer().frame(height: 2)

            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3)
                      , content: {
                        ForEach(0..<tasks.count+1) { i in
                            if (i == 0) {
                                AddTaskFieldView()
                            } else {
                                TaskView(txt: tasks[i-1].txt ?? "error")
                            }
                        }
            })
    
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
