//
//  TaskTypesSettings.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 10/11/2020.
//

import Foundation

class TaskTypesSettings: ObservableObject {
    
    @Published var types : [TaskType] = []
    
    func add_reorder_task_type(added_tt: TaskType){
        let nrtts = self.types.count
        
        let last_lvl = (nrtts == 0) ? 1 : nrtts
        let new_last_lvl = nrtts + 1
        
        CloudKitHelper.save_tasktypes(task_type: added_tt) { (result) in
            switch result {
            case .success(let task_type):
                self.self.types.append(task_type)
                self.types.swapAt(last_lvl-1, new_last_lvl-1)
                print("Successfully added item")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }

    
    /*func _reorder_task_types() -> (Int, Int) {
        var swap_lvls = (0, 0)
        
        for tt in self.types {
            if (tt.txt == "Others") && (tt.level != self.types.count) {
                
                let switch_lvl = tt.level
                let last_lvl = self.types.count
                
                var updated_tt1 = self.types[self.types.count-1]
                updated_tt1.level = tt.level
                self.modify_type(updated_tt: updated_tt1)
                
                var updated_tt2 = tt
                updated_tt2.level = last_lvl
                self.modify_type(updated_tt: updated_tt2)
                
                self.types.swapAt(switch_lvl-1, last_lvl-1)
                
                swap_lvls = (switch_lvl-1, last_lvl-1)
                print("****** NOW the SWAPPING assigned =\(swap_lvls)")
                
                return swap_lvls
            }
        }
        
        return swap_lvls
    }*/
    
    func modify_type(updated_tt: TaskType) {
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
