//
//  TasksEnvironment.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 08/11/2020.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers



class TasksEnvironment : ObservableObject {
    
    @Published var task_height: CGFloat = 28
    
    @Published var all_tasks: [Task] = []

    
    // MARK: - supplementary funcs
    
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
    
    func update_task(updated_task: Task) {
        
        CloudKitHelper.modify_tasks(task: updated_task) { (result) in
            switch result {
            case .success(let item):
                for i in 0..<self.all_tasks.count {
                    let currentItem = self.all_tasks[i]
                    if currentItem.record_id == item.record_id {
                        self.all_tasks[i] = item
                    }
                }
                print("Successfully modified item")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
