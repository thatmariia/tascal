//
//  TypeActionsMenu.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 23/11/2020.
//

import SwiftUI

struct TypeActionsMenu: View {
    
    @EnvironmentObject var task_types: TaskTypesSettings
    @EnvironmentObject var tasks: TasksEnvironment
    
    @State var showing = false
    @State var hovering = false
    @Binding var editing: Bool
    
    var tt: TaskType
    
    var body: some View {
        
        
        Button(action: {
            showing = true
        }, label: {
            Image(systemName: "ellipsis.circle.fill")
                .foregroundColor(Color.accentColor)
        })
        .popover(isPresented: $showing, content: {
            
            HStack {
                
                
                // MARK: - edit task type
                Button(action: {
                    editing = true
                    showing = false
                }, label: {
                    Image(systemName: "square.and.pencil")
                })
                
                Divider()
                
                
                // MARK: - delete task type
                Button(action: {
                    let lvl = tt.level
                    
                    handle_type_deletion(at: lvl)
                    task_types.delete_type(deleted_tt: tt)
                    //delete_type(tt: tt)
                    
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
    
    
    fileprivate func handle_type_deletion(at lvl: Int) {
        let last_type_lvl = task_types.types.count
        
        for tt in task_types.types {
            if tt.level > lvl {
                modify_type(tt: tt, to: tt.level-1)
            }
        }

        for task in tasks.all_tasks {
            if task.level == lvl {
                _update_task(task: task, to: last_type_lvl-1)
            } else if task.level > lvl {
                _update_task(task: task, to: task.level-1)
            }
        }
        
    }
    
    fileprivate func modify_type(tt: TaskType, to lvl: Int) {
        var updated_tt = tt
        updated_tt.level = lvl
        
        task_types.modify_type(updated_tt: updated_tt)
    }
    
    fileprivate func _update_task(task: Task, to lvl: Int) {
        var updated_task = task
        updated_task.level = lvl
        
        tasks.update_task(updated_task: updated_task)
        
        /*CloudKitHelper.modify_tasks(task: updated_task) { (result) in
            switch result {
            case .success(let item):
                for i in 0..<tasks.all_tasks.count {
                    let currentItem = tasks.all_tasks[i]
                    if currentItem.record_id == item.record_id {
                        tasks.all_tasks[i] = item
                    }
                }
                print("Successfully modified item")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }*/
    }

}


