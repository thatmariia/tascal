//
//  TextEditStyle.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 08/11/2020.
//

import Foundation
import SwiftUI


// not using anywhere now
struct TextEditStyle : TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .foregroundColor(ColorPrimary)
    }
    
    
}
