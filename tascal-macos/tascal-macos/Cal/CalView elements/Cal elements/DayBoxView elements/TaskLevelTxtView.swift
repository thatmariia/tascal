//
//  TaskLevelTxtView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct TaskLevelTxtView: View {
    
    @EnvironmentObject var task_types: TaskTypesSettings

    var txt: String
    
    @State var hov = false
    
    var body: some View {
        HStack {
            
            Text(txt)
                .font(.system(size: 15)).fontWeight(.semibold)
                .foregroundColor(Color.accentColor)
            
            if hov {
                Button(action: {
                    //TODO:: add a line to add new task AddTaskFieldView?
                }, label: {
                    IconButtonView(icon_system_name: "plus.circle.fill")
                })
                .buttonStyle(PlainButtonStyle())
            }
            
            Spacer()
        }
        .onHover(perform: { hovering in
            hov = hovering
        })
    }
}
