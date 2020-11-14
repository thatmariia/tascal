//
//  TasksEnvironment.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 08/11/2020.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

class TasksEnvironment : ObservableObject, DropDelegate {
    func performDrop(info: DropInfo) -> Bool {
        // TODO:: carry out dropiing #dragdrop
        
        for provider in info.itemProviders(for: [String(kUTTypeURL)]) {
            
            if provider.canLoadObject(ofClass: URL.self) {
                print("url loaded")
                
                let _ = provider.loadObject(ofClass: URL.self) { (url, err) in
                    print("* * * URL = ", url!)
                }
                
                
            } else {
                print("cannot be loaded")
            }
        }
        
        /*
        var task: Task?
        for t in self.all_tasks {
            if (t.record_id?.recordName == "info") {
                task = t
                break
            }
        }
        if (task == nil) { return false }
        task?.level = -1
        
        // TODO:: reduce to just 1 loop calc
        CloudKitHelper.modify(task: task!) { (result) in
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
        
        print("*-*-*-* \n", info, "\n*-*-*-*")
        */
        
        return true
    }
    
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
}
