//
//  AppEnvironment.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import Foundation

let calendar = Calendar.current

class AppEnvironment: ObservableObject {
    
    @Published var search: String = ""
    @Published var is_searching = false
    @Published var search_width: CGFloat = 0
    
}
