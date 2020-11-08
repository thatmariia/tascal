//
//  TaskManagerView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct TaskManagerView: View {
    
    var bins = 3
    
    var body: some View {
        HStack{
            VStack {
                TasksTitleView(txt: "Tasks")
                TasksView()
                Spacer()
            }
        }
    }
}

struct TaskManagerView_Previews: PreviewProvider {
    static var previews: some View {
        TaskManagerView()
    }
}
