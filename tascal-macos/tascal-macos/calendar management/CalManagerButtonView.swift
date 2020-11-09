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
        .buttonStyle(PlainButtonStyle())
        .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
        .background(Color(.separatorColor).opacity((type == dates.cal_type) ? 1.0 : 0.0))
        .cornerRadius(5)
    }
}
