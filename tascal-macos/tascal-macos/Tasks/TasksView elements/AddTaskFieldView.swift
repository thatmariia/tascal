//
//  AddTaskFieldView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct AddTaskFieldView: View {
    
    @State var new_task: String = ""
    @State var new_time = "1.0"
    
    var body: some View {
        HStack {
            
            Button(action: {
                //TODO:: upload the new task
                new_task  = ""
            }, label: {
                IconButtonView(icon_system_name: "plus.circle.fill")
            })
            .buttonStyle(PlainButtonStyle())
            
            TaskTextFieldView(txt: $new_task, placeholder: "Add new task")
            DividerView(editing: true)
            TimeTextFieldView(time: $new_time)
            TimeStepperView(time: $new_time, time_step: 0.25)
        }
        .modifier(TaskViewModifier(editing: true))
    }
}
