//
//  AddTaskFieldView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct AddTaskFieldView: View {
    
    @EnvironmentObject var tasks: TasksEnvironment
    
    @State var new_task: String = ""
    @State var new_time = "1.0"
    
    var body: some View {
        HStack {
            AddTaskButton()
            TaskTextFieldView(txt: $new_task, placeholder: "Add new task")
            DividerView(editing: true)
            TimeTextFieldView(time: $new_time)
        }
        .modifier(TaskViewModifier(editing: true))
    }
    
    fileprivate func AddTaskButton() -> some View {
        Button(action: {
            
            let task = Task(id: UUID(),
                            task_id: UUID().uuidString,
                            date_created: Date(),
                            date_distributed: Date(),
                            date_completed: Date(),
                            is_completed: 0,
                            is_repeating: 0,
                            level: -1,
                            time: Double(new_time)!,
                            txt: new_task)
            
            tasks.add_task(added_task: task)
            
            new_task  = ""
        }, label: {
            IconButtonView(icon_system_name: "plus.circle.fill")
        })
        .buttonStyle(PlainButtonStyle())
        .disabled(!tasks.is_valid_task(with: new_task) || !tasks.is_valid_time(with: new_time))
        
    }
}
