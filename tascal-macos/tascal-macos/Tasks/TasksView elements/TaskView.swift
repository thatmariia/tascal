//
//  TaskView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import Foundation
import SwiftUI

struct TaskView: View {
    
    @State var txt: String
    @State var time = "12.25"
    var time_step = 0.25

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
                DoneEditingButtonView(editing: $editing, txt: txt, time: time)
                
                TaskTextFieldView(txt: $txt)
                
                Spacer()
                DividerView(editing: editing)
                
                TimeTextFieldView(time: $time)
                TimeStepperView(time: $time, time_step: time_step)
                
            }
        }
    }
}
