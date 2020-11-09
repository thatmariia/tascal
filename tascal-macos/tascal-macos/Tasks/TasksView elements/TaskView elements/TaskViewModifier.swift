//
//  TaskViewModifier.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import Foundation
import SwiftUI

struct TaskViewModifier: ViewModifier {
    
    @EnvironmentObject var tasks: TasksEnvironment
    var editing = false
    
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
            .frame(height: tasks.task_height)
            
            .background(Color(.separatorColor).opacity(editing ? 1.0 : 0.0))
            .cornerRadius(editing ? 5 : 0)
            
            //.foregroundColor(editing ? ColorSecondary : ColorPrimary)
            .accentColor(Color.accentColor)
            
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color(.separatorColor).opacity(editing ? 0.0 : 1.0),
                        //ColorSecondary.opacity(editing ? 1.0 : 0.5),
                            lineWidth: 1)
            )
    }
}


