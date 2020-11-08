//
//  CalManagerButtonView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import SwiftUI

struct CalManagerButtonView: View {
    
    @EnvironmentObject var dates: DatesSettings
    var type: CalType
    
    var body: some View {
        Button(action: {
            dates.cal_type = type
        }) {
            Text("\(type.rawValue)")
        }
    }
}
