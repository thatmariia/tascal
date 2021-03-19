//
//  AddTaskTypeView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 24/11/2020.
//

import SwiftUI

struct AddTaskTypeView: View {
    
    @EnvironmentObject var task_types: TaskTypesSettings
    
    @State var new_type = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    add_task_type()
                    new_type = ""
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(Color.accentColor)
                })
                .disabled(new_type.count == 0 || is_existing_type(type_name: new_type))
                
                TextField("Add type", text: $new_type)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 20)
            Divider()
        }
    }
    
    fileprivate func is_existing_type(type_name: String) -> Bool {
        for tt in task_types.types {
            if tt.txt == type_name {
                return true
            }
        }
        return false

    }
    
    fileprivate func add_task_type() {
        
        let added_tt = TaskType(id: UUID(),
                                level: task_types.types.count+1,
                                txt: new_type)
        
        task_types.add_reorder_task_type(added_tt: added_tt)
    }
}

struct AddTaskTypeView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskTypeView()
    }
}
