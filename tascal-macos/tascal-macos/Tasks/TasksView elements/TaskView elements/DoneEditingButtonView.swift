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
    
    var task: CloudKitTask
    var txt: String
    var time: String
    
    var body: some View {
        
        Button {
            //TODO:: commit changes to the task
            editing = false
        } label: {
            IconButtonView(icon_system_name: "pin.circle.fill")
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(!tasks.is_valid_task(with: txt) || !tasks.is_valid_time(with: time))
    }
}
