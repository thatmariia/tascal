//
//  TaskAction.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 09/11/2020.
//

import Foundation

enum TaskAction: String, CaseIterable {
    case none       = ""
    case duplicate  = "duplicate"
    case edit       = "edit"
    case delete     = "delete"
}
