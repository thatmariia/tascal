//
//  TypeSettingsView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 19/03/2021.
//

import SwiftUI

struct TypeSettingsView: View {
    
    @EnvironmentObject var task_types: TaskTypesSettings
    
    
    var body: some View {
        VStack {
            
            TaskTypesTitleView()
            
            ForEach(task_types.types) { tt in
                TypeSettingsRowView(tt: tt)
            }

            AddTaskTypeView()
            
        }
    }
}


