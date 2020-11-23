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
        var mod_task = task
        mod_task.txt = txt
        mod_task.time = Double(time)!
        
        CloudKitHelper.modify_tasks(task: mod_task) { (result) in
            switch result {
            case .success(let item):
                for i in 0..<self.tasks.all_tasks.count {
                    let currentItem = self.tasks.all_tasks[i]
                    if currentItem.record_id == item.record_id {
                        self.tasks.all_tasks[i] = item
                    }
                }
                print("Successfully modified item")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        
        editing = false
    }
}
