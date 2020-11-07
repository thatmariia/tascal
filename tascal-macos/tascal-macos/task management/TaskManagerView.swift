//
//  TaskManagerView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct TaskManagerView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true){
            HStack{
                VStack {
                    Text("TASKS").font(.subheadline)
                    
                    ForEach(newtasks, id: \.self) {task in
                        NewTaskView(txt: task)
                    }
                    
                    Spacer()
                }
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
