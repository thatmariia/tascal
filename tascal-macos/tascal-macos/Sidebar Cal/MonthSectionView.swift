//
//  MonthSectionView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 17/11/2020.
//

import SwiftUI

struct MonthSectionView: View {
    
    var month: Date

    var body: some View {
        
        HStack {
            
            Text(month_map[calendar.component(.month, from: month)]! + " '" + String(calendar.component(.year, from: month)%100))
                .font(.headline)
            Spacer()
        }
    }
}
