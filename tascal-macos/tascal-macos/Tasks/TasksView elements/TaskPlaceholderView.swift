//
//  TaskPlaceholderView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 08/11/2020.
//

import SwiftUI

struct TaskPlaceholderView: View {
    
    @EnvironmentObject var tasks: TasksEnvironment
    
    var body: some View {
        HStack {
            Text("Placeholder")
                .foregroundColor(Color.white.opacity(0.0))
                .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
            Spacer()
        }.frame(minHeight: tasks.task_height)
    }
}

struct TaskPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        TaskPlaceholderView()
    }
}
