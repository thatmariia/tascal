//
//  DoneEditingButtonView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 08/11/2020.
//

import SwiftUI

struct DoneEditingButtonView: View {
    
    @EnvironmentObject var tasks: TasksEnvironment
    @Binding var editing: Bool
    
    var task: Task
    var txt: String
    var time: String
    
    var body: some View {
        
        Button {
            modify_task()
        } label: {
            IconButtonView(icon_system_name: "pin.circle.fill")
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(!tasks.is_valid_task(with: txt) || !tasks.is_valid_time(with: time))
    }
    
    fileprivate func modify_task() {
        var updated_task = task
        updated_task.txt = txt
        updated_task.time = Double(time)!
        
        tasks.update_task(updated_task: updated_task)
        
        editing = false
    }
}
