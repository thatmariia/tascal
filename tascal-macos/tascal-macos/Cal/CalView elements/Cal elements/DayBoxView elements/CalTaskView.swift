//
//  CalTaskView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI
import UniformTypeIdentifiers

struct CalTaskView: View {
    
    @EnvironmentObject var tasks: TasksEnvironment
    
    var task: Task
    
    @State var txt: String
    @State var time: String
    
    @State var editing = false
    @State var show_actions = false
    
    var edit_gesture: some Gesture {
        TapGesture(count: 2)
            .onEnded({ (_) in
                editing = true
            })
    }
    
    var body: some View {
        ZStack {
            
            if editing {
                EditView().modifier(TaskViewModifier(editing: editing))
            } else {
                StaticView().modifier(TaskViewModifier(editing: editing))
                    .onDrag {
                        NSItemProvider(object: self.task.record_id!.recordName as NSString)
                    }
            }
        }
    }
    
    
    // MARK: - STATIC view
    fileprivate func StaticView() -> some View {
        VStack {
            HStack {
                // checkmark
                Button(action: {
                    toggle_complete()
                }, label: {
                    IconButtonView(icon_system_name: (task.is_completed != 0) ? "checkmark.circle.fill" : "checkmark.circle")
                })
                .buttonStyle(PlainButtonStyle())
                
                
                Text(task.txt)
                    .lineLimit(nil)
                
                Spacer()
                DividerView(editing: editing)
                
                Text(time + " h")
                    .multilineTextAlignment(.trailing)
                    .frame(width: 50)
                
                if show_actions{
                    TaskActionsMenuView(editing: $editing, task: task)
                    Spacer().frame(width: 2)
                }
            }
            //Divider()
        }
        .gesture(edit_gesture)
        .onHover { hovering in
            show_actions = hovering
        }
    }
    
    fileprivate func toggle_complete() {
        var updated_task = task
        if updated_task.is_completed == 0 {
            updated_task.date_completed = Date()
        }
        updated_task.is_completed = (task.is_completed == 0) ? 1 : 0
        
        tasks.update_task(updated_task: updated_task)
        
    }
    
    // MARK: - EDIT view
    // TODO:: make it appear the same way as in the task pool
    fileprivate func EditView() -> some View {
        return VStack {
            HStack {
                DoneEditingButtonView(editing: $editing,
                                      task: task,
                                      txt: txt,
                                      time: time)
                TaskTextFieldView(txt: $txt)
                
                Spacer()
                DividerView(editing: editing)
                
                TimeTextFieldView(time: $time)
                
            }
        }
    }
}


