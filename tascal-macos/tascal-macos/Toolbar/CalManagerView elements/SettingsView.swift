//
//  SettingsView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 23/11/2020.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var task_types: TaskTypesSettings
    @EnvironmentObject var tasks: TasksEnvironment
    
    @State var showing = false
    @State var hovering = false
    
    var body: some View {
        
        Button(action: {
            let settingView = TypeSettingsView()
            .environmentObject(task_types)
            .environmentObject(tasks)
            .padding()
            .buttonStyle(PlainButtonStyle())
            
            let controller = DetailWindowController(rootView: settingView)
            controller.window?.title = "Settings"
            controller.showWindow(nil)
            
        }, label: {
            Image(systemName: "gear")
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

