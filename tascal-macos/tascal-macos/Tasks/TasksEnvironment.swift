//
//  TasksEnvironment.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 08/11/2020.
//

import Foundation

class TasksEnvironment : ObservableObject {
    @Published var tasks: [String] = ["Ryan Scott Bradley (born November 17, 1983) is an American former competitive figure skater. He is the 2008 Skate Canada International silver medalist, the 2009 Skate America bronze medalist, the 2011 U.S. national champion, and a three-time U.S. Collegiate champion.", "new task1","new task2","new task3","new task4","new task5"]
    
    @Published var bins                             = 3
    @Published var distributed_tasks: [[String]]    = []
    @Published var distributed_sizes: [Int]         = []
    
    @Published var task_height: CGFloat = 28
    
    func distribute_tasks() {
        var dt: [[String]]  = []
        var ds: [Int]       = []
        
        for _ in 0..<self.bins {
            dt.append([])
            ds.append(0)
        }
        dt[0].append("")
        ds[0] += 1
        for i in 0..<tasks.count {
            dt[(i+1)%self.bins].append(tasks[i])
            ds[(i+1)%self.bins] += 1
        }
        
        self.distributed_tasks = dt
        self.distributed_sizes = ds
    }
    
    func is_valid_task(with txt: String) -> Bool {
        if (txt.isEmpty || txt.count > 140) {
            return false
        }
        return true
    }
    
    func is_valid_time(with time: String) -> Bool {
        if (Double(time) == nil) {
            return false
        }
        if (Double(time)! <= 0.0) {
            return false
        }
        return true
    }
}
