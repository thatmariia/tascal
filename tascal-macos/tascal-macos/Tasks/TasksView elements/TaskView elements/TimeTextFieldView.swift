//
//  TimeTextFieldView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 08/11/2020.
//

import SwiftUI

struct TimeTextFieldView: View {
    
    @Binding var time: String
    
    var body: some View {
        //TODO:: figure out accent color and selection color
        TextField("", text: $time) { (changed) in
            print("woof ", changed)
        } onCommit: {
            //TODO:: send in new txt
        }
        .textFieldStyle(PlainTextFieldStyle())
        .frame(maxWidth: 32)
    }
}
