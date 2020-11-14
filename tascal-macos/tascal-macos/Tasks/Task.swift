//
//  Task.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 13/11/2020.
//

import Foundation
import CloudKit

// TODO:: incorporate creation date too
struct Task : Identifiable {
    var id = UUID()
    
    var task_id             : String
    var record_id           : CKRecord.ID?
    var date_distributed    : Date
    var is_completed        : Int
    var is_repeating        : Int
    var level               : Int
    var time                : Double
    var txt                 : String
    
    func get_NSType(from task: Task) -> NSTask {
        return NSTask(task_id:          task.task_id,
                      record_id:        task.record_id,
                      date_distributed: task.date_distributed,
                      is_completed:     task.is_completed,
                      is_repeating:     task.is_repeating,
                      level:            task.level,
                      time:             task.time,
                      txt:              task.txt)
    }
}
