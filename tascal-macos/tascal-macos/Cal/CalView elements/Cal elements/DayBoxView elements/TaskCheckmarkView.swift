//
//  TaskCheckmarkView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 09/11/2020.
//

import SwiftUI

struct TaskCheckmarkView: View {
    
    @Binding var completed: Bool
    
    var body: some View {
        Button(action: {
            completed.toggle()
        }, label: {
            IconButtonView(icon_system_name: completed ? "checkmark.circle.fill" : "checkmark.circle")
        })
        .buttonStyle(PlainButtonStyle())
    }
}
