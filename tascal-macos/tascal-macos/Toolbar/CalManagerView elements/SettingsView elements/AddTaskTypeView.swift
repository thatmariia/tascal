//
//  AddTaskTypeView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 24/11/2020.
//

import SwiftUI

struct AddTaskTypeView: View {
    
    @EnvironmentObject var task_types: TaskTypesSettings
    @EnvironmentObject var tasks: TasksEnvironment
    
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
        let nrtts = task_types.types.count
        
        let last_lvl = (nrtts == 0) ? 1 : nrtts
        let new_last_lvl = nrtts + 1
        
        if nrtts != 0 {
            var updated_tt = task_types.types[task_types.types.count-1]
            updated_tt.level = new_last_lvl
            task_types.modify_type(updated_tt: updated_tt)
        }
        
        let added_tt = TaskType(id: UUID(),
                                level: last_lvl,
                                txt: new_type)
        task_types.add_reorder_task_type(added_tt: added_tt, new_last_lvl: new_last_lvl)
        
        tasks.swap_tasks_levels(between: last_lvl, and: new_last_lvl)

    }
}

struct AddTaskTypeView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskTypeView()
    }
}
