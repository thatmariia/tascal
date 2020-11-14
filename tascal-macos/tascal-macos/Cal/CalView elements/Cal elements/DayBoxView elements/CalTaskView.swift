//
//  CalTaskView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct CalTaskView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var task: Task
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    //TODO:: toggle the is_completed state in task
                }, label: {
                    IconButtonView(icon_system_name: (task.is_completed != 0) ? "checkmark.circle.fill" : "checkmark.circle")
                })
                .buttonStyle(PlainButtonStyle())
                
                
                Text(task.txt)
                    .lineLimit(nil)
                
               Spacer()
            }
            Divider()
        }
    }
}

