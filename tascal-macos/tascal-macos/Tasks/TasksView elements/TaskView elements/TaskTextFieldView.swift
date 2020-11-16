//
//  TaskTextFieldView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 08/11/2020.
//

import SwiftUI

struct TaskTextFieldView: View {
    
    @Binding var txt: String
    var placeholder: String = "Your task"
    
    var body: some View {
        //TODO:: figure out accent color and selection color
        //TODO:: look into having multiline when text editor is fixed
        
        ZStack {
            if txt.isEmpty {
                HStack{
                    Text(placeholder).foregroundColor(Color.accentColor)
                    Spacer()
                }
            }
            TextField("", text: $txt) { (changed) in

            } onCommit: {
            }
            .textFieldStyle(PlainTextFieldStyle())
            .accentColor(Color.accentColor)
        }
    }
}
