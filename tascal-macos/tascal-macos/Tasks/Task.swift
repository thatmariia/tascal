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
    
    /*init(task_id            : String,
         record_id          : CKRecord.ID?,
         date_distributed   : Date,
         is_completed       : Int,
         is_repeating       : Int,
         level              : Int,
         time               : Double,
         txt                : String) {
        
        self.task_id            = task_id
        self.record_id          = record_id
        self.date_distributed   = date_distributed
        self.is_completed       = is_completed
        self.is_repeating       = is_repeating
        self.level              = level
        self.time               = time
        self.txt                = txt
    }*/
}

