//
//  TaskTypesSettings.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 10/11/2020.
//

import Foundation

class TaskTypesSettings: ObservableObject {
    
    @Published var types : [TaskType] = []
    
    func refresh_types() {
        self.types = []
        CloudKitHelper.fetch_tasktypes { (result) in
            switch result {
            case .success(let task_type):
                self.self.types.append(task_type)
                print("Successfully fetched item")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func add_reorder_task_type(added_tt: TaskType, new_last_lvl: Int) {
        
        CloudKitHelper.save_tasktypes(task_type: added_tt) { (result) in
            switch result {
            case .success(let task_type):
                self.self.types.append(task_type)
                self.types.swapAt(added_tt.level-1, new_last_lvl-1)
                print("Successfully added item")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func update_type(updated_tt: TaskType) {
        CloudKitHelper.modify_tasktypes(task_type: updated_tt) { (result) in
            switch result {
            case .success(let item):
                for i in 0..<self.types.count {
                    let currentItem = self.types[i]
                    if currentItem.record_id == item.record_id {
                        self.types[i] = item
                    }
                }
                print("Successfully modified item")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func delete_type(deleted_tt: TaskType) {
        guard let recordID = deleted_tt.record_id else { return }
        
        CloudKitHelper.delete(recordID: recordID) { (result) in
            switch result {
            case .success(let recordID):
                self.self.types.removeAll { (t) -> Bool in
                    return t.record_id == recordID
                }
                print("Successfully deleted item")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
}
