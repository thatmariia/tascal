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
        HStack {
            Button(action: {
                add_task_type()
                new_type = ""
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(Color.accentColor)
            })
            .disabled(new_type.count == 0)
            
            TextField("Add type", text: $new_type)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(width: 200)
        }
        .frame(height: 24)
    }
    
    fileprivate func add_task_type() {
        
        let task_type = TaskType(id: UUID(),
                                 level: task_types.types.count+1,
                                 txt: new_type)
        
        CloudKitHelper.save_tasktypes(task_type: task_type) { (result) in
            switch result {
            case .success(let task_type):
                self.task_types.types.append(task_type)
                print("Successfully added item")
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
