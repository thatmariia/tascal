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
        
        let task_type = TaskType(id: UUID(),
                                 level: task_types.types.count+1,
                                 txt: new_type)
        
        CloudKitHelper.save_tasktypes(task_type: task_type) { (result) in
            switch result {
            case .success(let task_type):
                self.task_types.types.append(task_type)
                _reorder_task_types()
                print("Successfully added item")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        
    }
    
    fileprivate func _reorder_task_types() {
        for tt in task_types.types {
            if (tt.txt == "Others") && (tt.level != task_types.types.count) {
                
                let switch_lvl = tt.level
                let last_lvl = task_types.types.count
                    
                modify_type(tt: task_types.types[task_types.types.count-1], to: tt.level)
                modify_type(tt: tt, to: last_lvl)
                
                task_types.types.swapAt(switch_lvl-1, last_lvl-1)
                
                break
            }
        }
    }
    
    fileprivate func modify_type(tt: TaskType, to lvl: Int) {
        var updated_tt = tt
        updated_tt.level = lvl
        
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
    }
}

struct AddTaskTypeView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskTypeView()
    }
}
