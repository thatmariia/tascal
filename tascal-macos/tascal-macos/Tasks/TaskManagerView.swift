//
//  TaskManagerView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct TaskManagerView: View {
    
    @EnvironmentObject var envi: AppEnvironment
    var bins = 3
    
    var body: some View {
        
        VStack {
            TasksTitleView(txt: "Pool")
            
            TasksView()
            Spacer()
        }
        
    }
}

