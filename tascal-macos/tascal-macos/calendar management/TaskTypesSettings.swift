//
//  TaskTypesSettings.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 10/11/2020.
//

import Foundation

class TaskTypesSettings: ObservableObject {
    
    //TODO:: upload saved
    @Published var types : [String] = ["Must", "Should", "Want"]
    
    
}
