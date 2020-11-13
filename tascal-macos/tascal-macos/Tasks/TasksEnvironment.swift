//
//  TasksEnvironment.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 08/11/2020.
//

import Foundation

class TasksEnvironment : ObservableObject {
    @Published var task_height: CGFloat = 28
    
    @Published var tasks: [CloudKitTask] = []
    
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
