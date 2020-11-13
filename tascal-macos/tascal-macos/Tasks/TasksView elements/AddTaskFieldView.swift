//
//  AddTaskFieldView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct AddTaskFieldView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var tasks: TasksEnvironment
    
    @State var new_task: String = ""
    @State var new_time = "1.0"
    
    var body: some View {
        HStack {
            
            Button(action: {
                
                let task = Task(context: self.managedObjectContext)
                task.id                 = UUID()
                task.txt                = new_task
                task.time               = Double(new_time)!
                task.date_created       = Date()
                task.date_distributed   = Date()
                task.level              = -1
                task.is_completed       = false
                task.is_repeatig        = false
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
                
                
                //TODO:: upload the new task
                new_task  = ""
            }, label: {
                IconButtonView(icon_system_name: "plus.circle.fill")
            })
            .buttonStyle(PlainButtonStyle())
            .disabled(!tasks.is_valid_task(with: new_task) || !tasks.is_valid_time(with: new_time))
            
            TaskTextFieldView(txt: $new_task, placeholder: "Add new task")
            DividerView(editing: true)
            TimeTextFieldView(time: $new_time)
        }
        .modifier(TaskViewModifier(editing: true))
    }
}
