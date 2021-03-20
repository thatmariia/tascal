//
//  TaskTypeTextFieldView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 24/11/2020.
//

import SwiftUI

struct TaskTypeTextFieldView: View {
    
    @EnvironmentObject var task_types: TaskTypesSettings
    
    var tt: TaskType
    @State var edit_type: String
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Button(action: {
                    modify_type()
                }, label: {
                    Image(systemName: "pin.circle.fill")
                        .foregroundColor(Color.accentColor)
                })
                .disabled(edit_type.count == 0)
                
                TextField("", text: $edit_type)
                    .textFieldStyle(PlainTextFieldStyle())
            }
            Spacer()
        }
    }
    
    fileprivate func modify_type() {
        var updated_tt = tt
        updated_tt.txt = edit_type
        
        task_types.update_type(updated_tt: updated_tt)
    }
}
