//
//  TaskActionsMenuView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 09/11/2020.
//

import SwiftUI

struct TaskActionsMenuView: View {
    
    @EnvironmentObject var tasks: TasksEnvironment
    
    @Binding var editing: Bool
    @State var showing: Bool = false
    
    var task: Task
    
    var body: some View {
        
        Button(action: {
            showing = true
        }, label: {
            Image(systemName: "ellipsis.circle.fill")
                .foregroundColor(Color.accentColor)
                .frame(width: 10)
        })
        .popover(isPresented: $showing, content: {
            HStack {
                
                // MARK: - duplicate task
                Button(action: {
                    
                    var dupl_task = task
                    dupl_task.task_id = UUID().uuidString
                    dupl_task.level = -1
                    dupl_task.date_created = Date()
                    
                    tasks.add_task(added_task: dupl_task)
                    
                    showing = false
                    
                }, label: {
                    Image(systemName: "plus.square.on.square")
                })
                
                Divider()
                
                // MARK: - edit task
                Button(action: {
                    showing = false
                    editing = true
                }, label: {
                    Image(systemName: "square.and.pencil")
                })
                
                Divider()
                
                // MARK: - delete task
                Button(action: {
                    tasks.delete_task(deleted_task: task)
                    
                    showing = false
                }, label: {
                    Image(systemName: "trash")
                        .foregroundColor(Color.red)
                })
            }
            .padding()
            .buttonStyle(PlainButtonStyle())
        })
        .buttonStyle(PlainButtonStyle())
        
    }
}
