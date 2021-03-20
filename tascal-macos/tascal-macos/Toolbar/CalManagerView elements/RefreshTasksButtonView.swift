//
//  RefreshTasksButtonView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 19/11/2020.
//

import SwiftUI

struct RefreshTasksButtonView: View {
    
    @EnvironmentObject var task_types: TaskTypesSettings
    @EnvironmentObject var tasks: TasksEnvironment
    
    @State var hovering = false
    
    var body: some View {
        Button(action: {
            task_types.refresh_types()
            tasks.refresh_tasks()
        }, label: {
            Image(systemName: "arrow.clockwise")
        })
        .frame(minWidth: 20)
        .buttonStyle(PlainButtonStyle())
        .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
        .modifier(ToolbarStyleModifier(hovering: hovering))
        .onHover { (hov) in
            hovering = hov
        }
    }
    
}
