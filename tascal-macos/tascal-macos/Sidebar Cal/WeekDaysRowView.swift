//
//  WeekDaysRowView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 19/11/2020.
//

import SwiftUI

struct WeekDaysRowView: View {
    
    var wd: String
    
    var body: some View {
        VStack {
            Spacer().frame(height: 8)
            Text(wd)
                .font(.footnote)
            Spacer().frame(height: 8)
        }
    }
}
