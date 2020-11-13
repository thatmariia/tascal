//
//  TaskView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import Foundation
import SwiftUI

struct TaskView: View {
    
    var task: CloudKitTask
    
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
                    .onAppear(perform: {
                        txt = task.txt ?? "error"
                        time = String(task.time)
                    })
            }
        }
    }
    
    fileprivate func StaticView() -> some View {
        return HStack{
            //TODO:: look into having multiline when text editor is fixed
            Text(txt)
                .lineLimit(1)
            
            Spacer()
            DividerView(editing: editing)
            
            Text(time + " h")
                .multilineTextAlignment(.trailing)
                //TODO:: either get a bottleneck or come up with a better divider
                .frame(width: 50)
            
            if show_actions{
                TaskActionsMenuView(editing: $editing)
            }
            
            //TODO:: implement menu to: edit, delete, duplicate etc
        }
        .gesture(edit_gesture)
        .onHover { hovering in
            show_actions = hovering
        }
    }
    
    
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
