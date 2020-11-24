//
//  TaskType.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 23/11/2020.
//

import Foundation
import CloudKit

struct TaskType : Identifiable {
    var id = UUID()
    
    var record_id           : CKRecord.ID?
    var level               : Int
    var txt                 : String
    
}
