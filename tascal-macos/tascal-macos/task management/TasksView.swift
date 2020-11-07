//
//  TasksView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct TasksView: View {
    
    var bins = 3
    
    var body: some View {
        HStack{
            ForEach(0..<bins) {i in
                VStack{
                    ForEach(0..<distribute_tasks(tasks: newtasks, bins: bins)[i].count) {j in
                        ZStack {
                        if (i == 0 && j == 0) {
                            AddNewTaskFieldView()
                        } else {
                            TaskView(txt: distribute_tasks(tasks: newtasks, bins: bins)[i][j] as! String)
                        }
                        }
                    }
                    Spacer()
                }
            }
        }
    }
    
    fileprivate func distribute_tasks(tasks: [Any], bins: Int) -> [[Any]] {
        var distributed_tasks: [[Any]] = []
        
        for i in 0..<bins { distributed_tasks.append([]) }
        distributed_tasks[0].append("")
        for i in 0..<tasks.count {
            distributed_tasks[(i+1)%bins].append(tasks[i])
        }
        return distributed_tasks
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
