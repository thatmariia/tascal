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
                
                // MARK: - duplicate task type
                Button(action: {
                    duplicate_task_type()
                    push_up_tasks()
                    push_up_types()
                    showing = false
                }, label: {
                    Image(systemName: "plus.square.on.square")
                })
                
                Divider()
                
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
                    
                    delete_type(tt: tt)
                    push_down_tasks(lvl: lvl)
                    push_down_types(lvl: lvl)
                    
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
    
    fileprivate func duplicate_task_type() {
        var new_task_type = tt
        new_task_type.level = tt.level + 1
        
        CloudKitHelper.save_tasktypes(task_type: new_task_type) { (result) in
            switch result {
            case .success(let new_task_type):
                self.task_types.types.insert(new_task_type, at: new_task_type.level-1)//append(new_task_type)
                print("Successfully added item")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    fileprivate func push_up_tasks() {
        let lvl = tt.level
        
        for task in tasks.all_tasks {
            if task.level > lvl {
                var updated_task = task
                updated_task.level = task.level + 1
                
                CloudKitHelper.modify_tasks(task: updated_task) { (result) in
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
                }
                
            }
        }
    }
    
    fileprivate func push_up_types() {
        let lvl = tt.level
        
        for task_type in task_types.types {
            if task_type.level > lvl {
                var updated_type = task_type
                updated_type.level = task_type.level + 1
                
                CloudKitHelper.modify_tasktypes(task_type: updated_type) { (result) in
                    switch result {
                    case .success(let item):
                        for i in 0..<task_types.types.count {
                            let currentItem = task_types.types[i]
                            if currentItem.record_id == item.record_id {
                                task_types.types[i] = item
                            }
                        }
                        print("Successfully modified item")
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                }
            }
        }
    }
    
    fileprivate func delete_type(tt: TaskType) {
        guard let recordID = tt.record_id else { return }
        
        CloudKitHelper.delete(recordID: recordID) { (result) in
            switch result {
            case .success(let recordID):
                self.task_types.types.removeAll { (t) -> Bool in
                    return t.record_id == recordID
                }
                print("Successfully deleted item")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    fileprivate func push_down_tasks(lvl: Int) {
        if lvl == 1 { return }
        
        for task in tasks.all_tasks {
            if task.level >= lvl {
                var updated_task = task
                updated_task.level = task.level - 1
                
                CloudKitHelper.modify_tasks(task: updated_task) { (result) in
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
                }
                
            }
        }
    }
    
    fileprivate func push_down_types(lvl: Int) {
        if lvl == task_types.types.count { return }
        
        for task_type in task_types.types {
            if task_type.level > lvl {
                var updated_type = task_type
                updated_type.level = task_type.level - 1
                
                CloudKitHelper.modify_tasktypes(task_type: updated_type) { (result) in
                    switch result {
                    case .success(let item):
                        for i in 0..<task_types.types.count {
                            let currentItem = task_types.types[i]
                            if currentItem.record_id == item.record_id {
                                task_types.types[i] = item
                            }
                        }
                        print("Successfully modified item")
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                }
            }
        }
    }
}


