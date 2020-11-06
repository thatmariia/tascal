//
//  AppEnvironment.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import Foundation

let calendar = Calendar.current

class AppEnvironment: ObservableObject {
    @Published var cal_type = CalType.day
    
    @Published var date_pick = Date()
    @Published var today = Date()
}
