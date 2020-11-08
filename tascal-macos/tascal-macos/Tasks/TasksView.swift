//
//  TasksView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct TasksView: View {
    
    var bins = 3
    @EnvironmentObject var tasks: TasksEnvironment
    
    var body: some View {

        ScrollView(.vertical, showsIndicators: true){
            Spacer().frame(height: 2)
            HStack{
                ForEach(0..<tasks.bins) {i in
                    VStack{
                        ForEach(0..<(tasks.distributed_sizes.max() ?? 0)) {j in
                            ZStack {
                                if (i == 0 && j == 0) {
                                    AddTaskFieldView()
                                } else if (j < tasks.distributed_tasks[i].count) {
                                    TaskView(txt: tasks.distributed_tasks[i][j])
                                } else {
                                    TaskPlaceholderView() // hacky shit, might delete later
                                }
                            }
                        }
                        //TODO:: why doesnt this spacer do anything?
                        Spacer()
                    }
                }
            }
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
