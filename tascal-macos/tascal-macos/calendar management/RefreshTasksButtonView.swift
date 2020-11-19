//
//  RefreshTasksButtonView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 19/11/2020.
//

import SwiftUI

struct RefreshTasksButtonView: View {
    
    @EnvironmentObject var tasks: TasksEnvironment
    
    @State var hovering = false
    
    var body: some View {
        Button(action: {
            refresh_tasks()
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
    
    fileprivate func refresh_tasks() {
        tasks.all_tasks = []
        CloudKitHelper.fetch { (result) in
            switch result {
            case .success(let task):
                self.tasks.all_tasks.append(task)
                print("Successfully fetched item")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

struct RefreshTasksButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RefreshTasksButtonView()
    }
}
