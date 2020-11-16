//
//  Task.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 13/11/2020.
//

import Foundation
import CloudKit

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
    
}

