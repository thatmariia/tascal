//
//  CalTaskView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct CalTaskView: View {
    
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
                StaticView()
            }
        }
    }
    
    
    // MARK: - STATIC view
    fileprivate func StaticView() -> some View {
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
                
                if show_actions{
                    TaskActionsMenuView(editing: $editing, task: task)
                    Spacer().frame(width: 2)
                }
            }
            Divider()
        }
        .gesture(edit_gesture)
        .onHover { hovering in
            show_actions = hovering
        }
    }
    
    // MARK: - EDIT view
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

