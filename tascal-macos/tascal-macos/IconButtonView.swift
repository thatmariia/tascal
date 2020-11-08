//
//  IconButtonView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 09/11/2020.
//

import SwiftUI

struct IconButtonView: View {
    
    var icon_system_name: String
    
    var body: some View {
        Image(systemName: icon_system_name)
            .imageScale(.large)
            .foregroundColor(Color.accentColor)
    }
}
