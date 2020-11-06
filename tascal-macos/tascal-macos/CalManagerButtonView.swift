//
//  CalManagerButtonView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import SwiftUI

struct CalManagerButtonView: View {
    
    @EnvironmentObject var envi: AppEnvironment
    var type: CalType
    
    var body: some View {
        ZStack {
            Button(action: {
                envi.cal_type = type
            }) {
                Text("\(type.rawValue)")
            }
        }
    }
}
