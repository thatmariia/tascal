//
//  TaskView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import Foundation
import SwiftUI

struct TaskView: View {
    
    var task: Task
    
    @State var txt: String
    @State var time: String

    @State var editing = false
    @State var show_actions = false
    
    //TODO:: add a gesture to view/modify description and stuff
    
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
        return HStack{
            
            Text(txt)
                .lineLimit(1)
            
            Spacer()
            DividerView(editing: editing)
            
            Text(time + " h")
                .multilineTextAlignment(.trailing)
                //TODO:: either get a bottleneck or come up with a better divider
                .frame(width: 50)
            
            if show_actions{
                TaskActionsMenuView(editing: $editing, task: task)
            }
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
