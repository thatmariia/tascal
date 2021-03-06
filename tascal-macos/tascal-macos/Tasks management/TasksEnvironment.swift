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
    
    func refresh_tasks() {
        self.all_tasks = []
        CloudKitHelper.fetch_tasks { (result) in
            switch result {
            case .success(let task):
                self.self.all_tasks.append(task)
                print("Successfully fetched item")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func add_task(added_task: Task) {
        
        CloudKitHelper.save_tasks(task: added_task) { (result) in
            switch result {
            case .success(let task):
                self.self.all_tasks.insert(task, at: 0)
                print("Successfully added item")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
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
    
    func delete_task(deleted_task: Task) {
        guard let recordID = deleted_task.record_id else { return }
        
        CloudKitHelper.delete(recordID: recordID) { (result) in
            switch result {
            case .success(let recordID):
                self.self.all_tasks.removeAll { (t) -> Bool in
                    return t.record_id == recordID
                }
                print("Successfully deleted item")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func swap_tasks_levels(between lvl1: Int, and lvl2: Int) {
        print("******* SWAPPING start - \(lvl1) and \(lvl2)")
        for task in self.all_tasks {
            
            if task.level == lvl1 {
                
                var updated_task = task
                updated_task.level = lvl2
                self.update_task(updated_task: updated_task)
                
                print("******* SWAPPING from \(lvl1) to \(lvl2)")
                
            } else if task.level == lvl2 {
                
                var updated_task = task
                updated_task.level = lvl1
                self.update_task(updated_task: updated_task)
                
                print("******* SWAPPING from \(lvl2) to \(lvl1)")
                
            }
        }
        

        
    }
}
