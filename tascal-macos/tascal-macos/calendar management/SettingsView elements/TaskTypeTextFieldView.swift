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
        
        HStack {
            Button(action: {
                var updated_tt = tt
                updated_tt.txt = edit_type
                
                CloudKitHelper.modify_tasktypes(task_type: updated_tt) { (result) in
                    switch result {
                    case .success(let item):
                        for i in 0..<task_types.types.count {
                            let currentItem = task_types.types[i]
                            if currentItem.record_id == item.record_id {
                                task_types.types[i] = item
                            }
                        }
                        print("Successfully modified item")
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                }

            }, label: {
                Image(systemName: "pin.circle.fill")
                    .foregroundColor(Color.accentColor)
            })
            .disabled(edit_type.count == 0)
            
            TextField("", text: $edit_type)
                .textFieldStyle(PlainTextFieldStyle())
        }
    }
}
