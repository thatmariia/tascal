//
//  TaskView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct TaskView: View {
    
    @State var txt: String
    @State var time = "12.25 h"
    @State var expanded = false
    @State var editing = false
    
    var expand_gesture: some Gesture {
        TapGesture(count: 1)
            .onEnded({ (_) in
                expanded.toggle()
                print("tap")
            })
    }
    
    var edit_gesture: some Gesture {
        TapGesture(count: 2)
            .onEnded({ (_) in
                expanded = true
                editing = true
                print("double tap")
            })
    }
    
    var body: some View {
        ZStack {
            
            if editing {
                EditView()
            } else {
                StaticView()
            }
        }
        .modifier(NewTaskViewModifier())
    }
    
    fileprivate func StaticView() -> some View {
        return HStack{
            Text(txt)
                .lineLimit(expanded ? nil : 1)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
            Divider()
            Text("1.5h")
        }
        .gesture(edit_gesture)
        .gesture(expand_gesture)
    }
    
    fileprivate func EditView() -> some View {
        return VStack {
            HStack {
                
                TextEditor(text: $txt)
                //TODO:: editing=false on return (issue with onPasteCommand)
                
                Spacer()
                Divider()
                
                TextField("", text: $time) { (changed) in
                    print("woof ", changed)
                } onCommit: {
                    editing = false
                    // todo:: send in new txt
                }
                .frame(maxWidth: 50)
            }
            
            Button(action: {
                editing = false
            }, label: {
                Text("done")
            })
        }
    }
}
