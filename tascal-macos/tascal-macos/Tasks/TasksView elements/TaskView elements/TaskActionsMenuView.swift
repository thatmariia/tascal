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
                    
                    CloudKitHelper.save(task: dupl_task) { (result) in
                        switch result {
                        case .success(let dupl_task):
                            self.tasks.all_tasks.insert(dupl_task, at: 0)
                            print("Successfully duplicated item")
                        case .failure(let err):
                            print(err.localizedDescription)
                        }
                    }
                    
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
                    guard let recordID = task.record_id else { return }
                    
                    CloudKitHelper.delete(recordID: recordID) { (result) in
                        switch result {
                        case .success(let recordID):
                            self.tasks.all_tasks.removeAll { (t) -> Bool in
                                return t.record_id == recordID
                            }
                            print("Successfully deleted item")
                        case .failure(let err):
                            print(err.localizedDescription)
                        }
                    }
                    
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
