//
//  SettingsView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 23/11/2020.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var task_types: TaskTypesSettings
    @EnvironmentObject var tasks: TasksEnvironment
    
    @State var showing = false
    @State var new_type = ""
    @State var hovering = false
    
    var body: some View {
        
        Button(action: {
            showing = true
        }, label: {
            Image(systemName: "gear")
        })
        .popover(isPresented: $showing, content: {
            VStack {
                
                Text("Task types:").font(.subheadline)
                ForEach(task_types.types) { tt in
                        
                        // TODO:: put this in a different file and make its own hovering case
                    TypeSettingsRowView(tt: tt)
                    
                }
                
                HStack {
                    Button(action: {
                        add_task_type()
                        new_type = ""
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color.accentColor)
                    })
                    
                    TextField("", text: $new_type)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(width: 200)
                }
            }
            .padding()
            .buttonStyle(PlainButtonStyle())
            // TODO:: move hovering
            
            
        })
        .frame(minWidth: 20)
        .buttonStyle(PlainButtonStyle())
        .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
        .modifier(ToolbarStyleModifier(hovering: hovering))
        .onHover { (hov) in
            hovering = hov
        }
        
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
